Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63E54742DD
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 13:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhLNMpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 07:45:17 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50289 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhLNMpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 07:45:17 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 55BFC2000C;
        Tue, 14 Dec 2021 12:45:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 0/7] arm64: dts: renesas: Enable MAX9286 on Eagle and Condor
Date:   Tue, 14 Dec 2021 13:45:51 +0100
Message-Id: <20211214124558.383137-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  v7 is rebased on lates renesas-drivers.

I have removed depencies on the post_register() v4l2 subdev operation to have
this integrated separately.

This change upports BSP 5.1 commit
https://github.com/renesas-rcar/linux-bsp/commit/28fdde07b28d5ae17ad6fb472ff4b52a4835cbee

The usual note about condor:

Condor has 2 GMSL channels, something the current version of the MAX9286 driver
does not support. However the DTS integration can be upstreamed but a single
channel can be used at a time.

Integration of the new "maxim,gpio-poc" property required for Eagle/Condor is
fully reviewed and can be eventually fast-tracked.

The series has been tested on Eagle V3H board, while only compile tested for
Condor.

Jacopo Mondi (4):
  dt-bindings: media: max9286: Re-indent example
  dt-bindings: media: max9286: Define 'maxim,gpio-poc'
  media: i2c: max9286: Use "maxim,gpio-poc" property
  arm64: dts: renesas: condor: Enable MAX9286

Kieran Bingham (3):
  arm64: dts: renesas: eagle: Enable MAX9286
  arm64: dts: renesas: Add GMSL cameras .dtsi
  DNI: arm64: dts: renesas: eagle: Include eagle-gmsl

 .../bindings/media/i2c/maxim,max9286.yaml     | 275 +++++++++------
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ++++++++++++++++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 112 ++++++
 .../boot/dts/renesas/r8a77980-condor.dts      | 193 ++++++++++
 drivers/media/i2c/max9286.c                   | 125 +++++--
 5 files changed, 901 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi

--
2.33.1

