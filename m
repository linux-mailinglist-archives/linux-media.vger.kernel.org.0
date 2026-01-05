Return-Path: <linux-media+bounces-49909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8495CF3A32
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 13:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 955F9300D303
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 12:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A77344046;
	Mon,  5 Jan 2026 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="NbMg9lHs"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021088.outbound.protection.outlook.com [40.107.57.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163BA34402D;
	Mon,  5 Jan 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617143; cv=fail; b=sdB+OGjlnmmwFJbCGyVR5d3O2IKzVLqpIxi9InDvA5vFAsvN6ZdtU5k3KJCiSSeROjOFoo5iee/JiFM84nPY+x9zpqKzvqHd0Se5t78wOLlEj2AK77d1oxMfiScRzFsEnVgd92F+71mgt1TxrxmWGl1uA+Au2t4ew7pYcyyR8FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617143; c=relaxed/simple;
	bh=o8UKQfSM9+fQLCuRpvu66avRHbDgVyROq+cw6fVMJoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WmF7sN4m05UAfVktE03YZtgnasvZ4aHSgQMgA3yF5QULXFmm7WSN3B7y5o9x29POK3l7gjRESw2JSNWeh1lznetyxTBIbEO7fuemaxWOR4S5doEBc9j0PUvGB233r4zSN90EJlUQQrgIh1ZiW8fVKxLZT7B+1HvNq9xMincmIBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=NbMg9lHs; arc=fail smtp.client-ip=40.107.57.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBqdMFFWQ0FaVv0eaCI32URBGZUOQF7dkv+0QAt/jAkwbrJvGjXo7ywwdAH43LYS5T6Gepy2+KDsrfO9/fzEEmy9YA4Ys7r7e4vIk+kPkqVDKZxaX+6bTPMOI1f6z8nwdJfX6ka2rHbyDZ04KaHgBXFbcYq4UZuzYBxBMuaHI6HY2h8Ts1UfJkyMvSXTdt4GdGEXlkLnnIZRxOP3VwGIi4uB6+74VydGF78qpL5eUGW/WJEamSkLNwHG0B31hxilipp8INY04bh4CNwvNdYmOIqhqVG+RV2OAyJOEZs+/pzQVhufrKp9ZQew5om+0rNqgu8pj0SJF5ioVOcC0UBEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8UKQfSM9+fQLCuRpvu66avRHbDgVyROq+cw6fVMJoA=;
 b=ATX5vhRUGEF+rEqvviVS6xtFjvDc0tHnvzqKqJMnin99ZplShYsdcbwF3ZhZoK7zMrXpKdxZ2CtZihZym6k63F/TzBgX0AuzTlwsS6Q5mwfWIhGerL3GImYkIDmvlBYBKIZYVhqfpY7uKA7C6DzqgOfPPX74TNvkshOUWwwgIb5EHWShWGdEdBwXG+BJWXF4saxQgHHNpLNI1BS8krQdt+p9mCBER/Kw/eXYNDI7MaZ4OiXKEPM5Nv0r7gX7p7cpToLYv/NTGcDh12DCczY0tJVFuOVgHjLh5Ez2KQchBs7ou8/Feu3bwh0csR0lxTYo45FOtFipvwsFQXxItGmJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8UKQfSM9+fQLCuRpvu66avRHbDgVyROq+cw6fVMJoA=;
 b=NbMg9lHsXOuAeiSaOoipjHh/AhXKOcAl1nkcMamkFE8U9farSRnJz14HBaGcbcii3C33q+M2wlkO2oVhpBC+ETZDRRdkEkvMSpjpVE4p6xdNviW6Qh36GTnMp2ocUzoPVpL7xBn3Jfnqzegs7EJ+Pps2h2yO+KP38tghVSCQW7U49tYkSyNE3rmopQzpGjSsuSed614e/ZW7akWTYrACqHaS7KSIot+5tZeCNBZd1E0XspNELDRF5ef/Q0p4UXEiwxSISFuyAh+j8M7VQDdeFU160kEWJ0as5SvPxcMuz5aVlZC7AOv/wNIA7CmFxm9Cgv4JNAJ/2OIRYwAyBwzQkw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0101.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 12:45:36 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 12:45:36 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov2735: request reset GPIO as initially
 asserted
Thread-Topic: [PATCH] media: i2c: ov2735: request reset GPIO as initially
 asserted
Thread-Index: AQHcfjdf9Y1/snSGUkOO95prnUiDsbVDgo4v
Date: Mon, 5 Jan 2026 12:45:36 +0000
Message-ID:
 <PN3P287MB1829E973EE1DEC636F6C21538B86A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260105113430.120620-1-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260105113430.120620-1-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0101:EE_
x-ms-office365-filtering-correlation-id: 4004b5ff-60df-4690-6faa-08de4c58531d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?38UFKjczkSdLKnuAlXBOIvRvAgGlUvixZvUY1UaTuv4PIVi86ofWUnT6/v?=
 =?iso-8859-1?Q?jiE7V+H4NnnTmUeKr0LvwsSpntCWu30vX3yyl14K2G1sLda9Q6zuFMIVEB?=
 =?iso-8859-1?Q?az0U809tQHU4CoNq1yYlAAX76rI6iQiuSDf3KxT28HKLv8Q1YT0ob5t45e?=
 =?iso-8859-1?Q?JN0vmoI0/kGYXUUC0aeGLLGuPXMNg12vbyKBkACJPk7YCH0mThrHHve/D+?=
 =?iso-8859-1?Q?bcZyTz/VEEVBvHPWDvi7qLr+nU4vUyZQN85KlQg8rOM/Nsx+aSpp4b9ZXg?=
 =?iso-8859-1?Q?NpuNmn5nfIjthbACQteYdNl9/63WeDWMeo//WQk67EYq3fVDW0tBeOR1vJ?=
 =?iso-8859-1?Q?k1uhZeJtwUsaceoX9haI1pszbsPTvq/W08rKCCnYFDdw+Xc9YAeFpwj/CB?=
 =?iso-8859-1?Q?2KTBRcvlFmxnrildkvMsWbj/goeBfjCyUodHu3FIZj6LBA/uWGGUQOPgPD?=
 =?iso-8859-1?Q?wjM56+9UU1MSbMuLxTbWg6f9qou370penH/6+sT9BTmTWuXIZdPDesKDB4?=
 =?iso-8859-1?Q?gjdOC1dEjkGM87kejUI9MhUp8I9aiQDtXcsLp/Q4nHnV5mr7cFEbLbyKbX?=
 =?iso-8859-1?Q?4slbvEfz7efBHtZzmgs4ZWq22V9hAjP/hXiwjJKlaBmHRMZCulzSKZJLO0?=
 =?iso-8859-1?Q?EugWdRieZwo+USRROjH0vnVrQxXOELPpzxyLpk6FUYUO91SQkg0is7cuCR?=
 =?iso-8859-1?Q?ku/Mkto3ZZk61Qpj5Q+IkXUj4JPSagQ5yFERboTF/cGQJNtwCUXbZ9XI5T?=
 =?iso-8859-1?Q?lExGH6kGwfP/ijw9Sa1oczXwshjCyoBSe7SwOM0H64vbvB7jve61w1v28y?=
 =?iso-8859-1?Q?2AUcYQ1dvOnM9R2/GvsmNUYBNhEA/7n9ScMULJM0F5Qj9tqWH7AnItWWEU?=
 =?iso-8859-1?Q?IA1w8PYWl2yztb4hbdBnGvMrS6+1bHuBepBJChz3DhHi6fpyZwKg1lnTSZ?=
 =?iso-8859-1?Q?d7Si0KN7FYCatKYQMpg2GV16cmD0fTKFiC2NVsU108CFJpW+zNzyB9fD08?=
 =?iso-8859-1?Q?b1S4cab7jM/bD+gNHHTiSTHe+vVqzRriFY91E2QO/hCiM+pIgiTQQ6mPw2?=
 =?iso-8859-1?Q?uJJK4M76W16j0ZCuLRQ+G/mvqugV9xh0bHnC/8G9eI/90UWKNchdOiHtal?=
 =?iso-8859-1?Q?oCo9zqRcfOP/TRCF2kAc+jfC7vJ+YRvKuS15BiR1NkoxN82RvIoZLxip0b?=
 =?iso-8859-1?Q?VVt7eIvdGIJpaM5dWN9x5ppqmKSkJS+goxbjo3W9WMWfC8iLmqxRuyHGzB?=
 =?iso-8859-1?Q?vesiIyo3haLN5QB6VlW/eDhKnsqc3aIpXgZvcGIpWGrjFbhN4eLIoqUdvF?=
 =?iso-8859-1?Q?hzpNkw89MTgL3wUXWNs68KzqJsMmWnAm/m6Nl7Az6CpxprcKzPXhr3kDh6?=
 =?iso-8859-1?Q?O3DbUFyTXEn1nS+z0I4KklqGWFSp44Kdj3EwKXzo71CtVfoIN84QFUWCbx?=
 =?iso-8859-1?Q?eHi/ZJXUA1RITz+kas4btxmQ5vXcuzlxWxcqMWo6glOYRTBiELvWXcow9Q?=
 =?iso-8859-1?Q?eds6bXDbrCv9zi3+yWqZJ0tdNVUZMiN7qdZTHbt7kDtXEuMjwqSLG66Zdl?=
 =?iso-8859-1?Q?C/Qs2wjDbJu6YNkhdDPXduBMmiS7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RB8HrK4ROlwgeSw7e52lBxeIUhH9uoKZnVXKDFmyH+vEVv4KpBLJwJ/sGV?=
 =?iso-8859-1?Q?bmuCAHa43sAUzg+VFhu4Qbxr624C7NAoq0CSMjCMiHnD9WFpCqhHgaFnIv?=
 =?iso-8859-1?Q?OrGyEvFGDNALxDacwG6iVA/V7ABkhP0941mdIekk0m2bkoVXIYeArzyplv?=
 =?iso-8859-1?Q?YAAylYbikBNK3X1lz03sXKl4LslTqIzwGhi1EcdjsX98KrC9TfTStL6V7m?=
 =?iso-8859-1?Q?Hs/6yUCdi8r39Xhoj/+CKoxt/ybsSuqjtpaUV6o9fl0VeTIQrKAP0LZ3Uw?=
 =?iso-8859-1?Q?v/g2HZW2E4/n7xAUmR9DwSmXIttzHoV6XwFAIeZTCzjU4kbfYD6Jrz612J?=
 =?iso-8859-1?Q?PJQfjrU5oqMIuXZqNK7cIuxFqfP/iAH8m1ah++as4gZOCrL9YfN0FmWb/3?=
 =?iso-8859-1?Q?aaHL7V7sqgqyiOBw3OipQaALgIOt7TtTidIIL+AqeoPzgwPqxqtMAaG4cC?=
 =?iso-8859-1?Q?Kmw9z8Ghk37evqfmSCf8JIVW3fwNJA6jQ/a+hrzWA3A5BI8QVcMwpQ2mAl?=
 =?iso-8859-1?Q?u0WHFr18JoYaofsd0yCx0xTia1whgRISi57WqZgXYf5aidObuRPn8nmtnH?=
 =?iso-8859-1?Q?AuLh+l9yOFsc84D4idlwRP9k/Sx896CLGv1vk9GJd7JxfgKT7DeJgW6jLX?=
 =?iso-8859-1?Q?PDudqucKiASjhknqkxGzqgohtPzsv7a92HhL9sA+viiu9GHiFb2iSg0jxl?=
 =?iso-8859-1?Q?98ItCfeJZEufVWPLDOLBJZYVrxnqZ1oAUSvRPcGEi0q5ryib/nHFXMKQkg?=
 =?iso-8859-1?Q?E4htj0yOkEwgO4Y5oavEVxSNw7AlEz14owWaigg9WDkgZoMJAZaY0aEE+d?=
 =?iso-8859-1?Q?hor03I+uVLiQUqyGs5TF6fw2Ff2GDOr+dzrb4XHiLzoSip8FtCGHOuuOvA?=
 =?iso-8859-1?Q?iulrNoPax94Ru4TCuvggpwIq1ubHd9sn4hvv4H5f84Pptl7a0Ea5HZudlb?=
 =?iso-8859-1?Q?UTFpTULCOluA18CamKYKhrZfEQCyx+VNRyR13GSjl33WtiZ83OCj9tjsTb?=
 =?iso-8859-1?Q?g/sOuBennoQULoWXIvtcOyC7xxu16kNh4JPY6hGBldbahUNRU/+N9OErSC?=
 =?iso-8859-1?Q?kPhRyCoGvYp3VzVdDfvJgPhc7LelN3OGt7lKKJW1FdS2C+p6KEWSfblDAJ?=
 =?iso-8859-1?Q?xuow3vevStqL5B+K7bcVyAwf+K4j4J+qgwuorWVy+WLlOiByiZP0EnGg4Y?=
 =?iso-8859-1?Q?nwMl21P+lRAQa/O+Kvqb8e2LjoO06GmotfL1YiiIYaNrF0GSdGC6oZ6jvY?=
 =?iso-8859-1?Q?YIkVQqqSKrfLmHp64Z+WNb2btOAqvr8kNfmAzaPWLh1ZNK9+ckPcBPKKba?=
 =?iso-8859-1?Q?7bbZxscU8tkhd3E/UT3JGY9Sh7vJU/WTmIrjOIQX+ggRopP1GLGxqGsfs0?=
 =?iso-8859-1?Q?2GKlLDx39enbbIVA5GaDg9/vmqQmqRzdAxIE3HamKeMW+mPrivQlCVOd+1?=
 =?iso-8859-1?Q?/6KT1uCev56bDbUUvw2VOeJUA8EuIC+fhn59DsY9UO3m3DxbygkPryjuhn?=
 =?iso-8859-1?Q?CUMgY/hjt/yFA+gFcSmBhVt6ePkoOdReuL5I/cLUh1nFD4TYpIDbw62Yvv?=
 =?iso-8859-1?Q?LGnFZ3OHpehrLTN8/mPAXbS+nIxI2UnYdaDbVOzM7lMqnnWLY2IEuCk/6G?=
 =?iso-8859-1?Q?NrEdR5wUoIs1OxP3LiT2O1VcWKIBI/2dC2Z4ZZAmHFJrsodIDd2ybNApQK?=
 =?iso-8859-1?Q?NiURYBHKNUbu0fJNF6BEX6TRZ63EtXS1UI5c+oZOdiLCxtL27b0woYMeeW?=
 =?iso-8859-1?Q?8NK3aPlL18/soCfUWNa6CWv3DyuiqblpSabyvOB/pyW1Wfao8aB+Xg1mQO?=
 =?iso-8859-1?Q?Qj3roaVwrw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4004b5ff-60df-4690-6faa-08de4c58531d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 12:45:36.7859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwJkUWg7FLKMf8+mXkozTd8PJtmk4fuDd1W136J5goUn1RVXBnnPKEZq8BHxGgCDAKK+hiRGsGqrZPGctpSEslGi7ztrM2sXT26KXCm+RIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0101

Hi Elgin,=0A=
=0A=
> The reset GPIO must be requested in the asserted (HIGH) state to keep=0A=
> the sensor in standby during probe and power sequencing.=0A=
>=A0=0A=
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
=0A=
Acked-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> ---=0A=
> =A0drivers/media/i2c/ov2735.c | 2 +-=0A=
> =A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=A0=0A=
> diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c=0A=
> index b96600204141..dcb1add1fd9f 100644=0A=
> --- a/drivers/media/i2c/ov2735.c=0A=
> +++ b/drivers/media/i2c/ov2735.c=0A=
> @@ -993,7 +993,7 @@ static int ov2735_probe(struct i2c_client *client)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to parse endpoint configura=
tion\n");=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 ov2735->reset_gpio =3D devm_gpiod_get_optional(o=
v2735->dev,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 "reset", GPIOD_OUT_LOW);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 "reset", GPIOD_OUT_HIGH);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov2735->reset_gpio))=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(ov2=
735->dev, PTR_ERR(ov2735->reset_gpio),=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset GPIO\n");=0A=
> --=0A=
> 2.34.1=

