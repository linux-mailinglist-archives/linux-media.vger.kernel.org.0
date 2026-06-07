Return-Path: <linux-media+bounces-64049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jbjpMyRVJWpZHAIAu9opvQ
	(envelope-from <linux-media+bounces-64049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 13:25:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A881650690
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 13:25:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BfwjCMVa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64049-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64049-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5857E305BB7F
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 11:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ECB3A1A54;
	Sun,  7 Jun 2026 11:19:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67D2E7390
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 11:19:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831181; cv=none; b=evlzK4ZlC89xwfFkWFwNmwZiq9w9wmDoen4hJy7q8mzZ1seA3DHk1U54VI90GW9j51nZOiG48uGWUhljzGS3nBOlNKpIZfpRxwbJzvrBUXIixsRpqNsDG9TMWdqqvLiWZC65xr2hmMUUc5/dZBLqhxMdI8O0IWWglgcWZaolCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831181; c=relaxed/simple;
	bh=0uDYtqRBUzvLjwC3Lb+glSfRN5HCu+ot/eZzvgKdnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TgtT7g3l0es/xly3BNea7jG7c7++dL74SnT6h8qgbwa9T05PQshQgZ1/2wwPWj9O4WrmMO8+VFBLGmPFunKy9VEsrb3gpaRXIpZg0yN+2gaNZflsvqDTlM5MLiSeSTf1nA+EVb/2ZSGvlWhATMgBKvSAAv+14fxrQ6c1cAv+7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfwjCMVa; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so28501125e9.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831179; x=1781435979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nrYQAlpfe/R8hKzBRpiJvT6OU8qSP87xKaeg9At/5s8=;
        b=BfwjCMVa5kQOBFZ/v5rs91TcX6t9R+J+RUXTI6y4v6M2e6nY2c19BviZ0hLBQABya5
         jy7N1orx4sQjjn4wAkIMJ8gJkGI2u7QnZiwJpNQAZOCFR95I+xN8rGw/fP+mTHLZUj/p
         44sswKTGeTHCkARHGPQMu6p6Izzz1LM1orHNpLHFt1HNJ83GampZthLmkv1003riHEmw
         aJPcdgWyEfhRdwLoDuyLYRiGx+v/Zt73O3ftGBMgfRHxr/1+YPbc1uO8DXifmQEZ7WTf
         jxsXmV1GsPWlKkBOAJWyv8e3VfY2ZfFTlFwUj9mZwH62YKAsbXyh2YuzJsn0ql0jyrDV
         Wwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831179; x=1781435979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrYQAlpfe/R8hKzBRpiJvT6OU8qSP87xKaeg9At/5s8=;
        b=EnaovD81uxCMDU/827LZBeWQNv2jfw5kUwPheNtaiNFQt0YaY+Sig0rvAp4is8GZLQ
         nzhbu6YzECGLF3mh6/iLWY/b1C+HF7Onqvif4YEeZJwZncN2bUiVtl0Jplr9Z9CzmQO9
         xyMriNhwXRiTUL5elSVT9OtSKiMcVjhl3LDTbgok6giYR7FTnoeLxqElzrGx182CLfSE
         5Fu+IjZewyEen9kOURPXnWaiy5SdfqDViPiULvRdix3YV3S0R4ZnRwuT1xpUdSBXYcta
         bqFmCmacPXo6I3fhMDCvcg+nwgYfm4YfXUkL7vzIEtN8sKkKdEhqP9beNCaUgM67M/Hd
         3fZw==
X-Forwarded-Encrypted: i=1; AFNElJ96DugPRr2Ce0gCVRcznhSTkPtwjwWjnoScKTIxxsMlHSlkqEfBXiOaKjC19q0uVlIAsJ1zWiMbYZNIMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOWFX8TBKSekkfQ9CX1VAv2UyyIkdZ8h6p9Q34+5XLSW9gdqk
	TeCEf6pVrYZPaynnT1/u9lwZ3jVXnKg3pEFqmvRN7Vn3GK6bZC9DGao=
X-Gm-Gg: Acq92OGV37lIHxsc+Bs2nJfL+lB9o2x7ZxvvUeew/Lek8cCbbZ3e+BNckJBCB82Rn8U
	P7Iy2kKf1eZl2t62n4EnoVRaiLBE+CdUe69imNhp9+0G7z5nMxKb88GCbkUJwtLzs+hXprmQaSX
	VuaBX0XvcnK9ScKonRqmBVA5R4WBbAt6mk6rOvh2oCenCjkOHClZdwJGhFtT3vZJKXOrjpBEgjr
	q0KZC9VsACrmjWC6o6CLadw7BD+HxWL/ciMB3xsvkvZ40by4Q1g/s5Ux+5Rbuk4Jv2DqcRthYWB
	w9ILbJJzDb3+n4vi+3vuZf8f1ma+fZMmZ/dRYuJYUMDpPyjIwLxVTwmI8SdZ5DmTaD4yYqYwUXZ
	pitmpRXzzLgpz3ZHdjJfKjFbTlls+Z0Uc/d6EdoXkfXXbV7+vBcK6OP9nZQ/IBs7LBLOUPTCL7h
	2dddy2z1xzQNYboV9dU+r9e9Lla0C+FSp3Iv7++SC0G9m3DnCMDC8Xx4zbXGyzRzOGYTeTwUtnX
	g4smBheoCn7eTyvwIJJfPaUZmEFRJyY6wrAHO13yQ==
X-Received: by 2002:a05:600c:818c:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490c25b3ca5mr196207925e9.13.1780831178838;
        Sun, 07 Jun 2026 04:19:38 -0700 (PDT)
Received: from hp-ubuntu.. ([196.74.199.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm282234195e9.2.2026.06.07.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:19:38 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: kees@kernel.org,
	gustavoars@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH v2] media: venus: Annotate flex arrays with __counted_by()
Date: Sun,  7 Jun 2026 12:19:33 +0100
Message-ID: <20260607111933.6398-1-med08elkadiri@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64049-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A881650690

Add __counted_by() annotations to flexible array members:

- hfi_capabilities::data, counted by num_capabilities
- hfi_profile_level_supported::profile_level, counted by profile_count
- hfi_resource_ocmem_requirement_info::requirements, counted by num_entries

This improves run-time bounds checking via CONFIG_UBSAN_BOUNDS and
compile-time object size resolution via __builtin_dynamic_object_size().

Assisted-by: Claude:claude-opus-4
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f44059f19505..e96d458c52fa 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -616,7 +616,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability data[];
+	struct hfi_capability data[] __counted_by(num_capabilities);
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -802,7 +802,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level profile_level[];
+	struct hfi_profile_level profile_level[] __counted_by(profile_count);
 };
 
 struct hfi_quality_vs_speed {
@@ -1085,7 +1085,7 @@ struct hfi_resource_ocmem_requirement {
 
 struct hfi_resource_ocmem_requirement_info {
 	u32 num_entries;
-	struct hfi_resource_ocmem_requirement requirements[];
+	struct hfi_resource_ocmem_requirement requirements[] __counted_by(num_entries);
 };
 
 struct hfi_property_sys_image_version_info_type {
-- 
2.43.0


