Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01443A637D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbhFNLNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:13:54 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59197 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234286AbhFNLLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:11:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id skTKlbz73hqltskTOlmht4; Mon, 14 Jun 2021 13:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623668982; bh=vddD9ihU2ZPegn37Asrq1n1pbNugCtI3Mvl3vbyY6h8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lr2Ea2Nto2lShMCH2S9F4Qy+ZMmP4fHjYWaNzClW178dJRGP54kumaKtjozLg2oLd
         LQMuiNVGR9I8w5WypJ4YRPdfuowA9aC9QRfMekvPfAau101RZ/J59N1MP8jhmdjU3K
         OS4v4s8q4i/oESf9z+CqGFOYapY0ti9NtJ2a5xMcs0ZDp2SeH2Lf5ffiLnOA7kjyst
         ueW+Kl8n7VsJkKpUteqXBAdyJZ95oqNK6y+Bax4i+7COT2dWkIoZ6CaJLnbSK5SJRh
         LGCZrLW9z4hSugxCMrtavEG/12C4UXL1xJw9PqdDVMoPJOX0kg53FKJcbg/5xOBBQ3
         593kZXqao8AGg==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 00/12] Add support for older Rockchip SoCs to V4L2
 hantro and rkvdec drivers
To:     Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
Message-ID: <562d80eb-92e5-53ff-0a15-182cc7676063@xs4all.nl>
Date:   Mon, 14 Jun 2021 13:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD616eqUHJJQZz5sFByPOsT2nDsyUUckWPOoJiPESgeRGGyqXzoSDTV2d+J5vxBPHFQtCE7ANAWcxFhYOA2b34PGEqUnsnh0BYxT2Y/TDGHWlY35SSlP
 5sDVP+cBhS+p4bof0AGFTWLMLb2+szh+3qsh6pfM7nmwYqGhklRnvwUSK0zv3BfDCY5NeVTZ64UubpapoTbeu6hiMuIVlCyNMfY5gWEV9sZeK5RgS9Y2YVVe
 1RhaL33Dyo50NUabDEv2s3gJ3caTcFX7FKyrJ8SKjbht8ZKhmP9F0QVbCx8zurQcluEv9iJfZlWM4ZdW7yqihDnr1Q5hJDm32rXciZZE16jvN5f0yX6DqvYt
 PuWagwZEzgxglTyQSuMHEOJTgYbIjQwCTaM1mv7O/UKwaN5DOhPjz2nspL7qz7pfYIedpiYgBXvA60bPpRR85gnE8BqfHzTTz5gzZE0tF0NRIXp2whb4Mpam
 wlpeh6OUSzGzv/pShG7G47rDyvF/uLaeHwKNsX0vrPW4QM2UaS69Sw2DQFqCnCrFv1w2GNheGgRZQnLeWoGgoLJqCTkA4r8GgbFqqaryRm2P5ciY9a1EGH3f
 HFI8Tcqv3xyQUd7XHc5DDckgRCV7DEm/WOnEOAXXZWN3n5wqd/xNwDab5wDOtts+/e0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 27/05/2021 17:44, Alex Bee wrote:
> Hi list,
> 
> this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
> and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
> hantro and rkvdec.
> They can be used as-is or with very little modifications.
> 
> In preparation to that patches 1,8 and 9 add power-controller support for
> RK3036 and RK322x, since both drivers rely on pm. The drivers for them 
> exist already in the common Rockchip pm driver, they just haven't be added
> to the device trees yet.
> 
> Changes in v2:
> - reordered patches as suggested by Heiko
> - fixed indentation and order issues in dt-bindings / DT patches
> - added patch to reorder variants in hantro alphanumeric
> - added patch that merges hantro platform drivers for Rockchip in one
> - added missing DT patch for RK3036 (missed to submit with v1)
> See individual patches for details about changes.
> 
> Thanks for your feedback,
> Alex.
> 
> Alex Bee (12):
>   dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
>   dt-bindings: media: rockchip-vpu: add new compatibles
>   dt-bindings: media: rockchip-vdec: add RK3228 compatible
>   media: hantro: reorder variants
>   media: hantro: merge Rockchip platform drivers
>   media: hantro: add support for Rockchip RK3066
>   media: hantro: add support for Rockchip RK3036
>   ARM: dts: rockchip: add power controller for RK3036
>   ARM: dts: rockchip: add power controller for RK322x
>   ARM: dts: rockchip: add vpu node for RK3036
>   ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
>   ARM: dts: rockchip: add vpu and vdec node for RK322x

Unfortunately this series no longer applies. Support for the G2/HEVC decoder
was merged, and that conflicts with this series.

It is best to rebase you series to the master branch of the media_stage
tree (https://git.linuxtv.org/media_stage.git/log/), which contains that
series. I expect/hope that this will be merged later this week to the
regular media_tree master branch, so you can wait for that as well.

Regards,

	Hans

> 
>  .../bindings/media/rockchip,vdec.yaml         |  10 +-
>  .../bindings/media/rockchip-vpu.yaml          |  33 +-
>  .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>  arch/arm/boot/dts/rk3036.dtsi                 |  72 +++
>  arch/arm/boot/dts/rk3066a.dtsi                |   4 +
>  arch/arm/boot/dts/rk3188.dtsi                 |   5 +
>  arch/arm/boot/dts/rk322x.dtsi                 | 140 ++++-
>  arch/arm/boot/dts/rk3xxx.dtsi                 |  12 +
>  drivers/staging/media/hantro/Makefile         |   9 +-
>  drivers/staging/media/hantro/hantro_drv.c     |   6 +-
>  drivers/staging/media/hantro/hantro_hw.h      |  30 +-
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 -------
>  drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 --------
>  ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
>  ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
>  ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
>  ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
>  .../staging/media/hantro/rockchip_vpu_hw.c    | 526 ++++++++++++++++++
>  18 files changed, 848 insertions(+), 494 deletions(-)
>  delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
>  delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
>  create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
> 
> 
> base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
> 

