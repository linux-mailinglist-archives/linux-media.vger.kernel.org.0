Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BEF2CC41A
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 18:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgLBRos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 12:44:48 -0500
Received: from mga05.intel.com ([192.55.52.43]:24936 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730839AbgLBRor (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 12:44:47 -0500
IronPort-SDR: 8xTzN9F4y9o/bl8X96/nvpjUMM/ZQID9MSgVZpFe70zfsZZIJ30sTrKIg9dMYY5ZuehIrR+rov
 B3aCsy5KaWow==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="257767777"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="257767777"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 09:43:07 -0800
IronPort-SDR: qychsMVfKy34U+NLFupe0IXy4+L3o94mB61BUyJWp6qqfM7j0eBi9XWk8h3ZNKMQHybUCjkvSF
 esqaYXI9WlIw==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="315430906"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 09:43:05 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9F99D20884; Wed,  2 Dec 2020 19:43:03 +0200 (EET)
Date:   Wed, 2 Dec 2020 19:43:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-commits@linuxtv.org, Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [git:media_tree/master] media: dt-bindings: media: Use OF graph
 schema
Message-ID: <20201202174303.GH852@paasikivi.fi.intel.com>
References: <E1kkTsj-0029fe-8O@www.linuxtv.org>
 <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
 <20201202155210.GA13750@pendragon.ideasonboard.com>
 <CAL_Jsq+sN6y+LFoPPnBawdMZfK011fQrVaQ3m6BHOLewz1qDWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sN6y+LFoPPnBawdMZfK011fQrVaQ3m6BHOLewz1qDWg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob, Laurent,

On Wed, Dec 02, 2020 at 09:30:27AM -0700, Rob Herring wrote:
> On Wed, Dec 2, 2020 at 8:52 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Wed, Dec 02, 2020 at 08:45:59AM -0700, Rob Herring wrote:
> > > On Wed, Dec 2, 2020 at 8:17 AM Mauro Carvalho Chehab
> > > <mchehab+huawei@kernel.org> wrote:
> > > >
> > > > This is an automatic generated email to let you know that the following patch were queued:
> > > >
> > > > Subject: media: dt-bindings: media: Use OF graph schema
> > > > Author:  Rob Herring <robh@kernel.org>
> > > > Date:    Tue Nov 17 02:39:47 2020 +0100
> > > >
> > > > Now that we have a graph schema, rework the media related schemas to
> > > > use it. Mostly this is adding a reference to graph.yaml and dropping
> > > > duplicate parts from schemas.
> > > >
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Laurent did not ack this. There was discussion on this and it needs a
> > > v2. Please drop.

I noticed it had been there for a while with some comments from Laurent
that didn't obviously result in any changes to the patch.

The patch is in Mauro's tree now. I can send a revert if you'd prefer that
instead of making changes on top of this.

> >
> > I told Sakari in an IRC conversation I was fine with the patches, and he
> > asked if that meant an ack. I said yes, but didn't realize he wanted to
> > apply your v1. Sorry about the confusion :-S
> 
> Thinking about this some more, I think video-interfaces.txt is going
> to need to be converted first as well. Otherwise, it's going to be 2
> rounds of whack-a-mole. Also consider that everything applied after
> this needs to be converted with whatever we end up with. Folks will
> need to respin their patches, the maintainer has to do it, or we'll
> need another round. So consider when is the best time in the cycle to
> apply?

I don't think this would be a bad time (there will always be some binding
patches around), but again hopefully we'd have video-interfaces.txt
converted soon.

-- 
Kind regards,

Sakari Ailus
