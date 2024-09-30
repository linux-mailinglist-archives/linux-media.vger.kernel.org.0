Return-Path: <linux-media+bounces-18875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99A98A790
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 16:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEBBF1C22C99
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57781922E5;
	Mon, 30 Sep 2024 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yhcfCDwQ"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A536E19005B;
	Mon, 30 Sep 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707587; cv=none; b=YyLQfcurMhIc76BU187qUtUrDAgRa+5EXVEb2Q+v/PbuE9vvjXTl0QoCvYJyVYfnwxIprG9wBNUegy5CLtB1aFAlj0CBBMiG/0aMskARt2A+B+cyQCqubXwUnCsIf1U8c3I1WCuyWi1ilQt6GfHH27d73jf0qs66ncfD9PXL+f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707587; c=relaxed/simple;
	bh=YKuV5v9gHDlSOprD8Mnk9qpPDZtmdUzIXqNwf3v5iIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0elgg3y9jRDqlFdQd2ZlMCQwGZOra9DfHgbh7RhNsQcxo9fhCW9xKItjMXhZEdlMFDXLEyykNpwGwl9//CRyNA3WJyH0nzS/MWlE1VXO1zTujKe1894cYgtZXTj7LsjD1M3LyAp2f2Uvy9QyX+RYvgb6sfSQOdana7L4PdzeAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yhcfCDwQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+/5cL9UnfJbkuScQXbDl9+5xv+uD29Ok6MxJQa09pCg=; b=yhcfCDwQ4IAS2bgSSUMmxGo21t
	awZWRCAQj4opOeRg7sKAKhSBTODy9Y8e9bZkC4dtj8FuirG3ld/gNdmcJ4w+f8wdfDxzXZ0yb2w5x
	a9wBPj8pbd0Z8tAlalMeucIE/+Qt8cSbT9VoGlNCOTv0tbSb8NEA5vIOTT0Zaman1TjDIBtTlzOAC
	uRjiEtfjhnM5bj42j3quY9/PPRiXhjhToH0PI6rpGY6JSudon2kSbwiFvoALLRS6ot2J4KY2NjHz/
	i8xXvZNY9klR1CfAT/o0L/5SCnJD6xccmtPtmgWYE0jiTVZwmWHytAIMKsfnLqKEL2nx6ZBnSppKJ
	bH9zVQ3w==;
Received: from i5e861925.versanet.de ([94.134.25.37] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1svHfG-00064Q-Sd; Mon, 30 Sep 2024 16:46:18 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Christopher Obbard <chris.obbard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH 6/9] media: dt-bindings: rockchip,vdec: Add RK3288 compatible
Date: Mon, 30 Sep 2024 16:46:17 +0200
Message-ID: <3342168.44csPzL39Z@diego>
In-Reply-To: <20231105233630.3927502-7-jonas@kwiboo.se>
References:
 <20231105233630.3927502-1-jonas@kwiboo.se>
 <20231105233630.3927502-7-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jonas,

Am Montag, 6. November 2023, 00:36:13 CEST schrieb Jonas Karlman:
> Add a RK3288 compatible for a version of the Rockchip VDEC IP that only
> support HEVC decoding.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

While looking for something else in my inbox, I stumbled upon this series.
Looking at 6.12-rc1, it seems the rk3288 parts at least didn't make it in
yet, so I guess I a rebase+resend might be in order?


Heiko

> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 08b02ec16755..0f00e9c86737 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -16,7 +16,9 @@ description: |-
>  properties:
>    compatible:
>      oneOf:
> -      - const: rockchip,rk3399-vdec
> +      - enum:
> +          - rockchip,rk3288-vdec
> +          - rockchip,rk3399-vdec
>        - items:
>            - enum:
>                - rockchip,rk3228-vdec
> 





