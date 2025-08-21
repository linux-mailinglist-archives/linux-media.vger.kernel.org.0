Return-Path: <linux-media+bounces-40526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A679B2EF09
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E133BB56D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0FA257851;
	Thu, 21 Aug 2025 07:03:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021100.outbound.protection.outlook.com [40.107.57.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4054A347D0;
	Thu, 21 Aug 2025 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759782; cv=fail; b=ImZv3Wqv39AkO2GidlHcPp9ihvybCJCVhN8pbNeQl0qW0awKfHEkt/w2tvjNmd9VpkfF7oG1XTjniKdjNspj15PP88L8+ZTqAXhEMFHp6dn5fhYFweUCKwKbdv8SDzHGePiNJ24i9qNG2sf6WRpoMUaJWXPw/rayPT7jO9OTgMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759782; c=relaxed/simple;
	bh=QnmzStHYGvdRZq5kR3mvFDLjYlcZAp8YL6J+XxAg23A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VkXKDDtHbTJ/1ixNcQPJChhXUcbGMr26actQPOFc6Krwxd0hs+xi8Wg9xChROPCsprPiqp1SwBnWpzfbvJOTMyg1M4slgVsI39EVmIj26zt9tT32wTnnnOX3bO+sX5PaAmW4RzBMEBh6JffyQdQ8Kn+C7Fje7GvDAT5NqoEFktQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbMWGXIuR0iUytUFPs2LiZFcJujQo6eMgfIE2H+KulWAmgoPnHY4hrqzrd3B+VTy2B8ej1Batx3klqwJ4UharcwcRg/xCRAcvrqqHvyngARp/8Nz4/FDP0AcnHLFiNeG/kXZkNE52QwRbsBpjrGw6HemYvDq9y2TuASad+Jrs5Bhycj6xZKAMtt7JtqeNdACilD9tYi82xdhLFWBnawxFJcS1LY2yn2l+4H0dpKoIdsdU+9Q2JKDXC0wwwnYZtfMKLR144oh5ZsD6DZhTVIW/goq+3j2k0Gg1/ZQKHfN+ueginllfjUM5KnhApiqtzAL5PCYJIg8bMdlmjy1b4QR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnmzStHYGvdRZq5kR3mvFDLjYlcZAp8YL6J+XxAg23A=;
 b=NaYWvpeatf7KHOcu7RDEGJzfI65WIos4roWi22Ao67gKAwh/+ieQPNTv0aCLSKV8xGK/D+huQRIDEsR3yPjbYuRwKPLlDeWWdjt6r8SWR+ICZimbKOxvett9oLeOR8KGHJm+M4eoMnlJJ2pBoJ9SO4bZpXaLwF1/QXM+rfF2IMXyJz+f/gQJsDp1Ek/ygvmLLJMOoENMq4IskY7hb8qTYpdnPRS2Ykdb5vnJRSvLK8+OdfAiRdkilY3khzPzHPj/8QfiHa2lyfDHdMdgSwZpfzzw3wmPWbHn1mFUcE3gbjyVXV6dU75kfVJtyC/bZXPK1E+8pyz/lRveuCRJqDT2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3642.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 07:02:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:02:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Topic: [PATCH v4 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Index: AQHcEiQu66tLHTu4CUO/XIroA/71KrRsrCBt
Date: Thu, 21 Aug 2025 07:02:56 +0000
Message-ID:
 <PN3P287MB18290FA36D0299AE4EC601048B32A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
 <20250820224541.130229-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250820224541.130229-3-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3642:EE_
x-ms-office365-filtering-correlation-id: c0b22d8d-4b5c-491e-20f8-08dde080c15e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?G7ZFO9hqug6ie9RaHsdoQO0O/0Tbl0pMrOnOUhnm1N1Ef4NiPEG5BWA1Ue?=
 =?iso-8859-1?Q?zuQOkZ9ZkiKFBYrd7cxZe/vidYaTcui9c6JPjlqmbVXBBKlEJrsJmWXXPa?=
 =?iso-8859-1?Q?a6/Pe4iv/TqBnkYsU9ZVmx5IL2Qzn+Zko+y0/3VxtjqGVTdWGzQn13aXXj?=
 =?iso-8859-1?Q?WUSj7O6OBof1E+rOgmreCG9YLwQ5mmy2U+LvpZiZhdkPUtLiIjir/+Az6y?=
 =?iso-8859-1?Q?zD3Il9U8GCq3CfQNgevyPDZgwncFwP293ekI/0LKyR//0vS6BmIUMCmzAp?=
 =?iso-8859-1?Q?m7UaJqLdOiQt6/U4Wp28hVQH2gprukadZPGSUaxcJ0FrHuoIcnglMBluXe?=
 =?iso-8859-1?Q?2H0g6FN4jyynvlpW9gTWVejONQSf99byIRWsbUYOD8Na6ol4GeyjRQzuwy?=
 =?iso-8859-1?Q?LlRezjfGFvrGCDf4S+1HiLvUwNJwVXzJXstB4CGf3srUOfECX83V/ThSYT?=
 =?iso-8859-1?Q?O/z4VmeffeRbiNZsSofBPfaNdMlbmfJJqSaRbslxZsx2SwHl8nmVfS9x1Z?=
 =?iso-8859-1?Q?i5+ZRtlrqZI5RHey3H+cxPY6zPgcD2WCyevBTkw/YThzqWPqNjJW1M8iRA?=
 =?iso-8859-1?Q?a7I5Rynu/duHSg6tAoSZ4WZXpY2mWDyL/jeLmTw6JiHgD+43rYUNPZnh5c?=
 =?iso-8859-1?Q?1VVwE2Ti1HeYwqdarf5fy9VHRmrdfACx/n1yjjUzW+SM2f0nvTvu7IBTAW?=
 =?iso-8859-1?Q?t6PeG3/P6PzOZEoZ7qEU3oaTYm/JMZQOliB6O4QbKNIQk24AFNcMqVTMi9?=
 =?iso-8859-1?Q?CFGS+fd13DAYr3fLJm9ByhTTnPkwPyLBo6SeF0yATAygsHWA59HHOVApL1?=
 =?iso-8859-1?Q?wGi36VO/PUVX3LvXAy0tJqSfHD/EzasniPgzDbsEsb4cGmh75FHArUU3tT?=
 =?iso-8859-1?Q?suQQ9WS23gVHBqctJW4Q6XQV37P861lj3qQE6e0ZV412wPKbGuCAlk1KoS?=
 =?iso-8859-1?Q?QBFVriQPNxQxKnZw715KlgRNy/0rF+PUQhMsXRXbTER+j0VyaoprkswVcu?=
 =?iso-8859-1?Q?sPYYAnbS+Y81uWcS/PjdyGPhqE0C/5d2dfycQbzNiZ+yIUgQxQsP0PAvxD?=
 =?iso-8859-1?Q?mYfC1AhC/ArvqizI5nM2/K9Q9TKxTPLXBTdzehGfSut8/r1Mg2vvnfbIGf?=
 =?iso-8859-1?Q?8Bf06P52OtA0L51H/w4AxCGFtpu6Hxm8T9UiBzMw9UG1TtjTnSUX+Nyi/N?=
 =?iso-8859-1?Q?1EfbpZN2umU6cHTgXHuTT5oPshASyOQMlRDG3ovFzMrr16YXX1m+9EbVVo?=
 =?iso-8859-1?Q?TDgHu4dD2ny8g4RfUwhUnCGq2KHxy0K/IIsbVLpacGFHq47CjnwkmuNux6?=
 =?iso-8859-1?Q?vcoj+3pN1pj/ClM3ha/hUK89ikgSnSWMgtczXE+COWPtqO0bft8EwmLjdK?=
 =?iso-8859-1?Q?hhZyzS8m/dZ+AvHaH+HFvP8vnFDwEUFlGYCNZLBL7x40NL0xXkyu2b9JnJ?=
 =?iso-8859-1?Q?fZQX5QECVjWoasCTZZ5ilLqNWaAXANT4XhxaZ2XzmEZ+d2rvJBX263b3mR?=
 =?iso-8859-1?Q?9MaLaf0Hql658QEne3S92+yhYrj3ii2KtdN+kHEAPeiA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rbFOkQLKHRTUkgz0HHlHIrL/jWIzb4SmRA4NoM6ZGghtBQaSQPgaUCksyt?=
 =?iso-8859-1?Q?/yx/ucTWsZ87NeEJF6tpviU3UtDhMgYuDJ6tqUPbrfAFK+DeW9bqjbYJFN?=
 =?iso-8859-1?Q?b3b7VZ+avjgIHA6dXVs6zoRRbUymPdUBiyf8MeKLk7YLyE41J0NpmUcdST?=
 =?iso-8859-1?Q?KIOJp4urnFR3yFripJgdLQPFbJH47VLlDO/gSak6FyvXVkr4ZictYr1j7e?=
 =?iso-8859-1?Q?QxtuHmjTVuzE/jrJTeRVXUdINhsQDvpWvyJDNSr4cmTdis6KBMzncquABi?=
 =?iso-8859-1?Q?vMY8QIG5NcmrRNwyA7a7RghWvyyh2oXfu7Uu3keU5OqFdNklgAimFiFjpG?=
 =?iso-8859-1?Q?FrU2FLk1pLnUkWFe3qF1Qw3IZ9M4P4ujVXO13Cx2Sag/gVPfXikl0BXSYS?=
 =?iso-8859-1?Q?y2jS2HR2OZyjgvUcLtOGxPupKmCb8Q+vB/lK/BLUQDe4gdaTYl0QrhIjjA?=
 =?iso-8859-1?Q?soe+0IyjSzq+KjD7dsznRHq0C3MP3SmaH2iHuM35GUzULe1/QwppN6+S+h?=
 =?iso-8859-1?Q?G7Wfm75qgUxGMlyLxwq44rt262DPb/NSfwsELjWlDmRV+bHz8svlT9cIRO?=
 =?iso-8859-1?Q?0Kr+hQ9S4m1iXOpQPDRFF8LE/+Oydu/Cf5G+mdZfNbzyCnfCanjK5u0PVc?=
 =?iso-8859-1?Q?RITGgdi2Twf2GQBJEHOTcbujjXWFuFf4PicNd/BKAy8W11/m6dYtA3WNEK?=
 =?iso-8859-1?Q?cKmibxPa6hq2ko+wImTrjX/p+gwXcA4zv1cyttXjhoBbmWigYIibvnXya7?=
 =?iso-8859-1?Q?ZdLDT8/VFAZVCx8ecyE61rByIm80ajzQauyjt+LKOip/Niqg3FKZ76VxPK?=
 =?iso-8859-1?Q?hMt+zeMppCG2tHk2hc5E8ugmTCnNX+5GYfKRZLuuMiClK6iGXTOPxq7PPo?=
 =?iso-8859-1?Q?zVM7IJjAHKtLyPZsejCO0RKnFz+6HYVUFKeyjC3Fs8vBsJKLxPhTm8wlhh?=
 =?iso-8859-1?Q?ogShy72kO1BZoydxX7IkC1IlAuhHD9q9e+pj6Ry7MZvY6MIvtrYfBn8JlG?=
 =?iso-8859-1?Q?loLVBKpQtdrcrbkGqoOAAMm9Ro5dd6i/vaHrGgXcrMQqueSCIC8IJZ1msu?=
 =?iso-8859-1?Q?Ds0KT7G1x/s44VXZlTwtpDG7TlD8a/YdkDcWNvwfoYmXF2jCos0xPD6uuS?=
 =?iso-8859-1?Q?MCy04+24yV8CufrmJa6VqzqLyBfs2aWBv0ibjb/H+5+2LZvX3JS4+LggDH?=
 =?iso-8859-1?Q?mEjAQdPHsqEeXt8JlmZKzzx3ZSVqXJCEt7JBncmo3pwO0+ArmQmWrafrK+?=
 =?iso-8859-1?Q?Utar/bzvtJvcxvkdkIO9qz2+R+MRA5ZK12jHCvG9wFotaC9Mu3N+yZbWM6?=
 =?iso-8859-1?Q?oY7EFQiiMEyKVntye1Hgu+hVIOt78aYd73yhw7lHBgZcbhpRcOQmnFBquI?=
 =?iso-8859-1?Q?JWlGjco9Fc6VbibjiT871qkM5/wH4eHraklvqnLJkovjl1dMU/FvRLBqdc?=
 =?iso-8859-1?Q?cBSn65WPFnv4oyz1uKJHHz8La05krtvFd4gabYA7kkDqSQqZw77rpjpsaO?=
 =?iso-8859-1?Q?TmwSpIsdXbWmQuHUtWPK0yC+JPxKcs8e9B3wZMeQYrvQJd41UTCtQfDr/P?=
 =?iso-8859-1?Q?xtDDKBJTPylBTJAaSEvcZMSofQzEb8mW6VgAKM63TFJAGR9FUEIPel9t9o?=
 =?iso-8859-1?Q?cvqR3uks0Zz3f7Ll4le6m3FjwEW12e5GruWyOpYUUuu5ESTeWCtxIl/A?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b22d8d-4b5c-491e-20f8-08dde080c15e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 07:02:56.0504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: se2gBGoel3xPAMQvPEPXDb0PoMPlk5tl+GxlVLe6r8JM9guTaXIIrF2tAt29ikiVZX4Y60IC9NLmfDc86TkCkvK2xyoP+2xWUmbH9OJ97Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3642

Hi Vladimir, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=A0=0A=
> +static int ov6211_probe(struct i2c_client *client) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> +{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned long freq; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> +=A0=A0=A0=A0=A0=A0 int ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211 =3D devm_kzalloc(&client->dev, sizeof(*ov6211)=
, GFP_KERNEL);=A0=0A=
> +=A0=A0=A0=A0=A0=A0 if (!ov6211) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM; =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->dev =3D &client->dev; =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_sub=
dev_ops); =A0 =A0=0A=
> +=A0=A0=A0 =A0=A0 ov6211->sd.dev =3D ov6211->dev; =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=A0=0A=
I missed this here.=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
This is unnecessary, drop this line. =A0 =A0 =A0=0A=
=0A=
If thats the only change, then I guess Sakari will be able to help you. =A0=
 =A0=A0=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=A0=0A=
Best Regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
Tarang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=

