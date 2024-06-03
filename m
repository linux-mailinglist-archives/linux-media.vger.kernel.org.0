Return-Path: <linux-media+bounces-12479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B18D867B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 17:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F5511F25A30
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAC6132123;
	Mon,  3 Jun 2024 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="D+zEcert"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F0131736
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429841; cv=none; b=W7rXzwR/hktAclE9nHQpbMyc9IHUrruJfZdAStevnjzaJvCk1rSy6fX1spfd2IWMjioLCv3DzsGD2FjM9DXXQZ0DHuy1qVRqMjtgcutoXGQIsCmA5FG5RbzXxqJex8dJYzZdPBD0OG90U9tfIfzDUs4oaO7JTJItp0GJlIx6WMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429841; c=relaxed/simple;
	bh=EIk/OCxOr6s7m6nzaLWsUUPelToDAz/HweSq4ldD3wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/oPi6Y+GFL06rSnFefHkeQEmSpwT3hNTZdvFFNemIhsSORCbg6LvrCUFtRqH49I6zPB/5db8jJZx3S2gnKfYYpg0nzFmbPHBqXnY6JOPSMyEx2RxoJHQrONo9cczD38YlnR6DL993Vh6C5UCnF1pvCnZ2G+KYIbQqtasR/wUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=D+zEcert; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Envelope-To: liujianfeng1994@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1717429836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aTmnFmkb8bF4TERqRFMbzfPb+Pc3fo4b54LXUjoLOuo=;
	b=D+zEcert3hN9qGsK+AcXWlJsjl3Db9gKXd9jdOfgBXOdhBF/Rj6hfCYf6UV8El6Mo8Zw85
	se61lByt+dUN8+uOWuYBrqOpYFr7cMX/ObegFYCrTB88zL4S5AzP3bDeILhxxNCKraqs5f
	zOLbHrxfKRpT69dPS7dw4jJ4R3uE6jTbo0YRtvXitxRLuWSHpdEzyx8WZszT6tu0wzRJJG
	36ck3nAPg+HtfwzYeR1WHvFpI2D7QVdqGA9x1kL0Wj/QiGDGs/vcKGTnWWNQQYX+Odwmhv
	I8OMDl/mgsZ56PH+SZUmrFY3jCGEhdyY4JC7uus2qf81hf3p3/yg5d+olUH4jg==
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: ezequiel@vanguardiasur.com.ar
X-Envelope-To: heiko@sntech.de
X-Envelope-To: jacob-chen@iotwrt.com
X-Envelope-To: krzysztof.kozlowski+dt@linaro.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: mchehab@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: sfr@canb.auug.org.au
X-Envelope-To: liujianfeng1994@gmail.com
X-Envelope-To: nicolas@ndufresne.ca
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: liujianfeng1994@gmail.com, linux-rockchip@lists.infradead.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, heiko@sntech.de, jacob-chen@iotwrt.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mchehab@kernel.org, robh@kernel.org,
 sfr@canb.auug.org.au, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: Add RGA2 support to rk3588
Date: Mon, 03 Jun 2024 17:50:23 +0200
Message-ID: <1952296.0IMdUL435T@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240322064734.3509132-1-liujianfeng1994@gmail.com>
References:
 <20240322052915.3507937-3-liujianfeng1994@gmail.com>
 <20240322064734.3509132-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4429252.AOvsMelbiZ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart4429252.AOvsMelbiZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: liujianfeng1994@gmail.com, linux-rockchip@lists.infradead.org
Date: Mon, 03 Jun 2024 17:50:23 +0200
Message-ID: <1952296.0IMdUL435T@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240322064734.3509132-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0

Hi Jianfeng,

On Friday, 22 March 2024 07:47:34 CEST Jianfeng Liu wrote:
> This node is not sorted by bus-address, and anthoer patch adding hantro g1
> with addreess fdb50000 is not merged. I will send v2 after that patch is
> merged.

AFAICT the hantro g1 patch set is waiting on an answer to several questions 
Nicolas raised, so maybe sent v2 of this patch set first?

Cheers,
  Diederik
--nextPart4429252.AOvsMelbiZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZl3mPwAKCRDXblvOeH7b
bsnfAQC/cE8BH/2LVsh7rUJAf/rE0KjB2ckiPPsnjj2I3lHepAEA0VQJxXLkXPKS
B+Be5H5BThEaVFp5ODi5Cz5zKSu8qAY=
=XRA5
-----END PGP SIGNATURE-----

--nextPart4429252.AOvsMelbiZ--




