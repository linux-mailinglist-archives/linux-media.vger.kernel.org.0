Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC733906B
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhCLOz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 09:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhCLOy4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 09:54:56 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD92AC061574;
        Fri, 12 Mar 2021 06:54:55 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id d16so17794469oic.0;
        Fri, 12 Mar 2021 06:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m78mBvSniWqKMDyGJEBqM8ia3GGy83UgRaI78+ZpVNs=;
        b=px4Fb5SG1RihopR8pXYMC7LNGcjKiTrrweSNpWcbEUQsdyI8QWTXncbMYnP/4dvNVQ
         iajkhic181Wb9MKx1zFPtKzPRuSP5uUeBshD0HE9ML5CfkBTOyAzCtvb8n1wk7/8XPgT
         13FtU55/vHyHBQB04vn991dWzkHm+aKfbSVQSA5OkIwho/agLHrXyJR7oELKxV2M5JtE
         7nophJtMuBeC4buSKkVwKOicZXzZ2PiI1T6UmVQ7r6xvcKZaxNHfJgl4cRtexcSBhh2N
         ug6B3obyAsI8CFn/a/WSkNUdtiPfJ46i3A3Voyu/tcazdAL4opqj3RKqlgEwchjUB+W5
         YG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m78mBvSniWqKMDyGJEBqM8ia3GGy83UgRaI78+ZpVNs=;
        b=np42TkBmausowPTpT0rs4JAGkvL4hovc1gleXRI04ajP5q83nO1HKlPxJXIlJDbzCN
         mr1ldCfTh6++luwl8n63tCdDaEl/aYs/stNtUCMyVC27j+LDnBBoRWSc2spEujhPpUgD
         C6CENevZsfreLJcUxReDhwc5s9hkV4jEoraNpmgny/px5KVy8H3DWI7K1x9vvBrEsXSP
         VtEcHhjmMHr1wKgfZVSBaOmrwrpGerSxIoMpRYe0U/sizrPMHzbvlJnwgv1zY3Y+biv2
         YdDaPLI49N2se/CTsdL4h9Ipcw68whN46z61V10xRYnRp3EkpIYCyONMU7zDjtaY1u3y
         1pTg==
X-Gm-Message-State: AOAM530AFXQTbHnWg4pod3CiuLFPNVpAWYTqDzM2GaWCCFhTxnoI51WH
        AbKonRbogpwJriIEncMJR+o1Nqi4lRQ=
X-Google-Smtp-Source: ABdhPJwn4wo9nkC0PwZ1LrD6jT+MJjZ7TSzpm6lBDK17Lzsg6Eqa96206QTWB/cGt5DpIHFIoNkccA==
X-Received: by 2002:aca:3046:: with SMTP id w67mr9977443oiw.57.1615560894935;
        Fri, 12 Mar 2021 06:54:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s21sm1268137oos.5.2021.03.12.06.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 06:54:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH RESEND v3 0/5] media: uvcvideo: Fix race conditions
To:     Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200917022547.198090-1-linux@roeck-us.net>
 <20200917124714.GD3969@pendragon.ideasonboard.com>
 <990652f1-b6e4-211c-7a96-8c3fc3ea6efd@roeck-us.net>
 <YEsZ7qnSRv0EkJGG@atmark-techno.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <74c0c32a-ebb5-34e0-d3a2-6b417ce328a1@roeck-us.net>
Date:   Fri, 12 Mar 2021 06:54:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEsZ7qnSRv0EkJGG@atmark-techno.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/11/21 11:36 PM, Dominique MARTINET wrote:
> Hi,
> 
> Guenter Roeck wrote on Thu, Sep 17, 2020 at 07:16:17PM -0700:
>> On 9/17/20 5:47 AM, Laurent Pinchart wrote:
>>> On Wed, Sep 16, 2020 at 07:25:42PM -0700, Guenter Roeck wrote:
>>>> Something seems to have gone wrong with v3 of this patch series.
>>>> I am sure I sent it out, but I don't find it anywhere.
>>>> Resending. Sorry for any duplicates.
>>>
>>> I haven't checked the mailing list, but I've found it in my inbox :-)
>>> I'm not forgetting about you, just been fairly busy recently. I still
>>> plan to try and provide an alternative implementation in the V4L2 core
>>> (in a form that I think should even be moved to the cdev core) that
>>> would fix this for all drivers.
>>>
>> Thanks for letting me know. As it turns out, this problem is responsible
>> for about 2% of all Chromebook crashes, so I'll probably not wait for
>> the series to be accepted upstream but apply it as-is to the various
>> ChromeOS kernel branches.
> 
> We have a customer who reported the same issue recently, has there been
> any development?
> 

Not that I know of. We applied the series to all Chrome OS kernel branches,
and it reliably fixes the problem for us. We'd like to have the problem
fixed upstream; until that happens we'll have to carry the series forward.

> I don't see anything in either uvc nor v4l2 that would address the race
> since this mail half a year ago (well, I could have missed it ;))
> 

The problem still exists in the upstream kernel.

Guenter
