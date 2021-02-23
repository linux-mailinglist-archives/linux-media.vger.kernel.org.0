Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59473226CE
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 09:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhBWIGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 03:06:06 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39008 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhBWIFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 03:05:38 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:581e:94a9:9bf9:6630] (unknown [IPv6:2a01:e0a:4cb:a870:581e:94a9:9bf9:6630])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7A7F01F45378;
        Tue, 23 Feb 2021 08:04:53 +0000 (GMT)
Subject: Re: [PATCH v3 8/9] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
 <20210222122406.41782-9-benjamin.gaignard@collabora.com>
 <20210223003442.GA2516123@robh.at.kernel.org>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <25f30110-d655-2d77-d3b7-30c1c61f6965@collabora.com>
Date:   Tue, 23 Feb 2021 09:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223003442.GA2516123@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 23/02/2021 à 01:34, Rob Herring a écrit :
> On Mon, Feb 22, 2021 at 01:24:05PM +0100, Benjamin Gaignard wrote:
>> The current bindings seem to make the assumption that the
>> two VPUs hardware blocks (G1 and G2) are only one set of
>> registers.
>> After implementing the VPU reset driver and G2 decoder driver
>> it shows that all the VPUs are independent and don't need to
>> know about the registers of the other blocks.
>> Remove from the bindings the need to set all blocks register
>> but keep reg-names property because removing it from the driver
>> may affect other variants.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 2:
>> - be more verbose about why I change the bindings
>> Keep in mind that series comes after: https://www.spinics.net/lists/arm-kernel/msg875766.html
>> without that review and ack it won't work
> Better, but you've still mentioned nothing about breaking compatibility.
> Why is that okay?

Because this reg-names wasn't used before for this variant so remove it won't change anything.

>
