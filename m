Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22603F6C1F
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 01:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhHXXSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 19:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhHXXSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 19:18:03 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0C9C061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 16:17:18 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso3001996wmj.0
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iJePc+eWIeOuuqVyGnbAaUdxF8jTAudOYO+hdZxJdOM=;
        b=ezcFgTmpuGpLPwUSijofAf3EUTaHcw2AyWSWa3567aOv9RV19Q9CtbaYb2pQK1VrMM
         ZgULeYk1rRP1pSRsBoJ/Yx8GeYfKCrnmp+O47MAT8nhcRQmCYQq8ot69CE4Fekjk1O83
         CBY4btYPrH2O3S9vishQNatAChyasjlA4aN0fzYLsamcgR0uWURpFiGFOvKjMZBr4oEB
         ieM2/CK1ovgs0HX9rn7v6FKeC/JrTw/w1CaoXYaOg5eFvTXxFOudYh58tW3fk45mZZ/a
         d/fW/6oWihjWxfvjn9J66bzn5nY72G+qGlph/poVCSqGdgxkIcpVq9rVmNT/NzKn1Q7S
         DAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iJePc+eWIeOuuqVyGnbAaUdxF8jTAudOYO+hdZxJdOM=;
        b=kr/OBx7IqvqDBbsy2UQBfQxvRnWmSGdQu4qmyol7daCe4QmUmL95ALwXQH4s+QqFPW
         uqHtu5xVABgSiSiBTE+2cQLoGbuJh62olhpdVvQyDEmuYfWbE0zT77+oy+O773mZd3Xp
         zM3+t8WLvilx4LYl94ZXJBJ3uCcC95YxwUy4sTjwwR2qvX5iBLrIBB1UN8cFU1Mq/Tu/
         YrpfuS0TjlOGfL+Bt8ndDgc0jwzkv/hmCFEL0moed26HavmojDUVa9RoM4LfzSEY1fG/
         dLdZ49he8UBj4L8M4y7sNhgMmp+CZ5KmGmvAc7/8zzIZPnrFqucEA824GjAlguqs1ar4
         +nWA==
X-Gm-Message-State: AOAM533UXjkrama/Fam077yqnee+7/DaDcPKgFc+iVzLhW6HXNNFzE0u
        FynjDUUR9tN6tw0DxeO7GX4=
X-Google-Smtp-Source: ABdhPJxHgCQYjjWavf0VIKHvCR8yJt0X/bgXpJ0MjnOvEfS8wenp1O1XS6ON7oj7NktFis3bmUnJtw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr6279878wmc.21.1629847037424;
        Tue, 24 Aug 2021 16:17:17 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id q17sm18987017wrr.91.2021.08.24.16.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 16:17:16 -0700 (PDT)
Subject: Re: [PATCH v2 05/12] media: i2c: Add .get_selection() support to
 ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-6-djrscally@gmail.com>
 <20210810133821.GC3@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <bf35ebbd-3c85-18c5-cbe8-43b6d5398533@gmail.com>
Date:   Wed, 25 Aug 2021 00:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810133821.GC3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - sorry delayed reply

On 10/08/2021 14:38, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Aug 09, 2021 at 11:58:38PM +0100, Daniel Scally wrote:
>> The ov8865 driver's v4l2_subdev_pad_ops currently does not include
>> .get_selection() - add support for that callback.
> Could you use the same for .set_selection()? Even if it doesn't change
> anything.


You mean do the same? Or use the same function?

