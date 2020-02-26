Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8787016FA20
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 10:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgBZJBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 04:01:08 -0500
Received: from mga09.intel.com ([134.134.136.24]:48116 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgBZJBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 04:01:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 01:01:07 -0800
X-IronPort-AV: E=Sophos;i="5.70,487,1574150400"; 
   d="scan'208";a="230385509"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 01:01:05 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CA5F820884; Wed, 26 Feb 2020 11:01:03 +0200 (EET)
Date:   Wed, 26 Feb 2020 11:01:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ian Kumlien <ian.kumlien@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, petrcvekcz@gmail.com,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org
Subject: Re: [RFC] Buildfailure due to mising "select REGMAP_I2C"
Message-ID: <20200226090103.GS5379@paasikivi.fi.intel.com>
References: <CAA85sZu_5=mP2zn2h_8aY+n=UM+fXOKgym9yNAvwxcc+6R_-jA@mail.gmail.com>
 <20200225075117.GI5379@paasikivi.fi.intel.com>
 <CAA85sZvCxyi9n0dmCfb3q4EwnMu1dp6vsh3eHWyAeZ2aX+J0Pw@mail.gmail.com>
 <20200225100824.GM5379@paasikivi.fi.intel.com>
 <CAA85sZtkQVGzQq65EiBYnFmVOWUnzYD1k+7Whv6e7-20yegWRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA85sZtkQVGzQq65EiBYnFmVOWUnzYD1k+7Whv6e7-20yegWRg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ian,

On Tue, Feb 25, 2020 at 11:31:01PM +0100, Ian Kumlien wrote:
> On Tue, Feb 25, 2020 at 11:08 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Tue, Feb 25, 2020 at 08:56:34AM +0100, Ian Kumlien wrote:
> > > On Tue, Feb 25, 2020 at 8:51 AM Sakari Ailus
> 
> [... 8< ..]
> 
> > > Yep, like this one:
> >
> > Yes, like that one.
> 
> Anything more you need from me? or is this it? ;)

Ah, I now notice you've perhaps sent the mail using a mail client that has
converted tabs to spaces, for instance. That makes the patch rather
difficult to apply. Some e-mail clients do that right, some do not. Often
copying and pasting the text from a terminal also does the unwanted
conversion.

Patches are best sent using git send-email; it's made for that purpose. If
you were already using git, you're quite close.

So in this case, I'd like to ask you to take the diff you sent in the
earlier e-mail, and send the resulting patch using git send-email so it can
be merged.

And, now that this is not really an RFC anymore, the subject prefix should
be "PATCH" instead of "RFC".

There's more documentation in Documentation/process/submitting-patches.rst
.

-- 
Kind regards,

Sakari Ailus
