Return-Path: <linux-media+bounces-64531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZAOeDv9JKmojmAMAu9opvQ
	(envelope-from <linux-media+bounces-64531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:39:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4B66EB4F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b="XgOtEI/+";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64531-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64531-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A4133028EA5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 05:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227A426CE2D;
	Thu, 11 Jun 2026 05:35:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020086.outbound.protection.outlook.com [52.101.225.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FDBFC0A;
	Thu, 11 Jun 2026 05:35:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156136; cv=fail; b=CjdQbnYOt524dKMo7UyxKnX47lVbg1cRDik7k++eYbslCVnOPB7UszVbYbG4pzK/CZoQ03y55F9SBxTwmaaoNsNiooeYLGx+nXZGS6hBKqy27BOESrmT4qwLf/sNHvFQZdG8rSrWTr8c+weOHRruBwmlBJGUtZ/Ef4MopEu3XpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156136; c=relaxed/simple;
	bh=+iAV+L2CGtX38Zm19MZ8NAjsopaC1AEuhOFHfFnv1H4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0vpWsRO3I6QhmjK3xaUhmjPjjeZc9o6TlJcrHvUwgluN7OMdqq+8+58ALIShnZaE7789vdrlquXJeRdbnC5rcSgqDjCWWEHMBG4cBhNQBQDEkKHqKYz/LaKCqYAzY6MxeD/+pLUHN/piZZi7g6rPchahloOyd4L3D/Gsf42Ba0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=XgOtEI/+; arc=fail smtp.client-ip=52.101.225.86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9Ci0Ep/kL3d8gT6Dvj0lnR0Bn/i3eGz4elNk8ZuqorKwXspQVlC+tKSLLlRJS8yB3LDgEAnyc/Pdo2fFn7GnVakRraZnViiM2iRmVgKzJa+z87jrTfUEIi9kkuRlx4icdywLazn+kv4WAtmmJm6YnAEwAsO+3drJnykFx0goSiokXJiudH9mYLw6cTOLx5THib/kHg1UTNc6nSfqg+6PQWTJa+ms2SUHcgVSKuPJMor31F94us/ACtaWNkOjc8gZpF5OwnJVwvXqE95MV+24+zx/i+pA7d1GO4Th5D9WsabfJ+oi7ZtEoG/RPXE1Xh+nRBLDigsT7KJIGqJ83wuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np2lp61BvMmy3LCEFlD7Jv9+eoKanvbBpX4iEX9Iv8k=;
 b=W8XjHUPCup9qVf5R1jMhOdWDCRqlIjaIFiWkQV+EjTNNn/iaTRHSPs/v8wDgb1WjYMO5AFS4fG+oIPmg6pRCsydM42aan5ZUzWo2+EkpvAI+6FzmHGM+LQwOt8FfNIsqmC4xsyYT5uljhaGjKnYc3+bPNWFqAcCudWcg864rBdjwL//3dsRfEuZPrXUnAACEycvam+nXz4q7Mx5EBCzYL1xI0uI2uhaNY4fHGBhzCEZaDFeeib4gUo8Vsa44SBgAR5h3/wKD7lWHIv9Tv80bj01CIfl7aABbo1vUonGQSGcgB2fiOZF1hIuElbbkV4k9tScKjcMQS7O5LB2jA/Hf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np2lp61BvMmy3LCEFlD7Jv9+eoKanvbBpX4iEX9Iv8k=;
 b=XgOtEI/+Pvy/dxNDRXLOfNYrHtkXbDPK2pmgGlFdRrT43oI7R8TOK83O5qK8nu5QUO19Zwohca1JptECFDv6PtSmopoYvptYPUgrGeXYiGvzOMQWvBf7xN/RSTOD9fn4i5Wnv/2+5dMHE4vPFTMQKIEFv0GucUAc6G1Znft5090KuqHVJ0fOpmPdaCg9W8RE+SiZSbm4VkdGUvMqMnuab9lPvEN0n3jIIlzUkz4AsN5mAiI1cH/yChdovMnw8vdpZlr0rmaYHVLx6hMvgiQMgZiGFnPS0yRlNXGjgL6LSEtU0E1guLGcWZo2Fk6YUmpraL8IYqAxQdUlTYozynQIkQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0752.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 05:35:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 05:35:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, Damjan
 Georgievski <gdamjan@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc+A6In5hIz4KXM0+mNILJA2o3XbY3PnvdgAEeiACAAHkxlg==
Date: Thu, 11 Jun 2026 05:35:29 +0000
Message-ID:
 <PN3P287MB182990C9DDF3BFF5CB356EFF8B1B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-4-hpa@redhat.com>
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ainh3vUs_FWj4bLR@kekkonen.localdomain>
In-Reply-To: <ainh3vUs_FWj4bLR@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0752:EE_
x-ms-office365-filtering-correlation-id: 5dbbfdd6-a27e-448c-2353-08dec77b3f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 XmhzyQMjEQB+QUGGHxCyXK5sBSYxfmVnPxrMNv/BByM7V+14ojVLESuQR2Uci+G/70lcbaJvwDtC6KV+x+2bXPzkpwbDTQdKHn6htg8DOQWBwagQoOkfJkPEDcVG7QwKQMqchIrtJ0UUls1rbp7iO602GFHjh5c2R6cbo4AiKMHza/I6vOo+j7fTs+nU0OmzmERRxdW5y6kZOqj8OHX+O++2GUPeV3k+H7jK+OwLPCE9R0TfIcYdhcVLrLOD+WFmLMNTI9l2ETTIa6Iqb16F4ciYXglxjYMzYE5fMLeILeBEJU0fSSBXoQPtLjNE3iMtCOc+WKOc+5uE+83Cq2uMVjVehdt0MRf0dTSOZUBVU0klaljg/mcUaUT93khzov3KXEZ3aI7k/OV4wh31qF7CRtAe19g5CcHI47KNSR6youuBNOTRf/v8tiMblG3usDTzxfA4jugEUHlIa59Z9Mo9m4p1avm1YUTcfb/vBOTrSsRupU8oTlY5q6stk/x46+uSUNNL1dMNRahWMG74KNPVo+zs2IBXAOgWqU2gR6LiLxhoIgH+09qMfQNWxyCVucqYA1wTHqaWxlxCDxJc2sUApSzTZWRXGs5Fd1inGMp1mOxRYnhvwOibmKcC9w3CjyuWVo6cVLiRkUEQBB48Ff8rF/4qaJiMFxZx0Y1pF0mG9dtL0Rignr9ULFbeCEVANhFY5DsNocEjvKyUhPqJIrYqJZQWWKC9n5F0/Gs4e0Czk96rtqpYcZ7O7fBx5ntPRLpM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oXceG7wQjN7h+oHRDa176M7Gl6BE5qfaK2bBKM5RF3ZTGdu9T8zXHrthU6?=
 =?iso-8859-1?Q?gILACE+sr8BJNkA89z64iGj5xJeIQ+pdgEQUCkRsymiJbItpIh/v1Ss86w?=
 =?iso-8859-1?Q?P20GdIgtndgOJwu2NcJemgSWZpfyKol9+N5kQiEblV1DFEfUldQwWFhCmu?=
 =?iso-8859-1?Q?hja7XRjWtHAlrcudDwhmtFTLAk6Avw6PhzJVtQmmD2YL76EEnPkxw8buxI?=
 =?iso-8859-1?Q?803slLZBFQuSODsaZbIFAdEPkkft8eX+/zq4FjybnQAqb8qRlxAtqt9xtK?=
 =?iso-8859-1?Q?29WeBnbb5YY9TG45w8pQy0FOcv5SXT6ew0r80cCkXRRWQlV4D6Tq4k6BWe?=
 =?iso-8859-1?Q?mIH4UEKz4/PHOaD1bOHLDU7hqck4vPir2SV+swRSR+csIJI246CvqjrieR?=
 =?iso-8859-1?Q?PPRTeGppNvzMBWkxTnPZK0WSnDr6tiQQxnNWHzna8lGh4/PMFAt8s2QzB5?=
 =?iso-8859-1?Q?f3Qk3GwSrwHz70E0xaaBeWklwKLGk2aYtdEYQLUsZ1IhhhjzYmd2jT5KPI?=
 =?iso-8859-1?Q?sDYaO+abgfxpwgeGYIF2KFfUxzRNNXGhTavp1PrQfOJBMc9g7SC+mBLgaX?=
 =?iso-8859-1?Q?5cbqaXc2Rc/TPjrncwhdaoEWWPkic+oS8ycvp5TfxCh4oMGRTEfZRAkCDT?=
 =?iso-8859-1?Q?1jM2WHvLLUAqUu9bQFQIBpVy2fVY29HlWZRUNBv+AW8Y5jlOaVGqc9oC0N?=
 =?iso-8859-1?Q?XcR/uqBBdCyEg8LcQXim4DB2QaXZsOy0RJtNrr+/qFpg+5RSjqBvObNifi?=
 =?iso-8859-1?Q?dn5Z3uRjTaKjtlL1JzpLXqlfnFWgqig5mcI4eod9ZL3WuHv4Y/em/fE3ea?=
 =?iso-8859-1?Q?jQxU4feyl9N72tGi3SyMQn2BCgFuH1aCRlDeFnJi8WSz6+B4Uve5spkp2M?=
 =?iso-8859-1?Q?twKIXdXmsB/bZBlciHAIbDIijMBLl6NzU7w4d8zu7a6tV0DPErZRd3xRXv?=
 =?iso-8859-1?Q?3JpsnURqrYhb/lX5bNKCaHDl41fz9n8dHk1rEIWBjj95wF10532onLLO8W?=
 =?iso-8859-1?Q?OAZiC4rr6TVt6wMeAXrFKz3JKy28O4VygJisOoUPFjFJwZukjy5l2Isc9I?=
 =?iso-8859-1?Q?es+ZrUE12lTga6KWCOoD8MdfV8H4hbDhVxnYEcLQcadTykZwrq5ZzITzDd?=
 =?iso-8859-1?Q?azLgjjBWn9DEuJpfzMRabrfgJ75GlsQqZN6JkPh+lzaIkPlMqVwdvF0PXG?=
 =?iso-8859-1?Q?GWVfrEbAAf1qH6C5P+GzeG5gAOr4S5BnqpDH+0qfeEXE5UBtqPhDQvglRT?=
 =?iso-8859-1?Q?EQS2Q5xCo3uMcz5yG0FI9T9G7WwMvymkK8QtLc9s6+96vSbh8rTGURaAfv?=
 =?iso-8859-1?Q?f7jqL4B5/5TehtlFklZwVrIuAOV4MXnYwQJUknZ7Fn8YvcDVSlENS9UoQt?=
 =?iso-8859-1?Q?6BYpnvR7uCnrlmGh7B8LgBZEbmu+8VMa7rZfjYXQEFSNX/s8xpM6wxstkG?=
 =?iso-8859-1?Q?qkGvwjTpFJybXIahmxw4e8HpH173wOHxi1zn7al8oFsL1geWKdZNEmUd4t?=
 =?iso-8859-1?Q?dFUF+0anjWFX56kB0lCO2ajb/e7FiUohvFAPydJdOtkS6a69P//zXU//r0?=
 =?iso-8859-1?Q?LTsIW4gWQqULkFA6G7IgkCFmdh4YlvtgX01WknSc0iLWInwwLbo5ylkH4p?=
 =?iso-8859-1?Q?2s78NTY49Lqf0QRBzaY7FfExZtZuUJxz2o3w+CSrf3025TCIEsxru12Wey?=
 =?iso-8859-1?Q?SyTv4eFNYBjA6Us7UYxtlcHWgOonbvA8htGtdv1UFd8rJF3mtwMSxpBTBp?=
 =?iso-8859-1?Q?p33dU0tQlmYrls3OfH7UUwMBmVc1U6K6YszybATQ5Yb9OFVpdxTF0qVegP?=
 =?iso-8859-1?Q?R7tdppBVLQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbbfdd6-a27e-448c-2353-08dec77b3f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 05:35:29.3406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaKmVUncjaxubqfJv0YuV3wz7ET6ZC9alOFDVjDuLE7gad9A8tvcikw1G+PzyGyPQWweJdq7ZjpGo9fo0Afv8gEXI6Vd9EjbBGQbQrFewe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0752
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64531-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,oss.qualcomm.com,intel.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:dkim,siliconsignals.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1B4B66EB4F

Hi Sakari,=0A=
=0A=
> On Wed, Jun 10, 2026 at 07:11:39AM +0000, Tarang Raval wrote:=0A=
> > > +       /* V4L2 controls values will be applied only when power is al=
ready up */=0A=
> > > +       if (!pm_runtime_get_if_in_use(sensor->dev))=0A=
> >=0A=
> > Use pm_runtime_get_if_active() or update the comment. With pm_runtime_g=
et_if_in_use(),=0A=
> > the comment should say "applied only when the device is in use".=0A=
>=0A=
> Using pm_runtime_get_if_active() would allow more sparing I=B2C writes, w=
hich=0A=
> I understand the driver always does in enable_streams(). It's not a bug=
=0A=
> though.=0A=
=0A=
Yes, you are right. My concern is only about the comment, as it does not ac=
curately =0A=
describe the behavior when using pm_runtime_get_if_in_use(). That's why I s=
aid either=0A=
approach is fine, but if pm_runtime_get_if_in_use() is used, the comment sh=
ould be =0A=
updated accordingly.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

