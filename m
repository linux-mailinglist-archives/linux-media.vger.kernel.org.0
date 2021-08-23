Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C653F465D
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbhHWIHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 04:07:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:32888 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235353AbhHWIHN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 04:07:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="197305812"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="197305812"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:06:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="454711699"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:06:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E51D42051E;
        Mon, 23 Aug 2021 11:06:25 +0300 (EEST)
Date:   Mon, 23 Aug 2021 11:06:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     CGEL <cgel.zte@gmail.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] ipu3: use flexible-array member instead of
 zero-length array
Message-ID: <20210823080625.GE3@paasikivi.fi.intel.com>
References: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jing,

On Fri, Aug 20, 2021 at 08:47:09PM -0700, CGEL wrote:
> From: jing yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/staging/media/ipu3/ipu3-css-fw.h:174:21-34:i
> WARNING: use flexible-array member instead
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>

Thanks for the patch.

Gustavo Silva's patch "media: staging/intel-ipu3: css: Fix wrong size
comparison imgu_css_fw_init" has addressed this, and fixed another problem
as well. In other words, removing array entries from structs can have side
effects.

-- 
Kind regards,

Sakari Ailus
