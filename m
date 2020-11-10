Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8102AE0C1
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 21:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKJUeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 15:34:37 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:19471 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJUeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 15:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605040475;
        s=strato-dkim-0002; d=fossekall.de;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lu5jrFALnWemYOB6bUL80pDTZScGunYtkUU6ul6aotk=;
        b=TU08Jiw0ptlfuM7QHkwtp14hWdIqN6NYe2YGXH5KcJVR5JOWUZX8aefsShCc3r9SnT
        UFsoTxfKT1Kz8hgFMOIah1VyvrY4e4MaI68KSU5B7OyRGKofz8qMcSZhwxTSEeyA2dvn
        mtDacCW4gXoMNg5Gix88WipGcWSn1ANqPF4olsuMSmndPOYTZsIwI5Ti4opO5QxVJKxQ
        D4jbdo60OTvNb5CHRK/GgIBPj8uicVC6mpH578mj2lx9OhE03ZQZrjfMBSKIi45DrW9b
        qMZKLqR1MtkqghycbCbiB0znnQIaRR0fkqGx+00omlnZEaxH9uoYfn4DUDrBgPjbDBI8
        TSVg==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.4 AUTH)
        with ESMTPSA id g02087wAAKYZ35H
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Nov 2020 21:34:35 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kcaLa-0002SY-Ao; Tue, 10 Nov 2020 21:34:34 +0100
Date:   Tue, 10 Nov 2020 21:34:32 +0100
From:   Michael Klein <michael@fossekall.de>
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/2] media: rc: gpio-ir-recv: add timeout
 property
Message-ID: <20201110203432.GA3173985@a98shuttle.de>
References: <cover.1604589023.git.michael@fossekall.de>
 <20201110101727.GA26198@gofer.mess.org>
 <20201110124805.GA29796@a98shuttle.de>
 <20201110131918.GA29219@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201110131918.GA29219@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 01:19:18PM +0000, Sean Young wrote:
>On Tue, Nov 10, 2020 at 01:48:05PM +0100, Michael Klein wrote:
>> On Tue, Nov 10, 2020 at 10:17:27AM +0000, Sean Young wrote:
>> > On Mon, Nov 09, 2020 at 04:23:09PM +0100, Michael Klein wrote:
>> > > The default recorder timeout of 125ms is too high for some BPF protocol
>> > > decoders when a remote sends repeat codes at high rates. This makes the
>> > > timeout configurable via the devicetree.
>> >
>> > To be honest, 125ms is too much by any measurement. The longest space
>> > in any protocol I'm aware of is 40ms in the sharp ir protocol. I think
>> > changing IR_DEFAUL_TIMEOUT to something like 50ms would make sense.
>>
>> Seconded. I'm happy to prepare a patch if changing the default value is
>> acceptable.
>
>Actually I don't understand why the high timeout is an issue. It means that
>between ir messages you don't get a LIRC_TIMEOUT, just a LIRC_SPACE. Why is
>this a problem?

Never mind; this turned out do be a problem of the BPF protocol decoder, 
which relied on LIRC_TIMEOUT to terminate each IR message. After 
overhaul it is quite a bit simpler now and works fine with the long 
timeout.

Thank you for your insights.

Michael
