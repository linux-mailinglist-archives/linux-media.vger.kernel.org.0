Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A3A359F8A
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 15:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhDINHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 09:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhDINHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 09:07:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D108C061761
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 06:07:38 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lUqrI-0007dL-NX; Fri, 09 Apr 2021 15:07:36 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lUqrI-0005Hx-E3; Fri, 09 Apr 2021 15:07:36 +0200
Date:   Fri, 9 Apr 2021 15:07:36 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH] allegro: change kernel-doc comment blocks to normal
 comments
Message-ID: <20210409130736.GE13457@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@pengutronix.de
References: <2d849748-bca7-83ef-0308-a8cc5901f127@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d849748-bca7-83ef-0308-a8cc5901f127@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:04:10 up 50 days, 16:28, 94 users,  load average: 0.27, 0.34,
 0.23
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Apr 2021 09:36:06 +0200, Hans Verkuil wrote:
> The /** at the start indicates that these are kernel-doc comments, but really
> these are just regular comments.
> 
> Replace /** by /* to avoid a large number of warnings from kernel-doc.

Sorry for being late... I made the mistake of adding it to my todo list
instead of just changing it.

> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Suggested-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
> index 8cc5a28bf237..a19634fe8c0b 100644
> --- a/drivers/media/platform/allegro-dvt/nal-h264.h
> +++ b/drivers/media/platform/allegro-dvt/nal-h264.h
> @@ -11,7 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> 
> -/**
> +/*
>   * struct nal_h264_hrd_parameters - HRD parameters
>   *
>   * C struct representation of the sequence parameter set NAL unit as defined by
> @@ -32,7 +32,7 @@ struct nal_h264_hrd_parameters {
>  	unsigned int time_offset_length;
>  };
> 
> -/**
> +/*
>   * struct nal_h264_vui_parameters - VUI parameters
>   *
>   * C struct representation of the VUI parameters as defined by Rec. ITU-T
> @@ -87,7 +87,7 @@ struct nal_h264_vui_parameters {
>  	};
>  };
> 
> -/**
> +/*
>   * struct nal_h264_sps - Sequence parameter set
>   *
>   * C struct representation of the sequence parameter set NAL unit as defined by
> @@ -142,7 +142,7 @@ struct nal_h264_sps {
>  	struct nal_h264_vui_parameters vui;
>  };
> 
> -/**
> +/*
>   * struct nal_h264_pps - Picture parameter set
>   *
>   * C struct representation of the picture parameter set NAL unit as defined by
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
> index fc994d4242d8..c09bbe5446aa 100644
> --- a/drivers/media/platform/allegro-dvt/nal-hevc.h
> +++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
> @@ -54,7 +54,7 @@ struct nal_hevc_profile_tier_level {
>  	unsigned int general_level_idc;
>  };
> 
> -/**
> +/*
>   * struct nal_hevc_vps - Video parameter set
>   *
>   * C struct representation of the video parameter set NAL unit as defined by
> @@ -129,7 +129,7 @@ struct nal_hevc_hrd_parameters {
>  	};
>  };
> 
> -/**
> +/*
>   * struct nal_hevc_vui_parameters - VUI parameters
>   *
>   * C struct representation of the VUI parameters as defined by Rec. ITU-T
> @@ -192,7 +192,7 @@ struct nal_hevc_vui_parameters {
>  	};
>  };
> 
> -/**
> +/*
>   * struct nal_hevc_sps - Sequence parameter set
>   *
>   * C struct representation of the video parameter set NAL unit as defined by
> 
