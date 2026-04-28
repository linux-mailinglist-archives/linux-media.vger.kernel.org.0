Return-Path: <linux-media+bounces-59845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFZbLyC58GlQXwEAu9opvQ
	(envelope-from <linux-media+bounces-59845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:41:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B54861B5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1902307EA4B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B523D43E487;
	Tue, 28 Apr 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jy4BPZpa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CC3B388D
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380092; cv=none; b=gXSNYC9XeTWJT4R1KR/Xac3Hu+V1Cy7IK7p7Bwd4/m11gIUvRUe8QBlc3gIw9Dr2M30kNP5oNg9kVsDViW13cvIC3cHUkMI7zzuGIgCn9QP8mBq/wW6oaHI/uQWUPIEADKQVK4JHs8vVgYYP7vqs95TrtehTKoQX5uWpZ0SQzJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380092; c=relaxed/simple;
	bh=rA2cAH4c08I4eYFoQkXikw8a3RxYr+50vjqp8bqfYW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Up4R72/h06S1krd7uS5ScHYho9Ea22MKh4oL7Rk/s9x0cwPxcW+xUfZTZz8qdGADV5dgv7hihxN/9A/QwnsF4oAPfPKOB8g32DPK/to++VmR4RDkmuZBqs7jYnXRsH7s1jJeNM6A9k2Q3h//isQfqz99w2+RZe68gY53gjoafug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jy4BPZpa; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870778358aso91449771fa.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380077; x=1777984877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Ecn+W4C+vrdzWaq80Gi8dRi3bDDZ2ohPuSpOytRko=;
        b=Jy4BPZpa//NZzx27RSxIPu46OPCQJqrprq2K0TTLgizOFCl8hhtpk2ignYwiV7DE/Q
         ICH2vuW/Buf/5aOpkT5GZ3ZyiqG5gIff1G7uzi3UsNPjbVsxscB2Png73m035zFwXg9r
         jRNSLNbufqyK1Fs3BS33Wa2yrHIsvTeRj8sG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380077; x=1777984877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Ecn+W4C+vrdzWaq80Gi8dRi3bDDZ2ohPuSpOytRko=;
        b=pd26f1pCSGxI1L3kt4ZG16nio4SuvMHnW9DCMOWSzGkpX72TbA7c1TqSKFK6z7jWQU
         CzCXirtW32KcxkCEaIDztp1vBIZRuN6eFawLRUa0lu00LN4ftjOi3PAI/MgYyDoo+2kL
         F5K+fRJF8BOwqZEjSdc/D2nUc/dvkzereq9r/3OGxltOkpAFoqi/q0O7P76p+TPTsCY+
         oXPVUCsGLhxuosM2hX0JPFUBFEVHekNFUMh7Qz8QTQRLgtc8SUbpNWZqPUcWLkjkr+TT
         kA/fdSW3YrJNVK/ZRttgUD0gf3AkrCo608UJKzemMq+c/2vd/gpvROt9EHJHGyqqDUTZ
         /iCA==
X-Gm-Message-State: AOJu0Yy90A4QHhWgCeWQhBfkby1M32SFjHqjN9n57rFdhSNt/YHIn5X9
	eFeEb1y4z7WZPAkyMebF48MjbLkyPjjXU455aT5pyUz+/dMZchIqfaQbIg1+HwNGww==
X-Gm-Gg: AeBDieukn0P2pKzNJTpFVQDnau0vTaKo/7FMGYxxJCsa/JfFFFrjKRADg0vJwvixlpJ
	LU5AFKobgeiBkrnc3iZ7BaUjUZXFypQTzGzCJ6Id2easGt9q+u1Le0lo0isuRSZDYGFuR3efkXG
	msvv9dnhJJnJqTsRGHdPFMYVyCgQqtmmCIRp/jmza56kjSsZapfYBHkaQWPG+uoWS7HTSkuR319
	R4p0H94OJMPFruAqYtxIe0Lz2PRwD5WT7eAdH4UcJYr17NpTgT/i/Pi/K+l4ddN6tNtKQUYIZUO
	f+yHzOkcNQUYN4nxxrnCdpMImgU4Vdegahl87sq+G5S9CYnUStbVlfNZFO+NM5jRm+YBiUxu9k6
	KpPCGQZTzFrlROdkQ91eRDQCnLUfLv68cwIrIkEiZrCny3BgNrBpscbq8Dnjm7wmWI83mAQwwna
	xphA4gfhUsZO+sCLDQGREqc7JE8QVVbzWa23z9TEAfPa8+n0lmo4idAcZVlUK0TF99LUh2vIaYg
	mYK6eoQyd6psMPHGw==
X-Received: by 2002:a05:6512:6c5:b0:5a4:ce9:11e with SMTP id 2adb3069b0e04-5a74662c3e8mr1235184e87.32.1777380077397;
        Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:07 +0000
Subject: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: BE1B54861B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59845-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code.

This check also fixes the following smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..a731ffdb91ee 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		pr_err("invalid minor. Check ranges.\n");
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog


