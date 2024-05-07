Return-Path: <linux-media+bounces-11007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 627018BE3BE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16ACC1F226C3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBD716C866;
	Tue,  7 May 2024 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QQfJdixz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42416C44A
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087915; cv=none; b=D4S1IzTsFbO1rHac6p9/xrkIxi5VOkGlVsqRuojWKF4eI2TxxWLL1Rnh+XsD+JztU9B5YMJz8VItNgZ64Ll1fsVQ/jfjtk/MKFfkDWNk4xQfgKjenkcDi92v6EhPrayPzRVXG6lB4FGRqwB2spasMhc9s9+ANRBYguar+NwGVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087915; c=relaxed/simple;
	bh=8PUpSF0/4qPVDDDsamD0PWejHF9bSQacFjYzGSE/u/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8Edn5FfPen5zQ7cg2qBb9MCUaZVKd86HI/MkrxlH1sAzO41m2SSe7l6IyoI9srb8/uQB2O6aQbhBY31t+Vdh8G9HGRbcPhBaRmwVyrHXSTnCbOzWPZ/Y3v0tPyDQbZ/BzaXGnwuMpyha0k6lDIAwS1gVkoyKJaquJYol5UCRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QQfJdixz; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7928c5be3deso250371185a.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087913; x=1715692713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A/cdtQJ5ubVGGh9zBSnEjfvf8aW68DShS0IQqplaqg=;
        b=QQfJdixzzYCNPNcgRdEW59kLrcpsGqxk9Ydkaz9IyViLpgu6gg0nhDhA4e7FvQZkkB
         lxH5cICb8BT9QUv7vZOzghgDBXDqdw9XlPYQe2ksYuEb4RQNbTtmOQTXcwRGhYcR4pk0
         mbcVs6NmjM9JEU15n7HCFCKSx4lLC2mRYK0ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087913; x=1715692713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A/cdtQJ5ubVGGh9zBSnEjfvf8aW68DShS0IQqplaqg=;
        b=DO22wyJrYV8Duc//KlIaA1KdfPSI/tLfrskzwZkOppfDnIkQfQOALCxCqVjgUnf/cy
         l4mOoL9Tjqa0u3X8uLwTDR/LgtMS7nt+PZZfcxLKof7vRnqDAkGQsW7jDXHOlmtkYZN/
         /w8yt7GRx3W3u4FMFYGNrGzu9KiUph6O/87rl4+1rOEMPnB4M75Brlaz1n+XSIW5d3+W
         nIeSbcOLqCVPODfgDvRFF5NcgCrE2t10MaJJODnwqdrY+qGUM3D+lnSUfNvKC3AtiC5v
         p0BZB4Ha7SNB74Wj6BtitqmoU4tuD0iJEdA0MUNs+rBta4C27qMK5MhNSN/p17zFb4r5
         jFzA==
X-Gm-Message-State: AOJu0YxVF8zSFcQsGRDKElRKtTbC/hVGEvXQK5mhjld9LyGu0s/1e2hC
	H2TR1OFK02J3agoI/8cWcp3KWWozHc4JXfzQmYlrVx62De+q2PvUbJoJkK5ZRA==
X-Google-Smtp-Source: AGHT+IHQmC234jVmBfThVSOfa4/hAJa6mJSOT+8IOLfwmMAfT5gaNt64PTRiybToFecmCSMHrjM2CA==
X-Received: by 2002:a05:6214:d8a:b0:6a0:7d91:8752 with SMTP id e10-20020a0562140d8a00b006a07d918752mr17005843qve.58.1715087912800;
        Tue, 07 May 2024 06:18:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:29 +0000
Subject: [PATCH 03/18] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-3-4a421c21fd06@chromium.org>
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

Replace a single element array, with a single element field.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx.c      | 2 +-
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 91e9c378397c..a15c0438b07a 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -893,7 +893,7 @@ static int do_firmware_download(struct mxl *state, u8 *mbin_buffer_ptr,
 	status = write_register(state, FW_DL_SIGN_ADDR, 0);
 	if (status)
 		return status;
-	segment_ptr = (struct MBIN_SEGMENT_T *) (&mbin_ptr->data[0]);
+	segment_ptr = (struct MBIN_SEGMENT_T *)(&mbin_ptr->data);
 	for (index = 0; index < mbin_ptr->header.num_segments; index++) {
 		if (segment_ptr->header.id != MBIN_SEGMENT_HEADER_ID) {
 			dev_err(state->i2cdev, "%s: Invalid segment header ID (%c)\n",
diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 097271f73740..3c5d75ed8fea 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
 
 struct MBIN_FILE_T {
 	struct MBIN_FILE_HEADER_T header;
-	u8 data[1];
+	u8 data;
 };
 
 struct MBIN_SEGMENT_HEADER_T {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


