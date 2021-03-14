Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A1933A85C
	for <lists+linux-media@lfdr.de>; Sun, 14 Mar 2021 22:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhCNVvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 17:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhCNVvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 17:51:46 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947E6C061574
        for <linux-media@vger.kernel.org>; Sun, 14 Mar 2021 14:51:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id c10so62967267ejx.9
        for <linux-media@vger.kernel.org>; Sun, 14 Mar 2021 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Z8swSEPwaqWQrRjCC2Qlh7gl8acwvyCzwSdJgCcyvQ=;
        b=pWamnzK+sL2yz35OkCvdvTaxy97NChtDui99uiYAjeWWIlvn1fYLc7ONQ/VlMkpS2k
         q5W6Bm/bg2LVvXx0VpR8+ebmy5VXwQe/QZSaJgL8T/Sn06IJ0lln/yPjkN4i+xxLVe7M
         17fb5RYaP2FneBiOnp8j/pMn+328YyMmoT7SEYqRzQfedIXZLxLNK5NEg13MM5hX0qqN
         OOLONXopAzp3ssY3WHvr92BfOfmVK8JFU+ERfpK2byiE/XLPaLg4rDIpni6rLvZRdR2U
         ED6GvKIs0sIabYb5aPlmyEFidpIlLAR9F4wQY3un8BIMw9OX4SEFo33nqbBxemwfkoUq
         LQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Z8swSEPwaqWQrRjCC2Qlh7gl8acwvyCzwSdJgCcyvQ=;
        b=MAI8Dm/N3iLls5zh1B0WvM6LUUUDDbvnlwzbEZu3QydVRvzbtebDkCOd97m52CsdkW
         V30TkMFr2s5U4Fo0UzHbIo6cEaDL3syRO2Wgtgh8RbokY7r2qclsOf+8DGhBdzPG9vIs
         VDjogYxg+w+P/JC0ciPl2FMq9t44eotMChjeEvaKdqoCzQsEyO3wWvDQ1T0JMxd8fUc1
         FTBD5cWRKGqGByYpNcTBWtJWaSySCQ7/NUdGtqIubqKpxAyE+lMgEIfnMfZ7cy7OjKeR
         S/61nzN4Hk5SwqS3T6biOOEi6YajuEHgnQbSAaA9ETtf86lbmH1KG67o+lTKnFC316jr
         sE2g==
X-Gm-Message-State: AOAM530z65svo4D14wGs3fy+wrgR2d8hyDjsja65Qa6Op9b8QFTrDHBR
        zTEP2fi9mOKSZbh1x+vgxBCfqB0i/m5sHg==
X-Google-Smtp-Source: ABdhPJxr+qcs/WGOfVt4hmeFZHh8WVmj50gMbj/0r9/ruji9s52UqXjDtA+ALDvKJ5Ir4JyPC6p37g==
X-Received: by 2002:a17:906:2e08:: with SMTP id n8mr19958849eji.527.1615758703914;
        Sun, 14 Mar 2021 14:51:43 -0700 (PDT)
Received: from gregorj-mbp.3amlabs.net ([2a02:810a:8300:31a8:3d4d:3d10:e920:270])
        by smtp.gmail.com with ESMTPSA id q26sm6248136eja.45.2021.03.14.14.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 14:51:43 -0700 (PDT)
Subject: [PATCH] v4l-utils tpg GCC 11 fix
From:   Gregor Jasny <gjasny@googlemail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <E1lHUCT-0000OM-9X@paradis.debian.org>
 <CAJxGH0-c4eU0Tpwws+jpvf=_+3hJj-rSroQGb9xuZ5ii-KwR+Q@mail.gmail.com>
Message-ID: <8169ff5a-8dba-088b-e3b3-1901246d5aec@googlemail.com>
Date:   Sun, 14 Mar 2021 22:51:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJxGH0-c4eU0Tpwws+jpvf=_+3hJj-rSroQGb9xuZ5ii-KwR+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 04.03.21 17:25, Gregor Jasny wrote:
> qv4l fails to build with GCC 11:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984381 
> 
> The reason is that min/max are defined as macros here:
> https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200 
> <https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200>
> 
> should I apply a fix which prefixes the min/max/3 macros with libv4l_?

Could you please take a look at the patch below and tell me if I should 
apply it to v4l-utils master (or of cause, apply it yourself)?

https://sources.debian.org/patches/v4l-utils/1.20.0-3/fix-gcc-11-ftbfs.diff/

Thanks,
Gregor
