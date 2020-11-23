Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CF22C0106
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 09:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgKWIAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 03:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgKWIAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 03:00:53 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A2DC0613CF;
        Mon, 23 Nov 2020 00:00:51 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id r18so2185485ljc.2;
        Mon, 23 Nov 2020 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+R+JNclZgjAIp74nTEW2MpC45ZQjxua3rT9ldLR7X64=;
        b=XT7XMIW2/7UiCRLTqQLTxE08gDJF8723vd6prF2Az56SaHVXdRGI94BouLZQoY/w2N
         Ciz8k19BDYzR1YA0IEByRbKeJ9iazfhzQQOxJnCMhEZYSsnAYA6AJ6xa3BVEGyy7YT5A
         5tJgyHx1+Z9mhUXhcKPdxJAeZaevYJcRn524WRBI4us5OoajxkQIchvAsB1JanznIB7H
         574A+KrPBB4Hgx0kiw/ykcqaMI4fnnlXJHINOtlh8FHZcpZTho7X0/QlvTsSgmM/LWFu
         zowtFZfKTXUUOEZKoy5NIRvIunoFTlScRGe451VPGIKol9e/ATfzGdhueHjPfL9o6kot
         /W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+R+JNclZgjAIp74nTEW2MpC45ZQjxua3rT9ldLR7X64=;
        b=XsZtT7jzjK0fcuqtw2zG6PzPsyx5xX2XBiJZjcO4Gh7iQfafzvch08yRLepDmpwGFb
         FtnSOQ+ZW9NSab02disJHetgANhKEcJUNV5zkCJ66F7kpZODUB1b+8/FHf3BWOAVqKtO
         6Y7k7+rEpAsOnZBeN+PMVPUd/S7p+Y1CPsVHfLgHGQ4N/b1ul59fxc25W3S24qAQUBdf
         mqQbEuN5Yr6MFieov5v74nKtGDXrareIOypRlUwhd172WaFCqFsqshZUrHJq85HAZhw4
         e2n4P9+izfRALhxqOYFzkniydFE95SgHrYT3bK1YBYUikKgO0cKgF3zxVkGYoxzSdRNP
         lQZg==
X-Gm-Message-State: AOAM5338oZckHS/0lPAu86hGJvBHqQbKRPa2xvr3EK+QPBiWHbFb47u6
        3ODwS53JwSTtGpEA3BsO9kyPI8L/VEc=
X-Google-Smtp-Source: ABdhPJx0z0mBVdrk2wOQNwmP0i/oIga5IKBta77q6bj392MIUnH/5LH28ruuXOjv0L9rJDbfKkOz0g==
X-Received: by 2002:a2e:9689:: with SMTP id q9mr11781621lji.197.1606118450064;
        Mon, 23 Nov 2020 00:00:50 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd? ([2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd])
        by smtp.gmail.com with ESMTPSA id x9sm1287348lfg.93.2020.11.23.00.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:00:49 -0800 (PST)
Subject: Re: [PATCH 1/3] adv748x: afe: Select input port when device is reset
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <07627595-ac71-4dd6-500e-804a6fdbeb46@gmail.com>
Date:   Mon, 23 Nov 2020 11:00:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 22.11.2020 19:36, Niklas Söderlund wrote:

> It's not enough to select the AFE input port during probe it also needs
                                                            ^ : or --?

> to be set when the device is reset. Move the port selection to
> adv748x_reset() that is called during probe and when the device needs to
> be reset.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
