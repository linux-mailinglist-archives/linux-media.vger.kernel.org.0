Return-Path: <linux-media+bounces-54845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO0tCgG5q2n7fwEAu9opvQ
	(envelope-from <linux-media+bounces-54845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:34:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCF22A49E
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC5B4301FD71
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 05:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C098534404E;
	Sat,  7 Mar 2026 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxZ8H4sk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC128506B
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861625; cv=none; b=eRzrUwoRxp5xjKI0OaG29IbtXbWOXNGKTJKNQRD2mud2i/RbBHKh6spoF2k3gSmhApU3xPeewFk9Ji7totTlNsxaBqQn+DFZB3wF4EZ3Egy1SDA2nGbCzjBVPReUYIqZCAtyj3T8vpxHO+zgP/wHZunDShB4xjFb0R3lE/wFFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861625; c=relaxed/simple;
	bh=DGWHSyTFVRKcueyZ7bXDVwwm7kMw9KAVUmrX9Vd/7Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqOiVwxWVoXIRotBAaZ7JiYcQZvK2isH91536R8rkfB8xFU1sDkQOzWtjyz0il6E/he6hGEgHhS6a99qU6/MA8+Hmtf3Zi8BGQjNcFiBruY2eQzD28SpVT8OZtXMjvpoOM3Ndpqg8ypIKhX7ZhawxWcZEiKAggj3+lgKWsRV+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxZ8H4sk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad21f437eeso71187085ad.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 21:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772861623; x=1773466423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1V4H9atg5j7GogEbH6jTkbiS/6ESGGAmZmDCJhkJ3I4=;
        b=CxZ8H4skKmi1pGgJ5fP8lLMsDbIyxah+e+H2S9VX/S8JMZaUZZTJrtYoWmTDtIwexm
         UK+N3SEZsBZeyPNT2+npLBk31RS/Dvbg3VVrw25vmZGZbRpReuULnGK13aBeZkt/SYgH
         97ch8rv3mLy3HZYDWB4+rsDG1AxrAniBn+uid8vXB+9Tv3UTTAEeRgxGI0VNUMC9fxiG
         PSs7CbyLrx0V7BFTG5AHwjbgFfQUEUpma+v5CbIXSYgHl9428lXOnbGexLZrCYm6IOrv
         O5S3bCnUVSgKQ5+ovAlAscUCLzHRBY7tRoQjEUDgTpSOvpDmgDv0Np1uIVJGUYBRNICT
         mMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772861623; x=1773466423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V4H9atg5j7GogEbH6jTkbiS/6ESGGAmZmDCJhkJ3I4=;
        b=ZEdKNU7etHFOAHjiUqLGxA0e6/DSV791oOkqs8QkzoAHGyyQwDHQhZLdhSUDYROBmD
         tGhGcQk8CWBvdAbv/a+7KP4a3MxbaTgRLsDA+d6fYnSvPrcPJlV15/7VR95S4+K+kEkq
         9++Z31g8gOv4mKvDwIT/n0zGWBBeQ9K51WJyFdaMoVz7DI1msyo1bAN8m3buomL0aMm8
         OB1XP4+3KouNT/p2po2FrWblGDYELtIqmEAFawYS2wcOq6xDq01U0dLT0Sjlql8I3HGi
         F2sCVCpQUEYokJtfF2jnSXXFVgKgVRf10xga3qrfd2AMGn8jBGGEa8pQuebn+z/7aA9l
         LBWQ==
X-Gm-Message-State: AOJu0Yyl9sYNVP8oOpJa1tndedCy+a0GqG8bEXdbyKvnKqn1cI1jBwvE
	k3NihjM2KW4t/hqpiAKPZpW3ohTAGrKLxXAWJCzZ9VhG9KpQbCAKuzGm3NzEKfZKuFc=
X-Gm-Gg: ATEYQzz6jmJmQW/Bv6bHLeDoK0yGH6nhFJyDEGzJEXdizYDOH9xFLwuiLuWveH3T2+Q
	iYH5ws3vAYqt42Jyobfa3r6nJ+rvSwCgtLHoJP6P4oWc+jd/91J7/nuvvR+mn+BYmno2NIERjz/
	Xuof9xdQQY1ZEbE9qKBjNL1JuR+xea09SKDXUulc4Adru0kO7egBRQQeOKw5RC9iSJYfOSsWd03
	GcjIBuyUC/wVEzPwYZ0VHXqXoEgHugfjkWiEToHHrUT1+x+aN3zbTjaxQpaISELLRjKPalEdQve
	cGGTCJWpMHTGU+/tHQA+La4hKhln6lxvMlaXTlNfuJVX68txOM8h+GFN1mn28xD61Gw26X+w9DB
	kF3Zf8AY9cBUvRPZf6UbbFn0emOIhvWk25XmdAYGA8PAYIMO4Pjc8RcD6u82dN7foA5DeHPFPIV
	d203bqDE2fcd5S08pdHNYKc3LfKV+ujaA0wkPI7OhkrdaUuzXb3wROkBeDO4qGRlSTWn2nagvge
	3sG8C79XL7Rlckq
X-Received: by 2002:a17:903:3bd0:b0:2ae:5435:1940 with SMTP id d9443c01a7336-2ae829ec14bmr40642805ad.20.1772861623278;
        Fri, 06 Mar 2026 21:33:43 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585a8sm38447325ad.7.2026.03.06.21.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 21:33:42 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: media: atomisp: i2c: replace msleep() with usleep_range()
Date: Fri,  6 Mar 2026 21:33:11 -0800
Message-ID: <20260307053311.15746-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 75CCF22A49E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54845-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

checkpatch.pl flags a warning for msleep() being called for 5
milliseconds. Replace the msleep() call with usleep_range(), as is already
done in the same function.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.53.0


