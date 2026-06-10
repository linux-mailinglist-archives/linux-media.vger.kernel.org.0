Return-Path: <linux-media+bounces-64438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id easHHHZgKWrdVwMAu9opvQ
	(envelope-from <linux-media+bounces-64438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:02:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A826698B9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:02:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bnXgkwJE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64438-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64438-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE5B032DA987
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3C408014;
	Wed, 10 Jun 2026 12:57:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017543B7B7D
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:57:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096250; cv=none; b=cF4lG2Yih5eCqeQOtHNWYHS3jFcvRxW71dCD1BtSXjquTc3jVBQw3j1dfigSivNTUpGTG0gtTnaSKd5lFKoEepjW2xYvYj6jYSr+F6RO2Y4sK4iX9nTsOQlEmyNAnRTsumbdIbkXohnOpzpm2tkHPFW/MEKc2JPtdyA23MR8hxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096250; c=relaxed/simple;
	bh=KpIx1agiZkgrFurtoJ1ET+tTDHaal1A3VQITZbFLKeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7kMJdaBZwZQ2powoCZsh5d1g2azc4T7IGNsBp/TBcpn2rUCy0bLqgYshUmUzQD6/DbkrwgM2dCPAHrmO0OJMNV/7oQsAzyBmqaKHuE/nOJR6MfnVwqVMP0Hv5qFTBiAIbajRzQ+S5AmsjujzZ/GOmsZ9+jlWLlV0QwgjnoWy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnXgkwJE; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490af320e2aso73817095e9.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096247; x=1781701047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0d+zdeqH6lMcQH9MYJ6TD+dtSYgdC4zwQaodD6IKOc=;
        b=bnXgkwJECRpyxDxO3mR9D+1ghNsmeNjn4PGD/neqzOOPe7wWMGoVmU/tV9rYTN/yH5
         0NIRir8Am/LKag4JfMBXCIUNMzKkd3sZPX8fzKgyF/XCcy7oSO7rnFLzTZgIh4Hnq7rW
         W83cBP1C1uiMB55m/4dyh+VwZ5CAwYAMRWIccPMwmVH5zhAH/fB7tHEjNqk7nh5oEXEV
         21/q/vcSMpr0+6y4w20pvowwbUiIZAmUnn9C9m6NOc5UdLQACjvZmvR+U+70WeM3IFBc
         WZGVZHHIM7kMcH7/u0R0EiEK/4MXTm6mU+ec+dnfO5XbRo2/OkhDqBRAlRz+o5YaYDcd
         x4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096247; x=1781701047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0d+zdeqH6lMcQH9MYJ6TD+dtSYgdC4zwQaodD6IKOc=;
        b=X2xyfZdZkaCIQiDH+7nHFxlzWUgGzVeMSVv6/ryp1LQqti7FxI3XN+Uzdb18f/PeVN
         H3psrgWEKkK5kI1K4A6qycPYyI/7Zb0Tc37VxfU5C97nhHOwAFdp1boiJTYV9oTBsyY+
         8MLjs/kMMqxAasyl4iFbPwty8XjP75eXHtUkGt+nbP8qhPCXy5XbKC0KKH2XbJ44DPYN
         5jxgSsarztehZFUzlFHSmCty5sadSNK53GNckubb3i/CoNBOgnqDi/94y9pMpF+vgmTX
         0BEYK2tFvSh0GAsSUzF846KXkqT0tDYMHI+bVGmldM4hgSGG1Pfsmqh+ZY11eEW+4nSZ
         h71g==
X-Forwarded-Encrypted: i=1; AFNElJ/H4p6eEQdvvjsv7vrD8xxYaQelafv4rJ2tVmTFf+eJJ7jWHIJ1EycLGKxVII06CRVi5/oVRumNGzYKRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4tQc1ziiZzYeaUwIpcEv54kKUuZnqlKOVFouf8+p48pILNJR
	QywQbUzECT9goZe/R7DIvMz5h/rXZQC3S/mpJ+N4lUVo1DTkoZ0YC8U=
X-Gm-Gg: Acq92OFivIg+1PsTfpaiJ9+JiI7K/2ysTke8TFkfNA1+LEkuNbXQtf/O6+GIg8+K9vo
	wb3McbhBE92hxs5ha5TlqEuoMy5ljFapjpLlRa3G0mBgvByzFITJ7MNr4kMOxnhPsXSqQmaAJ82
	w+kTvtgAL95Lu4EdVNYcdzFnzfNrbTviEbh5G/t0+2oQE6iSGmofy/UXLd6gTqsO7PhUBDvJDyB
	5IvJoBI6vN4xA9ocxjLIypB1/ycw0FlI4caW8jleyuK5kpWmdFXFNg05wLw7UB3XRWQU96LCywn
	IvZ11Zp7EKJp3L7fMH0tlDqT5A25Aa5dzBXLK5qbGzSjQmuOSLRKJK80NDk4Z+IxpgLUrEm42rU
	BnzYykYrtKOJdy+2X75DfJ1344bkDTZkLBR00INdpjS9FkNPIbkqYSc3SdlR6zw5TONOZu+YMdk
	Q3+oPhom79N8LbRe/bapMkwEda437Ofqs4QSfK1AnbFnSIywvxhXQuAEDXHMrX321bESY+ySSEL
	38gEQTqhF0VwAbngH6+52n0BYvB4zFk5WOGFCB7CLppqOFJGYODeZEW7n27dwBm0w==
X-Received: by 2002:a05:600c:6384:b0:490:acb8:1490 with SMTP id 5b1f17b1804b1-490c2591e5cmr378024635e9.4.1781096247246;
        Wed, 10 Jun 2026 05:57:27 -0700 (PDT)
Received: from localhost.localdomain ([196.119.91.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm537328905e9.10.2026.06.10.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:26 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: hverkuil@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: venus: fix payload size calculation in parse_raw_formats()
Date: Wed, 10 Jun 2026 13:56:55 +0100
Message-ID: <20260610125655.10517-3-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610125655.10517-1-med08elkadiri@gmail.com>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64438-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05A826698B9

The consumed size is computed after the loop using the num_planes value
from the last iteration for all entries. When entries have different
plane counts, this produces an incorrect total.

Accumulate the actual size during the loop instead.

Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index e2af4e9901ee..522bac7ba154 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -171,7 +171,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	u32 entries = fmt->format_entries;
 	unsigned int i = 0;
 	u32 num_planes = 0;
-	u32 size;
+	u32 size = 2 * sizeof(u32);
 
 	while (entries) {
 		num_planes = pinfo->num_planes;
@@ -186,6 +186,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		if (pinfo->num_planes > MAX_PLANES)
 			break;
 
+		size += sizeof(*constr) * num_planes + 2 * sizeof(u32);
 		pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
 			2 * sizeof(u32);
 		entries--;
@@ -193,8 +194,6 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_raw_fmts, rawfmts, i);
-	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
-		+ 2 * sizeof(u32);
 
 	return size;
 }
-- 
2.43.0


