Return-Path: <linux-media+bounces-12037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E18D0F2A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6D8282664
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCC616C86B;
	Mon, 27 May 2024 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ELktiF5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78B16C682
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844151; cv=none; b=TbmxLQD+1Lmm4aq4xrpsOfsIjbVeu4GHZAzLNF65vSrluucNAJNTLVevqajiAYl+59AjaDP0A2juT4nhUnLPL992sG5K4PKAvvomSjjoutUyGuwiB7DFJh0gV7ZAOtk7ba5ePUS1RAWJheC/5f0urcXjJoNzSCOhvLxQzTdtg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844151; c=relaxed/simple;
	bh=jr5Nsb7XakeGaEZUFmbzxct7Ebv9EpVBYLQkxsmhvjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VaVpCHRBijG4kVqNEb/xf+dHBSOE/ruj0sjTIKl8MqtJS4iS6sTBCV1R9/gvp9Yop6tiFrHW01er2hHi8ab1Rivx7HPjaGuLmJHR5PH6BDkNX+LAOkH3YPYwQkFWRxPQpU4qP0pe1pB74KnQ4sHmxuS4GrsfErmXqAvK9KWJjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ELktiF5J; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c9b94951d5so90137b6e.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844149; x=1717448949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8AF3gTAgrZfiyrwKiI8Z/hJLEimNwmB5PPC7y7Y27M=;
        b=ELktiF5Jg2iojDgIVz6QZf44vieZv6wDBCj1Kv9M1bA4j0Cv0uidZ2SaaAJqDO0mtL
         MTbUni4NRR3CNEOolVeKWhKsBGEWtRWzbK/mBnXnsgrnYIq21YSCRaO8VQ9NTFN1bCZt
         b9wWVX/aelDL37r0tqIzVUUdVuxlWGKB4ke2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844149; x=1717448949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8AF3gTAgrZfiyrwKiI8Z/hJLEimNwmB5PPC7y7Y27M=;
        b=q9pP3KNWUO2p1VGqv0t3ZJmdZ6XALY4kCWRiggxfmGXumUWiv2rDO1WWEgnZODOAEV
         er+Bdc0caIOI0jtTQ56hHJn0U8CihDjW8MQYiIu3D3OT44LLhSI8uuvREL82cxtZEHIk
         FHBgBbqpV9WnFR5WExWHZtAg/Tr6J7/hD86bW+lbWuo/LcwHN03FutexA82wBTVaNVYH
         Y/0ycsPAGdoGsR2nJMz0qlpAu3rJPKCIwSmIGXSECE4kWTJgc3AYQ5hwO8Uuk0kExGZt
         /OvDCOC1H0M4fnk+6ZtO+TEuZI0QEuWmEYfciuKzqIbtmtLEj8Uh//UnZdYJtfQL+CYh
         zXEg==
X-Gm-Message-State: AOJu0YwhY7QbRp5j5WS6NsXgjarlcsPg0ei/8tpSRAZtvTfQMmj9oZOr
	usVf6a4UIRnUYM3iG/qoOt1V618gmf0Zv08xVyLJFEfWTIlrcK9cFPxATMb/Sw==
X-Google-Smtp-Source: AGHT+IEeQdpu/L/LUu/zi1optJjNBsHcnP8vBr9A9vq3MCBulPPEkbqSZPPYk7ouE579lx7Q7UyqIg==
X-Received: by 2002:a05:6808:384f:b0:3c8:4214:fe65 with SMTP id 5614622812f47-3d1a6019bf0mr15173614b6e.7.1716844149278;
        Mon, 27 May 2024 14:09:09 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:04 +0000
Subject: [PATCH v3 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-14-cda09c535816@chromium.org>
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

The single element array data[1] is never used. Replace it whit a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index f5708fdfb197..8768ee052adc 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


