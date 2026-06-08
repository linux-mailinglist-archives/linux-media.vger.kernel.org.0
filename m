Return-Path: <linux-media+bounces-64159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e69uJVmFJmr7XwIAu9opvQ
	(envelope-from <linux-media+bounces-64159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:03:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CA65457C
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:03:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=nFTMg4EI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64159-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64159-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33AFC30C565E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482E33B47CC;
	Mon,  8 Jun 2026 08:42:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054A286D7D;
	Mon,  8 Jun 2026 08:42:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908160; cv=none; b=pr3dLz8QdnavEAIF21u1RzahUIg/wtM9vze9/dYDQWMHY5nzfRc+w4ip2U5C083aB3hsWmYGMDezYTqho6nPrmi+72lxZbKFDT2ABjY5d9SD7WiLIPWahz/LmTYoY1wsWAE8nUC3KKZ93Acpn2s+g0oihPmZhV6WQXF8a+JlkyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908160; c=relaxed/simple;
	bh=si2ebiu2bDHgdCYLqsoKLsLRmQmG982ZvPTVe5jAsiU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cw8mCebsfD/M4Gq0WpKHSMFXaA23SjoI0mI2RzLie3TNI+0KV4MGiO2ZgujjSsy6wk9dj9XdoNXuQmNDV+csib0AZAapcPYEA3OPmTAmtMhQiLTe70+OletgsGCfo3kt8fcQ+GjmOYvoktpONEVbK8HXbYJfOFh2BZh3vGQ2ru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=nFTMg4EI; arc=none smtp.client-ip=45.254.49.197
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 417c4ff68;
	Mon, 8 Jun 2026 16:27:08 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andy@kernel.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: atomisp: Fix resource leak in atomisp_pci_probe()
Date: Mon,  8 Jun 2026 16:27:06 +0800
Message-Id: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea657be1e03a2kunm16811e9be6e94
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkIfVk4ZTUpCSx1PS0sfTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=nFTMg4EIkb/OQqo4Q0yDmnvnKTtjOHv5kUIdixXdek/N60q6Ki6T24N+dDNX5MgODcXolD777cXiy82/trpTHpUlDg9UVwbpHi1ZiLumeV64tLO1kkGBPz7qWpmT+DaLZ1dWfTAIzQ8jpxSvjuufLqzeTsIVJ65KArJyuzF8Eco=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=W2RbCHX5ggtfcHqnc5ufIp0FeZZQMQa5I9HAGMwivaM=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64159-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:dawei.feng@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,seu.edu.cn:mid,seu.edu.cn:dkim,seu.edu.cn:from_mime,seu.edu.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 784CA65457C

During atomisp_pci_probe(), the ISP subdev is initialized via
atomisp_initialize_modules() prior to entity registration. If
atomisp_register_entities() fails, the current error path only
uninitializes the CSI2 modules. This leaks the subdev entity and control
handler that were previously set up by atomisp_subdev_init().

Fix this by calling atomisp_subdev_unregister_entities() to properly
release the subdev state on this specific error path. Later error paths
remain unchanged, as they correctly use atomisp_unregister_entities() to
handle broader cleanup after successful registration.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing v6.13-rc1.
The tool is still under development and is not yet publicly available.
Manual inspection confirms that the bug is still present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do not have an
Intel Atom ISP platform to test with, no runtime testing was able to be
performed.

Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..d4e4e845f66e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1401,6 +1401,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = atomisp_register_entities(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
+		atomisp_subdev_unregister_entities(&isp->asd);
 		goto error_uninitialize_modules;
 	}
 
-- 
2.34.1


