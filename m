Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B234D28182A
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 18:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgJBQmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 12:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBQmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 12:42:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0459DC0613D0;
        Fri,  2 Oct 2020 09:42:12 -0700 (PDT)
Received: from [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa] (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 98B2829DDEB;
        Fri,  2 Oct 2020 17:42:08 +0100 (BST)
Subject: Re: [PATCH v3 0/3] media: rockchip: Introduce driver for Rockchip's
 camera interface
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20200922165535.1356622-1-maxime.chevallier@bootlin.com>
 <CAAEAJfCBi3AE23hbHB19FFNpmELp2hh3BU+qrdtmgBFJzv9A_g@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e80036b7-f66f-83f0-a9cc-b904e0089db5@collabora.com>
Date:   Fri, 2 Oct 2020 18:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCBi3AE23hbHB19FFNpmELp2hh3BU+qrdtmgBFJzv9A_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 02.10.20 um 18:31 schrieb Ezequiel Garcia:
> Hi Maxime,
> 
> On Tue, 22 Sep 2020 at 13:55, Maxime Chevallier
> <maxime.chevallier@bootlin.com> wrote:
>>
>> Hi everyone,
>>
>> This is the third iteration of the series introducing a driver for the
>> PX30 camera interface.
>>
>> This was previously known as the "cif" driver in other iterations, but
>> was renamed to "vip" following Ezequiel's advices to match the datasheet
>> name.
>>
>> This is based on a BSP driver, and I'm not fully familiar with the media
>> and V4L2 frameworks, so I guess some review is still needed.
>>
>> This new series adds some stability fixes, and introduces the
>> double-buffering frame handling, giving better performances.
>>
>> Thanks to everyone who reviewed the first two iterations,
>>
>> Maxime
>>
>> Maxime Chevallier (3):
>>    media: dt-bindings: media: Document Rockchip VIP bindings
>>    media: rockchip: Introduce driver for Rockhip's camera interface
> 
> I can't find this "v3 2/3 media: rockchip: Introduce driver for
> Rockhip's camera interface" patch in my mailbox. Perhaps it was too
> large and got filtered?
> Or maybe it's an issue on my side?

I do see it on my mailbox, if it helps..

Dafna,

> 
> Cheers,
> Ezequiel
> 
