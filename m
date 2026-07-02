Return-Path: <linux-media+bounces-66373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BBU2LIVvRmoyVAsAu9opvQ
	(envelope-from <linux-media+bounces-66373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:02:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13E6F8A72
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HChuhe3r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66373-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66373-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE4AF310F121
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3AB496919;
	Thu,  2 Jul 2026 13:56:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CDD4ADDB6
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000580; cv=none; b=IciJUoL4bVpaVDaI32pmYob+qrFakO4OP+bp3JUO6Qi3x6EkM6DXGp+Czm5fItAaOv89DJGVWTnAyr7No5xNYSGw0ViynlvgGaJN1J7Rq6M4T+I3mgyvShqFKKgZGfJZZJ4Vpprrqe8CCMzkxHPXx0pk9T2pZtTaQWXwPqs1EfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000580; c=relaxed/simple;
	bh=CQ0bp6OhR5tg/MytInxf6VKRq4vmyqKV76VIK1Ch3B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7W8V8crZKaAGxSvvPlUx1aK7lyv2UgGO8zXUNzzlfDX7l402FM1ZgZh5KFk/hwCcGxjQWWH6xtsXjZBIQNTM1pb4FxLLyFhts1aRB2qRnW0f7px7oaujsHEpFVwiWmYbluLGyQTqnxO3S7DEnhafCK4U4oqyW/jZIiXbtbrLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HChuhe3r; arc=none smtp.client-ip=74.125.230.65
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39aea8a4192so8704431fa.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000577; x=1783605377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3affFkiTwyTVm9batdmWSlqrtZKDQ29P9VlvW5c4Ecw=;
        b=HChuhe3rvs8uo4oovAIvfF7bAFxk2ecPVu+ApaazT1G3CceYPLYGxYfOIU9JADD2GR
         eqFY+L/mPgVxFOaDSyuSg+tnwsHfGAiQ0VVKX9aNv4NkfJxFSqphlhZo+TXf/g32IfSF
         hPL4OKrFaEQqv/V1LFBAB7+xOpn+00wNMrAK5D4S36bXcHu7jEMWgjkPV7wvfBZKOXg+
         SjNBglY1cfQz2eXhW/4ddQiBV9c9c3sRSUVzr1YeiAgo+wkQTLF/rROmCnGlMfzr3gOT
         V03gJZ7n19j251pkBWR2FqkgV6dclwUzLNv0Vclw9o0mHE7cEFTrgdnPyvd0G4D6R8R3
         UfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000577; x=1783605377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3affFkiTwyTVm9batdmWSlqrtZKDQ29P9VlvW5c4Ecw=;
        b=rngg1Z1wjjJIgRNnrVD1xjPmoRGLbUENSX2l7LvyGKHXkbVNRRImC3O9roRB8pJISR
         eBY700Kfu4mDo6V//QJDwxXzE+NHB9/mIgwDzbqO4IcSCallAQ+mr/6v0qoJUJrcwtpp
         f6wbggkHifCmFBIq4Rgh/RGoQTBaI/xk+cENBTEWtvAvC/Wln0FuqvJtsMg4GNqfRdJw
         f+JCkS+sUhi+349fHu6QKhZS7bU9r1L2BIotSuexXUwa7uM8is6Z3x22Iw/jTvX0lDqP
         XIX6gT26q9hcGwxemGdKZxrAs7urfoRw5e3TIEIUslQTaockW3DOEKO1I1Zymlrc5St2
         QLNQ==
X-Gm-Message-State: AOJu0YwIv8MmaxYnEJEg89LNFul7oHdibQEcov4VmHbsMLlk7REJrBHA
	Sr46EXHDju+dySO69nl4ELJUe+7Jbv0n7OmALcDwA2AX5zZ0DbeHmGN+
X-Gm-Gg: AfdE7ck0UP/hjvX9uo9HoRuU235TF+ebQV6IzzWmCFXq+t6c9YDWW0MKgZ4sn5V1gye
	LbyA++qUWd6bgeBhXpMtpnGywbwSyMABO6utBEDj7NdyBOGkeIn+nrUWU6GeRNWxIHx0/wd/Xo+
	k9JYyKs73vV8Q6gevFGv/lH5iE3dyQjp/Scn0NI3FrNjEt+aC9KMl1uIbzD3hOuxxWN+NbAB/Es
	bX46SmxVY5HkAMD1Tfsetm/yIhYs+NyiSBh4CdJibgFMxgG+owcAn9AaFId9+6Y63EA3SMYxGfQ
	W4wNBltKzsU6xMwhyTekXEVNyZM/cLbw2lB+4jeTxtX+KmcJIU4Nc6EfmiO19MZFwkjQLpNEuWL
	HbNhvgMNwfqPpKjX4L+2Vq3zsmUSf+59ddhJVQC3HDaM6YeeFupCYduk5C8NXz2MIE60XfgSCOJ
	Mayne+1spy
X-Received: by 2002:a05:6512:138e:b0:5ae:bcf6:b07c with SMTP id 2adb3069b0e04-5aec6795a7fmr1431877e87.4.1783000576377;
        Thu, 02 Jul 2026 06:56:16 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:15 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 1/3] media: atomisp: fix block comment formatting in atomisp_internal.h
Date: Thu,  2 Jul 2026 16:52:28 +0300
Message-ID: <20260702135230.19030-2-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66373-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD13E6F8A72

Fix a block comment formatting issue reported by checkpatch.pl
in atomisp_internal.h by moving the opening '/*' and closing '*/'
lines to conform to the Linux kernel coding style guidelines.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5a69580b8251..6c4aae4e9b7c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -182,7 +182,8 @@ struct atomisp_device {
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 
 	/* Purpose of mutex is to protect and serialize use of isp data
-	 * structures and css API calls. */
+	 * structures and css API calls.
+	 */
 	struct mutex mutex;
 
 	/*
-- 
2.55.0


