Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02E4360AA5
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhDONl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:41:59 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:11233
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhDONl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:41:58 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AngYAza7UWSMWbtMJwAPXwCnXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726RtB89UGwt8OrqBICuWnXZnKQe3aAwOvOYUBDiqC?=
 =?us-ascii?q?+UKuhZjLfK5x3FN2nA+vVG1aFmGpIObeHYKVRhl8717E2ZPr8boOWvy6yjiefA?=
 =?us-ascii?q?w3oFd2gDV4ha4wh0EQqdGEFtLTM2ZqYRLoaW5cZMulObF0g/U8LTPBU4dtTYq8?=
 =?us-ascii?q?aOvJzrZgNuPW9E1CC+yQLt0rL8HhSCty1ybxpEy94ZnlT4rw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,225,1613430000"; 
   d="scan'208";a="378762268"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 15:41:23 +0200
Date:   Thu, 15 Apr 2021 15:41:23 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     zzam@gentoo.org, clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH v4 2/2] staging: media: zoran:
 add BIT() macro and align code
In-Reply-To: <YHg70mRLN5S8mywn@kali>
Message-ID: <alpine.DEB.2.22.394.2104151540360.29064@hadrien>
References: <cover.1618342050.git.mitaliborkar810@gmail.com> <fb60b20f7cdf3650d678fac4c0f1f364ac6984bf.1618342050.git.mitaliborkar810@gmail.com> <c6a301f6-99f3-69e0-a394-00948aef6c1c@gentoo.org> <YHg70mRLN5S8mywn@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > > +#define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
> > > +#define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
> > > +#define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
> > > +#define ZR36057_JMC_MJPG_CMP_MODE		(3 << 29)
> > Same as above. Please change back ZR36057_JMC_JPG_CMP_MODE to be (1 << 29).
> > Then this 2 bit field is consistent.
> >
> Sir, I guess this BIT(29) was already present. I didn't changed this.
> I will change this as you said.

It comes from this patch:

5e195bbddabdd94b15eeb60439cece996d58b329

Probably putting it back should be a different patch in the series.

julia
