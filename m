Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB57925BABC
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 08:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgICGCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 02:02:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgICGCB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 02:02:01 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09A9E2071B;
        Thu,  3 Sep 2020 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599112921;
        bh=Ls7GUSqMV1Lls5C+YOMpZmiW/jNMpkQl3lAVRfA6qYg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YgJu8tvKoE6Z7L1oqd8DHVrunCg7fekTrPVU1VTsgzJGxm39E7fVwc3/KkHMGBs8x
         ScSUCIMRAa/TH3+idSKG1dywAY6ZY95NYyBa2Q5jWEk/zAwO+kW1wHA6qIzVqmxPz3
         BArnSWOhsG8GeZOZKXHYR0VSTsgz84dn7Hy19Dg8=
Date:   Thu, 3 Sep 2020 08:01:56 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/38] media: v4l2-ioctl: avoid memory leaks on some
 time32 compat functions
Message-ID: <20200903080156.1ae119b8@coco.lan>
In-Reply-To: <CAK8P3a1MFe4mGMzjdDQURXbWLKCr8uEWgie3EZ1wb7e3EtTQdQ@mail.gmail.com>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
        <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
        <CAK8P3a1MFe4mGMzjdDQURXbWLKCr8uEWgie3EZ1wb7e3EtTQdQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Sep 2020 20:45:53 +0200
Arnd Bergmann <arnd@arndb.de> escreveu:

> On Wed, Sep 2, 2020 at 6:10 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > There are some reports about possible memory leaks:
> >
> >         drivers/media/v4l2-core//v4l2-ioctl.c:3203 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
> >         drivers/media/v4l2-core//v4l2-ioctl.c:3230 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
> >
> > While smatch seems to be reporting a false positive (line 3203),
> > there's indeed a possible leak with reserved2 at vb32.
> >
> > We might have fixed just that one, but smatch checks won't
> > be able to check leaks at ev32. So, re-work the code in a way
> > that will ensure that the var contents will be zeroed before
> > filling it.
> >
> > With that, we don't need anymore to touch reserved fields.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Isn't this the same as commit 4ffb879ea648 ("media: media/v4l2-core:
> Fix kernel-infoleak
> in video_put_user()") that you already applied (aside from the issue
> that Laurent
> pointed out)?

Oh! I completely forgot about that one which is at the fixes branch.

Yeah, you're right! I'll drop this one from the series.

Thanks!

Mauro
