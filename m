Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B724846FE
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 18:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbiADRbU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 12:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbiADRbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 12:31:20 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94DBC061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 09:31:19 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id h15so48347124ljh.12
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7wbMyZHti+pLR56Mazau3aKpNXcOhIlcYlrxwcO56KA=;
        b=KSWaSt2Cc3dAA6BTlJJYQvqIbQTKwDrbvNcO9pRDNNeglKC+rRdOyb3p1onWrpJF6q
         KH6WS6MUIOnxY91NjTuHjJtE/YOJxAuyyy8t2zcuo75Ne4kkeZ78N3pjedtlIL/tOXYn
         Fd32XuUmO+bHUj+V/cfq5I/DlO3rNeAT2DV6vGfmv5J4208fD1Cofm+EEal9TPk9LATv
         dTFPFVXLVvq9pLl9kTJoEyn56b9fXA00IFLG6CMLVl7bCuriacKyhVuLcoqXMwzfU0XG
         OLtwvA0yBT0OYHq0J0rE2MpTz56ErxFpscg+5A9dh27VWCLqY6YewN8br3rh/esskGKT
         X2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7wbMyZHti+pLR56Mazau3aKpNXcOhIlcYlrxwcO56KA=;
        b=VKS+wtXUlTtDltGUWCYcrEDgmh1kKRRX4St+1dzftEMKuXL8dvw7tRsuENqZRS1xK6
         5F+xd5SKKGTr6vFMUriGmpoerk+4Dato4epWzTADVWJLwTssXr6daYoUevf8CEvKWrdS
         TaPzEUMmiQmJN2OgNFVFls1P+qPD+GXywWMN1KbAnf1zdeU0BzGqI2ApSaZoixrE78mq
         wX/nKCCI9+EmNnxoY7ATJXRafvp7IhUJnzpRTvIsPpRNjp5/lfJxHKnG0Ml6ZsFO8Gti
         X3ZVDSW3+D6GY6pshClIOL1iRObd2eD6H0Wykjv+qwQLG+Z8GzXR3YiGsI8ESoh8ZK4m
         s8VQ==
X-Gm-Message-State: AOAM531S32uf8pPJgwi7h1PU8zRWnnxfT2fzrDzt9lW18PYVDNBpkj0l
        QSdiBih+MwjpAqPpGXZbfuE=
X-Google-Smtp-Source: ABdhPJwieI0aslKGrTGT9kWeO5rX5r6MKpkT0lI/XhawXVIEumLvW9NYHszzCDbSuXNqOTsOrQvXKQ==
X-Received: by 2002:a2e:924f:: with SMTP id v15mr41911679ljg.165.1641317477941;
        Tue, 04 Jan 2022 09:31:17 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.38])
        by smtp.gmail.com with ESMTPSA id k22sm3980609lfu.207.2022.01.04.09.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 09:31:17 -0800 (PST)
Message-ID: <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
Date:   Tue, 4 Jan 2022 20:31:16 +0300
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
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/4/22 20:22, Maximilian Böhm wrote:
> Hey Pavel,
> 
> did you have time to look into this issue further?
> 

Hi Maximilian,

I did give it a try, but looking at the code didn't give any results :(

It's a bit hard to debug without reproducer or real hw piece



With regards,
Pavel Skripkin
