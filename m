Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595E319012A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 23:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCWWlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 18:41:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41020 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgCWWlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 18:41:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4F3B628ED17
Message-ID: <db57d62e189b4578aec20280d69b893797588c3d.camel@collabora.com>
Subject: Re: [PATCH v6 0/4] Add initial i.MX8MQ support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Date:   Mon, 23 Mar 2020 19:41:45 -0300
In-Reply-To: <20200320131256.23294-1-p.zabel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Tested on the EVK, looks great.

On Fri, 2020-03-20 at 14:12 +0100, Philipp Zabel wrote:
> With the i.MX8MQ decoders in active use and the i.MX8MM power domain
> support still up in the air, I think it makes sense to merge i.MX8MQ
> Hantro support now and accept that i.MX8MM may or may not require
> different bindings.
> 
> Patch 4 depends on [2] for the MAINTAINERS change.
> 

Thanks a lot for stepping up and helping to maintain
the driver!

For all patches:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> Changes since v5 [1]:
>  - Drop merged patches
>  - Drop i.MX8MM bindings
>  - Change example node name to video-codec
>  - Convert i.MX8MQ bindings to YAML
>  - Drop i.MX8MM support
>  - Rebase onto media/master
>  - Enable h.264 and VP8 decoding
>  - Enable post-processing
> 
> [1] https://lore.kernel.org/linux-media/20190612093915.18973-1-p.zabel@pengutronix.de
> [2] https://lore.kernel.org/linux-media/20200318132108.21873-9-ezequiel@collabora.com
> 
> regards
> Philipp
> 
> Philipp Zabel (4):
>   media: dt-bindings: Document i.MX8MQ VPU bindings
>   media: hantro: add initial i.MX8MQ support
>   arm64: dts: imx8mq: enable Hantro G1/G2 VPU
>   media: MAINTAINERS: add myself to co-maintain Hantro G1/G2 for i.MX8MQ
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        |  77 ++++++
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  27 +++
>  drivers/staging/media/hantro/Kconfig          |  16 +-
>  drivers/staging/media/hantro/Makefile         |   3 +
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_hw.h      |   1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 220 ++++++++++++++++++
>  8 files changed, 345 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>  create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
> 


