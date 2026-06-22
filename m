Return-Path: <linux-media+bounces-65393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxnbGfR1OWpptgcAu9opvQ
	(envelope-from <linux-media+bounces-65393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:50:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E74086B1989
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wkHN5Nav;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65393-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65393-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A650E303ADC1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2930834252B;
	Mon, 22 Jun 2026 17:48:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D233A70A;
	Mon, 22 Jun 2026 17:48:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150503; cv=fail; b=TFSMsB3U8Y4Z6D9U3X83OFEU50uXNPFhhsfljnh0ezxPtq7OEHZD0JKKT/qeMgZ+jH+Y12CkPreroSCr8JysPfiiFYKZDfMDwHYW2yLrMmO8KJ4r6iWhX9DMEGv/3wgvR+ClKTkrEEobW95n7YMP/MnpIQSdzz0Yhdx2JL5JRHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150503; c=relaxed/simple;
	bh=SjfJKbbJBCYTam4N00pnx5pZOphB5O1V1vFvMzOgKR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HaK73J8thh9+jQ2wFUbIhtleyc4MFecMZAzgStK7yvAIPwwax+dGGgHVbcAA7G1rMMqPidtr9CWKNOfWD+2gHm4/YGhQebDG9NWEvkm2NhV8zDemG8DPE/Sxoip6l842JytWawt/gGGy27Ynju6y8J2em3PEr5YkH0dbbivCHKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wkHN5Nav; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyk0IjJOAtzxpdvDkuc0wdN6VkpLR7UOH03b+gltgA6eviuWxLVf96Bj+76hm0yLE/sfcyQyhI8xPC0+/fG+T7SCAmdBq87JDmyg0x2nBvH05hmxj8TL30wIenPinpz5/vAaPAD1nWG73S+tlOcS+wUSHIb6qd8dbQ70MYFlMRg4y7sJQeCevQLqI9LWIKbpQL/9P5K81tmMKW2XRYQKhIIdQmLzDep8Xn0iD+7BxTq/vQqks2Pz7yo7+Z0FzIPYH3bx7aV7G0RenDdreqts1pTktWbg3AVqmtUB4GL5cw8tnVvYciB69l5lS4XxXei4oWvtFtUpbh4/r1JmII4Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Xgr7nBIz3FevNTfOOafH6TfTyPJKaVoPvcGngyX/Q=;
 b=x2olo1mKX4VPb8M0sOt+npAviJwzwmSxG3bErDC2f2b5SlNTSaopezwtvOcjJzYSvpgPqhnNs3io9NMd7pFvyAR9Yo4Z/K9+GkJEDFUhmDYrvBUaFVyACWlTvMNmenKT4pWqrmuATrvL6WE6rUagsWlAVCl5pc09Ga+oHHtIcC2qt1K55jdlwo3MUYuJUTqGDbc6O2TSiv/WCH4r69XP+ov2yTqall4/f3uqU9W6/LZzsG/jJNDQ0RGP11Y6Smti6pWNgD2/s1/trXxxzGWeLwbSpd3qw7ZP2snUdzeY5mYWVuDLE2s+elYaGcy9oclNOeXs1g+dlMzNYNv/f74NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Xgr7nBIz3FevNTfOOafH6TfTyPJKaVoPvcGngyX/Q=;
 b=wkHN5NavSe6ABWzSLpw+92b19tOijskYItmqDDLLR+KMSIyd4ZiwDSs1aHKcKo6YYbv8PL9bFU+3VRig28jhGPBplaS6uhjkF/pbvoZtw+M1MCG/OleFk6eXACh/7GL1HDqH0kU5M0iYr16cgY/PTYPWyiKPK1+L4iec2exiwCc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13057.jpnprd01.prod.outlook.com (2603:1096:405:1de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 17:48:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 17:48:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biren Pandya <birenpandya@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: jacopo.mondi <jacopo.mondi@ideasonboard.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>,
	"kieran.bingham+renesas@ideasonboard.com"
	<kieran.bingham+renesas@ideasonboard.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
Thread-Topic: [PATCH v3 0/4] media: renesas: Fix missing
 media_entity_cleanup()
Thread-Index: AQHdAm1Ra6qrLrR3UUiJBf+8bwkVjLZK2XXw
Date: Mon, 22 Jun 2026 17:48:18 +0000
Message-ID:
 <TY3PR01MB11346C45BB533DB88E29EC21F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622173334.60491-6-birenpandya@gmail.com>
In-Reply-To: <20260622173334.60491-6-birenpandya@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13057:EE_
x-ms-office365-filtering-correlation-id: 6a743601-81cd-443f-27e3-08ded08671bb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 dDlf5jR5SrNDIGZPtKFpdX0mHaq/SAMcEv+3qiCqNFvDhSXOpIhhzf6Y0gsWInc/np/ZydE11f4liIdUHhO97SPi76iNJ0suPEV+4LeOThVI/UYCyhFgEevQsPs6KNuqLFGliHOOcxec6V2UfniYUNRK6Yisefm2i/xk/cxTslBiOh5HUTH4R0+piNk8eVLPRw1s+51qWrj58B+XN2OwwhIrUcAN76JD6snViAadPW0vaVFmPXsMzPQKOnDK2mJcWCUKEBp55jXIzg34Fo3PV63nw1lIC8Z4EHqpYxEfmd4W5DNKicvf4/agpdP5uvRw1r3+RRODjk/gQbDFByLcen1+/JnwDAAmSeQdFQoYfiOJukQsLQyMtDkQS4Q7N+bPLYZwWJCi9rYLLC8PKrwJTMoKtLIoRbVsKjierdn8brZH8tGC7FPEQ+BLYdSplVS6l3NWHbhi5+rR9YPHWWOXtXhgDAv2SfLa4QKlW9+AIcR3MI0Vs22TkZClCRf7/PQH1o4wwwanC6b7SFJO+70yLusMfMDgEgnpXmqMIDROcJ5V/iXyepouQmQHo9ZaN6Pkit6tB7CUQ4xopJEClsY0DZu59c3bWocplUII1R3N7irbZTybYuuG/1xDQuFDGCG9T1vDlhDuzOafV1hIJ7LA38L+57LfbsDsii5fRBeQ042W8HsG6lgawjRCVRdpNfke7mF6bPZeHdVZFXAKiXtKBLR6zh0kfQgECneP4EIFMug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OfxLYCo+MNw5IhgkILZrF7NgPrLJpNGxiUSDGPuLISk/LMtFtkL8i9OE5RZG?=
 =?us-ascii?Q?EckxCRFfINQPZbwrX7uN9G/MCIBdIqNOnZfomkixmI19iHgBfCR21M1IFgw6?=
 =?us-ascii?Q?i0Fn8eas+HmZW9OS97u9AsxfRliPULsgIr4BsCj8OEMQL+NEe2klV5VFTBpA?=
 =?us-ascii?Q?JPgSffqhHNwHfw8z45EFOcKsEhODxASAjLqZJ+4RMC+BqNe2qq0UTk6+eH2X?=
 =?us-ascii?Q?/ZWVVdlm+k8sjhEcnftXKs6meglTdWmGxbwZGrzIyhAZnRk91dqlu1xZ8Asq?=
 =?us-ascii?Q?nkfDr+3MtCA+s9bYHxkTa0K/G2+74MZKZLO2bwDlQO7WwcZ5eKKvUdSE6fZw?=
 =?us-ascii?Q?8OLateLO5joEArcfdNEjSZVaHB4ABWsvL5fwBIAnr4bc4BfcQNfE+xaAKG85?=
 =?us-ascii?Q?iAnayG30y+/z6WH7atDe3ZMI4u8q6zHRZ7RltmSsjZj2zk+ECj6BFKfWCQEw?=
 =?us-ascii?Q?3yI74S4Q3LU5dEUSoyr+aAIhrsyCJNRzWNmQ3h1PQeTraS+i2dDv4HU2HIhg?=
 =?us-ascii?Q?LX1nug3JMaQsd8EvCQK3asJRmP0ENpKRhAZVgWDCNhuPI61PhTP+44giDHGz?=
 =?us-ascii?Q?rB0zOm650FftEv8WZAWr/aIwgkhnZ42/QXqg+od6uNNTnSw/jBKCA5dUBH9r?=
 =?us-ascii?Q?byYSIoQ59H339ttJpZ/He3rGT2vZ5oClRsm4mvygLIniRsnRSnL6AJnzKpjj?=
 =?us-ascii?Q?PSocDZko3Tm+gx9VDBLdxuGSDKMn4xuGVi8AfzNGYodw6syFA0CpZii/cxUx?=
 =?us-ascii?Q?mrooWcjWzL/nBxe/N7Od2AuaJwptrbwqWEXCqBLPUT07JO2myPdvJU3X/lLa?=
 =?us-ascii?Q?HFxy/dMEnncMLOtzooVfYNZJtmqz1pQNB2jsM2RQdHt9t8g5ohxd6Ub7jN3B?=
 =?us-ascii?Q?giYDbTFCXKgIGzIs5cKgU8BwcJGYkiPCaPg7za4xglqkupe8c61+gV8bK9a6?=
 =?us-ascii?Q?9k4/kh5CRBhJSkkoQ4q8dkaoxT1c3HxXtJ6HH7Hb8VmocN5NQ9XS77aJQ62B?=
 =?us-ascii?Q?Or//xvrflwSQLyu5sdj4cpG+8w1GC1PId82HmE2awDyC5RjYlnaL5Mkp+90X?=
 =?us-ascii?Q?SSfzmaiVPJc2EXVPULrObtEtGlsBn4uf4Xs51pFVHkBbNwje9gBVGvu9fan5?=
 =?us-ascii?Q?/Vi+EMRUnFuTRGUnqZp9WCf+pdgCLlyqmu04AV74nkXbvPuZ7Rp2RwUHJEUW?=
 =?us-ascii?Q?UmWOB+7NCsTVPOLH85r6PuUunvxjySB2Cef6QDOkiy2cAUeQZQuUG7Yf1WVY?=
 =?us-ascii?Q?bduBTfmYHn4QBsQFE4rmjyaOMmRzgdGRkEWX4XZ14n4kvWvqtgzhb9DupNZG?=
 =?us-ascii?Q?FkoA/Mm0h7Ng79VO9FjAi+Es/aSo3BrFcAg5/VNNAaWUi3vB5PjhP2FC0gdP?=
 =?us-ascii?Q?m+AHhnwR4wy5gpslGJxnKcx7slUuHCAWV7Ta7Zx4g7O27AI/ZD+WhTYlvffu?=
 =?us-ascii?Q?Sm6Na00OenmLOjt1SclPP02TrU4vNs8u+mXJHXquRQyhj3AIR/sfJiJZcBXK?=
 =?us-ascii?Q?t+MzPSLNOLiWg+WY/ZsiOMr1TI+aV8hJ7MZUTzKlXqh6tehVcaARsu85u5Jx?=
 =?us-ascii?Q?9pO1LYe5SPU5hCaDZprAjNKH0NlLqGpIgevkwindsugG1QEzDJdPgNeor581?=
 =?us-ascii?Q?4k+rUq2RGngqXcbBbX6cxTdZOFCuO2eLEnAxNddNA5HeMP2nIWAYtpBJa1az?=
 =?us-ascii?Q?cjQDLCXZWN9262F2HLzcveQwxzrEbDfFtxk6d1/NuKcBJfoct4aSJkqa0qv3?=
 =?us-ascii?Q?MePRK3maAA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a743601-81cd-443f-27e3-08ded08671bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 17:48:18.5141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qscsoXiKU31mdK4s5B0hgst41ZHqybvdGr7n20qwy2q3qmuS0FC9CanAlbqYSPGu5QPzcYzi8kES27eXR3m3f9cjYiWOx+3YgV/y2L8Uhv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65393-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,40.107.74.13:received,2603:1096:400:3d0::7:received];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E74086B1989

Hi Biren Pandya,

> -----Original Message-----
> From: Biren Pandya <birenpandya@gmail.com>
> Sent: 22 June 2026 18:34
> Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup(=
)
>=20
> *** BLURB HERE ***

Consider patch series description next time.

Cheers,
Biju

>=20
> Biren Pandya (4):
>   media: renesas: rcar-csi2: Add missing media_entity_cleanup()
>   media: renesas: csisp: Add missing media_entity_cleanup()
>   media: renesas: rcar-core: Add missing media_entity_cleanup()
>   media: renesas: rzg2l-core: Add missing media_entity_cleanup()
>=20
>  drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
>  drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
>  4 files changed, 11 insertions(+), 2 deletions(-)
>=20
> --
> 2.50.1 (Apple Git-155)
>=20


