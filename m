Return-Path: <linux-media+bounces-20326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8B9B0A69
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B83CB218C8
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5A71FB89E;
	Fri, 25 Oct 2024 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TUguwDnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627215D5A1
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875424; cv=none; b=HLLg7kBkJ7bVv2bbU800spKaUReMW9uzd8J0SJf0MCLG1xHquBrvmxYdw6ypvvwKk5+hCGLxiS6GXeejwJPL9kOgPcEQiLbMVWqMm5iabiVcyfQLQJIgxACSToFPMISuV6+0WvRw16sITwAaz8yXjUFWoT/UppZD1t/qal3phUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875424; c=relaxed/simple;
	bh=sbGml+z/Q0kys5p+09/O4MpYM++Uqtf9D6AEWOY1Zuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9pytZxW6pFYhN++lF2nNwz45UY3vb0q4cgpdX/mOdp2pLrPNpnyKctOTQ5y3v8uthIKwOoPxJf+8tyrd+lXrJnS6w0N2bboEENlrBvPYI2UDa7/ycs50KTIA06B/X1vFWHtWDS6SimxFe8H4T2AZaActUoZDyhxvWFSL3+Sk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TUguwDnN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71ec12160f6so1611614b3a.3
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729875422; x=1730480222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJh1t6CMRH+lJdk90F6SduJwEmAVjV96hw/ehc4uVwI=;
        b=TUguwDnNZ0L8I7YGK8Fc5tq/cwRC8tcd9cMYsaHK8bVgzxW2rIpAGf/+jOFwIIXdgh
         tWllCwzjBp/rYl/648Sdig++5mIk3++8qUpmJMrV0C8dHEW2I5LkTl9I19n8LJd15HBY
         asaJs3B4AlICx7jZB67h49atnZNB/tTRMKtg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875422; x=1730480222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJh1t6CMRH+lJdk90F6SduJwEmAVjV96hw/ehc4uVwI=;
        b=aVaonRVwTZKJmqWSJCIi/8dhU32MYS12LJYnjxbSC/if6pv0N0YJIk2Rnl9EkLxvaZ
         w0613Re7D10IDktBNnyBOs6RdA5jfev7rCPYluvcBP9/M9XlBKFMLlZMyDfQLUrp+10G
         e7IqLgCSRWO2cT6Bzmc49iPzPbJkZbAeTK1HAF365zoMA2Un8XiHJWS0zj1xyHCw1D6L
         puFVv7NjxxFlECCPlO75h6ZXu1XpW8H0JNhfZZlaHfzCV/7VExlqfJpFtJiMUkszZ/ON
         moxTCrixJftiXhxNBTQlUxGzrLL2WmQAbO6Y2D0dy5BgRI+GRTjm7CHMf4O0msUHLRt1
         nHZw==
X-Forwarded-Encrypted: i=1; AJvYcCUUF12BYqyKjNDIdbJs2IVTTs0+v2YWCC+qkStu/mZ0iIvCaN/6vMIpNCD3O0RhhmML4cgEuVDr0jfxiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzySeQCBBunv8663XPFacZ5SDipCAg4yRNjAsiYEPtN7tBfOwes
	4WiI+Qc27dQqLdB+ilJWI3YKLz+P+5YiGKbN72arRFzFnYfuSaO0iDR2I7qyGcgd0BvYwF4L0Og
	=
X-Google-Smtp-Source: AGHT+IFj27XudLwgQbsxrossUBSOsWzQeZwsqtBvvGQH5mzT4jL+yJTjB5u1zsM4PaeZpNE/M96B5g==
X-Received: by 2002:a05:6a00:228a:b0:71e:4196:ddb2 with SMTP id d2e1a72fcca58-72062f1464cmr286988b3a.9.1729875422080;
        Fri, 25 Oct 2024 09:57:02 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791db5fsm1318970b3a.11.2024.10.25.09.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:57:01 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 0/3] media: venus: close() fixes
Date: Sat, 26 Oct 2024 01:56:40 +0900
Message-ID: <20241025165656.778282-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of fixes for venus driver close() handling
(both enc and dec).

v5->v6:
-- added kfree() backtrace to 0002

Sergey Senozhatsky (3):
  media: venus: fix enc/dec destruction order
  media: venus: sync with threaded IRQ during inst destruction
  media: venus: factor out inst destruction routine

 drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 13 ++--------
 drivers/media/platform/qcom/venus/vdec.h      |  1 -
 .../media/platform/qcom/venus/vdec_ctrls.c    |  5 ----
 drivers/media/platform/qcom/venus/venc.c      | 14 ++---------
 drivers/media/platform/qcom/venus/venc.h      |  1 -
 .../media/platform/qcom/venus/venc_ctrls.c    |  5 ----
 8 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


