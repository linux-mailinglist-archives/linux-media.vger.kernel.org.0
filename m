Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3223408E2C
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241701AbhIMNbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242167AbhIMN1p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:27:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 961EB61251;
        Mon, 13 Sep 2021 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631539387;
        bh=0GBD29h7Rxj8HKWi9tSrb3Jx9r9Q9O70ZgEuvKuXwa0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jR4SWzfQM+dKAWTuApLA3POa+pCpJ3wdhTlIXTnBHFiTsdWpmawkLr0Vq5bLFXbWL
         RS9j4FVqUD5BokQpPyPJxQRcQpdHhnDZhKY8zjHsEJjkCNdxprK/k40oQLqAF1UnmV
         r/CmbpyS9ztddIaoMHWrMyz3q7B15Ma2y/kxzAOCTkVP0I1gRC5XPi+Q8vA7wE9Hvr
         Mp4+cvUgVKOOOZ2msOIeD+CppGEf5EgkUVh1wcRJjc/I7B5xToHvcSuWKEt7Cy3Bj8
         zkvj566KT4WsSeloaMJoA4Qjl5sb5tujuSOLoUE0nMeF+qkehs5gpp/DxIW//E2mGs
         YvkuK9SQEw90g==
Date:   Mon, 13 Sep 2021 15:23:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Salvatore Bonaccorso <carnil@debian.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Security Officers <security@kernel.org>,
        linux-distros@vs.openwall.org
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <20210913152302.76d57784@coco.lan>
In-Reply-To: <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
        <20210816072721.GA10534@kili>
        <20210901104026.GB2129@kadam>
        <YT39LBTgGL/b/V5N@eldamar.lan>
        <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 12 Sep 2021 11:26:10 -0700
Linus Torvalds <torvalds@linuxfoundation.org> escreveu:

> On Sun, Sep 12, 2021 at 6:14 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > On Wed, Sep 01, 2021 at 01:40:26PM +0300, Dan Carpenter wrote:  
> > > On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:  
> > > > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > > > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > > > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > > > be an additional check for that.
> > > >
> > > > I also added checks for the "write_pos".  I don't think these are
> > > > required because "read_pos" and "write_pos" are tied together so
> > > > checking one ought to be enough.  
> 
> They may be in sync at a fixed offset, but the buffer length of the
> read ("int length") is not in sync with the buffer length for the
> write ("sizeof(c->operand)").
> 
> So I do think the write pos limit checking is actually necessary and needed.
> 
> > > > RESEND: this patch got lost somehow.  
> > >
> > > What the heck?  Someone on patchwork just marked this patch as obsolete
> > > again!!!  
> 
> Can we please make sure patchwork has some logging so that that kind
> of thing shows _who_ did this?

I've been wanting a feature like that on patchwork for years. Basically,
when there's more then a single person capable of accessing a patchwork
instance, there's no way to log who changed the status, nor to control who
can delegate a patch to someone else or not.

At least for me, touching patchwork is very hard, as the the entire login
logic, as well as the database model itself, is abstracted by Django. So,
I can't simply change a SQL insert clause there to add something else to
their logs nor to change the sent email that it is pushed when a patch
status changed.

I ended adding an internal log to indicate when I do some changes on my
patchwork instance via script a couple of years ago.

> > Someone knows what is going on here, i.e. what is the problem?  
> 
> Dan, can you just send that fix to me directly, with the fixed commit
> message (see above), and we can close this.

Feel free to add my:

	Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> That still leaves the "who closes things on patchwork" question, but
> that's something I can't do anything about.

I'll double-check my scripts in order to identify if this came from
my side, and if so, fix them.

Thanks,
Mauro
