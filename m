Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1AB31991D
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 05:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBLE25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 23:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhBLE2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 23:28:52 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C265FC061788
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 20:28:11 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id x9so4476231plb.5
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 20:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZR+aabr64yWgCcg3tFC4qsF1v5nqVYMm2I0noIyPsCw=;
        b=GobiS9mGxBlo/ukJelr5dPQgMLmlKJ4s8q3FhWYR6ySAZHOhb5a+AkpAhdhMMG7T/3
         phntOq6lnoQEfWXfrXVN55v9Z83q5ajNFNPbSZCgjUFnIsqY07v5RZCUrnTfs+3L5hyx
         sQtZTV3SFQqw+zEAEwmGVPCazkAqscVBvpfokVbOgRDrgJ9rdDWXcbMIM2rawyF8NV38
         ypm1L7uNZ0RoMvikm1CSgCAXG+tK+TKVNXNEVZOMU3EgMqrBHlIPiTiQVmRFg2IV6KIG
         hvlPg6/ytjncrZ1g2GShK/db2YiEaD3nuU04X1SRf75DX49+0Nt+gD1RsiiLfwGpBOw3
         QTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZR+aabr64yWgCcg3tFC4qsF1v5nqVYMm2I0noIyPsCw=;
        b=rWFVNGzX/nx+xAFySmKryGze7ZN4GiR5o3HUHgo9+k9ZOwpANtnSF9xwYpc/FmGLJU
         xwC9FZWNgiOLM+Hb5bVOunJuJR034a0xaKioZ59lXfbGuAlQjFxmpnM6jGIUFQmU1jVC
         gH1jJGDCh4lU9RwCbUrluYrgG60zArEFIOQNdeobpLkNCbIMM59DszyQ3aE/2eHqfInO
         Y0rZIJ6C6e5GagTY8Cy3JDuR948DLIhS1CENhR7iyKrJhyUvLj1s/WWhLZQpT14CRub2
         5b5ihEpwCnKcYgKkPIUOWQkAZ5fIg6eOB/U1iromom9+65vy0P7eHTkS6orryMPhMtbi
         CQNg==
X-Gm-Message-State: AOAM533qLqxtpw/1XpnmsQciUt6DUU1YSE+48NbmCh/H3QTjgnMPIN9p
        0pB7xN9cbStNVxeW2mSG7Ul7WA==
X-Google-Smtp-Source: ABdhPJwGkjQUwMP8XefFXrRE5xGFyoG2PyK9oRFz9QBGRyIafYp6Js9D8Flr/JNJ1qq0jMIv0cwVlw==
X-Received: by 2002:a17:90b:4905:: with SMTP id kr5mr1030438pjb.135.1613104091205;
        Thu, 11 Feb 2021 20:28:11 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id r68sm7309061pfc.49.2021.02.11.20.28.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 20:28:10 -0800 (PST)
Date:   Fri, 12 Feb 2021 09:58:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <mgross@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 2/9] cpufreq: sfi-cpufreq: Remove driver for
 deprecated firmware
Message-ID: <20210212042807.4yzclby4rffnkwvm@vireshk-i7>
References: <20210211134008.38282-1-andriy.shevchenko@linux.intel.com>
 <20210211134008.38282-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211134008.38282-3-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11-02-21, 15:40, Andy Shevchenko wrote:
> SFI-based platforms are gone. So does this driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/cpufreq/Kconfig.x86   |  10 ---
>  drivers/cpufreq/Makefile      |   1 -
>  drivers/cpufreq/sfi-cpufreq.c | 127 ----------------------------------
>  3 files changed, 138 deletions(-)
>  delete mode 100644 drivers/cpufreq/sfi-cpufreq.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
