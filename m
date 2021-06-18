Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D4F3ACB9E
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbhFRNFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 09:05:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:45088 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhFRNE5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 09:04:57 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1luE8u-0001y0-3W; Fri, 18 Jun 2021 15:02:40 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 0/7] rkisp1 support for px30
Date:   Fri, 18 Jun 2021 15:02:28 +0200
Message-Id: <20210618130238.4171196-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the slightly different v12
variant of the ISP used for example in the px30 soc.

changes in v6:
- camera compatible in px30 binding example (Rob's bot)
- move a last wrong positionen constant define (a v12 addition
  should not be added in the v10-prefix change) (Dafna)
- rename size to clk_size in match-data struct (Dafna)

changes in v5:
- handle interrupt-names as conditional required property (Dafna)
- add second example for showing interrupt-names (Dafna)

changes in v4:
- clean up multi-irq case (Dafna)
  Now each variant can have a list of interrupts
  and their respective handlers, with or without
  interrupt-names

changes in v3:
- add necessary binding additions
- fix pclk naming in binding
- move v12 clk_ctrl register bits to v12 addition patch
- fix rebase artefact with hst_enable

changes in v2 (from rfc):
- split out phy patch into a separate series
- drop dts patches for now
- split v12 addition and v10 prefixes into separate patches
  to enable easier review (Dafna)
- remove {stats,params}_config structs, we can just use the
  correct constant (Dafna)
- adapt to styling comments from Dafna and Helen
- add patch to remove the unused irq variable in struct rkisp

Heiko Stuebner (10):
  media: rockchip: rkisp1: remove unused irq variable
  dt-bindings: media: rkisp1: fix pclk clock-name
  dt-bindings: media: rkisp1: document different irq possibilities
  media: rockchip: rkisp1: allow separate interrupts
  media: rockchip: rkisp1: make some isp-param functions variable
  media: rockchip: rkisp1: make some isp-stats functions variable
  media: rockchip: rkisp1: add prefixes for v10 specific parts
  media: rockchip: rkisp1: add support for v12 isp variants
  dt-bindings: media: rkisp1: document px30 isp compatible
  media: rockchip: rkisp1: add support for px30 isp version

 .../bindings/media/rockchip-isp1.yaml         | 114 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   9 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  44 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  81 ++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  29 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 557 ++++++++++++++----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 406 ++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 107 +++-
 8 files changed, 1050 insertions(+), 297 deletions(-)

-- 
2.29.2

