Return-Path: <linux-media+bounces-51446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDP+HzRydGno5gAAu9opvQ
	(envelope-from <linux-media+bounces-51446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ECB7CC81
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14F953012C81
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3831E178372;
	Sat, 24 Jan 2026 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKik73H8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC85478D
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239089; cv=none; b=D4lK7hlaPQYoLLdRP492sO/7bUA8qWZjNorbf245ZhfdLOPsjX+2Y6OyHJJKn6CJVxiU95bE1GB/3iVDcpcjfKq19JZpdDSbv8xtjQ1Zed549iWclC2afcRTH8AwNh7rEJwevMW5EKiBP9SLCnzztKNqQB6JTaewAbCmRNJ+R5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239089; c=relaxed/simple;
	bh=IiJ/cYJ4n0RP+J8Rc7baN81IkMcZHUCVfNjY8Jv389s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSGrmQ9bMIpJcLA836fi/IC0mvFsQfrDap7RH/w5a1lkuqUSwtpd7TT+4iFkqgyzZcLrniLj6ONfcJSgvFMTgoahVrgGD6OeYRG6CHqyPk2ckpEK7nVG/5m0hgqlJD01TzrjkRIzKOvoHMVRndJ79z+Ic9z1qK0k8AxtD5Qm7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKik73H8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34abc7da414so1650457a91.0
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769239087; x=1769843887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65fawTJZ+ikw9zlGDfXENaUkwvZFguR8RCpycg7xIRs=;
        b=RKik73H8JN/GMTPkLbCcZBFaHiJYJPM1d1fx0aKIc2eECHVHmscWafrdETlBPEry9r
         dS0RVB7qTMhVjDgWOgPXYWgPSumtlYGO7eihUz0nfExI3j7Vq7c7b4+2GzNOXw7SQNfu
         CNz03tmpvcUdJPdg9LsbFsbN6yE17qKkKQsS9uRJRIKvTvsGYJjiROpb1HQ4oqxjSAkj
         /n9RBGLjNuUhJ2uogbrpflBPKnK2nCjgh2WeNNBtunCnlA4hlD+Lu0R6zCZQgvXOxnH6
         ahBdi80FbtcWDJzUc3CXNLkDi61SCJnIMug3MX8jtAj94eEOM8tZrVXydVL21F4kQKAR
         Pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239087; x=1769843887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=65fawTJZ+ikw9zlGDfXENaUkwvZFguR8RCpycg7xIRs=;
        b=DU3HcBz0ZOTdtO6Sjx9/kmvK9OKo4T1gcfkzc7juzF3DgJ9/Tpn3YpnMcnMwR5b5n3
         IPGyXMD10tEJs7iu/3yuk85NoWmGpQFBNFDHvsB/Z7x3sCNvTB7SjpsT5cVUmf4kd8f+
         J2cp7oO5PphQMGLp1y/qnboEhM5k0HENGonTCoolwYuLiqXyRKwKsc2tb+eG5yatXqKA
         UaZH0JjECRapK+TfgNYlKGYCvoWjf76Wfl5XaCjZu6/6T5kuqYDTIzUQ43VZV5vJ2wQS
         TLhqqe9CtMbHyAxOMdQQi1zctgqs7upF6ytem+mZZByJtx32F/du2eVr33qw1KTlq/AL
         lyuw==
X-Gm-Message-State: AOJu0YzMOOvpUmWM+CUFEjsRLAELeAKfa08gn3qXdwQjlZUfM0gDgICe
	6BusteGO0BvmfX5Q4vPHFS1Dgs1xANryai7jODWLeyb2lkzs7Y51iIUA65NUqXdf
X-Gm-Gg: AZuq6aJTKEIieCPd0g8Fipp5mVHOhMfwFVlJeTV3lpNK9DxEbu4nFbD4LjTu/eN5Iet
	zEm7v2X5RzHWcTPxLRRdZ3noCCX5+y4uyQKyvm40EHyl7qTiDQ05COwXgvVAnNtlT9eSdYZdOr9
	7Q6ILPW3z8bjjsA3hMTofQyMRVIDX2HjXbSShMrBJrbYGPUcg1OlLLHFPoC2sIi6AQPbOgcnN59
	bjCMwNk62Omwa6MPyaLHqXZDtKOLyNg2XA/Vc7WkglMfhQpyGwZlPj0xJ4OWDyolccA+43/tyBf
	hXNMHOyoALVPmP0u8X7k4Z9x8MKTeNYJC98cImGNk2eiKQn3/ivtSbsebuZsKXrCkXCoJbQn+AW
	PdYQT/OQQ9MUmpc5clKwXnkDgE0LeiYlsAV5Q02sx85E33jFvkpLTBhuxrPkhJuHKfzVS4O2iCO
	EXqfo2dpO4GQ+6Fd4xq1YdDd/RQ2OXbslZyM0=
X-Received: by 2002:a17:90b:2b43:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-353670109ebmr4371040a91.3.1769239087482;
        Fri, 23 Jan 2026 23:18:07 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42e8ecsm3645344a12.32.2026.01.23.23.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:18:07 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: Check for errors in disable_streams
Date: Sat, 24 Jan 2026 12:47:50 +0530
Message-ID: <20260124071751.5885-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124071751.5885-1-bjsaikiran@gmail.com>
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51446-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26ECB7CC81
X-Rspamd-Action: no action

The ov02c10_disable_streams() function ignores the return value from
cci_write() when stopping the sensor. If the I2C write fails (e.g.,
due to CCI timeout, power management race, or device removal), the
error is silently lost.

While we still need to return 0 and call pm_runtime_put() regardless
of hardware state (to prevent PM reference leaks and pipeline lock
issues), we should at least log when the hardware stop fails.

This change:
1. Captures the cci_write() return value
2. Logs an error if the write fails
3. Still returns 0 to ensure proper cleanup

Returning an error from disable_streams would cause the camss driver's
video_stop_streaming() to exit early without releasing the pipeline
lock, permanently locking the camera (see commit 044f54e7c).

Related-to: commit 7673f757858c ("media: i2c: ov02c10: Fix race condition in remove and relax reset timings")
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index b86cae3d2b74..db191dccff75 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -629,10 +629,20 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 				   u32 pad, u64 streams_mask)
 {
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	int ret;
+
+	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
+	if (ret)
+		dev_err(ov02c10->dev, "failed to stop streaming: %d\n", ret);
 
-	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
 	pm_runtime_put(ov02c10->dev);
 
+	/*
+	 * Return 0 even if cci_write failed. The stream is being stopped,
+	 * so we must release the PM runtime reference regardless of hardware
+	 * state. Returning an error here would cause pipeline lock leaks in
+	 * the camss driver.
+	 */
 	return 0;
 }
 
-- 
2.51.0


