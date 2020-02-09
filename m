Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F93C156C4A
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 20:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgBITwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 14:52:33 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:39643 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgBITwc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 14:52:32 -0500
Received: by mail-qv1-f68.google.com with SMTP id y8so2212578qvk.6
        for <linux-media@vger.kernel.org>; Sun, 09 Feb 2020 11:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9kxR+EOHYcdR6Z8bHW9eSvAhALnhcuq0cWxlCWqNXvY=;
        b=tahWV5DM1HHMH7TECLRNDuI6WJzA4Sl5v8v3uicE7LP24zFbCclgSUaNY95iPfixYf
         GME1JXE3nvFSqLwBRCsM0Bvu0tVPLxC5dNf2Ca5FtgsmeaDUpIR8/NYQJH4tvsa59Kjj
         ZdPZ48Yb2bvl8267o3PWwwl2ZntU0mYmQ2PfOBUDgzxlut6Wcw6dJkIznkdCVcaENQ60
         GEI8Ylzt+Q0bSjX3nar6F/YLeHXDokXJaxwK4o6yH17Nj4YGFIt7LwC1OaNqSFvRSrOG
         YSIxsl4nxG06U+SOGImatgtnR64OiFt030+qywN/i9kvdVo/Okr65UeAPONRQxTb4gK8
         OJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9kxR+EOHYcdR6Z8bHW9eSvAhALnhcuq0cWxlCWqNXvY=;
        b=ZbzPV4+YP/oQTsMvnUPDsUdocLAxOqzUhjs6VA7BsJWIfcVYiAvZggz4z4Df1SM3Gy
         0VpXuBXAqjgArTvJTYOpk/qiR/zP8ok6C/gLfZzuNPYleZP6/6enhu6Fo/96Sc4MfRZj
         M4/42SvjIBPnINlIA7eHOJGkrCM7uGetUaFUL27cFJg4be9qB91P666QfF9OI2U9oaGi
         PmF9y4Nxd5utsLXv7Sc0IA0RJFJb+3L4abqn7VuluDduzWGxcwseGyG40NIU6m+eov8H
         rf9l0h+H3TtcA231OUFXySEhR4yuBWDxTb67c4BrGlIuAal4w2RoBOj0CjPAa+B/gvWk
         An1g==
X-Gm-Message-State: APjAAAXFQ7rLDNRuZf9l295gEtrRfwkcPjwwsHXPRqV0uZ7JgLfzLHdW
        Z8EUQfGLKJ1AtdR5n7JkKXQ1BA==
X-Google-Smtp-Source: APXvYqwB9qzDeIuHq0xVxU8nDDVJfdaDkoOiXOfSLioqA/jrz/w5T69LQY5/uYA+6gycEZQXW35UAg==
X-Received: by 2002:a05:6214:1433:: with SMTP id o19mr5828337qvx.87.1581277951412;
        Sun, 09 Feb 2020 11:52:31 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id i7sm4670791qki.83.2020.02.09.11.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 11:52:30 -0800 (PST)
Message-ID: <74fea061a52ee3f8e25793bf9e47eba90a52c3e3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/3] Enable Hantro G1 post-processor
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Date:   Sun, 09 Feb 2020 14:52:29 -0500
In-Reply-To: <20191113175603.24742-1-ezequiel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 13 novembre 2019 à 14:56 -0300, Ezequiel Garcia a écrit :
> Hi all,
> 
> The Hantro G1 VPU post-processor block can be pipelined with
> the decoder hardware, allowing to perform operations such as
> color conversion, scaling, rotation, cropping, among others.
> 
> When the post-processor is enabled, the decoder hardware
> needs its own set of NV12 buffers (the native decoder format),
> and the post-processor is the owner of the CAPTURE buffers,
> allocated for the post-processed format.
> 
> This way, applications obtain post-processed
> (scaled, converted, etc) buffers transparently.
> 
> This feature is implemented by exposing the post-processed pixel
> formats on ENUM_FMT, ordered as "preferred pixelformat first":
> 
> v4l2-ctl -d 1 --list-formats
> ioctl: VIDIOC_ENUM_FMT
> 	Type: Video Capture Multiplanar
> 
> 	[0]: 'NV12' (Y/CbCr 4:2:0)
> 	[1]: 'YUYV' (YUYV 4:2:2)
> 
> The order of preference in ENUM_FMT can be used as a hint
> by applications. This series updates the uAPI specification
> accordingly.

As I'm implementing this, I realize that there may me a gap in being
able to implement both IPP and non-IPP support in a generic framework.
Unlike the above comment, we for non-IPP decoder we cannot naively pick
the first format. In fact we parse the chroma and depth information
from the headers (like pps from H264), and we pick a matching pixel
format. This way, if we have a 10bit stream, and our IP supports 10bit,
we will pick a 10bit pixel formats, otherwise decoding will just fail.

None of this information is passed to the driver prior to the first
Request being made, so there is no way (as of current spec) that the
driver can validate this in try_fmt ahead of time. Unless I set picture
parameters without a request_fd for that purpose. If this is the way,
then we should document this.

Is this the intended way to negotiation IPP functions with the driver ?

> 
> When the application sets a pixel format other than NV12,
> the post-processor is transparently enabled.
> 
> Patch 1 is a cleanups needed to easier integrate the post-processor.
> Patch 2 introduces the post-processing support.
> Patch 3 updates the uAPI specification.
> 
> This is tested on RK3288 platforms with MPEG-2, VP8 and
> H264 streams, decoding to YUY2 surfaces. For now, this series
> is only adding support for NV12-to-YUY2 conversion.
> 
> Applies to media/master.
> 
> Future plans
> ------------
> 
> It seems to me that we should start moving this driver to use
> regmap-based access to registers. However, such move is out of scope
> and not entirely related to this post-processor enablement.
> 
> We'll work on that as follow-up patches.
> 
> Changelog
> ---------
> 
> Changes v3:
> 
> * After discussing with Hans and Tomasz during the media summit
> in ELCE, we decided to go back on the MC changes. The MC topology
> is now untouched. This means the series is now similar to v1,
> except we explicitly use the ENUM_FMT to hint about the post-processed
> formats.
> 
> Changes v2:
> 
> * The decoder->post-processor topology is now exposed
>   explicitly and applications need to configure the pipeline.
>   By default, the decoder is enabled and the post-processor
>   is disabled.
> 
> * RGB post-processing output has been dropped. We might
>   add this in the future, but for now, it seems it would
>   make the code more complex without a use-case in mind.
>   RGB is much more memory-consuming so less attractive
>   than YUV, and modern GPUs and display controllers support YUV.
> 
> * The post-processor implementation still supports RK3288
>   only. However, a generic register infrastructure is introduced
>   to make addition of other variants such as RK3399 really easy.
> 
> Ezequiel Garcia (3):
>   media: hantro: Cleanup format negotiation helpers
>   media: hantro: Support color conversion via post-processing
>   media: vidioc-enum-fmt.rst: clarify format preference
> 
>  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   4 +-
>  drivers/staging/media/hantro/Makefile         |   1 +
>  drivers/staging/media/hantro/hantro.h         |  64 +++++++-
>  drivers/staging/media/hantro/hantro_drv.c     |   8 +-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
>  drivers/staging/media/hantro/hantro_g1_regs.h |  53 +++++++
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
>  drivers/staging/media/hantro/hantro_h264.c    |   6 +-
>  drivers/staging/media/hantro/hantro_hw.h      |  13 ++
>  .../staging/media/hantro/hantro_postproc.c    | 141 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_v4l2.c    | 105 ++++++++-----
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 ++
>  13 files changed, 366 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/hantro_postproc.c
> 

