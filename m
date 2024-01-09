Return-Path: <linux-media+bounces-3362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06D827FC8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 08:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA945B269CE
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBCF11CB3;
	Tue,  9 Jan 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB91eXvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B346C154
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e5280a33eso93115e9.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jan 2024 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704786681; x=1705391481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajIAvbvfoHd2Dm4Y0RFYgsc64SgXUokhIDDglANw3bU=;
        b=uB91eXvQ9DqbJDGAuLh9wKvpBQiND/qT5YV0Abd3i4snCQTfv9CjrMGGBhpSq0nuaG
         qDGzqhfOVU37BrVQXWoYOLs1IpmwOpGSn0gbDJUeqPuVSBf1j0BNOvuMh4BdMQZBK4lr
         ElG1aG5UKoNwAHH7kIeKCreLBi0goJGQYi5IMkJXQBBldo3HxmokXAyXkD73hcQgZXtK
         Xm6uhHdn+/RbWR1rO4n9U9XPshBB+MRwKZ+yIqrpjpLg0A3tFazUwn/jyhcXCT17Nhww
         5nBZyRR5oOklFd7gr6N25DO2EJmihmKaTwMwtEAp6JpsG4nUSAoROmQkeOVsbSxys9Nf
         x5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704786681; x=1705391481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajIAvbvfoHd2Dm4Y0RFYgsc64SgXUokhIDDglANw3bU=;
        b=YLayhKsaxu2bfFpyvJQJM7P+wqcKFHEjMQ6Tt+AJjp2aRmsA/ScUQlIRddSHvMIDWV
         4MvPQaKe8Z1jOSVAY1PJE10KP65+ppTuXcL0semEmbN1uqlcFGmsoNbB8740vDyT7ui3
         bTH5pYzbc0BgmB5VeJbK7I7k5tZ9zGTxigalsjpkpOLBbIuWya9FJeJWet13+ZLnDRs0
         h5kW2yeDgwz7HHDmqZwlinW7WD0Vavy5mApv7vG88ReSUip6v134N6fV8ox0Dgnfz6p8
         FWnUKMOQkRftJ0imHkW2Hgn/uydRy9kE+o3cS15oJUFStw7fXJBKF6ouJXE6+ISmT4a/
         htBQ==
X-Gm-Message-State: AOJu0YyNjlMqIRfyl1RpY8nAfI+bghgQKjomIm/v6hoNIezWSOol6OR1
	SowMMVgO7s/9D7FzUlhljtCT2SPnQaopiw==
X-Google-Smtp-Source: AGHT+IGjfcsvgCctKIWthRavB2j4sQAq5t6BFCH1lgirHrvd5/nWv+jm6ATm5mMLTYU76UWU3eiycA==
X-Received: by 2002:a05:600c:5491:b0:40e:44ad:7222 with SMTP id iv17-20020a05600c549100b0040e44ad7222mr159229wmb.8.1704786680743;
        Mon, 08 Jan 2024 23:51:20 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c154d00b0040e3635ca65sm13777111wmg.2.2024.01.08.23.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 23:51:20 -0800 (PST)
Date: Tue, 9 Jan 2024 10:51:15 +0300
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
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <68ff6c83-b8c7-4bcb-9b94-a33ab83aaf58@moroto.mountain>
References: <20240109041500.2790754-1-hidenorik@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109041500.2790754-1-hidenorik@chromium.org>

On Tue, Jan 09, 2024 at 01:14:59PM +0900, Hidenori Kobayashi wrote:
> The imgu driver fails to probe because it does not set the pad's flags
> before calling media_entity_pads_init(). Fix the initialization order so
> that the driver probe succeeds. The ops initialization is also moved
> together for readability.
> 

Wait, I was really hoping you would include these lines in the commit
message:

the imgu driver fails to probe with the following message:

[   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
[   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
[   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
[   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)

That's what people will search for when they run intio the problem.
Could you please resend a v3?  Normally, editing a commit message is
pretty easy, right?

regards,
dan carpenter



