Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B44C7D71E0
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 18:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjJYQqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 12:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYQqo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 12:46:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50907128
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698252386; x=1698857186; i=wahrenst@gmx.net;
        bh=QIk2Wk5P8HUmEZz2O5TMtOA19zJ7N6B55JkuDRlrXbQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=hQdV3l864H0dD3ygiVsj6/Ep2QvH2DXr9FxVhSaeQviavBmNqKuQ7oIy0fNa9QzZ
         mNa4zbsze10p1oLmKDbzZSp0CP2NTkibMHLYwhhYCxhzMiRmL3nkVs5ouPwFhG4A/
         n/N9DfeCWPFCIvEcCKGJTFYFuGizM1h1NGTFG5BHLkVDYUz0qyrAdFWkM4zCqKN46
         OkU7oIhogWh1ORtuqG2y/qC2oSQaN7NMxrzcwbb7G5p+gwt3dupUMCTQ31G1m/QLm
         06v1msFzpAdsR5SabuOvXkMXuSaWY3M+1V0sX0tPe+yEXq50eku6Pj8OLufL+HzIM
         nPklyZLifLqV3BzQSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacOQ-1rTNwu3D5u-00c7Yr; Wed, 25
 Oct 2023 18:46:26 +0200
Message-ID: <8355043f-36fc-45f5-a868-2e96e6427e28@gmx.net>
Date:   Wed, 25 Oct 2023 18:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] staging: vc04_services: Drop completed TODO item
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
 <20231025103300.340572-2-umang.jain@ideasonboard.com>
Content-Language: en-US
From:   Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231025103300.340572-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:97ymlUBpnVN+PDVH3VpWdhG9cWTq1BednJDXzOgogJLeuLhcz0j
 PTQdMxDJ1U0Tz4EUr4fKdE2NrWumFqqcQx4s2QwBK8u1Psb8SIw9RzN/AuXK0GmQYdaPzxI
 vi8WAhHc/l0pDVMjqn3RTrlqt2jp0WLRmodEpFYX44rPJaPiMoZWhU7bhHX14gLIbrncrUU
 UvLLVr2Tmiydw80nZ7a1A==
UI-OutboundReport: notjunk:1;M01:P0:o6P+oZgq39Q=;H8i8n+XmKGhPGl4GJgDdIpGDplw
 Ntk8cHKqSjyN8ruzRcvqyvJt9pSwetI5n62PyuE026rv8BTdTPg7kRBEoH01FB9LTmf5/wvm8
 rMt5yp8ipGpJgNu3ZyxkONv8JnrvLewAFZfBxQgTNtyvh1spas1qlvLNpNK370N8kteEQplEK
 3CwvERuc2MP7eTV9kyep9KyUciSqiic/22YW6HE1sTBFPS/La5I41gQQBFjeAl39EU2JJkK9Q
 02GwREPUfXnR4X5bpewKa3fYRB8FUWYK7cAphsUOlbE9i7OUrdn5Zr2+l1aBXoQgdtPMCJkqT
 EQAsuWr1JmqvSb0YhStp7wf/uKrOLXMrgIg/edCP1PNvlTGGnYrf7xP0oDAPuaUJj30+xz5YR
 J4YkPa3n/1lG5CnjHe1o7Eom65pGOsHW1nmhAFqE7ouRlUP6FqakLgXZTBCDRxm9K+be8sEBC
 kOCBGCSgNhh87OH5KWhopJic6NsQ8MB09Sa0108X9On0dFpfGN5Yx4IsMPEl3KNbhYrbaM4zN
 jEvoTeh4cR56muLPt9fWFC8z0qQ/sfzjnzSJVX/XRpinUDWnmzxbfzcI4CbnCgY/kaz5oy88I
 tMe6AdB1zM62pmMFEZRw/GzVrp7JXUmFYF9Td+4/VdUIkQ4WmP1kG6jFzIztlvsN2oH5VI3eC
 j2uMHpzb+qoCw0w4dJZH9o1eWYLRK3PPqS/ihMYBzT7cXmWOuaX2fRfFjM+7QuNw2VWFNRXS+
 Pmu3pqZnTH6lzkXLX2sKwj6IQbc2Wr8P+6CzLy8E6RUii3hNJbEAzF/N5Qz4v+j4qzL1SoCNu
 SrypARmcHP+mevqZn11A6qSXJ2KQYN+dT7J3qXIuXknkOmtnpsg5ItDSh4kYdH0eh6PbLX9IO
 ofTiwpEZT4NQq/GUxgaFjRhnuAspkja5bv8sLap1uwEod+OM3hvGtiZWxQ0hMmbWIwBrg6a5F
 qP6USk3if5DC2JfPC2i2Fiz8wFA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Am 25.10.23 um 12:32 schrieb Umang Jain:
> Drop the TODO item which deals with non-essential global
> structures and per-device structure. All this has been
> handled now through vchiq-bus and struct vchiq_device.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TODO | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index 6d9d4a800aa7..9c79ed549831 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -46,14 +46,6 @@ The code follows the 80 characters limitation yet ten=
ds to go 3 or 4 levels of
>   indentation deep making it very unpleasant to read. This is specially =
relevant
>   in the character driver ioctl code and in the core thread functions.
>
> -* Get rid of all non essential global structures and create a proper pe=
r
> -device structure
at first thank for all the great work. Currently i don't have much time
to give a feedback for everything :-(

Tbh this TODO is not finished yet. There are still global structures.
Please look at variables starting with g_* in vchiq_arm.c and
vchiq_connected.c

Unfortunately i cannot tell which of them are easy to move into the
device structure.
> -
> -The first thing one generally sees in a probe function is a memory allo=
cation
> -for all the device specific data. This structure is then passed all ove=
r the
> -driver. This is good practice since it makes the driver work regardless=
 of the
> -number of devices probed.
> -
>   * Clean up Sparse warnings from __user annotations. See
>   vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bul=
k_waiter"
>   is never disclosed to userspace.

