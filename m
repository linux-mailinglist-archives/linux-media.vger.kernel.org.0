Return-Path: <linux-media+bounces-13557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C785490D34E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3011C2466A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC12B16F82B;
	Tue, 18 Jun 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vhcezod9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976516D9C2
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717881; cv=none; b=CRiyHtZ4ZeznKiVEJG5bY9EqMiDvrbl2glcLJGMjf947Fn+4qNCqZi8vVT8lElG/RF+/qbnFtx407jlX89csz8ZPSKHypCk5uUATedhbKNPJoeAzsWkc8PCtBYF/lgr1tDiojsu6IvHtsy+72tuI/eUYaq4nwr/rhTm52UsJoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717881; c=relaxed/simple;
	bh=LrbREgccmp+ApJP/aOqmOoRz76Y1lEsELda3PHy44H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUfZZzN2biUiJvYe77X+u9/uTiJl/sUIsKSpk7o/mM6d1ciIoZew5RcWlmn8VuYYnN1ViaumibGRxUoibA4in4BX0NzfvREoL+RQwcjxFuTmFAGOO9Ev9GdS9FEdd2yKiFZ+XhLqezetcQmKECmYBccca8d2Bws8nx83whRsq/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vhcezod9; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-797e2834c4eso451637085a.0
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717878; x=1719322678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg6dOdrePmQkedMibhUOvsYt1qJByOG1v6bUXQRrIc0=;
        b=Vhcezod9bTjHhu5dqi2/RMzSrpi/ALRIrD13HlMTNDime5k71fOYHpXqTA0EAzSTOF
         ibk6ZrbAFsxebknblBSyrY8gFdd8P+sBG7eAkQEU1IySvLTS8osLtrxzors5DvQwtf3o
         3XUgD72NIfh8x5K1dQ4L+Br3iGldTXf0z4HmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717878; x=1719322678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg6dOdrePmQkedMibhUOvsYt1qJByOG1v6bUXQRrIc0=;
        b=hC1wFEl8SLeficTfg9qUHfULNZdqHkc4JpWPQEOaPPaejYflHb7ENXHcTkC8vieEA9
         E0/fXHLV2jBgFk3QyJ/66hQQ15S921LEd0RJzulzxqhbRKbOFc6ODCI+bQgJwTy9bsy5
         0adOrWKTBNmqAFj3WWdzgoh10+5VRi1TVqDDP4/ErVXRhUTAsRv55ZSHQXyR9uj4fR8F
         8lAFTqDEMAD9Y1A6QBK8ItlAbscZOBIgxACdsYWXeAPOVAnLqdPh3R2v1AJng4Ay8ckN
         DoBIApvPVgA7AGSusrMr6znOl522NXPHVC/jw1OFUAxVf09BF1gDZpQ6vjKkNE+K5vgS
         e7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVDukccalchRLGW2gcGY6bD1I7VDfl2xR4rB1uN+Qpl6hFzq68Es5MoM5dIQc9F4KY3OxWheVDkapmG+XjdT21dNvh/IF4gtqWISMM=
X-Gm-Message-State: AOJu0YwUO7d+RCtJRPd8RM61JopoxAAdMyXJk/MCsX/HWEetvYBCDakx
	s1UEkPktyctRuGlchBaiuQRzo77skoVJVMOprttZti++pGDygBwfrBXdzubHCRofRZ9WIlQYIpv
	B9KM0
X-Google-Smtp-Source: AGHT+IGAgj3YnsFss9qEjXgsxLbOwfO0PDliSTE4TcCbevE5n9KjJc7F+p+/GujvK9mbnLR+t5wqXQ==
X-Received: by 2002:a05:620a:4308:b0:798:5598:bdff with SMTP id af79cd13be357-79ba75e14e3mr450019785a.0.1718717878028;
        Tue, 18 Jun 2024 06:37:58 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:51 +0000
Subject: [PATCH v5 08/10] media: venus: Refactor hfi_sys_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-8-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Replace a single length element array with an element.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 75f4a3d3e748..0a4de8ca1df5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -156,7 +156,7 @@ void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
 	pkt->hdr.size = sizeof(*pkt);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
 	pkt->num_properties = 1;
-	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
+	pkt->data = HFI_PROPERTY_SYS_IMAGE_VERSION;
 }
 
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 2c56ae303989..f91bc9087643 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -74,7 +74,7 @@ struct hfi_sys_set_property_pkt {
 struct hfi_sys_get_property_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_sys_ping_pkt {

-- 
2.45.2.627.g7a2c4fd464-goog


