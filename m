Return-Path: <linux-media+bounces-35506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A628AE23F2
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18CB4A6B49
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5D12367DF;
	Fri, 20 Jun 2025 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR1JBimV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7F231852;
	Fri, 20 Jun 2025 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454547; cv=none; b=NCTw2UGVyqgMowNvje37gc53OPi+A4B+mMc4MExnFMPPyh21i7kX8F5wbO3gYDjRQZzqPeTYVOvUjOXLiG2F1KLwvQLpe3OcV3ChZGUOQG6iIB2Mq8P7AFYx5KExVRft22JX3O7U5EVWNSd6V0vj1kZ7utZBE8ugq2EHghXWP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454547; c=relaxed/simple;
	bh=dV3Jy9NnYhxv9pwS57266rWpyqIu2BA9UUDcU6w3+3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ARcq5AX6N5NGeiQEHFGvmhN8ACeYGp16Qqc4ZthfEZL9PET7pei3eOmlqHPBi9W3JzsR1vRujWmXgceOk4BmBgL2svlkWXYk9R2ixIHSviqFyTkKS9KSnbaNkKBq9xVJeh5ttM5hMpyW/KB1kKfSa0+ZZI746f62SzNkWp9fnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR1JBimV; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8276224c65so2498716276.0;
        Fri, 20 Jun 2025 14:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750454545; x=1751059345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxkVpxASpJDNQW3tOLs5qKIfpGXFz7KzoPzNyvaDxSs=;
        b=UR1JBimVjVXxBEEiagseOKsxDNibcNmT7mEOOx4sLK6OAVdIovieu3ygdcEipzzNeR
         qgQXslXpXO/nlfFu10x6k/xK7Vjbui8mMoEuCfgno1N4rFCZToRz0uy13K1UJ3qGQUs3
         N3thNPbNJMh06VelubAOUO3ty15MX7COQDG8p2v//vD2AQJ1Uuch2UWWgyqNkIfwfn35
         0amXiq0Z8JllF9K32TTvBPCDbFDb8N719cAG2VlNYUbJNf6MHFYO7lUWM0z8Q1N8r5VW
         bDGrADIKOxrnMaRlzHbM2H2+k2vT2/z5JngOMgJO9waA7wcKU5fCoajaAL5y9fUJPwg8
         LtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454545; x=1751059345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxkVpxASpJDNQW3tOLs5qKIfpGXFz7KzoPzNyvaDxSs=;
        b=GeeZ3F2ubgIWeOrfLlxRTNSGPmmYliXTZqYAHI8AfZ5DYb+y7UlP81rtAqvYjET/D8
         LYb6Zb27gGKJfJqmYL7Y3VStbAaswRZ0HjYp9GocKvjSxYr+TO9u9wy9uYEyXZaFxE+f
         8rC1EJHGjzxHvJUpTHARHC1rnu0KBoewFWBEycL3kOYOtiQCZdtg2+R0RljsmbKhE/DM
         OT1uiyNnKbuq4ciKgGH805LDNm+clRn8k15dpye8Crtua8Dsoy7UE9iBjo3BpGi15qUm
         eMGe4a8CPtYABPRwMaPzqEEVsoMOtfQVZ4txmQ7PKpgDcDi78NlMbfn1AWSqZLbl9rzw
         UkOw==
X-Forwarded-Encrypted: i=1; AJvYcCUPVpnwNlhY/BWguyi6TDx0+kypMKRIs0yQL9uDA0b8xHyrJ2JoA2fd6YrIYu2eLuHi20obtDticmlw1qE=@vger.kernel.org, AJvYcCWKGKiXZ4GSG5pzpIgT2GgY+v5mKwlBd1fPm6ADJC3q12d5TyRZqb26JXm9/qJ+C7MMv26lsnP+wU9I5Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx57BA5I3VpLA4W3nKSsaCFv2QfnEofkf1BptEF9tE1sITvDfS
	fS9qRMwU0nk3SFEkDTnI58V1QZEt42YwFYxN0MIB2ufQl3t/KFoztIJ9
X-Gm-Gg: ASbGnctcKGuYZDyCXoL/03P/leH7FVM68pPwOSNAeK6xAVa5LOHSumOiJvzgcotZomb
	OrMtyKri0mQ9x1yTSk9hjkmHnT21bo24FWYOLxcMDyP4Cihu3rFuMh11gQoO0BbTAKdFLRb7fPd
	Qzot/zmKqppErepP3kNXezpQd8Vo7zvkpgiKZdB8/FOwTryY/wU5XL6zN4QHuCQZiP6OT79vJc+
	qZX5d3x7HRAKByDVZN4FQNFfY01B/V69YmxZTaB8kUe0EOikrJRhTHtdlykaZm+Tgd+ZjDzRcU0
	EsyIewaVQZNbkb1/3GoV8Vx6H+ztn+h4SBT9ywN5TKPqBV+1KhexpTxh6PMW5Eg3+VC4A5hSZKW
	e
X-Google-Smtp-Source: AGHT+IEs4dDHr+MA34wrmGiZCnGhbnZSFLRHoLgIwtLun4PtPz4LB+7u9RKBzziDkVLaUgHJBH5clw==
X-Received: by 2002:a05:6902:2081:b0:e82:12a2:dfc1 with SMTP id 3f1490d57ef6-e842bd3372emr5781504276.46.1750454544998;
        Fri, 20 Jun 2025 14:22:24 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842aaf16b5sm857151276.16.2025.06.20.14.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:22:24 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: dw2102: fix null-ptr-deref in dw3101_i2c_transfer
Date: Fri, 20 Jun 2025 17:22:22 -0400
Message-Id: <20250620212222.3204215-1-alexguo1023@gmail.com>
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

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 7c9d09d49da4..8f694d8d52bc 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -562,7 +562,10 @@ static int dw3101_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		}
 		case(DW2102_RC_QUERY): {
 			u8 ibuf[2];
-
+			if (msg[0].len < 2) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 				     ibuf, 2, DW210X_READ_MSG);
 			memcpy(msg[0].buf, ibuf, 2);
-- 
2.34.1


