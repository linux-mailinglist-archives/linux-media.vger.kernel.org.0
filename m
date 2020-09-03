Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9638525C1A4
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 15:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgICN2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 09:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbgICNNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 09:13:48 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CB4C061244;
        Thu,  3 Sep 2020 06:13:48 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id di5so1242605qvb.13;
        Thu, 03 Sep 2020 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16GLCGALzYrJCFawMoH0VgHFVPs1CvmpayaSRTY5z7s=;
        b=evPZOJHn5wjeeMILUNHLBnH1JI4BG+9muwF1ZkEHIRV0odCxmxg7lslcrD+flGuIqC
         E+8d15IW3lFEVRULOeVA6cr7qpSkP6OviGBZRD4XJc0SdE7SsexICJSz30Wv0nMZyD37
         S+/MeG/zGWASF3WtrXXTOvANMzUmByx+p11QumqWm7RrpEg9s/l2TaJIxlVUAAcCkZG5
         XuvfI3Y40Xnwj0zsy7cOzab7UuW29lV2+P5ohaoRdh/OdjVqMZPF5JmlMrr0fvUR8wSz
         imzEYoFzKrAie0cCh9Ol6acp1tpCX0JieW0GfOuqdlPId1QytJMGOJIdw0wVvcZ0uQD8
         l0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16GLCGALzYrJCFawMoH0VgHFVPs1CvmpayaSRTY5z7s=;
        b=f02IU36e/JNbFJAUsALZYOmPpBN4YeiKv6j95bqMBVKLA50JUXFd9hQb61GRZq17gB
         KJnNmcsr12/C7spwTiVdXCVA9H/QTaglGZMnlSkl+oap+ncI6gZXnGDkIqL5aD10V/vn
         svEbEqNZDcu8c3Yx/iN3CFQt89eg7kS8yqGSj2H4V8PgXmqLcxdD/2uU8IJeGWWl6aYz
         VoJ8f/hAUK1eKw2dMllMBby/2jPFRXYRCaIWgmw3lqEv9SiDcib19s+Mg92iknIwtOqg
         TK/WUSTxVddMvguyuRr02s+qJm8X1UXDRIcX6M2dj3tX4STM4Nz6va1r9T5qFtcdXJX7
         34QA==
X-Gm-Message-State: AOAM533EEo0kR6FcqA268UWVYPlMNwsSx8o0OOCIgfvhw83FcYMe6Eo9
        iwRFIDscbv+h/3gf3peGXTFJ1JzDjRT3GQ==
X-Google-Smtp-Source: ABdhPJz1dsaKjV+oWM0aqVjV/hyW4lv/ZE3pJHVSef2EfDZj24DqtqFv+QMzsO1MbwrBnSAyPmMRuQ==
X-Received: by 2002:a0c:fe06:: with SMTP id x6mr2762682qvr.191.1599138826999;
        Thu, 03 Sep 2020 06:13:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id e63sm2127007qkf.29.2020.09.03.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 06:13:46 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [v2 1/2] media: dvb-frontends: lgdt3306a.c: remove dead code
Date:   Thu,  3 Sep 2020 10:13:09 -0300
Message-Id: <20200903131311.442255-1-dwlsalmeida@gmail.com>
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
Remove that function altogether.

The  lgdt3306a_spectral_inversion function was dropped completely
since the function doesn't do anything. A comment was left at its
calling site to let others know that spectral_inversion defaults
already set for VSB and QAM

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 37 ++-----------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index d3c330e035c4..38718e6fe01d 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -711,39 +711,6 @@ static int lgdt3306a_set_inversion_auto(struct lgdt3306a_state *state,
 	return ret;
 }
 
-static int lgdt3306a_spectral_inversion(struct lgdt3306a_state *state,
-				       struct dtv_frontend_properties *p,
-				       int inversion)
-{
-	int ret = 0;
-
-	dbg_info("(%d)\n", inversion);
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
-}
-
 static int lgdt3306a_set_if(struct lgdt3306a_state *state,
 			   struct dtv_frontend_properties *p)
 {
@@ -1048,8 +1015,8 @@ static int lgdt3306a_set_parameters(struct dvb_frontend *fe)
 	if (lg_chkerr(ret))
 		goto fail;
 
-	ret = lgdt3306a_spectral_inversion(state, p,
-					state->cfg->spectral_inversion ? 1 : 0);
+	/* spectral_inversion defaults already set for VSB and QAM */
+
 	if (lg_chkerr(ret))
 		goto fail;
 
-- 
2.28.0

