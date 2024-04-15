Return-Path: <linux-media+bounces-9451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EF8A5B3C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C8C8B24EC3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EE216C453;
	Mon, 15 Apr 2024 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RXSntWiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15361607BB
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209708; cv=none; b=t4oFb8tyNC+8+EH9i9viRra63UtoaQ2cAsSAIpkKL6O/xDUsoY5qp3KsQNJQzSAf4YQ9mPTuAFtkqYTsEfj9+tLiV3xlQUTuJvGmZ4qR+bcnoV58ZZzpucggsQM1UukE4Lnd4yxyeN9W1I5b93jbGYHjS04ZvKh2Qm7qsjSNEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209708; c=relaxed/simple;
	bh=sbLzegDZJboKAA9/je+6QpJ4kVwKzeKe1sqk5xJ4+pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQLsyE3+wZmGZOwqQWCwrKjHapd2GC4pXxNspmrgiAWjCJTNXHQprHz8Iy+xw8co/6PxsNH4QF93WsjQcjqgGQUo3URGYt2RHJCslMXFuPWkoYssUYB1YHPl5Jz6kzT3MWu1VuWqoBPhPYcpWgMPW1FBop9C8IuWGo3HXK2MFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RXSntWiL; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6eb8ae9b14eso370011a34.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209704; x=1713814504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZ69zvEi+2hVMHqGREi0s+o1FDmo1qxeLo8vD8Yn8BA=;
        b=RXSntWiLyE71kiYiA81ZnAMAJVFNDDjTsj2344Bh++m7oSZB6zkq28jsVCwAdLhoT5
         CFBB8TIzvhOpRXt3uRq7wtFjH/xY6SH6NjMpWKmK64oiUxSK4cz/1NSf2X5CKEt217ON
         TkMAeyFxlnnOuSssWf0HdQLyikhjSSceC2xQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209704; x=1713814504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ69zvEi+2hVMHqGREi0s+o1FDmo1qxeLo8vD8Yn8BA=;
        b=h4zZmQqjuy0dIQDckyY0c0hhXPXkVtCkG7ueQwyJn7DFWRSKgD7qyRorKIZ3Yw+AY1
         9Xfbmgi52MB4kxhl4QdcG5SNT5qfhHnhuC/N5WUYw6pfiynJDdwtOuqN4q2H5eJWI7I4
         aBWWW+3ZUGsB+hJvKZqAvzTOfD3z+lzsXlusI76VoVuNlBEqW1ze7xRv+aJZJ5tr6Y78
         625WIB+gFDYHp/cnqndWSENl3wrP1utFlpbbg+j89iYU3pgPq7DctPNZRSleLp14ApeV
         w8WRWvQtGMs0Q0ApW8u8CN8Ch/Rx/VhpldRcByzWK1Jt9LY+YE6fDU4X7aF6DBpC7cki
         HKOw==
X-Gm-Message-State: AOJu0YzeI6cfY6Gi909ySVf8jTb8g0Ku9iGDpJWY0CSJUbzvnzchsrwY
	pYYbVsYTPsn1jaf5Lg0L6VgAHxnD3pY3Y34kSb7cF+lV/Okt3Un+t9BvQIGDYQ==
X-Google-Smtp-Source: AGHT+IGR6r574HxBWsbrxXxGaHrf3NXllaDQAZexGaElZz4TGdMFy5/7Wsa4Z+FqqK7nCIYg/Ya87w==
X-Received: by 2002:a9d:77cf:0:b0:6eb:68b7:581f with SMTP id w15-20020a9d77cf000000b006eb68b7581fmr7839393otl.22.1713209703885;
        Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:49 +0000
Subject: [PATCH 32/35] media: si4713: Refator return path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-32-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/radio/si4713/radio-usb-si4713.c:309:15-16: WARNING opportunity for min()
drivers/media/radio/si4713/radio-usb-si4713.c:360:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/si4713/radio-usb-si4713.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 2cf36c8abdde..0ad1bfe09004 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -306,7 +306,9 @@ static int send_command(struct si4713_usb_device *radio, u8 *payload, char *data
 					0x09, 0x21, 0x033f, 0, radio->buffer,
 					BUFFER_LENGTH, USB_TIMEOUT);
 
-	return retval < 0 ? retval : 0;
+	if (retval < 0)
+		return retval;
+	return 0;
 }
 
 static int si4713_i2c_read(struct si4713_usb_device *radio, char *data, int len)
@@ -357,7 +359,9 @@ static int si4713_i2c_write(struct si4713_usb_device *radio, char *data, int len
 						data, len);
 	}
 
-	return retval < 0 ? retval : 0;
+	if (retval < 0)
+		return retval;
+	return 0;
 }
 
 static int si4713_transfer(struct i2c_adapter *i2c_adapter,

-- 
2.44.0.683.g7961c838ac-goog


