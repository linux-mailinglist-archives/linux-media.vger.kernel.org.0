Return-Path: <linux-media+bounces-62230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCsOIlR6DWqfxwUAu9opvQ
	(envelope-from <linux-media+bounces-62230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:09:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85158A702
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A8AD3006B55
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C853630A3;
	Wed, 20 May 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvnCq9I7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06EF3546E7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268176; cv=none; b=lFi9TbswYOeNA5C+8oRVTbbfZn0JbzjMmqSpgBaQq8X0Y0US+frC1xOY+cs59bWrQg7xO16TBuIXvNNJMgFwmkIWbCRR5I+K+mD7ZSqUCzxn4y5iURTn1lm93td9N43F4DXQL6E/lMt7FHAURoSq0tIMnmEjvlRxoUSYEvwMPrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268176; c=relaxed/simple;
	bh=NeyEkYV1Wcj6ccjUih0btV95jGFumcK19aJw4byQneA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ubBw8GB/BRZEUPZVpjaCuyM7PPACIaKJPKikHMBU1pzDB4hc8m/Vv/ZpdCoGnLmAd+i2sRGgZLcdT9Z5OgT+MmMjGygE61MmiRTVNcsoLNr0R4hpOsto9IcH6Tt3L93rfhctcdm4OnguIMaKt5Y2NDNnPyumst5ii24XtyN5E28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvnCq9I7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b788a98557so27328895ad.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268174; x=1779872974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=scVhXrGhIJluENy8IAivxDBRwlP7LvJuAQpRY75tmO4=;
        b=HvnCq9I7SLEE4/zZMVTgi/IeWjyWfpklw9H2ClMbiZkc1BaYXrKvkXubGHbSKj5LTu
         BqHOcNfSGWSVPoOlE2tWVJqhn1kNixuNbfMCFXB9UIblRO82KAHM8kCj4FuKlxBe0xQ+
         DGA60E2Gh8/GZtM4nJMyK8Q42F31QKmPrt4o50cgbs7octtoKmLevZ7lo8fpBV+T5Lir
         KH5slSA7eeKW3tE+ah8t9InNpHh6i67CeQfy5Qtov8lqsKUVf/NBULdz585BKABtyyn4
         D8dURDQgUpoALXqJHxNiIv9NOsI3SdHi4Q0x4pXPpsDqiXpaJsWcJP2OBy1THBGHIVdm
         8FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268174; x=1779872974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scVhXrGhIJluENy8IAivxDBRwlP7LvJuAQpRY75tmO4=;
        b=m5bzSdViBdI925BnX06yTh9x0Nro2yxCd1PL0iInIjFZe07CBVqwIbCzSMa4kFzEar
         R5C/nl7u+9+KOqnQZtnN6dOvI65vGzlXdBrExFBA28zzdIjlg5tKfQ1/6J0N9m5AaFj0
         DKabCy0uWSsFC93fvqILuFMTg2NkXnBF77wPJVSOKseGIg7quXYNG/C4eXnuBq7RUSZY
         nil9fFeRNirjFTIGAf2uyIdiSTIMD4nNf6eUMl40pOrRkI9JboHUxAUWVDi9G21gySpj
         32zcQ3BcSCM8xXsDEZ1CV4YO3Nuhg3RUJBgacB5sSYlkh+cJAElBF0HPXDIHMIhosCMz
         nDwA==
X-Forwarded-Encrypted: i=1; AFNElJ/nzbJvcUxO7QCA5tJiAM618edS8WFpi7hzORKW6Xlrq6pGnPOv16X64RGNpdM8phDhCc5kPZ5Upv8TBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdIsUN/xBNxNifj143DcVIdBkQYdnM/7KVTmd/GjzRrfDyQXg
	Dc6Yjz0YaqEhO/E2JPyEWojxI6WeVqrYq6hui+UMhMpvSoa4Drevjkt4
X-Gm-Gg: Acq92OFggtSeS8pLLsuDeOWT4QN76IlWTN/m2Wj/5A2h+bewvEeQLsMitbSAdoigAlp
	BsPJEmzbyHxq3jWwYgNiP+djsCzZiy0GFncfmlT5+Jh+j81ziOzCAqw17641dhGMoL0sqbFzHAj
	JVuCMptlGYruCutQ9QCGtS0aP5Gg22wCJ7k545Yraknv4mWA3yB/MKKYgPtAFgJJqtBeFBpg3wO
	/v5UwSrJTffoEOqHvivXAWnCVtlrKDb8INxIFliDtQpGl8MdLjVXpIOs4NKUWnyW4nQDj7EMxuU
	Y1pmr0EY941BMqINTRp3ib4vnaoWbr31uGZKFdlZEWeVc7wBk1kxxbl0ZgngPAqKVGMhHZhTsa6
	85m3ShzqX5vTtoaMWdUe++TAB2TeOsvdqnUmnNlW+u30E9xqTdpKrIt56nJp5+im0ZVhXMLAHuu
	61axvfJ5oVvajOA7Tb
X-Received: by 2002:a17:902:b085:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2bd7e94c757mr174598995ad.30.1779268173671;
        Wed, 20 May 2026 02:09:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4973sm216875815ad.41.2026.05.20.02.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:09:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-dev: do not fire driver's release on __video_register_device() failure
Date: Wed, 20 May 2026 17:06:24 +0800
Message-ID: <20260520090624.1071139-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ideasonboard.com,gmail.com,linux.intel.com,iscas.ac.cn,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62230-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2E85158A702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

video_register_device() / __video_register_device() registers vdev->dev
with device_register(). Before the call the video core sets

	vdev->dev.release = v4l2_device_release;

v4l2_device_release() invokes vdev->release(vdev) as its last step, and
the driver's vdev->release hook is commonly video_device_release(), which
kfree()s the vdev that the driver allocated with video_device_alloc().

When device_register() fails inside __video_register_device() the core
does

	put_device(&vdev->dev);
	return ret;

which drops the only reference and fires the v4l2_device_release()
chain:

  __video_register_device()
    device_register() -> -E*
    put_device(&vdev->dev)
      -> v4l2_device_release()
         -> vdev->release(vdev)
            -> video_device_release(vdev)   /* kfree(vdev), free #1 */

video_register_device() returns the error to the driver. Drivers that
follow the documented ownership contract release vdev on their own error
path, e.g.

  driver_probe()
    if (video_register_device(vdev, ...))
      goto err_release_vdev;
    ...
  err_release_vdev:
    video_device_release(vdev);   /* free #2 -- DOUBLE FREE */

This is the contract documented in
Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
is responsible for releasing it if video_register_device() fails. As
Hans Verkuil pointed out, the right place to fix this is the v4l2 core
rather than every individual driver, because drivers are expected to
follow the documented ownership contract.

Neutralise vdev->release around put_device() in the device_register()
failure path so the device core cleanup does not run the driver's
release hook. The driver-supplied release is restored before returning
so the caller can release vdev according to the documented contract.
Successful registration is unchanged, so the normal teardown sequence
continues to call the driver's release hook and free vdev exactly once on
unregister.

Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..73648549eb2a 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
 	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
+		void (*release)(struct video_device *) = vdev->release;
+
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
+
+		vdev->release = video_device_release_empty;
 		put_device(&vdev->dev);
+		vdev->release = release;
 		return ret;
 	}
 
-- 
2.43.0


