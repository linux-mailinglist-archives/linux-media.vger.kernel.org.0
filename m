Return-Path: <linux-media+bounces-66152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fFOYEFSiRGr/yAoAu9opvQ
	(envelope-from <linux-media+bounces-66152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 07:15:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052A6E9CB0
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 07:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=QctOYKzT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66152-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66152-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0EFD303BE88
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 05:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D121938F957;
	Wed,  1 Jul 2026 05:14:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022086.outbound.protection.outlook.com [40.107.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21C3655E5;
	Wed,  1 Jul 2026 05:14:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782882887; cv=fail; b=F0nd6+2x8fHdd0rq+Wxq40xA4KGha8ioDr1jxPlsllC2wY6ZrxP6z6+zJ1o896y/qYtF9bKIbKDS/Zemyf008hO4Qnz435lI4q99gmLC6f+Qa5yQJ6xwKwY+M4/LN9aEPx0+3uOagPgga2QAQAfpJ/1Bx+WSJLHUkEsHBGNlCeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782882887; c=relaxed/simple;
	bh=A0bVP5KTEI15Uv1AXmkinjR02Y0AqHqyNzVsnAmP1S0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eCB8zv6dVJZgpiNsMJ3sTng7ShubEDsqwADrhe9v+rmcj6/YOYQ+w85k8E1pWMCdcLuExK5VDIM6/AcsjoTxC94IgnfkyFdx3CkjCjsDOUBAGXx8T4jub9Se3D4b2e3XrRTbfRH54r39UIRkPYqjJ59oSSSll4t+cn0OCbo+J3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QctOYKzT; arc=fail smtp.client-ip=40.107.43.86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGRrjkjJpyK+DN6+0lezfLeiihH55ytqxCDkBkdgLUlH7GFs8+9bhF5Kc0XG4qTeAgCFy6/fh5k4c+cS3QUxKce6l16SUx6dmoItAAhzcgJQoOChATqetyhs8Rq/XExlAa1Sl23o4XCQXre4W20rv6hsqngZQaUhSoIReF1PYWBZKov/K98I8RFd/DM0Jc/Q+N9jlks3SXyqL0z36r2EhKm3ih7Q080hf1HvtU//kuD86MqZFCPlW7yUmNWNHRnfg8Oap1guWR2XigHKTzRePTonOroubkfKZo/pD++oFaL21pBaMJ+TlUzgeJ404JvWg892lGqDPv+uiluN1cbiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG/AeT59YYxMomMzUJJnXjhlORehsdJS+Eexq17Pk04=;
 b=Eyr0RBOrZ8I4ctDAzhuo/W8UADdrejIt96LrBIVIynR/FWxEfF9OFknGUGnw7524D0nIPBcCpr+NUkECK5AJGlODvnI3ytYpEjJp/kZRrHXMy28MJ61y8hhIrHsTVKLAUMWr/DSSIdXdc8LVWf+gUNoex3fQc75bI5P85tgs1mTTtPzg1hsXnpJXCxWgUcD8Rn0XRjMsKzsGI7EOEGyESOrhqhGbgRdwsgWYd0ZqS1e594POoLAhSmeLdw1RpaGw1pUdql8qrNcCfgab+iF4U+uZh3I1Eg7JqYdBOeveFUvCUe2oMNfatmALlqn697ROwtQtByjWjYwUvEMzveqjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG/AeT59YYxMomMzUJJnXjhlORehsdJS+Eexq17Pk04=;
 b=QctOYKzTb7e/wNaL8A3oD2MVO8ezVAl2HIpqzJgkWQgF3gCWbK7uig+4p7xJf//WQ9miUTDXw2fCi2T2QNn+G9y1XF2EcPzEqLYStzn9iybokSXQOAIWl27K1OsJEiBz3Fa7pvZa9D9AJeLQu2TlFo9p6HyGsTBaJSto768v4EM=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB3107.KORP216.PROD.OUTLOOK.COM (2603:1096:101:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 05:14:40 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 05:14:40 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Rob Herring <robh@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
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
Thread-Index: AQHdA6oA4dFGLrgtZ0GgpOtEiXsOgLZXT3mAgADVOqA=
Date: Wed, 1 Jul 2026 05:14:39 +0000
Message-ID:
 <SL2P216MB2441F1A181D06D6BC09E18FCFBF62@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
 <20260630161335.GA3699737-robh@kernel.org>
In-Reply-To: <20260630161335.GA3699737-robh@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SEWP216MB3107:EE_
x-ms-office365-filtering-correlation-id: f3111610-580b-47d4-1f3a-08ded72fa6f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|3023799007|6133799003|4143699003|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6yCX15fLMLq8VX90wB8aUbRRuNvx5KFYTwS+79ePLdzIQ126cwrlrT/tfKEMMyauFmrM1+NfBD82Yn2YZQTQQzzecaERQt8q2Px+YNXOm0oh+zsGmlADOVw8VKAE7MexDyvND0M5TEoYXCsfVj0h/seHBSX75nUEWVb8eZNCRcSyumB8sQbgmZ+EP6qYSQxPiR3BgWsGiTuatCVfP4lL7bd7c5vNLwVIHt3Wl8yM/H759CCxy+gXhr9DiTDPEla2/1T69F0c6d9JfI1y8oSiqFRnq+LJePO0aiVROWYG/B5RY6MPJcgxELjlRFhcYrC271+t4PAz17vOQuOAwkOv8WKiPxm4XHXzfFGUKftdnbn9M32NR3HKMlAwHyoa9WyQgOycE8GE0gSAxskTz6CmOrOeC+ozQR+Qm86x0CxWvXwpJPFrHDI8RyIGWQQFUbUMp7xRMJNAvn/aAhvoFGHArEXFFhGze/fly0lg5jwH+UJZINF5YTQvyl5y+e73EejZAnOo+BUvzSl97XWTWhwNRnYKXTgfx36ZQGttSxNTsrwUofW/UV9EabLtkPqC8ndNWYdzo+VMQpHm2nFbLjwkGrSYV5hT41IgiWRH1nYneOpiOyGnyf0w5cOcv0swZnV3t5GHaWuwFJYlQofp9JQIxkiwvs/VLm6MIbyf++AtjDc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(3023799007)(6133799003)(4143699003)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W2tZCva9xcCpBAVv1p9jf6vu7UxmUNFjAFx+4xT2BocdwLFHSRx9n+zWM+f/?=
 =?us-ascii?Q?/ugmYNbgNMemc4qJFPOfdRe/8T57eYdGMW53N/avI83nVGHXK8aiuoujzkrU?=
 =?us-ascii?Q?29immxGIOV1ERwKE96X+Kbn9WMq8t7igGKyFq+fYQCzgaFCsmUn0nDgXfY26?=
 =?us-ascii?Q?iHuwIUPXbtt3U7IF9dYRfeVcIMf0iWUHWB+m7e5Il7iTaSsYX+4X1bk7Cinz?=
 =?us-ascii?Q?huMLnASPp9dEiM2hjOwiEKRdX4rR46lJoWMA7NAjcmOMu4XxjXA+10KZUWFO?=
 =?us-ascii?Q?vRkfVz2EZZ/FJsCsSVOBypfl83kEb7S9JeEbttMHpGBc5G2NOkAMvtvYo/tI?=
 =?us-ascii?Q?qrRQ2oWl2gIIpwMzmQNKptk527WzXy1eDeZNCFS6rGmUQHnzcJgIfDW25MBI?=
 =?us-ascii?Q?nCyk5UppyGiURuJht1sQvc5CI6JBmSuRccdrhztYwP5DIODwRgzfY9CZGbkt?=
 =?us-ascii?Q?5NS4qLdimIBpz3ljmBXNEOS6BsVbNHnDaX59t573LwdK9pSgstqNAjlDT0HM?=
 =?us-ascii?Q?WhUS1hrlqFGMBvRaVCJxurE/66sxjFyanWR67Rh0glgYVAzNaBBdd4OS71Ls?=
 =?us-ascii?Q?r5+es8AJ/hmT8nZ3mQIyXP8ZXxJXGfUGxVX1uEOWPbReEd8OYt8tdpCfmu/T?=
 =?us-ascii?Q?GDOEix7hrqHbe/CG1jejBZ/wmFQmg0ObkXpowofTFM3DY2VoRxKUCKXZRDhL?=
 =?us-ascii?Q?bz0KQdaoxYV1meS9uBPdjUpOwnpU1a6VxWgqsDQ1rfzMkiySCoPUG/outiXZ?=
 =?us-ascii?Q?Gj3DPUfZFHvpF1Im/AOM7yk06n5KIRwyqcgOIzDgEa2KZwGLuL+LTkXaxqq6?=
 =?us-ascii?Q?ZzjDFZgC9it8Rj9F5xA/D9rH6ZUsKS3pKEIG/2V6FMA3kBxGome7BTzcckzu?=
 =?us-ascii?Q?Dl2R7diac3PQvhk7Z2kmpq2IyGzaNN6E+JQ4n9Yl/XcznBWtBf1qcgpGWcgq?=
 =?us-ascii?Q?pMrAC5tWZyIwWp8M6R3W0OdPHtk0gkidr0+jtTCHrUbK6RMjObWnMuRcNYci?=
 =?us-ascii?Q?UYtTBX1/1lSmfDnJrQPpyMWGYwZRz3lYMT9UmuXikl/+fOSAK1bToSRKtbP5?=
 =?us-ascii?Q?EglzkKxqwSJbYXInmK1CrCtiXKB8Iu7ah29sb/1JAXiR4zgOOGBXEWWbvbU9?=
 =?us-ascii?Q?068NeS3pkb81sg6xNhyVkTbQP1VnO14a7882xD1xYbrcb2Z8moIMYR9VVsxk?=
 =?us-ascii?Q?0OkeZPImR0vs5i+GYBBA63qrj6jW4LXEAbpboo3j8kpskEnf2KgYD6mnh2KM?=
 =?us-ascii?Q?jUMwA+RM9WD75dPdQ/Kpgyihl0bKrZhOqihbPS2zG8Op9YnicTX4621HPVkl?=
 =?us-ascii?Q?FUnjDVYn/HNdytH6AzQCUfB6kK3mhyxfmUg+2TbbHm34fpGHWPs+maPEiQcg?=
 =?us-ascii?Q?PkX2NYxz/zBu/hbHyHaAGvyPKzy4/idXnTObvr5H8vmoDfK/6GZyDYTvDlbt?=
 =?us-ascii?Q?XVbJysmjYLcG3JUVdgOQX3iFWcGOrizrOFAoZGiB2i5BAdu2qFL0LvCycWjw?=
 =?us-ascii?Q?390o+yFk5xmqxIq3ZKj+pUJUrS0D8EJ5fhJJG54ERtyZMVpI00PUdZcTGdYh?=
 =?us-ascii?Q?KHiCx8JRSdRFQTfu7Nh2rrZuhRhDsYi2HcTGTO0lE80p7s0DF4lQHifNKFYT?=
 =?us-ascii?Q?09A3ebHhH9r/LLcQXIuLUWcjWWX6MYchinocMNwkNwziRHWMHIG6esSrOHVC?=
 =?us-ascii?Q?CHLhVfTamebjejGF9DyiK7+Gzf8/XTvLvn3vG9j6pEXJMFBM9uAwBGe1J8AI?=
 =?us-ascii?Q?SCn6Ja8QVQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3111610-580b-47d4-1f3a-08ded72fa6f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 05:14:39.7034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uYj/QMBJQ+OPjgxb0nY/YmQUjYYheKVhkZXSdRtfghEnVl3U2GIE6MSmpOFXkb0aXw9xXFARjEPL6ZoU8feA5SuuWpNY5HyzBDS6cSzb3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66152-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6052A6E9CB0

Hi, Rob.

>-----Original Message-----
>From: Rob Herring <robh@kernel.org>
>Sent: Wednesday, July 1, 2026 1:14 AM
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
>
>Already has a type. You just need to define how many phandles (maxItems: 1=
).

Thanks for your feedback.

I see sram-consumer.yaml provides the type now.
I'll address this in v7.

>
>> +    description:
>> +      phandle to the SRAM node used to store reference data, reducing D=
MA
>> +      memory bandwidth.
>
>Drop 'phandle to the SRAM node'

Okay.

Thanks.
Nas.

>
>Rob

