Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC743A82B3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 16:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhFOO1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 10:27:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39503 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230076AbhFOOZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 10:25:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id t9yHlmNUFhqltt9yKlrzOG; Tue, 15 Jun 2021 16:23:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623767001; bh=4W9GwisFDBb9nhoEJL6huo/q/MmGyhJDiQFsFqe1Bgo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EQn6t8rfItlfrEiEC5j4P7welo3glaTD7WPBreB60PBhqNtKy/hkGVar4uqJIyfrP
         Yr2kJZZl8302O1vQT+EqQXuWBkFYJJy8YEMNWlyoAUvAbSJP+D99zkdvHrzFwvbGTF
         YtxuuFku37ucCDvGNYd0TB6S2U+v8QtdZ5TB3xDGW99MFC2+Xw8YrookpNjAEQqlN+
         Ip1PN01hbLY0MkHn0LwVvLmCtpEw5BkExku5CJFFNYAjlGfubT7ggN/bx2uwJSXPnl
         CW9k31QFPrXFgH0WXpIvAfn2fyFNOOxFtgKGGUb6fFxFGEhi/oBP24vpLL6PtxtvVc
         qnhgVYgxxb67w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Add support for older Rockchip SoCs to V4L2
 hantro and rkvdec drivers
Message-ID: <c103c08f-295b-38d3-4a38-44f5edc1a594@xs4all.nl>
Date:   Tue, 15 Jun 2021 16:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAWBiObb3ZjowkYcgOypKFOaUn7mx124J77DDAFP1MlTtDSo/GzyYFaE5/3RNtrB/y7ulFI5vNKhpEiwSqGPenQhfSOzPwk0tMKQeKQ1F3CS30+tYVaP
 RcWkszLf1v1EMedEEEDObkHgJTxpCWUKIwC8MAf1aeuOr7vT7seKqwyX9JmkWp0iPMjh0RbWnOwyD5js+yIZI1Hzl5KqoJrTtHDD3nP/mlyPSwNP41tSaiI/
 X6PQuhl3kqM4Fi1aiYZiiVJdkEEEFx/HtqdKlLGB1+pawVDRXymEQyhAs/sRbM0Q
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14o

for you to fetch changes up to e47575ad338b8b303884d7d820c1f4b73bf464fc:

  media: hantro: add support for Rockchip RK3036 (2021-06-15 15:39:35 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alex Bee (6):
      dt-bindings: media: rockchip-vpu: add new compatibles
      dt-bindings: media: rockchip-vdec: add RK3228 compatible
      media: hantro: reorder variants
      media: hantro: merge Rockchip platform drivers
      media: hantro: add support for Rockchip RK3066
      media: hantro: add support for Rockchip RK3036

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml            |  10 +-
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml             |  33 +-
 drivers/staging/media/hantro/Makefile                                 |   9 +-
 drivers/staging/media/hantro/hantro_drv.c                             |   6 +-
 drivers/staging/media/hantro/hantro_hw.h                              |  32 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c                          | 208 -------------
 drivers/staging/media/hantro/rk3399_vpu_hw.c                          | 222 --------------
 .../hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c}  |  30 +-
 .../{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c}       |  25 +-
 .../hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c}    |   2 +-
 .../staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h}  |   6 +-
 drivers/staging/media/hantro/rockchip_vpu_hw.c                        | 526 ++++++++++++++++++++++++++++++++
 12 files changed, 616 insertions(+), 493 deletions(-)
 delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (94%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
 rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
