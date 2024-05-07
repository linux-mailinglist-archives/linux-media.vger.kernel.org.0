Return-Path: <linux-media+bounces-11077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D88BE8FC
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E6A428B851
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C545016F8E7;
	Tue,  7 May 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ih1Uydkd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54C16F27A
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099244; cv=none; b=NtSA3EsJpLw8o1CZGx+W4Bq6X+/gaX3+4yW2/6bLdIcWqBSAlB40sraIw65U9BZN8rRAYqj8sDmLiyrYfOcTeMWOXUIoEeKCSGRTkXTqywbD0B6DY3KDKHm9bqbq1Cgiy+L6wpS1MHfWadWdwnlWFSq8z05IzA+c3iYuk0KBlpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099244; c=relaxed/simple;
	bh=yspSc0vXW80bDStJJU6njW8ROGAmYm1HyjTlHpef53U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmRZo0oCfQZ8RCSq2XD3hhaXYdWy2G0NDf0xbv/PLRf89bmMIhLX1UcCLGcNLCAV3oMvUiFlyPediO6dwdtRhGhyMThuAnQl+rJrWxF8CAbgJyiBGIRCZ/BLGihCf/GGFjhHbpWqnIGkQ8Os8/kDapY2X7mlSMbFhsEAoEACoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ih1Uydkd; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43ad398f164so14397051cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099241; x=1715704041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=Ih1UydkdSYL7D6Y4C6DxytlIs1qR81AfUGZZba3QfeLyiuXoWX1OriB+ok/TmrGPBD
         uAedXrg3bP3EnX7vIEybdyzlW8IeiUfUX6bE82uhK9Rab+xdcKrxxrb2Czdn41bLZ+gR
         gwlvrUJeUkXf6+lDwp+4UtgqeLc5RmM/aSX78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099241; x=1715704041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=oNGCxGVfh8fqhWE1MVaXNSFoOU3WQK/k4uWmtG4S8NGq2G+7V6MEFCDGcovANN7MEa
         Hx1V7jJxBReNMdfOuNvQsyEUVTNXU6+c8DIW7ecWDA+NlffuGatOrxDuOgGFds91Qsxk
         vrhPbcCH3aj5axQDhEh9jRhBlVh/9OiyQHivyL1PcOhZOjllkaVRL97GlalSyycugaOr
         U0SrszU43gH5zy77cA3PGES4MubQYoxp2D8WyvRFykauIuCEUVa11wi1wQVEF0rVDTq7
         1eOIAOkQpC9Qr2lXj0squimPZxazGzzEVAp/Fx3Ooht9CEhxdReshGVNdPvJtSU85MC2
         EtdA==
X-Gm-Message-State: AOJu0YyfJE2W7R7+JxA22LOJz5oi5LQ2nWxdGKZY86Lc77goa1k3X+70
	lhb8/rAzB7pSAymllfy8AlfHf6TS0TO/UPu+s3+3WBEk2fvVJEPbJ2lIvbp0Ww==
X-Google-Smtp-Source: AGHT+IGy63ktMUcef0pl0O/LB4NVLwAUnrH80knXHLAZJvTEQKiy8Aq4N4cNRIawlD7kkWl28ecX+w==
X-Received: by 2002:a05:622a:1650:b0:43a:f441:b3ac with SMTP id d75a77b69052e-43dbf4e70d5mr2464831cf.32.1715099241340;
        Tue, 07 May 2024 09:27:21 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:19 +0000
Subject: [PATCH v2 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-14-7aea262cf065@chromium.org>
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

The single element array data[1] is never used. Replace it whit a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index e1dd0ea2be1a..15271b3f2b49 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 padding;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


