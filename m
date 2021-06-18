Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4418A3AC4B1
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhFRHKZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:10:25 -0400
Received: from m12-11.163.com ([220.181.12.11]:54101 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhFRHKY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jw4Ny
        qUfENfmmInxbzCNBgOZSZp3/aylnUAW1kI4/qQ=; b=qJ5XG2K+3YMY1vXcSrb5O
        Z5Ru8DzOFWYLIlXdSfua0M4kn1r+JDFg0bWgbYxWoAzXK20CUjnawT89rF6pHcfY
        4KVtikRB6aR5Hzr6eefMeHLIwoGcqtMAymMwvbVpjiIkZQHJcCBLBFYtChXI5qea
        x7wo6HOXcXgOaglEYTj9m8=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp7 (Coremail) with SMTP id C8CowADXUlVYRsxgvVyrig--.30727S2;
        Fri, 18 Jun 2021 15:08:09 +0800 (CST)
From:   lijian_8010a29@163.com
To:     gustavoars@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: dvb-frontends: dib0090: Delete 'break' after 'goto'
Date:   Fri, 18 Jun 2021 15:07:07 +0800
Message-Id: <20210618070707.4731-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowADXUlVYRsxgvVyrig--.30727S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1rKFW7uw18Aw1ftF13Arb_yoWDurX_Cw
        15JwnxZ3yqqr1kXF9Iqr1fZ3yqk3yI9r4vga1Utr43JrZ3XFy8WF4DtFn2yrW0yFyUu3ZI
        kF95WF1DAa4akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU55Ma5UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiRRq1UFl92IP2YgAAsR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

break is not useful after a goto, so delete 'break' after 'goto',
and delete reused 'goto identification_error;'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/dvb-frontends/dib0090.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index 903da33642df..9179fe1bd713 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -403,8 +403,6 @@ static int dib0090_identify(struct dvb_frontend *fe)
 			break;
 		case P1A_B:
 			dprintk("P1-A/B detected: driver is deactivated - not available\n");
-			goto identification_error;
-			break;
 		default:
 			goto identification_error;
 		}
@@ -493,8 +491,6 @@ static int dib0090_fw_identify(struct dvb_frontend *fe)
 			break;
 		case P1A_B:
 			dprintk("P1-A/B detected: driver is deactivated - not available\n");
-			goto identification_error;
-			break;
 		default:
 			goto identification_error;
 		}
-- 
2.25.1

