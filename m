Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3195668797E
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 10:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjBBJuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 04:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjBBJtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 04:49:47 -0500
X-Greylist: delayed 318 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Feb 2023 01:49:21 PST
Received: from mout.web.de (mout.web.de [212.227.15.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FE69757
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1675331360; bh=x9vOfGFcln9TWYCkqZ2KEz6xg8FbqR492Pfu6bOSnrQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Mz+OEteq+abcObqCH6Ga4yi7PXVikjEGR2CMgizobMcYzVPW2AXQiI3p9F+p0RLLP
         xu85iTqKr+dN41dhxCwFq8TRdz6mPzfMisHXakVPpk38+hFdkqn3UfVZZMsqY4hFs5
         RFP0aaAbhpYWCiNQ3N1WpMQdvbtBd/wb5q+JcgYa2c0CzFTdl/OhallEpr2Odwv/jO
         R+x3XMtGgjDoxthcQ4TQ88muswkl5+faNHeTNKBC93lJ8G7R13/dfZaTLS3/NINVDb
         +LjbEYjxeB/BhRt0sBRHrRvzSghH6euptvF6XKfPp7p8SMAASwT2FzeDLYO637rKw8
         a9cXLgoELPRyw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.40] ([77.183.184.129]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MoNVE-1oqRRd1nvk-00ojbW; Thu, 02
 Feb 2023 10:43:33 +0100
Message-ID: <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
Date:   Thu, 2 Feb 2023 10:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Stefan Herdler <herdler@nurfuerspam.de>,
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
From:   Soeren Moch <smoch@web.de>
In-Reply-To: <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SW9jiY8ayJaFPYdPq6i+AEXTzg3wLUm5n/b4orjeBM3roGLz86o
 UQ0HdaEv9e8PZBspQ1zt4W86E9uHiGla2IigFv9PwkU0/8dS6kF9Y8ppYYErQIZsZS1qVMp
 ZbGRmtpLSzjJ6x33oezO3zcxSPkpcftRhYARqze14igiGnsIAeecWIsqOcNbz37a45koEJr
 GvU/AsoJklllE6rB1bhYA==
UI-OutboundReport: notjunk:1;M01:P0:kiLdGJiVpwk=;DbQjra7d4OrYSKImCxx8CNlN056
 zCRQjlHurTDos1kt5LWieN+bklxTVHaMfsrQedDuBIbeZFhJUPEhSd5gfdsH3I1z6r0xw3mtU
 i3X0loYvbBvKqtTTYiBTb1Cow0KfOwJMA26KGEm99YFzNnTMF96wDO9joe9iRSSfgSQHDTlsP
 A+sGxagfQstwoKGXHaUVrlaYTez7R62rkRp3n8eD7s8CRBVVyqKLsb7/3OKrlsvHWeoeMACr9
 7RAsHlPnBkC4oNiECW6hMIz3AuN5rThAt4z9DoSuc5E9kYgcOBkFhwPkvvwoF8Yw8VWm0Zzai
 dBdUPSJ7pHiBcqWD1o67UYaGrkDIOY4DNHIGrAVpbs7vI9iD5BaeV9eTuUXRuuekbBBuFPtRz
 rSFEwAgm+NkxiIsyOjJch4zw9VXPTc4ImSoT6u02N+P1JYrvyP2YPx8PTsRZN9omucuO6O5p4
 C7mIRffNRXPULF7BCGGfCmaSxQGNon5HmkV/4OlRfXa79Wxe1iSFjM4pdYbh2aGLPg4qXTIkl
 ByHzLppXdfAXl6ISAxLVkbBjjql2RuOmX5u6KWe7j/aACEV/jazBm36xM1+TJyg8hgX/EXEDN
 QbYblcTVtl7kd4kmT2HUDt7kMnM5MzXXAoSsHiX94IXBQGA22aTA3/2fdwifC3uYtTUhKa9KB
 lJbqLYDrILvCOJq/JRbvc4opAWL74D/Mh/A+BrTT8vKRyLT6fuMUAVsLe1b8Z8fNoyJjdk8Ki
 jkKN4w0i/7LG1qC9Ha/BjPNthKcSn1OWuCipwDFd41fKRuYmks5KhHaLB3Qg34H3gFp4JNaet
 63fxeBwhyMPDy70uGDKA9MCFPy227E7JJWJFr5r2RQ2wikLW49RKhsH+F1NmbhRiO8e8ACENm
 4F7do7Kcwq20ADQp+x8SVx+ABc65Ixcf6oea5jSvGq/G9jdri11apFvZu9qj9skB6BnkHZPtA
 Dk4wMznC/a9pMKWfECoGPgV9xsM=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan, Hans,

On 02.02.23 00:12, Stefan Herdler wrote:
> Hi Hans, S=C3=B6ren,
>
> On 01/02/23, 10:15 Hans Verkuil wrote:
>
> [...]
>>
>> Once it is converted to vb2 the driver can stay.
>>
>> Note that the driver might need a bit more work: we use the
>> v4l2-compliance
>> utility to test V4L2 API compliance of a driver, and after the vb2
>> conversion the driver should pass this test. So the compliance test
>> might
>> find some other things that do not work as they should, and it would be
>> really good to clean that up as well. Usually the things it finds are
>> pretty
>> easy to fix.
>>
> For the records, as long I remember it:
> The "Buget Patch" driver is superfluous and can be removed.
> This driver is for an experimental hardware-mod which never really
> worked. No such hardware was ever produced.
> I was really surprised to see it.
I own such card, as I wrote earlier. The budget patch works great and is
necessary for such cards. Please keep it.

Regards,
Soeren
>>>
>>> There is a long lasting controversy about the deprecated 3
>>> DVB-API-files
>>> for the av7110 driver.
>>> S=C3=B6ren stated he is tired about that discussions and looking for
>>> permanent solution without having to rewrite the whole driver.
>>>
>>> In this case I'm just the messenger, but I would also prefer a
>>> permanent
>>> solution.
>>> That is why I made the suggestion with the driver specific UAPI file.
>>> The av7110 driver is only driver using this API-part.
>>> And the modification is fairly easy and the impact minimal.
>>>
>>> May that be a compromise all parties can live with?
>>
>> Moving it to a public av7110.h header makes sense to me.
>
> I've done this already.
> Primary for my self to see if and how it may work.
> I'll attach the patch, maybe it is helpful.
>
> Theoretically there shouldn't be a difference whether the headers are in
> 1 or 3 files.
> Unused symbols should be removed by the compiler while optimization the
> result should be identical.
> I was just curious and decided to try it.
>
> Unfortunately I couldn't test it yet. But hopefully next weekend.
> There seems to be an issue with new kernel and my Nvidia graphics-card.
> But the kernel builds and boots into text console.
>
>>
>> It's a nice-to-have in my view, and moving it to a driver-specific API
>> should avoid future discussions. The fact remains that as long as
>> people use this API we can't remove it, however much we would want to.
>>
>> I think the main problem has always been that we are surprised at how
>> many people still use these cards. It's very similar in that respect
>> to the bttv driver: very old, but still in use.
>
> I own one too.
> Such cards can still be handy for digitizing family videos and stuff.
>
>>
>> The difference appears to be that the use of saa7146 cards is confined
>> to a specific region (esp. Germany), whereas bttv is in use worldwide.
>
> Until recently I wasn't aware that there are no saa7146 cards for ATSC
> nor ISDB.
>
>>
>> Because of that we just miss that it is still in use.
>>
>> Having an active maintainer should help with that.
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>
>
>
>
>
> On 01/02/23, 14:51 Hans Verkuil wrote:
>
> [...]
>>
>> It's the analog video streaming that uses vb2, so being able to test
>> that
>> is critical.
>>
> The DVB data always uses one specific of the 2 video ports. The other
> one is not able to handle DVB-data.
> It is always the path through BRS and FIFO3, if I remember correctly.
>
> The analog video data has to use the remaining video port and FIFO1 if a
> DVB-Tuner is present.
> Input data format is YUV and output RGB. At least at the FF cards.
>
> (I may have confused the Ports, but in general it should be correct.)
>
> I don't have a combined budget-card and don't know how the driver
> handles analog inputs. But because of this hardware limitation there
> shouldn't be much difference between the decoded video of the FF and the
> video-input of a combined DVB-budget.
> Maybe testing on a FF is sufficient?
>
>
>> So I decided to do this differently:
>>
>> 1) I'll revert the move of saa7146 to staging, it will go back to
>> =C2=A0=C2=A0=C2=A0 mainline. av7110 stays in staging for now (that migh=
t change, I
>> =C2=A0=C2=A0=C2=A0 just don't want to make more changes than strictly n=
ecessary).
>>
>> 2) I will do the vb2 conversion. I have the analog video hardware,
>> =C2=A0=C2=A0=C2=A0 so I can test this.
>>
>> I didn't want to spend time on that originally, but since these drivers
>> are still in use, it is probably best if I bite the bullet and just
>> do it.
>>
>> I'm now almost done with the vb2 conversion of cx18, and it was about
>> 2 days work, which isn't that bad. I'll try to get this saa7146 vb2
>> conversion done this month.
>>
>> The PR reverting this has just been posted:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/5902a4f2-da31-8=
16c-f3cf-020340dbaddf@xs4all.nl/
>>
>>
>
> Great news, thanks!
>
> Regards
>
> Stefan
>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Hans

