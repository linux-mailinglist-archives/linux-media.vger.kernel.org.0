Return-Path: <linux-media+bounces-9059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350AF8A026E
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 23:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9ECF1F23B1B
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 21:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D12219067F;
	Wed, 10 Apr 2024 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n96c89I7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635B8184114
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786089; cv=none; b=jwHKxHAeSbkDtMqGG7qOiJwRSb08BCI+fGJyZhXfgbZ83Zaazt8kUU2xWtd77+jMZj0Zg4uGvO4IcewJ1qkDmaou/4hY98avIQuIhE/8PA+P5+na1AL9AdGNaeFLaESVjDloX0/u5+9bM2PM8KoOSU10zIwxMWkFdx2fKgfLDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786089; c=relaxed/simple;
	bh=EzXC/4xYw8bpGVae+0wn0GICDiD54D8PeB0vdxO26YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxU3+PoIU1sHudqG+n+IRGDhiI25z7qzO5RlsMhe5L1FcfW2FQf/nalgKlf/GT0mX5i4lfLaGtxGgnmaEWssXvOHJNGss3u7I7n7gM3XAfMC8pYcJCJCx1LJWA47LeAn56/59hS6PDJztZ06X4AdM1/vJfjqCEiYAGqGG551cxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n96c89I7; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4347dadc2cfso28422191cf.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786087; x=1713390887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nzns2XXp3BgsyesnfwW5lSLxfDYY59eLeE+bSWeFTSk=;
        b=n96c89I7TMHVMCc/s6vrIhqnxubPtwm+pP7n4E2Etkr7KLOibOht7/atptAJVm5qQE
         5a8sOfSNQU9I7RvHh66kkv3XPQa+DWLpX1Jrv3398ZIdLUpbUST13bMnP4qkoifkHLLo
         5RMXkdJUCUBS6WvuorAfXfMT9pzdmgj+Eocxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786087; x=1713390887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nzns2XXp3BgsyesnfwW5lSLxfDYY59eLeE+bSWeFTSk=;
        b=LWhSC4NCs2UJRWuwDniVjurD5qxRFHP45KSQRW0BDyRcrtQCNjIv0OsXUbUAP2Xvtw
         Hrv8zsxdr1m9VPYewmxhKuFBjsmmt2ec7M79FRpYM8lsMAsn4FQ/YKM/pAk8AH0+zMT/
         zDR6CU94ZlIAJCwsk9PT2bPlm6Zpxt3b/blukbk9vkfUOd6HplrFhgtfpLAPUJOPZSrY
         Fw40DitpvgWlm/xpaqlUQra/30n+VCIGI9VgsaLxqZ/8oMvD4lBMEe8pNjqBIldJXSYW
         RpbNe6ecqfFQFNxDk2t87tU0D14xmDQAgM8sgZWhNU418t3RNkt/jNy84BNJdrBhkJON
         qkfg==
X-Forwarded-Encrypted: i=1; AJvYcCWim/xp3cjArwuzTi6wb0bvhJuZp4vL/e78oDBkelgBy2jp+vueapDySetDW5CkJ48Z8wqH52RDqtItjCudq4BjTTwZuqzJQIjp2tA=
X-Gm-Message-State: AOJu0Yx3W6yIoWs8OYALjXd1aIJCQn3rxylbi6RkRvjoKYjyHdygJqK6
	Efv5XpMoQwJjXU78XofHxvJlDgRTH6VvLZlRlYd+m7MtpySCNmg4NGTt0oakgnJatGeK+LKWEjF
	vXw==
X-Google-Smtp-Source: AGHT+IH9ibfw4+QYfFH/7vnhBrr0v60dMc5TlmaLcG2PPAu465t/Cz8VYSfyv7RTeGYj9Z4zy/bAtA==
X-Received: by 2002:ac8:5f0a:0:b0:434:b349:da7 with SMTP id x10-20020ac85f0a000000b00434b3490da7mr4288466qta.26.1712786087041;
        Wed, 10 Apr 2024 14:54:47 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 21:54:39 +0000
Subject: [PATCH 2/6] media: cxd2880: Replaze kmalloc with kzalloc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-smatch-v1-2-785d009a852b@chromium.org>
References: <20240410-smatch-v1-0-785d009a852b@chromium.org>
In-Reply-To: <20240410-smatch-v1-0-785d009a852b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Fix smatch error:
drivers/media/spi/cxd2880-spi.c:391 cxd2880_start_feed() warn: Please consider using kzalloc instead of kmalloc

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/spi/cxd2880-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index 6be4e5528879f..65fa7f857fcaf 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -388,7 +388,7 @@ static int cxd2880_start_feed(struct dvb_demux_feed *feed)
 
 	if (dvb_spi->feed_count == 0) {
 		dvb_spi->ts_buf =
-			kmalloc(MAX_TRANS_PKT * 188,
+			kzalloc(MAX_TRANS_PKT * 188,
 				GFP_KERNEL | GFP_DMA);
 		if (!dvb_spi->ts_buf) {
 			pr_err("ts buffer allocate failed\n");

-- 
2.44.0.478.gd926399ef9-goog


