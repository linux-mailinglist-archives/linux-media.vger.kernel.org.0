Return-Path: <linux-media+bounces-62708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eADkEXEcFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:54:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EC5C8D42
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C703024968
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18D537269F;
	Mon, 25 May 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krDJvIw7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401D3E3C79
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702762; cv=none; b=flF3JBq0g/hWN9FIqD+FRRoL3nXXgp+N8AXA3QJaHSKmLSEhNH+Dc8InFkcmXlb89cvDENUTP2r67A/G6Lf8CbL38fFx9w3vd8TU+0EsDyrMehJVezaEJNEEBlxQ4w6H2y5FFhUjsxfFXxmVjTjUc1X4Nhm7yufQLBFODzYeI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702762; c=relaxed/simple;
	bh=WIS3BgyrEbuPFk0DAL3nE3V6IGRFLo7gF/BE5feLCxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5BbJ4nmysI0gL+cfBJ4EzsuSRUrwfvMnUxoXqBdR5ZcFlfvnFxc9K39mRAaDA4SMdfVzrytuM4XYAAL9sIU5NJeIV+UHK5fuNiGZZHs7v4sSgKxQpNpTBXR0Jh8TsWcuwM1+L5LHjAO5yvi5KTFUDEyXHdnDz43zjXPvjAQ4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krDJvIw7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bd9c3b550aso65898555ad.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702760; x=1780307560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=krDJvIw7DyTuW5gqNxDvwpPwCYjS9hn4JmztEKVe23sTtev/33wHFxgiKquNIpzzta
         Rc+bl+QuW8LOklanU5k6l4534mwhd98xUsBYokvImrPt+3E9DE6+fxJD2yj8PE3NjgHs
         470bCEuQeTMdBwyhiVxunpw7wdRp06XNE6ltCVwE+Yu+XHORePjIzrdATRHw6+Rn3eIw
         A1Nz3YKs/PiA7+y5eRUvqFxPIhqxJUW103FOpH+xL08iTbqODxdHBOuVtxbG/UxaAJCR
         x7kF7BF86rIBrO7v4Xe2Zt9ZjjZ47qpfQ5KX6IZS5NgVL0oXbD8SN0RZvcWZ245H/qBP
         CTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702760; x=1780307560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=qWgyMhcEYOnNQdgc/nkUzqLQH3jIUqOVwy5dA2da8Tg3UfAKMGwC2sdevmScqh2o7y
         gCu6AeZtxmrt9dbFQKQQm59PRAKk3dW+ZrR/ftVD6p4xrmFYhvhVWuzl/JoZsXn3kiBk
         VwksWCWMWck9ow8cswFx8oGPPjvleE5U6qm6+zklEoj8g9r4Yd4VCI8C5lueRoysDRxH
         waXcZrtG7u3suh8Y9xu98vEjC108+3tDTq00pZ1DdQ4Cueu1ieaA8GjKJ4kpGa69MkNq
         1jXe2ksTLaXn0OyrR7QCHLfD1Q0CTxeFdH5rjTd2ax3iEY97s+FOsbp0NNHn0MlbIuve
         LBMg==
X-Forwarded-Encrypted: i=1; AFNElJ80DDf1ZMnLSacUAzbCKxV0Z6x/m0hlmQOcZTKep+9TXUcC6o17pImT5sfCJw4T593l/BtFwrUbELtWTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcct2GnRyP+Bbom9XIntYXCoYeCCsHGEOQ9BWOrE6akwosMl4
	Ikl3JLUYUtn/JMALQNNKI1LL4/R3Kxs7lIY1mJ45k2T3psE7u/ybo0IU
X-Gm-Gg: Acq92OEbZ9qJGREDD0pPBMlmCuK6jpDZW+PFf63m74P3aZlbjRC85cU2wGd1p6fUCMV
	uMwBiGYwUcaFbuR0fW+TXvlgOdbE/OAVqRZ6DCGsjbPYXCMVYG7bekbmQJu/YYRmFtKKBGxRNza
	OwptjHts/bRg18QwawQI7j82x986tjtRW53DmfLuCi75B2hO1voZBX/SRAvz5cakYMxcB5lUju0
	58v1oEc5sYVooii7DtVrZtj2mZ/enohV8VQEzZp0bBWRKdRsyIoyv94xs0ZyH6RyfkrRyEml+9H
	r+i2aj7TCcJ8Z9EKW6wcAJtbcIj4eTqjtPxhxRpUD3U1Qd4f3mpgo+aRKbmeOpaOaZDkCcrDde8
	dhYJprotNiUftpZb7sDdyJncyFrX+D1Ngml4LwLPEVyhmA9M1dwE/uDTDbb7UEewA/Cb6rguTf/
	Q0lZwp0NkoIJM5bN6f34ZY7cQpNsBjTKI=
X-Received: by 2002:a17:902:f70e:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2beb03466afmr148144335ad.0.1779702760099;
        Mon, 25 May 2026 02:52:40 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:39 -0700 (PDT)
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
Subject: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Mon, 25 May 2026 15:21:49 +0530
Message-ID: <20260525095216.12078-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62708-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8E4EC5C8D42
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
v5: update the error path for v4l2_ctrl_handler_free() as per the review
    ccmment to fix the use after free bug.
[4] https://patchwork.kernel.org/project/linux-amlogic/patch/20260521073449.10057-2-linux.amoon@gmail.com/

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
index 4b77ec1af5a7..18a22b79e835 100644
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
@@ -928,6 +930,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
-- 
2.50.1


