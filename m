Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9169B48C0AB
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 10:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351909AbiALJEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 04:04:44 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:25978 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351895AbiALJEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 04:04:43 -0500
X-KPN-MessageId: 7fe9724e-7386-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 7fe9724e-7386-11ec-8a6e-005056ab378f;
        Wed, 12 Jan 2022 10:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=ls48D+lgHnzt+n2zGGc23VkroiKF3mODCBrLd7WhW1k=;
        b=BF0JGIKXN7uBj93vqR0Cnp5vF06haYhjAdffAMABwoQDzBjzRkTcFSLSU2FhphV29vXE/IXo/MIRB
         RVTqu8/qufBlGBZeb9K04A2hgi1O7CfgGyQ8wa7SSKCKVFO6LwzNW7STNwAPVnEar4fNMa+waFtWXD
         pHyaXwK4EpFnRqdqV6NOIt1BhPVKhzks2N4chuZ9kW6I+OVEL2f78u+ZwsbU5z9xY+FubAxkrJLInA
         sVfHX0zWf5RTKGG/9Hw/idT0t4IjyLTYm4Pr04ex+j4j+IYj8+6og4bD8b3BDYibJGqCIGyBh52kDB
         Z/sFzvvQ+K4GIh+yoHaTF8RtfxeL0ag==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|DYSH1JvwU6JOP4X/oDvGgLLQ/NzdXBW2+N7tUP4ixfBosNO+MzrnfMshJDhEo5s
 RODS4LKiaFjwv5fWGXC4oqA==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id ad95d89c-7386-11ec-81f5-005056ab7447;
        Wed, 12 Jan 2022 10:04:42 +0100 (CET)
Message-ID: <1064db59-9d03-4c76-4e02-ac7653f2ff2c@xs4all.nl>
Date:   Wed, 12 Jan 2022 10:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v3] media: meson: vdec: Fix a NULL pointer dereference in
 amvdec_add_ts()
Content-Language: en-US
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Qingyang Zhou <zhou1615@umn.edu>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org
References: <20211214144613.35fec82a@coco.lan>
 <20211215033535.40422-1-zhou1615@umn.edu>
 <368bc1b7-ff86-beaa-6749-afbe5960eaeb@xs4all.nl>
 <CA+Cm_xSOv5NnW5GXcKKGi8bQSvT45iH6=65YJk3EG6uW0c5_Vw@mail.gmail.com>
 <7e9f1b17-7087-3513-84b9-f5dd25211b87@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <7e9f1b17-7087-3513-84b9-f5dd25211b87@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 12/01/2022 09:57, Neil Armstrong wrote:

<snip>

> 
> Then the patches were sent:
> - 20211210015620.2143555-1-jiasheng@iscas.ac.cn on 10/12/2021
> - 20211215033535.40422-1-zhou1615@umn.edu on 15/12/2021
> 
> They are extremely close but not similar, mostly indenting differs.
> 
> Both patches have the missing final "return 0" in amvdec_add_ts which is missing in my proposal.
> 
> But only 20211210015620.2143555-1-jiasheng@iscas.ac.cn has the correct "if (ret)" in esparser_queue().
> Patch 20211215033535.40422-1-zhou1615@umn.ed has a wrong "if (!ret)".
> 
> But when comparing, 20211215033535.40422-1-zhou1615@umn.edu is an almost exact copy of my proposal, minus the fixes and the bogus return check.
> 
> To be honest, there is a limited way to fix this, it's probable 20211215033535.40422-1-zhou1615@umn.edu was written independently from
> my proposal since there is a bug return check, and 20211210015620.2143555-1-jiasheng@iscas.ac.cn was rewritten from my proposal.
> 
> Since 20211215033535.40422-1-zhou1615@umn.ed has a bogus return check, it should be naked.

OK, I had already rejected this, so that remain rejected.

> 
> I'll only ask 20211210015620.2143555-1-jiasheng@iscas.ac.cn to be resent with a "Suggested-by" and indentation fixed like my proposal.

I changed the status of this patch to 'Changes Requested'. Jiasheng, can you post a v3 with
the requested changes?

Neil, thank you for your detailed analysis!

Regards,

	Hans
