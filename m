Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA6C688C2F
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 01:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBCA6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 19:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjBCA6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 19:58:11 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427B222DC0
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 16:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1675385883;
        bh=3n6dfAJZN2gDueFDmaWT9FC71MXkxU2Lg+sQc1nmQ6Q=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=jD6rw4Iamh9/wNErqCk9ecBc3nBgHe6OQaI0FFI+tXrDY+XGgKp8x+zJIK64CEkkq
         32hFHSpyozhbbGY2o5MS4gwadc0Ookypu4nWidGZ/u41qOdbhfTUDj6DGGBmBzwpZR
         mha9I98ANdRjY+wmp79uKPOrR6XNGN+aXK6N/BpdB1HFuqIHTIvwjAzvPrT9ePQWXV
         jj2g4v+QVxlvbUiOeinP28rt8fReW5pGzyUmQHg94KdyMUvhdoSLLoMsOsHkKC0sdE
         2SSeGgI2o9JSbr1J2oHqEfLYlOGgRJO5c/I2AL7QCC8XSK3A64OdpvIn2DvR9TAoHC
         io0Geo6g7xIvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([91.132.221.242]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1pKR0x2qx2-003JzZ; Fri, 03
 Feb 2023 01:58:03 +0100
Message-ID: <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
Date:   Fri, 3 Feb 2023 01:58:03 +0100
MIME-Version: 1.0
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
In-Reply-To: <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RiuUfjkGKhL4fVqcZ78UojBLD0KJOUUUFmaQcPdfDtcJHEJeoPn
 ae619JSKr18lbwR6v2uaTYwW+bTmgB0D/ZM6PX+YiibO03YyK0Zc/8jgSndmUT00baBdUkB
 PlvwSJCiOApp/5fJ0JIjBtijHz+P/t3MYynbThDkFUm6vyxPntYj/ep9mFr0oU8d5SGWq4E
 7lhxRJBQgO/T4FBsVaLTQ==
UI-OutboundReport: notjunk:1;M01:P0:zkCR6TnPhkY=;J2A2dYOsZhMbeWKbk/dg9NgA85Z
 WMmh93UGJCWVsXtsQHcUSNGpwfNWBwQ9lIgo3HxLvoTmrKoiqBm6N2VcgmRydr3HUlw6yyntB
 ExnndqmMt7kSyuNpnY6Bi1yVfGt4ue9HE2DNUP6afAAU9KE8rbvqlyaV7BiEUXV26k821Sym2
 1twRzTF4UhsLvJcX6EbWM5dmrBnvuiPMOmJN9hs7sB+HQowEApSU2c1SXnGFIzSPCIE/Lsm8L
 ufA4gDDWWTkf/kgDnBcp3nAYWNd8m6dZE1QdCfVQRVdeHTGUKzmsWeF18RNm+TNVL9zgwRSAc
 wxYuVNV9UVvR0BIyhY0616cCF8r/Aak95Bp1x4j5eqRT7EJ0psHeYRMbcPBFhUuOeeHdN0j5Z
 UQ5T8Qlz4UzdQXl/kYL6noGGKwFRagkQqMW9uSgrqGqtnQh2BDaB94AAfsuvubk+fi9dArMgV
 S92OGkuTEUqpNqa4c5e/8xhdzMrTP7zfVUBg+/DrbaWOlA08i36HcCkKQh9MUv3mvBtvz33tn
 VFosU7EtyJ1jWN61Ydc7G/n0EZXVFT8ZC4FAj/lSMYOHWrpIAOe6gYZJ1X+SWF0uY00bSY/6P
 kGan9azCb6B03HFkJN3eQahCblweXbcS0VrrFgJtYFrQu007Rju+2YayOXL0Q1QjPY2gdbaxY
 rKTlEl5ohqDsCrZUmWV0JMH5XfbAtejieBuywtPJGvycora4ukYpA7OFfAm7ShCpogV3UDlRN
 EIWQzh/9sOn8rB1dtbbccLivWsOZdAr5kHeNQR4GPss6qGwWCU4TqzetKjyzOqQWKIHbCPtJu
 F87QR+du/LFqxDVFYZlHkzy+aeIMkqDhPiqIdo6VzZJir2Fhozke9X2VPkCJMyC/r08ZaphEE
 dgebhreq0xj9+1k7itAEcmADvCeATfQn0qdbAeR8cHD/0c2Veu/FyB1j0dJ0j6XdGMvGkewQ4
 teFOYnWcaxz7sZNustOdORHkco4=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

It's me again, sorry.

S=C3=B6ren wrote to me that he dislikes the idea of driver specific
headerfile and will refuse to maintain the driver if there is any change.

I can't tell more, I'm just the messenger, sorry.

Regards,
Stefan



On 02.02.23 22:26, Stefan Herdler wrote:> Hi Hans, S=C3=B6ren,
>
> On 02/02/23 10:43, Soeren Moch wrote:
>> Hi Stefan, Hans,
>>
>> On 02.02.23 00:12, Stefan Herdler wrote:
>>> Hi Hans, S=C3=B6ren,
>>>
>>> On 01/02/23, 10:15 Hans Verkuil wrote:
>>>
>>> [...]
>>>>
>>>> Once it is converted to vb2 the driver can stay.
>>>>
>>>> Note that the driver might need a bit more work: we use the
>>>> v4l2-compliance
>>>> utility to test V4L2 API compliance of a driver, and after the vb2
>>>> conversion the driver should pass this test. So the compliance test
>>>> might
>>>> find some other things that do not work as they should, and it would =
be
>>>> really good to clean that up as well. Usually the things it finds are
>>>> pretty
>>>> easy to fix.
>>>>
>>> For the records, as long I remember it:
>>> The "Buget Patch" driver is superfluous and can be removed.
>>> This driver is for an experimental hardware-mod which never really
>>> worked. No such hardware was ever produced.
>>> I was really surprised to see it.
>> I own such card, as I wrote earlier. The budget patch works great and i=
s
>> necessary for such cards. Please keep it.
>>
> I think you confused it with is successor "fullTSmod" which works great
> indeed.
>
> The support for the "fullTSmod" is implemented in the "dvb-ttpci" kernel
> module.
> The "Buget Patch" driver is an separate kernel module.
>
>  From Kkonfig:
> config DVB_BUDGET_PATCH
>  =C2=A0=C2=A0=C2=A0=C2=A0[...]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Support for Budget Patch (full TS) modif=
ication on
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SAA7146+AV7110 based cards (DVB-S cards)=
. This
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver doesn't use onboard MPEG2 decoder=
. The
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card is driven in Budget-only mode. Card=
 is
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required to have loaded firmware to tune=
 properly.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Firmware can be loaded by insertion and =
removal of
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standard AV7110 driver prior to loading =
this
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver.
>
> I my self own and operate a card with "fullTSmod" too. An I did some
> mods for others.
> I never loaded the "Buget Patch" driver.
> And the kernel module it isn't loaded on my VDR. I checked it right now
> again.
>
> I removed the "budget-patch.ko" and everything kept working like usual.
> Ill keep an eye on it.
>
> Regards,
> Stefan
>
>
>
>
>> Regards,
>> Soeren
> [...]
