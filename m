Return-Path: <linux-media+bounces-12815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E34901D56
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0B71F2114A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AECF6F314;
	Mon, 10 Jun 2024 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/bfl5HB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC76F2E7;
	Mon, 10 Jun 2024 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009689; cv=none; b=JkrxUYsaJQ64KFUgyuqRo0WHWLCmNlvw9NJNeglHrTNh2QpiAN9XZPWPN2Q7vBPTPncpwS4gD+4efsVtjy93IehzCqPmco0TaIkwVfB16VXXHswtCg1TS0GhXtTtvuY51hycxmSKAamiMCTA14DZFZxT4S6MZpq4xtvhDR6g+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009689; c=relaxed/simple;
	bh=1uMH5ebVeQ4Wu83z83imey9mwf02x2hoI5G0NYSkvZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlbFK/X+FodW7IZyLQeog6VXFIXG+zV8SgeoWmKr0Nn4gyAiNac7OSRMryYhOBwScRDDx3MAyelrllqFFRmBLGAlMmjiMS9orwdckL643CD6YgoAzUFQOY7zNreDwn/ZG6gSIYdTB7IAtuOL8vhuXPQJCAWXGGTpvFdTt/URVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/bfl5HB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10ED8397;
	Mon, 10 Jun 2024 10:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718009673;
	bh=1uMH5ebVeQ4Wu83z83imey9mwf02x2hoI5G0NYSkvZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/bfl5HBaA7nFpgLad02WGpvLjlGXYbbAV4ty6j4/RpX5kv1Q2wgz41Q5KSoelibo
	 uTiq449X1R9B0IMnEs5FaInqPD27kZ4XeNltKl+Z5NZefD0QIzaAGAR78RuLM/Cnz3
	 oR6T/B3sHY4GLIurI9PqMVRO6xjC6nQvUanY/CkY=
Date: Mon, 10 Jun 2024 11:54:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610085424.GH26663@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>

Hi Krzysztof,

On Mon, Jun 10, 2024 at 09:54:03AM +0200, Krzysztof Kozlowski wrote:
> On 07/06/2024 16:41, Laurent Pinchart wrote:
> > On Fri, Jun 07, 2024 at 10:52:33AM +0200, Julien Stephan wrote:
> >> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski a écrit :
> >>> On 10/01/2024 15:14, Julien Stephan wrote:
> 
> Eeeh? January?
> 
> ...
> 
> >>>
> >>>> +
> >>>> +          seninf: seninf@15040000 {
> >>>
> >>> Node names should be generic. See also an explanation and list of
> >>> examples (not exhaustive) in DT specification:
> >>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > The seninf is (mostly) a set of MIPI CSI-2 receivers. Would you prefer
> > 'csi', 'mipi-csi', 'csi-2' or any other name ?
> 
> csi@ works for me
> 
> > There's also the camsv IP in the same series that needs a generic name.
> > I really don't know what to propose for it. Could you recommend
> > something that would make you happy ?
> 
> Sorry,that's almost half year old thread. Not present in my inbox.

I remember someone presenting a talk titled "Beginner Linux kernel
maintainer's toolbox" in Prague last year. The talk mentioned a tool
call b4. I highly recommend it ;-)

> > On a side note, that document lacks appropriate generic names for lots
> > of building blocks found in recent SoCs, it would be nice to get it
> > updated. You will eventually get better quality DT patches then :-)
> 
> The list grew recently, so just add something there. But it is okay if
> some name is not really generic, it's just recommendation.

OK, then I think we can go for 'csi' for seninf, and keep 'camsv'.

-- 
Regards,

Laurent Pinchart

