Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF15BCA16
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 12:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiISK4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 06:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiISK40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 06:56:26 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F323A7
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663584805; x=1695120805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvTmyEcrrifzm1REerMLzNofxDBSQjPoZa+4YBHnRI8=;
  b=XTw+QQWfzekj1api0mmlmdRQS5HQex1MR1C7xVyX7PVRyf3LrimVLZKM
   6mTrnMUk/5laDe/XfFc4nAsUVFL28n75ostBDgmrgzyS284DWTv2RnXcT
   fm2vCukxxx0E9pTmAkpFpwSEVnD7GVB+A4mBNjnU8sJUt0e8agx/uLhMn
   sGuQjwgO1K0gecLNC/txpmkY2+kR9Gb0tQz034hoTCKAuXVX2Qnhbx1Kr
   kAhO8+qesT5aUpbD+xBMbHRiqeHxK6O9ZqBGq+QLyv9KAC6pKOASWJj7/
   59XLYnAnSiCRflzmQe9kuI2c6we+0gLED1JLNmynMt1JLGmyLWWHw7ec1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="325657511"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="325657511"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 03:53:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="620813853"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 03:53:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1BAE720238;
        Mon, 19 Sep 2022 13:53:21 +0300 (EEST)
Date:   Mon, 19 Sep 2022 10:53:21 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l: subdev: Document s_power() callback is
 deprecated
Message-ID: <YyhKIbWaYfjwveNT@paasikivi.fi.intel.com>
References: <20220919101004.3799904-1-sakari.ailus@linux.intel.com>
 <YyhGT476cNV32ZJN@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyhGT476cNV32ZJN@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Sep 19, 2022 at 01:37:03PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Sep 19, 2022 at 01:10:04PM +0300, Sakari Ailus wrote:
> > Runtime PM has been around for a decade or more, there's hardly a need to
> > use the V4L2 specific s_power() callback in drivers anymore. Document this
> > in s_power() callback documentation as well.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 2f80c9c818ed0..ed14ce5864cac 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -176,7 +176,8 @@ struct v4l2_subdev_io_pin_config {
> >   * @s_register: callback for VIDIOC_DBG_S_REGISTER() ioctl handler code.
> >   *
> >   * @s_power: puts subdevice in power saving mode (on == 0) or normal operation
> > - *	mode (on == 1).
> > + *	mode (on == 1). DEPRECATED. See
> > + *	Documentation/driver-api/media/camera-sensor.rst .
> 
> Could you mention that pre_streamon/post_streamoff cover the use case of
> bus initialization ? s_stream is commonly used for that purpose. With
> that,

I'll add:

pre_streamon and post_streamoff callbacks can be used for e.g. setting the
bus to LP-11 mode before s_stream is called.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
