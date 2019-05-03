Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB39712D20
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 14:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfECMFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 08:05:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37999 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfECMFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 08:05:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id k16so7578441wrn.5;
        Fri, 03 May 2019 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
        b=dHc+xc8DYo3RihRctct4xWfaqJ5SiX1ja6MN1EHUcGdv8NLKKo084y9NitaTrPJgYv
         aAhc+nzQ5ZZWKvAkpv28d6EAduw3v39ezTmTYG/PwQ3UidrlrHS8yr52WR103xl+lxfY
         YyXTAVmH0V2lfgBbhIqhimNFXV2fMOQr3s5NklwAKZ+0NHpclKF//gDz7h2uYE7a8g8D
         UJEjKTsLt4q2uzP9/i/RSejAxgqvj2CpFIO2ZejuY2/sZfmbDspQ4oqw2cW/LVRkRvAN
         QA73UZngNoLmxfu7il/Q30G1JR104TYnxZBZ11sCnK2HEkQk5mjFkgF+I+6aFsPh1Mj0
         WIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
        b=ta9CWQQ1UmcC8tTC/918C0r7gnw1nnZyvaYuYaxOJ1dT9PVKC+qaFRRCOPuIqnj/oA
         bJ65cFS3w1A8zu/ld6kEbrIbhxPlTRBIRa16HKp/1pKp4HQsH6m8LWKhvOlvOHE7rGjb
         pNU6DiVGFUbgBE7PB0fM+PI7+eE6PvNAcOzZ8GqhInubzASGfK3FfYgzq0k9DLIWfRQz
         NigTyH0HP2K5HFmcjAdcJEqJ7fMy3Si/wImrC+qVq3smuseaMu0AK+HvMNeuyEmhxNdq
         OZeS73UWnikKl5g3ueSJOCIyrXwxG9/Xwm2sMwQNadKpPIvgGWCiVXQtLjCjQ2AHd0vL
         orMw==
X-Gm-Message-State: APjAAAVD/AgbNj8yFdqyWn1eAE+CCRejD2w0ris2YXJdVE9LDVzEW19c
        jxxte/BsD1SlHbfDqY/Ujx4=
X-Google-Smtp-Source: APXvYqyYwnyo89NT41zbGJYLycJsHIGyjlMBU4l16+rP/hKAeRwZLEqVDzlM9YpnUIa9E2fhjOMM6Q==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr2832098wro.219.1556885150671;
        Fri, 03 May 2019 05:05:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id s16sm2232061wrg.71.2019.05.03.05.05.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 05:05:49 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH] dma-buf: add struct dma_buf_attach_info v2
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     xen-devel@lists.xenproject.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, sstabellini@kernel.org,
        jgross@suse.com, boris.ostrovsky@oracle.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de, mchehab@kernel.org,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        pawel@osciak.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        tomi.valkeinen@ti.com, rodrigo.vivi@intel.com,
        joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com,
        sean@poorly.run, maxime.ripard@bootlin.com,
        maarten.lankhorst@linux.intel.com, sumit.semwal@linaro.org
References: <20190430111002.106168-1-christian.koenig@amd.com>
 <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cbcbb076-a8b0-67b0-8c16-daf1d060fc1d@gmail.com>
Date:   Fri, 3 May 2019 14:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 30.04.19 um 19:31 schrieb Russell King - ARM Linux admin:
> On Tue, Apr 30, 2019 at 01:10:02PM +0200, Christian König wrote:
>> Add a structure for the parameters of dma_buf_attach, this makes it much easier
>> to add new parameters later on.
> I don't understand this reasoning.  What are the "new parameters" that
> are being proposed, and why do we need to put them into memory to pass
> them across this interface?
>
> If the intention is to make it easier to change the interface, passing
> parameters in this manner mean that it's easy for the interface to
> change and drivers not to notice the changes, since the compiler will
> not warn (unless some member of the structure that the driver is using
> gets removed, in which case it will error.)
>
> Additions to the structure will go unnoticed by drivers - what if the
> caller is expecting some different kind of behaviour, and the driver
> ignores that new addition?

Well, exactly that's the intention here: That the drivers using this 
interface should be able to ignore the new additions for now as long as 
they are not going to use them.

The background is that we have multiple interface changes in the 
pipeline, and each step requires new optional parameters.

> This doesn't seem to me like a good idea.

Well, the obvious alternatives are:

a) Change all drivers to explicitly provide NULL/0 for the new parameters.

b) Use a wrapper, so that the function signature of dma_buf_attach stays 
the same.

Key point here is that I have an invalidation callback change, a P2P 
patch set and some locking changes which all require adding new 
parameters or flags. And at each step I would then start to change all 
drivers, adding some more NULL pointers or flags with 0 default value.

I'm actually perfectly fine going down any route, but this just seemed 
to me simplest and with the least risk of breaking anything. Opinions?

Thanks,
Christian.
