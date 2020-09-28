Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F266E27AF0D
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 15:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgI1N2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 09:28:37 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38493 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726291AbgI1N2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 09:28:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MtChk6Ptpv4gEMtClkR60H; Mon, 28 Sep 2020 15:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601299716; bh=MF9gsMCtka/qboshtNG0qCTwv1/NxRu+jiJtWKmtcK4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=EgP9J9Ixxq5rxdycihZvdgfeBku5/rTzcKZGUNuYIzOytSWScVd8vUc8d++odRhuX
         mMEJd7Te+y7rvg6KqG8IJIbh9wg3ZEw4FAVP/p6fuXf61QF2NhLUoCOBoY3cWifl41
         GjFIwWTFXgaAomxJ5lLppMI7mAPRqhryF1J85/Joa/a5+NodZtPpuxMipvFxoa1rpT
         UFBhvhVck6eXHzhc8XJxNwBtgAzWYpghwDN7h09MLD/zCkdUSEt7awe56+RZHh5qYZ
         kPPzGTMaCDOon0GEirYmVtcwZQDCLJv4kU/NiGc3bXXHzMdbnteLzRfIfym+TDNm5Q
         UkJyWccY8Kr/g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Corentin Labbe <clabbe@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] zoran: fix smatch warning
Date:   Mon, 28 Sep 2020 15:28:30 +0200
Message-Id: <20200928132831.1587872-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928132831.1587872-1-hverkuil-cisco@xs4all.nl>
References: <20200928132831.1587872-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJmktp4LyWi5vzLvfftCWES+USSoJlNRcX/04O60GOSrmoSUIOnWWltiSLk3ZIR5YWErvcgsM/vrLgVMqB2LfI7Hmn2PnFA3P2slhP6LaebsJEylqNjs
 PZuKERRCEOIQ1YHIjVnscQg+Pu0+GIfq/Y+uVwe5XyPEXKoQ587NPj1WI46Gf0XZjUlgyoT3oHXI1FVo3Q0Ebd5HaFxwf4ZMc6mmCebV9e2Eeo7Q5RgbuoJH
 zftuVUEBcyhdKW7fDX03fg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/staging/media/zoran/zoran_device.c:941 zoran_irq() warn: inconsistent indenting

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 1fe91e16658b..ecd6c5293a87 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -938,10 +938,10 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 				pci_err(zr->pci_dev, "JPG IRQ when not in good mode\n");
 				return IRQ_HANDLED;
 			}
-		zr->frame_num++;
-		zoran_reap_stat_com(zr);
-		zoran_feed_stat_com(zr);
-		return IRQ_HANDLED;
+			zr->frame_num++;
+			zoran_reap_stat_com(zr);
+			zoran_feed_stat_com(zr);
+			return IRQ_HANDLED;
 		}
 		/* unused interrupts */
 	}
-- 
2.28.0

