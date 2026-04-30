Return-Path: <linux-media+bounces-60099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALzkNudm82ky2QEAu9opvQ
	(envelope-from <linux-media+bounces-60099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 16:27:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3504A4100
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 16:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD923054F3D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58C342B759;
	Thu, 30 Apr 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bacCelzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D427F01E
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559142; cv=none; b=mra83xHCO+97o/4dWxaYoYi5MbPt96ZTzUNlmdixr7iCPCR9R8NnsgKuTFyxPoIuv0egcGzgJsuv4idpwwAMyMsfTiUHb8k4PC1RBmlMPC0DnpqWB6adQMe8lKbN6Bsbc9DqHc2HSP445TCiCJOcMpkbbislhP4XkypHhYdN4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559142; c=relaxed/simple;
	bh=SsB3fVBmTDjC/TDn0evKIsstRQxjanBDMF1KqALO2L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYLz6B68HeVOa9goEofKHDN15Kd25PZ38BjfxUwocQjfj+d6dqpd84zyEbX3p0f1HS532tqE3lEGcer6Sk1v+NlDtrQ6Ix9FNU8+yJFUuafRzSFb5D7NGhw/YMC+OLYl5KEixqhCmkfnJNzfter619KubOIYFmtNzjYrS8chsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bacCelzH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad21f437eeso6744765ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777559140; x=1778163940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=bacCelzHujp7TYD0YyDqoh4B5auHMTsnUD76RoUlLK6i43+l83TToeiOinIct2vB94
         3Enlx/7oWxKl+m9SwpHea5999DziUUmjDbXRdm8r6I50WFxei1sZGSydhe4Lmaqzouws
         tvgx+qJRoWRW5x6qYMCSS+Q2BSLXi9yDNOjMxvx5ZaF5xHx6eD7biqyuDP4BMYrW76DF
         loV1H7Q8Gb23A+V7ywZRnKtrXwRRnuRAODCjQEOqXGErbvhh4fcSBq1J4z1YpnfBXkcw
         tCVnZ2G9CtWQBEgpaDFk6hM2QG7FBbqq1jYU7vVEMPQLirVjwnZ4GtizU3yqFSTSyY4p
         QUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559140; x=1778163940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxQQAfFaaiRvrhNuhc/nEMGhJjTGCuoSHZosD17X3GQ=;
        b=sjENj2biCIUZ86EorTrPmZkVEigTljgxsJfXtO+D7xLwt5FGtAK/xMyDA6Cj+6Sb6w
         JH4o798Os76QxvQp/dyxgLWDhYFlHwzoZkR6wCDrEIi3WXXI5Z5Dp6ud1VdsogHPCzU5
         JXbMLYJvPkPOPr9/mjyrybHiGO1ueh7Tg/XTRB0j8GE0EMRGyRU1BPN2oksTkcH63GJX
         vIFSdPEB5d7hEzjDpbp/BUaLWSk7UJB9rxtjnQuAj10AikMOnRV7wgoB7pDYLmuZvdYh
         xcjF9Y0Swh4QljC8DOgQdo63H0AZWBUxKjrZ7XUm87VbpV74ekeI9l65/N2BnmLcc7pc
         oEDw==
X-Forwarded-Encrypted: i=1; AFNElJ9Pl1CQcbgUOJA05vdtjYcpzPE3i13mFXOSB1OfhloDwmgatqrFt+q9Tq0PGYJ8FELtlPIJG35nKipmZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymERwrTEF8nCvwXrqbvQPDvmfYO061hHhsz8rP9OwvMV3I6t2J
	NcFFiSEWL6iM0pSdRg65gSfLSogEPHLKqHAXPs1SBYP0wkhRLGS78Vs=
X-Gm-Gg: AeBDieu9du13yNMCylcHSx6FeqDhqgrlGPKsWU/3DDiRuJSNIJ/mxAOZkGZiRJT5THF
	WUbmpKeRBB5zOK6v5WaQfx6JdlRVra8R43ZLytV8qYIsLAWq4ERxTJyCveaRUJmPpiAcsSvip5B
	LRoErhbLN8wNFdpvym5VcmtuF+rUij/8W73duWrAFOSR5KiXHrJkWRl+wiF/VNlQGCUfr8GPYn+
	AkAVFhr08RMMKHTEidQI7/PkwpbVlJQWqXPe4RLppeyZSwzyOebnXI+C/5Oa311cXWoDREK48a1
	sCp0umW8PmbscrYkmCYicteXD4p4HGfHFFBD+hSgBLnB9iqn9hR1E3fDQOag+urrwbSSq2nEu02
	LBmcsThuBWWlUXTQLUgbjInGkbyDxT9so2NTg58UTHY989ZAjODcDEJCU7LzRxTZDhedjaIVoVb
	Nt0zhirySy26c6ns7XltHRrIOYrm1siR/dNwObt2l3ezx6bdoo96HKElDTXiT0xKqFQwl+jaMu/
	SKXbGBzto2A+vF2T+dbLL6WrlQTeybQo/8rYNg6nxj+Qhjhiq1dLrzlePZTEPY=
X-Received: by 2002:a17:903:3b86:b0:2b2:ec33:cf15 with SMTP id d9443c01a7336-2b9a42dc3b8mr23951415ad.7.1777559140212;
        Thu, 30 Apr 2026 07:25:40 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897edefsm54194885ad.74.2026.04.30.07.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 07:25:39 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] media: cedrus: clean up media device on probe failure
Date: Thu, 30 Apr 2026 23:25:29 +0900
Message-ID: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A3504A4100
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60099-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bagmyeonghun-ui-MacBookPro.local:mid]

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1

