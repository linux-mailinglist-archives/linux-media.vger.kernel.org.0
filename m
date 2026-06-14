Return-Path: <linux-media+bounces-64826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nj76BcXdLmoc5QQAu9opvQ
	(envelope-from <linux-media+bounces-64826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFE6819E1
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bakx94vq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64826-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64826-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B196730054C7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6C7307481;
	Sun, 14 Jun 2026 16:58:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF13A3E95
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456307; cv=none; b=pyR8AY+5UkWo3w+e95rXZ4Mu7TIX/Wo4UgMJNDgiT9LNta3WCgd2se9Zb557JWl8IeNXIvvJDUvAnBhKrLj7X8Oo24hUsXvbz56oEQm5F9x2s9nyUrYDwHmIHQ9tCzaUCAkGFWFuOf46Z0ohsFHnc8qXA5BJ0zrAXwC7YOOagwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456307; c=relaxed/simple;
	bh=1eMFal86YAen0vVh9LNK/i8PVVHxlGEY2RnZMp67kpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1FnL9d1iwz+QFiOY7pIGgm+VIXN6/yA+4O1gn7z0IPqtuZJjh6xrWr+ZpcvGy4WX7hBOsV3kFNabriJ/+zzdm00yKXxgBos2EuJSKgAOcVGGXHtGvdQKxlkOu5QiTmqR4WCgIph5sAl+mVGPW2We3DvKsiiFHCCJNRgNFZXpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bakx94vq; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso15408395ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456306; x=1782061106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s1vse+Ln4RMdyUiTjXy+JLi3K4i9YZx/oe5qm3b5zQ=;
        b=bakx94vqkteXGynW3t0nitYgwewd9sOF8kLGGe+uPapkFrcOGK2F6qAx45mqSyupWG
         b1KhuZLzcNN7T1qh0cmQeMUQkrySKL8W72CaOrI5U4PRKA1skRmNg1uOq2nHfcqr7l3p
         pg8HYGvNBMBTPR3kFXAqjoy6uiJAYRtIF/qK9SgQIHSXvXLoPDmguKzHQHEARwrUfudv
         58xXAOZAHIoeMomnbZdw4HAVbvkQApe6dfEPD8dbGjp1XlIz/JbY5SDJrUx7yBFr/ESw
         p11bGOJJM7v3bVbh3cnGnTyGn7k3uUAL8rDOlOgHS20uNDfkVnGKlItAKVkqw6l0AW1Z
         K2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456306; x=1782061106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s1vse+Ln4RMdyUiTjXy+JLi3K4i9YZx/oe5qm3b5zQ=;
        b=UDOvURsZvcUU+vu6Rf3JtBJQ2xkSLKjtxKWizNoBg8OCR6KYzNa839mjw/0Yi1ey8M
         7fhQ75rscBLhX9LMASmMQ1D/UJ1nA8wJ9g8DxpSvUUNLn+AImeNcoQT0W1TBpgqKvO1j
         l9RqOThWJ3w0JZL9RGX6GLsg45H0lT5dcmnFyO7vBj/Q6SN7lx+wmz3qmpeUOjVuq8fZ
         9j1af6r0xhCd12w+iSngUAUs6OVhOZVACtRTZ4axw+wYgbjAXq11q2qfL3KycIrjDwHv
         Gu1IOJi76h40E3VmQCKekJ/eNp+coRx6T2OMYSlR7SC8am6jCDq4SJkV0ynVTS7gZOeB
         FpUw==
X-Gm-Message-State: AOJu0YwB0ItgOnGzZE27KgEzRacTRH1MtmX9egyemIjMqG/HttpXCIop
	DmvF94dkNTpxXpaw1JSezouoJYjKA0VPaXxuzktNX0i3yrStTRgOxJ67IyMpyYk7
X-Gm-Gg: Acq92OGKYwfZ29OWPi6dryp4mymlAkO13GcbdR807FSy/v9ZnyhoIQe7E7yvJ+QgBxM
	WpuO9ag16pvJBeyH9SL8f6vE80KkCBFki6i0DYPqBGb8YCuKSboixmvDt6lQ/v+k9yBLdSE0jUI
	72G3KidKrLGkvf94olPfnARlBcf0SiU5s07IFvjv56yz9KrUMZejB4rptDThSYQnDizLhnWpxv5
	t6PNkJf77Oo9DXrbAYTkNoqULIhAFF1h5sXalSl1PSfffVTjumwGhqjoj5uFm8YO5BL82tL1aWW
	MCOryN0ygxg02nI+cq59rORSnrAG3LESVKc+IjetH4PPCY4nE6cYRDXvxPvtkUqum9cF3wSAIz5
	G1K0cGJl7Hb/AiAEMUrdyDQrxTtO6QQw1I8jQIw4QRRZKArnjzPZ+m9N0p0tc2xDuCKz0mBYJ0Z
	9fXkQcw8ycbRGGFH8bMf8a5/zZYWh7LaNeZkswUeOczVnNBGUE4Q1w
X-Received: by 2002:a17:903:2352:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c41300f817mr109828205ad.29.1781456306087;
        Sun, 14 Jun 2026 09:58:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:25 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Chen Ni <nichen@iscas.ac.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/22] media: usb: au0828: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:57 +0530
Message-ID: <20260614165630.3896-21-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc,iscas.ac.cn,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64826-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:hverkuil+cisco@kernel.org,m:brad@nextdimension.cc,m:nichen@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9FFE6819E1

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/au0828/au0828-video.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 3c53105f3d2b..fec4eafd6e30 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -628,6 +628,7 @@ void au0828_usb_v4l2_media_release(struct au0828_dev *dev)
 		if (AUVI_INPUT(i).type == AU0828_VMUX_UNDEFINED)
 			return;
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
 	}
 #endif
 }
@@ -934,7 +935,9 @@ int au0828_analog_unregister(struct au0828_dev *dev)
 
 	mutex_lock(&au0828_sysfs_lock);
 	vb2_video_unregister_device(&dev->vdev);
+	media_entity_cleanup(&dev->vdev.entity);
 	vb2_video_unregister_device(&dev->vbi_dev);
+	media_entity_cleanup(&dev->vbi_dev.entity);
 	mutex_unlock(&au0828_sysfs_lock);
 
 	v4l2_device_disconnect(&dev->v4l2_dev);
@@ -1907,8 +1910,10 @@ static void au0828_analog_create_entities(struct au0828_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 #endif
 }
@@ -2026,6 +2031,7 @@ int au0828_analog_register(struct au0828_dev *dev,
 	if (retval != 0) {
 		dprintk(1, "unable to register video device (error = %d).\n",
 			retval);
+		media_entity_cleanup(&dev->vdev.entity);
 		return -ENODEV;
 	}
 
@@ -2055,6 +2061,8 @@ int au0828_analog_register(struct au0828_dev *dev,
 
 err_reg_vbi_dev:
 	vb2_video_unregister_device(&dev->vdev);
+	media_entity_cleanup(&dev->vdev.entity);
+	media_entity_cleanup(&dev->vbi_dev.entity);
 	return ret;
 }
 
-- 
2.50.1 (Apple Git-155)


