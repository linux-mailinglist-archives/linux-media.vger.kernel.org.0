Return-Path: <linux-media+bounces-10678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F38BABA2
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 13:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4EE9282198
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 11:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECAC14BF85;
	Fri,  3 May 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ex1N/J/z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C59152502
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736025; cv=none; b=JYHAdn7Y7k+3PfHnWvs7KOYAUkZSan/tKLAd6MW3Nf9UpqlSdATh0aD6PU0uEgZiZo6bRCuizy5NhVtTrr6mLKu98trLhseQ3hGROR2MPh1uaRJDFsnJRDPcAtDTQft2EkROClLASk2dcgAzsLaWIBphBsOkOIRD/nf7dE8lwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736025; c=relaxed/simple;
	bh=WADYspwgMs2YdaZV7xUa0mIJSKnYTWlC60xHwnIngW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HUGBWxnuk4ZmVOqtOOLOnERGa54j0d0uN9LzQOX9CAeOE3CrgFRZGNArhizlCNIO6mFqkPnVtMGgxvVR7vTLBjNIhwnZtlqbDIBzgl8a2PZxFgQl+gjZmf2F5tbJsJqb/waGaITppFyePbvfjHTYUirZ0vwL4zjm/0i6XyoBXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ex1N/J/z; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-69b7d2de292so33806566d6.2
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714736020; x=1715340820; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PV1uvsPD3hPVQBDeLEfhqbETDS++mq2cZ2grIK4TBwQ=;
        b=Ex1N/J/zXeUWtVlEw9zP/ShKR7HxAkQC0S0l6bqsdPbmsy4j5FWojUOxxiCq9iixAT
         u5lZi/2Xwon1dGTs8UKtzrrYrb4lfX7Id/5Xkavud9r56NFIjUcJSFt60sMs10b69kiP
         Tgv6MzV4c1Gy5Yb/Dr5frXHF9dZV4ExXsRGjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714736020; x=1715340820;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV1uvsPD3hPVQBDeLEfhqbETDS++mq2cZ2grIK4TBwQ=;
        b=EVkKipOghoRe9ps0Tnn0RWHTO2yWVmQIQMy6Lv5FluNXY7dxyRbu0lzPWKjeT3Hz8j
         VKZ//n2+dy1oyvREZhFLz/+WEECuyhsHB9direLTwEQlzv/2hcGnSlzaUg3lWFgzqm4V
         g2ctJTGHpawZguSQjdw+RGkmZc1efjYrwLZaTphLeOwnomPdTtDIjtsFjXqDFxCtlN4d
         fXYIkZ2KiOeDfIdjQYojpR9pbeTfLsQq2RO59qHfxO4cakgen0XYDSBWF9GENGpU+j6h
         eE869ADnYwDZI0joMoLY4tIzyXZIdKJjECdOg7vlkgbI0fC8Yl+k04YBwc8I4y4ea2/P
         4YpQ==
X-Gm-Message-State: AOJu0YzqgaLHkPPBAER/InPKDcOyjvPqmMPcoYYsKDlAv182IRPEl4Dy
	REGxZl9wSbLxlc38cO/ddsieV4UTyF6U76Tkire9V/zY7i/FXJjTbZWd4sVYUVMOjsoSMVVimzu
	5Ew==
X-Google-Smtp-Source: AGHT+IFPT+c5g8iGSubsJn1MAU4lk1gCDhjOfclD78asjQf9ys4/KXilDg0+WfalUYicwon901btig==
X-Received: by 2002:a05:6214:501d:b0:6a0:a7c7:4d5d with SMTP id jo29-20020a056214501d00b006a0a7c74d5dmr2533425qvb.58.1714736020543;
        Fri, 03 May 2024 04:33:40 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id f6-20020a056214164600b006a10054acadsm1137432qvw.19.2024.05.03.04.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:33:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 03 May 2024 11:33:20 +0000
Subject: [PATCH] media: cec.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-fixdoc-v1-1-44d26e6f9dba@chromium.org>
X-B4-Tracking: v=1; b=H4sIAH/LNGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNj3bTMipT8ZN0UQ2MLg9QkIxPj5BQloOKColSgDNig6NjaWgCZWnJ
 4WAAAAA==
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

is_claiming_log_addrs documentation was missing.

fix this kernel-doc warning:
include/media/cec.h:296: warning: Function parameter or struct member 'is_claiming_log_addrs' not described in 'cec_adapter'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1169148/test_report?job_name=doc
---
 include/media/cec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/cec.h b/include/media/cec.h
index d3abe84c9c9e..d131514032f2 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -187,6 +187,7 @@ struct cec_adap_ops {
  *	in order to transmit or receive CEC messages. This is usually a HW
  *	limitation.
  * @is_enabled:		the CEC adapter is enabled
+ * @is_claiming_log_addrs:  true if cec_claim_log_addrs() is running
  * @is_configuring:	the CEC adapter is configuring (i.e. claiming LAs)
  * @must_reconfigure:	while configuring, the PA changed, so reclaim LAs
  * @is_configured:	the CEC adapter is configured (i.e. has claimed LAs)

---
base-commit: 1aa1329a67cc214c3b7bd2a14d1301a795760b07
change-id: 20240503-fixdoc-d1380eb243cd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


