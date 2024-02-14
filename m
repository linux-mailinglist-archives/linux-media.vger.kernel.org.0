Return-Path: <linux-media+bounces-5167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62938553F2
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 21:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0A12898AA
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 20:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3742513DBBE;
	Wed, 14 Feb 2024 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ARtvcHYr"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2083.outbound.protection.outlook.com [40.107.113.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCF128370;
	Wed, 14 Feb 2024 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942323; cv=fail; b=eEey9SFV4qpJf9pFEYeJO/k+sfj5SHc0FobkLkM5XjtlKCM/QQB4Cx1LupJZPXN/fW7GR41sjroXehkQzD0CiC4+XYoQ6oD8fYyLV1g5mJ8ZJ9CgHmJxCaPe0uLP058KCY0CJG2afzY5qvAVoylFnVAAefDVBwqHbZQVlp+m1eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942323; c=relaxed/simple;
	bh=axZtywnh3m29CDQVaSOPLmP8ymqsf62XCNj0H1cgFsE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ib936VeaeuqqyhpeTIGXy60aUH2pydxOuJkhQ1b2KQUb6si9hPBeTF8XBJfx3F3tpd2xo7jtP7rJUpAo6DCP5piKvqkpUsIOezFk5dhkRaV32rTY/j2ku2gCrb5Q0aY+vF6JH/PqzsqD2lA1uuPRDCezz7kj/csPFLdhkg+Na0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ARtvcHYr; arc=fail smtp.client-ip=40.107.113.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M91ayyrwc1G2H7h2siM3SOA9XCLF7lEprsPlHfIC0VUvWo4l0mAxyHa7vdBEAt0eVEwJN7CSpOOtDxJ5U9djctjg6gi11PMZmerEvIiUTRZT2RAQwAgAMRFqy1OYjwj3suwAARaQ3l/3ENxbjWZjnX82RD8fuU4dAvVRkaYRez4QPlYO3JQrJlVonxMeF+JLL1p8plYNpdB6rIjLINIjH2CML8RZ+R2/p/EKjqIlpA/ugnetMYeHONcPJnM8TwJDxvy2ZrAlSgWptNF+ha7IAo4e/mTJjy6jPdv3Vq17w2INWJpknsiWvyoP8mrcpOUvBkGdbYnKdLvnRXIYzlTxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OTFpwRUFSBE4gJJM3qyz9vpamRlmXC//4D41VhuW70=;
 b=MuNYTCgORkNff93LiLl25bGCnu8jFrsedN9GNn11vCOHZamDsIfSLKrWQCz2NENAe4QR7lpx6ROd1BmN8j+Q5EySxNLclf4OJhuucnCpzcTC0vGeOdePFUxOOVaQFVWdq2O5JXoXOpv9QhR3cn4966Hr4LxVt2XSm87s5i47sWzBWPCP/fSBNDf7HVpfGWgqdwAszmHrFP1WpUpj0HVGiYo/TSFU+Bv+8BTF0Y5BBu6SkzcdS73ucXPK+tonCj/vPzuytV1nJr1pkZxeAkjIr2X0rvdYDnySOxRRp0I7tRDS2lxKRhMxrSV173R89c3T3iQkAJpV7I3u0tZk9HuaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OTFpwRUFSBE4gJJM3qyz9vpamRlmXC//4D41VhuW70=;
 b=ARtvcHYrBl3z4r3cwjAwqXgDVNtHZxl3zztBegYwGMgynZ50msfs16gFt+DsS9sD4IO3Rlwq9/t5+XSmX7AAwXNAp0oAN2aVAI+8Pc8KO7EVJ0OC9EQyzryOn5IAon3/jky99e8KuM/DI5drS3hRPFeFOqjfsN2P52NMsbg/wOE=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8479.jpnprd01.prod.outlook.com
 (2603:1096:400:174::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 20:25:16 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 20:25:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Topic: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Index: AQHaXoVU9ilCtHOjSkysdyM8MSKnYrEI2pOAgACbwACAAAz2gIAAw/DA
Date: Wed, 14 Feb 2024 20:25:16 +0000
Message-ID:
 <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
 <ZcvsyRfVwC0aJ5fb@shikoro>
 <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
 <Zcx6Ty2tu_ZGdURj@ninjato>
In-Reply-To: <Zcx6Ty2tu_ZGdURj@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8479:EE_
x-ms-office365-filtering-correlation-id: 1effedf1-1aaa-47f6-f636-08dc2d9b0e4c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QFPmnwv01LKGhyil8UWtqNvZbNJfR/wPKPlYtZNRURUuUW5G8mrOdk2FD9A6hmhNEj+n54vYpmjk7BQJ6FOY2CKWQ/GGPtOI5dlcVi0GBr8u/lD90O/oY+38b6XrTrXyMTd93eQOMkKtW3DsusKVyKrAAf0CtA26bFKJs9+1EQTuDdy2VaPOV+xbLDy42w8ajPTjyYiFtYCCOm5lMVMzDxGhP8NCS6NAAEyEP97QZmXmQrYdoItUZOykx42H/fZ9pVbnxwLkoPpK4M8jSsfowZthEothLzrhuP8BQQLYsggvmfVbbU8kNCdNi6/ElAQtSbmdrub5Q9KgyjNKfP0V2sqPr3n+6ab+xpBkUFkAGUiURlbeWLc2zQvGH6fZYFc86vQsJw9sq9t4DtUKZMDAfUz4ASQoxCEw123N90E04WEZpYxGoBe2h0hBqREfFBYQA56YnOg4/Qy6mCNwqiSy/kHZ070iko6ilad6zoPr3LEoqOUYsr/ulDxo8JbfW+h1/VdtT4qP7kU468D/2eTA/Mv8DShwsTaukSEMM57iHbWNyzmdtMDl34aJhG7IzjTHVRj2VNtD8CjSmMknLCn0dA6u/qhbLyuOUDSS97Bh6LmvC9C/DPTYWINQIUkc1TGK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8936002)(8676002)(4326008)(66476007)(52536014)(64756008)(66556008)(66446008)(66946007)(76116006)(2906002)(83380400001)(26005)(38070700009)(38100700002)(71200400001)(33656002)(122000001)(86362001)(110136005)(54906003)(316002)(5660300002)(41300700001)(9686003)(478600001)(53546011)(6506007)(7696005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6AQ7Rl/Vm9GkXXH/fblZmhT+1IV/uY2bPdf4YKK7ECTItI57/sv3XIcPCV8M?=
 =?us-ascii?Q?f6yoAGmny0ekpY9Hf1grvNt6RnjAII3um457cSo3N8E55WmX/kufGo0IN0oZ?=
 =?us-ascii?Q?0hNNddcd90CibFOUxClgigYQgS7cGLVqJCU6x3394JtLuoBY2WZHJVF56/W8?=
 =?us-ascii?Q?Cv9ibcvQ62iys6QgyklmwiLWe5hZc7wF47QxOO+rQtRyl4MPyefP15CoSVRB?=
 =?us-ascii?Q?PUI+eAVabN68md/OAD8pmPtG/s44Vcvnp+SPUjCOumGesyu9QWxaa1BWnn1A?=
 =?us-ascii?Q?MSV7Y3mwLsiHddOS9ZFhULk94GVRq8qVDtULqD0usUgM3VC7oRsNqjoQsc/t?=
 =?us-ascii?Q?Mvo+h/xTlczA5dd4Sgpm96hOmnkzSaBZOZQCa0SC/uGcy+qAPrZ2XkYUwSt3?=
 =?us-ascii?Q?BupzQaFqCIMfQqxhrqcSvU7F2PqJ1J/5v62Z9/33kedHuPPgVpXf48nl3psz?=
 =?us-ascii?Q?gM6kTsNTDJS1xFirara4MeZE2y8sM82IcmAdCgbTAbn63mv+K4xwUTo7nZDV?=
 =?us-ascii?Q?sNOLRPMD2dSX14qSvlDuQBbK/o4Dzhjv0AzWvmY5b6j0fRCHO21Ku5U5grum?=
 =?us-ascii?Q?Hy6TQmAhfnoLUtvJzoq9KmdI2iSp+Sq2SC55dbyg9EqoVhu6micQFpsKnbG1?=
 =?us-ascii?Q?L0Yllcv2ggxVLavYOKt4dke2PG/QDTokUdRuT4NYvAEmo5qi5f2EdDexVtFA?=
 =?us-ascii?Q?wgRngOYSPS/CDgm/OK9m3FOj/CqvhQTMqXEgzEL9kpEownNHo1q8jARc0gE/?=
 =?us-ascii?Q?iwV2R9WbRRQxFafHE5V9uUwsLlEbW0IMbVkkeqAr2bLoSy49F7ia5lzeaoyw?=
 =?us-ascii?Q?ZdcgwvT/OFzSzcq1yrkG0BcQKZoxwjCzHCTJIiNCn3xmuFGWz2tzCsyBF6HM?=
 =?us-ascii?Q?esoGKcwUZetTtmCojMReQg+I+UcGIsJ+yRWdz817pm+zl0sywQDHddI8GR2h?=
 =?us-ascii?Q?bPSkVM4rNmkxcJ00gfXCfhlFOwLT8B/tiihYXcENPaYR4DE67dsaAeiNM3pt?=
 =?us-ascii?Q?gZnK1lW9qn/uZQ0/iQsQDCL/WrtLsMNbgHRLBRFV24wcAfN/iSGSK6UJf/YD?=
 =?us-ascii?Q?REzrQDHWlC/YSZAwTdv5j12a+JsUHoA3vR0kfUVRDoNGliNrrg4m+9gII0l5?=
 =?us-ascii?Q?weNPqcdAZ//Oj7P4iSg7GOJoRJdBTQG3l/eFtgUoOjmnT/PLO0pGjPUJkE/K?=
 =?us-ascii?Q?4G9EdwZqZZDO9bxsSpGoroJn8PokQrYZTQm1Zay+fEAgEXHJZy1bxljty/8u?=
 =?us-ascii?Q?J90jnoI6pv+k7wlAlScc80Re05Gap9+yl4ui5w2wxTztaDxZiouvw/68eAxQ?=
 =?us-ascii?Q?/NCKahoRo6KVwjoEWGVwUxWsYufGunVjFouG+ZTtyPMhSAl0vW/avvdEfapb?=
 =?us-ascii?Q?INU0iusX55nWFMYBPu05QfR90tMm6W/ZyAIe0XKQjSbnbFR8FY3cQoSKrwfg?=
 =?us-ascii?Q?LVw0Q2jVpoP/3pXLiCwfmMaveM8EfWM+E0hxGfgFY51M1FswNEkUpuU0TKWm?=
 =?us-ascii?Q?yMMM6BRJJYbKMTIIHUF1dNSrbefi4oivyVwdlxr4JO8nEvMaZAvHK0YEHK3R?=
 =?us-ascii?Q?FQYGlnLO4SARSgq1wicRvaqF3yICuSPjKItRWtSLYLbx6Ct1QEMzPqOWsaor?=
 =?us-ascii?Q?CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1effedf1-1aaa-47f6-f636-08dc2d9b0e4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 20:25:16.2681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdWV/pguwblHw/TvWmWu9m+MzOJZdwqC09JbPf/tKTIJU9mA2yQjmV7EOr7o35e5lNB35BEVCwo7UTXosOb7yNsxf2f0ggV28Xy2SD1iB/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8479

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Wednesday, February 14, 2024 8:31 AM
> Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 fro=
m
> ov5645_global_init_setting
>=20
> Hi Biju,
>=20
> > I think it is different here. That 1 msec is delay associated with
> > applying hardware power see [1]
>=20
> Okay, ack.
>=20
> > I will restore it.
>=20
> Thanks!
>=20
> I had meanwhile another thought. What if we kind of merge the two patches=
,
> so the outcome is basically this:
>=20
> In ov5645_set_register_array:
>=20
> 	If (settings->reg =3D=3D 0x3008 && settings->val =3D=3D 0x82)
> 		usleep_range(1000, 2000)
>=20
> ?
>=20
> Then, we don't need to split the array and we are also future proof if we
> ever need to set the reset bit again somewhere else.
>=20
> Bonus points for replacing 0x82 with a define :)
>=20
> What do you think?


OK, this will do check for all other registers.

But from your power down clue and checking ov5640.c
Looks like there are 2 registers changes values after writing.

[1] 0x3008, 0x82-->0x80
[2] 0x0601, 0x02-->0x00

I think [1] is soft reset based on ov5640. Since there is a gpio based hard=
ware reset
available, we can safely remove soft reset[1] and like ov5640.c, if there i=
s no
gpio for reset, then do the soft reset[1].


Then add 1msec delay for power down/up(0x3008: 0x42,0x02) and 0x0601 regist=
ers.

With this looks like the Camera works ok @400kHz.

The plans is to add a u8 variable for delay and enable delays for the above=
 registers
and add a check like below

static int ov5645_set_register_array(struct ov5645 *ov5645,
				     const struct reg_value *settings,
				     unsigned int num_settings)
{
	unsigned int i;
	int ret;

	for (i =3D 0; i < num_settings; ++i, ++settings) {
		ret =3D ov5645_write_reg(ov5645, settings->reg, settings->val);
		if (ret < 0)
			return ret;

		if (settings->delay_ms)
			usleep_range(1000 * settings->delay_ms, 2 * 1000 * settings->delay_ms);
	}

	return 0;
}

Please share your thoughts on this approach.

Cheers,
Biju

