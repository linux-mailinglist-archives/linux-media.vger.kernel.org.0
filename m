Return-Path: <linux-media+bounces-12033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B14998D0F1E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 661631F21F7F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776CE16B734;
	Mon, 27 May 2024 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FuPPnW1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601D16A380
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844147; cv=none; b=tEcYXWkuVmKvDsWoQBVCOdElhbeQGdj8Jlxbu5H5/qOJ+qOjjcGYGpNmJMqxwCbiXkPTwFsNsZcMh+XoOQsSovC9M1hgYUtkc/1AXRj/eCI5um0R1AR7yLVLA65+PemAUlG0PFO7YdCfCwSPAJjUSiuPfFP9MJb9hLw15CKfoC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844147; c=relaxed/simple;
	bh=GfWDLk1ryOZK/reOhUzf6575mRAlpuhUtQvw/mzD/JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ur+i/W0i/Qj1fODOUVgRO8zR8h+5mj5kngoWhn6TTBUWYS00JwKHLxpWu9uJ0zQXu9Vam00NACKwToaCSH9xyuvPU+mKk8N/5uR4xcuXOxVbhWONK8tfrZXRRI8mlN/D1J5Jl/q88XoW2SVCEFFPVDcMvSf//ZPV7RU5xEfta6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FuPPnW1q; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ab9d01cbc4so702496d6.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844145; x=1717448945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMFMYDIwbtVXl28Ek+P0OgpFhtX85UfGfaQmbV83XSE=;
        b=FuPPnW1q3CpFaLTKWY+eYBc3McMHDz0a07FfsK5d9oIcKbl3c0U31kb4zbRYRatuqz
         MSYJGA0QcpI44QO74cwVx/WEEjYWAFVuEQ5sA3QGa51wW4uFlfauWBAcbI+bK5Qb1UNl
         tZ12Knt+JdknPe6txx0hBpPwfsQgmWvoZe4Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844145; x=1717448945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMFMYDIwbtVXl28Ek+P0OgpFhtX85UfGfaQmbV83XSE=;
        b=WO1EyH5VJxKip6vbkh/BK4K+3aC56ltT9xlEJpfWIs0fQtV2KweO+NVQq4Fsgi1OfJ
         tbQBZ4+2AMlx1hmmF9odaAjXrBjydbQB88o+V0IZ8e4ks1UjxKaE9FqMeFIqsnTU2cnC
         8lO9mylPp7JsLA2wo1yG4rDwfORkaUrM/Aby8TsX1tOYvgqGKC6DSjLKpMmt+0Me3gTo
         RDSJZbpDXRkZwo3XtsQ4gMp8Q0hATSeASe6d1ogSx6Qe4wW7SgMH4jq/GF2zX333Ns4E
         M4cPTX/QPl2pdokLcs5SB389FPJV2pHAaaW6iK95dLMYcJSw8DqKXrJvzWuwD23BsLCJ
         TTSg==
X-Gm-Message-State: AOJu0Yy+5MEKfRurI0yGPVbfkrGRL6VelwEN1o5GUVBGVUvUqHAs7LBU
	Gc5wQUuhg+Vf2L6Rol/Joe2DKRAhlUlGhUsaEmrSvNGCJjANckVmJ3Qicj1tEg==
X-Google-Smtp-Source: AGHT+IHr7Fi3dcDDpjR1lbECW4wDGr2Fb676K/vWSJzr1ujDmAptpzsDNg4YXuiHGhx/L4ZyFxLR+w==
X-Received: by 2002:a05:6214:3b89:b0:6ad:716e:e13d with SMTP id 6a1803df08f44-6ad716ee163mr71569556d6.60.1716844145035;
        Mon, 27 May 2024 14:09:05 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:00 +0000
Subject: [PATCH v3 10/18] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-10-cda09c535816@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 41f765eac4d9..6dff949c4402 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -201,7 +201,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


