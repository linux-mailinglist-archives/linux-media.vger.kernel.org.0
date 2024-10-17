Return-Path: <linux-media+bounces-19804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB609A2DF0
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 21:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013A41F2482E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 19:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBCD227B9B;
	Thu, 17 Oct 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6v4QXbK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7AC219CB7
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194019; cv=none; b=kooOp71wx66YPkS3+3GEJM+/6QmEWoWVBc2gScXiSx2jAyqtHqkqy0YXlRePf2CkvlEbdlQRCqlcIPM987cGjX3yCv/o/JnjrsnqaEurQn3opIbPkedEHyZUXaebeHnhMI+BQammbkRlGkInr7u2NC2Mc6dLG84uKirNuVJhfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194019; c=relaxed/simple;
	bh=3cjJavFR6NC/HCRHI9EPOyrqnyNGb2dE/RAZTMIh2Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5dnC4hJdpNO8R+v+bfDapqXHtbufhgHJOHEV48JZFJUJdQE9jUbRA7Q6j8hgSfao/gB6aPheVib8EplzQwolhe2Ggql0QLDdkHQXBsEb/20vSnkuty+dCKPs8COal3L2YI3x68hN1K2chHH7UUopgfZacTOFx1o56TdHZ7qnc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6v4QXbK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso169751066b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729194011; x=1729798811; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=x6v4QXbKoA5p/Qg+ZWFTjQ2TBO7yBb8zMc3BLC0JA3KlC5i3HzOZhpdJuHJlVHLBBd
         Wtgg+94A+u0Wr88PUAMmjQ/UstZW4GOq+qFqNljO+jXLMt52OC4pAvz7A/9eAnwBeyXF
         QWaf8WGwqH35H5XidZjcPaOOGPC/D90ldKQ0iAuIHBprBcRmilb2Qra3nKT5lltcZnw/
         nHmlNaZwRcv0/fgY93uEK0ovWKA83+qVqy6QKtOPfVBmtvO/xwGRwrDXTZ+uWos5KRab
         vkCQpY47rz4C5lGJ7tTKizwXzQP0SFbcJXKifaLQ6gO8QN3CnGWVP5J2GnnWSwCsJr1U
         /DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729194011; x=1729798811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=sETdRftGo1k35NfS6wkJxmCK6zUCJw6kx6474DX5wOpW1H3rOEVSChLFl0LiuAINYC
         iNW9rAUUotHE7y28ZrLnX63s2U0/Nnyjq0aSv/PsdSEY5PZ1Ao1qq1+XkFLKxL2DrNtp
         QLtQiiroApedzLfp9+3JwxKRONiVBiE4iGaDZKRglEyzSEHjyPnPSIDiZk17j0EBI68n
         SzEi83OyKNv/RARHQu/BP+Ney/CayNbxITL3qyr2euHsNKc4qCXT3F+0xfzImInAZU4X
         ZTgz5GZ2b6j6EfcYu3n+XHZQSIFNIz1pKhRKhZvH3MpYRpP4bSpZNimtHo1T1WVz++AQ
         HGJA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQxmF3xB7D7RQlq1JjQ7fj1R+f5U7JGUGrZdlWfMYpXCt52bT2+4H2I3qhhtvUnryL8JnbpWGwlDILg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqNhywIzapSe4bzfnKX6ldT2V/yv7MprqCbjTp5aefUwDZG/0
	2mwYH4hiKgdEZU4IqnaahkQTcsb1j2Na6l7n4MThCYwWA6Mcutuaz9MNxBsyiwk=
X-Google-Smtp-Source: AGHT+IGxstbOFapOUqQjp3ZRs6n1QMqDvHLOM3P/WHoCxTXHHg04lmOTKj0g3pfWvKqi+rO1wTNiWw==
X-Received: by 2002:a17:906:bc23:b0:a99:368d:dad3 with SMTP id a640c23a62f3a-a9a34d078d5mr696337266b.30.1729194011492;
        Thu, 17 Oct 2024 12:40:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf7037sm2959166b.183.2024.10.17.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:40:10 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Qian <ming.qian@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, TaoJiang <tao.jiang_2@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: imx-jpeg: Fix potential error pointer
 dereference in detach_pm()
Message-ID: <ee0eac36-3bb7-4bc9-8062-1305d5679580@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The proble is on the first line:

	if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))

If jpeg->pd_dev[i] is an error pointer, then passing it to
pm_runtime_suspended() will lead to an Oops.  The other conditions
check for both error pointers and NULL, but it would be more clear to
use the IS_ERR_OR_NULL() check for that.

Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended before detach them")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d8e946aebba2..918ab12edc9e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2679,11 +2679,12 @@ static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	int i;
 
 	for (i = 0; i < jpeg->num_domains; i++) {
-		if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]) &&
+		    !pm_runtime_suspended(jpeg->pd_dev[i]))
 			pm_runtime_force_suspend(jpeg->pd_dev[i]);
-		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_link[i]))
 			device_link_del(jpeg->pd_link[i]);
-		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]))
 			dev_pm_domain_detach(jpeg->pd_dev[i], true);
 		jpeg->pd_dev[i] = NULL;
 		jpeg->pd_link[i] = NULL;
-- 
2.45.2


