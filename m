Return-Path: <linux-media+bounces-67125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPkxNMdnT2pzgAIAu9opvQ
	(envelope-from <linux-media+bounces-67125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:20:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1372ED80
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CgozJNug;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67125-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67125-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D80C306ED9B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211003FC5D8;
	Thu,  9 Jul 2026 09:18:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143BF3FD12A
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 09:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588710; cv=none; b=akTmeIB764Q1Us2m5qDiRkY2MWLC4r0nKDmsNGJ8knPTvABKZv/CkzxKUfKxPBMN0MbMejcYd73M17c6Am2V1Fc0cQCcBQN9B19scu4preWfR2kzd3e3IjZm5vowv35gjZG1HFNOd2edflhJq/hPC2vV5bJ6vqxtIm6vvtXLm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588710; c=relaxed/simple;
	bh=2oYX8Ngqt8P13rm04Gkrm4P8lT9wrX8RtglJxUz8wZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoU7A8MorSTSOGuYCd3gYqJUyWXOeLUwp6klLC6Wh4OWyQcSrTbkq1lztUQ5/4HRU5m66WSFYOWQUwMxx/tN7qnfgnH9aF5umG/n2HUZeYT8uhxI3sCy98FrxQEpcVJw3bXSMP+pgo7F/9OAQCivjq0NRYyaf6h7sx8l57zHMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgozJNug; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cca0c5799eso13802465ad.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 02:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588707; x=1784193507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VIdnZJ14k+mj5oiEmsN8IAS641M6dsRWUzvfQqf2tY=;
        b=CgozJNug53yfzLAY/uUI0Y3MqXzLCEFZh/xxNxVpxNNi0uf5MuxD/7kzkxX6TIsViw
         63HNWL3r1ieovo80zfXJLQM1NKl+STij0VB5KUi3P1cb0akH4eyK9hFC8zSfpNoElyfR
         lBh9OY4TQnunLLXJAciij7zaDXPxO0z1O3EsvS46I2SbrESJMdBkYvNWpQs7FTY787Cz
         Plf2L8yhlQz4mw3ZmT6uJnJ/WyU3cp4ccyoDfESswVhuwSLHijiEMIGbaeAHsDHJjiqv
         vyfwTI969oZfyCeUeLAPxMCkapjOc1QDdrDPf2NuV9gTUepEhgISkZ//MfWGtkfVzOdM
         Cf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588707; x=1784193507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VIdnZJ14k+mj5oiEmsN8IAS641M6dsRWUzvfQqf2tY=;
        b=sGYpNgdNKnIhmV3Fnz/99WbfBLR2TO9n0jEnnUI4P0aZIF+8KHpv8w9ECqMAVVuPOQ
         CFGZGBWXGvg53TN0wWgwNJ7ytEO7Kd5SRs5/aB9/Hp+ILwx4f3nyioeVQLqimXeMcCeD
         ticE1lojf4Pt4LFhKYJwo/f3Hcwdxq15FQ80CX7PHUPE+SuBFCpGsl2mwl6Za/GKMg29
         X8ZETzUXd3GGnIKdJbcKR678t8taRpnl3Liq5KKcxtlLpH0WSj9DOF0VHlb3IVQTu7tb
         Myp4ZiqMaLNKpka0od3lDBPM/h1/VZ9JDjeJ7Tr/jrlkMAYsFVI8ZrReW162EoykGIAM
         mIhA==
X-Forwarded-Encrypted: i=1; AHgh+Rorjm5lxJsQaz9wT7x+zvrdDlR8wRcKNBfOnovyT9URJ/nLF4Zgav8KqcxBSeeGUcWYMjovV9nD+R+Wtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEf1yiuJb/sxBqgPZBrjilyCHyV8PPmzORioFQTKJ4xsvxkbiO
	y5kF4iPadW5mZmJ+TfE1CdxkinfZocCdLqU56fKo1CY7f4bStMYUQVBE
X-Gm-Gg: AfdE7cnceK/cBZ2DcvfWK1G6yKgyazjshTwcC5/hdj6WfcVRCbv/n7Zw4j4hwJIHS04
	Y7Oj5/vWYq7PzQ1p9QrB602hrksW5ljA06Lga0Z3iIfOd8OIZ0O8yZvhZ+rHuIKDqPyCwiSWtKq
	5h/r3HtHmLtCg1EXvpLLMJjygLas8s8dj7CBJ0azZUd1DvnzknztSnUfD/xApsM9BPypiXseLhu
	uPPKBqL7RVJEGf6KvqwJKstS/GzaN7q9h84PzKocA1g/HZ/0sCfnakkijTTSF+M1CmufAx6RKaQ
	j00jrtPHqpuBITXZGrHiSsnqmMKnaiEbgCK1zcYDHRmLJy/BgKq+zurkkeVcGs0uFcztoWMTrhI
	9XaUrAXFYBtG3CFycbM02OvOEfXopNjg/14bPqusOuu9nXrohpEyT6558b1so9PugpNL6HCZsae
	IUZUrat81qKoujC8dbj828CiDqnuQsIKtimxoarZMH+Hc=
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr7288188637.53.1783588706771;
        Thu, 09 Jul 2026 02:18:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:15 +0530
Message-ID: <20260709091813.67081-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67125-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49C1372ED80

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb1..f9c818b0faf7e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


