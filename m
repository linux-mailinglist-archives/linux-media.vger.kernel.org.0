Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AC531D691
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhBQI25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQI2z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:28:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2EAC061574;
        Wed, 17 Feb 2021 00:28:15 -0800 (PST)
Received: from [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350] (unknown [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4BA41F44D79;
        Wed, 17 Feb 2021 08:28:12 +0000 (GMT)
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <YCzO7SRmBKzGeMUS@kroah.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
Date:   Wed, 17 Feb 2021 09:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCzO7SRmBKzGeMUS@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 17/02/2021 à 09:08, Greg KH a écrit :
> On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
>> The IMX8MQ got two VPUs but until now only G1 has been enabled.
>> This series aim to add the second VPU (aka G2) and provide basic
>> HEVC decoding support.
> Why are you adding this directly to drivers/staging/media/ and not
> drivers/media/?  Why can't this just go to the main location and not
> live in staging?

G2/HEVC is added inside the already exiting Hantro driver, it is "just"
an other codec from Hantro driver point of view.
In addition of that v4l2-hevc uAPI is still unstable.
One goal of this series is to have one more consumer of this v4l2-hevc
uAPI so maybe we can claim it to be stable enough to move away from staging
and then do the same for Hantro driver. That would be a great achievement !

Benjamin

> thanks,
>
> greg k-h
>
