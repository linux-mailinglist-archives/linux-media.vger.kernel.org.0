Return-Path: <linux-media+bounces-55496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOSvLaWysmmYOwAAu9opvQ
	(envelope-from <linux-media+bounces-55496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:33:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB80271D3B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C60304226D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67AD30C618;
	Thu, 12 Mar 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="1ECajMXD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657E2D1F40
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318806; cv=none; b=JjEz6U4CH+wjXhPmvOHtOyuyrgbMEFz/1SrXwYgVlVlcUN0hd7Yb0DNw/6M89v4C/YlScKVLzm8Qx7Ph7B41yKRLkKoVpiLbC/Ej/MXwtj5jxiCz/qY2fVBFEKqJ4/YC9cmUuF/tp/WWN2qkVroMijcVL3fc+PBosdLN1iJunZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318806; c=relaxed/simple;
	bh=MqTuZ66JzGO8ml01Fq53svdMcGAX8nJcWPrEiuKJVW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKt+jI4vYmCEhmL3Lz216DNd88HYQ43sradtrNUAHrcP8HDUTlUf8rKk7/gqlr+14TdzCToJRv0bKxtAEMISsuyyYHpaKfqLM8NS/MYqRNGgfc8N+3pg5jR8wXmvd2PpnjFifw71mO4CuXQiLXUfNwslME1W3WJfR3r5PsO1l64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=1ECajMXD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2adff872068so4883295ad.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1773318801; x=1773923601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxbk04fd4kGg1i1zk9iwOBpm9KQOAzOfMWKxGAIYdo0=;
        b=1ECajMXDBM0f1Jzhvo1yhoIbzb2VLEu31mgr1m2w1ueVuYG6v9gAqy1B8kReg258F+
         +csLK6VeKehqZTa7oQJ2rYak2yp3EJI/E5kLZAbTVFaPzuaRjKzCwdozOkdaNpesi0CQ
         yw3YWqSkb4ekgqM8Em8Hye0DjWdwOsjV2SjQw+VNZtLgMftl1410nFGk51tV/NbwfQel
         XW3qw7hPZxGPsJPMg33PvklSqoOFtsj8DxYUdyYl6XGFL1v9kjv3wMoanPnu2EXr5sid
         ogthGrhRuRQASRItScZhFWxt96mDYv4qHiQROJfyWCLo9FD6QHFpGFbqYiUlW5DA01J0
         EsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318801; x=1773923601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxbk04fd4kGg1i1zk9iwOBpm9KQOAzOfMWKxGAIYdo0=;
        b=qPkDlVPzfEFFwfesK0geHjOBNsXtHRA+4/LqyyKZ4KT4QDZXxtsVHxAENQDH2+0Mbd
         nV0R6kdH6o2auUSb88CPu791Q+9vbZTY6uhyQRfSomw3lWY3+/b+sXJiUcLnU1nR6AAw
         XO08gijqcUkhSL9cjAkmuKyA2R/UnLVuiRxc1dKQU1Gj+5kNxoRF8uwZjVx6nund9bJ1
         THrg8WSMA1gdxRpeJxhcaQ7LnHrLMFlkQDYzPV7q8OyySN6dgOoXghCuaJWd6IsiWlmq
         5X7d9ZLZQOjMtWoS8upiay9x3lh5b4M9BKUx6Wntk3fTmw2xHZICB5riDp/wIprpi9ni
         ROhg==
X-Forwarded-Encrypted: i=1; AJvYcCUNret4pTGYo4qt06w+LckhxAmW1N2T1PyESKX6Hnpkgp9yEPQXs8qvJLZuOI1GxEE7gL8kf6efO6lIJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtB2eRqgAXXWhmAFb7O/Ss5lleNINuw8AflJsrllOtWPywXfR
	eW/zSMqc8JkJxYX1vDmcQlBZGXOAllAP6Yil7tJcpGRsSTS/6AXxFKAx8KOoIC7pejE=
X-Gm-Gg: ATEYQzxaBBnjZIJJU72bngoOR1PBiaI5RlMsQNV87hxNeNnE6XGjtaNuJynXr5WJkrz
	Qz+5PxaQYIXwtBip1nLawBb4EL01nyfFJhUXIOQvtwm8CI31inf6sZeqpxNyekwwK/cncW8Tur2
	15ocUAX9h46q3y73sQauLm0o1pIsOEqOYp7k+D9isRR0MzTufagMf2kn9wpWKc1M1sdyST4+3C/
	Brnv40F1p3J8kZ/J8bZSIk8I9pJtDuqGcwvfFYYwU3/dVen/XAyEpPmq/+iDpDtClnIZ+XaEKsD
	KQgDrMLaBKksa+DZ8C1/Y+T5llHrb6sIpodJpAAiBybNvOZGJhFI2sENglX61vSFktysWKU4EVB
	t0ttFcDBwcD018ATbfVSrMdmL5tHsI1RsGefBOhMRZ1eTs6J7xrSwUQUiKDIxUf7DV0FcnsFzAW
	jS5sYqQjkSLHxy1W8TYeneRis+ZjORJkBcozSuu7nGIop9mXDTUhdAEkmbOCqCq80SkLYDD35Vg
	QjwmmS2U1nnolCeh+9LRI6b+rVe/Vdi03oo11ih+S6uDJSQboi3JkBrIA==
X-Received: by 2002:a17:902:d2c7:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2aeae78c614mr59713375ad.6.1773318801385;
        Thu, 12 Mar 2026 05:33:21 -0700 (PDT)
Received: from localhost.localdomain ([103.158.43.36])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm55220555ad.4.2026.03.12.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:33:20 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: clabbe@baylibre.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	mchehab@kernel.org,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: pci: zoran: fix potential memory leak in zoran_probe()
Date: Thu, 12 Mar 2026 18:02:56 +0530
Message-ID: <20260312123303.73358-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cse-iitm-ac-in.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[iitm.ac.in : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cse-iitm-ac-in.20230601.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55496-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihaal@cse.iitm.ac.in,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cse-iitm-ac-in.20230601.gappssmtp.com:dkim,iitm.ac.in:email]
X-Rspamd-Queue-Id: 1AB80271D3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The memory allocated for codec in videocodec_attach() is not freed in
one of the error paths, due to an incorrect goto label. Fix the label
to free it on error.

Fixes: 8f7cc5c0b0eb ("media: staging: media: zoran: introduce zoran_i2c_init")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/media/pci/zoran/zoran_card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index d81facf735d9..f707bdc1fb0f 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -1373,7 +1373,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		}
 		if (zr->codec->type != zr->card.video_codec) {
 			pci_err(pdev, "%s - wrong codec\n", __func__);
-			goto zr_unreg_videocodec;
+			goto zr_detach_codec;
 		}
 	}
 	if (zr->card.video_vfe != 0) {
-- 
2.43.0


