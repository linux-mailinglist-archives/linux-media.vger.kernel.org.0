Return-Path: <linux-media+bounces-64931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m/m+M0ZpMGpTSwUAu9opvQ
	(envelope-from <linux-media+bounces-64931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:06:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7D68A1B5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:06:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NgbA7YaZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64931-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64931-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA43D3125C1E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C743A6EEC;
	Mon, 15 Jun 2026 21:04:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985B38B7AA
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 21:04:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557468; cv=none; b=Xe/YtqZcVhmC5fX6On9Cx5vCAgX8zYEGiFpy6ZdJQoyNXZiP3KS7zr0wzQR3eg2NiYSPhmy5KSilB5cAU5gVktjfjWBN5hRMfNTBG5+FYvhg7AmzSGJNX8X44Bok3V598JW8MMwP3z8Km3AD7APahGIbgJ8womkM87Nu9CqKjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557468; c=relaxed/simple;
	bh=lL19Gx6NTY1hf9dAI3v6q8ep3YVk2DR6hugL/sunLsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAF+EO10sgO2ksIRpfPvhCX09W3knEZSDH3lAEA/KqNxwzd6wH8/xY+DWs6mzfvNIb069jH1K8bFvmG0ACYF8lifN5Cg8zNEY2vd82Azkf1grtLyvlcZdQTzrSrYOiZTbdBgTp9QFPZr8j9NQinNIuHCMw3Nb9wFOks1dtFlSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgbA7YaZ; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c3315c5dso40943905ad.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781557466; x=1782162266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3xaPaokdrS5QLN2+7BdcQffIRT1g0s1bcjgnu2FVGA=;
        b=NgbA7YaZhQago7L0OTAHi5kqPj0gqOqQCBNBDFewoiEeZQA9B9K5tU9HXNzuG6TAPA
         1fq6KTpFIbOudnwLmqi05FUzXlYtt2HzBdcQnsD6z3y+8MWXfosFW20YsEhuYhKwGDLy
         HHuoRsGqJuwwhRfMrqL05hWlPtZ7uy14gyTg9hq/m8IbvL80PZHEAL+r0dEUJ2k4anMZ
         v2jAKwbYCrBwNL60mWY6TVGalKx50mUvLqzl90zWQcaOiHiTaUz0c1+9Faeh5rRjq7jG
         ipDhLjligy3OPugYZY+489B5Dl9Q4PPhcmtwT1QF110NPuDWnz/9SgcxyfI08SfbBymc
         9D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557466; x=1782162266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3xaPaokdrS5QLN2+7BdcQffIRT1g0s1bcjgnu2FVGA=;
        b=AAb4AzE7By26nX3BDPChTUjnszyJ5itKH/31hTzUPRTJEjuZF+N1N7wS4D84Q1g8EO
         Q2WVkGEg/MjbNUgYZjxFjo4hZkjiqp2bgEQuuOiObmp9rdTx0L6lg2pJ+bTwwaMnBEU2
         5U+MbwyHJrviyMRN4jD648GsJOC0PzLarqZgobV6+x2uevluPjE1IBdRbMAzwRvJA7kK
         st9u8576NgVCZDAutpM7IM8g8JyDH/Sk3WI2OthzWOKnl48YsDKFztzPH+QTpbWdfhm+
         g67jYNK0BDoxyHWezhkjR5kStpBgIhnYTwvgZUFbVAK5SSWEeCgG/ZwA/J9ewu/R8YGv
         pI5g==
X-Forwarded-Encrypted: i=1; AFNElJ/V69Por/JG3zLdiKsQO3OteKl2ukQfLhrT20MLnuv2sHo6jOjwyzWv6MjuVYnDSUG7pa94MebR4eho4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySmGeRRSzf+EW7PR27IoPFEoL8N6KfxuFksnC17+c3BPOBJs8E
	ViC0x6Qt14cNW0F/U80xJWfBz/t3SEzht9ZQnitBDGQfzdTxy3jvd2yg
X-Gm-Gg: Acq92OEYejhe4vn6aMbti9jknOSqpUzcrrE+6Qvrg2Dld63I1H+DvsPxWt7AySBNRL9
	uEyBlPnobo9AYQ34naAdrTYOHO3Yv1pIOxdlqQ8bVMrGROYUfLpGKPJ750jXtZUdVUwMlqVMeBS
	6wGvMxi5wK3Po0kNJoahSSp6PgZq0XA4ADDNenYT1Cjn4EctEXuAOHUwLNw509ko/RUU7OfhszV
	KZvyKl2fgOyzIL9fpFbso0xi+VqidVXd7QYKdKxK6CqSValZpANwGuHo9CIDQrwnxK1Vjykg/2P
	MCa69Ryyqwq7SuaArp+MUcx5edWuMLzGJboFdh08klHjb7XcXHdZIqc60O0AJLPQHHZrXD3S5tE
	MB+4F+ipWxdEdGDNtBZkhM9RN/tZyWc2e2PB/CK4hSG/6bK4qMUhxds2kLZlsuB3KfK/OmAmEAS
	yDSd5soWx9CWAlT/4qSSYiGJAq4/0ySn6J4hSZf0+9TE2nlOr9AVoZ
X-Received: by 2002:a17:902:ea07:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c41050b2aamr180117105ad.4.1781557466323;
        Mon, 15 Jun 2026 14:04:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433747ef4sm110934085ad.82.2026.06.15.14.04.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 14:04:25 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 2/2] media: i2c: ov7740: Fix unchecked pm_runtime_get_sync() in remove()
Date: Tue, 16 Jun 2026 02:34:12 +0530
Message-ID: <20260615210412.34567-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615210412.34567-1-birenpandya@gmail.com>
References: <20260615210412.34567-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64931-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AE7D68A1B5

The ov7740_remove() function unconditionally called pm_runtime_get_sync()
but completely ignored the return value. If the device was already in an
error state or disconnected, this could lead to an unbalanced PM runtime
usage count or attempt to communicate with an unresponsive device.

Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to ensure
the device actually resumed before attempting to issue I2C power-off
commands, and safely put the PM runtime usage counter.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov7740.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 62c124a1353a..6b81882da307 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1115,17 +1115,20 @@ static void ov7740_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
+	int ret;
 
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&ov7740->subdev.entity);
 	ov7740_free_controls(ov7740);
 
-	pm_runtime_get_sync(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 
-	ov7740_set_power(ov7740, 0);
+	if (ret >= 0) {
+		ov7740_set_power(ov7740, 0);
+		pm_runtime_put_noidle(&client->dev);
+	}
 }
 
 static int __maybe_unused ov7740_runtime_suspend(struct device *dev)
-- 
2.50.1 (Apple Git-155)


