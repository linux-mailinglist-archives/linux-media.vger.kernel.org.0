Return-Path: <linux-media+bounces-13885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2969119B5
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 06:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C70285953
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 04:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2D412E1E9;
	Fri, 21 Jun 2024 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k7TKxjIa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A2128372
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945211; cv=none; b=Tph/H/a+c/lmSRk7v89Xwt9oh2J0oTLzirH/owRQY1i6ZqFPYLYkKzga8fF2T8wdH4pO6bAsUfdya+ZSC4oIVaDSPIRKvwp5uLmqBWrwdj5WqyPETo/fgzc+hRa0tntT29c2esnnLdOy282vb7Dpx31NHoD2QVVlSCLJ7Ekc8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945211; c=relaxed/simple;
	bh=R8NdDkdLHuAJuu5DqtuYnvDxeUNZJtW9Joc8RZ7NcFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSHeCq039G5W6hv9U39+6sEAgmLYkL6NoiFYo8XH9235fqcKK2txBNfPyt/BEB8UVaC9Fw58cytty2zx/z7ipwqw4dWwTJjTsBvZMNsx1lNOgZVYWwFb4dfM6mSPalls6PtTCMcpFCz2xNXWUSjCI3AzpqD3BJ8TFvTk6h0eWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k7TKxjIa; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-707040e3018so1143679a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718945209; x=1719550009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFw8MXYGxMp7L3cI809OeU/qg49sBCBLTir7UDQywWA=;
        b=k7TKxjIas4fZ1idculBVHTekb/bq7S7+3TpGODMU4oOzTCG/S5VArp1FKn8dN34ylw
         vOeNIjsdlhuMYr5A81Wg7SaozNFgP8usDMUjuqBH3+PcJep7XmEaikvIucMW/eQ70jo3
         SLzR641GjFyX3O8/0i7fCj51bv5WjnRrd2OlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718945209; x=1719550009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFw8MXYGxMp7L3cI809OeU/qg49sBCBLTir7UDQywWA=;
        b=FKdwGrdjz9BjGzOJ51rT2L4OS7w0e7uzelIY4fEutx/M3VRVsTsQTmtXWJiN3tV/7d
         z4RCNj9h/hbNXoCrmhagrjln6Gu8wSrZ2K5I2LYI4WSEjV6cl+ITuDsLHwbe0ewC95iX
         9gCdFZ9dhTwanavVfEksbv35hipNkwazwMsN4JHcTLt7cViQUJQobQyRXjN8FcAae/ZK
         gwZw4u+vBQCl4M7/x/uAh6kxs02twdyVXfT3LZPV7OpsHGv+jEop0TqLkAQ4y+yomiUG
         Rh7WXWBHxD22IeKJ5ak1kS9s9J/FEGHN1yDOY/Zvj/YYMv8qbzaPEIeRZKFo1/h8bChs
         3wKw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Dxi2s7aIoisqnWKTdTRnKjQl//+gJuFymfLHqC6AHz/rPfQSnxugYId24IbtL9vgmAOoX1MX8jfM8AZsYUc/RPgzoHr8nK9N+EE=
X-Gm-Message-State: AOJu0YzaW9aFsoPpS4+r/i678r7SSlbXihJ4xF7GK44891baV4maAAT0
	lSwYm5EMPTqrVUvwTXlofUHuq0yB+NVqgQCZ3E2ihF6fUuCWS5SrLqyxLxa3Vg==
X-Google-Smtp-Source: AGHT+IGGosIMTTEw+hzlCiXlOi3rnGUIGOyZxC4WoKJX3kiPR+CzNCJgS7NRP7b1zjwEU/GvUpWcrA==
X-Received: by 2002:a05:6a21:3288:b0:1b4:da55:e1be with SMTP id adf61e73a8af0-1bcbb4172cdmr9568050637.14.1718945209235;
        Thu, 20 Jun 2024 21:46:49 -0700 (PDT)
Received: from mstaudt.tok.corp.google.com ([2401:fa00:8f:203:3c9:e095:f93c:9c3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb5aa5sm4780755ad.271.2024.06.20.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:46:48 -0700 (PDT)
From: Max Staudt <mstaudt@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Max Staudt <mstaudt@chromium.org>
Subject: [PATCH v1 1/3] staging: media: ipu3: Drop superfluous check in imgu_vb2_stop_streaming()
Date: Thu, 20 Jun 2024 23:45:41 +0900
Message-ID: <20240620145820.3910239-2-mstaudt@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240620145820.3910239-1-mstaudt@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for imgu_all_nodes_streaming() seems superfluous, since
imgu->streaming can only become true once imgu_all_nodes_streaming()
has been true. Hence, checking for imgu->streaming == true should
imply imgu_all_nodes_streaming(), and therefore suffice.

Signed-off-by: Max Staudt <mstaudt@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3df58eb3e882..541556037c42 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -548,7 +548,7 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
 
 	mutex_lock(&imgu->streaming_lock);
 	/* Was this the first node with streaming disabled? */
-	if (imgu->streaming && imgu_all_nodes_streaming(imgu, node)) {
+	if (imgu->streaming) {
 		/* Yes, really stop streaming now */
 		dev_dbg(dev, "IMGU streaming is ready to stop");
 		r = imgu_s_stream(imgu, false);
-- 
2.45.2.627.g7a2c4fd464-goog


