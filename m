Return-Path: <linux-media+bounces-42065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B6B4A2FA
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176593A8EFA
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 07:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981D3304BCC;
	Tue,  9 Sep 2025 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmz/QTdt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6AC30505E;
	Tue,  9 Sep 2025 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757401628; cv=none; b=qjOOhudOBbdnQXo5lR/PUkV6gTAIXKcAFSTXBxt3MTKRFR+xPQJsIiZ9ELAYK9UeWqqz6pVW5nlNYnKLg+NJNczWDbeA2r34btv6kVoNvB269HsIYD7ZAVJ4bBPFMOlIzz5/Mh57Ajr1MaUoesf8iRjB2GkkaNH4KdNVwrcPdHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757401628; c=relaxed/simple;
	bh=UB3ymBhPiyxYf8wquSpd7gpdKSVsLTb8dRTn8loC64w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1B3MTN9eObhSz4o17Aj3cjwb1L707d/Yhu5DdhXQOf7APpBeWPkFBXjGbHG1on+l/g/uGv5YYZOn3axo14f9w2EB9rNZLW/YFMIZ2308K6M/M+kKzmsLprwC6wHKEXuiEgm7tTmgxKTmfDQwOVRMr+hQ5nNqQmmVyyuPLOlE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmz/QTdt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7B5C4CEF4;
	Tue,  9 Sep 2025 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401627;
	bh=UB3ymBhPiyxYf8wquSpd7gpdKSVsLTb8dRTn8loC64w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmz/QTdtMP6cfWNhmgodQagq9C+kpRUVxjnuj3fVroqKyctPvbwjlKjHc2GR9K4zf
	 rr8oVcTbsq0gPgr2qxIPaRLSbRTQ7JLN3FMugcSTIt+bUxu/ADctBhdHVbPDJHYlz7
	 EK9KsTl1h9eU22NJGM/LwI1ljt07bpVViHYaXiMsHAy4xZ2QG4mc+p4cd/ciwlFOrm
	 Wn+M6/ytU43kkHOO1lRfR6w7Lm1SVP2o/6FzlMr7/++qAE+n1aVKM+e0YHKdiF5qPx
	 Qj0W5NCKWtFiq/toeQurMEFWCpMShhkr1UEe10i54KdYAse6PAHPz+4/CN549ceywM
	 gM4urmQsBMI7g==
Date: Tue, 9 Sep 2025 09:07:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-leds@vger.kernel.org, 
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Daniel Thompson <danielt@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250909-vague-fantastic-bettong-5f40ee@kuoka>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <175734087835.1809005.14330068317471966084.robh@kernel.org>
 <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>

On Mon, Sep 08, 2025 at 03:43:22PM +0000, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Monday, September 8th, 2025 at 16:15, Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > 
> > 
> > 
> > On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
> > 
> > > Introduce common generic led consumer binding, where consumer defines
> > > led(s) by phandle, as opposed to trigger-source binding where the
> > > trigger source is defined in led itself.
> > > 
> > > Add already used in some schemas 'leds' parameter which expects
> > > phandle-array. Additionally, introduce 'led-names' which could be used
> > > by consumers to map LED devices to their respective functions.
> > > 
> > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > ---
> > > .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
> > > 1 file changed, 89 insertions(+)
> > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
> > from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#
> 
> Rob: this is because the 1st patch that adds `led-consumer.yaml` uses
> ov02e10 in its example, while the property is added to
> `video-interface-devices.yaml` (which is used by ov02e10 and other
> cameras) only in the 2nd patch. As I see it, reversing the order of 1st
> and 2nd patch would likewise cause 'error' when 1st patch is checked
> without the 2nd one. I don't think that 1st and 2nd patches should be
> combined, but if you prefer to do that so the warning goes away - please
> let me know.
> 

Just drop the compatible (and most of the properties) from the example.
That's a common binding, so adding there some other device DTS only
complicates things. See access-controllers, for example.

Best regards,
Krzysztof


