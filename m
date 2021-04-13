Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C818335E8BF
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 00:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347095AbhDMWF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 18:05:27 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:59285 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231294AbhDMWFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 18:05:25 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AY7xOsa++Egb+yZHqqOduk+FTdr1zdoIgy1kn?=
 =?us-ascii?q?xilNYDZSddGVkN3roeQD2XbP5go5dXk8lbm7VZWobmjb8fdOirU5GbenUE3YtH?=
 =?us-ascii?q?CzLIdkhLGM/xTaFyfz9vFQ2M5bGsBDIeftBlt3h9uS2mWFOusnqePszImYwcPX?=
 =?us-ascii?q?z3JgVmhRCp1I3kNfBhuSC1QzTBNbHN4wEpfZ5s1GujqpZHgbB/7Lc0Utbqzlq8?=
 =?us-ascii?q?DCjYujaQQbHlos7RWVkD+y5LOSKWno4j4uFxRC3L866CzMiRDhoq+ktP7+wB7R?=
 =?us-ascii?q?3W3I85A+oqqf9vJzQOuBl8ANM3HlkBqwII5mXLLHozwvuuGo7z8R4aXxiiZlGM?=
 =?us-ascii?q?hv42rJOmmuvQKo0Q/m3zYi53j+yVecgWbyyPaYeBsKT+1MmIpBa1/Q8VY4+Nt7?=
 =?us-ascii?q?179G2H/xjes0MTrw2APw+tDQTlVjjFas5XU4l+p7tQ0gbaIuLJhcsIQH5QdcCo?=
 =?us-ascii?q?sYWCz374w9GPRjAYXb459tACqnRkGcmWVzyMW0GnwoAg7DQ04Zp8uc1zQ+pgEe?=
 =?us-ascii?q?82IogOsSg38Y7dY0UYVco+DDP6hs0LZHSsN+V9MBOM4xBey6F2TVWFbFKn6KZV?=
 =?us-ascii?q?L8UL4KIGjMrZmf2sRT2MiaPLsF0ZMqgdDISk9A8Xc7YF/oBdbL3ZtQ7xfERGnV?=
 =?us-ascii?q?Z0WW9uhuo790p7XkXf7iKzGbDEkniNamr+5aGN3ARvq2fJJaasWTVlfGKMJv0x?=
 =?us-ascii?q?D3QoAXIWMDSYkNssY/XVqC5sjLJofprPDeGcyjV4bFIHICVn72G2JGVCLuPYFa?=
 =?us-ascii?q?4l2xUnjjhBjNMkmdCHDXzNZWHLXT5vFWwJIQL8lXvhAIhVOy6qiwWE1/m51zW0?=
 =?us-ascii?q?diKKr/1quguXDz52rS721tfh1ACi9ukc3dekIPggMWO1rsNb4Yp8zaY3xY33eM?=
 =?us-ascii?q?O3ZEPqbrOT8agFhr8buva5SL2TlnEcK8L26fy3sfzUj6K6s0q+ml6drsY4p9Bo?=
 =?us-ascii?q?w7QehvGR7QFxpz8Dway1t+VA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,220,1613430000"; 
   d="scan'208";a="503083602"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 00:05:04 +0200
Date:   Wed, 14 Apr 2021 00:05:04 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH v3 4/4] staging: media: intel-ipu3:
 remove space before tabs
In-Reply-To: <YHX3iVCNXJlOsmuQ@kali>
Message-ID: <alpine.DEB.2.22.394.2104140004430.14108@hadrien>
References: <cover.1618326535.git.mitaliborkar810@gmail.com> <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com> <20210413181712.GI6021@kadam> <YHX3iVCNXJlOsmuQ@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Wed, 14 Apr 2021, Mitali Borkar wrote:

> On Tue, Apr 13, 2021 at 09:17:12PM +0300, Dan Carpenter wrote:
> > On Tue, Apr 13, 2021 at 08:59:34PM +0530, Mitali Borkar wrote:
> > > Removed unnecessary space before tabs to adhere to linux kernel coding
> > > style.
> > > Reported by checkpatch.
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >
> > > Changes from v2:- No changes.
> > > Changes from v1:- No changes.
> > >
> > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > index 47e98979683c..42edac5ee4e4 100644
> > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > @@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
> > >   * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
> > >   * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
> > >   *	default 6.
> > > - * 	format: u3.2 (3 most significant bits represent whole number,
> > > + *format: u3.2 (3 most significant bits represent whole number,
> > >   *	2 least significant bits represent the fractional part
> >
> > Just remove the spaces, don't remove the tab.  It's looks silly now.
> >
> Okay Sir, do I have to send a v4 patch on this now?

Yes.  If you get feedback on a patch, you should send a new version.

julia

>
> > regards,
> > dan carpenter
> >
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHX3iVCNXJlOsmuQ%40kali.
>
