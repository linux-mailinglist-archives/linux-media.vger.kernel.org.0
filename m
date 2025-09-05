Return-Path: <linux-media+bounces-41883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D63C4B466F8
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 01:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969B85C11EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5372BFC85;
	Fri,  5 Sep 2025 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJR8Peuy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6527CB04;
	Fri,  5 Sep 2025 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757113330; cv=none; b=NXpGzVTo03OQLBQcldKTRq+hrymUwURxlYzzDErNNRAkvr8Efx2TYs2Id50T4e0vX37j9jQNu1/J19pPVmHYLkiYv56kjehx8QKj20pdSNNFHAcLIAQa9bebvK6oUo30pMmZJ7nXrFyBVGjf+LkZaJP3um/O26dziLklAC1Zn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757113330; c=relaxed/simple;
	bh=A+4/RdKySax+tzp4GDPn4PRAlrr/cIuU7Wohf04Emrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfTO/eTsZcUbsnG/I53y9cFlhIaD4zfZs5vMZFxar1gtjx3oYmhoVaCLnQjSUHLDuZpHivIQBGO5W8MwDYJcHh17CndMgMUE1Tbl1LALpjVPDnL6WmJlzjhTa6pjc1MQ9AwD8pEP0b763HfDd3TyVJk5TIREua9FSVsrF+SS2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJR8Peuy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E75C4CEF1;
	Fri,  5 Sep 2025 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757113329;
	bh=A+4/RdKySax+tzp4GDPn4PRAlrr/cIuU7Wohf04Emrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJR8Peuy40MtGwzANFz9PbLYWO6HTL+KwUXl8BCSi3g9DFIXW1L3UKNH1X+545mdM
	 DP18sjIqbsM+dpCD7qMLBv2lsN1pwS7Xr/aMDqEGbEM6zrWV+fedBKT1WlBcE/Tq0u
	 14NyYaGYukxn9wgLr7ImvCh8+xLcOBn+WIhQjg0JpENWRqzEOaxb2lhwNWB2WgSU9X
	 6L+Nm8e65pDvfx3wXoDhOjGp0KodUbF9kV9y+RPjs8lTVA8e6SN3r4yQoON+DeBqpT
	 Wsc4tjSK5EMpUwxbzyS/TLQ+RMqybcObpGQECFOpyVU/v4+KbjMmMBpnosefcpaF8f
	 PP4fAYdYBqsxg==
Date: Fri, 5 Sep 2025 18:02:09 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: leds: commonize leds property
Message-ID: <20250905230209.GA1423697-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-2-ed8f66f56da8@vinarskis.com>
 <20250905152404.GB953718-robh@kernel.org>
 <Lm6PLaup84KHzhxYTbsrQIbEeQpc6dj65aLkLFvOx7QwvuXS9ON53Csa2v6LBp4hd9iIQilvGhXqx4kXv4cfqgYUeA49vrVdWJw-fNMLu2Y=@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Lm6PLaup84KHzhxYTbsrQIbEeQpc6dj65aLkLFvOx7QwvuXS9ON53Csa2v6LBp4hd9iIQilvGhXqx4kXv4cfqgYUeA49vrVdWJw-fNMLu2Y=@vinarskis.com>

On Fri, Sep 05, 2025 at 04:48:52PM +0000, Aleksandrs Vinarskis wrote:
> On Friday, September 5th, 2025 at 17:24, Rob Herring <robh@kernel.org> wrote:
> 
> > 
> > 
> > On Fri, Sep 05, 2025 at 09:59:30AM +0200, Aleksandrs Vinarskis wrote:
> > 
> > > A number of existing schemas use 'leds' property to provide
> > > phandle-array of LED(s) to the consumer. Additionally, with the
> > > upcoming privacy-led support in device-tree, v4l2 subnode could be a
> > > LED consumer, meaning that all camera sensors should support 'leds'
> > > and 'led-names' property via common 'video-interface-devices.yaml'.
> > > 
> > > To avoid dublication, commonize 'leds' property from existing schemas
> > > to newly introduced 'led-consumer.yaml'.
> > > 
> > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > ---
> > > .../devicetree/bindings/leds/backlight/led-backlight.yaml | 7 +------
> > > Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 6 +-----
> > > .../devicetree/bindings/media/video-interface-devices.yaml | 3 +++
> > > 3 files changed, 5 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > > index f5554da6bc6c73e94c4a2c32b150b28351b25f16..5e19b4376715eeb05cb789255db209ed27f8822f 100644
> > > --- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > > @@ -18,17 +18,12 @@ description:
> > > 
> > > allOf:
> > > - $ref: common.yaml#
> > > + - $ref: /schemas/leds/leds-consumer.yaml#
> > 
> > 
> > Drop.
> > 
> > > properties:
> > > compatible:
> > > const: led-backlight
> > > 
> > > - leds:
> > > - description: A list of LED nodes
> > > - $ref: /schemas/types.yaml#/definitions/phandle-array
> > > - items:
> > > - maxItems: 1
> > 
> > 
> > You need to keep the property here:
> > 
> > leds: true
> > 
> > > -
> > > required:
> > > - compatible
> > > - leds
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > > index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..b4f326e8822a3bf452b22f5b9fa7189696f760a4 100644
> > > --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > > @@ -17,16 +17,12 @@ properties:
> > > compatible:
> > > const: leds-group-multicolor
> > > 
> > > - leds:
> > > - description:
> > > - An aray of monochromatic leds
> > > - $ref: /schemas/types.yaml#/definitions/phandle-array
> > > -
> > > required:
> > > - leds
> > > 
> > > allOf:
> > > - $ref: leds-class-multicolor.yaml#
> > > + - $ref: /schemas/leds/leds-consumer.yaml#
> > 
> > 
> > 
> > Same comments in this one.
> > 
> > > unevaluatedProperties: false
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > index cf7712ad297c01c946fa4dfdaf9a21646e125099..1e25cea0ff71da2cfd1c7c4642713199f3542c0a 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > @@ -10,6 +10,9 @@ maintainers:
> > > - Jacopo Mondi jacopo@jmondi.org
> > > - Sakari Ailus sakari.ailus@linux.intel.com
> > > 
> > > +allOf:
> > > + - $ref: /schemas/leds/leds-consumer.yaml#
> > 
> > 
> > This can be dropped. The user still has to define how many entries and
> > what the values of led-names are.
> 
> Hmm, but where should it be added then? If I just drop it, MIPI 
> camera schemas which are based on 'video-interface-devices.yaml' and 
> have 'unevaluatedProperties: false' throw warnings because 'leds' was 
> not expected. Including the example in 'led-consumer.yaml' as found 
> by your bot (because of patch order your bot only run on 1/4, adding 
> this very change fixes it).

> In this case, v4l2 subnode is the LED user, which is some camera. It 
> seems most/all of these cameras are based on this binding, so instead 
> of adding new led related properties to all of them, I thought this 
> is a good common place for it... Shall I add #entries and available 
> options for 'led-names' here to make it complete?

Every camera doesn't have the same LEDs, so you have to define exactly 
what's there for each one. If you want to do it in 
video-interface-devices.yanl, then you are standardizing it for 
everyone. Maybe that's fine? If so, you need something like:

leds:
  minItems: 1
  maxItems: 2

led-names:
  items:
    enum:
      - flash
      - privacy

Rob

