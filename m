Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFE723DF5F
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbgHFRpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgHFQii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:38:38 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF47C0A8937;
        Thu,  6 Aug 2020 09:37:52 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id i10so17745342ljn.2;
        Thu, 06 Aug 2020 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Q0WTpvCCL+6Pe1EDwbYvKPkRlKq8z+DxxZ7AeLCJVg=;
        b=TrMpilwZ9M4MwreBNnwma2VJI2q26VefA0WuFvLmreCsroIk7jwLukMoCftKuFEuhS
         HjGOlFlw/dYW35bodmQ6KKv0WGlQYjZH/XbqPrpMGhlaVF9lk6rQoZeA7tpKXz4kOSlg
         XyZx8DGJYmazif0infQGFLCmFl+o4w8GFZHCaIKFlhIlY0sdWoZEjWMO0w1it2SS4fwk
         gbYGX6VbT0MA5LPdQq8Wpt6+s3LMoJcTIfMqzpPDgBIrs29E48gURdn0VRoshdUsYcKo
         AIWWxTFDiyb0GIaIchp1SJDjiTtVTWZc0IECA4QTnL5L+aidt2pZTIoFIoZO4YWqrQNG
         7wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Q0WTpvCCL+6Pe1EDwbYvKPkRlKq8z+DxxZ7AeLCJVg=;
        b=BxIJiPKdwoPV/iH0CQVNCPjmD5sSMC8rZEils/HQegH/+r9BYoX83aM3t6qzO1BOcH
         GI5OjO7eV1WCpSTORZpE0oMXvnmU99cSqn7Vvkiv4F9fKcCQIZx8wUqDNYfEW2JhT6VS
         V+e17ygsHe2FiEkIwn4pUukkzAPJqXGp291qytKWA+8Ahg8HMmENOFFK/m6/Zec9Gy00
         STQnD6Bn8XO20nQUx0JTUbuj9YIV81tFJ5ERTpRkIECVhOR0QXWPhuj6fPj/7H74+j83
         fRdZ+TRNvonSG2kxCfjxJ3MRG1DlgJkqhoAK4SbtGm1NmYUvwSyLH81vvVmgYYzU0HdY
         UhCw==
X-Gm-Message-State: AOAM532GDQkSMSeCEOPd+ROYfgtaq9npF73iIa3Jeo/UqTHgp8qv71f6
        c5eB4cJhseWQQF0kdoDKGGyAmqVb
X-Google-Smtp-Source: ABdhPJx4ujwkV04InWB60thG1oTCOQyv6u1R0K+P5Nf1ivz2mWIs/0ZQn9L5vQD/xYaS9UXOT+8p8w==
X-Received: by 2002:a05:651c:330:: with SMTP id b16mr4315610ljp.77.1596731868683;
        Thu, 06 Aug 2020 09:37:48 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id e14sm2613354ljl.96.2020.08.06.09.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 09:37:47 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <9deaee09-c422-5694-7c19-d85354b9b703@gmail.com>
Message-ID: <14793e8c-30dc-5cf5-fdf9-6f64fa433818@gmail.com>
Date:   Thu, 6 Aug 2020 19:37:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9deaee09-c422-5694-7c19-d85354b9b703@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 19:13, Dmitry Osipenko пишет:
> 06.08.2020 18:59, Sowjanya Komatineni пишет:
> ..
>> We cant use active status check for specific pads under calibration.
>> This is common bit for all pads.
> 
> I'm not sure why this is a problem.
> 

IIUC, the start_calibration() should wait for the MIPI_CAL_STATUS_ACTIVE
and finish_calibration() should wait for MIPI_AUTO_CAL_DONE_CSIA/B.
