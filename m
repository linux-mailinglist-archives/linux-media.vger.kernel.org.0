Return-Path: <linux-media+bounces-34848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D944DADA623
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17FF3ADFD2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA8A2882DE;
	Mon, 16 Jun 2025 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR5g8eS5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B621E4AB;
	Mon, 16 Jun 2025 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750039185; cv=none; b=emUGyE7zxvq/v6+yutaWSQKj7DTLzurydjm9c30WsIXzoq33n5NA81gHRPiSW5TUwrSayedGxYAwq2fa7qAth0u1vGOOm3OiHR+NolA6rtyNjdV7pNRKhdDYzz+JBFi2MSk1aGTd9KNhaQ1rE8PTvJXfLQU1sUbryPmfb/mQ87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750039185; c=relaxed/simple;
	bh=SsxSOqUPy+o3mzZJbGfqcDYBLF1eMDREI+pTPYjyBEs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bEPQ0ta8Q9JybBRKoIISDXSIQ072w2FspSbsbqbJ1vZHQmSweb3ibRMmcUEMo/K9R+gQAIgfmDwGCXW7e3vueujK1V1vmqPm8YAUyrirurjdi4/P5ocSkSjuJne5BNYRXv7TerIP1fa/w3J+dNUM+x2xC5iZ+oniAUULIIMOPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR5g8eS5; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81f8679957so3465763276.2;
        Sun, 15 Jun 2025 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750039182; x=1750643982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11s8nKjLduRW6FuWO4dUrGE7FYRxfoT1SWC9TRxpG+g=;
        b=HR5g8eS5alhrppPoaojShbvnQayquZ+M5DbdlkDP4WBSnunXF/DftONQax15rA+Hjr
         l5iSOyk3miXhmLaFgOS7kkLreYxta40iIMFyw0XcVtyqmdB2cmMOyR7DxzjJmsW2MdOL
         R2m7SlHpuLQZJZ/gucooY8UztRQ8KaW4zO2SAOqb6JVuzTF/kVhAtKeaprnouSrRR5Iu
         Ns9Uhn5ArogkqCHXlrdwtK5hPeow4VgygEI0cMA6rkTx/qBeYi3m7VjSSjMNwT2meMwo
         rOCVTk7YkDwA1ZqivzawpC8Eihm/1iy23OFjfcQjsv3lxIic0TGlbHiRk5Z6zculU5Kq
         ZYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750039182; x=1750643982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11s8nKjLduRW6FuWO4dUrGE7FYRxfoT1SWC9TRxpG+g=;
        b=YUEPEstXrX9Jq7raWKS3wX/e+aLZ1hNaC5ZOJrY0Z6csTggaIBJjbYmwzC1X9MkIKE
         d6mvKlwF72EH796UD7vIBm3pedvXSrMyUSp6rqcOy9WOtIiToe63oXl8TJ6rkOTMPRYN
         2BMfLiD6X4tqKnglZCi/TIWCpR5+pi6z1oVDzQXPIZ9iXspKcxzBI3cxieBnbS2hFdCV
         JpaSEJ4+7GT1QM4hIVsPJ4UakF2yPhblhGGJMXTbCLQotlfHP1w9xFGQXpAZ9nSCOxfa
         hGLk6Yn3k3cgnZO3vbVi1uyxRmT6c3dntx846eLjO5IENXGFHNPR074qiU1cirXFd388
         OfbA==
X-Forwarded-Encrypted: i=1; AJvYcCUaMuEpHW1JjkV+tWw9qN8IdlgpIvjHXzucuL1u7YUdOnG8SzjUVN+SKDqu1ToRo2ZK9jxxu78RY4qxzqQ=@vger.kernel.org, AJvYcCUlf/ROVwmJzffiJQzcIRZRB7MJP3Y16O/lFplEU50C1LWd1rCTNRdRMw+gv13m0vWnXhcIl22NuxTtXGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnC8U5xZ3TSe1ZwaqprkAQlxIVx7jP1ofl2vwCoVILigj/8pcF
	B8qS+J5Jd8z0wM0j0/ZOGedyl9OYkr/d/EPFExjuX1/hPQnYgadJDIxR
X-Gm-Gg: ASbGncvQFHc47b/BJlQwbZcUGXVO8By4QuoW7r5rRkR6qFBYJoTzkXXl0yuaEAxXvc/
	rwqL+OxBFxHQCgf1XGDDyjwAuBAp+izlxa51F/bWx7KWD9fL0LOJ69jllbjhG1Ug/Jsa+FnCKLv
	E8zo5/kSSsTs34hYRQbq14M8X8neaClwnMP5lcF12ZYK8SDKVwszK3nj3w4iSKPagH/UDGMGmL2
	eFRktRwrX5TSVFn7SXFnqXiqhDhvBMSYVkUVeg+zuwb06e3bA2lt4+8m9HPjSvdPEoaqM3+yQg/
	6g/IfpSiMF5cPRAiD7uOGQxSd8qDaNI2pC3PNYM4TTLDSCMsNqTVwODy6q+TG9YLTbLOCcuVndL
	T
X-Google-Smtp-Source: AGHT+IGo13HHvpDgHzjDouJcIIKG8qVtXxKblKahx3eKvKKptwr2rsKXI14LgqmfdAPat0I0ca5u1Q==
X-Received: by 2002:a05:6902:208a:b0:e81:caf5:451c with SMTP id 3f1490d57ef6-e822acf3e6amr10699755276.41.1750039182547;
        Sun, 15 Jun 2025 18:59:42 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e04016fsm2664871276.11.2025.06.15.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:59:42 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	jpoimboe@kernel.org,
	algonell@gmail.com,
	mingo@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: w8096p: fix null-ptr-deref
Date: Sun, 15 Jun 2025 21:59:40 -0400
Message-Id: <20250616015940.779326-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. We add check on
msg.len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/dvb-frontends/dib8000.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib8000.c b/drivers/media/dvb-frontends/dib8000.c
index d90f1b0b2051..26988d2aa065 100644
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -1677,6 +1677,8 @@ static int dib8096p_tuner_write_serpar(struct i2c_adapter *i2c_adap,
 	struct dib8000_state *state = i2c_get_adapdata(i2c_adap);
 	u8 n_overflow = 1;
 	u16 i = 1000;
+	if (msg[0].len < 3)
+		return -EINVAL;
 	u16 serpar_num = msg[0].buf[0];
 
 	while (n_overflow == 1 && i) {
@@ -1697,6 +1699,8 @@ static int dib8096p_tuner_read_serpar(struct i2c_adapter *i2c_adap,
 	struct dib8000_state *state = i2c_get_adapdata(i2c_adap);
 	u8 n_overflow = 1, n_empty = 1;
 	u16 i = 1000;
+	if (msg[0].len < 1 || msg[1].len < 2)
+		return -EINVAL;
 	u16 serpar_num = msg[0].buf[0];
 	u16 read_word;
 
@@ -1740,7 +1744,8 @@ static int dib8096p_rw_on_apb(struct i2c_adapter *i2c_adap,
 {
 	struct dib8000_state *state = i2c_get_adapdata(i2c_adap);
 	u16 word;
-
+	if (msg[0].len < 3 || msg[1].len < 2)
+		return -EINVAL;
 	if (num == 1) {		/* write */
 		dib8000_write_word(state, apb_address,
 				((msg[0].buf[1] << 8) | (msg[0].buf[2])));
@@ -1758,7 +1763,8 @@ static int dib8096p_tuner_xfer(struct i2c_adapter *i2c_adap,
 	struct dib8000_state *state = i2c_get_adapdata(i2c_adap);
 	u16 apb_address = 0, word;
 	int i = 0;
-
+	if (msg[0].len < 1)
+		return -EINVAL;
 	switch (msg[0].buf[0]) {
 	case 0x12:
 			apb_address = 1920;
@@ -1848,11 +1854,15 @@ static int dib8096p_tuner_xfer(struct i2c_adapter *i2c_adap,
 			/* get sad sel request */
 			i = ((dib8000_read_word(state, 921) >> 12)&0x3);
 			word = dib8000_read_word(state, 924+i);
+			if (msg[1].len < 2)
+				return -EINVAL;
 			msg[1].buf[0] = (word >> 8) & 0xff;
 			msg[1].buf[1] = (word) & 0xff;
 			return num;
 	case 0x1f:
 			if (num == 1) {	/* write */
+				if (msg[0].len < 3)
+					return -EINVAL;
 				word = (u16) ((msg[0].buf[1] << 8) |
 						msg[0].buf[2]);
 				/* in the VGAMODE Sel are located on bit 0/1 */
-- 
2.34.1


