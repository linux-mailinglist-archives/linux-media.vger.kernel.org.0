Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7054A356932
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350799AbhDGKQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:16:11 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:14148 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235231AbhDGKQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 06:16:10 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AlP0CQ6zLCEBxzWeuLsFjKrPwtb1zdoIgy1kn?=
 =?us-ascii?q?xilNYDZSddGVkN3roeQD2XbP+VUscVwDufTFAqmPRnvA6YV4iLN7AZ6OVBTr0V?=
 =?us-ascii?q?HDEKhM9o3nqgeMJwTb1spwkZhtaLJ/DtqYNzhHpOL3+hOxHdpl4PTvys6VrNzT?=
 =?us-ascii?q?xXtsUg1mApsIhztRMQqDF10zeQ8uP/YEPaCB7clKrSfIQxUqR/m8b0NrY8Hz4/?=
 =?us-ascii?q?XwtL+OW29lOzcXrCOrrR7A0s+cLzGomjQZWFp0sNMf2FmArCjFzsyYwpSG9iM?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.82,203,1613430000"; 
   d="scan'208";a="501970199"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 12:15:57 +0200
Date:   Wed, 7 Apr 2021 12:15:57 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
cc:     Matthew Wilcox <willy@infradead.org>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: media: omap4iss: Ending
 line with argument
In-Reply-To: <e175859f-4f68-0408-415f-a3e19f7e4874@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104071213100.7407@hadrien>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com> <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com> <20210401152844.GF351017@casper.infradead.org>
 <e175859f-4f68-0408-415f-a3e19f7e4874@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Wed, 7 Apr 2021, Beatriz Martins de Carvalho wrote:

>
> Em 01/04/21 16:28, Matthew Wilcox escreveu:
> > On Thu, Apr 01, 2021 at 04:07:38PM +0100, Beatriz Martins de Carvalho wrote:
> > > diff --git a/drivers/staging/media/omap4iss/iss.c
> > > b/drivers/staging/media/omap4iss/iss.c
> > > index dae9073e7d3c..e8f724dbf810 100644
> > > --- a/drivers/staging/media/omap4iss/iss.c
> > > +++ b/drivers/staging/media/omap4iss/iss.c
> > > @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
> > >   	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
> > >   		    ISS_HL_SYSCONFIG_SOFTRESET);
> > >   -	timeout = iss_poll_condition_timeout(
> > > -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
> > > -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
> > > +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
> > > +							    OMAP4_ISS_MEM_TOP,
> > > ISS_HL_SYSCONFIG)
> > > +							    &
> > > ISS_HL_SYSCONFIG_SOFTRESET),
> > > +							    1000, 10, 100);
> > This is not a readability improvment.  I would factor it out into its
> > own function.
>
> Thanks for the review. How can I do this? I don't know how to do this.

Copy the code into a new function.  Then see what parameters this function
needs for the various information it requires.  The code will produce some
results that are needed by the rest of the program.  So you have to
arrange via the return value that the proper variables are initialized
after the function call.

For example,

x = a + b;

could become

int f(int a, int b) {
  return a + b;
}

x = f(a,b);

That is a pretty silly change, but it gives the idea.

julia

> Beatriz Martins de Carvalho
>
> --
> You received this message because you are subscribed to the Google Groups
> "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/outreachy-kernel/e175859f-4f68-0408-415f-a3e19f7e4874%40gmail.com.
>
