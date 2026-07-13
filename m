Return-Path: <linux-media+bounces-67499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x3SsJqUeVWrBkAAAu9opvQ
	(envelope-from <linux-media+bounces-67499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:21:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB574DF7D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jqgTijHK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67499-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67499-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 851543028C4F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 17:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56A634750D;
	Mon, 13 Jul 2026 17:21:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B662E8DEB
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 17:21:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963291; cv=none; b=kJmasJxoumi+g+WALcqr8MbS6ZGQhm3ax2jHFkk+XOczp4n2SXYjhg0BY1sgmFwdEnucd46pOqQaHmOa8TfgvH4XCkh0F+av79NHcloCujVnZjhTnLCtMheRn3C7AYP10SCF4easnotClaWjwqTF5HSXoiwT2YoPnvGKMf0RpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963291; c=relaxed/simple;
	bh=H1Iz7IMNy+NBBLF2lJ4JDxKCCY2c6NJXPxecRbmI2+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIZIPnSDDUJ4fJGaBR28FW6x2a3CYwBzbsWiSZ3lfDIzEpIt1oHprqcI4zqDH2HHjDccgFpb9mIBh5SxQDv3ZCS3Nm55JGiBJ2Du/klYHUfoXPa61/YlOgli66G6gIB+gSnhn2RLXkIvdUKNK0tjI3SokH0zJpHsmL47Q/JKsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqgTijHK; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1796705a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963289; x=1784568089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNqpsvb529pea4MTwMPJfT3oG4xMq+3jZrBViJ1NtuA=;
        b=jqgTijHKeVnCLadq5qWVEkX6luJ8bSulPzGktOAsFGUChLERXlepLISrfwghmuCOD8
         LJhA7ID+8hnC59LWbjmFXGVHMBVknnjQn90AXhi7tonElE1e9FtNp38GdBTCM4ptLk8D
         y2SC0x73o3ipFuEbC3B4PW8r7EjdZ1Nzqa6jhHVlp/t4YEd236QzuvT661yhrE8aW/XH
         5H0RmbCZ8lMfQf9shEFVsQy/Hm9/NeRPLOL3RXD71UJCazIXSj7f6LV07QzjRFyeOV4A
         00Wtzr2ao1cbC5LaBDIF9UPwko8q4WzNLS7GulZsOoSVsT2ZXVboqeU8Vug2d/bPoPd3
         QaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963289; x=1784568089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNqpsvb529pea4MTwMPJfT3oG4xMq+3jZrBViJ1NtuA=;
        b=JwRXuoFMHSPPdPrQSv7rQ9NeclS37XTWinflMbtXGs+rM/lXuxOORc0/qnI4o/2jnQ
         9apuQ2rgoHuSNEIJEpREi0o6W6a+I2Mv4jv7FT11RDU8UdkaV3XI8qGiu4vTGZR8XDQ8
         9gjjG2gtiaF9kyS7jCujPN1kujs3nVm8MXL1s2mk8crGHvW2XYazRvXJZkN908flyZDK
         ljgb34LnFgNVPJrksnXxlBZunBBaQbS9+Q2Sso5wQ1y70KC69Tb0SEPMheWCk2R14uLp
         0Erj12VmtZGmufc2mFynQv1+EDLGDHvSXsrGuZoBE+k46P5+odCxqfdEeFr+6iqA9CPv
         gQaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8AeQDlqAWseb2c+f28jPuXCcb22MtaNE0+6xbmOp0fPHIOGHWF6G24bttKNApQP/4OcXw/9Pf3/zI+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AQslJdGMIu12IWgTEBe8P2ASuKDPNk4/IG/Fff+oku1FU+FK
	5Hr+9Tsjlp7RgFKOOwn9QYHvrOWT44FOgGDAsrbrn/SHWwILkkuS0ZUFQpka7dl7
X-Gm-Gg: AfdE7ckUQKJNu3xKH+WZeQzo9a6OhiKl1m8/fELs2PthZLLG5XX7Hwx8Kbw3+SBP16t
	uut48MftWtufBSUC0uqVbnXp6yzqvIuBquPHJGOCQZSecjv629QWsSxg6cjg0OKETLTdCz7Qsd7
	JAw91IwxKKfwTZglhf64EAx4/uqN/wO3nMb4GfVsZMhCQipJeRWeBarfaCg3Q9tQhH2RTSSUaL0
	mML0/ufdAXbu77RbnyPcWB7hNynjFoDPrRzg81yzV3EP5gN5gTUtClrYruZbppfbYB14JkNrM7Y
	jGGmjEhqArJPjN9RAJd0vvjFPsVkHWthmztdwzdUlemwj7nPX5sNdcffBtszYLZkcVkaz6N1VIs
	QHyHWeOJBJoddoQM7/DSRcRM03QOSoBJKaCWpFOkt3RNHA/MuUxmxEDu2U/Zj1FjKcp+9qDd4OY
	BEspUz5DMOnQ67fdu52c0NbRNXB0AoXlj7nSGvX2gGb8YuX7vBiDuyavF3BkYOZc+qra6qOB1ng
	FptpQLJEroaMyGBtu2ZgxNPu0IOJC2xMxwZTMMvXEYErGY=
X-Received: by 2002:a17:90b:5112:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e17d96405mr129387a91.6.1783963289228;
        Mon, 13 Jul 2026 10:21:29 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm57958608eec.6.2026.07.13.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:21:28 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: ipu7: add NULL checks before ipu7_mmu_cleanup() in remove
Date: Mon, 13 Jul 2026 22:51:27 +0530
Message-ID: <20260713172127.615-1-alfievarghese22@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67499-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:bingbu.cao@intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06FB574DF7D

ipu7_pci_remove() calls ipu7_mmu_cleanup() on isp->isys->mmu and
isp->psys->mmu without checking whether isys or psys are valid
pointers. If ipu7_pci_probe() partially failed and left isys or psys
as NULL or an error pointer, the remove path will dereference a bad
pointer and crash the kernel.

The probe error cleanup path already guards these calls correctly with
IS_ERR_OR_NULL() checks. Apply the same guards in ipu7_pci_remove().

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 310e3f24e571..41436f22c684 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2637,8 +2637,10 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
 	if (!IS_ERR_OR_NULL(isp->fw_code_region))
 		vfree(isp->fw_code_region);
 
-	ipu7_mmu_cleanup(isp->isys->mmu);
-	ipu7_mmu_cleanup(isp->psys->mmu);
+	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
+		ipu7_mmu_cleanup(isp->isys->mmu);
+	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
+		ipu7_mmu_cleanup(isp->psys->mmu);
 
 	ipu7_bus_del_devices(pdev);
 


