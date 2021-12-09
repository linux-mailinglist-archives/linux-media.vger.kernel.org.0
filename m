Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F153646F412
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 20:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbhLITlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 14:41:10 -0500
Received: from mout.gmx.net ([212.227.17.20]:57121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229379AbhLITlJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Dec 2021 14:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639078650;
        bh=Gv5vaNtikWugT3mxfgORiLUsOZOW0GbPxtMHPX1BecM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WhwQKyQeB836QVxx+5ESlrJe9W3HR91RH+KEd/W3RD2PTa/nBeXstjDzIaW0CdBif
         coWpyf3DBNVt+wqr4TkJ87blDUsfDUgjhg9YYespzuTdi7OgdaZliotsSnSARrScyf
         vaLdQyIozKXjV3YRcRZdDysahKAIWba7prALxlJc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Thu, 9 Dec 2021
 20:37:29 +0100
MIME-Version: 1.0
Message-ID: <trinity-3624a17f-c00f-42f7-bb18-8e6235eb0e34-1639078649877@3c-app-gmx-bap23>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: si2157: rework the firmware load logic
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 9 Dec 2021 20:37:29 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211209123422.054175cd@coco.lan>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
 <842e61352a54e9f1a7f44c4e3250a055c2d45e13.1638958050.git.mchehab+huawei@kernel.org>
 <trinity-7e7d5b59-e213-481b-9b1b-ae9d0819a33c-1639003053723@3c-app-gmx-bap08>
 <20211209123422.054175cd@coco.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:7QFo37q1e+A7ri+ujTENrZfZkiBH4yo8Zipae7MEicHcLSYQ7iVemOYQag2Nmsk22ZlZf
 z/YDtVkbQ2/EfCpfjc63Y2brBBaV0kRgQRiQhc2kqeMal2k9i+KA5SbiQ/Fy/6ih6HVnxKf2xpml
 H3KqXboaAltkxJlvMtNmz6Gtu4G3fd9KztJbvsSqVaI2fQq+00oEuY8mEljQPYQD6X38kLYukMEN
 /uNzmsPWS+0BoQwCcmnM04Sv0tDEzNq/7viNDWbLToHONTBScIkeA447P4+V/X+foWSzojN1kboA
 N4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mv7oHlvGuFc=:28NJv3Wc9B2Px6y4ZYtCFf
 cbx3KX0GoMMQB0yMHcNRgbcobR/FHgm+XE3bD5lJCFyhuOF0ylUXS0Xk3i91J4nufnFHQzDp3
 YCkfiwRvkozYaZjSHiC53lBnYxkqBbGvZfZGvdauc0cJa9lfZqx8H18YWDU+9jfWlZxik4blH
 t++gRe/JAAg3jG1C3pegHGJZGB0/6JWQOpR6aN8jrnyUkbG+0yv3B3kAKHhahpcoaXps7KHSd
 hpazxKRFgGRPrQU2G3fPI/2BuAS8L48RPQBUiqr6nEZmXl0XRL4fKdnissxRgXhxqVx27XI62
 6MeF8rmQr2bKFHsPeeC5TYVgvvjojCgq117QJFuDQmHz77XPrytXif8egvMw7aVHpc/qgecha
 z94ZdoD/v/JvmtW8qxw03tlIRUWOE2E1JFuHsgfgNSoccK4DlilpymCgdkaawHBhapFVLExBj
 ceiYj8pXsQ4UPaSQ+KTrhPi1xK7S7q+VkFRE4vjM0ljdKoM51KcJi3yGl4IF9x/QZywAbUrg2
 waqWkETUYtARUaFEsWYGVrcQBE8hRyH9cy+pEYDYhpHTagTk/dxNB5Q2MmtwenMdCYl3JBK5/
 defdx857mrQFVEUZ3sYFPKk/cLExj8PoIvsbEsa9FZPJ49b6OLEoxo1cFoA2lgyzktHiND6uj
 yKh/vLXJ03CMoLrINTJulhiP9FBcDX5t47tilbFltazw/U2Hr05731MVTlLbydw5Qu2mliS3J
 5mT4ubPEaSaMjydXsF3LMpXVaHPhPYFQ29lHyoZ7CFmxmzEewTounzELnJ6YuDmaMpYIYmpSR
 SJwH+nr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Not true. if you check the code for si2148, it doesn't have
> an option to skip firmware load.

You're right. I thought I had checked all code, but I must have
missed that one.

Or I was distracted by the fact that for Si2148 with romid 0x33,
a "dummy patch" is used, which according to the code comment
skips the firmware download and boots from NVM only. So I suppose
that version does not actually need the firmware...?!?

> I can't see a request_firmware_nowarn() function

Sorry, it's:

EXPORT_SYMBOL_GPL(firmware_request_nowarn);

They swapped the words around vs. the original function, for
whatever reason. Anyway, please use "firmware_request_nowarn()"
which does not log any message when the file is not found, so
that only the message logged from the si2157 shows up in the
kernel log.

Best Regards,
-Robert Schlabbach
