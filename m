Return-Path: <linux-media+bounces-20545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DB9B5620
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 23:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692FA1C22740
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 22:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F135420B214;
	Tue, 29 Oct 2024 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBXzZXgt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D2194AD6;
	Tue, 29 Oct 2024 22:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242605; cv=none; b=JZ2yXt4B9EuNnO/fWcDnEciPM9Z/SwXj0CyV8Y3cyU7KtWWCFHSPSZYUAhCSiddEOg2hcKhJBByuExR4ctdx42hXwbIqL+nOW55coe45ag4cx+JgN+PKBO9Njt+IWemM7RMEplxx/I5I/tG1zSYbJG7As9BK3jr3YscqScmE29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242605; c=relaxed/simple;
	bh=Do7/gJ5lnF1cUV3K69wJKZy+HbKjdSFW/xsvhvXP67s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SyP/ZagQRnLQlF8ihHXFQyOHnf4KTAZjMnEDzk+ES0bjJTJLzLJbUaMBYGBz4WFYvdOf70+JC8L0Fp6lrZdtOuWGJR66yn1Hqon+QjxALzzPwhm/JV7QjtDQtxeRiFwoil48ux+L43qBWHdq7IyQSrpXq04y8wgGSWoFJvgfvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBXzZXgt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so4933691f8f.2;
        Tue, 29 Oct 2024 15:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730242602; x=1730847402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMNSzz/+xIf/XTvjrA4Umyy1PvtZ6Wltbg3fAKTOUc0=;
        b=UBXzZXgt1+jsv7r0uT5HJo3F82fOdNWEw3147H8hVgU68cglNIcghz9NJkHSv8FbSm
         6ZrAjXLYfqw3uaSGDSyQF3Y6QVh47MuThdp95DLO1oa2kxm6FGhTQX6KuwlMOgokhL/N
         XSGtg9XCFH6E0L2lKaY0MyjAm1ZZiPnI1VyGhswGkmhO3jnhRkn41dVJzB2bt0uMaCZT
         fPIVBa7w9ESlxUpiHHotnfNXwGgHKnxYEG2PMxqNOoBqN/chajrKV+67Fmz2Vini5QsT
         xWxJOWFG5/rkpNh+Rdi/qm3tzK0lsIqL8PeCHs6dFxZYdxc38zprpwtrE1KccOoTv6lO
         /r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730242602; x=1730847402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMNSzz/+xIf/XTvjrA4Umyy1PvtZ6Wltbg3fAKTOUc0=;
        b=HVqh2KMb/whg1b3IFGp62w7i4nsN9CbZsrIcJ3jbO2SW53rFlKiW4I5YptlT1rFOy/
         OF0jgyVmQCONLklPR7TFGwjX6fEEqX69/cSrFW/cclGWfJK6JlSe8j+GPb06XS3r8RgN
         xXZWiXzKYk117reTx8G+NIncUXPPURxvlH4I3W1L890bjmGQZt6LbFzFkyBWLq93vjk+
         0GiP1Qfdn9G6bz3wV3KGAz2nkmNFeuPwB9hh0gX81QW9WtDXymJlTrdmYcmZ/3c6H7VR
         sWTxljtT0UWCDBtOTLYeEPi++6bsuaHChQXkXpLFw0RQuX2VVsGBBNZOxfGQqWxOXHR4
         M9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW6olJe+V4uvEAWQmgaiV1BeToBADK9b9+WnDEgsSyg2gegSIIW59SGQ/R6vMMjnu7GQqvlSx9zo23dnPE=@vger.kernel.org, AJvYcCX1RZtqSPsUIliM0LLIyKmZW4iN1RkZFVaxJVeYAbJwGF/MqIO2AlTiGzKT+2tzzPhagUfcP5k/hNSyh90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bvQmfrtE/g3ap1hr3Yen61qWhjhXBTTcVkVHYW5Nfe/F5lNx
	OZ4SCMHNGZk1gjBXMJhrpHriE7FV2aCovBi/w1u2mYQwcglLgROe
X-Google-Smtp-Source: AGHT+IFbLaEqqiIO1UCyulG3MXZ1wN/8kKJwWFY+rY+t3jnZ3ej/LK7/ohQOMcRGpJJNYjVIypPJlg==
X-Received: by 2002:a05:6000:1942:b0:37d:43d4:88b7 with SMTP id ffacd0b85a97d-38061141a54mr13006339f8f.3.1730242601521;
        Tue, 29 Oct 2024 15:56:41 -0700 (PDT)
Received: from tom-desktop.station (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm2737165e9.41.2024.10.29.15.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:56:41 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx415: Drop HAS_EVENTS flag
Date: Tue, 29 Oct 2024 23:56:31 +0100
Message-Id: <20241029225632.3019083-3-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029225632.3019083-1-tomm.merciai@gmail.com>
References: <20241029225632.3019083-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
control handler is set. Let's drop the HAS_EVENTS flag.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/imx415.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index a20b0db330d3..3f7924aa1bd3 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1113,8 +1113,7 @@ static int imx415_subdev_init(struct imx415 *sensor)
 	if (ret)
 		return ret;
 
-	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-				V4L2_SUBDEV_FL_HAS_EVENTS;
+	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sensor->subdev.entity, 1, &sensor->pad);
-- 
2.34.1


