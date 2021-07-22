Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDF93D2075
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhGVIbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:31:23 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34715 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbhGVIbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:31:23 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B3C0F20000C;
        Thu, 22 Jul 2021 09:11:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] arm64: dts: renesas: Enable GMSL on Eagle and Condor
Date:   Thu, 22 Jul 2021 11:12:31 +0200
Message-Id: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   here we go again with the attempt to try enable GMSL for Eagle and this time
also Condor board.

v5 highlighted an issue with the integration of RDACM20 which shown failures at
start streaming time due to conflicts with i2c writes performed by the embedded
microcontroller. A new patch
- media: i2c: rdacm20: Re-program chip address earlier
is aimed to fix the issue by reducing the collision window by re-programming the
chip address earlier. All capture session I've run seems stable now.

Compared to v5 integration for the Condor board is now included.

Condor has 2 GMSL channels, something the current version of the MAX9286 driver
does not support. However the DTS integration can be upstreamed but a single
channel can be used at a time.

Support for Condor required a reword of what was called eagle-gmsl.dtsi in v5
and is now called gmsl-cameras.dtsi to expand support for the secondary GMSL
channel.

Integration of the new "maxim,gpio-poc" property required for Eagle/Condor is
fully reviewed and can be eventually fast-tracked.

The series is based on:
https://patchwork.linuxtv.org/project/linux-media/list/?series=5847
and has been tested on Eagle V3H board, while only compile tested for Condor.

Thanks
   j

Jacopo Mondi (5):
  dt-bindings: media: max9286: Re-indent example
  dt-bindings: media: max9286: Define 'maxim,gpio-poc'
  media: i2c: max9286: Use "maxim,gpio-poc" property
  media: i2c: rdacm20: Re-program chip address earlier
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
 drivers/media/i2c/rdacm20.c                   |  10 +-
 6 files changed, 906 insertions(+), 141 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi

--
2.32.0

