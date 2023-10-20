Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD31F7D1135
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377512AbjJTOJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 10:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377457AbjJTOJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 10:09:39 -0400
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD97519E
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 07:09:36 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w1.tutanota.de (Postfix) with ESMTP id 8B5FAFBFB90;
        Fri, 20 Oct 2023 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697810974;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=JcTEc9WMtEGFM9b2cfBced4zbmTXooH/CmhtrCG2+dA=;
        b=oXyJ6JpUwNF2yL6iAeFuh6LajB7jkRf7nMOuvT31l2f0yyId++grWANWw5amDtfO
        m9poyunMp2D+TbBj8xQ6UA4z4wJ4q0J721PepQBrg1VDCUov8tG1oePY7PaRVkzHQTf
        VgsvksgLbAHeFLZ+GD+5+8QqA5INLwHiwVtHj9byQyoDmJ2WcqdSGCtlAIRgqfOi8m0
        kcjnzaRg3b8T68RW0uxoI0WocdIEA8uVSdu6vtcri5KQW83CZSr3T0Sulfd30l17gVy
        7hZPFoZulzlzTDOWA0RxuiFzZ9zkuov4Ql7teFFobXLvNNPFPPihvARUkGMGVz+Y4Do
        YHtY5KPnhQ==
Date:   Fri, 20 Oct 2023 16:09:34 +0200 (CEST)
From:   Karel Janda <karel1@tutanota.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media <linux-media@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <NhCPsL5--7-9@tutanota.com>
In-Reply-To: <20231019222430.17043-1-laurent.pinchart@ideasonboard.com>
References: <20231019222430.17043-1-laurent.pinchart@ideasonboard.com>
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

=C2=A0you pleased me very much, also for your quick reply.

1)
=C2=A0 The patch is exactly the same as final state of my debugging.
I just succesfully probe it against uvc_video.c <https://elixir.bootlin.com=
/linux/v6.6-rc6/source/drivers/media/usb/uvc/uvc_video.c> source on my PC r=
unning
 Linux HP-Pro-A-MT 6.5.0-9-generic #9-Ubuntu SMP PREEMPT_DYNAMIC=20
Sat Oct=C2=A0 7 01:35:40 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
 with Newmine camera.=20
/The patch also doesn't hurt my other UVC 1.0 camera, Genius Qcam 6000./
All my 6.5.0 uvc*.c=C2=A0 files in uvc directory are clean of any other cha=
nges I used for tests before,
only the path of one single line in one file is there now.

=C2=A0 Now I also carefully compare 6.5.0 uvc_video.c <https://elixir.bootl=
in.com/linux/v6.6-rc6/source/drivers/media/usb/uvc/uvc_video.c> original=C2=
=A0 (before the patch) with currect Linux sources at
https://elixir.bootlin.com/linux/v6.6-rc6/source/drivers/media/usb/uvc/uvc_=
video.c
and also at
https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_vid=
eo.c
=C2=A0=C2=A0 These are different only in few blank characters :)).

=C2=A0 I am not able to run last git 6.6 kernel just now, but I hope that m=
y verification by 6.5.0 will be enough.
If is necessery - let me now, I will try compile last kernel on different, =
dedicated computer.
(I never work with such a big git project. I sometimes used other's ppa res=
ults.)

2)
=C2=A0 You can mention my name in linux git history, I will be glad.

best regards

Karel Janda


20. 10. 2023 0:24 od laurent.pinchart@ideasonboard.com:

> ---
> Karel, could you please test this patch ? Please also let me know if you
> are fine having your name recorded in the kernel git history with the
> Reported-by and Suggested-by tags above. If not, I will drop them.
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index 28dde08ec6c5..7cbf4692bd87 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1954,7 +1954,7 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
> =20
>  /* Check if the bandwidth is high enough. */
>  psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
> -=09=09=09if (psize >=3D bandwidth && psize <=3D best_psize) {
> +=09=09=09if (psize >=3D bandwidth && psize < best_psize) {
>  altsetting =3D alts->desc.bAlternateSetting;
>  best_psize =3D psize;
>  best_ep =3D ep;
> --=20
>

