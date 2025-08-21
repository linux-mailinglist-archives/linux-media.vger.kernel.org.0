Return-Path: <linux-media+bounces-40608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DEB2FBB5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE43AE5DF9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5012DF709;
	Thu, 21 Aug 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vq+mtYly"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1732EC55C
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784458; cv=none; b=TCgbT9g1ycBJgZjKLeKAgJvdShWj6zyYHX7eAsomk0m/xinfw/XYYAszd9PVXAXZBYC4jL/FsAx4natanyRBMCoFfNL3cP3T9QFpHUlW1OwoaQsO340fVk23z6iG4QdyLOpX5O51e+6hO90VHSqPWU0NlwqmvP7nBJTNsddI0CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784458; c=relaxed/simple;
	bh=zC7C7olZcUe9Z8cx+F7Mg0Zp4tUGSbUZ1HeIK5G/2j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qml8nSEuzVg51J8jmnuRAwUAEi19SXZsEZPrs/GttooGLg8e537fHAaFVOU/5JvN2UBBqa99XSucT6itZxMTirtJy3IM9FuyzpKlgJicghM4uREf77yY8BygVf3uzNPOjH/+avFNfAVwKASgBNHkus1PZ5AKhcwnRqQ8blxMUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vq+mtYly; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so8062885e9.2
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784455; x=1756389255; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3RckpGmvYMoNZtx01O704Cre8/z3CXAKxswJRZI57k=;
        b=Vq+mtYlydc4DJS3Wh8vI6AkjUANpazuFOYPc8s/WtPjyTdYtH5sT6E44B1T44P4o4e
         7n40aZo+lwKT9FQbFjXNSfXevC1u5thmFiv9skaltmPxMJhvXpN3C3CofA0q2srkD4HB
         RCghNBuS9F+xSABmnj1t1Eoi0bQLuA26PJcIe3JuyeBa5NbJYS0hpT62tYyWPOc5cv1w
         EmtVXrooDDIwY9EXNhElfZzFl45IHR91NXPBSESWNxnao7nQXINv7DTxJg9c9yRsdZ4p
         xXpx3xVGZtNYvUQItc3bE+rP/RCpwqXyc+ub3SbUjKxwKfwbibVcj81wivkyh++5/L98
         sM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784455; x=1756389255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3RckpGmvYMoNZtx01O704Cre8/z3CXAKxswJRZI57k=;
        b=O5eDt9Sr/Lj+BKNwKTHAVwO06HMNA6oyqLmh1pHvrQNa8tHgQimi0P1U3zOfjBQjmP
         vOiUi5NmOqkGFCuYBalt0zyeanBrjQEXTOQSJOj89lI3ttGoxw3MDqyKrCN48OpM1DSX
         1OCwBA7A4foM+Ou0IAbbjR4waEmUUevpxBVLFpfVXgadQXCvvKB5Oq6/2LHT+Jh06MZG
         0YsBwvvEpN0S+U1BW4YV8cQJja4FgjS29U3wlOcUyNQslF6xdzELT5l9Vtp7UrV2TzBH
         xo+p/+bNZdRqr8bpmD+t7oyyS7RRLPnZPoOt7qEowPVhzCzB1KxC1ID1CQAb5mGLKG0A
         967Q==
X-Forwarded-Encrypted: i=1; AJvYcCVw5xWHYRxp5kBdPa1w1w+NCBU741QrtVO5LuQqdKasLOeGSzpaCK34qm/bc2BoQV014lIvyPUqC6VHjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQljWH7qY9zOljMEL8FjUbjE6Y2LXM6TjI4slj6YJ7Mky6iPfa
	5jcs3QM6OJB9Q65hkj/RUNlF0sBCDQBH0vk1WKe8P9JwjHxb5UAFCa73gyy7ddVWKhQ=
X-Gm-Gg: ASbGnctImCMXEnmZB816GpXIjXCqmeWiux/YXjxm2RhX+O3pb2XO4GpuVg7R8k2vbas
	KwGPZ0zIKsohTOztkH/na90Gp5si0P23Q+WA6FCCsqipnqySG5+Rig+1c7ico/kuKIB4xSh4jkK
	OnRQgpzrDgtOAxkWNMAlUZZl46NdowZU0Mu3kQZPe5n5iRwKGDlQsb51F1jjbH/6pTekTaLCgJ7
	R+Z9YTnLxeqptByPNu3VppxTlLvuIuzBPpuXjx5bwAlmlEoIsrD3f4VLCyrnEqz/e4WHslkUPMn
	NwDIp3B/9cefj72wASbSx3GqW/aLRy+apSoJLQx1olrgkdKqqMC/+JvTqrr8La/97pKBBbXcvCw
	PNVn5+EdWphYxKqQN7F2QbBRWJrY=
X-Google-Smtp-Source: AGHT+IHiR4UgXlDVbxv/WGTxxHwGZcE5uF0kFr14Nzs0vJdVHWLv9FD7z21HRn/vBRYJKN0FFsSjWA==
X-Received: by 2002:a05:600c:458a:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45b4d85d764mr20115275e9.32.1755784455144;
        Thu, 21 Aug 2025 06:54:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dbfe2ecsm28935915e9.13.2025.08.21.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:54:14 -0700 (PDT)
Date: Thu, 21 Aug 2025 16:54:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/3] staging: media: atomisp: Remove unnecessary
 forward declaration in gdc.c
Message-ID: <aKclAywjKpHBd7QR@stanley.mountain>
References: <20250821133521.2665734-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821133521.2665734-1-abarnas@google.com>

On Thu, Aug 21, 2025 at 01:35:19PM +0000, Adrian Barnaś wrote:
> Get rid of gdc_reg_store() forward declaration because it brings no value.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


