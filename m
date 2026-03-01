Return-Path: <linux-media+bounces-54028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XI9lF16zpGn0pQUAu9opvQ
	(envelope-from <linux-media+bounces-54028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:45:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D649B1D1B90
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F0973014644
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD382E1722;
	Sun,  1 Mar 2026 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS35R6kk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26A21B191
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401495; cv=none; b=KLTMaGwQRf9xRs+beXh/gO5FB9a/gcDqnJfqgx4fMtKWyli5MwrE7qA7CGqC4ZPV5W+trYg9Au/VRfMRQ22nz/uVg0w+PNhhkZrxK8qq/BJq1Jj02+/nfebPHvywNgYZp3wxhN5Nzo4f0T5TndkwJwb/zMcHgIm0XtSF9n9VBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401495; c=relaxed/simple;
	bh=/bLY/OiBTT23uQpdBtKHmiRAv6u3vqIvvDp1+ObZ8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oY0BsEn2MofzXpQ1N3mn75KEH8rAgi3yhUrKDxmgADZ4l55pqu4D08NRKX7FmgBQsI+gjdHJ77TrvS381cyFphuD4njiEXvPU6m2H7mNtsKUPSZZgk8tNd8KGkllP7+qTERoa35i1yCRz/0AyUnQfyn32yqcxbB1NDa8QAoBIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS35R6kk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-389f200c26eso50921621fa.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401492; x=1773006292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/PWoH5CsN7c/aVZfwGGMr4G0Szu4wefmjBI0fFAv2M=;
        b=nS35R6kkXS4GvoVau6REpwIzlRxKdV3koP+fg+iEBwwml0rCRBinZCm2fzgHC88jFI
         G/yNK1w+VETJzesy9+IxBtBD25S9DSeoLQU+59LqPLJjRXLz1MnZDpLnqMddvo7rciOQ
         6C/NTsQQfP/mx1Efk8k8QNS34zUbdqI/7X3Ov3i2jTB4CGujsi6NxhwL6CZSIhpSUk04
         PFzGf0FWKSHHbcwaNit/nj/LpvRjmEE+1MTCkIBHNXf2Hhd3NCdlHT2sfP8o6Rh+5/fa
         bw/GSg4fCiyFPFlwOSWajSuR/u6Cdee+ZynHTkAgpcewpd9IezG93X4kzdajTzdxRNZl
         x69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401492; x=1773006292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/PWoH5CsN7c/aVZfwGGMr4G0Szu4wefmjBI0fFAv2M=;
        b=t5gE25gYp3RDoupFtNgouMusJmOA2z8ueBHvIrqAAkR9dQJvnSRtTcxBAK+WYXmSMs
         E/uLeo3oo49QKIq0C6ljayCk8ug8tQL3YhBO76OBeYcstX2pvuCFOB1eGAfXcahG9ZOQ
         zs9tGq+YKSZBFc9HcjHuysElqg4r96M+W+QK224AJAJ+2FfeIFFhT/GZld9YjoLyFy6f
         8eQZ2PuveE9LXxxDSa4hrBFW+XuIL/31OWeHUCzwP/9tz0SE44gGmMYWKfYh3V+J7Idn
         M/3um2px1tBlbNIitH2aJ0UNadnuPgDW4BkXZzr1NNTvwKDoWafcl3fFp507ejFyVwTa
         YRAg==
X-Forwarded-Encrypted: i=1; AJvYcCUv8sMnxAa4gH/KmpYXd36OmCuEChsV0Z9WZrooy3DfcdhFIZfLFSu4mruPXfbEkbnrZ0YVPaP1NMbwJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOfb1FbUGvan23bjTZtj+2IhbYeo5LIh857K2g2ZOaQnFHgbD
	ueejoX71/6UC6b8TNpimN/G0AcEGt12MnnJbOIl++Ayx+AnvySZK7up5
X-Gm-Gg: ATEYQzyS39OzDprM5BDcTUNIvLMp/+t4achv66DgjAzUlBuHWoVnyEor1C3kDA3r2B0
	bBme6/oeFKpv71Pbc/mNi9elqCrNB17ZUioEwtK1xFh9M1xEu1NIpKdcE8r9jTo5QhMrCgq5YxS
	jkGZtAzL9nc7spFcx6YtcVQZizNbfyjxTvtWbf5N6URwvbQ0+BbImq2Ia8YXssP5ZnYfUPi0qsM
	HbuDko1BLGo9dD3tAp0QbXFAqI89w1/JS6qRVkWEMLCk7se06cttVY5C+ptfVeI+AX+QLGV7E+1
	8MG1ErgkuOt5KABSDZSwT3cBoy867QRQlaHYhWbVFpRAyuHInwBP2mALs0KeuRNR6+9/e/x3/YE
	BWVEp9fH9zxNHBUJf8h3zCKBBenxTZXbEnaWKHOLY9D+x1THZoXrnaRSj2/BC7J+y+D9lgPuvkj
	5U6Q+sZbZuzt85OLZfAsjJtk2I9w48jPmmSyYI7Ajf54syE08w9Tb4+r90jwcJ5rDBTf/1T7yvu
	g==
X-Received: by 2002:a05:651c:50f:b0:385:f7ce:f321 with SMTP id 38308e7fff4ca-389ff15f271mr55836741fa.26.1772401491773;
        Sun, 01 Mar 2026 13:44:51 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd89b3sm1233535e87.0.2026.03.01.13.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:44:51 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: use __func__ in debug message in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:44:25 +0100
Message-ID: <20260301214425.3949-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54028-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D649B1D1B90
X-Rspamd-Action: no action

Replace hardcoded function name string with __func__ macro in
dev_dbg call as recommended by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index de0446997154..be916ca13453 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4010,7 +4010,7 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
 	unsigned int i;
 
-	dev_dbg(asd->isp->dev, "css_input_resolution_changed to %ux%u\n",
+	dev_dbg(asd->isp->dev, "%s: to %ux%u\n", __func__,
 		ffmt->width, ffmt->height);
 
 	if (IS_ISP2401)
-- 
2.43.0


