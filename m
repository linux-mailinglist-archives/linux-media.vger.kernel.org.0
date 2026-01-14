Return-Path: <linux-media+bounces-50692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA8D1EB16
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A8D8300F073
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF430396D36;
	Wed, 14 Jan 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="D4AlkOkT"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023079.outbound.protection.outlook.com [40.107.159.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51972394490;
	Wed, 14 Jan 2026 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393068; cv=fail; b=PDzK1QemokH9DKF7omUlijXhAHjQVsIK6ooQva/bxDIhd9PibPIR8GiSMlywmTTd9I4r7D5cemgJ9EeECK1BavIFADy4oK6FMx0jYCc4He3VKR0hHFi9P4DqW0LXmT+cgnVxB3CTkVMaSVoLBFxSzbHACmUEurS/5doq55AG5EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393068; c=relaxed/simple;
	bh=M7kFjIxA5Op+Xo+dq8M8KCGG3ebhoPsmtEPgs+adgwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KO4Od6UvRz9IU4RG/uBVPWF6NVTyQKgZ66tc1Pt34kq7RD9DzNqQigcDiU9DOQUtwJ0ikrt58lEfNra4CB7kBnt6F149lgEGiQKmWXID0+/h/b4KshO7DqzB3G8NXYt/t+tpyNyzi0fqNdlf8l8/IH15yRMuhsbvgYaztMwJW/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=D4AlkOkT; arc=fail smtp.client-ip=40.107.159.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Juwj5Muu1D+EEY9nenp3tNyr8ZkoBNPA/ExX4TefDJVrtTmUPn2VTmbfnDQhsig/3O3oN9KolJSTS2TEuZnm8JpTfxOmumGRZz8lWi2IrdX1cySk2ZgQGas4SKEzQpqysJ5DcCUONfp4NM2GzlNwOxFFNoM+yA+cOhMOHREddk2Sc3lKfc0wgwzFpQDBEJ3FZbOXk7+xhUlaBtdfepqOXgk1RpzQ+WC13OFz2wJnDKuECN4Mh9+rCfPJNKhc6MM+0DmuY/3Z+pG4j7qk0vDkwUuKZmj4K7U7XiqP1VnJpXXcEq02WwFR+GSNaAqI15PIspwCbQn5Md7UW5Woyq25kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7kFjIxA5Op+Xo+dq8M8KCGG3ebhoPsmtEPgs+adgwo=;
 b=SI7iqEJOf+SJGkgQ0NMOkFWxcWrcgPJK9RYu8U48v9av+mYQabAGzsg5FHPNnON64Nl6cVcdJmtOQpmT9RGulXhCgUxjW+Cvu3HGhKpbb3ZeBZz89YSwv9A9WrWC4pu9MpCYrJ6DrUHDj3e/J6zmILzDKEKfWv5poDnl7eUp9aQInfDAAv4CWIILWVw+gYxXef40QWCjPBWBM8dmtcgae/4jiiXSdT5b1mPJM/7Gt2kDfQDy0WN3r6T/NHgZXR0P7OHK9OHIG9t7e1G17tuzBOt3G9sL+tJ5ZHt/p7Qmtli6Qko6nRk4KEGJjwA6dqFZ2xWr2OFJyXTye/DdspIWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7kFjIxA5Op+Xo+dq8M8KCGG3ebhoPsmtEPgs+adgwo=;
 b=D4AlkOkTMNMAYT7qsHzfv5TMZAkSvehVzkc+sSg2edt2iT3vVT+UNakt93UXU+QXIpZd4MBarFTT9J/bGku2EzIOgi0l7+mAArdp9eg9kQOdh3BxdsLMp8Gx87kyj09nvFKuvUqIOWBc/lA2o9QSgzpHG9DpEyuOsfpjD9pm3vpFcRUToUX42Lb6OE2MSEnBafjZBx720h+wJ0ab0r2Fln5XIbmPguuDzoygar4jtFU5/GGXP2FG9lBeK0LCcuteT0K4iNAr03xeEX72MCwBY7VWZEJ1f2EsBXkk3QZlpFm8DKGBH6ChuaTVNYgJWmiCJPY+755WqTBLTK8TuquupA==
Received: from DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46e::10)
 by AS4PR10MB5545.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 12:17:42 +0000
Received: from DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f76b:b6df:cd63:e889]) by DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f76b:b6df:cd63:e889%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 12:17:42 +0000
From: Itay Chamiel <itay.chamiel@q.ai>
To: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: Laurent Pinchart <laurent.pinchart@skynet.be>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] media: uvcvideo: Fix allocation for small frame sizes
Thread-Topic: [PATCH 0/3] media: uvcvideo: Fix allocation for small frame
 sizes
Thread-Index: AQHchUEPgBOmODikk0m7TrsPS1TZY7VRiKxN
Date: Wed, 14 Jan 2026 12:17:42 +0000
Message-ID:
 <DU2PR10MB778691F8B6921A75531B08C6E18FA@DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
In-Reply-To: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR10MB7786:EE_|AS4PR10MB5545:EE_
x-ms-office365-filtering-correlation-id: 86e13e09-370a-4c3a-e49e-08de5366eabe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?w/ZvEYtABvB0X5jTb4zt1e4gTcpZoxABH1/ollDZbiGBN2jCCbXrBHUJ0N?=
 =?iso-8859-1?Q?Q7Yd9NsQeE/WiEK+2bL5ilOP32QEKAcMNTcQHCjVjcVgO7EKo6MTBPxki0?=
 =?iso-8859-1?Q?aXZBQlZ6lkFFJgipr5gVMoHHEpcrz59kZX06+49MdBZnJjM3dftQD7QMxV?=
 =?iso-8859-1?Q?0JRUOLP45jOA3omVnXTy42oTBudjuzBXq0mWZ954c0d0GJvIAzL0Eq/Q89?=
 =?iso-8859-1?Q?95s0zrWLB/cYitPidyN9oYyCxjEQCljxGS/2+04sDwpOTZS5dkztWRTNAt?=
 =?iso-8859-1?Q?oKBs1VK+XSj+BavuY3JXPNTgM9+ToQu6DQMifcgGLnBgE4EciViVGFn/rj?=
 =?iso-8859-1?Q?HZN9RDlWUevvT9/i2Jotz2jwLYWID53/lojoEOj/dUYkETfQhub8HSIHYX?=
 =?iso-8859-1?Q?Buvi8CUI4FFqL3zYGfruGCYPYTpwZ9RVT70dV5dIiZiCaQvjU6PXfNJ/2m?=
 =?iso-8859-1?Q?pPSgzaXZ+A2NAfVjteVd70ndC9PCiWcl+LpNLRBxaANI1XhwYqGaKauNxJ?=
 =?iso-8859-1?Q?5Q5d/JsBlfzJuXZ4CtqP34jRDVjkv0CG0H8YoFzuicJ+7nHWW4itvEsrCL?=
 =?iso-8859-1?Q?DDJ3NWQ05T32AAZoOUUChtEBLe9U/6Bw0ZOJ1unIQnGqTx1BCXdBLNiy8g?=
 =?iso-8859-1?Q?rLrG2JdemV6swPmjznE+06JXoQu5oX2RDADs7BnQAGUu1hXbSkHVc0hbSH?=
 =?iso-8859-1?Q?xJwMrkubCzVnQVdV0ZMfZx9sbMlYazFcFaS/Amyd+8gSgrbsFl4J40TKvI?=
 =?iso-8859-1?Q?cUo+L8oVd4zpxDRi2nYKpLUyZGMEzmTNCoW/N/WauTIzoepmDdT1MDP1Es?=
 =?iso-8859-1?Q?855k6UKhIwOaFUzlk6YXmnFPrbW6ksSL2ux8f4hwVHhMhubTCLkT88P+cr?=
 =?iso-8859-1?Q?CX/wIY63i6izSf6CNWoh3jRc2qwmXCqcmJLdRStP3KPKMW2gvcJ6vofHUT?=
 =?iso-8859-1?Q?7UHb9Q/XJzsE4lqzewvKna5NtUNagTcHoXOtNqnzUk7PoIP+Asx5wV06Te?=
 =?iso-8859-1?Q?LgOBFptVyOsS3LkO8nlDmmpidEnIhN7/JqlUH6OQM23aLzo4joFjZtpd6x?=
 =?iso-8859-1?Q?0etfSUqxA6A1mnMnbKv2dAYtCyV8m7VyFNw/1GZ+OqfP2DOncBfZIi/VSi?=
 =?iso-8859-1?Q?qaw9rSIkPwNkWBl0utJSi9rD83sUryY2e+9byu98VGJuVukazlSvQeD/i0?=
 =?iso-8859-1?Q?D/+rNQwiPo4BEwPEACFKAEiIUEqvPhBsG9H9pi6SC1gvYN/6zvfdbLsr8J?=
 =?iso-8859-1?Q?R99t7vUSN2bcOdBAcFWQwPwzubR+NM3IPERbEdEA7JkZIx7HAE7jf/2i9S?=
 =?iso-8859-1?Q?1iHYYEE3wqYOECGvEceEPZ0zWx0V7adhyyFY9pRwkEBfPVT0kyqWz4J0d7?=
 =?iso-8859-1?Q?lcMKBejDwUAIBgnXAU8RLIkFaiw6bDNQuZjNyUUXX6bokq/JKN2xf3Hr/f?=
 =?iso-8859-1?Q?w+PGZaqWdxiyQIhkTyXsA3p+okk2jY9KzmuZif6sTNhC5huHKov4iFMvoJ?=
 =?iso-8859-1?Q?ENpqe1xZ1v+vMiLAA0544YMePwDgoRtNyYWS7sZPTBHuZZaYuOp+W4XnbF?=
 =?iso-8859-1?Q?/WIDegDfx8HaBQqQp36FWtsGXS7txmEZRfXJpX8h4XnRWzDK4iS99BD/+D?=
 =?iso-8859-1?Q?U2CdNQQCRGaP9IGhR2Hj4YI8SA0h9CQaV/HaFS9f4bsZXuAperzSPd/xoi?=
 =?iso-8859-1?Q?Alimdtk4VqQn+KlHdY8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Rcobk5B/3LsRCXgzjvJhS7PXeC+SBCy+pTdqdYyn60KttJ1p5KywTIDGw7?=
 =?iso-8859-1?Q?BqIlYWjYz5YjQBdpFOOJ6nyk2eIZS6IqBYtKX84Ke/f8ilc4F5BwE+JYH5?=
 =?iso-8859-1?Q?6eYOOq5cic7B7khHoTbfQt5OeRddTe3TL6cAm8F1ohR/yREmqheTCIfMRv?=
 =?iso-8859-1?Q?HTe168M0VK8nBIU2xGIe2H2+KCXOYexb8kwPuhISPTaVmxo5yE4KheguCe?=
 =?iso-8859-1?Q?8fa4q1sTt1xAxddD6u/LgRYoXR5aiJOo7/OUZm+qXasVwlhZNI91YgYLDN?=
 =?iso-8859-1?Q?Flb3eBUPjh40tTMcs/C0t8h8GVrZ0U0Q4eJAGq9YZxP1PxBPx4cOdhENMF?=
 =?iso-8859-1?Q?wkVWlW3TnTwYKj1V0T5nl1NLJMbx+WWwWa32XQ+ygVmIcjVY6MEPQYrfj+?=
 =?iso-8859-1?Q?9VRw9yCc1HlfSicSkhjEvGoHTmnnI6sJZL496Q1g75PWU+XRDRYA5ADUBd?=
 =?iso-8859-1?Q?E9vAgdVQgj9iZlPYPQ+zptP2DGXUclhdQO9O+BNno++OU1iBkx0nzII40b?=
 =?iso-8859-1?Q?+15208ETVlxWSdHKTENqXaWYF4X9cUqXhuCKgZfw216OZ38aVKBib37VoQ?=
 =?iso-8859-1?Q?/q+Ujbit2mqSRPpS2vIghbxuRHgloJltySwxFUfusGJ2q3Bfr5x2pONgyt?=
 =?iso-8859-1?Q?5QzfFavL6AI1d8ZXhdbg2kB8bhnpdoGGogwIQYI1vbyt0ylTNrdgHmXoKu?=
 =?iso-8859-1?Q?b0ok5hHdRa/UlZIudeh+iMfLQ2Nyn1ZAUPqH0wnrW+d8Hd020KjLyifC4r?=
 =?iso-8859-1?Q?38ANkn+KbGbNimzWyuHmOTZx3fiSKZGP+oPDZNtnc49AauBvntPJq16q34?=
 =?iso-8859-1?Q?ltUp8MSVPDGExTsslk6gFU7ryk28kIS8MYhKw7VIYS0Nyx2D03L8mB9Czk?=
 =?iso-8859-1?Q?B7pIXbnOatTFaQL95FvBJpMAggef4k+AeYv9dTeNy1NbUAnAUQsvOS36qA?=
 =?iso-8859-1?Q?Xl/c4kA5VrZMjgNoosORIZji2OsLTjJkZkwOkR8SVFwvGmxJAnxZ2RvLjS?=
 =?iso-8859-1?Q?fDHk0THYsN+fC2HDjTDBF220qdm7ojzxRSbLnMrMhBwcYpO6ZBJVzR4LH4?=
 =?iso-8859-1?Q?U93E1SE9aC8Bgirzuz0O73RXCiDZoLlrM+zWJGiPJYhYv4lv48kUYK1UcH?=
 =?iso-8859-1?Q?5G+zDeleLJb/XTlFqp2Ru+9m7k6U09XkIU2ZXF0v1rU3korjxuDQXhQeiC?=
 =?iso-8859-1?Q?CYYt/M5W6pE9WirUap5apn76FAqQYkJRNhyzvokdcOeAZXMXe2QuI1iQrh?=
 =?iso-8859-1?Q?jN4UFeVGEb3RNvks1TlUyEGZEPIJmoOU6VCJ+GaFCz9Le5VVm8WZdQQ9/f?=
 =?iso-8859-1?Q?bassi68gT7VE3CJ932LsvRVv32lT9ICb6/ZAwLR7Fp+Pnd85emVOMWpxRW?=
 =?iso-8859-1?Q?0NapiCIEfRdjD9ZRJWT7Ikne22art4PORMQK0cAQ9ze8CIV14WnC3nVSO4?=
 =?iso-8859-1?Q?e0mZb4RcUcP09GX/REaygx1Ua5v3efuN07dJ+sitWP/bTIqTBQVirCX26R?=
 =?iso-8859-1?Q?m8TPjGnl934nXqJ0e6ZVtWc14vhjqfHK7l9+q6VUvAqz0nTzeylt0VyRL5?=
 =?iso-8859-1?Q?pwWfx1J4a0/wOy343ksUOfJF765Ms8bY3tQHxaJSYFCDj92ThK0AU2iOOK?=
 =?iso-8859-1?Q?aA5nNgpnAgx7ssf2TIH6bFhXPgqUMmxxYslt2sBHHqduvduZOLzHpfQPtw?=
 =?iso-8859-1?Q?GrO7+pxIsTFf9ELT4QRRAHdWgsomXwOOz8ExKtzCTpjveX00XgARuawrFu?=
 =?iso-8859-1?Q?ckuW7V7bzgvQ9F93YQ6qhUhVdI8EwZvGeECK0nhowFQdDB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: q.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e13e09-370a-4c3a-e49e-08de5366eabe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 12:17:42.3098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7E0PCHOLe2dW+JoohtOjmROKjAtuRpNv/IEBRsgglS75H7ztxLbU2WlpifeUPLNctjePGRXRk4xOxaG3yfyv4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5545

The patchset looks great. For me it required a tiny bit of backporting beca=
use I'm running Ubuntu 24.04 and editing the version of the kernel that's r=
unning on my machine (6.8.0-90.91), and uvc_alloc_urb_buffer() looks a litt=
le different there. No issue though and my tests run fine; first I tested s=
mall and large frame sizes with my custom camera, and then I also verified =
that standard webcams didn't break.=0A=
For the whole series:=0A=
Tested-by: Itay Chamiel <itay.chamiel@q.ai>=0A=
=0A=
________________________________________=0A=
From:=A0Ricardo Ribalda <ribalda@chromium.org>=0A=
Sent:=A0Wednesday, January 14, 2026 12:32 PM=0A=
To:=A0Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Hans de Goede <=
hansg@kernel.org>; Mauro Carvalho Chehab <mchehab@kernel.org>; Johannes Ber=
g <johannes@sipsolutions.net>=0A=
Cc:=A0Laurent Pinchart <laurent.pinchart@skynet.be>; linux-media@vger.kerne=
l.org <linux-media@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-ke=
rnel@vger.kernel.org>; Ricardo Ribalda <ribalda@chromium.org>; Itay Chamiel=
 <itay.chamiel@q.ai>=0A=
Subject:=A0[PATCH 0/3] media: uvcvideo: Fix allocation for small frame size=
s=0A=
=A0=0A=
This set fixes a bug in uvc_alloc_urb_buffers() and two more style=0A=
patches.=0A=
=0A=
The first patch was Reported by Itay, who asked if I could prepare and=0A=
send the patch on his behalf.=0A=
=0A=
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>=0A=
---=0A=
Ricardo Ribalda (3):=0A=
=A0=A0=A0=A0=A0 media: uvcvideo: Fix allocation for small frame sizes=0A=
=A0=A0=A0=A0=A0 media: uvcvideo: Pass allocation size directly to uvc_alloc=
_urb_buffer=0A=
=A0=A0=A0=A0=A0 media: uvcvideo: use min() for npacket calculation=0A=
=0A=
=A0drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------=0A=
=A01 file changed, 10 insertions(+), 9 deletions(-)=0A=
---=0A=
base-commit: 17526c7e69d07395e9d39794aacba42dcb02ff49=0A=
change-id: 20260114-uvc-alloc-urb-d1a0c617106a=0A=
=0A=
Best regards,=0A=
--=0A=
Ricardo Ribalda <ribalda@chromium.org>=0A=

