Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA976FB80
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfGVIkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:40:35 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41632 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfGVIkf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:40:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6M8eOsg070238;
        Mon, 22 Jul 2019 03:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563784824;
        bh=TviAWhiRP3zQTB51r4gI+gZaJWkaHb/tZnv/A5V5Vec=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iGDD/T/krkpcQWBLx7cJN+bhSHCfkTJfr4zmFgdjTROeqVqtmjIOb2TjaQPaq+Ew+
         xyJxkc12dBMvkmGrPryQRTAN9G3loNxthgqkCX4HiiAz/oKPGD8R6XUYsBor0MTDvW
         BnRcmxfHPb/gfiXi3HEXO0qiVt4aFZyBll1kTGao=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6M8eOaw058289
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Jul 2019 03:40:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 03:40:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 22 Jul 2019 03:40:23 -0500
Received: from [172.24.190.172] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6M8eIZk028120;
        Mon, 22 Jul 2019 03:40:19 -0500
Subject: Re: [PATCH] staging: media/davinci_vpfe: fix pinmux setup compilation
To:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mukesh Ojha <mojha@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ioannis Valasakis <code@wizofe.uk>,
        Arushi Singhal <arushisinghal19971997@gmail.com>,
        <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-kernel@vger.kernel.org>
References: <20190722081243.2084226-1-arnd@arndb.de>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <35b6ec33-f3d7-54ec-e9a0-3748ee9eb343@ti.com>
Date:   Mon, 22 Jul 2019 14:10:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722081243.2084226-1-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 22/07/19 1:42 PM, Arnd Bergmann wrote:
> The dm365_isif staging driver uses an odd method for configuring its
> pin muxing by calling directly into low-level davinci platform specific
> code, even when being compile-tested for other platforms.
> 
> As we want davinci to be part of a multi-platform kernel, this will
> cause a build failure when those headers are no longer exported even
> for davinci:
> 
> drivers/staging/media/davinci_vpfe/dm365_isif.c: In function 'vpfe_isif_init':
> drivers/staging/media/davinci_vpfe/dm365_isif.c:2031:2: error: implicit declaration of function 'davinci_cfg_reg'; did you mean 'omap_cfg_reg'? [-Werror=implicit-function-declaration]
>   davinci_cfg_reg(DM365_VIN_CAM_WEN);
>   ^~~~~~~~~~~~~~~
>   omap_cfg_reg
> drivers/staging/media/davinci_vpfe/dm365_isif.c:2031:18: error: 'DM365_VIN_CAM_WEN' undeclared (first use in this function); did you mean 'DM365_ISIF_MAX_CLDC'?
>   davinci_cfg_reg(DM365_VIN_CAM_WEN);
>                   ^~~~~~~~~~~~~~~~~
> 
> Digging further, it seems that the platform data structures defined
> in drivers/staging/media/davinci_vpfe/vpfe.h are an incompatible
> version of the same structures in include/media/davinci/vpfe_capture.h,
> which is the version that is used by the platform code, so the
> combination that exists in the mainline kernel cannot be used.
> 
> The platform code already has an abstraction for the pinmux,
> in the form of the dm365_isif_setup_pinmux() helper. If we want
> to ever get to use the staging driver again, this needs to be
> read from the platform data passed to this driver, or rewritten
> to use the pinmux framework.
> 
> For the moment, pretend we pass the helper function in the
> staging platform driver to get it to build cleanly. I could
> not figure out how the staging driver relates to the code
> in drivers/media/platform/davinci/, some clarification on that
> would be helpful to decide what the long-term plan on this
> should be to either remove the staging driver as obsolete or
> integrate it with the rest in a way that actually works.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I looked at the history of updates on this driver over last 4 years.
None of them are towards fixing some issue found with the driver during
actual usage or for improving its design to move it out of staging.

I think no one is really using it or working on moving it out of
staging. Perhaps the right thing to do would be to delete it.

Thanks,
Sekhar
