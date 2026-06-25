Return-Path: <linux-media+bounces-65662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4QDWHWmEPWpS3wgAu9opvQ
	(envelope-from <linux-media+bounces-65662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 21:41:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5C6C868D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 21:41:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q2aMh5bf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65662-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65662-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 290213085213
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 19:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA6C314D15;
	Thu, 25 Jun 2026 19:39:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258D315793
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 19:39:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782416386; cv=none; b=qKEKxy/ywLc3n/Blru7kcdwvLvTfGg4kXSN7ShkjXutJIL8qhldunyXmPB1mGEfJG3Y6xMSGnVM+LSSDfldXpIR8wy9RTKC6h2jtoRhS3NjXq7vRTeuofl8D/SlyDvAh3Qs3zZfH5WV7jv1C+n1sYAu53sfHw8fRDbzoGnIKq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782416386; c=relaxed/simple;
	bh=84UXNXyxTWEE5zLbbvSSVfEtswPI0QL/+kkIxV6Lzfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SomdMEs0n6kOIo3izkhjEB016toFQ1mLnJMOR1q/7zcuZzqz6xcEm5VXLSIy5bcvTAI7Iq+Xcl0bcMpUhiacU/OoFSE7mdVpXk8hvkBzM8I1sMzW/C84zaXW12FmmP57C/UbDQPZGstaqlvk10N6aQ7cHp4t4jNKihswXGBuOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2aMh5bf; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso130816a91.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782416385; x=1783021185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7LLa/zI712vanjpvALzounIGFr5nUT8eCgdqZsdvgg=;
        b=q2aMh5bfDQ36gA8cS++6RHpJR3+qjprPyLQ4wViZ9iL1cNKNlnsaeaqn4i4SLA2ac5
         4Mc2fWc0kFWrQSLB1rf4/+P5My0NRhL9aPG8JxP1iLYby4ErDja+ewNdAizPLC0lcxz9
         Fmux0uOl70btZewwZJ+YEoH9Te98xANyOoTOcmXlWjexMac6AwPR+EXi2EBfqDzonruj
         8sE47GBoSwPIbITOu5vooSv9gauykypFPbSkyUrWarsBDbXMfY2Q8noi28MYgrCFrdDB
         mjVdYXEEYbcOzo7vRRz74vPohChqCKjzVELEjf279tnOZDoQtm+NnH2jrJLzBxQExdTn
         Wmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782416385; x=1783021185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7LLa/zI712vanjpvALzounIGFr5nUT8eCgdqZsdvgg=;
        b=BBHJSHM2OSipbibuKP/LilAxsPfbrOrlsZvwqF8Svpde3xxhhw/6ygD9j1lfr7KfWw
         rwIoCL1L+KTrXXNKTRUUHCTcdaIxVjUyf5Zr2sPISb3BtS/xYYj5w7AQCzTw7IQtW8Fc
         UKmswZGhr5SFYh1awbM6VadY0kWcnPUtL7VYMAt0fZR2IErX8KEfkcnG/QmhjBEb86kv
         ZzLNYBB11DNc6eh2YDLPfh7DwjoIBP/rGzL5s9O2VR0bFIdwn2ex67b9R7vZOl2krLHC
         cmwCGmD/i+20oL9+r0KPz7/higSdwvVAcWbJSKy7O7se+Jwt/tgcW6vqYVYzOEdQZJPX
         KN+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTKiMPggCnW1LA/84KYnHYcnEZIbCNcGirLGhQgvmHCJ9GuxFK6LfgrUvBE25wu+CE29ZY/0n5Ib5Ffw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYute9xRGFUY0CNJurVO1l7qInX+QaqhwXX7BmSyhFFC6/YnL
	Qj1QFyGcQwVDqyyRFspacrv/rSrCwn2F9UOjkD6HXqE7rOj70YgOEObr/gto8ahrIEE=
X-Gm-Gg: AfdE7cnBmIWzX+zRS5BL0ESa/bM0ArVMF1Lf1JsbE+zoiNg8z+MrasYJMakRQJ9PkTn
	daX77qGQm3t/5i8shKnJohqBf/Ny5FJju+0+EI3wKLXPTfqZn5o9PrJCa/XHGL4KK4BdFXI92Iy
	Wk3YIUH2uEpH/9yM9F5Xse+9qYe1nuzQfXMQpvd/Jwx2NpE9xx/wbN84wgaJZlwKw9pddEhZ3g8
	Dm14WH+3/80C08AK1y51r+INYVF2Fl5jr13i6KCZknzT7fgQ+WgtFpufayoHVq/uv9jpbqe9ZXW
	9Myc3SrSk7iIclfazEhnkUs2+X4Kvd0G6zmghaNZF2Ax2AD/zqugjuLFt+7vMavpKwSi1kDgGVo
	KdD6IEpoE8aNN/w6BF+69WFvLFuxywH9erCWNAW1yMoSMViUEKa1ApTlg8qnRR4Oro7KUz0GUTj
	HRpqw2aR3rOq5ziOWrJIPRGDcniKBjp8q3wVymUAF3GK48zPQCjR0G+UoOZ+mp1vIcw2Crqv4A1
	BypbKzYowJLiW08u8+7G6s=
X-Received: by 2002:a17:90b:1a91:b0:367:bf0c:54e9 with SMTP id 98e67ed59e1d1-37dfa264e1bmr3893444a91.21.1782416384760;
        Thu, 25 Jun 2026 12:39:44 -0700 (PDT)
Received: from fourcolor-Home.. (2001-b011-7011-1a33-56bb-9418-403f-5fc2.dynamic-ip6.hinet.net. [2001:b011:7011:1a33:56bb:9418:403f:5fc2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df411ddf7sm2422204a91.16.2026.06.25.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:39:44 -0700 (PDT)
From: Shih-Sheng Yang <yshihsheng@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Sheng Yang <yshihsheng@gmail.com>
Subject: [PATCH] media: v4l2-dev: fix media controller registration error handling
Date: Fri, 26 Jun 2026 03:39:16 +0800
Message-Id: <20260625193916.3562596-1-yshihsheng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65662-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yshihsheng@gmail.com,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0D5C6C868D

__video_register_device() registers the media-controller entity and
interface after cdev_add() and device_register().

The return value from video_register_media_controller() is currently
ignored. If media_devnode_create() fails, vdev->intf_devnode remains
NULL, but the video device is still marked as registered and the caller
sees a successful registration. A later video_unregister_device() reaches
v4l2_device_release(), which calls media_devnode_remove() and
dereferences that NULL pointer.

If media_create_intf_link() fails, the helper removes
vdev->intf_devnode but leaves the stale pointer behind. A later release
path may then try to remove it again.

Fix this by propagating video_register_media_controller() failures from
__video_register_device(). Also make the media-controller cleanup path
tolerate partially-created state by clearing vdev->intf_devnode after
removal and checking it before release-time removal.

Signed-off-by: Shih-Sheng Yang <yshihsheng@gmail.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5d2faed002a7 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -203,7 +203,10 @@ static void v4l2_device_release(struct device *cd)
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
 		/* Remove interfaces and interface links */
-		media_devnode_remove(vdev->intf_devnode);
+		if (vdev->intf_devnode) {
+			media_devnode_remove(vdev->intf_devnode);
+			vdev->intf_devnode = NULL;
+		}
 		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
 			media_device_unregister_entity(&vdev->entity);
 	}
@@ -896,6 +899,7 @@ static int video_register_media_controller(struct video_device *vdev)
 					      MEDIA_LNK_FL_IMMUTABLE);
 		if (!link) {
 			media_devnode_remove(vdev->intf_devnode);
+			vdev->intf_devnode = NULL;
 			media_device_unregister_entity(&vdev->entity);
 			return -ENOMEM;
 		}
@@ -1087,6 +1091,11 @@ int __video_register_device(struct video_device *vdev,
 
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);
+	if (ret < 0) {
+		mutex_unlock(&videodev_lock);
+		put_device(&vdev->dev);
+		return ret;
+	}
 
 	/* Part 6: Activate this minor. The char device can now be used. */
 	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
-- 
2.34.1


