Return-Path: <linux-media+bounces-65602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbBHBNyHPGqHpAgAu9opvQ
	(envelope-from <linux-media+bounces-65602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 03:43:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B66C2348
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 03:43:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=aUUjzkes;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65602-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65602-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3241B303954F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 01:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F686376BEF;
	Thu, 25 Jun 2026 01:43:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021080.outbound.protection.outlook.com [40.107.42.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF53E34BA33;
	Thu, 25 Jun 2026 01:43:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351824; cv=fail; b=JzFGNa8RRucHQO51ouPV2LmZplNLh8GwQZuNcfcppt1FSwTx00fdJlibmv/AVnJbkBCXkcCIdRW+hoEOiU3a8XSRYNwL0LYT/iZl+QHtXlUXuoHM3zZF/1Co76DYacSTFg5zBP8S6rumPnW8C0gXEoTHXPMNak1Lei9EwbV6uN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351824; c=relaxed/simple;
	bh=4kvCcgjn3Jmeq5LERxOHGVN8cqBQ+zThteU13fXdXnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DnBsRFTNJnY9r4fGpsusA6hpb5IAlFTph7qb1MZQbLEYz5/ebpDq6WJLFPUH2jMXYXwYMZoSxmmGLH3qKCmYPXjS0mVCX7gp5v4VfdHMpUu/Wv4LXNaNh+cWqhaMEZGOELaQX32nqU6iC7iummKD1TA/vRC1MZ3wRYtnld/4+Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aUUjzkes; arc=fail smtp.client-ip=40.107.42.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKAjpvEiglohjWLMljAPEdSwF2yILHkxVTsrpnAVhGURbb7oL7ybQbHvxSYjZXlLs4KljO1KLPn3RaLopKIdkNFU11hT76sif6vM9MQZ3pgTAEN0c17fhsoGB4AOz50kWoSHVLELmKV7Uu7N5Q16vmmpDnhF0Q7coYz7LgPvp4uvZWIbGfbjdYkzn5VO4cRSYWh//yJjwDczbbYhK8hZbMULEmsQ6Stx1HuwWuIVbj0igtpfi4/hPQ3DG91kdA/cVUhC/4exZvBcBLfcIAx0HlqgFepKYy5WFZGSUI4g7t7ov5azikJMNrmxuJr/sGLdGMBf4u3rAjIBXxBaHKMdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++vfa1m2CCWUGOrm6a6F1tn4rrnISyc/JsmLk5fdvN8=;
 b=pHZe00KkyuVl79JyH4RDpRpyQxlbe4Cn1SCKClU0NdPhcd6wfDVhC0cwuFZZUj+olPS7H18Cp/+Gc1Wx10fZcUz15FBf2iX8RLLAD2uONiSAeDrFQ2TfnCIyIX9dpZaucGz/HImFGgxmljx39N1AIsL2TylvTI7VMXRw33/YqHV9nRL3z6X6AZLZOta6jtIh6snjM1GDwvvlCcgQxB9fiSHRR6pwHcevtx3DiUoyp8iZpt2tl0MjGZuG78uj/GwEcoCWQHp9eyPcmCw774V2MMv1ykSmwdoSzzG4qlQnwUe19fHAGE3MsjhUZzipgI9LkVpd9+UP+apglUDXKNsJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++vfa1m2CCWUGOrm6a6F1tn4rrnISyc/JsmLk5fdvN8=;
 b=aUUjzkesRgjfaF5sd6RZuQFvgWC+AUqtyj647hlzDMr2L4+HGoD0IZQ9cgcvylczBspuOCEBKCpt58KdId5GW1Uoctjt0r5xVLkidAFKQJ5/18eoUcZtp43D98Bv5ofYfA8Ut+aKUT29ypM9NKZ2Unn78mqA1z+rGYnsrTzDRWI=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB890387.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 01:43:34 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 01:43:34 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Conor Dooley <conor@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHdA6oA4dFGLrgtZ0GgpOtEiXsOgLZN6VwAgACMHsA=
Date: Thu, 25 Jun 2026 01:43:33 +0000
Message-ID:
 <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
 <20260624-junkyard-sensuous-fcd43189b593@spud>
In-Reply-To: <20260624-junkyard-sensuous-fcd43189b593@spud>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE2P216MB890387:EE_
x-ms-office365-filtering-correlation-id: 37fba83e-655c-4de1-601b-08ded25b2b11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|4143699003|38070700021|56012099006|6133799003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 NKQElDii+5fkvdNXET6Ul/Dr2RfS0qkrKIffQ7zJGKYZWF8QZ0Tty0Oz6E+4qiSqL7mhDwQSg2tiiGBE1kS9BMq5pdmdufyLHJ0v0vSDYVo49PYzClpYbY9ZwkEKLBAFtZni+8UmR8Z2sST6DvbGv3J7eBp1FH2XB+iKYFuLbivxyHQKxEAaYF2sFmaw0N2+FMl3918OuSAIVgfkV3v2xEh3LTcWiJ2b5riGheKboenW88ZqZyrfcSvAb3F0Dw3uuvrnV0GNUWJtXbG5XFhWCBzPe0N3muwKdTdiJnO112H0TGRisYwe8WUtWuupzGqwv9Ug+WspYOwAwgCd+GCIK6mDOvGzpy8HbPIOthgzLNt0Mmq5im5V0mdlvw1ZuptqosOkz7fG9DvMXaNcrzXLgCX8+gjq48AfOCFf/1/7eUhCFhx5+S+Xv7xcmLsMFuGHrBjy6ua3ULb5CSrrkbmHa554812mYTbLEYkzkgcKLqYNZfe31LdphOB7OfNwu4tiLurkU07bzeBNNzHhtqUzHRQnlBhN8yY53F5LFw0uhfbqyXnkrfReAYHWgZaB1hkjHWhKZvVbqvXky5fikq4CVS05VI7XL0dnvWv1X6QS26NixW4tud7JJ3WBLxrrcYDthv+gdWVbgDhdI4d5I+SWbWGi4ARn6Sp1zAeLQ1eePPQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(4143699003)(38070700021)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ujeVo3umjiN7mfkK52BYiuxrPBrFTYxisJU19T/6vIBBIUgeGcZw2CxeniX/?=
 =?us-ascii?Q?MTkP6I5HOUuf4eloJX7vzXMY2Slko5TWe57kDopT9WKKow2f1IwL1CdRLkmy?=
 =?us-ascii?Q?0pe49oLviTE8UXRJyOyaUS0HDlzRdiDv7D2HcKu4OyFKAtqODyg3V5J4mSzO?=
 =?us-ascii?Q?N0D5V09dboJSoQZ1Ecl4GYGUCFFakXtWuj0yTe/FEUFARwYswNikp/b3MITt?=
 =?us-ascii?Q?HyiVJbtLdSNMSjD+rEH0KBVYTAB0zk49SRcYsoj8uTy0KUUQqWxQEjIemKdk?=
 =?us-ascii?Q?PT1ybknjG5AjAvp/+8mBNSIgeniOfMBgUNAMHVQCQREIHoL12pINiw5ZqiiP?=
 =?us-ascii?Q?eDxCfeoJbksv/SkSUU7use9QgGjQyOQUezMOu53lxLWtq9Q3vv+FrHf4KyVA?=
 =?us-ascii?Q?I+0M0gHEAgBWLFXSRDOi261thYZDo/gqtijanjHLFjtgx07DqITHkYa7E7gP?=
 =?us-ascii?Q?xiQFqf0lhBy2w1V7FLaCJtIG07zVUpnkOiCF7jhR8esRFI8n2nAbSv3X3NrS?=
 =?us-ascii?Q?FFIMdk5YD8zt61ip8RF58trUjqoPrkVI+hxJ8ldU+n1QN1PHKnCuPNp2dBxX?=
 =?us-ascii?Q?a9aZ2k/7bz/BQlXN3qKoJdyEB9GlXLa/M4KsqpvC1SsBtLOLwuR7Vjwb5NsJ?=
 =?us-ascii?Q?Tt+nunjrkS2SK231ylqddfr1v2DPoL8ExmA/csHyU6bvidK6DcSj8h0v3h5J?=
 =?us-ascii?Q?b6JSgbYcpFpOO/vydlWbm2D6snlWh1Jq+/6j2yK6U2OLEFs6DMs/84pbCcTT?=
 =?us-ascii?Q?mK/PVJsHB0Ob2mhe/7lWevNpyYkNsqVARaJbL5JjHrh8WGD/e+lyo7j2mI8L?=
 =?us-ascii?Q?lSdCK1vScU6ndlxw7pgB3dr0vbp3A7u/G82myxAneNVD5zwFq7OJdIXW2q+P?=
 =?us-ascii?Q?wb2oojEsv3TIjFUfNwGlCRwVDIVkEzYWx3wOL/DIXDZp+nUe2L9bs8PIsDVh?=
 =?us-ascii?Q?7WYxNsZ0hjW2B/W4Y9BrzPZ3VK70fM8XgGACj+WR7DgSkZTBFesb5/zvmbRW?=
 =?us-ascii?Q?GEpqBDuEL/pHLzG7NRRpovHo9frx/amwN8w0lAtLmqQgwmCQ8Pwu7WK5yPXW?=
 =?us-ascii?Q?TkTQwYae8yKW6/Kwz0FlvaY7d+msvPNKaXKDlCBbMFvX2Bl4yr2HsmnTa00o?=
 =?us-ascii?Q?lYrRA5N8KEuDbgF6V1fAZh2r9aKmztrw9y+F1B6A2RTPP97v2tx8575lO5Uh?=
 =?us-ascii?Q?rRRp8R/D7sH8NdBGKxHD/odR8NXJLUEH6AdkKH6RJNyKSnicy2OZopoWJxVL?=
 =?us-ascii?Q?b+n+5kHG/Dfq7nYHikMw/YwfPawZRgy10rMOtiCjIeG7ljTU+cwON4u/yXQk?=
 =?us-ascii?Q?0PuC76pxKY9Ozv9nMVG6LBjUvA65SV2W/3Xm7fPFBeFjN7rBgTxrY8JhyItv?=
 =?us-ascii?Q?7mS0jXW9dRD0cY4dGBwL8V34kf/5B0mGs45RghOiEEM+YxqS7jnN7sVcIxfl?=
 =?us-ascii?Q?w5WKkVKmTB6JxH91CrNarQsRVHpWbQeVznR7qXXsSGlEYeMllCQ1QRgfrIyk?=
 =?us-ascii?Q?JkkVctOOC1BlZa4PPjzcr7kuHeJCyO+6lB/oEjT2GWoVL49K9zdPO+BHpyz+?=
 =?us-ascii?Q?W5ZjLC03g3gcDV9vLKjPsYmiPWiFym4wGs0LWAOou+eK9Y36MpRsWLtQZP56?=
 =?us-ascii?Q?O5ELLEdK1jPrcdEu2FBdkj0ZuRDPjVqrsJTzse9dgYDHAHJVzEY22ikXbp9q?=
 =?us-ascii?Q?txAU0vGxhh6OSSka5Fv+ZHX0A6LPZKv6+FvbolZ8jRoaWf3aFqnZc/TG4IzT?=
 =?us-ascii?Q?zOhz48q53g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fba83e-655c-4de1-601b-08ded25b2b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 01:43:33.9556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlGqkFGeuK2Tp9/PJZwnOQtBDtMdYQE79fZr+S10l1qmPTJWSt6XNK8p3QXJHyCoXDPeOMeI5QE17yTEGQQWCgiXwQoxnH/TaKrYmAWKR00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB890387
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65602-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,pengutronix.de,vger.kernel.org,nxp.com,lists.infradead.org,chipsnmedia.com,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 744B66C2348

Hi, Conor.

>-----Original Message-----
>From: Conor Dooley <conor@kernel.org>
>Sent: Thursday, June 25, 2026 1:42 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org
>Subject: Re: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On Wed, Jun 24, 2026 at 04:20:36PM +0900, Nas Chung wrote:
>> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs=
.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine. The control regio=
n
>> manages shared resources such as firmware memory, while each interface
>> region has its own MMIO range and interrupt.
>>
>> The control region and each interface region are distinct DMA requesters
>> and can be associated with separate IOMMU stream IDs. Represent the
>> control region as the parent node and the interface register regions as
>> child nodes to describe these resources.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../bindings/media/nxp,imx95-vpu.yaml         | 163 ++++++++++++++++++
>>  MAINTAINERS                                   |   7 +
>>  2 files changed, 170 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-
>vpu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>> new file mode 100644
>> index 000000000000..9a5ca53e15a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>> @@ -0,0 +1,163 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoC=
s
>> +
>> +maintainers:
>> +  - Nas Chung <nas.chung@chipsnmedia.com>
>> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
>> +
>> +description:
>> +  The Chips&Media Wave6 codec IP is a multi-standard video
>encoder/decoder.
>> +  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register
>region and
>> +  four interface register regions for a shared video processing engine.
>> +  The parent node describes the control region, which has its own MMIO
>range and
>> +  manages shared resources such as firmware memory. The child nodes
>describe the
>> +  interface register regions. Each interface region has its own MMIO
>range and
>> +  interrupt.
>> +  The control region and the interface regions are distinct DMA
>requesters.
>> +  The control region and each interface region can be associated with
>separate
>> +  IOMMU stream IDs, allowing DMA isolation between them.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,imx95-vpu
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: VPU core clock
>> +      - description: VPU associated block clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: vpublk
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Main VPU power domain
>> +      - description: Performance power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vpu
>> +      - const: perf
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to the SRAM node used to store reference data, reducing D=
MA
>> +      memory bandwidth.
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  "#cooling-cells":
>> +    const: 2
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^interface@[0-9a-f]+$":
>
>I have to wonder if this interface business is required at all.
>Why can this not go into the parent, with each region fetchable via
>reg-names, interrupt-names and iommu-names?

Thanks for your feedback.

I did try the flat model, but the blocker is the IOMMU.

The control region and four interface regions are independent DMA requester=
s
with distinct stream IDs, and each interface can be assigned to a different=
 VM,
driving the video core with its own isolated memory.

If all stream IDs are listed under the parent's iommus, they bind to a
single device and share one domain, so the isolation is lost.
This is the main reason I added the interface nodes.

Thanks.
Nas.

>
>Cheers,
>Conor.
>
>> +    type: object
>> +    description:
>> +      An interface register region within the Chips&Media Wave6 codec I=
P.
>> +      Each region has its own MMIO range and interrupt and can be
>associated
>> +      with a separate IOMMU stream ID for DMA isolation.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      iommus:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - reg
>> +      - interrupts
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - memory-region
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>> +
>> +    soc {
>> +      #address-cells =3D <2>;
>> +      #size-cells =3D <2>;
>> +
>> +      video-codec@4c4c0000 {
>> +        compatible =3D "nxp,imx95-vpu";
>> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>> +        clocks =3D <&scmi_clk 115>,
>> +                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "core", "vpublk";
>> +        power-domains =3D <&scmi_devpd 21>,
>> +                        <&scmi_perf 10>;
>> +        power-domain-names =3D "vpu", "perf";
>> +        memory-region =3D <&vpu_boot>;
>> +        sram =3D <&sram1>;
>> +        iommus =3D <&smmu 0x32>;
>> +        #cooling-cells =3D <2>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +        ranges;
>> +
>> +        interface@4c480000 {
>> +          reg =3D <0x0 0x4c480000 0x0 0x10000>;
>> +          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>> +          iommus =3D <&smmu 0x33>;
>> +        };
>> +
>> +        interface@4c490000 {
>> +          reg =3D <0x0 0x4c490000 0x0 0x10000>;
>> +          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +          iommus =3D <&smmu 0x34>;
>> +        };
>> +
>> +        interface@4c4a0000 {
>> +          reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
>> +          interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>> +          iommus =3D <&smmu 0x35>;
>> +        };
>> +
>> +        interface@4c4b0000 {
>> +          reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
>> +          interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>> +          iommus =3D <&smmu 0x36>;
>> +        };
>> +      };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index efbf808063e5..77ea3a1a966b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28688,6 +28688,13 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>>  F:	drivers/media/platform/chips-media/wave5/
>>
>> +WAVE6 VPU CODEC DRIVER
>> +M:	Nas Chung <nas.chung@chipsnmedia.com>
>> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>> +
>>  WHISKEYCOVE PMIC GPIO DRIVER
>>  M:	Kuppuswamy Sathyanarayanan
><sathyanarayanan.kuppuswamy@linux.intel.com>
>>  L:	linux-gpio@vger.kernel.org
>> --
>> 2.31.1
>>

