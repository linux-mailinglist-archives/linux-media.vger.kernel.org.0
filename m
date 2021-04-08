Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEF3358898
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 17:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhDHPer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 11:34:47 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:57848 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhDHPep (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 11:34:45 -0400
Date:   Thu, 08 Apr 2021 15:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1617896072;
        bh=8T4dl1nqPG6w7Ce24FIwED25sDJndKSDFpPP87ZS7Q0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=nTEpCvxTDly2+EKNvYA01sWsaTLw3KcORebKgxcwbGx2cNhrpxdVU390vSVaY3X82
         Htg3zBPPO0DcGLqE+ZTNAUI8MA+19nLAGQslgQat7q4i2Wqg4xyKlgWtHEnvFLjQIz
         j/CFo2BQjbPndCpl1dmWb2r6GSgOkGBQxFw2IOoe/aHf+4N8rPbsLpLydf2RYw9UbP
         P6rTU904IhzXeEj0czVTLNjdzAeViPvewkY2qw/uAUfxlYTksMqhDnrVdLyq5AKciQ
         o5CO7fifX3xohsquj1FbTOpbTi5OVXOAvd1dhO9iHvhabauGDagZq5aOr2ALqFcy0G
         5/If7PhauEBEQ==
To:     Jani Nikula <jani.nikula@linux.intel.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
Message-ID: <xpo_2Bu6zqaJzYEya05hXM6WtcyBfk7EHevrdAN_AeWWdpMqGjIUBQ5ZqBMhpGWjhG1ASfvXzHAJhE2cKF4bRkq7xBdbzHk7UyPeaK_amRY=@emersion.fr>
In-Reply-To: <87lf9siyn6.fsf@intel.com>
References: <20210407114404.13b41822@eldfell> <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com> <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com> <20210408171311.61f433bd@eldfell> <87o8eoj01m.fsf@intel.com> <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr> <87lf9siyn6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thursday, April 8th, 2021 at 5:28 PM, Jani Nikula <jani.nikula@linux.int=
el.com> wrote:

> On Thu, 08 Apr 2021, Simon Ser contact@emersion.fr wrote:
>
> > On Thursday, April 8th, 2021 at 4:58 PM, Jani Nikula jani.nikula@linux.=
intel.com wrote:
> >
> > > Perhaps that should be the takeaway; try to minimize parsed data
> > > where the consumer needs to know whether it originated from DisplayID=
 or
> > > EDID?
> >
> > So an EDID/DisplayID abstraction layer?
> >
> > It sounds like only an EDID and DisplayID expert could come up with a
> > sane API for that. Also some metadata will only be available in one
> > format and not the other.
>
> Well, some of the data already comes from DisplayID extensions in the
> EDID.
>
> My point is, if you parse displayid and edid into different structures
> and APIs, what will the code bases using the library end up looking
> like? Not pretty? Implementing the same conditionals all over the place?
> Anyway. I feel like I'm derailing this a bit, and I really don't want
> that to happen. I think DisplayID is a consideration that should not be
> forgotten, but it's probably not the first priority here.

I agree with the goal. I'm just saying that it considerably increases
the complexity of the task.

If you're just doing an EDID library, you can just expose the EDID
specific bits with a sane API. If you're designing an abstraction
layer, you need to have a good look at both APIs, try to come up with
common data structures that fit both, and be aware of the upcoming spec
changes to not be stuck with a bad API.
