Return-Path: <linux-media+bounces-60236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDRoBLZC+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:54:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577F4B90C1
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7206300692F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9752DC79F;
	Mon,  4 May 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LwLwZp0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD42D780A
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877651; cv=none; b=jjvrAOgxJsNaOhl8uoBQ1xjWq22sbFsvTld5gSLc6gCXVB3WazeyUvQMIX+SCpqkyS3YSzPJZUhc0bfnv56kVklMQpQ4utWk58tG5W5y7UV8Yuo4cq35Un8zJGk40gjt8MuEUmZ8nVk7qzaWXRYPPYCsTf23SowVgODzsGoQXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877651; c=relaxed/simple;
	bh=ne42xYajKx8Kiea21amC61A8URblNNdzVSYQ5+DXQtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvtPaDzKHj8L+CTM4xsLvNCBwdUDyggtBGe6EWAtgH7TssCyLwOjX3hixTOygPmJI412JHM37+eyyqRQeM6mOImY51xikdTaXvoNhO6R1+glJBMfOp4tz72K7YtNxXBpLrGxGwbL0aBFqGCr/xrZr47xajnCU7HNt8JDaK68HTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LwLwZp0a; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4311548e87.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877648; x=1778482448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=LwLwZp0a3pKasW8GKqYw8ksSg8hE4RoCL8jyB1WycftvZZk3+I8dmQpPkWURtRt9zF
         4o+w3z7/r2s/EyANmyjK+2XUGW5CgMqNNZ0XNDyiJqPaEkc1fpCV38Koi16C7m2PjTYw
         9qCJczD0OjNlAh9p1mlKjCBPK1PQqcXjHrf+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877648; x=1778482448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=PW3+W+D8urV09kFTvDw/ZknX8WBX/lcsMqVMse6C/ewxg5gryC2Mk2WQ64d9oaTwZ3
         lUrkj7BWzTU1exLtXbPn17ovzLBBhoMW1doZ/skBmlXGH8hIhqawkU5RgAWi8/5x8Jc1
         l/zi7PYDNM4hus5YXu+YKu5CcE9QSgXrGgYduVQNpxmTE3FNWEz5tV0nMAM0/DR2+L3z
         d5ovtlPi8yFphmbu+DpDR6/nKw5JoGAKuHS43x/dKqgy6RY/qQRDFppPgAICYxPx0nts
         nH+HIz5KZ8BPi/Ni1qfCr+mW6MlXYK6VgpDKU8ta1yUzll+p2Alt6Ty1ghUgLXEq9n7A
         nRmA==
X-Gm-Message-State: AOJu0YwyQnUCklbhWotBnoT2QMfSZw57JoY0b/0z63OTR54+KG0/sBYL
	qznW1ax1ASM1wIJdn4xJn++XR7yxsHFkA6a/61aFvljroS50WD7Js9oPHpR4T9yFiA==
X-Gm-Gg: AeBDietD0SMuaWvCSaSPSOsiPv/vCLkK6HTvWWy+D8XIvwZbOfF5C1YEhFghZbv1RsS
	dRfVarxy5MMVaevZfcd88WRHiYgW+ou5INhqtsB2uNKCYPa/rtzWTMwHnt+4qIod6UmjFFat41P
	6zFN37D5CxMTnf4VPrfgL/f80WL9z9DgrvXwA6vdTdyA4v05PqpF3l4G2bQzRmSOb5vQ3hcf8xr
	P0e7WtVBNU177+qbeFGyRBgUIMCWpOxuiuQ/LRzjvGuQ2crC7FxYe3cp1Xz1BIu2MyF8NR31Vhn
	KXZHoDYt8yN6TEfIN6R3NVzsQta2zl8kq0PdeLrtGPgb5OR8Yv/c7zwv81g0IAmI/K0xk2iK/Jy
	VRmjQ/ydn2w450FPNMapcN85D+jXRBWyLVrnopOTYVSk+X+CL6IFGGNfxL1stPCxQoPN++qHuLQ
	mrsi2xKNu7pYJAPpAQ7XcngK40y8mahHY9bkUWdBCB/alwfYqMdmP9VauiQCiwszZ61FClh8Xbr
	1w2w2XxtS1s69uqmw==
X-Received: by 2002:a05:6512:114d:b0:5a8:7352:a885 with SMTP id 2adb3069b0e04-5a87352aa2bmr615908e87.17.1777877648177;
        Sun, 03 May 2026 23:54:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:04 +0000
Subject: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 0577F4B90C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60236-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog


