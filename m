Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C743CFC36
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 16:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239158AbhGTNqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 09:46:35 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54747 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237311AbhGTNmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 09:42:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 5qdlmtzDKhqx95qdmmw5gp; Tue, 20 Jul 2021 16:22:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626790954; bh=gooSehcV/G1N2sCvy86vdx5YbaBRJv8icBQ7eStfDOw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DQ3zgYZDQYX2z3iZxDhUG6tySN2tgvnM7et6cGAkEbL25h1v8pIXv6zQ++Wh24swi
         1x2CdoS21eCM5DHD5okzvSOmxGb8TKRUGzGSzjUfn+6DtgRxdcMDXR5K7VLMGrtK4l
         Luz+62gfHcShjrGPYJOQ9g3VKt9TA1JKjqFCMp9a4pJix7sitPRiqMekutiY8h/nj0
         9rt2Nqjhlfm1lzPxtkUbfqTS9ABUAiVHVER1d0ZX5jx7QS7KPucw9fEMyorM8OeTk8
         Oc3Su78ncr8wKWnJMh+iGO7KXvNJTsmsGYwrMHppy/YSbZdUBHiElUXh42FqIcyFcM
         rJMoQld3LNGGA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] hantro: Enable H.264 VDPU2
Message-ID: <798d0a55-f280-eb0b-dcbb-6ae179c8b705@xs4all.nl>
Date:   Tue, 20 Jul 2021 16:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMpamEp0KX9O2sHr6xOJ1ZMQngetpJ8UQR5G0aCuTltI6Wcd7J6RHNJyXG/JnbhSXfqjuuTFuAHbysPtlurEaKvTeFuLPXeQ7iZqguHvA2rO8ARVxApp
 AALw/086n+7j36zyHbWExrf5zVpoZf30Eh31a/Vvu+AlZyk/T1vljoC1fQD7Mc6h3O2hnDHuVtNZ0CdBgjMIZIx4M7GvHcIwJutjnI6aS9MgT67upRfzcEIZ
 qx517lfQVLgmufvy6BsQ6LybE9idFtuw+xXfk2gDNPjygw1TLDytzrU0Bsc2eNU93Czr1jbyb1AjTOMkLtobxUNP4F2gD8oArurLaXziTho=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15b

for you to fetch changes up to 6dea6a701a6fada2e3571eef117f2d84e3e1e8fa:

  dt-bindings: media: rockchip-vpu: Add PX30 compatible (2021-07-20 15:35:15 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (6):
      hantro: vp8: Move noisy WARN_ON to vpu_debug
      hantro: Make struct hantro_variant.init() optional
      media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
      media: hantro: h264: Move DPB valid and long-term bitmaps
      media: hantro: h264: Move reference picture number to a helper
      media: hantro: Enable H.264 on Rockchip VDPU2

Jonas Karlman (1):
      media: hantro: Add H.264 support for Rockchip VDPU2

Paul Kocialkowski (2):
      media: hantro: Add support for the Rockchip PX30
      dt-bindings: media: rockchip-vpu: Add PX30 compatible

 Documentation/devicetree/bindings/media/rockchip-vpu.yaml |   1 +
 drivers/staging/media/hantro/Makefile                     |   1 +
 drivers/staging/media/hantro/hantro.h                     |   4 +-
 drivers/staging/media/hantro/hantro_drv.c                 |  11 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c         |  48 ++---
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c          |  31 +--
 drivers/staging/media/hantro/hantro_h264.c                |  24 +++
 drivers/staging/media/hantro/hantro_hw.h                  |   8 +
 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c  | 491 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c   |  32 +--
 drivers/staging/media/hantro/rockchip_vpu_hw.c            |  43 +++-
 drivers/staging/media/hantro/sama5d4_vdec_hw.c            |   6 -
 12 files changed, 626 insertions(+), 74 deletions(-)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
