Return-Path: <linux-media+bounces-65325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g42oCLrPOGrMiQcAu9opvQ
	(envelope-from <linux-media+bounces-65325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:01:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F76ACDBC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:01:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=HXAoO5up;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65325-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65325-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC03A30210EE
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 06:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E263346A0;
	Mon, 22 Jun 2026 06:01:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020133.outbound.protection.outlook.com [52.101.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F6357A4A
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 06:01:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108066; cv=fail; b=YLQ6QvkzR2OgBWXGB90SychKu1XSSDsjIF+Jrm7LWA2nnr+3ZhTrdiTsJsitSV+cRtidwW1rslzv5Hm9apqxIbdgwmhSiIVkwN57tedwMGkHcMmL0DabcC+W+ODGDy5gXAWIyWqydfKmbBm1+GYsdgq1ZJiAc3S2OTR38djGZ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108066; c=relaxed/simple;
	bh=h/ddbg7+wMOwm7w7VSAedw69bEyfk74S7WAnkXMYnE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s52JuQzYzAFI3JQvVCOkOtvX2AvadNfOhaH2cqWFkebNUhNuQzfBBs9wtoHXdiNbIStWUCaGhxUEW6jU5DqX6/60jG5im3Lr3BA334nY3+9uinDOi9SRtPlhVUtm4bLc7AkWvTdzB11NlDb5PzXOFQeTwaEYRfK27Xb9ubW9Huk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=HXAoO5up reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.133
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMXxi5rTwSD43X+K7OqyYT3xIpz9KcJccuU+f5eS1NDFUKmlKKg8Mn+MRjEGzS3hAjq8hFwEtsP5376cYBB3kXJJ5qrIBSHVnZgBrgOm9O/GQ74VvRc/nphOE+/hBz9iyEMy3E8/QMxB7jza27ilv8jG/WPYjsPaFy9tHexgJNYceff6D4JW1dfCHZiZPp+qKFtczoGYBXr4alzq7+4jvUwkbD+PKqGuI7vo824INSVjKOjkOk8peEi1jUsz/EB5DeDxoGwDXdOc8OyrbYrecxKSoQz4VYKgPK81jJ7YV24HWLpmc56C/TlqOsf8OZl1vrr6dPvQ9gBrYhHyDaziKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/ddbg7+wMOwm7w7VSAedw69bEyfk74S7WAnkXMYnE8=;
 b=pbI6l8mIl4V2LktBxe8YQZniFdNAAQvpwjqLHiVJRMrmyyRs7/0MPvoEJ2BJK9huIqDZmlqd+GAROnN/vSwtVMEcrcDtuxX88S25WK+AUiF3RsBkPyGL2Di3dX2wcI2RYbL56YwMjA+PVL9qacwEHMSOd7DfI8OYsoC7P3NypunYmQXg+7bOBs0JFRiAVSX/8xL37wL7TBlIHqecKPqvC26H4WomvyZOK16rur4ULBkq7SAU/soVWkrNgFRfjnT/RNeTbyEdi+kB+eiuZJPb0qLzzbRBYS+5KmkPdx2/iH9qmv7v3IOyQydburX+z41CzQqW9DkZCOxFZmunsne+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/ddbg7+wMOwm7w7VSAedw69bEyfk74S7WAnkXMYnE8=;
 b=HXAoO5up9NCUh5viEmdGOhTHczBW/ZWduXJtagkOBLGve7tVrJ/YvhX2/8wayvysd6Kx+aife9aZ/Jg3Qqjra19R1JdFG/TADejKXPDeaWMCczigjvNLhZvduwSNn6m0y6mb4EbVZ1skz9iA/rvB4ixta9VvChTfoEdLnXG5y5/4y8+LomXovhVtgLpKAvgx3BsjDBmvNecPpe4l4I67B8ApihcMpQfpPTulR8io/i+NRMrgcA5aVGuZ27THfLqJUCpwPI3CbFMFhQtAuqsu7gd+aCfco1dxY+KWcnGye69lDE33S0DCLQy+xUlvB/PcnlDmtEP26fzZpKUcVIpK/Q==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1274.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 06:00:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 06:00:59 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vz@kernel.org>, Hans de Goede <hansg@kernel.org>
CC: Bryan O'Donoghue <bod@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match
 ov02c chips only
Thread-Topic: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match
 ov02c chips only
Thread-Index: AQHdAY5w2pGAG08H0kyHx4ZdDc+fmLZKCciI
Date: Mon, 22 Jun 2026 06:00:59 +0000
Message-ID:
 <PN3P287MB1829F2FE439615B4A4CBE6138BEF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260621145808.2660219-1-vz@kernel.org>
In-Reply-To: <20260621145808.2660219-1-vz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1274:EE_
x-ms-office365-filtering-correlation-id: feb82056-d870-4378-8d23-08ded023a1f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 5RJhnhLhWFroARUvDv4Py452CoJL89ihrAtFbc1AiEEpG9VO3I8f1d5lsJmSlgIGDKPb8sFhn/RFCVZ7m4QPY7AzT16t7fOD6I4UYnKyp6TTnTxj8oLz7C6HfEvVy4Udva9T0fET08dTushenMq065PhIa/XmLJlYoJsU2vqGDvcQuis4PgzTq0e9pCltVaOdzOjQSems7iRtrfCSawoxA7y1eHoZROU0px/y1GRXjvyPhclwLrwrESa43MwgbSP0Fyx5j6kB+PM2zWWWjdmPe3OPiyq7bJjHm/5bHP3czehkZOlFmuFSsydieaZ4QBPrgejojhx3hVhbQc/J45vrfbnF5AF9zWvjC7zU42KQTLbr3kUQ/l7F1tZTeoXdNE8HfRriblkX053XF5ienxGkbkzupZvdN+UqcMzNqAv17Y6ynC+m3QSvTHKqARADB+zRW9IieNLzkNWA7ed+KlYm3wTKETm/kE60yztdnhdX0PA8TC4D2sWgO3D522EFE9s1Thjv4ag5Vj0AdakrQYQjSE4ScXynT4tz7Z2IWk/1WjZBIFD9fwfwEWcqTUtTk7cvxoI73xRIHLYibmGOVudIrDSmZINx9f3D54FS3bVkS9LhyFj6LfbgSsoV96tgyrpQ+ynSQvF7LWWKFuzo9bi5EMPYZGIqZGBjoqhSvOAPKkpnHmx3Wzjn0PRpxDFoCILRmmxZhv1ICxAGRhbExTgIhJGGb+5kxozmHZUiY1ipeM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B7sdm4imHekTMmOiwfZbPQhPxsMSplYWIX7/RAX9Qb1GirtS8Z9dCPP75v?=
 =?iso-8859-1?Q?fv6Jd2DMCx5ATeOadwd8FnRkvJYz4L01iHqdQXY2IsXUJoimlm21ig1L6C?=
 =?iso-8859-1?Q?GK8nn1P4vxWP1bL1xLdeMHxOxHHe94ash4Vg263p3zZDw71E0NN/3YT7hS?=
 =?iso-8859-1?Q?0OZGfdApnRdyzIjJR+V2gVQFBqoX7Pa1PXu3T85cr7Ty9z5ZCnA3825w/6?=
 =?iso-8859-1?Q?/CepMuYbi0VdmcBWNZVOlBnFIasympSn6jr+JrSbdhdv8C/VqDcTSX35Yx?=
 =?iso-8859-1?Q?zM8CJcXzC1Mp6HR6qjSwLGIBYSvVQZcQJy47Qh/isistFl3neMSS2VKUng?=
 =?iso-8859-1?Q?HSgmAxbGuwdKudBSCoQj+enD04CffVXEKWzgty3F28CzpEiPgUxRw6zc+Z?=
 =?iso-8859-1?Q?zH4aT2UvoNM+tP5HuH/YR/Tm3W68zv6mofz+G+5BVsNLC8ILAIuIkSl9kC?=
 =?iso-8859-1?Q?SBpJxjhQnitZU3HXa99KvYclB+aReM+kae/HX5KXXX3X2+djpSyeyx7+8y?=
 =?iso-8859-1?Q?bKDXtZ6KEyc1SA4wgPosBf1HYDFwBXToeT0TOCIBjNTbYH5Nb1/7I7zXrc?=
 =?iso-8859-1?Q?1RaU0RgJ+g2pUnwYy8vU2cw+GyD6WkKfJxhIUOkH9W8EHGTN4dRBG/WEX9?=
 =?iso-8859-1?Q?Rj+lvQxbPE8E2GabyRNTJeNKs/fTdrFr4lS2mdbdBMayy+M8kwuR9oMoah?=
 =?iso-8859-1?Q?8GPNah6piOkeOEg+a4wvETXcAcDBPwMxYdxrSiK6NnxB1+HYyxHe8ALQK8?=
 =?iso-8859-1?Q?9t3AgqXqFceL/X7NYLwZ1EHFsR/fysEIO5GjcZjdTHrxhmUhla4PIWOnC5?=
 =?iso-8859-1?Q?/Q+LH4GcBC9qF9BAqac1wn72EWem3k6M3yrIYoYKLslCb+tKNNjg7hdYMi?=
 =?iso-8859-1?Q?XUDYDoEKBIdCcEE+7tIhBuAp/kwBz2AcNDbc0LAxAVgcYiyA+9iRFJyoqX?=
 =?iso-8859-1?Q?qTkA31VbT7ZQMqbSDYeFXWJ0rISnPrzeJgCQIRyY7pWfqlemZ5Hq+xNWbo?=
 =?iso-8859-1?Q?ogjAiYp6uJovwXHMn7mR0v6TBdWRavN4ZP1ywfB9+3UI989HzStUxDgrg6?=
 =?iso-8859-1?Q?9yQVpNHt0ReopHZ0iOR8lxxVNOLV37e5c6x/XPXSKWtXUUuTNQaRf5qP+M?=
 =?iso-8859-1?Q?uAAQDB4UXyechzkkd0y1PxT9fqtSSmnd6dUtBLfLtqQ2C9BTIf/Yk6thog?=
 =?iso-8859-1?Q?X1Fy2qMffC5TNOj9UN33wyaz3WglAX7PwOvua+Yq1bFwNQFN4crcA4kt52?=
 =?iso-8859-1?Q?cH5AzqsvAfe9UmNMdSB1tOxSAOwd0x0FTD8Sd2NQEtR2GB12Izk5SRjw+f?=
 =?iso-8859-1?Q?bCXVlSc5aWdzYj8SSBO7yLWTGGrGYonu7cg7ZhC9XmuysyOI9f/C1GMoY2?=
 =?iso-8859-1?Q?SY4JGVgOoqyZf4f77qiq9k/zQ2VZQah1gJ4GC4f4JaPxHZijjenpYAKy1R?=
 =?iso-8859-1?Q?GTFx90dRY10AcClDaJwQ7mSzaVGkq8TQ+EGXw3Pz0qbam7iyo+j9+qC0x0?=
 =?iso-8859-1?Q?jNf10qKRCsfR2p2LxNRCYO8WMn3t3ts14m38WyEHjYapxURRs9+BwUtMNm?=
 =?iso-8859-1?Q?NMbnbLDZU1UL8/tNLMcPXIzr1T9/t87uY9GXnIxXJtcx8N1mB4iDeyuTru?=
 =?iso-8859-1?Q?e3QwNWltTKY9R62DJYxqZoeqQdQM2CCvxjQgSJq+DdyF15uIWIbg5tAmQu?=
 =?iso-8859-1?Q?QEzJs6WD2jc/csTyF4iEqQQ7piynEEMaCda1bi7JoVcxHxGmczm+prQdU9?=
 =?iso-8859-1?Q?qI3kGYanNBnUOK7eehyEhT/nZx3o/zvKCsqza+CGXh6L36CpOtW52jjOJb?=
 =?iso-8859-1?Q?mqCsEJQHnw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: feb82056-d870-4378-8d23-08ded023a1f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 06:00:59.2176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NMTh4M1piDYhk9h/Qv8OFsO1dAlVHnWKj/rKXC4Ybdx/374uBhot4XutKzDK4KhXeKZWfdlJnIlsLFct7SmjCHzNegSGKk+ePau7zOP12AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1274
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65325-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vz@kernel.org,m:hansg@kernel.org,m:bod@kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A1F76ACDBC

Hi Vladimir,=0A=
=0A=
> Originally a chip id check in the driver's probe function is done for=0A=
> any OmniVision "ov02" sensors, but is too wide, since there are at least=
=0A=
> "ov02a", "ov02b", "ov02c", "ov02e", "ov02g", "ov02k" and likely even=0A=
> more families of sensors with similar names, thus the check for id shall=
=0A=
> be more specific and match "ov02c" exclusively and expectedly.=0A=
>=0A=
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>=0A=
> ---=0A=
> =A0drivers/media/i2c/ov02c10.c | 4 ++--=0A=
> =A01 file changed, 2 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c=0A=
> index cf93d36032e1..b36da75d7dfa 100644=0A=
> --- a/drivers/media/i2c/ov02c10.c=0A=
> +++ b/drivers/media/i2c/ov02c10.c=0A=
> @@ -18,8 +18,8 @@=0A=
> =A0#define OV02C10_MCLK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 19200000=0A=
> =A0#define OV02C10_RGB_DEPTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 10=0A=
>=0A=
> -#define OV02C10_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0=
x300a)=0A=
> -#define OV02C10_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x5602=0A=
> +#define OV02C10_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0=
x300a)=0A=
> +#define OV02C10_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x560243=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

