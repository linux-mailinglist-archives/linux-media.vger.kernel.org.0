Return-Path: <linux-media+bounces-19630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44A99D832
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 22:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16A8282EFE
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 20:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4731D0F61;
	Mon, 14 Oct 2024 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ro94D9AD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112B1D0BA4;
	Mon, 14 Oct 2024 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937774; cv=none; b=EkSsB1Z8tghsOCx3SerEFURAzIUR9En0bZZt5SCbozqUBUY4UpdRrouEr+xI8y7fNawuB44xxc4bGJ/ppRPTlPb+F3zOH5WYHOm1ydUe5ScbCVleSn07qDlUD7msAL+VpC7mhIymng0au0f0AtApyAGu8KyEbh9cRuE/9llEKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937774; c=relaxed/simple;
	bh=/6Bwl8GdfKt9wKEv9irV46hddphh9+JWAeSKfvQhJL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv+XroW/GuOaVn1/u59JIs0UrkpeM6UYECwVWUEt5FVtOF1S7FKbP4oAL1DhOlUxaua4YlK2WjZNYG3Ds84XgY7gnBN7Ih+nCkkrIGZALz5TYtmdhhnRs8/GFt+3kUANkjalSIxaE0aSfZEZX3VREzXTsxWDChjrNXiylERAsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ro94D9AD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38241667;
	Mon, 14 Oct 2024 22:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728937668;
	bh=/6Bwl8GdfKt9wKEv9irV46hddphh9+JWAeSKfvQhJL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ro94D9AD36bGxvoRG/gu0ffuYITKqYCmMHZ5ixnafqskvvbE4Jn59igyPZ3QHYKhx
	 agEG9rQ96bwy1rrRULK4YtqvwgEYwz8Tjeuw6C32VGvDdAyn7q08gqpIY9hk3PYplZ
	 KC4Il+n0SdR+ok8Bp/9tDN4a0RGaAlSG97B9ftmE=
Date: Mon, 14 Oct 2024 23:29:20 +0300
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
Message-ID: <20241014202920.GE5522@pendragon.ideasonboard.com>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>

On Mon, Oct 14, 2024 at 10:47:31AM +0200, Krzysztof Kozlowski wrote:
> On 14/10/2024 10:31, Bryan O'Donoghue wrote:
> > On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
> >> I do not understand the reasoning behind this change at all. I don't
> >> think DT maintainers ever suggested it (in fact, rather opposite:
> >> suggested using unevaluatedProps) and I think is not a consensus of any
> >> talks.
> > 
> > No there is not but then, how do you give consistent feedback except 
> > proposing something to be a baseline.
> > 
> > On the one hand you have upstream additionalProperties: false and 
> > unevaluatedProperites: false - it'd be better to have a consistent 
> > message on which is to be used.
> 
> Well, I am afraid that push towards additionalProps will lead to grow
> common schema (video-interface-devices or video-interfaces) into huge
> one-fit-all binding. And that's not good.
> 
> If a common binding for a group of devices encourages you to list its
> subset, then it is not that common.
> 
> Solution is to fix that, e.g. split it per classes of devices.

I think splitting large schemas per class is a good idea, but the
problem will still exist. For instance, if we were to move the
CSI-2-specific properties to a separate schema, that schema would define
clock-lanes, data-lanes and clock-noncontinuous. The clock-lanes and
clock-noncontinuous properties do not apply to every device, how would
we then handle that ? I see three options:

- Use "additionalProperties: false" and explicitly list the properties that apply
  to the device with "$prop: true". This is what this series does.

- Use "unevaluatedProperites: false" and explicitly list the properties
  that do not apply to the device with "$prop: false". The drawback is
  that any property being added to the common schema will require
  modifications to all bindings that use the schema.

- Use "unevaluatedProperites: false" and don't list any property with
  "$prop: false". This is what is being done today in many bindings. The
  drawback is that device tree sources that specify invalid properties
  for the device will validate.

Among those options, my preference goes to the first one. It catches the
most issues in device tree sources, while not having the drawback of the
second option. It requires explicitly listing the valid properties, but
I don't consider that as a drawback, I think it's actually a good thing
as it clearly shows to the developers which properties are valid.

Are there other options I haven't considered ?

> Or don't care and use unevaluatedProps because it makes people's life
> easier and is still correct. If it is not correct, then this should be
> used as an argument.

-- 
Regards,

Laurent Pinchart

