Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CFE2D7807
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405833AbgLKOid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:38:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:20182 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391980AbgLKOiN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:38:13 -0500
IronPort-SDR: myzDJyZm+6hgniYpYwPA7YxXP1/GV4+fSbWLM7KWdwWbRURxkkuDRqDlS4laRHFXIDkmw+0Buj
 4YbPAEDwyyHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="238543982"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="238543982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:36:27 -0800
IronPort-SDR: MqTNuqq+3L6eu16x8ue2Wf0ste6ZbJR0iuoHT6mArdvDhJlQ8NtID3uAuAkIZb2RULjYmA1jVa
 aPwX6f0ajr1Q==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="441205225"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:36:25 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knjXz-00Dg3K-8E; Fri, 11 Dec 2020 16:37:27 +0200
Date:   Fri, 11 Dec 2020 16:37:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning:
 implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short')
 changes value from 524288 to 0
Message-ID: <20201211143727.GS4077@smile.fi.intel.com>
References: <202012112151.6XlgQJKM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202012112151.6XlgQJKM-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 09:20:55PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> FYI, the error/warning still remains.

Already commented on previous message with Message-ID:
<202011211600.bZyprrVg-lkp@intel.com>

-- 
With Best Regards,
Andy Shevchenko


