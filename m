Return-Path: <linux-media+bounces-46117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C7C27F1C
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 14:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D714018D2
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 13:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4420A2DE1F0;
	Sat,  1 Nov 2025 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwTD3xXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08841E520E
	for <linux-media@vger.kernel.org>; Sat,  1 Nov 2025 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003526; cv=none; b=hPnUe+I94PYtfknwG9Hs+k+ZBUGToMN0kLGIYh4cAHPD7CBAZc/rbom0c9Ca8ACGhvqHMTXlH4g/4xiEb2qYrmf/OuA0DYy6d4HUfK8mJiGfmFwvCz9GfQKT/GaFruiuMF1JGi/FQe/IyEdalYq1JM7i2i+ZkBAenxThrZVeifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003526; c=relaxed/simple;
	bh=iyHWDRHqIdQqUjQt4Je8Lh1m7HHX7UTqjbeJ5D3U40M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwJVuh2BfcWPq8Yfr1QL6QFYZQ6eoHhL/nNnfEhsaEEyapP5gupaiUL4HPF3I9d7LnxhLG+142NDPPBEf1huZm14Fe62sBzd30gz0RnzkZRR20t+vCSkK4q5bwPqTVOYrKZQ6ID0wnDS3rO57n1lgVTSSuUzMFZsJ7Vd6ot3ZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwTD3xXO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so23518595e9.1
        for <linux-media@vger.kernel.org>; Sat, 01 Nov 2025 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003523; x=1762608323; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=da/X0BAO6IQgxLa90hj30nT8tKzSWhqU8L60WSbzH/k=;
        b=iwTD3xXOM+qxlMwWMd1K2KaslvSaC2jOgu+6rXoKd1XUWfG7TVc77nbuEY+b7HBAMu
         JKr+h0Wt9zqLhJrm410eVEHBoxykkJP1d0bUobLlQhkppRqFDWvw88Gh4xbqtqMXx03G
         aIvzHW9LHuW89OkuGIOehSCaz1WDilq6IeXQBup9cygDZqZAOF1Y9NKY3PSqpfBKZj9e
         0UoUqSeXWwMMfgCobJEZ55Uwrc8UW7ns5pzW/kb7i4JADTXmaW4W5Ax7EYAG9/KCtiXH
         c+tz4v4g6RLUnNOy9HSuXayj7M3mrEK50oDlbZrbTyxSQybRqdhF01MEAaIgLh/E2TGm
         oxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003523; x=1762608323;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da/X0BAO6IQgxLa90hj30nT8tKzSWhqU8L60WSbzH/k=;
        b=Bjiw0i8ULhZKN3Nn8r3h5d35neUXn6y9cHtxQYXu87fIxDQh9rjBS4drpDuywu2sUz
         WHLJUx0+rS8vkLVM9SygrMLq7GxKQPvRJW9qdkAgXzZhcSgHy9OAsxPrUUEvpcSKcaKb
         gOuQMZRY3/8ZAOh6KksoqI4WXz1Mg+M/H5e3yJvQ7H6FEJhIsCp3mosJIGOUSXaWpfuF
         lkiw7KMbENVos/fVq3dIYgX6PsifcZpJhvJpJuVdolPM/VXCzKsBNmBtnH3SxOW3ci5f
         KiDgaqbDbN8Cs0gvjgdLGxmJSGt2fyykiMsvd6hWJ/xsZkqSkpXo1EkSE+1lfuiOLfYX
         CbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnQ9/ixvxVnkvZE0y8RGSiAu0HoFQ4arOW5QlrVF0QwS71/upUow7liUpbMpOUkDf9Mp2eACprOTFntA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4ThuxP+d87usyb9FsJqoEO45iPkT5ChkO/okWbsS2Ta6rmpo
	TkzTmUWgz7fRgMDb1XxsoBcKfu9XJlfZY9JXrUYyMYtU90JPVUWg1+WkAxgddiFTvtKz7qoeja6
	7RlRV
X-Gm-Gg: ASbGncsd56l7rraWaWxYEBz4/gEjUTYYLVnD0bowfj6yyxuOinDxYA1EjFyzs5/Kvi4
	EJhRqxJH60wBM7DHHpBTB6dd9E7cdJnSBIp2cNnejtZIX3c8MVIqKMisonL2nbOlFQrgcfrGESk
	vSweB2d5ZDf6SDZCdA0ciRAFgJOB0fhmtGR5lxHNkJ9Yu5tEAKhaOwKO41ShoxujNQoOHCllDeQ
	MVD+5rUW+AS1kKU7CQI/IBtKYmg4OYxzUx02gyXvqGkm7Ztlm2qP8dKb4P9W872q9ENdaJRXWdD
	mfq9crngTQzwHghgaCoOWAgsQrpq6Lohqb1hNaMcsUZaPuXozsmRNjgC7peHj6hS/MEQRtipKBs
	nDPSOUHt7+G5hVzvlTiHVFuzh4EUz7hi2Q7o5CUV7391002vbba0YTx4clTlBsFFQweqABir1Gb
	6ksIHhDodclnKL80sy
X-Google-Smtp-Source: AGHT+IH55pTq1fGBGY/yaTd6Zj2Bh1mij01mMvvtUN4wVORgA5e25w597fEIJ18x5AR1pis3PFBXAA==
X-Received: by 2002:a05:6000:2910:b0:428:56ed:c68e with SMTP id ffacd0b85a97d-429b4c3809bmr8835430f8f.9.1762003522937;
        Sat, 01 Nov 2025 06:25:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c55dc6fsm47662015e9.14.2025.11.01.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:22 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: drx39xyj: clean up some sanity checking
Message-ID: <aQYKP330_-4LBa7E@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Delete the duplicate check on "demod->my_ext_attr == NULL" and delete
the unnecessary curly braces.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 428b31e60874..57bd5d53339a 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -11350,12 +11350,7 @@ static int drxj_open(struct drx_demod_instance *demod)
 	    (demod->my_common_attr == NULL) ||
 	    (demod->my_ext_attr == NULL) ||
 	    (demod->my_i2c_dev_addr == NULL) ||
-	    (demod->my_common_attr->is_opened)) {
-		return -EINVAL;
-	}
-
-	/* Check arguments */
-	if (demod->my_ext_attr == NULL)
+	    (demod->my_common_attr->is_opened))
 		return -EINVAL;
 
 	dev_addr = demod->my_i2c_dev_addr;
-- 
2.51.0


