Return-Path: <linux-media+bounces-9257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E98A443C
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 19:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203D42821C7
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C95B135407;
	Sun, 14 Apr 2024 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk3g36Iv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF761353F2
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713114049; cv=none; b=CKz52T1iLg1LFONFwP0T83dl7TMRl5LVLP7C3D/8tFkFuuPyCm9zuZsMJN9UhbM+q0o5Vuyc7FkZGnypTRatm7ZzxeXkpUXdT6kva0kj1uB+od1d5bzHYEhhQFMnPrSSQcDPTVpF7nV+LixmfRlzeJrnzjm3daqo/JjVjlDqrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713114049; c=relaxed/simple;
	bh=QTSinBpqwxoKm+WiWRN7rj0y1gqVnCSnuBHvlLmlFqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FnGuFyTxnLAmIq4dw/JZT9HbtplPBHrCQzyGuN7su3zAf2wE3R657vi7QPNV0oSaWQ5ALi7V/zcTasUj314KiVHyZI7+4V+PVs56F4WVi1S8XCk8OBiTrACDsz+unYZuXRT1FGT+GS336I1Vhx8iMZvmCV+8QcR7c8FkQnG779c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk3g36Iv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a526d381d2fso210766b.0
        for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713114046; x=1713718846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5SwY9B6CMv4h/cquzMMWNtDJKQ4H/7w0L9m7DcDMMw=;
        b=Fk3g36Ivg11YU4CmLm0Tsnk2/YzepTXzVmRoi/jSfRQ+EOTolwc+rKWrQuEjzgtPzf
         AxcAcx/c2L7q0paiNOtAY4BKSjkN0ZaiKOl/eRxKYcPJ8Y/Ryo8v76Oave8VhO1LswCW
         8r79pF0VbxfEjQqCJ0BLYlJ9tQQmilI0vv2fo+Z22LLDyiegcmBcRXrxQehAqFtKSt+m
         OLKdmzWXhAct+tXtkoXUnAQQjJq/rChdR+Fel1au167PFPWTd8GGhkXcFUo2D3t6ZiJF
         ZTu1rDwMda+1PYZ4LNZ/zUJncUs0fK2vnAkCeYst3lqOlhwZu+LuXcX0O1ObL/juRb2E
         LPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713114046; x=1713718846;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5SwY9B6CMv4h/cquzMMWNtDJKQ4H/7w0L9m7DcDMMw=;
        b=UtMjsQAxpW6vQGjoTGkm9Z06SD/77dxb8Ur8NAFqsuuS6EnE1GevKnY24b+zy5F3kp
         dykFSuTO18nLDVAQQfH/PTxyMxUI9OoADXpq38/fueAuhWnUHtbD/CNjuJ8wWftrBZfo
         k9YyasyfRUsxZtZSjUUnAA4H5lQf5dWUUbRzukEIaNx+EJvXIJ98o9JNctFqrW389qTF
         LUoO13m6dhwFR0iLnD2BH2usYJe4S4v/RXvsE/zIsmOj7f1ZnLwCVSIdTCyee7kz0BU/
         CsfeYaR/Q5EjY7ILfrHrIjt8+0bzMTSPG2XMJePOj++0HYyc1TT0Ye/haNL1bIJj0iSc
         Irtg==
X-Gm-Message-State: AOJu0YzMj7MLND71xOx8ISVD5Uk+2Jt4F8xiCrLnz825o8WnR7+IaRvU
	n8h9Nw4UmHemBHLu2E03eWer+zBvAgDWe5kPhad58Jwod5J58Mzj
X-Google-Smtp-Source: AGHT+IFAdOWSnhgNekdBi/sm+06NsuZyRm9JTCbi8gQ6oK2ZWhB0TXopEZtTKDP4sZaQwhhdWutj+w==
X-Received: by 2002:a17:906:c113:b0:a52:1b82:9948 with SMTP id do19-20020a170906c11300b00a521b829948mr9882906ejc.8.1713114046430;
        Sun, 14 Apr 2024 10:00:46 -0700 (PDT)
Received: from foxbook (bfi40.neoplus.adsl.tpnet.pl. [83.28.46.40])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b00a4650ec48d0sm4453554ejb.140.2024.04.14.10.00.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Apr 2024 10:00:45 -0700 (PDT)
Date: Sun, 14 Apr 2024 19:00:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: uvcvideo: fix the bandwdith quirk on USB 3.x
Message-ID: <20240414190040.2255a0bc@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The bandwidth fixup quirk doesn't know that SuperSpeed exists and has
the same 8 service intervals per millisecond as High Speed, hence its
calculations are wrong.

Assume that all speeds from HS up use 8 intervals per millisecond.

No further changes are needed, updated code has been confirmed to work
with all speeds from FS to SS.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..4b86bef06a52 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -214,13 +214,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		 * Compute a bandwidth estimation by multiplying the frame
 		 * size by the number of video frames per second, divide the
 		 * result by the number of USB frames (or micro-frames for
-		 * high-speed devices) per second and add the UVC header size
-		 * (assumed to be 12 bytes long).
+		 * high- and super-speed devices) per second and add the UVC
+		 * header size (assumed to be 12 bytes long).
 		 */
 		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
 		bandwidth *= 10000000 / interval + 1;
 		bandwidth /= 1000;
-		if (stream->dev->udev->speed == USB_SPEED_HIGH)
+		if (stream->dev->udev->speed >= USB_SPEED_HIGH)
 			bandwidth /= 8;
 		bandwidth += 12;
 
-- 
2.43.0


