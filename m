Return-Path: <linux-media+bounces-9123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294A8A20C4
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DB01F23710
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D71335DB;
	Thu, 11 Apr 2024 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tc3ha5I9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2D3E47B
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870280; cv=none; b=SGcz+4x7FN7+O+UzfMFgXs/AVyaueUSYFWuhGusl8n8OLyPhmSY8UehGCtQ3p0bZQtryDqaaO97HcQpuGFAw+L4NnPaBwW/gjwWo1bJOcYI5XQEGpK34uHKfJ7rbtm7ES8de2JVo0pa3yeMLbchY2WAfk1RCjD8ollv8Wbbn7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870280; c=relaxed/simple;
	bh=jVTlH6xfXoB6FESZXfYYk6pPpl6OaLfHd2BNU/Y9GQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCIqM9tbtJNczkRRdyIQVhv/7CM4LpIihEomM4iPjvil2ut3RCMRjL/wHHWaB6S4mrxOp0v4qM1T7mTJSpmZVQDHB8ZxMnl+Fbg6ioqU7utzHrM2SRccSIvha4tnuehVelJpPbhjyCdNucT/82VAVPlydtSZlMSNYic3Iau/wW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tc3ha5I9; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4365c1451d4so1028661cf.2
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870277; x=1713475077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL6JnALE0FuyaUB3vxEn5mmMwRa1J5olT0hONBuxBN8=;
        b=Tc3ha5I97/v6Oelp3/EyyzXlyuwIlYoEN8/V4u36Cv+ClIxOJ72jDg2dny8L0jIuqo
         M8c2HwBoKlo8lQecZDp6VFv8YIQMxhTd3lioZp5SPHsSnHS725uO1v5Rkg4t1Kq/Y6La
         DHOox7fUZaYMAf2JZiQW3G1omxGWo4EMVyctA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870277; x=1713475077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL6JnALE0FuyaUB3vxEn5mmMwRa1J5olT0hONBuxBN8=;
        b=A1AMxARe9eYFF3BMinCL+54Fpwxkda8tMZ3NOJRj+TFK4FTpDm/CCI4aCcevj8WSlS
         e1jYe+RUZEInjoaLm7T5gMw1MTIIdbs7vMz4mzbEeObIYhMT1GnKlZVxe5kqAzR/uq5q
         yTYisoE7Y6pzcvQ2CbCsYSd45R6Eg47N+GZOftVo84WH2hSTq1PDOUEOvipcMFN75+Ku
         Byx7/QQ1QdplGQHueagG1aoV09F02LinVvNqAbt7TL0DdjX4sohAOilrRQIZWvdqdgR+
         IX12zJAa3ohWcFS/Mm7Ljwm3s4vZqeoTuWNDhub1PyFtn7+TIb07O/7KTP90LDLA5kzU
         zxWw==
X-Forwarded-Encrypted: i=1; AJvYcCWVPVQyhpCP3pudusH7o8hEgsExtFsogEdjaWOttUrfAtNbSDMb8wRstU3vIi59nkIWG9QbXLSol0XQWgt+gw/lt92WJDK/kjnP9jY=
X-Gm-Message-State: AOJu0Yxa5d3mbCpjtFFqhYMBy/qEVcrZEeenCfVjgfqA2b7YpfLSwBXR
	0Z7J1oARzgTQ1WmjEQmPWPUcVRxCkJM4bT2W54V+Lc7MfQjVEP5vA2kqbsDtnw==
X-Google-Smtp-Source: AGHT+IE1U/PUZQGaG+rxwc5mHpekiX8Y0J1WJQ10omBwhTFJ78n8RVlNr6NTsPRSnF/PRA/dbuDuOg==
X-Received: by 2002:a05:622a:1897:b0:436:89bf:5706 with SMTP id v23-20020a05622a189700b0043689bf5706mr270247qtc.17.1712870277703;
        Thu, 11 Apr 2024 14:17:57 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:17:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:53 +0000
Subject: [PATCH 4/7] media: c8sectpfe: Refactor load_c8sectpfe_fw
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-4-045f92467937@chromium.org>
References: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
In-Reply-To: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Anton Sviridenko <anton@corp.bluecherry.net>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

release_firmware() in the same function that it was requested. It is
more clear and makes smatch happy.

drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1146 load_c8sectpfe_fw() warn: 'fw' from request_firmware() not released on lines: 1125,1132.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index e4cf27b5a0727..ce0fd6ace8032 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -1097,7 +1097,6 @@ static int load_slim_core_fw(const struct firmware *fw, struct c8sectpfei *fei)
 		}
 	}
 
-	release_firmware(fw);
 	return err;
 }
 
@@ -1121,6 +1120,7 @@ static int load_c8sectpfe_fw(struct c8sectpfei *fei)
 	}
 
 	err = load_slim_core_fw(fw, fei);
+	release_firmware(fw);
 	if (err) {
 		dev_err(fei->dev, "load_slim_core_fw failed err=(%d)\n", err);
 		return err;

-- 
2.44.0.683.g7961c838ac-goog


