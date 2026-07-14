Return-Path: <linux-media+bounces-67569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pj64HB9CVmpQ2QAAu9opvQ
	(envelope-from <linux-media+bounces-67569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:05:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0975579E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:05:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Oqi9Xb0m;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67569-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67569-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA8830090A6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA2A47D920;
	Tue, 14 Jul 2026 14:05:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0C47D92D
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:05:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037908; cv=none; b=RV/K9OCgiXsjr1yR+s+QORvoFx3CCVGB6wGCetQIyWPQeH9NBbwitpMlZnT1Coz2c9iKzkL776o8s0GrX1r5NLaYkR87ZyM4a5ly393gnIM/J+pu3B/qjTI1895eRFZo8IjWseH7W98Ucx5L398X7ExErQihd9RyIA3XFdPrzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037908; c=relaxed/simple;
	bh=ggzyTfjEV0/9dpcpFtZ9kFFL7YcUs8Yp4tvAlAGWUbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNtVWqe85yZq7WvZ3SFeWqMVLJSNzCzkVwRns6sSvvSpvQ1qVR1iWGl6oVz/LOaEKa79zGkStYUkGDJrZocKMzhxK0a8DnvBDB7cuE9xdzEm1CXeBZE030Q/aBDXTMZwCPl82ql6pHuMY1PmvcCTSlI6shNqv2WGkbWnAIXHYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqi9Xb0m; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3989857a91.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037905; x=1784642705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=Oqi9Xb0mI9qJrKIlNLfPx3ICZTOSNkSHZw03S8Qtn3hSl2piXUqtyg99DpaSp/kCOZ
         gfiAQBtrHshJs4v9LBTxXElaivLFqJG0WKJjSN+aKU7aNSeA/vNwG7sRRWjsxK7Un450
         iIWJ5/5yywMccfJnr+R3lkxXQl/e7KivjZ0NnmwlPAWc+EDZ4aM5uftvZpzQVjYGp1Xr
         K5SmIK+5Yy1MArmc6YXYPqk7naVbsl/alJIzrrkTJO8Yxc6R5lC551CnoZ28uv10eGe+
         ykMt616zKlochXVV/in/eMd2GFUXx9/R4kDyHywPIDOW9LJJYu1fJycwmnZ82yKcosdv
         sc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037905; x=1784642705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=Pq6RcrQbuVjsqp2dPQASPqhpLy6VnAWs/C5GOVr1C+rSL7nkFHFhB3p0JRWCffNsz6
         vkqaNqHsb/lsN4pPr4hpaAWX5Kr8HVflBxbGqcgzpQP/F7k1K9i2aOqMrAzxdJGqTQay
         4FTmN/Dsn5MLMg+brHHOXePd8ldQeCb2lp9ssvQgRFta3uGB00DpQUvJQumgFXsg+dao
         SsbcQzFHDX3OHkGzVe2xQWxmby+98XDlNXmRfQjxx5BA0ib556Prdf76V+xhKwP2+ZmG
         B0tcELmPnaZCLF2MSZJKKgsx1Db0fulwMhd0TJZvCEjRkSk0pakOYfMd75q5v8pT3AXT
         Zy/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpnx0HocVwE/p0en8eZgKqaU9xmgvCS2FC1JkHNOkB1ccDTF3T2B1q/tfDNvffACoGgDwCzPKhj9qImLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgjXPIghvgugx2ViJq5OfNcSnbgO3w33jMo6gPGcf7KAQrvdt
	a2wZ1qb/R9F3xsfiWn4vpeTD6dgB6MSxF/RNL7zUS80xIR+EvIxqyxuUOZebH/DF
X-Gm-Gg: AfdE7cm6J81MyrpszTZWSeVCwavYkatLilzW+CtDbI8UtZsjAYi2X/PXp0NxDiU4R+J
	73IW1teha0ehrcrN4SCJFPOaFr7Unw7SE6yXzrmsZ/rQt/QXWq8ci2ZTDPZzhEEJijsIyBe8SHb
	iJwf5l4lz2Sc8Vqkag/kyOLbuuFLLtNRletVeM3rKWmoeheQoq8A62sDhErG5rTYu3HJtKhgBqt
	cCY7pZ2xfnrm8/Uy29l4je3aDCxKmzNRgm0ZJ+igDDh+7DAdKje39MRRD65oO1jPpA8aZp2ztP8
	uj0cQTKkoSRJfiQw/VApczdjamteXH36DdwFNIvdxQbdB/TbSe+Ibw+jj5Sf9e0AY1sNNUykKMk
	3CWOXj+AMfjzg1zhoVCaXRF9ETiePVVFQXxUojFECqq+onHYlDDjy6dIusqSeexxFqiSNnohwm7
	Tb9Rrm3EWxQbUq63AVR8tm2/pTzHmJMeITPltxVnyzOkeAhzedRVfRIv+PbD4IRxJ4r39ybIq/Z
	+8PQ++T558qs7W6bE1GEymseJ2QkStCDOagqshE/dKywVo=
X-Received: by 2002:a17:90b:3c8a:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38dc7605e7dmr12912747a91.18.1784037904733;
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm86964943eec.27.2026.07.14.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Tue, 14 Jul 2026 19:34:58 +0530
Message-ID: <20260714140458.1276-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67569-lists,linux-media=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:dan.carpenter@linaro.org,m:error27@gmail.com,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[alfievarghese22@gmail.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57D0975579E

vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
This masks the actual error code returned by the clock framework, such
as -ENOENT when a clock is not registered or -ENOMEM on allocation
failure.

Return PTR_ERR() instead to propagate the real error to the caller.

Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
-- 
2.54.0.windows.1


