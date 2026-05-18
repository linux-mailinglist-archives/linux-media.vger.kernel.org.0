Return-Path: <linux-media+bounces-61974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOH+D+ICC2q3/QQAu9opvQ
	(envelope-from <linux-media+bounces-61974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:15:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DA56C670
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3792130A33A5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3F93FA5FB;
	Mon, 18 May 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9SjxPzt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A43FBB73
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105665; cv=none; b=juA2BKbMKBHv+kGUXS1Ql63Aeo7P0N+HraUhzZczdeV1W+fcQXDk93Z2d9opZdZhOEa1/kBGBjGZjXgC+AZaEIc+FH63eyrxOF886QVlxa6ziLnvGHkk6ke686chEPKSvDrn/g1utC3okpa8RgzGSad9SWWiLIHF4kcioZIX4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105665; c=relaxed/simple;
	bh=0c1Mrkb7+bhzeKC2Ct5caXkVbPMxmWDkewexcMtIHhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4iywuq49IxyuBH3B+BXgn3oaqAkLsudnf8oB3vUF2tJa36h3Ew95wEOORLz4QcghH0O1b53UanugUlrwn3iP0uoCZUeuwM2LIoCsgOyIUzfF/D3dsMU+8zKcO7BJzeYuvo7Rq248xMA8S2dmv9zt9+SN0VIpWO5JToyRTWa+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9SjxPzt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82faf871346so1704076b3a.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779105664; x=1779710464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJEUMZmKl6FVu1xLyRkkbFa1bO93jpDXLl37QYwaEqs=;
        b=P9SjxPztAwHs9/O/9DDvc0cyrSvie4JJljx17+4zjaZzbuWDQerKyYYQQ2DLppYWz+
         GT1fJUCq8tyyWb2JcNIdo/frSuTFJ2S1lQ+7y2Pxk//JxrNh/fdd27AMHw98ZriUYu7h
         wC6ZpuDLvA25DG8KWhpn9gsciRrxd84wIY61MOEyGX2MUzapc4r2d6hEuZ9bnNXxuE+d
         1OP6lvt7RVVQFGJ715C2FTScs9ycQI2YBwLIeIu6O7AfqyyBgsP2hxHkejxG0IYNNYFx
         DHb1eIfu1EscdyfrDKZdZLFc77d9YfFJpHQTMYwJl+tod4PNNcE7A6SjHo1xY79+PtqN
         Ni5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105664; x=1779710464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJEUMZmKl6FVu1xLyRkkbFa1bO93jpDXLl37QYwaEqs=;
        b=k8J3Q19kpbRHen7WqTnyQeQ8H7T4aRClRnngDpIDiHKU7IkBT/L5Xhk39tlU6vQuID
         sEdEXA/mLtMDUUzz2CyYFAC/FVnrVaM2VP86Dg/foAnDc71RaeFU31YQeTe0RPP6kmOa
         rDNpfyxZ/qCsG96n3fHrR6/0xE12OFfqDR5vG9b7kWJFAgfnrO7cGLghbYlOdT0i1p6Q
         U2MtT7vNcDd6rOO/PhVhXi7RhIxm+lLLeffkr8KeMzvz40FXNdsSEpYI2GFLbZKnyNpi
         WVNM6wqFv3IdMnE9WiNK/6s03rp7zw9d1/ktB5OUqMeKNXLw4SQfVXDpMnUoTLEcQKc5
         VWtA==
X-Forwarded-Encrypted: i=1; AFNElJ9Qdpt+GJjp9swaOGbV/stR/jQUGow6GFjUPLPpHg7CWySVBRE73ZfL9QgTGI631W33OsgNWKNCD7VCLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOpe3GGyXwQkm//scmNYzvdnOXsEJWTbOzxZ5NNL8nQURrHs1
	3cvcgZl3SYDlAQdaveFVgMOC7i7y+wYuZh8kKM2sO3UjqeW6BUQcZjEc
X-Gm-Gg: Acq92OE3UvYwVOrUKpEerW5l3u4E4wnINBaJaHBx/6shPKpSq5GVjUVPGeSOZfqbNsX
	dP4yYmZ3p7eodOVVaQHhIipELwNkJIWX1FP0n3yyE5zDcbpGWiuVRfMLczJqIqAEsqhcA24mokL
	AaHqdAMQyjica6d/rWr4S6JlKSx1NiHKrpLAaKJIvtXmh9ezhnXebQ/JHqQc76MyjexHUq0PeXT
	GaZEYy/Q3jQ0OGM31ZOii/814hSJug66sPCgmTDg0aj0Gy8dH+Czw7AFo3Fl4SjE2e7oH0+SBbr
	KsoxPvov03ld9nyMDeScZ/jrk9rgr8wqw5Q2E0HonXfed/Lax/mupLvHo4FpVRFvmmkgt8U+N+i
	k6tPlaIT1vEqnK8sfX0/3KyDuzwGzuyY/cgvSlHEKz5NxpG11FWTM4eSUjbAhwGSrvFMYlSrV95
	Rgg6KlU8O29Ve15Wze
X-Received: by 2002:a05:6a00:4193:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-83f33d0d040mr15225051b3a.49.1779105663542;
        Mon, 18 May 2026 05:01:03 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f61e5dsm15030434b3a.51.2026.05.18.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:01:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: amphion: avoid double free on video register failure
Date: Mon, 18 May 2026 19:58:13 +0800
Message-ID: <20260518115813.992075-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 952DA56C670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61974-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

vpu_add_func() allocates a video_device with video_device_alloc() and
releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  vpu_add_func()
    -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
vpu_add_func() then releases vfd exactly once on failure. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 64fc88d89ccc..8a89e48ae467 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -832,7 +832,7 @@ int vpu_add_func(struct vpu_dev *vpu, struct vpu_func *func)
 		dev_err(vpu->dev, "alloc vpu decoder video device fail\n");
 		return -ENOMEM;
 	}
-	vfd->release = video_device_release;
+	vfd->release = video_device_release_empty;
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->v4l2_dev = &vpu->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
@@ -853,6 +853,8 @@ int vpu_add_func(struct vpu_dev *vpu, struct vpu_func *func)
 		v4l2_m2m_release(func->m2m_dev);
 		return ret;
 	}
+
+	vfd->release = video_device_release;
 	func->vfd = vfd;
 
 	ret = v4l2_m2m_register_media_controller(func->m2m_dev, func->vfd, func->function);
-- 
2.43.0


