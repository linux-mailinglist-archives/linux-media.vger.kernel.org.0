Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F541453281
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 13:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbhKPNAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 08:00:13 -0500
Received: from mga12.intel.com ([192.55.52.136]:19510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236420AbhKPNAN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 08:00:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213720263"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="213720263"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:57:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="494449208"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:57:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D0D5C20287;
        Tue, 16 Nov 2021 14:57:10 +0200 (EET)
Date:   Tue, 16 Nov 2021 14:57:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] media: ipu3: drop an unused variable
Message-ID: <YZOqpvwPq7iz9ryd@paasikivi.fi.intel.com>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:08:51PM +0000, Mauro Carvalho Chehab wrote:
> Fix this clang Werror with W=1:
> 
> 	drivers/staging/media/ipu3/ipu3-css-params.c:774:8: error: variable 'pin_scale' set but not used [-Werror,-Wunused-but-set-variable]
> 	                        int pin_scale = 0;
> 	                            ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I.e. feel free to merge through your tree, I don't think there's a chance
for conflicts here.

-- 
Sakari Ailus
