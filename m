Return-Path: <linux-media+bounces-64862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3TffAaUPL2qJ7gQAu9opvQ
	(envelope-from <linux-media+bounces-64862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F726822EA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YXil9kaJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64862-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64862-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA97F30107FD
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B692431E82E;
	Sun, 14 Jun 2026 20:30:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BFB2F532F
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469032; cv=none; b=HmoqLK88LoXZ14yvDTvkbXJdUH4G/RCjjyKbOTJq7E9mE0W9LOHuaHYnx6Cjcf+uTUqh4mJS9rN09fOw6hY/Vd/HQGs7jcT3a2BgoyjLhvGa9lcVz4NcrPj5dovWdSE1j5eF2rk3qprI6R1Yv4KYtnCIhNPi1s/+FhUTAeMnRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469032; c=relaxed/simple;
	bh=6BLfx3k/fCodQVzAj+Lom4ebu1O8ZhSi0TevNjpof2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3VilBW7AI0DkhhtI64RenvkksId+DLAv4p6DF00Km+kGjXECcV3kkbNpm3zeF4QuNY7rpXBRpRHaF5eGA90JEI1t2/YtS9HrpdM3ifwz+9TjpWhQD+7xy0DKuVjiVFpcelWRFLn0/4z/U+yLF8Q3heRlqjMLsIXjeMyjfTrscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXil9kaJ; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so940835a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469030; x=1782073830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEaZ0qrTzljcueJLN9W3Ve3AoI5SNdLgoSasxNY4Atc=;
        b=YXil9kaJ2zNmcm8JquR6sg230s+wCDSEdEYHmXffiWg3N2J3+HAc+wtuCnknsy28gi
         ej0LzTwdzSHiAcPWQyj5pWwYFgw2fFpko+clXQuNVnhcEFAfh1A2PSHkhCHOuPkLlW0W
         E2tLXLLmu8/JxBr/wBRcjjIJvgVlUqAXjc8aO7/4am0XWT+rv3zgfRBwToF5dpUdSI37
         NAVtLUgQf6btEoXtjNxrnmJJUqyM4IhmnamnqeTqxajwwFxgPASu8Kg/gW/FbVFZgtFf
         iGaxNdPHRSgzn0l98NIJzUf6PkCY4qSPVq1463G8hDyVsT90JVRib7zYOReThKZufqoB
         HvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469030; x=1782073830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEaZ0qrTzljcueJLN9W3Ve3AoI5SNdLgoSasxNY4Atc=;
        b=YS93bmVfQZA6qOxEeQGmBa8MPEDhnI60DTbFGHEQkE1K7YXzSqxxphe3GQNx4jK1Oe
         5selwhNdoAEW4Pak7/xxsuWNp1ONwxUIy6YHTPl2alUgjhlMq0Ppd6r98b0W9lht1L6M
         xHKjrfDt8gkkXJH8V63D7F1C7z7eqR3/cbMNUZMhon3SRQizvYAC7NbRY+GeNVeyKTwB
         VJD8f0RO6PwG6mn/dIFGRAuWA76MwfeuADtj5tIKJABjA5Si3/DOqnLloN6pb9+6f4Z4
         SxBFyKsm1AhEfC0NTv69ScFDN2Ni66Dm2IbHe1zzP8VAZuCShePirSggodafFipnSZCp
         mIew==
X-Gm-Message-State: AOJu0YzJztkIiyh9W6432QVZF2kZ33SbKH/p6sS66Hkzn7d98ANMw/eU
	IGaBaHHPytcBLUYFX7eEFVU5pNY0CqqBoGF/9exj/YCklb1g35KxMofDDA2QNMQj
X-Gm-Gg: Acq92OH98SVJqpqVwP4fNDR6e+GRSI4iypWQRbGeJh1xL/J611YRkm8g3WYezyciel4
	KV/mWGiWwoz00ye+yuX/tylntdrRWTmks/z1y9LucMXKE/UwO3x2DJb9qNzgQbrZDFe1nRs9aB0
	uwsTWcjS1q7+KeCGadah+0LQFcscsBlRntE/qAhfV/CGDpiT80JxlWuwu8jSgO83sOazKqG4qDy
	FaEHeLLoqj6cjG8A5vt75aD3oxwFmsv87+vf+LSlOHUEDegulmx/IlvZUaljQ332sXkq6D+Qwmr
	oW24KKoPvg9jY5PQQZ7aEw/Igzq7jWu4YJUKFIh5x9xsOiorVMRgyBh/TwGDNjmdu9ZjMfMCzHU
	+8IKyXq64pPPbOM+MM2ZzZmJBTDzO5kUasUENVZ0IWtn2vZ3s+8lsRx6t2jr8B8Zj39pcstaDfz
	n7El/HY6Ke3TLXnwba/pwJkHmKVXYzvIev2tx1AZJyUwWGre3luozY
X-Received: by 2002:a17:90b:53c8:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37a01c34700mr12708938a91.7.1781469030581;
        Sun, 14 Jun 2026 13:30:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.30.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:30:30 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 19/22] media: usb: em28xx: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:19 +0530
Message-ID: <20260614202835.11977-20-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64862-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93F726822EA

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4a0ce9c5ee4b..70baf93aa8f8 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1006,6 +1006,7 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
 		if (!INPUT(i)->type)
 			return;
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
 	}
 #endif
 }
@@ -1136,9 +1137,11 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 				"failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 
 	if (dev->board.decoder == EM28XX_BUILTIN) {
@@ -1157,8 +1160,10 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 			dev_err(&dev->intf->dev, "failed to initialize decoder pads %d!\n", ret);
 
 		ret = media_device_register_entity(dev->media_dev, v4l2->decoder);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&dev->intf->dev, "failed to register decoder entity %d!\n", ret);
+			media_entity_cleanup(v4l2->decoder);
+		}
 	}
 
 #endif
@@ -2403,11 +2408,13 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 		video_unregister_device(&v4l2->vbi_dev);
 	}
+	media_entity_cleanup(&v4l2->vbi_dev.entity);
 	if (video_is_registered(&v4l2->vdev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vdev));
 		video_unregister_device(&v4l2->vdev);
 	}
+	media_entity_cleanup(&v4l2->vdev.entity);
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
 	v4l2_device_unregister(&v4l2->v4l2_dev);
@@ -2961,6 +2968,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (ret) {
 		dev_err(&dev->intf->dev,
 			"unable to register video device (error=%i).\n", ret);
+		media_entity_cleanup(&v4l2->vdev.entity);
 		goto unregister_dev;
 	}
 
@@ -2995,6 +3003,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"unable to register vbi device\n");
+			media_entity_cleanup(&v4l2->vbi_dev.entity);
 			goto unregister_dev;
 		}
 	}
-- 
2.50.1 (Apple Git-155)


