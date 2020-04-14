Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C131A8D08
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 23:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633538AbgDNVAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633447AbgDNVAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 17:00:11 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22B0C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 14:00:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y25so508139pfn.5
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=I1SkLO986L3fIryWB21NXR1lxmGWpbhSr4LBFtq6Y5E=;
        b=lxCmgYxQNEffugus1AiUuPRNsGSxi//R3iJc6WJfJTVGlpXjIqQQBTw5UMBbXanBSt
         /CmqVKVy12dAAjBFjAGywhgJPU6Slwf+Udd5rv1zqUqaalKQde02jBYC4QUEM8H1xQo2
         kHyUg3g/enzCDTlWPirvZnbbAouCFlR6/rIk/xiDx8wJXGLJSs2htTZ6X6D1DAqa7x4V
         RUFXprlm1AuZJKJZF8o/Rdq2pPtoNBJup2wcTtOEQTdPspfRnLRu2Rq1v8zyteRxSzww
         GV4eGPLTuIec92JTAcR8VBuxQUBQCkOSrO72+PqxuJSYWl7qOE06nlfk4ljivgSoguvn
         W1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I1SkLO986L3fIryWB21NXR1lxmGWpbhSr4LBFtq6Y5E=;
        b=LwXtnwm03p6Ly8DrzqUnK9UqHVyAnFxfl7lut6sQvwvW6yHkDk7S2/KniGLGqdWqHL
         856LLliGCsWYZOG4v+/2uwjHrV4R1HBj0N7Ih7euJsa84psZ9Nj1+MkIgD+nFrggpt8m
         5CB7AXUAGYj6c2EVbc8rMzl0eD3WcVLCP7NSVZ44T9/oISZC2hZ7Si637ueiCoTz8sPO
         GsylkG/K/PAuIklogf8Giysxlk0UvRIMlY8NnsNYu4lJeZvJL1q6YOiFgldo2aIHkqEZ
         eUsWbLDg1THW7yTcdUv2Xd7pSpiMrS8X+/sk00R9ovBHnkwgvFd2mkI4CAU2xSHya9YW
         lAtQ==
X-Gm-Message-State: AGi0PubhYdgArDRD+UkOSjqLwn4uq4u66Yq1ytdpgPpL+MA0ChalwwVL
        6HT5DITBEnEUsT16qn2kNCfUYJDbZTQ=
X-Google-Smtp-Source: APiQypLJASvUwN44erl7JnuU3zCpF9ppdDDPiLRuXgD0rhx0yCw/qp915PHnJEygJn47b92ofFHTJA==
X-Received: by 2002:a65:428a:: with SMTP id j10mr23402604pgp.272.1586898010902;
        Tue, 14 Apr 2020 14:00:10 -0700 (PDT)
Received: from [172.30.88.83] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id q9sm9096959pgt.32.2020.04.14.14.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 14:00:09 -0700 (PDT)
Subject: Re: [PATCH v7 01/11] media: imx: utils: fix and simplify pixel format
 enumeration
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
 <20200406163905.24475-2-slongerbeam@gmail.com>
 <CAOMZO5Cz-2L6bTTC=f4bnPtOP1zZ6Ch5JbhuPg=DYz9wTK_TyQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f41abeed-977a-3216-1290-aea46f8720d4@gmail.com>
Date:   Tue, 14 Apr 2020 14:00:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Cz-2L6bTTC=f4bnPtOP1zZ6Ch5JbhuPg=DYz9wTK_TyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 4/9/20 8:38 AM, Fabio Estevam wrote:
> Hi Steve and Philipp,
>
> On Mon, Apr 6, 2020 at 1:40 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>> From: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> Merge yuv_formats and rgb_formats into a single array. Always loop over
>> all entries, skipping those that do not match the requested search
>> criteria. This simplifies the code, lets us get rid of the manual
>> counting of array entries, and stops accidentally ignoring some non-mbus
>> RGB formats.
>>
>> Before:
>>
>>    $ v4l2-ctl -d /dev/video14 --list-formats-out
>>    ioctl: VIDIOC_ENUM_FMT
>>          Type: Video Output
>>
>>          [0]: 'UYVY' (UYVY 4:2:2)
>>          [1]: 'YUYV' (YUYV 4:2:2)
>>          [2]: 'YU12' (Planar YUV 4:2:0)
>>          [3]: 'YV12' (Planar YVU 4:2:0)
>>          [4]: '422P' (Planar YUV 4:2:2)
>>          [5]: 'NV12' (Y/CbCr 4:2:0)
>>          [6]: 'NV16' (Y/CbCr 4:2:2)
>>          [7]: 'RGBP' (16-bit RGB 5-6-5)
>>          [8]: 'RGB3' (24-bit RGB 8-8-8)
>>          [9]: 'BX24' (32-bit XRGB 8-8-8-8)
>>
>> After:
>>
>>    $ v4l2-ctl -d /dev/video14 --list-formats-out
>>    ioctl: VIDIOC_ENUM_FMT
>>          Type: Video Output
>>
>>          [0]: 'UYVY' (UYVY 4:2:2)
>>          [1]: 'YUYV' (YUYV 4:2:2)
>>          [2]: 'YU12' (Planar YUV 4:2:0)
>>          [3]: 'YV12' (Planar YVU 4:2:0)
>>          [4]: '422P' (Planar YUV 4:2:2)
>>          [5]: 'NV12' (Y/CbCr 4:2:0)
>>          [6]: 'NV16' (Y/CbCr 4:2:2)
>>          [7]: 'RGBP' (16-bit RGB 5-6-5)
>>          [8]: 'RGB3' (24-bit RGB 8-8-8)
>>          [9]: 'BGR3' (24-bit BGR 8-8-8)
>>          [10]: 'BX24' (32-bit XRGB 8-8-8-8)
>>          [11]: 'XR24' (32-bit BGRX 8-8-8-8)
>>          [12]: 'RX24' (32-bit XBGR 8-8-8-8)
>>          [13]: 'XB24' (32-bit RGBX 8-8-8-8)
>>
>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> [Make loop counters unsigned]
>> [Decrement index instead of adding a counter]
>> [Return directly from within loop instead of breaking]
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> [Fix colorspace comparison error]
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> This fixes a bug with an IC conversion pipeline.
>
> Could we have a Fixes tag for this one, so that it can be applied to stable?

The fix would need to go back to

e130291212df5 ("[media] media: Add i.MX media core driver")

but it shouldn't be difficult to backport. I'll send a v7.1 for this patch.

Steve

>
> Tested on a imx6q-sabresd:
>
> Tested-by: Fabio Estevam <festevam@gmail.com>

