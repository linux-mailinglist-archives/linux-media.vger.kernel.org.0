Return-Path: <linux-media+bounces-37283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59FB00053
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 129E9171649
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3331B2DAFD6;
	Thu, 10 Jul 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nW6xbKtO"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5020FA9C;
	Thu, 10 Jul 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146122; cv=fail; b=r2rSPX7sC5pAQ2JsKpWTSXKJRaabl4/EQJqqrZZg2/dmJmqWFdydog9NImUqHeq8pdKf0qQ5jwHVO5pHuhyIIp9PPy+WLkC8xeUBQs/RRC8mLc/AOcXd7u4cfEx96CSmIB2Kjm5U1KeoZJDTnBmFlhkN/m5oVLBlxbjYnQNxyrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146122; c=relaxed/simple;
	bh=Xm1Df7PDfO22z8ge+xQBOE8tsB3N5gWX2uXSivk7ie0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FOxNiiJY2rLQWQl7616svs/zFDUq8NHwncdzFTe3XZY3dQ7T+AaDkzFdDNBhEopbXdiRAE2o6Mb+fxzEMg2xAoDRxdIAGv9zTVeUdzfL4UdSuThT1U+77w+y7GVCZ74Uw2xuIOgQsAzjo1wnGY7Sifl2cMo6FZD7nmPmXjSmbM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nW6xbKtO; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7snGS5uSnrWYply3Hp2nFQCr9YD1KmFD4sQYOgL0rqrcvZQXFwYtk327CPAq9H4CON1Jxp8ZGja8YxBbkOlQbPUnzJKwddAqz2qmgpOH8r85+tB9bEtfxVmYKrgLQCaDHnNxA8Nm2AE+J/i92+L7PlKWNqcoGleZXi6bMnORUis8LCmTI56WPt56K/jsppYskDc211ilDFENabvrC+07nWoyOd1/Yyk+s+0t5N4+/u88KE0JgRzyNQleHRPGzS56+ExBYrKcNQXFZlG61p/1rIK5C5NDC65aZX1J9fSXaiQHuK9CIUt1pxJWXfhRi4a4yFfG+hH4ZwlcFr6LfxA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rSxh8ykWvrAQstaFU2XnO1pcxzx06/TCTUuM4+pCqw=;
 b=Hj8kkQ2HcmThkoVMa7bien16PN2tlqWNyLkSUFCcBVNwkL2WCtHwI1axJTiwcqLZs94AvjmUeYdCGnO72W1ewOUrwMti6KGRrNDpTMVzdYij9og2yjWV5O1tG7bs0A9+r9I9I1QQ9uhTf8BFD43q5hy4UHnQ3lA81HUgodaI0xyVHJfGt5Y1tSvlqLUnqdojBxfE0a7RCuaCjWonqnolYhmZ1ATNRqFmh1E2o6XlQekPROgddcgcTqQYVqvN/ECRBDc9F4+AywJAUc53zdOp3bhhSDdnr+aa/s8bjYFjitrK21qsRuc7kD/N4l/lDLkFTKEK7K04eoce+ma6WTf7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rSxh8ykWvrAQstaFU2XnO1pcxzx06/TCTUuM4+pCqw=;
 b=nW6xbKtO6551Z/VKB/O084aBo8Rnw2dEqawfi1cWFhdmwlpNyNXMdGlvgleIvstLAZlj4Nc6/s/oiM/c2WA3GMuiD0FCojzZxbqUggS0WAX37EtBkRtBHkz62UKK3uMuQoD+Di6mdWyY7o901/J7+0QH8hveXPe/hvzh9bkdhQA=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY3PR01MB10191.jpnprd01.prod.outlook.com (2603:1096:400:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 11:15:17 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:15:17 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/5] media: renesas: vsp1: Convert to
 SYSTEM_SLEEP/RUNTIME_PM_OPS()
Thread-Topic: [PATCH 5/5] media: renesas: vsp1: Convert to
 SYSTEM_SLEEP/RUNTIME_PM_OPS()
Thread-Index: AQHb8QYA7elcXpAf4kau65dkHbLOYLQrNbjQ
Date: Thu, 10 Jul 2025 11:15:17 +0000
Message-ID:
 <TY3PR01MB12089FFC38765F097593AE12CC248A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <7de021d90e524ef740d6d59a899fb9a34fbf5247.1752088108.git.geert+renesas@glider.be>
In-Reply-To:
 <7de021d90e524ef740d6d59a899fb9a34fbf5247.1752088108.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY3PR01MB10191:EE_
x-ms-office365-filtering-correlation-id: 6f76e0ae-bec8-412c-6da8-08ddbfa30cbe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hZFWrWF4LYFxq488k+x1gfFbkGWs7kdHdt1PRoHLAegJzypkNRA8+5IC00?=
 =?iso-8859-1?Q?iM8152yPFmyXJRMnlu+6l4K8cRRz9yDyhpghDwnR3tB9q7O0H28FOQQwyO?=
 =?iso-8859-1?Q?OIMnaIn2JsJ1DJ0y3a8jLqVYxOJbvdZOXnBRunZG8ZuTlkk/FV6uVEqayM?=
 =?iso-8859-1?Q?VtTXsgh0cvdTQQrBqZ195HP4PagR5T0HzbsWX7qshMtup2rkoZjrNt7Tk4?=
 =?iso-8859-1?Q?koJrR5hZjNJ4Sh83pKyd/8gU9b/0mFEXpiRCh5rZkkfncKVQPvRF2QgDU2?=
 =?iso-8859-1?Q?VR8Rww8O/7dDI6Y9BdVW2AG6eGEY7+bR2L9+l6xn3U8WDeCWcv/ONDo9H7?=
 =?iso-8859-1?Q?6nlyr1hQe/zo7Wi5rNVcq99i4hKs+5fQrUB3y/rs6GqBYRSQeQb8ALbW0Y?=
 =?iso-8859-1?Q?qwWxjZ2rYJ3ltkCv99v0SYYPwErwsQBAUEIehoiisFUi5ZHJLUHwhP+188?=
 =?iso-8859-1?Q?wpnfIE2MSoyve45OaXqYO5+IRVko0krCu1slRTuazhO83Eo3ca4eAdQLd5?=
 =?iso-8859-1?Q?2+0LZwNr3INiNunae50Eykv//fwvPUaY9I21UHvOSrR+Mmdi1TnAyXH4Mr?=
 =?iso-8859-1?Q?MYw0RUFrsVLL78TWX9gNbVeWis5FVGnx01Y9Phq3f2LavbSoAuMAThQ/uq?=
 =?iso-8859-1?Q?foiPezyD0G550JyOAP9xNwH++VtFbaOvffqxKysAVAvPQqeZyGrbb/ht5i?=
 =?iso-8859-1?Q?fUTkuLnFbP2NSMGEIPUf5YAYrxF8Hh1Qq73u3uj70P1sI9uIsUKaI21kTb?=
 =?iso-8859-1?Q?z0JRtPhDGpST3PT80SeunRzD8crAU9ahBxEtO76CwIiioFdjoeWRo7dcYe?=
 =?iso-8859-1?Q?2mfm6ZQ7RunFhw2uD5xeyy+VuLWb9Y7SbS4tu/uAKokDnBAu2zSFAf267h?=
 =?iso-8859-1?Q?zo28ODn9tnEMRlnV6ik5kBA1TbxtFioXQ3nlFb4qlZeVwtX4/JKrCbTRB6?=
 =?iso-8859-1?Q?JxdPW1H0LeZj4ukQ8Aciwzh99wqVyWRlOIaC7EeNphlmS1o+0oGrSBNnsw?=
 =?iso-8859-1?Q?pEQkkJ6IZi4T6r0unx9vxqetWjbLDmgDrwN/PU1ekuQnxVOoQgklAbiQi5?=
 =?iso-8859-1?Q?ub5x1pTRcTve9rlf/coOOno17DvGaNBuTkxPUTDl13t7mDPMbtq/RQPayp?=
 =?iso-8859-1?Q?/zeeiY4YA9yWddeA+ZO0Yx0aJXo8910p4Mi6t/wSSM7nXTBCQdZjSxXtYI?=
 =?iso-8859-1?Q?0G4n81dZtSPMKgpSJxO9VW0suIq8K6DmYpobt0F2hphJEwN9fvSEEjh6aB?=
 =?iso-8859-1?Q?KNjDJ2IenFXS/bvVUtKOE/336UK8xJRKD2mrecLQUi1Dw2Fcyi5qoMG37d?=
 =?iso-8859-1?Q?0liJ1KHAzvB9w1/hu2WqX338aeu/b/7bs9XbTkPcuEVsIL0uIO9pq728Qk?=
 =?iso-8859-1?Q?bdwp5o/KP+IovblQ9OhSUXfyusNucx7BTHWTmAG6cfRXKNMfkm+tTz60H8?=
 =?iso-8859-1?Q?68t9oA/eADOpZaW0bLNMaHe+PuJUdI3FFavXADRi07MW/GBX53Vleflj0G?=
 =?iso-8859-1?Q?FB7ThADtleuTk89qEcYwo1T8OFtjhXbx5X4uyfXXWuiA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?z5uN9wNpgr0lCopD/57HH/GpKuOT249daf2Y1RquBgfrE/TPEu2CCWzi1V?=
 =?iso-8859-1?Q?jKnkCxKuCHZ90eBShCBLP9NoW891hm9x2e6nG+WB+1vam6viLTH+KoSMb4?=
 =?iso-8859-1?Q?h6iG6ucZsoIIGBMjNIyGmv+yinY1lrFt1n/8T0tPG8KbuAgb96ocq0nDg7?=
 =?iso-8859-1?Q?oEER8PqgKY6UngM8C5tyXAhyiSW6eeXbsXO+HldRiaV2LAqeFihXd6i5oB?=
 =?iso-8859-1?Q?GNfGYkYbxfm5wdbkJ7QIbpGJfzveQ8ByYBEGOsCSvd63ol1/kfenV1LZAG?=
 =?iso-8859-1?Q?L1Lt+y7mogbEM4hNxRBqpy6l3SRUS9kXb6f0szObdmLNpptCrwJpV3CyLZ?=
 =?iso-8859-1?Q?hfKkmj0LPR3gTiE+eklQuVuG3E0oFe6eLOWBEA/RnZY2LLCP0TwWfCBgqR?=
 =?iso-8859-1?Q?LbUcU7vOFPIUhSeie2JZ/Rvq0X+iMdckQsS7M9RY7DDdRtttlJStNRaEmD?=
 =?iso-8859-1?Q?YeuQMPB8Df1IIX94zXyXMBIHNDQpJVAhyLJLV7e4xGiULRqsK8j57paTq+?=
 =?iso-8859-1?Q?F8JvmyKL25wQa/dm87o/R8i7zbDcnLcDYmWw8+kI6vbMJoFBIKBU9BJU7M?=
 =?iso-8859-1?Q?dUhzPbZG71cH9mqhH3PcMpxl6SBX21iTfcjsTQIB16PsSWQdM6JXOhr/17?=
 =?iso-8859-1?Q?qXfIKaxQw7KOgb4B3A/UppYXe5kQe+CdSsM+VrjHLVTeG1xL4Es2UShOpq?=
 =?iso-8859-1?Q?i/mvCPSVKWkatF+A/qMx/JCKfCE9lwVS0lwg+KNbIny9baIDBUQE0DPMe9?=
 =?iso-8859-1?Q?4gnrCHhjxKKrgcfOl2KfJp+Qewr2wijyDb9O1TdlKkkRgNLi75jHrHb+Md?=
 =?iso-8859-1?Q?Cwwgy6AkkMfkM8RMgosi8N7HTtL9meKtybTknh/+9lLxe+x63KKII+Sid+?=
 =?iso-8859-1?Q?rFABgYv16LsTowaj+BxUkIaWP2XAIvhrW0YzEzblrcY8DVwFwHadw2M9pE?=
 =?iso-8859-1?Q?jDU+Z7nvsVJEgU24Kr7XcudfKYuPyuB6gcqEpxKNNnD8RX6ryBtMbqATPy?=
 =?iso-8859-1?Q?nDuRtps929Es/ASWSJMC2T3ot8DZXV/GXbg2AdXVJtWlPoDhk40nIAIWOn?=
 =?iso-8859-1?Q?+fhg8uS4qXa4QPLKyuipf9ZdMeKTzeasWZRnrGscS32RgVQ2h5WOFprm5E?=
 =?iso-8859-1?Q?QJsb5e877dAeuo8GHb7CZVPvMJA43bnMD6SdqJBgvc3zBBtkUcFxxKr3KE?=
 =?iso-8859-1?Q?RHW38p4SYL05R8ArzEEGFecXeTLfMYXFafFWbhJSY9ivh+KEDM3LIkfaU6?=
 =?iso-8859-1?Q?gKInkk9RyA5cShO+vaA9iOGC1izceToEyNdWa/As1PZVhBaDsEUHXAUnLH?=
 =?iso-8859-1?Q?p6byev7PB3+VF1PaSEVxnDGKv5j92XZA2puHR5DizH2Us46afM1jQMHMWu?=
 =?iso-8859-1?Q?Q37EeX45jMF7fAOHJauxe+iPHnSMrLcW+I500SIc//gbYLcSjcVKgH4OTR?=
 =?iso-8859-1?Q?xwied66HKhYK9xTeamL5elPqYHdUa9RlrE5ZHQmdZn56U9QahPHF7VZaOe?=
 =?iso-8859-1?Q?SzQBLa7juqRu5C6ZOQ3g3djA/hi5drKUq6z4DnL3qXg7UpqAaq5JIFFBrY?=
 =?iso-8859-1?Q?AMoAoVXlBaBS0GaiWTLRthBPtvhgD23ZBadjrWSH9i+5z53D0eGCQY6SQq?=
 =?iso-8859-1?Q?8LD/qw3PG61qQ1YGBnXJfniyXCNOvg33yRyZ9ikdM3bEMHEMsBcv5huQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f76e0ae-bec8-412c-6da8-08ddbfa30cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 11:15:17.0716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gmc9Mx24Nhjzou3q4yEE+fqftwGuj3rdqA8I3W+TYJ2J3fWOnMm9WABOSMHcpa3W6qbyM9q+mMuwswvGuWP3USiNXvqeVP1/8qmYIuK5KSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10191

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 20:16
> To: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>; Mauro Carvalho Ch=
ehab <mchehab@kernel.org>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>; Jacopo Mondi <jacopo@jmondi.or=
g>; laurent.pinchart
> <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert=
 Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH 5/5] media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIM=
E_PM_OPS()
>=20
> Convert the Renesas VSP1 Video Processing Engine driver from
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() to
> SYSTEM_SLEEP_PM_OPS(), RUNTIME_PM_OPS(), and pm_ptr().  This lets us
> drop the __maybe_unused annotations from its various suspend and resume
> callbacks, and reduces kernel size in case CONFIG_PM is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index b8d06e88c4757317..6c64657fc4f3366f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -618,7 +618,7 @@ void vsp1_device_put(struct vsp1_device *vsp1)
>   * Power Management
>   */
>=20
> -static int __maybe_unused vsp1_pm_suspend(struct device *dev)
> +static int vsp1_pm_suspend(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
>=20
> @@ -634,7 +634,7 @@ static int __maybe_unused vsp1_pm_suspend(struct devi=
ce *dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused vsp1_pm_resume(struct device *dev)
> +static int vsp1_pm_resume(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
>=20
> @@ -650,7 +650,7 @@ static int __maybe_unused vsp1_pm_resume(struct devic=
e *dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
> +static int vsp1_pm_runtime_suspend(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
>=20
> @@ -660,7 +660,7 @@ static int __maybe_unused vsp1_pm_runtime_suspend(str=
uct device *dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
> +static int vsp1_pm_runtime_resume(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
>  	int ret;
> @@ -693,8 +693,8 @@ static int __maybe_unused vsp1_pm_runtime_resume(stru=
ct device *dev)
>  }
>=20
>  static const struct dev_pm_ops vsp1_pm_ops =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> -	SET_RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NUL=
L)
> +	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> +	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
>  };
>=20
>  /* ---------------------------------------------------------------------=
--------
> @@ -1042,7 +1042,7 @@ static struct platform_driver vsp1_platform_driver =
=3D {
>  	.remove		=3D vsp1_remove,
>  	.driver		=3D {
>  		.name	=3D "vsp1",
> -		.pm	=3D &vsp1_pm_ops,
> +		.pm	=3D pm_ptr(&vsp1_pm_ops),
>  		.of_match_table =3D vsp1_of_match,
>  	},
>  };
> --
> 2.43.0


