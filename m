Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C2223DFF1
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgHFRzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbgHFQ2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:28:51 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AEEC002172;
        Thu,  6 Aug 2020 09:13:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d2so20782820lfj.1;
        Thu, 06 Aug 2020 09:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MmVura5RdAnpr7fQMyfSzUsj8YChs1506fdeSTUofBA=;
        b=cKtgqXyMnWAhAXx07h6MqHavPWnX+8vXN9E3//RSzZrZbRq/c5xK4c3KEh+FuEAUsr
         sUmOhnTKG4o6G4tAlFBd34n2g7jgUAJ1pmlPWRXqeq4RIO6bYlb6uIIIVHUBGrlr3yCB
         JVWuF90zqMAtaVrlgRDv2u5AOYCVWSTnQL7HKFCIDDRZT7ZgmLEg2YBkdE1/Yan5LJA9
         vB2G/v8lSG5MgS23J6HzSe+XRoEjUSb/yAfBGuuXZd2PWH2glivmm7E7VVcQoPGzzShk
         rl5AFSHzVbyAhRAzcIbLDbrT7vhF1A2E07b/dz7NNT4hVAy5scVNkcaYqKTo05qb/ELK
         dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MmVura5RdAnpr7fQMyfSzUsj8YChs1506fdeSTUofBA=;
        b=dMBv2BeMaxnRGmLhCxVasCTfvwSld5znC5C8FDaVmlgmvqfDUol9nNlwlPYW95siXE
         tJLaoRVyXXdL5P3EkyU5ncKOzERw/2qd7znz60wdTLXLk90BFke7Qkf+qds5kCRXFg0l
         BvR5UTc5jQ8LoGr994BJGRSUIaROy3DwGPsFf41s8MTsxmkuRnonBBC8WdvHQqgCNX17
         QAkQ8o6RL6kks9eT6u+Z1ZWIVVrlz7jQEnD8GSLMmRj8sobOMLYscc14eBaltNS2eZgG
         d4catp8WQ8wEda9NjoA5/OZNK37Bv+KniZ+j457qKK31XMxZDPwgO7hYWEtScT04HpUT
         QNFQ==
X-Gm-Message-State: AOAM533ovDejqT8diYMVSPhxp+Ja4nCKn2Bqw4+ITS7Av5OJyRdede7e
        a92hX05cmLP+rVYIUI2NXJFgifpC
X-Google-Smtp-Source: ABdhPJxyQ5DUwhm0mMp316XsoDHXatr2AKM4d69hS19HNWsjohoDpk8gx0kZj8bJ5qSAUfPGeLHkvw==
X-Received: by 2002:a19:c68b:: with SMTP id w133mr4214252lff.189.1596730420623;
        Thu, 06 Aug 2020 09:13:40 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id d13sm2905531lfl.89.2020.08.06.09.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 09:13:39 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9deaee09-c422-5694-7c19-d85354b9b703@gmail.com>
Date:   Thu, 6 Aug 2020 19:13:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 18:59, Sowjanya Komatineni пишет:
..
> We cant use active status check for specific pads under calibration.
> This is common bit for all pads.

I'm not sure why this is a problem.
