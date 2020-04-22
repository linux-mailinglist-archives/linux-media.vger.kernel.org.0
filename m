Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CD01B33FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgDVAhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgDVAhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:42 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0454DC0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:42 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id r14so185867pfg.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MaMnXEhvCiHisZ+3swQRFXUzrnMfvh2Y085bklTdxKI=;
        b=qxXp/xkDiBIqHMqowZiE1WQBDZx6HtZZG8WM/t+0l8EY+MYT5RrJGvib54tqoC/Y6y
         gIk34ddR2qfZVufgaHl6htOp9ubamggFBRzJHneUJgh3pDu1NO93J8zUD6f4n+4JF0EX
         hgeesC36qYICtr+sytTbj9ExEmJg6R11gMlojk0C9eFZmcGoz5nETOuIrKs5VWZkRn8I
         Mvm3nW2zJz6nTFuiNlZe5RyDhfHdupFxBlLWz//OlvBWiSYR3aWA0JwVy9EJ7cIVKJeQ
         6Jz025YpjuroOfBaN+VJQ8RBeiLKfyhdg9AoSdIUh9nASq/GSaBkFKvaR4oRgV9bb/DU
         +a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MaMnXEhvCiHisZ+3swQRFXUzrnMfvh2Y085bklTdxKI=;
        b=t9HcRS9sA1UtR28XV//w2M3qh9lNxhcvXn8Ay3fU8rcI/oHWAM82uI9szClEGiBJK6
         UW5OQZ1LjhVsAI6y5FFoWYdLAwVbSlpUL4EnpdRltIST6DOONlTkADjGDRNEP305mg+L
         UwR03TlTIZR+Lummt+9xO50FxV9qgicmin+GIlEv0EcHar9o4YupLoebpeDSbJKB/sal
         G1A3zM2+8UzgZpXO1xY3QVwLCmApbeNPDfCnfDrvq9cP+R46fgfwSiFEhD/X1cEtPPcn
         KN+GqXFOiTpKxZd97QE3azliC3oIk64OxCWeP/K5s4nhDSwuMD448qHdx1ZtuFDsTBX5
         Amlw==
X-Gm-Message-State: AGi0PuZ8uyOvcypCcKfKtyQsD+NT7cxcQzQdg8EZl944Totu9xnCopHZ
        goXNt7D2uLVv1c+fGIAfn0PaeHyg
X-Google-Smtp-Source: APiQypLATzhkQHzHBkTiIPGVBfLDGJ+lZGi2GTWTGn/dMS0bZ0mSbzh+WIexlpABAtqpPUo5EB1mXA==
X-Received: by 2002:aa7:84cd:: with SMTP id x13mr23696394pfn.41.1587515861260;
        Tue, 21 Apr 2020 17:37:41 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:40 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 04/12] utils: don't check unsigned for < 0.
Date:   Tue, 21 Apr 2020 17:37:27 -0700
Message-Id: <20200422003735.3891-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wtautological-unsigned-zero-compare

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-controls.cpp | 2 --
 1 file changed, 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 8c4480be..251a6049 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -80,8 +80,6 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 			return fail("min > max\n");
 		if (qctrl.step == 0)
 			return fail("step == 0\n");
-		if (qctrl.step < 0)
-			return fail("step < 0\n");
 		if (static_cast<unsigned>(qctrl.step) > static_cast<unsigned>(qctrl.maximum - qctrl.minimum) &&
 		    qctrl.maximum != qctrl.minimum)
 			return fail("step > max - min\n");
-- 
2.25.2

