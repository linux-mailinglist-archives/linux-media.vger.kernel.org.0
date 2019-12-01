Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64CE610E28B
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLAQYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:24:04 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42113 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbfLAQYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:24:03 -0500
Received: by mail-qk1-f194.google.com with SMTP id a10so7142307qko.9;
        Sun, 01 Dec 2019 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RoeWgDgLObUnZ0KQQuawd0aWkmo9MU3ohnAF6iYl1KE=;
        b=CDHBQ6ii4gUKoqPd60R7v1VjD/7lRklOCJdNDRn39wGgBxYaH/pmDmYJ+ONuI3vzXR
         46G7MwPQcJzXnwELV+EHP0fh1fu+/miG7MKBiI8pljYeYOiOiy9yw7WvBV5rdvkyNbmM
         UoRtPUZp3njhOjLb1fWhycfst0hp++/fWMCSK7oPlIEnwVXiosfkd8t5+LkbCL43x69C
         0NtHS7rwzu++sZNbMzQ+/Kp9/NzdTWCA/P2HCPPVbftiHZ0aoSptYiN+iEyMsafUawHj
         e0s/BIKEEcUUcmzecZFw3RIIZOsHUFu0qTNPa9RgB/2J83AfhmjzRKT+L7jR9wg9QcbE
         AOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RoeWgDgLObUnZ0KQQuawd0aWkmo9MU3ohnAF6iYl1KE=;
        b=Jgxccfq/S1DbbwSaeBDagSwKnwKYD3ecgL1MjrkZ3SRplzLlxRrSxB29MMFFv25t/z
         tiIpBHxFJ5vUukXiSRDbx2DsowSjbkzRkGJGO6X6LxP4TST1AeZzKfIKoqvhG14SPNO4
         JEvArtcvUoA1oboDh5qVZHc+rO/TdEUYxeAcyGmv+IjYUQodp1f3RWnibYpk59JoCVnJ
         81xc/iWun4PaLOD6GFLSkurmnSJ0C1yyRaa+i/nMQLVvXCrCSmzCTzzODXfmlo80MqQ5
         u76t6T2iu0m0C8MqEfNTiaKuqZH/6TNJR/MLlFYATCS32lo/fLkPL3wMpOj3Ai5YbGM1
         dSWg==
X-Gm-Message-State: APjAAAVrY0SfXVahLcQCerFEM5H4Ao67eg9ujIrXzda3r+b9O7/tTf+f
        w75fFdubpreR+HKp0MwPEsk=
X-Google-Smtp-Source: APXvYqyPTj3pBXMc2lj2I8Vf+T6aTQpkRy3BKK2H0cfD+3Fp2vnRkYQ59fbjRD0G6Mkh6qOoh0+u7A==
X-Received: by 2002:a37:9bc4:: with SMTP id d187mr25351712qke.17.1575217442605;
        Sun, 01 Dec 2019 08:24:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:24:02 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] media: dvb_dummy_frontend: remove 'extern' keyword from declaration
Date:   Sun,  1 Dec 2019 13:15:42 -0300
Message-Id: <20191201161542.69535-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
by removing it.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 35efe2ce1a88..1c82338e0c8a 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.0

