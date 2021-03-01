Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217EB3291B6
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 21:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243346AbhCAUbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 15:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbhCAU1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 15:27:50 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C52BC06178A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 12:27:09 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id e9so355289pjj.0
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 12:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=7Mgil/FMb2JUYuX3fd6+GRBPiyBArklUo6wv12Cibsc=;
        b=DKsMTwFgG+hALgf+3M4vUx6gNkp+rFNA0zq9L9yMGSuKPDv0xYTU3KJAypZzoTsE4u
         jRvPQ4qWG/KPDdDfjBGyu5Hp45MBIKlr+X7teRe9LgUTYrPGU/DBkMYbcGzDYtd+cwQ+
         D2P7/5u1einIb1fr7l0pd9c47hxaUscmdvbAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7Mgil/FMb2JUYuX3fd6+GRBPiyBArklUo6wv12Cibsc=;
        b=uTqCUVifuFNt5iFAvf7dYyE+qJAxu04pqkztLfn4sP/wMRmSVE/81Wc/2cuwKJa+fe
         zVXyychJ8LAv+Rs0tbmHpAy3UgDwkyV7MQa593sP2fMrgtAyIsXxPlpnkVspD0Qv86nL
         P1OkczW57FFnTelT+Ox0IdvMXOiXoK36vTl2NfHO2mP+ob/fiZlmlwZT484PZlVfOFk9
         g4EwtV9u8Ou309jAt59YBIETAQk7c8q9oTo7CMdeID26q3sOE7VOIB0V5eA8zCcxygVo
         X/xh7jgCE6LHyq1XpC5aGmfEj5RLfHD+qAwixExG8mea5BMLShCEjoCaOZZK3bvYh8K1
         JMZw==
X-Gm-Message-State: AOAM532fUFxIGWo1M8F1Ux0emfaMiUGSr/WXepPihV0Wf+Tz4zCSAFVf
        4qm9NYKuQZ/PxCRqTlyge5Uw4misXCscGw==
X-Google-Smtp-Source: ABdhPJyjKDahnBDLNchL2Pa5eiatTNhFEblJNr21+ssg4N3Qx+noy/DHdBWZBYD9sMviDWwPH/ZofA==
X-Received: by 2002:a17:90a:d903:: with SMTP id c3mr664345pjv.27.1614630428526;
        Mon, 01 Mar 2021 12:27:08 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id z3sm6083568pfk.173.2021.03.01.12.27.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 12:27:07 -0800 (PST)
Subject: Re: v4l2loopback and v4l2-mem2mem framework
From:   Wren Turkal <wt@penguintechs.org>
To:     linux-media@vger.kernel.org
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
Message-ID: <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
Date:   Mon, 1 Mar 2021 12:27:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Okay, so I have found how to enable the option to be manually selected.
Would a patch like the following be acceptable? Or is there a better
way to do this?

diff --git a/drivers/media/v4l2-core/Kconfig 
b/drivers/media/v4l2-core/Kconfig
index bf49f83cb86f..25004137a982 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -54,7 +54,7 @@ config V4L2_H264

  # Used by drivers that need v4l2-mem2mem.ko
  config V4L2_MEM2MEM_DEV
-       tristate
+       tristate "V4L2 mem2mem framework support"
         depends on VIDEOBUF2_CORE

  # Used by LED subsystem flash drivers


Thanks,
wt

On 2/28/21 2:07 PM, Wren Turkal wrote:
> Hi there linux-media experts,
>
> I am working on the out-of-tree v4l2loopback module[1]. My
> current goal is to implement the videobuf2 api. However,
> it appears that I must use a different vbuf2_queue for the
> OUTPUT and CAPTURE types. It appears that the mem2mem
> framework has the ability to do just this. I came to this
> conclusion while looking at the vim2m test module's code.
> While trying to modify the loopback module, I have added
> some code to try to call v4l2_m2m_init. You can see my very
> WIP attempt at code here[2].
>
> I have installed the kernel-devel package on Fedora, which.
> Unfortunately, I get he following error messages when trying
> to compile:
>
> <errors>
> ERROR: modpost: "v4l2_m2m_release" 
> [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_m2m_init" 
> [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> </errors>
>
> So, I looked into it, and Module.symvers and /proc/kallsyms
> don't have those symbols listed, so I think the Fedora kernel
> was not compiled with those symbols exported.
>
> Okay, so next I tried to build a custom kernel that does
> export those symbols. I managed to get it done by enabling
> the vim2m (VIDEO_VIM2M config option) module. The new
> Module.symvers includes the symbols; and the compile succeeds,
> which brings me to my final act.
>
> I need to expose those symbols without enabling the vim2m
> module since it is a testing module. I do not see a way
> to do that explicitly. The config option in question
> appears to be V4L2_MEM2MEM_DEV. And I haven't found a
> way to enable it without enabling something that implicitly
> selects it (which vim2m does). Do y'all have any suggestions
> for how to get these symbols exported properly when vim2m is
> not enabled?
>
>
> Thanks,
> Wren Turkal (wt)
>
> [1] https://github.com/umlaeute/v4l2loopback
> [2] https://github.com/wt/v4l2loopback/tree/m2m_try

