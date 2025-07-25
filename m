Return-Path: <linux-media+bounces-38457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B914B11D38
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 653D6AE3FA9
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544182E6103;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yfra4dTY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39670239E6B;
	Fri, 25 Jul 2025 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441766; cv=none; b=TBv7gXRiq2TEuxcN0noZEq/LEU7Kufp7cD1+2m0WnuL4gqCg31P6Eg4LUebYzCIvD9C4C+UDFLrydbQxiD0dwXA31L/7SYtfm741Vw/PipIlyx66vCZDDqgqLKZY98lKhQm04Nx4z6rDp7h+a1ds6IFQ3sxksZmgOooMZu4H4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441766; c=relaxed/simple;
	bh=DD9a8m0nnLeBvtdQn9yRpVCKbVg6ku18qIQ0e2NYX2I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HEBvXk9km7nRFRKsC1K5sG/8bO+r/Tc/4nTFg7ETEjR+1qoAnsEu0cr9Azkq0iZ4Vg11iI2zVYmgydBvivyxCvaWuDHLhqSawCDmuYN7qQ3bI/QfE//T9bSekt1FjBiuOiSNuH+4xXjJ5JvGX2Khj4LnIR6QwdMG+WP5URMNuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yfra4dTY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:42d3:9d3c:5909:7714])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35B929CA;
	Fri, 25 Jul 2025 13:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753441724;
	bh=DD9a8m0nnLeBvtdQn9yRpVCKbVg6ku18qIQ0e2NYX2I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Yfra4dTYCpYEurSs1VX9mxKAISYSLd25+1s+GwCAYMqTn76AoJYXfEbtmXtzuTeWZ
	 I7JOnIekZMKHCjgjn36xQWfr9TNV3VE/Su5J+WUnDWTCf0sZrJwW0ol0hkl3xupo4/
	 O2rufElKrQMkQGE/7HCl9k5ZYhEWdFEygTGdKlfY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m3h5z2vw12.fsf@t19.piap.pl>
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl> <175308758352.3134829.9472501038683860006@localhost> <m31pq9y98z.fsf@t19.piap.pl> <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Fri, 25 Jul 2025 13:09:20 +0200
Message-ID: <175344176070.2811177.10693943493658922992@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Krzysztof,

Quoting Krzysztof Ha=C5=82asa (2025-07-24 10:21:45)
> Hi Stefan,
>=20
> > Just a quick heads up. I ran the tester and so far no unexpected
> > results. I'll run it from time to time after a reboot to see if I ever
> > hit that condition.
>=20
> Is your camera(s) connected to the first CSI?
> I cannot reproduce the problem on csi0, it seems only csi1 is
> affected. It would be consistent with NXP's workaround commit text.

Yes in that case it is connected to csi0. I sometimes have cases where
one is connected to csi1. I'll rerun the test when I use tha device
again.

Best regards,
Stefan

> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

