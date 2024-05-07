Return-Path: <linux-media+bounces-11008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF18BE3C3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA17D1C20B62
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7415516D306;
	Tue,  7 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bv7ZuYR1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9DF15ECCC
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087916; cv=none; b=eVwmdXJ2gxIJCCK6AoUz35i/InE3wnD06f1d2odCoTlG9zrpeqS+PU8gXmbBS3t6//x8DX7Sz3KGXrnYE543r5xwqaM0QAbMQshndrlGByV21TgxreK7bwlHc2DAdptVKBZ3Zv2k6GcbXX6JnSCUYWcWoz9cObEjLq9j543zkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087916; c=relaxed/simple;
	bh=OkrWWOrUN5GNEWioxP3gYdPUo0/0BfsqCVC0RCoziIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udm79pM/qPxVAxj/0GikG0pII/4r0gpBv4rQiB479noELa+z4xRxwYABY6bAfezrI64T4ar/p/UsxOPppvwXpv/VTMb+dhRmvaaBon9w6IXxxPoiCYf5hfVYVoTOG/RT+WMCxn3bjLkqRLBhU0Ym5x2TxzrgbCi+FvfxKPZWOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bv7ZuYR1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-69b7d2de292so14114596d6.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087914; x=1715692714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=bv7ZuYR1JSua4HN2zGrac6dR80LTnt3qfwi0LYYW10A4oCkGiy/9dj0lr5csx0dB6D
         pvlzvvBoE+0oi9e+NvhdD9hOkpm6ee2zH/O2Z6mYkRvD0/IXdVRgYf/BMt2TPxpheY4M
         pTXKYP+wd8A6lTiRyokt7qJNrZpmL3F7X+B1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087914; x=1715692714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=Y7WVRZ5EdkwxKUjzsq6E5q1YqbNSD2/P5ydAmd4/OnvqsqBeYZDxQA8Hd/CGokMrEu
         qEqHCLcrEhOepO8eX2e5WWQF2wiGMBb/ZVTkfYX/mcR3U4fAib819PeuB1NMxH+57L8E
         iVEjAiqAtgxxDNkOXu5fi1dRJaVl8lVfK3esmKiPb3SCQHwSGWsjDR5Dqz4bTaJZGxAr
         URi7UB1EPMoaXod01OXSAW1tkFwusQm/FuSSHfOwjmGVQfQl42cKEr2i0/eLPYGRxQnE
         VNx6zXR/py6U+CSf2gfCGVkDhyUhAD7KKFbqiwpnBtNnfBpaxH+mQIHnvLUHq4Bkpw/H
         6z3Q==
X-Gm-Message-State: AOJu0YwX0RiE423btdcFcJjJvdmhOcYW9pBfvbAUyq3fd1mqfjWY+YgZ
	kYDc19f1P6/8Jvs3E3y6TTCmLwR5FgC9g8cbnRI2sUOa31XESbrL6X5QpoTwzg==
X-Google-Smtp-Source: AGHT+IEHmgR44JJkt0kGIzW7NOaECWfdPMcTxHBijYkMDjUQ//6R0gtSxgRSvy3DiBlPMd5HBstr/Q==
X-Received: by 2002:ad4:576b:0:b0:6a0:6545:2306 with SMTP id r11-20020ad4576b000000b006a065452306mr15355570qvx.28.1715087913906;
        Tue, 07 May 2024 06:18:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:30 +0000
Subject: [PATCH 04/18] media: dvb-frontend/mxl5xx: Use flex array for
 MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-4-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for this struct in the code, so
no more code changes are required.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 3c5d75ed8fea..512ec979f96f 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


