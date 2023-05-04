Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3906F68DA
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjEDKJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 06:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjEDKJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 06:09:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2EB4C2E
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 03:09:23 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:5f83:c35:c94d:7e3] (unknown [IPv6:2a01:e0a:120:3210:5f83:c35:c94d:7e3])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A93666003AC;
        Thu,  4 May 2023 11:09:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1683194962;
        bh=bkyQqVNfetoXo+X0SX7hki7ghDVnlqvyPZI1qaNq82U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lYvfeVSuh3feNAH5DW2yxWVTkF8+KpsO2aQR9zbrdrxuA0BHJgFNqd36pW8QzzU4P
         0zLL1TiB0dE66UXFwr1kUEa4/Z3388HmLP5MzPSxWDByqi4S+INy5CHemiluKVRz/L
         IB1ZkK58o2pSvc0XlVKqmWba/u03kl/gfDr+Jx6yrFXfRmfHZd3FShaHwo9RQMjlmG
         D5flc/eKXZjKJHQ8i1OWXJPU3t9wQS+AdOVs1eHGb5bgtoaksyhDtZBwlNMWCwEy5f
         TDZAUgTAlh2opzCZGyn0uvzHRR7D4aqPJDBqBRFpqt7xLbSKl4xqHggEWPwVOaDe2Z
         pxAlzjBPXYEAQ==
Message-ID: <76feb4cf-2cbf-c61d-e3f4-9866cc7c2500@collabora.com>
Date:   Thu, 4 May 2023 12:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: mainline/master bisection: baseline.dmesg.alert on
 rk3399-gru-kevin
To:     Mark Brown <broonie@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
References: <64521df9.170a0220.24317.c9f2@mx.google.com>
 <ZFMKRgPdgWoedjqk@finisterre.sirena.org.uk>
Content-Language: en-US
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <ZFMKRgPdgWoedjqk@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 04/05/2023 à 03:28, Mark Brown a écrit :
> On Wed, May 03, 2023 at 01:40:25AM -0700, KernelCI bot wrote:
>
> The KernelCI bisection bot found that commit db6f68b51e5c ("media:
> verisilicon: Do not set context src/dst formats in reset functions")
> is triggering problems at boot on rk3399-gru-kevin - there are oopses
> printed early on in userspace initialisation while enumerating the v4l
> devices.  The top of the backtrace is:
>
> <4>[   17.793601]  hantro_try_fmt+0xa4/0x27c [hantro_vpu]
> <4>[   17.805556]  hantro_set_fmt_out+0x3c/0x298 [hantro_vpu]
> <4>[   17.817914]  hantro_reset_raw_fmt+0x98/0x128 [hantro_vpu]
> <4>[   17.830429]  hantro_set_fmt_cap+0x240/0x254 [hantro_vpu]
> <4>[   17.842877]  hantro_reset_encoded_fmt+0x94/0xcc [hantro_vpu]
> <4>[   17.855694]  hantro_reset_fmts+0x18/0x34 [hantro_vpu]
> <4>[   17.867801]  hantro_open+0xd4/0x200 [hantro_vpu]
>
> which does seem relevant.
>
> I've left the full report below, including more details like links to
> full logs as well as a tag for the bot, below:

Hi Mark,

This problem has already been reported and fix by this commit:
f100ce3bbd6 ("media: verisilicon: Fix crash when probing encoder")

Thanks for the report.

Regards,
Benjamin

>
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> *                                                               *
>> * If you do send a fix, please include this trailer:            *
>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>> *                                                               *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>
>> mainline/master bisection: baseline.dmesg.alert on rk3399-gru-kevin
>>
>> Summary:
>>    Start:      865fdb08197e Merge tag 'input-for-v6.4-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
>>    Plain log:  https://storage.kernelci.org/mainline/master/v6.3-12423-g865fdb08197e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
>>    HTML log:   https://storage.kernelci.org/mainline/master/v6.3-12423-g865fdb08197e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
>>    Result:     db6f68b51e5c media: verisilicon: Do not set context src/dst formats in reset functions
>>
>> Checks:
>>    revert:     PASS
>>    verify:     PASS
>>
>> Parameters:
>>    Tree:       mainline
>>    URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>    Branch:     master
>>    Target:     rk3399-gru-kevin
>>    CPU arch:   arm64
>>    Lab:        lab-collabora
>>    Compiler:   gcc-10
>>    Config:     defconfig+arm64-chromebook+videodec
>>    Test case:  baseline.dmesg.alert
>>
>> Breaking commit found:
>>
>> -------------------------------------------------------------------------------
>> commit db6f68b51e5c7b432185c6d872d03901c07136d2
>> Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Date:   Mon Feb 20 10:48:44 2023 +0000
>>
>>      media: verisilicon: Do not set context src/dst formats in reset functions
>>      
>>      Setting context source and destination formats should only be done
>>      in hantro_set_fmt_out() and hantro_set_fmt_cap() after check that
>>      the targeted queue is not busy.
>>      Remove these calls from hantro_reset_encoded_fmt() and
>>      hantro_reset_raw_fmt() to clean the driver.
>>      
>>      Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>      Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>      Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>      Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> index c0d427956210..d8aa42bd4cd4 100644
>> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
>> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> @@ -382,13 +382,10 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
>>   
>>   	vpu_fmt = hantro_get_default_fmt(ctx, true);
>>   
>> -	if (ctx->is_encoder) {
>> -		ctx->vpu_dst_fmt = vpu_fmt;
>> +	if (ctx->is_encoder)
>>   		fmt = &ctx->dst_fmt;
>> -	} else {
>> -		ctx->vpu_src_fmt = vpu_fmt;
>> +	else
>>   		fmt = &ctx->src_fmt;
>> -	}
>>   
>>   	hantro_reset_fmt(fmt, vpu_fmt);
>>   	fmt->width = vpu_fmt->frmsize.min_width;
>> @@ -408,11 +405,9 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
>>   	raw_vpu_fmt = hantro_get_default_fmt(ctx, false);
>>   
>>   	if (ctx->is_encoder) {
>> -		ctx->vpu_src_fmt = raw_vpu_fmt;
>>   		raw_fmt = &ctx->src_fmt;
>>   		encoded_fmt = &ctx->dst_fmt;
>>   	} else {
>> -		ctx->vpu_dst_fmt = raw_vpu_fmt;
>>   		raw_fmt = &ctx->dst_fmt;
>>   		encoded_fmt = &ctx->src_fmt;
>>   	}
>> -------------------------------------------------------------------------------
>>
>>
>> Git bisection log:
>>
>> -------------------------------------------------------------------------------
>> git bisect start
>> # good: [d53c3eaaef6a05fec04e8b5990d97d7216eb5e42] Merge tag 'soc-dt-6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
>> git bisect good d53c3eaaef6a05fec04e8b5990d97d7216eb5e42
>> # bad: [865fdb08197e657c59e74a35fa32362b12397f58] Merge tag 'input-for-v6.4-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
>> git bisect bad 865fdb08197e657c59e74a35fa32362b12397f58
>> # bad: [6e98b09da931a00bf4e0477d0fa52748bf28fcce] Merge tag 'net-next-6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
>> git bisect bad 6e98b09da931a00bf4e0477d0fa52748bf28fcce
>> # bad: [c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4] Merge tag 'fsverity-for-linus' of git://git.kernel.org/pub/scm/fs/fsverity/linux
>> git bisect bad c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4
>> # good: [289af45508ca890585f329376d16e08f41f75bd5] Merge tag 'exynos-drm-next-for-v6.4-2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next
>> git bisect good 289af45508ca890585f329376d16e08f41f75bd5
>> # bad: [f5468bec213ec2ad3f2724e3f1714b3bc7bf1515] Merge tag 'regmap-v6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap
>> git bisect bad f5468bec213ec2ad3f2724e3f1714b3bc7bf1515
>> # bad: [017984559d09aef296011f9a8e9ce855404ad519] media: common: saa7146: add support for missing .vidioc_try_fmt_vbi_cap
>> git bisect bad 017984559d09aef296011f9a8e9ce855404ad519
>> # bad: [428bbf4be4018aefa26e4d6531779fa8925ecaaf] media: camss: Convert to platform remove callback returning void
>> git bisect bad 428bbf4be4018aefa26e4d6531779fa8925ecaaf
>> # good: [e004c637fb1d4b975d476f800675ec18c9502cc9] media: i2c: ov5670: Properly handle !CONFIG_HAVE_CLK
>> git bisect good e004c637fb1d4b975d476f800675ec18c9502cc9
>> # bad: [db6f68b51e5c7b432185c6d872d03901c07136d2] media: verisilicon: Do not set context src/dst formats in reset functions
>> git bisect bad db6f68b51e5c7b432185c6d872d03901c07136d2
>> # good: [75c38caf66a10983acc5a59069bfc9492c43d682] media: mtk-jpeg: Fixes jpeghw multi-core judgement
>> git bisect good 75c38caf66a10983acc5a59069bfc9492c43d682
>> # good: [6d020d81b91af80a977061e82de25cafa4456af5] media: mediatek: vcodec: Make MM21 the default capture format
>> git bisect good 6d020d81b91af80a977061e82de25cafa4456af5
>> # good: [5bbb6e2ca67477ab41163b32e6b3444faea74a5e] media: mediatek: vcodec: add params to record lat and core lat_buf count
>> git bisect good 5bbb6e2ca67477ab41163b32e6b3444faea74a5e
>> # good: [d227af847ac2d7d90350124a1b2451e4fc1f050c] media: mediatek: vcodec: add core decode done event
>> git bisect good d227af847ac2d7d90350124a1b2451e4fc1f050c
>> # good: [2e0ef56d81cb2569624d288b7e95a8a2734a7c74] media: mediatek: vcodec: making sure queue_work successfully
>> git bisect good 2e0ef56d81cb2569624d288b7e95a8a2734a7c74
>> # good: [960badda95f10fb0c60f6f64978b19eafa9507a7] media: mediatek: vcodec: change lat thread decode error condition
>> git bisect good 960badda95f10fb0c60f6f64978b19eafa9507a7
>> # first bad commit: [db6f68b51e5c7b432185c6d872d03901c07136d2] media: verisilicon: Do not set context src/dst formats in reset functions
>> -------------------------------------------------------------------------------
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Groups.io Links: You receive all messages sent to this group.
>> View/Reply Online (#41611): https://groups.io/g/kernelci-results/message/41611
>> Mute This Topic: https://groups.io/mt/98657502/1131744
>> Group Owner: kernelci-results+owner@groups.io
>> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
