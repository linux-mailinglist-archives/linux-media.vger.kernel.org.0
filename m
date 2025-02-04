Return-Path: <linux-media+bounces-25654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01AA27F4A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 00:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF70A3A18E0
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 23:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BA821C9F4;
	Tue,  4 Feb 2025 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDsM5Ufp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB61FF7A5
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738710601; cv=none; b=HTehTQgavhg4FvyuITyO9ELWmm74Ywij0+SuB1bFeEgFPQVjz2j2bfKPwU5QH2iSN+9yNWS1HXMJRehz1UFY80WvqvAT/wh6YhTggF7dtYiitlnmAwK7A4fHSCTDdxLFhxgm8gfGCaP/9GqMOXt1dmJgHfzN3E0a3yicDgrRIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738710601; c=relaxed/simple;
	bh=Tr3yoOpc+aUCZ3WR1eWrKlLDLn/mpgv5+47ZSyVt7t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbQqjYB2tyAt7cQBXqvFWE13jHCizRluP4bagDhFMWrrT8nbC+Z0OBi22XuTVPGehk4Jntlqh4bC67cVN3XSjcEL9hoN2+9o+JOaugTTcmarFTfcCOuesgbzCg2QymfwjZQdRQRD1lQP7LFupRGQ0uXU4Sj/5PEN2fuxZir60wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDsM5Ufp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso7101954e87.3
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2025 15:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738710598; x=1739315398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nqBH/92bU047lJT992e74kfygOOu+glyfbvkM1AfW+Q=;
        b=QDsM5UfpdxAyGgE2FYVLIN8nf9V5Z30h7QcjTZoP/dMtVISI+XB827PJKC5+xkSBba
         LPSSO5yI1L0v02QQnT3rEecRyoBN90cyCpjsP8jevKebwJVYLMi4QgkmY0fzrwh0qu++
         VBFFTOU+9ltk3fxKT47sSH/+fjFmCEU7rio/TySY3xUPqe97cKzBOUk6pUKBZ3DRRMwf
         f/KZdjguRlawqz7z1DGAck37ra/KdKo+9wPvmfhXPO+Whh2FpEAVmmAhwSvAlmamx9qj
         4Zi8RPG7rEYOsH9O2Q83XbLNKg8hbgpfm2fQSITd2sq3WJPqHd/tLWq3UQCiP45JjtPX
         PbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738710598; x=1739315398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqBH/92bU047lJT992e74kfygOOu+glyfbvkM1AfW+Q=;
        b=bZm+XVVMTB6Dm7VpXlRvrZMQ8olBkylhVcb0P8UTs9O/JeV5KIj0jTyJUq2ZI1k2yX
         bPC13WwJ/MY/f7ccxNm59/JGGQ9TXn00aqaqgLUL6Ea+IzQwPzqRIj43Ounai/37TcI/
         4+MB8z8ZprQQrlZTzGfBK+wuKfXciBtEwQo+Q4rFqi/BQ3uJI5L6oUgXVFribPyyhoOI
         wyodmr9yRia/6mSfe8T/Cq8Njn2oyk9kWWnPzNljWi99v74Vd5SRf40Q0Bem+OuDo/ma
         YzgAiHOerw2EZlz5PXedAuQQmDfjFZOW4u9uyKyDzPb5JZA175EcvG1nM460F5EfvluK
         JxZg==
X-Forwarded-Encrypted: i=1; AJvYcCXb4mBgM+yA6Icj35QDO1nb7DxKTOhXMjsT9DOdwdrRHotISMsLKf8iD+aWAcFUp3T4RN3qhPufXC771Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrE9lXWkmVwCcBBzGv7UJ5b0eUafJsCW/Z2nDK1gTvHCv+Kdb
	ibWgYWsE2Sc7z8IjVAQOFyX1GKGo/hOf0YmNKJJa5GTtaYnJ7AkfyeXnk8lXR30=
X-Gm-Gg: ASbGncsJkCigT6Op8+mr4rGdaCfFFeoNeqZzs7tVXSORyMnMeQ5xwhF5rbKDhxCt/u2
	/0mWpsdf7sKtRILqVSGM6kmBhXaUwXCFbdZWu5PLG0VCHJmycscx7WHodJFFrjXl5R1NLLKmYE3
	dalHbQ+V0btJuXbKGXt+v3w77L1eSfxiXy1bcMNKXwZJk0YQDtwZbNQ4B2f5ngr+J9RF6CZIMKT
	t8pXFbNFaZKgEqg99+3N8R4C0tpzaTfUM9Wk0L9/QoL7Besu4xCH0og5AQcP1WsMnBi3iWCt5HW
	TmJZU39zuDSu0/S1mSoIAa41Vzfz+rPE7+1TaPNO7GckDGi9waJwrQLXIlkPNdLQVMPzrak=
X-Google-Smtp-Source: AGHT+IEELZ8FSvbCFuNEq7BY3WyOIESWb6FMG5glo4rOY4FFUtqeWFyPekF53qhtLY38H7lEzdqSXA==
X-Received: by 2002:a05:6512:b97:b0:540:1b07:e033 with SMTP id 2adb3069b0e04-54405a6a714mr169956e87.45.1738710597714;
        Tue, 04 Feb 2025 15:09:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0fda2sm1735053e87.65.2025.02.04.15.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 15:09:56 -0800 (PST)
Date: Wed, 5 Feb 2025 01:09:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	p.zabel@pengutronix.de, hverkuil@xs4all.nl, sebastian.fricke@collabora.com, 
	bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, nicolas@ndufresne.ca, 
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org, lujianhua000@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <ilqfs6miq55ahyxjnhniv4k654vstfugmpswo5wld2ncgxxcx3@vsbr4bdl7y64>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
 <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>
 <Z6I5nx2Wt3bbBmSI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6I5nx2Wt3bbBmSI@hovoldconsulting.com>

On Tue, Feb 04, 2025 at 05:00:31PM +0100, Johan Hovold wrote:
> On Tue, Feb 04, 2025 at 04:55:58PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 10:31:49AM +0100, Johan Hovold wrote:
> > > On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> > > > > On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> 
> > > And we're still waiting to hear the answers to all of Hans' questions. I
> > > still haven't seen anyone explaining why any of this is needed. You
> > > could have just continued letting Venus support 8250 so presumably there
> > > is some benefit in using Iris instead. Which? And is that potential
> > > benefit important enough to not just wait until Iris is up to par
> > > feature wise?
> > 
> > Because that's exactly opposite of what Iris developers are trying to
> > do: SM8250 and SM8550 belong to two different generations of the FW
> > interface. By supporting both of them in the Iris driver the developers
> > can verify that the internal driver abstractions are good enough. It has
> > been discussed in one of the threads (or in telcos) related to the first
> > iterations of this driver. We definitely don't want to end up in Venus
> > situation, where the abstractions were added afterwards and in some
> > cases they are not the best ones.
> 
> Ok, but as I've said a number of times already, information like this
> needs to be included in the cover letter and commit message of what is
> posted to the list.
> 
> Maintainers and reviewers obviously have no idea what you discussed in
> some internal teleconference and can't be expected to remember or dig
> this out from some old email thread either.
> 
> > The plan is to use sm8250 as a "bridge" between two drivers, verifying
> > that they are on par during development, then drop sm8250 from Venus
> > driver. Then move sc7280 support too, drop all HFD_VERSION_6XX support
> > from Venus, cleanup the remnants.
> 
> Ok, but venus would still remain for some older hardware? It's just the
> "hfi gen1" ones that would move to the iris eventually?

Yes. At least for the foreseable future. Nobody has explored an option
of moving older hardware to the Iris driver.

> 
> > I think most of that information should have been a part of the main
> > Iris series. If it is not, please comment there, so that those commit
> > messages can be updated.
> 
> Unfortunately it was not, which I also pointed in my comments to the
> Iris series.
> 
> > > I'm sure you have some answers, but you need to provide them as part of
> > > the series.
> 
> > > Unbinding and rebinding drivers is not part of any normal work flow
> > > expect possibly during development. And a developer can easily compare
> > > Venus and Iris for 8250 without a module parameter too.
> > 
> > Yes, we are talking about development. And yes, modparam helps. If you'd
> > like to do two separate kernel builds, that's fine.
> 
> Please just motivate why you think this is needed as part of the
> submission. And make sure that the implementation is sane (e.g. not some
> random probe defer indefinitely thing).
> 
> Like I said, having two drivers for the same hardware is normally not
> something that is acceptable, and this would need to be a transitional
> thing as we both agree. One way to guarantee that is to not expose it to
> regular users until it is ready (e.g. a Kconfig hidden behind
> CONFIG_EXPERT or similar). Otherwise, I fear you'll end up supporting
> both forever (with at least one of them bitrotting behind that module
> parameter over time).

I think I'm fine with hiding IRIS behind CONFIG_EXPERT, might be a good
idea.

-- 
With best wishes
Dmitry

