Return-Path: <linux-media+bounces-3368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D3828032
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 09:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207B51C23F05
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 08:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610AA13AF8;
	Tue,  9 Jan 2024 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wx+pSBhg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2702941C
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d604b4b30so20985685e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 00:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704787984; x=1705392784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1COLRupOMO77VMV9Mt2MrHA2R7Q54lSMFZhM27v8nA=;
        b=Wx+pSBhgZlJuHioCpkpiWn5xDJRH2KWmD+CR5/WJ1uT2lIQvwnivKZVLpVBw8Na8ZE
         Yz0aG00p7jbKThfkPV1qt1y7u+ZqBTkvkNYlnP7VGpfy/dNnN+TSAp87DfXT4ygMbAMD
         UCqYNq46EQS/r9bK5kk+G5kFfEqg8rXf3Vu3RRQS/hEGF3sCsVHThV4hWwukgIggHIz/
         5h4Zoak3mWaHX9buFaHLtUFNQNQgS9E/T70tjNVSm+IIJTCwzsRztVky69lp8USEP1H9
         /IoAHV6pOTRuRNAOc6/1yLFAbaYaPXFYpDHx4PDjAiU1C1TeCzNemaB4DcWltzoqU8GX
         FnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787984; x=1705392784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1COLRupOMO77VMV9Mt2MrHA2R7Q54lSMFZhM27v8nA=;
        b=Tc4tHvEqcWRDSv7eyDYBAyFM7h1Gk7M3P2EZQ3iAInZKEJnax0AVPTz1QHn6pr9Kzx
         02wOmAzWFtRdcgqaC9t6NwAEPYcACJ9ozBAjLCYcByeEjAgk1K8gjbt3yG7Z4mEu04it
         fVpihxIQJSAOQJswLRGHa6BOIrO7/g48odXTYm7ZlFQg3c7LbQ44RhEINDCBOjoBKsQ9
         XwbDOV3cjFTS7YnGujWqGHbZmQ6hNjll2R4BP2QRjBa9yCwOD+dydlt3jwcvC1JkaQ6L
         mefX0O2GQuanWT/YLOp4NL8eeYnqEpam+q+ReQoSeAQH3CUtARIlD69LuOmdrbbq+cu6
         YXfg==
X-Gm-Message-State: AOJu0YzssfXr33W0+rkKhMNzuzZ82S3jd/Oc1qm3D5YR+q3uBivq88UY
	NfDLe3du2Y3bm1UyAgHdGHZ2NBNLyFUWHg==
X-Google-Smtp-Source: AGHT+IFh4etKDv5DqxBx1VDGukffIzcMl42znwEO74QkPkL0OrCjUXOmjbqhJ31eGCDvDf9YczBJlA==
X-Received: by 2002:a05:600c:1d09:b0:40e:43db:7174 with SMTP id l9-20020a05600c1d0900b0040e43db7174mr183460wms.27.1704787983804;
        Tue, 09 Jan 2024 00:13:03 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b0040d6b91efd9sm13811533wmq.44.2024.01.09.00.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:13:03 -0800 (PST)
Date: Tue, 9 Jan 2024 11:12:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yong Zhi <yong.zhi@intel.com>, stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <398e06b3-351e-4a1d-b3e4-9c02893ccd83@moroto.mountain>
References: <20240109080910.2859780-1-hidenorik@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109080910.2859780-1-hidenorik@chromium.org>

On Tue, Jan 09, 2024 at 05:09:09PM +0900, Hidenori Kobayashi wrote:
> The imgu driver fails to probe with the following message because it
> does not set the pad's flags before calling media_entity_pads_init().
> 
> [   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
> [   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
> [   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
> [   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)
> 
> Fix the initialization order so that the driver probe succeeds. The ops
> initialization is also moved together for readability.
> 
> Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")
> Cc: <stable@vger.kernel.org> # 6.7
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> ---

Thanks so much!

regards,
dan carpenter


