Return-Path: <linux-media+bounces-33444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2DAC4C78
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 12:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F2E3B77C9
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B8225743B;
	Tue, 27 May 2025 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2qRD1IY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662219D07A;
	Tue, 27 May 2025 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343191; cv=none; b=LTtJJztc/8j9DvECzQDUlZb0aSO0UCMXPJKPWD+y+zpkpCDT/taGvCag/hFwBgOfc1u14uSN3BXB01EgZzH5sjMIMFrVpNjzEX2/HpCpPlAvxLuE6YW5mu83IT6NlI7zfkKFGA9Onmi1W5fXIbsv8Y1YzfbT2Umy/VIlE1orS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343191; c=relaxed/simple;
	bh=tWSqHCDzzRmfU3TBPc9DKYdEPDEa6yg2HF6LlIUqPYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgjNYZB/k/KJ2HR943F9TYHpCrKA2lZvEuYmIvxpMKHON5GJLLWXkNyAUW/DiM8a+R34e1A5d5xEmujRjhR/bjTFRQTcyXYdgz9mTP7XexSHy6SKfKEqMn99nQJBJ3O0xAXtyW6D52Pzy4FVzccKrKTtQnfAi8SKBb5mikP/P28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2qRD1IY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0701DC4CEE9;
	Tue, 27 May 2025 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748343190;
	bh=tWSqHCDzzRmfU3TBPc9DKYdEPDEa6yg2HF6LlIUqPYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2qRD1IYPK0Zp4nIf/+8vwesSh9tJfEHXmT2E7xUwtqt9xxMfLvCxw/Al7KL8ezJm
	 0pYSJCVGnxGDDikaIA2TThBwZ6I+Aihes+KxZb9IfHnnRwOxrxV+M/casavj3nRfDy
	 AAE0D2nLeYqnaCr1PPEjFL/L3jF8WzWHi1AiHibTActS1v+rE2DkC2FaFCMd3rOsda
	 MDnN6O8uDmqPlgIawMdc3ywezwbbNFSuzeKoP6ykvWNG6GL2QpCH3ppfRjrT0c7jy4
	 QXIT4bdHIvvfAXQSGFTS58F8YkLwA2UG7sVoORJR1LdaFqnfKBbfvHz9jImm+HxWh8
	 p9ZpprHC4cZXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJrvk-000000000oO-1iP4;
	Tue, 27 May 2025 12:53:12 +0200
Date: Tue, 27 May 2025 12:53:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
 <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>

Hi Bryan,

On Fri, Apr 04, 2025 at 10:02:47AM +0100, Bryan O'Donoghue wrote:
> On 04/04/2025 06:24, Vikash Garodia wrote:
> >>> How different is this from sm8250 which is already enabled on iris driver ?
> >> As far as I remember, SM8250 support in Iris did not reach
> >> feature-parity yet. So in my opinion it is fine to add new platforms to
> >> the Venus driver, that will later migrate to the Iris driver.
> > I would say, from decoder side all codecs are there now on Iris. H264 merged,
> > while h265 and VP9 dec are posted as RFC, there is one compliance failure which
> > is under debug to post them as regular patches.
> > If we are mainly looking for decode usecases, then we should be on Iris.
> > Preference would be to stay on Iris, otherwise we would have that extra ask to
> > port it later from venus to iris.
> 
> Right now venus represents 9/20 - 45% of the patches being churned for 
> sc8280xp.
> 
> https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7
> 
> This is a good debate to have, however my memory of what we collectively 
> agreed both in public and private was to continue to merge new silicon 
> <= HFI6XX into venus unless and until iris hit feature parity for HFI6XX 
> and to continue with venus at that point for < HFI6XX.
> 
> So merging sc8280xp - HFI6XX is consistent with our agreement, the right 
> thing to do for our users and a big win in terms of technical debt 
> reduction.
> 
> I will post an update to this series ASAP.

It seems things may be moving again on the firmware front, so could you
please respin this series so we can have video acceleration support for
the X13s in 6.17?

Johan

