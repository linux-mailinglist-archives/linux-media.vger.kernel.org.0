Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9139A7CDA2D
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 13:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjJRLV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 07:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjJRLV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 07:21:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C159114
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628085; x=1729164085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vcUGKf3BljQggDtN/tq3X0himFvs0Ni7kdcS1kZAnfk=;
  b=fcGxTJEb1Bu6y4FULwqpegHzY2TanxP6BbHNeX81EVi0NoA6WJ594YAt
   X9eYfuWkygHRJuU7o81b7FD2ZFaDDyxqb5GxOK2Bl/wh0QB2ER8FzN7d7
   z3S+4zsjBcz+KPBncxDhSkm9QbdMI86u6oxaMD5I4xZ1I2ldp9TtX0Rlb
   BQaG2CsSfUvCR2rW6GdH6P9ARIZtbq31g4ljs78+iuMCs8AVFUKeWWjJO
   tUv6s6FQyvA9BRkIGrFlx3zMp06y/469eU4mj57dx2jvKYl+E5/FSnpQQ
   ldldaHTr8eRs809i620oBn5vsivQUdNeUZCQ1sbSg5ViwcbaU9WEUMD4x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="417107405"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="417107405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="733139737"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="733139737"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:21:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B92E11F851;
        Wed, 18 Oct 2023 14:21:09 +0300 (EEST)
Date:   Wed, 18 Oct 2023 11:21:09 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/3] media: Documentation: LP-11 and LP-111 are
 states, not modes
Message-ID: <ZS+/pVpVt+Ala6yu@kekkonen.localdomain>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-4-sakari.ailus@linux.intel.com>
 <20231017113609.GA14832@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017113609.GA14832@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 17, 2023 at 02:36:09PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Oct 17, 2023 at 01:56:30PM +0300, Sakari Ailus wrote:
> > LP-11 and LP-111 are CSI-2 bus states, not modes. Fix this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/tx-rx.rst | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index 7e115e3c4735..bc1b94cffdd9 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -89,13 +89,13 @@ where
> >  	pixel rate on the camera sensor's pixel array which is indicated by the
> >  	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>` control.
> >  
> > -LP-11 and LP-111 modes
> > -^^^^^^^^^^^^^^^^^^^^^^
> > +LP-11 and LP-111 states
> > +^^^^^^^^^^^^^^^^^^^^^^^
> 
> Indeed.
> 
> >  
> > -As part of transitioning to high speed mode, a CSI-2 transmitter typically
> > +As part of transitioning to high speed state, a CSI-2 transmitter typically
> 
> "high speed" is a mode according to the D-PHY specification.

Yes, indeed. I'll address these in v3.

> 
> >  briefly sets the bus to LP-11 or LP-111 state, depending on the PHY. This period
> >  may be as short as 100 µs, during which the receiver observes this state and
> > -proceeds its own part of high speed mode transition.
> > +proceeds its own part of high speed state transition.
> 
> Same here.
> 
> >  
> >  Most receivers are capable of autonomously handling this once the software has
> >  configured them to do so, but there are receivers which require software
> > @@ -104,7 +104,7 @@ in software, especially when there is no interrupt telling something is
> >  happening.
> >  
> >  One way to address this is to configure the transmitter side explicitly to LP-11
> > -or LP-111 mode, which requires support from the transmitter hardware. This is
> > +or LP-111 state, which requires support from the transmitter hardware. This is
> 
> Ack.
> 
> With the two changes referring to high speed state dropped,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus
