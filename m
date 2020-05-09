Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029251CC471
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 22:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgEIUMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 16:12:18 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59775 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728420AbgEIUMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 May 2020 16:12:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 69CAD51A;
        Sat,  9 May 2020 16:04:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 09 May 2020 16:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
        Eu1xYhVh1J9scHqnTyhXAX973gnleovZHMHNnlRJvU=; b=YLH+5XfxeNoqxPEhx
        lg7HVYOQzWgAHO/V1Rth7iTd0aRp9UUjwNxIqbNLoCCPACm7XDjhBdCQVvjZvAmN
        Qj0+XYI0hZPuI4nt8wFPY90EJbf2Wh5V8AoEaKJVt2JfLUE2QhlEqYMoFhagWLYn
        MAa+DRkFENaEDy46fUfTjM2S1xL5NOPD9Fa8Paus5xtsu/V/+6JIf3WESCdqsk1q
        AV/V1X0He+c1mJXF9+w9iyTOhD8HxiQKjtbDGvmrvRiO0PNdGmeuGJPC+68dc002
        bLIxvUofw3e+3iZ5XP9l9jFa9wneH7tgnXZhmHQmFyTOqlxW4eooeX4OKAS1oaR1
        Geadg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=DEu1xYhVh1J9scHqnTyhXAX973gnleovZHMHNnlRJ
        vU=; b=ds+96DIME0pz5ne+oIUNuar/qLTa/vcpv2GDAtH9nRwstAyxkaqzfzJ4e
        qUFogdKaGr973RslWFEHbfvp1x70jKqW7b07SskLEL+Y8pWqFjtXMflJoXZxkrUM
        gwqCrVo/b9BbHyRkBqBw0QNCwrTyITQdkM0UcQyZzC+JH8Z6mj8qLmwf2IbORWU8
        /H4XktWnxrE6GEIIjHwVAp/Df/YgswSqtQ0Vkl1uCxoUpS7UH83Xmibo1yEPWMBt
        UTpOOo5a2S6qqFTZMqBq6QxgQpFmljRmPQjpOMwctAN4dzSHs4Mc6V0mI8PWEgUO
        LQ2bfhtIPRp+3cHPEEAyNKv9kCm8g==
X-ME-Sender: <xms:rAy3XjQPW4KE5BjjcX3sy4azS0KiYTgvyBevwy-tpOfNYIjrS6wYpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeehgddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
    udetteelieejnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:rAy3XtWFJsn1ugLKawvNOs1ecseNcV8ZsKifycbtyIkMQ97o1o3hDg>
    <xmx:rAy3Xv79-fSTd5mfrUKdpJO0WvvD5LeRB-jMCJUP2LJWspcYDbXHSg>
    <xmx:rAy3XoG2nm_Yi_-7jyfwec8t8R_kgaqMfKfZ7DTav5bOAtW6TB02Mg>
    <xmx:sQy3Xvb0p7cCpi1x8QY3uLfRyaEXZ3_I7qjtiMV-RD29fIGYxGpqcXKCiok>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 25ED6306623E;
        Sat,  9 May 2020 16:03:56 -0400 (EDT)
Subject: Re: [linux-sunxi] [PATCH v2 2/2] media: cedrus: Implement runtime PM
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-sunxi@googlegroups.com,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>
References: <20200422040410.6251-1-samuel@sholland.org>
 <20200422040410.6251-2-samuel@sholland.org>
 <CAAEAJfBdRVZwvEZNU_Hu4eutOO5HJzLLU2HJ2OcP=L+pBZfiTg@mail.gmail.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <e3bba831-f835-d35b-58a3-c4b6b22c8949@sholland.org>
Date:   Sat, 9 May 2020 15:03:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfBdRVZwvEZNU_Hu4eutOO5HJzLLU2HJ2OcP=L+pBZfiTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/5/20 7:53 AM, Ezequiel Garcia wrote:
> On Wed, 22 Apr 2020 at 01:00, Samuel Holland <samuel@sholland.org> wrote:
>>
>> This allows the VE clocks and PLL_VE to be disabled most of the time.
>> A runtime PM reference is held while streaming.
>>
>> Originally-by: Jernej Škrabec <jernej.skrabec@gmail.com>
> 
> Originally-by is not documented, perhaps just go with Signed-off-by,
> as Jernej suggested.
> 
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>> v2: moved PM reference to cedrus_{start,stop}_streaming, based on an
>>     earlier patch by Jernej Skrabec. Removes the need for autosuspend.
>>     I tested this with running 2x v4l2-request-test in parallel.
>>
>> ---
>>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
>>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 106 ++++++++++++------
>>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
>>  .../staging/media/sunxi/cedrus/cedrus_video.c |  33 ++++--
>>  4 files changed, 104 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
>> index 05a85517ff60..bc27f9430eeb 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/pm.h>
>>
>>  #include <media/v4l2-device.h>
>>  #include <media/v4l2-ioctl.h>
>> @@ -551,12 +552,18 @@ static const struct of_device_id cedrus_dt_match[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, cedrus_dt_match);
>>
>> +static const struct dev_pm_ops cedrus_dev_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(cedrus_hw_suspend,
>> +                          cedrus_hw_resume, NULL)
>> +};
>> +
>>  static struct platform_driver cedrus_driver = {
>>         .probe          = cedrus_probe,
>>         .remove         = cedrus_remove,
>>         .driver         = {
>>                 .name           = CEDRUS_NAME,
>>                 .of_match_table = of_match_ptr(cedrus_dt_match),
>> +               .pm             = &cedrus_dev_pm_ops,
>>         },
>>  };
>>  module_platform_driver(cedrus_driver);
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>> index daf5f244f93b..1744e6fcc999 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/dma-mapping.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/clk.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/regmap.h>
>>  #include <linux/reset.h>
>>  #include <linux/soc/sunxi/sunxi_sram.h>
>> @@ -140,6 +141,64 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>>         return IRQ_HANDLED;
>>  }
>>
>> +int cedrus_hw_suspend(struct device *device)
>> +{
>> +       struct cedrus_dev *dev = dev_get_drvdata(device);
>> +
>> +       reset_control_assert(dev->rstc);
>> +
>> +       clk_disable_unprepare(dev->ram_clk);
>> +       clk_disable_unprepare(dev->mod_clk);
>> +       clk_disable_unprepare(dev->ahb_clk);
>> +
> 
> You can use clk_bulk API here.

Since this change is already tested, I'd prefer to do that as a separate patch.

>> +       return 0;
>> +}
>> +
>> +int cedrus_hw_resume(struct device *device)
>> +{
>> +       struct cedrus_dev *dev = dev_get_drvdata(device);
>> +       int ret;
>> +
>> +       ret = clk_prepare_enable(dev->ahb_clk);
>> +       if (ret) {
>> +               dev_err(dev->dev, "Failed to enable AHB clock\n");
>> +
>> +               return ret;
>> +       }
>> +
>> +       ret = clk_prepare_enable(dev->mod_clk);
>> +       if (ret) {
>> +               dev_err(dev->dev, "Failed to enable MOD clock\n");
>> +
>> +               goto err_ahb_clk;
>> +       }
>> +
>> +       ret = clk_prepare_enable(dev->ram_clk);
>> +       if (ret) {
>> +               dev_err(dev->dev, "Failed to enable RAM clock\n");
>> +
>> +               goto err_mod_clk;
>> +       }
>> +
>> +       ret = reset_control_reset(dev->rstc);
>> +       if (ret) {
>> +               dev_err(dev->dev, "Failed to apply reset\n");
>> +
>> +               goto err_ram_clk;
>> +       }
>> +
>> +       return 0;
>> +
>> +err_ram_clk:
>> +       clk_disable_unprepare(dev->ram_clk);
>> +err_mod_clk:
>> +       clk_disable_unprepare(dev->mod_clk);
>> +err_ahb_clk:
>> +       clk_disable_unprepare(dev->ahb_clk);
>> +
>> +       return ret;
>> +}
>> +
>>  int cedrus_hw_probe(struct cedrus_dev *dev)
>>  {
>>         const struct cedrus_variant *variant;
>> @@ -236,42 +295,17 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>>                 goto err_sram;
>>         }
>>
>> -       ret = clk_prepare_enable(dev->ahb_clk);
>> -       if (ret) {
>> -               dev_err(dev->dev, "Failed to enable AHB clock\n");
>> -
>> -               goto err_sram;
>> -       }
>> -
>> -       ret = clk_prepare_enable(dev->mod_clk);
>> -       if (ret) {
>> -               dev_err(dev->dev, "Failed to enable MOD clock\n");
>> -
>> -               goto err_ahb_clk;
>> -       }
>> -
>> -       ret = clk_prepare_enable(dev->ram_clk);
>> -       if (ret) {
>> -               dev_err(dev->dev, "Failed to enable RAM clock\n");
>> -
>> -               goto err_mod_clk;
>> -       }
>> -
>> -       ret = reset_control_reset(dev->rstc);
>> -       if (ret) {
>> -               dev_err(dev->dev, "Failed to apply reset\n");
>> -
>> -               goto err_ram_clk;
>> +       pm_runtime_enable(dev->dev);
>> +       if (!pm_runtime_enabled(dev->dev)) {
>> +               ret = cedrus_hw_resume(dev->dev);
>> +               if (ret)
>> +                       goto err_pm;
>>         }
>>
>>         return 0;
>>
>> -err_ram_clk:
>> -       clk_disable_unprepare(dev->ram_clk);
>> -err_mod_clk:
>> -       clk_disable_unprepare(dev->mod_clk);
>> -err_ahb_clk:
>> -       clk_disable_unprepare(dev->ahb_clk);
>> +err_pm:
>> +       pm_runtime_disable(dev->dev);
>>  err_sram:
>>         sunxi_sram_release(dev->dev);
>>  err_mem:
>> @@ -282,11 +316,9 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>>
>>  void cedrus_hw_remove(struct cedrus_dev *dev)
>>  {
>> -       reset_control_assert(dev->rstc);
>> -
>> -       clk_disable_unprepare(dev->ram_clk);
>> -       clk_disable_unprepare(dev->mod_clk);
>> -       clk_disable_unprepare(dev->ahb_clk);
>> +       pm_runtime_disable(dev->dev);
>> +       if (!pm_runtime_status_suspended(dev->dev))
>> +               cedrus_hw_suspend(dev->dev);
>>
>>         sunxi_sram_release(dev->dev);
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
>> index 604ff932fbf5..45f641f0bfa2 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
>> @@ -22,6 +22,9 @@ void cedrus_engine_disable(struct cedrus_dev *dev);
>>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>>                            struct v4l2_pix_format *fmt);
>>
>> +int cedrus_hw_suspend(struct device *device);
>> +int cedrus_hw_resume(struct device *device);
>> +
>>  int cedrus_hw_probe(struct cedrus_dev *dev);
>>  void cedrus_hw_remove(struct cedrus_dev *dev);
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> index ed3f511f066f..16d82309e7b6 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> @@ -13,6 +13,8 @@
>>   * Marek Szyprowski, <m.szyprowski@samsung.com>
>>   */
>>
>> +#include <linux/pm_runtime.h>
>> +
>>  #include <media/videobuf2-dma-contig.h>
>>  #include <media/v4l2-device.h>
>>  #include <media/v4l2-ioctl.h>
>> @@ -450,12 +452,24 @@ static int cedrus_start_streaming(struct vb2_queue *vq, unsigned int count)
>>                 return -EINVAL;
>>         }
>>
>> -       if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
>> -           dev->dec_ops[ctx->current_codec]->start)
>> -               ret = dev->dec_ops[ctx->current_codec]->start(ctx);
>> +       if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
>> +               ret = pm_runtime_get_sync(dev->dev);
> 
> It's entirely up to you, but you could do get_sync/put
> between .device_run, as everything should happen
> in the context of v4l2_m2m_ops.device_run.
> (In that case, I believe you'd want to enable autosuspend.)
> 
> Not sure there's much to gain from an power consumption
> pov, though.

Agreed. Either you have a short autosuspend delay, and get per-frame latency; or
a longer delay, and the hardware is on for the entire stream anyway. So I don't
think it's worth the overhead.

> With the Originally-by changed:
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Thanks,
> Ezequiel
> 

Thanks,
Samuel
