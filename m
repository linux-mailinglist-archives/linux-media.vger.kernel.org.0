Return-Path: <linux-media+bounces-47427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01324C7197C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 01:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5C004E19B3
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 00:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9B421CC4D;
	Thu, 20 Nov 2025 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooVwzhl6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019F81EF38E
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599583; cv=none; b=Td+bNmnzDGGQkZe4Ir8XHNmFRNZ9V3NsJhpA3fyriLn0yb62zWErup/iOsa4c7CC1hpWFP0SCNAl/Gr/RX+ZAAhRwApjlcOwDaILXRDlARsiPZYxw8hnGKtA4oA2kZpsHz4Ik2G5np7x840htinog3BKq4i1AJg1/37yrD4hjCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599583; c=relaxed/simple;
	bh=XdgjqCFN8zcVLt+R4SFzR28/tF64NVaZATzV8y3WeUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfyKN415uVmLtJQWbBQ/Rm1CJ8k5Zi2dIgFLo2lgASFpB2k5ZkoGbVljrXUvIoo+/AKXxyc8ToTCYSf1M5yXB533EnVyhcz2Z1YBtLTDn88dOQoNSfRvse+3wxIFaqYalEhCjL+dc32bZdiYzj2LUuU0nJs7O3pHmWMjXd6JgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooVwzhl6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595867f09fcso32330e87.2
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763599580; x=1764204380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHpWN5s6ScBkjvSQGEh65WLbcdillAfnHYGU7Sa0wY4=;
        b=ooVwzhl63ji+GOa7ShpySbdRmaOiZl/4WWTLufGQN3fs7yoHnHf8r9wtKaqsPuo193
         uX9cr4hqyVRrf9SNFlWS5g8dsNiQNQ/9Yd5qlRe8MpSyfV++AZlGvr3ChV/6dDXRsibP
         Uoh15SKeqOBHtZ0Ho9TWwEZjlqYjzqu8wKsGHvmGnQoKQZb3ypFjlVZxw+MF6WE8ff73
         qV62uyHK2+fRYS2uvAktgHMjzHD/XxLwSrsEpA3E106Sd0G9PU8fHGXwV+WERVk/GiKh
         sY8Nwmu/mCzBv+/6NCPazZsDJHzbo1WjBvoJFMJCRTQjl8cMEH8BnXIBekoJFrjxMtc0
         2kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599580; x=1764204380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHpWN5s6ScBkjvSQGEh65WLbcdillAfnHYGU7Sa0wY4=;
        b=Ykk3iSgGXCKUFy7x4lJs9ds+T8sQOYVTgjkIrEkuyYTgeu+P2CXm1ZL2RKFyTGtclj
         1KbJMZlgm4lx1Agl/Egfi0iGSiOFH3Hf6u1yfGFXbasDd1sjWaqbzPHrBK6oWZeIyriT
         ccwqpSQEAWdGCFGOzNUErgKqOLwYjpeVk00i5IFKA4LoRtjbCJ3iDEfMWqFq+wwByfcw
         omWUiSbPpwN/DNB1Jpdb6azhUv5qTJ6Vv+qjlpNt5qbcqSL0eO85qNlrUfEWEbvWyWty
         EjVqQ17zVsy2a424ciFOX4Cw4Fx/PZRW8M0FrVbdNJv/p69RizzapDATVPKfpz0TTOrv
         26rg==
X-Forwarded-Encrypted: i=1; AJvYcCV8tcg6AhabhuluhV/IWJqi2LCbLoIzUxoofTUBbquWH0xxQAkG2rIXNjSgqbSWCs+JhdZ+efc0S3FuxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhla4uq9S2H8MggzYoXsYj/F4VpJdf9dDEEfw33GX1F5xzGW4/
	B8RF5M/QoJrJ6wvx3ajcB9SgUUeyCnR6qHAMxZGPZe/puNw3oS2t8tLK2iqhUo1JN7s=
X-Gm-Gg: ASbGncuGdxZ+FjoyhlynLhbP7rW4WUmsCBpDV/mGsfg5NC9TYfFXKtpBA9qOfZejURA
	0uJZHlcxtlcKaSU9KLLpAH47gjm/HkymV1OAw3jtXpVWUQgakl+9Fv40tPl566CEKOjwzX+0LF5
	VMBD/YbTvSQ+S/aw1X07WdLR3ZPRPvVsjuAYMEHEsFXrScxlmuJA6cNOI9S9hfSgBA1NTEEJ16u
	MpZpBcrC+BCmgDmqO7pegLGOL5LFDcCwcuzYdKbHH9TLa0FkYs3NIOjgYs+Il+QtdleiGeW+bHf
	bl/v7WAeRwSBsKghejSNpLx/6Lzd2GvuazTsFMnQA1Yy5hKdHNvp2HBPVFwJAhVlHSuPgKpmqiT
	SLSokhnnL7yezOax4L0slAWvWBJK2ramANWwRFRrw3nQlJ2tspgs4zW9fU6LNCj4yBLM29Q9g1r
	KGgcCGQ/MzZRV7i5lQ1g5j/bR6RNxThm5FbrOcl3h/ooXz6KGjkT1sXEDGlH2exPys
X-Google-Smtp-Source: AGHT+IHZRZL5fi5Soa1OfVIBarkuqZ3uoJuX2ljNeZ/UrapTH6fiRU5dDlTaot3ZuMW7WMcCwMLAQg==
X-Received: by 2002:a05:651c:304b:b0:37a:43ad:859c with SMTP id 38308e7fff4ca-37cce90d921mr51741fa.0.1763599580067;
        Wed, 19 Nov 2025 16:46:20 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc59a9sm229479e87.71.2025.11.19.16.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:46:18 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/2] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Thu, 20 Nov 2025 02:46:04 +0200
Message-ID: <20251120004604.2573803-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
References: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another code simplification makes parsing of remote endpoints easy.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 736f04e10bdb..43592b51e127 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4087,18 +4087,9 @@ static int camss_parse_ports(struct camss *camss)
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
-		struct fwnode_handle *remote;
 
-		remote = fwnode_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_err(dev, "Cannot get remote parent\n");
-			ret = -EINVAL;
-			goto err_cleanup;
-		}
-
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
-					       struct camss_async_subdev);
-		fwnode_handle_put(remote);
+		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.49.0


