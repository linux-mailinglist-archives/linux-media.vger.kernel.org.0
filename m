Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C7A3E177A
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 17:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbhHEPE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 11:04:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43277 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230183AbhHEPE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 11:04:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BeuomsELYW9QyBeupmU0U1; Thu, 05 Aug 2021 17:04:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628175852; bh=VTA/i/eksMzqqHowmEltT3ODCRNA2O0GdFWKCvutZJ0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o4shBam4pcnRYXBT9mDZhRp7pxhp4Bwns5U+jC6xs+ba9B4vz1hK7jbFPIModK19t
         X+yAHsI2NNLOfxIZpz/4wpocR45XDl0G2/7vprr3M/V1CFXvxcdKtgd+Hkd9+szpR0
         hHaA7YG1IgY19rOmzQ9LkWZD/+6ybeiwLNl0AE3hh5bEMaF3eOK+ZfhDTf88wbRrLO
         xcNx934zZKbp99skAxVhifM+AwPb6JlLIoKyCU7hEWkRWJ2n2v4tMJVkbf9Af023OI
         hkE7lPeALbY665cLmVO4EAvBT/RXNa+YjhcihxvugJ1gRujwSkQGmv+orqaj5+EoWP
         iXYtfOqktz1lQ==
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
To:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c99fb92a-d504-19a1-eab1-2ffcc9a13af3@xs4all.nl>
Date:   Thu, 5 Aug 2021 17:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722121249.16483-2-david.plowman@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCcq4INjy9cwTuWMyID2bXnQxYQNjVW9WqwZYHIe7jsDCgcj/DyM4AFBYTr12fjhKD6jmpPzmzwWiNcIMD1pWXizvz0O5eiwvJCt5rEt/6fSUABjlhFu
 8RCMehGBKyVMoVVA3JJooWuAhkGTuD089mCi15zi1JQuDnNWMw0pmDrOdIN8/Kd1NXCAkd84GspxlmanSWQS/Ybc/kOWyDtoLXgcP2KGh881NpUWRUqm1NHn
 blEKJILCyLa7oCUGvjbZ3XynTIrm2xIGNtVDFdpCFYnjIwKec65m9t7TM8m1B+4qUCKshK2yqz9h/X9rdY3PFOYZAK9fDoFCMZ9bmg9kuTPg5tBq5dJbFq0I
 fAgCpIzw0ESB7wT1hXdbsN8UXP+Wy9zLHs3wyNn0W6liZbT1cNCBcyC7GiP1Ue/2UPArlXBxdqpuKT42MGk4vrbRwfc+hQJXdFlAT5tCivYWLFQJR1NHcvu+
 8OMfJDn1JF0Ag5IP/j/2ma0qNHoBlrc4tzVumw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/07/2021 14:12, David Plowman wrote:
> We add new controls, one for each of the four usual Bayer channels:
> 
> V4L2_CID_NOTIFY_GAIN_RED
> V4L2_CID_NOTIFY_GAIN_GREENR
> V4L2_CID_NOTIFY_GAIN_BLUE
> V4L2_CID_NOTIFY_GAIN_GREENB
> 
> These are provided for sensors that need to know what colour gains
> will be applied to the Bayer channel by subsequent processing (such as
> by an ISP), even though the sensor will not apply this gain itself.
> 
> The units are linear with the default value indicating a gain of
> exactly 1.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 4 ++++
>  include/uapi/linux/v4l2-controls.h        | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index b6344bbf1e00..12c810cd4ae6 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1106,6 +1106,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> +	case V4L2_CID_NOTIFY_GAIN_RED:		return "Notify Red Gain";
> +	case V4L2_CID_NOTIFY_GAIN_GREENR:	return "Notify Green (Red) Gain";
> +	case V4L2_CID_NOTIFY_GAIN_BLUE:		return "Notify Blue Gain";
> +	case V4L2_CID_NOTIFY_GAIN_GREENB:	return "Notify Green (Blue) Gain";
>  
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index fdf97a6d7d18..711930bb54f0 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1117,6 +1117,10 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> +#define V4L2_CID_NOTIFY_GAIN_RED		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> +#define V4L2_CID_NOTIFY_GAIN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_CID_NOTIFY_GAIN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_CID_NOTIFY_GAIN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
>  
>  
>  /* Image processing controls */
> 

