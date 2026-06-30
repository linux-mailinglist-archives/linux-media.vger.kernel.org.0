Return-Path: <linux-media+bounces-66041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CQ2hGaZvQ2qcYQoAu9opvQ
	(envelope-from <linux-media+bounces-66041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:26:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD146E11F8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=UGHVDKSe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66041-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66041-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CC46302BBE8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6DB39A048;
	Tue, 30 Jun 2026 07:24:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021115.outbound.protection.outlook.com [40.107.57.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D64369A;
	Tue, 30 Jun 2026 07:24:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804248; cv=fail; b=Bd+C5pLhNK6k/9MvD65sAApOTj31KH0kejfPnv7xQRwTZyVoQyZKaELJPHVa5L+eu5SZ8v/LXquC/Ut39IBBk0yWm3jEDun0aGGoIuJZ+ggW2yfqjq4rDtSui8uCuQFO5HS+fsqQsjxtFDfx7wx+OnDzL9OtAW06OFreaD3FHfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804248; c=relaxed/simple;
	bh=yJOWvorouJU5bKluqsgUxtMnnLZ8U13IuVoz+bdvOkk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IQaAkwZbJZ4tpfyeXJFPdvsupdxbiYmOfCa0R+/oxx5Wo6Ly7uDT9CR9qePlwZwp0maG/ZtdMM2p7/LL/m6XPL6K+oRsamk72udLLbUfAmezuQ6qEfmOkKBtxXO1bfrh4+PAuRiwILS7Nay/zeDvcu35iKzlOJNvr7zEzOgzGbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UGHVDKSe reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.115
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL5352O1iKNjWUl2XwzcGB+xHWfhq0b3Jfh/qotCMqOiqTeo4bXB5nPd24hXhkXHhPQtowBV+vaiSBor74R5O6Zzk+qcSMk4r9t/OwAurd8/pU6rOfwiXQKcjIK6jNDreUqNlmEVYf82256ZmPYgTDAlTgiurAJ7085c+vGyPH/8Erd0BjzzEx6ynMqeOUzWBnT3V3KsLHg7M8G2+ZIWiuQO9gnWyGaN8LQ0t/QrzdPfX4RnTQ8Kj4U4kfSBxBzYqJEVQMEiKJAXwwkN6mqmZ/7y1PfZwNvwF2S9mIhsFqQFZ7axB3BXvayt2doS9igUYM9yMxpLJlcqOR84dHJWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9BQbcE++aEkvcun+AXyURubatTn0+gKxjRvYRKrRuE=;
 b=OY2VYx28tuvo/MBrJrUlTIbmfi5F1LS4x9T99IsmdNncqWIZIwOdeBaFQNkro3tkKSlvsMxjBf+LhM8a4lxysSPBXaPfFPgNYV+8edN4JKtSjwMpZEmwp9vM+KhEYyqEizfAu6lCVaQxZl+hpf0cAiMKByY3VqaXPMSUOWNpgSOhbU8vUjjrVrw9mf6SH4FOx2sLWvvcSjI4e0mJslx3bU9eAFKX8Le948ndiX3WlhJGRxwUGm6WTEA+Bg8Sx8fKflfAF4rooSDUFR5odUsJGZCugZLuBJOtegRWkZOyopvtlYFCpgMUYS57cz5Bfmhq3hj8r5NcI2g1tMgAk5/Xnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9BQbcE++aEkvcun+AXyURubatTn0+gKxjRvYRKrRuE=;
 b=UGHVDKSeasBx6KIGu/a9+/qffRSIQA7lQyMCIqtev/B5ZUvjpOUPy1pCv8gOi66EKgGrWftePAXZqs0K/m79t8YXNI+7wpgFvY/32i5x/1e5jqj1eAJlnCv120fg4aCwhSON0r977uBrIS/1dQbb2gt8+DflUryzbMgbXTU4aEDTOEWbvt6a42VAW5G9DK7RueuyH4vYBbMfO5AmUMgFpAUzC8p4t4ml7csyZqL4aYcYEWJ49FCNsIl9wz5HJZQY2Vn6SVGkL6+MW41N+c+3KbIpCUeUf/ZehZNu59E4K7rMVZiTS59vAnMQvjb5BJsbNODyi+OlfL/+Up5lqzsxnQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN6P287MB5027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:24:01 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 07:24:01 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/15] media: i2c: os05b10: add register definitions
 and use them in init table
Thread-Topic: [PATCH v2 03/15] media: i2c: os05b10: add register definitions
 and use them in init table
Thread-Index: AQHcvE0gKkGulHvpQkaGKd6vXxn3vbZWRBkAgAEEjTs=
Date: Tue, 30 Jun 2026 07:24:01 +0000
Message-ID:
 <PN3P287MB18299CF4A406BCE2C330E6318BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-4-tarang.raval@siliconsignals.io>
 <akKS61cHniBT0sky@mdjait-mobl>
In-Reply-To: <akKS61cHniBT0sky@mdjait-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN6P287MB5027:EE_
x-ms-office365-filtering-correlation-id: 739ae9e5-458f-47d5-c194-08ded6788f18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|22082099003|3023799007|56012099006|6133799003|4143699003|18002099003;
x-microsoft-antispam-message-info:
 RLFpsJEQ5oSfPd+4eSmjQ/4VGYXxOmF5Kd4IwC57JLQ0YeBhTUS+2yXGSVfFEYrFLiWWGHIfgbhJGfXuvll/4GL8ZkbjiQ+de1exDSLRNGrqg8X8exIUbhKulmVPZRAfzclIudhBb1SBVP6CEDf1jlu7kTLlbqzMHUN6NbrcQmd/0BAnvHcE0AEjgLP192xowZ4oWvbnk11HHqI33Xb285oYsq0oKiBLXyQTnCZIE5p4f22mR/qNQxM5AxLEkLaSVHD77fRqgHwLAU15emdu6Em5J2od3ldS4yfIT4O47N4xAqo/B6oxHu278kfjBqtKDCrdm6EUsuwsokaN0iBzQhZFibElqkSv7tyJv110jjDYR/QKaJXL/qK9gHArhtjJNiKtfbRi/7xbHNxTesisIx8SjgHx6yWxBD+nH3h7Yx8Wn+DNsuKlhlT4JtqJpniaGcRNteq4q2txPIq7jsYu0/jcuePmE5QVf4PyE2w7C5pxWspE+eDfGukD6ZcDL3WAd3tWfgZsiiSytAXnB3xYV0gsQncoFqAyTHMSzdZr1TvL9FkfczVYR2xPCa7+IuIVl68m2KxHq8fq1eAT4VzozlUHRYVMeBtv6qhytP4SYImxR8TUqdWhUfKfoDKnQRofQ+2LQOTqouNZ7yTKASnQEFtU5GKeLKNajGtbbUt04mXjYipjPdtR148YLYggVLgPHr7ep3oDnW5wl/ycI5TdkHSk+wKst0r4sjBWp0vz1YA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(22082099003)(3023799007)(56012099006)(6133799003)(4143699003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PfI0RWrS5HILnvzgdObJMSzwM+LSZZt2a97zv7Xy/k01pV8qoEwGynlS8t?=
 =?iso-8859-1?Q?8urUZ8OnXBr/i7iepL0DY8dxahrhpWk7Y1ozjo+0l7CzTAty4XMvD8019U?=
 =?iso-8859-1?Q?ZxvbLHZDAzZEfH5DxlekyLrG5JC6kvmnIVeYbtXrPUz6k5Kap3sb1Kopek?=
 =?iso-8859-1?Q?jlhAPVrc1TBHaeaPyfJjjrycdJtN8KDAk555fpELwGzfZo1oHVbwxkytXI?=
 =?iso-8859-1?Q?2arjTXGifHoKRsqiN2iTNNPuR59f0/N1d6tTkbq192v/MOpAfEq5uQQ0Xs?=
 =?iso-8859-1?Q?+HQ3uPqp184lCK7a4PB2Av6FDzID8mKEia6NQwdSGQgj4urx9PTSBDBM9a?=
 =?iso-8859-1?Q?NPnBd5qkCbJGHU/Y+NOengfSz63Wt1dfoLK3dRojq6RbDauZqxeOhAEVgy?=
 =?iso-8859-1?Q?KiuXI6NbaMbxkK90W7TYD19Pe9iP1dCNNIVIG0elgk1U/+72Pl0oasNcd/?=
 =?iso-8859-1?Q?1sEvcFPdlIrfGD8WUvX+ASx1rDbAuk37oFmsQ1u8bblryfNditQC+8wImy?=
 =?iso-8859-1?Q?dniqGS4X4iJjFCngvTDdeqDgr3tQwJ/yUXtPJI4rgKWOmTG1JtiZiQ8zc5?=
 =?iso-8859-1?Q?YxcZYVemsacoQULQbZ9PJCWHy28NNc9JS+Kx3DcRhr0buNimnaDbDGwiLi?=
 =?iso-8859-1?Q?LQL0mQuHkMpD9LIIkGQcutd6pwK8S4tjEsQBHD3YVAAWZyi6HEnSsiTxTc?=
 =?iso-8859-1?Q?snpOKh+aA7ckN8n1CfOMk7LOmGuT2WeYMR3l/funy9kux1i3SxIPkdeRgt?=
 =?iso-8859-1?Q?cxTOQrKIvIf4kEtAkX9H4A+khQ+eNi4Mk4/vjnw1hkyYp+V/NuA0zMOTVo?=
 =?iso-8859-1?Q?jfQnRAXmDzeiU8diHGxK513uhzNf6XyUEZFwh2zaN5g+/BHN9Z3/u6p34E?=
 =?iso-8859-1?Q?0pbxwZvRu9RyW5NZX81YYxKuQNbiX72iSn90CGQ/qUB2lBkSy0L3SN/Ny/?=
 =?iso-8859-1?Q?nHH0CSbW0Rf9N+M7uSoBzVAwNwHvGLdbPiSYCTE1xZXnhfO5/9L+iX4JAv?=
 =?iso-8859-1?Q?0bGqGTtCMvUkN/NTKaIrZY2ZA5fSzu7S0ZdrkmR+Qhqoq42ud9KC9DHMaS?=
 =?iso-8859-1?Q?Ba5xgeUECoFtlvOms05KrJKb0ZS8JQcLEuoIKjOnNgjgLMVwCulu1yDp/U?=
 =?iso-8859-1?Q?zxe5+8izij41y9e+37Y6BfYNMenenvTYDrg+uAItHNQmve6IV4Eqw1HuzL?=
 =?iso-8859-1?Q?R2EWTddk4G8S6+Hvn5H1ikyGa1EFo3RUd3ij0c9MVvF2TQXgw4f8T2wgBe?=
 =?iso-8859-1?Q?/JbXtX1bYj3jyPVFA/lfEytAMMWyuIxuGMhhEVk23GaW2T4s0pu9ksYEOo?=
 =?iso-8859-1?Q?xb+dk/sBX8QNniu70sDul/uGX2oQNPENF9FvcGSA0rLnhk+08YjEtWcDba?=
 =?iso-8859-1?Q?lzyQ7efhyMfDwTT+GcCEcNeYD3Bs48TCCrsPupSLmdGLS8ZbZIO8zouVV/?=
 =?iso-8859-1?Q?UXPVSRcHhWqqVHhUX2YMIQdgSrstN6TMOnQHCPxK+vXvGxNYLoCdZj6v5q?=
 =?iso-8859-1?Q?ePGaUIF+/gahxZw5Z+ZJBD416Jy5O0DHHtFkmOdaikxisycMBIz5hS4RUc?=
 =?iso-8859-1?Q?mxa972ciI8CSJ8mylC5au8ylTF5x3EmorzHdmc36kmW6tZCtEKKqnGcu7G?=
 =?iso-8859-1?Q?h2m/M/sSRqd756dSn29DN/MKpajV2gG3/Ec0Rcp++UXduiY4JH36SziirM?=
 =?iso-8859-1?Q?ajpYjDt8/noHJAq22rdut2rfxsnVwkISmSQMBPRyi8ObCT5PJAn1Gy1qjl?=
 =?iso-8859-1?Q?UyW0uub1rf7VsjipbJXf8/KZ1nZVyEAKNjle1TxQaKRI3D6WLUhPW3AhlZ?=
 =?iso-8859-1?Q?v885u4CVDA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 739ae9e5-458f-47d5-c194-08ded6788f18
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 07:24:01.8286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JqEK4Na3HHUU+o5mcR0y0ByLnBvoq0OJnooJFDb4AEveot4wmCDmDjUxIoq9gzXMAvlh7SkM8uDxzHY6VIDvPJJqUmE46TTaD9qRcN3Ax8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66041-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mehdi.djait@linux.intel.com,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAD146E11F8

Hi, Mehdi.=0A=
=0A=
> On Wed, Mar 25, 2026 at 05:13:49PM +0530, Tarang Raval wrote:=0A=
> > Define named register macros for OS05B10 and replace raw register=0A=
> > addresses in the common initialization array with the new definitions.=
=0A=
> > This improves readability and maintainability without changing=0A=
> > functionality.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 111 +++++++++++++++++++++++-------------=
=0A=
> >  1 file changed, 71 insertions(+), 40 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 62fb856cbdea..751494fdba6d 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -38,6 +38,20 @@=0A=
> >  #define OS05B10_MODE_STANDBY         0x00=0A=
> >  #define OS05B10_MODE_STREAMING               0x01=0A=
> >=0A=
> > +#define OS05B10_REG_PLL_CTRL_01              CCI_REG8(0x0301)=0A=
> > +#define OS05B10_REG_PLL_CTRL_03              CCI_REG8(0x0303)=0A=
> > +#define OS05B10_REG_PLL_CTRL_05              CCI_REG8(0x0305)=0A=
> > +#define OS05B10_REG_PLL_CTRL_06              CCI_REG8(0x0306)=0A=
> > +#define OS05B10_REG_PLL_CTRL_25              CCI_REG8(0x0325)=0A=
> > +=0A=
> > +#define OS05B10_REG_MIPI_SC_CTRL     CCI_REG8(0x3016)=0A=
> > +#define OS05B10_4_LANE_MODE          0x72=0A=
> > +#define OS05B10_2_LANE_MODE          0x32=0A=
> > +=0A=
> > +#define OS05B10_REG_MIPI_SC_CTRL_1   CCI_REG8(0x3022)=0A=
> > +#define OS05B10_10BIT_MODE           0x01=0A=
> > +#define OS05B10_12BIT_MODE           0x61=0A=
> > +=0A=
> >  #define OS05B10_REG_EXPOSURE         CCI_REG24(0x3500)=0A=
> >  #define OS05B10_EXPOSURE_MIN         2=0A=
> >  #define OS05B10_EXPOSURE_STEP                1=0A=
> > @@ -49,11 +63,42 @@=0A=
> >  #define OS05B10_ANALOG_GAIN_STEP     1=0A=
> >  #define OS05B10_ANALOG_GAIN_DEFAULT  0x80=0A=
> >=0A=
> > +#define OS05B10_REG_DIGITAL_GAIN     CCI_REG16(0x350a)=0A=
> > +#define OS05B10_DIGITAL_GAIN_MIN     0x400=0A=
> > +#define OS05B10_DIGITAL_GAIN_MAX     0x3fff=0A=
> > +#define OS05B10_DIGITAL_GAIN_STEP    16=0A=
> > +#define OS05B10_DIGITAL_GAIN_DEFAULT 0x400=0A=
> > +=0A=
> > +#define OS05B10_REG_ANALOG_GAIN_SHORT        CCI_REG16(0x350c)=0A=
> > +#define OS05B10_REG_DIGITAL_GAIN_SHORT       CCI_REG16(0x350e)=0A=
> > +#define OS05B10_REG_EXPOSURE_SHORT   CCI_REG24(0x3510)=0A=
> > +=0A=
> > +#define OS05B10_REG_X_ADDR_START     CCI_REG16(0x3800)=0A=
> > +#define OS05B10_REG_Y_ADDR_START     CCI_REG16(0x3802)=0A=
> > +#define OS05B10_REG_X_ADDR_END               CCI_REG16(0x3804)=0A=
> > +#define OS05B10_REG_Y_ADDR_END               CCI_REG16(0x3806)=0A=
> > +#define OS05B10_REG_X_OUTPUT_SIZE    CCI_REG16(0x3808)=0A=
> > +#define OS05B10_REG_Y_OUTPUT_SIZE    CCI_REG16(0x380a)=0A=
> > +=0A=
> >  #define OS05B10_REG_HTS                      CCI_REG16(0x380c)=0A=
> >=0A=
> >  #define OS05B10_REG_VTS                      CCI_REG16(0x380e)=0A=
> >  #define OS05B10_VTS_MAX                      0x7fff=0A=
> >=0A=
> > +#define OS05B10_REG_ISP_X_WIN                CCI_REG16(0x3810)=0A=
> > +#define OS05B10_REG_ISP_Y_WIN                CCI_REG16(0x3812)=0A=
> > +#define OS05B10_REG_X_INC_ODD                CCI_REG8(0x3814)=0A=
> > +#define OS05B10_REG_X_INC_EVEN               CCI_REG8(0x3815)=0A=
> > +#define OS05B10_REG_Y_INC_ODD                CCI_REG8(0x3816)=0A=
> > +#define OS05B10_REG_Y_INC_EVEN               CCI_REG8(0x3817)=0A=
> > +=0A=
> > +#define OS05B10_REG_FORMAT1          CCI_REG8(0x3820)=0A=
> > +#define OS05B10_MIRROR                       BIT(3)=0A=
> > +#define OS05B10_FLIP                 GENMASK(5, 4)=0A=
> > +=0A=
> > +#define OS05B10_REG_FORMAT2          CCI_REG8(0x3821)=0A=
> > +#define OS05B10_HDR_ENABLE           0x04=0A=
>=0A=
> Is this BIT(2) ? The define is also not used.=0A=
=0A=
You are right. It could be written as BIT(2), but since it's currently=0A=
unused, I will remove it in the next revision.=0A=
=0A=
> > +=0A=
> >  #define OS05B10_LINK_FREQ_600MHZ     (600 * HZ_PER_MHZ)=0A=
> >=0A=
> >  static const struct v4l2_rect os05b10_native_area =3D {=0A=
> > @@ -77,30 +122,25 @@ static const char * const os05b10_supply_name[] =
=3D {=0A=
> >  };=0A=
> >=0A=
> >  static const struct cci_reg_sequence os05b10_common_regs[] =3D {=0A=
> > -     { CCI_REG8(0x0301), 0x44 },=0A=
> > -     { CCI_REG8(0x0303), 0x02 },=0A=
> > -     { CCI_REG8(0x0305), 0x32 },=0A=
> > -     { CCI_REG8(0x0306), 0x00 },=0A=
> > -     { CCI_REG8(0x0325), 0x3b },=0A=
> > +     { OS05B10_REG_PLL_CTRL_01, 0x44 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_03, 0x02 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_05, 0x32 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_06, 0x00 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_25, 0x3b },=0A=
> >       { CCI_REG8(0x3002), 0x21 },=0A=
> > -     { CCI_REG8(0x3016), 0x72 },=0A=
> > +     { OS05B10_REG_MIPI_SC_CTRL, 0x72 },=0A=
> >       { CCI_REG8(0x301e), 0xb4 },=0A=
> >       { CCI_REG8(0x301f), 0xd0 },=0A=
> >       { CCI_REG8(0x3021), 0x03 },=0A=
> > -     { CCI_REG8(0x3022), 0x01 },=0A=
> > +     { OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },=0A=
> >       { CCI_REG8(0x3107), 0xa1 },=0A=
> >       { CCI_REG8(0x3108), 0x7d },=0A=
> >       { CCI_REG8(0x3109), 0xfc },=0A=
> >       { CCI_REG8(0x3503), 0x88 },=0A=
> > -     { CCI_REG8(0x350a), 0x04 },=0A=
> > -     { CCI_REG8(0x350b), 0x00 },=0A=
> > -     { CCI_REG8(0x350c), 0x00 },=0A=
> > -     { CCI_REG8(0x350d), 0x80 },=0A=
> > -     { CCI_REG8(0x350e), 0x04 },=0A=
> > -     { CCI_REG8(0x350f), 0x00 },=0A=
> > -     { CCI_REG8(0x3510), 0x00 },=0A=
> > -     { CCI_REG8(0x3511), 0x00 },=0A=
> > -     { CCI_REG8(0x3512), 0x20 },=0A=
> > +     { OS05B10_REG_DIGITAL_GAIN, 0x0400 },=0A=
>=0A=
> Are you setting the register to OS05B10_REG_DIGITAL_GAIN_DEFAULT ? It is=
=0A=
> defined above=0A=
=0A=
In patch 4/15, this entry will be removed.=0A=
=0A=
However, you are right. For consistency, I will use=0A=
OS05B10_REG_DIGITAL_GAIN_DEFAULT here.=0A=
=0A=
Best Regards,=0A=
Tarang=

