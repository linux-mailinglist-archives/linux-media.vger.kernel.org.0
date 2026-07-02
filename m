Return-Path: <linux-media+bounces-66374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SI2eI0duRmr2UgsAu9opvQ
	(envelope-from <linux-media+bounces-66374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:57:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C206F89C6
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:57:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ajpd0l47;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66374-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66374-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7017230151C3
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98014ADDA4;
	Thu,  2 Jul 2026 13:56:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1FB42A7AD
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000584; cv=none; b=OWc5o3qDIwTe6XGc3foiB/Qao3Obbs4APyObe01L5aMMbJprJcCgwn0d2SvraXd3OLiDQUpTj4LuiHluGsijWn4WCAlsx8JA+3eFqR1l8+LdzXe4LUYtNNpp+1Je54urq/sfWGnqEDZPZ2IMxOecYaGdK9a0/SqZS6wXb5SW26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000584; c=relaxed/simple;
	bh=ofcp95WVS9ojPLv+paM1E5y4nSDSK7HQFokrbJcbD/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQFxCNnkbqBo+X3cvHNb1iAbU6YnbgUJ3QEKY70vnOU08eoH679tsBbyOV8wlFUisADGlFEoCE4ycg8FkMM1sghtJ5W3ACzwH2MMnUCRNL7qg4fTpsIaRCIKS4UQH0MVShpxYuDaeY8k1uZExpIrKkezRHszFCd9fitVqmSJgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ajpd0l47; arc=none smtp.client-ip=74.125.230.67
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-39b2973e915so8842471fa.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000578; x=1783605378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpnLgxv1t8Wgzo0tLn1v2lEaoPNDH6auvhtbcMoSR8E=;
        b=Ajpd0l47WFL09DB1+F8xtA3VGrJ/R7734Zvim1Hw4vAtl1zu77hfq7lgFbDmqqTEco
         1MbHSGt+h7ezrMdqPkPCLdA3lujxeTrSmdK2YBHzOJeqYsXBkJP+CtvezcJeR25ooYl9
         ZnUDr3EfkNHf4FkNPiQI8CSFD0+4FNrIlPuIl11cd1sDd+EfO60a2CTuaDLKVOLq0UgB
         16fO27WNLq2a4dMBwdjMRVDCNqBW70aabAoS2E25WBdpDEVdRihOljiO+j2tBwX2txww
         nQrL4+ffVXmfMttYFu1t6iHVUVzreubbHtCMm5KUIPLDGhVHycb06y5qyOuNihhJgpXT
         8+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000578; x=1783605378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpnLgxv1t8Wgzo0tLn1v2lEaoPNDH6auvhtbcMoSR8E=;
        b=scSOWoHp21gFMWwctJf2fPGm0lIFolw/tefMlhrSJ+roE9mJk71Zv9u7y3THgamPuS
         ATyw6qVXct7vBan3omJclxuialZXsjM27NBX7ettV1xb3uCiGGPDbAvRPwWfBLXIQlid
         UDJzcwfr3G145hPO6AWTy56P8/NjheOzYyv7Drfe7Rly8RcotLMLOk8E2yC5ZhUz4Euj
         hsY/gI1ByTmdyh+YHKt73lv7gXYoSO5A4gcub55yObbOB/3AvcveMWgUc5hDjwaSSzGO
         7/sBK65NXpZFCqZJX3McIY0imOUyTdt1JDPsbZtNFxKf5oXrBg2Otsl6wKL7LQx2NA0V
         BgcA==
X-Gm-Message-State: AOJu0YwYttnKD0v6mjU128dwtbQ5WggPvona1JAxJVg9ATcYk9FIWc0C
	X6+neK1NxIDXEEyauCPqej0N3neLVZAV1OOXr3Ew25tiyvdZEOLFVclU
X-Gm-Gg: AfdE7cl+n4HFI7p/Tarmf3HIoATK6ztRDXk1Cfp0+DNfOh0FQ4rIP8LHCYLw8sJmf3F
	Wb11zEHp10/WoBPlseVsuM5aqWxbiuWOYd5UXzNLNWGeR0YcsvNFkMQbfVWNCJxHJ6gcZ9zj+Rr
	skqKT6cf997hOmX1AXHEmFKTjRB7BU1Of1Z6WHhIXgufRUjXmN8tQgzvW+7coMqZmygitPMQKhC
	sI0M21aptavVdBjolZV6OYJeDfOc/vC2B0cT6EqnIVSe4+hHqc8J5pA/9NIJBuBChOgj3CVJhWC
	vrWTEzVuywnTG8IwnX8iQ4iZ+8D5xopxs4sAOZFnXHGSxbwN+Fuf+AZIisQCbasSr4vZzw1EBvZ
	BEtiEvQJ+MDovQ76jB82ILtOpvCGZ6oGk1ymImK1WJXw5+fbhp9DoFb4e41T8ZhYOaDW5RNxW+J
	m9xXwa4PjFCR0dfjt8ieg=
X-Received: by 2002:a05:6512:1316:b0:5ae:b918:af30 with SMTP id 2adb3069b0e04-5aec67977cemr1595141e87.4.1783000578127;
        Thu, 02 Jul 2026 06:56:18 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:17 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 2/3] media: atomisp: fix block comment formatting in ia_css_mipi.h
Date: Thu,  2 Jul 2026 16:52:29 +0300
Message-ID: <20260702135230.19030-3-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66374-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80C206F89C6

Fix block comment formatting issues reported by checkpatch.pl
in ia_css_mipi.h by moving the opening '/*' to a separate line
to conform to the Linux kernel coding style guidelines.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_mipi.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 9fb178c8f3a5..e79b4de8584c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -7,7 +7,8 @@
 #ifndef __IA_CSS_MIPI_H
 #define __IA_CSS_MIPI_H
 
-/* @file
+/*
+ * @file
  * This file contains MIPI support functionality
  */
 
@@ -16,7 +17,8 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* @brief Calculate the size of a mipi frame.
+/*
+ * @brief Calculate the size of a mipi frame.
  *
  * @param[in]	width		The width (in pixels) of the frame.
  * @param[in]	height		The height (in lines) of the frame.
-- 
2.55.0


