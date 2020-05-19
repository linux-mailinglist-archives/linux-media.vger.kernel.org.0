Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C191D9415
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 12:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgESKIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 06:08:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:43298 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgESKIz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 06:08:55 -0400
IronPort-SDR: DvNM4jzdSU7Xq05HT3PD3Zug9bfblvECD7cKHg+u/GJh1fAOPpAVO74Ve6JW4qZ8PSYn+TCaez
 a1yIYrl6Sn3g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 03:08:54 -0700
IronPort-SDR: zxAYIjWfDt+lntJW2eQVQOyys8yYMUBElIO6K5lqEny0ehJKBbEeQjY7YpH7NXRG0YRbAY0e/0
 qRJCdlunCBoQ==
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; 
   d="scan'208";a="439564849"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 03:08:53 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EE26E20CEF; Tue, 19 May 2020 13:08:50 +0300 (EEST)
Date:   Tue, 19 May 2020 13:08:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] Documentation: media: Refer to mbus code
 documentation from CSI-2 docs
Message-ID: <20200519100850.GF20066@paasikivi.fi.intel.com>
References: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
 <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
 <20200519091738.GE20066@paasikivi.fi.intel.com>
 <6fbbe377-0164-1c6c-a1f6-70112a105772@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fbbe377-0164-1c6c-a1f6-70112a105772@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 19, 2020 at 11:28:48AM +0200, Hans Verkuil wrote:
> On 19/05/2020 11:17, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, May 19, 2020 at 11:05:31AM +0200, Hans Verkuil wrote:
> >> On 19/05/2020 10:50, Sakari Ailus wrote:
> >>> The media bus codes to be used on serial busses are documented but there
> >>> was no reference from CSI-2 documentation. Add that now.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  Documentation/driver-api/media/csi2.rst | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> >>> index da8b356389f0..1653a51d2a6e 100644
> >>> --- a/Documentation/driver-api/media/csi2.rst
> >>> +++ b/Documentation/driver-api/media/csi2.rst
> >>> @@ -10,6 +10,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
> >>>  
> >>>  .. _`MIPI alliance`: http://www.mipi.org/
> >>>  
> >>> +Media bus formats
> >>> +-----------------
> >>> +
> >>> +Always use the media bus pixel code that describes a parallel format that
> >>> +transfers a sample on a single clock cycle. See :ref:`v4l2-mbus-format` for more
> >>
> >> How about: "transfers the pixel data as a single sample in one clock cycle"
> > 
> > The text is from mbus format documentation. Note that this might not be
> > pixel data; it may be metadata as well.
> 
> My problem with 'a sample' is that all parallel media bus formats transfer 'a sample'
> in a single clock cycle. It is not clearly defined what 'a sample' is.
> 
> Either the text needs to be improved, or an example should be added here as well
> since an example clarifies what is meant.
> 
> > 
> >>
> >> Possibly with an example: "So use e.g. MEDIA_BUS_FMT_SBGGR10_1X10 instead of
> >> MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE."
> > 
> > There's an example in mbus format documentation. I'm fine adding one here,
> > too, but the purpose of this bit is to mainly refer to mbus format
> > documentation. Mbus format documentation uses MEDIA_BUS_FMT_BGR888_1X24 and
> > MEDIA_BUS_FMT_BGR888_3X8 as the example.
> > 
> 
> Ah, I see. But then the reference to v4l2-mbus-format is confusing, I'd
> change that to v4l2-mbus-pixelcode. That's where the example is.

Ah, that's a better label indeed. I'll use that. With this, do you prefer
having the example here as well?

-- 
Sakari Ailus
