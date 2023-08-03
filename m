Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7052076E38E
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjHCIsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbjHCIsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:48:09 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAE8101
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691052488; x=1722588488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3lAelOgFS4lf/ciacT4lJio2JKR+26qnCX4qDKfrcEo=;
  b=ghpUU2NOV9r61UI1nKfSzKCoqWpiVM5tQ0H+UrVnzJ1fOMy9x+xPeWOw
   vKJ3XR+4n8o6pB/U8D9qswDScWzdcUPEDaTr8wGgrSudL8sWN9bi2Yj+3
   6H04M5NziSdauvIBMgwPFx5Fs+TaEx7GFAoaL4rPce6ia184bUdloAkTj
   vgBMyvKauG8BUuUHNBzLWwopggoA2YruX2J1GB+YuLXrQbq54bRBTNU9Q
   mCXFBE606OiVjN7SIFERpAcbq5c6qMucOmZ6LhndaqieqkvnODy2p2zCy
   f+/nOdWnvbATKVM6ITd/YSXElKmKyWdKiSXRKlzkWuUiYtlfzrWWw16eX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349407307"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="349407307"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="903283815"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="903283815"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:48:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 01C471207A3;
        Thu,  3 Aug 2023 11:48:03 +0300 (EEST)
Date:   Thu, 3 Aug 2023 08:48:03 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, bingbu.cao@linux.intel.com,
        linux-media@vger.kernel.org, zhifeng.wang@intel.com,
        tian.shu.qiu@intel.com
Subject: Re: [PATCH v1] media: pci: intel: ivsc: use new v4l2-async API for
 mei_csi subdev
Message-ID: <ZMtpw7CtwChmjawz@kekkonen.localdomain>
References: <1691045257-22642-1-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1691045257-22642-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Thu, Aug 03, 2023 at 02:47:37PM +0800, Wentong Wu wrote:
> Follow new v4l2-async API for mei_csi subdev.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>

This won't apply, I believe (most of?) the changes are already in the patch
in my tree. Did you forget to update it?

-- 
Kind regards,

Sakari Ailus
