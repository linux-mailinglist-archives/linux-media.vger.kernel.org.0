Return-Path: <linux-media+bounces-38608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F72B14782
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76EBF3B75A1
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 05:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93216238174;
	Tue, 29 Jul 2025 05:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mefdS9BK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98C1D516F;
	Tue, 29 Jul 2025 05:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753766109; cv=none; b=SiLT7aHaacZN855w8ZctitSF0w5x2YrrblmovT+K85zCs318ZCiOzrbB4BCmeDY5ZLAq1UCuf5TI4ohBVuOmZ9M8EdYiw66vwrBn2LSlfXBJGlTA1WJN1YcHs2Y6RAA+BW0LEPV1N+/hOsCSdKkZMNZCyUhSFyTeXSDiXSVUg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753766109; c=relaxed/simple;
	bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx58D9PgCzvj0rUqi4Vs76wHOIjqp8fvjLR2WwTXlcDEtFikx14lVWW9WqCBUT9nreZlS3sfREljPlundrieg7+DodEmFtFYYOlYHja+TlDRPkyAcjH7GZJ7J00r13jmJq51G8ehJiOSttpDHC+kw7OXPoFCrnxBYmD3SywZC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mefdS9BK; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so1695360137.0;
        Mon, 28 Jul 2025 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753766107; x=1754370907; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
        b=mefdS9BKr0wUiQYo8R8KrwTK6LkNoPA3nE74pmXn4aaKW6MrUGV946k5eeSH9+2rD0
         uQ3ak8t6YSVt2ZU6AdnBDHmzgsmZf7Q7+07oPUtvRl4eDVu8KYGYWwMBWUzxABXNdpVJ
         BQPWv453AXLq7b82bWQ5UkHDbfgDvuUIUvXLvp7y/wtyGa030YA5fHWM9bgb79yaq+9D
         H5fyj720UYrbfdJlgnGWLcs0yH8aqfXpA4YZ1ISIMFrO+qCdRQ1uIt+AcAu18EEHKi9q
         XT3W60LQ9tOa+9MNB1exl5WVw6Kn4rkqJpMD6g7k/dSFMkK5z1HvpMjOwZWxotrWeVby
         Y/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753766107; x=1754370907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
        b=kKwTJ1xdgJKzYYcLHTTvNr/rKcIn/HiQoyaJi9LXFmWd1QgA/0yn48cgArD/kzHF2/
         h2rv5u/+Bhk02mHk2hV9tOSxgSYJATsUooL1NrLD/GiRQXVG7SLeaLgsdvfQ970kGCpT
         anSVR6cRR8wuPkg11k463g78XZpvvZmdWvTmIMIuHwTyzvCmVum8b2IIrbjw3QgRftw8
         SS4xCdxjd+zAHip/clJUkKSIq61CjybEzLWbeGl9DqW7UQITDfYnSQoE9p08jrjj8uc4
         p4qTTPpanSWGHAWbNiIw0Quz4QgRqI0mYLt2jaM5O2dDkcOLiA1rFDj9Aho2waf0ohLg
         dPTA==
X-Forwarded-Encrypted: i=1; AJvYcCVe1C3gVdxB0CODlOH6gm5lozPFu6rXdVT1fwe4tIJoTW1y6HmuPAybDKvsXtQwVzQj68T9F0vpLzFgByU=@vger.kernel.org, AJvYcCXsehsg8bbEiFA7q49775h1jWsV0SR8ojKMox3ndx+nwanbQgPijhBGOJkDwqPm12UHnZ4nTEOsT7AyIyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXmuJB6ArsRZjsWy3dVZjPEqVswPX/Kd8bVT6a7SwLNvFzVfD
	OG6qc1E6ZqXq0s/Iu5AFO+t1Sxhu5TfGj3ZzwKBzbsd/ZWub5wQbAfsQjw39Ucief1oKHC7Nsz4
	XSRXhQYcLx4IFB2HjY0OjsJlkS1LhiT4=
X-Gm-Gg: ASbGnctGiZWhwtuBzyuM8j8PTQU99+nRGbxnbUFXRamYV+jIehkWxEsdPasmgWGd4Kw
	h32caCoZTegcvgcgVr3GYLutHGDMUSr048VhOdeGlsgZfLiWkExzCYJVarYrjfk7aFQEYKfacOA
	ERkIRJSgB2leHXNUpvdB43ohXnpA9Hn9y/fxadTuRKjemMmVtG/zMJoI21RszmNoi1YoFVj3M5Y
	/f3m2zOedwiI+wFfQw5+b17m4p68/LoWxoj4IhRVw==
X-Google-Smtp-Source: AGHT+IFno0zUgj0Aw6YpqbiUSyDL8qKR0XIqSJkgIQWlCwXeHID0sqfEdnRuV7QtINe91KwD42altBqC6rX2oByXIk4=
X-Received: by 2002:a05:6102:3f8e:b0:4fa:58e:89c9 with SMTP id
 ada2fe7eead31-4fa3fa53e65mr5523077137.5.1753766106990; Mon, 28 Jul 2025
 22:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728072822.10730-1-rathod.darshan.0896@gmail.com> <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
In-Reply-To: <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
From: Darshan Rathod <rathod.darshan.0896@gmail.com>
Date: Tue, 29 Jul 2025 10:45:33 +0530
X-Gm-Features: Ac12FXx4nWqm93Dxep0xI7h8FOwPhhH-QR82_j4ozPQ6iUsTnDmci7QL56S-id4
Message-ID: <CAK6+rv4yQ7BsJP4KJWAv0wwvcA4MOHwo+y+9pJtGPDVOs9GY5g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix indentation and styling in
 output kernel code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	jogidishank503@gmail.com
Content-Type: text/plain; charset="UTF-8"

>Hello,

Please disregard this patch. I would like to formally withdraw this patch

Sorry for the noise.

Thanks,
Darshan R.

