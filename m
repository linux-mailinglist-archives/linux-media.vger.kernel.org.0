Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47CF7DF0CD
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 12:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346804AbjKBLC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 07:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346098AbjKBLC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 07:02:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C11131
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698922941; x=1730458941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkpx53iDU4FibLUBGvb+Nwrbr32r7Jc1lwSKLj6z8cg=;
  b=nxLftoH39663zMfOYDLmyqO8hFU2mp8ACyKzWmlXH6O78op2b5nh12Ds
   edw41ZAB0E//lpaQX4cNOoySKjt0Ox7Cs4yF4HzzEv+lW895lnwqoWNkA
   9w9gARtGcg4QdjluMiSWQduUucU3Ye2IfUi0QQ4eOzkLTRiX6A2xGpQF9
   OZVIo5Q6yt+vig2Yuk033F5zSuO4194uJBaYy3hzjRmzEaJA2KfiHj0Y9
   vt48r1PoCd3hgGaoYJ8Rh0NLFqVWEAGQPSpZ1NQScb4Uz2ynWt37XRzPb
   4gasqHrHed5jWGGfi1+1z4L2cz0M7nXCcOINOrPsUkTEUb4+DFgm4687j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474928396"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="474928396"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 04:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="790355855"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="790355855"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 04:02:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 71A8012035D;
        Thu,  2 Nov 2023 13:02:15 +0200 (EET)
Date:   Thu, 2 Nov 2023 11:02:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v3 0/2] v4l2-cci: little-endian registers
Message-ID: <ZUOBt7GBw0Qv9ph1@kekkonen.localdomain>
References: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 02, 2023 at 10:50:46AM +0100, Alexander Stein wrote:
> Hi,
> 
> after the discussions at [1] and [2], this series adds proper support for
> little-endian encoded registers.
> Patch 1 adds the infrastructure and patch 2 fixes imx290 driver.
> As v6.6 was released with imx290 broken, both should be added to stable.
> 
> I just focues on fixing the endianess issue. Any future cleanup as already
> discussed is discarded for now.
> 
> Changes in v3:
> * Explicitly name IMX290 as an example sensor using little-endian registers
> * Move CCI_REG_LE to first location on register definition
> * Use unsigned numbers for registers width definition
> * Added Laurent's and Hans' R-b

Thanks, Alexander!

I'll submit these as fixes when we have rc1 available.

-- 
Sakari Ailus
