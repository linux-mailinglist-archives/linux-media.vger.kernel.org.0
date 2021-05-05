Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2B3373DAD
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhEEOay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:30:54 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50207 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231792AbhEEOav (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:30:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eIX8lNQLoWztCeIXBlLhcm; Wed, 05 May 2021 16:29:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620224994; bh=CoLigjWlMF4XQZsbOq0TxYrVuOXY0X4UEiYtrK544OQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ufeaar4rUtNVtUuIRQFY2XWA1HwQQw0BYAHXPkNl70EVTqa1HQDHrMZH7DnnSHuO4
         9xYtWnkd3t1BjMa58idYCdAg8CzhdGvq12zI0JCjw/k7TjPwfgZf1nxODwTwPJRHDR
         NaLNMhWVZr7352vLrmX5dIR1cl8E7GevKK4knNz8q3SkY3N68sjxdb8GpcKIdeLlU4
         uHGsBHz05NDMdMVFRTGDKLIAJ4FaEKF2ngZe0ZrTSKtFT0JuiG7wsvMJ2WoeERe3DF
         xJ8dY3uo89SXaR30UPybXhxQIcCE1pVpIDmyXQKlE7UJDGTJ4EsrQ0sCmFlzj401iX
         jGZWflEH9y9Lw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     emil.velikov@collabora.com
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Microchip SAMA5D4 VPU support
Message-ID: <d674ef0f-b73d-ca99-6287-66545edc72aa@xs4all.nl>
Date:   Wed, 5 May 2021 16:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNOGdtNLrL4dZENhrIBZdIfn9A2mUbQLXdNlwJQZzfJw9B1oAHFff1fCVgZP8NUDo1VCjuQOGBlxYAiwUWYShodHOWs653V/N60IKx7aXBCknWEG13Im
 iH97EHaFgGMNk3ZFgQ1s/DS/lSlRGUi4ryxIRw5bUw5Zeaxf7fTrlMe+ZDG+IcNFYVyGS05SbLN3EgTU2RKwNyPngzo0n31DkoQ7ZpcJgEzrTIQLASxlRmf9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you, Emil!

	Hans

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14c

for you to fetch changes up to 9a66affa6ff0d21cafc5af8f21edd328f3eaf009:

  media: hantro: add initial SAMA5D4 support (2021-05-05 16:13:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Emil Velikov (8):
      media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
      media: hantro: imx: reuse MB_DIM define
      media: hantro: imx: remove duplicate dec_base init
      media: hantro: imx: remove unused include
      media: hantro: introduce hantro_g1.c for common API
      media: hantro: add fallback handling for single irq/clk
      media: dt-bindings: Document SAMA5D4 VDEC bindings
      media: hantro: add initial SAMA5D4 support

 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml |  47 +++++++++++++
 drivers/staging/media/hantro/Kconfig                                |  10 ++-
 drivers/staging/media/hantro/Makefile                               |   4 ++
 drivers/staging/media/hantro/hantro_drv.c                           |  40 ++++++++---
 drivers/staging/media/hantro/hantro_g1.c                            |  39 +++++++++++
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c                  |   5 +-
 drivers/staging/media/hantro/hantro_hw.h                            |   4 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c                         |  27 +-------
 drivers/staging/media/hantro/rk3288_vpu_hw.c                        |  36 ++--------
 drivers/staging/media/hantro/sama5d4_vdec_hw.c                      | 117 ++++++++++++++++++++++++++++++++
 10 files changed, 261 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
