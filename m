Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5323044D9F4
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhKKQM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:12:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:30729 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233940AbhKKQMz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:12:55 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="213663626"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="213663626"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:10:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="534447537"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:10:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mlCe5-005nYt-Ji;
        Thu, 11 Nov 2021 18:09:49 +0200
Date:   Thu, 11 Nov 2021 18:09:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <YY1ATbqn2fAg8Oct@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-5-kitakar@gmail.com>
 <20211026092637.196447aa@sal.lan>
 <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan>
 <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan>
 <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:34:23PM +0900, Tsuchiya Yuto wrote:
> On Mon, 2021-11-01 at 14:10 +0000, Mauro Carvalho Chehab wrote:
> > Em Mon, 01 Nov 2021 22:38:55 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:

...

> The full output of the make error is here:
> 
>         ("NOTE: issue: some undeclared errors")
>         https://github.com/kitakar5525/linux-kernel/commit/a932d16681f941161385659b9d0316a3a4975e86

I just realize that we may do at some point

cflags-y += -Werror

to avoid changes that breaks build (with warnings). And also I would suggest
to run build with `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`

-- 
With Best Regards,
Andy Shevchenko


