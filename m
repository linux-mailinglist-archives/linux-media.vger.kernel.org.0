Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D422A3F7A
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 09:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgKCI55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 03:57:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:2113 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgKCI54 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 03:57:56 -0500
IronPort-SDR: 6QG52Qdy5lPdakZQhsyH4dmtfb6uG5RDKxTQf+XHglK4d/Qb3a0iQ9NKAydUYHV1KZuO0Rggj9
 NSVs3A5/pbQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169126012"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="169126012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 00:57:56 -0800
IronPort-SDR: lcvdjZ8EwrU2lZCBeDTpR+RL7HfpMF7m4aGs2luAmAK6V/olWVOgBazaIUPPg8gmp0uU4OMkEe
 jApsY4LjR0ew==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="336437259"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 00:57:54 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A114120A2D; Tue,  3 Nov 2020 10:57:52 +0200 (EET)
Date:   Tue, 3 Nov 2020 10:57:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v2 00/19] media: Add new pixel formats for Xilinx v-frmbuf
Message-ID: <20201103085752.GF26150@paasikivi.fi.intel.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Nov 03, 2020 at 12:40:43AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a set of new pixel formats needed for the Xilinx
> Video Frame Buffer Read/Write IP cores (see [1]).
> 
> Compared to v1, the series has been extended to include semi-planar YUV
> formats. The code is now based on v5.10-rc2, which uses SPDX license
> headers for the media documentation, so new files have been switched to
> do so as well. Review comments have also been incorported, thank you
> Hans and Nicolas for providing feedback on v1.
> 
> Documentation of the pixel formats has grown organically in V4L2, and
> while it is fairly complete and detailed, it also duplicates lots of
> information. I've thus decided to bite the bullet, and try to
> consolidate the documentation first before adding new formats.
> 
> The first three patches address minor issues in videodev2.h, removing a
> comment that belongs to a commit message instead (01/19) and moving two
> misplaced formats to where they belong (02/19 and 03/19).
> 
> The next three patches refactor documentation for the RGB formats. Patch
> 04/19 removes a confusing table (that likely made sense when it was
> added, but not anymore), 05/19 adds a section title for the deprecated
> RGB formats to increase clarity, and patch 06/19 documents the naming
> scheme followed by our RGB formats. There are two separate naming
> schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
> formats on the other side. The former matches the naming conventions of
> DRM, while the latter doesn't, which has often led to confusion and
> errors. This can't be changed, but it's now clearly documented.

The patches look nice but it'd be useful to see the resulting
documentation. Would you be able to upload that somewhere for reviewers to
access?

Thanks.

-- 
Regards,

Sakari Ailus
