Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AA02A6370
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgKDLjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:39:20 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39793 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726344AbgKDLjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 06:39:18 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id aH8BkUZiL1R0xaH8EkHbkl; Wed, 04 Nov 2020 12:39:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604489956; bh=mdnZSa0WmXZfk5ed1eWFME1f4l9kQcMh77VgrcfApD4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kTRiRf3GpRFhToP6+XRzrwFkkJixo+CH6443unrnjpqP82RKtm1nAd1F6fFQJ9ndY
         uBxCrDG7P1683wp4gI0iw+R8EpnIJ9AIrdkotPSO2lJk3qdiI6w1s+x3f1qHicn492
         BeIrp+w6Szqr7r7zUWBXNEogHkgKD/vxPLnA69OyESFpJ4wg30/9SHnlAfflvR8Ien
         fAh/sYaIFyCpEtRJg+wvikoJQXZS00y8fTeD6Mqew20leH91ccqIKbsctlpfkVF8A6
         RT5dL4aLjEoz6BdNrMChGwp+cjjlB0ABQez6SBrBF8Ac+ZF/ypoIRMCfDl4DAQz5GO
         9m6sa7+EcfLIQ==
Subject: Re: [PATCH -next] media: cedrus: fix reference leak in
 cedrus_start_streaming
To:     Maxime Ripard <maxime@cerno.tech>,
        Zhang Qilong <zhangqilong3@huawei.com>
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
References: <20201102142622.140001-1-zhangqilong3@huawei.com>
 <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2eb14a6d-4680-1527-0985-fd371e3ba2e8@xs4all.nl>
Date:   Wed, 4 Nov 2020 12:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHnm1YGEr/RL/TXp1tttD+GAZZyHHWk1WlJeiQrV/C0vXFNGKNVWjziqTHNlo/Bszim8YO5CEndN2OR0gRoSV0c2NPQMcMzremP4uqAB9IA0FmHu4Hg3
 SGQcuV8YrspMC4g/ZTbsPp42wnJLAxRttFugaibMAcQVCRsBHtcRA0HHqoCTWh1Vm+UzPIbrL+1Xu3t0PUCqhgFFewThVAv9DmVlVUqDHL1Q7q9qNtZtcDFd
 3mMZ1xA9EulkP6M3MGzdsIfoIDP9gwFepjewYMBwRx2Y9qD++ex/8kykyw6jlw7AJYelBQ9Z8tOk4sLBEg8USjFBLBcmSjWKklxSRuunNCbjG1eX1vs9vh2r
 OLzsAvKTC0xcGK4Ver7xwLPyHuX8Sjy+8omD53tEGS1gBEq3yjQWvSfs6bPVZsfwPQWGSROJ95AGirHY/8SI60QO4I+btg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 15:18, Maxime Ripard wrote:
> On Mon, Nov 02, 2020 at 10:26:22PM +0800, Zhang Qilong wrote:
>> pm_runtime_get_sync will increment pm usage counter even it
>> failed. Forgetting to pm_runtime_put_noidle will result in
>> reference leak in cedrus_start_streaming. We should fix it.
>>
>> Fixes: d5aecd289babf ("media: cedrus: Implement runtime PM")
>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> 
> Shouldn't we fix pm_runtime_get_sync instead then? It seems that most of
> the callers get this wrong, and that's definitely non-obvious.

It's been discussed before, but nobody stepped up to address this
issue. In the end I decided to just accept media patches that fix this
in the drivers rather than waiting for some mythical future core fix.

Nor do I think that you can just 'fix' pm_runtime_get_sync, since
then you will get cases where pm_runtime_put is called once too
often.

Regards,

	Hans

> 
> Maxime
> 

