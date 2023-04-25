Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5E36EE0FB
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 13:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjDYLQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 07:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbjDYLQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 07:16:10 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78023A9
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682421369; x=1713957369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7IJscEslGwIM5CR+pmdzEd3dgdd7eua7qcJb0jsptWw=;
  b=chnH3682h6ye+k4u9uvUTPcMWCYvU9jwIBjLb3nMO6haaJybqerkLdpy
   MvhiRIh8/E7m0cJIvPOGGr+qtMMEhrn+0YpuHF3av8a4tF5h/XA/7/k1b
   LbdaB/+c+GyhvR8/Xx30eV5EUrzQKXptN946FW+K9KtN0vzOYk3mZq402
   +azBz+cP0aXwSUGEYkBbzo9xGS1fRjkB2cvRjJzCWqPA91nBAdOrPOhvt
   9JR15glo0a+CP+QMq3bqjNauQOEAqQA4WxcHcbUT4WMWnCKFa1Elt/lqr
   TUMoJa68bhI0kkfmaosd5lKEreoCDYTEXkS3ar5GdWeYSQbRKVHt8heRg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349525925"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="349525925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723983604"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="723983604"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:16:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4B96511FAD0;
        Tue, 25 Apr 2023 14:16:03 +0300 (EEST)
Date:   Tue, 25 Apr 2023 14:16:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 02/14] media: intel/ipu6: add IPU virtual bus driver
Message-ID: <ZEe2c5iXTLF7sXLX@kekkonen.localdomain>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-3-bingbu.cao@intel.com>
 <20230420153947.GE17497@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420153947.GE17497@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Apr 20, 2023 at 06:39:47PM +0300, Laurent Pinchart wrote:
> > +struct ipu6_bus_device {
> > +	struct device dev;
> > +	struct list_head list;
> > +	void *pdata;
> > +	struct ipu6_bus_driver *adrv;
> > +	struct ipu6_mmu *mmu;
> > +	struct ipu6_device *isp;
> > +	struct ipu6_subsystem_trace_config *trace_cfg;
> > +	struct ipu6_buttress_ctrl *ctrl;
> > +	u64 dma_mask;
> > +
> > +	const struct firmware *fw;
> 
> Is there a firmware per device ? I may have understood things wrong, but
> I thought the whole point of this architecture was to have a base PCI
> device running a firmware, exposing multiple functions (ISYS and PSYS),
> and implementing separate drivers for those functions.

Ah, no. There's one for ISYS and another for PSYS. Because why would you
have just one when you can have two? :-)

-- 
Sakari Ailus
