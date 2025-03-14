Return-Path: <linux-media+bounces-28214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E8A611A1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F99188D3D5
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251A11FF61D;
	Fri, 14 Mar 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RCYtp0mS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0311FF1D4
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955986; cv=none; b=COnP0pJTut/AWBXz875YCo6P3QYIUsOGK4UgyvJO2ufLj0CB6Pfuoz+JbKOQ1NXV/nXDAcvcX9BmgET+MBKmWPHftW60X8FUgswe6xOeXXo1++EL5R9uhdD2WCrdWj2SGYU2eqL2olNBbNAJHsiHBHUqnnSgEpwpnWJF4d72rrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955986; c=relaxed/simple;
	bh=qIm+gMdvupKqwS9Xu6DPAYAhkyp9bxQv0TScmBCRWAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SstJfT5wXWhIG06LlsAaEUKRhVreSb7FCBqdNLmAjrKcNZzGMKo2kiQQ6ZJZRnQMOxBWCFVboPBBQEM+vH1eplQ4LzoXo55h9efLGeXtXUk6M+9r3TksXS8ejxd2Rc1sYBLN8KROmI7R47aQKpZtVeQFJM62TdGfX0nR2+CsT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RCYtp0mS; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f7019422so18984376d6.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955984; x=1742560784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au/TjH3+zjUdDPhRJAjj0/vsDAjgHCF7V+hbXHtsO9U=;
        b=RCYtp0mS9x/X7IZyj5FN7YikfQjSjJeHf6vCeZ3tA/NiMLUDE1Lo2k6XeP04ZCTugI
         X24ByXRWvlESBucoirMdqyErHwDZezhfrUFpzLDtQFZzNxe1WpQQTgzoETqgYpxPkOEj
         vYtMmlVqxOMpPTCHxFgnJ8BernwO87Ze9mIvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955984; x=1742560784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au/TjH3+zjUdDPhRJAjj0/vsDAjgHCF7V+hbXHtsO9U=;
        b=J0PwGSWGDz6YNjFgmqK1b4FV5KaXP/H58JjXXlwYyMVGqklTZEcUlw9TGUufANkstE
         +TAXbeeTyy8rQ/lk0cq6eMSGhR0UOzBwmJaTVh/ADFR/4Mskb+Gu7oCsh1KwXoT2rU27
         OfcrLzSlyU4u2T2+6jQGogQegwyRS2ImuXj+WStjNLSnIkWDEg8RkcZp1sTiBWStb1xV
         CfvaIHwQAoKJd3hyUP2AXnab5V9WstnpvoA/HIB7hs6GjWsoUN1I5BvUqx8dWwSUrGb+
         W1xTMiAAEmH0A2xI3+zaERWaweGevm+B5DpJ12q6klELNNrQYX3OH8yd5YFNw22UealQ
         fJeA==
X-Forwarded-Encrypted: i=1; AJvYcCW/smX5HtOrRPgBMPY81lYE8xnfIevsfGcaWbNldBr8XTVc5CPDMY1Dxaw44CPA2FgMt5cEfyYFYjM/aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vLfNMMDitFxSHSsaPEi8V8nsFCoRM/zCsnKKUv56P2cwOPtf
	/92/9dJzpHtH24tqgGWeLsqnuddf8D7daklX0PM+ExEo2jSnOqhhowhDf3tSSg==
X-Gm-Gg: ASbGnctOUAalPnf+476GiGkWixT/BWVCGZTDHRMBnkTkxaIMqGVKeY3wEGoDxP3QU8c
	uKJuKJF+wfBin7+UVrLvtXqclGa0+U4kQsgWRdLiqtJUG9zKdIGGOB1F47MAiJs+A64UibHrG6w
	HH1udiu+adU61pANahlRbRzwbcl1eyPZWEAKnRWUTRImTQwd7w3thnZg9QtLZJBVo+pEGlEokr9
	khR2uoHVTiJy8PCPZacCPipL3e0BZuN+xFgx4i7nXiiQebGSB/sib6VZaN2WtydyaFcTxvoIEli
	6M+QFuhIPize637DwsObQTbWxrNoTqKFUkOv2HwzpwuA+YQ7bwTtbzlOVk1lAf1jPiQD1n+IYF+
	w07cDzf60cyKGjrpuJSE2dQ==
X-Google-Smtp-Source: AGHT+IFZTx5jtkzAAYrXtZKetF00+L9PUx7D4uoIbbsaFALw34ZUTKZfkspj9EXg16feqafXpXJ96A==
X-Received: by 2002:a05:6214:21ed:b0:6e8:f945:ece with SMTP id 6a1803df08f44-6eaeaa07a1cmr27714776d6.11.1741955983780;
        Fri, 14 Mar 2025 05:39:43 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24b8c2sm23031586d6.50.2025.03.14.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:39:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Mar 2025 12:39:40 +0000
Subject: [PATCH v2 1/2] media: vivid: Fix requirement about
 webcam_intervals
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-vivid-fix-twice-v2-1-dcfca4053704@chromium.org>
References: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
In-Reply-To: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Since commit f0b4a2c037c0 ("media: vivid: Extend FPS rates offered by
simulated webcam") we do not require twice as many intervals as sizes. In
fact, now we have 13 intervals and 6 sizes.

Fix the comment.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b166d90177c641eed8116e791daeec8822973ff0..623ba1e5e54791c0ac62aa2f0fcc3dcd444c873a 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -33,8 +33,7 @@ static const struct v4l2_frmsize_discrete webcam_sizes[] = {
 };
 
 /*
- * Intervals must be in increasing order and there must be twice as many
- * elements in this array as there are in webcam_sizes.
+ * Intervals must be in increasing order.
  */
 static const struct v4l2_fract webcam_intervals[] = {
 	{  1, 1 },

-- 
2.49.0.rc1.451.g8f38331e32-goog


