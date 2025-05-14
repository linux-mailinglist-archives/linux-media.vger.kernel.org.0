Return-Path: <linux-media+bounces-32458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A186AB6882
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA8E3AA61C
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018D725DD07;
	Wed, 14 May 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="YP7/XY/k"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021120.outbound.protection.outlook.com [40.107.42.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0145948;
	Wed, 14 May 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217735; cv=fail; b=KIo8T4dWZnWy4qb6nZlXtvmjqKloBUnmJPBnE/asmcBG0Ux4d1VS4iAS9Cf/VvrEYOAQaDLx5P9YvKw6MqiekchEV4Dp4GChuIpvCx4189XZqQ9a/Dzq+ha2aUBD5kDT4SaSxYO8ilBmc1vL3kMc9NtCOhBvR/f6EoL2vhWLyIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217735; c=relaxed/simple;
	bh=fp/xKK+ZHgUJ+1QCGxwRvY3tLpwOXV+k8SKEMGpiFPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iQA0OZdU3nQuHT7UKglRqFE2qeykQIiltCXc+lHSjhCZDiR2V6XwaZQ4XEk1fR8PB/XeFmj4UWNsDEhu8l4jZHJN5x4OJx8K86D2UAkNewaj4snJCtxBhMRIjpLQACE/5gFALuwrvu+mPv4ljGVrM2ZAdJ87a27603kiTM8PLMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=YP7/XY/k; arc=fail smtp.client-ip=40.107.42.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuuK//Qy571OiqFQBLlYJwCUsVLhaq6pwul3vQswrN1rMFfuE1Xf7Cs58wE9O2GBqrupzKpBJu99ZU5wScBf+dgoq9kIHec2ThChs9uN8X/TUO99vMxX6lHceoByaJzEylL4hJANia0l2Hy74TkxenMgcksHv1ZUb/KxDz2TgJy9C6932dTUt4pwxQfQhQJ7XpQls2gfC5NbXqPvtB8ZKv3EeRgoBwP/1PCF8atgAN5e80w45hTt0vIWdjhvFZiciegvjpOFSwWW9ObZGdzUqHC9DG2dgHebuMYKncY5U3Vv6NNrZaZ4/VUf6i5lHVVaNXg+1olYq989vd8tB4UAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99sJz6oRUruPb86dFCcm35F7Tr0hyvDQrh+oSZDkMls=;
 b=bSgTnIdgzhnULuz/Pa8T+V1nFkddGceRsolBNA9uB6Un9rQ6pBZaRfobClClfTY0WQ5S1dW2KEWvlo5FMHgsuJkH7BXvIQEAbbW9uwsSOTLbhACByynzGWGQC2O9py1caADwseiL3IJoum3UdOkhDSZz03M/tlTWjKMaTuf0xZhf4GyYlzA5xGH6Yfb7vgeNyb1wi7Syg0RI9eLH2LCWEJwgrbkjQv99wdoBAk2rptHGSpOOQD4Au0V3Kd+zysENsMh7s7lhWgVz1E8KF5JUIdxNWE6ozDOhA0jH4O0mXhzJGepttiRvj7gREyfh3gg+0ccMDdIJpCT5Y+V2u+B9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99sJz6oRUruPb86dFCcm35F7Tr0hyvDQrh+oSZDkMls=;
 b=YP7/XY/kHXMcSEVhLak5aK7ND5ujdGpeMyTIHYSbzANnSxZX9D9+segOJ2sczFL5rcKlH9xPN65ZgO5fjYbKBjmp1VEmqc4G51hDWHp8ZpF5z3GDMdXTjYbFaEvEbaAYiTeRDBQ45DpFfXxRjFLdoJgASV2XE2WtSw5XXQTmPGg=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1553.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Wed, 14 May 2025 10:15:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 10:15:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>, "marex@denx.de" <marex@denx.de>,
	jackson.lee <jackson.lee@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, Ming Qian <ming.qian@oss.nxp.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v2 4/8] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v2 4/8] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHbs2lY8Txao6cxBUmxw0JiUB0wMbO7KSaAgBbHQVA=
Date: Wed, 14 May 2025 10:15:26 +0000
Message-ID:
 <SL2P216MB1246047824AA4F43EDC03D3EFB91A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <20250422093119.595-5-nas.chung@chipsnmedia.com>
 <a19862f624026e44e45a42859af84d1f38c010f3.camel@ndufresne.ca>
In-Reply-To: <a19862f624026e44e45a42859af84d1f38c010f3.camel@ndufresne.ca>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE2P216MB1553:EE_
x-ms-office365-filtering-correlation-id: 8deba905-52d4-478e-96e2-08dd92d03f5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vvzGQVpwj72Ke7YUKQQBMJ4gG/7n2s6wk+7Iv+jqDLFQhOwGPpPAGYXjKS?=
 =?iso-8859-1?Q?pjWCWkRsfJGX8AfrdTeDGSzMFm0qc9094/1HASXWrhdbSRGCkaaKZZ5Ytw?=
 =?iso-8859-1?Q?GbNxYLv4B6RFLbAeLm+DDLaDnTw6Xmq+3M5iwBzxdo7rUKk+5oTm6kYhSw?=
 =?iso-8859-1?Q?GhLinuxHhTxqAA8dRl2WFdrIlw6ae84L+fVq6KToxyr2qW61NQ6JspTA3N?=
 =?iso-8859-1?Q?eLGdbnZFrr7MdNzwq+6kl7SHAMzFw1sgHvz6Zn8FXXtJt4ltTVov+ZB94X?=
 =?iso-8859-1?Q?FqnXogN0pTPQsWtx/EGHGnKB5WlMlwkrJqvE2DvSSSg+KVQl28WXbK0Ukl?=
 =?iso-8859-1?Q?K+UGHQi0y8Mo3i9MHny5ptfgfFcOpEkF3itRvd0Qk+bH+7fKmIFgddh7Wy?=
 =?iso-8859-1?Q?h6zNkLohmn2L2ra8mP5OblFUOTcZeZBSqUwj8p6iV9ExA9WCddYIVsXM+2?=
 =?iso-8859-1?Q?PDDX6qLrkmMn4jtqtuLUG3Ebas/Zg0KanXo/9GI7ILb/dkq1BHmaifM7xj?=
 =?iso-8859-1?Q?q5k7oaUNgmTT/q18czpz0/Wh892/56B0m1j+qEb/jyp3Dr/hlLnjzrCRgo?=
 =?iso-8859-1?Q?At42D6MN7cKKpqpyH0PtlVzYzKW0TTsc2gfVzF/xFECjkmovmHylKgTITN?=
 =?iso-8859-1?Q?NEm+0aB210GTqbFwJ8LFeKqzOnfLGDchWHiAFZyYBYT9OtT5XGwUUNMpN0?=
 =?iso-8859-1?Q?1MgSNZ+moto2iNZJF1ZPj37F0wkDFWrnFaRPih7NkiWwG4aZ5WwFBIYC4/?=
 =?iso-8859-1?Q?3J1LF9Z4DxNEFRR13OA1viEtpgLFcyF2Y1eK+rZnXlCQhPbb9sPj0BaAVl?=
 =?iso-8859-1?Q?AD1bxt43vkln7RZ6AyyFSq3Zdnc5WEbaL7DaiwYer2GXqcfVF56hLZQf/J?=
 =?iso-8859-1?Q?xDmhrO/A5fWFerEAScWQivlzR6hI1eDzkuOFqzo+yETR19YX6LlvvDxAn+?=
 =?iso-8859-1?Q?VSi//ehv8JxbzRg1h/h65WzImoQ4h7G7+hSPQNm2Kb9ngwByhHrrbiTXIX?=
 =?iso-8859-1?Q?uv1OC6mNr/L7dxkgxB/9N3whWNTNPWvwGvCC9dzu1ZMb3qod0U+HL1HlP+?=
 =?iso-8859-1?Q?jh6DN7Hpb2epSAMOiHJCaJeTZdK1oU5puYK+7qbtHK0UV4mr0LXmr13mAV?=
 =?iso-8859-1?Q?qwG3iDASKqO2KxVFWqHWvRH9JpaWvTUQkVAhy+3w/c4cqogRhY+0xFiUME?=
 =?iso-8859-1?Q?Ys0vKCMXlEApdfdbc9wKTblaP+0yX7H1nJIOwhmKt+Malosp590CkY4C5P?=
 =?iso-8859-1?Q?L0NL96NAHb8HSE/z63+OJxj4BK5bqNe+0iNXQhiX4oSAWGzP8x6qnRcFMu?=
 =?iso-8859-1?Q?H1ByuIvVAR4kxCrRrijYkpHD9p9cytBR60iUxvUm937Xr2QLG8tgJIDsPz?=
 =?iso-8859-1?Q?gl47tXwX5mkkyCJgKtGEI/qcoe4RPeZ2ODhFSDf3LE3b+GEoJ6X5LqOJwr?=
 =?iso-8859-1?Q?vTiKRKrWfZbqt7ZhiduyFzB5xGB5cj9YFYFRIyvJleNGTyc1FNKsBF7la2?=
 =?iso-8859-1?Q?p4Yu5k6GVbEHGgaqf2lsiA0JO0wN6DqG3QJemiF7zSOg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kgTKsVLssElS+oIxqDK98+1ymSn4KOI8Va2mS5Xr8Z6JVfN78F5HAi7H/Q?=
 =?iso-8859-1?Q?+JDWcpeLsU3vYDYuUCak3oC06bLCRJqJETMTSAomrd0jcYcYC7FVhq9S3w?=
 =?iso-8859-1?Q?ZYUEvcmg4ddsApWfKbV49VxqglzOhVPRoI3lUX/Ez6TB8+Mjj3fLkQzziv?=
 =?iso-8859-1?Q?XTUAMp8l8bY9i2H+Jvdf7gj71PeohJy0hwaUy49vZMtfWWUFepDxaWqF8V?=
 =?iso-8859-1?Q?4PTj3dVwFbjjHgBPHkKqOhHqNjIPM0t95swIHOIB4S7Vn1qp2Xbg/9Hr/F?=
 =?iso-8859-1?Q?mB+Gd4v05Yh6Gb35KRalazLQkR+4DQrhkBDnw3E2bfxHoFS+MyLJlQ0OYg?=
 =?iso-8859-1?Q?l3RNy0Vsk5R67nzq4PEuqcsGeR7eFIvAG2hterOEpqeO6eZSEZDq6JT+sO?=
 =?iso-8859-1?Q?0qWv7u0/UD57i7ptfqmHEEu24KuHOaqa/H9lSHc+iTDXvc4Yq1yZ1V1Rkx?=
 =?iso-8859-1?Q?aWwq85HXWlXw1jeGRnNZnExTMESto8KvNwffDjje/UPdCt5GCpLynuCS3r?=
 =?iso-8859-1?Q?c05ZoT3VfmK2wn8Yyr1LfatkZWl66Dkgs/oVcxD7sgV+yoemULDe8UV1gr?=
 =?iso-8859-1?Q?m89uJMZlnf7Mk32qiJXKEOJaVyTm2Sh3hO5XKEOaKL7KkLpJ/FCxfdQDuq?=
 =?iso-8859-1?Q?6TlLiwSPEK4pj3OMCcZEni5m5ohYAZO3qPeocjREnZc8HKFA1xxkUjLJU5?=
 =?iso-8859-1?Q?bAI+E2uG+mYLiobyjltXwsuAnnn0n2c4PWTI/SnT+c4kMqHfo0pRudE3no?=
 =?iso-8859-1?Q?K+SPKPZpJcgeUuOOh2SzLJtKYiLHVv6UDRj4PTXWvH0KhAgpPb7F1VliFP?=
 =?iso-8859-1?Q?z/FfMgyOEJcAXO1wUau7Jt4w+poScJyHY1r9tUS401vlmUYnPeskPKo7E6?=
 =?iso-8859-1?Q?c+n0Apd7s6V1ztA7LZcBegHWPcxtP5kVUb7EuPSipD5v38Q98Lq28EvsS6?=
 =?iso-8859-1?Q?2P7lW1ALaSOYP2pFADfM14tUpA9MFLigN5LOBno+U5WplxSt+5K3nd6r9d?=
 =?iso-8859-1?Q?dHnKNkno6LF3pDG0CUogZempoV7pv8PY47o3jL25395/399OteajtFZX0p?=
 =?iso-8859-1?Q?+k2RozQUxHqP1m3b38sqz48HGZHVpO05U9qz+tEjS6s4GzcoM8W5uJK53G?=
 =?iso-8859-1?Q?HZ+d9O21q5zm6Z90O8aI9LwtJetksOM2fEYCWZwJ6HUnTN1rN0aeuZsfL4?=
 =?iso-8859-1?Q?FINQagNHLxFGjH3zgooJCCd2iwkxTED6jazZmDTSQrD/gANZpgYh3BGbbo?=
 =?iso-8859-1?Q?6hdiv4abyt+DTVFyL1AJHn+XjUjOftO7FH+tQGc9zZDo6+tUmTyHfR3Pij?=
 =?iso-8859-1?Q?9zliRcXddv7IHBxKw05LInIlM6NU3exYGNrYbWvCTWLCr7Qu8YOzde17pw?=
 =?iso-8859-1?Q?/dZaNrD8rKhEAPUsPo0v6GYnZbGB09frdCsIyypyvwAyRDfyaVEKFbt+dX?=
 =?iso-8859-1?Q?wmEi55DnMEQyHtMKz7wcJuNKOpVLEvDGAAE5TszvJP6Zr6HjCwa2hUYseh?=
 =?iso-8859-1?Q?XoKELsykoBABQQSeC0aZvOGA21q4qbkmWky/YKXMkkMt4K9s7gXG2Kx+ue?=
 =?iso-8859-1?Q?lXgoZn5v86JBmuY/yjn00jJLs50r7KZo9LXq69Ffqm1XOWvJgrmtXl5mrb?=
 =?iso-8859-1?Q?1P0T+P/Jvs3V5o++HzAMVgun6FIU8Kcx/C?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8deba905-52d4-478e-96e2-08dd92d03f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 10:15:26.9743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9Qw4gQ2+QmHqq9F7uRhKrvqcgKMhb/UXz6Zhkyyb+59fRzgZg2A4E8BWPsgITCohe3wqhIVBCvbdvH0P4ng3vXHw5PJFbuYdVDSM21i6JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1553

Hi, Nicolas.

Thank you for the comment.

>-----Original Message-----
>From: Nicolas Dufresne <nicolas@ndufresne.ca>
>Sent: Wednesday, April 30, 2025 5:48 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v2 4/8] media: chips-media: wave6: Add Wave6 control
>driver
>
>Le mardi 22 avril 2025 =E0 18:31 +0900, Nas Chung a =E9crit=A0:
>> This adds the control driver for the Chips&Media Wave6 video codec IP.
>>
>> The control region manages shared resources such as firmware loading,
>> firmware memory allocation, and synchronization required by the core.
>> It is a functional sub-device of the main Wave6 driver and cannot
>> operate independently.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> =A0.../media/platform/chips-media/wave6/Kconfig=A0 |=A0 11 +
>> =A0.../media/platform/chips-media/wave6/Makefile |=A0=A0 3 +
>> =A0.../chips-media/wave6/wave6-regdefine.h=A0=A0=A0=A0=A0=A0 | 675 +++++=
+++++++++
>> =A0.../chips-media/wave6/wave6-vpu-ctrl.c=A0=A0=A0=A0=A0=A0=A0 | 860 +++=
+++++++++++++++
>> =A0.../chips-media/wave6/wave6-vpuconfig.h=A0=A0=A0=A0=A0=A0 |=A0 84 ++
>> =A05 files changed, 1633 insertions(+)
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>regdefine.h
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu=
-
>ctrl.c
>> =A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuconfig.h
>>
>> diff --git a/drivers/media/platform/chips-media/wave6/Kconfig
>b/drivers/media/platform/chips-media/wave6/Kconfig
>> index 3d7369ca690c..9ca428f9d20c 100644
>> --- a/drivers/media/platform/chips-media/wave6/Kconfig
>> +++ b/drivers/media/platform/chips-media/wave6/Kconfig
>> @@ -22,3 +22,14 @@ config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
>> =A0	default n
>> =A0	help
>> =A0	=A0 Indicates whether the VPU domain power always on.
>> +
>> +config VIDEO_WAVE6_VPU_CTRL
>> +	tristate "Chips&Media Wave6 Codec Control Driver"
>> +	depends on VIDEO_WAVE6_VPU
>
>Should wave6-vpu driver selects wave6-ctrl ? Would this make it easier
>to configure correctly ?

Yes. So, Would it be better to remove WAVE6_VPU_CTRL config and
build wave6-ctrl together with WAVE6_VPU config ?

>
>> +	default VIDEO_WAVE6_VPU if ARCH_MXC || COMPILE_TEST
>> +	help
>> +	=A0 Chips&Media Wave6 control driver.
>> +	=A0 The control driver manages shared resources such as
>> +	=A0 firmware memory.
>> +	=A0 To compile this driver as modules, choose M here: the
>> +	=A0 modules will be called wave6-ctrl.

[...]

>> +#define VPU_CTRL_PLATFORM_DEVICE_NAME "wave6-vpu-ctrl"
>> +
>> +static bool wave6_cooling_disable;
>> +module_param(wave6_cooling_disable, bool, 0644);
>> +MODULE_PARM_DESC(wave6_cooling_disable, "enable or disable cooling");
>
>Does that really belong here ? Shouldn't this already be controllable
>if you register a thermal zone ? I'm not expert, but I think module
>parameter does not belong here.

Thanks for pointing this out.
I agree, this parameter does not need to belong here.
I'll drop it in v3.

>
>> +
>> +enum wave6_vpu_state {
>> +	WAVE6_VPU_STATE_OFF,
>> +	WAVE6_VPU_STATE_PREPARE,
>> +	WAVE6_VPU_STATE_ON,
>> +	WAVE6_VPU_STATE_SLEEP
>> +};
>> +
>> +struct vpu_ctrl_resource {
>> +	const char *fw_name;
>> +	u32 sram_size;
>> +};
>> +
>> +struct vpu_ctrl_buf {
>> +	struct list_head list;
>> +	struct vpu_buf buf;
>> +};
>> +
>> +struct vpu_dma_buf {
>> +	size_t size;
>> +	dma_addr_t dma_addr;
>> +	void *vaddr;
>> +	phys_addr_t phys_addr;
>> +};
>> +
>> +struct vpu_ctrl {
>> +	struct device *dev;
>> +	void __iomem *reg_base;
>> +	struct clk_bulk_data *clks;
>> +	int num_clks;
>> +	struct vpu_dma_buf boot_mem;
>> +	u32 state;
>> +	struct mutex lock; /* the lock for vpu control device */
>> +	struct list_head entities;
>> +	const struct vpu_ctrl_resource *res;
>> +	struct gen_pool *sram_pool;
>> +	struct vpu_dma_buf sram_buf;
>> +	struct list_head buffers;
>> +	int thermal_event;
>> +	int thermal_max;
>> +	struct thermal_cooling_device *cooling;
>> +	unsigned long *freq_table;
>> +	bool available;
>> +};
>
>I would not mind some doc for the four structures above.

Okay, I will add the doc for the four structures above in v3.

>
>> +
>> +static const struct vpu_ctrl_resource wave633c_ctrl_data =3D {
>> +	.fw_name =3D "wave633c_codec_fw.bin",
>> +	/* For HEVC, AVC, 4096x4096, 8bit */
>> +	.sram_size =3D 0x14800,
>> +};
>> +
>> +static void wave6_vpu_ctrl_writel(struct device *dev, u32 addr, u32 dat=
a)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	writel(data, ctrl->reg_base + addr);
>> +}
>> +
>> +static const char *wave6_vpu_ctrl_state_name(u32 state)
>> +{
>> +	switch (state) {
>> +	case WAVE6_VPU_STATE_OFF:
>> +		return "off";
>> +	case WAVE6_VPU_STATE_PREPARE:
>> +		return "prepare";
>> +	case WAVE6_VPU_STATE_ON:
>> +		return "on";
>> +	case WAVE6_VPU_STATE_SLEEP:
>> +		return "sleep";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static void wave6_vpu_ctrl_set_state(struct vpu_ctrl *ctrl, u32 state)
>> +{
>> +	dev_dbg(ctrl->dev, "set state: %s -> %s\n",
>> +		wave6_vpu_ctrl_state_name(ctrl->state),
>wave6_vpu_ctrl_state_name(state));
>> +	ctrl->state =3D state;
>> +}
>> +
>> +static int wave6_vpu_ctrl_wait_busy(struct wave6_vpu_entity *entity)
>> +{
>> +	u32 val;
>> +
>> +	return read_poll_timeout(entity->read_reg, val, !val,
>> +				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
>> +				 false, entity->dev, W6_VPU_BUSY_STATUS);
>> +}
>> +
>> +static int wave6_vpu_ctrl_check_result(struct wave6_vpu_entity *entity)
>> +{
>> +	if (entity->read_reg(entity->dev, W6_RET_SUCCESS))
>> +		return 0;
>> +
>> +	return entity->read_reg(entity->dev, W6_RET_FAIL_REASON);
>> +}
>> +
>> +static u32 wave6_vpu_ctrl_get_code_buf_size(struct vpu_ctrl *ctrl)
>> +{
>> +	return min_t(u32, ctrl->boot_mem.size, WAVE6_MAX_CODE_BUF_SIZE);
>> +}
>> +
>> +static void wave6_vpu_ctrl_remap_code_buffer(struct vpu_ctrl *ctrl)
>> +{
>> +	dma_addr_t code_base =3D ctrl->boot_mem.dma_addr;
>> +	u32 i, reg_val, remap_size;
>> +
>> +	for (i =3D 0; i < wave6_vpu_ctrl_get_code_buf_size(ctrl) /
>W6_REMAP_MAX_SIZE; i++) {
>> +		remap_size =3D (W6_REMAP_MAX_SIZE >> 12) & 0x1ff;
>> +		reg_val =3D 0x80000000 |
>> +			=A0 (WAVE6_UPPER_PROC_AXI_ID << 20) |
>> +			=A0 (0 << 16) |
>> +			=A0 (i << 12) |
>> +			=A0 BIT(11) |
>> +			=A0 remap_size;
>
>Mind replacing the magic numbers with mask and offset macros ?

Sure, I will also go through the related code in the other files.

>
>> +		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CTRL_GB,
>reg_val);
>> +		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_VADDR_GB, i *
>W6_REMAP_MAX_SIZE);
>> +		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_PADDR_GB,
>> +				=A0=A0=A0=A0=A0 code_base + i * W6_REMAP_MAX_SIZE);
>> +	}
>> +}
>> +
>> +static int wave6_vpu_ctrl_init_vpu(struct vpu_ctrl *ctrl,
>> +				=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>> +
>> +	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
>> +	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
>> +				=A0=A0=A0=A0=A0=A0 ctrl->sram_buf.dma_addr);
>> +	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
>> +				=A0=A0=A0=A0=A0=A0 ctrl->sram_buf.size);
>> +	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_INIT_VPU);
>> +	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
>> +
>> +	ret =3D wave6_vpu_ctrl_wait_busy(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "init vpu timeout\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D wave6_vpu_ctrl_check_result(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "init vpu fail, reason 0x%x\n", ret);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void wave6_vpu_ctrl_on_boot(struct wave6_vpu_entity *entity)
>> +{
>> +	if (!entity->on_boot)
>> +		return;
>> +
>> +	entity->on_boot(entity->dev);
>> +}
>> +
>> +static void wave6_vpu_ctrl_clear_firmware_buffers(struct vpu_ctrl *ctrl=
,
>> +						=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>> +
>> +	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
>> +	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
>> +	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
>> +
>> +	ret =3D wave6_vpu_ctrl_wait_busy(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "set buffer failed\n");
>> +		return;
>> +	}
>> +
>> +	ret =3D wave6_vpu_ctrl_check_result(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "set buffer failed, reason 0x%x\n", ret);
>> +		return;
>> +	}
>> +}
>> +
>> +static int wave6_vpu_ctrl_require_buffer(struct device *dev,
>> +					 struct wave6_vpu_entity *entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	struct vpu_ctrl_buf *pbuf;
>> +	u32 size;
>> +	int ret =3D -ENOMEM;
>> +
>> +	if (!ctrl || !entity)
>> +		return -EINVAL;
>
>Seems similar to other checks in the previous part, I will skip them in
>this review.

Okay, I will modify it to use WARN_ON in v3.

>
>> +
>> +	size =3D entity->read_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE);
>> +	if (!size)
>> +		return 0;
>> +
>> +	pbuf =3D kzalloc(sizeof(*pbuf), GFP_KERNEL);
>> +	if (!pbuf)
>> +		goto exit;
>> +
>> +	pbuf->buf.size =3D size;
>> +	ret =3D wave6_alloc_dma(ctrl->dev, &pbuf->buf);
>> +	if (ret) {
>> +		kfree(pbuf);
>> +		goto exit;
>> +	}
>> +
>> +	list_add_tail(&pbuf->list, &ctrl->buffers);
>> +	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_ADDR, pbuf-
>>buf.daddr);
>
>nit: an empty line here would be nice

I see.

>
>> +exit:
>> +	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE, 0);
>> +	return ret;
>> +}
>> +
>> +static void wave6_vpu_ctrl_clear_buffers(struct vpu_ctrl *ctrl)
>> +{
>> +	struct wave6_vpu_entity *entity;
>> +	struct vpu_ctrl_buf *pbuf, *tmp;
>> +
>> +	entity =3D list_first_entry_or_null(&ctrl->entities,
>> +					=A0 struct wave6_vpu_entity, list);
>> +	if (entity)
>> +		wave6_vpu_ctrl_clear_firmware_buffers(ctrl, entity);
>> +
>> +	list_for_each_entry_safe(pbuf, tmp, &ctrl->buffers, list) {
>> +		list_del(&pbuf->list);
>> +		wave6_free_dma(&pbuf->buf);
>> +		kfree(pbuf);
>> +	}
>> +}
>> +
>> +static void wave6_vpu_ctrl_boot_done(struct vpu_ctrl *ctrl, int wakeup)
>> +{
>> +	struct wave6_vpu_entity *entity;
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		return;
>> +
>> +	if (!wakeup)
>> +		wave6_vpu_ctrl_clear_buffers(ctrl);
>> +
>> +	list_for_each_entry(entity, &ctrl->entities, list)
>> +		wave6_vpu_ctrl_on_boot(entity);
>> +
>> +	dev_dbg(ctrl->dev, "boot done from %s\n", wakeup ? "wakeup" : "cold
>boot");
>> +
>> +	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_ON);
>> +}
>> +
>> +static bool wave6_vpu_ctrl_find_entity(struct vpu_ctrl *ctrl, struct
>wave6_vpu_entity *entity)
>> +{
>> +	struct wave6_vpu_entity *tmp;
>> +
>> +	list_for_each_entry(tmp, &ctrl->entities, list) {
>> +		if (tmp =3D=3D entity)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static int wave6_vpu_ctrl_boot(struct vpu_ctrl *ctrl,
>> +			=A0=A0=A0=A0=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	u32 product_code;
>> +	int ret =3D 0;
>> +
>> +	product_code =3D entity->read_reg(entity->dev,
>W6_VPU_RET_PRODUCT_VERSION);
>> +	if (!PRODUCT_CODE_W_SERIES(product_code)) {
>> +		dev_err(ctrl->dev, "unknown product : %08x\n", product_code);
>> +		return -EINVAL;
>> +	}
>
>nit: Always nice to have a dev_dbg() trace that tells the person
>debugging which product has been detected.

Thanks for your suggestion. I will address this in v3.

>
>> +
>> +	wave6_vpu_ctrl_remap_code_buffer(ctrl);
>> +	ret =3D wave6_vpu_ctrl_init_vpu(ctrl, entity);
>> +	if (ret)
>> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +	else
>> +		wave6_vpu_ctrl_boot_done(ctrl, 0);
>> +
>> +	return ret;
>> +}
>> +
>> +static int wave6_vpu_ctrl_sleep(struct vpu_ctrl *ctrl, struct
>wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>> +
>> +	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
>> +	entity->write_reg(entity->dev, W6_CMD_INSTANCE_INFO, 0);
>> +	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_SLEEP_VPU);
>> +	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
>> +
>> +	ret =3D wave6_vpu_ctrl_wait_busy(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "sleep vpu timeout\n");
>> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D wave6_vpu_ctrl_check_result(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "sleep vpu fail, reason 0x%x\n", ret);
>> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		return -EIO;
>> +	}
>> +
>> +	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_SLEEP);
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_ctrl_wakeup(struct vpu_ctrl *ctrl, struct
>wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>> +
>> +	wave6_vpu_ctrl_remap_code_buffer(ctrl);
>> +
>> +	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
>> +	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
>> +				=A0=A0=A0=A0=A0=A0 ctrl->sram_buf.dma_addr);
>> +	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
>> +				=A0=A0=A0=A0=A0=A0 ctrl->sram_buf.size);
>> +	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
>> +	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
>> +
>> +	ret =3D wave6_vpu_ctrl_wait_busy(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "wakeup vpu timeout\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D wave6_vpu_ctrl_check_result(entity);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "wakeup vpu fail, reason 0x%x\n", ret);
>> +		return -EIO;
>> +	}
>> +
>> +	wave6_vpu_ctrl_boot_done(ctrl, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_ctrl_try_boot(struct vpu_ctrl *ctrl, struct
>wave6_vpu_entity *entity)
>> +{
>> +	int ret;
>> +
>> +	if (ctrl->state !=3D WAVE6_VPU_STATE_OFF && ctrl->state !=3D
>WAVE6_VPU_STATE_SLEEP)
>> +		return 0;
>> +
>> +	if (entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC)) {
>> +		dev_dbg(ctrl->dev, "try boot directly as firmware is
>running\n");
>> +		wave6_vpu_ctrl_boot_done(ctrl, ctrl->state =3D=3D
>WAVE6_VPU_STATE_SLEEP);
>> +		return 0;
>> +	}
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_SLEEP) {
>> +		ret =3D wave6_vpu_ctrl_wakeup(ctrl, entity);
>> +		return ret;
>> +	}
>> +
>> +	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_PREPARE);
>> +	return wave6_vpu_ctrl_boot(ctrl, entity);
>> +}
>> +
>> +static int wave6_vpu_ctrl_resume_and_get(struct device *dev,
>> +					 struct wave6_vpu_entity *entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	bool boot;
>> +	int ret;
>> +
>> +	if (!ctrl || !ctrl->available)
>> +		return -EINVAL;
>> +
>> +	if (!entity || !entity->dev || !entity->read_reg || !entity-
>>write_reg)
>> +		return -EINVAL;
>> +
>> +	if (wave6_vpu_ctrl_find_entity(ctrl, entity))
>> +		return 0;
>> +
>> +	ret =3D pm_runtime_resume_and_get(ctrl->dev);
>> +	if (ret) {
>> +		dev_err(dev, "pm runtime resume fail, ret =3D %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	boot =3D list_empty(&ctrl->entities) ? true : false;
>> +	list_add_tail(&entity->list, &ctrl->entities);
>> +	if (boot)
>> +		ret =3D wave6_vpu_ctrl_try_boot(ctrl, entity);
>> +	else if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		wave6_vpu_ctrl_on_boot(entity);
>> +
>> +	if (ret)
>> +		pm_runtime_put_sync(ctrl->dev);
>
>There is a ref-count inside that, so if you skip on error, it will go
>unbalanced. I'd rather always put it back and make sure the triggered
>code will be safe. The state machine should make possible.

Understood. I'll review whether pm_runtime_resume_and_get and
pm_runtime_put_sync are consistently paired.

>
>> +
>> +	return ret;
>> +}
>> +
>> +static void wave6_vpu_ctrl_put_sync(struct device *dev,
>> +				=A0=A0=A0 struct wave6_vpu_entity *entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	if (!ctrl || !ctrl->available)
>> +		return;
>> +
>> +	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
>> +		return;
>> +
>> +	list_del_init(&entity->list);
>> +	if (list_empty(&ctrl->entities)) {
>> +		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
>> +			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		else
>> +			wave6_vpu_ctrl_sleep(ctrl, entity);
>> +	}
>> +
>> +	if (!pm_runtime_suspended(ctrl->dev))
>> +		pm_runtime_put_sync(ctrl->dev);
>> +}
>> +
>> +static const struct wave6_vpu_ctrl_ops wave6_vpu_ctrl_ops =3D {
>> +	.get_ctrl =3D wave6_vpu_ctrl_resume_and_get,
>> +	.put_ctrl =3D wave6_vpu_ctrl_put_sync,
>> +	.require_work_buffer =3D wave6_vpu_ctrl_require_buffer,
>> +};
>> +
>> +static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl
>*ctrl)
>> +{
>> +	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
>> +		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n",
>ctrl->boot_mem.size);
>> +		ctrl->boot_mem.phys_addr =3D 0;
>> +		ctrl->boot_mem.size =3D 0;
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.vaddr =3D devm_memremap(ctrl->dev,
>> +					=A0=A0=A0=A0 ctrl->boot_mem.phys_addr,
>> +					=A0=A0=A0=A0 ctrl->boot_mem.size,
>> +					=A0=A0=A0=A0 MEMREMAP_WC);
>> +	if (!ctrl->boot_mem.vaddr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.dma_addr =3D dma_map_resource(ctrl->dev,
>> +						=A0=A0 ctrl->boot_mem.phys_addr,
>> +						=A0=A0 ctrl->boot_mem.size,
>> +						=A0=A0 DMA_BIDIRECTIONAL,
>> +						=A0=A0 0);
>> +	if (!ctrl->boot_mem.dma_addr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +}
>> +
>> +static int wave6_vpu_ctrl_thermal_update(struct device *dev, int state)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	unsigned long new_clock_rate;
>> +	int ret;
>> +
>> +	if (wave6_cooling_disable || state > ctrl->thermal_max || !ctrl-
>>cooling)
>> +		return 0;
>> +
>> +	new_clock_rate =3D DIV_ROUND_UP(ctrl->freq_table[state], HZ_PER_KHZ);
>> +	dev_dbg(dev, "receive cooling set state: %d, new clock rate %ld\n",
>> +		state, new_clock_rate);
>> +
>> +	ret =3D dev_pm_genpd_set_performance_state(ctrl->dev, new_clock_rate);
>> +	if (ret && !((ret =3D=3D -ENODEV) || (ret =3D=3D -EOPNOTSUPP))) {
>> +		dev_err(dev, "failed to set perf to %lu (ret =3D %d)\n",
>new_clock_rate, ret);
>> +		return ret;
>> +	}
>
>Its an impression, but again, a thermal zone seems to be what is
>missing. If its get bigger, it might be cleaner to move the thermal
>driver parts into wave6-vpu-thermal.c

Understood, I will add the wave6-vpu-thermal.c in v3.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_cooling_get_max_state(struct thermal_cooling_device
>*cdev,
>> +				=A0=A0=A0=A0=A0=A0 unsigned long *state)
>> +{
>> +	struct vpu_ctrl *ctrl =3D cdev->devdata;
>> +
>> +	*state =3D ctrl->thermal_max;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_cooling_get_cur_state(struct thermal_cooling_device
>*cdev,
>> +				=A0=A0=A0=A0=A0=A0 unsigned long *state)
>> +{
>> +	struct vpu_ctrl *ctrl =3D cdev->devdata;
>> +
>> +	*state =3D ctrl->thermal_event;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_cooling_set_cur_state(struct thermal_cooling_device
>*cdev,
>> +				=A0=A0=A0=A0=A0=A0 unsigned long state)
>> +{
>> +	struct vpu_ctrl *ctrl =3D cdev->devdata;
>> +	struct wave6_vpu_entity *entity;
>> +
>> +	ctrl->thermal_event =3D state;
>> +
>> +	list_for_each_entry(entity, &ctrl->entities, list) {
>> +		if (entity->pause)
>> +			entity->pause(entity->dev, 0);
>> +	}
>> +
>> +	wave6_vpu_ctrl_thermal_update(ctrl->dev, state);
>> +
>> +	list_for_each_entry(entity, &ctrl->entities, list) {
>> +		if (entity->pause)
>> +			entity->pause(entity->dev, 1);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct thermal_cooling_device_ops wave6_cooling_ops =3D {
>> +	.get_max_state =3D wave6_cooling_get_max_state,
>> +	.get_cur_state =3D wave6_cooling_get_cur_state,
>> +	.set_cur_state =3D wave6_cooling_set_cur_state,
>> +};
>> +
>> +static void wave6_cooling_remove(struct vpu_ctrl *ctrl)
>> +{
>> +	thermal_cooling_device_unregister(ctrl->cooling);
>> +
>> +	kfree(ctrl->freq_table);
>> +	ctrl->freq_table =3D NULL;
>> +}
>> +
>> +static void wave6_cooling_init(struct vpu_ctrl *ctrl)
>> +{
>> +	int i;
>> +	int num_opps;
>> +	unsigned long freq;
>> +
>> +	num_opps =3D dev_pm_opp_get_opp_count(ctrl->dev);
>> +	if (num_opps <=3D 0) {
>> +		dev_err(ctrl->dev, "fail to get pm opp count, ret =3D %d\n",
>num_opps);
>> +		goto error;
>> +	}
>> +
>> +	ctrl->freq_table =3D kcalloc(num_opps, sizeof(*ctrl->freq_table),
>GFP_KERNEL);
>> +	if (!ctrl->freq_table)
>> +		goto error;
>> +
>> +	for (i =3D 0, freq =3D ULONG_MAX; i < num_opps; i++, freq--) {
>> +		struct dev_pm_opp *opp;
>> +
>> +		opp =3D dev_pm_opp_find_freq_floor(ctrl->dev, &freq);
>> +		if (IS_ERR(opp))
>> +			break;
>> +
>> +		dev_pm_opp_put(opp);
>> +
>> +		dev_dbg(ctrl->dev, "[%d] =3D %ld\n", i, freq);
>> +		if (freq < 100 * HZ_PER_MHZ)
>> +			break;
>> +
>> +		ctrl->freq_table[i] =3D freq;
>> +		ctrl->thermal_max =3D i;
>> +	}
>> +
>> +	if (!ctrl->thermal_max)
>> +		goto error;
>> +
>> +	ctrl->thermal_event =3D 0;
>> +	ctrl->cooling =3D thermal_of_cooling_device_register(ctrl->dev-
>>of_node,
>> +							=A0=A0 (char *)dev_name(ctrl-
>>dev),
>> +							=A0=A0 ctrl,
>> +							=A0=A0 &wave6_cooling_ops);
>> +	if (IS_ERR(ctrl->cooling)) {
>> +		dev_err(ctrl->dev, "register cooling device failed\n");
>> +		goto error;
>> +	}
>> +
>> +	return;
>> +error:
>> +	wave6_cooling_remove(ctrl);
>> +}
>> +
>> +static int wave6_vpu_ctrl_register_device(struct vpu_ctrl *ctrl)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(ctrl->dev->parent);
>> +
>> +	if (!vpu || !vpu->ops)
>> +		return -EPROBE_DEFER;
>> +
>> +	return call_vop(vpu, reg_ctrl, ctrl->dev, &wave6_vpu_ctrl_ops);
>> +}
>> +
>> +static void wave6_vpu_ctrl_unregister_device(struct vpu_ctrl *ctrl)
>> +{
>> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(ctrl->dev->parent);
>> +
>> +	if (!vpu || !vpu->ops)
>> +		return;
>> +
>> +	call_void_vop(vpu, unreg_ctrl, ctrl->dev);
>> +}
>> +
>> +static void wave6_vpu_ctrl_load_firmware(const struct firmware *fw, voi=
d
>*context)
>
>Just reminded me, you didn't mention this firmware in the cover, a
>submission to linux-firmware will be needed with a link.

Thank you for letting me know. I will make sure to add it in v3.

Thanks.
Nas.

>
>> +{
>> +	struct vpu_ctrl *ctrl =3D context;
>> +	int ret;
>> +
>> +	mutex_lock(&ctrl->lock);
>> +
>> +	if (!fw || !fw->data) {
>> +		dev_err(ctrl->dev, "No firmware.\n");
>> +		return;
>> +	}
>> +
>> +	if (!ctrl->available)
>> +		goto exit;
>> +
>> +	if (fw->size + WAVE6_EXTRA_CODE_BUF_SIZE >
>wave6_vpu_ctrl_get_code_buf_size(ctrl)) {
>> +		dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
>> +			fw->size, ctrl->boot_mem.size);
>> +		ctrl->available =3D false;
>> +		goto exit;
>> +	}
>> +
>> +	memcpy(ctrl->boot_mem.vaddr, fw->data, fw->size);
>> +
>> +	ret =3D wave6_vpu_ctrl_register_device(ctrl);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "register vpu ctrl fail, ret =3D %d\n", ret);
>> +		ctrl->available =3D false;
>> +		goto exit;
>> +	}
>> +
>> +exit:
>> +	mutex_unlock(&ctrl->lock);
>> +	release_firmware(fw);
>> +}
>> +
>> +static int wave6_vpu_ctrl_probe(struct platform_device *pdev)
>> +{
>> +	struct vpu_ctrl *ctrl;
>> +	struct device_node *np;
>> +	const struct vpu_ctrl_resource *res;
>> +	int ret;
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n",
>ret);
>> +		return ret;
>> +	}
>> +
>> +	res =3D of_device_get_match_data(&pdev->dev);
>> +	if (!res)
>> +		return -ENODEV;
>> +
>> +	ctrl =3D devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
>> +	if (!ctrl)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&ctrl->lock);
>> +	INIT_LIST_HEAD(&ctrl->entities);
>> +	INIT_LIST_HEAD(&ctrl->buffers);
>> +	dev_set_drvdata(&pdev->dev, ctrl);
>> +	ctrl->dev =3D &pdev->dev;
>> +	ctrl->res =3D res;
>> +	ctrl->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(ctrl->reg_base))
>> +		return PTR_ERR(ctrl->reg_base);
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &ctrl->clks);
>> +	if (ret < 0) {
>> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
>> +		ret =3D 0;
>> +	}
>> +	ctrl->num_clks =3D ret;
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>> +	if (np) {
>> +		struct resource mem;
>> +
>> +		ret =3D of_address_to_resource(np, 0, &mem);
>> +		of_node_put(np);
>> +		if (!ret) {
>> +			ctrl->boot_mem.phys_addr =3D mem.start;
>> +			ctrl->boot_mem.size =3D resource_size(&mem);
>> +			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
>> +		} else {
>> +			dev_warn(&pdev->dev, "boot resource is not
>available.\n");
>> +		}
>> +	}
>> +
>> +	ctrl->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>> +	if (ctrl->sram_pool) {
>> +		ctrl->sram_buf.size =3D ctrl->res->sram_size;
>> +		ctrl->sram_buf.vaddr =3D gen_pool_dma_alloc(ctrl->sram_pool,
>> +							=A0 ctrl->sram_buf.size,
>> +							=A0 &ctrl->sram_buf.phys_addr);
>> +		if (!ctrl->sram_buf.vaddr)
>> +			ctrl->sram_buf.size =3D 0;
>> +		else
>> +			ctrl->sram_buf.dma_addr =3D dma_map_resource(&pdev->dev,
>> +								=A0=A0 ctrl-
>>sram_buf.phys_addr,
>> +								=A0=A0 ctrl->sram_buf.size,
>> +								=A0=A0 DMA_BIDIRECTIONAL,
>> +								=A0=A0 0);
>> +	}
>> +
>> +	wave6_cooling_init(ctrl);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +	ctrl->available =3D true;
>> +
>> +	ret =3D firmware_request_nowait_nowarn(THIS_MODULE,
>> +					=A0=A0=A0=A0 ctrl->res->fw_name,
>> +					=A0=A0=A0=A0 &pdev->dev,
>> +					=A0=A0=A0=A0 GFP_KERNEL,
>> +					=A0=A0=A0=A0 ctrl,
>> +					=A0=A0=A0=A0 wave6_vpu_ctrl_load_firmware);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "request firmware fail, ret =3D %d\n", ret);
>> +		goto error;
>> +	}
>> +
>> +	return 0;
>> +
>> +error:
>> +	pm_runtime_disable(&pdev->dev);
>> +	wave6_cooling_remove(ctrl);
>> +	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
>> +		dma_unmap_resource(&pdev->dev,
>> +				=A0=A0 ctrl->sram_buf.dma_addr,
>> +				=A0=A0 ctrl->sram_buf.size,
>> +				=A0=A0 DMA_BIDIRECTIONAL,
>> +				=A0=A0 0);
>> +		gen_pool_free(ctrl->sram_pool,
>> +			=A0=A0=A0=A0=A0 (unsigned long)ctrl->sram_buf.vaddr,
>> +			=A0=A0=A0=A0=A0 ctrl->sram_buf.size);
>> +	}
>> +	if (ctrl->boot_mem.dma_addr)
>> +		dma_unmap_resource(&pdev->dev,
>> +				=A0=A0 ctrl->boot_mem.dma_addr,
>> +				=A0=A0 ctrl->boot_mem.size,
>> +				=A0=A0 DMA_BIDIRECTIONAL,
>> +				=A0=A0 0);
>> +	mutex_destroy(&ctrl->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	mutex_lock(&ctrl->lock);
>> +
>> +	ctrl->available =3D false;
>> +	wave6_vpu_ctrl_clear_buffers(ctrl);
>> +	wave6_vpu_ctrl_unregister_device(ctrl);
>> +
>> +	mutex_unlock(&ctrl->lock);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +	wave6_cooling_remove(ctrl);
>> +	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
>> +		dma_unmap_resource(&pdev->dev,
>> +				=A0=A0 ctrl->sram_buf.dma_addr,
>> +				=A0=A0 ctrl->sram_buf.size,
>> +				=A0=A0 DMA_BIDIRECTIONAL,
>> +				=A0=A0 0);
>> +		gen_pool_free(ctrl->sram_pool,
>> +			=A0=A0=A0=A0=A0 (unsigned long)ctrl->sram_buf.vaddr,
>> +			=A0=A0=A0=A0=A0 ctrl->sram_buf.size);
>> +	}
>> +	if (ctrl->boot_mem.dma_addr)
>> +		dma_unmap_resource(&pdev->dev,
>> +				=A0=A0 ctrl->boot_mem.dma_addr,
>> +				=A0=A0 ctrl->boot_mem.size,
>> +				=A0=A0 DMA_BIDIRECTIONAL,
>> +				=A0=A0 0);
>> +	mutex_destroy(&ctrl->lock);
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_ctrl_runtime_suspend(struct device
>*dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused wave6_vpu_ctrl_runtime_resume(struct device
>*dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
>> +}
>> +
>> +static const struct dev_pm_ops wave6_vpu_ctrl_pm_ops =3D {
>> +	SET_RUNTIME_PM_OPS(wave6_vpu_ctrl_runtime_suspend,
>> +			=A0=A0 wave6_vpu_ctrl_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id wave6_vpu_ctrl_ids[] =3D {
>> +	{ .compatible =3D "nxp,imx95-vpu-ctrl", .data =3D &wave633c_ctrl_data =
},
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, wave6_vpu_ctrl_ids);
>> +
>> +static struct platform_driver wave6_vpu_ctrl_driver =3D {
>> +	.driver =3D {
>> +		.name =3D VPU_CTRL_PLATFORM_DEVICE_NAME,
>> +		.of_match_table =3D wave6_vpu_ctrl_ids,
>> +		.pm =3D &wave6_vpu_ctrl_pm_ops,
>> +	},
>> +	.probe =3D wave6_vpu_ctrl_probe,
>> +	.remove =3D wave6_vpu_ctrl_remove,
>> +};
>> +
>> +module_platform_driver(wave6_vpu_ctrl_driver);
>> +MODULE_DESCRIPTION("chips&media Wave6 VPU CTRL driver");
>> +MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> new file mode 100644
>> index 000000000000..838e426b3317
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> @@ -0,0 +1,84 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Wave6 series multi-standard codec IP - product config definitions
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>> + */
>> +
>> +#ifndef __WAVE6_VPUCONFIG_H__
>> +#define __WAVE6_VPUCONFIG_H__
>> +
>> +#define WAVE617_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6170
>> +#define WAVE627_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6270
>> +#define WAVE633_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6330
>> +#define WAVE637_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6370
>> +#define WAVE663_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6630
>> +#define WAVE677_CODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x6670
>> +
>> +#define PRODUCT_CODE_W_SERIES(x) ({					\
>> +		int c =3D x;						\
>> +		((c) =3D=3D WAVE617_CODE ||	(c) =3D=3D WAVE627_CODE ||		\
>> +		 (c) =3D=3D WAVE633_CODE || (c) =3D=3D WAVE637_CODE ||		\
>> +		 (c) =3D=3D WAVE663_CODE || (c) =3D=3D WAVE677_CODE);		\
>> +})
>> +
>> +#define WAVE627ENC_WORKBUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0 (512 * 1024)
>> +#define WAVE637DEC_WORKBUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0 (2 * 512 * 1024=
)
>> +#define WAVE637DEC_WORKBUF_SIZE_FOR_CQ=A0 (3 * 512 * 1024)
>> +
>> +#define MAX_NUM_INSTANCE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3=
2
>> +
>> +#define W6_MAX_PIC_STRIDE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (40=
96U * 4)
>> +#define W6_PIC_STRIDE_ALIGNMENT=A0=A0=A0=A0=A0=A0=A0=A0 32
>> +#define W6_FBC_BUF_ALIGNMENT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32
>> +#define W6_DEC_BUF_ALIGNMENT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32
>> +#define W6_DEF_DEC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 720U
>> +#define W6_DEF_DEC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 480U
>> +#define W6_MIN_DEC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 64U
>> +#define W6_MIN_DEC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 64U
>> +#define W6_MAX_DEC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4096U
>> +#define W6_MAX_DEC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4096U
>> +#define W6_DEC_PIC_SIZE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1
>> +
>> +#define W6_DEF_ENC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 416U
>> +#define W6_DEF_ENC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 240U
>> +#define W6_MIN_ENC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 256U
>> +#define W6_MIN_ENC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 128U
>> +#define W6_MAX_ENC_PIC_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4096U
>> +#define W6_MAX_ENC_PIC_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4096U
>> +#define W6_ENC_PIC_SIZE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8
>> +#define W6_ENC_CROP_X_POS_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0 32
>> +#define W6_ENC_CROP_Y_POS_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
>> +#define W6_ENC_CROP_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
>> +
>> +#define W6_VPU_POLL_DELAY_US=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 10
>> +#define W6_VPU_POLL_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 300000
>> +#define W6_BOOT_WAIT_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 10000
>> +#define W6_VPU_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 6000
>> +#define W6_VPU_TIMEOUT_CYCLE_COUNT=A0=A0=A0=A0=A0 (8000000 * 4 * 4)
>> +
>> +#define HOST_ENDIAN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 VDI_128BIT_LITTLE_ENDIAN
>> +#define VPU_FRAME_ENDIAN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 H=
OST_ENDIAN
>> +#define VPU_STREAM_ENDIAN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HOS=
T_ENDIAN
>> +#define VPU_USER_DATA_ENDIAN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HOST_ENDI=
AN
>> +#define VPU_SOURCE_ENDIAN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HOS=
T_ENDIAN
>> +
>> +#define USE_SRC_PRP_AXI=A0=A0=A0=A0=A0=A0=A0=A0 0
>> +#define USE_SRC_PRI_AXI=A0=A0=A0=A0=A0=A0=A0=A0 1
>> +#define DEFAULT_SRC_AXI=A0=A0=A0=A0=A0=A0=A0=A0 USE_SRC_PRP_AXI
>> +
>> +#define COMMAND_QUEUE_DEPTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (1)
>> +
>> +#define W6_REMAP_INDEX0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0
>> +#define W6_REMAP_INDEX1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 1
>> +#define W6_REMAP_MAX_SIZE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (10=
24 * 1024)
>> +
>> +#define WAVE6_ARBUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (=
1024)
>> +#define WAVE6_MAX_CODE_BUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0 (4 * 1024 * 102=
4)
>> +#define WAVE6_CODE_BUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (1 * 10=
24 * 1024)
>> +#define WAVE6_EXTRA_CODE_BUF_SIZE=A0=A0=A0=A0=A0=A0 (256 * 1024)
>> +#define WAVE6_TEMPBUF_SIZE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (3 * =
1024 * 1024)
>> +
>> +#define WAVE6_UPPER_PROC_AXI_ID=A0=A0=A0=A0 0x0
>> +
>> +#endif /* __WAVE6_VPUCONFIG_H__ */
>
>regards,
>Nicolas

