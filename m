Return-Path: <linux-media+bounces-21497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01F9D0A47
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 08:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0041F23685
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 07:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6EB193416;
	Mon, 18 Nov 2024 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dVjDKgcc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E436190486
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914997; cv=none; b=mHUDbVJjbxuxXOWwCksW4unUy4t2x6wtbrzFIWZj+kRWseqEJSo5i16rGK/FVZQ7COqmuuUuD1zSxnQ44tSlWIhKFDfeTOeyP+JfQk/erRSfnVkiNFFtXmzD30gL+J+Q8axZaafcXpPptYDngk65kzEaDQ104E03Dl9s9XRCn0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914997; c=relaxed/simple;
	bh=uTkhNbFOdy89orZJ2wqxH0CWdATkbLmapGDzC1cZrsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLgnsdAiR9OJQNkFoVTcEGFXheFc31BYTWF0fVnfjGAsaswfY1o7fbwAqhpt33ROf3LEBSujfKBYgnJIkHwfvFOGx0Eadfn5LlMVPkG3FTeRrLz//MB5kvgxYPG9Cma5rvUaP8kgtz3KI+pnFFDEK/AFhcokfhBYcsuFJlELvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dVjDKgcc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=U1XjJORgqEmqv+cPQtTQzQaslx6GMVxaRks8/5d1VG8=; b=dVjDKg
	ccwIi6ExG3IfAt6Im+fj3OweX/X2ch2YRDLbi0Wt0T6EEZX1PitclGs7xslUOj+9
	tMOI7INcXzaFyAdj6S7192nqahamKkIUglZQ79AEY3mIn6duncgQ/d8d51LNadwf
	xfR2vyU31pSRBDkTTgibiuNKLJZ+oiUwq5NVJqeYo7wxUqwlfNGrlnGY1ha7nbg7
	VxH1Wj1Pcy/02mOp3djZ8vc5ajdA6ZgH8rWXyDLOwlsrtDLa2Rh7ljKBevNw2ZVa
	eMstg9VLdPfgq+Ra0ijLk5nz2Q5AF6pN1x7qF00Favsuqeuxum3B9w73t3935Frr
	Spu6/unIIcIzuFqw==
Received: (qmail 112454 invoked from network); 18 Nov 2024 08:29:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:39 +0100
X-UD-Smtp-Session: l3s3148p1@xr8c4Son+tUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 07/15] media: mceusb: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:06 +0100
Message-Id: <20241118072917.3853-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/rc/mceusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index cd7af4d88b7f..7e824eb2db9f 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -28,7 +28,6 @@
 #include <linux/workqueue.h>
 #include <linux/usb.h>
 #include <linux/usb/input.h>
-#include <linux/pm_wakeup.h>
 #include <media/rc-core.h>
 
 #define DRIVER_VERSION	"1.95"
-- 
2.39.2


