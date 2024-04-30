Return-Path: <linux-media+bounces-10408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC38B6C2E
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EAE1F21B55
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2A45479F;
	Tue, 30 Apr 2024 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MS+/3cno"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F335405F2
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463495; cv=none; b=NpIcipkV76oYWV4LNZJ64zVdmDm7XlfIGlU4E/VpZgiNjVeIP2oqpUW0HxXGdRh2rdB5z2K3klZ5iivPbTHYuhmWKHHB5Djnb2Bjz62lKE02mY+kmF+4EjteyhnUBJgpvgh51nGf4S+JdCN/epAPKqTuSuyo4gSSBtsujgNhE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463495; c=relaxed/simple;
	bh=Klt3S7xZdueUFKS1wHESrOilkdR+oLUPuosQlgJLtQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7a3lQNJWEzORuDVlpJfKFUClOXFjcdEd9uHOlB2Kbowhk19VpWZ+BTxAyzHxCKobmRZGCYSRON2rn+B4bqkM2oA6ulCR3hW2E9AhlFTVLgvGoTiNVVnB0GTEwHtNVuS29rIEvPZx7W+KHTbt23pMc5xp6It4euLw5g6tf9r+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MS+/3cno; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4376e3fd7e4so30913521cf.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714463493; x=1715068293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyrqsw7hfapafht5q6ARwJmOBtyDG2HfDsUwyULf8rA=;
        b=MS+/3cno0/pf5WnMUBO7mL6WZuNvK3C/r4FwzdttZcebGs0rTXO1HI3DcSgYMgWG6g
         sbnGNHmkoxjfukAooBSOK0GgyCgTwJxNx5Lcn9b5No1A22LU4B5rLwfS5kQPXl0SZLpW
         bKbh40nAGBuYHktm1BBa0y1c4XNBvw/4Idgks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463493; x=1715068293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyrqsw7hfapafht5q6ARwJmOBtyDG2HfDsUwyULf8rA=;
        b=Wu3Ylzu5osVXXAV8yyoCK182QxdM3Cf9krIwbw5f+WgUftlrYf4eRaJ2QzPTyAE68+
         nS25w4flex2MchFV+yW9NTpSawaUqtO6W1CBGrKZWbyMKrTqEv/jPEYPl9QyrBp3V3zJ
         9T8OPganVrhtkgiE9jXV0MfakGRK+MynGep3xDuPkpoqw38GjO+TAkzlOUsPe5YWF66+
         N+b+CSx9hqyT/rrS5dyirccSzBfqsausWvKuMFXVG0NziZxpXREDSHhElrTZiCRgbEUd
         RkD1fAE/wfkYxGtY4sJNpxw+mSzLL8pMdM/HrJRiWGHUHMLejOlFJ1kFO3tWHFnXTrYX
         6ofQ==
X-Gm-Message-State: AOJu0Yy3jKtTnlMLbCaWiJ+MzgFY+Q6VLIaJmdR9WKXOdGmxte1vZe7M
	Ct3HSmACL0fi+jysS+s7P8KrKKrk8sJhbfSc6KLibRH2froAL4mtsq4TUzKReg==
X-Google-Smtp-Source: AGHT+IECfMNRuKAOBTGNP1xzyMsseRJw3Hkb0lRny7MABhW2k54/n2V9s46e7u1H3Xer9VaXIy6adA==
X-Received: by 2002:a05:622a:4d2:b0:43b:c4:4188 with SMTP id q18-20020a05622a04d200b0043b00c44188mr4041838qtx.41.1714463493327;
        Tue, 30 Apr 2024 00:51:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id z11-20020a05622a124b00b00437b4048972sm10634547qtx.18.2024.04.30.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:51:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Apr 2024 07:51:27 +0000
Subject: [PATCH 2/3] media: bcm2835-unicam: Do not print error when irq not
 found
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-fix-broad-v1-2-cf3b81bf97ff@chromium.org>
References: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
In-Reply-To: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

platform_get_irq() already prints an error for us.

Fixes cocci:
drivers/media/platform/broadcom/bcm2835-unicam.c:2664:2-9: line 2664 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 2a3a27ac70ba..b2b23d24da19 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2661,7 +2661,6 @@ static int unicam_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
 		if (ret != -EPROBE_DEFER)
 			ret = -EINVAL;
 		goto err_unicam_put;

-- 
2.44.0.769.g3c40516874-goog


