Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4982827404F
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgIVLCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIVLCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:02:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D08C061755;
        Tue, 22 Sep 2020 04:02:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so2894370wmk.1;
        Tue, 22 Sep 2020 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QP7D4zsS7srJZeKE4h7PMo3PEFbsrs5XuKLoWtHlLfQ=;
        b=Umn46go7btEmLeJcyiwsP02dYQUWvorQNa1lYDjJe5hLI8gBjUXG99anKJIZ8KW1oO
         aWnS2IwBNxRgDc4BdFsb/2bzZxWIaDPdYHe+YEhjSVZdBOCpqyxoVj5BQSwbKIHZ/0E+
         Fg/bG5+dMDlnqMiui80vfu6VAYwn8rlfvTnmganxFWap07IU5RqfIrTYneIe0ybsaJib
         TJ/gUnPvxeHP7oFVD5NhWxX0YZI8arEDT5jCtmKbw0sUUkSF7E73qgspyakaSXtNQvRk
         KUSCd/VJelPux235gIzr9NJbR5LMuf7fWrTqH9IE0cZH1BY6e/hal929kqGCd89sRJRo
         Htjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QP7D4zsS7srJZeKE4h7PMo3PEFbsrs5XuKLoWtHlLfQ=;
        b=QgcUHWpGfvqeaJj4ihcVLhZYUxPaM/FOJ0aFtFcE9kMi03fVxZV1paG/FImrMfnkPF
         J1BpttkGIBdL4GyCsG9n0HMNqAJQFLKjOF7SQoy9WiBWceOyUYQ75BXsfLd+siTiWyCv
         drj0F+kr/qUwR7t/N/xqrwKyTuGDmoAEMfltiYb9SJrn0s+g95gIkx6xZatuYo+6zEtU
         vzHTq+wTT2ao01eucNK2PQ0zOQdJ5yz865sHPCJuFJOqYoQk6kNakPmArvAE++5CQ6bt
         /wyXkBwHL1ENrOa9cTR1X8Ehe5c9Ehb3qNthh6G764WO9bG8ZnGLQzrojMrGArRRk6b4
         172w==
X-Gm-Message-State: AOAM533+XMuV+mYmxZ86hjpDdX223A2WSJxTvIs/vkue7z+X40znlNmI
        rNekBvvJM2Jy3JHdHAipgOKfvBVQvRRQUpKg
X-Google-Smtp-Source: ABdhPJxbDGZ7wRBP0AB2A1GN813fNw8J3KclOaZ5ZRBtp53WAU1Vt4G/tAmks/ybFJcR4iJO8U0C5w==
X-Received: by 2002:a1c:b388:: with SMTP id c130mr356538wmf.175.1600772557222;
        Tue, 22 Sep 2020 04:02:37 -0700 (PDT)
Received: from [192.168.0.64] (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id a83sm4085301wmh.48.2020.09.22.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 04:02:36 -0700 (PDT)
Subject: Re: [PATCH REBASE 0/3] atomisp: Rebased fixes
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
 <20200922090914.20702-1-alex.dewar90@gmail.com>
 <20200922112729.313d454d@coco.lan>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <f14fac45-d713-a6ee-f0be-906a6d971b43@gmail.com>
Date:   Tue, 22 Sep 2020 12:02:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922112729.313d454d@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2020 10:27, Mauro Carvalho Chehab wrote:
> Em Tue, 22 Sep 2020 10:09:07 +0100
> Alex Dewar <alex.dewar90@gmail.com> escreveu:
>
>> Hi Mauro,
>>
>> I've rebased the patches now, but there is a slight hiccup. For patches 2
>> and 3 of this series there will now be a conflict with commit 9289cdf39992
>> ("staging: media: atomisp: Convert to GPIO descriptors") in Greg's tree.
>>
>> I'm not sure what the best way to handle this is? The merge conflicts
>> will be trivial (due to a conversion between the gpio_* and gpiod_*
>> APIs), but I could alternatively send these last two patches in via
>> Greg's tree if that's easier for people. Let me know what works.
> Maybe the best would be to re-send those after the merge window, when
> both patches will arrive upstream.
>
> Thanks,
> Mauro
That sounds more sensible. I've also just noticed that I introduced a 
bug in the first patch when rebasing it :-/, so let's hold off on the 
whole series and I'll do a proper tidy and resend after the next merge 
window.

Best,
Alex
