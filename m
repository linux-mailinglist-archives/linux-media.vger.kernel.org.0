Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6393028BC02
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 17:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390058AbgJLPeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 11:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388881AbgJLPeD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 11:34:03 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC686C0613D0;
        Mon, 12 Oct 2020 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=b14no4l2W0cwTYuxAXqjsdbPmsvyURsrR0Rs82reQUE=; b=ZsQM1e848ya6X2CPTTVAHDqzs+
        lPEBbvqqKt4/EbYEvcF/nWMj5gogkdSRLhqwlzkNj+rwjq7AzqoRfWEDq+0g9awZb0TuVABt/pmK3
        iWHNGRwopkdBNabq7Z2XYASPvQntq9wZyAINv5+kKG6ni6CxsAxodcf9NgxSKPkAgtPIB5zfEyJJQ
        lh2q+fxnQ8iGZqQXHRZRaaU8P+QvpelfliYjG7Vw/Sb55Zh7yOEx/pmQLD2/Ct1zIlhyAGbtFgFpQ
        Qh0Zw89Q6d7f8UlqAP/uCWZzcxww90hItVLbDoGSe3fgxLgGCbUCwSigGNLdhrSOjqnYCccJi569t
        SjdEjDNw==;
Received: from [2601:1c0:6280:3f0::507c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kRzpk-0008Ff-Gv; Mon, 12 Oct 2020 15:33:57 +0000
Subject: Re: linux-next: Tree for Oct 12 (drivers/staging/media/atomisp/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20201012205906.51237c67@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e9339988-4ff0-ddf6-9a52-09863ca66963@infradead.org>
Date:   Mon, 12 Oct 2020 08:33:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012205906.51237c67@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/12/20 2:59 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201009:
> 


on x86_64:

In file included from ../drivers/staging/media/atomisp//pci/ia_css_control.h:25:0,
                 from ../drivers/staging/media/atomisp//pci/ia_css.h:28,
                 from ../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:24,
                 from ../drivers/staging/media/atomisp//pci/atomisp_compat.h:22,
                 from ../drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c:23:
../drivers/staging/media/atomisp//pci/ia_css_firmware.h:52:29: warning: ‘struct device’ declared inside parameter list will not be visible outside of this definition or declaration
 ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
                             ^~~~~~
In file included from ../drivers/staging/media/atomisp//pci/ia_css.h:28:0,
                 from ../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:24,
                 from ../drivers/staging/media/atomisp//pci/atomisp_compat.h:22,
                 from ../drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c:23:
../drivers/staging/media/atomisp//pci/ia_css_control.h:49:24: warning: ‘struct device’ declared inside parameter list will not be visible outside of this definition or declaration
 int ia_css_init(struct device           *dev,
                        ^~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
