Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57F4707459
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjEQVdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjEQVdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:33:38 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580B82133
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684359217; x=1715895217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYXrCjrL5en3x7yLlIQjXqq4kxFoOEtO0wniS+DekNA=;
  b=lWsr4js3oDYOORvLoLZNygZAzD3g8wS+hwXc+BgnpaZwKx5lXYHO1mij
   QtVHUhKo0gSmyIWra2GH0WlRC71T7Pn/1FEXSY8HbIQPndJlhuqMVMM9u
   Lfi+tj5Cw5DWYJsmB2hsFb4z2ekeV2ygFx4ZizhSOr/pB8zGWHE7LOIca
   Us+LQ+ZXfjYdSBMnCOc6lX8/c/qDwAAX9vpySv1eCrF66446ba7SefkRW
   xlTEbZ/zkhMo3FzWofz1llcFNptBiWE3iHtqjFMe8NGLdCYBINSRxAICO
   kXskRlrC21JehHyhczSNTGEk17+7JlFxzuwJlcsrPqGjbb/whD8Ifzs6P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336441320"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="336441320"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 14:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734842283"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="734842283"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 14:33:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 8FC0D120C5A;
        Thu, 18 May 2023 00:33:31 +0300 (EEST)
Date:   Wed, 17 May 2023 21:33:31 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
Message-ID: <ZGVIK5VC3Rx3l02j@kekkonen.localdomain>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
 <2234496be65fd2a5aeccac278f6c37ddf104514e.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2234496be65fd2a5aeccac278f6c37ddf104514e.camel@pengutronix.de>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 17, 2023 at 11:43:52AM +0200, Philipp Zabel wrote:
> Hi Sakari,
> 
> On Di, 2023-05-16 at 12:54 +0300, Sakari Ailus wrote:
> > Hi all,
> > 
> > This set adds support for multiple downstream links in an async
> > sub-device, by separating the sub-device registration from the link
> > creation.
> 
> thank you, capture works again on i.MX6QP (tested with TC358764).
> 
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp

Thanks for testing this!

-- 
Sakari Ailus
