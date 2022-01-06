Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543564863FA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 12:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbiAFLy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 06:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbiAFLy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 06:54:27 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4344C061245
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 03:54:26 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id i11so3644252ljm.13
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 03:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=giFbDcXTXMXcvV/HnhzLPISSX+Hq2xffXVIzVJBl41M=;
        b=KcvGElaZLM0NPVl0J2IO1lOcesgUVSHs4REfMCRkRAjMqnuRD9hPesbWS8Ngm8T9jV
         8haNqU4JwZm/Pkn3/eOFYvRfOZgHgknp0dU342b2aDnx/0TCxNitfCa0t9HIjb0eC1va
         6XnFiKdeJ23fuIDKHCyrHYtDSNmEVZGIH52f3WzmRsTMjC5bQcDmKMg26ht/NUIJMkYA
         2eJmL8i9Qt05WPJtEQp2ikzFh/7oOXER+IH1WYuYiUi+ubrUBtbMQRbhw8yWuvHI39zE
         0o3aKax9JUtZ9pAYMiWz6IOJ9h6mT0rrtDJLFMdeCuduZKJ90FaB8uBTRlweNxgP/9xs
         ozSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=giFbDcXTXMXcvV/HnhzLPISSX+Hq2xffXVIzVJBl41M=;
        b=3Ae1ZlSOZaAIqqlaQy+jjFVl1Vt+CPtVjYXUqR2yiK3t0T6TvXpLup/bFYVbAe2p/1
         InCLo3xUDcUorkcfelYMoWB5Kbc2h5lcfzQ/F0WpiluNn3dL7HaadgnpMzT40xPetJck
         6IXKKOQik6d4dQtItKIk+sT70G8KxpMlw/qvtjDOoyZmAuLd4SrT8SrxafarQBgnFL4B
         RjkQyt5i8Qu1cjxfz2VafZbX6UxC7anwM2cZmX5ZXKnbQ+17dDfF5Ki0qvBJtu7ZB0FY
         UV6AeaH5KnVRUZH7l+2UavPHvaJfg2VVgbU9XnAQElLzJER6FGyvUjPhd2JfDNugX4Z4
         Se7Q==
X-Gm-Message-State: AOAM533ia5bW+M2J5HDFhgA0aFYXIlPGU+t62rliypcuELB7MyAOoabx
        J4Z7ZHxwiBygsuoL8lwNnMMdUhlRo/g=
X-Google-Smtp-Source: ABdhPJzrcuCLwVeZMqpIbKg36ggZ2rkOmThIJq/85lC6ynl/4+VtBfB9TTst3zQmmgQcIBlDJoWQ3A==
X-Received: by 2002:a2e:bd04:: with SMTP id n4mr15149445ljq.451.1641470064862;
        Thu, 06 Jan 2022 03:54:24 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.53])
        by smtp.gmail.com with ESMTPSA id p6sm150394lfg.307.2022.01.06.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 03:54:24 -0800 (PST)
Message-ID: <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
Date:   Thu, 6 Jan 2022 14:54:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
 <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
 <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
 <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maximilian,

On 1/4/22 20:58, Maximilian Böhm wrote:
> How can I help? I’m totally not a kernel developer but maybe you could SSH to my machine or something? Should we text in private outside the mailing list? What about reverting the kernel commit until this issue gets somehow solved?
> 

I can't say what is better in this case. My patch fixed a use-after-free 
on disconnect path, but seems like it broke something else.

I am not against reverting, but I don't know what is bigger problem in 
general: UAF or usbreset tool hang. I guess, Mauro can help us here to 
decide what to do about this.

Anyway, you can revert my patch locally and use your device. I 
understand, that this approach is the best one, but anyway revert will 
come to Linus' tree in 2-3 weeks, since v5.16 will be released in couple 
of days.



With regards,
Pavel Skripkin
