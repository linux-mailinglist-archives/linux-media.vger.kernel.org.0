Return-Path: <linux-media+bounces-19731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B29A0579
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80C911F267AB
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A63205E0E;
	Wed, 16 Oct 2024 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j9biRRF2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB98F1C07E7;
	Wed, 16 Oct 2024 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070854; cv=none; b=mrx9rpCL4nVgM39Zdi8qz/GFB0uXJnmfqrFqOOW9DynMib8KAwVlNc7YWhlST/vWGOAr53qpsZMMKn//Jk/9GMyJPDyNQW2Ccm9DceajjNR14npe5XvlIZ8Sp3Yz9hgrRKyWUUEP18hHFC4uDt/XEZGmlUpZPt9nRpxJ/IYl6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070854; c=relaxed/simple;
	bh=tCLzgq66dWAXDVkAnN3eLiwjL+G/9jPb7GqLLKa5xzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F//kH6pC/f3KgS0tQD5ZYzNEOvQojgUWB7EIMMfpBjILnaVSwinrYxexM4Y+Yi5dF6BRyFalbbp2VYkC5zawD7ouypU5SibaPT2lQ3gZgMZgtZZtD60HWK1NvOtxlt2MA2Vt55MU6BtFRgpwHsZ4xSGzNm8QjyUemZaYFKKPf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j9biRRF2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 914946B5;
	Wed, 16 Oct 2024 11:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729070747;
	bh=tCLzgq66dWAXDVkAnN3eLiwjL+G/9jPb7GqLLKa5xzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9biRRF2FnW4Fbr2rIQmN6+qswSXBY0g79SjE307U/wzb28r9U501PZ/U7WloHW7f
	 td1RgvW8AF27nGWC4LSsfdwVCR1/xxd9x+fZT8ndRcvn8+CDRZXBUYSp8Emj3WN8d+
	 lXWnrE0EY+O00Y5PEyaOTqvWiTNKOj+RFg6BPK+Y=
Date: Wed, 16 Oct 2024 12:27:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
Message-ID: <20241016092726.GE2712@pendragon.ideasonboard.com>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
 <20241014202920.GE5522@pendragon.ideasonboard.com>
 <f265576c-7d83-40cb-b857-7ec54ef9ab46@kernel.org>
 <20241015112806.GA2712@pendragon.ideasonboard.com>
 <0c4d199a-ed74-4d44-a715-ceb498898ddc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c4d199a-ed74-4d44-a715-ceb498898ddc@kernel.org>

Hi Krzysztof,

On Tue, Oct 15, 2024 at 01:51:43PM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2024 13:28, Laurent Pinchart wrote:
> > On Tue, Oct 15, 2024 at 08:11:18AM +0200, Krzysztof Kozlowski wrote:
> >> On 14/10/2024 22:29, Laurent Pinchart wrote:
> >>> On Mon, Oct 14, 2024 at 10:47:31AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 14/10/2024 10:31, Bryan O'Donoghue wrote:
> >>>>> On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
> >>>>>> I do not understand the reasoning behind this change at all. I don't
> >>>>>> think DT maintainers ever suggested it (in fact, rather opposite:
> >>>>>> suggested using unevaluatedProps) and I think is not a consensus of any
> >>>>>> talks.
> >>>>>
> >>>>> No there is not but then, how do you give consistent feedback except 
> >>>>> proposing something to be a baseline.
> >>>>>
> >>>>> On the one hand you have upstream additionalProperties: false and 
> >>>>> unevaluatedProperites: false - it'd be better to have a consistent 
> >>>>> message on which is to be used.
> >>>>
> >>>> Well, I am afraid that push towards additionalProps will lead to grow
> >>>> common schema (video-interface-devices or video-interfaces) into huge
> >>>> one-fit-all binding. And that's not good.
> >>>>
> >>>> If a common binding for a group of devices encourages you to list its
> >>>> subset, then it is not that common.
> >>>>
> >>>> Solution is to fix that, e.g. split it per classes of devices.
> >>>
> >>> I think splitting large schemas per class is a good idea, but the
> >>> problem will still exist. For instance, if we were to move the
> >>> CSI-2-specific properties to a separate schema, that schema would define
> >>> clock-lanes, data-lanes and clock-noncontinuous. The clock-lanes and
> >>> clock-noncontinuous properties do not apply to every device, how would
> >>> we then handle that ? I see three options:
> >>
> >> Why is this a problem? Why is this a problem here, but not in other
> >> subsystems having exactly the same case?
> > 
> > I won't talk for other subsystems, but I can say I see value in
> > explicitly expressing what properties are valid for a device in DT
> > bindings both to inform DT authors and to perform validation on DT
> > sources. That's the whole point of YAML schemas, and I can't see a good
> > reason not to use the tooling we have developed when it has an easy way
> > to do the job.
> 
> I understand. The benefit, which you see, comes with complexity of the
> binding and need of listing properties.

I agree, the benefit comes at a cost of additional complexity in the
bindings. For me the benefit outweights the cost here as I find the cost
to be relatively small, but I understand that this is a personal
opinion.

> We do not enforce such rules (narrowing common schema in very strict
> way) in other subsystems, maybe with exception of input and touchscreen
> devices, but there common schema is quite big. And DT maintainers
> suggested to drop such code even for these, BTW.

-- 
Regards,

Laurent Pinchart

