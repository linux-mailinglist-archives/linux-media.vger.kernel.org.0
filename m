Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276233753F1
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhEFMjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:39:41 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34407 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229777AbhEFMjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:39:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id edGylv1O8yEWwedH2l10Jt; Thu, 06 May 2021 14:38:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620304716; bh=vuJ1klFDzrOgfdmAyyu4U1WriC+g6L2JHBDwgk6cMUA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NKfCPmecF69PYMSHcGYGCU+ioARVAPolCLJn5CHwJMnfrlhTJg8AepIe/kZ4ewpWE
         QZe659EOWJKiKG9SkmuDaXPTY54zrk3D5RRD7hp0uW1ec3n4memDyWUn3kpBr4dpb6
         DL5bIjdfvrPhEXX7NQlGWiaJAcwt53PZpClNWk+D3Rwuj0aQF3fDI0Q4A9xPADlBuA
         obkTb7jslgWLzF4hVCf6FJs8Nzn054GwtdkUuojebpx1JVwXsjZcZmdVMAZtoIwYcO
         n4+LVD2fC9pfbCHCDHBieuoShV2Q3Br9tWL30EzTmcNsCo5N8X/1fPoCtMfwHTbPma
         bqqL7hLejA11g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     emil.velikov@collabora.com
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Microchip SAMA5D4 VPU support (v2)
Message-ID: <5559aa93-3afd-a711-bd95-4ff2c77f2e49@xs4all.nl>
Date:   Thu, 6 May 2021 14:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAPK0wAB22J2d5inCiCBjn2Hm/1xHRxda7jV4eHt7J5fcXuJHmgYP8aPmFTYqnGAvKW8CudZMmtAgwHBEZ1tc4eTZgVfnWAB+MmmEaqjxzqkK5AMR6gm
 wilYKc20+Cvm+wyieAl2bZ0cWO0Z6/UoLbwNyfkTYTF7i7ml2l/4yEJDqUrHtjlNKUS6NKG/wKIVIJiCTpF1L5RhJGXDmsYpSjSfihhzk5MSHfYmYVZyLSrr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since the v1 of this PR: added the dts patch upon request from Emil
(the AT91 maintainer Nicolas has acked this patch).

Regards,

	Hans

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14c

for you to fetch changes up to 6010200718f812870694ed41c023ea6e18fc3cc8:

  ARM: dts: sama5d4: enable Hantro G1 VDEC (2021-05-06 14:34:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Emil Velikov (9):
      media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
      media: hantro: imx: reuse MB_DIM define
      media: hantro: imx: remove duplicate dec_base init
      media: hantro: imx: remove unused include
      media: hantro: introduce hantro_g1.c for common API
      media: hantro: add fallback handling for single irq/clk
      media: dt-bindings: Document SAMA5D4 VDEC bindings
      media: hantro: add initial SAMA5D4 support
      ARM: dts: sama5d4: enable Hantro G1 VDEC

 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml |  47 +++++++++++++
 arch/arm/boot/dts/sama5d4.dtsi                                      |   7 ++
 drivers/staging/media/hantro/Kconfig                                |  10 ++-
 drivers/staging/media/hantro/Makefile                               |   4 ++
 drivers/staging/media/hantro/hantro_drv.c                           |  40 ++++++++---
 drivers/staging/media/hantro/hantro_g1.c                            |  39 +++++++++++
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c                  |   5 +-
 drivers/staging/media/hantro/hantro_hw.h                            |   4 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c                         |  27 +-------
 drivers/staging/media/hantro/rk3288_vpu_hw.c                        |  36 ++--------
 drivers/staging/media/hantro/sama5d4_vdec_hw.c                      | 117 ++++++++++++++++++++++++++++++++
 11 files changed, 268 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
