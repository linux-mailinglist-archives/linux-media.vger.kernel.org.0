Return-Path: <linux-media+bounces-48661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30742CB772C
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4841A302532C
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 00:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D36214204;
	Fri, 12 Dec 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK22BrbX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AED1DED49
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765498991; cv=none; b=peDHPoMNEhU6jH1kyqWTn5V16RCOp8QGNkRemZTjZv6aC/tmDKPQACKS0uHG3FHya4s5QlKfjcXjJk4rBtSy5hg2Y/jMQCj/9NNo7OFQE8Bn63NZJGZybUgD8VDt8UFXFEbk49+ihG2FePTZHNdME2+1tuijDxVcHaaNpkQKsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765498991; c=relaxed/simple;
	bh=VJs0HdDUTreYqiEPWEYMgLI1QKUAgzDJ9UQWKudR/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/eBbEtnogbrX+azGNMwqoHbeb0zqC82DRH9KIzf0D0JROBvnS/6/FwwP9/j+w3OqLja60f8gCSbpF7IPUN9VZaSqs3+dJdCdervfwIa4VjP3nzCRip+OSTnecsmG/x7IH6ESLcBLoSndwTGSN1fok1w+pnRiYmHWqQChCV1q44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK22BrbX; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8804ca2a730so8676556d6.2
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 16:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765498989; x=1766103789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekAwpn4hrC8FLTzr9F7/ywbCXH3vu/SZcsviAIsYxIc=;
        b=YK22BrbXV5FHxPeIt23zE5zrZcTEt2AnaIRgDN22h+OOV//u+pj6H08XpvQ1i1ph4+
         hJO/0jveAc4JH6mTHMN0MKywrEvVa7f1WZaS0t+bBH9Qlj1lkZKrhqcJtSivrcGIO2Jb
         iccIMbASuXSws/a+XVouHcEPAmbO0Y/vURpZo7JXGLs+PZQbQIa7MD89khQ7d7ZrJEnj
         UfP5PE8B9EEfB7mB1W5Tu2z8UKan+37Z6p+8dRldg/dJWimBYxIIQ4AUkWw8/jqd0aUV
         FQPYXyOTgdlTeX4Ei8xvBaVGPLM7ocrGKfR8EKledy7G2+s0NzlXpdmHcRmK4IGjk8bd
         Y8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765498989; x=1766103789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekAwpn4hrC8FLTzr9F7/ywbCXH3vu/SZcsviAIsYxIc=;
        b=ZXAXWgv3wq5+owcyUqIPYgOJKRpfk1VLBGfph9Ftk9pbvj9D5+nD/Qe2FSWEZtJaAd
         9hlAVGBe9hMacAOTNimXZQN7BCH+UK6uL0oyUMNVLfd/WUrCHtMonTrjnX80IIAOsK6U
         On+L2WkYfClMA8bwTqbq6Dj9Nd25udFi2JdiavPc0e2M5kvTV/JlFk6P6Y7POGX0uh1z
         dsr4PyaTvB2cJneuSBAi39ffa9HBXh8k79mYCO5Zmk1BUaG+6Xd4ocAYXTm8qL3gji5l
         bg30En/kmG7vUrEshifaL3iEOMJyN+zHNuMMFbt+rXA4N4ZEROggV9MWUVaygqNhB5Sh
         4Z5A==
X-Forwarded-Encrypted: i=1; AJvYcCVRV9pTndyC0S2luqfBoBbeYd493y0TiLeRFtb0yDsorQanNQQhLIvsVhVVOdmEPeTHAQMETo6nIHNh5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNb0GZet2+GdMXp37KHbTjCqdkwFJaK1NN8PE8VH+cJSqWHpk
	SHOgThecrlJMOAI/3wNmWaZtymLTsH3V+O+p45WCSMC0U+544a6p1bsP
X-Gm-Gg: AY/fxX4/Zmyfd4krZUhiL/OmmU8+8Ql6J9qeSLjeDNNdhCV4dsUxi6OXrOYGjBGmDcG
	EEPtmZ2/HqI1pt7dHSXrjzcjUDa8APbrAF6lN3KtdZPne9NxLBqu6Xe3mzoFCWJPQ8LV+wQqo4t
	Z03R/lpxk+7WgDKglV0dOwgReuUVSgsEFZHlA3nNQzJ5Lr5cmXydwp4PaS5eT1sxB7g7eO6ingk
	YCmvlU39Eie+cLEQC7sRmKF7oBXb2sbhfpnWonRU8Ll8D8SnDAAh+N4GgTVSQ+768hxXq7F+5Ci
	1YEl64PfLe/P9pe3ctnRMtd/EGl2tRIvs7BNEYfNy8pC5eJ9zehTSmmXPoLhI6Fy3etdxompRDf
	hrp5TOdTYX23HG+iqb9DchQ0etvhRwd8rvc3NJEjPAtt2mSFU7Y2ED7EH6EFVRvJrp2QeMn+BbS
	u5i+Gy0+/g+z+GFA==
X-Google-Smtp-Source: AGHT+IEKDNtd1pW2MAhHOKkF8+slYPOoo67H1JhA1doiQXfU/rc0lm22DiXFt1BHYTZJO8wln/CpTA==
X-Received: by 2002:a05:6214:400a:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-8887e12cacdmr8674496d6.51.1765498989224;
        Thu, 11 Dec 2025 16:23:09 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef30a2asm34637666d6.50.2025.12.11.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 16:23:08 -0800 (PST)
Date: Thu, 11 Dec 2025 19:23:22 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aTtgetS9Hx5MeBzY@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org>

On Thu, Dec 11, 2025 at 06:02:51AM +0100, Krzysztof Kozlowski wrote:
> On 11/12/2025 02:48, Richard Acayan wrote:
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml
> > +        unevaluatedProperties: false
> > +
> 
> Ah, here, this obviously was not ever tested. Heh, please do not use the
> community as a testing service. Missing props...

Just a rookie mistake, I forgot to test on my smartphone which has the
dtschema validation.

