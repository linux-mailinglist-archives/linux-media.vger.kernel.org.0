Return-Path: <linux-media+bounces-12039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9698D0F31
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB89A1C20B41
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DB116D4E1;
	Mon, 27 May 2024 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Et8YXUpY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACDC16C843
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844154; cv=none; b=M+y+8GPcuMb0zMKnATQxh1AomFVZNGY5s8N6FKw67Ike1sK0dh9azkoNKOOPAb1mOkbrrcTU6VTaOpHlvqz3UGvSNkhZdK2N7UkYQlHxPxXeoXjtdKD87+cqirLztzghJzzQRa3cE+KOU2OoBUDlMxHnaNynqCJb/GsSeEGsHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844154; c=relaxed/simple;
	bh=hodq+gCLyqsJ1R1uHGMq0ldSTiTA2zY9HKvfL0U27m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIA3v0qUPWVLr9q3bWor78FICSGzVTUM8KR6Q0hZ6O3Gxq7z435edSZsuLyyeCuzIJhKvXSG3/xCvKUkEMV9ay33cK7sXI7w6j9QHD2eQtSjazQPYNYZcGlHPJ1Pb3W+WNQUEjcVPOvtCXKlUL4YnERzHZC7iu1qUPsQlk2FjeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Et8YXUpY; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f662252c7eso103086a34.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844150; x=1717448950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BUOU53Y/Qs7SwrH1hNBNdnMNU1q19wfN3LEF6XYAR0=;
        b=Et8YXUpYRkC+fJnYcrzpCWm5+JBCN4thulctQtyzT1jOAQiiJdcYjjUVXeZ2pk/CUP
         5q8n04dbSTCtnp+9S8w7qq6SRUGak6xRJoX1DnhyQoPs0CNnC4qI7d0g0rJchXGditpE
         KztVGhqBvXNPOteEN3fYneOR7FrH4O5WcdVas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844150; x=1717448950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BUOU53Y/Qs7SwrH1hNBNdnMNU1q19wfN3LEF6XYAR0=;
        b=iLf2kBEWXK4zgkwYEa7LX/LAdDlVZulpaLpJo4E9uzjv9NOtWYPitktDJ+kf1Z+ccv
         /RdVj0NmDk0x/w2cFO6X4fFZPYkxtGlDmnghpc7q7snvILg43u8mJlCBouNT94QTyY2Y
         ukTbWQwpite8gjHh/eEtaCEBm5ViHL/+EnLoi1t1rTDjPeiLpvO/Z4xIRg/Y0MGMJ1CD
         12faJ/HFIVyAQHCyjWaj9HMMbdolnXR6b2EkdA5UuiKM92BBNYPCqk2tSqZNnoy9YhCJ
         A+oCFLt+9X6azS727JzU7qA8/8OZ7F6xAc7geEDvZvcXddGF8UbzkPFaZlCpfr76nU5T
         dYIA==
X-Gm-Message-State: AOJu0Yxvh1zlU/09h0OXpSZ7f3qwU0w5fbsBw4n3Cn0EMuNEdzgH9aDZ
	Ki9Q4dB8M1/O0G8zbrk1Ab34JARVvHiTOPgy6TIaF6IhRSwB53hBbzetSMkBhw==
X-Google-Smtp-Source: AGHT+IGpU7e2bDXtLKHzBuQGg8VU63q3btltKxhtl1G2R0LWEM8uDkQDnfIvjE/wdw2CIfox8IrWQw==
X-Received: by 2002:a05:6808:3d0:b0:3c9:639b:f821 with SMTP id 5614622812f47-3d1a7b30743mr10023918b6e.49.1716844150503;
        Mon, 27 May 2024 14:09:10 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:05 +0000
Subject: [PATCH v3 15/18] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-15-cda09c535816@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 8768ee052adc..2c56ae303989 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


