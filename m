Return-Path: <linux-media+bounces-32873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9705ABD1FD
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93E0A7A3016
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE989264F88;
	Tue, 20 May 2025 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="CKpjkFfL"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020079.outbound.protection.outlook.com [52.101.156.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD42566FE;
	Tue, 20 May 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729886; cv=fail; b=GLrM28muBkQWCMy4gawxXQKoAdMlcgXMksVYuE19jPbOf1pFnV4NBQFXRNgvVuYLxD8YkH6pvh4OClC7GouacJcZ5snz86fBWzqTdW9e+zlVsFD/EJ2KCDajgvOCFtVvTdofNLeKbPJOAlC0HJYFfj8G+zz2lajNHFy9DQg/AGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729886; c=relaxed/simple;
	bh=IMMzXbK1Y3MBwrX0EpWF1Y4Xw3/vmQ7z2VKecQwnQPU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QLmilMjNKR9ehBN3jWBMHm/LBEs7XA+mLbE5Pk5rKzGzR3441VkTmWc4RbXOo7w4bQqjSweevki9j2+qZXddMd/oaZRocdo7YKBq1cZVk7/rxycSBbHPDz8CkHhB8N0jB+Ov4rkI4kj70nTGs3e0MOotFjN+QtzHbEMPykEJMPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=CKpjkFfL; arc=fail smtp.client-ip=52.101.156.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Of/EfBEPyLrAukiw629mufTXDpr90lodm7LlMDINoevrD7RWjM+VDmFAZQzalDFyf24hMGfzHSxpBKX5CKopX9g/OYdAZJQFCyUW2wvOvNYq/sGLRBwpihYHYNx/PP0fV5F3nYAjjeaflwkJX1+Iw7HDYds+hZS2Cg+TaU6UTooSfuhd8PIwUcVMVlktj5xNI9mnY+D9FkRhH5pHQv6JJoJZBgJKHDwYw/4G6BNzpssSCgubWl4SYvxqlu1LGW5lsaWRpMRg4m68PbjWPfdOkUh/5U69BH59VAJZBY50zd381UghcDgP0w7/kjgTbatLvqbFqGdE0+Lre3u1QCvPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdhLenwT2iR/k3dNRgX/XEEHtstqTt0YONas83M07qY=;
 b=uUKmXOt90UiEgWpk+IUmKM8/7KR+DZncBc53vnYRA3MvTYSF6tlI6K47fsV/np/q6Rw9R598RpbJnNvaXRpcW5jv5I0CjfpUMM6Tmy2xxVewbPn9dKvDoC5NLD/SL5zq5eLbzCnn1dburJaTxGkqJkRZ+N9so3C/1fEbX5AT5GgpM2vf4WRJ+36Ivd/7Q6/bTP5wNfBeCmRXn47sbp+wPUcMbmg7z73FQrVEn9L/NX/Wr4a5lKtR9ZPXXv8PvPqGrVXxiMN3nsu7Wcu2/nouagN8JANEHa0vuobZTaMS2z7dOd9xaZZEBIV8kJNv1CNZMNz7SDbwgm5k23gI9e9miA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdhLenwT2iR/k3dNRgX/XEEHtstqTt0YONas83M07qY=;
 b=CKpjkFfLWwRSAxfYNx7jJ+Ec0yEVit2TXGd/NW3BYtqR2f5CKQjksV94cVjuhbmCdTy3kWUeWg7fhiDHQJ65CcwFll64jMLwaCMW4eBKHHNnuALqsEA7oRtL9noWsVhjSEzQXTJQ0kpdtGkiq8qUrFpfrbtvHoDld/Zh9oZuPNA=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB2242.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.31; Tue, 20 May 2025 08:31:19 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:31:19 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"marex@denx.de" <marex@denx.de>, jackson.lee <jackson.lee@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index:
 AQHbs2lXzy1gLrNeZ0ijKXj6PUT3srO0NFSAgBWF9JCAAHRxAIAFp7/wgAWGbQCAA/TX8IAB596AgAAXvuA=
Date: Tue, 20 May 2025 08:31:19 +0000
Message-ID:
 <SL2P216MB124663E8210291761226DAC2FB9FA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
 <SL2P216MB1246002B8EFD5CBE69E447ACFB96A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <cafba18a-5391-4d9d-aa4c-2f06f93af0f8@kernel.org>
 <SL2P216MB1246B1DA93D85C1536476D74FB9CA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <f9eb4322-cf6f-445d-8ba8-39182325ca4e@kernel.org>
In-Reply-To: <f9eb4322-cf6f-445d-8ba8-39182325ca4e@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB2242:EE_
x-ms-office365-filtering-correlation-id: 78491408-e26f-404d-1174-08dd9778b1db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EBkGGS7P/XGJa7qH5wrwIbvhxIqvocguBy9AjFEz/vYQdoEv1MbJ/p9gBfLa?=
 =?us-ascii?Q?iSVEFxLU781BxlLF1cKkkoR/tVJNcetrGf1iBWZOMwT6pKeGgF/KaaGK/myM?=
 =?us-ascii?Q?5nIWcFim9GojUk8a739F80ZDvFE7W4bd6kYqbVZaoDrEaCXkzrVWfEINvxJ6?=
 =?us-ascii?Q?S/TQJGGN+93jQ9iHKCiMS0AeOReuna7H7DbS15a9qjFySmqqY02CW/8zCafr?=
 =?us-ascii?Q?Gt09j0pWEUlVJUr3gClCBLoAr1dGT1m8VkByyF4cz+NIKwydXMg4Cs2BsHF4?=
 =?us-ascii?Q?EWokayQqYCpxmaSOtdLmGWYmF7wJmRRaDHcFWyx5lUbv9FScDwI+GD0MT913?=
 =?us-ascii?Q?Us00FHS08oA4KhbpeGKFTV4JuicfDWMseBEbBOCo+IPD63W8LogYmqZH37GI?=
 =?us-ascii?Q?EaE9NRIo60gxx5yFGc1XNncZSlfsRzadByAxWOg5xDiKkg4HT9IBM7Nkyo/H?=
 =?us-ascii?Q?Qi+wxmq/SkdYYetcSpFWZNheuRJUD441RUtRx8Lg21dPdhFUDlOwlOPdVJxw?=
 =?us-ascii?Q?eguvSKhsZvDIl6ICsqB4SFZv4FIvKOTw8nBylv1S49tFRlneFcuBGdG/oURp?=
 =?us-ascii?Q?HpeJWcwL+TUFgwDvKIRX3Jw+nvBWhn9W5/1TJ1B1dhZ/gWWeU2plLbV9m9z1?=
 =?us-ascii?Q?BDoC0rvuF0ngT7Q0t+xpiKCnijvhI4+yNHGsMeTjqd2S7oW8RxjpgfADY4d6?=
 =?us-ascii?Q?deps1B5z55IIfY6yzRum0mnz84qQjU0hSlbP4E4Ck1dqtQx2q4imbkaCGkf2?=
 =?us-ascii?Q?pz46CFeeIrt7ho0coV9K1hzaArGRSVvNNUKKIElMPH5bEMBs59PGx+oU6IT5?=
 =?us-ascii?Q?V0Lt/pGO4HTsHsfmmLDvk6Md/ILXs5YlT4LkqhMSYSihAASlPl9WCbZ/IzH/?=
 =?us-ascii?Q?cB8ObcF1S/kAg+GVcQ2wOHbnzooUi6p0WVHzS8nRqpHuUNJUD3PgzyQEso5R?=
 =?us-ascii?Q?G55zKu56e9vDXYqIBGhsf1jML8eUAfyGFd0dGUsV7mCUFz7G6ckiG2hbnkzo?=
 =?us-ascii?Q?hI6SpSpt7xGIATrea5lOGQZP9Lmn0l5q6xH6FO6//Kvvc5oD09wJYJEjR+nx?=
 =?us-ascii?Q?zHvGOpq/IfpE2iyevpmVaA+2f+9iDJSXSxK+VvQ9oJ7nsvet6f/Rmv3PdnNB?=
 =?us-ascii?Q?2bvelJ0rd33PVHaKETv8XeLJlmzxHsGlXr2TiyvhFSb0Qk/GEZc53J1nFifw?=
 =?us-ascii?Q?qzas6Q6EhNCr9CUFBfbjv04Jha587Hgdbas1VzFSk73OPO+MJJ5PP0ttRK0o?=
 =?us-ascii?Q?+3GTjUwgb+r3QiDImjaWMfLKQfj+y8GvG2QsbU5IHBoFCO2wJzkjbgPYScqq?=
 =?us-ascii?Q?AuGUQRNM2IOivAL+pJ+OH84LFW4Izm/LYREyOqx0boyQ7qOJj4/woB8LpPdb?=
 =?us-ascii?Q?YvNpHHl+WrgDgTeN8tsctQ1iODKLhBfmnhCtnpvbrwMKnZu9dKXexDL4GtSc?=
 =?us-ascii?Q?ZH+jbO7JjxldgIEjBuuHC8grXsJ56h9ZJlU9TXfMvQpA8Kx1c9CYpw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n/jBGIlNNpj13hq8XrjQkbvB7HgtfMAbsr1aElhYn7GNtJbfOW8gh4OiDZ2Z?=
 =?us-ascii?Q?EAQoTOtUaiXKPX4/8OzVkcWA8V4hVzCK0SUJm9CcsUL4NPPZuZqnq5DzfbfB?=
 =?us-ascii?Q?N2ldd5xH9TEbhRefCjIlwSc3338oQ6onFcz5d6pWAUtSN2iWhcM3UVyJrYgR?=
 =?us-ascii?Q?3R08p8tpOZQyU652YGrF1yDyoHx0uPiADwXPv94f0D0Zt5GeFY0SQF8rR08M?=
 =?us-ascii?Q?VhXJJNJWI191Z0Zd9/NZAiLJlYr5O2Sb1lBFQWvbQa0DYuzHP7op9cEO4IqZ?=
 =?us-ascii?Q?N9wcNtFn/735qkGkRCNnWSOAiiCNytqtQsHuptOx4/CvtCs3xHyaY+TW3iDi?=
 =?us-ascii?Q?2gia62gdTtYvbUkFqExqr3zyI8l4eaRPDLmxmqAsDor1H9WUv6e70YqGdDd6?=
 =?us-ascii?Q?1uSyydCJ8/mMZXsYB4d05nhZXsKeesx5B2nn1C3DKI2sQ4nFqQ+ATokWXC1y?=
 =?us-ascii?Q?s49pR9O1SCWzGr8YA9ADAuUn0dhj2Z5C1qnee9weCyw7GUIS3c7ANJm8SI4a?=
 =?us-ascii?Q?Wni4BnuF6ixYcz+ch8+gC9Xak5F6hgqJGyF/VHKgywKvMrce+5ME6436+ym6?=
 =?us-ascii?Q?NRJXDbFKCiUJPLmuOv/KqZSgSO1kAgBNKOI+YhQKRrIXvTTIOguYMwqAIZ/f?=
 =?us-ascii?Q?VMg8qDDebAUpX0yTq5v/G9IVZB6EqeEdpAXyIj1cOLcZCeXhe8/JxoHrfgp/?=
 =?us-ascii?Q?nFYF0SWtFChBdKuch3ryXCzKX/dMT+CzygMBFjYC1jduuy8aP/R8U37ByP0z?=
 =?us-ascii?Q?oUv6aIRzAYklgsoRSQ/qlUy1FSmk2JBGyDLQ9T13cguvOLhBybLm8q18ygK/?=
 =?us-ascii?Q?jBe9AniOeuuTy+yKzwxgl3AUO/pQE8nuUvlGLrtd2t5KtXSbRDP7a7ccDNCt?=
 =?us-ascii?Q?uU9lNbUcWz91cCYuSso1dpUkV3HdQCjBrGZWg9La0tdjejxqQEHAgKEJG9Fa?=
 =?us-ascii?Q?0x8ct555/8xPjjZ3dy51SSVmv8bxxHjujd/5WNpBGHZSJEG11lsUt4UMNSS3?=
 =?us-ascii?Q?xlFTMQo1iUnxouo2QqJtNgDCszRMsdnoir+EUdOQQxwE/MtABjfp49ZnosNn?=
 =?us-ascii?Q?loK+DW/x4/Ve6BuW+RMvJsfpnYVr9h+Ik1ViMLD478ZxiQ48YYOOohUcNsYw?=
 =?us-ascii?Q?vPYYJkJp/rjT7j+2jLki0G+6tNVSj5UHDWYICSTPY/F/FjZ55Vxcffien2/j?=
 =?us-ascii?Q?Wn3l1WA0teZojmlzztUGYZ7L6Z19mWZcI/XpzhWYxWzkrrKWiVlxVqI0l/1W?=
 =?us-ascii?Q?sB41QlMCPrwDAz7Jkv6BATu74ia+T5TYIEpghNORrWW6FQFL1OvPduCvvqkc?=
 =?us-ascii?Q?wPdn9UptJ3EZJTLjZtc74FXFTs2Iq0/NCNXx29EK+PcTilo5i96B2G6VIETJ?=
 =?us-ascii?Q?8bhAqOy+zq1cBNRiWaaGNkdGrU0V3sgu96uZUpXbS02epHdK98g2HGVf4vss?=
 =?us-ascii?Q?Xg/ssHuAuuEscYtEik8iDs5R8Hnx3QPLnlM+3EKsgK9wra+I/a7kUrUbpJfT?=
 =?us-ascii?Q?tffZcnqUFrA0pGTcBfbejkFBTcU9QfALu7hOju5wKTWwfpBDfwPsnFJpiC8h?=
 =?us-ascii?Q?5m+FANKiLqqFdaFTIQ48X2xs0qs2jVxgIkXhYbCq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78491408-e26f-404d-1174-08dd9778b1db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:31:19.2194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgCsp/JHwwFNfmTnBGNUBMYQ3/rirScXfjw6/s3iVm5T3OMfKoKl2q1NRwsDQVXQNDtUUybbyNJIhs3O6hiRojIAvclZW2Ov++wuhlMQCJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2242

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, May 20, 2025 3:27 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>marex@denx.de; jackson.lee <jackson.lee@chipsnmedia.com>; lafley.kim
><lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 19/05/2025 07:08, Nas Chung wrote:
>> Hi, Krzysztof.
>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>> Sent: Friday, May 16, 2025 9:56 PM
>>> To: Nas Chung <nas.chung@chipsnmedia.com>
>>> Cc: mchehab@kernel.org; hverkuil@xs4all.nl;
>sebastian.fricke@collabora.com;
>>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>>> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
>>> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>>> Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video
>codec
>>> device
>>>
>>> On 13/05/2025 09:39, Nas Chung wrote:
>>>>>
>>>>> All of above are wrong for the SoC...
>>>>>
>>>>>>
>>>>>>         #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>>         #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>>>>
>>>>>>         soc {
>>>>>>           #address-cells =3D <2>;
>>>>>>           #size-cells =3D <2>;
>>>>>>
>>>>>>           vpu: video-codec {
>>>>>>             compatible =3D "nxp,imx95-vpu", "cnm,wave633c";
>>>>>
>>>>> What does this device represent? It is not "ctrl", because you made
>ctrl
>>>>> separate device node. Your binding description suggests that is the
>VPU
>>>>> control region.
>>>>
>>>> My intention was to represent the MMIO VPU device, which includes
>>>> both the core and control nodes.
>>>
>>> Then what is the VPU device if not CTRL? What is the CTRL device?
>>
>> The VPU device represents the entire VPU hardware block,
>> which includes 1 CTRL component(node) and 4 CORE components(nodes).
>
>What is entire VPU hardware block?

I understand your point. The entire VPU hardware block cannot be considered
a device on its own.

>
>>
>> The CTRL device represents the VCPU, a 32-bit processor embedded within
>the
>> VPU hardware block. This VCPU is responsible for executing the VPU
>firmware.
>> The CTRL device is in charge of tasks such as firmware booting, power
>management
>> (sleep and wakeup command), and managing memory regions that are
>exclusively
>> accessed by the firmware.
>
>This sounds like CTRL is responsible for entire VPU block. What are the
>tasks of VPU block then? What are its registers? What is that device
>exactly doing?

You're right - the VPU block itself does not have any dedicated registers
or functionality beyond what is handled by the CTRL and CORE components.
Therefore, it cannot be clearly defined as a device.

>
>You keep repeating the same, so my initial idea - CTRL is not a separate
>block - still stands. Can you have more CTRL blocks than one?

No, there is only one CTRL block in the hardware.

I agree with your view that the CTRL node should be treated as the top-leve=
l
device node, with the COREs as its child nodes.
I will revise the bindings accordingly and reflect this structure in v3.

Thank you for the detailed feedback and clarification.

Thanks.
Nas.

>
>Best regards,
>Krzysztof

