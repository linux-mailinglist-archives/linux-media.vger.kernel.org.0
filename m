Return-Path: <linux-media+bounces-37437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C825B00F61
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87E397BF738
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6B02BEC4A;
	Thu, 10 Jul 2025 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQsiYMOH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41372BE05F;
	Thu, 10 Jul 2025 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189083; cv=none; b=T1u5DbFHlSeI3rm9BwfcdMQUqYdF6ey9NFzXRBRHhJ9+qURUIux8loIlqfnuYUj4a9LXI41WttuxqcyOnW6ObyNPYueI2j5o/0XLDT2PPTFEAVL0PdsDQN9vqTxwaVJR/lrWKzmV+qmAjo8dSVifTr8x3Y9gAJaNpPGO8Di4Gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189083; c=relaxed/simple;
	bh=LR7rti/7PinxOyyaOrUfWBqjpx53KI+jxegMgtirUXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyPoCLQbOTZTROjFLVZAYSudxHKzjV3P0q9oG9ryKx8Tup9ns1zLg9HrUYRieeJ1BkPhDEJgbWBlld7YxRXdQaVvCFisRvf0KYyKtc0ntVo+DmD2R1Xcg3mvzClT+GxOP9uN0RcNakq8xrpMGSMZ12m/1SNb80J1az3rPPJnQD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQsiYMOH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF70C4CEED;
	Thu, 10 Jul 2025 23:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752189083;
	bh=LR7rti/7PinxOyyaOrUfWBqjpx53KI+jxegMgtirUXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQsiYMOHK0+VDocl1fZRggkIJ1n/kCOYijWiwis64q+uwNvWEMUcIsw5t2Ow7dQuh
	 /u8pQVTlS5luhYWuIpxPJ7WQZZbY9RfoC3H+0IH2PlCWWlfFNMc0eNBBtkaSThh66S
	 w/FeCbsJwbfJA4r+TdNe9n9umh/DbSS0WHovRZt6ZOA6rV4CDpwAWETBI1F+9RciHN
	 U791VW7KpZF3t4D4gMKoJb7CAISmf/J57UsK3/6755zuwHPGQIw5TCiUNegL2WIFzL
	 /EldM4ERwC5vfEZaWTiXAl/CA7VVRNMxLwJ3e/RY5G2VMb8umgOrV2eeKcTELiuSLe
	 MKKezZn0ulAuw==
Date: Thu, 10 Jul 2025 18:11:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	devicetree@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 02/72] dt-bindings: media: et8ek8: Deprecate
 clock-frequency property
Message-ID: <175218908162.55901.212054920394525950.robh@kernel.org>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-3-laurent.pinchart@ideasonboard.com>


On Thu, 10 Jul 2025 20:46:58 +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Drop the property, and update the example accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/toshiba,et8ek8.txt      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


