Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB9B554869
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353655AbiFVJae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243470AbiFVJad (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:30:33 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367053818C
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:30:32 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so462783wml.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3OM+Dge5o6dibR/kJJ7yCttI1v+/eD56fS3McOE9va4=;
        b=P0l6iUn4QANDRbnpsPdL7D3HWLkm1G20wDGg5sEeBKhOjIhMTzxMvRFCow2YW8eDNY
         EoSvt+CgtQErUKmg4nuF7SEBRZcZ/ywmUWGRwijzkSEpx8EtYPWsI2gNBuXNFzw/wAq8
         bYJNym6mBdfSt8XFsb8p9b3UlNWLQqdLWwydr9mPScK5gTJbTpYn5BSVYEBmDnKikSKb
         VHwPzI1ZUq9Nu9s00LdG2irl3n6D/wkmUift8/jSE3OmcjuKhf2U3rRH7caE6f6un0GX
         Xqjqpw2Jd0VnzlNXeI23YPmhImhvb+P6fhOsk8+iCFfvL6mrDq/GLx5q+gToZkGu9UPu
         79fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3OM+Dge5o6dibR/kJJ7yCttI1v+/eD56fS3McOE9va4=;
        b=3SJK81CgLrnLyBbQEi/8emP3mKQmMIWVqYMATxBJ8WoO5OGuOM2ZUXyLbi7UDAZA6+
         ge6OUqTp+vE5W/SIepIJKTsI9o9K+Mv/c+dHkZyTHzXZUQjj99RWXVmY5QglVwH2tf++
         6fb5hE/L5pRmuN1TR7ebfKjXTmt100KGdp8TJcqEMeIrvwVFmvH9CyLIsWXfAktfHd3j
         E7LE1k9/pwh6vNq4PnAcfmwm8t8uUAYlBF01lxqc6WmTzcHcbNvchmW1m1q7ucXvTV3c
         0mmXMWIoEwycfchkYsLswAHJC6t1n0Izdeg575EyfxEnRf4XSY4eCY732XPiJHukmyYv
         VB4g==
X-Gm-Message-State: AJIora9UJ8bY+DDfwkrtffkyXXe0NL4gGCcR/mdOMxFD2+QFt6u/+rgI
        rva8QsnCQARq1J0PI6JoNmA=
X-Google-Smtp-Source: AGRyM1s5ae2H3dt5S4daLux6MZlZfTTHknkSIHnE5FIyG0zXxjuxz3icNOsOe6HJ1i6GDTdtalZtFQ==
X-Received: by 2002:a05:600c:3505:b0:39c:93d4:5eec with SMTP id h5-20020a05600c350500b0039c93d45eecmr2808011wmq.179.1655890230649;
        Wed, 22 Jun 2022 02:30:30 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id bs27-20020a056000071b00b0021b932de5d6sm902198wrb.39.2022.06.22.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:30:30 -0700 (PDT)
Message-ID: <7d9d1fc9-b1e5-98eb-74c3-64da8f08dabd@gmail.com>
Date:   Wed, 22 Jun 2022 10:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        paul.elder@ideasonboard.com
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
 <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
 <YrLeRGSUZ9dnCM1v@pendragon.ideasonboard.com>
 <20220622092231.2dwa6besmff6732x@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220622092231.2dwa6besmff6732x@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
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

Morning both

On 22/06/2022 10:22, Jacopo Mondi wrote:
> hi Laurent,
>
> On Wed, Jun 22, 2022 at 12:17:56PM +0300, Laurent Pinchart wrote:
>> On Wed, Jun 22, 2022 at 11:08:59AM +0200, Jacopo Mondi wrote:
>>> Hi Dan
>>>
>>> On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
>>>> Iterating over the links for an entity is a somewhat common need
>>>> through the media subsystem, but generally the assumption is that
>>>> they will all be data links. To meet that assumption add a new macro
>>>> that iterates through an entity's links and skips non-data links.
>>> Do you foresee usages of a similar iterator but for ancillary (or
>>> interface) links ?
>>>
>>> In that case you could add a 'link_type' flag to
>>> __media_entity_next_data_link
>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>>  include/media/media-entity.h | 26 ++++++++++++++++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>>> index a9a1c0ec5d1c..b13f67f33508 100644
>>>> --- a/include/media/media-entity.h
>>>> +++ b/include/media/media-entity.h
>>>> @@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
>>>>  				 min(ent_enum1->idx_max, ent_enum2->idx_max));
>>>>  }
>>>>
>>>> +static inline struct media_link *
>>> Isn't this a bit too much for inlining ? Also I heard many times that
>>> it's not worth anymore trying to outsmart the compiler and inline is
>>> discouraged in most cases ? (and it kind of makes sense to me, but I
>>> sometimes wonder if that's some form of cargo cult..)
>> That's right, but in .h files you need to manually inline, otherwise
>> you'll end up with one copy per compilation unit.
>>
> I was suggesting to move it to a .c file in facts, likely mc-entity.c


The one copy per compilation unit problem spurred the inline indeed -
but no problem, I'll move it to the .c

