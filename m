Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DF2797647
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjIGQFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237715AbjIGQFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:05:18 -0400
X-Greylist: delayed 217 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Sep 2023 08:55:39 PDT
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:400:100::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54BE86BD
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 08:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694101777; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JI3FEdA9Zg7+kjt4RT0M7QKIrMpFcOPvUaDPTSJzt7gMgmhmIER3cNgA9iOvS7nyOF
    IEAyyzTihHvi9cHqzvZS8onVHPO5xWUGLWczep9oB6vDQzzkjdMq04cQKsgJK5BYXSXi
    G2+qUGKpnmaYuv/lePxvoj5Fs0zBqoXlr0tM6ab7Vep8JZLuNm/0P/H39v/Z175+sJum
    Gn2YtTgeq1+5WXHLNzic5soNv5GfU4l6GB0yF9Km24aJ5JS9bQVnR+N9RWe5U7MGXk9N
    GudcQEdAN5Ls2+5Jh6jGADu0AKSiUmTm+B/OSPaozaXm3Oqy864CFmdQkAxEEZNOrLK6
    wP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1694101777;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=3rKGw27TN9+S9TbxIx8o4iJIYzSzPaQH4zMebDhdxHQ=;
    b=mHLqSQ4pFxtCcWmDjYTj1+7eUCbr1F0kag8GUFXmCZeQa0STUJOHBTnsG33G0kyRZw
    /JbTXDmVXlCqN+/CuxQhvw6yzp0X+UixOSCLsMeWb5HzSXqyeuTVMrM2IgJHKA8EV4sy
    lNtLA6A4U87ezsSB7adegxVuYGQQ6Lq77VlA/U2Ku9jIQKuoLkDDG/2z572hH/WT067W
    rb80SUY2hN9l5fRUaoKnh5+goW7mHnzk0yVwMWQl2KW8ez97bgWp0jUtbcP9++SOPdsh
    zTSy4ZILbohS9iWXr+JQfAcdivE1ZtOLerBuRscHdl6NP6Tvzp7rtjhx/xsVORCtKuHf
    PfFA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1694101777;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=3rKGw27TN9+S9TbxIx8o4iJIYzSzPaQH4zMebDhdxHQ=;
    b=nJ7QgBccIIePdqaq5lBmh5OB+YyCUphCnDCt/Tr3m6DxuFXakULe8djBFbiqg7d8C6
    NEYlCN1r3nS+C1I+e6jnP8AkNrvEpT5jEAO2KQzzXo9IalebtOZwSLfKvl5E5jiBN6BM
    DpOiZi+UtDszGz8v1joe+P/mL2i/OREeSbI8vUPgMfTA2O1nIRe7K3g8GZGsleuOrxge
    VbTuuiI0QMc5T4o3OM2zfclS8WMXmtWR4wtrYcPFBdvCtIXOvD2Vi1wYk97kUMYdwNuv
    oQXOPxT9K3NwMIiVu4MMLS1zB29Ksk3gwHUIMOOMulXigNu4fG4aP5co7h1CeluKLm/2
    76wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1694101777;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=3rKGw27TN9+S9TbxIx8o4iJIYzSzPaQH4zMebDhdxHQ=;
    b=pA/b6mWfzU9hH8kSVs/GCC+T3qOEGz4q1av17qpyBBr/N25udcjlgHN1VnE6/1mB+x
    v0AXad7bYCIbH7vXpjBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpi8s37ECC6+MJ21gh4qDWMGQa18rzqdHU2PnRc="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id 3b5276z87FnbZW9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 7 Sep 2023 17:49:37 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after dropping the overlay support
Date:   Thu, 7 Sep 2023 17:49:26 +0200
Message-Id: <D8076819-73AC-40D8-82DE-11EC0DA3874E@xenosoft.de>
References: <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
Cc:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Christian Zigotzky <info@xenosoft.de>,
        linux-media@vger.kernel.org
In-Reply-To: <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailer: iPhone Mail (20G75)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On 7. Sep 2023, at 17:23, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>=20
> =EF=BB=BFHi Deb,
>=20
>> On 04/09/2023 13:51, Christian Zigotzky wrote:
>>> On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
>>> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
>>>> On 05/05/2023 08:25, Christian Zigotzky wrote:
>>>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>>>>> If v4l2-ctl fails, then try again
>>>>>> after applying this series:
>>>>>>=20
>>>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995=
256.git.deborah.brouwer@collabora.com/
>>>>> Your patch series solved the issue. Thanks a lot!
>>>> Nice, but somewhat unexpected :-)
>>>>=20
>>>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove dest=
ructive overlay
>>>> support, but it won't have this series yet, that's for 6.5. But that wo=
uld make 6.4
>>>> unusable for you.
>>>>=20
>>>> I might have to revert the overlay removal, at least for bttv.
>>>>=20
>>>> Regards,
>>>>=20
>>>>     Hans
>>> Hans,
>>>=20
>>> You don't need to revert the overlay removal because your patch series w=
ork with the latest git kernel (6.4).
>>>=20
>>> Thanks for your help,
>>>=20
>>> Christian
>>=20
>> Hello Hans,
>>=20
>> I successfully used your patches for the kernel 6.5. Everything works wit=
hout any problems with your patch series from May.
>>=20
>> Your patches have been added with the latest Media updates [1] for the ke=
rnel 6.6.
>>=20
>> The patches works but I have a green bar in the bottum of the window if I=
 use the composite input. [2]
>>=20
>> I don't have this green bar with your May patch series.
>>=20
>> Could you please check your latest patches?
>>=20
>> Thanks,
>>=20
>> Christian
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D307d59039fb26212a84a9aa6a134a7d2bdea34ca
>> [2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png
>>=20
>>=20
>=20
> After some testing and debugging I found this change in the bttv vb2 conve=
rsion
> patch:
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/d785cd8b0d8c19c05f=
caa1536622e2fdd9f8ede3.1689379982.git.deborah.brouwer@collabora.com/
>=20
>> diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8x=
x/bttv-risc.c
>> index 3e0dac56de54..436baf6c8b08 100644
>> --- a/drivers/media/pci/bt8xx/bttv-risc.c
>> +++ b/drivers/media/pci/bt8xx/bttv-risc.c
>> @@ -67,8 +67,10 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem=
 *risc,
>>    /* scan lines */
>>    sg =3D sglist;
>>    for (line =3D 0; line < store_lines; line++) {
>> -        if ((btv->opt_vcr_hack) &&
>> -            (line >=3D (store_lines - VCR_HACK_LINES)))
>> +        if ((line >=3D (store_lines - VCR_HACK_LINES)) &&
>> +            (btv->opt_vcr_hack ||
>> +            (V4L2_FIELD_HAS_BOTH(btv->field) ||
>> +             btv->field =3D=3D V4L2_FIELD_ALTERNATE)))
>>            continue;
>>        while (offset && offset >=3D sg_dma_len(sg)) {
>>            offset -=3D sg_dma_len(sg);
>=20
> It is this change that causes the issue: basically the condition
> (V4L2_FIELD_HAS_BOTH(btv->field) || btv->field =3D=3D V4L2_FIELD_ALTERNATE=
)
> is almost always true (it is only false for FIELD_TOP/BOTTOM), so it is
> as if vcr_hack is always turned on.
>=20
> It looks to me like some debug code accidentally ended up in this patch.
> Reverting this change makes everything look good again (Christian, it woul=
d
> be great if you can confirm that this also fixes the issue for you!).
>=20
> Deb, can you remember anything about this change?
>=20
> Regards,
>=20
>    Hans
>=20
>=20
Hi Hans,

Thanks a lot for your answer.  I will test it as soon as possible.

It=E2=80=99s great, that you support the BTTV driver for old TV cards.

Have a nice day.

Cheers,
Christian

