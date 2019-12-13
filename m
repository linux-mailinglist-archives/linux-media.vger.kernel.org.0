Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65611E1B0
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 11:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLMKJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 05:09:52 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54313 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfLMKJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 05:09:52 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fhtMiknqAapzpfhtNidg1R; Fri, 13 Dec 2019 11:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576231789; bh=hJ/t9NURuHq3BdeEoIZyQoRCl+yW29RTpxiZQmkLv/A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=U7l68pvO0DPIIaiqz0qm6xPnntPTqIbfBkkfMIyMDzwL0PN+Z6JrXV27TjrIC4DQT
         mFfSgnWZrW5t/EvnNU8xcQpPOMfhHG34TirED+yblFtP0KmAq3I95ItdhtJvujw8Rm
         rajFX+iaRfdfk2sABnkhXVl6ah/BbTHwMUuXMxJ+OzcNrobJ4jvykgfAZydha6MSB8
         S2PAS9/coTeBAmHDOOMVHdHVXTKrXBzyL+FcPdGKwlBblOdgy/YQHe6zxF5iyw5JrD
         msLnzsPprosdR9CGZ32J6cRW6txB0JdMpceWNSzb41u06UXenngbpHkESjVqBsZotV
         7nqYHt68ULF4A==
Subject: Re: [PATCH] media: vimc: get pixformat info from v4l2_format_info to
 avoid code repetition
To:     "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
Cc:     "Carlos E.C. Barbosa" <carlosecb@tutanota.com>
References: <20191015225258.6923-1-carlosecb@tutanota.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1a5b1c17-639e-7c40-e439-35acb3042e9e@xs4all.nl>
Date:   Fri, 13 Dec 2019 11:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015225258.6923-1-carlosecb@tutanota.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ89Hb5T+Fogr8J0Szd8KhhPbGJPS31Agb8VidOX5uPNCsnuwaX4NfMal3klzNhcrK8TIGMhrqgAhwMcLkYbplShqcf2EppAKCRyo8G84/lBrB5EYVGk
 BeTDFg9HK1YkMdR1Ks3wJ3nt7JFWLzZ8x4EgEfyU4KrNz2xQN26nxXFDyaPs/gwNDoiG81u9mvmqc4ywzyac6yLZcedB6ESw8v8gWMPKJ2H5l4MZ0+wIULkb
 +3VKKZYkykjOrR/odOZ20xQsSINzgfYjEOB0RPT5/EPcc+ikeIgJEKb/gf4oIB3JRZ+hxQRPpjbF8TrLMF1qMhR11I5bQYTaqtmJdjqnfJUfuctKgliB9/AF
 4ckkGj7Gg0j2n5f4XgWUTae78Si/2TQtRk/xfeX2BKcgCz4bVbZZ5mXHnXcYoU7jzmHPz3DnNa7Wy1UKdwM0PQi3ZjgSy+uzeX9jDXNpYhLBnDwc3+4IfVPp
 fGfhPfUotM/c55o1/B/IRiW+V3r3J7tboPNANk5EQuG+48/g4PkNhYzo2v8RD+1agLJ5ZEtNOLPetOyi
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 12:52 AM, Carlos E. C. Barbosa wrote:
> From: "Carlos E.C. Barbosa" <carlosecb@tutanota.com>
> 
> There is overlapping code over two distinct lists. This repurposes one
> of vimc_pix_map for strictly mapping formats and remaps other calls to
> the matching v4l2_format_info.
> 
> ---
> 
> Change in v2:
> - Change commit message
> - Remove struct with mbus code and pointer to v4l2_format_info
> - The map and info are directly called when strictly needed
> 
> Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>
> ---
>  drivers/media/platform/vimc/vimc-capture.c | 14 ++--
>  drivers/media/platform/vimc/vimc-common.c  | 78 ++++++----------------
>  drivers/media/platform/vimc/vimc-common.h  |  9 +--
>  drivers/media/platform/vimc/vimc-debayer.c |  9 ++-
>  drivers/media/platform/vimc/vimc-scaler.c  | 39 +++++++++--
>  drivers/media/platform/vimc/vimc-sensor.c  | 26 +++++---
>  6 files changed, 89 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 602f80323031..65282d4d8a1e 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -85,7 +85,8 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  				    struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format *format = &f->fmt.pix;
> -	const struct vimc_pix_map *vpix;
> +	struct vimc_pix_map *vpix;
> +	struct v4l2_format_info *vinfo;

No const here,

>  
>  	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
>  				VIMC_FRAME_MAX_WIDTH) & ~1;
> @@ -99,7 +100,8 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
>  	}
>  	/* TODO: Add support for custom bytesperline values */
> -	format->bytesperline = format->width * vpix->bpp;
> +	vinfo = v4l2_format_info(vpix->pixelformat);

but v4l2_format_info returns a const pointer. Does this patch even
compile without compiler warnings?

> +	format->bytesperline = format->width * vinfo->bpp[0];
>  	format->sizeimage = format->bytesperline * format->height;
>  
>  	if (format->field == V4L2_FIELD_ANY)
> @@ -159,7 +161,7 @@ static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
>  static int vimc_cap_enum_framesizes(struct file *file, void *fh,
>  				    struct v4l2_frmsizeenum *fsize)
>  {
> -	const struct vimc_pix_map *vpix;
> +	struct vimc_pix_map *vpix;
>  
>  	if (fsize->index)
>  		return -EINVAL;
> @@ -387,7 +389,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
>  	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> -	const struct vimc_pix_map *vpix;
> +	struct vimc_pix_map *vpix;
> +	struct v4l2_format_info *vinfo;
>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
> @@ -443,7 +446,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	/* Set default frame format */
>  	vcap->format = fmt_default;
>  	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
> -	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
> +	vinfo = v4l2_format_info(vpix->pixelformat);
> +	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
>  	vcap->format.sizeimage = vcap->format.bytesperline *
>  				 vcap->format.height;
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index a3120f4f7a90..73feea089921 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -14,185 +14,151 @@
>   * NOTE: non-bayer formats need to come first (necessary for enum_mbus_code
>   * in the scaler)
>   */
> -static const struct vimc_pix_map vimc_pix_map_list[] = {
> +static struct vimc_pix_map vimc_pix_map_list[] = {

Why was const removed here?

This patch also needs to be rebased, so I stop reviewing here and
wait for a v2.

Regards,

	Hans
