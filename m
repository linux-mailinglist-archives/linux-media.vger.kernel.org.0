Return-Path: <linux-media+bounces-27586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55CA4FC62
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D782216AD82
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E3A2080E2;
	Wed,  5 Mar 2025 10:40:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020102.outbound.protection.outlook.com [52.101.227.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5450207A1D;
	Wed,  5 Mar 2025 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171224; cv=fail; b=IvXnSoWuy7Sl+raIIXtgjit/RpRXsYRbP4OMBpsTTSA1juzsS5DESwuSnag3b7Bb+p3rE/wgA1kJnnhnrI4tAeQrdfWllEFlhz1O0gG/bhurjnrYaEjixQixIGyHytTnCOFMQEuWHXAzRHPvr14WG6S0c1TOsZZxjH8UbwM9jso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171224; c=relaxed/simple;
	bh=UMr6XcslBxPv8gZooZJ6jAcjildLVJlxrl0CJk8aMnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5D7zgfcK9hY2lp3UHb+fXgCSK9UTR3Db+JahrnYES+JmonwNAH2t9jGuXxVPuSqSLGS7LFGb9W6EfplcCGuSVnRV97Z3E9XxJvRbHlCRmOCBFpkmRtLh+q2EvBNIOGi9io+sfxBYo/iGqjQe4KxSvOdrHm6x/famHp0aIeBnrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsoRsomHN5e2EWYjaxj5paq3uueCZrycPi3WMiu3UTeMO8OFnjg26v+ere4wUqUCxkQJR5m+RukYHdkQl5nCoLaBpUEw7r+vjFEyQkxgHwxezcH9lIffrdoo6WmWMCKwxstWE7awxsn9EwKgJy/COSTOXj/vw5oGN5zxXo9y8kJV54lftd/CtLa4bOyUdV8Mb2kIpBu4rkfagnOhRClKQZRy3vB0PQKFv3/96jSrRpcZlcMYBZ04TARr9K436JTo3TPBA3vgC5uogX5Oj2YsS1tUSJ9pSM47WYjHV7XTUdPBZ50QqpGxIzxdGb5s2M1Yvm/mkCxG0d3mW8HGHicQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMr6XcslBxPv8gZooZJ6jAcjildLVJlxrl0CJk8aMnE=;
 b=sTZv8i79uxU0wHpKkc0496LmrjnGBOzDcKTPh1GIenQWB/uQ9WNDx4G0yVxxvUrsa2aBDaCMlG3HEfIR3kJtKLSSTvzgHbYW1Ba3iYfBq+Kn0GQgeajqH8ezovCw2dqDRF1cZ7FFvLFrZnN1R0ns/JHTr0SvqH084ozseoHrFuK+ecjtRCk4lr6XmahR6ZEpfV6KMlJ3a8HzY1Rk1O3nwwrFDXDQf4zJtpC+P/fl2oYQJ8upZR8LwuGueCY/XKK2ItQLYmBbrnCfncgf87a5mZDnvR5SIae7txgmPVawOMpTD9ujK16L8aFZhXQFslYHYl+DBtNyglbExXEHM8szew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0389.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 10:40:18 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:40:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Conor.Dooley@microchip.com"
	<Conor.Dooley@microchip.com>, "Valentina.FernandezAlanis@microchip.com"
	<Valentina.FernandezAlanis@microchip.com>, "Praveen.Kumar@microchip.com"
	<Praveen.Kumar@microchip.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Topic: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Index: AQHbjY3ybopw7eby3UKDaLaWcVfpRrNkSL0AgAANEQCAAAEK5Q==
Date: Wed, 5 Mar 2025 10:40:18 +0000
Message-ID:
 <PN3P287MB182928F331D4494E423BA3158BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-5-shravan.chippa@microchip.com>
 <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
In-Reply-To:
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0389:EE_
x-ms-office365-filtering-correlation-id: 7b6e0d5d-a76d-469d-4ae0-08dd5bd21f40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?/e35OtdoYE+02vQFjQXGRM0KFR6bFOCro6gUmt0+cZSIDNXHUMr8i0ot?=
 =?Windows-1252?Q?MisS/C/t+x8veMkRwGsWPrZ9y4wcbN05SAfHwy1efE70+lW9AeixYm0U?=
 =?Windows-1252?Q?X1z/A18AZ64xOAx/loFH5yUL+rKOtuYg3q/GbbK5GFH4BVrin/h9wBCN?=
 =?Windows-1252?Q?n5M3ENmeXUzS77uvT7v06ozRXFSpu82r6AnYF4anTcYea2bYzNF0gcWO?=
 =?Windows-1252?Q?hRC5dX4krYf4ynY1BIv9J+6Rd0meOELW935F7KVQ5L4m+TGfE5BOo2Qy?=
 =?Windows-1252?Q?jrnBhmI+eBkouG9a3qp1KPdovC+gpdUXSZQxFp2lMoowZL4Xkxj+WgOD?=
 =?Windows-1252?Q?Sy7NGyOy+eEZz9OYg1zPOjJaCqqY5lIedgVXP4oLC5hH0Pel07BzD2+Z?=
 =?Windows-1252?Q?/PSVxY9XlTrJyTXVupwphdF+igB3epMftGpZQj2uxCs75vupEXzEOYoD?=
 =?Windows-1252?Q?9uCCBPASHIkpFp1b6bOgvBmynSkjym/RenEmYTU9SgiqH7xH1hZ3D/Lh?=
 =?Windows-1252?Q?2t0ceuwsYc8RUzB0FjE2XxInJ/WuuDwhi2Uo2ke35JOre0nlKvKXMUxn?=
 =?Windows-1252?Q?JrcBjyjwMFf4IQRbGEKXnzaXcACPMxeemdiLh43G60+v7n/HfjlUfDGN?=
 =?Windows-1252?Q?AnUTpyQWKB9YtzXQHsXjrl8hdJfCEH/jeVLR/1fyJnmDwxAC6kaWDCx7?=
 =?Windows-1252?Q?CIJxgV/zxD+LQctscpFMKIoIrZjVEbsQq0xRhYSwHkihouX1rMvyZ7/2?=
 =?Windows-1252?Q?j5AE0SCaKvNoFz4fWJuBVm1mekOx+4TmLK31IPv2G919M05xu7Jwca7I?=
 =?Windows-1252?Q?TB+2c40As+u4viWbsNTuK1zTiGuUTJe2Upebj6uYxrHyhy8qOU5dT2V1?=
 =?Windows-1252?Q?S6z31jjWyaK+ed+77IL19PEmZNETQ4wKJVbahzd+D+01oe1Ve+wG9sO5?=
 =?Windows-1252?Q?Xp8f1KjnCNU+DSCWKnIPGITJa1RUf+IrFITE/6sk1xtUBFsFokZsCAkj?=
 =?Windows-1252?Q?JAffCIWN1/rX9gxqaxybzw/BXWqVYy8rkUyVvSeier3BwBhSzPItIh4H?=
 =?Windows-1252?Q?6yeHFk+rK5OCpQT4K5/qPJi0XscNIAab3/xS3z7lDXI1xhpKtZdmC0mr?=
 =?Windows-1252?Q?3oYRBZCqruUGw6FM/lxOULcGceb7+oXJ092x8IYz1EeL4ZeXJvawxl8b?=
 =?Windows-1252?Q?TD3I0/xHCwY1npFslwXQuUqJIg2TpafjslS8//JOyDwc6qL25VeeBvCs?=
 =?Windows-1252?Q?RZKmanp1yre/7XYpjUBTZqplUg4HUvJtWtFxEQsVm3s2/cHQhqNwoTzG?=
 =?Windows-1252?Q?BjFHAXxEk9xzLY25vU3pbW6MUvI/TrXnjbKH15Io8Ci952j8WTTg47vK?=
 =?Windows-1252?Q?wqLjiqX7lVnfthF/3ctGKrtmj8uomQZS28UlTJVnrtHBFldJomcFttT8?=
 =?Windows-1252?Q?wUQyzOZHDvgOlyfvcLoEsf8I/RLzdLM6Q/lzzpsYRHL4OMibfLjdfl4Y?=
 =?Windows-1252?Q?X+v1RlVOn4WmoXpSbs1XdGrA9ZG4PiuAFLhQSWIk8eaJAfqRmgqtLLvg?=
 =?Windows-1252?Q?bDdGN1FvqpmEAEJX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?kSdaq7aYlMfYusHul9ZhvNNYGm3LDmq+IzEk9UaU3ayMw/j8VfZ8O4Rb?=
 =?Windows-1252?Q?Hkqat3YETb/POWIs+N1UG2ZW72/3T5WtdusOGfXbTsHYL64wgALIXsjL?=
 =?Windows-1252?Q?xXUeiFpe6SuK3ZspSPH4D3R/igb2kzCdvdyu0B54Iz90A7hh484digql?=
 =?Windows-1252?Q?6dcTjIHfeSzOalvm91wY3NHz3kQWXb15SoKNBy4dZ3LCHk7l95xBdPbF?=
 =?Windows-1252?Q?AlFUZdnye3+/JxVKvF7/9RWcEi4mbFU4/qqdUsDPmRUN4I6sa/+m+vaO?=
 =?Windows-1252?Q?bdDopFlzPbKPUwLzsOJmHuHZ351LXgE9Gu5SwogWky3BEoNRzK6Eh8EN?=
 =?Windows-1252?Q?/ZFBh2fWWJkjRPvK6oF9ojOpigyXtCjuJ7K2pZmFdbK7j4BkZ7NUNil6?=
 =?Windows-1252?Q?++Mesc5fvH+Kww5JKzshJeenKYmqDTDrOiJvQ1mWIB0UxfwBxCU77UMx?=
 =?Windows-1252?Q?+/vTtRrhG/MyxDjy4QOm72wodrYttDralKOKwHB8KlhXpL358FhJiFMF?=
 =?Windows-1252?Q?uSTwOXZuKf5SAnwlKNcXeu3wCQXlSeVoJhWKfXzJ7WcVaC2gBx7AcrvW?=
 =?Windows-1252?Q?90LpHqTMJBQ+UbIhTNkhOdBzvmaokLRazHIcxht/+rBcww+3Yxxflvmc?=
 =?Windows-1252?Q?sj2CrFqIa2GuXoSsfeJln/nTuTpXnOZYyzRPOHRZXN2+jfUSYO67jvxu?=
 =?Windows-1252?Q?qSz18qfHwkbEkkdq/9/0ulr3cK2TUqq5Rbc0dELkCYfyUDj6QnGhM2Si?=
 =?Windows-1252?Q?/ijLExXiqXBkhZIbCzMnJ2EuwI02zR/1J4DIipijlve/m6GsWONwB60Z?=
 =?Windows-1252?Q?6zuaWUo5JSYlSmOcKGBYaY2ZbiC7IKznAHR/g+6sw4vAJqQr7MCc5KG8?=
 =?Windows-1252?Q?W8ACTTBhho+Z7ldEmN4KlXMOOF52OHXKnUysZD/oVanMcYUzDus2Dcq+?=
 =?Windows-1252?Q?BkmbT2E702Yu5ErybODbUAJGhTLqcVHKW2iPOhKmO0KEVsMhK2eQwWr4?=
 =?Windows-1252?Q?Ztsn2+p4M3oy4UWxJuEtmqyq52OqWG3WmXgN/DGVpCrJGGLYn0RYMV91?=
 =?Windows-1252?Q?hmm+qt0HdyPqN2+40geoBLwuvcRh9rWS7aX7g5rHLNa/bE4HzexPY4+w?=
 =?Windows-1252?Q?osVE3dZ/UFC7eum2DcbfR/HmGoxcH7EdORbUKoYOWsAPbT79fW8Kp/6w?=
 =?Windows-1252?Q?eFs8AtGutlkYkRjjGSK4gv/IM1NLk0X2lF0V+92NkIW4VR4Bt3PkKiPp?=
 =?Windows-1252?Q?I4d3zY0hzGA4DbeZbWCQQCD4qTRw3FLBKAdDWMS+guKfzWHwY5bFE9fU?=
 =?Windows-1252?Q?LuMiKyt6AzA5nLpr8cY+RR1nyqQ8tEjq8JqB8RINsvYihRuVb1S/srAx?=
 =?Windows-1252?Q?gHqEJjfN3P/OXigT0UY6AZABoZfbPQJs/HfVp8z/eqq8DwhblHx7bBt8?=
 =?Windows-1252?Q?rUj7WCvgr3AOvbH6bfTcGWQTfHBX7vnLmVMqz5IK8HhbQlhIHLNAmXtf?=
 =?Windows-1252?Q?stw6wFm/Obh+TZGHXfwpawlq1kjE6ND4/uu3ES/O7moxIBEmwunmjjad?=
 =?Windows-1252?Q?HM8/oQwBMuh7v1aovpVnmiFBzqZTS5Hv8H/FNtetLFAHg24JpK3vFBS6?=
 =?Windows-1252?Q?Btsg4GtkQ3khXzvi41x6v1xfQIfgbqrU+9xgL9YTcqDMATIKemRpomX3?=
 =?Windows-1252?Q?5ORuolnnruSQNydnVPD5bMLb4Lso0uQC3MOVcolsozFVKtip+wTnDA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e0d5d-a76d-469d-4ae0-08dd5bd21f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:40:18.1779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXfeNGo2OePzdAxqBLg876SQxto3St5ey17vZkH4iVarOJf+EJYoYPVNJcsNVYhB1Zc3QXBFzVotaou9QnaNyyuONA+czPS0HKr3yE8TRQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0389

Hi Kieran, Shravan=0A=
=0A=
> > -----Original Message-----=0A=
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>=0A=
> > Sent: Wednesday, March 5, 2025 3:05 PM=0A=
> > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa -=
=0A=
> > I35088 <Shravan.Chippa@microchip.com>=0A=
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Do=
oley=0A=
> > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -=0A=
> > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -=0A=
> > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088=0A=
> > <Shravan.Chippa@microchip.com>=0A=
> > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and =
480p=0A=
> > resolutions=0A=
> >=0A=
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the=0A=
> > content is safe=0A=
> >=0A=
> > Quoting shravan kumar (2025-03-05 05:14:42)=0A=
> > > From: Shravan Chippa <shravan.chippa@microchip.com>=0A=
> > >=0A=
> > > Added support for 1280x720@30 and 640x480@30 resolutions=0A=
> > >=0A=
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>=0A=
> > > ---=0A=
> > >=A0 drivers/media/i2c/imx334.c | 66=0A=
> > > ++++++++++++++++++++++++++++++++++++++=0A=
> > >=A0 1 file changed, 66 insertions(+)=0A=
> > >=0A=
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=
=0A=
> > > index a7c0bd38c9b8..8cd1eecd0143 100644=0A=
> > > --- a/drivers/media/i2c/imx334.c=0A=
> > > +++ b/drivers/media/i2c/imx334.c=0A=
> > > @@ -314,6 +314,46 @@ static const struct imx334_reg=0A=
> > > common_mode_regs[] =3D {=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 {0x3002, 0x00},=0A=
> > >=A0 };=0A=
> > >=0A=
> > > +/* Sensor mode registers for 640x480@30fps */ static const struct=0A=
> > > +imx334_reg mode_640x480_regs[] =3D {=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x302c, 0x70},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x302d, 0x06},=0A=
> >=0A=
> > These two are a single 16 bit register HTRIMMING_START =3D 1648=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x302e, 0x80},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x302f, 0x02},=0A=
> >=0A=
> > These two are a single 16 bit register HNUM =3D 640=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3074, 0x48},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3075, 0x07},=0A=
> >=0A=
> > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 =3D 1=
864=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x308e, 0x49},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x308f, 0x07},=0A=
> >=0A=
> > These two are a single 16 bit register AREA3_ST_ADR_2 =3D 1865=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3076, 0xe0},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3077, 0x01},=0A=
> >=0A=
> > These two are a single 16 bit register AREA3_WIDTH_1 =3D 480=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3090, 0xe0},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3091, 0x01},=0A=
> >=0A=
> > These two are a single 16 bit register AREA3_WIDTH_2 =3D 480=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3308, 0xe0},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x3309, 0x01},=0A=
> >=0A=
> > These two are a single 16 bit register Y_OUT_SIZE=0A=
> >=0A=
> > Don't you think=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { Y_OUT_SIZE, 480 },=0A=
> >=0A=
> > Is so much more readable and easier to comprehend and maintain?=0A=
> >=0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x30d8, 0x30},=0A=
> > > +=A0=A0=A0=A0=A0=A0 {0x30d9, 0x0b},=0A=
> >=0A=
> > These two are a single 16 bit register UNREAD_ED_ADR =3D 2864=0A=
> >=0A=
> > > +};=0A=
> >=0A=
> > I'm still sad that we can all know the names of all these registers and=
 yet this=0A=
> > is writing new tables of hex values.=0A=
>=0A=
> Do you want me use call like bellow API with register names:=0A=
> CCI_REG16_LE(0x30d8);=0A=
> cci_write();=0A=
> cci_multi_reg_write();=0A=
> devm_cci_regmap_init_i2c();=0A=
=0A=
I have made a patch series for this sensor driver's improvement, in which =
=0A=
I added the V4L2 CCI helper.=0A=
=0A=
I am just waiting for this patch series to be applied so I can send my =0A=
changes on top of it.=0A=
=0A=
However, if Shravan wants to make these changes on his own, I don=92t mind.=
=0A=
=0A=
Best Regards,=0A=
Tarang=

