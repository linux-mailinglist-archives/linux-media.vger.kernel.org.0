Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD3E2B04C3
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 13:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgKLMNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 07:13:18 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41487 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727822AbgKLMNR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 07:13:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dBTRkdRAMu8I7dBTUkLfk1; Thu, 12 Nov 2020 13:13:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605183195; bh=o/AMxI/b/lIrutBz2p97ylrC4jr4VTkZ7/aldxFv7gM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tfyOMGHw2Hgol3DuUV9+3UZDiNZVkD3or5N9iF4W9TCbQd+41IADFWe8OR3ld4Ddk
         MnwVR5jrqHcKxm4Uncg4zfiglinud4QVSvhLYGfmVTRXcevj4jmMJT3LVGc2VxteT2
         D7sM5/uBuKuV7idylzfxXPgaYXmAu/yWoHj2eWefoyoYJaRxcDM/IlhiSlbQQ8/bJg
         NItTTXFMq17XvS7UTok6mCvKE6kLuhtH1BQ2QhCiHFf3epZCtF6ZYP2Tut+XswxbNj
         leWiUONVAEqMMVmk2B0cZDU4TDWPi7Cf6nAoXXC0NVZp5LzFwRwMIvhO4/5jLwtrDv
         uCjRBHN2Z1oBQ==
Subject: Re: [PATCH 3/5] media: Rename stateful codec control macros
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201112115714.48081-1-ezequiel@collabora.com>
 <20201112115714.48081-4-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ff5e677c-5a62-f35e-b6f8-45e7d061ee9b@xs4all.nl>
Date:   Thu, 12 Nov 2020 13:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201112115714.48081-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCNEGSMav+OmlICjsFS2VaOLeM2TlfgNR4L+KhtA5w68jVi/p29dnQEgJ8ef0oLr/ahZN6gWgLciRvi/c/ALLdK9OHQuzaoj6NGCwgiur6AsTOuR5Seq
 qIcaoTw7aU6zI6aT95BrjSJRxvLx2s3Ytc+/oJq2VeSwYapt7nBVJOv7qrST0ZjT5yfTlDbeKbjtFUTlmHUNPcZI7SQnKIfROyXPa4MKDKF/QZsEon1PnAgY
 TvapZqFWK1TzZIFix7Yxt/Wx6QJoOnsTkSfA+jyH2Pp5lE1Uog2xHxOjFZetnxRWQV1nKHm4/16qoPbXr0xNh/QVakkujUOM0+kfdaxFT0WUO+V+EKcvDIJ3
 GKTQmWk0S5v286NIraHY3WuLkllQSAH1vJj0YmBh9UXHxSTt0Di1bDSMWzwSMNtkPL9U7eBCo2aCJiWMtizBLMPFrrMg9B7LF3gSYxr+DR4hKs8lHPupCrYz
 /8bMZsGAuxujNMvvv6BTwZqs9g9uPX8Wemaqhr46F3IUTPE39md9hVAjKWc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2020 12:57, Ezequiel Garcia wrote:
> For historical reasons, stateful codec controls are named
> as {}_MPEG_{}. While we can't at this point sanely
> change all control IDs (such as V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER),
> we can least change the more meaningful macros such as classes
> macros.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec.rst             |   4 +-
>  .../media/v4l/extended-controls.rst           |   8 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    |  16 +-
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 354 +++++++++---------
>  14 files changed, 212 insertions(+), 208 deletions(-)
> 

<snip>

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 7035f4fb182c..53122ee42988 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -54,7 +54,7 @@
>  
>  /* Control classes */
>  #define V4L2_CTRL_CLASS_USER		0x00980000	/* Old-style 'user' controls */
> -#define V4L2_CTRL_CLASS_MPEG		0x00990000	/* MPEG-compression controls */
> +#define V4L2_CTRL_CLASS_CODEC		0x00990000	/* Stateful codec controls */
>  #define V4L2_CTRL_CLASS_CAMERA		0x009a0000	/* Camera class controls */
>  #define V4L2_CTRL_CLASS_FM_TX		0x009b0000	/* FM Modulator controls */
>  #define V4L2_CTRL_CLASS_FLASH		0x009c0000	/* Camera flash controls */
> @@ -66,6 +66,10 @@
>  #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
>  
> +#ifndef __KERNEL__
> +#define V4L2_CTRL_CLASS_MPEG V4L2_CTRL_CLASS_CODEC	/* MPEG-compression controls (Legacy) */
> +#endif
> +
>  /* User-class control IDs */
>  
>  #define V4L2_CID_BASE			(V4L2_CTRL_CLASS_USER | 0x900)
> @@ -208,11 +212,11 @@ enum v4l2_colorfx {
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
>  
> -#define V4L2_CID_MPEG_BASE			(V4L2_CTRL_CLASS_MPEG | 0x900)
> -#define V4L2_CID_MPEG_CLASS			(V4L2_CTRL_CLASS_MPEG | 1)

These two old defines should remain as aliases of the new defines for legacy
purposes under #ifndef __KERNEL__.

> +#define V4L2_CID_CODEC_BASE			(V4L2_CTRL_CLASS_CODEC | 0x900)
> +#define V4L2_CID_CODEC_CLASS			(V4L2_CTRL_CLASS_CODEC | 1)

<snip>

> @@ -775,7 +779,7 @@ enum v4l2_mpeg_video_frame_skip_mode {
>  };
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
> -#define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> +#define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

Rename this as well to V4L2_CID_CODEC_CX2341X_BASE (but still keep the old alias).

>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_MPEG_CX2341X_BASE+0)
>  enum v4l2_mpeg_cx2341x_video_spatial_filter_mode {
>  	V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL = 0,
> @@ -816,7 +820,7 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type {
>  #define V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS		(V4L2_CID_MPEG_CX2341X_BASE+11)
>  
>  /*  MPEG-class control IDs specific to the Samsung MFC 5.1 driver as defined by V4L2 */
> -#define V4L2_CID_MPEG_MFC51_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1100)
> +#define V4L2_CID_MPEG_MFC51_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1100)

Ditto.

>  
>  #define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY		(V4L2_CID_MPEG_MFC51_BASE+0)
>  #define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE	(V4L2_CID_MPEG_MFC51_BASE+1)
> 

I think it is best to add the #ifndef __KERNEL__ part containing the aliases at the
end of this header.

Regards,

	Hans
