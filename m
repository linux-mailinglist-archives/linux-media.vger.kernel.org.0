Return-Path: <linux-media+bounces-18226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23114976F2F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 18:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3122281B7C
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 16:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C551BE866;
	Thu, 12 Sep 2024 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSkpgXj+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E741AD256;
	Thu, 12 Sep 2024 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726160053; cv=none; b=jU9/GSlmoOcDmOj6Usf2+E868R4wB/4db62vP3PPw9VD82qigJkoZBz3PAMjVEm6Hr9q5N4TwcupN6gfv7MZeHhuiBY4JqNbqRTPRWZg3/XPN/Egvgl5mj09r7zqA5N6jajSp6cff/ZeTDYqpoTbdhVkM5IkLgcqRQvkjOxTEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726160053; c=relaxed/simple;
	bh=EvuQRTOvCygv4JttyYOrIYG2JZuDMwbgBuOgkBJTeAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMNTeCkbzpKSzXs7ErKT00apM2Cvt6yIOx+l3kUHiPD2Q1IrI3gh1VLaHznAp43Y4r4wGQF24MIq/pqYGzYhoNm7QDzojZA7QukEx8b46X6o77ijnw9gCYVgWqI169uHVix8jhnpnEi15JAT5/JMcyg/oPsaIivpBA7TUkhNWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSkpgXj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42B2C4CEC3;
	Thu, 12 Sep 2024 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726160052;
	bh=EvuQRTOvCygv4JttyYOrIYG2JZuDMwbgBuOgkBJTeAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSkpgXj+jtRgdtCiTXLvwsUHUdoe4J25kmlMfVfb1/cYDHZ39VIPLu0B+EVQYrWEg
	 eXasDGChp/IqEDddBOUc/14D0P3rUbJEy8ojr8kmWAWhcEzxIidEsLruIsiveCeT/7
	 BlQTgenMOoQZz0A1+zCRv5EXrG4ipcfqagMuMEj9+sGrXYxlBljX5jv/saUVLWc63C
	 tcH1VSgSzk7SiVByhan7p8/+K8io2ALVDTPqrE6CHWBJxDwKKo++qPawPEqMRdrpOn
	 qYlXGo0kJqpyKlp5jnHne3PZ/qwgUGIbicMDDSaRVjD5Tv0fhuY5O5667XleL8Nm6P
	 g8cY44G2Vnw+A==
Date: Thu, 12 Sep 2024 17:54:04 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240912165404.GG24460@google.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240912145100.GE24460@google.com>
 <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>

On Thu, 12 Sep 2024, Mark Brown wrote:

> On Thu, Sep 12, 2024 at 03:51:00PM +0100, Lee Jones wrote:
> > On Wed, 04 Sep 2024, Mark Brown wrote:
> 
> > > [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
> > >         commit: 761cab667898d86c04867948f1b7aec1090be796
> 
> > Did you mean to hoover this up?
> 
> It seemed to go along with the series and had a DT review so it looked
> like you'd just left it to the DT people to review, there wasn't any
> other MFD content in the series.

I applied it from this set 6 weeks ago! :)


-- 
Lee Jones [李琼斯]

