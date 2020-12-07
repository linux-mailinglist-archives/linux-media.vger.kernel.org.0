Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B032D10D4
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 13:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgLGMsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 07:48:45 -0500
Received: from mga07.intel.com ([134.134.136.100]:19420 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgLGMsp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 07:48:45 -0500
IronPort-SDR: ZbOevPAVGUs9yMeunlWIJNGqgfTbY2uRUHqPjsrKL8dsnh8V4LHJ7hoRJul78cZ/j0aswK/HQ8
 MoawXQvThFCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="237796013"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="237796013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 04:46:59 -0800
IronPort-SDR: LZuVL2VQLMsxRSBSxrWO9xseYfS1YlymVlPIcxfOJW9wbEJnHbQYBZ/raj9o1un8e3BZ5Ew9aO
 W3i4uKT+xB7w==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="337180369"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 04:46:57 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B29C720901; Mon,  7 Dec 2020 14:46:55 +0200 (EET)
Date:   Mon, 7 Dec 2020 14:46:55 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
Message-ID: <20201207124655.GY852@paasikivi.fi.intel.com>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the patch.

On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
> This driver does not support composition, only cropping.
> Composition means that the sensor can output e.g. 1920x1080,
> but can compose a cropped 1280x720 image in the middle of the
> 1920x1080 canvas, filling in the unused area with a background
> color.

That's how this would work on V4L2 video nodes...

> 
> That's not supported at all. So drop the bogus composition support.

But this is a sub-device driver. On sub-devices the COMPOSE target is used
for configuring scaling, binning and sub-sampling. I don't know about the
capabilities of this particular driver but the code
(__imx274_change_compose function in particular) looks very much such that
it does support binning.

-- 
Kind regards,

Sakari Ailus
