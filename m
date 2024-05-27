Return-Path: <linux-media+bounces-12028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BF8D0F0E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D5B28166B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC14D16937E;
	Mon, 27 May 2024 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mBdV5Q0O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C3155C88
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844142; cv=none; b=KoEJK+Mz1wJ4p0qZVJd295MonY+1VuyT8TviuEZqciGjOKZVTR0YtPMI7xwnkzOsVOmqJoK5Zlj/kNDWiwlixJIPM1p4mA+m3nxG/oV+PZBOZvZgJISgH+S+HVLk53FicEo7e4p6Xwokdm8Y58/JBeLZcsvyip/LFE1pL2bDih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844142; c=relaxed/simple;
	bh=NkAGUYk+AlN//KOIaRCz0WPanqcOARjklyEqM7RBKzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIP0sC5F3hnt3ctoQOUO8B+GZenEGfNGxS5+pvl/CBhkZ/IMepFNJeYmsVx8dXJGiYNo6vj9ThieS91iQHdd2V+8jAIgeiMmMTOrHi7x2Vk5kaRs1k7IT4fGWk8oh/Y9yYEHcke1q+VcK7qYqdYTnZfm/fGFcsLH1kbddEKgSO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mBdV5Q0O; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d1c1f4bbf5so117092b6e.0
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844140; x=1717448940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBvUNOy5oqoGffRnBGlOX8VjvQupq+TiHn+tNWkPE3c=;
        b=mBdV5Q0OpthKSjt4bNervpeNhLMkxzZCj7zF5mtiUDdGm8zVY+Jtxy+9iri/GvUXk+
         08XEHGexV47XhMhwh8U5bozIHvmMIQEau4T7xUyYJqT1H/iepkqc3XkZCVRWwyNVlOEC
         RCOo1pmkj6zpF9oUgeO3H5JYuoEl9LM+HWvqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844140; x=1717448940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBvUNOy5oqoGffRnBGlOX8VjvQupq+TiHn+tNWkPE3c=;
        b=ciys3P65VGWRfi/zJ6paol/G3L1jwjgBazkygQD822rwVPEodjOYMCWa//HTpOKmwG
         9+T/o9arzFCn7FIOV+2qMtDCcnpwH+6NKIf66fMmaqbcQh/x7Ua1TSK3x0qZHNscEBQe
         P09Tmgy6G0KCFYL+jy/srBGHaAMqZtSEZLwrCpBoHdPw8+JhFSzu5vBxHo9f8qNc4vlE
         V1UOGYGBsQ1VXtsNjxJmrRoWnIcOU8B8XEhN3/zdJiGN334JjDA1SGp2A1RbsGtJfPmc
         VIdZrYYQE7miV71BHkPp5Kipd9UZILYH7WxEbrElr62mmXudivQRkP8mfz6tZocBbHAj
         TaWw==
X-Gm-Message-State: AOJu0YxcPL/vxxVN+35T5XvSDDHTghzc5aOmwsNBt+K7VAAbOC5XRW46
	ZZTIIcvOGIzTkdijm1kv3F8uydsvQxL/5h8Vne+VJMmD1xJR5nlZIUk9adxsZw==
X-Google-Smtp-Source: AGHT+IE7nm8EGv+xMLxhkV58cp2fsWk6T4ZsQ57GlnbqEOEZkcL5w4Fub0qLyq/Mtx0z8nTh8LZHcQ==
X-Received: by 2002:aca:1003:0:b0:3c9:924c:8310 with SMTP id 5614622812f47-3d1a1e83258mr10375382b6e.0.1716844139979;
        Mon, 27 May 2024 14:08:59 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:08:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:55 +0000
Subject: [PATCH v3 05/18] media: pci: cx18: Use flex arrays for struct
 cx18_scb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-5-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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

Replace the old-style single element array with a flexible array.
This structure does not seem to be allocated in the code, so there is no
need to change anything else.

The following cocci warning is fixed:
drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-scb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-scb.h b/drivers/media/pci/cx18/cx18-scb.h
index f7105421dd25..841edc0712ab 100644
--- a/drivers/media/pci/cx18/cx18-scb.h
+++ b/drivers/media/pci/cx18/cx18-scb.h
@@ -258,7 +258,7 @@ struct cx18_scb {
 	struct cx18_mailbox  ppu2epu_mb;
 
 	struct cx18_mdl_ack  cpu_mdl_ack[CX18_MAX_STREAMS][CX18_MAX_MDL_ACKS];
-	struct cx18_mdl_ent  cpu_mdl[1];
+	struct cx18_mdl_ent  cpu_mdl[];
 };
 
 void cx18_init_scb(struct cx18 *cx);

-- 
2.45.1.288.g0e0cd299f1-goog


