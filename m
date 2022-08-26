Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FA35A2C47
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 18:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbiHZQ1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 12:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiHZQ07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 12:26:59 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC5ADF4EB
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 09:26:59 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-11c896b879bso2685341fac.3
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IwdfaRL5XMNyq6UaMgcjYFaFkCylOaS0tTCH0NyFVj8=;
        b=lb60UjWn79KC94eMbeWtP8+mo3ZgPmXAzAM6KeE4jS2vVFehOGRZ/Kesx4gLIhdjAe
         3kDXxvaF0bRPjmqveQiOkeVNw1nctdBpQiU4Ip/u1JbyKoO7WgCtiVO3Z0tElsA9rGcf
         2JtnJdIwlWp3V6QnpYPJBLVfVWH8hzguTvwZKJ3v3zLw6Rr9VqkQec2JewNHt/KLzQHF
         xb0DZqa6ln8H8vE89UKXxYkrUBY62LhmUHwajofQugcrIrb0bhBHC4kVdHP8XcgeCvjo
         T6sbuW8fCbQ+F5mUJqzOT9HszJhCCj7Ync6j8b6gDJU1yMSTxRrM4zS/uFMnu3vM+lp7
         bDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IwdfaRL5XMNyq6UaMgcjYFaFkCylOaS0tTCH0NyFVj8=;
        b=dssVMB404NzR+wdu8i9fN3FD55LLCb4fpcSWbqUF+lb9i0X/HZjnHjgIEzjHdgxFEl
         0MWp9g4gFN8eqd0hq54pJbYZ7N9wP8JnjmGLe2X1D53MKhDogp4IF8DDg6Gp/fSKUYfI
         xPGdYjTSpCO4QGgW4w01ocXkOE4azyw7l4hZ+GKbQTJvOs9wncDfsIl4i5+NAfPrraCB
         ieOQIv/Ckyt1n6BMEX9sesqRU7jZc8b+NKBOB8db1pHbVppfgyoPXS9utlTYYtoXE7vS
         879JxE+gzzuGlJGR2pQrtnaONbxxwFDbRSozpCc+G1G4PjamOloRE2ARoyOdd92MQOBb
         0NDA==
X-Gm-Message-State: ACgBeo0m89VgfVJ9Dt5932dGy1BEI9bABl0yZ3Edzf6Hpm9vAn0LPLlU
        QlsGoiZMzBOgMTJEH7Zw8PmDf+dA/qM=
X-Google-Smtp-Source: AA6agR6TjOomWu+SkJw6UFthSS1N9p+486RGtsn+oxZbZ4biaDG0XdDyf5HC/h1kppSHT68ZEed1Bw==
X-Received: by 2002:a05:6870:831d:b0:10d:a96f:8bc with SMTP id p29-20020a056870831d00b0010da96f08bcmr2131251oae.143.1661531218608;
        Fri, 26 Aug 2022 09:26:58 -0700 (PDT)
Received: from ?IPV6:2804:14d:72b4:8284:19ed:f36a:47fa:2c31? ([2804:14d:72b4:8284:19ed:f36a:47fa:2c31])
        by smtp.gmail.com with ESMTPSA id l17-20020a4a2711000000b0044b61af8816sm1250215oof.41.2022.08.26.09.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 09:26:58 -0700 (PDT)
Message-ID: <cd50d839-fef6-1fa8-22e8-71c7c72a7ee1@gmail.com>
Date:   Fri, 26 Aug 2022 13:26:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH v3] media: Add AV1 uAPI
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>, daniel.almeida@collabora.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20220825225312.564619-1-daniel.almeida@collabora.com>
 <CAGXv+5F78Y9ioYSMdPP1uGAchr=si0Dqwhd1o1eC2uqi8hynTg@mail.gmail.com>
 <CAGXv+5FT2+T1wE_u0c=otNSjUg_q83Jv9uk_hG3U21CU+_0yFA@mail.gmail.com>
From:   Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <CAGXv+5FT2+T1wE_u0c=otNSjUg_q83Jv9uk_hG3U21CU+_0yFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the review, Chen-Yu.

Apparently I also forgot to update struct v4l2_av1_film_grain to struct 
v4l2_ctrl_av1_film_grain in a few places in the documentation. This 
change was made in v2 when film grain became its own control.

This will be fixed in v4.

-- Daniel
