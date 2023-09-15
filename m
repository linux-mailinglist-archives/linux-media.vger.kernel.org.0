Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F77A281D
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 22:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbjIOUbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 16:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbjIOUbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 16:31:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA2FF9
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694809889; x=1726345889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxkaaEO6o/OBEX7JrewSDpqM8r6VwdQ2JW/7zxOI/Rw=;
  b=YlGu888Eu2s+ABbhjY4sONXqH4lr4YXyFwff1XO7pWL2t845OuqROaPA
   JKnKcZ7n7xRR0lOo/4wLmjmW4jfChc6qP9O1FrBGb5Hs4xEfwM5N33kp+
   fYZGc+4c9PtyMmG9NTnQqpVthe6ZJqQQNHiN5KHyWuACNA19nyQeDCv4m
   NT2wJsPnPlSzTprrizUf1MPao9ePb6AHmxUzWx1w4+Pvky2MuC/MJJmdg
   N1CZPRG+pQEGrAMqvuebKkuSIeEtfbc/30Xi2RZ+PuWEAInBhywgK8ZuM
   mn7TfcS4uluo0nTCK8ske2zcHW5em1/jPpL1fVK9rHz/rfeVmCqU6OT8Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364387322"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="364387322"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="815308348"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="815308348"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:31:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 436561202BB;
        Fri, 15 Sep 2023 23:31:24 +0300 (EEST)
Date:   Fri, 15 Sep 2023 20:31:24 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <ZQS/HMu130H+DBOD@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915094239.GF14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > Enable runtime PM before registering the async sub-device as the ipu
> > bridge may try to resume the device immediately after the async sub-device
> 
> I wouldn't mention ipu bridge there, as this driver is not specific to a
> particular CSI-2 receiver.

How exactly would you reword this?

The problem may only happen with the IPU bridge --- ACPI systems otherwise
handle device power states.

-- 
Sakari Ailus
