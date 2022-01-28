Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C372A49FD9F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 17:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbiA1QHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 11:07:40 -0500
Received: from mga14.intel.com ([192.55.52.115]:33649 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234788AbiA1QHk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 11:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643386060; x=1674922060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2eGnNIHrVmUX6fjHE4MuwXnXO2KCEhryJrEDyocnKM=;
  b=BIxPe21N8im//n4yDTzxRFGVsWGMwHt/km2LqWEvrysaAYBAZezzdvuK
   zvzq455z3FbbJxrkaQ4EMdvIPlW1vjpgJDewi5Lt3UkayqRnBZTDN3kxv
   iwIOSA4tPBuOaB2o+t/s6HVe5Wj9Xfo7xwYCoapMfGSzHU6cBb2mkEtiy
   gFUpKa4Oc31aAeaFZD8F/ruWkGB/AcdgI9jSqJDI5nShDun2LP00m6OlN
   0zmlpTgabZ59X4/oOZ4YuAR2Nfkkocn/qCvuozzyVRyAvM3LNs2RNlpyx
   rtV69BMmYwJSulmX/RaiweObxkIFfyWP84ZXWDPiw8F8mpzymHbPaET1k
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247367559"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="247367559"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 08:07:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="496172824"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 08:07:38 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5D58F202F2;
        Fri, 28 Jan 2022 18:07:36 +0200 (EET)
Date:   Fri, 28 Jan 2022 18:07:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-5-sakari.ailus@linux.intel.com>
 <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jan 28, 2022 at 04:58:40PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

And thanks for the review!

> 
> On Fri, Jan 28, 2022 at 10:33:09AM +0200, Sakari Ailus wrote:
> > The bus_info field is set by most drivers based on the type of the device
> > bus as well as the name of the device. Do this in v4l_querycap() so
> > drivers don't need to. This keeps compatibility with non-default and silly
> > bus_info.
> 
> Do we have many PCI or platform drivers with non-default bus_info ?

Quite a few actually. Most have something static in bus_info and there are
also PCI Express devices that use "PCIe:" prefix. These are mostly old
drivers though. I've left them as-is.

New drivers shouldn't bother changing the default unless there's a good
reason to do that.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

I'll address the other comments and send v3.

-- 
Kind regards,

Sakari Ailus
