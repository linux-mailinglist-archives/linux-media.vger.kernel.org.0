Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAEE6888F3
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 22:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbjBBV0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 16:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjBBV0N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 16:26:13 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209073056
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1675373166;
        bh=mkbaBTwqT19WcJzevld9bN+d6un5qusMdbEc4Apt+CI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=O7mlQPBjM8xEgKE4ILoIIt/Zm0lhzMThczAfyEQpGk+AKFoT0GnkM1spZJMj3xMsA
         Ch9JZ2bhWjOifkEhr6W1dvvs3xpRGFb8dhNHegdzuPVZJzqqHgVHyy0l+iToY3LNLq
         t6mGIs4TJqyDB7nIb2bn2H8neaBVlKo20sYOJgcfOzmKmAxacRQiGK637hTG+qdfND
         e/NNWSGHS9/Oo1PAZEhMR6de3MVjOC4tZwHA7amSQev8NVgclz7JxRpdPvzXU5wATH
         I89oq+zqnPZH4xf/EfxOdZIZTm2xK1MBfZ//bAUSUNozWTac1Z+veMv/JswwiQDnYW
         dAgzRz5nAYkgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([91.132.221.242]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1ouN4l31Rt-00lmJm; Thu, 02
 Feb 2023 22:26:06 +0100
Message-ID: <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
Date:   Thu, 2 Feb 2023 22:26:06 +0100
MIME-Version: 1.0
Subject: Re: Future of the SAA7146 drivers
To:     Soeren Moch <smoch@web.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
Content-Language: de-DE, en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:210W0B1NEl60LNlm2m9GL6cURaxIjgaQhBLHJDXnTDWzg83pX9m
 AFVLmOyGnIeksVwBre+QcaV7POYEdB+o1oUOepFeGnjoRuaSaPQF5KNfyocspihv/VgU+GU
 IUeurKdzfPryoffU5455ldQmOKLOWqcWHxJhmZfjKUHdRwywFa4awGT98IQBDG8Ga9IzVaq
 FaIU9laFA1FIzrGJ68TXA==
UI-OutboundReport: notjunk:1;M01:P0:IFGHwDTVB7w=;NNlNzaPuPKDl092JvaoFKwVVolX
 /H2qo1OrakjX164oYwmluL+yhpAeu09YoH3aqMJLZQ0bd3ffqDD+nOpdAB2MP7AowOYtGXTcZ
 qD3MzguX8mSww/AtzQtpa4yzVl8bq+R2A+paG195mFN7az+0/CIrimkvoFqEjcfdOo13lSEmY
 8MB/HmkBFF/4yPSSrfcVkVWLdlBrKfRTGUkmTnCSPBJfIsirI98YEUHTN+5p7X5Z3WuGZavWT
 VQQ0/zD4BBmixHiqcvl0cZoqMRKQUwPNBLFcLkIZKsDpQM5loL38xG9KNlmpK3/YRvOrN+xSC
 PoybXXNsSisveCNpP1s+kHpF/9KWJ07UsY4ksp7ziHqaKD38lRmhZIEuTppbLaEc0xUDIDGyc
 4lLUDJkHgTE0Rc40wdSPldGFrWYRydNJd+QS5knv0JSk4jvDHZ+pcCsvrK1dWgPUlw9G7jIGF
 bNioYm2eiorjk6Wuk39z9AdKZQn63LkfReJT9a6E2b5wDVEDXF3PVKsXBXCz1cpNi7JUztftd
 LqS0TBrevWaobRWvE2GeXpmDPPDeU+NeXwVZKywX9Axj6cVjCf6RYejl8GeQvRnZq9KeeNw6y
 5HGrWm2K0xBT7gXEPl1GBKFXDTOIToMTLnVWF8CA5KN/TtNSZYvg9tkdyBihR28ZhU+5PT6QN
 ngmSHlTIB1LKW2VONz0c1R+qPhvmuZPEnuaFiV/5pwwvWsM8JpvejlyYC+bn+7YyjYwhyYYfr
 iVZ2mKYq5lkF+ex/sl4RQBZubdQYyIoL8tVyStn935elQHoPLIBlIhpxKPWN+G8auI37ZcIRf
 SaAZCaZDzq2zhtfQFnQcP0hDn22JbgAusQ0Wr+XNe8IhRyPyAh9nLFK4WFBfCPIID50KXVJJF
 fA+8mqqV+3rAiPc06IwKeYatRVg1bB3Y56LCzLT7W+JEcC9OnhaQQBtpD3NQ9Mx4W/E70wl/W
 D31P/PMLZfD9QDQj82HGIMJRTZM=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, S=C3=B6ren,

On 02/02/23 10:43, Soeren Moch wrote:
> Hi Stefan, Hans,
>
> On 02.02.23 00:12, Stefan Herdler wrote:
>> Hi Hans, S=C3=B6ren,
>>
>> On 01/02/23, 10:15 Hans Verkuil wrote:
>>
>> [...]
>>>
>>> Once it is converted to vb2 the driver can stay.
>>>
>>> Note that the driver might need a bit more work: we use the
>>> v4l2-compliance
>>> utility to test V4L2 API compliance of a driver, and after the vb2
>>> conversion the driver should pass this test. So the compliance test
>>> might
>>> find some other things that do not work as they should, and it would b=
e
>>> really good to clean that up as well. Usually the things it finds are
>>> pretty
>>> easy to fix.
>>>
>> For the records, as long I remember it:
>> The "Buget Patch" driver is superfluous and can be removed.
>> This driver is for an experimental hardware-mod which never really
>> worked. No such hardware was ever produced.
>> I was really surprised to see it.
> I own such card, as I wrote earlier. The budget patch works great and is
> necessary for such cards. Please keep it.
>
I think you confused it with is successor "fullTSmod" which works great
indeed.

The support for the "fullTSmod" is implemented in the "dvb-ttpci" kernel
module.
The "Buget Patch" driver is an separate kernel module.

 From Kkonfig:
config DVB_BUDGET_PATCH
	[...]
	  Support for Budget Patch (full TS) modification on
	  SAA7146+AV7110 based cards (DVB-S cards). This
	  driver doesn't use onboard MPEG2 decoder. The
	  card is driven in Budget-only mode. Card is
	  required to have loaded firmware to tune properly.
	  Firmware can be loaded by insertion and removal of
	  standard AV7110 driver prior to loading this
	  driver.

I my self own and operate a card with "fullTSmod" too. An I did some
mods for others.
I never loaded the "Buget Patch" driver.
And the kernel module it isn't loaded on my VDR. I checked it right now
again.

I removed the "budget-patch.ko" and everything kept working like usual.
Ill keep an eye on it.

Regards,
Stefan




> Regards,
> Soeren
[...]
