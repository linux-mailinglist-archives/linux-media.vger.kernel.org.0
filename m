Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0536FA48E
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 12:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbjEHKAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 06:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjEHKAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 06:00:43 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3912D411
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683540042; x=1715076042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJ/a/SaTF3msKGCuMwsYgjRXjgqxTKUlI9yYvmBtXIA=;
  b=WTV0h3gxZaQFPvYZ3EnBBvBLxEqIlaTmh6UQYOwxcrmZe5q0NhKwXEJA
   3NP0RF/orKBM0YBPALYl3+Er6euNNNg+GNYHwfjNnmxvt/cHf8tnBFmPo
   H9cBdCqwzfbqHwUie3i0e2/ezh+FZMblO9bmCulg0tA22ZpInQmiKXeRy
   2l6HBsaO9sESEUOoU6foWwjSBByhWPBCkEmolf3A7kJH1DCUmA0Stz2cq
   cmXh1hqfksjKgmXKKQO/FTo2YYMgLph/ViayXLqXcrM5Won9Mj6VE/NYS
   RBxtK3anSA4T+5TY44XKA/uemUm4CzUB1ACKpruBvJYx11nYeGHbuyX1q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="334045645"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="334045645"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 03:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810201771"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="810201771"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 03:00:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DA7E01203DA;
        Mon,  8 May 2023 13:00:32 +0300 (EEST)
Date:   Mon, 8 May 2023 13:00:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Fix missing kerneldoc for client_caps
Message-ID: <ZFjIQOK+XWoQ28R1@kekkonen.localdomain>
References: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
 <20230418143330.GE30837@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418143330.GE30837@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 18, 2023 at 05:33:30PM +0300, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Apr 18, 2023 at 01:59:24PM +0300, Tomi Valkeinen wrote:
> > Add missing kernel doc for the new 'client_caps' field in struct
> > v4l2_subdev_fh.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Added:

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")

-- 
Sakari Ailus
