Return-Path: <linux-media+bounces-27533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62281A4F327
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 01:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50E3188C7A7
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 00:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E35A86330;
	Wed,  5 Mar 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="vvcv9+3r"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271653B2A0;
	Wed,  5 Mar 2025 00:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741136365; cv=none; b=e8qLwBrF7tqf3K3VAe6TxL/ERtM/Cil5W1bfOh0IcIm3PPhUEDWErNy7MT0rpFpHiWwbOlmL2QRGhcX1ELkCUUMtwICd+/pPqCQnpnw1u3eIXMRIB+pfr6/QaLrLnNezqYyoeX7iYQKjjznBMFlDL62HSzAHYHMBXLSzLYzvxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741136365; c=relaxed/simple;
	bh=WGKPn6Lcu1tG4HbdYtl5xUp2r4W2UHUW24ByLdVbBTM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cdQmCX22biccRbk3PDbOESjOBjVpm3rjLQfqojpKCaSBHzN6NvRQKrRxkhlxOoSonlBI7LMt0qOgtsIPkbkYgz90Wv9lrecRRJdX3kkqc49C17QqZ46npyFSM2oNd/8ipdx+0Z035WFa90094MTrkodMNpu0zR0XpkSsbeunlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=vvcv9+3r; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z6vMM6CMnz9sDC;
	Wed,  5 Mar 2025 01:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1741136351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+ZY31mwMBYNXiIDfFFLjYMHOtlHQsLzWF/C7XP8dnM=;
	b=vvcv9+3rtspBvWyfZd6velSRmXfLID17p/InXKYl9N97k4TH1SlVuFJDhQjeok5AkhX/WX
	s3sJAAc1XP+kL7DxiE1JSNbkqCIVCCYyeSTWbQifym1Tmt692SE18dD/h5EMvn6dWqgQl9
	M077dUIs+njiATNFzRS/HPYSg3otL4vkDhmLR725jzJ+qFKYy2h0Mu/mzMXv6Zatbu4Qqz
	byoo3EAzCIrFFflGo+RAYV9BDVS8meiDs+PuaMAuFXNcrKwYqk62ZC2h9DbG1owOBBaVNE
	2gLnTshZQKz6pCSSKmhtw3EIp51GFBzG8oYtE6EKzQuguabsiv9i5Yhm2zZ6xA==
Message-ID: <1039aca7-89b9-44ef-9775-e7852e956362@timsurber.de>
Date: Wed, 5 Mar 2025 01:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
From: Tim Surber <me@timsurber.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
 <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
Content-Language: en-US
In-Reply-To: <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

I did some more testing. That the Apple TV did not work was a bit 
misleading.

It was just, that the Apple TV defaulted to 4:4:4 Chroma which does not 
work at all for me. (The same happens using the vendor driver).

When I changed the EDID to match the vendor driver the HDMI handshake 
happened with 4:2:0 chroma, where I could verify even 4k60fps using your 
driver, nice!

So the remaining problems I see are:
- 4:4:4 chroma not working in any resolution
- 4:2:2 and RGB not working in 4k60fps (is this a hardware limitation?)

A possible workaround could be to disable these non supported formats in 
the default EDID.

Best regards,
TIm

