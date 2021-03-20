Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB40342FC6
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 23:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhCTWHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 18:07:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:40717 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhCTWGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 18:06:41 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5C625C6418; Sat, 20 Mar 2021 22:06:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1616278000; bh=9CaJzK/fdgQCPLShBXgBNbjbI4+wwZRYDDikP40cNss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gqlzbaasTrRBXSVIbgBsHL21MZCpziSwvDN/TSVW/pohGD9RPdBIBGL7EDNzKgAMS
         vekqsnKOS/YRJLk7dVbPmRdkVmfzjqzMtntYAvlNEcp3OMF78cHgSCIOQmaYp4ZK/+
         Tppwt9Hd7o1bQXZreNKEje4DWUh0hsV4MwXamVqBJckLXFD4YhiE/B8zZ8Xswz2rpd
         hPua9g/LV2dVfS2qSPIeIRQ8qlOMlWnd2arNuD/spyfwPGniS04F+bETPkf03zQnMh
         i+rEkwt3ZbTDM/6NsfmyLRBNwoNFPm/umTgkVIv2j9gxySBJEGq4ZZ/eSt664sk3p6
         U+6SndMOlQN4g==
Date:   Sat, 20 Mar 2021 22:06:40 +0000
From:   Sean Young <sean@mess.org>
To:     Nikolaos Beredimas <beredim@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region
Message-ID: <20210320220640.GA11651@gofer.mess.org>
References: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
 <20210318094836.GA31678@gofer.mess.org>
 <CAMbLOeAP0CDezNkgSo0afiDU9iSrtEMhi+eq9cthamOa4NXpKw@mail.gmail.com>
 <CAHp75VdQw=2J090w77bJVAY0UOyj1UcerZNDqyz_9dawVmK=-A@mail.gmail.com>
 <CAMbLOeBjhSX1-VZ0QkVG3qWcAman3fmu-erX3ugU620Wp+qajw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMbLOeBjhSX1-VZ0QkVG3qWcAman3fmu-erX3ugU620Wp+qajw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikolaos,

On Sat, Mar 20, 2021 at 11:58:50PM +0200, Nikolaos Beredimas wrote:
> Hi Andy.
> 
> On Sat, Mar 20, 2021 at 11:51 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> >
> > Congrats for your first submission! My comments below, starting from important one here: next time (v2 of the patch, you may use -v<N> parameter to `git format-patch ...`) send it with `git send-email ...`.
> >
> >
> > This section basically can be transformed to two tags (should be below near to you SoB tag):
> >
> > BugLink: https://...
> > Reported-by: Michael...
> 
> I appreciate your input. I'll start working on a v2 as per your suggestions.
> I do have a quick question though. The email address of the original
> bug reporter (Michael Zimmermann) is hidden from the list archives.
> Can someone provide it, or is it ok for the attribution to contain
> only the reporter's name?

The full line should be:

Reported-by: Michael Zimmermann <sigmaepsilon92@gmail.com>

Thanks,

Sean
