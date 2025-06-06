Return-Path: <linux-media+bounces-34282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B75AD0939
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 23:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCC4189E502
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 21:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C8D217F29;
	Fri,  6 Jun 2025 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1RH7DKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F030A31;
	Fri,  6 Jun 2025 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749243764; cv=none; b=RSTvH/jfuWUWtjq6K73JDIwGl7RNCtZIckVNhNaB9cHg5UfjOlhunaxpJ8fITANFoYOxMGI4Y5dUwRB8gvpSs2hL0/RhDEp7NhuXjJARV4YGpTdz4ZdVdodPRCsANAGnmbgLtIDISZsRLCHXfhg7Qsm0cB4zBEj4osHdemqxGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749243764; c=relaxed/simple;
	bh=xj0/huTnf1Ge1GUzSFj0vryQBvGBYZ/TnFMm1kkMCIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OLKE88GSYtowOqEzD40nFliO4yUBKeZybNN8BBerWLl/+C1c9USkqREdpMGMLRcTkoSSr8j9Hjn/t5QRm/1iplTnkDNAfWAIs6Af9yws/RyJ9g0JHS2ymyZHiWCsPvxSBmyhlCB5qCZWy+n9hbaLzLGY5DZO93QHnLASzeT6vS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1RH7DKa; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-708d90aa8f9so24977547b3.3;
        Fri, 06 Jun 2025 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243761; x=1749848561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckTWEplUDj8tVOgXyWQTsu3+spCGSYfUAFmKmFITmxY=;
        b=e1RH7DKaxGNUwj+LpWPs75owh592mifdntJtYA/9RYTrqETVdpGKrc5BfObxKiEsA/
         QPxrhi/+49n0Lvs/pCkDKfne7Bw3ZKpC/RBSsm1hKnbLyeKc9ie3tPmIlsdU8EqYvXLn
         FJTxbA3bmiU1eoG3H/j6H3HvulV4TBgdjHP3W3Nl/S5YDsII0uBf2LUEEJ2I7gzsvgAb
         B6rN4HNIhfsI3kk/IiDfuY7ZwKW2HeyvtQdMhQcbHCn3m2Di4GNFos8+mNK8KyVHpXzl
         yp+DZoUplW+mfMKr2X0V/+DCchp4fGcIVAJOuAU7sQYR38afXMkTTNfhOWRYc68nDBRC
         n5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243761; x=1749848561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckTWEplUDj8tVOgXyWQTsu3+spCGSYfUAFmKmFITmxY=;
        b=kTW1avq+clSjdnSDrTwMBLbU9CdOD1na4+OXfYrLyiQye3n6085Gx39jcpEMjYxB21
         IJ+cxccPL1D6buzzRvip3nNpddWnphtKvOfrdDeksPsg3hdNq/SMVdUCPNyLtMha+Fgh
         suBZPH2Hq4SMRRnG8gAkiSa9W/zShilfaeN8OGmekElRpRGrAaVqnpyUyBRAoE/eY0Rj
         sibfoTDAytpVolK9oy+Xb44geWsHI3j+4cGTxj03EKkKw+yBuv8mNy0Y0HMeBPXgiSgG
         jjeKpRxFlYdlS9QMn747WwJSE0qNYAVvHkxgq94pHl1wG5jVqK+tjAdnybHDKMGF/0aB
         RCPw==
X-Forwarded-Encrypted: i=1; AJvYcCVeiwEFWzZL8ejjk2fV16TuoTHAcDIMmgtQ51RShjaSvsIs6acYOlk4LtK9Cjn/coIwxwHXnF+UczlVf34=@vger.kernel.org, AJvYcCWX12csjA3SOUKpeFN/VQsvWa1jmWd15NEMNRUpbDZ23DSeZh2w7GQXZ2M8tEzp4oRRl6IgFQIKGpVNDcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g50egNQLk38mPH0c7HIa60eqMj38xh2JRyXgkPZIt7bXncU8
	arPiL0hiamxNVScgx1EwcjMNXsYQBkgdYJuH6cmTJHWyXWBuJr5rJYJp
X-Gm-Gg: ASbGnct4kak8cEVIm2F6DHxwOup+blYEg6vHUt4K9cl2yqUnB5sloOhOijBCrjtMpDH
	XKaSyF1CrW74K6bIh6xXdA7l3ecJjlk76LMvhX1LdOQSc0b7dsP9/EpWH038t9d8fVh834RZW2q
	u2VzmfBJ4ZgKQdAGgEZnXHOwyZgcOQzGRzt3A/uB5N91DELHZK0QROEv78KZ2ww3X7Gte2Ccalw
	Bd+z9kw87h3QxaZnLI6V8GLsHUzMgx65XlmOavIiRJl4wZLMu1RnlUhUH2Xez0nyEswu8Po+Ll2
	Xz1lVw/1vBC4fk03buWC5b64BbZHBgWr+DrCeNKpE52oiQt77CmjQ/NM0Hz4Tjiczg==
X-Google-Smtp-Source: AGHT+IG1fy9dy91VK/x1ZkI8SoZWkrn8wR+qdFht38h2sCE5mAew7pjFDZWWomOaCGuG07h43LX68A==
X-Received: by 2002:a05:690c:fc2:b0:70a:36b2:8f94 with SMTP id 00721157ae682-710f76c2cfdmr72144037b3.18.1749243761230;
        Fri, 06 Jun 2025 14:02:41 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f98afad6sm4000027b3.20.2025.06.06.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:02:40 -0700 (PDT)
From: jinyaoguo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil@xs4all.nl,
	algonell@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jinyaoguo <guo846@purdue.edu>,
	Alex Guo <alexguo1023@gmail.com>
Subject: [PATCH] media: dvb-frontends: dib7090: fix null-ptr-deref in dib7090_tuner_xfer()
Date: Fri,  6 Jun 2025 17:02:38 -0400
Message-Id: <20250606210238.1517508-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jinyaoguo <guo846@purdue.edu>

In dib7090_tuner_xfer, msg is controlled by user. When msg[0].buf is null and
msg[0].len is zero, former checks on msg[0].buf would be passed. If accessing
msg[0].buf[0] without sanity check, null pointer deref would happen. We add
check on msg[0].len to prevent crash. Similar issue occurs when access
msg[1].buf[0] and msg[1].buf[1].

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/dvb-frontends/dib7000p.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index b40daf242046..46753d2ae212 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2270,6 +2270,8 @@ static int dib7090_tuner_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg msg[]
 {
 	struct dib7000p_state *state = i2c_get_adapdata(i2c_adap);
 
+	if (msg[0].len < 1)
+		return -EOPNOTSUPP;
 	u16 apb_address = 0, word;
 	int i = 0;
 	switch (msg[0].buf[0]) {
@@ -2360,11 +2362,15 @@ static int dib7090_tuner_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg msg[]
 	case 0x1d:
 		i = ((dib7000p_read_word(state, 72) >> 12) & 0x3);
 		word = dib7000p_read_word(state, 384 + i);
+		if (msg[1].len < 2)
+			return -EOPNOTSUPP;
 		msg[1].buf[0] = (word >> 8) & 0xff;
 		msg[1].buf[1] = (word) & 0xff;
 		return num;
 	case 0x1f:
 		if (num == 1) {	/* write */
+			if (msg[0].len < 3)
+				return -EOPNOTSUPP;
 			word = (u16) ((msg[0].buf[1] << 8) | msg[0].buf[2]);
 			word &= 0x3;
 			word = (dib7000p_read_word(state, 72) & ~(3 << 12)) | (word << 12);
-- 
2.34.1


