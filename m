Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D107F463A90
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 16:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240490AbhK3Pxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 10:53:39 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:42300 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240141AbhK3Pw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 10:52:28 -0500
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Nov 2021 10:52:21 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3RFw6pkCz9xKL0
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 15:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IFukte5IPrfD for <linux-media@vger.kernel.org>;
        Tue, 30 Nov 2021 09:38:44 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3RFw4zYrz9xKL1
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 09:38:44 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3RFw4zYrz9xKL1
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3RFw4zYrz9xKL1
Received: by mail-pg1-f200.google.com with SMTP id t18-20020a632252000000b003252b088f26so6906619pgm.7
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wiBMlf8w+Lvhex8SpMtIm4owez3P1WFv8J1K31m9Xfk=;
        b=eBnJj+J1oCY/53Ah+ONQeTSeJY/Ln7eJcdvt5yMdD2hNKgvaYSx3bMTWKzC84DHT2w
         E/u5qULkJqxdc7XfWlon0PKAp2iBsd7SKyDyWo5YfJqQ4qHIWhzyRjFxZLVc3J4usN5p
         h0ekndsLhUSMEGRyFiY0TtGDyw2AoBEuli9ARA+aZnDiv8TIsIwB28WLRySjnX47bQVW
         Lzt9JkW6wjUEZGfGz7Rg7WXmOMklaF2GPGGUCaIcG+Kahfe/PzU1ApfxH6V8XIrteDLY
         ZxHIkppWtGsrey7AZoWbuq32f8sZIUeMGhi8j44+2A5+DDkovcUQp/WK9m2phX/VhefA
         4+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wiBMlf8w+Lvhex8SpMtIm4owez3P1WFv8J1K31m9Xfk=;
        b=yIjnE7CKv36dZcMOTfqwnMtxRxqckt2H3HOTksHBC36ox7WOwjrnqW26nCfUclWy4+
         JB0Bz6Qdw4IQ+upBqD7cmE0MKG47EBCNzQ6wTeAHeHUZSIdJXqlv4nGFRDcLM3HZS4Iu
         GJ9VmnXOC/xu4IWkMLZpwwSeZ0RRZW41NQbfrUD8h+g9411ShN/TVfr4wMX8LDewfI9B
         +YDdpQDtcRF+KMSaJEOTuVBJhVUe7+wNt+Z4Zu1pchthzMP6exSe/J+EzR1hadAMXO7B
         HFFZQIIDgWqRN2Gt2k647hgmAk3UJR9YrOLZ7k0sxgzCme0JmjttFT5BX1zBZCQmogx0
         6IRw==
X-Gm-Message-State: AOAM532iuzKCk8QoXRWlUy2GDU4gyPpY1GpnO26dUbn9viJBXomR/FgJ
        7593eR/B3cdb6zi5MCS+QJ/YPRLElTYj32VkrcXPP5Ut5S19hQ9Mhqqel6TRjNcWlKbITV31P1j
        7aEPvqoUGWewX4FS8x+cjr0eYpOc=
X-Received: by 2002:a17:902:c745:b0:143:d220:9196 with SMTP id q5-20020a170902c74500b00143d2209196mr130272plq.74.1638286723701;
        Tue, 30 Nov 2021 07:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL9G+X20LYX5a66BCeYXRKS/K99ZgpXXqKaXiwAAlEOjlIhunhmegyKfocs1S086lQzw4Jrw==
X-Received: by 2002:a17:902:c745:b0:143:d220:9196 with SMTP id q5-20020a170902c74500b00143d2209196mr130252plq.74.1638286723495;
        Tue, 30 Nov 2021 07:38:43 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id d10sm21346300pfl.139.2021.11.30.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 07:38:43 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Patrick Boettcher <pboettcher@dibcom.fr>,
        Olivier Grenie <Olivier.Grenie@dibcom.fr>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dib8000: Fix a memleak in dib8000_init()
Date:   Tue, 30 Nov 2021 23:38:05 +0800
Message-Id: <20211130153807.174852-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In dib8000_init(), the variable fe is not freed or passed out on the
failure of dib8000_identify(&state->i2c), which could lead to a memleak.

Fix this bug by adding a kfree of fe in the error path.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DVB_DIB8000=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 77e2c0f5d471 ("V4L/DVB (12900): DiB8000: added support for DiBcom ISDB-T/ISDB-Tsb demodulator DiB8000")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/media/dvb-frontends/dib8000.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/dib8000.c b/drivers/media/dvb-frontends/dib8000.c
index bb02354a48b8..d67f2dd997d0 100644
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -4473,8 +4473,10 @@ static struct dvb_frontend *dib8000_init(struct i2c_adapter *i2c_adap, u8 i2c_ad
 
 	state->timf_default = cfg->pll->timf;
 
-	if (dib8000_identify(&state->i2c) == 0)
+	if (dib8000_identify(&state->i2c) == 0) {
+		kfree(fe);
 		goto error;
+	}
 
 	dibx000_init_i2c_master(&state->i2c_master, DIB8000, state->i2c.adap, state->i2c.addr);
 
-- 
2.25.1

