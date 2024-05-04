Return-Path: <linux-media+bounces-10774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16F8BBE1B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 22:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F174B2140B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 20:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6581583CCD;
	Sat,  4 May 2024 20:51:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.sig21.net (mail.sig21.net [217.197.84.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEA1EB3A
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.197.84.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714855915; cv=none; b=CCJ0OXLlkm1VHwQzMhUNbUKbu9Mxums535b1ID5zuuf705dHfolEsrfeaDx5BjhUKU07DaWKzZF6f5XALx9bZuLhYgz8w4O9tMjUiffLvTH3HhjgMOxFu23lgHDNKaL4NhaEs6jKNntCZZvzPBgEiNvSPaDZP0JDJrCaCSwOZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714855915; c=relaxed/simple;
	bh=16xIcQmc13eTXtAftih13TnYuBmz5hdTaBeY8A6+RZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8g1yizM+4cN9q4wrKZh8WjuCJDy3gTOBdxn7UIp4ezEJpjmcN5s8vaqQ/Uovcm1XESeaApKQlxNUKHoEf1VX30m4nsGDPzAkRa5DAUtJXcznSBnSEpojmrnwZFMIbWGTmV4UdKhqwikTdcTzpHZJ6l7dVGelwsGr81o0IaceXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=sig21.net; arc=none smtp.client-ip=217.197.84.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sig21.net
Received: from localhorst ([127.0.0.1])
	 by mail.sig21.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	 (Exim 4.94.2)
	(envelope-from <js@sig21.net>)
	 id 1s3LwA-0000gh-4S ; Sat, 04 May 2024 22:24:50 +0200
Received: from js by abc.local with local (Exim 4.97)
	(envelope-from <js@sig21.net>)
	id 1s3Lw7-0000000031b-3Bka;
	Sat, 04 May 2024 22:24:47 +0200
Date: Sat, 4 May 2024 22:24:47 +0200
From: Johannes Stezenbach <js@linuxtv.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [bug report] [PATCH] dvb: b2c2/flexcop driver refactoring part
 2: add modular Flexcop driver
Message-ID: <ZjaZj9Eo838SQAp8@linuxtv.org>
References: <e42e10a1-f414-40c1-a804-36bc67270088@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42e10a1-f414-40c1-a804-36bc67270088@moroto.mountain>

Hi Dan,

On Sat, May 04, 2024 at 02:24:21PM +0300, Dan Carpenter wrote:
> [ This patch is 19 years old now...  :P  Sorry!  - dan ]
> 
> Commit 2add87a95068 ("[PATCH] dvb: b2c2/flexcop driver refactoring
> part 2: add modular Flexcop driver") from May 16, 2005 (linux-next),
> leads to the following Smatch static checker warning:

I think the patches were from Patrick and misattributed because
I was too stupid to operate git correctly at the time.

> 	drivers/media/usb/b2c2/flexcop-usb.c:199 flexcop_usb_memory_req()
> 	warn: iterator 'i' not incremented

> --> 199         for (i = 0; i < len;) {
> 
> No i++.

>     208                 ret = flexcop_usb_v8_memory_req(fc_usb, req,
>     209                         page_start + (addr / V8_MEMORY_PAGE_SIZE),
>     210                         (addr & V8_MEMORY_PAGE_MASK) |
>     211                                 (V8_MEMORY_EXTENDED*extended),
>     212                         &buf[i], pagechunk);
>                                 ^^^^^^^^
> I think adding an i++ doesn't make sense.  Are we really writing a byte
> at a time?
C> 
>     213 
>     214                 if (ret < 0)
>     215                         return ret;
>     216                 addr += pagechunk;
>     217                 len -= pagechunk;
>     218         }

The loop is weird, but I guess it worked because the len -= pagechunk
would have terminated the loop and supposedly there was only one
iteration ever. I doubt anyone has hardware to test it, so don't
change it. Well, I certainly won't touch it, you can do it if you want.


Johannes

