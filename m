Return-Path: <linux-media+bounces-21775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229879D547B
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 22:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4481281ADB
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 21:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A41F1DB943;
	Thu, 21 Nov 2024 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2mxlRNz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1FE1D47DC;
	Thu, 21 Nov 2024 21:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732223149; cv=none; b=LOFq77+muxsTjv6Y7Zb1tRHBpwjAuy7eLmzv6rwAVh2Js40qC7C143vD+XRlEQ/Pmy2VLNlm8MgwIF5Rjne0ZQpv0souub6lXSl50h8miZgW0mPcv5YuSkafKjim4FW6vAlC9T4LUMCCydjNBHnEzX2YzJAuALJzSkCd6hr9+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732223149; c=relaxed/simple;
	bh=E/5sdOL/jkUCbV3WEL3b/0KOfVk/fXbHHdo2d90g7Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BaPrtcEdOtA3OVdXYxBOAbuDyR+un0TLWSYeLsdJYhEuWUWodOUN7AvmMsAhGqYnHRweI/mCjqISp13MeGGkBYS/SjwiEcHnbxSBJTnjlxH5bBR+2kduMhfBKF+TIvgPBJ8/k8/bQCiqEbrmv5DW3u/OIbpfXOET0i1+HRUBTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2mxlRNz; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d4035f2d18so8914966d6.1;
        Thu, 21 Nov 2024 13:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732223147; x=1732827947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=G2mxlRNzaXdlx8fbRQR2TECVkNVsPx2FnmeyCulGwJ+hYeFcAA5mghjuBNwZfqbh/U
         lP2YaGuQ5X20xmkYOmg2cj6e/MHH5aJ0+ImaIfqaOvdK1dVf13Ri0wYxtLDYCrtraglk
         3kA0Bn+6bIlS0MLvFSldWC9TaqXGkG2cPudIpVE++bl6ej8AYb4l8Gtohc4wBORj65q2
         lZ3A+rP6cbiHOnN5Fyn8+P2LsNqaxf/w1iwAtlCe/wmg6K424GP8+bA3rd44nU5K6+6h
         3MF+UGHhA/8ZSMWP8xKHRom1oWvLRmuPBXHTuXYxycRiwL0ck7UAOZqP2gekmqHDIw3e
         HegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732223147; x=1732827947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=pbZQxM8/a+RbfIA0w2SPolNRUEYZ7hmqtPAxPuwXrVAobK8BCdTsrwzTQv6/eab1E4
         Z9AjxpCMc0QLk+1Bv2OCPs1rxS33l67wI6QaLv+iCA71Bc0zrg8fj6GOWa7DhIWwgSio
         Z8ftVi83YOjso3IxNgxAN1SZjGLx3th452OCuNqwAFdpK57GSaN9ueQ8bqtCIHzi5K1f
         DKtsxDZGwE75k0XmWbOvw/+Ctd1GLQbYy725Mc4bskUb86mSCpGPaEJah+IMBFK/L8p5
         U2mTw+iROEhWeIksUSANgbI9PDTGcG26Gv2xoON4r9ZuCYL/59pHUvS0VcRztf7xeq82
         HJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPZLkc0COQohlGShjvQ+dNbYNhtfKQT7SdCaMxM7CsjnDA8irIKwNh36YkdDoviQYxwyPrlqDIrxY2L/k=@vger.kernel.org, AJvYcCXbA+GDZHnnafEYWAYAENDdPTz/C+R2sKESVJC52zMpPXeRB8/TpGUD+rWAHeqVjXwZ08i7YnqgT3OdohBcp24TVFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYjvWv5RVrjT6wju5lCK9t9npuiuCrNflMvx7TFkJ+CKHDiN9
	towOVqXrOlLGjnkjaGjBqYBKsiCUYb0q9ZQY7eG6j2cQ24jBKR/k
X-Gm-Gg: ASbGnctXtux+8/WxOmeSCiIgrzq8rfI8b1L+03IMW7hJTuqK6m6q1WZW83JGlGArjCv
	W4KmQlWsT7ezA97s8gJ9BU1013g19WowdzqHgrsjeOZ82CeKrE/Ifirs/ojPORakh9wG1tn0mG4
	LtGrF6tW+oXhH3bv161s+iVoqMG2mM+SSkb0oEf/VV2Pdho1PjliaAuML1a2IjGoNPvRk/dZuQV
	U/TbhZMB4pJik5AmeZze3Ecp8EDhMRekcQ3kmoi9c0FXI5QPb5uBiMFCSAI4EUQzUcO+wU1
X-Google-Smtp-Source: AGHT+IFG6Tff0/6lSGz4mSGoJUTTqX9fqp3fbXsR49SyMJyG9/0yxbeEdav0LyDICHYyhjtCi5eHNQ==
X-Received: by 2002:ad4:5c89:0:b0:6d4:35f5:1f98 with SMTP id 6a1803df08f44-6d450e9899dmr8796626d6.24.1732223146558;
        Thu, 21 Nov 2024 13:05:46 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b4a11dsm1658506d6.102.2024.11.21.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:05:46 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Thu, 21 Nov 2024 21:05:42 +0000
Message-Id: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


