Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C5A444673
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 17:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbhKCRCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 13:02:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233028AbhKCRCA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Nov 2021 13:02:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68633610EA;
        Wed,  3 Nov 2021 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635958764;
        bh=90JlYVHtaeteFCA57oFfHvFzcC8eXl6WiHp4EuNETT8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eTeE3faqgg4tjW8h91iozQpJ6WKujl9BDIrpQQXmBvh1nU/8uLZmn0dh93W8kUbC1
         e/y7zC5iTRT7sQ9XKdYkh7bHeNIA6vReiyta027X3hn7pMrcYnp9gesMMbhfvX/A2a
         pIUI487BZJqzpY3CT4lsQtLt4f8aAh34PWzCHdBxZZMe6bDOkPloayjzyrbibxqjIl
         EPPZVo7Zo8Lzh4NuTToknttP8Mf7nkl6RLWhaGxCiNyJE5xtXHoqMgo7CBPEDtcFey
         0mGZ7CLeLmPIYB+17BEuEgoOahPwYRTa7QR7RKhqL3IUeXerQR4NbL8TepdMfJy4dU
         Ap+VOQV4jh6hA==
Date:   Wed, 3 Nov 2021 16:59:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: atomisp current issues
Message-ID: <20211103165913.221f1ef1@sal.lan>
In-Reply-To: <CAHp75VehnnD7VPYCH0YaB43_UvWL=FzfgDkYJ3PhgrK8PhQKtQ@mail.gmail.com>
References: <20211103135418.496f75d5@sal.lan>
        <CAHp75VehnnD7VPYCH0YaB43_UvWL=FzfgDkYJ3PhgrK8PhQKtQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 3 Nov 2021 16:34:39 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Wed, Nov 3, 2021 at 3:54 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> 
> ...
> 
> > Currently, 10 video? devices are created:
> >
> >         $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> >         /dev/video0:    Name             : ATOMISP ISP CAPTURE output
> >         /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
> >         /dev/video2:    Name             : ATOMISP ISP PREVIEW output
> >         /dev/video3:    Name             : ATOMISP ISP VIDEO output
> >         /dev/video4:    Name             : ATOMISP ISP ACC
> >         /dev/video5:    Name             : ATOMISP ISP MEMORY input
> >         /dev/video6:    Name             : ATOMISP ISP CAPTURE output
> >         /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
> >         /dev/video8:    Name             : ATOMISP ISP PREVIEW output
> >         /dev/video9:    Name             : ATOMISP ISP VIDEO output
> >         /dev/video10:   Name             : ATOMISP ISP ACC
> >
> > That seems to be written to satisfy some Android-based app, but we don't
> > really need all of those.
> >
> > I'm thinking to comment out the part of the code which creates all of those,
> > keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> > of those.  
> 
> Are they using the same microprograms (named routines) in the firmware?

More or less. There's a "run_mode" parameter that actually controls it.

Right now, one of the patches fixed it to work only in preview mode.

So, we're testing only the microprograms that are associated to it.

Regards,
Mauro
