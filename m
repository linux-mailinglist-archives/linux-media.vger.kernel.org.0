Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5E3B9D12
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 10:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393078AbfIUI4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 04:56:09 -0400
Received: from mga04.intel.com ([192.55.52.120]:57474 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393032AbfIUI4J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 04:56:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Sep 2019 01:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,532,1559545200"; 
   d="scan'208";a="202667604"
Received: from reichelh-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.54.127])
  by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2019 01:56:05 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Doug Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
In-Reply-To: <CAD=FV=UjTT04pOf3q3H+ZdG9ixr6RWaRJfNs2Dk7xTTEMi-=xw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com> <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org> <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan> <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com> <20190920145352.GI12950@pendragon.ideasonboard.com> <CAD=FV=UjTT04pOf3q3H+ZdG9ixr6RWaRJfNs2Dk7xTTEMi-=xw@mail.gmail.com>
Date:   Sat, 21 Sep 2019 11:56:06 +0300
Message-ID: <87k1a2yqmx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 20 Sep 2019, Doug Anderson <dianders@chromium.org> wrote:
> On Fri, Sep 20, 2019 at 7:54 AM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> And remove Kees Cook and Colin King ? :-) Jokes aside, brushing up
>> get_maintainer.pl a bit is a good idea. I'm for instance not sure adding
>> LKML automatically is a good idea if other mailing lists are already
>> CC'ed, as it's a bit of a /dev/null (albeit with logging, so CC'ing it
>> when no other mailing list is appropriate certainly makes sense).
>
> Please don't do this, as it means the patch won't be findable on the
> "LKML" patchwork instance at:
>
> https://lore.kernel.org/patchwork/project/lkml/list/
>
> Having LKML copied on all patches is also nice because it makes it
> easier to respond to a patch that was posted to a list you didn't
> subscribe to.  I subscribe to LKML and have it redirected to a folder
> that I never look at.  Then if I want to find an email thread I can
> search that folder and easily respond from within my normal email
> client.
>
> Is there any downside to CCing LKML?

I think the question becomes, do we want *everything* posted to LKML?

For example, based on the last 30 days, the kernel the monthly addition
to LKML traffic from my corner of the kernel would be in this ballpark:

$ notmuch count date:30d.. to:intel-gfx@lists.freedesktop.org or to:dri-devel@lists.freedesktop.org and not to linux-kernel@vger.kernel.org and subject:PATCH
96904

OTOH LKML is already a firehose that's impossible to drink from, so not
much difference there...

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
