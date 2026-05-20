Return-Path: <linux-media+bounces-62199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIxMMIQ7DWrfugUAu9opvQ
	(envelope-from <linux-media+bounces-62199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:41:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B638587941
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AC63303266C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 04:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F2F34F26F;
	Wed, 20 May 2026 04:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuI6F2M3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB730566E
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779252059; cv=none; b=p7gTM4IGzH7a+XrOKSc1MRlhpsFE7SfIDCgragWHdujayrCEQ1a2CntV17hvWl9/GqfWoa/5e6/Km/qGjziBz4uIc0NDbTdqUVVUp17TDhSdOszERwLyAZZdpp5tAWs7BDZCsd8G0HkTAmHjGN3GFFiPsRsC4TB6/VfsJBp3zJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779252059; c=relaxed/simple;
	bh=IzCpapzovKld03EFxt2Y7uGfXk1dtMIpLr0vVycq20k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=arGwjb8IO/4dIq4ZBUOIl5M9qfcJ/A/gQ6ASOrVS/6qgjg4WZltmHKRkUHGhb5r09BcsPnv/Kjubs/f6xIdYy8M/aO4zskw5zqDjGRZlr4qBOJY+mitbBGVA2dRxljb3eyp/QMi9QFh1Ns+iSV0RgEtpllZL8DTAOOQXBDqaR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuI6F2M3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so1684688b3a.3
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 21:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252058; x=1779856858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=nuI6F2M3HIFNxNqLsjy5xsmgVtrK6/PiboVxRkj5XXAgsy1ePqO59micdS43fbVmxi
         JcuugtHOVehT/OJTcNtvBliuDHelCv/54PODI2ck78CDxA16DXulDRk9qvNneWpF3UDy
         znSj+1WNOC0sK9eBCPAJH1dPq+9aWbKHWBUmNnVFh4yg7KP5bAVRnYhwrUqBPLAw7H7b
         TMDe0sPGoQ5yEZghcrZJv1NKO7aCTqj+jct3UZJIJF53xc6jRb8LS7zxzIjXqABR6bku
         sK+V8nXa+5Ag8qnaPUuEsIzHwpFLqpPEYg4aOZk8djKTWbJ9breZx8rgouow7orWp3Bc
         pJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252058; x=1779856858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=jF1nXCEhfHBiWYOkUw//yKmsOfq5WRnyEbYFbNzrZs1BjeKzgfyM/86NMLLsXpkmBv
         naEdFhYzPD9fDn12fLhHRp8L/Tdh1DajQdFPGQzBb66DT0aY9ZrPfksmR3rOPzSeIBC9
         alhDUOCcCKBwhEtL1XbeaO/SZNFLeg/h6Y0ldHsYGJNOEr+IhmCryKGol2GuaiK8OCel
         AGrnm4HnJQsQ/0TtaI7UMZf3xxTKuSXMzftce2eY2bGT1bQpbQE/kaM/mKRvkLDeUCHQ
         fsK3iYUK0f8Dm2NeKRshdTu2yeMRpIw0UgSvPvXG2B79whyG77c3s7eYR5+hi3VVvMyZ
         XwDg==
X-Forwarded-Encrypted: i=1; AFNElJ8GANGURrgHB8lPuKV01bUr6NXkL6jQYoXtSihpjXzjI2QDeNFERNeFVEnWYwg/7b7TIbi48R5mmwZliA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIv5ehouFrDcJbIOCVfeFABXbxsxOD9FxpHRKw4c2ClAxmSIW
	krc8cJ8yd+5vlnA34RD51NnAaWMnRQZA93g279UrH0DjgzPHVq6sbFdZmV824Q==
X-Gm-Gg: Acq92OGqW3dmntsrRTseFmctiTsSrZ5y1JnYeb4mCAHMTHK0p3PopK2T9qHY6MvmyqT
	WDd7YkeRsEvvhemwS4f22ZXA331d8yfHNHSaDqkpehaKAZauotJXU53wBXnbay13RUMCwo/ps0c
	0i9HPt6wNdstF5amA1LOvshV5u4jlcNLK962OwIbb56REw0mYkDUrH1YbHHhhMn6LHzIYvsUWTt
	ajHmg85N/YyH0USWnxnbOC3UjiJ7LzcUOkJHAu2VurtRhes7Jf3cHmH90Gi2gB8ul33vz1AUDPO
	L4DyT/W7uXp8K7hgdYz1j+DS2kPlui7UZIbRCEyIxL2k7Fl3ILdWWrbVZXB/1PPSCwtcUDhOh4T
	6DGA948qXOeb89ubLW5MY2RfyfUte6jqiyvHxtgzgbv4LnUuR5jaXd7HLztZEW5b6dfjsy8GekY
	NCSPM155nA7+GLc5buu9QjDYITw5ffSAM=
X-Received: by 2002:a05:6a00:8c2:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83f33bae2camr23163556b3a.4.1779252057807;
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18649802b3a.39.2026.05.19.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed, 20 May 2026 10:10:41 +0530
Message-ID: <20260520044046.7553-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62199-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ndufresne.ca:email]
X-Rspamd-Queue-Id: 2B638587941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vdec_open() function previously jumped directly to
err_m2m_release when vdec_init_ctrls() failed, skipping
release of the m2m context. This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label
that calls v4l2_m2m_ctx_release(sess->m2m_ctx) before
releasing the m2m device.

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
   updated the commit message, applied the suggestion from sashiko
   below.
  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:

base-commit: 27fa82620cbaa89a7fc11ac3057701d598813e87
-- 
2.50.1


