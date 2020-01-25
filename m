Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE3F149511
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAYLED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:04:03 -0500
Received: from mailoutvs43.siol.net ([185.57.226.234]:55164 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725710AbgAYLED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:04:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 4D8D6520E6B;
        Sat, 25 Jan 2020 12:04:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id VMz4BJPEy_mv; Sat, 25 Jan 2020 12:04:00 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 04A71520EEE;
        Sat, 25 Jan 2020 12:04:00 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 75B65520E6B;
        Sat, 25 Jan 2020 12:03:59 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 0/5] arm64: dts: allwinner: a64: Enable deinterlace core
Date:   Sat, 25 Jan 2020 12:03:48 +0100
Message-Id: <20200125110353.591658-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A64 contains deinterlace core, compatible to the one found in
H3. It can be used in combination with VPU to playback interlaced videos.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (5):
  dt-bindings: interconnect: sunxi: Add A64 MBUS compatible
  clk: sunxi-ng: a64: Export MBUS clock
  arm64: dts: allwinner: a64: Add MBUS controller node
  media: dt-bindings: media: Add Allwinner A64 deinterlace compatible
  arm64: dts: allwinner: a64: Add deinterlace core node

 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml   |  1 +
 .../media/allwinner,sun8i-h3-deinterlace.yaml |  6 ++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 22 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |  4 ----
 include/dt-bindings/clock/sun50i-a64-ccu.h    |  2 +-
 5 files changed, 29 insertions(+), 6 deletions(-)

--=20
2.25.0

