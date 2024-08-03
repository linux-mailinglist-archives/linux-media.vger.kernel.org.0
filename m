Return-Path: <linux-media+bounces-15742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC859468DC
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 11:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B2131F217B5
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 09:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C4F14E2CB;
	Sat,  3 Aug 2024 09:35:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D18A14E2C5
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722677703; cv=none; b=OFTfDRHCCPCA/D05U53pLNuByAq1KNyeQ+nmQ7lTkL80Ml1Jo/FxJ0Qv9Yq+BTzhArPekEhu7WiPWO4SgWtKPEjwJB0vV2RPkjL8O87m61x/lRSilmLJD8VaXK6kVZjGykdvfp4/boWJF6x1ss5vOxUgI+kC6Q9Sh/t210QECto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722677703; c=relaxed/simple;
	bh=+GJCPyaksKfpYecq/+AP54Nidup13PHXXEa+/GPTZK4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UxfIIpBlH/eUWvwJ+uON3R4sSqIBz7HmmaoBNprw3YoO/WwEATPU5d+LzD+Klnifd3HErpFr/GTmCE/QmQ8D5vMboZUuQVoogvC9t1L5Xb4vNz+7iGzu/Mtxm+eN0+Ri3nqmfDBCLqIRQMqFCVBuhZLF4JFi16mdvREFDXMNKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFF3C116B1;
	Sat,  3 Aug 2024 09:35:01 +0000 (UTC)
Message-ID: <8eee4415-9082-488a-99ca-e016f9d80bb6@xs4all.nl>
Date: Sat, 3 Aug 2024 11:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: siano: add loadfirmware_handler NULL check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add check for a NULL value of the loadfirmware_handler to fix the
following smatch error:

drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)

Note that it is a false positive, but frankly, this change makes the
code more robust.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/siano/smscoreapi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index b6f1eb5dbbdf..329aee411562 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -1166,10 +1166,15 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
 		memcpy(fw_buf, fw->data, fw->size);
 		fw_buf_size = fw->size;

+		/*
+		 * Note that loadfirmware_handler can't be NULL due to the
+		 * check above, but it is confusing smatch.
+		 */
 		rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
-			smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size)
-			: loadfirmware_handler(coredev->context, fw_buf,
-			fw_buf_size);
+		      smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size) :
+		      (loadfirmware_handler ?
+		       loadfirmware_handler(coredev->context, fw_buf, fw_buf_size) :
+		       -EINVAL);
 	}

 	kfree(fw_buf);
-- 
2.43.0


