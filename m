Return-Path: <linux-media+bounces-48969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD1CC692A
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73AEE3019E26
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E6533A717;
	Wed, 17 Dec 2025 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG+GBySJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2889265CAD;
	Wed, 17 Dec 2025 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960126; cv=none; b=I9W8cxtyk7fw+yQbil7QbPESpBaHQ5FPMWfeFRyjiQGzu/amBmXvv1xpWTTqgPN33i11bnjIJmKrdwl06j4pDah7zmsAoGbID8f2VVPr006fQpVQOMVgTVXY+o0t66BgwTL55n327G1O444pd3ngHTVbfdQg/1GCHqYcNWjne4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960126; c=relaxed/simple;
	bh=3+iHMfYuTZmZwFSxnvvYUZyf37LZbcd+C1fT2eEdK9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzxuehawdnP304ixfFAN95XhFjx/m8xdgxvT7P5s7Xc3uxK4wALrA4rjoixsn13VGJJs/2wJjz4mIaoYzvRmJcto0H2ZAT8+zVlllQJ/WV6KSzfcdDpORnY0+liWxazzze5nyZ7tTfnuoxWrtEAe9y/pW3tvWejkoouYr+qUBas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG+GBySJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5851C4CEF5;
	Wed, 17 Dec 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960126;
	bh=3+iHMfYuTZmZwFSxnvvYUZyf37LZbcd+C1fT2eEdK9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG+GBySJCxdAK3crN0rYP0sejvPoY5qMP+AfBzRNHs6eGsFY9kWCtnDWzxh3+wi9v
	 bG/qE8Bdo/e9E8NWMIj4MTxxrvPt4hikbVLR5w3mfFAkOjoDVzQXqEUdcTbds67/c0
	 WQSaQl9IEKZpo5a7muKXNv8GoVDUyACY6uyF3SOOHtUuDx05fmFPB79LUeQtkIbeFc
	 6JctkAXnXF2MpL7mDYEISFuO8vOGUyrxO0/WfAd7Os8NcXwjM51y4wBsICFyeIqI0z
	 xaVv18j3vXHs/KwX3+avz5XS5uBNVs6aiwq6BwwlhiO02NeMA25ExB0Y1ZV0de6r/R
	 uKWBQTqvqG7XA==
Date: Wed, 17 Dec 2025 09:28:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: media: omap3isp: document missing
 crc as optional property
Message-ID: <20251217-zippy-gorgeous-sloth-f1e8b7@quoll>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
 <99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran@gmail.com>

On Sun, Dec 14, 2025 at 11:58:35PM -0800, Alex Tran wrote:
> Convert the OMAP3 ISP device tree binding from TXT format to YAML.

Same problem with the subject.

I asked to convert the bindings first.

Best regards,
Krzysztof


