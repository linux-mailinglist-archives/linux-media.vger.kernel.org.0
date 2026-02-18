Return-Path: <linux-media+bounces-53045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBO7MvOolWlVTAIAu9opvQ
	(envelope-from <linux-media+bounces-53045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:56:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192F156283
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10905301450C
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2E330DEBD;
	Wed, 18 Feb 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="ektPI4kx"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021132.outbound.protection.outlook.com [40.107.130.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48C303A1A
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415792; cv=fail; b=JOtcWRKkJ+6woB+UIVWLqLG3dsNY2swDMelFkqr1u41ycnr0j0vFiym5yqYLBxuJepi7iEwoRoyjJ4WrBVAe2LHGSlElNBmUhR06Ljvheu99bExu4HCDM4O2Gse2Bl8uAoy3jiklCs+ZYIXmvTlinA7syONS7ePG5uBr5fdry6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415792; c=relaxed/simple;
	bh=HM3wrjop0wjOstygSglyUxbWn55SyVOYYak0zslHWq4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VW9v8vnsUF1b6zilAi5HKffUyTC7l+NREC3g7UlEbFP7S6VY545rCf/78sfDqsT2tk/KNJw1EiL2ms4cUbpquLI8VUluGRrQcn77liMI4BcepS2UaVHGuL3i6vdLLd3ZlbabS+jUyI5ud4M4EpXUYagTIyDuHElEEs4SsytidwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=ektPI4kx; arc=fail smtp.client-ip=40.107.130.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o61Vl2sT2qNH3jHDTy4dHH/yeTG0iA0QINPrjLsYYZrbXQtOCHb3dky86aeschkE31x+kUGYmm3L8hkw7Yiqelzx+eJGgrp5N3FQCUcrY4hExkKURHNfD86KkUb+w/tuF4Dpiqbtaw5kRz1O7C8m0AbEMJRmUjIpwE98X+SxtCm0AlNfrtYWGGERE0VPE2pS9cq7Z60Q3XmLCeqBPYwaPx1wlSgEXxbFn3mV65Zwi5vXLDtRpNTcrfOXAu0GGhZc6iI/lMEddJfJA3UKBsixgr/xhBVU+XU1fHq9bEgeaaN+tzQcJNAZPdiUxJVBzSwM42AeDD8FAryMOcU4toxLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HM3wrjop0wjOstygSglyUxbWn55SyVOYYak0zslHWq4=;
 b=wuFPqaZ/7jaMgRP0QWFC7P+iyXlxGAw4DBc5Me6nFU8kr//AjDcN7jTqBTmL+voaDMr3wj4L0Yd8OIvU5Kjj3NdxSFPK13fxWF/1Upanya/iX6KGS6VlrGBG25KjqzY8Nj4aj9nrkrpg/WYC1FML8xUr4BLG1Pstc13tAHAqvwUyT3vEuSJk9N6vFd7AUkGOxI+EY4rXVvygqkmiErbz1+FNccTHZXExTTerLgDlDEO4qIz2lRAe6jxNgEM6zbvbKdWCm15HVKiPour1YXrM0KHGQMArickUVT/KLcUeJ0v8UPGdRXTwlsESQwSmXrESvOIx9B8HV7ZHhqJXYCevuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM3wrjop0wjOstygSglyUxbWn55SyVOYYak0zslHWq4=;
 b=ektPI4kxl9iluPR8QzEREaOOPFtt5fSEB00YN95vQEjUm3nc1pasqxChmGx/cQaYIALZl0IDhXonC1RqfFIP5JYOKDe/E0ynjEffkhms1Ufbe3zqFUTkOfAmVZtaWjfbItQ0MXW4yopY31k5yr5GjJN+2bllHyeHUatAuFABtlH2bCwZ4y10KigWIK7nkszg7e1NzYz1rA46nZ7N8QafRbt4fLAx7cMv2btcZKTmERUQpeI92z0pmJ7Wat4nQu/8T8BvfcNs/g5Vm6nhRxcKXOvHRlZ0X5ny9lu33czLR6XE7XhacT3lq/f9QbEwgS9Us3OA65YTrOd92eghQDQNYw==
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::23)
 by PA2PR10MB8787.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 11:56:28 +0000
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736]) by AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:56:28 +0000
From: Itay Perl <itay.perl@q.ai>
To: Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Itay Chamiel
	<itay.chamiel@q.ai>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Topic: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Index: AQHcoMQ56VCXsngA4UKzyfhKPmFOcrWITsiAgAADThY=
Date: Wed, 18 Feb 2026 11:56:28 +0000
Message-ID:
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
In-Reply-To:
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR10MB9376:EE_|PA2PR10MB8787:EE_
x-ms-office365-filtering-correlation-id: 58726cfc-e587-46c4-9551-08de6ee4bfd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?a36JMaFveVa/GrS2NpI1/2MZoIGyDLMMQpUuA1g2LgBbuEQAEmTSuPRsvo?=
 =?iso-8859-1?Q?+CpLda/y0WPlrIhl9kxCXwoC4883TPqFW9UaUBunr9bwNd9A1lmGeKehG8?=
 =?iso-8859-1?Q?aNwF/5Vzi7pSTSSdXdrC5ELiuyipQHPuYk1unPvXdmYXw4GGLKQOOxX4nN?=
 =?iso-8859-1?Q?w3GLymKOvCAAALNFtTcOib2tZcm38M/IUHn55YhIIb2e8LFi4mGW4w7/mJ?=
 =?iso-8859-1?Q?qK7vNy9toB1KqF9tEPbf9RfFR6YX9fgisecjHd0O6zvNjVJ+KCjIlAorgz?=
 =?iso-8859-1?Q?vaGyPxP3ffva5IBg+HZFOMLr32BmunmcOb9WlC7JQSmt3RHPKezf6bzp3x?=
 =?iso-8859-1?Q?1o/hl0MlQ7bPCgKJQF6+FTMWcKbfhWbx4mtVze1efgipnL/6eFUPT/lMgk?=
 =?iso-8859-1?Q?HuXwUj7+GEEQg02TUy2KJyT1E/mmLsZihpwmdv78Q4xf9XAHAjjSJaSzvc?=
 =?iso-8859-1?Q?sOnG4ZmkXnvDDN4UQc1UQ7njoYpTv81ua7tja6eiGS3LgwyyL53qCPqi5e?=
 =?iso-8859-1?Q?zmQ14g2PUotyXYxj0BtVOZlLyYSHx6Isksz+oPIJIPXuHB0dZOf/dp/tWV?=
 =?iso-8859-1?Q?U+PeLxQayIdqNWBWeoL6luzhnI7oAqLPem9l6yd5gQtOqMSokmHuHNIzdu?=
 =?iso-8859-1?Q?hyckiHPf55M2d294TburrjvgF1dzzav+p1+r6dODCRz9MCLbnMvr4p4pN+?=
 =?iso-8859-1?Q?PwbF9ebRnrxEGA23Xk0eWt8pfI7zt510cE4BawR04Zj37LrEkB5bPFdlr5?=
 =?iso-8859-1?Q?5bDQ9jiuaJ8zrdAdWufQgUmeWNdPFux7aWK2kJfb9vQ9m8+nnp2yRD7zjn?=
 =?iso-8859-1?Q?f2Hm05ABso10ujJ2/pvVHivbaSFyyPGuN89ieNYZP7S+3EQnsCeW0kpUy5?=
 =?iso-8859-1?Q?vLxmbMXcJ5O+MI8W52sReQMvvpfHRZxzGEA9HmDbt9PETzQoU8Ier8v/M6?=
 =?iso-8859-1?Q?jiZG39nwv+5VUY5jhBflyOXh3WUAG0kLYAB2AH99wXP7SCrDE7Md96vKFn?=
 =?iso-8859-1?Q?MeZKSIAQEYSy0S8mY05oaTc4LPYFXFrvFvlvnxtJyYl/EEvwpW7tlG+qDK?=
 =?iso-8859-1?Q?n6c1NmdMp9Pm0xW7RCXZnNXIAXS0BUO737snq7nL7PsgHbjiv5SC7haqkz?=
 =?iso-8859-1?Q?9tgaqBCdTy2yyIKuvyYkvGt3AhZfhgoecCeo35bVMNIm0PCDLX8liRcxwr?=
 =?iso-8859-1?Q?pTDbzlfz38UIQKZl/w7bWWkGPWW35IDT59EYqM/cz8N2TZJe9NSjoffkm6?=
 =?iso-8859-1?Q?heKUnu6FTWIkvCmURq8M7jgt95XptjnDqZB6OlAgDoVsuveCXhKrYeDR/r?=
 =?iso-8859-1?Q?/6wFbf/d97fLklzFQj1Hqj1S4Bd81rnfvxK+bmffOHngMrY4z470YXTSWE?=
 =?iso-8859-1?Q?/5Lc4dXY7KVpIxlKy9poQ/tZbh4uwoqmuE16BT7uK0ua69+dCov/yybLDL?=
 =?iso-8859-1?Q?hMw4UsR1fy/UhPh8+Vtuz2ZkhfwGs8SHGvQH6d1yxd1Qb/Bx2MfdoM1yP0?=
 =?iso-8859-1?Q?JWMjM/kKcbHHYvE4QV2y364JaYpVu2d4F7FMaVXaJgAPDVMBHdsyDdwcU+?=
 =?iso-8859-1?Q?KsJLoUBtQgYdYhqz+0Hv+DeVRtG4kzZe0wl/gyGBDDN+cn2GZIrNt0RtfP?=
 =?iso-8859-1?Q?afKeCyBHjWIuY1RDuxyXOlLtyo1JJST5CZEpj5CmJ03fMIyK53YiyL/Moz?=
 =?iso-8859-1?Q?YzbsOeUkVW1cDS6nYtU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pP0t9J0xIUMx5eCx7UW29+tuWeRe528Uv+6FIT96suEYz+GGotnqpygiTm?=
 =?iso-8859-1?Q?bsr9OurvuSHzydqXHwBS/n270lAs16HKI6HnRpJfQaJFDBjbvFAxjd36gw?=
 =?iso-8859-1?Q?XHyXFbc/ndhgPdswRlVBQ4H4QtVGMW6uunZOkrAKWhO8JcSWKY0mjnPpJD?=
 =?iso-8859-1?Q?5O8KtjRBTHDmVinhlj5miTak8daDlpmIjuFD7iH+t5aAS2khjkId1g339O?=
 =?iso-8859-1?Q?Hjst0K2YZmULlr4HTLzHC0zgzVvByQ8NUmBGxhU/LW5CaBbMmszIMgtlsB?=
 =?iso-8859-1?Q?tCc+cx74Z+C3OgeulXagFtUAkwlS5u2VijEJPb/1SMVDUMIkCUJKcuh3cC?=
 =?iso-8859-1?Q?NUaFQuM8aDNqhej/EfxPN4sivDu1qmbyIWAV+oJPh4z573/giwsshBtdHH?=
 =?iso-8859-1?Q?RbeZ/qzWZfUGC58phKMuOMYE0BE29dx0V6zCfXx1gcLHf7iqjTlJc5ZtTX?=
 =?iso-8859-1?Q?Px/aqUychsLIyuBx30W21BD9U2Lm94+Oz8luHR/KW63PlV9PuV9XQNT4YD?=
 =?iso-8859-1?Q?kNatxMVcBxqzLCWtdoc/1EKKqTWyK8t3ZoKTPWA2cFnm+VydBjtoUNBKPh?=
 =?iso-8859-1?Q?FJEbEVsK0Ib/wlpR0AAYnD/bZHKhWPab676FjbPCFjwbL4C+c/h3nw6EXC?=
 =?iso-8859-1?Q?gWt+xNl7Zl4EAysZU03fpoEgt2cp3j2uJZQFIk9c/OC7b19o+yNORduh42?=
 =?iso-8859-1?Q?glt0C5+pp+RXKNlOSvB7qxibKoEs61z3RGD//I9rVzBMp1xlD007utwpz0?=
 =?iso-8859-1?Q?g8lHZVVxOJtUjxjSKiPb/IGgn371JkA1ugYrAP4q/aOH8qIwYYJIjvz01b?=
 =?iso-8859-1?Q?CSOIO/OVjVSF2j7Ibvg/IIhs5/7BwLXr1uU2yUC+ehvT6NJI2WuHl+I7s4?=
 =?iso-8859-1?Q?4XmUu8dSMSBsUFhMT2SsrkWQ1I8rhxF7bxoWqjePgWTAPSGrkWBbE+amMm?=
 =?iso-8859-1?Q?vVo7MBnPKe8apUgVB7ZVJAuNGHIJC0s+mVOFclEvd8FLhz/zK7WgMgV2m6?=
 =?iso-8859-1?Q?1+y+q0nF9y0kFa1mzaQ6dtEEdva9+OMVcSQAh9AKKDsalMNPzZWbrjVAOE?=
 =?iso-8859-1?Q?yTnvFHbfozsHvvf6k/D1zK6KfBlkQOWHMmpxRKmGKq8MHPK6LfjJL5l/H/?=
 =?iso-8859-1?Q?lu12aaR4npS05rRExW87zjiOo7zki2qe75sdhcNIhujEPk3DfVfujd6n3S?=
 =?iso-8859-1?Q?D8PsnlMpWoAKQiW/neCsiQWrdFigzVpwtDRpkpq1p6IQCgQ4eBy0SMvS/j?=
 =?iso-8859-1?Q?FXc572xb6WmdTVbFRy+EOfKn3eZngtXN/gUWDNEMmW6AHtGuU2K5VwLAC3?=
 =?iso-8859-1?Q?Dil2QD9oXFhQhP26OFUl770YqYLi7AKykvQ4LPwQFMU8c/eDQ3k4I89co5?=
 =?iso-8859-1?Q?+GQ047hb4/SXcxQm0vCqnHE4qSHv0rb6d+Guii4lZ4mhCvQylR4TXseGHr?=
 =?iso-8859-1?Q?CFvKOZjNP3zQdn0lTjy0xg+KLHBZE5HFUTGKOz1A+C2NO1R173ywjTL6Sw?=
 =?iso-8859-1?Q?RB3jL6BeAdxesirXFVa6qdnkvQ9cczpCenHax4tSooa+yMfvQKLMscwBjR?=
 =?iso-8859-1?Q?gZmogvIGG4QznRGRkP+gGlpvddBJVkj4ix4GoyMD7PCLoyRkrjQ5Lw8TVk?=
 =?iso-8859-1?Q?uON+JoeUDJvxS4wcpl3ytNc9cbhy64/5i3+N84EUdpAmmDRa3fc2VevtrX?=
 =?iso-8859-1?Q?h46Gtp+RB/5UrEL7JBIvFLai6X9IMoFk6Xp79RT9sBUqMoBsI2iwMT1CiH?=
 =?iso-8859-1?Q?fkB09Xe9fgqjPpHcxPIPDfTwdD+HhjYQyfzPoqWPvRJKUU?=
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
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58726cfc-e587-46c4-9551-08de6ee4bfd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 11:56:28.2205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2g8OkHXWdMf1nuk8FVZ9ZC8efgI4EzhPn9kSP8qIwdjQLY3wurj6fhSNTg4MHOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8787
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[q.ai,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[q.ai:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53045-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itay.perl@q.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[q.ai:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:email]
X-Rspamd-Queue-Id: 4192F156283
X-Rspamd-Action: no action

Hi Ricardo,=0A=
=0A=
________________________________________=0A=
From:=A0Ricardo Ribalda <ribalda@chromium.org>=0A=
Sent:=A018 February 2026 19:17=0A=
To:=A0Itay Perl <itay.perl@q.ai>; Hans de Goede <hansg@kernel.org>; Laurent=
 Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Cc:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Itay Chami=
el <itay.chamiel@q.ai>=0A=
Subject:=A0Re: uvcvideo regression: loss of access to full UVC payload head=
er for generic UVC devices since 6.17=0A=
=0A=
> On Wed, 18 Feb 2026 at 11:59, Itay Perl <itay.perl@q.ai> wrote:=0A=
> > Would restoring the previous behavior be acceptable for compatibility?=
=0A=
> > Alternatively (or additionally), would it make sense to introduce a ded=
icated=0A=
> > metadata format that allows userspace to request the full UVC header fo=
r=0A=
> > generic devices?=0A=
> =0A=
> By any chance the device that you are using supports=0A=
> V4L2_META_FMT_UVC_MSXU_1_5 ?=0A=
> If the device exposes the UVC_MSXU_CONTROL_METADATA control, that=0A=
> format should be available, and it provices access to all the UVC=0A=
> header as you had before.=0A=
>=0A=
> Alternatively, if this is needed for a specific device you could send=0A=
> a patch adding the UVC_QUIRK_MSXU_META for that device.=0A=
> Would that work for you?=0A=
=0A=
My device is an internal development platform and does not have a public VI=
D/PID=0A=
that could reasonably be added to the driver.=0A=
=0A=
I may be able to implement the MSXU control on the device side as a workaro=
und,=0A=
but I'm concerned that this could cause issues when the device is used on a=
=0A=
Windows machine, which may expect the UVC header to follow a certain=0A=
format when MSXU is present.=0A=
=0A=
---=0A=
Regards,=0A=
Itay=

