Return-Path: <linux-media+bounces-52946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FO6DbC3k2my7wEAu9opvQ
	(envelope-from <linux-media+bounces-52946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:34:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B64148503
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 615EF301F4BC
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 00:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028B62737EE;
	Tue, 17 Feb 2026 00:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kpaag7Xk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA5221DB5
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288481; cv=none; b=Coadwcq03BxIBbDUXMdafSvWS7aD7/TCUllBE24Whokj9f56PwI41WzrAAYFB/rxWB6e2dnUHJpdzLOsnqhknDD5TzKgym90rVLXsKN2EAkcOTFrzkYsahqg/ou7Evx3BUqJCFwOdkY9FXKwltXgm3/lEQAoOyAWqhRINHC3o+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288481; c=relaxed/simple;
	bh=LttrCdpZM3YSUWza+2RsIvYIbus6j3SXuPEBJ91o0D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVjB+a/oVJhAkUrFhUBzcWNrc2lZuYfYR3Na3G8C4z+0buqz3caE1P9esKpjdv3/QfxA0oV7aiF/frlUI60dRp4Iv48CdBVg9kD7eEEAEUl5DGKNVnfHwZtYquqFXs4vTp/2BsFeG2B6Z0OP9Ql4QGnpl8n+HAgohfT7TYNnlNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kpaag7Xk; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-790b7b3e594so36003917b3.3
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288478; x=1771893278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Av15tS5FkuU+C+tEk9o+/kI9EUUe3VgwmfVsp/gvxcA=;
        b=Kpaag7Xk7/zhnM/3+xqO5vRkst1PuwalPccpSj0FqbhSNxZ20W84PUr7dtI58GmAIc
         w6EHCCaGPu2dK3dY0dE7M6WM0qADv03s7iRpYc8270Ze0U6l5qO6d2wCT/NuX67kHu1u
         lgxZVsBhBQ3Lds3k5+CJPTUQZJJcdCYC1cGF1TeQyzuExeedyOcsrLNfwEBa92fCe8vM
         JCYpfKN/C0zAlAfYUNdvM6/g3OjPFFQDtEoU6aNhqWXxNx3WSSVYK4rRQrPHSIrfqP1I
         kr0/lR5blXxPllItV7rkZnmtpByU1JXwg3nys5cMg7EFR4aJvfOtzPXDg0Qiz0VPG6ye
         86LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288478; x=1771893278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av15tS5FkuU+C+tEk9o+/kI9EUUe3VgwmfVsp/gvxcA=;
        b=HVQ6/qhH8XPKCCrTNmR0eLKYL/b0veuAJyNTNpajkXJ6Tg7XglIlQUs4chEWH3BYnZ
         6bTBmaOj+eAas8w5Oxy6zGjAB7Y/kkj8ISfl1kkLRWs08ziRh+ZZLzaYe3uolxqYW5KJ
         d6mpvKcqjjV00YIVNRsgD24lVdtvfPf0DTcehrinTZtbzh7/ZPm5BwdHtBmf0o8cAOcT
         OV7v1BOLIvpcvyaWF64mby+nN75t3yjuB4XwaYRkGyhrL2QgYbAjc2KlCMP4nYYUjCdq
         D994GTjZxofIVikKKHVOg4aZgjjx266AIKOlirtNPW04VAApYMWTu8SiuAH1rpRx48Ft
         eH4g==
X-Forwarded-Encrypted: i=1; AJvYcCV94HW3oZSHYFppUtI1BLxGoBdgTplKOVFD8sS0FFUBDui4BV1/M2EckOuw0efUCHnEJ/Xi3m9KpHTFhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydY3/vxG569pkKV0lNImLU1XgUd8JrXaHgn0jKe7iIVUk2rr6a
	ZoznvaEZngIqEVEdzZXMRuIXL9Ir3SOQ3UbjoPcHpQq8T5/Vuo1U2kOa
X-Gm-Gg: AZuq6aIdUJdewg87ksuBMjtvRO4ogg/N5elqDb7cFObA9+vRCF0ad7Kms5FbQmTu2s+
	9zm8edPm/CICzY/7njmgmmjKDPnXW7UIJgf8LjDpF/M4zbLGd0e7CI8EBCG0XFGKPdCc53BI4AN
	Txv33hjeQdv9XC96Mn+QeuriD8MazMke2f00X6+w7iWl3zslAEN87WfPr4RY6ixxVYbEyAoNCuG
	a7Qg09fZSO9MvHYUj6FmZRyzemEgSfViwqwbcA10Ido9fDvITmLag+TF434OB3qrp2TFsDe5Jk0
	pZHO4/dtkBZIu+CY9VNPHKa3FdsoDTpEHHWYkzeSr649jR4s5tlh3f1UDRvYNsACMH1LQAyQgbz
	phhOFtdTvMnEnW/HJHderDULciYCCoRTtE6VI1Q+TCLO/TgvKGwy8QIRrTPA6xQfIERcPGz4/c/
	QZqdnpaie4XJkbigrGxXSvOYpHfO2Nm4JLmwrYqKMgRriuFW7KVCbGOb5vKaH9+4D9IVVJLNosj
	ECpxV75rdJoujBkgY8XJu+hYKxlMJw+WUV8KxWw7Sk=
X-Received: by 2002:a05:690c:7085:b0:796:349f:6565 with SMTP id 00721157ae682-797a0cf03e6mr83614637b3.46.1771288478140;
        Mon, 16 Feb 2026 16:34:38 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c195dccsm106030607b3.21.2026.02.16.16.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:34:37 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] media: intel/ipu6: fix error pointer dereference
Date: Mon, 16 Feb 2026 18:34:20 -0600
Message-ID: <20260217003420.47280-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-52946-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4B64148503
X-Rspamd-Action: no action

After confirming that isp->psys is an error pointer goto is called and
imminently goes to this code snippet below:

out_ipu6_bus_del_devices:
	if (isp->psys) {
		ipu6_cpd_free_pkg_dir(isp->psys);
		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
	}

Since isp->psys is confirmed to be an error pointer not NULL, the
condition is true and the error pointer is dereferenced. So isp->psys
should be set to NULL before going to out_ipu6_bus_del_devices.

Fixes: 25fedc021985a ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 24238f8311a6..6e6b7d2a68ff 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -619,6 +619,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 				   psys_base, &psys_ipdata);
 	if (IS_ERR(isp->psys)) {
 		ret = PTR_ERR(isp->psys);
+		isp->psys = NULL;
 		goto out_ipu6_bus_del_devices;
 	}
 
-- 
2.53.0


