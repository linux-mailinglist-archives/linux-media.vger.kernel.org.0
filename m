Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AAE682486
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 07:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjAaGjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 01:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjAaGjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 01:39:01 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2095.outbound.protection.outlook.com [40.107.215.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09103CE2F;
        Mon, 30 Jan 2023 22:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB0rAh5GMQs9VbRG9dYhSb5cophqzl5ePaAzKzIa3GxL7pUh5KQV/Ko5YXm+WakHvpe/bLaHZJLpGbMcOoIQpQqR4nq2XW6l8seFRgMJHJ9B+ESg6zJBJSSjtIYNM2s9EU08p5zdQLhsjMc+1y9APx7GZp08JrEtbvykughwXQ3zZyCPs1dY2mNQenG3CsAJEctDo1Eqgrb3RRfISgNl+Q42xbD6IVgyuW46ubjB2qhIUVYk0RWgMLsRWtC5T83PxaKETbY93oM8kBH9uG6D2I0HCelDbdYX3QSS1+LtYEQ85pVAjF9r1S5vO8JKhPLJdcgmrp2YO9X0YJ6lv/pqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwjikOlgVEdoRLXxyOCn7YfJmHd/T1r8DHP44DZWsAA=;
 b=URaEjY3/bW2UuUu6R65muxXVQktMKqPQdhAmooydJRuvvbHZxqNT/NYyC8EPVd/VPKMVGnH3Mns7ZLc7xSLvLBdn6nWIR6AQtZhQomTPxaMw3PebHteDdigzXZ5MYpiSDsjuNEGUyePaVvsebA+xS4elCG9NTqNtjq2srufPM9ps32Z8M8ILg30a5VrnZk2uamvLnISgQO39nFLv5n7ea3m/cz8XVOrbdFm4uh9Dyz0y47wFsPYJiveq3RA4MNV7QxK4FU64VwQNZYuzs0pTYcTxcqqB8UxLz837ngqD3j6KEVX7lFdHaTKJurMrwK/K3gK1BqrxLVFQCBd1892PtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwjikOlgVEdoRLXxyOCn7YfJmHd/T1r8DHP44DZWsAA=;
 b=HYXJtyutW6KetfMAQm9KB1pjaYfhn2X3FOW9vr1cuu0Wm2TIq8yI99kyVUQRhuLF7rh6FLP3fw0/ag3Y8z6o5ED4sWDBZ7oQaWjjdPIBjh+3gGpMBzRVfK5XsOIGjBf0Eeis0iew6ptKwvftX5tWE4r9L4dE8IMXO6IBl/6mv+8=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11746.jpnprd01.prod.outlook.com
 (2603:1096:400:404::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 06:38:56 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 06:38:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: RE: [PATCH] media: vsp1: Replace vb2_is_streaming() with
 vb2_start_streaming_called()
Thread-Topic: [PATCH] media: vsp1: Replace vb2_is_streaming() with
 vb2_start_streaming_called()
Thread-Index: AQHZLQ/yQdWI3LvPKku3dr8Gpi/NCq64Isig
Date:   Tue, 31 Jan 2023 06:38:56 +0000
Message-ID: <TYBPR01MB534144F3EBA44C1687095D03D8D09@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11746:EE_
x-ms-office365-filtering-correlation-id: 5770d001-bac0-44bc-966d-08db0355d41f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WqqxaPfERgQMm8HujnCRzbQxEgAWKrukPHjEP97NZTojGC0OcFO9evc7zomg4TzRcwazTwR4tQuWXpfjbBOQKdjsjciHbloNd2hiUZBGZnnhtJ7BmI2HH8eePU8DwFvYs2SQjwwUvGtEOhWOaRcDrSB3uBFz9i5GwqOrouc+v2rpmimaAbmbmi3o4ESx/K8KOCl5OnG28oKENKmbQujAPrn149E0KrzWjMsU9aV405TLW9phkX2tRy380Hv1vP4EhUsZSPm9HGhoEe917pf0beVguHoZvSrNsRcfdfoAjdKtyYATlWTFtDoV0nZb93aks0fEQFq/B+Wl0aAXjmp5ykMKvyInoA+4de7Q+MzxdPocRhd2qOxB6i+PU7ScMhghgRXLxLd0/3p4UBe8WmKEX9lBzhA4v9iIP8kLJmK1Da9P1ADH3Hc0LIZ7LbwaJaNlwoXyXLJRn4koZrS+BXMwn9zlO5Krunt/yy12gAQsjaKHFIzMooQeO/zDd0Ojo18vwT+iH7VGGSWl6UhcTRt/iwtSFl6gx1csl+1lQwHWhTPggVwXFU8gIDyI1HyJsS122/NUkdWik/1fl7iPPD1DGzPDTUBzytWw7OI6XPwx1sGYcskGp4vjbw2s1HSWKlc6syR3ac88XbLKqCtOubfPQqUq9nvJrjQ+w6WbXzzJYTGjd4ZVckD4baT5y7/ZRwUuVwFr3ZyaKzGmKjvElM8gWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(110136005)(6506007)(107886003)(71200400001)(478600001)(7696005)(45080400002)(54906003)(316002)(76116006)(66946007)(86362001)(33656002)(186003)(9686003)(38070700005)(38100700002)(83380400001)(41300700001)(5660300002)(8676002)(4326008)(64756008)(66556008)(66476007)(66446008)(2906002)(55016003)(8936002)(52536014)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b+H7Vy5EmQD6gwtYnmPoeO7w5KZcb1aVv6FgI7Qn0Oet9gUmEquyYmoq9Md6?=
 =?us-ascii?Q?L486AjQWcp+PzMC9anENdOVyMvCKbCEQQn5UjZdZiPFLZxXDwwCU/daZk1Qd?=
 =?us-ascii?Q?0VN0z1yh1OYl2WoNdobvddG/fuYErLY6weV7dsDZhIKFN93xiB0KQAzYPB71?=
 =?us-ascii?Q?VNND6ee4xbdEW+IoY8OmEiUzhQ8Kolg+Ly0bDndbRKAQJnIRdMdwFP5uqKP5?=
 =?us-ascii?Q?ep0jY9O30qaPL1mwwWXff9mPc/MbgtSWPC7Lj7AnNftagDCNRb5L5UadAm3A?=
 =?us-ascii?Q?4q+xPAyW8Bi2B18sScVWztXhhwzrCpCsijrkq9uPH6xpjWqbLa5mcL78soc5?=
 =?us-ascii?Q?dMs+Krabetlbw73eJN1L3EKSgNppE9mpJuKQL4oCbmk3JScEyPjrty1bTv5q?=
 =?us-ascii?Q?coiilXFJg2A2D7sqafoWuuNXNNET3kd/dYqe65IiaDDu/wiQV8aAku7nvd5V?=
 =?us-ascii?Q?RH2lxsjgRjW6UPViIK41rjpJy15QSD6XbQ1V6T1xdOpR29qzNRikTrqp1Gh7?=
 =?us-ascii?Q?AB2tZmMJAIe5hvi6kn+fatjSLyaFqkWRqRLNEHDe6O7Ii9tLUKKsDKRyLUrc?=
 =?us-ascii?Q?apTo9935EsxeHwaler562FyIVK5020aoAspWKUVbPRTpSpUwMfakTK+LIyrX?=
 =?us-ascii?Q?YKGZXEL1McCu1f/BHuUaFri194rJx7jNKwERjZnKPF31iFpaYtaLZN9yAjgs?=
 =?us-ascii?Q?O84uVYLRGevUo3D7WWm1ZN2SOg4XnB91SpAOACorYmYI4lbU8uosR3f3P6ez?=
 =?us-ascii?Q?38YNB5awmqEBPzIVEAEW2/LoV1TC2p9P3xZsp8XL/C+vk53ue9gxxoQVgTr3?=
 =?us-ascii?Q?I+7NBsPKr/UHG4RzOO69/RVdWorZHeCbgmPm5GwGEetVi786wustevSAm4GX?=
 =?us-ascii?Q?XdTv4eu5CRekiC3Jwql1hyz/F/pl73gsDn9wQIBxBMDXjXIbTn3IIBowQ0M7?=
 =?us-ascii?Q?PhF2tSdicAeDQb38ZzbNp+cNRNHtXdJEyQzUzwDBN3TyNNDborD54aqfNI85?=
 =?us-ascii?Q?4bKX0qrNUDumulD0pIU59p9d4VQkk7d1HCm99MGRZl5g+HNYdzQ/odRZVVBC?=
 =?us-ascii?Q?n3ab8ItAhCzlTdtfMtpNpUOmtX/ZCjZj3l7WmYyz1G1LBR1sdvGTKf5g8RbI?=
 =?us-ascii?Q?fAiYG/ClGFWGkSUbUQbqobFsuiHg83Kx3b3X45rfLgQEjE0aC9MceaC/suZ3?=
 =?us-ascii?Q?Ijzh9mbGl3jk9hSVOX+A7dO4xrpQaD7xWZ1VnYz0BseK/THbuUoSuQFTIWyz?=
 =?us-ascii?Q?s75rZtowrjy/IKSG9NCf66qsRdOvNSxi6FImUSJV0j1q6X8j2FmsBRQmX2B9?=
 =?us-ascii?Q?8fqAZ6U19ywOzzM8L5vS08YgJPtGHeJuAl+RRfKGpmNME8eEiyVc7KMmycs7?=
 =?us-ascii?Q?T2IMZ3AzR56Th6c0aeeKkOcR5KDG2QCGrCgXlgLXj7Qtc7vtEATdYa2hbKnR?=
 =?us-ascii?Q?z8Gxr26xDKuisxG7ZLUAPer/d5gbvXtMrM4qlhr4nivNhbYdsK8aTJOxUCEL?=
 =?us-ascii?Q?v0NXurniRF0T8mEc4SHCQJo/C99U3tVse6+QBDzMMGCghu5ctLJh6DD5fF6m?=
 =?us-ascii?Q?sH6l22ZCtVGjxCrTjy1tPagWQKidZcoZtUbmA7sde78LHAhC5E9OYDjakJEy?=
 =?us-ascii?Q?3Ob2KIS/TJC20UvwEFx7hAhAlgfOlNYQsqPyzAHpSrYoLgxW2YHDQrCSD1Wj?=
 =?us-ascii?Q?n2SNAg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5770d001-bac0-44bc-966d-08db0355d41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 06:38:56.8375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SYiXAFbdOyUae4TpwxKbQUpKFWFBRCTypqY+RKeEAL3EIXMG7fq431SEYot0gVie3vmT9+4Jv8bS/S6PBvjLPDCHLysRBeK5ztY8p1he9AoEcdD7d45RvCWv30pZY+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent-san,

> From: Laurent Pinchart, Sent: Saturday, January 21, 2023 5:44 AM
>=20
> The vsp1 driver uses the vb2_is_streaming() function in its .buf_queue()
> handler to check if the .start_streaming() operation has been called,
> and decide whether to just add the buffer to an internal queue, or also
> trigger a hardware run. vb2_is_streaming() relies on the vb2_queue
> structure's streaming field, which used to be set only after calling the
> .start_streaming() operation.
>=20
> Commit a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> changed this, setting the .streaming field in vb2_core_streamon() before
> enqueuing buffers to the driver and calling .start_streaming(). This
> broke the vsp1 driver which now believes that .start_streaming() has
> been called when it hasn't, leading to a crash:
>=20
> [  881.058705] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000020
> [  881.067495] Mem abort info:
> [  881.070290]   ESR =3D 0x0000000096000006
> [  881.074042]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [  881.079358]   SET =3D 0, FnV =3D 0
> [  881.082414]   EA =3D 0, S1PTW =3D 0
> [  881.085558]   FSC =3D 0x06: level 2 translation fault
> [  881.090439] Data abort info:
> [  881.093320]   ISV =3D 0, ISS =3D 0x00000006
> [  881.097157]   CM =3D 0, WnR =3D 0
> [  881.100126] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000004fa5100=
0
> [  881.106573] [0000000000000020] pgd=3D080000004f36e003, p4d=3D080000004=
f36e003, pud=3D080000004f7ec003,
> pmd=3D0000000000000000
> [  881.117217] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [  881.123494] Modules linked in: rcar_fdp1 v4l2_mem2mem
> [  881.128572] CPU: 0 PID: 1271 Comm: yavta Tainted: G    B              =
6.2.0-rc1-00023-g6c94e2e99343 #556
> [  881.138061] Hardware name: Renesas Salvator-X 2nd version board based =
on r8a77965 (DT)
> [  881.145981] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  881.152951] pc : vsp1_dl_list_add_body+0xa8/0xe0
> [  881.157580] lr : vsp1_dl_list_add_body+0x34/0xe0
> [  881.162206] sp : ffff80000c267710
> [  881.165522] x29: ffff80000c267710 x28: ffff000010938ae8 x27: ffff00001=
3a8dd98
> [  881.172683] x26: ffff000010938098 x25: ffff000013a8dc00 x24: ffff00001=
0ed6ba8
> [  881.179841] x23: ffff00000faa4000 x22: 0000000000000000 x21: 000000000=
0000020
> [  881.186998] x20: ffff00000faa4000 x19: 0000000000000000 x18: 000000000=
0000000
> [  881.194154] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [  881.201309] x14: 0000000000000000 x13: 746e696174206c65 x12: ffff70000=
157043d
> [  881.208465] x11: 1ffff0000157043c x10: ffff70000157043c x9 : dfff80000=
0000000
> [  881.215622] x8 : ffff80000ab821e7 x7 : 00008ffffea8fbc4 x6 : 000000000=
0000001
> [  881.222779] x5 : ffff80000ab821e0 x4 : ffff70000157043d x3 : 000000000=
0000020
> [  881.229936] x2 : 0000000000000020 x1 : ffff00000e4f6400 x0 : 000000000=
0000000
> [  881.237092] Call trace:
> [  881.239542]  vsp1_dl_list_add_body+0xa8/0xe0
> [  881.243822]  vsp1_video_pipeline_run+0x270/0x2a0
> [  881.248449]  vsp1_video_buffer_queue+0x1c0/0x1d0
> [  881.253076]  __enqueue_in_driver+0xbc/0x260
> [  881.257269]  vb2_start_streaming+0x48/0x200
> [  881.261461]  vb2_core_streamon+0x13c/0x280
> [  881.265565]  vb2_streamon+0x3c/0x90
> [  881.269064]  vsp1_video_streamon+0x2fc/0x3e0
> [  881.273344]  v4l_streamon+0x50/0x70
> [  881.276844]  __video_do_ioctl+0x2bc/0x5d0
> [  881.280861]  video_usercopy+0x2a8/0xc80
> [  881.284704]  video_ioctl2+0x20/0x40
> [  881.288201]  v4l2_ioctl+0xa4/0xc0
> [  881.291525]  __arm64_sys_ioctl+0xe8/0x110
> [  881.295543]  invoke_syscall+0x68/0x190
> [  881.299303]  el0_svc_common.constprop.0+0x88/0x170
> [  881.304105]  do_el0_svc+0x4c/0xf0
> [  881.307430]  el0_svc+0x4c/0xa0
> [  881.310494]  el0t_64_sync_handler+0xbc/0x140
> [  881.314773]  el0t_64_sync+0x190/0x194
> [  881.318450] Code: d50323bf d65f03c0 91008263 f9800071 (885f7c60)
> [  881.324551] ---[ end trace 0000000000000000 ]---
> [  881.329173] note: yavta[1271] exited with preempt_count 1
>=20
> A different regression report sent to the linux-media mailing list ([1])
> was answered with a claim that the vb2_is_streaming() function has never
> been meant for this purpose. The document of the function, as well as of
> the struct vb2_queue streaming field, is sparse, so this claim may be
> hard to verify.
>=20
> The information needed by the vsp1 driver to decide how to process
> queued buffers is also available from the vb2_start_streaming_called()
> function. Use it instead of vb2_is_streaming() to fix the problem.
>=20
> [1]
<snip the URL>
>=20
> Fixes: a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

My team member tested this patch and confirmed that this patch fixed the is=
sue.
So,

Tested-by: Duy Nguyen <duy.nguyen.rh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> Hans, I think many drivers may be affected by a10b21532574, and it would
> be difficult to test them all in time for the v6.2 release. Maybe the
> original behaviour of vb2_is_streaming() could be restored (I haven't
> checked), or maybe the commit should be reverted to give more time to
> fix the issue correctly.
>=20
> In the meantime, this patch should be merged as a v6.2 fix, as I think
> it goes in the right direction in any case.
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/m=
edia/platform/renesas/vsp1/vsp1_video.c
> index 544012fd1fe9..3664c87e4afb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -776,7 +776,7 @@ static void vsp1_video_buffer_queue(struct vb2_buffer=
 *vb)
>  	video->rwpf->mem =3D buf->mem;
>  	pipe->buffers_ready |=3D 1 << video->pipe_index;
>=20
> -	if (vb2_is_streaming(&video->queue) &&
> +	if (vb2_start_streaming_called(&video->queue) &&
>  	    vsp1_pipeline_ready(pipe))
>  		vsp1_video_pipeline_run(pipe);
>=20
>=20
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> --
> Regards,
>=20
> Laurent Pinchart

