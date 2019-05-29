Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAE02DB7A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfE2LPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:15:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:38906 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfE2LPm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:15:42 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 04:15:41 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2019 04:15:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B02C22091F; Wed, 29 May 2019 14:15:38 +0300 (EEST)
Date:   Wed, 29 May 2019 14:15:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] media: v4l2-subdev: Verify arguments in
 v4l2_subdev_call()
Message-ID: <20190529111538.uny5x4fulzi4rd2w@paasikivi.fi.intel.com>
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520212747.368-1-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Mon, May 20, 2019 at 11:27:44PM +0200, Janusz Krzysztofik wrote:
> Correctness of format type (try or active) and pad ID parameters passed
> to subdevice operation callbacks is now verified only for IOCTL calls.
> However, those callbacks are also used by drivers, e.g., V4L2 host
> interfaces.
> 
> Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
> macro while calling subdevice operations, move those parameter checks
> from subdev_do_ioctl() to v4l2_subdev_call().  Also, add check for
> non-NULL pointers, including pad config if V4L2_SUBDEV_FORMAT_TRY is
> requested.
> 
> Having that done, we can avoid taking care of those checks inside
> drivers.
> 
> Janusz Krzysztofik (3):
>   media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
>   media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
>   media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument

For the set:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

On the 1st patch __u32 should be u32. I'd suggest to fix that in a separate
patch.

This was a really nice set. Thank you!

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
