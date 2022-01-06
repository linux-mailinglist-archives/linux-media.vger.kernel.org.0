Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E964863FF
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 12:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbiAFL5W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 06:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbiAFL5V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 06:57:21 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2249EC061245
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 03:57:21 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id h21so3723164ljh.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=xCqbnTUciYYm4i0py3tfn16xVLPbfaLOPAYa8mdGIB4=;
        b=Jy1ghy0FeAMTqOMXRv+2xGwBZaLCPU2oT+5Qg48SA4nV036rL1VKsNfh2HbgGjzBy2
         JMpbwmKDF6/vRnZkHROUHP6lcUS5KMyn51ZTzQGIYlFkVVPV5DEckJoRtYGxU++ek8Jh
         0n8zkbsICmDnO5CYkFGfqpxhiGG+oy94iujuLynlpRcAYwAUEUbvyRts9F1y7/07OTHr
         0idwjh5FC8KBm3tlUBVW8fSMAJ5iRRtvfMp8WkIcPt1dlGBtXjK9cumQ78hJ64+2/KhL
         t3AHf4QoCZRqVYzIDXkkG1uOA3mLfsmA2xEphBLB3LWPALJsfpK+gaWFRilj5AeSxFG7
         oGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=xCqbnTUciYYm4i0py3tfn16xVLPbfaLOPAYa8mdGIB4=;
        b=lwBnZRwzJ/ey9hBoy1sxwQypWvCeI7BXYLb0VhkEEudaymzdCr0uCxs0vaZ+PWufoO
         kgRMZa1rh5GZFADwzmfpA9Rarj6bPlOCy7cscKgro860BzB2ZhCLMow61oPK7sUeQztW
         FtBUkOBp+6cs39xP7NMzVzxZuC0eYEmI82FTuGeC/fsZg+XE40Ae2tp7VLZjlwbh4G+o
         PUWSFrNbWk9woNXwsI/9RP8T6FGIaTQIzSXX95fpAtRLHlfmkTMzYikaZ+5z1+ufYfEI
         R/rES/i/rTMCEAvLw+0ro7szMF9hC8XBXk/VBps+I+zl0kqo8IFUPMUgPRb3QVen7OH7
         WMrg==
X-Gm-Message-State: AOAM5339mhvU3yf5g1HK7T5Wxdq/F97qiYE6F14a69aMHitk8KvSdOeJ
        zNGrFQwHN892NS0aUHG2lvE=
X-Google-Smtp-Source: ABdhPJwVWRqsItl9uGSNMRFK6vUVUoOsjSuCVTziK21jB098tN/2oVhmsxlV5TvUsnFIanDK+sRTwg==
X-Received: by 2002:a05:651c:1054:: with SMTP id x20mr49597808ljm.414.1641470239260;
        Thu, 06 Jan 2022 03:57:19 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.53])
        by smtp.gmail.com with ESMTPSA id bu1sm152992lfb.164.2022.01.06.03.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 03:57:18 -0800 (PST)
Message-ID: <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
Date:   Thu, 6 Jan 2022 14:57:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
 <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
 <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
 <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
 <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
In-Reply-To: <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Anyway, you can revert my patch locally and use your device. I
> understand, that this approach is the best one, but anyway revert will
				
				 ^^^^

I've missed "not". Please, don't get me wrong :) Reverting something 
locally to work with upstream device is never a good thing.



With regards,
Pavel Skripkin
