Return-Path: <linux-media+bounces-64436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LRINBeJfKWrAVwMAu9opvQ
	(envelope-from <linux-media+bounces-64436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296566984E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:00:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NNptyTKO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64436-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64436-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 895DE30701D7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D58401496;
	Wed, 10 Jun 2026 12:57:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9635E950
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:57:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096238; cv=none; b=dLddbPR5vdSdaJ19PCnK/OZNTtl3jNAaZU3TRTtHpQgFOFR6UuQD4+gOIMM8RsHYk0YbNaD8FMHCmIsWLpgMzYBdgW8eBykUNpxzjtTYnBoCyCuNpuTZ3XUuDIYM/m5CyuteaQ3qM74xKo6qBjwp8YgUAolRG6aS6BnkDhqUCO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096238; c=relaxed/simple;
	bh=KkBff9/uoWbU/a1+RXW9N3cbfvzcrEwEXeqzOc1Mpg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rix/v+HdN4e+lONJ149wRfWO4Mcu3COtAlpM7627lDgs3vGra9hFdoVVy1LUnDBZuC6xKYFMeOpCNsYQ2lD4ihQ5gli+GmN1mbnluEF989tZYf5QDfE7MWFvPaLbyB7o3tpD7deec49R0DbtAhPSQXUxT2jUvcdNhy+pwOUh4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNptyTKO; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so74437245e9.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096236; x=1781701036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BqhA8Ur5Cm+1riN1NRvX1rCZrGcR0jyTnzO209HLgw=;
        b=NNptyTKO4/ta1/HHnrajbLFcEfen5W/J4km0FSvFJPrjif6uHb9FTrFjpN1Nerwp0g
         DTQOGtX/5iU2oGUXK6KtWFhmNNaWdJoLBtIszeG1YDqw7vrGb7z43U6YuLRAJpgIU+hH
         r5LicJ5DScebIPMEPV8y9eIkACBPZLn4vNR7aXRwWoZioCQfYjwoQqRpb8bAh+n9JPi9
         Tt3Jipq6vICK2YhrXe263gRDsgH/1oZ5VODcfpCHYUGF3Ds99KvMUuyNlpajHe+3dVH2
         x+yVEl2zyHnbcBl4QUwiHkMEcQJTPSM1uQ3v0aPfae6hONGXYGY4vlg3i89JKNyaBkm8
         QuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096236; x=1781701036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BqhA8Ur5Cm+1riN1NRvX1rCZrGcR0jyTnzO209HLgw=;
        b=XAwL2zo1NmNfvJZFB+rSQyenmlHvXzwE/JQhQ98ODUCgA3mG4HO72A1jGh9Q7WzPp8
         YOzFcWeo27cirCiic1RkKc1FNLwjfXnOPEVTMzN4CaIKr1qTC86IxDAT9ZAMhx3CDAnT
         nv6B0zHlmw58log54EMuJfGbaj6sG4YpNn3Cv0i/sF4edvTR7WXcaz0hWW+JReSC06jy
         8dxx4mUqJbPeHpt72yMti4TgL8grWS3FkE0QNo5cz58Q95eIHjCTDJX4bIcaNtXsHHhk
         w5rDfrr3Pjxmee+auI/Obb/J1FYirvEzR9KHGMXisOS6Dizfle6sJWh9wiXVHoAdlayM
         GlFA==
X-Forwarded-Encrypted: i=1; AFNElJ/CEUM3YBTuPYMfpwvMZdOeFe4/fUOpeztKKXoKJ//D86apiNM8otGEliZBH0tGiWygiljm2lo4ln7BgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6FpfTG3WTM0L8nDDByIai0sFUtMnqi4+GkmpOQgUZkMxwcVS
	5JN4QdMaRezpDzZg7nq/akSDY4Z/Rtq7MUAMfDC4/PQPA8RYjIgvZY8=
X-Gm-Gg: Acq92OGRZZXdbK2uZGzPN9W2wgd/S2hvRXZtM0KMRbMvNUQGh8P35MtrKFBy0tHNeCM
	9eFssXneIRAexKDaRAAp7m6Z9VfnV18LUOlcBDkGaPgZJ0BmluSgqmDsgqExYW5qDtK1/Zwx5+0
	svC+wJHBDjA1cW5gC8eruc5dJV6faA+1UJ4ZCdFPliQqLMN2Zd3bm8HBil3nhr16oEZ2bwHCQI9
	L1YK5oYKZ0tARuAKzg2U4Vo1Yj+kLTlIWX+S3LPjUBaVAebFvg6FwdNwUMHIPRfhaLOwREU4FbQ
	b0hNrvuirYVbnl4xOvYQLcQHs9yoHhURfoN2wBxv5a9CidP3By+CKRQpb1IQVLxvL+hfeCr62Yi
	gOti98uQgdPmoZJ7X46sMmRXCXTHuvYdmjda+TMXhHeKgmEhge5tUj7CHIDe5TleAL/jePjkAU2
	pHe9rw4813gGetgSTO2RAAexJ5SHAXIom4INDMY7vhxvT5IWgOnebxzoqQk3/9rypLxLO7f6OzQ
	Y86L6U5anaBVAKCe0ah/RP6yQ+2zPiGgLyqo9YpNjGKmu0CZX8JttE=
X-Received: by 2002:a05:600c:8183:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490c25c4898mr357967815e9.15.1781096235966;
        Wed, 10 Jun 2026 05:57:15 -0700 (PDT)
Received: from localhost.localdomain ([196.119.91.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm537328905e9.10.2026.06.10.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:10 -0700 (PDT)
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
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH 0/2] media: venus: fix HFI parser payload size returns
Date: Wed, 10 Jun 2026 13:56:53 +0100
Message-ID: <20260610125655.10517-1-med08elkadiri@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64436-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6296566984E

Several parse functions return incorrect consumed sizes after the
refactor in commit 9edaaa8e3e15. hfi_parser() uses these values to
advance through the firmware response buffer, so incorrect sizes cause
parser desynchronization.

parse_profile_level() has the correct pattern. These patches align the
remaining functions to match it.

Compile-tested with arm64 cross-compiler (gcc 13.3).

Mohammed EL Kadiri (2):
  media: venus: fix payload size returned by parse_caps() and
    parse_alloc_mode()
  media: venus: fix payload size calculation in parse_raw_formats()

 drivers/media/platform/qcom/venus/hfi_parser.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.43.0


