Return-Path: <linux-media+bounces-29154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE7A77D7F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F110816C772
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720B1204F65;
	Tue,  1 Apr 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K6GZ63aE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B22046B4
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517082; cv=none; b=Na8GLiTBFRactQPuHoMvTRclxrle7CDBMgAf78XrdsrLlSbhT1mO19JtPbZ++N5eDWKgvfiGJImEuvFFA50loa6p471Ftu/fwnnH8MV8F06Rgm2pseaggBKhRvhv5kqtv5BrBHR4nypOST2FKACoaTKzTiB+ewSQrJT9MdfYIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517082; c=relaxed/simple;
	bh=qBYjcouQW6HReKbjdwqHeD5kVbmPx9ci9r+cFmpKKBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R273GZYlJRFlo/xEio6qiKBMWTuLQ5g7SKLs46Aas0Z3cYPG6hRIkdDCt0EE3Ztd4eqr72vJe/yTlqwRaV7PsK31zp+HryvRRP+3NrfQGt5KHHlbBJcn2JaCB+29fC91c0W/peFFXIbImvcThRaChFpK4pHjflYv68gsng7FJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K6GZ63aE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54954fa61c9so3943404e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517079; x=1744121879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=K6GZ63aEYvuM2hcvSiuAQ2AlPgLWrzTA1dP4XCIAitms7cD3EHXQr2kkJ9ezN4EhRR
         eyozYE7R//1LokcqcNSg+XzJXsK+BXMMVBttFKulx74sAwYqxsiNKRIOXOazxKVqCKq9
         gfJqiRouGkGCxVG1heMqmKvleo85Qt9xa4uGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517079; x=1744121879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=T31yWaP2J5KUDbGb/EADua+/Rkn25jLGVevYzCzwTx21Y1inmUcXDvohk8bAp95bwC
         98rAX6lDA/LM3MX3tn0eeiNCjtujshz29OdWM4uloopDsD8wA7Y3FAAbcFS/rWYxLPU1
         oVDU8Wxd6tNZB9uS77NBRhXyYwZ4wlpKHLvsL/37HokdN6uMXs4xslqTbkcDYDTLgWeO
         YGvblW1kyfel+EY7Fe5iv2PxJ2FhIza7+dHEvpyYbd0jHRwXKpp3e0xuEZkyOH4GmEMt
         m7jde5caemcr0n87SN20Q2aL+RVVgR8QJL1prbuLUCWQ6lHF+E+PZchAiJ23Zvb8PHYj
         K2JQ==
X-Gm-Message-State: AOJu0YyxPOUKPWDf2oO0eJ0UPkHsIa2Bx/Rpf37T7S5VNwhthFBusR7J
	mtEuSOLLprkVi6O319gy3JoTcRv10m8tY3JzYDgSubMJ1pUYhweVmEX90iBulLQY/rYZwap4jCY
	=
X-Gm-Gg: ASbGncs/By1UQTx95m5e3+Q+fjWV5tXmSd9XFY31MLT3LoyQMq3Yp81NUuek3oAntCA
	R7/amc6mH3MPweKE84NvyqeoYIxQATw4oq5G/OW3uRLujMBGzDPZ4xyDX0ifLv034wbh7zLPF9Z
	uswvXsMTZjEDF3fjayQE/sR7McJ3NAb+AYFGYNqm99HD1xLZKENvoF9ZSBnN2Qtzjx/qxEq7z4R
	nR02i9KVqeU9y2eFzFy1wCfmKwRXZpVWiyuqpdukIaFWl9KnJIWOWHY5N1CtKaia1r/RlKZ2FoL
	5c8Cj8WB2ZirIP4flYzN3jP+vLE9wsSjr/3EWOOcKLyjJbzlNcIobHMpb20yoqf9HR5u+mqQ0vi
	yFVEOj75KImAZD8HZr40SkKOm
X-Google-Smtp-Source: AGHT+IHN6U3rH8+fca2aINvuxvaQMLkM1cf4WYnPgGffYBfOrlVLilx3ccY/7R2tGC7KC/dIyogKJA==
X-Received: by 2002:a05:6512:108d:b0:545:2b68:936e with SMTP id 2adb3069b0e04-54b10eca297mr3363397e87.25.1743517078964;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:55 +0000
Subject: [PATCH v2 2/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-2-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

Fix gcc8 warning:

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Resizing the 'buf' and 'cmd' arrays fixed the warning.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..41d019b01ec09d1d3e72c89155042888b7948463 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct extron_port *port = cec_get_drvdata(adap);
-	char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-	char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+	char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
+	char cmd[sizeof(buf) + 14];
 	unsigned int i;
 
 	if (port->disconnected)

-- 
2.49.0.472.ge94155a9ec-goog


