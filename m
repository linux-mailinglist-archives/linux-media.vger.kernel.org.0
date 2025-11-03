Return-Path: <linux-media+bounces-46194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE325C2B1A6
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599EE1888ADD
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7530B27587E;
	Mon,  3 Nov 2025 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtT0RQYY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135A2FF158;
	Mon,  3 Nov 2025 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166253; cv=none; b=LFP6Wc+qtkQY12E0diJ28hr/IO6PomKyBqp1IulX9AJeYFoHknJouTJZo16kkPTUjSl9eRZHLCmByZOxYFLrMWkjAhhR09lRY7KiQ3HY4nfooy9dvWdKxiElYmVbxBB+RXpcbavMyRwT+5cLKDL3Np/EV66RiI8ORTSqE4WRV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166253; c=relaxed/simple;
	bh=vMR6rWAXkpGjikisCFQgJrt6boc6D4CInZ51g4gfHHs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uKlQBjDdPZgyoyewbDPdsmN7xkr/y3x5Kx+VPAWJ0rumMdNWjNKQDhkcAxzgoWh1ciST7+rHXWKwzmhxhtpYLgEFrHzBr5yD3W268fMOxH6JNnsPjzcgD7Mi7TXPxjv3sZeZZZBERhtSNTOeIOP356QV8//I1k7kfXXwXwCAitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtT0RQYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6649DC4CEE7;
	Mon,  3 Nov 2025 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166250;
	bh=vMR6rWAXkpGjikisCFQgJrt6boc6D4CInZ51g4gfHHs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gtT0RQYYGj8OEYtVG8fcqoSlVbP+GITZKtrZWCbT4AWXT8aYurAOpwTOXMJ1qKlvy
	 Z84tBha+lzML2eMZVE7/kTpM1AmCeNFuRiOFwonRGJw1H+2gmi+U820GT/V78WNkxQ
	 igu4T3qXvI54MzPFMNJaSWsOLY8vjLaCmmZS6Vk7ID1y1KgBjCIV8h1XjHh01OO4mA
	 02XXfCZhiCwDBu7LZwplQAg/+xWW5X1JFOdnDWrLajH50ZDmnEGA67GmpO/R/M4vAt
	 SrxNzmZUg/yfHLdyfTZ9PySoUkDwbVTMIssjZyqgsZGKBv6kiQnqudBmRf8kQXHvg2
	 AuAIO8u90xXfg==
Message-ID: <ab9bf7c1-b170-49c2-b0bc-85a09f2e95d5@kernel.org>
Date: Mon, 3 Nov 2025 11:37:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] docs: media: bt8xx: Correct typo in vendor name
 (Connexant)
To: Akiyoshi Kurita <weibu@redadmin.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250927144528.170403-1-weibu@redadmin.org>
Content-Language: en-US, nl
In-Reply-To: <20250927144528.170403-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2025 16:45, Akiyoshi Kurita wrote:
> In Documentation/admin-guide/media/bt8xx.rst, the vendor name
> was misspelled.
> 
> Change "Conexant" to the correct spelling "Connexant".

Nope, it's "Conexant": https://en.wikipedia.org/wiki/Conexant

Rejecting this patch.

Regards,

	Hans

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/admin-guide/media/bt8xx.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
> index 3589f6ab7e46..3da0bbf6d16a 100644
> --- a/Documentation/admin-guide/media/bt8xx.rst
> +++ b/Documentation/admin-guide/media/bt8xx.rst
> @@ -19,7 +19,7 @@ This class of cards has a bt878a as the PCI interface, and require the bttv
>  driver for accessing the i2c bus and the gpio pins of the bt8xx chipset.
>  
>  Please see Documentation/admin-guide/media/bttv-cardlist.rst for a complete
> -list of Cards based on the Conexant Bt8xx PCI bridge supported by the
> +list of Cards based on the Connexant Bt8xx PCI bridge supported by the
>  Linux Kernel.
>  
>  In order to be able to compile the kernel, some config options should be


