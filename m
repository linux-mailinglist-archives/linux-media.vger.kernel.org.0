Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74D1440B40
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 20:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhJ3Scj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 14:32:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230260AbhJ3Sci (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 14:32:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB7EE60F4C;
        Sat, 30 Oct 2021 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635618608;
        bh=GCvYlMogk8txYwL+9NC3bnXRRwcr3NXeea9vsnhJU1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=br+gC1SDt115ZfXwDj7s+bp7IKDa3Jd5Vb+YP4yIv9Pe+vCk8Tm78fF+wm4b3CK2x
         Z0PG8NwunfXgEioB5NJE6Q/bKoRTQDUBxNRjBocjP34zK0LZspHm3VDaDRYfSQt3S5
         7Mmecp5azJmfZxqEjBy9c4YQrq1MNsBeJBF3q30iifnMFWbYQEmC2IakzLbZwYrkXn
         ZLy5X/Ulm0tggwUSlacDrbh8yfJ/HUCLAj3LOAy9Dz/LBIRyX8pxHtovgmhcXs4PSV
         q97waa51d/QztTTj9SPKQJB3gYsvahXn1XhO8rVGg8CddET7GXgY4nPSR0AQFrHc5F
         qUVwK48L0PDrw==
Date:   Sat, 30 Oct 2021 19:30:01 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211030193001.43c916e1@sal.lan>
In-Reply-To: <CAHp75VexkxSx=aqB+a0LANR9ViMRX3z7jq9h8haR7BQojYqzuQ@mail.gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
        <20211028115802.49258990@sal.lan>
        <1a1da60c4464bd163e9c401e04db3b58172ae7fc.camel@gmail.com>
        <20211030114923.4feb5a4d@sal.lan>
        <CAHp75VexkxSx=aqB+a0LANR9ViMRX3z7jq9h8haR7BQojYqzuQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 30 Oct 2021 14:01:01 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Sat, Oct 30, 2021 at 1:49 PM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> > Em Sat, 30 Oct 2021 18:50:14 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:  
> 
> ...
> 
> > What I'm saying is that, IMHO, we should:
> >
> > 1. Fix the ioctls in order to allow a normal app to use it. I'm
> >    already doing some work on this sense. We should ensure that the
> >    driver will pass v4l2-compliance tests on this step;
> >
> > 2. remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
> >    register address differences between ISP2400 and ISP2401;
> >
> > 3. Cleanup the driver code, removing the abstraction layers inside it;
> >
> > 4. Migrate the sensor drivers out of staging (or re-using existing
> >    drivers);
> >
> > 5. Remove the logic which sets up pipelines inside it, moving it to
> >    libcamera and implement MC support;
> >
> > 6. Move it out of staging.
> >
> > This is easily said than done, as steps 2-6 are very complex and will
> > require lots of work. Also, both ISP2400 and 2401 should be tested
> > while doing some of those major reworks, in order to avoid breakages.  
> 
> This is a great roadmap nevertheless!

> However, we missed one important step here, i.e. persuade Intel to
> clarify license of the firmware (for distirbution) and make sure we
> have it in Linux firmware project, so it won't get lost.

Heh, true!

I suspect that the firmare for ISP2401, used on Intel Aero, is probably
easier to make it available than the firmware for ISP2400.

At least looking at the github repository for Intel Aero, it says at the 
package metadata that its content is under GPL:

	https://github.com/intel-aero/meta-intel-aero-base/blob/master/LICENSE

The firmware itself is there, at:

	https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin


The Yocto's meta package for the firmware blob is at:

	https://github.com/intel-aero/packages/tree/master/firmware-atomisp

Also says, on its copyright's notice:

	https://github.com/intel-aero/packages/blob/master/firmware-atomisp/debian/copyright

that:

	Source: https://github.com/intel-aero/meta-intel-aero-base

	Files: *
	Copyright: 2016 Intel Corporation
	License: GPL-2
	 /usr/share/common-licenses/GPL-2

Granted, it doesn't make sense to say that a firmware blob is under
GPL. My reading is that the original intend was to allow GPL software
to use/distribute such firmware, but yeah, someone at Intel should
provide the community an explicit authorization to allow distros to
start packaging such firmware.

Regards,
Mauro
