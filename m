Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72081D9321
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgESJRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 05:17:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:29495 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgESJRm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 05:17:42 -0400
IronPort-SDR: fdN7C+7jcEttr1z5viOFwuNwMvadHaNAQlt4+Y2XhDLcU13/k8jEGb0roCzOGp4kA4gc7QXbsk
 aHWmeuXQ14sQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 02:17:41 -0700
IronPort-SDR: iq3OKGd7zXdzSfOtW/9FAsWHCpRghqSrXAlHIJgyse4wEYO9fTTI48ezwEG7Hwq2KkIJILko2E
 O11YRlP7iOQw==
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; 
   d="scan'208";a="253188110"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 02:17:40 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 59AAD20CEF; Tue, 19 May 2020 12:17:38 +0300 (EEST)
Date:   Tue, 19 May 2020 12:17:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] Documentation: media: Refer to mbus code
 documentation from CSI-2 docs
Message-ID: <20200519091738.GE20066@paasikivi.fi.intel.com>
References: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
 <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, May 19, 2020 at 11:05:31AM +0200, Hans Verkuil wrote:
> On 19/05/2020 10:50, Sakari Ailus wrote:
> > The media bus codes to be used on serial busses are documented but there
> > was no reference from CSI-2 documentation. Add that now.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/csi2.rst | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> > index da8b356389f0..1653a51d2a6e 100644
> > --- a/Documentation/driver-api/media/csi2.rst
> > +++ b/Documentation/driver-api/media/csi2.rst
> > @@ -10,6 +10,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
> >  
> >  .. _`MIPI alliance`: http://www.mipi.org/
> >  
> > +Media bus formats
> > +-----------------
> > +
> > +Always use the media bus pixel code that describes a parallel format that
> > +transfers a sample on a single clock cycle. See :ref:`v4l2-mbus-format` for more
> 
> How about: "transfers the pixel data as a single sample in one clock cycle"

The text is from mbus format documentation. Note that this might not be
pixel data; it may be metadata as well.

> 
> Possibly with an example: "So use e.g. MEDIA_BUS_FMT_SBGGR10_1X10 instead of
> MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE."

There's an example in mbus format documentation. I'm fine adding one here,
too, but the purpose of this bit is to mainly refer to mbus format
documentation. Mbus format documentation uses MEDIA_BUS_FMT_BGR888_1X24 and
MEDIA_BUS_FMT_BGR888_3X8 as the example.

-- 
Kind regards,

Sakari Ailus
