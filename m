Return-Path: <linux-media+bounces-29504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35318A7DEF5
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD2F3A1041
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD9253F0C;
	Mon,  7 Apr 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPWATTfz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAEC223706;
	Mon,  7 Apr 2025 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031978; cv=none; b=Qxl51cXz9147vm2W1bSQwjaz0fO3mPe99QHvjGuPNJyGzZXD1tQ4TXAsDEJDkNrGwNP+j1HCDVLQrk8rC6O/T0yZh5j/mrXIut36rwjh76Yz50/VoiGtA4KI52ApZlFw2MLc5uEv+7Bgyf2F/rYCpdKr6iT7NzicYb/Cvvv5SJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031978; c=relaxed/simple;
	bh=gozt7pD50Tk+cO//aXwr2QRJY1Km3OTojfAu0/L94IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoRzU8zmea1a+wcSpLeVKeiHvYqkxhK/TA9g2pEPmwLk6Quwbp+emS6vftE1fR2JdV7wdpRYPdv1OiA+QqP7pHZL8En8O2R3OTVEiXS6N3iyK8mNqjBIfbxz2JEkeziYhBq3nfPCjBoUGorBiG3jI+LR48T2PchluEIMFbjumQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPWATTfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8809C4CEDD;
	Mon,  7 Apr 2025 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744031978;
	bh=gozt7pD50Tk+cO//aXwr2QRJY1Km3OTojfAu0/L94IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPWATTfzjFGuXz4rp2r9Zf5Wj9gpZaUoP8yln6POzkLf745TNvXBqR7vQn8QkbvBU
	 MzNqUqrtocPvgFiSFwafJFL4Y/CaEULp+KxofVX9gOI2Z6DaaHFx2DIJDrD/1n6N+6
	 lQQ0PDKUXOTBLmvvpV0nHtWgCgSboLBp9G2GjZ0n4UHAVAxQBAA6NG187FUHtF0rYC
	 no0kKjmgdV+7e8U6Ke/ssxzG7GRr0eNwqpEuo/CuywokACG1B6Fi+BS0eEvwtCRPkF
	 E93Ku0h24cWGSwuB/nxOz5EW1kGaiFKKEt/hByc2Tnh+DE3BFwps9zt1Q5ZcTR523F
	 7QDMFnUd0da6g==
Date: Mon, 7 Apr 2025 08:19:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: linux-media@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Message-ID: <174403197634.1932928.13155513755703081221.robh@kernel.org>
References: <20250403-hm1246-v1-0-30990d71bc42@emfend.at>
 <20250403-hm1246-v1-1-30990d71bc42@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-hm1246-v1-1-30990d71bc42@emfend.at>


On Thu, 03 Apr 2025 10:07:35 +0200, Matthias Fend wrote:
> Add YAML device tree binding for Himax HM1246 image sensor.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/himax,hm1246.yaml           | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


