Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180931271A9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 00:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfLSXlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 18:41:39 -0500
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21169 "EHLO
        sender4-of-o51.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLSXlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 18:41:39 -0500
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Dec 2019 18:41:38 EST
ARC-Seal: i=1; a=rsa-sha256; t=1576797983; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Inz6YHSYhC779548yK6cPFAYkj1L6vFEDExMEGkTZFEfNqb+yuiWIFLTSzj0lMF4ksjpiqRGr8D6utPqQyjLGPRg4EqSSOiSnGU0RHVzezzQ1sZbMiIWv0g6zChqPaUmGiKTDWjRJPce6gK08WgReO2UxM0z0NTs/r4SeY+RaDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1576797983; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=YRwMCe3+7E5yL5rCzLP2abaTZ1SGUf1q183PkTOBBBU=; 
        b=HeAPxRLUuUDKJnJaSXxWlZaKAsWPT3LweVlf9nBcuReGrhEpUhWwsJXo9xwZmh7E47q/J572kGQCsMVS8wXOGcp9SbW3fnEVkFObY+B4Q1ImlEfsOC/iTOIzkk4v3+BBk8svsvleWa+iDEQ9GYAuVIQdPtd1IloKngISI4DWwws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zv.io;
        spf=pass  smtp.mailfrom=me@zv.io;
        dmarc=pass header.from=<me@zv.io> header.from=<me@zv.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1576797983;
        s=zoho; d=zv.io; i=me@zv.io;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
        bh=YRwMCe3+7E5yL5rCzLP2abaTZ1SGUf1q183PkTOBBBU=;
        b=iuvrt6wT4Yin5Ozj9gAnzkOUjr2JJrFPULCIr3ZIQdGTRqFP8cq/U+F+i/NhdGGH
        zjxEsXKWm64CmkgpUa+KjTUNcMXDKeAI7aOdyoHpmLdHW87ZSPjQB6hxMhPrX0ik9Zm
        mkw8KE905hUFEck5K37QbEAq5VBufSJAynk6iEkY=
Received: from lighthouse (cpe-70-114-218-141.austin.res.rr.com [70.114.218.141]) by mx.zohomail.com
        with SMTPS id 1576797982566959.8883413676132; Thu, 19 Dec 2019 15:26:22 -0800 (PST)
Message-ID: <1576797980.31912.110.camel@zv.io>
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
From:   Zach van Rijn <me@zv.io>
To:     Arnd Bergmann <arnd@arndb.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Thu, 19 Dec 2019 17:26:20 -0600
In-Reply-To: <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
References: <20191126161824.337724-1-arnd@arndb.de>
         <20191126161824.337724-7-arnd@arndb.de>
         <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
         <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
         <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
         <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
         <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2019-12-14 at 22:44 +0100, Arnd Bergmann wrote:
> On Sat, Dec 14, 2019 at 12:27 PM Hans Verkuil <hverkuil@xs4all
> .nl> wrote:
> > 
> > On 12/13/19 4:32 PM, Hans Verkuil wrote:
> > > > > ...
> > > > 
> > > > I've heard good things about the prebuilt toolchains
> > > > from http://musl.cc/.
> > > > These seems to come with a libstdc++, but I have not
> > > > tried that myself.
> > > 
> > > I'll see if I can give those a spin, but if I can't get it
> > > to work quickly,
> > > then I don't plan on spending much time on it.
> > 
> > I managed to build v4l2-ctl/compliance with those
> > toolchains, but they seem to be
> > still using a 32-bit time_t.
> > 
> > Do I need to get a specific version or do something special?
> 
> My mistake: only musl-1.2.0 and up have 64-bit time_t, but
> this isn't released yet. According to https://wiki.musl-
> libc.org/roadmap.html, the release was planned for last month,
> no idea how long it will take.
> 
> It appears that a snapshot build at
> http://more.musl.cc/7.5.0/x86_64-linux-musl/i686-linux-musl-
> native.tgz is new enough to have 64-bit time_t (according to
> include/bits/alltypes.h), but this is a month old as well, so
> it may have known bugs.
> 
> Adding Zach to Cc here, maybe he already has plans for another
> build with the latest version.

Yes, that's correct. The current (as of 2019-12-19) GCC 9.2.1
offering is based on musl 1.1.24, though the 7.5.0 release is
using a more recent git tag only due to timing/availability.

Within reason, I'm happy to bump versions with justification.
Rebuilding takes about a full day but no time on my end.

Rich sent out a message [1] just today suggesting there is still
some time64 work to be done, so once he pushes those patches
I'll build and release new toolchains for 9.2, 8.3, and 7.5.


ZV

[1]: https://www.openwall.com/lists/musl/2019/12/19/6

