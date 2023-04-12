Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC7B6DFBB3
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 18:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjDLQrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 12:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjDLQrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 12:47:23 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B93E93F4
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681318007; x=1712854007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xL4ThCKSNg5So8//Nan5u/rR5nOe42POTJzqYALlHik=;
  b=TZPVU5j7dORsVNytlqygsd+fozRczrzFtdKqnMsY31igkYZl3JnpkMma
   tsUETOEyqWTtvWrbTAT4HzyHlafEEfsIFwRunAlfH2IIaUqHgTZFyxwo0
   Mxrw/OMeh6DkVmop+OI3zYIYYqyKfNkevby+qPBsFNRlSVjK6/taGtWRd
   3rPY9zHOLd0Bksmp5UqHB57TMijButvl9ypduQyahxsYHpEcjNiE7QQbn
   GtajBohh7pepr7aqdkZ9FIMo+kNbNK5W1+6LroTxOFV2bFbPipMaIdgZy
   vqdSiPnYSKFuIh2KIelQt6jiFbvKLmJXAfAxZLZGJXwA2vUvJ98Q8j/JP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430241131"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="430241131"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 09:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935183004"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="935183004"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 09:45:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A9042120867;
        Wed, 12 Apr 2023 19:45:33 +0300 (EEST)
Date:   Wed, 12 Apr 2023 19:45:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 21/26] media: ipu3-cio2: Don't use devm_request_irq()
Message-ID: <ZDbgLUskM/UmJCxi@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-22-sakari.ailus@linux.intel.com>
 <c180080e-c4b9-3cbe-558d-ca97b1d2456d@xs4all.nl>
 <ZAHS7NOCJyhb7RtN@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAHS7NOCJyhb7RtN@kekkonen.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 03, 2023 at 12:58:52PM +0200, Sakari Ailus wrote:
> > devm_request_irq() is used a lot in the kernel, so if this is a
> > common issue, then just fixing it in two drivers isn't going to make
> > much of a difference.
> 
> I came to think of this after sending the patch as well. It's memory that
> is the problem, any hardware access needs to end before remove is called.
> 
> I'll drop the devm removal.

Actually, the reason why devm_request_irq() isn't a great idea is that if
an interrupt arrives between device's remove function and actually
releasing that IRQ, bad things will (again) happen. So it's only safe to
use devm_request_irq() if you can guarantee you're actually not going to
get an interrupt then. You generally shouldn't be getting one, but that's
not the same thing than being sure.

-- 
Sakari Ailus
