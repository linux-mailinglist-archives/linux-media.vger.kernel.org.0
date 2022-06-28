Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4994255EF02
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiF1UOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiF1UNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:13:46 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71953B03
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:07:06 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id p13so8927091ilq.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=58uGHT1wkzHcOwGiM/tG1YDR+EQL8zM7OJ1XHh2pbPM=;
        b=V0XcDN8ArBGifZqV6c2hOOGD0Qc2jF94XC/4DZUC1UmOGJQLTywNpK3d4WPfEhMjMD
         YTj3Z8ybEjUXBxof5IIAMvbPRf+ugOvghKLUtWRQAx1pEP1TDuMM5wwLniT2mArauVU6
         djSzv/OJ11KZWbOLh1rNfO8D1AmlMkOXi5+KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=58uGHT1wkzHcOwGiM/tG1YDR+EQL8zM7OJ1XHh2pbPM=;
        b=htOSRsfTlW9EwtU0aA+2fvOC2LDP+qgphkiEJl9VuHiVYluVB/IcJZZuhbHMRKuSb/
         6edrTAHLszgN6WIfSXD6hCFoPpDb2emhmOEi51HGtBO2aab/gb9zHIJtED0DP3UdAHbS
         hjQsTDdSzCH0srAWFXCGD00w/E41OrjCHlBT8GFvhBneEmi7AUXzZTZmm0UqE4p/V/JG
         eTERBx9JCp5AEIptthdX6GwMic9b6ACo1p9n8pKJbiIiE04NvOa9FPZZQiRccdP7KdXo
         /4ahQ9aXpc4U1F0Q6SIDWNFW7sgQCdlYdmyACygazsTd+j7FXSRnIsC17NiT495BkCa3
         UOFQ==
X-Gm-Message-State: AJIora9vK2xVl36nNxd/Y3ejq53PE3ZwuduerTLB/7jMuKhd4rG3jwX3
        mRcz3bA5dsEwv6wbfplbrFchKw==
X-Google-Smtp-Source: AGRyM1uT8icQziaBNgTHYDZxGDzvdLDwLHA2m3dikjlKd+7vyMjg5QZQhZLV+8CHczy76SKepcHqbA==
X-Received: by 2002:a05:6e02:15c4:b0:2d7:aa1e:5b55 with SMTP id q4-20020a056e0215c400b002d7aa1e5b55mr11633315ilu.120.1656446825888;
        Tue, 28 Jun 2022 13:07:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id r20-20020a5d9b94000000b0066952cfe3e2sm6954921iom.39.2022.06.28.13.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:07:05 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220628005353.1719403-1-yunkec@google.com>
 <20220628005353.1719403-2-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fa8f343d-9f54-73d9-ef2c-1b6a4146898f@linuxfoundation.org>
Date:   Tue, 28 Jun 2022 14:07:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220628005353.1719403-2-yunkec@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/22 6:53 PM, Yunke Cao wrote:
> Add lens to vimc driver and link them with sensors using ancillary links.
> Provides an example of ancillary link usage.The lens supports
> FOCUS_ABSOLUTE control.
> 
> Test example: With default vimc topology
>> media-ctl -p
> Media controller API version 5.18.0
> ...
> - entity 28: Lens A (0 pad, 0 link)
>               type V4L2 subdev subtype Lens flags 0
>               device node name /dev/v4l-subdev6
> - entity 29: Lens B (0 pad, 0 link)
>               type V4L2 subdev subtype Lens flags 0
>               device node name /dev/v4l-subdev7
>> v4l2-ctl -d /dev/v4l-subdev7 -C focus_absolute
> focus_absolute: 0
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---


This patch is now queued for vimc pull request for Linux 5.20-rc1
to be send to Mauro Chehab.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

thanks,
-- Shuah
