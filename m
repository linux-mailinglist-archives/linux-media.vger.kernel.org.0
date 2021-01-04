Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2112EA0C5
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 00:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbhADX0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 18:26:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:45467 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbhADX0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 18:26:25 -0500
IronPort-SDR: 2f5j21eV0ARNYkwYGxfe1LMBffcjcny67HN7JXClZS6RuGGiI878EzZvdGIhtbP/1wUTk6eDG9
 X2OS2hi7j1AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="195549960"
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; 
   d="scan'208";a="195549960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 15:24:39 -0800
IronPort-SDR: yI2r0COXZcHlByG6Y1F4UGb2DUBpce+BvwiwcPVn41aWUAtM9xDumKy+jz5MrkTzTqb//Kl7/i
 s5vbAvBJRMtw==
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; 
   d="scan'208";a="395063174"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 15:24:36 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CC52B206D0; Tue,  5 Jan 2021 01:24:31 +0200 (EET)
Date:   Tue, 5 Jan 2021 01:24:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning:
 implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short')
 changes value from 131072 to 0
Message-ID: <20210104232431.GN11878@paasikivi.fi.intel.com>
References: <202101050732.JTRq3iK6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202101050732.JTRq3iK6-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 05, 2021 at 07:16:37AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> FYI, the error/warning still remains.

The patch is in a pull request to Mauro now:

<URL:https://lore.kernel.org/linux-media/20210104120612.GB850@valkosipuli.retiisi.org.uk/T/#t>

-- 
Sakari Ailus
