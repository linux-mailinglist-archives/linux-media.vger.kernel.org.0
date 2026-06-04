Return-Path: <linux-media+bounces-63772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfQaKXM/IWqhBwEAu9opvQ
	(envelope-from <linux-media+bounces-63772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:03:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521263E4D0
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pbApc5ei;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63772-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63772-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 048713083ECB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A16F3FB7F3;
	Thu,  4 Jun 2026 09:01:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0118F3F0AA4
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 09:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563711; cv=none; b=GjPR2V7j8vh75+mt5UasHBGBh4CntdhkzIM/KVKsQH+86rq+DWHqptvkOLgOEUHLtzr1Ri4baTWGc1XOLoRrufFukKnv5QD/pPKuGEpHAM8adBhXCxt/t7m/CRk+jbpUidkFiWRhCZrTB/sLrq9/SLgehOakKE8ZYMN6yNH1R4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563711; c=relaxed/simple;
	bh=tevFvEzdnCkxOqdw10b+jO4O9VWLjSDW9X8srrONk4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjQmEQpBx8gt2J28evfqzMJobwz9JSZzzIrBXQCZDXwJr4hvqg6wmYzNNzKq7v2ctSFD1WbwE8Dh0IeqFN5e8ewZHd6lfpAfF9tbHvanKo2VFOMaY8iruzBBdDWxM8jZdcazJe+b7rBXd0OhMwbyfgVoWcW9EbVVq/5moyIBdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbApc5ei; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304e83724bfso491349eec.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563709; x=1781168509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpExvBqJEwYgCOZtnj17mLYXW37IIUimvoP5yk4TgGc=;
        b=pbApc5eim+XP8m41vIx/tZRlpQcSYdQUBxcwM5FOCS3HXFlRMxqWPlTruvFjfQO992
         yReIc8lF/B+xXSOw4D4Za2nuVdEyGIXNP2h7LcH+2Y1CR/u2cvUvAYqHgbR2e0hjXZIw
         KTKbMwK9qrpaQ6ueAaAdmTmJtW/dz1TWJK1mg+LY/Omwkft9IDwEzq8DhVevI192xKi+
         hNm1mMGYx3g1DHIkZjzXupRO77TLbnDKtA06oYbxHuyFxwxFFnBav+UXqkyBOuhgh7dT
         +GOWAuDAeLdzaLJTlsdWBjaSGVLm7PNQ+WVwBwLmIIiuCRMdY7C/5oX/fQsvRp5Aia/g
         rhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563709; x=1781168509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpExvBqJEwYgCOZtnj17mLYXW37IIUimvoP5yk4TgGc=;
        b=sgBVFdnmBTuddzoWjHfw6RNFFNphKDJLE8AQbbxom3mFjO34LUH6if6IC2UtAJTjmy
         hp9/VrdQQREbYb6c9U8YY6oyjbJmKWqWO4Nnvw9zkOkPBJPBO6/1bOkkxcYVr/HeLUiy
         WcqStd/BnNIsiD3YWASvobFjB1cjO+Sw9KrnGI7iFOblpx+EgGdehGnyQHxv9BxoisuZ
         k65addUoren5D2JMR6BYIBVvsntsuHlCd2xWhDT5tbPn5n9/m6w6mNNPek1TpvoYyn38
         TqJOanhNrEnIh9HIGJDv/QDZNSKA/MMSqzQt49NQ9eCJPrFQfLxeZ5cSbJ1fM1Hyd9om
         YyFQ==
X-Gm-Message-State: AOJu0YyPcW2BWreOqG1/p6cs10tGlK/W3zuvrQechWV3GRtCwlbMuv9H
	ZBjzfw2JP+6R2/9d0VqxUXH9C6j5hehf7+RUtaUZiZXPbwyPKYMfdIw3pSFQN/At
X-Gm-Gg: Acq92OEicBJFxv25hxmqphW3iY9/SarsNdCly84A5TTfLrIc+kw25kpPy5lLWouj2DX
	WxE8HZDd9AGMawGPPexUfJNLg5wl3gbHEcazst/03zYZH3mkQork5/Avtckz4O6fj3a/oGJBpxd
	Zmy2lR7KRozyMRLIw92j1OuZ8U5Knriffsr+RXZ/DbTL9jXgx14wW83XDjFVMCRphGeG1quKo4m
	1lpSToWzGsvpRz/Q9CcS0OymFW8dd8t/83K+Oj9YHY1d8FNoUM3mh7OSuVKBhj1foZ0N4h0SGaB
	GC8KBCKhfO6e1X/BPOSruLmZ1Z0FaEMvyEig4V/Gnz+50urYWYJB52tG0sA/XiWHBxad0BYQzUY
	NC2pjOOEB0gB2T9xSHAsTJiqz1UPT3zxE3D6XOoDWyclZdQGTRAZWEXPEFX/2ylPnE24sBekogB
	KLSO2/Yrm4PdJndsEtnWwOmWQLrtMfP4hx8VJfM+B4JVkTIlgD/O1zfftry0KLczuQNQ==
X-Received: by 2002:a05:693c:25c8:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-3074fa654femr3760537eec.7.1780563709153;
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 1/2] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 09:00:58 +0000
Message-Id: <20260604090059.46355-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604090059.46355-1-dennylin0707@gmail.com>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63772-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6521263E4D0

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..f5e3341e1430 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
 		return ret;
 
-	return ret;
+	return 0;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
@@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 	int ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
 	pm_runtime_put_sync(pd_dev);
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1


