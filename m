Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8493557324E
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 11:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbiGMJSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 05:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbiGMJSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 05:18:11 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA2AF272F;
        Wed, 13 Jul 2022 02:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpe869yE48Ex/mVgI06BMRLTGr5lc+xXimxIavQcI0Ouwil1WGBhRP56Uj095NdYmENgdDyseKvqgVv+y8WdhFarLCiD+sFpz/MzCj176zSi1ZI+Oq7waMvZ2/4QC/SdGiOh23ArtJV7xDmIkkqLEWUP+pFnP5d8XpSepNxyeBJS/cy5GvCvrtSy1T2irU43J7mkEwDTfK902YEAGfYnDHws2e/eGEDmj1uUBeDv80h5KM2XAJe1v0tvfI4039IqTsqwB2XSbQh8n0EaT7RY4mxouwIDzcn9paTKoivOheCaeDgVRxL7znxhNr+cBxS7/+VAj/b5rFZ50qTpno56NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMgJUylj27F9zxCrODThs+IxYAJV7fVU4jdGlaX6RrU=;
 b=MkZHEycihZu51VJbNv2417Rder+4L+jTh6Az/U+T8bjH8/vUmJL7QF7OtCElyAZM7tGNsqJuyEXFGZUR72g5ltPXZWKd6mB0+m8Nutvibr+MIUCjqjbICG7eg0OSsVUEt+X1T62hKrri+CEc06U7zJstJ5MCozGgsazuQqFHXSeAk6d8ZenF9ykU4pHWom2+Tl39XyThKDAeJZYlYCoioJQIhXcwpJvoGbiIn2+pUzln4pIVRwYTV8BOG5haNpLtndZAJ7HUt767KVeNX0Rt7V/HEQBarZ0s4Y7brlSshlldkArFBC+GiNQhxnWYx9LlK6A+30YxhP+4acrSx8PovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMgJUylj27F9zxCrODThs+IxYAJV7fVU4jdGlaX6RrU=;
 b=tmSiJO51Jr0upL6TieeRy7X0J0k02W2M/2OpWEBr8W4+gVST9JHMAylhredzN2DQFcwReUBtQQ5//hvmaIuQa//9xLGMItwwtyOXQ+1Zk8l25aXVPM+qHKcdYUxNIrJbtR/241D7jabV6En9n1jpJba0eRiObmVW+x5oNq2dTbQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8785.jpnprd01.prod.outlook.com (2603:1096:400:17d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 09:18:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 09:18:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYdPmLaH3LWDeTz0+X1dy9H4VIWa18OHAAgAAKlXA=
Date:   Wed, 13 Jul 2022 09:18:04 +0000
Message-ID: <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
 <20220713081856.GA14683@pengutronix.de>
In-Reply-To: <20220713081856.GA14683@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59822273-7a24-40c9-4672-08da64b09762
x-ms-traffictypediagnostic: TYCPR01MB8785:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8kgfhMqnEK5UN8nxzPB+k8lsWn8hXkF09a+8XpWGr9NOKz8+6sEWJKrBdsMB8QZfQjPedtCsXbNckdLKYkfRFm/4yabgUX+H2xAl8NZpSs4qIYnrPxc8tsFtvjXeooEn9Lsip5fEW6NsIXmI2gE/FoC93oA6wHkaPLn7tvYajNCCzFTE4INBMJhvWKR6Nx+9U1AiTNT8Za8w855WTkQIBT2yXTy12pY11cctLwkEV4wcnkKa3832woO+73IkGfWUWw0Q3EpRxu5i17AypzWqiWoTzO0qccCyxV58NfwV74SiNMJehHZL8IH8wjeH5e810kFRVc3A2l1cSaa2HZVCbnlAORMA5HhwiHAX+EHok+qLlWXATrQ14gTj9cmkffNsBdb2lYyISk2xbFHeDR9b21aSDCuk70iCaWECjk8ghZse5c6vAcOGuBzPXNbHFUe3Ks/kkISm6Y4sB+x+MZ1zfyDNMlLwnHIU+vVtj5gEimVFdwFYxyjmLgP8WlCboxj+3/xsqiFqTVkK2wBjL/aG99gnCnZZjXOqyyIJ5jUY9ESezNTG3A5LX5mxPYVSn9eGkd1b3Yq5iILgo7h/1JEP+yqJs5krbYiTMvelD4ThW0o5Nk7zKif4gq9dZjOBFpxfesI5N/sFmicFfKpkTYTnnHNX59KEDlunJ4oeVW53xRoh8OjN4ewngAzzKd0YSYN6XgJL3kC8qls8pb+ckloVeZM8dHidMUK6mksCGQZV1RMDsHhg9e6G2J7DBzIC6bJsKf0AEqYlZrPtVR6XjL7uwetnVJQmXSC7LuHYsO3RIqavdeY1PBzD7/Lg52+vQMUc+lP7MGVCQ5rmzZHZ7hxdnJNzFjwgslxc6555aisiylI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(41300700001)(122000001)(478600001)(26005)(7696005)(54906003)(107886003)(66946007)(186003)(6506007)(9686003)(38100700002)(38070700005)(76116006)(6916009)(71200400001)(966005)(66556008)(83380400001)(5660300002)(8936002)(2906002)(52536014)(55016003)(86362001)(4326008)(316002)(8676002)(64756008)(66476007)(66446008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JRXnvDQBj67q0dMThY9eunnzFVpk40iDG7Ut0HDJF7HSir8GLRZLX6ydOVcN?=
 =?us-ascii?Q?F4Lf4Ng6IjNcG+M4Ekas8OAgA17bV8FGqFyI4tUMc0HT0S1pJh03nSmkUArW?=
 =?us-ascii?Q?t+IeFon1Ib0EyiQPNLwvxyUymByMAzEPXKoo4pMvMXUxEysUxrKPh683HJ84?=
 =?us-ascii?Q?32t3O7/JfexFy9np33K9Kz74DMzN8GI0LFcY+h9BnEReauw/yGpm60VfFo91?=
 =?us-ascii?Q?hzYRUV/IxOQi5s5HhqFvJ7t+zdBLxflBzTjO6GozNm8dHrb44tUMti3rs7G6?=
 =?us-ascii?Q?382ps638M6giJPpx5NZGsS42FW8rTsJqMJ+ZUyQqQ9oXpplG23rgHVR+vkPy?=
 =?us-ascii?Q?Iw4Ampvo5sEw0eznpbsUIyEOJuP9NgJNliW1K/xK32QkdX+TC4sW2rdB3LOf?=
 =?us-ascii?Q?4GWHKfaupTTugMdf7SLJa9mGDYDwij5G+FfKOFrxTpqrehCXuQF7snSfBSBd?=
 =?us-ascii?Q?/7yg5K+bOiqf1lFHweM2ivkl6WG3L3NbapgpQuK7zon2Pleq81ymR7zH3zrZ?=
 =?us-ascii?Q?y8T0H0XAd7u3dFpU75Syp4HXtmaF9vghcYUT926VC3FvXFJGz4ab7U6sLBzU?=
 =?us-ascii?Q?g5JBO42iyZ9E+m0FvTyuEFq4r6cAsy5GDpLTS5fE3X6Ti0Es3vVkyVcDL1oN?=
 =?us-ascii?Q?uK6d3lPQBzH7Am1sd8vvkb+m0rVbHEdpzv6i2EpugCESLStRUk3ECz4+33PG?=
 =?us-ascii?Q?PqhuMRpLIWbeV8Tms3ZNh44H9vHIDwut4uFb0yNDDxx0QvEblPZwRXb41ar2?=
 =?us-ascii?Q?NwdjE/dqMyBqgZQN/jyd2Am+qJ1m42SVwFWxEeyl26S7xIVlVfVkqt/MilbT?=
 =?us-ascii?Q?GnFSpMOlPd/iq3oqbUYZEeDro0AQ6EU5MpvAGB/qvLogDIyxuEnX/KPoYDIG?=
 =?us-ascii?Q?0RtqARvMhm/kIy6piYvOaAMkbj1nnPJ8ldnGkX7A3BPKJxNeJpjDJ5INfUMS?=
 =?us-ascii?Q?0KzL5zAb/+3GOj98odYLztmBe8vlWfQ2/5z7FcV7BZVQRgDdkmWZFMi/C4nm?=
 =?us-ascii?Q?TEfzjdPi++KBy0JUEQWoPmn5BY3OpOXqfLqbFtvNBTN61lskj/eY22EIXDJu?=
 =?us-ascii?Q?3HNOB8d+bzFssjgq7GPudrTy7dI93TBIfqC5mdUWTII6odO5M7SzDfpwGX+I?=
 =?us-ascii?Q?ZsgshJcHMGO0kA7rSsgDY84gopHKR3YHKBexaAJW4zVJHV4A+VWrlkjpfNQW?=
 =?us-ascii?Q?2MJGx8uT9QH+0fENAMx15ZfYjL8u10qROXlch1Mf+KX0slYeW8aaYIoS5xYw?=
 =?us-ascii?Q?PQdt4U4aNFolZWr7PfDRt4RfgFh0A85RT4ikhjD1Pi6ga+91GIIL5BeuywVp?=
 =?us-ascii?Q?aM3oPeNyU0diV36TsjBB9EW18LTExc3oZzL9gB5FpRL1btK2ePtkjVwpYXto?=
 =?us-ascii?Q?pkDBIIRb4sT8/aLjeLwgd+lZyWTM9y1VY2FlFXLr+iBiTNlqrV2JZB0Rf7tR?=
 =?us-ascii?Q?DJQ4/+4gVZuDCgMWAjyh9vNbI2awr8iuD9A+QAUYNrw6eb5aVSDjNW96DWDL?=
 =?us-ascii?Q?5Zkze3QgR5nwlM/ZQZ0Kv44iPezoLTkcPW3ybSMw/uVoNndaCFqaWXu/Wx7n?=
 =?us-ascii?Q?pfOqhuBq/7v6B9NoKCM06KToXUJTv3kBm31aRYlkcLqOYB9dQ+lsQst0TsNT?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59822273-7a24-40c9-4672-08da64b09762
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 09:18:04.2543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHb5yNS9Tz37/WyFNwb2vxkgcslPmlCFR2zEb72PsICNYV6wjk5IL0ywl2ooB+rkFMqh1MC9u3eJWA9jCqTxg8JiB3KDX63YwPt5E7ChZiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8785
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Phil,

Thanks for the feedback.

> Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> deassert/assert reset line
>=20
> Hi Biju,
>=20
> On Tue, May 31, 2022 at 03:19:55PM +0100, Biju Das wrote:
> > As the resets DT property is mandatory, and is present in all .dtsi in
> > mainline, add support to perform deassert/assert using reference
> > counted reset handle.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > v10->v11:
> >  * To avoid lock-up on R-Car Gen2, added poll for reset status after
> deassert.
>=20
> I didn't look at this earlier because of my preexisting R-b.
> It looks to me like this should be moved into the reset driver.

OK, sorry, I should have removed Rb tag while sending this patch.

> [...]
> > @@ -631,13 +634,33 @@ static int __maybe_unused
> vsp1_pm_runtime_resume(struct device *dev)
> >  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
> >  	int ret;
> >
> > +	ret =3D reset_control_deassert(vsp1->rstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * On R-Car Gen2, vsp1 register access after deassert can cause
> > +	 * lock-up. Therefore, we need to poll the status of the reset to
> > +	 * avoid lock-up.
> > +	 */
> > +	ret =3D read_poll_timeout_atomic(reset_control_status, ret, ret =3D=
=3D 0,
> 1,
> > +				       100, false, vsp1->rstc);
>=20
> So the reset driver does not follow the reset API documentation ("After
> calling this function, the reset is guaranteed to be deasserted." [1])?
> If so, this status polling should be moved into the reset driver.
>

Sure, will move it to reset driver. Geert also suggested same thing[1]

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220504184406=
.93788-1-biju.das.jz@bp.renesas.com/

=20
> Also, why use the atomic poll variant here? As far as I can tell, this
> driver doesn't call pm_runtime_irq_safe. The reset_control_deassert() API
> does not guarantee that the driver implementation doesn't sleep, either.

As per [1], I2C driver uses atomic one, so just used the same here.

OK, will use non atomic variant in deassert().

Do you recommend to fix the reset as well as per [1]?

>=20
> [...]
> > @@ -825,6 +848,11 @@ static int vsp1_probe(struct platform_device
> *pdev)
> >  	if (irq < 0)
> >  		return irq;
> >
> > +	vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> > +	if (IS_ERR(vsp1->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > +				     "failed to get reset control\n");
> > +
>=20
> What about the other consumers of this shared reset? Don't they need the
> status poll you added here as well?

This lockup issue happens only on Gen2 SoC's. Gen3 SoC's are not affected.

RZ/G2L SoC is Gen3 variant, and it is the only consumer for shared reset as=
 reset lines are shared between DU and VSPD. Other SoC's have explicit rese=
t for VSP.

Cheers,
Biju


