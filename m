Return-Path: <linux-media+bounces-50258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B153D0697E
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 01:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBFEB30255A9
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 00:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0D11F95C;
	Fri,  9 Jan 2026 00:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCPxMkmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF69249EB
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767917379; cv=none; b=jBvKdVOcG9e5ShIi8CkmKadf1qjH33mj28KBbkYKdNvwbNIRbDzNpOcfS7gQ8CiV5p7pcCMgNPHsre1ifJmeXlSQRdk0iNtot0fRZY/Dr5wLRv04/JnWRJEQSKfQqMcfOxRWut1T8cebuJ9Al5pzbkFH6r4MMbiEsl5cuHAV92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767917379; c=relaxed/simple;
	bh=tfrXfpFvES9XZjLIOw7ts89hAIvMyB8rFddr9wCACfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQ/XYJ0EG3JzC3AksIpWqOLd1NgQ7IJnU0SQ/OjbqCPj0pukZbFYXuJENlJmRB1s0843C+l/xY3zdKdL6kTjhKtY5gIBh5JIzUakFPS4adc6hXFZrOmQncgDJ3WR70Fi/By23ZqoK1bigl7QbkiNTXXBOgMDZLRqA4FW5DR/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCPxMkmb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a32bf0248so29658196d6.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 16:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767917377; x=1768522177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=jCPxMkmbtsYaq/v8UQrFl4h3XYCyVJlkKLXAgZpnkN8wPBfSykXRmK+sGraT+Y1tTX
         Pwvc41aLcS955ahmtIDo+gi2R3/t6a3BzjtoM8E0m+HnJZIM93/Ckt39adU7x0THTPMS
         DfB7Kt+J1twta+1DdlUGtJW1W/mlXKi0jDKmOeZum17/lCXZFOEUxnyhOEk9LssYqB+V
         Tlt5UD/PPCWVvPZ9upgv/gDUOoCLpaEGLLsmycXlimazalx55HIRr+IeDOT2gQLEfD7X
         erQGW9wyt12Vsl8+woXlrcOHmQOr8cCY+g5ITYLWMFLzFZcedb7EwKpVoi4SV2trwgbs
         vixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767917377; x=1768522177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=mc0KTEOtGLjGu9Xq8iON2vJjSbWJGO+Wn3eC46U6ybor/ercfjUeCarit6iSQce3wz
         KjpY3UUyR45nmfzbQEkYHeZIbWcsBIL35e73W7EbgG4FANwc+KpIkdgLFocbfXrj8ZEb
         u4kFqJXN73vAfdDoQCts8G9VW+I4ugWvBkEe8GM09mfoFzhUCgH7QZREa2huDcTTbFS6
         jPuYlzBUE48sa9ny/cy0FvJVEQOwwc6HcdwNlvJHvEkbukgNqf6PY3twbMdnUZH/wkUn
         lWt4lfQ6VAikgJ1Ppm4TYngzdGoFIIUpYYeM/jF3Hkf3N1NKIGqVWNfdhk1feCE+O9R0
         a/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUCzt195VGDRb1A2aUBhahBwU7jqmbvscJjQcuh1B9sQ9aWpTi0LB5B3KDYzazkGV+5CGKevRsuP0TU/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9mwGl1hktePo/jZ6ZiLf10s1boPLHfY2tJtwSgwpQct8vL+H
	1i5gy3k2bckNkZmEXrVxL044Zb5LBGDWBorE/ZeZesfv/CsBO0A9LQIhlYvVRQ==
X-Gm-Gg: AY/fxX4eYnr3lPltR6yocB4gIaAzExK38DyDCLvhOlhgyAWCdSCJK9NwAdX/aJidVwc
	TidAMJMjMaBnarVzWcZYvOaHIjaJDlUydiFb0keyXfSGhBnSxLp2gutdrQDrvPZ6a0cqpGQv1+L
	kkX+2x9o/5hwuXhTrJ5QCaHxf6Xwr/kINDhAAY2t74Qnhe66tj53IMcRaAHGEl++tPg5sF/Apna
	Qb2iTE2943eJhishMD0jLoXrQIOxZrsGiz1r/VuKTUm7R36HjgcMXQc4Uw5s8WMP7kTWELwsHuR
	wNtCL7/0UtiUWvnmOPdSnE6HCPCzDjd2nkEQ/FkMYFLruXa38j9Oh94ZYXTNteVgIpNE1+d/3Eg
	TFUklDW0iia5rQAtWLjPkumrnhWVA7XIt1CQabjKHM2M3O3u7YyW/20wfLNxAXVkILmsmSsYxME
	SQeKxx0kXfzhAGS5cITXtLwCZq
X-Google-Smtp-Source: AGHT+IE53QNgO8H5ekocStQPoh1dkomyApC3B9GarKSN3SFKH4LWIoibjHSscmdkAjc4QCj5ErkGzw==
X-Received: by 2002:a05:6214:2347:b0:7f5:eda2:a54b with SMTP id 6a1803df08f44-890842e1b55mr117237186d6.62.1767917376936;
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234ca1sm62882266d6.36.2026.01.08.16.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Date: Thu, 8 Jan 2026 19:09:57 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aWBHVUBhPa6iZ0ib@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
 <20260107-aspiring-unselfish-dogfish-963c1e@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-aspiring-unselfish-dogfish-963c1e@quoll>

On Wed, Jan 07, 2026 at 08:35:25AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:40PM -0500, Richard Acayan wrote:
> > The IMX355 camera sensor is a camera sensor that can be found as the
> > front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> > 3a, and Pixel 3a XL. It already has a driver, but needs support for
> > device tree. Document the IMX355 to support defining it in device tree.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
(snip)
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Read carefully last sentence above.

You left some comments after tagging your Reviewed-by, so I was unsure
if this changed the tag:

- https://lore.kernel.org/r/bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org/
  "Ah, here, this obviously was not ever [compile] tested."
- https://lore.kernel.org/r/fedeaca3-5549-4d57-8f13-f0ac58d1e4d0@kernel.org/
  "why do you need data-lanes if they are fixed?"

About the data-lanes, they are unused by the driver and can be dropped
next revision.

