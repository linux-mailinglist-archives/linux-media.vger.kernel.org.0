Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAE656A16C
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 13:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbiGGLxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 07:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234399AbiGGLwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 07:52:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333E7564F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657194734; x=1688730734;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6VhydI39pFHxUZAxem+8xkT9NuUkHUJYqdHprPTKvU=;
  b=nnNsxJzgN74rLQHFAbHJF44YinbE73fw4DksqnCr2v5/BaqeBcZYSxHu
   ZW30UzwJ3nO83Npi5PvwtcMSk+Ww4npQ3z6zFVS/VdNyCZUr8ZkJYox2o
   71pCc/93Jo2Pznp5TxHFfVQPaPGSWEjLO9d0lDb3IiUHEeCXc4G2WdxPt
   U8k1GDAWFz64g0l2f2mgTVT6NVLALlAiiVCfYLFV0ewcgG/AW26xi82B6
   uVEDdfvdOi5cYmVcgyhxNrj8Kw7WqLTRLbYuhWcoh6G1frH+NeIXb7d0z
   avyrnu8vOkM1lwITlySKzE6fs85xJwlieBzctdSlDCgt5BLtawqUxnZtI
   w==;
X-IronPort-AV: E=Sophos;i="5.92,252,1650924000"; 
   d="scan'208";a="24916210"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Jul 2022 13:52:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 07 Jul 2022 13:52:11 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 07 Jul 2022 13:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657194731; x=1688730731;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=R6VhydI39pFHxUZAxem+8xkT9NuUkHUJYqdHprPTKvU=;
  b=OW3/CYkmt3UW2p8QpsiT24apulTzrVbq59g5TGKJockcOsddlCcDyH7N
   ymoTDRFCD4Y3wpDQ0Q9p/4XT2bVzzbj/5ADz8dNgHVdtKs38TnX0BJp5x
   cKUxQn4dPTNZdwr4yBkpAKhBagDbqrsZKbuirWqus2QZjzVe5FxvlLw93
   c03Z1pOdd/ot+dCMswc1nV9Wh1u+UBYAL2TH3FuitAsxzOvpnyQQ7LOm4
   7IS3gFvnUT+eJOpY5Mw08Ote4MtDamG6ZL1Bh35HCgL9gkms+NJNOa5gV
   IANLYKQjSD47JJ0fEADr3LyRvP728fF8bf6+CaN8e8J7etC1DGikjqlab
   A==;
X-IronPort-AV: E=Sophos;i="5.92,252,1650924000"; 
   d="scan'208";a="24916209"
Subject: Re: Re: Re: [PATCH 00/50] staging: media: imx: Prepare destaging of
 imx7-media-csi
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Jul 2022 13:52:11 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 75979280075;
        Thu,  7 Jul 2022 13:52:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Date:   Thu, 07 Jul 2022 13:52:11 +0200
Message-ID: <15587060.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YsbE2oyv85Cm99/O@pendragon.ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com> <4780760.ElGaqSPkdT@steina-w> <YsbE2oyv85Cm99/O@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Donnerstag, 7. Juli 2022, 13:34:50 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 07, 2022 at 12:45:01PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 7. Juli 2022, 02:23:55 CEST schrieb Laurent Pinchart:
> > > On Wed, May 11, 2022 at 03:36:14PM +0200, Alexander Stein wrote:
> > > > Hello Laurent,
> > > > 
> > > > thanks for pushing out this huge set.
> > > > 
> > > > Am Dienstag, 10. Mai 2022, 13:58:09 CEST schrieb Laurent Pinchart:
> > > > > Hello,
> > > > > 
> > > > > This patch series prepares the imx7-media-csi for destaging by
> > > > > decoupling it from the helpers shared with the i.MX6 IPUv3.
> > > > > 
> > > > > The strategy Paul and I have followed is to import copies of helper
> > > > > code
> > > > > and, refactor it within the imx7-media-csi driver, and repeat until
> > > > > no
> > > > > more shared helpers are used. There is still room for refactoring
> > > > > and
> > > > > simplification of the imx7-media-csi driver, but I believe it is now
> > > > > in
> > > > > a state clean enough to be moved out of staging.
> > > > > 
> > > > > The series also includes a few fixes or improvements in supported
> > > > > formats that are now made possible thanks to this refactoring. See
> > > > > patches 45/50 and 46/50 for details.
> > > > > 
> > > > > The code size has grown as a result. This is partly offset by code
> > > > > in
> > > > > the shared helpers that can be removed or simplified, but I haven't
> > > > > starting working on that. The helpers are now used for the i.MX6
> > > > > IPUv3
> > > > > only, so I will leave this exercise to anyone who would be
> > > > > interested in
> > > > > destaging that driver as well.
> > > > > 
> > > > > Some of the items in the TODO file related to the imx7-media-csi
> > > > > driver
> > > > > have been addressed. The two remaining items are frame interval
> > > > > monitor
> > > > > support and restricting the list of supported formats to the SoC
> > > > > version. The former isn't a destaging blocker in my opinion, as the
> > > > > feature can be added later if desired (and frame interval monitoring
> > > > > should then be moved to the V4L2 core). I believe the latter could
> > > > > also
> > > > > be addressed after destaging the driver, but in any case, this is a
> > > > > discussion for a future destaging series (which may come as soon as
> > > > > this
> > > > > one is accepted).
> > > > > 
> > > > > Alexander, this also could greatly simplify your "[PATCH v3 0/8]
> > > > > imx7/imx8mm media / csi patches" series.
> > > > 
> > > > Thanks for putting me on CC. I'll try to get my system running your
> > > > patches
> > > > ASAP.
> > > 
> > > As only minor changes were needed, I ended up posting v1.1 of the
> > > corresponding patches instead of spamming everybody with a full v2. For
> > > your convenience, I've pushed the result to
> > > 
> > > 	git://linuxtv.org/pinchartl/media.git imx7/destage
> > > 
> > > I know it's a bit of a short notice, but I'd like to send a pull request
> > > in time for v5.20, when do you think you would be able to test the
> > > series ?
> > 
> > I happen to have my setup already available, so I could test your updated
> > series pretty fast.
> > Accessing imx327 still works for WIP config. So
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Thanks a lot for the quick testing. I've now sent the pull request.
> 
> Do you plan to submit a new version of your patches on top of this ?

The patches regarding the imx[,7]-media-* are not needed anymore, they are 
obsolete now. There are only patches regarding DT overlay and the Vision 
Components FPGA and sensors I'm working on right now.

Best regards,
Alexander



