Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36782251E61
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHYRfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:35:36 -0400
Received: from mailoutvs35.siol.net ([185.57.226.226]:60419 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726257AbgHYRfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:35:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9FD295247BB;
        Tue, 25 Aug 2020 19:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 7CVdfufbXldm; Tue, 25 Aug 2020 19:35:31 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 39FEC5247D2;
        Tue, 25 Aug 2020 19:35:31 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 909865247CD;
        Tue, 25 Aug 2020 19:35:30 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: [PATCH 0/5] ARM: dts: sun8i: r40: Enable video decoder
Date:   Tue, 25 Aug 2020 19:35:18 +0200
Message-Id: <20200825173523.1289379-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 SoC contains video engine very similar to that in A33.

First two patches add system controller nodes and the rest of them
add support for Cedrus VPU.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (5):
  dt-bindings: sram: allwinner,sun4i-a10-system-control: Add R40
    compatibles
  ARM: dts: sun8i: r40: Add node for system controller
  dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40
    compatible
  media: cedrus: Add support for R40
  ARM: dts: sun8i: r40: Add video engine node

 .../allwinner,sun4i-a10-video-engine.yaml     |  1 +
 .../allwinner,sun4i-a10-system-control.yaml   |  6 ++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 34 +++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  9 +++++
 4 files changed, 50 insertions(+)

--=20
2.28.0

