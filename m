Return-Path: <linux-media+bounces-41376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E49B3CB6C
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 16:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F0A1BA255D
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 14:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EAA2727E7;
	Sat, 30 Aug 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jiJiuOLL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8DA1632DD;
	Sat, 30 Aug 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756563891; cv=none; b=tm6LqcJKyuHbvEnosaf/ylux6IA8GObW9FLgDNYETU7BZaJVTPv/ZV17Bqvhw6LL0BX/fREfD1cRVGWvGI8AoVNUnw4F4lDP2UEtncSyDw/uxlgDly/mqIpSu+5VbSQdr4UnXA20sop2GXjZBFYBtd6zSopRfwLruPlnMNGXfHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756563891; c=relaxed/simple;
	bh=4pONJUdWbx713zoQVd2/1m/uySraLAp1yiDEBCOzeu8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EkIxTFc+u59Sa/AM0uh9JKsY7dTQ+JqeV9r+Fbhl5zpWEG10DH42EBCZ7WteTk758KgXzyu+gwSIjr7gAou5rqvproZT8kfmH3dxQeYqt1+UZ6MfvfOUIpQ58zKGefFMpAFFJEqh11mOR/gin+g94Yr8Z4LDUrELVsRKdTF2ivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jiJiuOLL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 636C4EAE;
	Sat, 30 Aug 2025 16:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756563814;
	bh=4pONJUdWbx713zoQVd2/1m/uySraLAp1yiDEBCOzeu8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jiJiuOLL8EV9vi6nJDCyhBlq2rUrh4nY93eRHDDllLCxOfZlnrHeUok+k2Ccn6+wG
	 +R4NPYMCSaTALEKqYSamcm4XTMYV/IvVsFPQMmrEYf6uRAzuvIncMQPwsom6kAssiC
	 fPBhgae0q+Qx349jUej9+y2VVwcPG6gF/2eTmFyA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4eee57c0-a2fb-4fa7-bafe-e3a41c8954bd@kernel.org>
References: <20250830111500.53169-1-asmirnou@pinefeat.co.uk> <20250830111500.53169-2-asmirnou@pinefeat.co.uk> <4eee57c0-a2fb-4fa7-bafe-e3a41c8954bd@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Pinefeat cef168 lens control board
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>, Krzysztof Kozlowski <krzk@kernel.org>, conor+dt@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org
Date: Sat, 30 Aug 2025 15:24:37 +0100
Message-ID: <175656387714.501865.14707361524569628815@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2025-08-30 14:21:46)
> On 30/08/2025 13:14, Aliaksandr Smirnou wrote:
> > Add the Device Tree schema and examples for the Pinefeat cef168 lens
> > control board. This board interfaces Canon EF & EF-S lenses with
> > non-Canon camera bodies, enabling electronic control of focus and
> > aperture via V4L2.
> >=20
> > Power supply is derived from fixed supplies via connector or GPIO
> > header. Therefore, the driver does not manage any regulator, so
> > representing any supply in the binding is redundant.
> >=20
> > Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
>=20
>=20
> b4 diff '<20250830111500.53169-2-asmirnou@pinefeat.co.uk>'
> Grabbing thread from
> lore.kernel.org/all/20250830111500.53169-2-asmirnou@pinefeat.co.uk/t.mbox=
.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 9 messages in the thread
> Could not find lower series to compare against.
>=20
> You are not making it easier for us.

Could you explain what's required to tell b4 to know about earlier
versions please? (Or point to the documentation?)

I don't know ... so I don't think a first time contributor would
implicitly know either.

--
Kieran


>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Best regards,
> Krzysztof

