Return-Path: <linux-media+bounces-44990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D9BEFBE1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C18D74EB43F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0842E266A;
	Mon, 20 Oct 2025 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBPTLW5Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20945354AEA
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946828; cv=none; b=Cu6vTePxt69EzsUlCNpche3L9t5XEe4j6ZnlktzauNvlUoiyvDGNiEkRuUJYzyYBkZQzttUgtfpT3M2+RtbqsvHvLGQlkGHbckCSjgkpbnrIaylc3mk6TTPmIa0wtDNRYgM8cQgWHJoEsPBFPye+0iOmVuE97Plde10O1iZQMrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946828; c=relaxed/simple;
	bh=JwLO30rRjM9bQPjtjPEvj/O3H+X2OBrB2JLgzBxJfS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DkYJd97B9SHn3dQy1nL1cGWTmRYOpz5vw/D8k29EUeGNPRUEfDonG+u49GYjc8rHJnxlZNAhdcvHk/gQTKYxvqdgeZxdbHMUbAtQWCU94OnrPR+wdn+p5CvhZxz5vJtOm1ySGVY3yE+KK5ODQ/up0nLmG76/I3RqpA5Mr074gdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBPTLW5Z; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58d29830058so4802635e87.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760946824; x=1761551624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdH/aHJWX8AtmUkNQDRfe8AmPloc8JdVisE1GgEb4wk=;
        b=aBPTLW5ZpYvZ8vph1TDpEcmjZb2SpBoayOQtW4NyWelawnP0W5Oe4DLS7Nv8sLWLh1
         TRlcNohZgZCqdloHks76dI6AxC7XhUhVrz1SvHpV7jAbbyupnpGcusJQCSEXJspe1De3
         ayxIkx+DgwWgXl2RGSjHO6O1HG4VGNJVvvBe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946824; x=1761551624;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdH/aHJWX8AtmUkNQDRfe8AmPloc8JdVisE1GgEb4wk=;
        b=qBIMU57vp5yi6fIhG4/D+40yPG8sKb3rg+k5wMVYIOLrValf0njcOknm8cgTPKAcxk
         1a4S5uHfTsdhM1blN8QJLKWZWPLMUBdYYhZNOgItbAVGH/P4cD59ceCbPWeIJCqmeNAE
         jBCRjjdYEu8KB95eQ183QCE7Ue1UlgIFiCpP4jO1AwiB6TvH988G+5djznavrkrjHqz+
         REPzgN5GrmYCL+GFabaoJN7DuvsnGlJIbxT6ApQBdq/P0u7i002GEI7pMhFodSja7DfK
         fato9WkhEyfHEvA3W3dfaErnrJxxm3TioSRunQe0p4AHcf7BP2EbpcbaTrtHzCsKISH6
         tV6w==
X-Gm-Message-State: AOJu0YzDrIVakCasB8Nx5DK5XaLtUwjNUhrF3jU39ml1plXAHnuECQFO
	QNo3GofxS1XLfQqwVc+KBYjZsxea/39qz0BX8Z8dovn2Bpt9jM3uRds8jN+UtbTOJw==
X-Gm-Gg: ASbGnctSVH0O+/Uoasm6iZdQlAcyn3OCuXb93aq4mbvY/UV+LBOoLQQ3eR4JwxhWqZp
	TFCxrbYgPf6HTQXKYJg9oq5nfpRTQrf3OjJXgD/hB+s5jV/QKB5d7hmH3jpCT28XQVWloVoNR6p
	Wi5SAMkYK263Y0jlmDyu9NkebpVbZXtTRykm4QdnemlSi8P+YcWUcL+NcZxLLRZWzIqhEyFvvth
	bvOgOGU1f3MCQprsrH2c/qhaR/paGDJ0/tkwggVo/kdnja/R2NmdQvYRTORjPpBxg4dYZGo6qOv
	WrhLTxQpXIfae28lLav/Iqin4oQQRPSV+1sJ/uLX0sep/t5Hp7um4St1Yf+nwrR4qVKTm854g1V
	w2bxZulh4lCgAzY2tKXQE9nDyxDkXaKa5KIetth+ll9zPEXdWE570RksIp1f+YTdYuKdlFN1j1L
	D+w/3K7ULCr+grWACQREtCT9aRuJh16PmkEqjiEfol1tLgu/01OrgTHH1qIa52Q84CRw==
X-Google-Smtp-Source: AGHT+IELRftEatZGxbBt4UC4lC7RsQ14Oku0Jj8SWrZA72t9gBWlXbAP1Qxkh5MKzJIEp9Ob6+Dr8w==
X-Received: by 2002:a05:6512:31d3:b0:579:eda8:6086 with SMTP id 2adb3069b0e04-591d84eb765mr4937323e87.8.1760946824117;
        Mon, 20 Oct 2025 00:53:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def167e8sm2284492e87.65.2025.10.20.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:53:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 07:53:41 +0000
Subject: [PATCH] media: renesas: fdp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org>
X-B4-Tracking: v=1; b=H4sIAITq9WgC/x3MWwqAIBBG4a3EPCeoUVFbiYgufzUQKaNEEO096
 fF7OOehAGEEarOHBBcHdmeCyTOa9/HcoHhJJqttabTVykcZIKIOrNFdEGWapp6KsYKuQCnzgpX
 vf9n17/sBuIJyhGIAAAA=
X-Change-ID: 20251020-ptr_err-leftover-1997b3a6e06e
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./platform/renesas/rcar_fdp1.c:2303:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
It seems that we missed this file from the original patchset.
https://lore.kernel.org/linux-media/20251013-ptr_err-v1-0-2c5efbd82952@chromium.org/
---
 drivers/media/platform/renesas/rcar_fdp1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 3515601030eccefe3d979303893c93c85ab0a9b2..672869815f636de25ce08261bf327f156b617a37 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2299,8 +2299,7 @@ static int fdp1_probe(struct platform_device *pdev)
 		fdp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(fdp1->fcp)) {
-			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
-				PTR_ERR(fdp1->fcp));
+			dev_dbg(&pdev->dev, "FCP not found (%pe)\n", fdp1->fcp);
 			return PTR_ERR(fdp1->fcp);
 		}
 	}

---
base-commit: 8652359fc004cbadbf0e95692c1472caac6260c2
change-id: 20251020-ptr_err-leftover-1997b3a6e06e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


