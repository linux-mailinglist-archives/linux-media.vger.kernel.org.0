Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AE06F127D
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 09:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345546AbjD1HiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 03:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345542AbjD1Hh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 03:37:59 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701EE3581
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682667467; x=1714203467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y++QY30bzxrpVqKPnMzGpNjyYD/6cbrFHpzd/8iyZdQ=;
  b=lB7rquKvdh8ux57bgHVT/jPbO+70J/PtxKGJhZBRCLbzDm5ytmZmoIZM
   HiL6fubjLGPn4N8T5Q1d8AakPBcn4K2QcRLinNOeYSyIWB9T2cCAQTrf8
   c8Hebu4tCHf7oD2FMSUPLHNWXEWH4z+jn2EsAMdqqoB3+eu/x7mLvpPF4
   vDT76drgXVCJ7t/9S93Nn4fjnXzOEl6CDkEXAvvt3ab80AWNfVq6iKEgh
   W57O0aWs3LzuxJQlNjxLq8F9H6dllJUVt6e73cDOmFpEOiMGygi7ESNRH
   NPrweKEV0MwEa2mG/xF9EjHlpCj3Q8AhEJWOIPQ5/Jr7sdTY7DN7QY++w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328003754"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="328003754"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="764187747"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="764187747"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:37:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 33F0B11FCA0;
        Fri, 28 Apr 2023 10:37:26 +0300 (EEST)
Date:   Fri, 28 Apr 2023 10:37:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 07/18] media: v4l: async: Clean up list heads and entries
Message-ID: <ZEt3tkjHeA3jn4pn@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
 <20230425004936.GE4921@pendragon.ideasonboard.com>
 <ZEpiBX8b2rrO36vE@kekkonen.localdomain>
 <20230427173621.GE26786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427173621.GE26786@pendragon.ideasonboard.com>
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

On Thu, Apr 27, 2023 at 08:36:21PM +0300, Laurent Pinchart wrote:
> > > > -	struct list_head asd_list;
> > > > -	struct list_head waiting;
> > > > -	struct list_head done;
> > > > -	struct list_head list;
> > > > +	struct list_head asd_head;
> > > > +	struct list_head waiting_head;
> > > > +	struct list_head done_head;
> > > > +	struct list_head notifier_list;
> > > 
> > > I find the _head suffix to still be confusing. How about the following ?
> > > 
> > > 	struct {
> > > 		struct list_head all;
> > > 		struct list_head waiting;
> > > 		struct list_head done;
> > > 	} asds;
> > 
> > There are many list heads and entries in v4l2-async related structs and
> > before this patch. _head is used for all list heads, _list for list
> > entries. I prefer having _head as this way it is trivial to look for all
> > instances of that list head, removing the _head part makes this much
> > harder.
> > 
> > How about using _entry for list entries instead?
> 
> I like that. I would have used _entry for the list entries, and _list
> for the list "heads". I don't like the _head suffix very much, as all of
> them are struct list_head instances. I won't nack the series for this
> though :-)

I'm fine with "_list" suffix for list heads, I happened to choose "_head"
when writing the set. It's trivial to change that.

-- 
Regards,

Sakari Ailus
