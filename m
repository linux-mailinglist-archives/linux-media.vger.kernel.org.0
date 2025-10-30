Return-Path: <linux-media+bounces-45977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C1C1ED8C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A8AD19C407A
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E9B337B90;
	Thu, 30 Oct 2025 07:50:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020110.outbound.protection.outlook.com [52.101.225.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2532E13E;
	Thu, 30 Oct 2025 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810652; cv=fail; b=evOP/s/+Z2Sc1BbikYWTg2RaSVKsQMOTiVdERTXZV35hU/enWvliCyrSUpFl2QVSP7smb61+G5rR1s8Ny92lOS5mknkheb/p4+eLWdTJLRMcCHrCg9jxvXtxvskbG038qXxzP5uxfmn5wyGE6q77hLaAen6OCXWFXAWloJsari0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810652; c=relaxed/simple;
	bh=L9C9CQwMRuoaLFiOoO9+ZChnDHL3+pLVpPKXLlQtZp0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1NoaWzX/mNodNTvAozED+JJMgXi0VfLGm5aompKFuNq8jKmyvK2EAx3Q3YZd290qIPC4wEjwP8eb0+I+HOCP1ZD3EUK1ooAilvE8ljdMp+uyJOZ6iPo5tO9lzsJq5IX3SxMHtSbvCIJfdMgfCR8KdosXgGZ9rO3KKWMdgsDD8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWiElrSkOtoGXwU7JMb/0+uAqy2qX8qTOPiXWufX7riMlnPZl9LH0c6NkYcVpSPyHphg3W1vm2elxR4M5RAP5UMd+6/RaTcSXzEWX3+Ovnv2R0Y7s/OGYVZTEGfFQtTwvjjfhQ5r1nh81kpwWNPVPFIvtCPk7X/o/T8Ch8cSGFiOYawdSura/SWyHf3uB8KJpS6Dw2vdeuAL507hbHGQyJRVzKjZaHqEB88vYDQ8tsEKQ5mzG6KBRU0kKhQO7s52pJZoZGN+t3trYIkawYhv4DjXybFaBk4TPA+rmm42zhmexfnTWGjPIcp74bM9o43c1XYC9Rm7qTMP+hDNfMLk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9C9CQwMRuoaLFiOoO9+ZChnDHL3+pLVpPKXLlQtZp0=;
 b=TeIUbUbF/4Wd8Ff/p5HPTZTayIdBGiMs6H16ziuhhXbPWMYyVHqM3q7HPlE8Bf9rluHjfiTsxoxhjOH9VtJESjJ99d6MSsr0yU4hrjW0yDa5kNJKT49qYPc/QSS6D7BI5aDufACCCzEkuc/DJ7t2GUmaTGKX5uLv9oIHVA6lt1PhstEAIc7GkauaoFaYYGox/2lsnVZVFoz0o3DQihRgSpiCamqntDckGqgtqvlP24dlkEfM3lTOOX624jIV16DUrCuX2EpEIVNPSZKPmlipsCTsVhhiR0dfLynU1upBh+lg4dob6s+pkWDxJJvemM8ymes2toJioTCewJR6ila21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4554.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 07:50:47 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 07:50:47 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>, Dafna Hirschfeld
	<dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid
 pixel formats
Thread-Topic: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid
 pixel formats
Thread-Index: AQHcGM29WMPsfr2GPEm67fUHmC8L7bSV4PMAgETN5TM=
Date: Thu, 30 Oct 2025 07:50:47 +0000
Message-ID:
 <PN3P287MB182921C17B4025A0AFBEA3278BFBA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
 <175802737238.1246375.11921455447379092868@ping.linuxembedded.co.uk>
In-Reply-To:
 <175802737238.1246375.11921455447379092868@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB4554:EE_
x-ms-office365-filtering-correlation-id: 2850ec1f-ee2f-4f98-a4be-08de178909c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ugIHyp83GXDd6ghe5Z7howdFMQIdQ0YHLXZrQIGoDWb3NIgDRF+s3uZar4?=
 =?iso-8859-1?Q?sNMIuhhk66fYANSkgSYw2v/YQJ9ohhak+RMxKJyxDbDfasXSHRRyww1ZUd?=
 =?iso-8859-1?Q?yMbaysHmrI0BiG/b28TWz3z8D110FofEI3i7Q4BDHluSe4X+DEvYZNwLzv?=
 =?iso-8859-1?Q?29fyHF+p6w2Oxe0Ufdu8S3y2PMgkkNSjaQjHkEdXq3N0I4CtfOXEP92NH/?=
 =?iso-8859-1?Q?4eXv9yoCutigqmLXEUIw8llKi30HAUNjE/SSOyPx+pZDY1pCts+QSTHnj5?=
 =?iso-8859-1?Q?BwGNrb0sjHIOU7tlKRAm1Y0bV0YfpHr+JTKxYjMnsB0MRg7Srt8mtCmEj0?=
 =?iso-8859-1?Q?g42ZhnbD+CJKjnsSdsLJ03jROHmNlEysXTIly6cnIh1Zgj9eo28lC9ameT?=
 =?iso-8859-1?Q?gXGgVGM1CUhIrvtfUPgjVdP664RTbvMcNbvZqHw+O1w0Ke/8TrmQmKQnxm?=
 =?iso-8859-1?Q?xWj/SYUxypYJRq5b5Xpg04gOH2Koo/Os2F5FUkqtWI4I/ZirwKcVaU874N?=
 =?iso-8859-1?Q?s1Um782AeOYjyALeuZSQ6u0V8W8SjFl1sp5j8GCExWp/3qWvSlC7bzUukG?=
 =?iso-8859-1?Q?xrPtPZ7le/23qWDwqHc6g6LzkBQ+x8ebrrbf1/uwEUIx8GXIgZcfoksA1k?=
 =?iso-8859-1?Q?5XWLvJdr2wf9QJEp6xp8OI6fzfeajc9zOvbddq0DvzaMzN/HMG+kLqtEsy?=
 =?iso-8859-1?Q?XKGh1e/CafC395Liq39kmbIqUmvj9ye/tRt1hMyaGF40OVy6qjITe0y3le?=
 =?iso-8859-1?Q?t1lggDijLckZsL5dyttlvhJnXhnCEuF/t34YROX1NcU14JGY4yeYq9i8Qk?=
 =?iso-8859-1?Q?HvQzRe7IS5XJPOO+3WGaeBKm8DFuR2Bd2tygiZP6wA/mLse0/o5V8R8voT?=
 =?iso-8859-1?Q?tjT4RzAv7GLbDEIAw4GGadFXz88AVYKhlDdYUL4yGk9dIs8bjnqYy2VWLV?=
 =?iso-8859-1?Q?JBvoDFayklzttUft7T0m6cN+EIoy7eiiCwIxBP9zTK/dXeFmvTc57qeGEj?=
 =?iso-8859-1?Q?9oJV0EK6e/QVWoVDmtguEKIDEFjBlyDKmItvyJzlq9juNwHkjWHbvr+S1k?=
 =?iso-8859-1?Q?XmdHB7hZ+0oiYAShbgQ8iWTM997NMZnw615CYS46QHgK3VaibSSlokgg4c?=
 =?iso-8859-1?Q?ZieD5Lt1rMxVhvPsYlqa+tehVvrrihi0bYvbEb6l7ie6etqnboYAZBj6fv?=
 =?iso-8859-1?Q?ccBs47BBRiOi2YOWzt+UgUZG4nXQfeR5cePPwdY40MWdjILUgX4sml66Zf?=
 =?iso-8859-1?Q?h2FQF40kg4UWJ6cP3jOTgbIXzXxDtd9qmsJO+PRQl/MswB1tIBB6QPaNrP?=
 =?iso-8859-1?Q?efORLHrLggXY0Ry/JNHUtoPvWKOo/kPaSrzj/u0KHVDmNL46sxtbN4FOmQ?=
 =?iso-8859-1?Q?dJikPto1TTXC35y2gKWFXcA5QLKnVqS0TrntAEaHDY+sk+ynChu3YmcZ3Q?=
 =?iso-8859-1?Q?BNat8HI9CVUZ+GmKAHmgCj70yrUQitR6cYinkz0/u/d1hvSuswbfFRDBsO?=
 =?iso-8859-1?Q?B39tZN184GQLilFPk0edY+cqvusoOuz6cPxofiumxqgHzfmjuSEqjWgc9B?=
 =?iso-8859-1?Q?Otb+XM2wsC1aC3VcRLJv9E4w98b0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?evgQ9GJgCbxcZv9UCAzshtmuT49Bch8maTLdtyWzb5/dfGHcP/6cBa+znh?=
 =?iso-8859-1?Q?tGhHBtjcNGx5OuOEu2EQOx5dPCstAIw4GEgYQM1CoM2YpAx74PXccvTeFd?=
 =?iso-8859-1?Q?TPlbQWOBTwQ29CZ5+VQmYaMNcJwoKFTFHD/2+01Ep4dGj1WIb348pJUyRC?=
 =?iso-8859-1?Q?wUnzcDJQcFGWKXr0ff6ezkelZ9iHJKjvJsHiXtksHdCJ6RLTKN8nnmP0uP?=
 =?iso-8859-1?Q?zOuJGFomrrJq7B0D7CjaJJhVYulalOtwb8GKx/UpHoebMOc+uXcfo5n4a4?=
 =?iso-8859-1?Q?jTR3VBoZpUr9nJlcqGh6a6RVL8qnhVJgLLH73B9aZzQW998NqT9Ds+PJJg?=
 =?iso-8859-1?Q?S9lBH60cfGTQXH0lxYkZZ6Ksu1EyimmXHdJmfhHfLG4Ii+I85R39zFjf8/?=
 =?iso-8859-1?Q?ZaEy0XWGsa+8atZ0/BZrrokJ87r2n8fDTG0yTiDx+CDWu8W8xMRVymCNiP?=
 =?iso-8859-1?Q?ByKiXZjCM0GQ/YOXOgG/Ah8nPaTOCarIufDbXiGsR37cQRKs4jNio4PbcT?=
 =?iso-8859-1?Q?1gACCyDVZEGZwPHc04XfkkGafvxEFOWdcdG/gPnIeQXAX+V3JiS++oTre+?=
 =?iso-8859-1?Q?7ox//LioY0KtplucEkACTqsFGqPRKVN6An/PPqD8Db5zprBX7J0GqEN0K2?=
 =?iso-8859-1?Q?UrXUVjRDzC/gwKrgRal/BLgz3zXjYtNmQMJZVwwCw6n9Sj0BpRbg+4dtgi?=
 =?iso-8859-1?Q?AakrbLvMzvPAkDj0xbsKf3+HRekJxh+ZVMWAcAixwyFlVlxPwefCHdNOOZ?=
 =?iso-8859-1?Q?wVSD9Yb2TqnJf3geR6NiAe2y5wClTM+AWcA4Rx0cWtg8BTXtvLQ1n17pWN?=
 =?iso-8859-1?Q?arDzw33TT6huYw0fake1C5I8YQDU8FISt3ycMWjR/0KJ+6yezw8LAxH0Ua?=
 =?iso-8859-1?Q?xRo6Q+vfRWGEksXp1YLiIkqQPDqVtMiYOlvGg3xvAPCxx0DHRfMS4oIbzg?=
 =?iso-8859-1?Q?ek/hQE717tOyTj9fFn6aRULiOzx96SujJX6bmVMY/DcSQMaGFlBqgWPiaO?=
 =?iso-8859-1?Q?in6vkarqVNujZEgXZh1gx9+1v1RySSn1aOB2E2qnrVvki8Gpn+mUdXIWCS?=
 =?iso-8859-1?Q?0HLjQlm22m0Ce+x5OusolFaZTDC6pE+6nWmKweErfxbYjqfBOqTKSzqEW2?=
 =?iso-8859-1?Q?X5O3snUOExZuzBrGHNxDNcof7pCdV72b5LgipwtU0FdosCIUpONFQ/DKLr?=
 =?iso-8859-1?Q?/82dUVE4+SSYvpO/6Qlb+ySNGRIQM4ccNWR9SGv1SCob1kQTivHbx0+A5j?=
 =?iso-8859-1?Q?E4sbCGeuKXYp5KCRCE5Qd3ZwUTpn9X+fRY7JLMd0coZzcgO3Jf+g/Aw3J+?=
 =?iso-8859-1?Q?6LMp8YuV+GsiYFPqg1L5+BM3UOqPxwx/5ngHKD5aicyn3RuUnELmpR1l2o?=
 =?iso-8859-1?Q?FVhGasXPHEzL3XMKvgy2Rwm/KY8748erOyBPcS6ZQEYGv6FIEsF+b9qiHM?=
 =?iso-8859-1?Q?3thMKaEKv+DfdERvGspBWpBkPm9nhl+KaQgH/zowsAx3ubJCZHEgPH7/Cl?=
 =?iso-8859-1?Q?6yl/rT9yfKzpOpsIT8jzkh+/W5fZnn35iBbySFcJiU5HQjh3UEpdF1Jig1?=
 =?iso-8859-1?Q?zropjWdoUqAAQQyuXKUTuAhaNZJv+MGqNO3BG9esVU1n/KHp2MH5q5xDpY?=
 =?iso-8859-1?Q?giJmQlLwWRR5K5iAsWbH/h+mb65Xp2iBdQmqoPrMVKAsGxxZhpKG0XQw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2850ec1f-ee2f-4f98-a4be-08de178909c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 07:50:47.4513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gjHE5TTWNpe0PxcOR1QYAcCA00V/4k67MBXLwBRVsMhaIYU4SRKUhlGzOaqikAyHvAxYbRNm/Qx5x07OmXILg6R2cuxal27eVdLKHZT/TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4554

Hi Laurent, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0=A0=0A=
> > Reject unsupported pixel formats in rkisp1_enum_framesizes() to =A0 =A0=
 =A0 =A0 =A0 =A0=A0=0A=
> > fix v4l2-compliance failure. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0=0A=
> > v4l2-compliance test failure: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0=0A=
> > fail: ../utils/v4l2-compliance/v4l2-test-formats.cpp(403): Accepted fra=
mesize for invalid format=0A=
> > test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0=0A=
> > Tested on: Debix i.MX8MP Model A =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> Tested here also on a debix board running v4l2-compliance before and =A0 =
=A0 =A0 =A0 =A0=0A=
> after. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0=0A=
Could you please pick this patch?=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
Tarang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=

