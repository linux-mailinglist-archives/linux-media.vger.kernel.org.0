Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3191A3A63D6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhFNLRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:17:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59267 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234372AbhFNLPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:15:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id skX7lc0iFhqltskXAlmisa; Mon, 14 Jun 2021 13:13:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623669217; bh=1TIzd5x+CMgkHTFAhSGpDBDj1aXRIOcZdPZzciM0q0w=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sTbe3FrFVZ7vMLAfgguNjOcdHEWka58/LrPQk8nOCiMxGT3hKmsdztGQt8YjmVke1
         OrI85nqWstaigRgSC7z4qogVHONvZgHkmEr+rRASF0wGgm5C61LWKAzu8zFngJ0Rs8
         oKrMjPqsYa7obfD97EGEddBLAD6GzCYhQvOtoxWDdMWuoWfkmy/5quhkvz8ICPTpBk
         saAJN92L+v9IhkiGLils+pJrPu72QzC3uf0kyTOUK6PaQRkEpgT/MyJm1zz8v+WZwV
         NeEBC/rnx/+3MuJAJLfFtbB+QBkyPoi3QQxklLzALdLNevjq0RZXH5YtiQz5IzsPbP
         N9DqN5RbuqzpA==
Subject: Re: [PATCH v2 00/12] Add support for older Rockchip SoCs to V4L2
 hantro and rkvdec drivers
From:   Hans Verkuil <hverkuil@xs4all.nl>
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
 <562d80eb-92e5-53ff-0a15-182cc7676063@xs4all.nl>
Message-ID: <16caa644-e587-8896-ac44-2530388facab@xs4all.nl>
Date:   Mon, 14 Jun 2021 13:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <562d80eb-92e5-53ff-0a15-182cc7676063@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDgCsS/92iyXDa0kjpBC6llMmoTOccVKWaK0Jr2FI/SXqA6tF8L9ak6R+nd3QioEPdeySVlI/UEYzt34kWYGVC9fibL0fO5/bblqQuTtNlXTqLq+39tR
 SIF4AMNqW0S+LFQYv8x1Ndw+9OEgoAFLXXrjJvA2gv7Sd4ezEMpE1rhU3ngj3PNe5kpc/LW74aNP3Ph72Y8JRD7b6BBwhQMgOeActaYsbBRMF52o2cpJWON1
 Q+0PIA/Smm94V/bwaH1/5ZTOZZXeYoQKNj4rzhgwD2MEmmz0zW6572ST3GXX9DcImWjQnkaFLe/asu79l7XVBJ6zViMfZ0ys9xgWWY1bYOC/0aW1rJPKlzkR
 GNAUVWRx1g0VMdcZARSu0I5mokJUQMtj4Pf3Og25UiYRdnJyDm+dqM5iXF/IqsR5/fO0jxcZ6OsJKH9AEwpGLYq3qIT1YrCb48e506WuGL4Eq54IcBeN9IWw
 oFf/W/lruOikTuHK/34LpT4/ZmaJRslomOeXRo3Z22+Vteo19HxZzpY1fj9SWrm3sfF+u6So1xa6nnO/CJ3QyCt2iZ/9xz+EWdUmLA7TF83jqRxDRuoguIa7
 YuFKIy5fbkL/yTzeyjdWaPIW2YJMmC1FEMMEsi94oXCCajp+el00vFCPsH73xU1AVro=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 13:09, Hans Verkuil wrote:
> Hi Alex,
> 
> On 27/05/2021 17:44, Alex Bee wrote:
>> Hi list,
>>
>> this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
>> and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
>> hantro and rkvdec.
>> They can be used as-is or with very little modifications.
>>
>> In preparation to that patches 1,8 and 9 add power-controller support for
>> RK3036 and RK322x, since both drivers rely on pm. The drivers for them 
>> exist already in the common Rockchip pm driver, they just haven't be added
>> to the device trees yet.
>>
>> Changes in v2:
>> - reordered patches as suggested by Heiko
>> - fixed indentation and order issues in dt-bindings / DT patches
>> - added patch to reorder variants in hantro alphanumeric
>> - added patch that merges hantro platform drivers for Rockchip in one
>> - added missing DT patch for RK3036 (missed to submit with v1)
>> See individual patches for details about changes.
>>
>> Thanks for your feedback,
>> Alex.
>>
>> Alex Bee (12):
>>   dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
>>   dt-bindings: media: rockchip-vpu: add new compatibles
>>   dt-bindings: media: rockchip-vdec: add RK3228 compatible
>>   media: hantro: reorder variants
>>   media: hantro: merge Rockchip platform drivers
>>   media: hantro: add support for Rockchip RK3066
>>   media: hantro: add support for Rockchip RK3036
>>   ARM: dts: rockchip: add power controller for RK3036
>>   ARM: dts: rockchip: add power controller for RK322x
>>   ARM: dts: rockchip: add vpu node for RK3036
>>   ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
>>   ARM: dts: rockchip: add vpu and vdec node for RK322x
> 
> Unfortunately this series no longer applies. Support for the G2/HEVC decoder
> was merged, and that conflicts with this series.
> 
> It is best to rebase you series to the master branch of the media_stage
> tree (https://git.linuxtv.org/media_stage.git/log/), which contains that
> series. I expect/hope that this will be merged later this week to the
> regular media_tree master branch, so you can wait for that as well.

Ah, it just got merged to media_tree master. So just base your series on
that branch.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>>  .../bindings/media/rockchip,vdec.yaml         |  10 +-
>>  .../bindings/media/rockchip-vpu.yaml          |  33 +-
>>  .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>>  arch/arm/boot/dts/rk3036.dtsi                 |  72 +++
>>  arch/arm/boot/dts/rk3066a.dtsi                |   4 +
>>  arch/arm/boot/dts/rk3188.dtsi                 |   5 +
>>  arch/arm/boot/dts/rk322x.dtsi                 | 140 ++++-
>>  arch/arm/boot/dts/rk3xxx.dtsi                 |  12 +
>>  drivers/staging/media/hantro/Makefile         |   9 +-
>>  drivers/staging/media/hantro/hantro_drv.c     |   6 +-
>>  drivers/staging/media/hantro/hantro_hw.h      |  30 +-
>>  drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 -------
>>  drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 --------
>>  ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
>>  ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
>>  ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
>>  ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
>>  .../staging/media/hantro/rockchip_vpu_hw.c    | 526 ++++++++++++++++++
>>  18 files changed, 848 insertions(+), 494 deletions(-)
>>  delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
>>  delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
>>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
>>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
>>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
>>  rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
>>  create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
>>
>>
>> base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
>>
> 

