Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE8A30CD11
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 21:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhBBU2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 15:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbhBBU0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 15:26:33 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAF9C061788;
        Tue,  2 Feb 2021 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4PFyUqlONvTFczA/ru8USrCCxtLyJRVmXtgqRn7jk0Q=; b=cA2l8yWFP7TqGbGYHST/vX4jJ4
        oU/wOCIbjwkQGnFDnNccnYiLD2ycDgnh2uHbNGnb2vX6eedToXdzbjBeQWyVYuubytSu/jleYmrBP
        LeXVIZnAIVn18r9JviHYmiGrSH141NbC1BhGdyQbc/fu6GtLirjoDAwWjaKrJ2P/MtrUndjTaWp/x
        DH0+Etj6LuEbB2CvQjYdS0WqOheaBw80sYJL7XnAvShkCy5brdsjrRQ82MF7onQgGKdBa+r/j+Kkg
        uDkR4af74ZyqvpKJ6rwPBgRxrnY4MjK1hAWIVp3CYVjy/bBuOBX8JgmlvytYxFmsEjvcjeMKdvdUe
        FIT1kAlg==;
Received: from [2601:1c0:6280:3f0::2a53]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l72EN-0007eY-2V; Tue, 02 Feb 2021 20:24:59 +0000
Subject: Re: [PATCH 1/1] ipu3-cio2: Build bridge only if ACPI is enabled
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>
References: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <070d3585-e21c-0bef-3740-d38fcd106f25@infradead.org>
Date:   Tue, 2 Feb 2021 12:24:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/2/21 12:14 PM, Sakari Ailus wrote:
> ipu3-cio2-bridge uses several features of the ACPI framework that have no
> meaningful replacement when ACPI is disabled. Instead of adding #ifdefs to
> the affected places, only build the bridge code if CONFIG_ACPI is enabled.
> 
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> Hi Randy,
> 
> Thanks for reporting this.
> 
> This patch should address the problem.
> 
>  drivers/media/pci/intel/ipu3/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> index 24f4e79fe0cb..dce8274c81e6 100644
> --- a/drivers/media/pci/intel/ipu3/Kconfig
> +++ b/drivers/media/pci/intel/ipu3/Kconfig
> @@ -20,7 +20,7 @@ config VIDEO_IPU3_CIO2
>  
>  config CIO2_BRIDGE
>  	bool "IPU3 CIO2 Sensors Bridge"
> -	depends on VIDEO_IPU3_CIO2
> +	depends on VIDEO_IPU3_CIO2 && ACPI
>  	help
>  	  This extension provides an API for the ipu3-cio2 driver to create
>  	  connections to cameras that are hidden in the SSDB buffer in ACPI.
> 


-- 
~Randy

