Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA56E1F59CF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgFJRPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJRPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:15:15 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8D5C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:15:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l10so3138562wrr.10
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bnAcrLP2mBD0LgqehZqjWz+wZp6iGN77U60BH9nzBh0=;
        b=BkFAkg3N1KpW6IPcA5DYSGuaiwu0odA6YuyNlNs7f/B21x2DBbtGR4K0zgejzFk+Lq
         ZlDI6Np5FLPkD1aXF+5unv3k+JaiLrR2G4KBvm0ns7hpP1E8O/1KHVwz/5SxPx1ktHNS
         NDIAZN02SYnOFEUMW/xiGXfnntazknwOw5I/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bnAcrLP2mBD0LgqehZqjWz+wZp6iGN77U60BH9nzBh0=;
        b=VsZ5GrzCuUIxbPn/uZzhM+2ur6wAUk4yNqmQZuA8kelryI+arzPz7Stn+xr0uhMBnY
         0KwMCtak5E3hfhjPd7PEuxu/v+7YY/VpPu63sWGsT9AK+aFDhLBCeAcVZeWNbyrLsqQJ
         CbE658xtjAQNhg7j/B8fOKeh7+uSV6frlzKdHvW3PklFn2uySz36e9BJ7dRotDqkXyYU
         pf0tL0C17JXVNg6E2GxBwOYSPeOkG3ucudZjdc4kKnxJlcuGOB7UBM2nfJaBk6FUynm0
         wV79u18Vp5L4Os27RT2SZY8gNpbWnuwekAhVwrPfkPbrfzxeXhGq+tn8Il2SERCLVMtj
         zX7g==
X-Gm-Message-State: AOAM5311V/tz2IRcwm071HO7paR+oHkPTH6n23c8eAJjCGWyFTqzIwab
        XHWzOBP2Rtb5X9RMIx2SX0vVYg==
X-Google-Smtp-Source: ABdhPJzXRFioVOTYxRJCpIY3wTHZm24nNzMC3VNKwS1kSM+YzyY1Dt5VSkocGhTzocpkRijdzpy/og==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr5080934wrp.419.1591809313597;
        Wed, 10 Jun 2020 10:15:13 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id y25sm6843219wmi.2.2020.06.10.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:15:12 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:15:11 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 1/4] media: staging: rkisp1: rsz: supported formats
 are the isp's src formats, not sink formats
Message-ID: <20200610171511.GD201868@chromium.org>
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
 <20200609152825.24772-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609152825.24772-2-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jun 09, 2020 at 05:28:22PM +0200, Dafna Hirschfeld wrote:
> The rkisp1_resizer's enum callback 'rkisp1_rsz_enum_mbus_code'
> calls the enum callback of the 'rkisp1_isp' on it's video sink pad.
> This is a bug, the resizer should support the same formats
> supported by the 'rkisp1_isp' on the source pad (not the sink pad).
> 
> Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d049374413dc..d64c064bdb1d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -437,8 +437,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  	u32 pad = code->pad;
>  	int ret;
>  
> -	/* supported mbus codes are the same in isp sink pad */
> -	code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
> +	/* supported mbus codes are the same in isp video src pad */
> +	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>  	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>  			       &dummy_cfg, code);

Actually, is this really the true? AFAIR the ISP itself can only output
either Bayer or YUV 4:2:2. The resizer can take YUV 4:2:2 at its input
and output YUV 4:4:4, 4:2:2 and 4:2:0. Bayer capture is handled with
resizer bypass mode. We haven't tested that, but if implemented, it
should probably be done by exposing a link between the ISP entity and a
video node directly, without the resizer involved.

WDYT?

Best regards,
Tomasz
