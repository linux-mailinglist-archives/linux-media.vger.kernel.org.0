Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E30065E7D2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjAEJ36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 04:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjAEJ34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 04:29:56 -0500
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46824551DF
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 01:29:55 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id fy8so24731599ejc.13
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 01:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UQIi9Ycd1y4kwglUfzMyXDT7RIF/N9ey92kzAZN2Wc=;
        b=mCR84iQ+A1xP+tZAC/ZM7tS27N/02JJvqLE2NdRduneE483eilkIvOVXjjNC8M9dHM
         3oKSmkoXtiI1WMmVYvlrRLGDpvd+Z1xgoY0Q26VQu85b9movaw22KRqU0u+AYNgRje5p
         kk/QXAPZKWuQUKXYipwnumJIkOiVP+O2sFO+lluv9vIQ/+vJw5MI2vhW5isPMFrbivIw
         sZqZ7aOG3jbOGA+/sWDOz+xd0np08tEM77xOF1KKYxMGnvajRyyO5iCLtV9AmFS85goc
         4tSSrGpOUhBtbj55q+hiHuMtoVc1x318/kvSQX0H/YxqFpXqWeaZjrvVsv/eRYmYAX4b
         rgow==
X-Gm-Message-State: AFqh2krXlBDs17JwMSuhQZrDgFJWvkfFBIan+oqPCJbWyyJJIpKF0RUw
        3gYrH8zniMIUjXGle4wgCKM=
X-Google-Smtp-Source: AMrXdXtm2CjAc1Q8vFUVTBHAXIyKHjG72AEU/N0HXlT97G/wgmrNgLzubu+Rw1qfZqqt5o7yftVHuQ==
X-Received: by 2002:a17:907:a782:b0:7c1:6430:e5d0 with SMTP id vx2-20020a170907a78200b007c16430e5d0mr44883661ejc.4.1672910993801;
        Thu, 05 Jan 2023 01:29:53 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id k10-20020a170906158a00b007ba9c181202sm16272023ejd.56.2023.01.05.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 01:29:53 -0800 (PST)
Message-ID: <117fb14e-b1dd-12ec-9fe6-6ee8f7ce0c62@kernel.org>
Date:   Thu, 5 Jan 2023 10:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
Content-Language: en-US
From:   Jiri Slaby <jirislaby@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
 <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
 <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com>
 <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
In-Reply-To: <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05. 01. 23, 9:29, Jiri Slaby wrote:
> Ah, that makes sense. Which leads me to: sometimes, the picture distorts 
> after I start playing the video. It's skewed and halves of the picture 
> switched [1]. I assume the driver expects NTSC@720x480, but the device 
> sends PAL@720x576, actually. Sometimes, there are also color strips.
> 
> [1] https://hci.fi.muni.cz/~xslaby/n/skew.jpg

FWIW taking only every third line of it and applying this math on the 
offset:
   offset_in_bitmap = x + 2*576*y/480;
makes some parts of the picture what they should be. I have no idea if 
it helps anything though ;). IOW, the skew at the bottom of the picture 
seems to be 576*2=1172 pixels for whatever reasons.

thanks,
-- 
-- 
js
suse labs

