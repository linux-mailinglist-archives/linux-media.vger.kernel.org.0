Return-Path: <linux-media+bounces-65919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMHWEDRYQmqR5AkAu9opvQ
	(envelope-from <linux-media+bounces-65919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:34:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C426D97C9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="Mc7/j5UN";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65919-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65919-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90ECC302174B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF13FF1C5;
	Mon, 29 Jun 2026 11:30:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE83BB101
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732654; cv=none; b=tnzeaiRzbKHDeMpKElq3NbmstnJkO+K/Wz3wDcRs5Wff7K56rqi3J5AUVOssoD8ROh2C3DSEH1jQiwhnUhCIcstudOkTi0sbUtU2hmgoO/W8Agm2IrVdTN3h5yidaDSTlNPSixu5+zj/Yjr4LTmufNrzZzMF1y+YpraSmUa2DEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732654; c=relaxed/simple;
	bh=YbebCHn0Us0Y7R7dMxOqglnHArY6LjK6GM4T60ivYzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyqSsmPe+JYVHWV9CUkZ5qdR1ZQg6yUn9IbNtBZs5I8XlJvUIlEeVFWf46iyIgGKlNuFYZ6L9mySvswYiFZDN/emqDSvVjnxONmwa++oHoH9aGFyMkqR2u/+6Qp4Cz5DKfqUhn89/K7SeKNBX5HcqLbSuZEbdHZBeUPeNcFcng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mc7/j5UN; arc=none smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39669bcaadfso33935441fa.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732651; x=1783337451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v68a3GvjDt67EscXY2lZ/DlUh5IwMqRFPnauIX/l0kI=;
        b=Mc7/j5UNN9cvHq38q7od6oyG0fe0pUQgESITNzw0OFCxtqujF2NwKozXZ5em0pKYir
         h7S3xBwmEVBJEii2v0/CWP+zjpKEvxE6dpY0Z5+3gk/Rf9N465nYShCVW6JhgxOsutm5
         Xp3+wMSnJVaIX4TO8cIxSzOQHyVAwcMFnLZkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732651; x=1783337451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v68a3GvjDt67EscXY2lZ/DlUh5IwMqRFPnauIX/l0kI=;
        b=d6/8Y7ZOaGbH6k8coAnItC0G70leXS9MJXrF53oN9zGLjrypaAT+C5FEcOYr3I7o+E
         FUzdgdH7HEBw8XG9UWy4mcFOasIn9/l7gKrpOA4/74MHxtzCn1Vu/Dw4VfMmy+PA+fVe
         cxzivAY5fQQxftqfS/a0MbIqkNibZKjrgschiVDnJiAyTcNYFKHhG5+TFnCY817tAF5h
         A6Rch2U0/kpJMlpVIo5SZ2NYq1xQdDWmqZI8LD9uP2EvAL1a7zYIb/DXXxIwHd4JLMkX
         vxBG11HmDwNNulDaegpXg0DfqcqsjlDcVXBfN1g5YoOZpowmv8xGf19Mgx/I36q4ClOF
         pptw==
X-Gm-Message-State: AOJu0YxLSB9L6nUQQjQocHxMhnVmIyX8OhqFwKGYSb6Irx6SNLwFDnP4
	jKJMsfvyedVV8fzLaSMH8haZK8K698xcK2Z3adZKzFxDkD+hrRNa41QjIhiDKKZUtw==
X-Gm-Gg: AfdE7ck3m4hyE4EA+WKDI9RpAtcpe8UD4lqhL95q3HtlvokfQKV/7whddtYf8cK98D3
	K2MCQVkbuJhuUoO1RVqC2YI3FhH5yjqXepPC3nqgIvDwJrhiLJccYNcIkCE5Pc85Y2GHlX898Ac
	0n7wrGoBKEk/HSt39Bdo9CJaaUipQWlHtA8aB1QyNPDWfQ8g3Bd6GxqMdTHrXutlmRiluwhKdqu
	ua9OHphNC1hh2k5/pWzaUrAseq/Yo8lwvUa24RIWOeszHSvMjW5Eo1F0Pryh4nhZ/3MCyISzUjV
	16z5H9fXM3Z5Co9heRiV3V+z8+W42jkosmaG3eG2BtFTdub1a8r3G0g8DyaEmttsxOC4zSwJ9xZ
	e3bnk+UzG0Iy5/ibTlAXyy53+gmgf6rKFFxK9qizVPqLajHG4e66rJ3DQo7T7yZ+s6UFQ3vtj59
	TX+iJYuCLKxUnwF6jJYyXz/yrlgpzaFAEyksERxJ0WnyAGQ8Sr8V0rMeT9/6M6PLV6dM/D
X-Received: by 2002:a05:6512:2523:b0:5aa:690c:6636 with SMTP id 2adb3069b0e04-5aea1f593d7mr3418663e87.26.1782732651474;
        Mon, 29 Jun 2026 04:30:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:43 +0000
Subject: [PATCH 2/9] media: iris: Replace ternary conditionals with max()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-2-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65919-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8C426D97C9

The max() macro is simpler to read than the current construction, it
also makes cocci happier, which currently throws these warnings:

./platform/qcom/iris/iris_vpu_buffer.c:703:13-15: WARNING opportunity for max()
./platform/qcom/iris/iris_vpu_buffer.c:583:23-25: WARNING opportunity for max()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index fb6f1016415e..faebb5472866 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -580,7 +580,7 @@ static u32 hfi_buffer_line_av1d(u32 frame_width, u32 frame_height,
 		ALIGN(size_av1d_qp(frame_width, frame_height), DMA_ALIGNMENT);
 	opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
 	opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
-	opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
+	opbwrbufsize = max(opbwr8, opbwr10);
 	size = ALIGN((size + opbwrbufsize), DMA_ALIGNMENT);
 	if (is_opb) {
 		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
@@ -700,7 +700,7 @@ static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
 
 	ibc8 = size_av1d_ibc_nv12_ubwc(frame_width, frame_height);
 	ibc10 = size_av1d_ibc_tp10_ubwc(frame_width, frame_height);
-	size = ibc8 >= ibc10 ? ibc8 : ibc10;
+	size = max(ibc8, ibc10);
 
 	return ALIGN(size, DMA_ALIGNMENT);
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


