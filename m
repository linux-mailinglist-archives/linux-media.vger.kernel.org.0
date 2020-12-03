Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE462CE240
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 23:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387771AbgLCW4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 17:56:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:19998 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgLCW4z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 17:56:55 -0500
IronPort-SDR: sqq01kPgv1iP7xrNursPixfHS1txqIFibS0X7aypE0rv1nifyWc9nrp6VTssH+GTLK/3qejBmS
 uDDMzCUS8I9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="173449010"
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; 
   d="scan'208";a="173449010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 14:55:14 -0800
IronPort-SDR: BlLXb2daAGH6gO1pWQ05HxS+B4qkaFHe+vTk8wuk0phOB3AhT6jWHSL+HxwhLyTSWKtjiBuru4
 1xLtmtAiVUtQ==
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; 
   d="scan'208";a="374097572"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 14:55:12 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 100FF21E1A; Fri,  4 Dec 2020 00:55:10 +0200 (EET)
Date:   Fri, 4 Dec 2020 00:55:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: smiapp: avoid printing an uninitialized variable
Message-ID: <20201203225509.GP852@paasikivi.fi.intel.com>
References: <20201203222828.1029943-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203222828.1029943-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thanks for the patch.

On Thu, Dec 03, 2020 at 11:28:16PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is no intialization for the 'reg' variable, so printing
> it produces undefined behavior as well as a compile-time warning:
> 
> drivers/media/i2c/ccs/ccs-core.c:314:49: error: variable 'reg' is uninitialized when used here [-Werror,-Wuninitialized]
>                         "0x%8.8x %s pixels: %d %s (pixelcode %u)\n", reg,
> 
> Remove the variable and stop printing it.
> 
> Fixes: b24cc2a18c50 ("media: smiapp: Rename as "ccs"")

The patch introducing this was 

fd9065812c7b ("media: smiapp: Obtain frame descriptor from CCS limits")

so I'll use it instead. Also s/smiapp/ccs/ in the subject.

Interesting that GCC 8.3 didn't complain.

-- 
Kind regards,

Sakari Ailus
