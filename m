Return-Path: <linux-media+bounces-17140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D79645C0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5261F271B4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893B21AAE28;
	Thu, 29 Aug 2024 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s51DdpF4"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F51A76D1;
	Thu, 29 Aug 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936738; cv=fail; b=cxPxB6F+PpqsmUiMs9MQCsAy0xfWEmFt7ii+EjWDDyF/AMl4zxQlkOXQaKN02d8x8o0XZ3Yp+obgjHiUBt9Wf40Hk6aUz+HN0TztS0Fmf15PudxU4qH3Zx7NcWP/pVfWSDkQY6Bx9vBkwyqP2ce6mNwdMekflfWc/N9B1keR3XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936738; c=relaxed/simple;
	bh=PhlBg5GoYs4gYKJMCzJIx8G8SoxhbK4Ep4ZAAmLxA5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8CDTciTQeDDJepvj/9HmWpAEoUV93JBvJtvy5ramu0NusN92/AGMRuc/Y3VdZfUj5Gup0fYJC46Ja4mTz1p3xOM8tu5YtZiobZisA4w7lBsFyNoqm8PTWnDa5MPbchivfQElcFSX5wZt6t9UYmxv4XH457S6xlIqh4Td776OVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s51DdpF4; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXpWUAzf1vDC21WZo3rliVjP5zCX9ut0VzZItWWDoO7/M4pq6TXJfJ2lI4wC22zdp5YmfOXutOCqeF8CD2oxB/El445uCXNU3voW/f6MNCVbuH41XzpXvASTHB3hl6vNEK3j9o7KUYCZA1cN4UXpRym2RXdk23skhbsjijupn3PCPkRxi6Lok0i7Z90/xPDlzN27Zmvy5HehdyaipZXKKHYVFGVaJi+Tbsoy2VexvqHAar7kOfvS1CGlz/A4VhXTuiIQnYLDGM92lD8lOb+hrURNxdGJtw6Vs+dPKFSgT3SEboW9TcGaFm5jvRXS5ufe5506X5VYRVcVjAsQGg61FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5beVXPAf7A366W65rZ7bWItnsBc5lJ3kZXq1nY8imjA=;
 b=t6kbJuHPmn8OtU349g6cMQY4IbAuoF2sQpdCiJwbASqWkIWV7WohupDE8UKoxaYkH0mCAk7YfA8MUrDpGNuJjzm6JUHgUYBWGqDUtccC9J2UcNmfa6SYEZnmV31cH1RXWIrXNryvtbFKngnlWO3xpHWb4xvwdgOMaAbxBi322ZTGkCqy+REMvngkG4e8y5hctaQvU7gLFGh/22P6sVX+43nyQ+Imw6IR8cGSfeUQyJQVlxEoiuUECv9DcLyBNUqBNYZUBePp5ehyG6tfADhiG3Ar42EZwIuPqesHCBAp3laSAuehOV+j8DnYpVR2FBgUJIn+KQk5C+LvulrOwIJzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5beVXPAf7A366W65rZ7bWItnsBc5lJ3kZXq1nY8imjA=;
 b=s51DdpF4QJj0i9sIoF22kbrz7f37hpoSRGbRilRtvwZuLrbjtpTDLa+twMFKaMnnGCc5O5mn+fslZcRHm0jXtgTeZIhy1QlQpG1Ria6j9M7A4r1mZYiU3xC0Gjs4LdnhHbJFMWbHECR4TlULAud9BV80vRrF6MbbXDUNR427IMc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7794.jpnprd01.prod.outlook.com (2603:1096:604:1b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 13:05:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 13:05:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liao Chen <liaochen4@huawei.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH -next 2/2] media: i2c: mt9v111: Drop redundant comma
Thread-Topic: [PATCH -next 2/2] media: i2c: mt9v111: Drop redundant comma
Thread-Index: AQHa+hNqeWfKmpJgy0CBEsY8zTwKlrI+M78w
Date: Thu, 29 Aug 2024 13:05:30 +0000
Message-ID:
 <TY3PR01MB11346E2797E874A37FBD3D62986962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240829125203.539977-1-liaochen4@huawei.com>
 <20240829125203.539977-3-liaochen4@huawei.com>
In-Reply-To: <20240829125203.539977-3-liaochen4@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7794:EE_
x-ms-office365-filtering-correlation-id: 69f7390a-00ae-49be-e559-08dcc82b4247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zfehvlI/aunyN4iqGQoBvRfq4r5mZbtfJZmk3UWl/rEe5O8039HCLy0f5r21?=
 =?us-ascii?Q?LLxePxm7q/3IPJI8anpFi7qGvv9VenjOSvrDOK6Kcn7YVBqHyflG9l2MeEof?=
 =?us-ascii?Q?UTImq0oG1JzoLX9+Qym+zwla6j1UXnSUfr9791PmVnE7dhVZSXMyamwJzfXy?=
 =?us-ascii?Q?t/rA/MCAutS91aeL8c6Z1ifmHl6adOZ9FQIJpeSWJ+8ylL04bsk4+hXVAzaw?=
 =?us-ascii?Q?Avrff5K1iZGr50Nu2oQr8n2eqjAoSlG43BHZ98BEtdmjZFXjoraA3xMdyMJb?=
 =?us-ascii?Q?JLf5zUdWkQkVyB0OCS8wUX3N7hAMQiXREwFXbsZREP/3LLEvw3xckAUvDvQw?=
 =?us-ascii?Q?9mnMMgBj6w8Lm9126+eL4lAlJllnuetbROi9Z4vKMfnTzwd+W44jGNsNTofC?=
 =?us-ascii?Q?rZVuZNJIQQHwH5Y9QdHbdlo6KBh7n154Y1tBmQ+hFzaNDdbHC7oC+WMWPxP4?=
 =?us-ascii?Q?Myffh6ntr6Kc0IdgXxT3/hswGt6xTZI7vVjrMmsUJAeG/nz5qxBd5veR7GRc?=
 =?us-ascii?Q?IKnOgROHw+e38bJaRJ1FvUsGjeALCWhjM11f8VNzP8tPYXODaL27eWR8UtWV?=
 =?us-ascii?Q?49lt8F94Ey5lI7kyZ5sS8WsdDmt+VsqYNi5FtANtGvxZSpT5uJsu+XfOxDz0?=
 =?us-ascii?Q?WqddZ6SRp0Ec5RSKceWssVgdTr0p961l1x9WuzjaSsIu2ps5QVyehq1f1KeM?=
 =?us-ascii?Q?A5YXeTTnnS1i36A2ovAChSQHFK+0pESmnl9qb3MpCP3xshDEnHkNpGWjWtXA?=
 =?us-ascii?Q?/toWROnbmJ0YGQx6OWwzaYoitin8AgRiPTZzt8B1nV0KovEY6crG8vb82TPb?=
 =?us-ascii?Q?/RO8TjyeupQi/MnBy73kLKkBUxUyDV/UYStcmZWSFNEJScj7NfoghgRfx6fW?=
 =?us-ascii?Q?4HbqPrcce04cC1NryxQKY2mQlutwFfoCgTjLsnNAscRXUfemTikgQrBhxH53?=
 =?us-ascii?Q?/W6HZa6MsMiHG/C/7gbGy8vgdER3hV+SUx3UoA7lgkMhrr0XJ2W4Wu0wbBbh?=
 =?us-ascii?Q?4ocO2Hk2zuziVZ2A5Cb/bmSxXuK4CKvMGUpbxECcE+bA1HyZqOXYuj3HSlQ3?=
 =?us-ascii?Q?WhCLF+Iil/vYfAnis1XLDkaStiS4XMyF7A6KpIeVL8zDSWnEGMxS3X4+4lQW?=
 =?us-ascii?Q?axcapNAvy12sRQf6rqKJjZIJCc8l5m8npCLCTnYv6mjrxGPgGu0Xl0N5DGYs?=
 =?us-ascii?Q?htkFqN7WiFLal0l9ilhOvWFY3/b+YAW0nMPCrK3loPNkCzM2LkBjM/xR2NKE?=
 =?us-ascii?Q?GkYUK0CObLaNt1rBIeupHNzG3+egGsAt6wb7V+xhTX18WFb103IM8xgGo8up?=
 =?us-ascii?Q?3Zohd7S9Et5agtwZ7YxB9ZztUB9MxYiy3BSXH2ntYmt6b4+o21JAfj8dZ1xy?=
 =?us-ascii?Q?MNxGhL2d7f51nmQn1yCARbWizqyzYsVJ47fbZysmG0US4oa5mg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+Z28z4OzBz0lgujUJ/jQGKOaeRtsxwPYvu+MrNh5kNuAIaDCi9txRbmvfilF?=
 =?us-ascii?Q?Bci7fhAqcZ23mWPR5h80vCSwHMqcP2PGP+Quh4itC3wvtXuNFsk9SzRrHfCa?=
 =?us-ascii?Q?GU68CyEUWtsYDz4SfYJlPHacitYMSzsBVOILLkv8kW80wL69O6j06RK0LHCB?=
 =?us-ascii?Q?4IXOwqYQLQNOrpj5xKgodC9ZjAfV0F6xCdmtti+/dV2sfDmCb/JNqaikSu+l?=
 =?us-ascii?Q?MmQpVpQtZb1cfLUOlyhw6UFqoC+NWezUR44f2lYDxNQ9GKtsNwuDanTQbFFn?=
 =?us-ascii?Q?zPsRmULrV37lUgIf4k93a0U38v9Md7LfZ2FPH/B9pTMeaZERQnD/fkAaN9hi?=
 =?us-ascii?Q?/rUrpLg4hnIBx1bONzL09+SMT/+YpUjsz023TboTYO6aID79b0HNd6j7v99O?=
 =?us-ascii?Q?qJVRMBXlmCI2xjU6xs/0xED5dUKbhHyrRkcyo0dRtWKO7ue6SNxjuwHmZKVx?=
 =?us-ascii?Q?DsOhGIoPbN9xfU/mhzVQe7xR7XTUGPIsItTv5qqa7SX6HPzZBY1Gwliq+kc9?=
 =?us-ascii?Q?UPehPUp9crrUg3J0WDsWc1E4rlVgnoK33iMBcarOnDL+8cPkXde7T2dRrRZR?=
 =?us-ascii?Q?d8giTMa/RiV5lvGjPp4TmPCuYUpVLDCER12TeEmTClwF9UYlRNR+t+w6v2eW?=
 =?us-ascii?Q?lu2r84LthMRgnPol7Mf63BROovjb3bPs2POnTwYuYmy85q2z408UfIaqQ55o?=
 =?us-ascii?Q?HJleqmi6XSNOSdq3onfOplWTFaIRbizNvM7eLJmMkWhpASkec41QyKgYQb+K?=
 =?us-ascii?Q?2+8YsI67tlVUvSaJwz2Q+jxrU2pkkD5GYbPUM9gKD5rTNg0o6CQVjSE0mchI?=
 =?us-ascii?Q?NcXTmecHc7+OBIkrBQew5sj7wqj5aIPt4QaZolJjr5U5OK3laZ77ohyVUrvw?=
 =?us-ascii?Q?JUxjILZ5uB0F3AzP4NBMtIEMcZZZAuzlGtEDnzCPAmDsz0H8HZIF15Turq38?=
 =?us-ascii?Q?I+nDMmz37xmOutzhp3FwT5vybDPs1vAfopo5gpzwZoKziuvFlVAt9N3DN6R6?=
 =?us-ascii?Q?moAZhDFASkNii+S/UdY96pFwtfRtcttaiAeVILNVq0DbrWLrWDYbTHqzk74Z?=
 =?us-ascii?Q?5Kty82HJxWB2pXBhtdDBMFzziHwCaQLD7svt6Kl12Sp/6yel8zY7zaj6mVCe?=
 =?us-ascii?Q?YZsiI5m/CndA+iqFJLDs8b3SzAWsdcTKS1kVNaROpULOpGnaV3YAzqnfSvLE?=
 =?us-ascii?Q?MtljLjRI2XlDdhs9gYCCe4P6u16gk7PqF2wP6Ij3nd95Zni+ZDMzPk4qehET?=
 =?us-ascii?Q?XYSDc6fBFwV/VQcWFjpZdXcJeL73QvfLl2P5Yt7pZuspkH/yLApqWBMZ0+4v?=
 =?us-ascii?Q?FBPIbFHcfRzt9SEtX1pTJjXvxbpRX6JPg6Ch0+YA0uIINDpBPteeUiKsV+MS?=
 =?us-ascii?Q?Fpa4xFirezoHukTEoKCGX12Y4M5V9uWa7rld+y/817cBJCsvRTLcNShHYTko?=
 =?us-ascii?Q?4sf0OpMuolrVWtOpBGEXQKAOLTT9TrjO3w9MScj/mQQ2AliVI6gIwf0G02Mx?=
 =?us-ascii?Q?9eP5X8b1HVQpGK+IF0eMx1q418bldpfo8tMirlDYwJTbLPGAKuLg5yoc2FGM?=
 =?us-ascii?Q?VlKUCssik36zqrL94eQPy0vEa+r9f7zWyAUL9KaanWwd/+uxmYrwK/UCPg61?=
 =?us-ascii?Q?Wg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f7390a-00ae-49be-e559-08dcc82b4247
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 13:05:30.0438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRrdREdnqeU7WK2w/mhaul2rtliIyGMmQKs/YyI9ad+Lv8mFVmZctLokhYVN/DVzgXkFPNG9WcSV4OKJF/+/kTMsofw4FNlVfZFQsBSk0/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7794

Hi Liao Chen,

> -----Original Message-----
> From: Liao Chen <liaochen4@huawei.com>
> Sent: Thursday, August 29, 2024 1:52 PM
> Subject: [PATCH -next 2/2] media: i2c: mt9v111: Drop redundant comma
>=20
> Drop the redundant comma from mt9v111_of_match array to make the code cle=
an.

LGTM.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Actually, Removing the trailing comma in the terminator entry for the ID ta=
ble
making code robust against (theoretical) misrebases or other similar things
where the new entry goes _after_ the termination without the compiler notic=
ing."


>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/media/i2c/mt9v111.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c in=
dex
> b6a2623798c5..723fe138e7bc 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1263,7 +1263,7 @@ static void mt9v111_remove(struct i2c_client *clien=
t)
>=20
>  static const struct of_device_id mt9v111_of_match[] =3D {
>  	{ .compatible =3D "aptina,mt9v111", },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>=20
> --
> 2.34.1


