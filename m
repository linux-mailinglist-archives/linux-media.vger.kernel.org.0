Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7017E30A848
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 14:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhBANGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 08:06:44 -0500
Received: from mga09.intel.com ([134.134.136.24]:13861 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231821AbhBANGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 08:06:41 -0500
IronPort-SDR: frxP/wnYac5hPXbtAQ2JLNpPTp5yLgawip68681SggrivcA6cz/wU9BfFVhHTGnK2u2J8g21VE
 0y7jHWb5HplA==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="180824718"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="180824718"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:04:54 -0800
IronPort-SDR: AK4THoZJYK1Ba5XswMeCZXCVcRC0dQrby+5U0//H7DsBxhDH3/Tco4eNOfDNI3LjNuNy/zTBQe
 v0JS8fA0VJNw==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="355759930"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:04:51 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A03A42074F; Mon,  1 Feb 2021 15:04:47 +0200 (EET)
Date:   Mon, 1 Feb 2021 15:04:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        kbuild-all@lists.01.org
Subject: Re: [PATCH] media: i2c: fix odd_ptr_err.cocci warnings
Message-ID: <20210201130447.GN32460@paasikivi.fi.intel.com>
References: <alpine.DEB.2.22.394.2101162109350.2697@hadrien>
 <YAWTO11tkNPnslKV@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAWTO11tkNPnslKV@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 18, 2021 at 02:55:07PM +0100, Paul Kocialkowski wrote:
> Hi,
> 
> On Sat 16 Jan 21, 21:11, Julia Lawall wrote:
> > From: kernel test robot <lkp@intel.com>
> > 
> > PTR_ERR should access the value just tested by IS_ERR
> 
> Good catch!
> 
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks, Julia and Paul.

A patch with similar content got recently merged:

commit 6e7cca2790a54057ddf64da7843271e192f71ca0
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Wed Jan 20 09:42:38 2021 +0100

    media: i2c/ov8865.c: fix error checks using wrong variable
    
    Fix two typos: dvdd -> dovdd and dvdd -> avdd
    
    Both clearly copy-and-paste mistakes.
    
    Fixes this smatch warning:
    
    drivers/media/i2c/ov8865.c:2852 ov8865_probe() warn: passing zero to 'PTR_ERR'
    
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Kind regards,

Sakari Ailus
