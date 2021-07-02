Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43BC3BA409
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 20:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhGBSqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 14:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhGBSqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 14:46:23 -0400
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6ACCC061762
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 11:43:50 -0700 (PDT)
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 90DE92600F7;
        Fri,  2 Jul 2021 20:43:48 +0200 (CEST)
Subject: Re: DVB reliability problems
To:     Tony Houghton <h@realh.co.uk>, linux-media@vger.kernel.org
References: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
Message-ID: <3728eeea-1471-ff23-6adf-03fee9bc03d6@selasky.org>
Date:   Fri, 2 Jul 2021 20:43:40 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/2/21 7:06 PM, Tony Houghton wrote:
> Hi,
> 
> I've been having problems with my DVB receivers lately. I'm not sure
> whether the problem is in the receivers or their firmware, or Linux.
> Some symptoms point to the card, some point to Linux (because they
> should try to prevent the system from hanging even with bad hardware
> if the hardware is peripheral?). Perhaps the majority of USB DVB
> receivers are actually useless junk?
> 
> I'm trying to develop a good DVB PVR, but if I can't fix these
> problems there's not much point in continuing. I hope someone can
> offer some suggestions on what's causing the problems and/or how I can
> diagnose them better, and hopefully get things fixed.
> 
> Frequently one of them will stop working. The main symptom is that
> after tuning they fail to get a signal. If I don't "fix" it asap by
> power cycling the PC (reboot seems to be inadequate) the situation
> seems to escalate until the entire system hangs, either when trying to
> use the receiver or at shutdown.
> 
> The problems seem to have developed or exacerbated mainly since I
> started using an Intel NUC as my PVR and therefore had to replace my
> DVBSky PCI-E DVB-S2 card with a USB TeVii S662 DVB-S2. After a while
> it started exhibiting the above symptoms with increasing frequency.
> When it got to daily problems I returned it under warranty and
> replaced it with a DVBSky S960 V2. IIRC it has the same Montage
> chipset as the TeVii; this seems to be the only chipset commonly
> available in USB DVB-S2 devices. At first, the change of device seemed
> to cure the issue, but that's started doing the same thing too.
> 
> Meanwhile I've also been using a DVB-T2 USB stick. At first I had a
> Pinnacle PCTV 290e. That worked quite well until it seemed to fail
> completely (not even detected by lsusb). I replaced it with a
> "Geniatech MyGica DVB-T2/T USB" which I think uses the si2168/si2157
> modules. This one's also unreliable.
> 

Hi,

I've seen problems with DVBSky USB devices when using the CAM slot, 
typically during bad signal conditions. Seems to be an issue with the 
decoder card. Bought a new antenna, and the problems were significantly 
reduced!

--HPS
