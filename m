Return-Path: <linux-media+bounces-21161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6E9C1F1C
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 245061C22FD0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE491F12FD;
	Fri,  8 Nov 2024 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y07Wjq4S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678C1401C
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075839; cv=none; b=Gr4ax0PW4HxDtZK9RgppTJHpGwCHw69FxUsabwHQQuYZ2C5xUEvzFu75Wb5aBoGm0ZFkf7CKmeTNmBkARozmhEWurNAeUdHSTcu80VZtFBW02tFpDBINLvgQNyXG5Ibk+Us/xXUwLiwPdpersrFF0eTtgXywEP8/keeGKqfv254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075839; c=relaxed/simple;
	bh=U5FXIWEmaVW/2zQOBF1R+jEthy2WZf5S59JvvAEX5xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7tUOzckHcx6Uy1L9nxgkkNwlXe7U94FyroyCgj72dG28V0arQxfSDKmi2mcHAWHN4fYAChAEUJRXihzMKuGc1VR9yUc5W+Cn+ZfMAUIhGtmxRBInZCuAk+knpMt/FKEP4WGm3l24tVOMhvvM+v/PVsPTM6YrmBtjuMuwASoglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y07Wjq4S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E04BB2E0;
	Fri,  8 Nov 2024 15:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731075827;
	bh=U5FXIWEmaVW/2zQOBF1R+jEthy2WZf5S59JvvAEX5xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y07Wjq4SVMHQsIyHEcnGK62hMBeB0lJYXA8S3PnzkxKzDDcSoq9kQCpoLk3MKexS9
	 PNrMft8ePg123LtVA+DxB/YFhXrEMQoHceJlT70OTLEFPlARQuLJwFNBdvVJ9yKlfz
	 wOKbjG2AcTpwFK0fFVbaoonjSiuEKYEUOcktIjIs=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 1/3] media: uvcvideo: Introduce header length
Date: Fri,  8 Nov 2024 14:23:08 +0000
Message-ID: <20241108142310.19794-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uvc_video_decode_start function returns the first byte of the header,
which is in fact the length of the header. Improve readability by using an
appropriately named variable.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e00f38dd07d9..2fb9f2b59afc 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1117,6 +1117,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		struct uvc_buffer *buf, const u8 *data, int len)
 {
 	u8 fid;
+	u8 header_len = data[0];
 
 	/*
 	 * Sanity checks:
@@ -1212,7 +1213,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 
 	stream->last_fid = fid;
 
-	return data[0];
+	return header_len;
 }
 
 static inline enum dma_data_direction uvc_stream_dir(
-- 
2.43.0


