Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B82911C8CA
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 10:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfLLJCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 04:02:32 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59207 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728147AbfLLJCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 04:02:32 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fKMciYKi8GyJwfKMdixORP; Thu, 12 Dec 2019 10:02:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576141349; bh=7b3tsLVPBTI7zK26h8mKE4edsabiFYLy5E5JvBfR35k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Op4FJWUWdgAl1XuFrZqg6sAe+pWHYsfIMtv8zoJIOGtJpQ/SGuw/BHWr1HB/WUs/V
         bmuAaFxFqprOXg5SmvbrM09s3/R18qUSPLYH26IE98r8Gwx4yyb2lpVh+rafvWViWd
         hFs8MJ0fxK9FBsGOadVxAKr1s00bbcYveUrTwRWCI10jT5Ygfm97rJXJZZEZ8MuVW8
         PhKYy0YFzAH+Ilmye4Rv2alxTOli32EW+cyyxlwkLyIRBoNECm/4FMeuCa/D8Wm+PU
         99zcmq7WQOUDuYCCPaT8YaU4+qfVGwb+57Y6o72r8LrzOK0hGyAQulB2imAOg1Shi0
         NyGrMJ2EbGHAg==
Subject: Re: [PATCH v3 10/12] media: constify fb ops across all drivers
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org,
        Andy Walls <awalls@md.metrocast.net>,
        linux-media@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <966b9db7-b6c2-d3a2-0842-574186418860@xs4all.nl>
Date:   Thu, 12 Dec 2019 10:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGmvVAjgIbkvr+AzCMHfUWgkjFh11J8PzT1QSu9is0LcSndCt8P+m0RLleeM/UQkAnXub2EBEzxIA14I105csWp88mVPqHBSCQogood/3qmxPmd/sM6C
 9gY1aq1GXvxqqcP6owinvESwbSqrgjAF+M7thGCvBRCQQ5f/DhRqejcqVC6dQK7KgFofWecCOYta26rjt7tLu/nXy4T1T8jpjx4g/KeZO7xiYffhb+EkpdQE
 2YOT34XylyL4MyvZLz3om9cuLLYSMKAlJFBigDYK1XPk29dcUbOk7RPRmTqc2xJoVytJ3u4R1WMtofLkTVjYSpZfcoDciT1R8U0ptf7KcxV4W9IMSPO8kH9F
 jGdlBDZdcqKhYdFRP1+jvPaGRCHuvHP44/JZ5vCVaZFPHiwlvthb5Az8CFGvTUxrjBaAIuVR9bMigWsDEE40oDzhmrlSnxzXyXLKU9ZzkcCBm999LhVGnqiV
 mtqwqElqlCkRiItOisU/8GZYNvBcwoHKM8PccrQZhfG9Y1ATZUwZmo7x0dA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/3/19 5:38 PM, Jani Nikula wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
> 
> Remove the redundant fbops assignments while at it.
> 
> v2:
> - actually add const in vivid
> - fix typo (Christophe de Dinechin)
> 
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: linux-media@vger.kernel.org
> Cc: ivtv-devel@ivtvdriver.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/pci/ivtv/ivtvfb.c          | 3 +--
>  drivers/media/platform/vivid/vivid-osd.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
> index 95a56cce9b65..f2922b554b09 100644
> --- a/drivers/media/pci/ivtv/ivtvfb.c
> +++ b/drivers/media/pci/ivtv/ivtvfb.c
> @@ -925,7 +925,7 @@ static int ivtvfb_blank(int blank_mode, struct fb_info *info)
>  	return 0;
>  }
>  
> -static struct fb_ops ivtvfb_ops = {
> +static const struct fb_ops ivtvfb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_write       = ivtvfb_write,
>  	.fb_check_var   = ivtvfb_check_var,
> @@ -1049,7 +1049,6 @@ static int ivtvfb_init_vidmode(struct ivtv *itv)
>  
>  	oi->ivtvfb_info.node = -1;
>  	oi->ivtvfb_info.flags = FBINFO_FLAG_DEFAULT;
> -	oi->ivtvfb_info.fbops = &ivtvfb_ops;
>  	oi->ivtvfb_info.par = itv;
>  	oi->ivtvfb_info.var = oi->ivtvfb_defined;
>  	oi->ivtvfb_info.fix = oi->ivtvfb_fix;
> diff --git a/drivers/media/platform/vivid/vivid-osd.c b/drivers/media/platform/vivid/vivid-osd.c
> index f2e789bdf4a6..fbaec8acc161 100644
> --- a/drivers/media/platform/vivid/vivid-osd.c
> +++ b/drivers/media/platform/vivid/vivid-osd.c
> @@ -244,7 +244,7 @@ static int vivid_fb_blank(int blank_mode, struct fb_info *info)
>  	return 0;
>  }
>  
> -static struct fb_ops vivid_fb_ops = {
> +static const struct fb_ops vivid_fb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_check_var   = vivid_fb_check_var,
>  	.fb_set_par     = vivid_fb_set_par,
> @@ -311,7 +311,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
>  
>  	dev->fb_info.node = -1;
>  	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
> -	dev->fb_info.fbops = &vivid_fb_ops;
>  	dev->fb_info.par = dev;
>  	dev->fb_info.var = dev->fb_defined;
>  	dev->fb_info.fix = dev->fb_fix;
> 

