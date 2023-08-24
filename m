Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306FF7867DB
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 08:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240238AbjHXGwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 02:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240214AbjHXGw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 02:52:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDA1101
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 23:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692859947; x=1724395947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lfG35WoyXlK/uqp4ou38LTmkPjdqYYB2r0uJutpIF2E=;
  b=gwnz/R+8sAr7XlWIPH76gNeIE0+hiuKPQiaDWiGBVTYOLgLFFS/skg/u
   FqyEwy1jbr51iXn3/L3WKMHbTPQaA17Jplatr1a0nD2rrR8cFAFkadC0j
   beqpSyNTCKJ3zuHN+JNUcRsPDvXKIQrwrpr9DfHSmH61PON/T50gp8rTt
   LcEbkiZTGFm1J16MTJJgtFbqs4d4gIXExNgD+BEn6dOwoOyw+2Kkmy15R
   VawZr05Fuqb7ZCp/sZFKBzxYWJ1GSJQK1Bk3jzpFi5VzLVRyUQB9bKJgo
   rDLidE9ONYuLRA8lzl4FS7lFWmmPHBRAhLKQaY1KLWJi/KIe65dxmfkvE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377089107"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377089107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 23:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880687274"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 23:52:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 69C3411F9B6;
        Thu, 24 Aug 2023 09:52:22 +0300 (EEST)
Date:   Thu, 24 Aug 2023 06:52:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: ivsc: ace: probe ace device after init IPU
 bridge
Message-ID: <ZOb+JhDzOd1+lM/v@kekkonen.localdomain>
References: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
 <1692847262-31790-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692847262-31790-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

Thanks for the patch.

On Thu, Aug 24, 2023 at 11:21:02AM +0800, Wentong Wu wrote:
> Probe ivsc ace device after IPU bridge has been initialized.

This doesn't really match what the patch does: it puts csi_dev device if
the device doesn't have a fwnode. Could you provide a better commit
message please?

> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
> v2:
>  - call put_device() if IPU bridge hasn't been initialized
> 
>  drivers/media/pci/intel/ivsc/mei_ace.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
> index 7879f1f..627ec40 100644
> --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> @@ -406,6 +406,9 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
>  	if (!csi_dev) {
>  		ret = -EPROBE_DEFER;
>  		goto err;
> +	} else if (!dev_fwnode(csi_dev)) {
> +		ret = -EPROBE_DEFER;
> +		goto err_put;
>  	}
>  
>  	/* setup link between mei_ace and mei_csi */
> -- 
> 2.7.4
> 

-- 
Sakari Ailus
