Return-Path: <linux-media+bounces-41892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AD5B46F73
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A685A330E
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149A2F9C32;
	Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJhZd0Dn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E72F83C2;
	Sat,  6 Sep 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166855; cv=none; b=GeHwFhuNplVFdSgNtBcbKSwrzBbJ9BAXmkTuG6z5v9W1dbN0Oc8PDmTAgszuVmkixbFZdPizaXmKumQYX+5/K7N2kKVrUeECYkqtyYbbDORc3L5CcAEy0TLlrDkqzlbVoh2r4ZbY6e//udr3+GeVOJ9+A72Ywv/YlC4AJPHBXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166855; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf7mP6d9bUMoV9/BSLF/wWOzz+ZT1995Z7B6/eR0tX3pLh/H22KC0xcFyE3Z6wkU1HD+Rs1kKsehftgjwZFmWRFLONEtK/giMEIplhzudX9JrUzW3gH7l8fOBVGkavU1e216OU6fDcuU4MBX4e8b8K7v3GjKMYv5oPEDLPlHqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJhZd0Dn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f6186cc17so2893387e87.2;
        Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166852; x=1757771652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ZJhZd0DnpY6QFhTpSM8FmPN8/v4tSM/05x3m6avMlGBT068tOV4XypwB6F1YmT0wbR
         Iv2eFeFVNfoUdkcbHSVU421bUWLWWh1K3pZkdYEw8ydpvq35v+HwDa5hlH1XCtCEaqCX
         Nrr0ykCorWHmRLluwHcwJ+dROI8ygvo8PioEmqUmuzaszBMi5mwW9GN0A3+nioYQOk/i
         9vhx3JJ4MX7cuVNr5tOu3Y4/I+bVnip9bVeDT2dedjwIXs8iQ9j2bkbR4bl4xs67ai6h
         rpuTnx91I4yoC3rBza1kv4ZAXUVXb315UHLtBckCcIA6rqo7FmNNt/UNvAYxg+tCfPiX
         gL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166852; x=1757771652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=rJGgryO42Pv7fKQaMA+MXSpdPWGNoLbpER1yH2PscyJv1BVMc/bmCHgejRTukWfE/R
         YnWkEX6jD8nQRB+jRO2huTy+01TsymHdMoCfnElUgwWDqO9d7vB95D0CkcjIomFQUygB
         iafbSsVtmAAKX3CaV3P3EiE2k4EDdNbMsEPrdXBX/ViIXFVuZOJXX7w7mAV9roBeUYlZ
         0IENuFna3+6Stm50kEvwPCZQPF05QLL5rWUoYM4Mn7dNFRPm3jEhelmQ3y+ZudYs7E1J
         y4DlY0kqxmwqABjsC1PCTDwN0CZgL+pratPtQCVNSZ0X6Fig2F3oZ//V7tEG6A2pLhr2
         EdUA==
X-Forwarded-Encrypted: i=1; AJvYcCUsmk0ux2TH9RzVTCmZ8aVKv80M9YL7JUytkCTUEgidvBVHV3L70cRuaxWuvVQBoktZV894Fuh1BKX0@vger.kernel.org, AJvYcCW1Y14zFV2yvRMYtnWS87uQTzCO5mBld9kHNvvvWIqhwG9ThqleG/8MwTuE0nqZazUttWfY3/mBAAHedKLI@vger.kernel.org, AJvYcCWBicVaK6V0p05x30JKTycL3dtm3Kta74Zcs5DQRK9eGXnYDoy2oh588rcgGckOK6UCxvCg1IyiIiIbSDw=@vger.kernel.org, AJvYcCWlRAHuKfrd4ns3EhzTpZAZ0EVch5IiVzujtYIVaVodG/qTY7TW70FcV/lbt3Drn+IW52rz+O5KdLjQ@vger.kernel.org, AJvYcCXNtwwqnGDe1RMTb2pIz6H2iKU3dHrhO4/PDnBhQ5c5DV7uSQp0qMYZ1YCmTwLyWh9aW7n7rNdWwKn20Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI11E3uR+/0yNhGN8iS+rxyfA2WIRg5sh/j7nZZBejoEwfo2sR
	V+trDXD3oUnUZE1xEnJpDnHL/Kw0Oa2VN90FWBHu7DuBKZnFk+KWsdFJ
X-Gm-Gg: ASbGncu+Ww8KqlHv8SpWpHcYZCevxqAjChHCmShPpttUQCK7AGdscBvrjC2YeVp8SZF
	Gbx8X/+P6ZeDYCfm6fgQUrb5/g0nlFPs9R4R/9wTBATwhJMao8pOgCzmbIJrSClX+4+9WUHtuxg
	EobYwihkj8FDl+69ZKa4vmSODa9RDbF/qyrHSX7GQMfOoaau7gb+DLHdbFkWghyEfum9epX1KDw
	U7WglBThKkvI97ENeOCiP1nfTacL0Y0bJJSCeU1zoZPquGBFJvHXFm/1EaiJYK/49NVql3bsW7t
	gR/4qqmokWytW6PG4/2fW4h1tTEUE0jAN/e8Ecd69CYSAjulREdRUtUMWlmirrj2a5skBNzd9dB
	emvXjGwboDM4MSNW/Lk0MkqWA
X-Google-Smtp-Source: AGHT+IFNdBjIXq5sYz1MCdAhWLRCrwcVaq6AC94sETsLdKECpgkyBPhg/M7G3wdyhSPEeg7Mdr0rBQ==
X-Received: by 2002:a05:6512:1390:b0:55f:6eed:7805 with SMTP id 2adb3069b0e04-56261313e4amr564548e87.2.1757166851621;
        Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 06/23] staging: media: tegra-video: vi: adjust get_selection op check
Date: Sat,  6 Sep 2025 16:53:27 +0300
Message-ID: <20250906135345.241229-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1


