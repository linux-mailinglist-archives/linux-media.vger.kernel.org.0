Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE252CC006
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgLBOrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:47:46 -0500
Received: from mga17.intel.com ([192.55.52.151]:35201 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgLBOrq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:47:46 -0500
IronPort-SDR: mkNd88R+PrfAylmv8AQrx6CpT6pQzWFB9eL5101nhD/s8lz2pHA4ZDoiUKWZ4B6+Z8CA0ZUGIo
 4J1ynDdUNDvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152851762"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="152851762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 06:46:03 -0800
IronPort-SDR: p+PUmhZOKsy71anKQEUCMQCbKkpX4MYJ8zy3ZvwPEztsvj2iftNdfEtvgABsD7FVkeLxxnps6Z
 P+02poBM6fVA==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="330456767"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 06:46:02 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8C2A320884; Wed,  2 Dec 2020 16:46:00 +0200 (EET)
Date:   Wed, 2 Dec 2020 16:46:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 01/29] ccs: Add the generator for CCS register
 definitions and limits
Message-ID: <20201202144600.GF852@paasikivi.fi.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
 <20201127103325.29814-2-sakari.ailus@linux.intel.com>
 <20201202151749.52f4258b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202151749.52f4258b@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Dec 02, 2020 at 03:17:49PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 27 Nov 2020 12:32:57 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Add register definitions of the MIPI CCS 1.1 standard.
> > 
> > The CCS driver makes extended use of device's capability registers that
> > are dependent on CCS version. This involves having an in-memory data
> > structure for limit and capability information, creating that data
> > structure and accessing it.
> > 
> > The register definitions as well as the definitions of this data structure
> > are generated from a text file using a Perl script. Add the generator
> > script to make it easy to update the generated files.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/drivers/ccs/ccs-regs.txt | 1041 +++++++++++++++++
> >  .../driver-api/media/drivers/ccs/mk-ccs-regs  |  433 +++++++
> >  MAINTAINERS                                   |    1 +
> >  3 files changed, 1475 insertions(+)
> >  create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
> >  create mode 100755 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > 
> > diff --git a/Documentation/driver-api/media/drivers/ccs/ccs-regs.txt b/Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
> > new file mode 100644
> > index 000000000000..93f0131aa304
> > --- /dev/null
> > +++ b/Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
> > @@ -0,0 +1,1041 @@
> > +# Copyright (C) 2019--2020 Intel Corporation
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> 
> 
> Whenever technically possible, the SPDX header should be the first
> line.

I sent patches addressing this, as well as renaming it as ccs-regs.asc.

> 
> -
> 
> With regards to css-regs.txt file itself, I think it should be
> added on a css-specific ReST file (index.rst?) using the
> 
> 	.. include
> 
> directive (or a similar one).
> 
> Regards,
> Mauro
> 
> > +
> > +# register				rflags
> > +# - f	field	LSB	MSB		rflags
> > +# - e	enum	value			# after a field
> > +# - e	enum	value	[LSB	MSB]
> > +# - b	bool	bit
> > +# - l	arg	name	min	max	elsize	[discontig...]
> > +#
> > +# rflags
> > +#	8, 16, 32	register bits (default is 8)
> > +#	v1.1		defined in version 1.1
> > +#	f		formula
> > +#	float_ireal	iReal or IEEE 754; 32 bits
> > +#	ireal		unsigned iReal
> 
> 
> > +
> > +# general status registers
> > +module_model_id				0x0000	16
> > +module_revision_number_major		0x0002	8
> > +frame_count				0x0005	8
> > +pixel_order				0x0006	8
> 
> 
> For instance, the above could be, instead:
> 
> 	.. general status registers
> 
> 	::
> 
> 	  module_model_id			0x0000	16
> 	  module_revision_number_major		0x0002	8
> 	  frame_count				0x0005	8
> 	  pixel_order				0x0006	8
> 
> (which should be easy to parse)
> 
> or, even better:
> 
> 	  general status registers:
> 
> 	  ====================================  ======  ==
> 	  module_model_id			0x0000	16
> 	  module_revision_number_major		0x0002	8
> 	  frame_count				0x0005	8
> 	  pixel_order				0x0006	8
> 	  ====================================  ======  ==
> 
> 
> Parsing the later could be a little harder, although it would allow
> placing the file inside the documentation, with could be interesting.

Driver implemented in C uses the macros in the generated header, so the
documentation should make use of those macro names. Generating developer
documentation to support a single driver seems overkill to me. I develop
this driver and over a decade I have received very, very few patches to
this driver, so I consider the primary audience of such document to be
myself. And I can tell I'm happy looking at the source code.

If we'd still do that, then, instead of changing the format of this file,
I'd generate the documentation using another script. Btw. mk-ccs-regs
script isn't the only script interpreting this file, so changing the format
requires changes elsewhere.

-- 
Kind regards,

Sakari Ailus
