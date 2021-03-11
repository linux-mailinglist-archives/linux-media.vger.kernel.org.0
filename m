Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D2337230
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhCKMM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbhCKMMr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:12:47 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173CEC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:12:47 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x4so32685626lfu.7
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kvwXqCTx0SGVfiPg3HS6siiZVcDh6aLobC7a2/gPeo0=;
        b=QZcN4tPl1qHa0z0nH4Ygxxjqz5dvyQ3tjLSinN6rK4jz2xZqDOwFalfnkL+heA+1+e
         45pTzAw3Cl/J4cLkC5UT7d9ZkGgOB7u2uy36rUos84OgbevS7r8qC/6WAaUIMtQsfNNv
         XfBIdycn9WT38kK8mVLEHdvgMg1HEtyNLXDUbbXIeVkduF+TKlbW04+OTMb3Yc5nvrVa
         Y3pj5MEgeSkwEeBxOxW/N9XjpweMbqFvlKO4ctI1HUCJbkU2cAZ31qmJB6COs9zZgYIB
         1y6sB02g4JUQcDfhzpIBy7J6ACbxUXnnGTiXYYCOh2qh02Ucxi5AFvJC2ne34UgCPtnk
         xAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kvwXqCTx0SGVfiPg3HS6siiZVcDh6aLobC7a2/gPeo0=;
        b=me1N9ZRjyps2ibd0friDQ8m4Yb78bS8kmt+F7YHCSxl1kMAuGfVx39V0Smp/uiqnBH
         g9xqFLhRf6jhj82WoxOrWxPH0qf6Rnum8nOR7cWBOH/11wWeTCUWGm8CzowUGyRMfgsk
         BRGrj1Z/xY/KZWeI+TXhjqg8Px5aycLo/WWms28NHu1FgI+W1LxYFjB7ns3FQS6In3ox
         Zo3+E+Lbd9vblGMKfgWjPGNFhhJZ/lW43915ZG+d5m0BZpWrzbqSp2KuoPnYi3BXAUt+
         wEy5yHAmjPZbGsabRifSnjTYhhHUj3KiDH+WWyk230IkWAw9LlAb111XSWs/Q7jxw8Xy
         utZg==
X-Gm-Message-State: AOAM532xpo4E7FonGUJ9aC2zOuYqFfYnilW8bpn22dQZhX7SzQyh53VJ
        5kmxa50JpDOMBLNAeLERt+fjUw==
X-Google-Smtp-Source: ABdhPJydIOzObbnEJHMkSpDdxkO6r1p8jZya6ro801U39KAOgQnAr+fgpxN9YhKKZU8Ows2RrqCQWQ==
X-Received: by 2002:a05:6512:6ca:: with SMTP id u10mr2050469lff.107.1615464765534;
        Thu, 11 Mar 2021 04:12:45 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d2sm785939lfl.89.2021.03.11.04.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:12:45 -0800 (PST)
Date:   Thu, 11 Mar 2021 13:12:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 04/13] rcar-vin/rcar-vin.h: fix kernel-doc formatting
Message-ID: <YEoJPFVMqMpjsQPv@oden.dyn.berto.se>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
 <20210311102022.96954-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311102022.96954-5-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your patch.

On 2021-03-11 11:20:13 +0100, Hans Verkuil wrote:
> Fix formatting of two enums and one struct.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-vin.h | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 0ee9d402f5ac..b263ead4db2b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -49,11 +49,12 @@ enum rvin_csi_id {
>  };
>  
>  /**
> - * STOPPED   - No operation in progress
> - * STARTING  - Capture starting up
> - * RUNNING   - Operation in progress have buffers
> - * STOPPING  - Stopping operation
> - * SUSPENDED - Capture is suspended
> + * enum rvin_dma_state - DMA states
> + * @STOPPED:   No operation in progress
> + * @STARTING:  Capture starting up
> + * @RUNNING:   Operation in progress have buffers
> + * @STOPPING:  Stopping operation
> + * @SUSPENDED: Capture is suspended
>   */
>  enum rvin_dma_state {
>  	STOPPED = 0,
> @@ -70,9 +71,9 @@ enum rvin_dma_state {
>   * to capture SEQ_TB/BT it's needed to capture to the same vb2
>   * buffer twice so the type of buffer needs to be kept.
>   *
> - * FULL - One capture fills the whole vb2 buffer
> - * HALF_TOP - One capture fills the top half of the vb2 buffer
> - * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer
> + * @FULL: One capture fills the whole vb2 buffer
> + * @HALF_TOP: One capture fills the top half of the vb2 buffer
> + * @HALF_BOTTOM: One capture fills the bottom half of the vb2 buffer
>   */
>  enum rvin_buffer_type {
>  	FULL,
> @@ -191,7 +192,7 @@ struct rvin_info {
>   * @state:		keeps track of operation state
>   *
>   * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
> - * @chsel		Cached value of the current CSI-2 channel selection
> + * @chsel:		Cached value of the current CSI-2 channel selection
>   *
>   * @mbus_code:		media bus format code
>   * @format:		active V4L2 pixel format
> -- 
> 2.30.1
> 

-- 
Regards,
Niklas Söderlund
