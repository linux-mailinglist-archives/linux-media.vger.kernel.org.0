Return-Path: <linux-media+bounces-62409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB7OKdO2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:40:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003035A03EF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97381308B96D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FC7397B06;
	Thu, 21 May 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krDouXGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067813DDAE
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348917; cv=none; b=ibZPJLYk+93mNRhpNUAIzd79XS9j+tZu3MV/0rMIy/v7xjIXUw6v9OBFrD8Ssxzs6ap7gCLjTW0rnZDhztjoRc6h+ovxE17R/X1ABmoQAHLutsTz+m9PBCMEQGVJLUmKauLR0HGZcXFDCABSDCL3I/IJyNNe1waIN2iENJtSe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348917; c=relaxed/simple;
	bh=ryTUXf8sC7d0Ori3299ByXCBMLqJUA7IfN4hnFcDBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksy1Gh4f/h7y7QpZ4lB10w4vszDQ/8z8JTfUTM5MEq1NB7FQjENFK99oAzxM3LtPYkr//86CmxM38DZOqNWv9itLniXrHT7PlSfvIqsbu29h73FyekbVNhUYR50wiWcBpnCd7EXYtHDX72cvaUkCDUBTYSpxYN5y9azfd6W5RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krDouXGs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so5454363a91.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348915; x=1779953715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=krDouXGs7/Wk/XqT6TvNSsNXI+oXv21jwmp0CMzkLdqYSo0zfMw6AXnzpWH1VGgFZq
         A3thu+viQ2o0OmKvulscLx4RUeOHU4Mm6BstC12wcNYPcLR1mSjkIAL6iCR+pUX/6IWO
         hBjjZMQ+fMnNW6qGN2zFcIQomuf8wiPt/57+uVa5r0yUKC5GbZA5N2+cj0qAa+dDRgOs
         351KIpggt2ZVfAUGCfFhV8PRER5F01X/c9JA7HXtVC4obUCziGrqJF0CmAGmva6R/544
         ToJ2W33cegDJtFKqRUzbVhRowT/CHdSYhU5jaxPNzpF+D0jq3FUQf+mD0Ip5FSBC7BMf
         pfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348915; x=1779953715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=HrrjjacheTI4p9uhwzOZYq8wcVVDBpw+UaA3hNwaW7DZWh5F+RQwLvqvcM5468N4to
         c0nInaiJl2Jicp/Zf29QOFxNMsombJyLeT0ZRmPfX0FiDvjDf081474dMNX3RjVWK8L1
         WjDy99DkQldxQ1CkqB4YA+NQZhUrbRnTb2rCBYL3IGBmccFtmfZBjsTp6Rs1yk+kz54I
         BvEhF6gAljbz1jKoN2fuC3DgXHqCOtP8XeHAFSoz4kolkhI7pR18BisVUu3IUeWJy9uF
         cQDzTbAsh62476Icl9ySfSfe0TAr4yN7ef3565K94asft6c8cu4iFHFyb1uWKapZMeBd
         eSkA==
X-Forwarded-Encrypted: i=1; AFNElJ/hYFGPhoI7lRuhIa6FKScfLPg4wnhFLxBn8icR/+pGd7A3XOW+F3JZICSoawN7cWRcNPJqD/wpQh0djw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiG4MrLfttgI43q/7lTJ7xo6a0MqukYgZoTXDDjBkzlqgejZbf
	t4DaSLhpmhnUmqOiYe7++FMOJ9Pu70qUO41s0movG2NngP8QjqSVm3DC
X-Gm-Gg: Acq92OHRqVRaDCArPDCAD9QT+EEEksKD8Q/9+oWXso3tV5WXtaF3I2K23F378PzzGwl
	BGcMVQ2BKgBMBHkTZLLuB21+UFSxgafU89v9TPCMwKOODucB3bNaWvmnAH/w+m2vm3IuNitR/yD
	ZBivfhHpRHD4wK0KwODxUcyWUH72bpzCft8G5p7pDbSM0k75sCMNt45KzZgG5lUXpru/p50naj1
	nyqaOPH9KoESjCrxhgCtMRMCTkEqWv0uUTJkHlSnUFlimjfBAn+yhEjHbleKg3aYcYnrQjNVx7W
	+gem94zkI4MkPXmSG3qzMVfjBwXVBoPZYbG5+U54fxxEFAkQi4ANu//6JJwiG9S8d+8Ipbx0dg7
	UUo07ihdiPxSBx3VVUnaipThBiog5dCtjZN9KPYxlPKeEquM9uy57Hn5icBAPPUNzupz17Wr0Jt
	xXVg9nbqZpxGUxC6G5DbLU
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1777569a91.16.1779348915390;
        Thu, 21 May 2026 00:35:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Thu, 21 May 2026 13:04:11 +0530
Message-ID: <20260521073449.10057-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62409-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 003035A03EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vdec_open() function previously jumped directly to err_m2m_release
when vdec_init_ctrls() failed, skipping release of the m2m context.
This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label that calls
v4l2_m2m_ctx_release(sess->m2m_ctx) before releasing the m2m device.
Also free the v4l2 control handler memory allocated by vdec_init_ctrls()
in vdec_close().

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
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: update the commit message to add v4l2_ctrl_handler_free() in vdec_close()
to adderss the issue:
  This isn't a bug introduced by this patch, but does vdec_close() properly
  free the v4l2 control handler memory allocated by vdec_init_ctrls() here?

v3: https://lore.kernel.org/all/20260520044046.7553-1-linux.amoon@gmail.com/
  update the commit messagee.

v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
  updated the commit message, applied the suggestion from sashiko below.

  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
  tried to address the issue reported by Nicolas improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..9244fb09eb36 100644
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
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


