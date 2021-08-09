Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA28F3E445C
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhHILF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 07:05:26 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51453 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233598AbhHILFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 07:05:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id D35Ym345HTTg6D35bmrXrj; Mon, 09 Aug 2021 13:05:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628507104; bh=1oaFce84cKN5MJa+01tKp2ooGji8kzrokjd6wyl537M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hnTWWExK4o0JCsHtPCPSA5X2yyPRf7al5Rw80ENEF1Aj3hfTvYgJ/tyfyvQEkngRC
         u4N50n4cTGx62NY3J3Y0nPa3pxURu+08WYTKke8yZ3NJ/qjL8W8Aw+UJe52ucF4JKo
         J3QISMNOSXeX2g2XMs+W3+snlFg1kENaSQjLFmCEyB3NNaKil+OTc0VFSjgz0M5+Rn
         npWKb9dB/1hxPPMG2yAnKqNDcWCM3a1KNf6nR7eyE3vxT9MfxWiXjVkh498zafZpjm
         lQvN3Ak592mD+6U36IFm2nKkUHJiFUYBCsvytuV2mf+lb+r0DomPQ8E18A5Un1tZmd
         MH+VDa0lxvZdQ==
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS
 control
To:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-2-david.plowman@raspberrypi.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
Date:   Mon, 9 Aug 2021 13:05:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809093448.4461-2-david.plowman@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEuPAerapBXRGqx71WTy+LMt8awxJNLyBz51kjBWbncgKfrPAHVEneyYqv0qTCn1WDk3xbMjYB/l15kw9zcj3TPGrd+6eAtasKLQdYedp6kn3q5myTXS
 dqapchXUpXGwlCi6Apteo3I1uJXIHH4C2weVbxjzW6TBgv+hKSrwpXsBy5hv/i5E4KeaBJnOXrCUzr4ux63uHUugHtw8dyscYZBSItegpxzpAaddqKFGmjjC
 5quJkI/yvS/8ee3eXBSSdm1voAqXhORCDdCO7tllLsZ1GPTRCeRxjyAlP6AAc8dpZHas41DPuM2bnk9G/yHLwe4KylQMF34SpoIUkaev9jRT9HDACFEzaDjg
 +wP3B0ida1F5EVX8CPzTJ/pET4l5iVxc1/t0PbJHRKpiu208O9Q=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2021 11:34, David Plowman wrote:
> We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
> be notified what gains will be applied to the different colour
> channels by subsequent processing (such as by an ISP), even though the
> sensor will not apply any of these gains itself.
> 
> For Bayer sensors this will be an array control taking 4 values which
> are the 4 gains arranged in the fixed order B, Gb, Gr and R,
> irrespective of the exact Bayer order of the sensor itself.
> 
> The units are in all cases linear with the default value indicating a
> gain of exactly 1.

So a value of 2 means a gain of 2? Or are these fixed point values? How do
I represent a gain of 1.5?

> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
>  include/uapi/linux/v4l2-controls.h        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 421300e13a41..f87053c83249 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> +	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>  
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */

Since this is a standard control, it should also be configured correctly in
v4l2_ctrl_fill().

Instead of an array, would a compound control (aka a struct) be better? Then you can
explicitly have field names g, gb, gr and r.

Is there a specific reason we want an array instead of that? I'm not opposed, but
I'd like to see a rationale for that.

Regards,

	Hans

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5532b5f68493..133e20444939 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> +#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>  
>  
>  /* Image processing controls */
> 

