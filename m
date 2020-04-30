Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC161C02D8
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD3QnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:43:01 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44045 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgD3QnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:43:00 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 790D61C000B;
        Thu, 30 Apr 2020 16:42:57 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 0/4] media: rockchip: rga: PX30 support and YUV2YUV fix
Date:   Thu, 30 Apr 2020 18:42:41 +0200
Message-Id: <20200430164245.1630174-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for the Rockchip PX30 SoC in the V4L2 M2M RGA driver.
It also contains a fix for the YUV2YUV case that was not properly handled.

Changes since v2:
- Used RK3288 compatible in PX30 dts, removed PX30 compatible from driver;
- Added cleanup patch with format macros;
- Added comment about CSC mode fix.

Changes since v1:
- Rebased on media tree master (changed dt binding to yaml);
- Removed spurious line removal.

Cheers,

Paul

Paul Kocialkowski (4):
  dt-bindings: rockchip-rga: Add PX30 compatible
  arm64: dts: rockchip: Add RGA support to the PX30
  media: rockchip: rga: Introduce color fmt macros and refactor CSC mode
    logic
  media: rockchip: rga: Only set output CSC mode for RGB input

 .../bindings/media/rockchip-rga.yaml          |  3 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        | 11 +++++++
 drivers/media/platform/rockchip/rga/rga-hw.c  | 29 ++++++++++---------
 drivers/media/platform/rockchip/rga/rga-hw.h  |  5 ++++
 4 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.26.0

