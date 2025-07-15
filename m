Return-Path: <linux-media+bounces-37736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648EB05260
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1487A189D7B4
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B523126D4CF;
	Tue, 15 Jul 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QL9ZnGDO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069CBA3F;
	Tue, 15 Jul 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563086; cv=none; b=u3X49WGoebRZvhZYnrctQUBitijRpoOzVFVpivSk45mi+ApXy1DRw3jzaooTDZQ+x3BQRcgWwqH3t7qJbSZzF/H3WbI0mfded2iAyxsbIXiJRud045L7boOUEf13u+toxhh1S6Pyxf1QdqJTLQMlY9vCJSKQN3MD1GLF9+OFi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563086; c=relaxed/simple;
	bh=iQ3AUPAJfWQCd35UgB2b/RAHxRDDRcxgLffQjX4XCjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEATGqMO0Z+AX7KhiO3efZoXoxiGPONrvN7Dv6Djw4rhr/PUBz90uA5ymWCnZ8eVzvcDW1Xxjc+vKvrHfEY2gH6HDB2FDKLYTeo0iwUBtDownpVLcP8LYDkntXQba1annQeg7LoZHaV95oYiMauJXldtccuFMKzp3pDsssIY1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QL9ZnGDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB34C4CEE3;
	Tue, 15 Jul 2025 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752563085;
	bh=iQ3AUPAJfWQCd35UgB2b/RAHxRDDRcxgLffQjX4XCjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL9ZnGDOrLnZfsopTZrdepJknrquz0SVURCrAXBOcnXa2W7TCOBg9/IMVdqKprYGG
	 CeOfzD+g/ZoY5HH4tCj9XfbpiSWTuPetEu4voJH4e3DNiNEtoxOzu/Yh6zxCjuwJ1Y
	 i/ObF7eHRlzuatu9i2uNcPRMzWHs5NH6BgovJrF0=
Date: Tue, 15 Jul 2025 09:04:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Martin Weidenauer <martin@weidenauer.cc>,
	Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
Message-ID: <2025071510-skeleton-squealer-f9bc@gregkh>
References: <20250714153409.46085-1-martin@weidenauer.cc>
 <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
 <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
 <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
 <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>

On Tue, Jul 15, 2025 at 09:57:19AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 15, 2025 at 12:54 AM Martin Weidenauer <martin@weidenauer.cc> wrote:
> > On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >On Mon, Jul 14, 2025 at 10:39 PM Martin Weidenauer <martin@weidenauer.cc> wrote:
> > >> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > >> >Guys, please, coordinate and issue only one (or a few) patch(es) per
> > >> >an issue. No need to send zillions patches for the same problem
> > >> >file-by-file.
> > >
> > >> >On Mon, Jul 14, 2025 at 6:34 PM Martin Weidenauer <martin@weidenauer.cc> wrote:
> > >> >>
> > >> >> Fix checkpatch error "ERROR: that open brace { should be on the previous line"
> > >> >> in ia_css_dvs.host.c:277.
> > >
> > >> I deeply apologize, however this was the instruction of our workshop in DebConf by Helen Koike <koike@igalia.com>
> > >
> > >This may be okay for the driver that consists of let's say less than
> > >10 files, AtomISP consists of dozens of files in several (nested)
> > >folders. It's not a good example for such an approach.
> > >
> > >> Here is the link to the exact workshop:
> > >> <https://debconf25.debconf.org/talks/55-submit-your-first-contribution-to-the-linux-kernel/>
> > >
> > >Hmm... this really needs an update to explain how to work with the
> > >drivers that contain many files and literally tens of thousands lines
> > >of code.
> > >
> > >In any case the problem with your contribution is not the code, the
> > >absence of coordination and possibility to clash with somebody else.
> > >Also it looks like a DDoS attack against maintainers capacity. The
> > >smaller patches are and the more of them --- the less the usefulness
> > >of all this activity as at some point that floods the maintainer's
> > >mailbox.
> > >
> > >TL:DR; (always) Use common sense!
> >
> > To be honest, such a contribution also seemed to me a bit useless but I thought all of this had been discussed with you maintainers beforehand.
> >
> > As it seems this was not the case, although the workshop has shown us how easy it is to make contributions and for my part I will use the knowledge to make meaningful changes.
> > So you can scrap this commit and I'll make a few commits in the next days which make more sense.
> 
> The problem is not the code, the contribution is okay and appreciated.
> The problem is that for _the same_ issue there are tons of patches
> from _different_ people. Just discuss who does what and send "one
> contributer == one issue" (under one issue, I mean class of the issues
> checkpatch or other tools report, for instance, the "if (foo)
> return;"-like which are on one line and needs to be two or more lines,
> do _all_ of them by _a single_ contributor.

No, that's not necessary at all, really.  Just take them in the order
they come in and review/apply them as normal.  Don't expect people to
coordinate together, especially for staging stuff, that's crazy.

This is just part of staging, it's the maintainers job to help guide new
contributors like this.  If you don't want to do this, that's fine, just
delete these media drivers out of staging then.  And don't blame the
submitters, it's not their fault at all.

thanks,

greg k-h

