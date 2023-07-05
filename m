Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E185748283
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 12:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGEKtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 06:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjGEKth (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 06:49:37 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0681982
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688554168; x=1720090168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pu59s5Yyn2CU9+L9i1qNvmU5rtT+o5ennc3Kicq65bg=;
  b=Vg626mZ6/W4xp3xHJ5hkSYwHWhLDtUb9Tn0XtdnSZZY0zhr99B9W1l8k
   4DhTOdw0qciiNjJKSU+YhS21WsHfqcJ3eft+KhBgLHbAKMSjKVsUs4mO4
   xshqjElb0bvqja3ikbtFCRLPcl9SG5Yo+vcVvLBw0P8RCLkApKarbu4ml
   ZMrVSjCNy7uucd+g6wYxaun/rr3GEoTDr32Xtked1UJqprM4Kac42Celq
   uoFKWZa7JX23k+HG9PlabvPuPt1aQm7AAc+rNtZFrDGXl/IuJQUb4MvPP
   tklQIeShBhDhtKkQ8ciSz4sofXaksEFg5WDyRWCeowWgfsLtL2AsUIjsM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343640480"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="343640480"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843247566"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="843247566"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:49:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 923DC11FB8E;
        Wed,  5 Jul 2023 13:49:22 +0300 (EEST)
Date:   Wed, 5 Jul 2023 10:49:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] media: ipu-bridge: Make exported IPU bridge
 symbol GPL-only in a NS
Message-ID: <ZKVKsoCkX2Z3F93a@kekkonen.localdomain>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
 <20230630134506.109269-3-sakari.ailus@linux.intel.com>
 <ZJ8VCe0LKdGxLcpb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJ8VCe0LKdGxLcpb@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Jun 30, 2023 at 08:46:49PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 04:45:06PM +0300, Sakari Ailus wrote:
> > Switch to EXPORT_SYMBOL_NS_GPL() on ipu_bridge_instantiate_vcm(). The rest
> > of the ipu bridge symbols are this way already.
> 
> Hmm... This actually changes the license, Why is it initially non-GPL and what
> are the consequences of this change?

This does not change the license. It's just that the function will be
only available for GPL'd users. I'd think the reason why the plain
EXPORT_SYMBOL() is used is plainly historical.

In any case, after Hans's set the other two functions required for using
the IPU bridge are GPL-only.

-- 
Regards,

Sakari Ailus
