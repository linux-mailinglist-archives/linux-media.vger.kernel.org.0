Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BF430405
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfE3VPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:36 -0400
Received: from mailoutvs60.siol.net ([185.57.226.251]:55332 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726100AbfE3VPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 2B3CF52286B;
        Thu, 30 May 2019 23:15:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Uka6ARN8EejP; Thu, 30 May 2019 23:15:32 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id E23B9522869;
        Thu, 30 May 2019 23:15:32 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 2720952286B;
        Thu, 30 May 2019 23:15:30 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: cedrus: Disable engine after each slice decoding
Date:   Thu, 30 May 2019 23:15:10 +0200
Message-Id: <20190530211516.1891-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

libvdpau-sunxi always disables engine after each decoded slice.
Do same in Cedrus driver.

Presumably this also lowers power consumption which is always nice.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index c34aec7c6e40..9c5819def186 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -123,6 +123,7 @@ static irqreturn_t cedrus_irq(int irq, void *data)
=20
 	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
 	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
+	cedrus_engine_disable(dev);
=20
 	src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
--=20
2.21.0

