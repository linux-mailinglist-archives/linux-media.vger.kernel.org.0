Return-Path: <linux-media+bounces-33485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D9AC5A9B
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 21:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EAA9168F66
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4152882DC;
	Tue, 27 May 2025 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTZ1gvhA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CD280032;
	Tue, 27 May 2025 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373864; cv=none; b=hWmZzBDjdQc0YPFas+sV1EJEVGnCDsVV4TaJG2fB4VPM7n4Hxi0YmwXySGQ4kdD6dZsS9armXVNJ5H9o1GyFRo7TUB0MdDxPB013m0LnuItXRL8zmYHjLyFARMFjxB6L9jEq74prCP9wsJVEKQJwAF8ESElBbyE9LlYxD06YbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373864; c=relaxed/simple;
	bh=4TNgnPDA0eVa0Av9JU4ne/2B4SnN+LPpUfatiIDNGtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlIcA/tPN8OlJnTHHxSG0ByhoapdGeJQpUofynD3beiN+j2Xp2D+A3mQVOcX7TNUsIlBh2ftNHqGfj3aFLTXeBEijLNicIrC8GohSY24LgYpEJFdsRJeZz8aX74QHd9rTU0i9gZGJ/sphXhuaQTA0QX9HJfna4CL5uPX/jXHTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTZ1gvhA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92251C4CEE9;
	Tue, 27 May 2025 19:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373863;
	bh=4TNgnPDA0eVa0Av9JU4ne/2B4SnN+LPpUfatiIDNGtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTZ1gvhA6DDbuD/WwFW0d7R055vUuXwq1opJwH2y3XOcluCnRriBpnH3SEXhUfgpl
	 ZPCj/PCiE+/imI8P0Bk/hyJKnQ145pZrZvjKm1T6XNHddt6WhOyjqOniOraMb0HMH7
	 F6B5z/LkE1Vhsd75haIU96YhyP5aZCupCnxZVi/Jz15HdJMzS9jzcrF/ISqSETtFCI
	 UKCASCa7AAvJriaBbcEnyNmJC2d6d/Ma5eiMEaPa1owUwkIzmKHFmFvbMOG8fP5+v1
	 saxSA4yWKgHBgOH1ogWTgJrWl7oxzOU8QWe3j1GAJqybvmD279XpOp8VPneBOyaCr3
	 jvQ3wr5PPqdQw==
Date: Tue, 27 May 2025 14:24:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: sony,imx219: Allow props from
 video-interface-devices
Message-ID: <174837378792.1081816.13138814553830380239.robh@kernel.org>
References: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>


On Thu, 15 May 2025 16:29:42 +0200, Alexander Stein wrote:
> Allow properties from video-interface-devices. The change is identical to
> commit b6339ecfd0865 ("media: dt-bindings: sony,imx290: Allow props from
> video-interface-devices")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Hasn't been picked up in 2 weeks, so I applied it.


