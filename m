Return-Path: <linux-media+bounces-5317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C778588A9
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 23:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D286528C7CE
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 22:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4CB14AD10;
	Fri, 16 Feb 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDY0lyU9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777A14A087
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122775; cv=none; b=pW6LoHhHcSuLs5rGU0JNQZYYGzcBXGeEbq3vlKv5PXzI5c1J5zvLboINt6Nl0/B1ZejNfeYUgHegqmKDl2GA7SYJSlsv42ZYSzuCBba7vrtz0m9db9lj+mCrbxbD6qng2mh18Gv9ZCJSO4APBMK0yXAjz2XSXt85h/hTPP9psT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122775; c=relaxed/simple;
	bh=esIHiklqqdNqq1t9nZRMIIspEB1zhp+pp8O8d2C83JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fcw03kS+QBehr61AIZ3vqSNuiZH4KRSwD5f+RUTvjDErFuN8cB71oIG6DS/mMgHyJCSJDNWbhyyPFTWWQ2Qs99hMf2fpwwFvt2YKd+2QSvdD+l4o3hLNLllkyqrAhFgvJlVNeF2CNezC1V7Orav513awhZYBOzN3UzUHfdfx5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDY0lyU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Anb4cQar2NZFHV2i+Vcira5rrL8Em0cQqwH9RFem+A=;
	b=KDY0lyU9oJcGYOLZT6ZAabckk1oj37OZcIIPLPwBC96GOUWriRxuPdVRKNn1wKtCW5+EqT
	PdjDzfFzztB3eL/nOtorwM2g0g0lkR6YVuSwhXiU7RNOmJmqQr9QX6trLAV7/EpvIVLq6u
	PleXmkgfpAcaw5dTSDIGBcZFMF31vLs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-hXHDKpB7PrKJ0_Chyhp12A-1; Fri,
 16 Feb 2024 17:32:48 -0500
X-MC-Unique: hXHDKpB7PrKJ0_Chyhp12A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1264C280A9AC;
	Fri, 16 Feb 2024 22:32:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C872C03380;
	Fri, 16 Feb 2024 22:32:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/5] media: ov2680: Stop sending more data then requested
Date: Fri, 16 Feb 2024 23:32:33 +0100
Message-ID: <20240216223237.326523-2-hdegoede@redhat.com>
In-Reply-To: <20240216223237.326523-1-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

There is no reason to send OV2680_END_MARGIN extra columns on top of
the mode width and the same for sending extra lines over the mode height.

This sending of extra lines/columns was inherited from the atomisp
ov2680 driver, it is unclear why this was done and this complicates
adding V4L2_CID_VBLANK support, so remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 39d321e2b7f9..5b04c6c0554a 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -86,9 +86,6 @@
 #define OV2680_PIXELS_PER_LINE			1704
 #define OV2680_LINES_PER_FRAME			1294
 
-/* If possible send 16 extra rows / lines to the ISP as padding */
-#define OV2680_END_MARGIN			16
-
 /* Max exposure time is VTS - 8 */
 #define OV2680_INTEGRATION_TIME_MARGIN		8
 
@@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 	sensor->mode.v_start = (sensor->mode.crop.top +
 				(sensor->mode.crop.height - height) / 2) & ~1;
 	sensor->mode.h_end =
-		min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
-		    OV2680_NATIVE_WIDTH - 1);
+		min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WIDTH - 1);
 	sensor->mode.v_end =
-		min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
-		    OV2680_NATIVE_HEIGHT - 1);
+		min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIGHT - 1);
 	sensor->mode.h_output_size = orig_width;
 	sensor->mode.v_output_size = orig_height;
 	sensor->mode.hts = OV2680_PIXELS_PER_LINE;
-- 
2.43.0


