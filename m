Return-Path: <linux-media+bounces-61849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP0mMparCWookgQAu9opvQ
	(envelope-from <linux-media+bounces-61849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C72560D29
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7976330179CC
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDDD35DA56;
	Sun, 17 May 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhPfn0ah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666333987
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018635; cv=none; b=T03rfz0oTJ7Dpt5VkkfMDjSUiFlzaHslEZKUKkM5oOF6/o0uJjeqz2DvDSR2wMvKfjhJRbMn+qsGZxrSEU4Fl9Slh2Dj/23pKwgOBzzESGUUh0RbSZ3B0usrZBkHV9EatTqyykfiWLPyQLqPx4I4m36nEQFr6oD3muJIiuvZIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018635; c=relaxed/simple;
	bh=ySMfbMwfO6T/V49VrNcMVhHqVu7LazqpqQbozRcsqyc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VXEzfzzaM1z70C8KuuQYcMYkzPS6QwmKfib8YTRDaFUMyYvwuSFcvwxzrDZ+bLC3oHBZIbjN1+tPE3mCCDb5ISFhgfsBl8g3erc8yJJIHK8P41QVar+OlekiMf+FRvBf1Q+OdIHe+KdTI7gGy/O+JDkq2lcDrCgnX9eC3KlyKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhPfn0ah; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83d5bbef760so539029b3a.1
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018634; x=1779623434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NK0FGbUhthCvGO/GheNRpPws8eCC2XUOkNPRY7jlpXA=;
        b=UhPfn0ahz50AIyPlh8UWemGyzrEpUy9EMuOf0cbbisprbWsEtIokareeDplVMM8gzW
         am/yTu2QctvZemaqDXZC3zZKlMsb7Hdry52nHtuEO/tWwCk3SjdHuRbZpnQ6QkgBumlk
         2GUWPSepcz1R7WNdZB0pv/X6e+AFKk/EclsRAHQMn9ccAQeGeTZgGV9hBAbtBeRaHz14
         6EKhwyZMzEiejoNDauZbowYqVE71QVbtlWYbuURCvosbIavWs4eeyOiUAWl8IjsogH/u
         RfEn3rzcQayQgYjGMJ73K+eUj6qujHCjkI5vsQv8T9bcvv/2Rz9apmo8SIRCjo9Vj7VM
         YRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018634; x=1779623434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK0FGbUhthCvGO/GheNRpPws8eCC2XUOkNPRY7jlpXA=;
        b=bmu0SrLL1svf4ruzIBYLm/vVFEf+sMMwdexv6PtPcJa0zP7WpnuwQM9zM70wNJITj8
         dpHNVWR4ktJdvnlrxivJNEGMiNy9UpjZwfkVG898NErIBQp+Lym6LCHAIj+4zQslzw7i
         tbJIcEK9xRguOOzLVm7I9PvHFkRw94RbEN7EKWjIn/++ewPSrOy6K4q/erSn4Qs/tYes
         pgE4GMM5FUvoX3R+/uHsgvvPkzt4cyrnroXs5rSKIMs9c1yTpeUDhfAjaGga6Zd4y1xk
         MjuqmUoH3hMxqnVw9fCNJqzivS0zGj2rfUS+poxF1IeEXOq7rYLAJ/NkSgcyZ23wyY16
         lE0A==
X-Forwarded-Encrypted: i=1; AFNElJ/15r1AwNMclS/lYR0c0rFjQNdEX0szdo92QONi3MPE6KMJhV85C/f9D0PMV6fwVno9YUmAeuqp0YNhuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFevYORk0Nj4fIgMonmRhYf4cwU3ZdKC7+tQwJUFsVz1oV1EmH
	ZYMwpRgj8H/jZHFUFEPqSQrVrizeA2IU2w3kVStSp47Lr4apeVuEJS5V
X-Gm-Gg: Acq92OFeRPaZlrBoV9LF4E4pxLuQxHO8omDwn5e9VbILZu7/7zmUlUZbgMR03RCQqNo
	5gfWlwq/Om/m9qGYnc4Afcs/14YcxyvXT/lrc8kzwc3g9Cqo+ogikysogNpwAtKMHGIepqWcVTj
	dHQxy8qchsY9n+AOkWMyq34QojhqCgIkOwe4awEPTAE/dgDtpsnb5OuIoTRQF2berzHeHS+G4Gx
	tK4HcoDCU/LRdqIErDbHei2T/AEXBLPsUL690DC5izHkpHOb3eiW85rx10pgC7M4jSs5hBYjWwp
	cCWphCYwtiSFWUJjv1mZ9B7nX01ce5Y4w1G4KqcN/Zrg1X95h+quk+ap6Sk2bEvy6PWgQiOqeFp
	JbcdlJqDMjiomZhiuXvdpy6B5MSw/xg+50ui2qeRawL/0h3w9167ByuQvMhycCLZLeB9VFqewgt
	ALHH9b4UiVB6Pj
X-Received: by 2002:a05:6a00:391a:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-83f33d93f29mr11645175b3a.43.1779018633637;
        Sun, 17 May 2026 04:50:33 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm9725745b3a.33.2026.05.17.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:50:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Javier Martin <javier.martin@vista-silicon.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mx2-emmaprp: avoid double free on video register failure
Date: Sun, 17 May 2026 19:50:20 +0800
Message-ID: <20260517115021.953212-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 27C72560D29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ideasonboard.com,gmail.com,samsung.com,vista-silicon.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61849-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

emmaprp_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  emmaprp_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
emmaprp_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 8091cb7d9ce6 ("[media] MEM2MEM: Add support for eMMa-PrP mem2mem operations")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/nxp/mx2_emmaprp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index d51a62100778..a27809b7730e 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -834,6 +834,7 @@ static int emmaprp_probe(struct platform_device *pdev)
 	}
 
 	*vfd = emmaprp_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &pcdev->dev_mutex;
 	vfd->v4l2_dev = &pcdev->v4l2_dev;
 
@@ -867,6 +868,7 @@ static int emmaprp_probe(struct platform_device *pdev)
 		v4l2_err(&pcdev->v4l2_dev, "Failed to register video device\n");
 		goto rel_m2m;
 	}
+	vfd->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


