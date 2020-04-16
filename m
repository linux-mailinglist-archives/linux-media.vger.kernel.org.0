Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34C91AC03E
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506699AbgDPLwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:52:05 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33729 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506677AbgDPLwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:52:02 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4A2326000E;
        Thu, 16 Apr 2020 11:51:06 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 0/4] media: rockchip: rga: PX30 support and YUV2YUV fix
Date:   Thu, 16 Apr 2020 13:50:43 +0200
Message-Id: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
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

Cheers,

Paul

Paul Kocialkowski (4):
  dt-bindings: rockchip-rga: Add PX30 compatible
  arm64: dts: rockchip: Add RGA support to the PX30
  media: rockchip: rga: Add support for the PX30 compatible
  media: rockchip: rga: Only set output CSC mode for RGB input

 .../devicetree/bindings/media/rockchip-rga.txt |  1 +
 arch/arm64/boot/dts/rockchip/px30.dtsi         | 11 +++++++++++
 drivers/media/platform/rockchip/rga/rga-hw.c   | 18 +++++++++++-------
 drivers/media/platform/rockchip/rga/rga.c      |  4 +++-
 4 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.26.0

