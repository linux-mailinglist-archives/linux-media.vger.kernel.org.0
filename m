Return-Path: <linux-media+bounces-30602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95845A9506C
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6A3172443
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348EF2641E2;
	Mon, 21 Apr 2025 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge8Fb/E/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82F261575;
	Mon, 21 Apr 2025 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745236255; cv=none; b=D7wm3uuhJ6pUd7fSWL77NFD49k/Hh9PXBeocv0IKwX0eVHoEslCudBRmxfxbZR8c4Ux2NqB0SD6p4Mho5Do9L5FwQSd2FWIQ3Cpor/XKu+DtlXUTQ/nCUKUAdnYonicMAa4kl0nY7Mo3OOpx2EJkRwa8SD6WAEPyYFtwqv73yEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745236255; c=relaxed/simple;
	bh=7V0PSME1nWcALYz7UGYE7Ja9J4GO+tNxHAvxb4tYhaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ThGgPv+35u9YX4EDkItJZlCJ0S6/evB5RfYGq67OO1BhlnU5ltXtYA+Fuuq3iBTSAOTdPaQpzZjdMvzUZZaGCOtHzJRkF5q9l7ZXqiTtMKTLwgkbM7n/6gh2tdqk1vZt1fuUOjmS4lvY7oMol+kRJ3kybCDBHBg3/ri57AJfRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge8Fb/E/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22401f4d35aso42198605ad.2;
        Mon, 21 Apr 2025 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745236253; x=1745841053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc0DKkPWrE0e6Vsc/ZtQk+JXgRiTqIJBdziEE9MWJQg=;
        b=Ge8Fb/E/21V3O7tfK/o0YWBK9dSyEKrynL3DQFCh7bYSL9ldxw6PS98kJGP3iG58S1
         JQyozdanUeZ7F/U4mca1eUXX9IsQNxKvKYNVzvzH7QBTIoDiExZke0V4EJv6lE13PdQm
         OL5rICVU+p+XgWEgpeRo9ZeOVIQtbfkCtiQ2LRAex8DHpQbqiiRCByHnrBLzvnbuXlCi
         oVoP2D+7nqBN77A1qpdnF3QuXq4EAWr7ADicXE2N+DDLWmvhEI21uGJNP6QtA1LM0eeo
         M/6+G2ayK2PTFONeYuUY8lQA5Hclj6Ab2u1b5628REQ0Z9UQg04u9ObCgHJBJzUdVRvi
         7Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745236253; x=1745841053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc0DKkPWrE0e6Vsc/ZtQk+JXgRiTqIJBdziEE9MWJQg=;
        b=D+nPlY1YfTaRMo7HfohclGVwgANUXxdvNZClT/ypRqp3iq32DiVhGxQqRS105UWeV8
         F1w4qGWbFyU6Ogpfbw7h2G6Tog66NwMUjitVDzFOV3ATNopBpNA+/KmpymG/Ho3g7LK7
         RJ5Suf4IIYm+SDr5rM8+FQBJfgqv5C+cXPr4PpaNHFCSs+Pn41UK8QJGRmBU03WvlKO8
         LNDt0rmGyyDsiN616BS0Weopr1d67JDKHwpDgA6nrc3oCmKUmWShTs9lmLuzpcn3uBlm
         KP0kieHJ98oWQM3smc/LAKka9KQshXM4U8pEgkZ4yNwge/e+tpXO+7M5oyXKRXnTdlFd
         xuXw==
X-Forwarded-Encrypted: i=1; AJvYcCUd4jWG+b5qYa8kSR98MhQiRueqkugl7TeMZwi6SsskNnjRfLsAZ18CWYRo6L6ycEi9x/bEGwwl5HWn2eQ=@vger.kernel.org, AJvYcCXOHjwfGLulkTFYpXgVVoblUZEP6LQoVQ2ryjSiRM1sVoJWmW8rBnar+8R97Pq2GL0CSbTH1FpyUKh1uys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKmc1fzkQc8Cg4+Wfo23j/USaFKxioY0NxkORdZoDWnu78xbH
	NfScVkTjYDfRrJxokvYtXpcNLP1TnvVw82NcVplyg5cw61Ph4UXh
X-Gm-Gg: ASbGnct/R1G6tj54EdccAsCHvmpt4t+Yu7ziuKPJ2fuPa9Nu0iQcy+6swxcF7kqWHPs
	reYf/+JCZfZVs9Fkp9HemChriG4AlCovBJurMcVYpMj8mxO4Sp3dYDreQVjubuttCnfoUSRCQ2J
	HzVC0ZjkCkRRz1C10nAzK6BDStv5EiNQoSvmOghK20gUTJkdV+9dJIFwNEhRiIqJuC7Gy7/lBxI
	eFuEJk+gFAwmqRmwv8coGY0DLy6TiIIu6d6B2pRMfez730K0F5hcjXwfNCGMg/ACq3hy3qUaylB
	7ofz/IOGR57va3ZwWhHlPj9vTgf3mW47AzFgATSgJjwNBYRecqZDMAgIoejeL+/S+GDgMA==
X-Google-Smtp-Source: AGHT+IHweDS0NqpxlU+xKC7cxp7EuYdOBxBK9+ucLyGMecrMQWr9pEmPSyqRsD8ncvvX+wWS8I7/9g==
X-Received: by 2002:a17:903:2cb:b0:223:5e76:637a with SMTP id d9443c01a7336-22c535a9c65mr150484045ad.23.1745236253382;
        Mon, 21 Apr 2025 04:50:53 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf2548sm64007015ad.64.2025.04.21.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:50:53 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	hverkuil@xs4all.nl,
	harperchen1110@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: dvb-usb: az6027: fix out-of-bounds in az6027_i2c_xfer()
Date: Mon, 21 Apr 2025 20:50:45 +0900
Message-ID: <20250421115045.81394-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing maximum size check on msg[i].len causes out-of-bounds vuln for u8 *data.
Therefore, we need to add proper range checking to prevent this vuln.

Fixes: 858e97d7956d ("media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/usb/dvb-usb/az6027.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 056935d3cbd6..f9bd8a4c1577 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -988,7 +988,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			/* write/read request */
 			if (i + 1 < num && (msg[i + 1].flags & I2C_M_RD)) {
 				req = 0xB9;
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i + 1].len + 5 > sizeof(data)) {
 					i = -EOPNOTSUPP;
 					break;
 				}
@@ -1005,7 +1005,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				/* demod 16bit addr */
 				req = 0xBD;
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i].len - 2 > sizeof(data)) {
 					i = -EOPNOTSUPP;
 					break;
 				}
@@ -1034,7 +1034,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			} else {
 
 				req = 0xBD;
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i].len - 1 > sizeof(data)) {
 					i = -EOPNOTSUPP;
 					break;
 				}
--

