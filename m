Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837814507FD
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhKOPRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 10:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236707AbhKOPQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 10:16:38 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FBDC061204;
        Mon, 15 Nov 2021 07:13:02 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id t26so3504799lfk.9;
        Mon, 15 Nov 2021 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lKwpCQBPYhLtB1zqTXQVzRnVbkrv/Vyz5cRaUgIENsA=;
        b=SYBJ+usIv+nNyp6M4froRWdGBZO24BYuvV1KNXsVg2gtX6D1NU6SuaVbE4CqWIDvMC
         Aukowe6n9r82eOeAHjKtqyDSgaVvJ+BB29wHdoyCC50/e68IAazNYc+o+k4GyPtpBHBd
         N9eBfKC6lGDb8nX28mPNoCfYegf4f8UudMdcHL1DowPP2RSrgpAQ9SPKCfdbYDpIDZnB
         au88zvmZ5xRYvLfl/3t/qjWnZyibDpK9HyrVgSde0Qtya/Qa+vdQytyX4k03RpnaO9pR
         1bE30XvoLAqFXkDvvcy+0ykhxYj2UR6+mlCdM2cG+NXAy44KYQvKH+ic09DRfa1IlQEs
         8Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lKwpCQBPYhLtB1zqTXQVzRnVbkrv/Vyz5cRaUgIENsA=;
        b=3eYPrFTl3FQ9bQyHoZcP4dz1QC3oJFfezoV/UkWqPFJwmFKi097xz4pCGJOFfyiZp1
         j+EkxnmXnkH8PKwaZDnCTXahIhB63nnxh1yTqegCbyxYHqwxhsTLRCzA8DFVtvuBwC2J
         iO5s/BVv/oUl2iZS49k1DVR+FDNgPZ5QqixM9SK2fDxfl4GsMhbjHHLU+EevFbrQu+tc
         VwPC9S/nS6+GuLHIdoa+wj+myFpGcOq1KaCkUAhiNuPkojPTulUUPnNKD+LVmg+BW0U7
         8XiR3ySkRMcyKAKjMaoqyuEfcK39OONndSa/DKlHAIz4US/WV6jQkDyzhC5EDbjqhQZY
         ocWA==
X-Gm-Message-State: AOAM533+ILyZKNaemb+tkTtblhc6o+wYq/UTGser1uyEAQiCLeqXsKcO
        UO9EH8VrAAQNbbl46vbxJjnlxa7jcQ4=
X-Google-Smtp-Source: ABdhPJw91dfbKB7o3kkKR47TTAh3PA4fW2wt5xAYQi4x53gKcFKU6FTUMn8AMXDULBMGKboq9a0Oxg==
X-Received: by 2002:a05:6512:66:: with SMTP id i6mr36586729lfo.287.1636989180282;
        Mon, 15 Nov 2021 07:13:00 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id h14sm1446936lfu.195.2021.11.15.07.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 07:12:59 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder
 driver
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114224732.11550-1-digetx@gmail.com>
 <1411d7a3913677fee58e103f7610e122686e87bf.camel@ndufresne.ca>
 <55f445d8-8207-35a3-6c6f-dcb9ea70a90f@xs4all.nl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <274daf12-ae6f-8a95-5cae-bb5b558e25e2@gmail.com>
Date:   Mon, 15 Nov 2021 18:12:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <55f445d8-8207-35a3-6c6f-dcb9ea70a90f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.11.2021 17:49, Hans Verkuil пишет:
> On 15/11/2021 15:43, Nicolas Dufresne wrote:
>> Hi Dmitry,
>>
>> Le lundi 15 novembre 2021 à 01:47 +0300, Dmitry Osipenko a écrit :
>>> Video decoder of Tegra114/124 SoCs uses additional memory buffer required
>>> for decoding of protected content. We won't support that content, but it
>>> is impossible to disable access to the buffer, hence a stub buffer needs
>>> to be provided. This series enables decoder driver only for Tegra114
>>> because Tegra124 support requires more non-trivial changes on both kernel
>>> and userspace sides.
>>
>> I believe the stateless API is quite in place now, but I only see maintenance on
>> this staging driver. I don't believe it really make sense to keep maintaining a
>> staging driver without any step forward de-staging it. I believe it gives the
>> wrong message on the Kernel staging purpose.
>>
>> I'm not criticizing your effort, I believe you are doing nice work for you
>> community, but would prefer to see this driver be ported to the official kernel
>> APIs rather then being maintain as staging till the end of time.
> 
> I agree with Nicolas here. This driver only support H264 and the stateless API
> for that is now in mainline. So there is no reason not to convert to the
> stateless codec API and move this driver to mainline.
> 
> It would be really nice to see that happen.
> 
> Without any progress on that I am inclined to remove this driver some time
> next year.

I'll prioritize the v4l patches of this driver. The reason it wasn't
done yet is because the current custom UAPI works perfectly fine and I
was busy with a bit more important patches so far.
