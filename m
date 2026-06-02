Return-Path: <linux-media+bounces-63348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMllIi6AHmq/kAkAu9opvQ
	(envelope-from <linux-media+bounces-63348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 09:03:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67236294E1
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 09:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E78302E422
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 06:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC7E3A9626;
	Tue,  2 Jun 2026 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="IzwFjFsY"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C273603DD;
	Tue,  2 Jun 2026 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383508; cv=none; b=ML/xPZbY52Mj8NjWm0++z+IY8WwjMqxDcF5oquXAhWSpvlCjNJfS3cbfkeJp/uMlPWF5qMqEO+kbqJ4wCSxweK8Z7bQ2f1IukIAWGN3G/rcuWZIHQ6g50ynFXXpIuFVvfMea0TLrYtwN8b8q/yV1DvTZqi7zy1phfhMIuiNeRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383508; c=relaxed/simple;
	bh=y7gaOVSkev8OKgUOf1YIMsX7aJlaQDh/wcoYNEPxQ8g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=cODicoHJo/Cw2tRhw/8hJicrZuVr3fYU3XJI9HLOTucbwky5lInHh1MJls6kdX/WTreHqwpCVw3m2jmKf9JdEg9iqrL1Q6iRxUJyIczEPECLYSkrT5Mz/xMhbs0VS8/ihvI53elp4RCtGEbwOdUtufTFlk8YiyRGqz25tT6p6js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=IzwFjFsY; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780383501;
	bh=p2KVL35te1+gvvlusWIcKVNV/mSZmYzRwC1n4grXbAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IzwFjFsYFZIqGcMDvO//7jghg4FvMJgsV/MPOBYZkp4cHC/9yxHc8HySe3gMVzk4g
	 pULQciHw9Fa6m5VoFre2n1S+5IkxUPAaejIkNUj03DLcI7Ah9NlOVE8ySpPaMVdyZA
	 TQDFeDBUQQbytA3SoqjCj5kI8nf4x+JaVNsd/txk=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id E9419AC3; Tue, 02 Jun 2026 14:58:20 +0800
X-QQ-mid: xmsmtpt1780383500tsmi8y543
Message-ID: <tencent_2FA9C0219BBCE44ED2E6E05DAB221EB82F09@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNPEU9XRyJcqm4r4wqoD29BbGUcqIUp5yFWl82VTmu34Bq0qcq1//
	 mJq8Gzco2tmtXy0+M1A1WTDxJus6JyPcdu0UUf+Tg/RKO/vlaLiCfbpg91LAMp4s8TWEPZlAHzAL
	 wb9IgutJGEeLkUmXJaNjrPc9har3Zjxmi3F96lj/toARjvFmfLTu6l/Vgz+MNohukZ2DuzzGMLDt
	 /+pvRDbgUA/CYYykK5mXFhzoG28lmgF1kcP3NAald5xBI/0cykNfB2Zq/Hcmt/uHGQrp9laUeRm+
	 KJBBR2dpZQZxWfJS0mn5ZZHgh801KTHKBrfV38IVe3eTIJRN0voZofUW9Sw8NldNSJZCMoL7eemw
	 FijTbkivbi+cmD/8uzb9+b+YEx2L47ihwD9b0O992jFAEL4SY00rpn8OCGx2lTdwAUDKYglnjKXp
	 jz1dQJBmtjJLLYcwJ0DiCCBBvsf8S+gX6VeHr8sR//YbDTvLgobDbtPU7NOMPHJYWuiFCUCSUgUP
	 dxtgbjNgT5SuPJECoJyZ+TUCsaS6vbpRhV67B2PzZPzjdYCV4pphvv6xDufv+57GZ21UVaTZ+h9q
	 kidya8bgurOczSVBqihH+GfWIZIKakIj2iCwvLbJUG/lR0hXzxx+V+JzEkrUJJplzK7/JYZo5YnD
	 HQqx3ngaru5paeZ0lAfdjopWcastinSKSz3EQnS0VZIvMJ/uuX0WyeeowQnWjbYjGl8NQ54f2VRe
	 LUxX5qy0TVQRoD19sCXvrDNSA2kujZUKTrFGgYtf7WTgX23bfXqQ5uZQNRBL+4adV7qXmpjqcREO
	 BB39vtj8iJC+MxEEetiOPb99UuP8vWMpZZsoYfyOasvIAsrfbObQqL37nmsyLRdSxCcJLeeSyd6d
	 nYmXmHRH8d2SbU5gPAPuyL7HXd6ASVOrb5MIQtcz6VxAokx9Y8184OgMQfc3AeSjLYQYf6KK36G9
	 POe4hCqoVwNKvcqqrbaLUD0cUKCUjDtBblDxrxALmIxoLjiGT0Q/Ss967mfEZ8CGhO2DjAySj6W7
	 5KYx7a7uhGRIsQEN+6177VP4AdCsbioADnmWyQuDDNvLI1ZMg7t6wqlktptihsQYb6nOTUo0McDY
	 acHxqxObW5QtXKoP4=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: xiaopeitux@foxmail.com
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mchehab@s-opensource.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: pci: saa7164: fix slab-use-after-free in saa7164_dvb_register
Date: Tue,  2 Jun 2026 14:58:19 +0800
X-OQ-MSGID: <31e275856b681580942cab9fb75f9957665af716.1780383298.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c0cb04583f255e53d39214257bc6a3be8ec8dfb9.1780383298.git.xiaopei01@kylinos.cn>
References: <c0cb04583f255e53d39214257bc6a3be8ec8dfb9.1780383298.git.xiaopei01@kylinos.cn>
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
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63348-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kylinos.cn,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[foxmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopeitux@foxmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[foxmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,foxmail.com:dkim,kylinos.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E67236294E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pei Xiao <xiaopei01@kylinos.cn>

A use-after-free (UAF) issue similar to the one in au0828 was found in
the saa7164 DVB driver. When dvb_register_frontend() fails before the
frontend's kref is initialized (e.g., due to -ENOMEM in kzalloc of
fe->frontend_priv), the error path still calls dvb_frontend_detach(),
which eventually invokes dvb_frontend_put(), immediately frees the frontend
via dvb_frontend_free().

Later, the outer error path in saa7164_dvb_register() again calls
dvb->frontend->ops.release() on the already freed frontend, leading
to a double free and a KASAN slab-use-after-free report.

The call chain is:

  saa7164_dvb_register()
    -> dvb_register(port)
      -> dvb_register_frontend()
          (fails before kref_init, e.g., -ENOMEM)
      -> fail_frontend:
        -> dvb_frontend_detach()
          -> dvb_frontend_put()
                -> __dvb_frontend_free()
                  -> dvb_frontend_invoke_release(fe, fe->ops.release)
                    -> (frontend-specific release, frees the object)
    (back to saa7164_dvb_register)
    if (ret < 0) {
        if (dvb->frontend->ops.release)
            dvb->frontend->ops.release(dvb->frontend);  // USE-AFTER-FREE
    }

The second release is redundant and unsafe because the frontend has
already been freed by the first release via dvb_frontend_put.

Fix this by removing the redundant manual release call in the outer
error path. The frontend is already destroyed by dvb_frontend_put()
in the inner error path, so we only need to set dvb->frontend to NULL
to avoid any further misuse.

Modified by referring to au0828 UAF.

Fixes: ead666000a5f ("media: dvb_frontend: only use kref after initialized")
Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/lkml/AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/media/pci/saa7164/saa7164-dvb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-dvb.c b/drivers/media/pci/saa7164/saa7164-dvb.c
index 3eb749db1ca7..ba6e83b360ac 100644
--- a/drivers/media/pci/saa7164/saa7164-dvb.c
+++ b/drivers/media/pci/saa7164/saa7164-dvb.c
@@ -727,8 +727,10 @@ int saa7164_dvb_register(struct saa7164_port *port)
 	/* register everything */
 	ret = dvb_register(port);
 	if (ret < 0) {
-		if (dvb->frontend->ops.release)
-			dvb->frontend->ops.release(dvb->frontend);
+		/* dvb->frontend freed in dvb_frontend_put, now we can set
+		 * frontend to NULL
+		 */
+		dvb->frontend = NULL;
 		return ret;
 	}
 
-- 
2.25.1


