Return-Path: <linux-media+bounces-39573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E4B224A6
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686603BDDCF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBFF2EBB90;
	Tue, 12 Aug 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n9NDDkgg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A90311C27;
	Tue, 12 Aug 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994785; cv=none; b=luFgmpGwOUm84QnF1cxGrWE3vxnxheV5yR9u0UujDlPmGhV11NCJWxosT1A7QNQ7Lqh54X1B/4Rg/g/3ax/431CuPz2lg16hHMmybJ0O5Jrv+OIlLhROVS3t8r/kcOtH12WpobVfdbtTtYKMHuTnMCxbedcmbD+ReRTANFzAbVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994785; c=relaxed/simple;
	bh=N/zIXxDe3G/XcFSJ5iLcD4wYwc9bg47M5HzamE2Ado8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VO1Lpv5z3FK7JgtExKSZ90PGVC4GL87VR49L1lTaV4omX/N3HrNLNTLIO7y7qAPr84aRiSh5x9N3CYYDZ0AS5OLhrf/EwgyleVxSwyOQv62XWltS9tn6tFoEFa1K6LwU8Nlo1hlkbK7yL2G2TlMH3+AH3qp9TPuizd22z8ChB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n9NDDkgg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49A983D5;
	Tue, 12 Aug 2025 12:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754994728;
	bh=N/zIXxDe3G/XcFSJ5iLcD4wYwc9bg47M5HzamE2Ado8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9NDDkggCX2zZjc9kd+xyESuqoBhnKN+B6QOO6dCfmIcyIPR8dsmG02S9uS6Gacky
	 XsvwDKo2NU2ZdfNIZc2pUokrqIX4arAHMesCPqh7Y6EtJHfu3bKP9D9VQinWU0TDde
	 cxSl6WM2Xv6aJ9OPGJ5YW1miOGdCXHCl2cQiKFBU=
Date: Tue, 12 Aug 2025 13:32:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
Message-ID: <20250812103243.GK30054@pendragon.ideasonboard.com>
References: <175308758352.3134829.9472501038683860006@localhost>
 <m31pq9y98z.fsf@t19.piap.pl>
 <175326599663.2811177.16620980968274114885@localhost>
 <m3h5z2vw12.fsf@t19.piap.pl>
 <175344176070.2811177.10693943493658922992@localhost>
 <m3qzxyug1s.fsf@t19.piap.pl>
 <m3cy9futcj.fsf@t19.piap.pl>
 <m34iumujcs.fsf@t19.piap.pl>
 <m3zfcet41n.fsf@t19.piap.pl>
 <m3a545t789.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3a545t789.fsf@t19.piap.pl>

Hi Krzysztof,

On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Hałasa wrote:
> Hi Stefan et al,
> 
> BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> 
> The problem is the CPU core power supply voltage :-)

Ah, the dreadful overdrive mode.

> - while the reference manual specifies the max ISP and MEDIA clocks at
>   500 MHz, the datasheets show this requires the "overdrive" mode =
>   increased CPU power supply voltage. In "normal" mode the ISPs are
>   limited to 400 MHz (there are other limits, too).
> 
> - I've tried lowering the clock rate after booting the systems (with
>   a CCM register write), but it didn't fix the problem. I guess some
>   reset logic is affected here, and the (lower) clock rate must be set
>   right from the start, in the DT.

That's interesting. I wouldn't have expected that.

> - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
>   the ISP2 MI corruption. I'm currently investigating PMIC settings
>   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
>   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
>   though.
> 
> - the question is if we should lower the clocks in the main imx8mp.dtsi
>   DT file, or the overdrive mode should stay there, and the changes
>   should be made to the individual board files, or maybe the U-Boot
>   configs (PMIC output voltages) should be changed etc.

I think it would make sense to lower the default clock frequencies, and
provide an overlay to enable overdrive mode.

It's also interesting that the issue only affected the second ISP, as
the first one should also be limited to 400 MHz in normal mode.

-- 
Regards,

Laurent Pinchart

