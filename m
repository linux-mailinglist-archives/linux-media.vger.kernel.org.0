Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7B6ED318
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfKCLXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:23:45 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44551 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727503AbfKCLXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:23:45 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDysiydASTzKrRDyxigk7D; Sun, 03 Nov 2019 12:23:43 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sean Young <sean@mess.org>
Subject: [PATCH 4/8] rc/ite-cir: fix smatch warning
Date:   Sun,  3 Nov 2019 12:23:34 +0100
Message-Id: <20191103112338.22569-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF9N1XjMO4LG1hfV4UyZx9hju8VApJwxpnIxUJ20CORVPpddgMXZLwFx8NNB9O4vdKh/FlBUkHTyHk0WSx9uvYRJ01MXADmtuvHXuBJ1ZOSprfX9DIPX
 sx9Ta10UmYMEGdMUOgEesc6xm15ItEUd5t+piO9H9uwCIhmZs4YyElM27LVW38aXrF8Du3/qp2cDn+L39GIAWUByFigk0jb/ks6+Ti7aPpn1vUXyAEAOwTia
 v/tfGPcBkDgjIO5AFUUhZQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use sizeof instead of ARRAY_SIZE to fix this smatch warning:

drivers/media/rc/ite-cir.c:385 ite_tx_ir() warn: calling memset(x, y, ARRAY_SIZE());

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 3ab6cec0dc3b..07667c04c1d2 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -382,7 +382,7 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 	ite_dbg("%s called", __func__);
 
 	/* clear the array just in case */
-	memset(last_sent, 0, ARRAY_SIZE(last_sent));
+	memset(last_sent, 0, sizeof(last_sent));
 
 	spin_lock_irqsave(&dev->lock, flags);
 
-- 
2.23.0

