Return-Path: <linux-media+bounces-62080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI0YDnkADGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:17:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E7577DCF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 328EF30591C3
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AC7398910;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8E9UP6J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1843612D8;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171355; cv=none; b=t0HUGae7GY9mVtcL4XZNQjMdQPldYYpd7cqtT5kAS9DpwGBkxJic4Z3t8kP+hbN5kVTMeF6+c0wacLJjnktz8rSROhCWaRwTjWv7rJ76rA+w30/KGmXZg50bIkHErxkzBOR6Sl9vW3Y/BU4SB4jlGuNG88SkKkIac9KERwITAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171355; c=relaxed/simple;
	bh=oPFAYDbcOdaONkTK3t8RuJ4HZ+KQnAEEZ3J8LUUbMv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5iUtlNCqlCPEEZF7BMYTcAhOeEtV85vUmWPvRtcrMCD8Cb6Av1up/34gNiqfhdfGQ/EfQO4QhoDCjbjnrpZLdViQWFJzpMh+VVV4xSTXBP06TNGvFkqDhHrn10cHQiQTCTn6qXn2DBvmM7fvp4mRQKkppFC7xazqlqjgzHC96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8E9UP6J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AFF5C2BCC6;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=oPFAYDbcOdaONkTK3t8RuJ4HZ+KQnAEEZ3J8LUUbMv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L8E9UP6JDabt600TvsCR9slzoGhC8Jwuiv7ar8SzlmQIT/5k4Ap/fBmT2Sp4/mBGi
	 GkRCVI8vKNMEDIjQo5e+HBThyfqZOLIB3g42MxaA4VfW8vXPGelxTQ00XHskUqpVjR
	 71f6xwdeuUhqEJ/qY6tV90GvdI+XxlwKEls7aL8AXm27Mfu7z3U5rvNxJ0W7C56GM2
	 8+VC4dtJ1yrnvzCLcnl76SyXDtZfozios3ijPACRDedJ0gBECnQx6CkyrzhWae6605
	 lZSIVwBRORUJjwkgZhb7RGt1Ek1/lcp9UhNfq6V1yNS4Nr+zSA/ijtNS/cVtPSvEl5
	 5ypjvcl6TZGIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37596CD4F3C;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:45:51 +0530
Subject: [PATCH 01/15] MAINTAINERS: Add entry for Qualcomm DSP Accelerator
 (QDA) driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-1-b2d984c297f8@oss.qualcomm.com>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
In-Reply-To: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=1114;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AcTCOc39xB2eWZrt+ASexMe8l7bzMXO4brOtNDdJpLc=;
 b=XwNsf2StpfGEc03MIN5ksLv66Pg0T/usYVgQPmqfzw5MxB6jXvhJsbXX7bTYyLF5Fy7wEzC3K
 d5yJ5e27faWDfrCTzW5xSeogxKwAaQNBtjHjh56ZsIQNBZP6cslu86G
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62080-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: A56E7577DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
covering the driver source under drivers/accel/qda, documentation under
Documentation/accel/qda, and the UAPI header
include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
lists are listed as the relevant review lists.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..c5c13ad1e6fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22083,6 +22083,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1



