Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10354954E0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 20:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347053AbiATT34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 14:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbiATT34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 14:29:56 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F68AC061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 11:29:55 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Jfsz26tQNz9slP;
        Thu, 20 Jan 2022 20:29:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1642706989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lPQ0rxyD2d3Wrq7ZjXM380GpTrZiFKf4VKEuPW8wzaE=;
        b=Ab31eOp9OD43M+j3ZAZo86AwzhEHXoyDS76T/anE+DpXdAumd7yRqU/7sTqDyQBiHeY9DY
        TriteUYFCaKEBCcJjI/pAEAWnTRCYCdZekt5WQv6nk53sE2i1ZC1y22g5ce+5xi90Tlg4O
        GpuDG8LnjIHzP5uRSs9A5erMmgHsTCHig7frBPtrcTCjo9YhV+BhjJhe+wVHd326Jojmli
        uyCApt7MnEP3PiJtxuTMhjD/1n0+aLBS9DVlBnu0yVZcMK7dV59nab3TfdtmGolyIwu0vd
        bSEBS/HG03CB2xQzASqW8Tn/Vw0WODmTQWvKZkYqOI/2IhJul2O3014T2Nx9vw==
Message-ID: <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
Date:   Thu, 20 Jan 2022 20:29:45 +0100
MIME-Version: 1.0
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US-large
To:     Pavel Skripkin <paskripkin@gmail.com>,
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
 <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
 <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
In-Reply-To: <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Pavel,

I would prefer reverting your use-after-free change. I’m still on Linux 5.15.2 to avoid this issue. I’m not sure if I understand your last mails correctly, did you already revert the change or did you just offer to do it? Anyway, reverting locally wouldn’t be feasible long-term.
If I could help eliminating this bug, I would gladly offer my system for a remote hacking session via ssh or Teamviewer or try other patch ideas.

Btw, found this forum thread describing the same original problem (which is forcing me to use usbreset after standby) on Windows, so this probably is a bug in the tuner hardware, not in the Linux driver: https://www.dvbviewer.tv/forum/topic/63002-hauppauge-wintv-dualhd-stick-geht-oft-nicht-nach-standby/

If I were to submit an official "device quirk" for the Linux kernel, would it be affected of your use-after-free change too? Nobody knows, I guess?

Regards
Maximilian Böhm

Am 06.01.22 um 12:57 schrieb Pavel Skripkin:
>> Anyway, you can revert my patch locally and use your device. I
>> understand, that this approach is the best one, but anyway revert will
> 				
> 				 ^^^^
>
> I've missed "not". Please, don't get me wrong :) Reverting something
> locally to work with upstream device is never a good thing.
>
>
>
> With regards,
> Pavel Skripkin
