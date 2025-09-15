Return-Path: <linux-media+bounces-42493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E0B56D10
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 02:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8783C4E06ED
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 00:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407CC1A315C;
	Mon, 15 Sep 2025 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYBsB4oe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619E3FC2;
	Mon, 15 Sep 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894494; cv=none; b=dZM5g0UZ5reNriXMdExBpsTzwgnIyQSOmEQdxfqb7OzjB1RWCoHr6SQ1vUoCkJEwcoE4XS0+BVmiO69nNtNqCtqAIyaBFJ15gNG8HFwl2HP+Wc5D/ZCb62tk04jQP06wYJ3EnctwL7YCpSI48RisN3k96U4dbsb1toU0PQ3/UCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894494; c=relaxed/simple;
	bh=jf5WwI0Ql0igVBqg1T4+B4coelbMzYEoCfro+I3iuiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOsKI5pWJ5+dZUMZ4zkDU8XQMgBFlYzldWJuidepowB63WQizalZjUZjowxWPpcYTn34nkLd7ShA22RwqGEjd9x/Ti+KJcMvoTIzq4udPYp4DWBWkuTCpVn4CEtOnUrMLuypMk4J+wv37m4vUBaBQ49moCzT0NpBeBuJtI/F5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYBsB4oe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7155C4CEF0;
	Mon, 15 Sep 2025 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757894494;
	bh=jf5WwI0Ql0igVBqg1T4+B4coelbMzYEoCfro+I3iuiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYBsB4oeIu6sKduzjLbuGGOQ5ycoP1olbc2bGupqhUtrSC68uPDRu4gQ+p7k91YLa
	 wcFwC+QHO6EmmbejrTNXy/PhJoiGsDh+2gb/rhKk/NPveOLVFbcz63WrloEVnUzDb1
	 PJWaFlImzUxZ+MRfGR7nUYU5wCOiHnGoVKPcIC3Xo3PN8qFC2jQFyIEn6opkqHatKX
	 HTxXTM/JNJDwmBz+CjHWWefrR8srcwVNkKbXpCprS6FsfLJxUWRf/ovSsQxnWXwc0L
	 PAqD1QbCgGsR+sCtsZjvCo9JhTZuQ9O1Uuq0vnrIqhtV3hQas6xsNk2r33bAJQY/7d
	 rRul+E9pRcHMA==
Date: Sun, 14 Sep 2025 19:01:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Hans de Goede <hansg@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, linux-leds@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, threeway@gmail.com,
	Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: leds: commonize leds property
Message-ID: <175789449249.2282086.2330482533980735722.robh@kernel.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-2-bb90a0f897d5@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-leds-v5-2-bb90a0f897d5@vinarskis.com>


On Wed, 10 Sep 2025 14:01:09 +0200, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/backlight/led-backlight.yaml         | 6 +-----
>  Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 5 +----
>  .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


