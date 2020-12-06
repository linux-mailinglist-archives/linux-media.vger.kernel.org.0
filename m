Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5C32D00A0
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 06:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgLFFTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 00:19:24 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9385 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgLFFTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 00:19:23 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CpZTZ5M3qz78Jf;
        Sun,  6 Dec 2020 13:18:10 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Dec 2020
 13:18:34 +0800
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
To:     Mark Brown <broonie@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Ricardo Ribalda" <ribalda@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        alsa-devel <alsa-devel@alsa-project.org>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
 <20201204174135.GC4558@sirena.org.uk>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <323edb53-71a7-ba81-17b9-704ae3e7a7a1@huawei.com>
Date:   Sun, 6 Dec 2020 13:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201204174135.GC4558@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/12/5 1:41, Mark Brown wrote:
> On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
>> All warnings are related only to "wrong indentation", except one:
>> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
>> [error] missing document start "---" (document-start)
> 
> It would make life easier (and be more normal practice) to split this up
> by driver/subsystem and send a bunch of separate patches to the relevant
> maintainers, this makes it much easier to review and handle things.

Okay, I'll split this patch and send them separately. I'm not going to mark
the new patches as v2 to save trouble.

> 

