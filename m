Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927541D9974
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 16:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgESOXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 10:23:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:15040 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728725AbgESOXt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 10:23:49 -0400
IronPort-SDR: moXqU/te8TobRbUL9Inv/AR+vGBjzqGfh/ATVeUFDBlDe+xDiVNPneaITpca4kYKE7VGc8OOb/
 /oOq1YcJ26cw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 07:23:31 -0700
IronPort-SDR: 4BLMKXs6TUymRZTLs9cRKGDwetCFmm5oV05DEDGhEcjMfPV/l1/KSB6Aok+/2ZV9S3V7NGmn5w
 gvLE01oBS1ig==
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="253367282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 07:23:29 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E62DA2072F; Tue, 19 May 2020 17:23:26 +0300 (EEST)
Date:   Tue, 19 May 2020 17:23:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Mark ov5647 driver as "Orphan"
Message-ID: <20200519142326.GN20066@paasikivi.fi.intel.com>
References: <20200519120105.7930-1-sakari.ailus@linux.intel.com>
 <CAPY8ntAjaOFDxnFjg4G0nnfXruw-hoQdPJmLy3kY8M7R-NPBKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAjaOFDxnFjg4G0nnfXruw-hoQdPJmLy3kY8M7R-NPBKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, May 19, 2020 at 01:31:57PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Tue, 19 May 2020 at 13:02, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > The old maintainer's e-mail address is no longer working. Mark the driver
> > as orphan.
> 
> If you're wanting someone to pick up ownership for that one, then I'll
> volunteer as it is the Pi v1 camera module.
> We now have it working with libcamera which required a number of
> extensions and improvements. Those should be upstreamed soon via Ideas
> On Board.

Nice!

Could you send a patch, please? I.e. on top of the master branch, I'll
abandon this one.

-- 
Regards,

Sakari Ailus
