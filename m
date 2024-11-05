Return-Path: <linux-media+bounces-20952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F62F9BD318
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 18:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01861C22164
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDAF1DE88A;
	Tue,  5 Nov 2024 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ndmnwMkL"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501677E591
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730826666; cv=none; b=rNhD3dY/tmtDHRoqMKYAuVrik0nFc1P1zofL7Rkh56HjNP5xDvhN4ZPZNOGXZ4W+PRAYQd9AmqcFxU+txi3V1FgD77Q/PUtaDBgEGNCfFiRefD0BFxjkwzn0WqlbUoITuDB3mQ1ymq68UCBRZe33T4tPNvz8Bt48mOvXRhHq1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730826666; c=relaxed/simple;
	bh=MhBbs2V3mvzQAgyQ7+99KQJgg2K9KAWnb8TxmeVs2cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioq2+D1+QuJs3o7bSEUCSO7M8BtWlkuMFKBNdqgzP5mSdDcrqgYYIL+qQXe73zh85wpAq2AqU+pchwAYZPPEDiMeqoUJINygxt4+vnQ9Cj6wQM76m4V74xuT+i+p0CHvl7wVIvBr1PNv/0ZhQEcl7Ruwa+XLVAVs1EFQe1iR+Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ndmnwMkL; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730826069; bh=MhBbs2V3mvzQAgyQ7+99KQJgg2K9KAWnb8TxmeVs2cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndmnwMkL03myEwRUTtLFc0V0JQsC8GNkg55gLoXpaWfeUaPvYUfTUDFzW/SB8yDPF
	 MdRdIsxSJQlvu4H87Iv64KdtUcgAJRarRTfsf04yuqX0gKBoXni49chRlbcpXdG5Nl
	 SGKlPF6bAk2YmU++m3eUdlfQE3OBBhHRVYRnwTTLNhU8TrllLje3D6P/RGmmVnKh01
	 9J7W6Ohk6rxVCkYw42zpisAqLX33WCln+dCiek+sJvMBMKa/Eq21nCoI7fwImM6AzZ
	 dIJ55KTxL1ZWXLyrs4z/zhD+X1MYuhor4vQHNeDC4gKoT+CaOh5Y8rFDEMwIrMSBja
	 5AYl2KrlAjsoQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id C83FE1000CB; Tue,  5 Nov 2024 17:01:09 +0000 (GMT)
Date: Tue, 5 Nov 2024 17:01:09 +0000
From: Sean Young <sean@mess.org>
To: rayquaza-intermittent-comb@nicemail.eu
Cc: linux-media@vger.kernel.org
Subject: Re: Infrared Nuvoton w836x7hg - TX possible?
Message-ID: <ZypPVUARggaAY-Xi@gofer.mess.org>
References: <a379eec2-b57b-4dd8-97cf-2018893670b3@nicemail.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a379eec2-b57b-4dd8-97cf-2018893670b3@nicemail.eu>

On Tue, Nov 05, 2024 at 05:26:08PM +0100, rayquaza-intermittent-comb@nicemail.eu wrote:
> Morning,
> 
> I want to automate some weird things and I have an old intel thing with such an infrared chip around.
> Lirc freshly installed on Debian finds the device and receives stuff from remotes. But lirc says the hardware can not transmit. Could this be by config or does that mean the hardware is definitely not capable of transmitting?

The nuvoton device can transmit, but the driver doesn't support it.

As far as I am aware there is no hardware available where the tx is actually
usable because there is no way of connecting anything for transmit, i.e. the
tx pin is just unconnected.

Is your transmit connected somehow?


Sean

