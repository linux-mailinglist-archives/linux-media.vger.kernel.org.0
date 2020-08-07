Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7323E925
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgHGIg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgHGIgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:55 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95AE5C061574;
        Fri,  7 Aug 2020 01:36:55 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o22so708420qtt.13;
        Fri, 07 Aug 2020 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXGupTpGbvdG/fn/UKREirAgsAV1HujkQjqH/LC9r7g=;
        b=suCZmmO70LGOca+M4uJziOz/IpkT24FjNgmNJfQ/EHhK1febz7DPchJGzCMl6FRJaY
         9uTjEVUyViy4YBJY7f/ekSjeRV+0tVooPDh1HH5s2vowJ2F8+DZvYazqzSopUd/cx32s
         bhvyBY4lYpghHPOtchdUCjT95jFQgBXAWXI++X81wn55y+rpYKRCeePq9v10J52enBnM
         UaLj0QA7Wpyask0wRLLdbhO2poVRCjRKXkJi13dALs6iHk5f9jr2F2i3Lsxza7WqV0jl
         ZOf816H8b2U3q8oac9lX9g371kIkNY4V7iUSFcy/1ft36I02V+jNIib9K9j7uwzP2f8T
         81rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXGupTpGbvdG/fn/UKREirAgsAV1HujkQjqH/LC9r7g=;
        b=BJRmvF3Ii2nAqwEHcA6bDeTEwlemuQAJlc69mGx4Cmd8wiX5ZEnr3p4WJmsbwqIbE2
         nnpzeTNRo9bgv8V45Ek9MT9mwVqxXLN3cWKpY110/Lh0tzS9JEIBYLL+Rck/noX1WApN
         3IiZhba5LdhrtRY//Qw/CALbkIWXoK/TsrVH731PO7LOrdYJzdeR6Ndu51AxaohN9sP7
         q0XI0ZBj5X01i02wNJgD7LKK7a958fWhKM8HL60NUzhSC52kEaMKafOIEYZkhKag+ABw
         UwkIVkdwLe/E3INkvGs8LMvb6cA9ZsJi6XM6yM9p0wjHu/Bzv9SEmqxiktQC8WYvASUR
         yk+g==
X-Gm-Message-State: AOAM533J6egOV9I8DKvA2CWY3HI+h/SY1b+BN0g2MFwsMumcb2Mx50EV
        nuGENWNOKb95fd9IJpLwiAp0ED4Pa90=
X-Google-Smtp-Source: ABdhPJynUVAOIp/xQi+6G9Hx4cDsYO+uw4KlJRzHBupTbmTgktD5fogTSoRfrLixJwXwItQ3/yW9LQ==
X-Received: by 2002:ac8:4117:: with SMTP id q23mr13252062qtl.186.1596789414575;
        Fri, 07 Aug 2020 01:36:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:54 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 14/20] media: dvb-frontends: lgdt3306a.c: remove dead code
Date:   Fri,  7 Aug 2020 05:35:41 -0300
Message-Id: <20200807083548.204360-14-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/dvb-frontends/lgdt3306a.c:718:5-8:
Unneeded variable: "ret". Return "0" on line 744

Code was enclosed with #if 0 and thus this variable was not needed.
Remove that code altogether.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 27 +------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index d3c330e035c4..0247ef799546 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -715,33 +715,8 @@ static int lgdt3306a_spectral_inversion(struct lgdt3306a_state *state,
 				       struct dtv_frontend_properties *p,
 				       int inversion)
 {
-	int ret = 0;
-
 	dbg_info("(%d)\n", inversion);
-#if 0
-	/*
-	 * FGR - spectral_inversion defaults already set for VSB and QAM;
-	 * can enable later if desired
-	 */
-
-	ret = lgdt3306a_set_inversion(state, inversion);
-
-	switch (p->modulation) {
-	case VSB_8:
-		/* Manual only for VSB */
-		ret = lgdt3306a_set_inversion_auto(state, 0);
-		break;
-	case QAM_64:
-	case QAM_256:
-	case QAM_AUTO:
-		/* Auto ok for QAM */
-		ret = lgdt3306a_set_inversion_auto(state, 1);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-#endif
-	return ret;
+	return 0;
 }
 
 static int lgdt3306a_set_if(struct lgdt3306a_state *state,
-- 
2.28.0

