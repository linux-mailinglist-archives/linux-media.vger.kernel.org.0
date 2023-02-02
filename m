Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C8E68793B
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 10:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbjBBJni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 04:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjBBJne (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 04:43:34 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAB46DFFE
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 01:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675330992; x=1706866992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRwIoHoVyvSVJqQQRK5cYSw6j6dSnErwnM/MnAua1kE=;
  b=Mt+WE+/XN15wj3i3d2KIbdGq5v9hOXU7OtDUlJoYBv2L3tzaqpeEn1eb
   j+hlfZwnP5UN+d8tdw9thPYL1YOUADVprsxS7LNss/PUV/J+0nW53ZGVi
   oHNYeQtKVtPXWw/teljVas46Dt6Bc2/czWChVGK4zZ5l9yFoEwB6aT/dU
   5ll0yKHeK7W7IGiPAabjrVA6yqOQUdp5gSXYbOgGlAh6LsZXOulKuPHTg
   HNdgytNtt97rpesQE7KCUz/mP7jk4r4SGUkEgXVKcFOBsdSkkR9LlZD+m
   gia4QJEiA0pM87f+OOokqKFHDUUKQGeDeFqVCxhZnnrEy8sMboTofufX6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326101114"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="326101114"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 01:43:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="839120985"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="839120985"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 01:43:01 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0B4E71218DC;
        Thu,  2 Feb 2023 11:42:58 +0200 (EET)
Date:   Thu, 2 Feb 2023 11:42:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] media: ipu3-cio2: Fix PM runtime usage_count in
 driver unbind
Message-ID: <Y9uFotOow86GcdaC@kekkonen.localdomain>
References: <20230201133751.305474-1-sakari.ailus@linux.intel.com>
 <DM8PR11MB5653A9C8BFB09065BD73D04B99D19@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5653A9C8BFB09065BD73D04B99D19@DM8PR11MB5653.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Feb 01, 2023 at 04:00:50PM +0000, Cao, Bingbu wrote:
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

I'm adding:

Fixes: commit c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Cc: stable@vger.kernel.org # for >= 4.16

-- 
Sakari Ailus
