Return-Path: <linux-media+bounces-48740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E34CBB44D
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 22:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 816F4300BB90
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 21:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89191280329;
	Sat, 13 Dec 2025 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk22ue/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86249284686
	for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662762; cv=none; b=c6F3VCE0NU4Z+4DOh9Rn3174lVqTQMmUa3OQbCGT8cZtRd975kOTjvkeZMSgsW2G82761UAudMNElttIdA0Kc0jcqXriu5be/URmQgMWrn4BQPSUWUojBSnVlTfzL6xtQaR0oEg3ALXqepP2gF4n9cjh8op6EJkrxdXDXGcdY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662762; c=relaxed/simple;
	bh=MOrv8Z468pz42F7Vvd2hP+rc9j/1X54/GPGCIfRTwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HODR9DMJnmm467+G+iXQ3mcuSdOgycX240lToZl6SpIy9EiA5tbFD/sH166S9y7GQ2L5pn4VJOPc3yIZql0/eG24KfWHylm7x9UVMGhlpSOmbbWSW0G7x7t/sSEoIYtO+SSkOfzDrwSqOMyUk/fkJWng1NGoj2/I2DtAfhsSpOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk22ue/E; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8a3eac7ca30so166711485a.2
        for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765662759; x=1766267559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vmpfVrhKRCeQv0RKMF2hPkD4G5WVFs8+IoJsGJYwCQ=;
        b=Tk22ue/EZPyVUX+ppacY8yOIiMdBQwT5vrLi6BbR+l2HyDp3K8OsXqTTvRq3W9HfWo
         rAIgeiJKdtVK2UsK2t5lwPPlTAInbJD2WIhcrJ45X7kKuwZBvvI1/85Q+f1g3sY2ijty
         NlPlXrbJgnakpEFHuhmF/GD7wF0pSNccpEdTPIGP+J5ldhHcafLAU9qY55MuptgIft2Z
         3p0gqZh9mnNbR8sEbDJEKhRt5KlHKzkEFREMLlFCMLeODDVXyoGN6APvmoIIhoeOcMzd
         Nomddglb4/NW0Kqdhqj3lYLP7SKJ7CcGCq5nA4gBYwXPlVLlyrqrgNCQBa+5Nc3wgQ+I
         QGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765662759; x=1766267559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vmpfVrhKRCeQv0RKMF2hPkD4G5WVFs8+IoJsGJYwCQ=;
        b=a6968XptNSyFtu3Hvpq2IfNbuJ/turPgvrfoeE7ju/Dy16mlBNqhdyTeoAf8LNhp05
         9XUXdHYsogaQHXr4CrMDsSmSidHZoOOtDOFadlJgukC5UZ7Ek9j8xy4iTfwEusaDdRET
         /CC//jzX5PiolBjdgf80GoMqqedZLn+LybNlXBoMP2XYYvjbuulPnaEsI0On7Lyr5C1X
         13OrafHBy3xumnBGsYR5OcX6otTdDrGLXZkk583A5wQ1alxxTBYd7SMqZSjUeHVEtqko
         nZdNKmtpHZQrNwvHQQh6R1Unmx4FjwzCftTzYqxy214WbxtMjv4WlNkOOYb/ygG9KVB9
         Yzzw==
X-Forwarded-Encrypted: i=1; AJvYcCVxD192OOadigNxwHs7y654CGf2ytHeOXheDcIh9X+u0rgBJKbSSZtR9u5JASssL9iwvEN9ns1cBeL1Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeGNy8F+5jLYbEIEyWxrUW12XlFh57FI4T4oIvYgZO2AHzT7o
	mcaCV9fqF1bWKSUN6kM1eTKdV4SinQdgNr1+68kCeuOJjhhTCfXJjqic
X-Gm-Gg: AY/fxX590V4qeo5ZHcK4nxQ6wFC5GCTuNEndHFuKyGmGfsUsKreM5q4zv91MuUUHPYj
	D1JKDUfN2v+GxmLkNTKR8jwwAQBDIMe4kqyZlyEklzaAF+qdLYzsCVE4HfQejyqljXmKuB5LVZy
	PNnm18pZ00s7DGMQwHMWlhkcud5cbkSVcQKRUSmoTXXx+TsfjSI/5hDFP1WNK4uQtPdEjHfrhTn
	Wjx+jB52ZlpLAKZX67zDw/5K6zELgVSeP049VW5X2ZmVwiHvtxNb8IaGyfT56JSeGVzD9ljSGad
	nP+1cRK2aX+g3+rhLvUs2avCL8vGT/tFAM1VmRPjQayYsmF2E3zTkzWLTupM3GMKWBcp89ehJse
	1hsUNaEhpa6MXWziGjoGcsxf/pdj3+6gKXNapkuDkh4ru9BlSjNvVoxM7NqyYj8jprhDLHvEWxp
	Z4ZoB22s4knKUHWQ==
X-Google-Smtp-Source: AGHT+IHHh35U+sxh3+imqr2OZ78va01JS9YvuTHyoO2ahBYtY2IepXHUI8Y0tIiK43w8obVA7scckA==
X-Received: by 2002:a05:620a:4508:b0:8b2:e179:febd with SMTP id af79cd13be357-8bb398dfef4mr1038221585a.10.1765662759216;
        Sat, 13 Dec 2025 13:52:39 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5c3bd4bsm744693985a.32.2025.12.13.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 13:52:37 -0800 (PST)
Date: Sat, 13 Dec 2025 16:52:51 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aT3gM5eSxjNRDmRW@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>
 <aT3eUlQuwXptSFGD@rdacayan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT3eUlQuwXptSFGD@rdacayan>

On Sat, Dec 13, 2025 at 04:50:07PM -0500, Richard Acayan wrote:
> On Thu, Dec 11, 2025 at 01:02:49PM +0200, Vladimir Zapolskiy wrote:
> > On 12/11/25 03:48, Richard Acayan wrote:
> <snip>
> > > +  reset-gpios:
> > > +    maxItems: 1
> > 
> > Please explicitly document that the reset GPIO is active low, and make
> > the correspondent dts changes.
> 
> On my local copy, the DTS already specifies active low, and I haven't
> changed it since sending. I'll just change the dt-bindings.

Oh nevermind. It is still active high.

