Return-Path: <linux-media+bounces-50183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C9D00DF2
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 04:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 913CA303213D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 03:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EE4280312;
	Thu,  8 Jan 2026 03:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu+/GE6g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700313635C
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767842896; cv=none; b=RBcQEB9JtCs+IGsftm5IUtyxBte2tYoiBtZ3NsjCn+lFwE1RHzJ5qloCiSOlNxjuTv3nrPLxoLlMR8ahO6gwWnyIiQ4jKncxNRqEx/UR1PkX4X+c6HVwpsuO7jAxrij0Uy6GDHw3nfwPshQbSy3W4cXhO3V3NaOXqunPPnBqX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767842896; c=relaxed/simple;
	bh=VGk454ttZIdzpsHMCIxZieV3Y0Q+sd63A46nmYZNR9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoDsMj1+3x4NQdRWs5sj3d2g6ewJtF8rL5I3wr2IcB/NOItduXo/+oc8Xlcu1YhgJWB9m/XRnEcU4M2LAfwSNoVeS2KFcwZ21K0yq7zA19ByoDnxsut8kmNtocI2uXBfk31T2dSxV/2gCZ5+bLw8Vkjr9rrXzQ9NuYGwxFtGP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu+/GE6g; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso28566601cf.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767842893; x=1768447693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=Cu+/GE6gQ/VWFSZ9sgXaSJoBGq81/pcafRxekyHJO9dCL97P5+wmyQRXqBgvxYfxnP
         q44CdN0zO2/yaPYCJDfXCj14+TW56YghiERkOgU0jnQ92eRqh83O/zeq+AfiEEWpg1dV
         GeoRO0sqx4JrAwpvz9KyDJx46eHY/c4Rauz9QZScu3MklURpASuSvT1a7UBAsa2GW85+
         SoaGH9xWnghMyLRiSqAuz2wJAFC9Gcbh8s12s2T1Gz5+Njjk0JNEGA8fToN+a+yIYY54
         k0NpRzIO0uVPDva8HHznlQFZPUm3S/alDj/TqUsfm2yd/xgXYLRbpWgFSEVkeSBZGayZ
         QICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767842893; x=1768447693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=vl/7CxYXPBVp2a5xYgVMjsCchLCbtp/xdZHIWmvmhXH7FSXx7thiHReqjsroIq5W7p
         +QNYsuq+2j5N5nKyUhoWSTYeKQ3UAecBBLqOcxzZPMmrQAkc2mh0jdpOoTNb9YvE86hQ
         k89SD2b5xLGCcn8XMoQQKQFwSirLtZcINEZ1yTzCTSF1DjFGhzjK8AM/r/kMkGUmkIbQ
         Lh6a0WsjuCqXyiuABtYKIxl49MoK/DEAoobR4GwTBTaZUMFYMAks8r39qPz8EgWtgXj0
         qmTRCcb4URtcGn/jA8YY1xwoRugyFjI6QyQwltEAYfGI50vJ9AwicZH2mRA4FM+NOOmN
         3r7A==
X-Forwarded-Encrypted: i=1; AJvYcCUW5csZlByPYoxDcTt6U6Y8NSLdJti/zEc0KtTsIVWjf1klp/ehybRCcWYMSV2xCIjL/zK5PpnfDCoA1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSCoMJLS0dilpa3WMQOBVa39vS+RcnbcqL9u2qOxnIRefDRA6
	+YyA0tMVESr3MSgJ6H6HOwRDo2Z/Qg4u5qFORGjsRlTL0WUrcFMGBNoT
X-Gm-Gg: AY/fxX553//+CCkhqeyxs0hq5xZpHafn4YUiPAylkUaENcosoRAaL1Tuc1rHBq3Hjdm
	+PpaT8SaxjbJLNC8JdMyFfzB65Jct7Xo8IHHz42td9EXv0OHfmYcg8PX9T+AI63FNNaR6i1nieT
	xaxnN1PZY8WTnuEZCxk/RItND3O8YrRBzOSnwzkyvuYbmfRQOfkhJV0+h7HIFEM3fG8K867XrWO
	rEi16YH8Ia5g14vibI/Aa+gS2Asw7EvBpADcHeYa+u2fcL+hSLgxmfU6N/mFMP88upJgY9Hk8vZ
	SAQDis0nAnirEkLcvVqbvFqm9ZA4NL3XFwiJbACQVO1jdzIYTr5/06LAAEgPpqnaJmUv9dWUB61
	BzdGQUTrEDmlg5ul6NGqV94HE8TQ73qjUaLiJlKAYa0IOG8Qwh7EfGXR81AV7uq8mzW9PbOUxRp
	xbt/rmpkAM+rqDZw==
X-Google-Smtp-Source: AGHT+IEjSoUYkF14Ssyk5oRE7aJzB2JoaALD5N+ldr3oo6bP0R6LXqMtXCQczf07mSQIpjrUbtFTyQ==
X-Received: by 2002:a05:622a:1811:b0:4ee:213b:3391 with SMTP id d75a77b69052e-4ffb482f716mr64003111cf.20.1767842893142;
        Wed, 07 Jan 2026 19:28:13 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39950sm42659431cf.1.2026.01.07.19.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:28:11 -0800 (PST)
Date: Wed, 7 Jan 2026 22:28:32 -0500
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
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV8kYJm7nUM3A5jf@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
 <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>

On Wed, Jan 07, 2026 at 08:34:29AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> > A device tree compatible makes it possible for this driver to be used on
> > Open Firmware devices. Initialization of power-managed resources such as
> > the reset GPIO and voltage regulators can be specified in the device
> > tree and handled by the driver. Add support for this so the Pixel 3a can
> > use the driver.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> You did not receive such tag. You cannot construct tags, just because
> of ... what exactly? Why do you think to use this or other email?

I interpret "NAK" as a request to stop working on the patch. I assumed
you wanted this for process reasons, since I didn't specifically address
your review of the reset sequence for 3 revisions (v2-v4). I can't go
back and follow the submission process differently.

Original complaint (https://lore.kernel.org/r/ff9d571a-9b47-4f39-8589-d4c7b190d3bd@kernel.org):

	I already told you this at v1 and you ignored the problem and never
	responded.

	NAK

The path forward is usually to give up, or keep the NAK and hope that
the other maintainers accept the patch anyway. I see 17 cases of the
latter since the kernel started using Git until v6.19-rc1.

> You received only NAK as disagreement of this patch, but I did not allow
> to merge it with my NAK.

Ok, I will remove the Nacked-by in the next revision unless you
communicate that you actually want work on this patch to stop.



