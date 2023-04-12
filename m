Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622A26DF734
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjDLNat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjDLNao (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 09:30:44 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FA2FE
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681306218; x=1712842218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8BUtPzzgM8UvDC/jAUiYw3kbzYloFT0KzIyYZSWb8Xk=;
  b=WwwCKNM/r+Fl5oTtXDalyepXGKW641mcf8oiAyoegpMOw7+ddKGt4xNg
   GtTI/LC3W7yOA2yCFJsOOQ8P8PmM/uaB7N/vCm6YwbJA5+jdisqvhHiNu
   e8ZoGNoplY6Nre8ApEnJVpmrKdP86o6xQVzcElKykEvx/IhLfXmz47cDd
   oBxQn4a2Huh9JmFsXcJCCFtRBDh00saIry9GHrfp4duqLYBzq6I2cHb5N
   cTdcO49vDIXNvxweBVVJ4a6EigfSz0XwWJd4FZtp2VaNdeSGjhAUVjsOO
   59B/4fXYOrN8sqmn9VA6QMOQE54AjFLsj9Ubm8C92I7zd3Nr53I5OpENd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332592061"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332592061"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 06:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639231133"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639231133"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 06:29:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 872FE120D2E;
        Wed, 12 Apr 2023 16:22:43 +0300 (EEST)
Date:   Wed, 12 Apr 2023 16:22:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3] media: v4l2-subdev: Add new ioctl for client
 capabilities
Message-ID: <ZDawo9BKSNe6fMGa@kekkonen.localdomain>
References: <20230323135835.206970-1-tomi.valkeinen@ideasonboard.com>
 <20230412122642.GA7715@pendragon.ideasonboard.com>
 <a5497646-fb2d-eb76-322b-0efd00888939@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5497646-fb2d-eb76-322b-0efd00888939@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Apr 12, 2023 at 04:04:32PM +0300, Tomi Valkeinen wrote:
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> Hans, Mauro, Sakari, it's a bit late, but any chance to get this to the next
> merge window?

I think it may be a bit late now, given the number of patches in the media
stage tree, but if Hans (or Mauro) is willing to pick an additional PR now,
I'll send one.

-- 
Terveisin,

Sakari Ailus
