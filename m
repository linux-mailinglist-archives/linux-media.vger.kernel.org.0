Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F21C7D3DCA
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjJWRcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjJWRcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:32:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A86170A
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698082328; x=1729618328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eCzjd8GgpaBS0pBcRqs0ld067CEAhB4Vg47KK8LiVxU=;
  b=GegngIovq1vtSppGYF/iYkGe0ugow3L0aZdYt78N405+W8ev+yRo3kJe
   XAtm/fho0iK6OjJ3jouV07SxIPGvKzKdYZzls3twydOcb2WfEbPWjSDqy
   LJQkb5FAptYVtehQK1ObEIrUlBkW7FyVeb8cw5v/dOGVkGSR4GNyPsf8N
   F2iatpD2S1irqEBDzDoZ4mTwW/fu33ZqXrHIyBM7Gy5yupnuCigAbbXQ5
   s7xsp5LQ5IM3pN5wu0BKlny8Gm6b4GunTVu6J7ng16H5eX9p9gOrElBKw
   8qLlMcuCLox0BlE6l+jgMJCJmV7zBYp7wUz6H8JFZXi7Eu+Y4hmBddwsi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="371957910"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="371957910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824029578"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="824029578"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:31:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6644711F82E;
        Mon, 23 Oct 2023 20:31:18 +0300 (EEST)
Date:   Mon, 23 Oct 2023 17:31:18 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 4/6] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTat5vtpNJh86R6p@kekkonen.localdomain>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-5-sakari.ailus@linux.intel.com>
 <20231023135758.GA13234@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023135758.GA13234@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Oct 23, 2023 at 04:57:58PM +0300, Laurent Pinchart wrote:
> This causes warning in the documentation build:
> 
> include/media/v4l2-subdev.h:1479: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_format'
> include/media/v4l2-subdev.h:1502: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_crop'
> include/media/v4l2-subdev.h:1525: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_compose'

I'll address this in v3.

-- 
Sakari Ailus
