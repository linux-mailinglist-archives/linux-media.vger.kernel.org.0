Return-Path: <linux-media+bounces-61079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BUTJtusAWoMhwEAu9opvQ
	(envelope-from <linux-media+bounces-61079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:18:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCE50BC55
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12BA330167F5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2CB3C872B;
	Mon, 11 May 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZmTD6SV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD83BFE50
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494420; cv=none; b=e7u5KUEAbFCVls6UC0GEMAWg7xnfLO/e/KWxRdDS3TGd4568CCUl+oI4nS2FfBJzYtL6FQ/XVpEHHt3bFnsiM0VN69ouOgAoByBBC71bRIxASsx4bMopjWxiFn/lwW624xNIxhFHi07r/kipe3LLkP6wg4AtPW2PxcNSNF1mgZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494420; c=relaxed/simple;
	bh=pOukjRE3AhLVGkpDoO7CixW5vEgLTaHzy7FZxk0/pVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eyT/vVkj1ClAlG5sIHhHa2kP1PcZNKErq1sS7+6bs/J2J9KPDq6+MgIDeeyoh/r99k6MvrA7YD/Kled32EIzcmfypaNoM2kUaZVUQaoo3h5rkgUI3YdNFQ/C6K9pgXJTDRLIQoLeY34HKPuI+oeAsRQ+yISDEvOPTHs2aZ7Ag0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZmTD6SV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1656319a12.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494418; x=1779099218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPd2RlUj6wU/iDOi4CdTz2GJRj2DC/sQzjy1WbMFzdY=;
        b=fZmTD6SVLYL5DwwfTgNaiO1XQ5HMX/qfUGj/z/jIO0Y1N2yvLG8tM68ib+s7VJq46i
         Uaa++86cyjwHV8VOhsBezUQluVWwdM/s2hLkFUCZS9tDYoBlVg5puhCZSsOh59smMYaE
         o2Tfi6Lf4d68zKkOmjjrgV2le3rcudSu0aS3A7fDvV5ffzJu90UE+cA/bdIq7ZqvckRv
         ofLpllGX502+RqbVniiJ+TGMuV0xrCCGuEb6xu1IQc3KV1+Vzcpt0jx3pnSyYZh1AKtl
         CoxNBq/XIeXI1BV1+KXVvG9haXdnLZ9/xfmjoJppcXUAJika9NxiLcpozsneVkKsHsoO
         zVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494418; x=1779099218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPd2RlUj6wU/iDOi4CdTz2GJRj2DC/sQzjy1WbMFzdY=;
        b=P7LuS/OUaYN+S3g48e/vA11MXCEXZ4kKILWV/I6jbBoA2OtGLmy8is1BOKbUApMK39
         4OaPIGLW7saCE2ZAYcHpt7CcfCwlGy8HRkWiiuRZ2x3Te78z6TB3izoGfUqviqMCXlCJ
         GUUaxvCf4lYU424MkPf7NML4wBpzO5mPLvrj+szHO+oK5cSpn2TssNeohQ5DCSN/GN8F
         gVjEHydakpoYH2y0A5fxkiT06XFEKjerBWDJe44kj380j38kKxcObkWLw7uO2ycBSraA
         VDzJIa+F6mfkewyCQ3Ij0vaQ+s8dMnwstsHUZhVr1PjTRFvb4KkkgnLuGNP8y9s2m+fm
         dgZg==
X-Gm-Message-State: AOJu0Ywgxla0mjL6gqNaxW+GW6N19saYCrZj7Nl2Ugg8LZqH5xV6MxAs
	UlAEC0zeFPttIsfm7lLWUmFHCeGpHqzHtE2digjMGTuM5Bpkf6tQbI2+1xSRdU8y32s=
X-Gm-Gg: Acq92OFrHCqR4qB2b0uwYLLZL1fL68CSH1qSRTxrOxjtkq4qFO/cv4pFzNwSz1zrF+I
	6/ENdzvJt8zGiYiC055/V/BFsKNHD7Yzw5G56ovDkLISibi/ef3j1C2OB8j0IA90ESwmUxIdcfZ
	m7jm8dXsq1sZ+b0gvIfueEGDbD0cdBdAVo2JsnMDglFB2h+KqqKSRjQhEtGmS2U50UK3FBUBqdT
	hZWyJ8s6ZI3dNFLHmCtS/47psJCwOviB6WHY0LUzyHIr31Sj6M4oTm7Hp/Wxtc/FQl159HiT7uY
	IBDxBicsk5DDUvq48J/KEz36CNmMIni1exlc+/HZQugYVWcF8Kcy/tRxA++QlsuXkxlxGf0VM7x
	SL2sAPmUdpYwRBMpnuXts+RwTTLT70Ly9UO6IxUvZsVLzxXO24BkNVv0YseXboSUQOjnI6DrOik
	iunZQQuVgo+EZS+b+9py03iTSP4SFtBbPOH8lfCXS4ldz+U6jaNIEd+tw2vyLcWGXfLTQAOWULC
	50=
X-Received: by 2002:a05:6a20:244d:b0:398:f1ed:7fa0 with SMTP id adf61e73a8af0-3aa5ac5016cmr24786055637.55.1778494417962;
        Mon, 11 May 2026 03:13:37 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be49sm8516350a12.3.2026.05.11.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:13:37 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v4] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Mon, 11 May 2026 10:13:29 +0000
Message-Id: <20260511101329.8332-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260510172405.72408-1-mokshpanicker.7@gmail.com>
References: <20260510172405.72408-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9FFCE50BC55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61079-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


