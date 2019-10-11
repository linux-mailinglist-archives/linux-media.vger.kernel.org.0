Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61AE2D3C96
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfJKJnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:43:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36633 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727167AbfJKJnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:43:31 -0400
Received: from [IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f] ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrSCixrlejZ8vIrSDiROSP; Fri, 11 Oct 2019 11:43:28 +0200
Subject: Re: [RESEND PATCH v2 0/4] media: rockchip: Add the rkvdec driver
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ea218a89-d844-4c56-595a-7359af3ef031@xs4all.nl>
Date:   Fri, 11 Oct 2019 11:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011093342.3471-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGns4vyZwiSBPAvKunZeMisPm7fE5uIsriqWgYBihGwOUfuwGbQOTfOucakywQovqt+7xYagXzxO0ny/Ix5vxPUNgBEjwPmC154foKKcUpHaWToXAlsB
 gAjZbIj6m6HFBaTCVsrm3rbngPLlLlsqGebj37mDoyuS4ii15Umfs/WCX3hmcliu9Ou0A7+tit+llsJ3Cn4Ry6N9sDortrJCSZPk5nVI+6MFEJCJk4fcVwky
 y/1eHy7EjBrMv1QZUxpVASNI+pdRsWMmvMMjsi7S3bBFdlGPN7tF6PcMgBnQ8s8bS3DrzSpKnDzZeByL0FboDyPeQvmLZK2tKHAe/b1Doy7Mz77b7x+d0e8Z
 3fy8l3jjhOnh7zUrrXEJdXB8eMXfrkLC0S2A2Zt5Z8mbONRCtsxfIUUSe2wSr7vl57Kq52w4Z4geqzuPepbAZHuosDGqzCJHox62xPqF/XuGHjgKWrxUTWDr
 KZlDyeAKSccRBKYg19N/O1WuAfSVGfMaITgzn8iZwpIylifbovYm4y6kzW9xgdCYTeEHsud/ftSiskzMhE5f4l1mra+4WHe1l/XHANUYKVOpHO6xq1+gcFHw
 w04m8/Hr9JxySMfii9/d2RGM51Rkhyr/wDt+oK4EoFlyrvUpCLhcAZdh3CN1lnI19ujI/CM1kVUSmm0+ejptFadneMB8Qn32wQWuWznNjdSdnJxfb1JEMUPO
 /wARGa7WFiYTA6KMHytdpIlN9VmK6Y8pd1JNqzqps8inHcUsck6JXCPyIjr4Fn/OlTs5+5O8HjqRgLhz/2vrz5/C7KRF7Ha9E+J85Z2wmWIUxjTDDNhMHfHR
 kO+BrKs9/sRQ9GJx4Mg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/19 11:33 AM, Boris Brezillon wrote:
> Hello,
> 
> Sorry for the noise, I forgot to Cc the DT maintainers/ML on my last
> attempt.
> 
> This is v2 of the rkvdec driver which was initially posted as part of
> my RFC adding codec helpers.
> For this version, I decided to get rid of the helper stuff which is
> likely to take some more time to settle. The patchset now contains a
> proper DT binding doc.
> 
> Note that this implementation is likely to be adjusted based on the
> outcome of the 'scaling matrix order' [1] and 'dynamic resolution
> changes' [2] discussions, but I thought it'd be worth posting this
> version to start getting feeback.

I assume this version of the driver does not (yet?) support slicing?

Core slicing support is part of this series:

https://patchwork.linuxtv.org/cover/59415/

Regards,

	Hans

> 
> Regards,
> 
> Boris
> 
> [1]https://patchwork.kernel.org/cover/11125207/
> [2]https://lkml.org/lkml/2019/9/3/1033
> 
> Boris Brezillon (4):
>   media: vb2: Add a helper to get the vb2 buffer attached to a request
>   media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
>   media: rockchip: Add the rkvdec driver
>   arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
> 
>  .../bindings/media/rockchip,vdec.yaml         |   71 ++
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
>  .../media/common/videobuf2/videobuf2-core.c   |   23 +
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/rockchip/Kconfig        |   16 +
>  drivers/staging/media/rockchip/Makefile       |    2 +
>  drivers/staging/media/rockchip/vdec/Kconfig   |   14 +
>  drivers/staging/media/rockchip/vdec/Makefile  |    3 +
>  .../staging/media/rockchip/vdec/rkvdec-h264.c |  960 +++++++++++++++
>  .../staging/media/rockchip/vdec/rkvdec-regs.h |  306 +++++
>  drivers/staging/media/rockchip/vdec/rkvdec.c  | 1089 +++++++++++++++++
>  drivers/staging/media/rockchip/vdec/rkvdec.h  |  131 ++
>  include/media/videobuf2-core.h                |   11 +
>  14 files changed, 2642 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>  create mode 100644 drivers/staging/media/rockchip/Kconfig
>  create mode 100644 drivers/staging/media/rockchip/Makefile
>  create mode 100644 drivers/staging/media/rockchip/vdec/Kconfig
>  create mode 100644 drivers/staging/media/rockchip/vdec/Makefile
>  create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-h264.c
>  create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-regs.h
>  create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.c
>  create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.h
> 

