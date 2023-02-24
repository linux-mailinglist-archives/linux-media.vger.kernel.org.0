Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6376A20EF
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 18:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBXR4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 12:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjBXR4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 12:56:37 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E7A1ACE0
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 09:56:29 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id ee7so572535edb.2
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbXTR5+i3/KBBpbTAVOszPhAVrrVJz/FmNta2gYwbNM=;
        b=QjPOWucHuGBhWLDO6ODfcnkfvHqxc51pUvuFt8uUFGYPPeQqEtxn/On/6OGtvzdoBo
         vkZzK9wFBkO36VChVLcb10K3larvbCdTfr0YYZ0u0qiHUFxmJD8TfX8kRrwkqzqLeOrW
         2DiUgu31dmuMVEqEtELYOSW8i3DEuBm7f6eswI6tGaZ9U1dJ4/IO+evZjnSKgJ6UYDnq
         DmajArn7Fok/PBtkxfirlJMtG42kyAJTCGSXEwWJCinhHM5uxPe70toHbm2dys+1beGV
         jj3yFekOLs5jchK207LoZePAhTwBbHQ+fjjfgoOJZnpodcdpzHFq5PMi14hUFpuUkHPo
         icFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbXTR5+i3/KBBpbTAVOszPhAVrrVJz/FmNta2gYwbNM=;
        b=fp2CUyp1J37F5UFl8u1UVpnDpThpZ3nNBoSOmVtW9DlqotiTSsMRhFEAez4r6g3fYW
         SyXEfhzFCjLkfXzQPMBzG3NwmWSCyEkBo8n67ZW7fXPkcOB7wS4pC9HLolppOD7iwy6E
         zPARPexteoxxONomdwrFLR+Ru2K2KxpkE3bqSkMaEf0E0qTtYjJzOzlHzqXtk3grDg6T
         RvM+fJQ62LV1T+cRLiEpokfj2y554TycRPBA42Akg8JnaWIjnMZyY3C2ag6gkoJ0siFC
         o+lPwl9sWnbSJbjnBbDC2bW4reJWqnzmCkIUWEltDmXnXJvBlG7pH6PkfUM6F/ccM6nV
         qpCA==
X-Gm-Message-State: AO0yUKWq8/qhHDoGEODScO+Y/deJpKR1m53UMuvd26EPYLY0qH7xOCTr
        cYo7KmUi1Ym3znkj3u4uzPLxhDVNQXtRQw==
X-Google-Smtp-Source: AK7set8YlIutd1WbMii0RG24Y3v70oHnF5YgyW2D3s0VsrVzQ8AmO6s+RKtY+Io1Y+gWvkJGoYOyhQ==
X-Received: by 2002:a17:906:7f8c:b0:8b0:fc14:bbcb with SMTP id f12-20020a1709067f8c00b008b0fc14bbcbmr19410322ejr.42.1677261387397;
        Fri, 24 Feb 2023 09:56:27 -0800 (PST)
Received: from [192.168.0.125] (ip5f5a5b70.dynamic.kabel-deutschland.de. [95.90.91.112])
        by smtp.gmail.com with ESMTPSA id c9-20020a50d649000000b004af64086a0esm3381036edj.35.2023.02.24.09.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 09:56:26 -0800 (PST)
Message-ID: <34c5fef0-8200-f0ac-a3b0-7442e10c97d6@googlemail.com>
Date:   Fri, 24 Feb 2023 18:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: v4l-utils 1.24.1 has been released
Content-Language: en-US
From:   Gregor Jasny <gjasny@googlemail.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
In-Reply-To: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

the first patch release of v4l-utils has been release as 1.24.1.

Changes:

> Hans Verkuil (1):
>       v4l2-tracer: use __s64 instead of long

Thanks,
Gregor
