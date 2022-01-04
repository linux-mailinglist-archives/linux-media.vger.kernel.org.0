Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D6C4846EC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 18:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbiADRW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 12:22:59 -0500
Received: from mout-p-201.mailbox.org ([80.241.56.171]:23228 "EHLO
        mout-p-201.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbiADRW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 12:22:59 -0500
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JSzw10JKSzQlZs;
        Tue,  4 Jan 2022 18:22:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1641316975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DCALPmDTWpTMT0aEvrdN/toH0C53HwjAr7F/2shmzDY=;
        b=czjRrbDDSFU+74Bq3cF4kLpyP1UCUOOoY471HRfQj2mj+wjo2BjP87EhUYH8g7aRBV7u89
        T6ib4fYIPGHdVwnI9X8F2RsS/H49g609fgW3hi1Sot8e8HROfrWfbajza0ddSNeG53dwvX
        U21c75RnycA1s6Xl2bDbdP7fcQDpWFCyqYyhEC4pItzeUEoGR8Qbd499d+M9QXyQSURAlP
        ENx9qumfmn5lRbE8yR0BEk0iCFzL5QIvCdMHjn5oYtdrmZZvnu3lVGvFI2a1g5kMqCtAbh
        jvGrXRraIPOB3zCqyFg6wQ4KcN9NJYl4BFYi75T6g1LLqBNVpwilJV2O039Z2A==
Message-ID: <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
Date:   Tue, 4 Jan 2022 18:22:52 +0100
MIME-Version: 1.0
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: de-DE
To:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
In-Reply-To: <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Pavel,

did you have time to look into this issue further?

Regards
Maximilian Böhm

Am 20.12.21 um 15:39 schrieb Pavel Skripkin:
> On 12/19/21 01:50, Maximilian Böhm wrote:
>> Thanks Pavel (not Paul, I‘m sorry!),
>>
>> we might be on the right track here. This patch does still trigger a kernel tracing event with usbreset after a resume from standby (and usbreset is hanging for about 2 mins), but afterwards the system is still running fine, the DVB card works again and I can reboot the machine without hangs. I’ve tried this with two reboots and attached a dmesg log.
>> But this only works one time, a second try with usbreset in the same uptame seems to trigger the old total block, the adapter doesn’t get alive again and a proper reboot is impossible.
>>
> Hi, Maximilian!
>
> Ok, one down :) I will look at the second one today later or tomorrow.
> It looks like missing dvb_dmxdev_release() somewhere at first glance,
> but for now I have no idea where...
>
>
>
>
> With regards,
> Pavel Skripkin
