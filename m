Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327FD6A1EDF
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 16:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjBXPtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 10:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjBXPta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 10:49:30 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D183B66973
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 07:49:29 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s26so56407277edw.11
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 07:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=repVKq+NgM7onWXs9eUajDAwRSLMK3KUJn/9lkEwdZ4=;
        b=OwpEDm/VWvUYnycLTwmGQHjqxaw1B1t6NhSrDRz49Q4k42++WWevOz0eLwBM6hqY+Q
         /XF5YAntaQfOQ7vsiq2mR8RFp3+wmtSSChr3bvolZW3aljqmZyFVAXzNo6e9D/b2aQlm
         WMwO/ixBJs4rpwpF3VNIOGoURCIsTNyM96r4yakwJA+qzIRRiiv6MqngZTmSawosIcWQ
         GVM38C+9AReOJi/JYqu+Hm0ad533/2jmkQZ/I4AyytK8Dcuqdev8CYi7Pic+N++zIHsL
         LJrbm9Rk1cwccbth4LFT0Mcn1LLzWEl8FLF8oAjimZhcpYs8eWwnn15vvbfoIaSb2QLI
         MJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=repVKq+NgM7onWXs9eUajDAwRSLMK3KUJn/9lkEwdZ4=;
        b=k1WcyN7U0EJMiV7Xlud19pSyQhQ2GZFrdTDXqlr8XtsSoo+bAN/VwaIswrmdKPlFSp
         Hd4AEd+p8TXoSkZ69rqyPOmVhRwfKfIOsKWJJnuPQhNLIl6F8hqKhqlh+w4CxE9eCqTy
         rknWQUgWonB+iDp3Gs8QViSp0EjKSkQeCpDF3GN72B52npTShgNdBSbD7TD+Y7gCSg3N
         McG7kb9eEKSAqWpQp0p6K24uooLEOTN6iSXnZ3xwtm4uA1z7sdpjmC978Ht2NQeHtnjT
         sTOZClgGWX54mhfg1xsp66CdFoFiZwo4spWTEElcKKBGrPVFz8WyyjRRa0o9jV7RlIxS
         qZsg==
X-Gm-Message-State: AO0yUKXDMaGtRTfpiv0eid3rT7cfELzUAmDKWT62pj7mHff789mXIUek
        ymdTg7OLlCtXjXnJaXE6Hpc=
X-Google-Smtp-Source: AK7set+cbyGp5NmUn3RkIXq4sLx9mteMiDNjFFMDilwzk9sNOGCZ5XeNLUQpJ+QWTCGzamdn1xfkVA==
X-Received: by 2002:aa7:d60b:0:b0:4ac:c690:d637 with SMTP id c11-20020aa7d60b000000b004acc690d637mr17175319edr.31.1677253768253;
        Fri, 24 Feb 2023 07:49:28 -0800 (PST)
Received: from [192.168.0.125] (ip5f5a5b70.dynamic.kabel-deutschland.de. [95.90.91.112])
        by smtp.gmail.com with ESMTPSA id y20-20020a056402441400b004acc5077026sm6063259eda.79.2023.02.24.07.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 07:49:26 -0800 (PST)
Message-ID: <055c0e33-0e6c-b442-6178-57e1b5700ada@googlemail.com>
Date:   Fri, 24 Feb 2023 16:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Fwd: [git:v4l-utils/master] v4l2-tracer: use __s64 instead of
 long
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
References: <E1pVZNx-007qor-Bf@www.linuxtv.org>
 <98e7a971-4a46-8780-1bf0-eb87752af9f2@xs4all.nl>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <98e7a971-4a46-8780-1bf0-eb87752af9f2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 24.02.23 15:52, Hans Verkuil wrote:
> This one should probably go to a 1.24.1 stable release.
> 
> Sorry about that, we didn't try to build on a 32 bit system.
> 
> The good news is: people ARE using this, since it was reported within a day.

No worries. I'll prepare a release this weekend.

Thanks,
Gregor
