Return-Path: <linux-media+bounces-64150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMLxGL16JmqCXAIAu9opvQ
	(envelope-from <linux-media+bounces-64150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:18:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C0653ED8
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UpFfK6T1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64150-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64150-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 473193014687
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835623A59B1;
	Mon,  8 Jun 2026 08:17:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940573A1A26
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:17:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906672; cv=none; b=uQxb6uhDD2FxW7B5tz+J7N+ayZ6m+lAJw1yatjyS/4T3I+nmUf3kD3xg4Ek/8nRFE/XH8tnJ1jnfTa1oSYd5qyvr7iSZXSs44wgbQa8rISVxEsBU1n2rgrkrGc57nlUKez0XyLLtAlD1vZdtzry07aLZEhBcGBEo5YPmbKR9E3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906672; c=relaxed/simple;
	bh=Li9jQWFybM6msVbXCcQVnQCT4CCsaZxeG2KSupr+ghY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dczIuIqdduLRuJhdGj4ImaQ+Nfr2e+HV7fyRCIL7EPY8DmqjzvP/9OutawZhN6FYPbuyOlP3Yp/+Hzc7XCGLWeoxpRtBsswABrbvFYkOn88floGGwaqRvfxBNbN6JtfhU9d7b8xtxZ7+wWDfg1xNkW3AOluaw0iYWlYEw44HxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpFfK6T1; arc=none smtp.client-ip=74.125.82.66
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1370417c01cso5255972c88.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906670; x=1781511470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYTtDzvbWIHpiXUZf6PfSqu1DYtlFSJqScVaIHcDEFM=;
        b=UpFfK6T1z0Sd2VNtVAc42xFKxZNFPvxJKMjD6kBzQ02yrHRbdM13qIHYeLz5xNKEuS
         N4HjQcqH1pcsP70Td8y8DEEx1W1QwCo16Ufoe5ZngLjwgMw1cFmteDk9dj6g6jqvomlf
         2V93f//EOkaAETeFcQp1DymZtjIknuPhKf8/6Ud+DVoSQoX0Q9cLhD03Ef+4M5LeNmWx
         0JdSDvM0uH4ApZbRWogfsvhgZzerjlPWc/ORwatbid/RQhtUMgjS/FZDXUCWcnx85rMx
         EhzIfr+IanqNwphDjZng9Ua8XgiJLIA6KWpl/EDWkMM2Nv8JG/9KNbwKDEjoXDy8UTo+
         ttYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906670; x=1781511470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYTtDzvbWIHpiXUZf6PfSqu1DYtlFSJqScVaIHcDEFM=;
        b=kKqtEGbquB2L2/3vFsJKsO7n/2gNRuTIvhzgKS0pVQz8CguuZn67zSSrU5DSJzOCB+
         iTBOu6f4466vk3BssDDpWFJNPaK2W1xEn4dIr8YRuCjHN6tGWDilA7SK/SpIiN4/9/Pr
         DJEXsLjXSkrFEgxSXZ7DeGoR1xxIbziRt9B2AjfEvkyNNkNWfey9zVust49vlEaK3ZiO
         kGhqAnqAHi/BG5B1xch47e0aFhFjg8nyicyJN5U0WhblNFPpbMnFeT0g7oze9zDGVUlY
         JAAoT8lPbKaU1oOH8tVGKUPNTho8xIoXoQECEzoFBdJmzze9N4KIPT8s6xPOuyU+DJqr
         B4BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QrXDiZfcaI28EtkkkZvG4/hHaIDFoO2OFe9NxDfnFL8HZ8q/3AYRECHfZbV5xPz1+lN1YkgGZtS3phA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIp/I2FdSIDwUxGJaQfwr+iOsgoxzxqHzcbjBextRWPQcp2fy0
	jsUTQFjrNBzBO/iEFdmGwjB1bBCMTL5JS0aDUfwFKzuMt2yoluCnM3Pm
X-Gm-Gg: Acq92OHhzHdR6ZluqPpJHlx5tgwBjod0iEO1FrWRvsfN69vSu+1gEcAP2dk2WHpPsKP
	14CNxRMs1w/YYe3X85bvzAvjT71yKmPamtaUq3+sld0XngRBAjWsZc6rsafq7lat+CMIfMVOZ6x
	SB3++MKftL2wrPXmpPHuKcyx333GbJm7i1T2z7WGX/KMUzJY2wSgMoa3uTjKTeSgoIhsaweJpGI
	AfZs74npDABJggFahbv0/5JXFOUeJpsElhuAo52QOI+a4/kP6K0Facfy1qi5e6aVEAB4+/nRE5O
	25b3VJqVVR1WwOmjLnX1LFfkpQJSagTgpgXuh6kV5VcHqlLGgF4AmegTzGZbmXnemxEkBa/uyqf
	9xXZsHpG5BOMEI+psDoKtPsOcd/0EV3PUIbRksjn+sFGSbneYrdpF9SjEkAbbXkYjewDU2MUFIO
	BkyKCsHLtT+sO9eQqTkqPVSgF/OFWfJvlmT54T8rxA5aj9mgP5NiYYvus2RQLjTb5P3kD6HDbGj
	3WZ
X-Received: by 2002:a05:7022:62a6:b0:137:9399:fc59 with SMTP id a92af1059eb24-138066e0064mr6055045c88.21.1780906669600;
        Mon, 08 Jun 2026 01:17:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:49 -0700 (PDT)
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
Subject: [PATCH v5 0/2] media: qcom: iris: fix runtime PM error handling
Date: Mon,  8 Jun 2026 08:17:19 +0000
Message-Id: <20260608081721.82846-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	TAGGED_FROM(0.00)[bounces-64150-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: CF5C0653ED8

This series fixes two issues in the Iris power management path.

Patch 1 updates the runtime PM handling to use
pm_runtime_resume_and_get() and ensures that runtime PM references
remain balanced during power-down error handling.

Patch 2 rolls back the maximum OPP vote when
pm_runtime_resume_and_get() fails during power-up, preventing the
driver from leaving an unnecessary OPP vote active after a failed
resume.

Changes in v5:
- Handle pm_runtime_put_sync() return value in
  iris_disable_power_domains().
- Add a blank line before return statement in rollback path.

Changes in v4:
- Added Dmitry Baryshkov's Reviewed-by tag to patch 1.
- Reworked rollback handling in patch 2 to use a standard goto-based
  error path.
- Roll back the OPP vote from a dedicated error label when
  pm_runtime_resume_and_get() fails.

Hungyu Lin (2):
  media: qcom: iris: fix runtime PM reference leaks
  media: qcom: iris: rollback OPP vote on PM resume failure

 .../media/platform/qcom/iris/iris_resources.c | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.34.1


