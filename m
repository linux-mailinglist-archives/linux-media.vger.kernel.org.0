Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00192FF9C7
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2019 14:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfKQNBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Nov 2019 08:01:09 -0500
Received: from mailoutvs28.siol.net ([185.57.226.219]:57380 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726037AbfKQNBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Nov 2019 08:01:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 72D09523C3E;
        Sun, 17 Nov 2019 14:01:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id PoHoZK4RZXTG; Sun, 17 Nov 2019 14:01:07 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2F7F4522BA0;
        Sun, 17 Nov 2019 14:01:07 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id C06D2523C3E;
        Sun, 17 Nov 2019 14:01:04 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: dt-bindings: media: add new rc map name
Date:   Sun, 17 Nov 2019 14:00:57 +0100
Message-Id: <20191117130058.1341989-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117130058.1341989-1-jernej.skrabec@siol.net>
References: <20191117130058.1341989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new entry for rc-tanix-tx5max in linux,rc-map-name

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentat=
ion/devicetree/bindings/media/rc.yaml
index d11380794ff4..a64ee038d235 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -123,6 +123,7 @@ properties:
           - rc-su3000
           - rc-tango
           - rc-tanix-tx3mini
+          - rc-tanix-tx5max
           - rc-tbs-nec
           - rc-technisat-ts35
           - rc-technisat-usb2
--=20
2.24.0

