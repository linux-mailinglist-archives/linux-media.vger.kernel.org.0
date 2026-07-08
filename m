Return-Path: <linux-media+bounces-66973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cqtXGJc1TmqtIQIAu9opvQ
	(envelope-from <linux-media+bounces-66973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:33:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C27259CD
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZU4hWgyQ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66973-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66973-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64023005648
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B4F3033D6;
	Wed,  8 Jul 2026 11:23:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B026E436BD6
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 11:23:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509825; cv=none; b=q7sBmJQIOXWT7PRhzg1rOMHsBIiwub2EAktcCTdIjN9SC/C4Fjn7nsCUlWPV0595zxqFkm02Qv5v2+05gbVWWj1rC7pkdjU7/mKr1I+Zdf5R4QApZQpY3PRRt7KHnzDA1o3d1xVprtKbuaKnasNzwZAiwC/RS1EQ6Jq7ySiB4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509825; c=relaxed/simple;
	bh=EpI9t3WJVdDvd9f+SYNgluyOUeKvc21nA8B56RPGE/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esyKjfXv0EWiGNhjEJ2uwhLZeHlr+er4sMIbgR4yWZZ3hLdmuFB76AIpPSWLHvxLKKEuwJt/uFj3Ly4Cz7uDmqnipcgLsE1LNrL4WRse18JrPr6FknB4mZo9O/Tn+Erx42z/2RIdg7hljF+r0i0fMS0rNxCDjD6wS182ogO4Dbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU4hWgyQ; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso603115b3a.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509823; x=1784114623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrpNiG+dLKdC9VoFd7U50ACcWZFgZLZGGrYF/BgPTEg=;
        b=ZU4hWgyQ8tI0Xdhr9l54D7CQ2R0xT7oF9tYijM4EfLYRBgGDu5JhYotohLQx5Eotr1
         AySAEShlMoreYzYTd9TcJ0veCFDmKjQgymX3LqUGFW6BXBdGSHOVYM3BBMcShICDQHKa
         2o5Q+oc8MV2Z5vneaDAcmuS46CK4mhB+XZZxCIgEKTpaqlBd4IS7UG55FiwrnyrGM0oO
         nP/RmNRuj0cwVAllrjtgU8rksYeHLJn/zm0UBR0aB1NrvUIWp1YalyCrvccbwOfbTngt
         yqt7RojyNuZhFKbKdYaQoOCWm2MwpMfE+hC6+xphTQButJFxFFXKtndUFJUR9EW3+AHP
         AQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509823; x=1784114623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrpNiG+dLKdC9VoFd7U50ACcWZFgZLZGGrYF/BgPTEg=;
        b=Qb4s/l8oTA7nGB6HD97h9KAz39+nKsXr/L+ndS5EnlohZ/9gSDAiMO9frow0dDmLXB
         rECBDAfgTPb+i+l4e7Dn/ZtUAguagHmQawOE93DtF//0GdVdhVLv49Wo7c+CqDV50tuX
         A6Nh5VrRugeG3BkmLuH4WX1eb0NeOQfwDZxetdV/LWYoiXLQB+Xz2RAazrU9IT0ZHLpl
         mJ4Vop7hQ4+FUe7RLmumJuSVPRwzdzGwq8HY/AZkFSYaD9FQSAecdWF3bQeAq9PGHoRS
         mogC80HJTGN+dvJnCkoKTngMUbah5ytZTaZGkP+FtK8iaKHQaI2Tkw+6F+hI6ob8p/RV
         u5GA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lS2uDEw6vemMTsWy2ankZE/Ti/amAEeXiBaxLioQMRsv0Zsi3yhOrTX7dHNIpF+2+KBUAaa1TwP26Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpAcSraYlkaWtER5LR8LUQXH7cm5o3JkS85UyRSS+ozddrI4o
	Zxbmmh1v717aRQJMNIqE2O/Rv7vzEhUTXDSb5C55nN2elMAWxu8+VfE4
X-Gm-Gg: AfdE7cmKPEh7tIMQDNvoAnE3KAyob82ExedYCvK/M8C2/Ciz2Kpy8NzgN0xjUJ95SlS
	pAt3+2nwf/IYErpbv3dIGGByLWtDb2jRMFCF5b2EuT/TP5oVFjBhNlt9du3QtXLbCblCo8oaQCt
	8sw8voOnwZsHjsSn8fdmy+FerAm8QrjXQd+sfmm7+eer8ngduMvOkDALPKO63KbEx8QEgNyl7+6
	aF7S9wTCrhujCRxmYrp49810oVgRJFQ6q657RVF54yzBU6wBLTUzC6FoROWGWqjgesIs+VwRM76
	IQhPyjyPSj1MHgeHpwvmX3JsF0sxgWo4MrKBirbqqjs3KfW42/mrT7b2UVEFR1HNbhXbOKhJ9d6
	AHwPCsAKX94OiMv5dDzdX5H6QG7xGr+nB3XTtJeU83A+rljWDDIVONMh46x1KnS35wObcjRu3Qs
	VNDqFgpZeUMd1/
X-Received: by 2002:a05:6a00:1415:b0:848:2f84:f434 with SMTP id d2e1a72fcca58-848432e17cemr2255670b3a.77.1783509822954;
        Wed, 08 Jul 2026 04:23:42 -0700 (PDT)
Received: from lgs.. ([101.36.111.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96998sm6900804b3a.16.2026.07.08.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:23:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: venus: guard sequence change packet size
Date: Wed,  8 Jul 2026 19:23:32 +0800
Message-ID: <20260708112333.751480-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66973-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_vnagar@quicinc.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F29C27259CD

The change referenced by the Fixes tag added remaining-byte checks while
parsing sequence-change event properties.

However, rem_bytes is initialized by subtracting the fixed event packet
header size from the firmware-provided packet size. If the packet size is
smaller than the fixed header, the unsigned subtraction underflows and
rem_bytes becomes a large value. The per-property bounds checks then no
longer protect the parser from walking past the received packet buffer.

Reject undersized sequence-change event packets before computing
rem_bytes.

Fixes: 06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 47b99d5b5af7..ff60bc745f8e 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -55,6 +55,9 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	if (!num_properties_changed)
 		goto error;
 
+	if (pkt->shdr.hdr.size < sizeof(*pkt))
+		goto error;
+
 	data_ptr = (u8 *)&pkt->ext_event_data[0];
 	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
 
-- 
2.43.0


