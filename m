Return-Path: <linux-media+bounces-26428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E2A3D26A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804973A7122
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 07:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D0F1E990E;
	Thu, 20 Feb 2025 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="X6A49+C6"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021141.outbound.protection.outlook.com [40.107.42.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3BD1E5734;
	Thu, 20 Feb 2025 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740036965; cv=fail; b=Ay0kqbmiC9+KC3NsRC4UCdt6OfCZLMLwimDVk3G4XTMWk3ApqVQT4LJXgyNsdNxn0rozmMHQRzKKFc/uQkWmT4O1A/trKwbbAG8jhSCveUL8DUtdp3EH6iyr1FPQacUMCEO1E7Ku8jOxUEpUvFai3qV1QWQG8pz9nrVwH/WHpyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740036965; c=relaxed/simple;
	bh=nmuk+g6NgQg1xTLi3aTl8XkUrwiqqil5KdlkqAdRiZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PSDkjtjf7f14tlmqn3ykizhnKLjaY8t6LWHLzP1aZNrtE1Gur754Nyqt2o1pfBWp3DnhskV4o903LljCNbW2W4+ePsJUT7zTmsMv6BL1EjedXO3o9vLSlussAAyTF/cj7WvG2fBrjsVfEZgtjpcJ4MQ8TM3XM9wFAXYebwdX2dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=X6A49+C6; arc=fail smtp.client-ip=40.107.42.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPnvXqOyBXXNL2EIxZ9WGCUNsl776ulmrEYadFGhz+W8Ywp5VF0NMNI23CFILb0gOeKD4V9e+MOMJgbyyL3UuSz/AE5L9p5LqHKzQXYr1Y4uvuLLQ7LsC/0W2s+l47yupgLBZtZhaCQAUr4L7geBJS2hUPZB+sJ2gSRt/jW7tIXrj5dcjLsas3TMrFyFmejNy62WOeahSM8xtpVgTwYyDDKSBxykpgE504WRctWtAz4O4idzCfg13PeMdsCBLPW+BDVMJk2G+zRGlRpjGPt+2XZBAa8UmfELkM56ucF0Evw7tgso+5Rb1yYheASE1RDzgSkYzvweX8WbwGXzZZHTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YwoeggpXno0S6vEOJ9ogNsxenm6Lc9FkkwLmTTFGOo=;
 b=nJuP5xMU36yCw8s9FEaUxvMTjTJpOsQC6dJvv1Xa0KXfJWrUJn7DXcPEN7b/ibBRnLb2uIYFvrqBvDBfiAmCyImS4+1US0DPlSkhqmqaj+UL7gAf2uWrlqX64r8CbLUiEXz0S5yzME7ka790vQBG6twCdiROCgBh1EnG7tE1CecfY75uD7MLv1LN8dJaNRynhGTOiMOI6p0lJSXMHzyM6Yzsdl00BlsbVxrheRn9dd76foH6YZEgp8nJI2XyOYG1TJiwPwhlj+T6DPAAUt8ychMwoClbno1C5PBn9vln2RFRsp5R7VtfGBLhSLenfNWwhroVPJ4CZIuCr0w3pnxedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YwoeggpXno0S6vEOJ9ogNsxenm6Lc9FkkwLmTTFGOo=;
 b=X6A49+C6wLYZheMznH2xNjRhg5SmQusvQWKQH1bgPkDT36Oj5+hLUAtyxp8p5oarwb0FrGG8zxYqJpFEqsfE2F6J/SnCii5XCzGKe41N7Ff8p4dgwpdCbvru8N8VmxOSUAhHLg2h+8LWPOpvvCUwwBxHgPWnugVj6VZfX4wPHik=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2780.KORP216.PROD.OUTLOOK.COM (2603:1096:301:150::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.16; Thu, 20 Feb 2025 07:35:58 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 07:35:58 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Thread-Topic: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index:
 AQHbe5s5kWTieORPDUe+7mHQ8+wHLrNAy9aAgAPWD6CAAE9gAIABLNMwgAh/LgCAAS48QA==
Date: Thu, 20 Feb 2025 07:35:58 +0000
Message-ID:
 <SL2P216MB1246F270DDE8CC8E21EA1DDCFBC42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
 <SE1P216MB1242EBEEAA36BE73AD466FB6FBFA2@SE1P216MB1242.KORP216.PROD.OUTLOOK.COM>
 <ec58d467-baa3-4630-bfb0-f09d366a9be9@kernel.org>
In-Reply-To: <ec58d467-baa3-4630-bfb0-f09d366a9be9@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PUYP216MB2780:EE_
x-ms-office365-filtering-correlation-id: f8b39722-e5a5-47c1-fe13-08dd518137bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?unvJW/BBBpOGN5W6F4TMMMe0S23hVW8XFmGFdD4ny2eBUFZoLazYbQWnPg3o?=
 =?us-ascii?Q?Rj2CeT4WKkYUg+rvIZvAHiVsA3TiPQ3VcBO9YY8520iD8VthUxh+yTKlgBQR?=
 =?us-ascii?Q?gYkTpybw5ysWQSqLEkC9GZPbPoeQWiSUWGi2smc/qtSS/i1759zpDys7OUY4?=
 =?us-ascii?Q?wo4pJbtM6gm1b7wiOrWbdIfob7MhNzvr6TWbLBjgieKbOuIuw6H0hC1CiUEv?=
 =?us-ascii?Q?Py1FCy1DA8XBKMOXofW6Nqd+EvdzgUnZP/+mJbtSw5jQ5CjxT7GnRmd+TPKn?=
 =?us-ascii?Q?J14alJNQALDxDOb9Le2sXv+Yb0uUVl37XBSsMY53j+tfAzVu7xC03jYjAEVF?=
 =?us-ascii?Q?+zdy6qXHP4PT15vgJLeEURP3d44sL04FlZo2u2rOTWdMJjsSKRtOj1GXZd6K?=
 =?us-ascii?Q?Y7qmJqqdEL+1jDi+65lWJiDnP3Uepjqf5MAfaqYbbrPz/6ZylCiel+ERy9Bc?=
 =?us-ascii?Q?Fe6gFZddTFlOanC0j4SNM0JRGVSMFP8tWnTZrxsJvxV6obRR1QRB/4BoQcog?=
 =?us-ascii?Q?jDUBVxQdlnFVoD/5vDrV8fEbReq176C4adst/dIgEPtAjBa/LEX7fUREWCzK?=
 =?us-ascii?Q?skmI1ax5+gTBTrMWsDuHhkyHMGvqejhFfNwZZqrv286gv2hQ6WFFTYcppJXr?=
 =?us-ascii?Q?tejXQy1ZXmRNH88EFgPp/fO2KzKsga/VC9tiZ2l05dhru/Lq1WZO7zDfCx7J?=
 =?us-ascii?Q?3O3gBJQUaVUaIdGVDLJN0u0ev3qOJw4dFe10jJKEtXT5gfR5d7DgyrMJuKKA?=
 =?us-ascii?Q?elM0xEwnDgd5Fmofl5ifmy+l5l2CIy7dEvQyaj9rhI862ejIOxSeJPfQ8QAn?=
 =?us-ascii?Q?jT9Xmjds4y5qNEss2LO3OxCsHgbW5PoA/509RbedP0+aoy5n3kY4Q3eZdaV/?=
 =?us-ascii?Q?yhaf4XdBl7OZpjl42kzQYyO/86SNW5yWDFY1obr2/K//ygoSEYkI9SdI9KnE?=
 =?us-ascii?Q?XTsG9baZ4ghz/Sp5No9FbG+yfLOCyKYejYgYJGOirNruY+34BdPwUxYdI+2w?=
 =?us-ascii?Q?zzj/PA4oJ4E5A90K+LZzdOjN+r4phiiGzWl+1e+OU6LHYaKbCR8tZ1cMDpAJ?=
 =?us-ascii?Q?J0mN+Bj08YKiK7zPtymBUp0VHJoplNwQUG9Z1aHB4l/dFw+RC5zn/5PIVXQK?=
 =?us-ascii?Q?54OwggGvRmfwfHpEaLABPVTsnwqqrOKzbqU3Sa1ctEiBMU3ETM2ieQL/yDPp?=
 =?us-ascii?Q?c//WILn9iMk8qzP1V41zBJpLIC9K/w8T9ncLE1j6cLs+UIUTZbZgPsefVeUs?=
 =?us-ascii?Q?lzoEfRRwlT6764VyxgnBdGT7ztsCMweutS9trSw69X4156NHL/6Sn0DH0d+Y?=
 =?us-ascii?Q?juA/M3xK4//OJfZZUkyugNyHp4E+fl7yhF0gs6W50RgzRfMl1K0WRpzygz5A?=
 =?us-ascii?Q?UCRTQmvOoJbXyamKWufxiQ2j+z5dbTDFPtpatGC9gUSvz47CUTqIDuztF2Sb?=
 =?us-ascii?Q?Rr2JdYuOGoe1D+msea+9velMw2aO+AgC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ghik4Nn6+0W6OjGx4pebhNam09+aygjflun60qRFHnaVgK+NwUNvwYOWFPcO?=
 =?us-ascii?Q?9fDd/Sg2r6hgLS1n7s2r3fSYcZoRABWsGvfI/K/zbx0hVJTcoAGFYcjCA/X0?=
 =?us-ascii?Q?21BVhnZcI0Of9ekEm/Xy0AH+AF5qu4VnYkNSiMQ33nw9X9MCSZvEz53gfFIQ?=
 =?us-ascii?Q?brBWdfTS4Hqb0Pp4yUF2dCf7DEbyFI+DpDPym65szlzP5k8lSPoEeJgbQIv+?=
 =?us-ascii?Q?Kz7pp4Dy3IIYmwjMQrjDkKHW04Dj7P0datz9gG/2TEQUpRMloj6g18jutunF?=
 =?us-ascii?Q?r1P9P0VRanXYwQZ8MRxYiVDF60hF3ckledopQ0W+L5AISR9vH1NoACspoOrM?=
 =?us-ascii?Q?WkHUmTWTv+LSagz1qMsksd4GDRWvZjApPWt5aEyPOvVYoxKDp+F77WxdPDco?=
 =?us-ascii?Q?Sozn04/U7F5mx8WNNP+Z2spGfnIQp2ld9vSXWVhS/h7YSnCjuskbNDpymRLs?=
 =?us-ascii?Q?+GCEr8+3bY4xzwqfLcx97/z/7GS1aA8jT7TBf1/8qTB/Djva6ne5qwkeURBU?=
 =?us-ascii?Q?pYCKm1PIey9XqAeUgr+D0SGBiG+a9qXBiZZoOOC2siaC+m/3WgbniHKODubS?=
 =?us-ascii?Q?0QCuHXB1478A3YQ2KLNENBGIxxrlBx5/Gh2PUpsaoWp8ipg08uSKAN+jmYpQ?=
 =?us-ascii?Q?YazjLtAtP59/8up2f6opcwlfiOz3exZwrY92UGWS+efs7wBUnRDSxaqBdq6i?=
 =?us-ascii?Q?ntWpcSL+qUt3ohnYfdc/3VBwd1yzEG7GN7a4H7dsrKAthnfn9nnd2a7Q/jAL?=
 =?us-ascii?Q?W4SzL7gmIvmTbThVa9fbFDj+MLc2Siuc0o6SeBBxtvy+n8Q9i6CjHjSlXSaU?=
 =?us-ascii?Q?zarneHCqOLl7PZUy9XGlI4DNCJ4qWLO2aOEbWK0l82dR4OTR5oLIoeuXPGCo?=
 =?us-ascii?Q?JU262xHY8i6h83iJHj6EMREZAPm/tuBv1dZriF9wofkVnWHKq6pAHWKYwie3?=
 =?us-ascii?Q?EdsRstr7CaKgxXnyo6OW97vSl9f0U6aT76UierIAsMUG7adeYbWao+8XfXkn?=
 =?us-ascii?Q?QKqEWaeV9WWpam0wT85/nSI7GPtjy01zevNRCEmeHHpvFD/pkS+tIyag0aFB?=
 =?us-ascii?Q?9zk7Xf7VdoShbTDZEgnzev8Yk0c7pwON9pfKstRjtuP7tZjZFTH3offx+IlL?=
 =?us-ascii?Q?vtyN42VCcNFnT5r24tCMo+y9+UN05roH3IPiBdnJN0WjBcfe7/GuYrcnq0JL?=
 =?us-ascii?Q?j1BMWz8pldY4YaIuYbX8TjiyeIOLSFGrQsNa0IeLCpY7KroGgvx9GO9AcoQt?=
 =?us-ascii?Q?gmht4pBYpBW4d6K74/m7Ce6XRh/53Ya1OMcZ5y9Z+KiJniOnVNwo2EHhAptK?=
 =?us-ascii?Q?jOzPWyr2EHRnKeak/dsF78WCZ+n5tk5LN7TNqD1FDOK9wOtz+tja2mpTFgwY?=
 =?us-ascii?Q?/mek+ZAdsuHvi70btu2TsPldU33FyRS04J5DhI3MBC9iDvW8i5MrH24hvGPU?=
 =?us-ascii?Q?pjmyNkktKC0cH7fIRrpMvoFn3ZCQ3C9a4gpZngb3qNCwLwOQ+Eu793bvQ1Yk?=
 =?us-ascii?Q?1TPpyw0lH5yVQTarTAD+rcpTOmOU3gr/DgpKgEC8RngjlKgppvuiCDHAMkfa?=
 =?us-ascii?Q?VFnTMr5drkdazgvFFe3bpp2liHahX42yvUzPf7Eq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b39722-e5a5-47c1-fe13-08dd518137bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 07:35:58.3958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZLN21sUQiDSjsRbL2VMizAXy6bFv4ZkQaPCI2lAIyijb9mtKDmCWPsG7/E8JPRoxy4t/sd76pR7OoJF2IqrCEKBbDms9ja39DHvdOtcjWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2780

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Wednesday, February 19, 2025 9:32 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 18/02/2025 10:21, Nas Chung wrote:
>> For example:
>> vpu: video-codec@4c480000 {
>>         compatible =3D "nxp,imx95-vpu";
>>         reg =3D <0x0 0x4c480000 0x0 0x50000>;
>> 	ranges =3D <0x0 0x0 0x4c480000 0x50000>;
>>
>>         vpuctrl: vpu-ctrl@40000 {
>>           compatible =3D "nxp,imx95-vpu-ctrl";
>> 	  reg =3D <0x40000 0x10000>;
>>         };
>>
>>         vpucore0: vpu-core@00000 {
>>           compatible =3D "nxp,imx95-vpu-core";
>>           reg =3D <0x00000 0x10000>;
>>         };
>>
>>         vpucore1: vpu-core@10000 {
>>           compatible =3D "nxp,imx95-vpu-core";
>>           reg =3D <0x10000 0x10000>;
>>         };
>>
>>         vpucore2: vpu-core@20000 {
>>           compatible =3D "nxp,imx95-vpu-core";
>>           reg =3D <0x20000 0x10000>;
>>         };
>>
>>         vpucore3: vpu-core@30000 {
>>           compatible =3D "nxp,imx95-vpu-core";
>
>Why do you need compatible here? Could it be anything else?

I will update the driver based on the final DT.

>
>>           reg =3D <0x30000 0x10000>;
>
>Where is the rest of resources? You created children only for one
>resource - address space?

Sorry for the confusion.
I believe the final example looks like the one below.

vpu: video-codec@4c480000 {
        compatible =3D "nxp,imx95-vpu";
        reg =3D <0x0 0x4c480000 0x0 0x50000>;
        ranges =3D <0x0 0x0 0x4c480000 0x50000>;

        vpuctrl: vpu-ctrl@40000 {
          compatible =3D "nxp,imx95-vpu-ctrl";
          reg =3D <0x40000 0x10000>;
          clocks =3D <&scmi_clk 115>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
          clock-names =3D "vpu", "vpublk_wave";
          power-domains =3D <&scmi_devpd 21>, <&scmi_perf 10>;
          power-domain-names =3D "vpumix", "vpuperf";
          memory-region =3D <&vpu_boot>;
          #cooling-cells =3D <2>;
          sram =3D <&sram1>;
        };

        vpucore0: vpu-core@00000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x00000 0x10000>;
          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
          clocks =3D <&scmi_clk 115>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
          clock-names =3D "vpu", "vpublk_wave";
          power-domains =3D <&scmi_devpd 21>;
        };

        vpucore1: vpu-core@10000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x10000 0x10000>;
          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
          clocks =3D <&scmi_clk 115>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
          clock-names =3D "vpu", "vpublk_wave";
          power-domains =3D <&scmi_devpd 21>;
        };

        vpucore2: vpu-core@20000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x20000 0x10000>;
          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
          clocks =3D <&scmi_clk 115>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
          clock-names =3D "vpu", "vpublk_wave";
          power-domains =3D <&scmi_devpd 21>;
        };

        vpucore3: vpu-core@30000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x30000 0x10000>;
          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
          clocks =3D <&scmi_clk 115>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
          clock-names =3D "vpu", "vpublk_wave";
          power-domains =3D <&scmi_devpd 21>;
        };
      };

Thanks.
Nas.

>
>Best regards,
>Krzysztof

