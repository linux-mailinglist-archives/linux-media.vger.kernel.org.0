Return-Path: <linux-media+bounces-65689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSY9LR/5PWqP9ggAu9opvQ
	(envelope-from <linux-media+bounces-65689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 05:59:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A26C9FA8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 05:59:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=h9T4NqLo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65689-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65689-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44C7D3030F28
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767A3A1CF8;
	Fri, 26 Jun 2026 03:59:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604F13D53C;
	Fri, 26 Jun 2026 03:59:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446364; cv=none; b=unQMe7+GSNEq8hyfWT7f09ceVq7hdLhRFxn1iVcPZ6JlWpkvjNicUo0ez+sfNUe14KrEmgk1DMmAJULiEx2Q4BWvCdlzBpCPUyNJ/+eJIFcs2YiOg+KB8+lmKtz3zSHt8SXftOAapMMyfZdQGuIg4id90+ZbPpHCMDj/1vIRzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446364; c=relaxed/simple;
	bh=O0BBDT4kgPYFtXYz8U9Mj0OBeEZAkxlTrUWucg/Q2oA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gcBmY4i/vEt2Zm1PofTI+dGmeQdqjWpEPiGDI5XpqX2K1csmdhcyd0LmGCRkIAtGYWxIvovsz8sE1mvaMxPNu1hn9MkRjY79LmpLR4SmA/CeLzOOVYo7OJSlTNWlfZ5FH64nTvsFX2TgsIjfOi9326/IoUuL7NGrrL9yEHZXU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=h9T4NqLo; arc=none smtp.client-ip=43.163.128.44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782446352; bh=2NIRxlZGKIJDC45+jegKMtHh/5qxMZ61DZdmzNc9+f4=;
	h=From:To:Cc:Subject:Date;
	b=h9T4NqLovkw6GNWTk6FgvuCgH0CZtXtq7Vo3cow4x1jssNNU6JSuV4YNA9TjvEmv8
	 Vy1rWZRo7IClsBs66LP1MpETXIkfsaHeDT6Tct5zjjFUI8d0DlWaxXCwaBbxVevrx1
	 V8SEfmgQskEhhn5IZDKvVs+WgQRLIwTTr4VQecTU=
Received: from localhost.localdomain ([202.107.78.247])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id ECAB1EE4; Fri, 26 Jun 2026 11:59:10 +0800
X-QQ-mid: xmsmtpt1782446350t6yo3rkbs
Message-ID: <tencent_4779380C7A07AAF6FE1AC93E600DCD946405@qq.com>
X-QQ-XMAILINFO: OATpkVjS499utKgeIyz1fJg2EPCOzc28x150iVBC9AOXHdcdWHKlzgtIaXAeQI
	 yZycx4/qZE9wFqOJ4StW63cvUfT0550IqCug1qxP70wdmMjsLkHYG0vw8v+Jz1ZhFEe246oaJFXD
	 IZejFW91D62DRgM3tQ+Ekqtg6JgYTtN1LchQA3NJPU9Ah7GTIZ7S3AfLZo1tYoXPx+zqxO4IUg9H
	 2tZymQTCbasYnKdpA17i/iaRNNopUkrDGncgVdoas/m5pMyCBJbIU+sFCspWWAQ6Q6u4oYVODPDi
	 TM/SrchlrdW1jMxhQJWY7nTpUijgnNO5Vw8AXWwZL1ienQ8/ljFSBcVLHtpN8+4HXqZn3UMBqQ8l
	 GH+JFHugcJFyZWk2e/IyMkWpI/OxcEr2a/5tklIbRXGSyUWZhex/s9+Yi5hxxFweAAToujPYjIWA
	 KooE9a7DGzv4EQsFzNZHqtuvK09f/FJyZdCdtcyMY7e+Nnq+Z/YKq69MynjJjePlHK89gamj9XyZ
	 BtZnIBT8N4MpQvg9kl5qNHQZ2OODHWEgxEuwuJtiwOxNBtvQA6niqqPfxmZmZLemJwfqna0M+0bK
	 fMjxmnVyCHMiRjFw3/vz02aEgmKPvG2+jGgOLivhhTdE1gFswNnt3NkT2i5N1Le3vQERREnZ9uSa
	 n0dEFHs4RJA/Ab5mqROQ+N9Z9j8zkHkH75311qcVh+yIniYQMbJWBBhEYJETU82aRJC5aNLqQNLV
	 hjfMIt+TwKdAVuXDXggdRhjubdq7/rTUgK8K56sUAm3xMo0P643dn4CNTI9amcqECKY90QdIy54f
	 /8NnmDQMm24dQoqCgy1tR8bUTOAZTBeIpiTlg1DeTVJVWYpgPbZUoCsv84WfPEDFhTS+zny8+8wm
	 mA9GqaIZVGn2SmkBNLTdctnkTmIQLh6DG+GMHnuHQYnRhFa6XkEU7GRkqaYBDqsb2irzfapWmmdQ
	 644th1wzeoO9hz3CtelUZ1I5EHsvXZLHqc5AbiYrsuEp3v08Gx5W2A2v5vjTsu4wnEQC2TnC5K9i
	 NGqAuMTLm5KQK0lqtlIhub8KfTRlp9VeVylpcxLBnAH7rjk6BW/Skf9WmZUo2ABjlA/GtGwcXR9d
	 CiHIZM+h7iwIuEn8dEgLC6I8vIwA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Binglin Zhao <1311165354@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-ioctl: fix video_ioctl2 kernel-doc
Date: Thu, 25 Jun 2026 23:57:55 -0400
X-OQ-MSGID: <20260626035755.246438-1-1311165354@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65689-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[1311165354@qq.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1311165354@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 019A26C9FA8

The video_ioctl2() kernel-doc comment says "hancle" and
refers to v4l2_ioctl_ops.unlocked_ioctl.

Fix the typo and refer to v4l2_file_operations.unlocked_ioctl
instead. The unlocked_ioctl member belongs to struct
v4l2_file_operations.

Signed-off-by: Binglin Zhao <1311165354@qq.com>
---
 include/media/v4l2-ioctl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 54c83b18d..a13dca7c6 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -736,8 +736,8 @@ long int video_usercopy(struct file *file, unsigned int cmd,
  * @cmd: Ioctl name.
  * @arg: Ioctl argument.
  *
- * Method used to hancle an ioctl. Should be used to fill the
- * &v4l2_ioctl_ops.unlocked_ioctl on all V4L2 drivers.
+ * Method used to handle an ioctl. Should be used to fill the
+ * &v4l2_file_operations.unlocked_ioctl on all V4L2 drivers.
  */
 long int video_ioctl2(struct file *file,
 		      unsigned int cmd, unsigned long int arg);
-- 
2.25.1


