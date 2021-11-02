Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212FA44296C
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 09:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhKBIdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 04:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbhKBIdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 04:33:05 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EFCC061764
        for <linux-media@vger.kernel.org>; Tue,  2 Nov 2021 01:30:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 71so12632975wma.4
        for <linux-media@vger.kernel.org>; Tue, 02 Nov 2021 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nCgO+uZHFStD8hLXCzNalA44tqZcE4MfAhL3rn/cLWI=;
        b=HVzJyNIXZH3L6ZIrR80XH86gi3mBC2HnrygLYyjSWiVXoYhgzAaKZxYy6iifsCDyI4
         y3OPuTWOHUeuRt70K0t3RXiAW71pE7QJyXrPtlY+KKWuLe9sLGix2s2fzxg93waT9OB4
         OgmEJg1WC74W5o5Cxkmm4KBFzMHofy/+hjd8r1byXz6KSxEjaMnG+lWQ+EQvW/hoUMvQ
         vk92LdCVTxVNLvztDCI/qDoDCXumZiuiC6sxxkb6StylWR0LUy5313dY4eaND9x/SGTK
         O5OOzv2lI6HAnzMtSkKa4ILEImiXYxfbzrLfSYFdHkd857nWei6b8sOEzE0o4UPCquy3
         ISgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nCgO+uZHFStD8hLXCzNalA44tqZcE4MfAhL3rn/cLWI=;
        b=kdQBL0/Lj2I4yHIPbOPBp7K4mMmC7RKmIZTTXiU/bVhCeLXzTkyJU7lm2d0CHQYImf
         BhRx1j45KKXMnRLdBXr1exURCLVxE7KUZi6Ct8gVh6Kv7Cse/xzRXQ4GfqLkZORoeRTX
         8DrcwWrxF6Puz4elVLkYjahQet71x6IBmR7aQYO53/t0xXsBmv6z0NuoWooQlAY2XpIq
         Y9Zunfm3mCqdJUX/2DhhsqQgErfjYdspqXVp4wE3j2Nyh4h/zio3DEUtX4Jtcr/6N5LA
         mpzLIm5JIcwuif2Zm26bMAiTCC+6Wg3uV34Zv/52oleBrd4nAcdfTGLq5nfObAAiFgg2
         37Vw==
X-Gm-Message-State: AOAM533FNj8Laz8usuD5LyoFqidCiKYvl+qUyJPu8cpgVJH+b7XbyFkE
        cHIg3oMuBub7Ft/BZigYKwpvfwvMd3k=
X-Google-Smtp-Source: ABdhPJz4/7HXw54dU4lU9DB/ZCfrqjhyhIgpy8qwYCLfaFHE1BLPnv12qPWRN4nZCK5o3MNAORWSig==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr2770254wml.119.1635841829296;
        Tue, 02 Nov 2021 01:30:29 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o26sm1722690wmc.17.2021.11.02.01.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 01:30:28 -0700 (PDT)
Subject: Re: [PATCH v4 13/16] media: i2c: Re-order runtime pm initialisation
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-14-djrscally@gmail.com>
 <YX/Pw2n5/LXkSLxS@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <637c27c4-f867-6cc5-922b-89d78888cf1f@gmail.com>
Date:   Tue, 2 Nov 2021 08:30:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YX/Pw2n5/LXkSLxS@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 01/11/2021 11:30, Andy Shevchenko wrote:
> On Mon, Nov 01, 2021 at 12:11:16AM +0000, Daniel Scally wrote:
>> The kerneldoc for pm_runtime_set_suspended() says:
>>
>> "It is not valid to call this function for devices with runtime PM
>> enabled"
>>
>> To satisfy that requirement, re-order the calls so that
>> pm_runtime_enable() is the last one.
> Shouldn't this be a fix with Fixes tag applied?
>
Yes I guess so - thanks, I'll add it
