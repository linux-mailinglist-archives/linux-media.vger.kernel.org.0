Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711911AFE17
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2020 22:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgDSU2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 16:28:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60539 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgDSU2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 16:28:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 18D085C0084;
        Sun, 19 Apr 2020 16:28:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 19 Apr 2020 16:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=m
        8nOJw+Z9F4lReJR0fhjaHFuWCklfpeOw1D2axiYS5c=; b=CBQA0jUorFy+U2ion
        +nSvu4U6qNGJQ/88+0mleR+bp/6Ip+ECV01ulrpX5f9iuZxF7+4oCc+hWfe7SHLY
        Yo71bZ5Tyttjzsv6RvH+F01071cA9KP2F7eZ4VfqMpDwbkTTEm6YsbCAQIYyi6sn
        ydM+joHgL/0r+tS8ajVG5eEaSykGhY/08+viIQnck7s9Y0vqXP5AVqtPovDbE5aS
        yWaVjcnoaphm8po8ASTY5QtlnqrFujg6Ac/+sX9GxBkt+CaXZ4RerwuXHO91k4Ze
        ALVYJlV4kex4GlSt8uTS6NfP2elyZ9dVn3i2bhf7adjzxQsuqBgAiap6zSFZADfE
        M4MGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=m8nOJw+Z9F4lReJR0fhjaHFuWCklfpeOw1D2axiYS
        5c=; b=1V6LqL+G9rWe+iBAO12iSdZJpHfdbV+F57d258JvKaatREgAUaW5jjxe7
        7J7v0bBtUTkpBAhjGtwaE+lHtw01YZhMKfdv1/3BmnYSguwpeAcMKPOHhWf5ryWF
        Vv+plbXxh1Vl1DtHU/PDhADrHefxkf0MPMM+OjgDx6d3HRnNLoATSorQp0KvSaba
        UAue9b81SEVI3zK1reSsLOsxkRiptJ78wXzHToaOOdQ3PHXbvwX7qvYXz6Toe8Y+
        uc8PTTlkEi5wXChYtASIHFAwPgS9QPd872GF/DynaNtomGStWkyeCgyAzae56D7L
        lR7Gz7a4K9FLF0lc6/pKyf+GkTIIQ==
X-ME-Sender: <xms:cLScXkCTuOu9ySV9GVzc68xjDwPHR06azN4xKeTBrucSbxVGvbaQqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgedugdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuff
    homhgrihhnpehgihhthhhusgdrtghomhenucfkphepjedtrddufeehrddugeekrdduhedu
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmh
    huvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:cLScXnnpklh0nQ-dmZ4r-psQBBCylMDDeq2ksZWZ2Lvfq7YdNxqggw>
    <xmx:cLScXqjzYxRRSrxPiwTf4hfSPbVwA9WsLoradNW63lzgO9WYUVvUCw>
    <xmx:cLScXof0MR3FhhSks1aNFis9ueaDV_HJ7yLpa10bKVQg7dRNcaTRbA>
    <xmx:dLScXoa3E7ML7wNvAuTzkkXj5_hg2fGdvfkbUrNmvgdB8cgO5K9mMg>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2F3343280060;
        Sun, 19 Apr 2020 16:28:32 -0400 (EDT)
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20200408010232.48432-1-samuel@sholland.org>
 <9673642.nUPlyArG6x@jernej-laptop>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <244922ec-ed3a-eca7-6640-49de7ad9c605@sholland.org>
Date:   Sun, 19 Apr 2020 15:28:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9673642.nUPlyArG6x@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/8/20 11:01 AM, Jernej Škrabec wrote:
> Hi Samuel!
> 
> Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland napisal(a):
>> This allows the VE clocks and PLL_VE to be disabled most of the time.
>>
>> Since the device is stateless, each frame gets a separate runtime PM
>> reference. Enable autosuspend so the PM callbacks are not run before and
>> after every frame.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>> I tested this with v4l2-request-test. I don't have the setup to do
>> anything more complicated at the moment.
>>
>> ---
>>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
>>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++------
>>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
>>  3 files changed, 88 insertions(+), 37 deletions(-)

[snip]

> Reset above causes problem. When format is set in cedrus_s_fmt_vid_cap() a 
> function is called, which sets few registers in HW. Of course, there is no 
> guarantee that someone will start decoding immediately after capture format is 
> set. So, if the driver puts VPU to sleep in the mean time, reset will clear 
> those registers and decoded video will be in different format than expected. It 
> could be even argued that registers should not be set in that function and 
> that this is design issue or bug in driver.

You're right. I didn't see that cedrus_dst_format_set() was called outside
cedrus_engine_enable/disable().

> Anyway, I made a runtime PM support long time ago, but never do anything 
> besides running few tests:
> https://github.com/jernejsk/linux-1/commit/
> d245b7fa2a26e519ff675a255c45230575a4a848
> 
> It takes a bit different approach. Power is enabled in start streaming and 
> disabled in stop streaming. This is simpler approach and doesn't need 
> autosuspend functionality. I also moved call to a function which sets format 
> in HW registers to start streaming handler, so it's guaranteed to be set at 
> the beginning.

Assuming cedrus_device_run() only gets called between streamon and streamoff
(which appears to be the case), this looks like a better design.

> Note that some registers are only set in start streaming handler. With your 
> approach, if first frame is submitted too late, asserting and de-asserting 
> reset line could reset those registers.

I only see registers being set in cedrus_start_streaming() after your patch,
where you add a call to cedrus_dst_format_set(). I can't find any registers
being written in any of the ->start() callbacks.

I'll send a v2 which combines the two patches: yours which handles the runtime
part better, and mine which handles the probe/remove part better with !CONFIG_PM.

> Best regards,
> Jernej

Thanks for the review!
Samuel
