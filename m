Return-Path: <linux-media+bounces-14036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D369146C3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74EE9B242AD
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4794133406;
	Mon, 24 Jun 2024 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnpkivYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A2E12E1F6
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222944; cv=none; b=kR1MTnqrDa5ldaoAy7IG5gG94B1k0IAyp9mUZmo/op6EFb0mnzv0wV2lOrc3dveWB/fRO0n3UAV9P+oDEdB6HqsZbsJoJJcel7Z8q7PE6Y4x7h5AHkDekpGK+AGcN4oH+eLyXe4qbVWHsDI6Rfx6DVudR2sWqpP0TSwE7fIQ2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222944; c=relaxed/simple;
	bh=u7dipANjaxDtqPp/l5/VY1sxA3WnXlxgwt1Womrd2UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ScgJpEMwijT/lDdK6W0TW9/4OtwH8QmXNEaVPOIK2WPfKJSu4gi7RN15xLpy8s9J05qezITsVusH699fbj/WXea0e8vNqQBCrpDpcr+7wFF0MN0M/oWc4vVKEwLQE8uPTnaldaE8uRq0kHWXJIAx1UFyzattI6p/Y3DUWsJAiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnpkivYL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421b9068274so36285895e9.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222941; x=1719827741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVNiWfuaFq46y6Euu+d/DApjCpD2SqkQJUanWaoYbzU=;
        b=RnpkivYLZBSa6+pnvo4aYzsDA6ap5m6ztR6tRpXJYRiVr7VnXCUcxK9CwPDvDK6YKZ
         OF8WrtPcXwDOhkasLg+8p1iQperNIaX3Nr98D8NQCfy09QCDOknFKOR9ZRzVhgNm7B7o
         187OVUEhlYbP3xvooXft0EXAfVsx8WhwoO7CHrHQWxOAPRUjgEy7zfk0rtYK5TTyplKy
         HiqztUPVzntdQCi9X0j6erxr9pM8ifWpvsOXi/Dpfll8CGU/j3aU9FcHyh8GOWo2/Yxq
         ZT9QIOsiE48aI1KNDzxhNUV2ATKUYSJ4dgZoprPacybtvn161Dy38hnLM8Uht6EqsS9u
         e/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222941; x=1719827741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVNiWfuaFq46y6Euu+d/DApjCpD2SqkQJUanWaoYbzU=;
        b=kwE3I/mggwf+JuJ2znJDK9k8C9leRbR29ndXGq9LOh6Zz2smixbGkMTUFHZ50XB0wd
         qit7B4jWsdy+pLQH7HUGeZb+QdPgRewieniswtiay0yMBc9g6/o23Z7I1WDoPENL+yNn
         qWWvGChNBXIHQefhZsUykvY1rjs6h/6FkbHQGu4QyDt+hisCWJBqQ4mDNXDrPwsFxamz
         JHEk/cjxD1hlQBP8Xnuv0KRIYPVZjN9luZllf6bxOzR5hFl7nihix2W+OAKGOuU2eKaC
         SUxYZAd6YaF7/luP5S70hjeLc9bwOcoigWiI4+PswKhDuQrM339NlTIr/oWMdR7pe02E
         OYCg==
X-Gm-Message-State: AOJu0YzwjV2zvvtNHdMJcXEy7dBX3A3J1h15jQGHX001l/5H6jltnn3X
	fLJWpEjpDsJ5v66sV+s2GX8pt3GkiqgUAgmsNSrR8ZtLej8mRRwV/BGw1Uc=
X-Google-Smtp-Source: AGHT+IHJGIKSiuX00J4XY30XGfNsGMUf3ejAoo/bnuh86AVPgAfaEuJkE3xqcsuogNlw3zPsQ0ke/g==
X-Received: by 2002:a05:600c:5699:b0:422:384e:4365 with SMTP id 5b1f17b1804b1-4248b936414mr34640145e9.2.1719222940442;
        Mon, 24 Jun 2024 02:55:40 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:55:40 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com
Subject: [PATCH 04/10] media: Documentation: vivid.rst: Remove documentation for Capture Overlay
Date: Mon, 24 Jun 2024 12:52:57 +0300
Message-Id: <20240624095300.745567-5-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifying documentation to remove 'Capture Overlay section' as
destructive capture overlay support was removed.

See commit ccaa9d50ca73 ("media: vivid: drop overlay support")

Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst | 68 -----------------------
 1 file changed, 68 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 917b57225939..31fb86030249 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1282,74 +1282,6 @@ data_offset to be non-zero, so this is a useful feature for testing applications
 Video output will also honor any data_offset that the application set.
 
 
-Capture Overlay
----------------
-
-Note: capture overlay support is implemented primarily to test the existing
-V4L2 capture overlay API. In practice few if any GPUs support such overlays
-anymore, and neither are they generally needed anymore since modern hardware
-is so much more capable. By setting flag 0x10000 in the node_types module
-option the vivid driver will create a simple framebuffer device that can be
-used for testing this API. Whether this API should be used for new drivers is
-questionable.
-
-This driver has support for a destructive capture overlay with bitmap clipping
-and list clipping (up to 16 rectangles) capabilities. Overlays are not
-supported for multiplanar formats. It also honors the struct v4l2_window field
-setting: if it is set to FIELD_TOP or FIELD_BOTTOM and the capture setting is
-FIELD_ALTERNATE, then only the top or bottom fields will be copied to the overlay.
-
-The overlay only works if you are also capturing at that same time. This is a
-vivid limitation since it copies from a buffer to the overlay instead of
-filling the overlay directly. And if you are not capturing, then no buffers
-are available to fill.
-
-In addition, the pixelformat of the capture format and that of the framebuffer
-must be the same for the overlay to work. Otherwise VIDIOC_OVERLAY will return
-an error.
-
-In order to really see what it going on you will need to create two vivid
-instances: the first with a framebuffer enabled. You configure the capture
-overlay of the second instance to use the framebuffer of the first, then
-you start capturing in the second instance. For the first instance you setup
-the output overlay for the video output, turn on video looping and capture
-to see the blended framebuffer overlay that's being written to by the second
-instance. This setup would require the following commands:
-
-.. code-block:: none
-
-	$ sudo modprobe vivid n_devs=2 node_types=0x10101,0x1
-	$ v4l2-ctl -d1 --find-fb
-	/dev/fb1 is the framebuffer associated with base address 0x12800000
-	$ sudo v4l2-ctl -d2 --set-fbuf fb=1
-	$ v4l2-ctl -d1 --set-fbuf fb=1
-	$ v4l2-ctl -d0 --set-fmt-video=pixelformat='AR15'
-	$ v4l2-ctl -d1 --set-fmt-video-out=pixelformat='AR15'
-	$ v4l2-ctl -d2 --set-fmt-video=pixelformat='AR15'
-	$ v4l2-ctl -d0 -i2
-	$ v4l2-ctl -d2 -i2
-	$ v4l2-ctl -d2 -c horizontal_movement=4
-	$ v4l2-ctl -d1 --overlay=1
-	$ v4l2-ctl -d0 -c loop_video=1
-	$ v4l2-ctl -d2 --stream-mmap --overlay=1
-
-And from another console:
-
-.. code-block:: none
-
-	$ v4l2-ctl -d1 --stream-out-mmap
-
-And yet another console:
-
-.. code-block:: none
-
-	$ qv4l2
-
-and start streaming.
-
-As you can see, this is not for the faint of heart...
-
-
 Output Overlay
 --------------
 
-- 
2.34.1


