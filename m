Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C28E24C7AB
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 00:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgHTWSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 18:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgHTWSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 18:18:10 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0AFC061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:18:10 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id s16so2373326qtn.7
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RiRYLlGsCOBmpvi0JkZGLjV4JuvXUrqrC7Lo10azg78=;
        b=qnepnWh9+APvmPMERKnAaQkDLnfDbw7KtKvCWxrdIpkmOnr05uv0VWoGtng5oCOVaL
         GqRDDGCj2rasA7tTWjq8lmqWCXELm8bpEnzNZrbquQ8/zZybgpgQkfcxMgx452Xw2dhG
         o3JddH2e7jKffH0OJGIuQpm09a0gM50vwcQpA2CgnQ5Y7k3jpU2dOzlPNITiXGeRDQsr
         946+VhOEY4/M7xYlEuphBLcoFv+4y1eKZQEpTvKkzw6o/gI6F3j8s8mvstu7ikxHOriW
         3K+WKBkMHVsGJHJSntlVoOZ7h/jaWknrvfPRkKbPpqCyS5HYLSdQwSNrhiI4exMPFFJ4
         kaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RiRYLlGsCOBmpvi0JkZGLjV4JuvXUrqrC7Lo10azg78=;
        b=X+QknCWgsrnhU79yw34GVdb1DpOTKQqrX+xp101e4DH2CGi3IOBfYQJzClsf2UOoaH
         fl10YTWXdxfkAseEOEF4Odz7HxAJiwDIcW2Q1pVfz1S9wjxq75hh/hO7UF3QnWaVGB3E
         x8O5h7V4Wb7BpUvrYCmA3AFOsn+xpb6KQ0wzoq01SjXXbnwCnKLakkPO/r87tkOKzw1i
         Q7XvkUUHBisOZeDHbXQ4Rmjg0hBaWB/adTZbgLviRew39wiEvNc8pUV+mWSDUFRR7rzM
         G9yT6RQNoBwkptMJmqsorDekr2nDPL2uLQ2JZjiqcsGeFXwQnxhD2CGBdHGQGgkXh1wb
         W2iQ==
X-Gm-Message-State: AOAM532hQE62LqyZRwpbGEtKVgvMEtXkBt5FHgXAruKWG1VPI9zhh0ul
        i4r/xlRUus8u9nPcmXXqeNuHdB0hdLQufulplEE=
X-Google-Smtp-Source: ABdhPJzvlgWxg5hNmmVaW4Wl94XKmYMnLe7E2A8h7FCOmWirCFgFi5VujMp129HlDvN1BuTB21uGoA==
X-Received: by 2002:ac8:180b:: with SMTP id q11mr654273qtj.389.1597961889383;
        Thu, 20 Aug 2020 15:18:09 -0700 (PDT)
Received: from [192.168.0.228] ([152.168.116.231])
        by smtp.gmail.com with ESMTPSA id o48sm4550301qtf.14.2020.08.20.15.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 15:18:08 -0700 (PDT)
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
 <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <7baeb919-c3a7-3266-a512-13393e5a1126@vanguardiasur.com.ar>
Date:   Thu, 20 Aug 2020 19:18:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 8/20/20 9:42 AM, Hans Verkuil wrote:
> On 06/08/2020 17:55, Ariel D'Alessandro wrote:
>> Supports building libraries and tools found in contrib/, lib/ and
>> utils/ directories, along with the implemented gettext translations.
>>
>> Also supports generating plain HTML documentation and manual pages using
>> Doxygen.
>>
>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Acked-by: Gregor Jasny <gjasny@googlemail.com>
>> [Gregor: Control symbol visibility]
>> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  .gitignore                                    |    1 +
>>  Makefile.am                                   |    3 +-
>>  README.md                                     |   85 +-
>>  contrib/Makefile.am                           |    3 +-
>>  contrib/cobalt-ctl/Makefile.am                |    2 +
>>  contrib/cobalt-ctl/meson.build                |    8 +
>>  contrib/decode_tm6000/Makefile.am             |    2 +
>>  contrib/decode_tm6000/meson.build             |   14 +
>>  contrib/gconv/Makefile.am                     |    2 +-
>>  contrib/gconv/meson.build                     |   44 +
>>  contrib/meson.build                           |   13 +
>>  contrib/rds-saa6588/Makefile.am               |    2 +
>>  contrib/rds-saa6588/meson.build               |    7 +
>>  contrib/test/Makefile.am                      |    3 +-
>>  contrib/test/meson.build                      |  143 +
>>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>>  contrib/xc3028-firmware/meson.build           |   11 +
>>  doc/Doxyfile.in                               | 2351 +++++++++++++++++
> 
> 2351 lines to add this file?!
> 
> Is this really needed? And if so, please add this in a separate patch in the
> next version. This huge file pollutes the diff, making it very hard to review.

Yep, it is needed. That's the Doxygen config template, which is processed and
used by meson to generate the docs.

BTW, the m4 scripts are already using another Doxygen config template:
doxygen_libdvbv5.cfg, which we could remove once we drop Autotools support. The
reason to add this new file (doc/Doxyfile.in) is that the syntax for variable
substitution is not shared between the two build systems. While m4 uses
$(variable), meson supports ${variable} and @variable@, see [0].

Anyway, I agree with you in that Doxygen support should be split. Will do in
patchset v4.

Thanks,
Ariel

[0] https://mesonbuild.com/Reference-manual.html#configure_file
