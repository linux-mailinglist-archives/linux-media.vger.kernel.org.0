Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1532A7B6762
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 13:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbjJCLNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 07:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239904AbjJCLNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 07:13:04 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AC5C6
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 04:13:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qndKk-0007iY-UG; Tue, 03 Oct 2023 13:12:58 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qndKk-00AkvC-1d; Tue, 03 Oct 2023 13:12:58 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qndKj-00CExz-Ok; Tue, 03 Oct 2023 13:12:57 +0200
Date:   Tue, 3 Oct 2023 13:12:57 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        john@keeping.me.uk, alsi@bang-olufsen.dk, kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: u_audio: initialize spinlocks
Message-ID: <ZRv3Ocwc0c/sKaDk@pengutronix.de>
References: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
 <CAB=otbTBNDNpg0B_WdCbCuj7qcoOdPCP2QE4az0J=KrHOTgfLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WTLseb3EDzLd3Y4J"
Content-Disposition: inline
In-Reply-To: <CAB=otbTBNDNpg0B_WdCbCuj7qcoOdPCP2QE4az0J=KrHOTgfLg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--WTLseb3EDzLd3Y4J
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 04:39:42AM -0400, Ruslan Bilovol wrote:
>On Mon, Oct 2, 2023 at 2:42=E2=80=AFAM Michael Grzeschik
><m.grzeschik@pengutronix.de> wrote:
>>
>> When using uac2 with lockdep enabled, the kernel is throwing this
>> message, due to uninitialized spinlocks. We initialize them now.
>>
>> [   24.668867] The code is fine but needs lockdep annotation, or maybe
>> [   24.675878] you didn't initialize this object before use?
>> [   24.681910] turning off the locking correctness validator.
>> [   24.688038] CPU: 0 PID: 348 Comm: irq/43-dwc3 Tainted: G         C   =
      6.5.0-20230919-1+ #14
>> [   24.697866] Hardware name: WolfVision PF5 (DT)
>> [   24.702831] Call trace:
>> [   24.705559]  dump_backtrace+0xac/0x130
>> [   24.709755]  show_stack+0x30/0x48
>> [   24.713456]  dump_stack_lvl+0x60/0xb0
>> [   24.717552]  dump_stack+0x18/0x28
>> [   24.721254]  register_lock_class+0x4e8/0x4f8
>> [   24.726029]  __lock_acquire+0x88/0x2130
>> [   24.730314]  lock_acquire+0x17c/0x338
>> [   24.734403]  _raw_spin_lock_irqsave+0x60/0x90
>> [   24.739274]  u_audio_get_capture_srate+0x34/0x68
>> [   24.744436]  afunc_setup+0x2d8/0x538
>> [   24.748431]  composite_setup+0x1a8/0x1ba8
>> [   24.752913]  configfs_composite_setup+0x88/0xc0
>> [   24.757974]  dwc3_ep0_interrupt+0x5e8/0xab8
>> [   24.762648]  dwc3_process_event_buf+0x424/0xbb0
>> [   24.767717]  dwc3_thread_interrupt+0x4c/0x90
>> [   24.772488]  irq_thread_fn+0x34/0xb8
>> [   24.776484]  irq_thread+0x1a0/0x290
>> [   24.780379]  kthread+0x10c/0x120
>> [   24.783985]  ret_from_fork+0x10/0x20
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/u_audio.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/=
function/u_audio.c
>> index 4a42574b4a7feb..9d9f906adf7c00 100644
>> --- a/drivers/usb/gadget/function/u_audio.c
>> +++ b/drivers/usb/gadget/function/u_audio.c
>> @@ -1172,6 +1172,9 @@ int g_audio_setup(struct g_audio *g_audio, const c=
har *pcm_name,
>>         g_audio->uac =3D uac;
>>         uac->audio_dev =3D g_audio;
>>
>> +       spin_lock_init(&uac->c_prm.lock);
>> +       spin_lock_init(&uac->p_prm.lock);
>
>These locks are already initialized just a few lines below in this functio=
n.

It was probably to obvious, so I missed them.

>It seems the issue is because uac2 does u_audio_get_capture_srate() while
>capture isn't enabled? What is your UAC2 gadget configuration?

Yes, so probably the c_chmask is not setup while we still try to
work/configure the capture path.

There is actually no application of ours involved in setting the srate.

It might be possible that pipewire is changing things that should
left alone. I will check that assumption.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--WTLseb3EDzLd3Y4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUb9zkACgkQC+njFXoe
LGQuDw//ZBsB617Kjhfsv5PMeUASDe0rVqZ0bWrxoMFGXU66QTfxaooYZDcBRxIZ
ia0MwerSsLkUSMY1uR32vjtnG+ONLfnVO8y8nGUp/jMolPTteWfSEccI2c4bHGXP
EtLNjHHhvpkv5wOwi/Hnlb+55GPS/liQ3c9yVrJtPiC1wrrXzr46ZbWpXRUS37Dw
zd+Y94s99+dyaBK9QWVzhqFqCpVz1K8uPLT/mtK5odJpHN9QA0oiRtnIDc58owjl
YfPYPAr5yR5uNaj6yYBAhY1/Y4LMEhT96ofUeHRULD7phAijpcvlREihpVq65rmY
ZWiqJcGWz49+PI98vn09zC8Rs5l46n5yjjWjF2LX1lL6a6sULzBs2Mtv7xTCdERO
gtxM1q5Uq01u1jli9ZiYVle6a/AeqNVotKEjxPblj+15qfZr+y8f8Wa7oj99C5BG
n+aGoFv5rdLqOyOw8YNFW+7RTakEVRUaKKnyojwzUZMlNy0WkEPEK3Se40OvOkpV
zkYFmKMi2kGi2B8U+EwOjIMmfXslJS5Vzhe1owoCsJmQgP7BOFVnfF+RePhrL9rI
QsZZ/93aoLgSnQHPBNpJQGmqvFTkPydWg4Ky968hkg7dY66G3A3j4Q4STYg88i0c
1N74g1mSvNNuwCjFiHgvTsSsbG3dxzpJZpW1raGnh8dGQ+vpimE=
=QkqG
-----END PGP SIGNATURE-----

--WTLseb3EDzLd3Y4J--
