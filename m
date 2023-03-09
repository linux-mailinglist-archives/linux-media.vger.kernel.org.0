Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BE76B24BA
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjCIM6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjCIM6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:58:10 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4533AF05F0
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678366658; x=1709902658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOCg+Q7868A1gyw4mgeQy85HkuiARmJByNrSNOfCNbE=;
  b=AzmSoRQ8CS+YbiShZL2N0VQPlOezzpUsjXdDR/BEjlItBX4Zvv/S9Nbr
   5qVUg1RBnhpQsayOow4g0bbEZyODpUjbqTdWTVpZJ/JZ9HHtnwdVq4/Fg
   f1PcK2dz99jVjR1LH9fqmSQ8IChtf/kvvwOeXvzcdyn/wAH4jPpVJ85nF
   bitGc1g2OS/mY4pP3KwFTLWw7nA8B9e5WsoUP4rrlY9Lg5Bcb6gTn98Fq
   smM9kFuO4XPgpbxrtgPsd4JIKqhyGGC+PThSxzaUMRyP38fNmX3weLCVZ
   7/cr3Nd50LdaB9cXx2CB+wD9wnkPqO3bVf/H1CRBTbqN0OGBsIHW0uccZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="399012710"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="399012710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709835536"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="709835536"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:56:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2E690120C21;
        Thu,  9 Mar 2023 14:56:27 +0200 (EET)
Date:   Thu, 9 Mar 2023 14:56:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAnXe9H3xg3g/f55@kekkonen.localdomain>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
 <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 09, 2023 at 01:43:50PM +0100, Hans de Goede wrote:
> Hi Sakari, 
> 
> On 3/9/23 13:27, Sakari Ailus wrote:
> > Link validation currently accesses invalid pointers if the link passed to it
> > is not between two sub-devices. This is of course a driver bug.
> > 
> > Ignore the error but print a debug message, as this is how it used to work
> > previously.
> > 
> > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> FWIW you have my Reported-by in there twice now ...

Ah, thanks. I'll drop the first tag.

-- 
Sakari Ailus
