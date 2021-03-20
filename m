Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545F4342E76
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 17:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhCTQ4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 12:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTQ4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 12:56:14 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3506C061574
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 09:56:13 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j3so14387192edp.11
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PCB2yZ9sMKQ2/tRaym0YakwQHCo8fxYfPHH7WijDDtY=;
        b=RfrtiplV0YnxvgBEF2DH2vc+03ymxWg3s4PX8Pc5GUnnzmdzZXQF8xuP017ZwoPjAh
         0aKYUf5vMjmAUFyIManD/+Gt41iEWcwPW2NLp+U+Z9zweTHYBXaNg6FghFOE4FsDeXsy
         EhIS6vsnsRC2kqROY2GBeJX3Ojdzmd5RdJBUs4EcSs92driIY0+KRcXF1Ma/1Sa+WM2w
         1OO4qriGwjismPNzlwjQGkpTEdFomiFO1LlbhV/Ny/rJyvoqju9L+ZHVzr6/bDbTc6tw
         vjPDDYh/d0KzJYH0y6oDUVOCP7DlatWaPENOUEVxKVYQ7j6gLw1SuR+LS/CX0+ReD95N
         lJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PCB2yZ9sMKQ2/tRaym0YakwQHCo8fxYfPHH7WijDDtY=;
        b=kKbaNM7Mh7fYM3BPL4g6mUDETR19K3sF7LIApaSRqFgs/ch5P2416wVHvon7NoVT0/
         ZGziiwbQpsFgAT7nSDV+pvAxONJPthCDeWNA6S5dvMs2qhNeP+MywGfZFjSFO7E1hQwX
         7AcOdNSnvlkH3hKHY1B/l548xhgZxQdGSO2HnVwgBOXxt2tHA+Q8co33ip0nnW00JD0k
         C4uX1ejrKmoqokj6U9WWXAB8X+R1CRWqnPwr5wDTNTqOpDa99+LY+TlpB+deo64dOYZ9
         /hCl989sMfClLwZuRuGO4rZv3YXtsKpWoESJHuq1UKo4IP8COsTdq3wkaZIkFOlkg5L7
         uvbw==
X-Gm-Message-State: AOAM530D/1M1WjIN5RFE5OcMUQja4MWxusCfXO62b764+TLYGLkzJaFN
        /uKgUCk3OlE6iNUQFITl9GE=
X-Google-Smtp-Source: ABdhPJzdbea6LGOihMgu+sT8l5mptNqU19wnELtXLP/KAeI32haomjZQlRWfkG6RqcevZ1gPCFsZ+w==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr16361874edw.348.1616259372511;
        Sat, 20 Mar 2021 09:56:12 -0700 (PDT)
Received: from gregorj-mbp.3amlabs.net ([2a02:810a:8300:31a8:d4f7:9cc0:8c7:9338])
        by smtp.gmail.com with ESMTPSA id jj15sm5714301ejc.99.2021.03.20.09.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 09:56:11 -0700 (PDT)
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
Date:   Sat, 20 Mar 2021 17:56:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317172227.620584-3-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Thank you again for these patches. Building v4l-utils has never been so 
fast and easy. It will accelerate my Debian / Ubuntu packaging and 
really sparks joy!

On 17.03.21 18:22, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.

Here's a patch on top of your tree:
https://gitlab.com/gjasny/v4l-utils/-/commit/a9853f79c2675bf08fc3e93f15aa4158c9769bdd

I changed the following:
* Use pkgconfig to detect libbpf (like configure.ac does)
* check for libbpf presence in the keytable subdir (like it's done for 
libelf
* refined the empty rc_keymaps dir hack with something supported by 
meson: https://github.com/mesonbuild/meson/issues/2904 (your hack 
stopped working for me with meson on Ubuntu 20.04.2)

With those changes I could successfully build a Debian package using meson.

Thanks,
Gregor

PS: I could not find Mauro in the CC list.

Tested-by: Gregor Jasny <gjasny@googlemail.com>
