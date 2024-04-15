Return-Path: <linux-media+bounces-9323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0E8A4BB3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5561C224CE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B82756B96;
	Mon, 15 Apr 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fp58X8+K"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FE55C2C
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173845; cv=none; b=UU6F+YssGoHo9OzcUC3BWbGyYyoG0bebkA6YRtPChcWi0UkpEsJHk8REjHJqVgiEgJv+5ycpSIW+SNbOmF+KP1F7qrpvdyFFmj4p6P9HRSEhDdBFtdPprQvORWjuk8DYcjLsjkod887XNlZUnRhKFvy00pkdwDPJ9y1MM+29qsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173845; c=relaxed/simple;
	bh=Efxx58K/N0orGY0hE2CJwZX/RRmuEEABPA/uA1hluxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkklDXcp7l5nzKFaXQQU2s1kM8mMMQ11IofB0N55OHEuPxOaE1yWZxoXAIvhzvLX7LoxfejJjS8HqPL+gADmRqJvoEiwJ1IigKoHMgvIE9GFASdpQCDNDnmHQa0E5tlKYUlYz82mf4QRYPHYjQunZH/qrXv3zSbmXr4LC0Moemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fp58X8+K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713173843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkHdOeBNWHtREjZ+WBbco95yCBYqIHo6d028fUo1cSw=;
	b=Fp58X8+KEOkXGX2FiTG5ckXxVkIuLn/H3vAgrI58WQt1GVV9hv1f2cutM/S6UQBwm2tcD5
	ASqHWt68xZVqJHiceG8462ud5VMSZbbzNRhXH54d8R33S9AwnYKC3yg2UHn7hWemPdJIyE
	jzCfDHKEq5+sjfDWzHcaCs1IoQeNdDw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-1rQAPyfiPgmbJU1AjmPvmQ-1; Mon,
 15 Apr 2024 05:37:17 -0400
X-MC-Unique: 1rQAPyfiPgmbJU1AjmPvmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5963806735;
	Mon, 15 Apr 2024 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECF75C13FA2;
	Mon, 15 Apr 2024 09:37:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 1/5] media: ov2680: Stop sending more data then requested
Date: Mon, 15 Apr 2024 11:37:00 +0200
Message-ID: <20240415093704.208175-2-hdegoede@redhat.com>
In-Reply-To: <20240415093704.208175-1-hdegoede@redhat.com>
References: <20240415093704.208175-1-hdegoede@redhat.com>
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

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a857763c7984..4429b569ded0 100644
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
2.44.0


