Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7424C7B0
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 00:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHTWTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 18:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgHTWTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 18:19:46 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A266C061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:19:46 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id m7so2941452qki.12
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t2QnXri3YWsNtJpE8e4DD7eqSyAwXuUMOpjwY8IsxUw=;
        b=ryDWD66oI+3TOuw11wBu5mCDVT9R34iqtaaVUyblzEY08j3S09iIRNECyc51R5f6W9
         j894TGbp/7qroPBAEkhimkzWAvEvkQnUnHehWBSbbU+CWxXEtP68VOnK5xGDmJiJ9o41
         CKhiBvGKSwEO3ZiE5tK8VR3zbxohYtAIEVQcrO4jlzNQ4EsWH44sxh7WZPaAWRdmPXDw
         TcvBcTfWDgL8lMxXNMXuyJ0dWvf0nYKNxYIRlaZgv7qHiNe6MypowViBB29DtmuNPbUr
         gcD59s029B6rzmZZTDIzRE0n0M9tSXLTk6jGpaSWJdg2xktbTh7qGdiq7tLpwAJVQXoW
         4HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t2QnXri3YWsNtJpE8e4DD7eqSyAwXuUMOpjwY8IsxUw=;
        b=ggfBZYILFnYfU+YtgFJS1sO9dnunJMom4lySPfWg/kF6/K5plzhjVWA0Y7DcExXlig
         2tacBCHS/hgcm/a0ym2DqvDdh3hZ6HhC1OBXN8rCWe9n0UGJPZl0tPMg2GOXL78uriOU
         1ZIW5uMgGAZn33pswSvOnNkIbc8CsIOHn0dCgR5NaIUQDAUmWTsYXot7gwYzNnCrC0/O
         BXXIC3uJrDM98Dw66bTWAT9T9MCr8dYPVJvfk0POe3PpJ4mDiNkajWyWu7x5xVIaXQRX
         GGPHWWOguwwPHcOapEQ+u5AbRL/eSTpmWA8O4k+OywhxXPZdRJCSewK04tfi/uYEJFA5
         ULig==
X-Gm-Message-State: AOAM533LOs7p10h2RnylP8mF4GITYh9U+x3fdSuN9kbKF5H+72/gUcxC
        ouZzrJwZIuzYqA5ogcJysgPzCA==
X-Google-Smtp-Source: ABdhPJzi9Cvvan8tcQBvaxB2FWjS0yO66FVIpwR3Kyo9we1sdNoE1D1pscw87m0ZWa/kjmaGQ7izZA==
X-Received: by 2002:a37:b801:: with SMTP id i1mr119177qkf.240.1597961983317;
        Thu, 20 Aug 2020 15:19:43 -0700 (PDT)
Received: from [192.168.0.228] ([152.168.116.231])
        by smtp.gmail.com with ESMTPSA id p26sm3504133qkm.23.2020.08.20.15.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 15:19:42 -0700 (PDT)
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, sean@mess.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
 <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
 <20200820133539.GF6593@pendragon.ideasonboard.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <ba821e4a-9b30-7428-b864-189ad64abb40@vanguardiasur.com.ar>
Date:   Thu, 20 Aug 2020 19:19:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200820133539.GF6593@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 8/20/20 10:35 AM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Aug 20, 2020 at 02:42:56PM +0200, Hans Verkuil wrote:
>> On 06/08/2020 17:55, Ariel D'Alessandro wrote:
>>> Supports building libraries and tools found in contrib/, lib/ and
>>> utils/ directories, along with the implemented gettext translations.
>>>
>>> Also supports generating plain HTML documentation and manual pages using
>>> Doxygen.
>>>
>>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Acked-by: Gregor Jasny <gjasny@googlemail.com>
>>> [Gregor: Control symbol visibility]
>>> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
>>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>>> ---
>>>  .gitignore                                    |    1 +
>>>  Makefile.am                                   |    3 +-
>>>  README.md                                     |   85 +-
>>>  contrib/Makefile.am                           |    3 +-
>>>  contrib/cobalt-ctl/Makefile.am                |    2 +
>>>  contrib/cobalt-ctl/meson.build                |    8 +
>>>  contrib/decode_tm6000/Makefile.am             |    2 +
>>>  contrib/decode_tm6000/meson.build             |   14 +
>>>  contrib/gconv/Makefile.am                     |    2 +-
>>>  contrib/gconv/meson.build                     |   44 +
>>>  contrib/meson.build                           |   13 +
>>>  contrib/rds-saa6588/Makefile.am               |    2 +
>>>  contrib/rds-saa6588/meson.build               |    7 +
>>>  contrib/test/Makefile.am                      |    3 +-
>>>  contrib/test/meson.build                      |  143 +
>>>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>>>  contrib/xc3028-firmware/meson.build           |   11 +
>>>  doc/Doxyfile.in                               | 2351 +++++++++++++++++
>>
>> 2351 lines to add this file?!
>>
>> Is this really needed? And if so, please add this in a separate patch in the
>> next version. This huge file pollutes the diff, making it very hard to review.
> 
> Note that Doxyfile.in is generated by Doxygen. I agree Doygen support
> could be split to a separate to ease review, possibly with one patch
> that adds the generated file, and a second patch that modifies it.

Sounds like a good way to go. will do.

Thanks,
Ariel
