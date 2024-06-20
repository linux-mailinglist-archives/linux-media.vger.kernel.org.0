Return-Path: <linux-media+bounces-13886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A19119B8
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 06:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238EA2832C8
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 04:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4930412CD89;
	Fri, 21 Jun 2024 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gypKUVDQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BAC13699E
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945213; cv=none; b=mTZ3vDa399qyhpsXuBuvtQHYxxBoWS9B7N/mIPqNrK7AcTf8H1R5lp19cZAJN6CxBXS5FnI5cx/T2VCtBzKa5r5Kb3er32sgOiXI836/9YitAq0NTnk736wEH2e4ooRKdAM9NPYKQpwHturMt4R+xXiCKJFDyVI9uN7EFmC/Crk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945213; c=relaxed/simple;
	bh=eg31BoRkeTJON7zXV4K1jhgM/v2n2k+KGM9iQFc0N64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzkXyDFDWIcHTL5+m37WS2hRZPLNdtVUHB3tNLCORAjBlOSWfQoh/d/Xqog9CcLr59t+h+a7QgShPM5F+YALGD5HW4a3TP9ngCEjO4230MwkrrYGcwZvvUwjEYAyH63WwDhBwf9FYgISvqnCfx0x+aiuzNQG0jps2oQajJrg+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gypKUVDQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6fabe9da3so13471275ad.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718945212; x=1719550012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs6kToBk8YjSTiZsPQaIgz5b7g4VfXjvffstHMdxZFU=;
        b=gypKUVDQI7Ffbl1Wnu5kXb6vzVS7KgCFDOg35Gvy3gOBUINWAXQs1iw6d3VvzEAi+m
         GQqiTDnctqGGfcHg/1x5jvz73sFrhJUH4+jIG8mgC4uJdhcr9HJzVWjw+x9Tz0sC6aIS
         r1v0OK7YXl3hutUpZJXjrCWMOimuDKiwaAafI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718945212; x=1719550012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs6kToBk8YjSTiZsPQaIgz5b7g4VfXjvffstHMdxZFU=;
        b=LmKFM5o8jBytBGlOcGq8s18szuWtffqxoS267J+mPobEvzuxEAPgIpV2QsQZ944dYF
         ahZjmF1YrOC99OckynsutdBZ13ytV35igmGI5U6UmMmHsb/PGp/7T4kfsq8MXNCzde84
         q2fpNEmRjuQuMHC7r+LBdsPQOJnOSDzMwdhr7lvbTkUr/4UHCaotDGu9lvI2IWb8OGO2
         BZ5bo7991htrTwVP7uWyfRM5ALm4xBKeTHYu6K/yqg+wYez3S5oslLvWggYb1iZ5l/Rf
         0qFQg33HWrho/tGw/Ck4Keq2b9IbmNPJ873J27uEBjzYFFtFW3EbJofEspFuxXC2izPU
         oCEw==
X-Forwarded-Encrypted: i=1; AJvYcCUTLHHdzhcoIfFhuYHy5UGX8ovOgg3CMxSxIIiCCuh+oYud00hSCBGGMiyumgYQO8TuVSG5aDjMzUBmJbV5P4dd+ZfQkTQ9TF0bGTE=
X-Gm-Message-State: AOJu0YxchHIiHdPsCsv6fIWUtnb9GXMzjqjjfxlTUwcO/ROnKjEqImiJ
	NP+5WhC2ocv4YxXncyXlUjgKRTzeXp6JUOFVZuIex5KhZQKP4jw2wVEQ7qjbHA==
X-Google-Smtp-Source: AGHT+IGBWYpF1pYJ9+icaGVYwbZfvFF5d0o4lVQn5+tcG9E+8MIgi+4DUMl+GZROA3IqIr4GWwFgNA==
X-Received: by 2002:a17:902:ecd0:b0:1f9:eb2e:d32 with SMTP id d9443c01a7336-1f9eb2e0ffamr10912895ad.22.1718945211680;
        Thu, 20 Jun 2024 21:46:51 -0700 (PDT)
Received: from mstaudt.tok.corp.google.com ([2401:fa00:8f:203:3c9:e095:f93c:9c3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb5aa5sm4780755ad.271.2024.06.20.21.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:46:51 -0700 (PDT)
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
Subject: [PATCH v1 2/3] staging: media: ipu3: Return buffers outside of needless locking
Date: Thu, 20 Jun 2024 23:45:42 +0900
Message-ID: <20240620145820.3910239-3-mstaudt@chromium.org>
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

In imgu_vb2_start_streaming()'s error path, imgu_return_all_buffers()
is outside the streaming_lock and after the call to
video_device_pipeline_stop().

Let's apply the same order in imgu_vb2_stop_streaming() as well.

Signed-off-by: Max Staudt <mstaudt@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 541556037c42..3ff390b04e1a 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -556,10 +556,10 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
 			imgu->streaming = false;
 	}
 
-	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
 	mutex_unlock(&imgu->streaming_lock);
 
 	video_device_pipeline_stop(&node->vdev);
+	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
 }
 
 /******************** v4l2_ioctl_ops ********************/
-- 
2.45.2.627.g7a2c4fd464-goog


