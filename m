Return-Path: <linux-media+bounces-32446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8268AAB6551
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 011EA16B073
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2034421ADAB;
	Wed, 14 May 2025 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="IdYvZ+UT"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021111.outbound.protection.outlook.com [40.107.42.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47C20B81D;
	Wed, 14 May 2025 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210184; cv=fail; b=QPVIkyuIYKhDZprKk3hjr0GnBoNqZGmamMDatFxGP8U1JHD2crmTmgAKxTJNQDI8m4jFrKu4hPrJWvT6fSzPNYz4DrUv40iuPHSKVulDNLr+5Dgyrka772GScqUG32EMDGEd7uMXAkjzslGNMfWGE1UicBk3MJP+pdM6Y39k6ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210184; c=relaxed/simple;
	bh=1T+cH998M9RNDa2TtkUD8bChrxf+8dYAbw1rv4OhRMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ktfeH3kWv1ZEifw3ybyQqcWmpVj6pXjGO/utJBkRpflJqVG2UypYOT6fKG66z74TbgDUJM/7iMR/yB16DOOlfana0CuuGfouqw1hh8A6Q5dtjfPSet3CHfkEzX865rlwXn08/K2ECF6KQ2ls1n0gLDMPdWRaBP2Qi0gJpRjirQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=IdYvZ+UT; arc=fail smtp.client-ip=40.107.42.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4lSD9BRoSSBAG1d90X5eh1933tPC7ASzzOeOGMJ4GL/YQlwPVRbr5g0e6OfBEBnUHaWDe4oIl0F9YKRnnOg39qG5Spxv/6ibunjitlO5g2FYAhTIyoemjLSShPFWcTuDj7agzU04LA8guf6IgrSOFxBYU+RQcJMD3O7zL0S7kP8IZ3MjjhfXPVPRQv6x5yqlS6D48GUaUEbMxEOHWvtveKlE/MHB0hE6rVlFI/cP1ABr5/HiFR/kadxpDxadw9tB/PINmJqhlkBf48/AMiEj7ISYCuI+fHbCWsLXPT2EjllV7ZfmQG4oBJ23R5URHZxKgiP7Z11lMsBujnAhZzUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+xbEiH2Lc6m+/0bL+/wiL/B+fBGvptQaxHYD46aft4=;
 b=qBFCtKTsoMPh+LfvMhEL+UaSCDID5OUAy8QRVnSAp97fgpgMozRPJlYxtiSQKbT+ZjuZYO0M61uE8sNJ8LWacJYG4Y4KfeQXfZnurDzX5mXjIECbmrn8etezPnMlHvgBaNFQkrgRHRoA0AImye9WZlPgoB2VX74blbktb7fW5kcQ4W/LEODGiiDwVDbCAnk3ivL8fQ7kiSflGuXRqkXOhn9oup4ghez5DyrfA4qjqU9Nzgke3AhTzsz4/yfP9uM8VEjqHjMHxSvhVJSNdlB+48zn8wU5ZuRMlRkJFke+PZRB9SXckBLytGU+/kwiGB3jK+IgPmEsJmpumPGuTcUD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+xbEiH2Lc6m+/0bL+/wiL/B+fBGvptQaxHYD46aft4=;
 b=IdYvZ+UTxszty0qyNcaE//hXEJHxoedqtNl+imMI5EwoOlx0ilqrJ01wM0h4N+qXD4it7Yj2iOoPnQkz61DT0JmXozC7uA0DWabfAGj7hIIhn4HlChigG+7YPnDT1LDCP7V4oggph/5TzO/UuivUsR9xrTBxN43sS1dHm5WFdm8=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SEWP216MB3027.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Wed, 14 May 2025 08:09:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:09:37 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>, "marex@denx.de" <marex@denx.de>,
	jackson.lee <jackson.lee@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, Ming Qian <ming.qian@oss.nxp.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v2 3/8] media: chips-media: wave6: Add Wave6 driver
Thread-Topic: [PATCH v2 3/8] media: chips-media: wave6: Add Wave6 driver
Thread-Index: AQHbs2lXoCN/WOZpqkuIYgVmbM3DXrOzGBmAgBPgW4A=
Date: Wed, 14 May 2025 08:09:36 +0000
Message-ID:
 <SL2P216MB1246B403C2904F92EB5E9572FB91A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <20250422093119.595-4-nas.chung@chipsnmedia.com>
 <f5778b751ee5044d5e3448a77032ff020d63994b.camel@ndufresne.ca>
In-Reply-To: <f5778b751ee5044d5e3448a77032ff020d63994b.camel@ndufresne.ca>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SEWP216MB3027:EE_
x-ms-office365-filtering-correlation-id: 30213387-2671-488f-5cd5-08dd92beab43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?L0KcMtd8soenZNEgr5oEATgTF2kgfBkoyrnX3yw9q4VMn9QlZjIB5J/n1g?=
 =?iso-8859-1?Q?iNsZjI1tdxEDq6jN1Wob2ZtH3PQPEUGVZk4yNgiTN2bYpNxr27b+XUoIQn?=
 =?iso-8859-1?Q?K6rikOPRu7Zv4bybJArcJxTn98rx0zS63IlDzBESw/OrVYUL0MjawQsKE7?=
 =?iso-8859-1?Q?Y7MdNj1R4Rk+Dp3i9yny10wHy4K3hxAfVT0ZP6Ff+/TWUYxTDSkiwuGEWC?=
 =?iso-8859-1?Q?xsLAapgSj7KZJTsNYLleHDGZpjdJgAotTxfa2yMYWJP5EmhgyCO4woFlcz?=
 =?iso-8859-1?Q?jkJdC6PJX16Pa240cIiIe6ckZv6HDkeHquCEbZd29H2b7JVfZIRtB5CXr0?=
 =?iso-8859-1?Q?zMNe3doXfvWzr0Tr84id7f2sV734xXb1HHYEVvQKL+B2dteewYtAtdbJBK?=
 =?iso-8859-1?Q?PBSyX8n57FQL+B4ceaI1le65shIO5EsRFx4RUxJjeZZAiho267xQchgFYC?=
 =?iso-8859-1?Q?xGcVJVYl6ytaASKKK86soDSHyRQO8Yly8GZ9GlnmeQc+fK+8lTCZoOq9st?=
 =?iso-8859-1?Q?OrCmlzfr4hC+/vEKqyfwvSCiqKqxt/oMLGocoxC6bp1/2ikjBZVPM/Lh/0?=
 =?iso-8859-1?Q?rLho53xwzY+qJaVD33HuCuo5svDydM6aOBiAPSKUDf9gf/g0Mub+VMbWuF?=
 =?iso-8859-1?Q?P5XjX41N/i5dNS/sCc5XXvuZESnSUhgrSKyFgOL5E4IwJkQysHx3+QtGVd?=
 =?iso-8859-1?Q?oZ54HjQg4fKaOHJrmg7ZHgW9r2LXq7q5yO5E/e+/7CoiT/CDRDvlls/Oo+?=
 =?iso-8859-1?Q?7lQzi7F1e2d0rHbBExaKC5n19+tbc6n0d+l1dbIWhrClWdGO14mp3DiOfS?=
 =?iso-8859-1?Q?6ypDBnYIdT5m+gBWU3909UQ9lJ5YLQT3iwoPgbL1rsJNfMqUgcXWn+T+5b?=
 =?iso-8859-1?Q?nyiTm5w3avUR/ucs/6q98f//nlTYrZVmL4m8bLIIyilBt9GihAA3HiJSSs?=
 =?iso-8859-1?Q?d2KGSo7bHDJpwfPRU8rGX1FDGHLx3LSPzQebH34yrrx4zz8TKUgU+J+vet?=
 =?iso-8859-1?Q?MFUie7uUUIGgcYerwMbqq/L61rb4lmzq+H9tO4EXwGphlmWStz+fQpygRD?=
 =?iso-8859-1?Q?OP6kGN+6zxSwKwUl84rKWb+nX9GOwfnXi/8Dl0ANU4GzsN+soTx/4aPer7?=
 =?iso-8859-1?Q?sySxNpFBXRXvSPdePJ1s01Qs60sWqpvBO1w+UJolbwZar6Xvi5dsY5WX3b?=
 =?iso-8859-1?Q?Kgo8QQNTpp10KZP7DesbjFU6RZsHJd6FAJbD1qx/IQJGUnldngrUaRJGRl?=
 =?iso-8859-1?Q?mYpzsbI0MrJ1XbQr2XRCiaJbl7387LDx86k7oJYnPRhoXlDE9lbg4geD8s?=
 =?iso-8859-1?Q?nVwQt/b4IHvvEwDnikKiUjqCNFXVIudQOQk5Hj9fr7g9KVx8i66z8LVajQ?=
 =?iso-8859-1?Q?v0U3uEwILWjeJFkOz2NmaEzD1stSkpon2QLfTM+9Srj4IUofNnW204nwYb?=
 =?iso-8859-1?Q?Fqk/AcYBR7DSszTNPXkDWRnC6MDsavWnmwM//flGg4IdqHYPExTs9D/XE0?=
 =?iso-8859-1?Q?EIYsYHEDYSIldnlLZXXH2UgEcsVTQ10dzeFZqjQyyrAw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ssKS2wzz5SYniRL3jWZXEk0xme1SPeuJtuyO7pB+srFjPVJTQ9NLplkhtn?=
 =?iso-8859-1?Q?zz0x6gFRzWGm/YG0CBktOkRkPSE2zFsXfR3DEN91uQhvKPYle5SIzQd3d1?=
 =?iso-8859-1?Q?ZktOrNYBx3vcCW7WDomnASRJMx+ATb4DRv/+ZmY6B18CEGT1tDYaPBev46?=
 =?iso-8859-1?Q?VTk3he1Yo0Nmf5hL1Mmt+SaLvY+Y7an6RKIN86JJIxOmeHQgg1YGCXXiYc?=
 =?iso-8859-1?Q?Yvw9TKtHJV7OiysLA28f65C6cu+K+S4bQvlka52pWa0wZ0/3H2OOyHZVh3?=
 =?iso-8859-1?Q?JZWPZ6RlkWB58sU00DvAT0T22w95RyteCtSpUzqGwHfd6hjl8LN7ObH55d?=
 =?iso-8859-1?Q?HDo4BOc4HEJdasVX9t4TPIYTagYwgOtb+nWCD7xnZYSI7C4pKkVcT4FoLt?=
 =?iso-8859-1?Q?oYFFqHdtpIRpUPivCoaXu2TtOQosC16nJ7skDLHdUtEFIH8hlQEocherNa?=
 =?iso-8859-1?Q?OGN6ZzzyCDuNaVTbV/uC7UYGdTqyYPH1CGLQvTO39uRmhxQx2dWpPpNR7p?=
 =?iso-8859-1?Q?3TXhmnW8jEkYsC0xsIGxQouj0a0ZjWEK8INuYIkoeG32Plx3wZOLMh4GmE?=
 =?iso-8859-1?Q?7px8P+fDM1d9StzQqY/ai10qHCI1Rqb7iAEK2asYzHQn3KB5jmxniSkQFz?=
 =?iso-8859-1?Q?dKn8mfdWZNIhtrTdZ1WAwxdtOWdEVX/PTShIbVKEeRw1wyplsI/dhhGU0s?=
 =?iso-8859-1?Q?9bxb9Ben5k4pa4Y33Wz1Yxnb2qOWqBw9A7qycXjViOrxxjRlsEpiSpq+6C?=
 =?iso-8859-1?Q?wOeXLc8EShO7h25tLz3nH+QsNaQ74sC0Py+LeatEeNPEzx00Ns7d3mmJJm?=
 =?iso-8859-1?Q?84Y9ealQEL+C3CNKhx6mFy6a93EuIPSvhmPJ1A9CKZ0n4EKRXUqT2Uv4Wf?=
 =?iso-8859-1?Q?cI+1F4T/tblVt88QkrrBEsL2aUD5L2onfrjV+q/0E11ZSxTg60FzmOLJzw?=
 =?iso-8859-1?Q?d/2LZSBpXseYglbxKqSoVldZLd/tLuZIyQ92Wo400XXsKg6DputaV0B3R/?=
 =?iso-8859-1?Q?vR3DooEydHNjCHScOJtJiJP3i2+fPCLNF9WsSZj5/C5cUvsteeg8tVj0Hk?=
 =?iso-8859-1?Q?SakYqzvmtz2QD14X7PjYpuZ1IEP4BzNZiLm3y8BQfblxrZrWohINMquvve?=
 =?iso-8859-1?Q?3phewqAc/wDQSVVbvwlRitu6J5Z0yk9iSk3BF6vwZzm0t1otW03HNg8Gr0?=
 =?iso-8859-1?Q?sLGl92kBMjvr55MixzfR74fizcBxPomn5AGWx/e1qDx9fG1rOdnOrBqud3?=
 =?iso-8859-1?Q?C31peWSD+jEYB7B5BtVTE80xOu/9eZT7+CGRy15qlG4Vd8Ebd4cxbhIJHI?=
 =?iso-8859-1?Q?jwYSBNTAb0vt32a7wrnoqUINHQGBdT+5vidcCh4+lgvNGuLX7CdOXqj6S+?=
 =?iso-8859-1?Q?NA0vaGQ8UYc953igPtB0Gxilj4CcnOfybEfGivVt0UiaWSpqg3POI9w2t0?=
 =?iso-8859-1?Q?gLhJhnpzwbv1QH0XV0V18ltr3Z6QesSJ4YGCjSx3CTne7Iky39PTx39DvM?=
 =?iso-8859-1?Q?e/5heLyDXnMksHsh43F3atsQCrGY5oXsVT1dwOTaB4pjb1ERz7wpABqsHa?=
 =?iso-8859-1?Q?TROx9d4uCEjbTFgJt6tMiMR9ziadL0GHv5RTfaF7WZMGd9FG8WtBej4OuE?=
 =?iso-8859-1?Q?joP+vu6cNrLrODse1IB5Js0foXPANJqkAu?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30213387-2671-488f-5cd5-08dd92beab43
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 08:09:37.0792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTn6a35a6VWrQsahIbhYr6q8xLxnJKKV+1XctM5jy5IC+01UBgEKPw9sXm2cWs9dWvY7JYiGTW8+AkNzCD/rvthvu5Aa6CQf/DiWhFy0YHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3027

Hi, Nicolas.

Thank you for your feedback, I apologize for the delayed response.

>-----Original Message-----
>From: Nicolas Dufresne <nicolas@ndufresne.ca>
>Sent: Friday, April 25, 2025 2:37 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v2 3/8] media: chips-media: wave6: Add Wave6 driver
>
>Le mardi 22 avril 2025 =E0 18:31 +0900, Nas Chung a =E9crit=A0:
>> This adds the main driver for the Chips&Media Wave6 video codec IP.
>>
>> On NXP i.MX platforms, the Wave6 consists of two functional regions:
>> a control region responsible for firmware and shared resources,
>> and a core region for encoding and decoding.
>>
>> This driver binds the `wave6-ctrl` and `wave6-core` sub-devices,
>> and coordinates their initialization and teardown.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
>> =A0drivers/media/platform/chips-media/Kconfig=A0=A0=A0 |=A0=A0 1 +
>> =A0drivers/media/platform/chips-media/Makefile=A0=A0 |=A0=A0 1 +
>> =A0.../media/platform/chips-media/wave6/Kconfig=A0 |=A0 24 +
>> =A0.../media/platform/chips-media/wave6/Makefile |=A0=A0 4 +
>> =A0.../platform/chips-media/wave6/wave6-vpu.c=A0=A0=A0 | 469 +++++++++++=
+++++++
>> =A0.../platform/chips-media/wave6/wave6-vpu.h=A0=A0=A0 |=A0 85 ++++
>> =A07 files changed, 585 insertions(+)
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu=
.c
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu=
.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6ca159e532e7..4fc54c824f65 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25529,6 +25529,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>> =A0L:	linux-media@vger.kernel.org
>> =A0S:	Maintained
>> =A0F:	Documentation/devicetree/bindings/media/cnm,wave633c.yaml
>> +F:	drivers/media/platform/chips-media/wave6/
>>
>> =A0WHISKEYCOVE PMIC GPIO DRIVER
>> =A0M:	Kuppuswamy Sathyanarayanan
><sathyanarayanan.kuppuswamy@linux.intel.com>
>> diff --git a/drivers/media/platform/chips-media/Kconfig
>b/drivers/media/platform/chips-media/Kconfig
>> index ad350eb6b1fc..8ef7fc8029a4 100644
>> --- a/drivers/media/platform/chips-media/Kconfig
>> +++ b/drivers/media/platform/chips-media/Kconfig
>> @@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
>>
>> =A0source "drivers/media/platform/chips-media/coda/Kconfig"
>> =A0source "drivers/media/platform/chips-media/wave5/Kconfig"
>> +source "drivers/media/platform/chips-media/wave6/Kconfig"
>> diff --git a/drivers/media/platform/chips-media/Makefile
>b/drivers/media/platform/chips-media/Makefile
>> index 6b5d99de8b54..b9a07a91c9d6 100644
>> --- a/drivers/media/platform/chips-media/Makefile
>> +++ b/drivers/media/platform/chips-media/Makefile
>> @@ -2,3 +2,4 @@
>>
>> =A0obj-y +=3D coda/
>> =A0obj-y +=3D wave5/
>> +obj-y +=3D wave6/
>> diff --git a/drivers/media/platform/chips-media/wave6/Kconfig
>b/drivers/media/platform/chips-media/wave6/Kconfig
>> new file mode 100644
>> index 000000000000..3d7369ca690c
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/Kconfig
>> @@ -0,0 +1,24 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config VIDEO_WAVE6_VPU
>> +	tristate "Chips&Media Wave6 Codec Driver"
>> +	depends on V4L_MEM2MEM_DRIVERS
>> +	depends on VIDEO_DEV && OF
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	select V4L2_MEM2MEM_DEV
>> +	select GENERIC_ALLOCATOR
>> +	help
>> +	=A0 Chips&Media Wave6 stateful codec driver.
>> +	=A0 The codec driver provides encoding and decoding capabilities
>> +	=A0 for H.264, HEVC, and other video formats.
>> +	=A0 To compile this driver as modules, choose M here: the
>> +	=A0 modules will be called wave6.
>> +
>> +config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
>> +	bool "Support Wave6 VPU follower"
>> +	depends on VIDEO_WAVE6_VPU
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	default n
>> +	help
>> +	=A0 Indicates whether the VPU domain power always on.
>                                               >is< ?
>
>This configuration is pretty vague to me. Do we really need that ?
>Isn't there other ways to disable PM runtime ? If unsure, just remove
>that, and we can discuss separately.

I agree with you.
I will remove this configuration and discuss it separately.
And, I think the support_follower related code should be removed together.
I will address this in v3.

>
>> diff --git a/drivers/media/platform/chips-media/wave6/Makefile
>b/drivers/media/platform/chips-media/wave6/Makefile
>> new file mode 100644
>> index 000000000000..255fc90bc642
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +wave6-objs +=3D wave6-vpu.o
>> +obj-$(CONFIG_VIDEO_WAVE6_VPU) +=3D wave6.o
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c
>b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
>> new file mode 100644
>> index 000000000000..5d0c093a9cc5
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
>> @@ -0,0 +1,469 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>
>nit: Its first time I notice, wave5 is like this too, but what the
>purpose of BDS-3-Clause here ? This driver can't possibly be used
>outside of Linux, and when loaded inside Linux, GPL is the only valid
>choice as far as I know.

We include the BSD-3-Clause license primarily to allow reuse of this code.
Although the V4L2 driver itself cannot be used outside of Linux,
certain parts of the code, such as register read/write operations,
can be referenced or reused.

>
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 driver
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/pm_runtime.h>
>> +#include "wave6-vpu.h"
>> +
>> +#define VPU_PLATFORM_DEVICE_NAME "wave6-vpu"
>> +#define VPU_CLK_NAME "vpu"
>> +
>> +#define WAVE6_VPU_FLAG_SLEEP	BIT(0)
>> +#define WAVE6_VPU_FLAG_WAKEUP	BIT(1)
>
>Mind aligning these ?

Sure !

>
>> +
>> +/**
>> + * wave6_alloc_dma - Allocate DMA memory
>> + * @dev: device pointer
>> + * @vb: VPU buffer structure
>> + *
>> + * Allocates a contiguous DMA memory region for VPU usage.
>> + * The allocated memory information is stored in the given
>> + * @vb structure.
>> + *
>> + * Return: 0 on success, -EINVAL for invalid arguments, -ENOMEM on
>failure
>> + */
>> +int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb)
>> +{
>> +	void *vaddr;
>> +	dma_addr_t daddr;
>> +
>> +	if (!vb || !vb->size)
>> +		return -EINVAL;
>> +
>> +	vaddr =3D dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +
>> +	vb->vaddr =3D vaddr;
>> +	vb->daddr =3D daddr;
>> +	vb->dev =3D dev;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_alloc_dma);
>
>Also to emphasis the clash with dual license.

Thank you. I'll revise it to avoid using the EXPORT_SYMBOL_GPL in v3.

>
>> +
>> +/**
>> + * wave6_free_dma - Free DMA memory
>> + * @vb: VPU buffer structure
>> + *
>> + * Frees the DMA memory previously allocated by wave6_alloc_dma().
>> + * @vb structure is also cleared to zero.
>> + */
>> +void wave6_free_dma(struct vpu_buf *vb)
>> +{
>> +	if (!vb || !vb->size || !vb->vaddr)
>> +		return;
>> +
>> +	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
>> +	memset(vb, 0, sizeof(*vb));
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_free_dma);
>> +
>> +static int wave6_check_entity(struct wave6_vpu_device *vpu,
>> +			=A0=A0=A0=A0=A0 struct wave6_vpu_entity *entity)
>
>When I read code below, I don't see what wave6_check_entity() does. You
>should rename this, perhaps it means "wave6_valid_entity()" ?

Sorry for confusion. I will rename the function.

>
>Its also not obvious to me in which normal condition you will hold a
>ref to an entity that is no longer valid. I'd ask here, can this fail
>without a programming error ? And in which case, if its a programming
>error, a WARN_ON would likely be a good idea.

Yes, I wanted to prevent programming errors in this case.
I will modify it to use WARN_ON in v3.

>
>> +{
>> +	if (!entity || !entity->vpu || !vpu || entity->vpu !=3D vpu->dev)
>> +		return -EINVAL;
>> +	if (entity->index < 0 || entity->index >=3D
>WAVE6_VPU_MAXIMUM_ENTITY_CNT)
>> +		return -EINVAL;
>> +	if (entity !=3D vpu->entities[entity->index])
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long wave6_vpu_get_clk_rate(struct wave6_vpu_device *vp=
u)
>> +{
>> +	unsigned long rate =3D 0;
>> +	int i;
>> +
>> +	mutex_lock(&vpu->lock);
>> +
>> +	for (i =3D 0; i < vpu->num_clks; i++) {
>> +		if (vpu->clks[i].id && !strcmp(vpu->clks[i].id, VPU_CLK_NAME))
>> +			rate =3D clk_get_rate(vpu->clks[i].clk);
>> +	}
>> +
>> +	mutex_unlock(&vpu->lock);
>> +	return rate;
>> +}
>> +
>> +static int __wave6_vpu_get(struct wave6_vpu_device *vpu,
>> +			=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>
>Would be nice to add:
>
>	lockdep_assert_held(&vpu->lock);

Okay, I will address this in v3.

>
>> +
>> +	if (atomic_inc_return(&vpu->ref_count) > 1)
>> +		return 0;
>> +
>> +	ret =3D pm_runtime_resume_and_get(vpu->dev);
>> +	if (ret) {
>> +		dev_err(vpu->dev, "pm runtime resume fail, ret =3D %d\n", ret);
>> +		atomic_dec(&vpu->ref_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (vpu->ctrl && vpu->ctrl_ops) {
>> +		ret =3D vpu->ctrl_ops->get_ctrl(vpu->ctrl, entity);
>> +		if (ret) {
>> +			dev_err(vpu->dev, "get ctrl fail, ret =3D %d\n", ret);
>> +			pm_runtime_put_sync(vpu->dev);
>> +			atomic_dec(&vpu->ref_count);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_get(struct wave6_vpu_device *vpu,
>> +			 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret =3D 0;
>
>Drop.

Okay.

>
>> +
>> +	mutex_lock(&vpu->lock);
>
>Replace with:
>
>	guard(mutex)(&vpu->lock);

Okay, I will replace all below mutex_lock() to guard().

>
>> +
>> +	if (wave6_check_entity(vpu, entity)) {
>> +		ret =3D -EINVAL;
>> +		goto unlock;
>
>Then these two lines becomes:
>
>		return -EINVAL;
>
>You won't even need a scope.

I see. I will address this in v3.

>
>> +	}
>> +
>> +	if (!entity->active)
>> +		goto unlock;
>		return 0;
>
>> +
>> +	ret =3D __wave6_vpu_get(vpu, entity);
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>
>Drop the two above lines;

Okay.

>
>> +	return ret;
>	return 0;
>
>> +}
>> +
>> +static void __wave6_vpu_put(struct wave6_vpu_device *vpu,
>> +			=A0=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	if (atomic_dec_return(&vpu->ref_count) > 0)
>> +		return;
>> +
>> +	if (vpu->ctrl && vpu->ctrl_ops)
>> +		vpu->ctrl_ops->put_ctrl(vpu->ctrl, entity);
>> +
>> +	pm_runtime_put_sync(vpu->dev);
>> +}
>> +
>> +static void wave6_vpu_put(struct wave6_vpu_device *vpu,
>> +			=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	mutex_lock(&vpu->lock);
>
>Same, you should use guard()().
>
>> +
>> +	if (wave6_check_entity(vpu, entity))
>> +		goto unlock;
>> +
>> +	if (!entity->active)
>> +		goto unlock;
>> +
>> +	__wave6_vpu_put(vpu, entity);
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +}
>> +
>> +static void wave6_support_follower(struct wave6_vpu_device *vpu,
>> +				=A0=A0 struct wave6_vpu_entity *entity, u32 flag)
>> +{
>
>I haven't figure-out what this is about, bare in mind.

Understood. I will remove the support_follower related code first.

>
>> +	struct wave6_vpu_entity *target =3D NULL;
>> +	int ret;
>> +	int i;
>
>Seems like this needs to be called with lock held:

Okay.

>
>	lockdep_assert_held(&vpu->lock);
>
>> +
>> +	if (!vpu->support_follower)
>> +		return;
>> +	if (!vpu->ctrl)
>> +		return;
>> +
>> +	if (entity)
>> +		target =3D entity;
>> +
>> +	ret =3D pm_runtime_resume_and_get(vpu->dev);
>> +	if (ret) {
>> +		dev_warn(vpu->dev, "pm runtime resume fail, ret =3D %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(vpu->entities); i++) {
>> +		if (!vpu->entities[i])
>> +			continue;
>> +		if (target && vpu->entities[i] !=3D target)
>> +			continue;
>> +		if (flag & WAVE6_VPU_FLAG_WAKEUP)
>> +			__wave6_vpu_get(vpu, vpu->entities[i]);
>> +		if (flag & WAVE6_VPU_FLAG_SLEEP)
>> +			__wave6_vpu_put(vpu, vpu->entities[i]);
>> +	}
>> +
>> +	pm_runtime_put_sync(vpu->dev);
>> +}
>> +
>> +static int wave6_find_unused_index(struct wave6_vpu_device *vpu)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(vpu->entities); i++) {
>> +		if (!vpu->entities[i])
>> +			return i;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static int wave6_register_vpu_core(struct wave6_vpu_device *vpu,
>> +				=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret =3D 0;
>> +	int index;
>> +
>> +	mutex_lock(&vpu->lock);
>
>Also:
>	guard(mutex)(&vpu->lock);
>
>> +
>> +	if (!entity || !entity->dev) {
>> +		ret =3D -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	index =3D wave6_find_unused_index(vpu);
>> +	if (index < 0 || index >=3D ARRAY_SIZE(vpu->entities)) {
>
>Drop the second condition, its defensive coding, you can trust your
>wave6_find_unused_index() helper to return a valid index or -1.

I see, I will address this in v3.

>
>> +		ret =3D -1;
>> +		goto unlock;
>> +	}
>> +
>> +	entity->vpu =3D vpu->dev;
>> +	entity->index =3D index;
>> +	vpu->entities[index] =3D entity;
>> +	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_WAKEUP);
>
>So this support_follower() actually does wave6_vpu_get()/put(), except
>when the build config forces always on. I think if you drop that
>config, you can drop that strange function and just use get/put.
>
>I don't have the full portait of when vpu core are registered and when
>not. It does give me the strange impression that once a stream is
>active, it cannot sleep anymore. I'd like to see some text about the PM
>runtime strategies.

Understood, I will remove the support_follower related code to improve clar=
ity.

>
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +	return ret;
>> +}
>> +
>> +static void wave6_unregister_vpu_core(struct wave6_vpu_device *vpu,
>> +				=A0=A0=A0=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	mutex_lock(&vpu->lock);
>Also:
>	guard(mutex)(&vpu->lock);
>
>> +
>> +	if (wave6_check_entity(vpu, entity))
>> +		goto unlock;
>> +
>> +	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_SLEEP);
>> +	vpu->entities[entity->index] =3D NULL;
>> +	entity->vpu =3D NULL;
>> +	entity->index =3D -1;
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +}
>> +
>> +static int wave6_register_vpu_ctrl(struct wave6_vpu_device *vpu,
>> +				=A0=A0 struct device *ctrl,
>> +				=A0=A0 const struct wave6_vpu_ctrl_ops *ops)
>> +{
>> +	int ret =3D 0;
>> +
>> +	mutex_lock(&vpu->lock);
>
>Also:
>	guard(mutex)(&vpu->lock);
>
>> +
>> +	if (!ctrl || !ops) {
>
>Seems like some WARN_ON would be preferred, you don't expect this to
>happen outside of programmer error right ?

Yes ! I will modify it to use WARN_ON in v3.

>
>> +		ret =3D -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	if (vpu->ctrl) {
>> +		if (vpu->ctrl !=3D ctrl)
>> +			ret =3D -EINVAL;
>> +
>> +		goto unlock;
>> +	}
>> +
>> +	vpu->ctrl =3D ctrl;
>> +	vpu->ctrl_ops =3D ops;
>> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +	return ret;
>> +}
>> +
>> +static void wave6_unregister_vpu_ctrl(struct wave6_vpu_device *vpu,
>> +				=A0=A0=A0=A0=A0 struct device *ctrl)
>> +{
>> +	mutex_lock(&vpu->lock);
>> +
>> +	if (vpu->ctrl !=3D ctrl)
>> +		goto unlock;
>> +
>> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
>> +	vpu->ctrl =3D NULL;
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +}
>> +
>> +static void wave6_require_work_buffer(struct wave6_vpu_device *vpu,
>> +				=A0=A0=A0=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret =3D 0;
>> +
>> +	mutex_lock(&vpu->lock);
>
>Also:
>	guard(mutex)(&vpu->lock);
>
>> +
>> +	if (wave6_check_entity(vpu, entity))
>> +		goto unlock;
>> +
>> +	if (!vpu->ctrl || !vpu->ctrl_ops)
>> +		goto unlock;
>> +
>> +	ret =3D vpu->ctrl_ops->require_work_buffer(vpu->ctrl, entity);
>> +	if (ret)
>> +		dev_warn(vpu->dev, "require_work_buffer fail %d\n", ret);
>> +
>> +unlock:
>> +	mutex_unlock(&vpu->lock);
>> +}
>> +
>> +static const struct wave6_vpu_ops wave6_vpu_ops =3D {
>> +	.get_vpu =3D wave6_vpu_get,
>> +	.put_vpu =3D wave6_vpu_put,
>> +	.reg_core =3D wave6_register_vpu_core,
>> +	.unreg_core =3D wave6_unregister_vpu_core,
>> +	.reg_ctrl =3D wave6_register_vpu_ctrl,
>> +	.unreg_ctrl =3D wave6_unregister_vpu_ctrl,
>> +	.req_work_buffer =3D wave6_require_work_buffer,
>> +	.get_clk_rate =3D wave6_vpu_get_clk_rate,
>> +};
>> +
>> +static int wave6_vpu_probe(struct platform_device *pdev)
>> +{
>> +	struct wave6_vpu_device *vpu;
>> +	int ret;
>> +
>> +	vpu =3D devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
>> +	if (!vpu)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&pdev->dev, vpu);
>> +	vpu->dev =3D &pdev->dev;
>> +	vpu->ops =3D &wave6_vpu_ops;
>> +
>> +	mutex_init(&vpu->lock);
>> +	atomic_set(&vpu->ref_count, 0);
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
>> +	if (ret < 0) {
>> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
>> +		ret =3D 0;
>> +	}
>> +	vpu->num_clks =3D ret;
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +#if IS_ENABLED(CONFIG_VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER)
>> +	vpu->support_follower =3D true;
>> +#endif
>> +	if (vpu->support_follower) {
>
>This scope seems unreachable if CONFIG_VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
>is not set, move it inside the ifdef.
>
>> +		ret =3D pm_runtime_resume_and_get(&pdev->dev);
>> +		if (ret) {
>> +			dev_warn(&pdev->dev, "pm resume fail %d\n", ret);
>> +			vpu->support_follower =3D false;
>
>If you couldn't wake the HW now, its unlikely to wake later. Better
>cleanup and fail the probe ?

Sorry again for your confusion, I will remove this ambiguous codes.

>
>> +		}
>> +	}
>> +
>> +	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void wave6_vpu_remove(struct platform_device *pdev)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	if (vpu->support_follower) {
>> +		if (!pm_runtime_suspended(&pdev->dev))
>> +			pm_runtime_put_sync(&pdev->dev);
>> +
>> +		wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
>> +	}
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +	mutex_destroy(&vpu->lock);
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_runtime_suspend(struct device *dev)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
>> +
>> +	if (!vpu->num_clks)
>> +		return 0;
>> +
>> +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_runtime_resume(struct device *dev)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
>> +
>> +	if (!vpu->num_clks)
>> +		return 0;
>> +
>> +	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_suspend(struct device *dev)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
>> +
>> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
>
>Not sure I like it, its kind of move the ref-count in the air. I don't
>have a suggestion atm, but perhaps we can do better.

Understood. I will remove the support_follower related code.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_resume(struct device *dev)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
>> +
>> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops wave6_vpu_pm_ops =3D {
>> +	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
>> +			=A0=A0 wave6_vpu_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend,
>> +				wave6_vpu_resume)
>> +};
>> +
>> +static const struct of_device_id wave6_vpu_ids[] =3D {
>> +	{ .compatible =3D "nxp,imx95-vpu" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
>> +
>> +static struct platform_driver wave6_vpu_driver =3D {
>> +	.driver =3D {
>> +		.name =3D VPU_PLATFORM_DEVICE_NAME,
>> +		.of_match_table =3D wave6_vpu_ids,
>> +		.pm =3D &wave6_vpu_pm_ops,
>> +	},
>> +	.probe =3D wave6_vpu_probe,
>> +	.remove =3D wave6_vpu_remove,
>> +};
>> +
>> +module_platform_driver(wave6_vpu_driver);
>> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
>> +MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> new file mode 100644
>> index 000000000000..faa5f8af3191
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> @@ -0,0 +1,85 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 driver
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>> + */
>> +
>> +#ifndef __WAVE6_VPU_H__
>> +#define __WAVE6_VPU_H__
>> +
>> +#include <linux/device.h>
>> +
>> +#define WAVE6_VPU_MAXIMUM_ENTITY_CNT	4
>> +
>> +#define call_vop(vpu, op, args...)					\
>> +	((vpu)->ops->op ? (vpu)->ops->op(vpu, ##args) : 0)		\
>> +
>> +#define call_void_vop(vpu, op, args...)					\
>> +	do {								\
>> +		if ((vpu)->ops->op)					\
>> +			(vpu)->ops->op(vpu, ##args);			\
>> +	} while (0)
>> +
>> +struct vpu_buf {
>> +	size_t size;
>> +	dma_addr_t daddr;
>> +	void *vaddr;
>> +	struct device *dev;
>> +};
>> +
>> +struct wave6_vpu_entity {
>> +	struct list_head list;
>> +	struct device *dev;
>> +	struct device *vpu;
>> +	u32 (*read_reg)(struct device *dev, u32 addr);
>> +	void (*write_reg)(struct device *dev, u32 addr, u32 data);
>> +	void (*on_boot)(struct device *dev);
>> +	void (*pause)(struct device *dev, int resume);
>> +	bool active;
>> +	int index;
>> +};
>> +
>> +struct wave6_vpu_ctrl_ops {
>> +	int (*get_ctrl)(struct device *ctrl, struct wave6_vpu_entity
>*entity);
>> +	void (*put_ctrl)(struct device *ctrl, struct wave6_vpu_entity
>*entity);
>> +	int (*require_work_buffer)(struct device *ctrl,
>> +				=A0=A0 struct wave6_vpu_entity *entity);
>> +};
>> +
>> +struct wave6_vpu_device;
>> +
>> +struct wave6_vpu_ops {
>> +	int (*get_vpu)(struct wave6_vpu_device *vpu,
>> +		=A0=A0=A0=A0=A0=A0 struct wave6_vpu_entity *entity);
>> +	void (*put_vpu)(struct wave6_vpu_device *vpu,
>> +			struct wave6_vpu_entity *entity);
>> +	int (*reg_core)(struct wave6_vpu_device *vpu,
>> +			struct wave6_vpu_entity *entity);
>> +	void (*unreg_core)(struct wave6_vpu_device *vpu,
>> +			=A0=A0 struct wave6_vpu_entity *entity);
>> +	int (*reg_ctrl)(struct wave6_vpu_device *vpu, struct device *ctrl,
>> +			const struct wave6_vpu_ctrl_ops *ops);
>> +	void (*unreg_ctrl)(struct wave6_vpu_device *vpu, struct device
>*ctrl);
>> +	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
>> +				struct wave6_vpu_entity *entity);
>> +	unsigned long (*get_clk_rate)(struct wave6_vpu_device *vpu);
>> +};
>> +
>> +struct wave6_vpu_device {
>> +	struct device *dev;
>> +	const struct wave6_vpu_ops *ops;
>> +	struct clk_bulk_data *clks;
>> +	int num_clks;
>> +	struct device *ctrl;
>> +	const struct wave6_vpu_ctrl_ops *ctrl_ops;
>> +	struct wave6_vpu_entity *entities[WAVE6_VPU_MAXIMUM_ENTITY_CNT];
>> +	struct mutex lock; /* the lock for vpu device */
>> +	atomic_t ref_count;
>> +	bool support_follower;
>> +};
>
>All structs could gain having documentation.

Okay, I will add the documentation for all structs.

Thanks.
Nas.

>
>Nicolas
>
>> +
>> +int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb);
>> +void wave6_free_dma(struct vpu_buf *vb);
>> +
>> +#endif /* __WAVE6_VPU_H__ */

