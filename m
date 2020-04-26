Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F5E1B8B5A
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDZCiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:38:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:36562 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgDZCiw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:38:52 -0400
IronPort-SDR: bgXVIiIr48aeGKsd/OaFCcjBSJsejs/EmcK4hhIPdKPhDqA9x35GUpKQ/nfY9p5sSWpBfwtREU
 s1jHKKqMoqFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 19:38:51 -0700
IronPort-SDR: yIO7RmElUvZlTj+OI+UZme4UmAGcIl7CtNuWBbGITdRZa/r7Oa6VucRiC8DqQEsd+tSF7kUmyZ
 /qIaHsoJcFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; 
   d="scan'208";a="260285780"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2020 19:38:49 -0700
Subject: Re: [PATCH 0/3] IPU3 ImgU driver parameter struct fixes
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
References: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <353192fa-6769-4c18-da5d-994743bcd55e@linux.intel.com>
Date:   Sun, 26 Apr 2020 10:42:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested-by: Bingbu Cao <bingbu.cao@intel.com>

On 4/16/20 5:18 PM, Sakari Ailus wrote:
> Hi all,
> 
> This set addresses parameter struct memory layout changes introduced by
> seemingly innocent patches, and adds a sanity check for the struct size to
> avoid this from happening again. This only touches the uAPI, not the
> ipu3-abi.h that deals with ABI not visible in the driver uAPI. That should
> be addressed as well going forward.
> 
> The first patch does not probably entirely fix the issues, but with the
> second patch added, pahole agrees the struct memory layout is unchanged
> from the previous state.
> 
> Sakari Ailus (3):
>   Revert "staging: imgu: Address a compiler warning on alignment"
>   staging: ipu3-imgu: Move alignment attribute to field
>   staging: ipu3-imgu: Add a sanity check for the parameter struct size
> 
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
>  drivers/staging/media/ipu3/ipu3-css.c           | 7 +++++++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 

-- 
Best regards,
Bingbu Cao
