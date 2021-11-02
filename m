Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E29442751
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 07:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhKBG45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 02:56:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:53226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKBG45 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 02:56:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57B1060F02;
        Tue,  2 Nov 2021 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635836062;
        bh=MXDbfFaaDJHpu2fQW7mE38hxDHiU6lviz6OHVDynVVg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rgc9UY96yt4SchEXJwDqNCsWe6HAlJLeXc7oLAxhK2XnjbxQKKWz6KlAoiShLudn5
         nZXRXhksi1KlWR40yp3/hTtd/CA9cxCNq983fYoGOemnDMttMYvta/PGPVMZv6bGny
         WdAqbSRHmPStwOnOQagHvCML/jVn0UDT2TjdyrOX+CkeSpgdYEFQ7hq2jdTTeMKn7A
         SCP8FWA/m8mKDP9YGoS/4KiMb/A4vZ739q4+E7xjONKw5RVm8ItwTtpA1rT7rlgDFX
         66dRbXrjW7ASvM3aSZFOBjIIA/1d0kSAdq7Bq5OIbZbfxzj146KXpIu3jXA4xH+KqZ
         Y0bg6rBcuUWRg==
Date:   Tue, 2 Nov 2021 06:54:15 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Aditya Srivastava <yashsri421@gmail.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Baokun Li <libaokun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] media: atomisp: better describe get_frame_info
 issues
Message-ID: <20211102065415.4850a80b@sal.lan>
In-Reply-To: <CAHp75VdaTEOaGhA43O1==Deg_0Ej_ZzOp8AX5NKZB5zegN42Pg@mail.gmail.com>
References: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
        <CAHp75VdaTEOaGhA43O1==Deg_0Ej_ZzOp8AX5NKZB5zegN42Pg@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 29 Oct 2021 12:01:57 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> > +       switch (type) {
> > +       case ATOMISP_CSS_VF_FRAME:
> > +               *info = p_info.vf_output_info[0];
> > +               dev_dbg(isp->dev, "getting vf frame info.\n");
> > +               break;
> > +       case ATOMISP_CSS_SECOND_VF_FRAME:
> > +               *info = p_info.vf_output_info[1];
> > +               dev_dbg(isp->dev, "getting second vf frame info.\n");
> > +               break;
> > +       case ATOMISP_CSS_OUTPUT_FRAME:
> > +               *info = p_info.output_info[0];
> > +               dev_dbg(isp->dev, "getting main frame info.\n");
> > +               break;
> > +       case ATOMISP_CSS_SECOND_OUTPUT_FRAME:
> > +               *info = p_info.output_info[1];
> > +               dev_dbg(isp->dev, "getting second main frame info.\n");
> > +               break;
> > +       case ATOMISP_CSS_RAW_FRAME:
> > +               *info = p_info.raw_output_info;
> > +               dev_dbg(isp->dev, "getting raw frame info.\n");  
> 
> Can we get break; here followed by default case?

Surely. I'll do such change on a separate patch.

Regards,
Mauro
