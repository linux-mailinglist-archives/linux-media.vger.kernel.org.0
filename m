Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1BE1F7D70
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 21:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgFLTRT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 15:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLTRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 15:17:19 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF0DC03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 12:17:17 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id x1so11146542ejd.8
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TqNmP+buEpn3c0br9MaYC8h6/fQlPu+DpmxKpUmgtjM=;
        b=I7EiFmI0xZH0wMEoUo/B8uuh71Foenf9OVyPH5u08C13vShD7F8BKcxBYdM2/Dl2Tk
         z7LbK/RsgZi8Phcqtja/koYlGrpl9eNVzytftjtwuLom52Ri00rCrmrIFgieJwVAB5Mo
         njBnmvbaiRQzKl5Bjsl/Rekk2VPXJND33npFKxkcQTBlXp+oxZ8/jP71KwNtBMpNhZL7
         KIozke+Oc373zR8H3OJXK6hkUwkPUuJnf/1fTO/RVU3dbVAep96GzqYL66a6IGF1y0bf
         23HkFR8lpvM+ldMSzhmnmjhA8wNFAMS//NY/jNRTteXHAxlkNnOpBrqxKfb4zlKA6I3p
         f2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TqNmP+buEpn3c0br9MaYC8h6/fQlPu+DpmxKpUmgtjM=;
        b=LQZtEaj8AsCSjpfV7z9RZgKe/gzUzPwEyMwQcKuDjXgfzbP38GiEijZoQrq5uy7fg3
         ns+sDlfoDktKlkIgC3++TIFCU7AWsnS9dP4MPBUlPJXmO6RGzQPVVcLddyWnZ6bdP/ga
         McvSTvTUftmVe0+5FX/FOvubLjBfWSeQE4kV0XgkU8rtP+FjoazaNbO2/lq9P8SPOn0Z
         po+L+Pr6XSlWM4r5C6Rpvunt8MNVpcuC2T7vViVgoM8BFq61aqazECwyKqBV7zf0WlRr
         PKioqAKg9ZeNrLrHbmpEE/7fv8vDMPs+rrYiWBtywkSRn6y+aRETlbY/2P0Kox6GwhXR
         jnKA==
X-Gm-Message-State: AOAM5330gosR5m3TNI7MHrTez071ysHbxL6U+kzqyYTouoSjOwktyd6E
        bixG6Ir+oXwlvXTggsaXm7hJAQ==
X-Google-Smtp-Source: ABdhPJwhG8ab2OmHjI01nv370Sm8iqnkZixtHCTvd2LRwsk1uERPePVnHu90Jbs4kE4FWPpike8ksg==
X-Received: by 2002:a17:906:b1c3:: with SMTP id bv3mr14982279ejb.292.1591989436171;
        Fri, 12 Jun 2020 12:17:16 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id k10sm3992161ejs.108.2020.06.12.12.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 12:17:15 -0700 (PDT)
Subject: Re: reqbuf(count=0), new vb2 op or something else
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
 <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com>
 <7694a262-d655-427b-3baf-2f86dc76b906@linaro.org>
 <CAAFQd5DaKkLedFe5umLZ7oVJ7vPSDXiDavhSpq-n7z3E8nanpA@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2cd382e1-7dad-aeab-5687-9281e988b501@linaro.org>
Date:   Fri, 12 Jun 2020 22:17:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DaKkLedFe5umLZ7oVJ7vPSDXiDavhSpq-n7z3E8nanpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/12/20 9:53 PM, Tomasz Figa wrote:
> On Fri, Jun 12, 2020 at 8:42 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Tomasz,
>>
>> On 6/12/20 9:33 PM, Tomasz Figa wrote:
>>> Hi Stanimir,
>>>
>>> On Fri, Jun 12, 2020 at 5:20 PM Stanimir Varbanov
>>> <stanimir.varbanov@linaro.org> wrote:
>>>>
>>>> I failed to found previous discussion on the subject, maybe it was on IRC.
>>>>
>>>> I stuck with fixing of issues which depends on this reqbuf(count=0).
>>>> Currently I'm counting the buffers in vb2::buf_init and vb2::buf_cleanup
>>>> but I don't want to rely on that implicit way anymore.
>>>>
>>>> If someone of you can remember let me know so that I can prepare an RFC.
>>>>
>>>> I can think of two options:
>>>>  - change vb2::queue_setup so it could be called with num_buffers=0
>>>>  - add new vb2::queue_release op
>>>>
>>>> More options?
>>>
>>> Just to make sure we're on the same page: Are you looking for a way to
>>> handle some operation only when all buffers on the queue are being
>>> freed?
>>
>> Exactly :)
>>
>> Presently I'm counting capture and output buffers in vb2::buf_init and
>> vb2::buf_cleanup and release/reinit internal driver resources on the
>> last .buf_cleanup. And this is a workaround of the problem which I want
>> to solve properly.
> 
> Got it.
> 
> I suppose queue_release() could be a good idea to keep things
> symmetrical, but for now, wouldn't it be still possible to hook

I guess "for now" is in the context of RELEASE_BUF proposal.

> directly into .vidioc_reqbufs and do whatever necessary when count ==
> 0?

I haven't thought about such solution but at least it sounds better then
counting buffers in the driver.  I'll give it a try.  Thanks.

> 
> Best regards,
> Tomasz
> 

-- 
regards,
Stan
