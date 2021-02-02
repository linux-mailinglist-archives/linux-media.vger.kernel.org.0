Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FFA30CE08
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 22:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhBBVie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 16:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhBBVia (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 16:38:30 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54B8C061573;
        Tue,  2 Feb 2021 13:37:49 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m13so22008253wro.12;
        Tue, 02 Feb 2021 13:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7sbRv34G9nwM4Oill4EvovSGDH2apzVxRGbxUO3DzjY=;
        b=pL6r7tDODHDTQlM/aw1WBH0QW4Ibvg0ffyIocjQCbo+WphWYOAEKMhqehWCiN6ngOo
         cfeR0t1R9AkSW7rkMKi0iw7Y0ipqMFQXTLFK5iWlXVf0l9aTmNsQH60bJANph/tfrtSg
         nRU9gT4AKmrXXQ3+ADSmK2S7aicSoFnHCcssbwktzX95fw7V14uO95JMyFjeeVQ46t7Y
         lpbLsyq9t4RGfnHMCJElSYCaYPX5iu/tEeRr4yGjDQddA++/51YlYCs8g9NSooOE0HCy
         T20WjH6Oky0eJjGpv458EPKOM22kxKaopwTEdNsLHnMzV/TIK3DEa2jJGSJ4zfdc6KvL
         Mcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7sbRv34G9nwM4Oill4EvovSGDH2apzVxRGbxUO3DzjY=;
        b=avi/qlvzykt0SSZQ2FXB+7x4EtCuv6q4ToPgEEnWR4wS+V/slKOfmys3oY9bZtZ6ln
         AUqoKfsdtxgLiqsd6nvM8FsWCcm1P5Z7EsHr0SduuqvdjeGIovwVp60RGEa431C2ziVC
         KLkC5oSkK48x28LoGY/uzPEbfUvDj9P6DDABxh4YcX1sHShp5ZUHwRbIYJgWPPDYwOC4
         08M0PPT2BtyVH4MPoCyvhGxgyJ/uOLC96X+UUhkRlJ40bX0wMNUzSc3iic7LCpan6df2
         lu2APo85pMqT9RnHOA/J6IV66q5sOa/lLnvH1M2cZxfdb7MnfHv2I60IJzDI0VL6EFwA
         j1Yg==
X-Gm-Message-State: AOAM531ZkO3ArKhicqiZ3YLFIr1l5jRVZMNFw0IhSVLz/YRUCfUUuJAF
        BmJmv7RzfySYViD0zELwMkI=
X-Google-Smtp-Source: ABdhPJzzQ8CHgZu5GUkR+43ZYKSCBz1/COAvPolbGUTsNP6zOhR+ZzX1tNnF2jx0WwL41SesZiuGgw==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr61857wrn.363.1612301868555;
        Tue, 02 Feb 2021 13:37:48 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id m18sm7138042wmq.1.2021.02.02.13.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 13:37:47 -0800 (PST)
Subject: Re: [PATCH 1/1] ipu3-cio2: Build bridge only if ACPI is enabled
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>
References: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
 <070d3585-e21c-0bef-3740-d38fcd106f25@infradead.org>
 <20210202203022.GX32460@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <2102444d-8a2b-cae7-9266-903eb14a7c21@gmail.com>
Date:   Tue, 2 Feb 2021 21:37:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202203022.GX32460@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/02/2021 20:30, Sakari Ailus wrote:
> On Tue, Feb 02, 2021 at 12:24:54PM -0800, Randy Dunlap wrote:
>> On 2/2/21 12:14 PM, Sakari Ailus wrote:
>>> ipu3-cio2-bridge uses several features of the ACPI framework that have no
>>> meaningful replacement when ACPI is disabled. Instead of adding #ifdefs to
>>> the affected places, only build the bridge code if CONFIG_ACPI is enabled.
>>>
>>> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Thanks! I'll include this in a pull request to Mauro shortly.
>
Ah - thank you both; sorry to have missed that.
