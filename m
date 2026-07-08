Return-Path: <linux-media+bounces-66986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ijhiOBxKTmoQKQIAu9opvQ
	(envelope-from <linux-media+bounces-66986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2E17268E2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qz887jGf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66986-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66986-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09D823030134
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3424611CE;
	Wed,  8 Jul 2026 12:57:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B944E05C
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:57:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515456; cv=none; b=HwBADA+PLcTfRu9aHbER2iQ/1wAk1A3k9zDs2CEY9UlgmvLx9ND4GDAMtBbxJud3d/ApZuDM6Dfp6YrsxOS2ZkDGIBd+DWTdlG1QOTm8znGIcX4G2o8cpqePz3I3pdsi1QeTGqxKiXKrGhSfyRKd5mvzsuv+Fa1SUC/kP1p3sGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515456; c=relaxed/simple;
	bh=stG1GSiAq9kc9PkfTMzIAwViIwPpqztHyLvOTZk8X8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sq6XfKNZXlGW/IWqhwkGVhEF56d+pr+G6nn3ZTwmhY6DYtXF3TzJ+L021YEjxlBZBAj6Lxqf1Mbz2Qp/aqturdp+xa/D8Tdwsd2v5X71GbX/bt4o+Vs247tnPa7U7YYatmBehD8VbXPMVEwK3OaHjRdH+sdWSilKvdZg2MwL+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz887jGf; arc=none smtp.client-ip=209.85.215.172
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso362812a12.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515453; x=1784120253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpzWcq+2zDd7uj1PddWt3e1wnYuOHWihKuR6q+QUJqA=;
        b=qz887jGfBITLUzRFd34zxzK/8QKBKuLIDIdpXkhuVkr9xvnwRIX3+0BejVFvRM8qIO
         QjctG7YSFnsnt1eoz4QyjV5vDRV7K6mcPMDxVTvd4/M/mGGOj78n/gd/86o8eKvGJ3j3
         XRQIuN5+gRv2hZP3thdpeQXwuTDD6R9pRuZT5vyF3wGu1ytxXsoKvm1lBvQMxzs1ZEtx
         zrH5KyqkQIv4MGDUrqDDqdTeccHjqIphoQ2841fhPewFzzar+dkrbSQIW4nWuMTiGoiv
         mumnGe5nxPwUrMVF0sopcZBOiohMLlaci8jUKh9udgxoF7qah8Em+pyZJivxbhlBSagt
         K/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515453; x=1784120253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpzWcq+2zDd7uj1PddWt3e1wnYuOHWihKuR6q+QUJqA=;
        b=aQcAZRNqs/KnLd7Qn6ReNDj8GBfhnv0TEx8hKHa60bbuzMk0EwcKCiBw8/rUlCIJqc
         HIUzjNkIHchEa4zH2V6NLrLcBq7RappSijIjw4rhTC+CHll6JPRC9l3NxrR0Q/9NXDZZ
         Vvj/23DN/A282QL9z/YmhvN1iw/gH9gJBIM8M5wZ58y4uqiilcz2OOmShcVDEZTO15Y3
         fv7hCM6lhW7DSqppHVvg1KI2L1RURAIaHsmDsILB2qibqActWu56FyurvBlmWLmSnuQP
         l+dtnkAIf3Pmb35AV3+DmVZE2UUEFra/kEguQ9NNP0+FUJVFlHs/nCqGiIPK42MxiLZ4
         WvcA==
X-Forwarded-Encrypted: i=1; AHgh+RrHASWaFyhRPkN2LWDEBj/MabFmkZVxdmxXyke0PbtrsE53fcpd8G+wwVo9IA0sRljfmxkqSE7qFYGigQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznvbf9i1xX6ge5h1aAerSpcnAy8A9P03JPyp+a6h+NmnL3jEKx
	nxhj36ZtU6FCmpsfpqt4YGIXc3oj0honWr/wKzpjlu7N6VKn3QVMKtVn
X-Gm-Gg: AfdE7cnU510WK7nbGWwI0E+TqcvZl0Zda9S9k/3dhQqqgGy5S6GIJ7KRBVgbzWNbT29
	azV11sHPp+joib65BilE5xKUxn4NMZMjxPRKX6SQ8spszEq2nej90Ih4GqYxbwSj1iZDQathOp+
	Y/B+QOLRKopn6Lalt+Rg3aGvYmQkwXztWua40iD60bKfX/kSzteukGOjm/mj0N10hEwVWPZcfrl
	bfX5aOdntDzbvWnIumQ5gu8ja81IWsu0hovERTLn4X4XE497GslaBVkpDZ5B/jxSp6VMS8Jw3Mp
	x/FgqmwCq0/RzTgNc0RJMw60OjlCqpgnX012SoQXUNgsEX8VHgR8JF0nJc0TIcnHAKphnN5RxGJ
	SA2Zn5PSDqwKuSV1nKyER1IIgmECK1C41LZNm0OJ3jlfbMPQ/0s3KEfkQppJNcXPKswz+11knyM
	tCoEmddcTx0p0Wp1SSlkLFOYae+9mrT7l3B4ToS0iet2E=
X-Received: by 2002:a05:6a21:485:b0:3bf:5ff5:2b0f with SMTP id adf61e73a8af0-3c0bce1ec42mr2812145637.12.1783515453001;
        Wed, 08 Jul 2026 05:57:33 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm30299087eec.29.2026.07.08.05.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 05:57:32 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 1/2] media: i2c: ov7740: fix unbalanced pm_runtime_get_sync in remove
Date: Wed,  8 Jul 2026 18:27:22 +0530
Message-ID: <20260708125720.27156-5-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708125720.27156-4-birenpandya@gmail.com>
References: <20260615210412.34567-1-birenpandya@gmail.com>
 <20260708125720.27156-4-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66986-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C2E17268E2

The ov7740_remove() function unconditionally called pm_runtime_get_sync()
but completely ignored the return value. If the device was already in an
error state or disconnected, this could lead to an unbalanced PM runtime
usage count or attempt to communicate with an unresponsive device.

Disable Runtime PM first, then see if the device is active, and if so,
power it off.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 v2: disabled PM before conditionally powering off as per standard pattern (Sakari).
---
 drivers/media/i2c/ov7740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index c2e02f1918169..2d29147c0f647 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1122,12 +1122,10 @@ static void ov7740_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	ov7740_free_controls(ov7740);
 
-	pm_runtime_get_sync(&client->dev);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov7740_set_power(ov7740, 0);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
-
-	ov7740_set_power(ov7740, 0);
 }
 
 static int __maybe_unused ov7740_runtime_suspend(struct device *dev)
-- 
2.50.1 (Apple Git-155)


