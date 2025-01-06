Return-Path: <linux-media+bounces-24268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FCA022C6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6AC162A1B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 10:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64B21D9353;
	Mon,  6 Jan 2025 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KM4JT/e/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769F1EEF9;
	Mon,  6 Jan 2025 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158739; cv=fail; b=NAcJ8Cc1wI1mKoILBS9yFyB0pRac0o8gKyn2XlPLaI1n21BzgWdX4tcBq6gujWVORyQCrmzMLH+RusPOjxXwFRZtpu2tNazILUy6gl478vfKMv3xBF31rq6rHey05S0ov8U7CpJzodSaU3PtnqYP0ZXihhZ+3wXNvKL0Oq05DcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158739; c=relaxed/simple;
	bh=oYC/g++IZp8z3WY2B3VTs9zSU5q2egAUsicL0OsI4Xc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LbWKh0UyldYDQmddDen61U5TsuxGpjUex0XnlU7ji8gYvJMvUHiUdI8zKTKgsSyu6Cu6HOfIZG0EAA2KbylBEMHl79oh5vbWnO8EY46XrTIVmFggvwuFxUG/cos84Wx7zLcgB6Hsi3etTfU6bv2fwofVdO+KSKCure7e2Kat7CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KM4JT/e/; arc=fail smtp.client-ip=40.107.244.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLqidLV5UDn40RGalENN+k/FCbZvrnMTi1GzrRt2eLlZtvQeCXsYepPE/orlaodAJl0wyrmE6TECCpO7M9NZQRJPWv7wEOI9p0QQDBXQ17j/0Gphl+8gPI5G5VE3f0nIpXoZtT/iT3GXO7VM+0uNbD90hHwoW0R0bHOFZTGt0uz4LN4q98nvckZXALayvblxRr8wAgEqa+jvlrZZsbwCpAiz0WbS2+4Q2ttsc/RA8w4ie9A570nkSPlUzzHlFmkTRnSD9Nm2SAnApUZW28x9TsaZDNHHzq0afoweSh65xi+6ZGujxo9izyu3Wzbct7BKD5prajPRHrKoyisRU0TLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QtsW808NAg/3onNsJR0AsQHcvC2h5TSQJDHYb2rooM=;
 b=jyY0Kxq+9ndrp+OpD5eDAbNrBkMRHQSoAXIV7ZRcYGxsXtpE6AYLTEGzg+j8mk3s/uwYClkatjRI0gkBSNsrnmcFxWuAUoa6FV+vVKHrSij7Ide7Dqj1vt6bmYQPUTjGECFqQ11+DRnKo6KXPnW88uDjw/rM0+F+7SyeUoDzY/3G84P3/GwdVhg9Nd4fsZ6K8Fbh627MA83hNdcdiawnEC9vYpyAVmHZKkrbBBNhvMkpp5Mpzmld4PdDlQOG4bzMIviw/1LoFrFiliN5gW1KcorfZr18JhShfkjjlIxkk4Q+ZvH8pWkr2tifJUuBA8U3dRjXHVd3OPH5uZb/+j05Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QtsW808NAg/3onNsJR0AsQHcvC2h5TSQJDHYb2rooM=;
 b=KM4JT/e/EIJPjLcfeMkjEiDGXBajpAdYKnKRBmoTfpGooCF5sVj39ID9PTcznOm7OoVLFjTQwAioaqzU3Juq5QXJY4GZ5HwnoXtk6nu52Y6jBtiBAYkL3xxNHyIIV+u/SNR1y7a7O2mWtfSq97XkgaSFrxOffxdWTJOhfMSrVSZZgoaTt0uXCIQF0o+zenGJSA5FBZH08WHriZnvNVtu2Rxd3F+XjLeQJGFL8JmGOvG/gzPNYNOTJJt2yralSTP3JmrLzW6H2kwkBoH3XeL/ce1TVpgIL7H5Y/QNWwDeMO+A0Jv11KYY0ycKT/baMIi4PwXAAm8A/tiYi9Mfz3vUPg==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 10:18:49 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 10:18:49 +0000
From: <Shravan.Chippa@microchip.com>
To: <Shravan.Chippa@microchip.com>, <sakari.ailus@linux.intel.com>,
	<mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <Conor.Dooley@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V3] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Topic: [PATCH V3] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Thread-Index: AQHbT3PAm4yzg0uTZEShPza+IPnrfLMJqcDg
Date: Mon, 6 Jan 2025 10:18:49 +0000
Message-ID:
 <PH0PR11MB5611B332DF9D41C8F55A17B881102@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20241216043926.445001-1-shravan.chippa@microchip.com>
In-Reply-To: <20241216043926.445001-1-shravan.chippa@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|DM6PR11MB4691:EE_
x-ms-office365-filtering-correlation-id: 0e54a14d-64f3-427e-e669-08dd2e3b8327
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7055299003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7055299003|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UhCuiUW+Wf3GOU4OF0P+hjqQ/dQ9aExg7wbRR2lEE+/S2WdggDFqWUB8ETZc?=
 =?us-ascii?Q?uDh2kz6C6kKd2F8hBLABwwQqiUWVM3clJxZl9gfsg35uuSi6PMgtUORw0mnn?=
 =?us-ascii?Q?SMp0HLW+g77HaXpdHyPbwPuBPCVu5TzNY6kMyh2Nw7O7xmY3fnDBYrdckuJ5?=
 =?us-ascii?Q?HXqfKtQUwSCHhW/P2N/oN4O4PtxnHxI3oqvvMra8M52z6ui3rbDmGtH2Seij?=
 =?us-ascii?Q?FeN1s6WJCofheJ5zhbobaCzowihbrWM3J87iAELa3aDr446THvXihX1bwJPG?=
 =?us-ascii?Q?J3aMEpiOipT5XFcfDcCTQBjfezyBT7tezmcQAQ0iNL5gq4xWBqkg54Jomk0F?=
 =?us-ascii?Q?OSlPGhm6QbSi+uJ0CtWMNcB6zkBtfse7o/isyatcNCd8SdeIYLtasRHSsf6i?=
 =?us-ascii?Q?mWycQrRwAcMJ1s2xxLRi66wF5Ib0ZeM6vNTKWk4TfmvZpEN0q/cj00O1UjDM?=
 =?us-ascii?Q?0NfdDKKxbdWe2W6BSM9MMEa2PfsLG7oaJZlm5oWiAmOlPtouRyjwQPdu5eiT?=
 =?us-ascii?Q?T1aOwWo8/vGJDgZZEVdm70maGyWORflgvSKsiJrjivr7WoElcvWJi8Gx12cv?=
 =?us-ascii?Q?71AhYQExD51hJ+A77thXOnBN9b1brkJiA6Gq3nunOwh874cfuPKnooJvmofU?=
 =?us-ascii?Q?aLTbR/kqMgDjQ7FkGjRlOCisuBiwh8QBetSYM8Y3+24fmzTQC+GhnXQyTrMN?=
 =?us-ascii?Q?K7fmdGAKUc6Ug8ONfglo1y6jO5Kn1QoGwSOgmnbnoOp1uBzKxAvDWAypyenh?=
 =?us-ascii?Q?fzqeKSL+P2o/4xpcbUFkvci5Z3cgevLEi9J25qc02U/FlzFtNTzEqbmZfQxy?=
 =?us-ascii?Q?7JP5pz+AtYjOvva14aCWlTjxrxyzpRn+70N9Fj7gzN5+VXAm9B7vwCK8OzZO?=
 =?us-ascii?Q?1mOSDI0OkaSdEHzSH9hC/8PDp6VEZzwB/UkPOl8ndQNCuuA4Ey8fpKNEq07t?=
 =?us-ascii?Q?CMtmC590Yg2o52CDq0AhuZJ6YCS/jf48JmZ3bOLv20eDA9xgfXS+fj4Wmf11?=
 =?us-ascii?Q?LcZboEXtsA3901rHu65/ALobEQtqvYinXMp2fSvsCnX62NIeeizQP7eZLDYg?=
 =?us-ascii?Q?PhQ58LBC9REsBesveQJHyFOkItXtW0aM8g1HjzM9rWIxrN5ioNIw/TaDnmdB?=
 =?us-ascii?Q?03euSgEjRn2eEm8jtxrl6PEr8wTM0akCaPisz3+PZxDDihdSQuN5I01NN0R6?=
 =?us-ascii?Q?czYyAAR88Ng+7NVblh1NFwVCTnb8LXvdE7VlqekF328eArlXk4wO1KLdXuuo?=
 =?us-ascii?Q?GFhQPQFIVVjl8B89s75rJIebPD+ePQAPpXmTa+zrYsan6OtEckchl+DH7A3b?=
 =?us-ascii?Q?CzrwUhJo6zDDUrhcOtBmB6G0iOjzSvC6Q/MbCf1OLVOWkk5aZotC/iQMk9JX?=
 =?us-ascii?Q?B6mxD/+zBDraO+lu+l8yeT2XVzbBJHSQ5g0qiS07wN4v9wJFbjaH/d5qAKFP?=
 =?us-ascii?Q?w/uSXc8t4vEgw8zAyBcGSwizm+FzRYshs2E8nfY0vNsk3KxKu5gEkg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?reRlhLLhfe3wtJvJG4YgSS8eSwKYqttx1hEUK3wf3N8UqCUzGGoQ5VIZUsYQ?=
 =?us-ascii?Q?Eck5Ym//kGqlRALzMFBXEEInwH6x01vn7IKHZtkphQfzDql9eofbPkJjiXhW?=
 =?us-ascii?Q?KHpDK3cMbi6+8lIHjdhpmxMDxXf6qV7yg07wwQrpx1RRioiw3jS2o0lKOgDw?=
 =?us-ascii?Q?tkh9AxLCVT0K2JZm01UDt6z7aIU+hMYwLjPvgzpX+VuWOwlK2G5W5bztt2U7?=
 =?us-ascii?Q?pw335J0hEF51uszFW2R6lP+QH2QU3MxJlIvenTVzU+AjB/jjP7toUI8ELjqY?=
 =?us-ascii?Q?YPAZ+cINCBq0rLlElqtTW9T7UMQoeGXIC1Ex+2gbiRZ9sqvZAiml4vbZtIbA?=
 =?us-ascii?Q?eQfalUaYMn4f3ldLgGzo76/MtCoOYQeKCGEnpKqzmu7m89fZOy8RrNTub0nO?=
 =?us-ascii?Q?kngT/P2zGSR1enT5TaS6u0cVR2F66a1KeVI4LpIm2/deXP5ct3QLYPmRcYbt?=
 =?us-ascii?Q?/3NW5ehunjErJhJ9p27nEtv5OGKNTcyyc9ERRFC+I81lJSE2Ej2zggmdJCHJ?=
 =?us-ascii?Q?J7YfXQ2vzNEqaL6zAusGg5LTbq9qJ1PSOQFYiZusDEWvLoJO4ug2xpe70Grx?=
 =?us-ascii?Q?Fd8aicKmA5hUYVFCHXDLA/G1iQRjU4WhDCmtsitlPi6561xruMJnu+JeEnZG?=
 =?us-ascii?Q?1sagOyU4af6sz70H/a9aWVeWGw9UVs9EBGK91wtwjjpazyMJqQYe9vhcbHL1?=
 =?us-ascii?Q?iaQayot5BA4dYlDWnywTT+6qUeV2840h5eokhsB3n68u//j0SqR+zuH3xBIY?=
 =?us-ascii?Q?SNdfgfKxFGVsCvF7NehXfFDF5eU2mkPc+fP0DBFXmRSepVTumicj80x3xdno?=
 =?us-ascii?Q?RsIaZ32CTMEsd/GJfb2dsiI84ArR5a1pkCk0NBbQs4eov+1oN3imYR1UUXGn?=
 =?us-ascii?Q?TlmUHsrsXQyP25mIVlqHpp7ObMCsqTpDEWrh+4EcM17Vl+woN6ytWeY6Kwlq?=
 =?us-ascii?Q?efJ5JIk9YF2333YRBSCx9CCYaEyNhbDJkzplKc0vcMIqXcow3v5Bwo3wRDQk?=
 =?us-ascii?Q?EYOESHzw4aiDnp4SEKMl9G//zsPN6BowDtr8IqA6BOWcW2N4e6U9LRKgX24l?=
 =?us-ascii?Q?oEztlQVx73ofiBThW79gdYJu47xOIG9DfvOj19nz4GqgIpeKAqAc/VkJQj3S?=
 =?us-ascii?Q?wFJ9XJxB2CAZnrXwj+V9meLxCrPB2u0skXMyZrvzB93ChrJMQ2f+BM6ObOEh?=
 =?us-ascii?Q?OknPCE9x27eEeZ3A3UuN+PF9DoLnIoamMsze2SQd0MoQw4gMNtHBZ8hbLnbf?=
 =?us-ascii?Q?e24ifErV8W/IR98yjvz6XWTwMXHWAoFgSD8GFgk1CmOg9riJeCpIS83oT1pu?=
 =?us-ascii?Q?VHQUUzZLjI26B537r0xHnc7ZR/HlFqtvfbFusNWsQMQqEk/1Cwv9VEijX3pu?=
 =?us-ascii?Q?YTwQgncZgaNt+I/Zn+X/45Pyj7aA9P95SMbBrXcBH7FtHsJOtEEbPvN+pVWR?=
 =?us-ascii?Q?/L53f1KT9OGNAmoswLbJc3mXeYp+VePxBCojiTXEbQ6uIv0EvSmdjLX9WDPb?=
 =?us-ascii?Q?+nPGRPVHNqDmirP2lyEf6twyWGASDA0TP9VffGvrnjPJ3zd9brkFWlDaOyvb?=
 =?us-ascii?Q?mQU2OKX96IvSX78R+bBuVeq6jcHAPtxtgDeWOAV99t/BfDNTUgz0gMdr8gBV?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e54a14d-64f3-427e-e669-08dd2e3b8327
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 10:18:49.4610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JguGrAiJKi2Izl0IJ2QVgyqTzCnD2QXyXCj5GvBlHY3HhhKZ06QYDzPbOEG3A2I8Xtc2+NOwPv3rUqrhpSspTLGoz33HnXKBcOVZtD6mT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691

Gentle ping ...


> -----Original Message-----
> From: shravan kumar <shravan.chippa@microchip.com>
> Sent: Monday, December 16, 2024 10:09 AM
> To: sakari.ailus@linux.intel.com; mchehab@kernel.org
> Cc: kieran.bingham@ideasonboard.com; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org; Conor Dooley - M52691
> <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis - M63239
> <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> <Shravan.Chippa@microchip.com>
> Subject: [PATCH V3] media: i2c: imx334: Add support for 1280x720 &
> 640x480 resolutions
>=20
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Add support for 1280x720@30 and 640x480@30 resolutions optimized the
> resolution arrays by added common register array
>=20
> Updated 1920x1080@30 resolution register array with common register array
>=20
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>=20
> changelog:
>=20
> v2 -> v3
> Removied blank lines reported by media CI robot
>=20
> v1 -> v2
> Optimized the resolution arrays by added common register array
>=20
> ---
>  drivers/media/i2c/imx334.c | 119 ++++++++++++++++++++++++++++++----
> ---
>  1 file changed, 99 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c inde=
x
> a544fc3df39c..58ad67dbb331 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
>  	IMX334_LINK_FREQ_445M,
>  };
>=20
> -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> imx334_reg mode_1920x1080_regs[] =3D {
> +/* Sensor common mode registers for 445M link frequency */ static const
> +struct imx334_reg common_mode_regs_445m[] =3D {
>  	{0x3000, 0x01},
>  	{0x3018, 0x04},
>  	{0x3030, 0xca},
> @@ -176,26 +176,10 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
>  	{0x3032, 0x00},
>  	{0x3034, 0x4c},
>  	{0x3035, 0x04},
> -	{0x302c, 0xf0},
> -	{0x302d, 0x03},
> -	{0x302e, 0x80},
> -	{0x302f, 0x07},
> -	{0x3074, 0xcc},
> -	{0x3075, 0x02},
> -	{0x308e, 0xcd},
> -	{0x308f, 0x02},
> -	{0x3076, 0x38},
> -	{0x3077, 0x04},
> -	{0x3090, 0x38},
> -	{0x3091, 0x04},
> -	{0x3308, 0x38},
> -	{0x3309, 0x04},
> -	{0x30C6, 0x00},
> +	{0x30c6, 0x00},
>  	{0x30c7, 0x00},
>  	{0x30ce, 0x00},
>  	{0x30cf, 0x00},
> -	{0x30d8, 0x18},
> -	{0x30d9, 0x0a},
>  	{0x304c, 0x00},
>  	{0x304e, 0x00},
>  	{0x304f, 0x00},
> @@ -210,7 +194,7 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
>  	{0x300d, 0x29},
>  	{0x314c, 0x29},
>  	{0x314d, 0x01},
> -	{0x315a, 0x06},
> +	{0x315a, 0x0a},
>  	{0x3168, 0xa0},
>  	{0x316a, 0x7e},
>  	{0x319e, 0x02},
> @@ -330,6 +314,66 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
>  	{0x3002, 0x00},
>  };
>=20
> +/* Sensor mode registers for 640x480@30fps */ static const struct
> +imx334_reg mode_640x480_regs[] =3D {
> +	{0x302c, 0x70},
> +	{0x302d, 0x06},
> +	{0x302e, 0x80},
> +	{0x302f, 0x02},
> +	{0x3074, 0x48},
> +	{0x3075, 0x07},
> +	{0x308e, 0x49},
> +	{0x308f, 0x07},
> +	{0x3076, 0xe0},
> +	{0x3077, 0x01},
> +	{0x3090, 0xe0},
> +	{0x3091, 0x01},
> +	{0x3308, 0xe0},
> +	{0x3309, 0x01},
> +	{0x30d8, 0x30},
> +	{0x30d9, 0x0b},
> +};
> +
> +/* Sensor mode registers for 1280x720@30fps */ static const struct
> +imx334_reg mode_1280x720_regs[] =3D {
> +	{0x302c, 0x30},
> +	{0x302d, 0x05},
> +	{0x302e, 0x00},
> +	{0x302f, 0x05},
> +	{0x3074, 0x84},
> +	{0x3075, 0x03},
> +	{0x308e, 0x85},
> +	{0x308f, 0x03},
> +	{0x3076, 0xd0},
> +	{0x3077, 0x02},
> +	{0x3090, 0xd0},
> +	{0x3091, 0x02},
> +	{0x3308, 0xd0},
> +	{0x3309, 0x02},
> +	{0x30d8, 0x30},
> +	{0x30d9, 0x0b},
> +};
> +
> +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> +imx334_reg mode_1920x1080_regs[] =3D {
> +	{0x302c, 0xf0},
> +	{0x302d, 0x03},
> +	{0x302e, 0x80},
> +	{0x302f, 0x07},
> +	{0x3074, 0xcc},
> +	{0x3075, 0x02},
> +	{0x308e, 0xcd},
> +	{0x308f, 0x02},
> +	{0x3076, 0x38},
> +	{0x3077, 0x04},
> +	{0x3090, 0x38},
> +	{0x3091, 0x04},
> +	{0x3308, 0x38},
> +	{0x3309, 0x04},
> +	{0x30d8, 0x18},
> +	{0x30d9, 0x0a},
> +};
> +
>  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> imx334_reg mode_3840x2160_regs[] =3D {
>  	{0x3000, 0x01},
> @@ -505,6 +549,32 @@ static const struct imx334_mode
> supported_modes[] =3D {
>  			.num_of_regs =3D
> ARRAY_SIZE(mode_1920x1080_regs),
>  			.regs =3D mode_1920x1080_regs,
>  		},
> +	}, {
> +		.width =3D 1280,
> +		.height =3D 720,
> +		.hblank =3D 2480,
> +		.vblank =3D 1170,
> +		.vblank_min =3D 45,
> +		.vblank_max =3D 132840,
> +		.pclk =3D 297000000,
> +		.link_freq_idx =3D 1,
> +		.reg_list =3D {
> +			.num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
> +			.regs =3D mode_1280x720_regs,
> +		},
> +	}, {
> +		.width =3D 640,
> +		.height =3D 480,
> +		.hblank =3D 2480,
> +		.vblank =3D 1170,
> +		.vblank_min =3D 45,
> +		.vblank_max =3D 132840,
> +		.pclk =3D 297000000,
> +		.link_freq_idx =3D 1,
> +		.reg_list =3D {
> +			.num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
> +			.regs =3D mode_640x480_regs,
> +		},
>  	},
>  };
>=20
> @@ -989,6 +1059,15 @@ static int imx334_start_streaming(struct imx334
> *imx334)
>  	const struct imx334_reg_list *reg_list;
>  	int ret;
>=20
> +	if (link_freq[imx334->cur_mode->link_freq_idx] =3D=3D
> IMX334_LINK_FREQ_445M) {
> +		ret =3D imx334_write_regs(imx334,
> common_mode_regs_445m,
> +
> 	ARRAY_SIZE(common_mode_regs_445m));
> +		if (ret) {
> +			dev_err(imx334->dev, "fail to write common
> registers");
> +			return ret;
> +		}
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list =3D &imx334->cur_mode->reg_list;
>  	ret =3D imx334_write_regs(imx334, reg_list->regs,
> --
> 2.34.1


