Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC64C6DB2EA
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 20:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjDGSgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 14:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjDGSgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 14:36:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AA1E7E
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680892556; x=1712428556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tkqFfqadCCrZqzAjk1D0qe9eEATF70GKMdRMrEdQMLg=;
  b=UiXTK777ngsmnzPEgJXT2kTSejwMrtsH7rxlnBqYoBEzxvgF2or5CTfy
   aSxe2f3C6eCLntC+8O/ERJvjj50von+AJvMuqZHfjMve8285jvwkmHB30
   Y7Siwg46gFhCnVarpUpN8aap1cY2D0wMINnMGrSZ3L/HOtG89jEvziDJj
   WEw0l7WZperTxeRnRirFSQB+9c/fcCevMnKKMmrvvOEe9eG5/0geP8JNn
   yJ6DZ5SBMINbo8fYiNv+w6rFqysuqTiTuVUf+CJrFwIFNCxLtBJmLLrBi
   CVIthRAermXmflLKJR+dIntAtGy8DwrMhZKsNhXbQX8MW3wNVjj0pw31G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="408179964"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="408179964"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811480581"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="811480581"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:35:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 657351207D2;
        Fri,  7 Apr 2023 21:35:48 +0300 (EEST)
Date:   Fri, 7 Apr 2023 21:35:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: imx290: Add missing \n on
 dev_err_probe() message
Message-ID: <ZDBihOhzZInuHM42@kekkonen.localdomain>
References: <20230406095551.952091-1-alexander.stein@ew.tq-group.com>
 <20230407014407.GC31272@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407014407.GC31272@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 07, 2023 at 04:44:07AM +0300, Laurent Pinchart wrote:
> Hi Alexander,
> 
> Thank you for the patch.
> 
> On Thu, Apr 06, 2023 at 11:55:51AM +0200, Alexander Stein wrote:
> > Also dev_err_probe message require a trailing \n.
> 
> There should be a blank line here.
> 
> > Fixes: 63127235bebd ("media: i2c: imx290: Use dev_err_probe()")
> > 
> 
> And none here.
> 
> But the bug wasn't introduced in the above commit, the \n was missing
> before that, right from the start when the driver was merged in commit
> 828dbc299278 ("media: i2c: Add IMX290 CMOS image sensor driver"). I
> would use that commit in the Fixes tag, or drop the Fixes tag
> altogether.

I dropped it. This is not a grave problem.

> 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
