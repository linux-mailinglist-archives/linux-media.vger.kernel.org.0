Return-Path: <linux-media+bounces-49773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D1CEB2AE
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 04:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E17A303B7EA
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 03:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBD326B0A9;
	Wed, 31 Dec 2025 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuD2F18q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39734EEA8
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150116; cv=none; b=IHXMHdgrZWCr1WwozMW5+VlH2eYEugysow7LXE42sl80MzzfUR3UtUthslwEprw+HnjgqEDWLGM3ppS52/2wQ+OUdc9zwgp/sGKUVwUwfHsoTlPzsgw14Bj1D/JFtU2wNrODNfuJCL9RNRT0h/9SJOQQkzsOwMFVrDkLyWIJGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150116; c=relaxed/simple;
	bh=VfUAn7fuzAJ1b65MvaymWQC022eu06jMkmEUoeIuEzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRBszDfOS1QBFGmIH0gwWZIQec/SWkJ3HkyzoYTcuQmZe3Kci3O2cnjfD8eosQXUe0IzEjF+Q6OtwgGaAidp0G3j6MeVuaTbpm7eiRrtVP7Ww2seGHsrolTt1nekFUFUIjXkgcsVKyYEDrOuAko4clzuIhKd3APhjrYP/REP5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuD2F18q; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b1bfd4b3deso946503185a.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767150114; x=1767754914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zusqzk/Z0ArToECS6/v9lmrCcwZi8OdNi5W/vdy0GjU=;
        b=OuD2F18qhDghQ5PprngP0OPDTym7da1Jj9tkFIhCNJIXVnT7B6dRacIv7qYen1O02k
         Dcv49vbjBF9MY4gB912rC0xC9RVjjQ8C24Ik4rK3xkHmnQfnYrFxcEeINSATqkeWXBrC
         SyqpLlRhZksvBLxCzsxS06oHRuISNNW2O9Cur9ukvIwoZ67R5Qc2IdarTz5fyihMrCwa
         qp+TCvv4qvSwpID4U2EByYVd60aGxWLjgUPmb3Z9zntfO3Zm4MyPi6vtOpLKLyzu4XdJ
         lCcG5mxk752tWNWy7DGwiCbL4AefCHZkr0NpFWcroQ6z47qUWMEIxAGJgZPEkT1xbe7W
         YT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150114; x=1767754914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zusqzk/Z0ArToECS6/v9lmrCcwZi8OdNi5W/vdy0GjU=;
        b=rt970ynC9C1SmV3ms0WiW7qkLs2aQd8S4GhnVCnfKf4UtOUKACpyPbXe0O1Z5LJiqw
         e6e/QCCHADz2Azx8bHqOHoc13XyxQI2kyhddzcadGHpWZK7MCS/A2ZjGA+mQMJL70D5+
         tP47gWl+bzWjar5VKNYrmRbYDff9QN+rxOz07fs8XkaxarE1gCpqDO/nge3hzkuuh/l2
         V6u1Vmf1tBfIOsA/S/gYjGdGil0ys+Cr0Cn8ZokxjQLKhQg7rE11+ueyvjydWjp826Gq
         KDg6wNOHWh75cA/qco9wFGQZl4G2Gi7+WHEr5oTGrFlq6MlOtQm2kTGESVKeipiEnC1/
         OQAg==
X-Forwarded-Encrypted: i=1; AJvYcCWk72Ex0zmlzwaOtMoCnc70ZC3DR2yvH/Ic0buaSGE0/xs3ytPcwqCB2AJ6frUxbCusvUVLU/2K6cnEWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSj3ucb63RuWj9TuKYKZflmgVVFVeyHfFxUnIicq7VBTDfw7n7
	mNpYEmRFfKZYmz5BYCu36KpZ6AhjGWmah4dcN2IKHHHemDPiIA5NuFts
X-Gm-Gg: AY/fxX7BmuinRe/cEmxfpkSD6jwUZhvbnfNHwiaTQOAxJeKr7+P3EZfuonRt6s2B+5x
	Hrknp/Qe/THHo0ZKRuiuAA9T241ny+oUUm5YLf48Lw8f/1wmr6ItwxWcAi0nBZApOyXKegVxL8I
	gXMUL/06md2v9s723o4LkYnxo8c/6WhQj/4KWUx2A2gxZb84fWHTUhEGAMo5bCBAbMTET98qRzG
	tqZF/bzB4LwDfevbzYfxRrawiSSUx3b/FN5P+ArjFR+5XPkHNdEFWinmckRxX9cvvwnvctWDgiy
	me1WKufQ9hZQolwZCF/OZwg2i3E5kbdvbN/LwdvUQAjviO5J9tfsQdVT6lT0Se0dZTtama0Rgjg
	BT4MLpkdowX8MG9UIpU5coPHirXl3XwzISEqJ731ihscVgeGWSeY9g9+UER1lZlnxI66wZDnHO3
	NRadp/HzxdJEy5+A==
X-Google-Smtp-Source: AGHT+IEzxBN4kluErCkFUOvPOVgIkBgVvoyMRSDm/yqIVEJ0Qm/7aQQEO7z0S0+HYnyDvukVT0yxIg==
X-Received: by 2002:a05:620a:c4b:b0:8b2:5d6e:48c1 with SMTP id af79cd13be357-8c08fd037bfmr5364545585a.27.1767150114089;
        Tue, 30 Dec 2025 19:01:54 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm255936816d6.47.2025.12.30.19.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 19:01:53 -0800 (PST)
Date: Tue, 30 Dec 2025 22:02:12 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aVSSNGCtvcYCTylu@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>

On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
> On 12/30/25 04:27, Richard Acayan wrote:
> > This series adds support for empty endpoint nodes. It is currently RFC
> > because it continues an ongoing discussion on how to selectively connect
> > some CAMSS ports to cameras and leave others disconnected.
> > 
> > The SDM670 patches are for a full example. If agreed on, this should
> > expand to SoCs that have CAMSS.
> > 
> > Example SoC dtsi:
> > 
> > 	camss: isp@00000000 {
> > 		...
> > 
> > 		status = "disabled";
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				reg = <0>;
> > 
> > 				camss_endpoint0: endpoint {
> > 				};
> > 			};
> 
> I do not see this device tree node layout as a valid one. A 'port' provides
> an interface description (an option), and an 'endpoint' declares a connection
> over a port (the accepted option).
> 
> From dtschema/schemas/graph.yaml:
> 
>     Each port node contains an 'endpoint' subnode for each remote device port
>     connected to this port.
> 
> This is violated in the example given by you above, when a remote device along
> with its ports is just missing, thus there is no connection. A forced alternative
> reading may (or will) break the legacy, so in this particular case you shall
> start from making a change to the shared graph.yaml documentation, since it's
> all not about CAMSS or even linux-media specifics.

So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
would it be acceptable to label the ports instead, so a board DTS can
specify its own fully connected endpoint(s) under the port labels?

The labels to ports aren't looking as "excessive"[1] as they used to be.
Is the original review comment on port labels still relevant?

[1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org

