Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E08FF9C5
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2019 14:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfKQNBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Nov 2019 08:01:08 -0500
Received: from mailoutvs49.siol.net ([185.57.226.240]:57358 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726037AbfKQNBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Nov 2019 08:01:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0B4B9523780;
        Sun, 17 Nov 2019 14:01:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id baLIesOeibEY; Sun, 17 Nov 2019 14:01:04 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id BD1B7522BA0;
        Sun, 17 Nov 2019 14:01:04 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 663B4523A9E;
        Sun, 17 Nov 2019 14:01:04 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] sunxi: dts: tanix-tx6: Add rc map
Date:   Sun, 17 Nov 2019 14:00:56 +0100
Message-Id: <20191117130058.1341989-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds "rc-tanix-tx5max" to rc bindings and to Tanix TX6 dts.

Superseeds https://lore.kernel.org/patchwork/patch/1143781/

Best regards,
Jernej

Changes from v1:
- add entry to rc.yaml

Jernej Skrabec (2):
  media: dt-bindings: media: add new rc map name
  arm64: dts: allwinner: h6: tanix-tx6: Add IR remote mapping

 Documentation/devicetree/bindings/media/rc.yaml       | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 1 +
 2 files changed, 2 insertions(+)

--=20
2.24.0

