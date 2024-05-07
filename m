Return-Path: <linux-media+bounces-11070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A038BE8EA
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3D82824C1
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E4516C686;
	Tue,  7 May 2024 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lxo11x3g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F916D4D2
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099238; cv=none; b=kbUoaTNQNvgMv3qUWpdJjm/z1eTgsfw+iVMTSEdLSRh+8R5THl2bBs6sVhrhmVwZjknRQrZa1+93AKJ8+3Mg7NXu5hCVmWtaR657g0lZAR7CJQbIFJ5x51L8uypIu+dk54bsQt0gPspJxvyJOo83Thai50U3PWbpYj6Gt/bXtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099238; c=relaxed/simple;
	bh=TBNCx1gGrBDy9NxmrHPxnzPFvK9qlBkf27idsj7B9Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWVu5fTU/OI/yaT0aO+dwP/ENQdSqN1COyBi4Cw1Khw7ZoEheMm/16v6sqrviQrnfpKM/Oj5+eklhZ3jUCAbHxN8XyuTKl07nrzHSm9sXlrywqGldelf7Roun2b4ySRO2c2GPo34rt+NI0YkehMguB1bLzHpH2P3qNxHHBwLN74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lxo11x3g; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c96be1ef20so1349572b6e.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099235; x=1715704035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckyXB1RMjwvOvAxa8fnxheCGm68/C6yK7+APpHNPb5E=;
        b=lxo11x3ghsc929qK2ouDhbNp1XXSubGQ+xHrF3xRV61eMhBUSy3MO6hDwDntJQOWMa
         vdp6uuLnm2lQOAiI4C4IQouaPHpNPj9Hth+LlKxEZUeUHUCj3t7C2L3C+t7FU+GiiPH1
         cGBeGjqXE+dC33Km/zbjEksoo3JwB7aT5AhvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099235; x=1715704035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckyXB1RMjwvOvAxa8fnxheCGm68/C6yK7+APpHNPb5E=;
        b=ox/iOFcUYEDpdlthuvm15j1jkvLcU/O2CrxWWQJZPBzxiWrNqECVnfNl1UordwpTiq
         3ArwAIKCK1N2qr9agv4UNQcKRk1Eirti+7ZrA1pCeYKyPvTRAi4i7cCmyGxVTSEvIWNa
         opuSf03J5NzR38Rawdv8QCh304gmfmz3r9nDIl186tHFdYcmdFB9chyMwRiDKCYkrH3T
         L4EWPyFLKnjuOEInhpQBf1qWnAtOl/B3P+0lBB90IeN3ozJ493YkxiEEhUsh5oPPw+zB
         YQ8RTBssUgLRxaO6LriC9unur7OVdokL+A1mZKNypnV1CK42PY/tzASLKHwUngpEtee/
         ZGcg==
X-Gm-Message-State: AOJu0YzMPdVZxc/Q8vB+LTCFKRS/K7CWzlCt9fl6GZbOEtNTEKedsgWs
	9nZXQ/Ah5cgUoTBiYuxFZvSNQNZTnvvcExZQOM7y90vPlb7Ay72Ej3epZRTa5Q==
X-Google-Smtp-Source: AGHT+IHK8MR0ETZCa+Cso9ZcR2kzwzSwWzWxtW7LPWutI3GEHlRvYRnkrjbzVhChzSF546k9ojGUqQ==
X-Received: by 2002:a05:6808:2ca:b0:3c7:3d8f:7ef1 with SMTP id 5614622812f47-3c9852be83bmr64772b6e.17.1715099234965;
        Tue, 07 May 2024 09:27:14 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:11 +0000
Subject: [PATCH v2 06/18] media: siano: Refactor struct sms_msg_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-6-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

Replace a single element array with a single element field.

The endianness conversion code seems to support multiple elements. To
avoid changing behavior a pointer to the single element has been used.

This is safer than moving to a flex array, because in that case the
structure size changes.

This fixes the following cocci warning:
drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.c  | 10 +++++-----
 drivers/media/common/siano/smscoreapi.h  |  2 +-
 drivers/media/common/siano/smsdvb-main.c |  4 ++--
 drivers/media/common/siano/smsendian.c   |  8 +++++---
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 7ebcb10126c9..b6f1eb5dbbdf 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -839,7 +839,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
 		mtu_msg.x_msg_header.msg_flags = 0;
 		mtu_msg.x_msg_header.msg_type = MSG_SMS_SET_MAX_TX_MSG_LEN_REQ;
 		mtu_msg.x_msg_header.msg_length = sizeof(mtu_msg);
-		mtu_msg.msg_data[0] = board->mtu;
+		mtu_msg.msg_data = board->mtu;
 
 		coredev->sendrequest_handler(coredev->context, &mtu_msg,
 					     sizeof(mtu_msg));
@@ -852,7 +852,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
 		SMS_INIT_MSG(&crys_msg.x_msg_header,
 				MSG_SMS_NEW_CRYSTAL_REQ,
 				sizeof(crys_msg));
-		crys_msg.msg_data[0] = board->crystal;
+		crys_msg.msg_data = board->crystal;
 
 		coredev->sendrequest_handler(coredev->context, &crys_msg,
 					     sizeof(crys_msg));
@@ -1306,7 +1306,7 @@ static int smscore_init_device(struct smscore_device_t *coredev, int mode)
 	msg = (struct sms_msg_data *)SMS_ALIGN_ADDRESS(buffer);
 	SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
 			sizeof(struct sms_msg_data));
-	msg->msg_data[0] = mode;
+	msg->msg_data = mode;
 
 	rc = smscore_sendrequest_and_wait(coredev, msg,
 			msg->x_msg_header. msg_length,
@@ -1394,7 +1394,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
 
 			SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
 				     sizeof(struct sms_msg_data));
-			msg->msg_data[0] = mode;
+			msg->msg_data = mode;
 
 			rc = smscore_sendrequest_and_wait(
 				coredev, msg, msg->x_msg_header.msg_length,
@@ -1554,7 +1554,7 @@ void smscore_onresponse(struct smscore_device_t *coredev,
 			struct sms_msg_data *validity = (struct sms_msg_data *) phdr;
 
 			pr_debug("MSG_SMS_DATA_VALIDITY_RES, checksum = 0x%x\n",
-				validity->msg_data[0]);
+				validity->msg_data);
 			complete(&coredev->data_validity_done);
 			break;
 		}
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index f8789ee0d554..46dc74ac9318 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -616,7 +616,7 @@ struct sms_msg_hdr {
 
 struct sms_msg_data {
 	struct sms_msg_hdr x_msg_header;
-	u32 msg_data[1];
+	u32 msg_data;
 };
 
 struct sms_msg_data2 {
diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index d893a0e4672b..44d8fe8b220e 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -689,7 +689,7 @@ static int smsdvb_start_feed(struct dvb_demux_feed *feed)
 	pid_msg.x_msg_header.msg_flags = 0;
 	pid_msg.x_msg_header.msg_type  = MSG_SMS_ADD_PID_FILTER_REQ;
 	pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
-	pid_msg.msg_data[0] = feed->pid;
+	pid_msg.msg_data = feed->pid;
 
 	return smsclient_sendrequest(client->smsclient,
 				     &pid_msg, sizeof(pid_msg));
@@ -711,7 +711,7 @@ static int smsdvb_stop_feed(struct dvb_demux_feed *feed)
 	pid_msg.x_msg_header.msg_flags = 0;
 	pid_msg.x_msg_header.msg_type  = MSG_SMS_REMOVE_PID_FILTER_REQ;
 	pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
-	pid_msg.msg_data[0] = feed->pid;
+	pid_msg.msg_data = feed->pid;
 
 	return smsclient_sendrequest(client->smsclient,
 				     &pid_msg, sizeof(pid_msg));
diff --git a/drivers/media/common/siano/smsendian.c b/drivers/media/common/siano/smsendian.c
index a3573814919b..b957970c7d97 100644
--- a/drivers/media/common/siano/smsendian.c
+++ b/drivers/media/common/siano/smsendian.c
@@ -20,11 +20,12 @@ void smsendian_handle_tx_message(void *buffer)
 	struct sms_msg_data *msg = buffer;
 	int i;
 	int msg_words;
+	u32 *msg_data = &msg->msg_data;
 
 	switch (msg->x_msg_header.msg_type) {
 	case MSG_SMS_DATA_DOWNLOAD_REQ:
 	{
-		msg->msg_data[0] = le32_to_cpu((__force __le32)(msg->msg_data[0]));
+		msg->msg_data = le32_to_cpu((__force __le32)(msg->msg_data));
 		break;
 	}
 
@@ -33,7 +34,7 @@ void smsendian_handle_tx_message(void *buffer)
 				sizeof(struct sms_msg_hdr))/4;
 
 		for (i = 0; i < msg_words; i++)
-			msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
+			msg_data[i] = le32_to_cpu((__force __le32)msg_data[i]);
 
 		break;
 	}
@@ -66,11 +67,12 @@ void smsendian_handle_rx_message(void *buffer)
 
 	default:
 	{
+		u32 *msg_data = &msg->msg_data;
 		msg_words = (msg->x_msg_header.msg_length -
 				sizeof(struct sms_msg_hdr))/4;
 
 		for (i = 0; i < msg_words; i++)
-			msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
+			msg_data[i] = le32_to_cpu((__force __le32)msg_data[i]);
 
 		break;
 	}

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


