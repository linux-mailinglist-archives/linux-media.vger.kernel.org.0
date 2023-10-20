Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2F17D13DC
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 18:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjJTQRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 12:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjJTQQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 12:16:59 -0400
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA6DD6E
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 09:16:57 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w1.tutanota.de (Postfix) with ESMTP id C774FFBFA8A;
        Fri, 20 Oct 2023 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697818615;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=PBZpj8la1+tUBtviUSF2I2WasZb0L0UAQoUNKjSwIHA=;
        b=YYzcLgfWvmuruC4yiuBFv5KF76p1sWKLTjqXmR0rc22W9mYMQqyOkZI5l10d/ZKN
        crwNEI6j+rqF7PlzDpktKeH++XpaCe/HFuJCCjqEU2gQ1XtUSW5HP4F2Dp1t/zSnb8V
        eaD2mc30/bj0+F6lbPNSISu5H84AtCSZRQTwjRb0G3VWlutmnw5Ux6Z6v1675ojO/GS
        6VMayriBJE8CKvqIk4N+masnLMz7js68uVh9Fk71u3/D+6anMOuF221u2OsEy5zprhZ
        Qv6oLXIiGOsvfn1jywoS/pBSj6lnx7yTVSzHJGZ73vdh4mJpi8v48qmSarko+xvHJjK
        JhzgOE6HKQ==
Date:   Fri, 20 Oct 2023 18:16:55 +0200 (CEST)
From:   Karel Janda <karel1@tutanota.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media <linux-media@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <NhCs0vd--3-9@tutanota.com>
In-Reply-To: <NhCPsL5--7-9@tutanota.com>
References: <20231019222430.17043-1-laurent.pinchart@ideasonboard.com> <NhCPsL5--7-9@tutanota.com>
Subject: Re: [PATCH] media: uvcvideo: Pick first best alternate setting
 insteed of last
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Hi Laurent,

=C2=A0=C2=A0 I think again and I have more good news:
I installed patch for uvc_video.c=C2=A0 on running kernel from
 https://kernel.ubuntu.com/mainline/v6.6-rc5/

Patch works as expected, with working video on Newmine camera=C2=A0 at my
Linux karel1-HP-630 6.6.0-060600rc5-generic #202310081731 SMP PREEMPT_DYNAM=
IC=20
Sun Oct=C2=A0 8 21:38:25 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

insmod uvcvideo trace=3D0x400 #logs into kernel.log:
[ 1223.890865] usb 2-1.1: Found UVC 1.00 device Newmine Camera (0402:8841)
[ 1223.917166] usbcore: registered new interface driver uvcvideo
[ 1339.107555] usb 2-1.1: Device requested 320 B/frame bandwidth
[ 1339.107566] usb 2-1.1: Selecting alternate setting 1 (1024 B/frame bandw=
idth)
[ 1339.115788] usb 2-1.1: Allocated 5 URB buffers of 32x1024 bytes each
So we all can be sure, that patch is OK also for 6.6 Linux kernel.

sincerely

Karel Janda


20. 10. 2023 16:09 od karel1@tutanota.com:

> Hi Laurent,
>
> =C2=A0you pleased me very much, also for your quick reply.
>
> 1)
> =C2=A0 The patch is exactly the same as final state of my debugging.
> I just succesfully probe it against > uvc_video.c <https://elixir.bootlin=
.com/linux/v6.6-rc6/source/drivers/media/usb/uvc/uvc_video.c>>  source on m=
y PC running
> Linux HP-Pro-A-MT 6.5.0-9-generic #9-Ubuntu SMP PREEMPT_DYNAMIC
> Sat Oct=C2=A0 7 01:35:40 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
> with Newmine camera.
> /The patch also doesn't hurt my other UVC 1.0 camera, Genius Qcam 6000./
> All my 6.5.0 uvc*.c=C2=A0 files in uvc directory are clean of any other c=
hanges I used for tests before,
> only the path of one single line in one file is there now.
>
> =C2=A0 Now I also carefully compare 6.5.0 > uvc_video.c <https://elixir.b=
ootlin.com/linux/v6.6-rc6/source/drivers/media/usb/uvc/uvc_video.c>>  origi=
nal=C2=A0 (before the patch) with currect Linux sources at
> https://elixir.bootlin.com/linux/v6.6-rc6/source/drivers/media/usb/uvc/uv=
c_video.c
> and also at
> https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_v=
ideo.c
> =C2=A0=C2=A0 These are different only in few blank characters :)).
>
> =C2=A0 I am not able to run last git 6.6 kernel just now, but I hope that=
 my verification by 6.5.0 will be enough.
> If is necessery - let me now, I will try compile last kernel on different=
, dedicated computer.
> (I never work with such a big git project. I sometimes used other's ppa r=
esults.)
>
> 2)
> =C2=A0 You can mention my name in linux git history, I will be glad.
>
> best regards
>
> Karel Janda
>
>
> 20. 10. 2023 0:24 od laurent.pinchart@ideasonboard.com:
>
>> ---
>> Karel, could you please test this patch ? Please also let me know if you
>> are fine having your name recorded in the kernel git history with the
>> Reported-by and Suggested-by tags above. If not, I will drop them.
>> ---
>> drivers/media/usb/uvc/uvc_video.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/u=
vc_video.c
>> index 28dde08ec6c5..7cbf4692bd87 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -1954,7 +1954,7 @@ static int uvc_video_start_transfer(struct uvc_str=
eaming *stream,
>>
>> /* Check if the bandwidth is high enough. */
>> psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
>> -=09=09=09if (psize >=3D bandwidth && psize <=3D best_psize) {
>> +=09=09=09if (psize >=3D bandwidth && psize < best_psize) {
>> altsetting =3D alts->desc.bAlternateSetting;
>> best_psize =3D psize;
>> best_ep =3D ep;
>> --
>>
>
>

