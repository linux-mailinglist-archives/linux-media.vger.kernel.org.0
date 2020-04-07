Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022461A160E
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgDGTgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:36:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43225 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgDGTgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:36:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id k28so3294341lfe.10
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zYmwLnSJ94Ak1KFQ2Lt4K/NwHQ1452knMRyiQWVA3M8=;
        b=uc8JaIBoePdZQYUsZFc2nPs8Ko9Dz2onCuSwcbV59VPMJCmgoNdFMbJCpw0aiIknZt
         Re41I6UNrzUrpklpcSzYlGTYDGJDLwByQhN4wdNx3JIKj+eaYPFoinaVAd5q3BwMj0l3
         Cxrt5e82wl9kH6B/slgjYgtqU/4+3U1LHwux7GxgdffJljupkwvCWf6alBds2zJNKV9X
         uC4d22I+0NA3a4deAToJSJejnFINFAtT/I727lzfdG3l4CY76U/MQmYCnqfqs+KM9aEy
         qIM2Neory0Dgfp9vrzhpKMuO8L9v9ZOfdVCyw9Arsj0jBdP/QrB1Z6EhaBi1+Versc0Q
         JmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zYmwLnSJ94Ak1KFQ2Lt4K/NwHQ1452knMRyiQWVA3M8=;
        b=KPaigaSRqGlvnbGlM66QP+eSET5qFrm0EAY2+sZXMBjY5g/+HfqwE/3KBLuSp4fhQH
         kF9gB6zMLzl7BPlvpi2xZl4wFOzHaabG/49i0vglbRsBrcsJp9IGRaFgsVdGIkbh4RIE
         6Ws6c+21ZtTOU9SvGr8Nr9JDN5fVQ8NIvSOwccCLbpJ2070tLAk10f9OrCjA4K1AhJxV
         LW9LZAku7JAKdY0qgBEhV7209ag5w3CgPuDopQaHdHE51T0jq8ar3Xlp+zbd7pQE+EJH
         Z8A9qRMx47oCObdfBXSEOOfhIMnGt2PtIXQH/YhDQd7kGUy9ydx33tETxLTA7jquV/+V
         NzzA==
X-Gm-Message-State: AGi0Pub8GgQyulEPU0B8Lwq+1p/c66TWZHYP3wSIB9ySw8XyhrJ0V3vW
        WgLY7gqMQ4U+X2+7eQcU3MiojA==
X-Google-Smtp-Source: APiQypLDRt4Lwe0RPpsuG1osUpGjx+Fpay7l4fosQ49a38aeoE/FR14zxknbcc1YZE8RZHUmwgI8NQ==
X-Received: by 2002:a19:3848:: with SMTP id d8mr2332310lfj.44.1586288176141;
        Tue, 07 Apr 2020 12:36:16 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id n26sm12248798ljg.93.2020.04.07.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:36:15 -0700 (PDT)
Date:   Tue, 7 Apr 2020 21:36:15 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_pipeline_stream_{enable,disable}
 helpers
Message-ID: <20200407193615.GG1716317@oden.dyn.berto.se>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403213312.1863876-1-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 2020-04-03 18:33:09 -0300, Helen Koike wrote:
> Hi,
> 
> Media drivers need to iterate through the pipeline and call .s_stream()
> callbacks in the subdevices.
> 
> Instead of repeating code, add helpers for this.
> 
> These helpers will go walk through the pipeline only visiting entities
> that participates in the stream, i.e. it follows links from sink to source
> (and not the opposite).
> 
> Which means that in a topology like this https://bit.ly/3b2MxjI
> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
> .s_stream(true) for rkisp1_resizer_selfpath.
> 
> stream_count variable was added in v4l2_subdevice to handle nested calls
> to the helpers.
> This is useful when the driver allows streaming from more then one
> capture device sharing subdevices.
> 
> This patch came from the error I was facing when multistreaming from
> rkisp1 driver, where stoping one capture would call s_stream(false) in
> the pipeline, causing a stall in the second capture device.
> 
> Also, the vimc patch https://patchwork.kernel.org/patch/10948833/ won't
> be required with this patchset.
> 
> This patchset was tested on rkisp1 and vimc drivers.

I'm just curious, with this series applied can I stream simultaneously 
on multiple video devises using vimc?

> 
> Other cleanup might be possible (but I won't add in this patchset as I
> don't have the hw to test):
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/qcom/camss/camss-video.c#n430
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/omap3isp/isp.c#n697
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/stm32/stm32-dcmi.c#n680
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/xilinx/xilinx-dma.c#n97
> 
> Changes in V2:
> ====================
> The first version was calling the s_stream() callbacks from sensor to
> capture.
> 
> This was generating errors in the Scarlet Chromebook, when the sensor
> was being enabled before the ISP.
> 
> It make sense to enable subdevices from capture to sensor instead (which
> is what most drivers do already).
> 
> This v2 drops the changes from mc-entity.c, and re-implement helpers in
> v4l2-common.c
> 
> Overview of patches:
> ====================
> 
> Path 1/3 adds the helpers in v4l2-common.c, allowing nested calls by
> adding stream_count in the subdevice struct.
> 
> Patch 2/3 cleanup rkisp1 driver to use the helpers.
> 
> Patch 3/3 cleanup vimc driver to use the helpers.
> 
> Helen Koike (3):
>   media: v4l2-common: add helper functions to call s_stream() callbacks
>   media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable}
>     helpers
>   media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers
> 
>  drivers/media/platform/vimc/vimc-capture.c    |  28 +++--
>  drivers/media/platform/vimc/vimc-streamer.c   |  49 +-------
>  drivers/media/v4l2-core/v4l2-common.c         | 117 ++++++++++++++++++
>  drivers/staging/media/rkisp1/rkisp1-capture.c |  76 +-----------
>  include/media/v4l2-common.h                   |  28 +++++
>  include/media/v4l2-subdev.h                   |   2 +
>  6 files changed, 173 insertions(+), 127 deletions(-)
> 
> -- 
> 2.26.0
> 

-- 
Regards,
Niklas Söderlund
