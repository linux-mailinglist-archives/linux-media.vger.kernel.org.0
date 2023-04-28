Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25B16F125A
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 09:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345427AbjD1H30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 03:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345251AbjD1H3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 03:29:25 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4F7268E
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682666964; x=1714202964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9D/nJKNJBlzTTiyEWA6VzgBPqU1a3RRRAk6XMwJdfI8=;
  b=j7ZSKgXPOkQGZK0ruxspRaq5zAIXQU+huRnckOfDW+iF7t0G7tvDq/MM
   75AvnQM9JiWPLfPvpcO3vSZ2raxbXkSCbsqp5iHo++0cMOKokyGJZcg/Z
   9CyDuqcbhpelQVC09LzI4XcIXzge4maz69HYdy+mGRQsEKCquUxcMNZ4l
   MqvHUkYJ5FIxLBzEyEqcjgrEFW6sItotNgYtiy/J7jt7spVnjmBoTF0j+
   t1e2mgcVtD3VLVuaSxoVaoXw94cTMgaupj8VnHTRdR8IsIrehcaRIK5z6
   EktxNwU+oInHqiYszKDN/IT4KRu7SmihQzlsLhcHLmMRBNz5/f3MgFuD7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328001193"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="328001193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697423760"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="697423760"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:29:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0946011FCA0;
        Fri, 28 Apr 2023 10:29:16 +0300 (EEST)
Date:   Fri, 28 Apr 2023 10:29:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 02/18] media: v4l: async: Add some debug prints
Message-ID: <ZEt1y5+JiSxx+2/H@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-3-sakari.ailus@linux.intel.com>
 <hptfblbjryeq7xeyhzy7c6sqqpj25q3c4uw5xsyrjv6luqry7s@w5xehghs5c4o>
 <ZDkvHgdlIwx5h4ks@kekkonen.localdomain>
 <20230421081842.GH21943@pendragon.ideasonboard.com>
 <ZEo980G94VUofYSp@kekkonen.localdomain>
 <20230427172752.GD26786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427172752.GD26786@pendragon.ideasonboard.com>
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

On Thu, Apr 27, 2023 at 08:27:52PM +0300, Laurent Pinchart wrote:
> > > I'm also wondering, wouldn't it be better to use notifier_dev(notifier)
> > > as the dev argument to dev_dbg(), and print dev_name(sd->dev) in the
> > > format string ? That's what you're doing below.
> > 
> > Once there is a match, yes. But if that fails to happen, fwnodes are the
> > most relevant...
> 
> My main point was about using notifier_dev(notifier) as the dev argument
> to dev_dbg(), and printing sd in the message. The notifier seems to be
> the core object to me here, I think that's what we should use as context
> for dev_dbg().

Ah, yes, this makes sense, I've actually already made that change.

-- 
Sakari Ailus
