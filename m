Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3BB1AD74F
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgDQHWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:22:39 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57399 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728419AbgDQHWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:22:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PLKajhfaA7xncPLKdj9dH9; Fri, 17 Apr 2020 09:22:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587108156; bh=gKELcOf/+NSQdPyFKJlRi9tih3uq9sDfR/dXJQq4/Sw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qQTYTJoo+ZvE45hV0SVOlP64r1lWAzgiuUWLOOHbsNUonZ7YhaaqPE0HVxClMGTOk
         cjDsf/NpqifTdiiihWn8vCMX81OcPLfDKFEP6K4muXqvlFCOYCmSIgV6VcN+nYfP3L
         sgC9UNCN4YRTnyMOtHgPo1SGI7N4/a+lXh8xAUv7VVxAjZZ1cDFI6DaQ7S9b+fsepx
         W6PlSuNtJTh35xDVM2Lflms3a8W88VbufAARpuAHocivDZ63ZD4EOaHLPZnH7AArpP
         9AfTB0mlGjk+xQzbM2k/Pd51KijkUI6fR5spxRdD6pch3ews0Vk09zurrGZG43n0/G
         +aot1c6FsCV1A==
Subject: Re: [PATCH v7 2/6] ivtv-ioctl.c: Do not initialize the reserved field
 of struct v4l2_fmtdesc
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
 <20200413202351.1359754-3-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a9fcb4e1-f1b4-a269-9a5a-13fad372be31@xs4all.nl>
Date:   Fri, 17 Apr 2020 09:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200413202351.1359754-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPTHZOsIRal7m5QzjTQGGrNbeMWi5jvMx/lZh895wVNC63t7CAbt0sorl6/C2HELxZnEsPkOznqZpvEa0z6PxlnrxXe4E9O9UVDN4gLff+ivGjP9hr+9
 hN3pcJFSboVsRe/XbBCfLTushCco9nnt70ESd5cis3Pk5SrgZPUieKXqMq5ZOKX7kJpyYNihS8dD5EYLPPVdYKQhJyNariBYJyAgaNi8BC+GyGIJpLuB90ac
 TCdjEZl6TVTmjgWw/L5zQ/4xdyargelVbTGqEr7GZyXmqohuiyUpYWO3j+ja9RLTUOq6jMnaspc6UllOsIChnUm+Fx9DlQ9bE+vwWIW0RZVy3MQDh5O21F8j
 C2tGgTvy/Az7H61NBvcH99ejvq+Rrd/MYRPsqIGDVivI0tv8A/XfIzfJtBZVm44zSaZG7LzQUG7U2eXLZuKqPxH9vWDBWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 13/04/2020 22:23, Niklas Söderlund wrote:
> One of the reserved fields are about to be used. Instead of updating the
> driver to only initialize three instead of four reserved fields remove
> the explicit assignment.  As if one field in a struct is assigned, the
> memory is zeroed and explicit assignment is redundant.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Can you replace this with this patch from Laurent when you post the v8?

https://patchwork.linuxtv.org/patch/62430/

I like that one better, and it fixes cx18 as well.

Regards,

	Hans

> ---
>  drivers/media/pci/ivtv/ivtv-ioctl.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
> index 137853944e4619cb..8a45c50411c74831 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.c
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
> @@ -922,12 +922,10 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
>  	static const struct v4l2_fmtdesc hm12 = {
>  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
>  		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
> -		{ 0, 0, 0, 0 }
>  	};
>  	static const struct v4l2_fmtdesc mpeg = {
>  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
>  		"MPEG", V4L2_PIX_FMT_MPEG,
> -		{ 0, 0, 0, 0 }
>  	};
>  	struct ivtv *itv = fh2id(fh)->itv;
>  	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
> @@ -948,12 +946,10 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
>  	static const struct v4l2_fmtdesc hm12 = {
>  		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, 0,
>  		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
> -		{ 0, 0, 0, 0 }
>  	};
>  	static const struct v4l2_fmtdesc mpeg = {
>  		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, V4L2_FMT_FLAG_COMPRESSED,
>  		"MPEG", V4L2_PIX_FMT_MPEG,
> -		{ 0, 0, 0, 0 }
>  	};
>  	struct ivtv *itv = fh2id(fh)->itv;
>  	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
> 

