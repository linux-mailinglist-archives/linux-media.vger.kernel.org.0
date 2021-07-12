Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4FE3C6510
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhGLUn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhGLUn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:43:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A6CC0613DD;
        Mon, 12 Jul 2021 13:41:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1392CC;
        Mon, 12 Jul 2021 22:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626122466;
        bh=0aBMtciFOLOBzK2VCu5OEUJgwztazVFZiAZli1S6XS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=okX7uKIXtjXXSmoohLlfKYIcVaNlxXl7pXJ+cPmPBU3RrrrDZc1IgC+Pl/8cq7Rco
         ioPEh+sog4y/nBOQ4AwRFcVoT1VCrJDhSy+hbS1C0s14h3Tc4spl95QxXz7CnLha5C
         NxfdXhUz8vcpHZEGbXzXErI/m2Su5aXJxxjHCJyA=
Date:   Mon, 12 Jul 2021 23:40:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/7] rkisp1 support for px30
Message-ID: <YOyos6b4QvLkl6//@pendragon.ideasonboard.com>
References: <20210618130238.4171196-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-1-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Fri, Jun 18, 2021 at 03:02:28PM +0200, Heiko Stuebner wrote:
> This series adds support for the slightly different v12
> variant of the ISP used for example in the px30 soc.

Nice :-)

How have you tested this ?

> changes in v6:
> - camera compatible in px30 binding example (Rob's bot)
> - move a last wrong positionen constant define (a v12 addition
>   should not be added in the v10-prefix change) (Dafna)
> - rename size to clk_size in match-data struct (Dafna)
> 
> changes in v5:
> - handle interrupt-names as conditional required property (Dafna)
> - add second example for showing interrupt-names (Dafna)
> 
> changes in v4:
> - clean up multi-irq case (Dafna)
>   Now each variant can have a list of interrupts
>   and their respective handlers, with or without
>   interrupt-names
> 
> changes in v3:
> - add necessary binding additions
> - fix pclk naming in binding
> - move v12 clk_ctrl register bits to v12 addition patch
> - fix rebase artefact with hst_enable
> 
> changes in v2 (from rfc):
> - split out phy patch into a separate series
> - drop dts patches for now
> - split v12 addition and v10 prefixes into separate patches
>   to enable easier review (Dafna)
> - remove {stats,params}_config structs, we can just use the
>   correct constant (Dafna)
> - adapt to styling comments from Dafna and Helen
> - add patch to remove the unused irq variable in struct rkisp
> 
> Heiko Stuebner (10):
>   media: rockchip: rkisp1: remove unused irq variable
>   dt-bindings: media: rkisp1: fix pclk clock-name
>   dt-bindings: media: rkisp1: document different irq possibilities
>   media: rockchip: rkisp1: allow separate interrupts
>   media: rockchip: rkisp1: make some isp-param functions variable
>   media: rockchip: rkisp1: make some isp-stats functions variable
>   media: rockchip: rkisp1: add prefixes for v10 specific parts
>   media: rockchip: rkisp1: add support for v12 isp variants
>   dt-bindings: media: rkisp1: document px30 isp compatible
>   media: rockchip: rkisp1: add support for px30 isp version
> 
>  .../bindings/media/rockchip-isp1.yaml         | 114 +++-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |   9 +-
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  44 +-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  81 ++-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     |  29 +-
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 557 ++++++++++++++----
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 406 ++++++++-----
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 107 +++-
>  8 files changed, 1050 insertions(+), 297 deletions(-)

-- 
Regards,

Laurent Pinchart
