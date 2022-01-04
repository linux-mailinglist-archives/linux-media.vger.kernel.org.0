Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C9548474F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 18:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235999AbiADR6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 12:58:39 -0500
Received: from mout-p-102.mailbox.org ([80.241.56.152]:45058 "EHLO
        mout-p-102.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbiADR6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 12:58:38 -0500
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JT0j85jkxzQjgF;
        Tue,  4 Jan 2022 18:58:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1641319115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zthJYmYC1V/mZBNURyR+z+DIAyi1WXXbniVX0zZF0vg=;
        b=fiQuS8/Z/zmM7S/HnxZPWNVGXeiYzFo8nD2W+SS10mKYH/USbnf1zATFuAjaCcQegHnPAZ
        vqdMLxYc6V1OQTRW/O68hyfEiXnyFzck2+7IprwGheRnigcD/dPnZXUy9UkoGvFrST9QHT
        OzlauTNpbnWW2Wh4Dt7K1IXwVxeRQT2Aw7f+CpRnqv64uOtVdABkcV1n4jMD1mR4FmatkQ
        zwDWMNzIsFYLoxwu5IKVPHGfE3ylJj+UAy/UOZGL0qD3VWjm8RWe9wXyuA7gh8U+elPqV6
        tIm7CyKn10fd8TNBRDVOocB1cPKxqNDXkeCMSmvLspmZ9yLKTOYWJU0B4KSZPg==
Message-ID: <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
Date:   Tue, 4 Jan 2022 18:58:31 +0100
MIME-Version: 1.0
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
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
In-Reply-To: <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

How can I help? I’m totally not a kernel developer but maybe you could SSH to my machine or something? Should we text in private outside the mailing list? What about reverting the kernel commit until this issue gets somehow solved?

Am 04.01.22 um 18:31 schrieb Pavel Skripkin:
> On 1/4/22 20:22, Maximilian Böhm wrote:
>> Hey Pavel,
>>
>> did you have time to look into this issue further?
>>
> Hi Maximilian,
>
> I did give it a try, but looking at the code didn't give any results :(
>
> It's a bit hard to debug without reproducer or real hw piece
>
>
>
> With regards,
> Pavel Skripkin
