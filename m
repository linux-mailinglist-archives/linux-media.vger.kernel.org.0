Return-Path: <linux-media+bounces-52171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K6xItAtg2kwjAMAu9opvQ
	(envelope-from <linux-media+bounces-52171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:30:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8AE5225
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB7FD3020EF4
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23943EFD31;
	Wed,  4 Feb 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iWCmWHFs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3C3EF0D4;
	Wed,  4 Feb 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204322; cv=none; b=nYOA0aHR4Xs1uWgcgr5SHVcHm+PxeYhIuTPQVMis9NuTFS/EJURCC/XLEW9D3gU8pTkS2QRYE8w68t8Kin2X1a9l15pZ1XU2h7ENM4paXyFxL/KxbSW6ybe1EYr6dior6BCBNkkxJr5oOeFFEsB5v+FAvDdciZkRiIVX1FhqUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204322; c=relaxed/simple;
	bh=5tT1QreBElhmzJ9xX6zFvlJg6hRkmTy0drDHUcyVEf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geqdRWDyhUtySAvPn3pGHm0Mi31thst18lqyFdvD9rLbL7b2PYne29dXnZJtfPURHhpvTrHhdmuFu1MOx+/yP+3jpvLClveaiVHhwP7op6SZ/Nxr5Q47v5mfCbCPmltC2oAJBMiTYAtUpXZRuR9NZTBWtNXquKpxnNMnAatsdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iWCmWHFs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF2691379;
	Wed,  4 Feb 2026 12:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204275;
	bh=5tT1QreBElhmzJ9xX6zFvlJg6hRkmTy0drDHUcyVEf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWCmWHFsKSdLFUC99b55o6TBcg1js9Z0ptZTLF1wD4SsuIJmw05tyU6+PH6oNNkcF
	 lY6SaLchuk8oWonZGq9ld/hxJupjI/ReyJYh56UjZIDAwi838NALD0YVex54u9Psbn
	 EkD05WdwsiKxplbpy24nQfUAbn1qDpZopLMYz5do=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v1 4/6] media: rkisp1-isp: Propagate sink -> source format in YUV passthough
Date: Wed,  4 Feb 2026 11:25:04 +0000
Message-ID: <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52171-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaac.scott@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 07A8AE5225
X-Rspamd-Action: no action

If we are in bypass mode, we should propagate the sink format of the ISP
to the source format to ensure the pipeline is valid. Ensure the source
pad format of the ISP is configured to the same format as the sink pad.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 716bd7f3c66d..c457593526c5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -630,6 +630,11 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	 */
 	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
+	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		format->code = sink_fmt->code;
+		dev_dbg(isp->rkisp1->dev, "ISP sink pad is YUV");
+	}
+
 	src_fmt->code = format->code;
 	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
 	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {
-- 
2.43.0


