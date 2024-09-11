Return-Path: <linux-media+bounces-18171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF097594F
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0151F27035
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538FF1B531E;
	Wed, 11 Sep 2024 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwHjrkA7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2F1B4C2E
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726075541; cv=none; b=ltYNj9lc674l1CZ8hkKEbF5bQIEaxHaFreMyGDqnG1hKJ/Ts21+aD94IGnVroiVsje4z13ux0ZmCNBETKnPZ6rA6N+qornaURtSYF4uOSNkRDZ+F29Kbo5SxGPK/A+WcSt+Gf62XbjAoyLWF9u9CR6oxzTZG9ktWQMb4EKnQSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726075541; c=relaxed/simple;
	bh=2CXGVg6NEhqLRKhGUyW5174lZyw87X6GSvdQUeR5MmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfN2C8bEmqzoaDIyljFP7vBhPe0fGgwWzLzQOEyx9h0fHDEwqJlfl7LQ2T+HFCxDkDPJ7BGHBnXBoJtrCX+bH0urVrlDisdVSSn0B6VU+Gju65Ztu16JjaPD/6+eN3f4tp2P18ughh2w/Yt3NCnC/Pmrz7JELr1g2oBVH3nrPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwHjrkA7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c4d4f219so72457f8f.1
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726075538; x=1726680338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmCKuyw0DapJvOtbSWzmF0OL2IUWJWDlS7+rw4t0ojA=;
        b=HwHjrkA7gzRnzqnFdZlE8r6f5osEn/6loIJMeUgfFx4K6WN80pA/kVCIa5Z2V2BRjK
         oBIAS4iyhXLPEyteeDJ2g/iOKbY6g746NyGc8G3DudBVDhzwdzvp4GUFLXSf9kTz6R4W
         OtWw5cnx6+4KIgkTKLzWtNAgIVuhuG3/mq3vhGlM/dcdkWYyxSoFxEjjk3MKjiuI1yZd
         JBjlhTRp9dyISMNvcHvGgYAeA72qQwwQFI/b4w1qlVEWFyjOqVnJ85gJzjm5lBEGBY8N
         JsTslB+5SyT9CRCvWieZ0bprCE0C8qYgGMhya917d5SNnXLn197NHtrzqQ/Eys7coEqA
         8eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726075538; x=1726680338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmCKuyw0DapJvOtbSWzmF0OL2IUWJWDlS7+rw4t0ojA=;
        b=osUOyR5D2BoamNuaBKVfomNkKtbxZbkybxLbtWyCu3GUmxzAW+/1PpdKr9kZ+1s2/d
         FWfChhi7eBC/VVSF3bvinivgUUOra5/4gmUDunfT3MTGcTuOrmoxhQlLufjcbc8XNkJu
         Opaj/soe6fwwSpqi2czXJpRKcXCOO1WTuOMlcZSq1xiZn4XCVdOhONBI5pKv4FanQqaO
         +dIUscLd2XNyi+e5YOHNVnkijBn41C89muwItKWi5a2J3Xok5Nu7SqWSJcUjH3sccYWs
         ghONS+UiLBWCtiQg5i5L3btzn7eKNz3EvUojsaaHCu3uzNBppmJVZeEmZIjs07uokS69
         ESuw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7H5AoZeM554wS8jrIlZpD3FRSoATLn6efQeyqawS7L2fVWhICB+D9ZkmSTVwPkpRjzit4x/BpAD6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgBVkSpliKNG+k6+dZ+Y0s6/z+WgfWiygKj5xPseiFfIY6n95
	FAGwToWihjfwImG6yFkrajRHC6oBUrIoqUUSKUpQrJ9xxZe9gj9hgHibY7I5Ozk=
X-Google-Smtp-Source: AGHT+IHwgouVHhx28DMTt5PoacyStj3TzOC4jjzt7G5qL8rZ2fYGdKla/4VYhBMKB9fgtOsriRz47g==
X-Received: by 2002:a5d:6111:0:b0:374:93c4:2f61 with SMTP id ffacd0b85a97d-378b07966dbmr2405056f8f.5.1726075538049;
        Wed, 11 Sep 2024 10:25:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a18asm12049442f8f.15.2024.09.11.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 10:25:37 -0700 (PDT)
Date: Wed, 11 Sep 2024 20:25:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Narron <richard@aaazen.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH hotfix 6.11] minmax: reduce egregious min/max macro
 expansion
Message-ID: <cd6e01fb-4605-4f5f-835e-592ca70ebe03@stanley.mountain>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>

On Wed, Sep 11, 2024 at 06:24:54PM +0200, Hans de Goede wrote:
> Hi Lorenzo,
> 
> On 9/11/24 5:34 PM, Lorenzo Stoakes wrote:
> > Avoid nested min()/max() which results in egregious macro expansion.
> > 
> > This issue was introduced by commit 867046cc7027 ("minmax: relax check to
> > allow comparison between unsigned arguments and signed constants") [2].
> > 
> > Work has been done to address the issue of egregious min()/max() macro
> > expansion in commit 22f546873149 ("minmax: improve macro expansion and type
> > checking") and related, however it appears that some issues remain on more
> > tightly constrained systems.
> > 
> > Adjust a few known-bad cases of deeply nested macros to avoid doing so to
> > mitigate this. Porting the patch first proposed in [1] to Linus's tree.
> > 
> > Running an allmodconfig build using the methodology described in [2] we
> > observe a 35 MiB reduction in generated code.
> > 
> > The difference is much more significant prior to recent minmax fixes which
> > were not backported. As per [1] prior these the reduction is more like 200
> > MiB.
> > 
> > This resolves an issue with slackware 15.0 32-bit compilation as reported
> > by Richard Narron.
> > 
> > Presumably the min/max fixups would be difficult to backport, this patch
> > should be easier and fix's Richard's problem in 5.15.
> > 
> > [0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
> > [1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
> > [2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/
> > 
> > Reported-by: Richard Narron <richard@aaazen.com>
> > Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
> > Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Thank you for your patch.
> 
> I must say that I'm not a fan of that this is patching 3 totally
> unrelated files here in a single patch.
> 
> This is e.g. going to be a problem if we need to revert one of
> the changes because of regressions...

These kinds of thing also complicates backporting to stable.  The stable kernel
developers like whole, unmodified patches.  So if we have to fix something in
sDIGIT_FITTING() then we'd want to pull this back instead of re-writing the fix
on top of the original define (unmodified patches).  But now we have to backport
the chunk which changes mvpp2 as well (whole patches).

regards,
dan carpenter


