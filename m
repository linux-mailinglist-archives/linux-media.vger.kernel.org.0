Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E475230409
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfE3VPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:47 -0400
Received: from mailoutvs50.siol.net ([185.57.226.241]:55424 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726100AbfE3VPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B1A70522869;
        Thu, 30 May 2019 23:15:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 41SBzfmFGsOm; Thu, 30 May 2019 23:15:42 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 77ED052286B;
        Thu, 30 May 2019 23:15:42 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 32AB6522869;
        Thu, 30 May 2019 23:15:40 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] media: cedrus: Don't set chroma size for scale & rotation
Date:   Thu, 30 May 2019 23:15:14 +0200
Message-Id: <20190530211516.1891-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Scale and rotation are currently not implemented, so it makes no sense to
set chroma size for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index 9c5819def186..9de20ae47916 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -79,9 +79,6 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg =3D VE_PRIMARY_OUT_FMT_NV12;
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
=20
-		reg =3D VE_CHROMA_BUF_LEN_SDRT(chroma_size / 2);
-		cedrus_write(dev, VE_CHROMA_BUF_LEN, reg);
-
 		reg =3D chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
=20
--=20
2.21.0

