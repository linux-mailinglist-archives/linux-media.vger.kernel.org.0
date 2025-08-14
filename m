Return-Path: <linux-media+bounces-39891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD2B26067
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331AD5A348A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8402FF153;
	Thu, 14 Aug 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSxP7qnG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB92F60DC;
	Thu, 14 Aug 2025 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162253; cv=none; b=bli29oaGWPFaw2zu132nMIXhEiQd3AxDVuMXsVSq8Fw47gZR9EDZ2fTOUeQ3t1bTHQl9L+Idyl7AouwMPhpsJvAEi0EoewKo4DH2KYsiqjFI5XcymZmgyPbjbNmGOgi7Ql2v8zl0yvubYbJN7KKFSUw4yv6IVunZihLsWa0mCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162253; c=relaxed/simple;
	bh=+hes8Uw8cz0/rORYil46CAxBPAq3vqX7kyMyB4BvUto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEeK8iWPkYm6DCvhaf6wTsHjwGMZ5OMrYqTAw/6iz8n8lFQu1I7JPhLJ2bMHOz3vwx7eI/0tM2pWVkmPGKTvz/TJ/31D4CkV+Ylax5/t8ikuIurlEVBx0krpZJUV8WlGXrco07V+22XBourY+a2jAgQTE5y55ErZ2ibbcXyfXWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSxP7qnG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD360C4CEED;
	Thu, 14 Aug 2025 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755162253;
	bh=+hes8Uw8cz0/rORYil46CAxBPAq3vqX7kyMyB4BvUto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSxP7qnGvjSYJT07N0j1Idr0YTt3ppN+kKEJredDKNPwHfttNEh2VT+NZbq4/GzjP
	 R/QL6uKVN4saMrqIv2Q1UdcMgfRf62OqtmX0CTV1PuyN1RhKVURZAAJ78/6xOKQz/N
	 BG02RXcuWQz3ZzwbXyfI8URvF71Cq910Y2r6COJIuGcE8U5SSu3M5DO/aqTXbpoM2B
	 XYi1E9YrpQkLxtPd/t5Q7G+djEAZYjX5ITjEE5SRUh2IkFOR0y/LZU+FxfoVenIO+g
	 lAX5+MaB/TjDKexwtGqsdp9dvb2+S0X5cnbYbKVG9O/ZbJwqFvVvGhQaqIT5ZsqlS2
	 gdKjuuiOKgglA==
Date: Thu, 14 Aug 2025 11:04:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aliaksandr Smirnou <support@pinefeat.co.uk>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20250814-intelligent-industrious-cassowary-b73c9b@kuoka>
References: <84262447-0877-4c52-8c80-65f1288e5944@kernel.org>
 <20250812193722.10193-1-support@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250812193722.10193-1-support@pinefeat.co.uk>

On Tue, Aug 12, 2025 at 08:37:22PM +0100, Aliaksandr Smirnou wrote:
> On Tue, 12 Aug 2025 09:13:22 +0200, Krzysztof Kozlowski wrote:
> > Property says VCC, description says VDD, datasheet says 5V (not 3.3V).
> >
> > I guess this should be for the 5V case, no?
>=20
> Thank you following up.
>=20
> The 5V line is used exclusively to power the lens motor (through the
> power switch). This 5V supply can come from the Raspberry Pi GPIO
> header, a battery, or other sources. Importantly, this power source
> is independent of the board=E2=80=99s MCU and its kernel driver.

You describe here the entire board, not the MCU only or lens motor
only...

>=20
> Additionally, the board does not include any voltage regulators.
> The MCU operates at 3.3V, which is supplied either via the CSI connector
> or the serial connector directly from the Raspberry Pi GPIO 3.3V rail.
> Therefore, the driver does not manage any regulator, which is why the
> =E2=80=9Cvcc-supply=E2=80=9D property was absent in the binding.
>=20
> Would you like me to remove the =E2=80=9Cvcc-supply=E2=80=9D property as =
it was
> originally?

Can the board be used outside of above setup? I understand so far this
is only for Rpi where both above supplies - 3.3 V and 5 V - are coming
=66rom the header pins, so supplies would be totally redundant.

Best regards,
Krzysztof


