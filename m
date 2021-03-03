Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037C132C755
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377840AbhCDAbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36046 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381973AbhCCPWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 10:22:13 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:30e8:5098:73c5:2bfe] (unknown [IPv6:2a01:e0a:4cb:a870:30e8:5098:73c5:2bfe])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EB8F91F45DD2;
        Wed,  3 Mar 2021 15:20:36 +0000 (GMT)
Subject: Re: [PATCH v3 0/5] Reset driver for IMX8MQ VPU hardware block
To:     Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        ezequiel@collabora.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <e6f8537d2a1f34d0a424b68e056c0ae556c93efd.camel@pengutronix.de>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <2d55ad69-9b93-ab0e-04af-cd775cc9248b@collabora.com>
Date:   Wed, 3 Mar 2021 16:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e6f8537d2a1f34d0a424b68e056c0ae556c93efd.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 03/03/2021 à 15:17, Philipp Zabel a écrit :
> Hi Benjamin,
>
> On Mon, 2021-03-01 at 16:17 +0100, Benjamin Gaignard wrote:
>> The two VPUs inside IMX8MQ share the same control block which can be see
>> as a reset hardware block.
> This isn't a reset controller though. The control block also contains
> clock gates of some sort and a filter register for the featureset fuses.
> Those shouldn't be manipulated via the reset API.

They are all part of the control block and of the reset process for this
hardware that why I put them here. I guess it is border line :-)

>
>> In order to be able to add the second VPU (for HECV decoding) it will be
>> more handy if the both VPU drivers instance don't have to share the
>> control block registers. This lead to implement it as an independ reset
>> driver and to change the VPU driver to use it.
> Why not switch to a syscon regmap for the control block? That should
> also allow to keep backwards compatibility with the old binding with
> minimal effort.

I will give a try in this direction.

>
>> Please note that this series break the compatibility between the DTB and
>> kernel. This break is limited to IMX8MQ SoC and is done when the driver
>> is still in staging directory.
> I know in this case we are pretty sure there are no users of this
> binding except for a staging driver, but it would still be nice to keep
> support for the deprecated binding, to avoid the requirement of updating
> kernel and DT in lock-step.

If I want to use a syscon (or a reset) the driver must not ioremap the "ctrl"
registers. It means that "ctrl" has to be removed from the driver requested
reg-names (imx8mq_reg_names[]). Doing that break the kernel/DT compatibility.
Somehow syscon and "ctrl" are exclusive.

Benjamin

>
> regards
> Philipp
>
