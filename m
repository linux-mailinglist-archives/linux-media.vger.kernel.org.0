Return-Path: <linux-media+bounces-31379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77754AA455E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 964429A3FA9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AE821CC56;
	Wed, 30 Apr 2025 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpV55Hca"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CACA21C19A
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001668; cv=none; b=dMzo92VgY6oY29YSonVRB7M6hvOFawIpR1oxkqQdc+yyJWY4Io7xJCdtFv2aW+2JL5XYAF4qMkDHdlvaEf+eCtZmA2gAnltgvDbf8TAeMmOMSTvOy7aO0nil5Hmcl0bTvOoZcvl7AJD9jyiB5OL2Qb6pLQM1WAvjP6J7wffyNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001668; c=relaxed/simple;
	bh=pC6366U9Vxi4MCVI0rp1quj2Je4SIGb4/739P9X10sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVvIlZkn7NT6RSbTNJZ4j3Um0KI0JVGct/BtxR1KMZIzw6GBeWXtTcUZM2pmO+sBgX8ccXIt/SDRpaTsm75ZS4/QVUzxh5uJ5m1aS4Tc25qjMSxJWntxD9zeiK+54ED89Os8IVzydc5q97w25mAzNnHJu11UqE8vpgV0hTXKaWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpV55Hca; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so475195f8f.0
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001665; x=1746606465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSY65Em9CZe+eeM7wzETHW6baTLUML3bJ9yO/W+LGW4=;
        b=BpV55Hcao8LJx3USC8dXWGy0jZY0dTNUf1NOyG77FbAJZwFSVYrF6m4t7Sc3nxMOP2
         gduwBHbW/2CIdoEnPpxOviBUC08AycRD3smxY79htAvGhCls9vg5bYNM02dQ4c+kCyqL
         YbF9seQjC8WDwilrb0kiB5bPlpfVTxt37UkUH32drVyxhVJTS0hVDg44MVD0Z3NAekAh
         3ThUhBstwF8QJ5fvZxy8fZ0WJzVtsM8p1kX3v5deaoIfjeNYYpGu0ml9QInH8h/aO6NP
         AAudKhR7m5zy4UYrlQ03GQOnxHC4+wz7v5Jc1bIME6bm5hqQJOYkcFxLuJxAgt8Ykg9S
         +fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001665; x=1746606465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSY65Em9CZe+eeM7wzETHW6baTLUML3bJ9yO/W+LGW4=;
        b=oM5Qaxdj433ihB6x4AJvSDtrO1/TjQ6we/XrlnWhNYFQpcMqTsymi4403xvE6wIhLh
         uuibg+cZY7qJYWVzRmaFw1Sov6I4fn7iQuG/DbsdUlR5gbv0XYoUYuwGyrlcM16IIoyS
         SsctFaWQjoRN/ctGeIoBlY1hFbVDqD3l3eNnpg61mgUbX3I3wgSq6KRwejI46VRF59Sy
         MUrqlBNfx6QnJsajbvmHr4FN9wO0tkQvjSw7t87p8JzeVsOCLlzJcBlEOazwPuDvOPK2
         +mOCZiW8NuEnoateA0VNCOrknlGm88NOryErhZgj6ArV8ckU+1b40aPG5oKQHB2plqzu
         a2yg==
X-Forwarded-Encrypted: i=1; AJvYcCUE2Q9pLhxObeTJs946FmXC2XDTp+mA4LuKgzuyPS/GBKF8gBNyBCEZeGXig+obV6xkQR1mCQgWOusZUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydGwQMI5pMBOn99Pklkkd3D5gQCo1tFYY8ts050tQ10NYBVKZp
	S9isHtO614tX9HjYJXW0iaGr1QGVzQRtCqNu+2DR/ho4QAr2U88RwpQSg10uUEJ2L8nwNqw2vIo
	E
X-Gm-Gg: ASbGncvO0KqgbRM52LJdKPBOyzidUw8OZ5pvSjTeRplGY1Exs+wa2gws20g+JUPS9jj
	Oj21ClfQ0rKnu/TPEjurhSz6C9I0+8eM4Oy8q5ySWA8TG/WD3sRvqYpMR7HyViWvmhQzY2OeoxE
	wx7f/cqbUxuUlcRNUulxvtfCna44VyPS9AANkU8BiRqK+waJLXhMGn3ostsuWJYgz0mRl1dZ5dR
	OdHGD2Q/1/pIuXEuYgl1F3rveZbyEQZO7bUl8S3Z9DcdBFrxaMbtp8U44vCxJQsJHLX+fIguCP0
	J7asPCCckhq7DQutLt4g87kY3nlQS2n+FMSvQ/wYbvjzOA==
X-Google-Smtp-Source: AGHT+IHBFA+cH5958bx6/B07wZ/+XLQktMK13x4OjzkahXEnks5zyuH0RW3+E62V7jkfN4hmL/NqQQ==
X-Received: by 2002:a05:6000:18ad:b0:39f:cfc:d520 with SMTP id ffacd0b85a97d-3a08fb52cf0mr1465639f8f.15.1746001665462;
        Wed, 30 Apr 2025 01:27:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d67esm16491272f8f.17.2025.04.30.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:45 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_rxport_bc_ser_config()
Message-ID: <e9e8df2c7ee2fdcad0d97562e40572073de02d9e.1746001540.git.dan.carpenter@linaro.org>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>

The "ret" variable is not initialized on success.  Set it to zero.

Fixes: e2a3b695bc5f ("media: i2c: ds90ub960: Configure serializer using back-channel")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index cf104461b9a7..ed2cf9d247d1 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2133,7 +2133,7 @@ static int ub960_rxport_bc_ser_config(struct ub960_rxport *rxport)
 	struct ub960_data *priv = rxport->priv;
 	struct device *dev = &priv->client->dev;
 	u8 nport = rxport->nport;
-	int ret;
+	int ret = 0;
 
 	/* Skip port if serializer's address is not known */
 	if (rxport->ser.addr < 0) {
-- 
2.47.2


