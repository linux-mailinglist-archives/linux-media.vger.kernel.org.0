Return-Path: <linux-media+bounces-64152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhjLC/56JmqUXAIAu9opvQ
	(envelope-from <linux-media+bounces-64152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:19:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D0653EF5
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:19:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y2ssxnLf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64152-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64152-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B25C3021678
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24FC3A9D9F;
	Mon,  8 Jun 2026 08:17:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93B3A8721
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:17:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906674; cv=none; b=YNVRORNzow05oevCm6WG36uOHvcuZeqbnmHPg2tqgwvk9f8fqgeOmtmb5peY7nQWpZqnEegFlNwIMWHqijkZ7FB29anOUUimXNmALZa+nIoaSL6i05erDrb0hp/vEZlADH2HNLDYKP3Lp26c9mcC4YErW2oYW9im/+63I6+rQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906674; c=relaxed/simple;
	bh=40ZxnyrUaAHdcI+eTW6aNV5PfIertlPm7WF8EsDZzB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g4qgwg9VH+uJwz9oYLwcF55MY/7n7QHgz4Vxs5lA4qLHi7MSZWZ1AZoU3e/3GEdbMokQO9JYW6R2ET7EHOEEi9H8E3iVf4pWyemn6KzhvMA9GMRUZXXmMQy6q6yTLC24Zv8+yfa/IgFQNodutvU6XPOVTs9jFZ/KrGOyRfIgNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2ssxnLf; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1370417c01cso5256012c88.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906672; x=1781511472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12KJd8jmEDNc3peQBhWeVZHFv/dyQimGIps+u7jJr2M=;
        b=Y2ssxnLfDWJhLo6docOppjn2apJEyLp+mJOeh/XcEOBlSKnZ/Hy2LYtSik6zNlBfer
         R1Xxm86NG37KKKya1g5MZCqao0p49ZzMSxQUP7VsAM4JIHrPebd2XBkdcxKBA7n7LlVU
         d01YllFyKazgebpmSovIM2Nl6ZyNUPmvgimqyFYfoAnCKjCXVkdkbOQy2G+OE7d0mql8
         OrBOdVGPgxsa5TRFHQOvEzo4fG9AXCZajoLcKMb0fqhT04Zd41ivSMjgK3DLE7+/kR4d
         31luDdHY0sBOuJ+xHVEmzpuTWhwleLCVq+29kMfXbdFkIJR1257XTVOzzHCA4lo50xIM
         uogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906672; x=1781511472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12KJd8jmEDNc3peQBhWeVZHFv/dyQimGIps+u7jJr2M=;
        b=SkGIH7/kgoLnCUjD37WQeYOsPdwmZjH8+a/UhJ+zF82giHfsVuX+ugXTT9GQxQH/Xr
         G3ptSWokwGoAEUmxbojdb8nos8s8NKbGd8k6m2EjeL570pm9JSJt4LJuMNLogX6pbxE/
         sJZCcpxSvBFS7bNPF4wAg7PlkvXo1Nj+5LRl76/XO5fdS9tNaBSgVzX/c1ss/FPa0BlQ
         OXYIMA3Q9ydXIhjyNtnGOd/xlDSp4eFp2+4aiH817EFEXratyF+DNAeTSNAjQ7QBlx8W
         kWHMWyj3KeH0n7+f1QtrDP0B0KSixEmjrsaEcwjkjUiOfc/JM6dQuvzZbe4L1Wd6ALqn
         Pf1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/UM8ks121mL0a1P4GZ8KG3et3EnM3OlrDlQdPBwyn519GLSnFROiZmtEGEcAPIwqlA5LAZcBxNPZqSQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGQ3au5KecEi/8rcfSB+1ayra32Pt64DoBeS0Zl6mhcITjFli
	kW5lslbArlrmZFuyKQllpywoC+e4fUvT+rNDBSKuMNKI/X+MNytPKsIz
X-Gm-Gg: Acq92OEFaCwY8hdmtIq0KNfZJQOiEJvfg7zzaEifT4TataP3BUNp5exdsHlUHbifdus
	ijYLevdOt0sOCElCeswFQ+Rxt+7X2m9Jh9rxMgG9YopZ1MbJMik9NyZjLMejukmhc9keHjssn0m
	uDqMgz8+JzHeLKnZp6YmpMGVs2CDDXns8j7M2l/HQNBhesUn7KcdlD/vnT9uQPMA6lITQ2sYQnP
	HBuFG2pSfyXCQMJ/6Tykt2Lfj6EyYyFDR64/Z4LvfOSeYQKqb5fu6yk6Myv0MO8DQZuHWjhwWHo
	MP1trUfiC3Ny24ajvaJhoS1ELAFI11iM/w3Y7D+c1IwirBhdiDMRAwaqzcrzbGRxdQqJCz8rl9E
	iYRgjB9dEoiSAGy6sCZqAYqstArJrQxBTrrQisPuKnhjN2EEPEriYdngukc8LeELee6ypRgiupL
	B9i8tGEvUBlc4NKSbPQN8zQhPM5aTTMiWGU+L8JsXIKO2yoENYzPU6sbmF0QhVG+/qRA==
X-Received: by 2002:a05:7022:98e:b0:136:b370:64c5 with SMTP id a92af1059eb24-138066fdb24mr6558060c88.30.1780906672171;
        Mon, 08 Jun 2026 01:17:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:51 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	busanna.reddy@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Mon,  8 Jun 2026 08:17:21 +0000
Message-Id: <20260608081721.82846-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608081721.82846-1-dennylin0707@gmail.com>
References: <20260608081721.82846-1-dennylin0707@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64152-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2D0653EF5

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Use a standard rollback path to release the OPP vote when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 6d3339423eec..3e18c6998f92 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,7 +78,16 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	return pm_runtime_resume_and_get(pd_dev);
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
+		goto err_opp;
+
+	return 0;
+
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
+
+	return ret;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-- 
2.34.1


