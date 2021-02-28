Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA873274BA
	for <lists+linux-media@lfdr.de>; Sun, 28 Feb 2021 23:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhB1WH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Feb 2021 17:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhB1WH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Feb 2021 17:07:58 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E83C06174A
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 14:07:18 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id a4so10256775pgc.11
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 14:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=VDm29ZQ3ND3S5WXLnP5x94ZreXBFcYdsGtUSCKzKxY0=;
        b=S0QH2nQWvKnw8BPUVH+PML9M7t7tBAz7G/8Z/vaPDKcvn1o93saG1SlWyvj2fm1Zxu
         SMF85Vtr59DdJH9mfkeW4qvg+klzmDzGtmy3pWn/ZsMKQa+lDvVCoqAplNAPdvW3JIB4
         you4Pxwk03j+chC4Xwvux0nY75NNtO4CqDnl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=VDm29ZQ3ND3S5WXLnP5x94ZreXBFcYdsGtUSCKzKxY0=;
        b=RmW/CyzaKV1zjEZzb+KQxL6VYTLyokIQZ81ZyiWxdOgzVqJussFsO4BTBX7xjicujo
         3KGy2oMutv6Wiuj362dp4Qi0mXHAup8KFSQq2DeeWOpBQcnZmWSLQNp18ice3ZNApMSB
         pyc34J+1FY+mw0+VVeTUrauSLD5IoA+Nowcz7YrpWQq440cY+yG7oVdohysRxz379KTv
         VtD06WdbPjmZbsbuslTo2sSKYjiXJXq8K7ERD/IBenowoC3lgFmfmD578O4e8mZSS7Dj
         /OffLS8w0obSUpH9+apmcMZbcL2ahHMzj3O1hK0DFfWuV6PA0qyKtOaGRqQ687t7sI0N
         L5RA==
X-Gm-Message-State: AOAM532l6QcDoPPXu28jDpvJPx1nTFvlaG2DZLETem/JDj0yrKvJifSM
        onJ2DJHFpTx/I7zHSqx0X46/1NAU/3aoDg==
X-Google-Smtp-Source: ABdhPJwlgzsV3n8xx8KIVdXXiRdmQsp5IXjmvmIUarwhukHS80A4UpteJfo6N1l8VEbcIaZw+TXaxg==
X-Received: by 2002:a05:6a00:80e:b029:1db:589f:332e with SMTP id m14-20020a056a00080eb02901db589f332emr12161140pfk.24.1614550037449;
        Sun, 28 Feb 2021 14:07:17 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id b22sm15357253pfo.23.2021.02.28.14.07.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 14:07:16 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Wren Turkal <wt@penguintechs.org>
Subject: v4l2loopback and v4l2-mem2mem framework
Message-ID: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
Date:   Sun, 28 Feb 2021 14:07:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi there linux-media experts,

I am working on the out-of-tree v4l2loopback module[1]. My
current goal is to implement the videobuf2 api. However,
it appears that I must use a different vbuf2_queue for the
OUTPUT and CAPTURE types. It appears that the mem2mem
framework has the ability to do just this. I came to this
conclusion while looking at the vim2m test module's code.
While trying to modify the loopback module, I have added
some code to try to call v4l2_m2m_init. You can see my very
WIP attempt at code here[2].

I have installed the kernel-devel package on Fedora, which.
Unfortunately, I get he following error messages when trying
to compile:

<errors>
ERROR: modpost: "v4l2_m2m_release" 
[/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_m2m_init" 
[/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
</errors>

So, I looked into it, and Module.symvers and /proc/kallsyms
don't have those symbols listed, so I think the Fedora kernel
was not compiled with those symbols exported.

Okay, so next I tried to build a custom kernel that does
export those symbols. I managed to get it done by enabling
the vim2m (VIDEO_VIM2M config option) module. The new
Module.symvers includes the symbols; and the compile succeeds,
which brings me to my final act.

I need to expose those symbols without enabling the vim2m
module since it is a testing module. I do not see a way
to do that explicitly. The config option in question
appears to be V4L2_MEM2MEM_DEV. And I haven't found a
way to enable it without enabling something that implicitly
selects it (which vim2m does). Do y'all have any suggestions
for how to get these symbols exported properly when vim2m is
not enabled?


Thanks,
Wren Turkal (wt)

[1] https://github.com/umlaeute/v4l2loopback
[2] https://github.com/wt/v4l2loopback/tree/m2m_try
