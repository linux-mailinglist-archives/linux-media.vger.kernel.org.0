Return-Path: <linux-media+bounces-34471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39879AD41D6
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 20:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2848E1893C7B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEDB247294;
	Tue, 10 Jun 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W1JWv9Kp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4323AE96;
	Tue, 10 Jun 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579579; cv=none; b=j288ZOVEvsodzSRs5jI9Vm7S+NYrRHD11oJXDwpiZ5kJfQ4q/vGgP0n9rEN9DrRCfO2Y1jNHunPcj4jgk4++xfvFwnAMAJxNlm+wNAI59S1KFpxAu1DWId2xhORyO9LbZl3nJ7N+zpMmsKKa0Y646JF2emVSps8/nfj7GpuojGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579579; c=relaxed/simple;
	bh=Sf+/PTs/Lz5YxcSzgeZ6krRCOhaKZUsHSbB6B664SQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sAwi8Pqz3p8Jl0XiNiHiTxgsnPfjzqP6Dt1ngT2wRLlo6La3QzuKyCymElQ7a5jdsrgBa7gr1p5wrLMUqAq3XGDs0DEgHcejQ1OmJgWoxy9dCqE4nd0zAiO9qZXKomu5UdL8F42g+19i44hn22jAIDjtn0148LO7bJDezheDwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W1JWv9Kp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749579569;
	bh=Sf+/PTs/Lz5YxcSzgeZ6krRCOhaKZUsHSbB6B664SQM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W1JWv9KpviFteALr6LtWRjuNi/DB62SY7Z7oPEpnHgI/4Lfy85z1VLQ+27tsGhOxY
	 vRxxj/L5s8IpBFHQuyOPcflvF7qUr87yiWLTk9ezT/TWxhfODcCbJIh34EPjqKGM3h
	 wrDIld7ZbHxppg0CNIkKJkh2h7ioXurEzICh4rsVOGu8shQgfzrRPxXym+8iqz1Gcc
	 d6QC7gHCDkaxNsqQggPfMPbkoXAI4w417r4SV+ituO8JQjEynKMllEBoQ9zoLGkfAa
	 9emBbI3vCLjLtvkCek1B6kkL/ZpMXmcjeoaOoQxGLD1lKy0Wbknxog7jm7VJj9RnSf
	 g/Y2ednB6sYtw==
Received: from [172.19.207.65] (unknown [66.205.13.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E891C17E0FAD;
	Tue, 10 Jun 2025 20:19:09 +0200 (CEST)
Message-ID: <c666ab1bbc619cbb99fa38b96891a24ca22c9672.camel@collabora.com>
Subject: Re: [RFC PATCH 00/11] VC8000E H.264 V4L2 Stateless Encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com,
 	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, Sascha
 Hauer	 <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paulk@sys-base.io, 	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 10 Jun 2025 14:19:02 -0400
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marco,


Le vendredi 02 mai 2025 à 17:05 +0200, Marco Felsch a écrit
> 
> [1] https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11
> [2] https://gitlab.freedesktop.org/dude/gstreamer/-/tree/h264-stateless-encoder

Can you rebase against the upstream work:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5676

A lot of changes Michael made in your branch are already in the upstream MR
branch. An example, in the upstream version, the src pad (CAPTURE) is already
being set before the sink pad (OUTPUT).

I'd like to open the discussion about sizes, as I'm writing things down.
In your modification, you affirm that the encoder must ignore the size
set on the CAPTURE. At the moment I tend to disagree with this
interpretation and would like some feedback.

There is couple of different sizes we'll have to support:

1. Allocation sizes
2. coded size
3. display size

My believe is that we want to split the size in 1 and 2 since the padding
added to the allocated size should not affect the amount of bits that will
be compressed. We should be able to further pad frames without increasing
the compressed size.

For this, I wanted to mimic the stateless decoders, and define the coded
size, the one that occupy space in the bitstream and found in the sequence
headers to match the CATPURE size.

3. does not exists in stateless decoders, since it has no implication
in the decoding process. This one I'll leave open for now, since its
only needed if we have to generate some headers in the kernel. We have
had a lot of discussion toward that, and if so, I will pull in the
use of S_SELECTION.

regards,
Nicolas

 

