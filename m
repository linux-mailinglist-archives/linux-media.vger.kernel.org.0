Return-Path: <linux-media+bounces-61115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHU9BtPUAWryjwEAu9opvQ
	(envelope-from <linux-media+bounces-61115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:08:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95850E952
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EA543056377
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EE53A452D;
	Mon, 11 May 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpQea85O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF23B6BF1
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504750; cv=none; b=Woub+z5fmsvj+2nQcl+NCcKZN021vDOMJ7fsacMHCVI4bum/53OgxO6TdBDTCON1p81uAdlxsnUrni75DHlaX1d4RNFYkl1fMaeW6lSSBVhcnJS7AjEVMFUV2XSw7lttbj18TXnhk3t8etWQ2hbWHHWgg/P+4TOlGxF9cxOXC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504750; c=relaxed/simple;
	bh=M1BdhDHhctGN+nSWoT6Iqnwlg54cLR1CkWBAIkv+Raw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crzHF02avk2IPs2nYZ9uE1wK1xaIno+bLckc0bcPG3wu9Jlsh7H7fcC62aL4T6NNd+id6OJ4Ov8yDzYcsSSDrJ5Q4m9641W/EobAOSqlo8Q4h02tgnzt4AkWK2/Pyq95Zz/erNZaO2eMiEz3scbP1lHMwXZ0NUQIsXQXZYcy8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpQea85O; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4585a116a4aso894986f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778504747; x=1779109547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKE/HS8PVABSXW4fi+mYBFkGbkLBcHtj12GDUFSueN0=;
        b=XpQea85OGOdquBLdUMlWxfj7qK1431XGRCJSlau+XvO8qqVBwXbwtXeq0MDk1NIj8w
         XKKoukoP2mspV3+x+bluAFMZ8YMR310gTWR2dopfh9K/9M9bbstJvu2y2ErSop7Uq9U4
         ZHvRgI8SYyCGbFyHcY4fjM0QqlUHRwUlf2VQNDh/08SzpfVUzUbeZPWY+xc67dz6zUI7
         G+HioreAUkNLzRdZvEhuS+gNuj//ZTkWWXsMDhdF76Z6A5OSxIeOCq/dfkQ44W+8N6G7
         zxK4+d8NQKP3UU1zPQnrpj8oBywPy6OigvxYubeHsz19kBwy/Y0slDWMNXcTUp/UGKCF
         eNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504747; x=1779109547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKE/HS8PVABSXW4fi+mYBFkGbkLBcHtj12GDUFSueN0=;
        b=lKJWVDvRmlaePjMM+iBr724/3i0GEa0yl80Q4eQTpOcCkJETs7YgPfiUebJBdvn5GA
         f4DiUZQ1j3/E4Ua5oydmCDlir7dPdcAlysyhsL8f91/18gcKtJRGg62U5p4W5gWDfCH1
         Cns54Z12fnEmpBTSIE4MuZiQEBA1fN0l6tEKQB4gE4lFQ5wlHMSSGq4eLQF3vzWLiAOf
         RnCSArrlzCKO6TXwA4FBSyrNiCLOo5IiurBoEbB2PO/+MzsdywFUj+cvglKOOWMxKDCx
         R4XI43JFOvtwBBPKAHeI+c3O6yGE4uECUbv2DyrL0HWrOSUJHxPhyMDza1qX8AYK31DF
         IL8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/eNukDL16PoefzgPmy6ZaJKFi0+xF7zZMKUPOXaOOsAuxTUm3dhd1mlsWNPZogy7iAOk3+aNon9Siumg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4hOHSFSR1+KNU1GbSbt6RAQJ7DGZrDIbtLqaBjkG+8CMvPJC
	JeqCIYB4I8A5nSJUhOOmW+HgTbtwIiVn+7PmmwCsCgfXo/TrJft9Lw8=
X-Gm-Gg: Acq92OEeqoi2hlqRKNkqZZsEP8PTWPyzC9kOrHZHcg8rzYZ+xcCu13ACqQvgK3UvD7E
	anHs5r2MSlIInyhBQzScW5tOgks6O3vzhFyz4qOSPok+I5oUZRbyCZNwYYHjZ67wMD00SDY8oSf
	fgws6e8o1uB+Uid9c2ta599PLzqQXatWdTKJjRX2LzQ/MzzVdF00mxjZDonDThDsKEXOFhsaqkC
	9S48YuKEU0UIiaa7BEJeO1W9cShHCH54w9sDLRcr7mmeo69WR5mL/aDYpZGvQ3yDkzlc+umF33F
	KFV+ZJuqOYPXdh3OxfmR175I02nQt5O0NZ6f0S246PEaBdXsne9gagDInJPJtVdwvd4gPqhO23d
	wUwb92r6OWphIlSfnDFZhxreFkKCYh5s6PrszUoIlUNe3kKo4BXqVXnBixc3/L0febzc7rkJ27c
	ptVhnuaJehwqQCrnCCipNz3Xo4WsvnCu+zV451vBlBKHw7vMF7u1st0g5xetxiNsRenJL6yeXWG
	hTMmjoJ4ieRG2EgbMhFL5KumURRoYCYZcSnf83X
X-Received: by 2002:a5d:5f42:0:b0:455:606a:b2d5 with SMTP id ffacd0b85a97d-455606ab327mr17802750f8f.3.1778504746668;
        Mon, 11 May 2026 06:05:46 -0700 (PDT)
Received: from hp-ubuntu.. ([105.71.16.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm25615647f8f.24.2026.05.11.06.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:05:46 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com
Cc: bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	gustavoars@kernel.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH] media: venus: Annotate flex arrays with __counted_by()
Date: Mon, 11 May 2026 14:05:38 +0100
Message-ID: <20260511130538.33443-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CE95850E952
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61115-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add __counted_by() annotations to flexible array members:

- hfi_capabilities::data, counted by num_capabilities
- hfi_profile_level_supported::profile_level, counted by profile_count
- hfi_resource_ocmem_requirement_info::requirements, counted by num_entries

This improves run-time bounds checking via CONFIG_UBSAN_BOUNDS and
compile-time object size resolution via __builtin_dynamic_object_size().

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


