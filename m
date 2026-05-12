Return-Path: <linux-media+bounces-61207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCV6ONjMAmo+wwEAu9opvQ
	(envelope-from <linux-media+bounces-61207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:46:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEB51B3C0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73ABB301EC6C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D28368D50;
	Tue, 12 May 2026 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCfOGKJU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B5F284690
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568380; cv=none; b=IH5/nbzo57L40GnMH1FyKzyzeIcc1uo0/nWufs2uC52c9Aju8U0mE8hlMx3MIO3dA8AXrCvFSJ05OEHaMjsTv8eYmRwigJdcSLmssQUlguTOWPMjKznjMHPHgu0F0cZ8j0o5Xxq7strn+6DdfDbi9rCehoXTR7FtnYcuzgF2y80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568380; c=relaxed/simple;
	bh=CLY42ZZOGo+4sQn8BGDBCrauhj4O6Tqcq/5giz2mCCc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=DXtpxQlte2QOqezWOpfTZTRv6dZ89riyg74UtFL+GZQN8MfafBs+agwRMQNgaWXxQBA8/3eL9kPeelmPxR0+kn/UJLoMdht581u37Cg5AtYCMHajIp5uPdcv4zA1zGiZr8jTJW8/uE9QxSu9ijxuMa7kmAAcgqp0cikgEulXiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCfOGKJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D446C2BCB0
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568377;
	bh=CLY42ZZOGo+4sQn8BGDBCrauhj4O6Tqcq/5giz2mCCc=;
	h=Date:From:Subject:To:From;
	b=RCfOGKJUBOPM9hASx/rgGiuNHBWYXlgbNdkin7pbcURBO+h5u8XrtJSdmZF/p37Bz
	 ElanYeR2E1eNwMF11f+4IyksPWx74IRs55APoGwGIxEdgxnCuXo/4eVjhUFS8jIroL
	 CLPWNiCYUysXZkbZgVXSxavyoKq8Z0hKXe1TSe1KN1Hn5rGGrxCoC2Ubz4BsqJq+Va
	 7Oe49e4eDxM1MMp7YR6k5jKPSYWt4Aps6qjRfMdXgMIrbeD8kfCEsM1eUPrKA39fD7
	 Iu8UegO/U3jRisoFOgQKusEdP/VEtLPtGDmVqvK2mS7Fp9mt94MvqsaMVYlXTkYEy8
	 ffLUizEylzQ0Q==
Message-ID: <b643993f-e445-4be6-9f14-74d4c05c4b06@kernel.org>
Date: Tue, 12 May 2026 08:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: visl: check if ctx->tpg_str_buf allocation failed
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A0BEB51B3C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-61207-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The result of ctx->tpg_str_buf = kzalloc(TPG_STR_BUF_SZ, GFP_KERNEL); was
never checked. Add this.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index 127ab18bce99..5e9bdd425d4a 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -339,6 +339,10 @@ static int visl_open(struct file *file)
 	}

 	ctx->tpg_str_buf = kzalloc(TPG_STR_BUF_SZ, GFP_KERNEL);
+	if (!ctx->tpg_str_buf) {
+		rc = -ENOMEM;
+		goto free_ctx;
+	}

 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	ctx->dev = dev;

