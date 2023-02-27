Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A640B6A4160
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 13:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjB0MHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 07:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjB0MHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 07:07:00 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DD71421A;
        Mon, 27 Feb 2023 04:06:58 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso4904312pjs.3;
        Mon, 27 Feb 2023 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrHEMkhyfJhxIny70LQz8hfKlJZxebfX1zWh9JqyY+g=;
        b=Yj28AAZRGZ0QzeoY1TIm9msvcpiSCxy4fSZgwOXT2VeXGJI06XOK23h77Ulc+3TCmM
         rNkgRMyGhy/Nz7m6MzfbagblWRRnEPlUMxlfZpuTFUWsmQ0h4f4Ggcjknk5cExgekM1V
         2mxPQsnd6vZ73yaEmK5lXoUeDgdRefpT+RJFlw0rjV/ucrLSsFtH+1UC914QT2GIKiD7
         HhF1j6JM5ucV9ro0+h5i8WAnohqQJEIstlZmN8k+z8RilWRb9ciHU1pSttJW920WmSJa
         DG4j4YXLUo/Z5QZVvvN2Yvyn5ebvpdQwUiH2VIF9u2aZH1zyZDo77wOtGG4TpWjBYLCA
         6KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrHEMkhyfJhxIny70LQz8hfKlJZxebfX1zWh9JqyY+g=;
        b=B89Zdz7nCt0OQ6RXjDp9doGMHNbIrexb8xYcnRigYpPFvaEP1L6hdAa5TZfVTaait7
         HQfcGoFeEHGF9A3SJegJXaQGlxOIFBzY8PfOMw2yMK1UiEmB6OZwj6mAGw1ZCx1X4GB3
         OCqUxYENiJjxe9Hh3Yjt3RKqSXj/WZ2LqgAmp/IyetlXv/C5izwqJk3RJWsrNS2ffLjQ
         O9F/S1khDIHfTgZfj6ORAVE1eb/HbfvJHZit2p7zyS4JN/Qm8OWCs43NCsxnkvbveDTg
         PxySqMsNJz4F8tDMxsCyR7VzFgHQW2r+nAb4dNogASzucyqeVhJk1+7GKkIy3Ifs1ba0
         riAw==
X-Gm-Message-State: AO0yUKVcZj4xtA2VVEB0FhRzemHb76CThxCSszCL4/tOoLkrUvneTolk
        8ggyDg3C8OtLxbi/7aBkKNI=
X-Google-Smtp-Source: AK7set8NO0asQI/pmISNEICt0Z8cmaKJvOLhp0aqvHqrYnOAzeoc04uOO2eT8MP882N2GR02yXcnAg==
X-Received: by 2002:a05:6a20:2996:b0:c3:2bef:bd62 with SMTP id f22-20020a056a20299600b000c32befbd62mr13007016pzh.1.1677499618113;
        Mon, 27 Feb 2023 04:06:58 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id w18-20020aa78592000000b005afda149679sm4210430pfn.179.2023.02.27.04.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 04:06:57 -0800 (PST)
Message-ID: <a0d52b30-265e-056e-0e67-6873d2c3b9ee@gmail.com>
Date:   Mon, 27 Feb 2023 21:06:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
 <20230226114744.7221f460@coco.lan>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230226114744.7221f460@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sun, 26 Feb 2023 11:47:44 +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 26 Feb 2023 08:39:32 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> [+CC: Jon, linux-doc]
>>
>> On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
>>> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
>>> documatation for a few new RGB formats. For some reason these break the
>>> pdfdocs build, even if the same style seems to work elsewhere in the
>>> file.
>>>
>>> Remove the trailing empty dash lines, which seems to fix the issue.
>>>
>>> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
>>> Reported-by: Akira Yokosawa <akiyks@gmail.com>  
>> Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>
>>> Note: the offending patch was merged via drm tree, so we may want to
>>> apply the fix to the drm tree also.  
>>
>> So, the offending commit is now in mainline without this fix...
>> I believe this build regression -- a real build error of "make pdfdocs"
>> -- should be fixed ASAP.
>>
>> Tomi, Laurent has suggested a typo fix in the Changelog.
>> Can you respin ?
>>
>> Or, Laurent, can you do the fix on your own?
>>
>> Hopefully, the fix can make v6.3-rc1.
> 
> Better to wait for media PR to be handled. There were some changes at
> the documentation that affected the patch. I guess the bug is gone.

You mean the PR at https://lore.kernel.org/lkml/20230226114551.68480d44@coco.lan/ ?
Unfortunately, it has had no effect on this issue.

> If not, we'll need to rebase the patch.

There was no change in Documentation/userspace-api/media/v4l/pixfmt-rgb.rst,
so rebase is not needed.

Should this bug survive v6.3-rc1, I guess this fix could go through
media or doc tree.

Thoughts?

        Thanks, Akira

> 
> Regards,
> Mauro
> 

