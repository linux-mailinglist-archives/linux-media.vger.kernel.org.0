Return-Path: <linux-media+bounces-35656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A25AE46A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19971165948
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEBE25487B;
	Mon, 23 Jun 2025 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfyUCN2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F336253F1B
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688222; cv=none; b=opURdKgvp67z40MJJtZLgW2cTl1rS0ISumL0UOYKljrtsWSvf4iWr4wgNWy9PLw7Fi3XNxNhBETTqeam7V+VI4Xe2Ryr+oS6RWZAp/h9Th8/4uWRVlpAWOarOxZOSRU4cHS/pBGa6GJQd81rOtcvi1a5Nf4kBfN4sMHOmy/BfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688222; c=relaxed/simple;
	bh=4sigOS/urFG8brAKKfv6zzu5o31axp6lF2JzLxHf/DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXcW9v4WevKpbokeg/URDf8Dpw65YlegnwvzgHleeDPbniy2UMW5Bpu//edNk+ef5ZjAnMaeo40ipH1vEZIT88dxmKnen65iZx0fnqs2hffPrICpzCBivEq1bdCuPSeQK/oXv9fhU0fNnJarfesPhI/InnpGBYRB77Rn4SIvcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfyUCN2Y; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-735a6d7c5b1so2548521a34.2
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750688220; x=1751293020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=GfyUCN2YnkmBOxKHtEXURHv8upunjtrvcTe8akfvokanGkwcvAKyqUuYaSm2QNDVyK
         X++qOv3InLQ7MXqfIrKJWR4iZpPRHDHoafLo8qzQcjEYA38KBjBSj2Hs4kbBUIQovbd+
         EPbEoxfHvkaLM4KgC9p8U1Ow+fSlhAhR6GYZmvVvmQLSjjcDn8Ppf8rKyYWSI1/f9LmL
         6xwoOZPlABYYMNx6LATVH7ack5HJcGlRBq+ADoZ84XZ0ni983IM6N/VoM5DG5TJgPaay
         6b6XPqbXjS5Yi0futCyaE/eafMPwcbEOJ9mgcu1gKsQrVBdWVhKuqk1s8CKBCpZi5U1L
         U0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688220; x=1751293020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=bk94GTEXkLm53aMSGCqGpynR218O66iO8iTNcMCOeD9cqU1kNn91prdbHPFePR004x
         5IbQwfZtgWrH7fDlv1uoyigcgjoKLzXff6D7vm0Z5Bzg+QHPjG1Ro/LRSp1G54Bl7d5d
         YlAIGaGE1QfwEUEmiGQEP9PDtpzc7oynjqx+W88UVDqc57HvOO04GEnAEr7SrtJtKeWR
         U+ltLuq/EodpIc6MO8kQT4Dg0vhKMYTLNBOeB9WOjm1RJYHvtLg0m9C/zwuVG67xeE5P
         nRsQKJyRB9SD9WxlHmOPusyVXeRt/b6Y2e4EIwv7fjnHMWMdmaU8IAFDDbzkBMKdcxf0
         qY4g==
X-Forwarded-Encrypted: i=1; AJvYcCUCujl15HJI1+sDjuAe0RkHiBS4nYqvn46F23PKoWNiGhg9C5/GU1SKd3IwCvFjtuYQEDLxd64efGhJHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3DAtD1AEHQALVnFNAVPJBtV1xUTDq7wsBAo5n+ywZ21L4u20l
	hoN9h+GqqBeljtgOA1V4H1qp9Wsa+o/ggNJ3zDdGpe3k8qni5eusVqRNNGgtGcce53cUKYw15Hl
	0BsvB
X-Gm-Gg: ASbGnctOZvydyuLYF2RaNiAbeflbDfDbtq2sUSVqbKTfF/G62OX5ttSvYSGMSSDxG/I
	LTkxkEtyrLeTtBmhe37mNPVpkA8tV+TlzZEKLHAGmKm8bSqjB0KbdnGMS4U6WKqRH2PeWbymc6d
	jVePISq5wVggi18mQ0pXyzvjBVZL59aujNVSF2KOXL0Gp0dNPVuRVahvu0od4wN24gtDeDJ+X2Q
	gg1fBceRq0dPrFTfhNNM7tLzqJqmFhwAp6i8ZopwGeyZwElrJIkJlzX7lYrFu+TQLbMCip3ZZ/2
	BYFAZwPVyOrwKv3SMtbCUPDixpmMLueZHPWbIS6SpS+GxyDEqPv4JGig1k1ygSAsrwfDzA==
X-Google-Smtp-Source: AGHT+IH/W6bUwoQ/oCDqxzbkBFhhtZ/Fi6LgoZ05YDqiaOhVb1dp7z4SKY54nEy+7+CedB7z2NIslw==
X-Received: by 2002:a05:6830:668b:b0:73a:96e5:19b9 with SMTP id 46e09a7af769-73a96e5a6ccmr8122051a34.2.1750688219746;
        Mon, 23 Jun 2025 07:16:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cbb5ccsm1418904a34.58.2025.06.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:16:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:16:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
Message-ID: <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>

On Sat, Jun 21, 2025 at 09:24:40PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 21, 2025 at 9:30 AM Abdelrahman Fekry
> >
> > -       ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <= 0)
> > -               return 0;
> > -
> > -       index1 += ret;
> > +       offset += sysfs_emit(buf, "type pgnr\n");
> 
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.
> 
> ...

Neither scnprintf() nor sysfs_emit() can return negatives.

regards,
dan carpenter


