Return-Path: <linux-media+bounces-34298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A5AD0EC2
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 19:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 828AF188E5CE
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 17:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31AB1FBCAD;
	Sat,  7 Jun 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEMoS17J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6181C1F05;
	Sat,  7 Jun 2025 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749317858; cv=none; b=JYTDSykT8WSl0od88blgRkXKJ1r1Z0cZpv0G3nqEiiBQQXPPUNKgCk2Gazbm1TNnlc4JxdQSaibO2aLW5QSuZpORJW6ll9tLopAnoA8w79em8+syOfyHJc5AtYynIS+MX7msKLDO5ByORcmHlXZ+bANDQ77GAOFMqU/h24/hEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749317858; c=relaxed/simple;
	bh=MNXMy8HfI2waq2G8oxNDKiH7bMr9b+jPeQUK+EXCUcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SIbV/VdVnQaTEFJwWDKC37Hkq+/2Di23asKo3brvM3rd4iyUrIZjWc5D/Jk7L9hpveitoeN1xkGLv/p5WV6q0YU/PAWJuJ3z0Gl6G2pvxiYhNIWyVykO8jxhCLKYLoSKLN/pvVZpHxo0k6B0pY0vNMNj0sJs8rTA31DhNgsAUY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEMoS17J; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso2596064276.3;
        Sat, 07 Jun 2025 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749317855; x=1749922655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayCFwbQaqYgpw8qE16BOWR3xG+gqmq5PSTWYGpCJhm4=;
        b=VEMoS17JABk0y1BiPvgCrU7mpyBQ6LQKpvPxe9FbSrevYw65yAiJwOA7KbMt7UNOsH
         BEs34MtjH6/mveLF0k5tv7t+IINdijY4/3PHThMnwQ6LBQVevTOuFhALCCFke1Ae7Rai
         5LBJn3HimETa8vj2idP5hH3vxxJPZDrCi4YZPNwQm3Mbj+ZM7KbwHyoJjDUdkGxqiOo1
         ic4ky1jWkKVJW+a+1D3PrljMevBKUOYtzU1fjjltPx1C6p9AcM+ibDLcJPUnOdAH+qSu
         9d6bzWDqIWU1gY6P1lJfYJp/EDfM+OijQ4fV3Q65qI3fTBHVTuck2s6RRRptBUFgKrNG
         oSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749317855; x=1749922655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayCFwbQaqYgpw8qE16BOWR3xG+gqmq5PSTWYGpCJhm4=;
        b=GX+WpmefVWHuL2uPgk5iPpzLI1LPakyvJ1rWde9VHCsjPjBriGg4kdGYu7z61WwKS7
         SCb6dWqVEyt4FK0lLadDUqQqoATGwa92vvoD+0fMQDQ6Nje9lXvD7JIux70afEftPl+i
         o4gvwm50feMSOAn4d3EcMD0oadv5m8xKfyPThIqRM1C0htQE7+N+wcTiSzf679FAPXwn
         2SvRhmKzS7abdMHIZvIb2w6tlqZ41b8qdhnpUlwoLtuV1NVyoPJEewoqp05pyY6NdN3w
         Lwobq6sHJUPtW1h+R8OYSQqFsuFFPJKO71EFTZfNKE10h/mCGbzt2DycOAZ/cBi2LJpJ
         21mA==
X-Forwarded-Encrypted: i=1; AJvYcCUT6JJy3RwUV+8Dj5svEdhTYAzTuS5W3CDmDOVQccxPyhZ5jGM58agMA+177AkuWaAa/IgE0O6mGf7u5lA=@vger.kernel.org, AJvYcCVXPJUgS4FFJiF8xO9yOFMCNS/tlychMFjmnXSOsfbvD+nH6SEzs4OmiwMyCSd0dPVFg6LJgvLXd+BbtK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/SQOkTXJ74/HHyAKR1e2QawryPfh7tpO2U75BruqziIRz5FM
	+Xwp9zADpONVwjs46fUlBFPX+svTbxNQImQ6sNBXv3Nsrl0HlKI4x+8M
X-Gm-Gg: ASbGncsAa/pr7plzK7zDoVVc2jxo4EcM04WysBRVSu2s9hC0RuJCG0QLnkdre9nk4MF
	yfi7F1FRrDuTmE93vL3HIZCNnt1DYMIPKwyR1w66jKjuwYcHXAhMibtHUpNH9YD/D73hRCG5D5e
	CSIC5CqKIMG/rIyjgpH2Z2UPnq8yiulmZr77bVfX0UciQI7LcwegZG+zI7cSAHgEkneL/JUU0xV
	nAH/izgGLmNxIVT0IKB9wOxXPNcvCGpA2XapK/OecOByuC1PLleVDunLQFZfa4EynPGk01daAXl
	52fwgXza1b4jPjFhbnIWAuJIOQZsImTLuJeacsXDBhaDiGgP2CzlRFS4rMqMWcQGblt705yxqww
	6
X-Google-Smtp-Source: AGHT+IF8HYZHL86TOdKhSN8xXmSsXpoDN0N4Vah9KTbf2hlYodxVc7jqNj7xPRMTMBU3/mTgBb5F4Q==
X-Received: by 2002:a05:6902:2605:b0:e7b:607b:54b7 with SMTP id 3f1490d57ef6-e81a22dae24mr10039925276.24.1749317855571;
        Sat, 07 Jun 2025 10:37:35 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a440cafbsm1144373276.24.2025.06.07.10.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 10:37:35 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil@xs4all.nl,
	algonell@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Guo <alexguo1023@gmail.com>
Subject: [PATCH] media: dvb-frontends: dib7090: fix null-ptr-deref in dib7090_tuner_xfer()
Date: Sat,  7 Jun 2025 13:37:31 -0400
Message-Id: <20250607173731.2363567-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dib7090_tuner_xfer, msg is controlled by user. When msg[0].buf is null
and msg[0].len is zero, former checks on msg[0].buf would be passed. If 
accessing msg[0].buf[0] without sanity check, null pointer deref would 
happen. We add check on msg[0].len to prevent crash. Similar issue occurs
when access msg[1].buf[0] and msg[1].buf[1].

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


