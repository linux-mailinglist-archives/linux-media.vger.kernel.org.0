Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D7E1D924B
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 10:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgESIoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 04:44:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:48301 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgESIoo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 04:44:44 -0400
IronPort-SDR: PKaCWPz9VW820O7K0zPwJpE5uUgvRve/2QO4+l3CpIi/Ogcykbvx5QC2tRDLPvyi9DLomctu7j
 vYO/X7NYRgoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 01:44:43 -0700
IronPort-SDR: qYQOuUCtmYKPg5G8Si0fx2qwcraiek8FVhqdhKj8wM06oByTbC2ZAK9wfDH+J24yLoouXGsLu3
 eTe8eGJFWRkA==
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; 
   d="scan'208";a="466051927"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 01:44:42 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AFF1120CEF; Tue, 19 May 2020 11:44:40 +0300 (EEST)
Date:   Tue, 19 May 2020 11:44:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/1] Documentation: media: Document media bus codes to
 use on serial busses
Message-ID: <20200519084440.GD20066@paasikivi.fi.intel.com>
References: <20200519072148.28071-1-sakari.ailus@linux.intel.com>
 <aede80cc-f891-c861-8ba3-f733088e5694@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aede80cc-f891-c861-8ba3-f733088e5694@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review.

On Tue, May 19, 2020 at 09:56:04AM +0200, Hans Verkuil wrote:
> On 19/05/2020 09:21, Sakari Ailus wrote:
> > Document media bus codes on serial busses. The single sample per pixel
> > variant is to be chosen from all the possible variants. While this has
> > been the practice since the introduction of CSI-2 support, it never was
> > written down. Do it now.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/csi2.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> > index da8b356389f0..af078ac927bd 100644
> > --- a/Documentation/driver-api/media/csi2.rst
> > +++ b/Documentation/driver-api/media/csi2.rst
> > @@ -10,6 +10,16 @@ the host SoC. It is defined by the `MIPI alliance`_.
> >  
> >  .. _`MIPI alliance`: http://www.mipi.org/
> >  
> > +Media bus formats
> > +-----------------
> > +
> > +Always use single sample per pixel formats on the CSI-2 bus.
> > +
> > +No new media bus formats were created when the support for serial busses were
> 
> busses -> buses
> 
> (actually, both spellings are used in about equal measures in the kernel, but
> the official spelling is 'buses').

I guess you mean "American"?

> 
> were -> was
> 
> (the support was added, 'support' is singular)

Agreed.

> 
> > +added. To avoid using different media bus codes to describe the same format, the
> > +practice is to use a format that has a single sample per pixel on the parallel
> > +bus.
> 
> To be honest, I'm confused by this text. Probably because I don't know enough
> about CSI. I'm not really sure what you mean with 'single sample per pixel'.

Good catch.

I went to look into mbus format documentation to see how this was expressed
there, only to find the subject is already covered. This need to be
referred to from CSI-2 documentation though.

I'll send v2.

-- 
Regards,

Sakari Ailus
