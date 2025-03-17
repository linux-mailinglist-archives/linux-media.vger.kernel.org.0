Return-Path: <linux-media+bounces-28331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED740A63912
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011053AE077
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F091B17A2ED;
	Mon, 17 Mar 2025 00:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oX3pM9Ip"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC50224D7
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171995; cv=none; b=Z4TNHQmZgsY+nr6ZyJNCi+923YavPNtaDjfoPv92nFuDKOQGhaB+nJSrnfKm5rrfXAM4POqfxstU+YCUBjod9eo8yeyqit+C/PKj0RVnNCpAjGNrAfrQ8b5fqKk8xmnrEN570CwP8r20bA5Y7Y2OMmogcHK4+l6PAwqXWW+snrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171995; c=relaxed/simple;
	bh=EC9j2bIq4ciGt5bTfsPpCKAcRq1j/C87MvJJDh4ON1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2ry+crZ9gJi/M4zQZOsysRMrhw7/Tu1tpb4O1ADZ4gW26eV2Dxp6kHj8tQ6ltJsisJBT9l+Gk32e9pqymT5LP0BEsemSHWfkxqyph+hvPKTwWuVSdVLP9dF5hzXp9eLJqJUMC18I9KtKFThQlQlsIBK2yRvfEWNCC4Q9QrczsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oX3pM9Ip; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so235422266b.0
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171992; x=1742776792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oIaC4JSPq4Hxx0BCotHyy3fEpNhxbu3GVa44qnjARE=;
        b=oX3pM9IpCKJ5eXZxBEMA5VP2Zh4cZLsOAJFCJdsAaZooEFe1ZRqeduJAZlQnU8GCTI
         Eq/+HRAQ7zxmOT1EIFenukb960BHGeO4GzEdCwGKNWE0mpUgeVDk1BWbE6GQ+Icpf3zK
         2fD8hj38v/8gR8TAGZG6Y/nYZti26HjX3c5WXoypF30mJRNFg11fs1xEalA1bBCHNv8D
         /KyLZ7N1+Muz8YeYGyY2sjKeI/DYgr5FVYT12B5SOqG9BNNloRzP5s0vQaVKlzo9AJqG
         FhzzMMzNC5faCCBMhJifEvggxqBkINSjCt7GDZcig/yWqgnRDiyCdErOHlGGA6NcNg0A
         Gl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171992; x=1742776792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oIaC4JSPq4Hxx0BCotHyy3fEpNhxbu3GVa44qnjARE=;
        b=C5dg6TospnqgAAPYPAjQc9XY0ABN1RT4DAdKBk/eF+YIfOX8/ydhmIYPqQSHUA53Yt
         KCBo8THvLBf/BZ1oAHKQJATYGeFyU4o7A4uAqWRP+mPO2GXvI6LxKRrSeVkrZndy3eCk
         aC5J6xAgbL05Lddy76S31lKNhXVCPnHPTtfw7wtmP5DKXe5DL+OttatBjL6o5gCh38fN
         WmW7tBXE3FyMvS28pA/KsIHPBt91HqfK32GuZc1HP6kCm5v9hHcpZukwHClH/BLQ91Xf
         6SU2SaQt9H2vhgvP/zc4xXnY3ThUY30M684NbtHEmzFXpnoX7EzEjVY+Bz+9ho8r4yjy
         J4gw==
X-Forwarded-Encrypted: i=1; AJvYcCU1OHDt8+3KT5ZWQXYNuhlwPSKiPng3MH5O8xm+8hv0bSCewxLBmVJxDbveEui56vUeEihDnasoi4hcKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZY0MgOx0cyoNAwnxo03OMeno9qxBoPb4Nicbw0Y4fbSw/gmu
	ANwPIG7eiON/dH9ISQFMu0LRdhHFIbozn3ivjSv7rvT6jA7+/A4k9LrhWNY/i6g=
X-Gm-Gg: ASbGnctsfNuNmSOKIPhLKw8sWvPTzahfOcQ0I7RrIsR64oKN6IDcqHsTiWptOs7oHB0
	N5N4jiujY/D33GZuGoiV0SMz7RcCVRbc2bcdAoutXr/rXqun8KzZtVbvth0uhMO2JObdIyPdqgY
	3C/JAUae+1EPVqVAgNav2bgleKLQYTIlBdlx8fwyzSZaw+SwyDS9C78ImW4+ebuFWRionL4s7c0
	9V+CLOIbyXaihjlsLU+G5K+JzdrDUGkGhlcKSu5FAV9OsWIDAMmoprAztMnXkrTkaVQ/XOTUXuj
	I/BA6hB1A44m9Y9/toejACwCL6Lkke6nTUV0wRWkRvGk4caaJeqGLhLg58JwgIARG6UsMAtaRAh
	MzhjIGNOydoS6SB5cvch1FotX2p+7+KxDK1EaFgjYpfxuNj9XpBKxlGxOnRAPcWhxDxDU
X-Google-Smtp-Source: AGHT+IGw5bWEY5CU0ToSapKWjZkga24fSjvSj722h9dS/H4k7EkMFeAOLRKF/irP9dBdAZwFIVLVfQ==
X-Received: by 2002:a17:907:7e8d:b0:ac2:29cf:643d with SMTP id a640c23a62f3a-ac3301e4c55mr1021762166b.25.1742171991816;
        Sun, 16 Mar 2025 17:39:51 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:40 +0000
Subject: [PATCH 8/8] media: i2c: ov02e10: Add OF probe support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-8-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Supply OF probe matching table and enumeration structure hook.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02e10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 2c15df8ca733aa4f37e125ac3bfb51a319e34c6e..10cac199b23f14ed79f4fb7e84d2c685c6d70399 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -954,11 +954,18 @@ static const struct acpi_device_id ov02e10_acpi_ids[] = {
 
 MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
 
+static const struct of_device_id ov02e10_of_match[] = {
+	{ .compatible = "ovti,ov02e10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov02e10_of_match);
+
 static struct i2c_driver ov02e10_i2c_driver = {
 	.driver = {
 		.name = "ov02e10",
 		.pm = &ov02e10_pm_ops,
 		.acpi_match_table = ov02e10_acpi_ids,
+		.of_match_table = ov02e10_of_match,
 	},
 	.probe = ov02e10_probe,
 	.remove = ov02e10_remove,

-- 
2.48.1


