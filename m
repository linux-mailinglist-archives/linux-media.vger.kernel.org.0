Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1B33A4DBD
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhFLIrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 04:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLIrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 04:47:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6682C061574
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 01:45:48 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id my49so8105873ejc.7
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=QnYXtr3VSWQos2QaVTGH2IOlQtQOHwndJdzl6Wlmr9I=;
        b=ZpLySUzqQ8/xU23UYUwuHOb2KC/dPVE3QuLSikGihUSLm7+MCrIiHxoWOeotEQN5pO
         Gcj+qhL6+u2GK12Tx5r1bj7VsiV6UGaTc8CB/7FZRNOZaTP4jc2gk5lctOrBmJbp0E3q
         i/T09tVD6G6ABCaYjikpIboCJJYP0To5ELQ2kMmSPxruAI8fIHhgztx9/ebfNnO79Xjh
         Cknx1G26QskuA/q3dAlknRi1VkxxN40MF5pbTGNWNW6ETjZMsbmXBE07woenhZUpNpuu
         5cRYEDYMIfiHSzFO7PjTo3S7Btm+TvmU40NDTSPD4j34vtwl/kd0sN7VKt7dUD0TELkA
         MNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QnYXtr3VSWQos2QaVTGH2IOlQtQOHwndJdzl6Wlmr9I=;
        b=gyGXiEacCPxhqk2FuvUpHQo8ZIM4SZbZsNkdnoF204tzTPgXvSSPjPYTPKyl11gYIZ
         EqvO4J8SS8QHsSfARX7mPhzyDWcsEm78J1uNROxY6+1izzO+LO2xsVCxOhKZuCp+uD2u
         MWDWygZGaOa7ML/k9DNbzIBQr5HiRuv9VoMHF6iJkEi0+tMpjyMYwbOpqPCvM8OTDByL
         cGrv/YWXmxXC5lOV5fkXRkEHCMYboW2eu0DB7LUhsgvmo4K6PLgN3Qxl2eGwVykl3UdG
         MXJdFMlzrhHfPyS6yCXHhVbjA9zJyOxIC8NfSeb9CY3YT/jcMDVGwBwy2OL9hopAlf2V
         hCwg==
X-Gm-Message-State: AOAM530IJO5eA1gbYCrbOi992Ev8IMrrrTfw6V5wYcYfg5ZAUqZtSaLh
        Uj+0eqXqdz0eEuFQuldPwc0JRMq4eVDjugjK
X-Google-Smtp-Source: ABdhPJzKpJeJbhEOYbhcFuIv2MLT5OaOPm44BHpU23WizyTTitI0zmPg4IyYtzNTPljfiM2JC7mj2A==
X-Received: by 2002:a17:906:17d8:: with SMTP id u24mr7252454eje.106.1623487547222;
        Sat, 12 Jun 2021 01:45:47 -0700 (PDT)
Received: from [192.168.1.12] (hst-221-11.medicom.bg. [84.238.221.11])
        by smtp.googlemail.com with ESMTPSA id e24sm2881165ejb.52.2021.06.12.01.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 01:45:46 -0700 (PDT)
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
 <ae54a98a-c1e5-e7f9-4d3f-fa4a56b9a359@xs4all.nl>
 <3916c03f-9996-3de3-4365-3e88abf052d2@linaro.org>
 <7bcab342492b41c952522c26eb2aaa497b90c5f8.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b3fcf30b-ba89-faf2-88f6-85d6403b04c2@linaro.org>
Date:   Sat, 12 Jun 2021 11:45:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7bcab342492b41c952522c26eb2aaa497b90c5f8.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/11/21 5:46 PM, Nicolas Dufresne wrote:
> Le vendredi 11 juin 2021 à 16:12 +0300, Stanimir Varbanov a écrit :
>>>
>>> Would it be possible for the driver to handle this internally? I.e.,
>>> if it detects that it needs to switch to grid mode, can it just encode
>>> each grid and copy it in the capture buffer? This assumes that there is
>>> metadata that can be used by a decoder do find and decode each grid.
>>>
>>
>> In case that is is part of the spec I don't think we have to do it.
>> Something more, when each tile is separate image the decoding process
>> could be done in parallel.
> 
> Does it means there is no userspace (or at least no Open Source) userspace for
> it ?
> 
> 

My searching came to two libraries:
 * the open source library [1].
 * library from Nokia [2].

-- 
regards,
Stan

[1] https://github.com/strukturag/libheif
[2] https://github.com/nokiatech/heif
