Return-Path: <linux-media+bounces-61955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AvOFXnvCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:52:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CB556B049
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98E493016295
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263D33EFD2D;
	Mon, 18 May 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYAd2c6q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E23E8321
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101534; cv=none; b=m9bRrU32TDdQ16M78qQq8MScAKpNlBkAPwHQAEDk2enYIDRTNVokljMTFuHi3ul0yEt4CJWxLqo9nMoRE579oTO1MVj34mJQTBAj4jT3BUUbFguER8ecjjDmej18ljfeBK/AbMI3WhC2XAf9j8LH96/VqC7rzUUcI/ICopv30AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101534; c=relaxed/simple;
	bh=wiCVYdzE63JDD7QEHWLD40kMkCELvj4ARCz6e0vEqCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqu1OZRDo2IvAN6pHwIVbAlrMjo+EG63qqRqAddA+LtDXtBn1wnIlhwCEEf6gkPPz77ufHUMeRyVbAMpNu51vQr4kFYh9glC/+bT/jeTGZr4oOviNbqE4GOd1xCKXdQgavOVvgGgqyR5ODXuWiWFf3jQnUlzjqqzlRBxn3CQCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYAd2c6q; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so1982168a91.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101520; x=1779706320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC1BbEYhycnz0G2b2hJ8BLdN9a+o6lZEO3GOpDZkkew=;
        b=QYAd2c6qqc3vrYNc632CCGCOs+11zPR4RzHIZ1DCbDl0LlT0nM5Lh6pNZ3WCyv/Zwp
         KRcikq5YMleGN/JimG38hyZvqZS5TYPM2V6JT3I1ruaFKF0EVsBbfQlIHIKybdouZVn2
         hSWttiWnjO0ydWt/h3Mh745vqdKXdvogNl/s07D0+gJeCPUmEDudRNpHQwf+8wz+VE7Q
         vB5rhtm7v6kjzdyBjj/OkHAlTsKzCNccA0E/Zi++5CPiFhmI1BJFq1cTdwiAdABvPDFL
         vH94VxrArbpmgwoQBNbRGBQuehoH7RC0kSCMprr+EoLafM0WfiZao6u+FlDj0AuWLH7L
         Jdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101520; x=1779706320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC1BbEYhycnz0G2b2hJ8BLdN9a+o6lZEO3GOpDZkkew=;
        b=Fys/WcURKdoIrvpQmexynk76xAakMY1A1Ck4RUsdTnLpoJCfBaJ2Re9fEPEcSeFNYE
         NyZ/TfzL18a+PQx10dI2l6047tnWbyuKPIPLKEJTYmPFxVGCdOTHEcBc2swOg4K0QtuE
         6hldFCNy1FszYnzIJoCnYJ7S4ogMMVOiiaNHPuN194xg2RB0IhHwMRIr+tUqJ6AkCPS2
         hxKYY9QO0ekkzSnt4Ca3gKtoqbllIxXLPLfxYQnIAlPedm+T7lrK0OT9fh+3FlrsL0Co
         1g1jK1vhkEmVfC2GravKcMrOFfWARoif4HIisSKUNxtjUHDf0M4CtDnBucdroa7GqN0r
         A9jg==
X-Forwarded-Encrypted: i=1; AFNElJ96CRykyTXOzTwoozbeqKOPVdaDyLeqPPkfIgp7iNyLPe41xGtC75VJkmkO6EYSolSB8ABU5h9rtcob8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0AIcMFYsRnrH5RakIIj3FfYMJj4jBGYDWN/ywsxFxMCiO0P9P
	1D2sQfLGcrw1YPXESbgqH1DbaiY6T/C86vdSDVyCMVhap/RMjFCNvxvl
X-Gm-Gg: Acq92OF3oebf/ZNNKRDfePweW/hY1eXqfqYL3EQ8g3pKg9GLNMiZ55lyte/qB6e4W+r
	i/dpKf6peTiD7NSzbpjF/WL1qlRxBuVnT+zflVKuaXkh+cTt9ewwhLvxvDtwi8/b1NmuY3gYG5g
	C7XDSe//S5l9snVljvPmHHFr2oOGy0m8yk8j2aHTwnRW9OK+jioIt+CVLpvmvxlyAPUObeh3xkF
	xki2euVM67mtwHfMyoGl/Z6hxbLzLPw72Ij5lC6fwi4mfbg+3a23LLYWAuJB+OFJVQkXb7ozIPb
	SVBj+qGf+yjAZMsBidP3J5NPiG5GDCH0/jEcqHmZ7N8HTmE4dvIdZQxZYxXdvPPyKk9K7FEaniH
	Pq2D3dXb2jVEroGHTpYhkvb1xz4NbUdTduU4EhHwIrDUojGcLAFIU2v/lo/6Jv0Whr3qg1RBfyc
	ufN7/wcqcPoiOEEREYc83zIx8=
X-Received: by 2002:a17:903:2284:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bd7e949015mr170263595ad.33.1779101519779;
        Mon, 18 May 2026 03:51:59 -0700 (PDT)
Received: from lgs.. ([36.255.223.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb0csm135509825ad.17.2026.05.18.03.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:51:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: rcar_drif: avoid double free on video register failure
Date: Mon, 18 May 2026 18:51:43 +0800
Message-ID: <20260518105143.988148-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C6CB556B049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61955-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

rcar_drif_sdr_register() allocates a video_device with
video_device_alloc() and releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  rcar_drif_sdr_register()
    -> video_device_release(sdr->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free sdr->vdev through vdev->release().
rcar_drif_sdr_register() then releases sdr->vdev exactly once on failure.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 0844934f7aa6..19c5c2823176 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1066,7 +1066,7 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
 	snprintf(sdr->vdev->name, sizeof(sdr->vdev->name), "R-Car DRIF");
 	sdr->vdev->fops = &rcar_drif_fops;
 	sdr->vdev->ioctl_ops = &rcar_drif_ioctl_ops;
-	sdr->vdev->release = video_device_release;
+	sdr->vdev->release = video_device_release_empty;
 	sdr->vdev->lock = &sdr->v4l2_mutex;
 	sdr->vdev->queue = &sdr->vb_queue;
 	sdr->vdev->ctrl_handler = &sdr->ctrl_hdl;
@@ -1082,6 +1082,7 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
 		sdr->vdev = NULL;
 		dev_err(sdr->dev, "failed video_register_device (%d)\n", ret);
 	}
+	sdr->vdev->release = video_device_release;
 
 	return ret;
 }
-- 
2.43.0


