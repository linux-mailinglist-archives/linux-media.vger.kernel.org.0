Return-Path: <linux-media+bounces-50682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C9D1E1DA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C98B306704A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5D9392801;
	Wed, 14 Jan 2026 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCyKEZFb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70538B988
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386756; cv=none; b=a4tSzbrID6rDnv4CXEQCaDJwNRO5kQC9KLStOB12POG/IOPxBZFwfxAgEtspgfCuEOxmR/1amcceSDXT6tsWx1DHMK1IlptVqvW2BhU9KDIlYOT8cbzH7Ko9BvXILHU3naH+IlGBd2fJ8nKaQ6BHG9vAAzHIigWui4WNNGqTw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386756; c=relaxed/simple;
	bh=pCYTDrzs5PZKkR4SCnzv6Jrv3cKoqYJo/QJ8RXsQx54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmvLLfhCfdlGJkZdACDTuPumdyAOak8yvJJwiK2IXgQgPnTIUVEnRqrpE5xnAVGN5LTyVcqfnuBd/8+xo68zE0n5/ckEO8FIw6nMCQZ/Psvo0Bzgio49W/FlPZruARE6PVTV+mK7pGtJGWNCV1p8ABW9H9A9UkSa3rUuiWSkvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCyKEZFb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b834e3d64so6184224e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768386748; x=1768991548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwbbUWw6Vs8xgqtHC1ZesMYsqb+WhuYt/f5FK2CbCH8=;
        b=HCyKEZFbNUo7U/rWeKmGUH/4JizI02hxkNEoEAJe4UW77M1dRHrmopEPWwcpDswYLg
         +YblHadXkss6GpurFE3Lg7ZkCOIU8+7EnU98SpSIk4rspQCy8LKGdFev5UyxNytMuCJh
         hrzYQKxGzz4hb6hLGQNeqvEhqehWa4qpitC3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386748; x=1768991548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OwbbUWw6Vs8xgqtHC1ZesMYsqb+WhuYt/f5FK2CbCH8=;
        b=Tsdyzk63klogzZ+sJXukEduOPwMWEiLKTAsyBdk7mmY4RSEkzAPv2bHiLotL9d7X3F
         gzSfJdMayvv+GLcU6lVb+EeOrw309k/EAjvS6Na77vMI/FoqO1z8iigloueS911ZO3Y+
         qAZVPF5yMs+E6TMsU/mYrj2vrGZGwskUxTf7BFQiK4m5K0tZ7AqruLjN1mOEH5OyDKpN
         ao9uC5bTHWGOkIMEgPNXo1zhzEJ3VOJj2tRQD1YgEKuHlXBmoQvu5hPKQCdcYsePDh/T
         ToZd2m9f+qqxushHjZuIsHBDaAMZr3E2KVPE+XyxOVN0gV6Jse/sWWZgfjspPYAvWLvn
         I2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUUk88oc+w2f0GkZoD/8u3yY5xj1A+wh6ZX7G4yDyIPBTgFAlGVYZBcgOmdIUZZ68OI6tYuE3QXJAIZEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlqW2GUMciT1MEdnFH6rsulCCCM1Y2GoG0KTrDuwdZGAxSQ40
	YoM45zOD8sf3dEofkZn4ArkBpzy/1ZkxAbG7I45DlCkaudDHGHr4/0gl02lBNl4O6A==
X-Gm-Gg: AY/fxX75wJVTpmUJcj+PvsNVEZFiQ3zSna/ng2tYOHrWXgbtPe527rh8UBUq/eDZIQN
	LWlcFz1sqDJUMpp1qin7Me85OYmd+v9PBlImBZTJ9Me3k1ulSK/TRD0eOn/F6EYHLY/N54L164P
	rQ7ebZxMgcbrz0IJpiJIN+u9y+KvfjU2XJW3/3B1GXbf4ddO6O2fDNlv1yE8LbfhtNG0suqusHg
	wRrWS0PRtBbiLNXtqjJvKmVHAmrPC5eKFGh6DVCDcMioSO0PvAf5xNPEfkSrX8QzwUwEvzeBOjV
	3xtaaPKrLVSoTJ7YfKCwOEzZ+2uc+atsQ2p5UvmkaxPsG9oqCPXj49SSGP7zMaHesnPi1gom9JE
	qd0eumQIMzUq9eBO31AnwZ132db1zmQ0e40P5C8WqKInPDitN3usPm/6/XcWsLu36+zipwuCFFJ
	DaBo+uY1mjMP0v8dMUtOTOWWKO0n78cAdiQpfS+R3m345N3PSygA2EkcPtzYPXwkwuLAs6EA==
X-Received: by 2002:a05:6512:110e:b0:598:f262:1658 with SMTP id 2adb3069b0e04-59ba0f78c4emr643858e87.34.1768386747665;
        Wed, 14 Jan 2026 02:32:27 -0800 (PST)
Received: from ribalda.c.googlers.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10411e5sm573981e87.61.2026.01.14.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:32:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Jan 2026 10:32:15 +0000
Subject: [PATCH 3/3] media: uvcvideo: use min() for npacket calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-uvc-alloc-urb-v1-3-cedf3fb66711@chromium.org>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
In-Reply-To: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Make the code slightly more appealing by making use of min(). There
shall not be any functional change from this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 59eb95a4b70c05b1a12986e908b7e9979b064fd0..db02080f15772e0bc1d5cfcadd32463f4e6ea045 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1808,9 +1808,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	 * Compute the number of packets. Bulk endpoints might transfer UVC
 	 * payloads across multiple URBs.
 	 */
-	npackets = DIV_ROUND_UP(size, psize);
-	if (npackets > UVC_MAX_PACKETS)
-		npackets = UVC_MAX_PACKETS;
+	npackets = min(UVC_MAX_PACKETS, DIV_ROUND_UP(size, psize));
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 0; npackets /= 2) {

-- 
2.52.0.457.g6b5491de43-goog


