Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0E872046C
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 16:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbjFBO1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 10:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235196AbjFBO1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 10:27:11 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FFD1AB
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716030; x=1717252030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=59XpPIhxuolBZiLrASKxCE9C6/2o3G1OBWxZEBtlGAY=;
  b=kzE2mR+jL6SWx7sNS5Gk5qYRhBzBdR8e19dzkUM1zgWcFzk95b6Cgtc1
   g1isp+1HCmUzyzeZNU2J0yO7CoC5eX4i/aINoIFLx4w6RcGujsh4W+pgu
   7dIrJ8WX4tqRJ09i47L1/JcQyJz+e4XTdXoXbdOodACAw0CF1P2sNH7O8
   9Ey7pEectlERAUbP3qkKLRlFqXiqBR9zuZXMJ4FTmzPDX5bJ6WzGLimDb
   zr1X6B/qK0A8aHlqk47W5jnaUx8gmRr6AujUz8YLYSLc/lmte/1Y1e95S
   dTaef9hfByAk8/i2eE2XrWgkrRQUnhrdTPJWLp4uPGwZ3q/kDrBnrH+Gt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="345456243"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="345456243"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737556458"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="737556458"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:27:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5F85C120B16;
        Fri,  2 Jun 2023 17:27:06 +0300 (EEST)
Date:   Fri, 2 Jun 2023 14:27:06 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <ZHn8Ou2G+WkKPhJR@kekkonen.localdomain>
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
 <20230602091212.GB23701@pendragon.ideasonboard.com>
 <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
 <20230602142303.GD24855@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602142303.GD24855@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jun 02, 2023 at 05:23:03PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Jun 02, 2023 at 02:14:08PM +0000, Sakari Ailus wrote:
> > On Fri, Jun 02, 2023 at 12:12:12PM +0300, Laurent Pinchart wrote:
> > > On Mon, May 15, 2023 at 03:21:27PM +0300, Sakari Ailus wrote:
> > > > Use the endpoint fwnode to find out the remote pad, instead of using the
> > > > first source pad found. Also improve error messages.
> > > 
> > > The commit message should explain *why*. Once I know why, I'll review
> > > the patch :-)
> > 
> > I thought it'd be trivial. :-)
> 
> It may appear trivial as a patch author, but reviewers don't have the
> context, so they shouldn't be expected to guess the intent.

This is actually already in the stage tree. Let's see what we decide to do
with that one.

-- 
Sakari Ailus
