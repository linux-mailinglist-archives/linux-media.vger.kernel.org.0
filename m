Return-Path: <linux-media+bounces-26203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E3A37CCE
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 09:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1090E3B0A28
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0B21A00F2;
	Mon, 17 Feb 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcb+1zgw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FE136349
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779687; cv=none; b=pJpkTvlV9ozep+JFNF9ejroHEW5bLNPffPKaldAmD9ukqvWxumyfmmK9mnrqcjvda5cd3n5a73xHsVOmcISN+TtUb468hZ+ZiU2WvBthWH6epIYfE2QH/ppjFPVFXlCQTKqzCtxOQW/qbCyw8jSTysM0sKOFMAG79JZDYAniU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779687; c=relaxed/simple;
	bh=2ikSgfGf1exOnsFu88z+5kxpMPTxBzklFFNfq0MBXfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1HGdjFrm2W0ZsBOiKkpeXivQ9wpBU0ayl34uOD0aWkN0C4Uw82Ek9eugy5LFOHOb2f9vUH1os4Ba/tD6ez4zot3Q9nouc+/8l0HD+SlADbjfGCM3A2U+5XT8nhNwJEP8Oo5CrotoX0opy+pJLkX5cEEgXbvqFzLpHZp+h8PEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcb+1zgw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso1293662a12.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 00:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739779684; x=1740384484; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=fcb+1zgwh2mXX1AMSgeEnNFcHK5Mf2w1i1Zi0KaTTmM6YjVrBKmIqVF1Dc2OFwd0w4
         OkysB3CFui06AqR3Sk+//iriDKsbGWA5+75okgn7Pd/y6gB1a9c65uhxsQf9QVEjQj+p
         pYLpvTcmk8+JfzbiK74fRLqJ+doBD4LlaNhbaHaFIia4IlSWlkGDVoiIzp9BcKj2lMnB
         mPxFgDXsCMZyRh8pPEGOt6Nsz+oKrLcQJ6DIWl9twHMwuUVTsb90XG4GE0IRFXiGjFbd
         GcBaWkPvfwK2bOl4XTIzLeDeWBe5ijlYbDz/5ajO58lVXKFXPdg+Vdh9BcuDKk3Og786
         gJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779684; x=1740384484;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=HM0bTHKkqMfdReJDtg0LRvqVT0Q+LA+ubXj882VB/Pf0o8myRbP1YI6FX+EjFpCRYo
         0jBhLMvYwuggzyJWwHEZxxgwhDfQzs4WIEals45pqzrAZ0xRjWu47PFBuw4DvVO1Z4i4
         YTs9eebZPlz9zJr995ixhwWLS0/2ZWH+UesEKXgJIko4BQtSiGzlSGSEnsr5a1m6qu3i
         NWs8tu4CPNlr390+VWFoEeN2zYQrFSfev7cCcGuX0h2swfKa2feXfPd8rAfq+5TxF0Nv
         TEwoQl2IqbAY5NruCs1Ed+EDvFCATd8cnlIeqmuVY5FvEswnuNLRyAGRILv88mdPvXVc
         TjrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8DLQewj7EUBql+ZIzjMNnONwEMZc9onLXVD3k1nN59UFK90ryCGLnkEOw7/VAS1HvNQIokqAWLL81mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbsnmm5VYsIfMGKrKky72sxc5TECqteCbGAqwtG8gQ9UgCmI/R
	NNyyugzrmVGTD1OWccsMsDdN+v6QjZ9OMlhkWN3CnUu0aEC0Unw4C2S3RenNzBk=
X-Gm-Gg: ASbGncv2GTNUjywHP4XGXaDr3n4eeMRkO4rcSwy7C8zYubL+HN66y8Na8Jt+l+BGg8A
	sQ8QZyEfvFPZG5PyvO52v0OML2cU6JLJeiZM4Xjy767XEW2h6SQZxEviigMT05U1tcmn0N6nqNO
	yfnoRA/a7ijjQj6WZ4ehwQSs61H7Cgs80q6t4REsW/5pDinpcTT2OpNCVFrfNTpm+h6E4vEQ5Mq
	QZiaA5E1I2FBlZtI/hDlbv3BdRWOVEbw3hWySy8Nm1sxKoTN4R6Vzsuo3R8s8hXTx5+2wzHYru1
	cF5vlRRkQ/M2Md9rV/T7
X-Google-Smtp-Source: AGHT+IFBXYQnvhbaTs+R1+H9kU9Himyc237EX2vSSmBY82Bm6sjx/eueayJNYvLdiOzneYVu+KD0DQ==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5e0361747fbmr10164192a12.30.1739779684400;
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287cebsm6843141a12.74.2025.02.17.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Date: Mon, 17 Feb 2025 11:08:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: iris: fix error code in iris_load_fw_to_memory()
Message-ID: <a1d9e082-a4d5-4440-996f-7ee7e850de60@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if memremap() fails.  Don't return success.

Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 7c493b4a75db..f1b5cd56db32 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -53,8 +53,10 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt)
+	if (!mem_virt) {
+		ret = -ENOMEM;
 		goto err_release_fw;
+	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    pas_id, mem_virt, mem_phys, res_size, NULL);
-- 
2.47.2


