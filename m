Return-Path: <linux-media+bounces-12812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED0901CA2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FA9DB23AED
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6446A7CF3E;
	Mon, 10 Jun 2024 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn63ZtPJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB479DD4;
	Mon, 10 Jun 2024 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007048; cv=none; b=GtE/kTsU773w4hRzmMmiZ4Ax3KBbOKkaFRxOZvOQYH3oJn4C2OdOteK2ZzB6H1wNdsRidwcUU7Li7i6oEvge8LIkzCFGhtAmiIlEE4AsYFOCZWGANKaSSh7ZdurkPMvERCNr83Vg+wiCpCYujfP/GiR7HmdqD2uSx7NWN5jAur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007048; c=relaxed/simple;
	bh=LLYiOPLlZ7zdUiO1gClkVKtBj30yeqQlUS51dzxFaR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QxvIhNtQvLZDY24R9qG5b3W9mZGvO01DTLK2GwO6ratcZIn7nlpFmSukTHw0YCs9WeI15z17abf2SULTsSaS0UrhYyLKgunRT/F/itISS8+efmqElcxD6AbG8ZSLQjyvwYxrBXe4+V/2yzqVXTn7gEneqJHVGD5o0CJ5pgHZkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn63ZtPJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42172ed3597so14577235e9.0;
        Mon, 10 Jun 2024 01:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007045; x=1718611845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzz4FamyiPn8akR9ASl0Wy4HP8i0zYoG2pk7jvrBsjU=;
        b=Xn63ZtPJX/GlyAZmPJ17t9JB1yQj77dOlAE64oFD8pTGFMhxJYyLn3a0AWQZb5a//j
         aRKL2+brtYg7jTwJHr+t565DdZ9hc8kV9WmlOPyMnQpOANi5vcjCcZNSKvrxYxbngs+0
         shJ5foWLLPjrRajx6a5QDupA5bS3vqWz8OXidQfBRSsVkGcGj0BOWevFS9qouDRyEh6a
         1QWDPuEElYRfgx1Vnfw95JO1hmMwY9APagtDafLa7HLAVjo4NN7yiQmCNKP8BzyiVIap
         vVBFDuV7Q1JJcXAsYvSZLNsFs3TTPHy+LUxd2ry0BiESqpDtFordGw03F4cFihK6JMGV
         xh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007045; x=1718611845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzz4FamyiPn8akR9ASl0Wy4HP8i0zYoG2pk7jvrBsjU=;
        b=TgG7Nl+VrfERojyootQqNyPmJwN/wjogmDp0DkQi949PnGE4UqxHpQ/W0hRnzRQrQf
         PcFbcSb9+TjU0fdg+sZvHkOGNmG7OnpwaBWE210YFCBw4EByGRlr/KYoCnO5VLLWun7P
         qTu646hn7xrrRE16nySjCUweQsc9H8pv2ovafy/+e9azrIz5esWnuHX+1UI+bDAVSb5F
         SVIQ2VQrmM1ceWBCWly11ABfKuNcULFg0x29VOTjC3828+yoZzKz6rJMrM9Sw3FSTZdx
         baiI4/UHtTTW9pfWlHgNhkcJHF+fUF8gh2aympJp7tKEWDk08QwCEL8XAi/xdHwyJo9h
         oaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAgmbolWMsrxERQE2aXXhNJCOjzUJQYKLIKj53suYf/oXp5WmVv+bgX/DIkMed8CvuxOv7Tje+6fpdzpHSRILo96TOxR8To+j7xqBuwWy6OpBI5Vuy72DLec0betCUfi3DcRGzMgQhc0=
X-Gm-Message-State: AOJu0Yy0bnUDbp0QMAMteuw5z4DwVtty6xC3t2iYz3kHnoG787H9UDLp
	pUF6D2gB+HJgEzP0nM5KQMAuNYo+zrxeXnGkEPJqzp8vFolIMoSI
X-Google-Smtp-Source: AGHT+IEhmddEeIGjHLLKnZBDu0edUL6m8XjMUSFPIt/L/8Vdp6c5N0iw41CwRStbHAD8WgZDohgKYQ==
X-Received: by 2002:a05:600c:26c2:b0:421:79b5:6d84 with SMTP id 5b1f17b1804b1-42179b56f95mr58553485e9.17.1718007045421;
        Mon, 10 Jun 2024 01:10:45 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:44 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] media: i2c: alvium: implement enum_frame_size
Date: Mon, 10 Jun 2024 10:10:33 +0200
Message-Id: <20240610081034.1195523-5-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610081034.1195523-1-tomm.merciai@gmail.com>
References: <20240610081034.1195523-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the enum_frame_size pad operation.
The sensor supports a continuous size range of resolutions.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index a88809333e56..c27c6fcaede4 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1722,6 +1722,27 @@ alvium_code_to_pixfmt(struct alvium_dev *alvium, u32 code)
 	return &alvium->alvium_csi2_fmt[0];
 }
 
+static int alvium_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	const struct alvium_pixfmt *alvium_csi2_fmt;
+
+	if (fse->index)
+		return -EINVAL;
+
+	alvium_csi2_fmt = alvium_code_to_pixfmt(alvium, fse->code);
+	if (fse->code != alvium_csi2_fmt->code)
+		return -EINVAL;
+
+	fse->min_width = alvium->img_min_width;
+	fse->max_width = alvium->img_max_width;
+	fse->min_height = alvium->img_min_height;
+	fse->max_height = alvium->img_max_height;
+	return 0;
+}
+
 static int alvium_set_mode(struct alvium_dev *alvium,
 			   struct v4l2_subdev_state *state)
 {
@@ -2229,6 +2250,7 @@ static const struct v4l2_subdev_video_ops alvium_video_ops = {
 
 static const struct v4l2_subdev_pad_ops alvium_pad_ops = {
 	.enum_mbus_code = alvium_enum_mbus_code,
+	.enum_frame_size = alvium_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = alvium_set_fmt,
 	.get_selection = alvium_get_selection,
-- 
2.34.1


