Return-Path: <linux-media+bounces-11014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B618BE3D7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC46C1C23C99
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3C816E888;
	Tue,  7 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFt4TNkp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574CE16D4C6
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087921; cv=none; b=ausMOspgn3a/hL5lRqc3VxBvBOF2GFsnZmZj87fvLj5g6Itr7kWmAA/tUfhrNieCRWsJzOthwcZ32ugSDpEc33qwFYXjkVrwCEs9JPENdXGVX2U8cvD0KZdh47HLQaBUkF0l9fNnNJG3YIdb6UdIkH8s+l/4n1OMgt4kbiYbHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087921; c=relaxed/simple;
	bh=3FQmdzC7rLah5bHXqxL1pjRWMb/l2vnOq/dIwPsVxiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRN7KIqQ33dtRhpEDO6ZEMb9VSpvoYg5cEmcAYAeqwyfX4dvQzjO8+co9jVbINKn5Xtu2cFi4s6Ca1W2m1NnwO5q/Iq3shJeJ1HQMUeQArCXb/0MEViBWYsTkmbL/a160tE0hPNAj8BlWynsgihSYXKYKTAQj4b11MCPiUBtu8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JFt4TNkp; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7928ec5308cso288067085a.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087917; x=1715692717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=JFt4TNkpMT5jL5IFAYGuw28lBWwu84Ak+EoHQOC6AlPJzZQOXDDwp2LfLftQDkcI48
         kePHAN4Bhd5TFp56PnCYmL0IjqhZvKlhNTePDpTlPyuZOgFXVPm3H+gBFvSW2TKQP2V5
         t4vOxqEd9Db93cAxWnLWBikZe5wQjTQDdToXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087917; x=1715692717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=Ta5OWJfcRPY1y/n/0LEVopr2nR2uTZsJlbVe80Vkze9VETrzTnB58gcL2WksTNMZYL
         Ch2xykUOMZAPBqD9i7/JZ+hsKdVHy8M19zVtPWinkzKz9+V5OHNTD0IpR4qSg0MbIV+T
         NXfZmLoQDHJ3Aq03jZAWx3b7a7imGIDQhWZU/NE4qxJWieuuIz5W8mnfi/AfWDkZQOFp
         fCh7XECgdf0p/g94HhWs3YFSTkGL8GWsc4BcANrJ3w1/2GuPvHMrfYFe9ZDZKhZ/9BBA
         QANkHRXzql14I3D56RXu/0TU4BI0YQmqcZ3MHUpuyAe86mKNimC8lumNQ787a6JKTMdq
         y6tw==
X-Gm-Message-State: AOJu0YyguDCYpx/wCocLAfjwsB7a2X4osW0MXzU6B3QCFj3//L7D+6d6
	sbjFoD94HrMvNbdn1kFji/apUNFkXWoGO+A9U++cUc3ivusscDxlheI9c0Z/dg==
X-Google-Smtp-Source: AGHT+IFKliypIzu0YjFcg14a69MBEAau+ZXpSAYRUE5dq1ueGc4ePsCBbZXpGGTph+KzlVWTljAkDg==
X-Received: by 2002:a0c:e082:0:b0:6a0:f637:667 with SMTP id 6a1803df08f44-6a14600e407mr45875746d6.12.1715087917380;
        Tue, 07 May 2024 06:18:37 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:34 +0000
Subject: [PATCH 08/18] media: siano: Use flex arrays for sms_firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-8-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace old style single array member, with flex array.

The struct is allocated, but it seems like there was an over allocation
error:

fw_buf = kmalloc(ALIGN(fw->size + sizeof(struct sms_firmware),
		SMS_ALLOC_ALIGNMENT), GFP_KERNEL | coredev->gfp_buf_flags);

This change fixes this cocci warning:
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index bc61bc8b9ea9..82d9f8a64d99 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -666,7 +666,7 @@ struct sms_firmware {
 	u32			check_sum;
 	u32			length;
 	u32			start_address;
-	u8			payload[1];
+	u8			payload[];
 };
 
 /* statistics information returned as response for

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


