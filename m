Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5987C7D6C
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 08:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjJMGF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 02:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjJMGF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 02:05:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC96ABE
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 23:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697177156; x=1728713156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LpKmAAifIH6NmZmVZw/ZcDEEoQJEtLWGmfvCAgYq6ek=;
  b=mW6hzMPDLqxQhsl25tWhYMsfKQkZkQRARSe2V7lfMcnlwpgq6FDqzVox
   MYIS5/oHmLwh161rANFjCp3MDHvpEbGJQv2FE2e7A9EjOhP7+OPzp20eX
   Q8dtag0IlK32EuP9bRfMjx7h4qr1fvpiHzqNULWW0CUAnM5+3Ts5Z11Dn
   scQPHbseAzUk8+JzatTniLGqyQCO54xUSTUGDYwKFRTpuuMZqLdSMkUNk
   s16tCrj1w+AfxSSTvPZqjVRf3vM2eMn9gAAHjHHxQG3nBgpc2vm2tGnjg
   j8K/woU6sIbgB1X6aQwspDPs0bN1pPlQBFwyCUTiT4NccgfWzETFWi9rB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6670408"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6670408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824907400"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="824907400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:05:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E94BB120A2E;
        Fri, 13 Oct 2023 09:05:50 +0300 (EEST)
Date:   Fri, 13 Oct 2023 06:05:50 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 12/28] media: v4l: subdev: Add helpers for format,
 crop and compose pointers
Message-ID: <ZSjePuWl+ellnNVc@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-3-sakari.ailus@linux.intel.com>
 <8e843fa6-ac89-9c53-2a69-55e2bb82d928@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e843fa6-ac89-9c53-2a69-55e2bb82d928@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Oct 05, 2023 at 04:12:00PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:07, Sakari Ailus wrote:
> > Add a helper for obtaining format, crop and compose pointers. These are
> > convenient for drivers, independently of the driver uses streams or not.
> 
> If we go with these, should we deprecate
> v4l2_subdev_state_get_stream_format() and v4l2_subdev_get_pad_format()?
> 
> Having three different ways to get the fmt seems a bit excessive.
> 
> Should we add 'num_pads' to the state? That would remove the need pass the
> subdevice to these functions.

Good question. This would make it easier to refactor the code later,
drivers would still need to begin calling v4l2_subdev_init_finalize(). But
it's one step forward I think.

I'll add this earlier in the set.

-- 
Terveisin,

Sakari Ailus
