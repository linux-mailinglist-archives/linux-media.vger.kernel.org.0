Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D058F507A3D
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 21:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345597AbiDSTaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 15:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344857AbiDSTax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 15:30:53 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B2B40A1D;
        Tue, 19 Apr 2022 12:28:10 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id e4so19234582oif.2;
        Tue, 19 Apr 2022 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=4Xh+5UtbINd57KtGDaWCOk8Kkm1PBRkZXcyM6lkKjMU=;
        b=VxsdVV71woZXBsc04aUqqE3dRvnUfwMsS7XkGQiQIGEhndvL/6wzqm3zDh4w7ISZK5
         ZDs5+Ra9fELS3i+brcISvgJqJR0MJo6rev24gjkGdOr33C5msqHqiHtAB7bqydksWry5
         uTdl6V7P5qQd6omV4NLsfiAiQx/X+bo0L+/T9gdRRk9zsViCMUn+kYgOfqNmQECAP7si
         Pl9rr35wmpJaIL2XnlQHH3E2SDnuj9Tf6T6HJvO+STRsrPHgi5KWORMwFO0SLPBLEx48
         MkEu/A5+sYCXtGNqnlX++GHVJo2oQF8LOmTHDgBLkP9BRCilTs7T+tGmcOE7FV7nN6HA
         2iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=4Xh+5UtbINd57KtGDaWCOk8Kkm1PBRkZXcyM6lkKjMU=;
        b=eOJ5rFinX+tpmZD3fHasFmjfpG6yjNmT4QtqqAiguMhGwnEB9e4qzyTq9fnhc/YbsQ
         iU3DPDJGecqhYU5MmpYeBjEkAVj7g+FudKXCBl2Aklw7SJ5wxT0C52eOpkPVWWjeGOEf
         BHyq/QFF5rSEH5CImaH9BanflI4/BfNWtHFGuQ3OFoytOzEqFkkjPTtmetlxdpdHeE5a
         gXZQyoObMfWkfb5OLI2+a4DBgcyzmvjN7KpJ2q857qMM7appGtCz/3MtGzhjsmj5/XaO
         QaKStDn2RAHTsuZfR/Qj8QUwcg8yoPQepCWDedFThcQpgYjRw7NTur5iGP5OeQGg5kqn
         mbpw==
X-Gm-Message-State: AOAM530fD1yAzMp94bVqsrqLyxrJQ5xqVdZ63qDZguNAafxvFT3t7U3e
        6KI2cmgFGzv0QLhN3ZnQmmM=
X-Google-Smtp-Source: ABdhPJwu0KkAoF/MJLZA2e2FZsE5KitwDDSF9tKJf9kGcJ6tckKXReK6qnKUlTTKPlmwhm+4ycySVw==
X-Received: by 2002:aca:e102:0:b0:2d9:bdc6:b2e7 with SMTP id y2-20020acae102000000b002d9bdc6b2e7mr79597oig.128.1650396489386;
        Tue, 19 Apr 2022 12:28:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1-20020a056830138100b005cf2f29d89csm5682967otq.77.2022.04.19.12.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 12:28:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
Date:   Tue, 19 Apr 2022 12:28:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
In-Reply-To: <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/19/22 11:24, Nicolas Dufresne wrote:
> Hi,
> 
> adding linux-hwmon in CC for a wider feedback.
> 
> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>> celsius as a volatile and read-only control, and its documentation.
>> Useful to monitor thermals from v4l controls for sensors that support
>> this.
> 
> Any justification to expose a temperature sensor outside of the dedicated kernel
> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
> the camera driver, and also the sensor may not work if the camera is not
> streaming. But in the end, the API in hwmon does not look that complex, and is
> perhaps more precise ?
> 
> All in all, I think we need a strong justification to implement a custom
> thermometer interface, something described here and documented with care to
> prevent abuse. I would also see opinion from folks outside of the linux-media,
> hence why I have CCed hwmon mailing list.
> 


All I can say is that this seems to be odd and a bit outside the scope of
v4l2. I would have expected the vgxy61 driver to register a hwmon device
instead.

Guenter
