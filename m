Return-Path: <linux-media+bounces-29319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B825BA7A2F7
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 14:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 727A37A4135
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 12:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824D824DFE7;
	Thu,  3 Apr 2025 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zU5uvTML"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CFC24C664
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683794; cv=none; b=g0mD0ut6aowMGzQZb7S17ECaxkB2gSIThzn14HTwomT34Xx0mpYtr+2gmARlSBAcksLtdxQL/9groKB++dhEvX7u0VPmWlemgihoTSqlO0xUt4NTcd6YBLdUXr1CKL5Gs8+gVNvIWgIHB386YInyPDkJ+0dyJ2owktNI3DnqteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683794; c=relaxed/simple;
	bh=EC+jRXJYLFQfR1XxsI3t01FqkNMfotqtYy85kAcqX9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeAI0mbp5qLFc98g5w0oXQkWFyjyRdtkrEe/lYIpoDshV69PDJvAQ2bIXPSt1Y/37MnCFy5JrqZFt91H8gBUeT5Imn/7D2/sai5YHpm71HEwkhvKv4ihjDUKGZnMLdx60vwKyaccfWAev8Bs4ljvcW/o1YZ9zDk8wrnKeWpE0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zU5uvTML; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso7927175e9.3
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743683791; x=1744288591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=zU5uvTMLBrKxLHI21JB8z+lFe16YB4/84QOEGh1jo+MDV5tqntQQ5Sdk1Svxq310w4
         6TVDh/aXZ583ziNfklSP6Noj8SypGxgpA6zvog7npxpBVt+ezaVxfHUjmk5y7hfQsptI
         tJt6mwqQkzIQg7ecK2qtZjNYh2UtB9PDXJONVHaUcGJWf7qR8L0NtKcoAKUHKagCwojT
         th5P3bYcgssta8epMAQiFepUDctEhbDVI6IxhM3ORL3Qjp5srurZLbWLy7c7FRsCJnIZ
         4D1Bc5zBiLpz5pb5FxyiX6uBOiLA/s8vRT5XzwpOOsElAJb4O25b5tFHVNrMeaZmZb4o
         Seqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683791; x=1744288591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=B2Th78J+mqUMpBixmhH5GLG03LE/pEzp75BsDbrhWId8vZ2IzAVyLk3QsHceTRDksV
         zwQz10t1ase9BTsTvlfQuO12aBzm913z/wVnTjWnQJw5NMwtoG4MpdTo6NWdanW2wm6D
         GUXTud6HZ/UjjNrcUGpe3E13u+BkHkSHXx7twt/Hxq6z25vHyxTfE7NylgcjNq3OElCV
         H/4h9/Lbh6yM2EW3TitJaHoPD2BHVOgKU6HUfvoAk39h2JCP8xkJhYQjSG8yk2EL5HRv
         d6fmKVUy3BuhjgGFJKjWqpnB7BIyu1KAtZWMJS5Jg7xjjGjYDFi3rmxzF9WMSe/BMrCa
         wx1A==
X-Forwarded-Encrypted: i=1; AJvYcCWS+8ySUW6MQU5tzY7QnUNbAr2XPNjPOCP4BbXaZca+tgNr2Z7FJrz6c+K4NcVGbtalgqJ5uS4zbQE12w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHElayq6XFhuQxeatuM8x6amQEQtMIMnNFWIPn0adfwizbV1I
	/jHGZoE21W2pH1Ht9NU7YYki0NfMqbl74PXuy1nSfo2z5WyZeUPWhK3jreP/uoM=
X-Gm-Gg: ASbGnctAXAMBTu7bjifQrdnoK+pHH75tvhA1dOzE8Y1LVLWLdHxZZCft8JA/aYYl00o
	wCaIHTyW1c2nRgVOieNartxupDo2Ek/FfGdOy5vsLBdCvaynWNGTNjiutKVa1PalwgQFes+k5b9
	kY1wOEaKfn8SuOMIUcXDTZ+kGK76K25VmvvWDQug+G8QQKSbaGDQiW5aVd6FK1pYo+rhO3izG9z
	LUiHB2iX2xzr53fjFoyhNLbBCpJ2DuHqgr9yR6VkWAYZnAHzHeQDaJvM0YtbT9bngj+Lv+hLjix
	ItarshnpDTVPUxBwZxTrl0bdfTuiUN+867csECbN/k6WhMZlVw==
X-Google-Smtp-Source: AGHT+IEm78dzW009E77mGS/XMpvwRtJc+F+zhJbHZ/MmX0Htx6azwvDUIts46v7UeKdoeXtVIBNeSA==
X-Received: by 2002:a05:600c:6dca:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43dfa59a802mr128749085e9.33.1743683791239;
        Thu, 03 Apr 2025 05:36:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34af0e6sm17579015e9.16.2025.04.03.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:36:30 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:36:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>, linux-media@vger.kernel.org,
	andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead
 of spaces
Message-ID: <Z-6Ay7T3n1vXfAO9@stanley.mountain>
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
 <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>

On Wed, Apr 02, 2025 at 05:36:31PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 4:50 PM Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
> >
> > Replace spaces with tab to comply with kernel coding style.
> 
> Still 'tab'. please, capitalize it to be 'TAB'.
> 
> But wait a bit, the driver maintainer might do that for you whilst applying.

It's not an acronym so it shouldn't be capitalized.  It should be either
"a tab" or "tabs".

regards,
dan carpenter


