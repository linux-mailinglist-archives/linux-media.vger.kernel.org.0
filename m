Return-Path: <linux-media+bounces-62112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCThIYgqDGqwYAUAu9opvQ
	(envelope-from <linux-media+bounces-62112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:16:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980557B0FF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3BE83043A45
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E07328B71;
	Tue, 19 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SatVj3yh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF23F0740
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181907; cv=none; b=MT0hHVVR41N2W3cLZprtjUYR+F/AKG3StHW0Pb1/p6QeuE02y+lj/CDbS3fYHiLzvfX8AcIWY9ZknwXDhS93UV7fG468gsG+SiO8RUFMLqjT/FyboK7YEmpUo+GHgr27vK4zubPCtCzp/vzCIzV7DWPmvNDQHh5mWCQ438RvDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181907; c=relaxed/simple;
	bh=bO38FoplUF0OGefgQu5Ge6i3It4LuEiVmTb7e877Jfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERt5+GiwpP4EBA2cCgAz2Vi8UFrTu0eE/VshyLC++EEKebgmqllR/FqV7v2MnANpTfUFhclL1pEOA+pPhZOdj+DHCS0Ir3mC+3IZvy+QcymnHw0LtfCjmPBHU/MioWDykfa4tsPyezdv2ZtFVuKORlOib91g45KAKhMWjOmSNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SatVj3yh; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c80227c9572so1492664a12.2
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779181906; x=1779786706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeHeRdGkO0e2zRMbKYJezoLxkuEvt+FGgdG9h+Dao0E=;
        b=SatVj3yhK7pULLb55fh8yNfdp1+n1NlERVYVz0xUmwD4XJp7NOi7c2aRaHwy9aCpCZ
         T9mygHB7ol6lTkSZ69k+VqGNlmGnd6s18siGUYXEjBpGWmqnRSMHCjY0K+kQeJuyaO60
         IBElEBKjkxek8QojcKkD2I6dnajW4Bivm7w20sYCLwM1dEgkOLm/N+24KvABCXETpvKW
         dSxXAsoL+uQsPEr/E+L+lXvkV8u1qB3jQNM0tfV2oSOUbFcROibA3e2MLrdrLs6Afw4G
         x9Yol+QMSmxTzvXxxPqfupRL6hq7egvDGDUaf1IOnBtLdv93SH22+lcIwjwdamB/Ik0k
         styA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181906; x=1779786706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeHeRdGkO0e2zRMbKYJezoLxkuEvt+FGgdG9h+Dao0E=;
        b=b4tm0oraJg42YFNDvqCxxlOkH0V7JUaYX6tyJBJfMMsQzSczOLow0kaoeModBprK9j
         SvFVnUNp2UmNZMAiucvRyMm+igUUXhJczyT2rlr1TyP3V032Etia9ROh2vWfo05yiwWo
         G6QGWi1MN3Suk+OgJr/khivVqI+5Fr4QceKLkEbTDu14tqAkL09F8u3RTJW0+4Egq4Rj
         mOq5Lmj89bAcKNeyPuCVTAL3yuQJ5Io9hjJfqWcgm2NauvuBn1gnZ3CUyGMYF76B1NxV
         3/VKOe1MHU08/Rm/jqRVf1QfsrXY0bACJcQrZ7vlHmIom30YZ4h4qKxDc+D0KWsbV4FK
         bA2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/koab6wmCpRjfxk7on5UQkvyjrIuwNyrG5kkPTQ9aeRjEVfdi3cg3O0u1kTOo39TuxXFbAeIlwvvs9gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIwqjRgSJV6dx0RmwiDOUeoraKwuU+98n0zhYvwQS8hIHkKCP
	K8OTpiJVlcM6XSlZFSx6BMNFyrFXyBD27Q5Bpzf0vWPwrRV2QJT6x6PL
X-Gm-Gg: Acq92OGoLeerJKmi8dJhMYmbQBmj/L8ZPc+/j19UohYKJYYYhZfY36ER8ZXt+ANeNy8
	pfb2TRjr3MALycp3WGR9OXdqSWYQq2yBF4aVmCAaHCfPeUoNyJYlfyrPXzGV4bjON1hN34HkEYf
	J5YO0nKtk0ZNgjrKrzgJ37uCqmJQ2493Nmc6wifzKwgHWI5e7Ol59w+MLwTUgEH5RQtuPycjRdc
	SAKpRJU96NDdmvLLQcplkGtRLE4ARU0edsGTnC4HA2co4LNnVu37sVRc1UAaxbB7Nk+6o2IIGAD
	2l324UVDIooFWtB7jNdr0XKcWKid4ql4vzrHuIu25RhMT0eeVXvDm7XDOhu25mie15g/+x9fKbS
	XyXBKTuFfcDFY904YBSNQJrnYXdKX9MUkMPsSX5bx9/lTs+SbsEhUYCjtPZocIP8GxA+h6qqxLb
	4kTbkeiA==
X-Received: by 2002:a05:6a21:32a7:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b22e71ff87mr21414233637.17.1779181905823;
        Tue, 19 May 2026 02:11:45 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0626b2sm20595369a12.6.2026.05.19.02.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:11:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: venus: venc: avoid double free on video register failure
Date: Tue, 19 May 2026 17:08:19 +0800
Message-ID: <20260519090819.1041314-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62112-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2980557B0FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

venc_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  venc_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
venc_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/venus/venc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..9a5a025607fb 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1579,7 +1579,7 @@ static int venc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &venc_fops;
 	vdev->ioctl_ops = &venc_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1590,6 +1590,7 @@ static int venc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vdev_release;
 
+	vdev->release = video_device_release;
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
-- 
2.43.0


