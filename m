Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B459C3FF6C0
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 00:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347980AbhIBWCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 18:02:17 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60300
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347978AbhIBWCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 18:02:14 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6CB763F042;
        Thu,  2 Sep 2021 22:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630620073;
        bh=grOwvcWt8tznJgNbJD2ehdQ/weYaXz3I2MtUbnGwXhI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=jxxutEXHPKQABu1nvpBzxExg5Vjdya3D1c5xe/Ge+JwGOaYpT/V8a8yM2Xzm8ACCi
         kI/pzkdcm3YWDc92bRckxCSvHEgWtOi+CZubjZMkC2YoxMnaBhQIYi7Uhwo6KAvGmb
         fMC7a7DzXVsnpX1h8ab2pk2U+SGJKdl7cd1fEy1mAR0hD2HbhmOb+Ymk5BJ1d86zhB
         PsAVe6HuJtXRWULQzMwaSfahlMXD507YIWifLizY8I1tgNgYixkxxBc44dEq1S5mQm
         h/wwxKgrnXg/UTh4I4rlPSGBe0sDGcSJmH3hjcL8aKxbDqrwOaCj+3CRR3B2wVDrHU
         2bRaUp9mgzfdA==
From:   Colin King <colin.king@canonical.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: pvrusb2: add newline between two statements
Date:   Thu,  2 Sep 2021 23:01:12 +0100
Message-Id: <20210902220112.55824-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two statements on the same line, add a newline to clean
this up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index d38dee1792e4..ca00b7fe1e7f 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -1727,7 +1727,8 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
 				   enable_flag ? "enable" : "disable");
 		}
 		pvr2_hdw_state_sched(hdw);
-	} while (0); LOCK_GIVE(hdw->big_lock);
+	} while (0);
+	LOCK_GIVE(hdw->big_lock);
 	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
 	if (enable_flag) {
 		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
-- 
2.32.0

