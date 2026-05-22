Return-Path: <linux-media+bounces-62633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM6pNuyLEGrEZQYAu9opvQ
	(envelope-from <linux-media+bounces-62633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:01:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 512015B7D61
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3174300E615
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA48F41C303;
	Fri, 22 May 2026 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Mq5buuOH"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020122.outbound.protection.outlook.com [52.101.225.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8F5282F2E;
	Fri, 22 May 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469268; cv=fail; b=a6JGqXpiYOLK17yIZKMuSv76RqqVwRdUVhyKOcIZgF/OvwC2gAoGT0fF9TD1KNU6ISVydGmjs69NGP/g1aX8ox5Z2pg83PrJCR5DqMkhy6kWkhnzk6tVgpA+RrRJutxMtZmdr38UiqSWqezVRkyydJPw/CBmnPUfjSOgddE00lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469268; c=relaxed/simple;
	bh=SqEzGm2/OVTOKurkyFRp+yF9cRycF9FjxxtwiITLpDA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kOYr3BEsKkzAluJOyhoUp5PA4H2AO1jXk50dqnGnHeoXF5XBBPU91VdYydPJ5/ptFv7S5c1hdBtbNl0Ss4MuzOf68wUTqtZqibKrybtvG/Bk3uSG7MGJRkJ07SMORE7lWaqYoR9giJl1iTicCIcyrl1REG9TRc2ZAaWfez2DTPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Mq5buuOH; arc=fail smtp.client-ip=52.101.225.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2OTPAAf7smYVqBjYc3ywJeU7AVyxoLgJ8XKE0K18JVUX3JBSZNi3P2SnMkj7vaT+vh95heuf3w6clUD3BTfomBhaV13I0AMGZ74JMCRtHDEbJnWDg8zkyUxNe/JgOpLJ2FiUj+GktoCALND5D4409QnfcWFmaHhONx7RkpuDdSoPrkdKwGpgPJwJWtQfhTg5yC2LrUh3jyfqbOBpOC7h+JzTfpoDkup2VmzctsPLfvC4sJl86xHQwLw2x7afVFQyNjvTqXLwYu2LZ3UDJa9GQl24AeRqu6pMbTkRX9Px2VsDq511cwq243MYkMKzWV69t3i41nEKPzT4UXt0TAM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6YZEiqcwcKvpr54cBTxmnRm2H0EXl2VRudPwrqZEwY=;
 b=Xw1YwBy+2Si3kdM/WzwBLSgygs/xhQ9Ocw2ITJ9lj1GO7SnMz+wgLuuMhLbSyIO1EkCqrppXB/qpnqPWIE77npXMzEnBGWcfzPwymsCbjHplfCaXV489M8teuBZufWNZrVPywW7+unt1avldqnTI3jPJzwrmM4aG9Vtd4mbfRWHEih53rIiXD7dF2oBfUHSFBa3Gko3xYmgs/vbg+kICUZvPUzNi1QduIDESFCBd4eFRfRJlkYQ/TAs+nFkjG9S04jvxzcYXVdjUoBN8bXzQdbFMQVazmyhq9j6XP+RWP1NFi1IifSLIG5g+ziO4nq5idBjHzBR5CfZxewcRqT1Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6YZEiqcwcKvpr54cBTxmnRm2H0EXl2VRudPwrqZEwY=;
 b=Mq5buuOHL5O51TKsAA9cHYi2xny4em07kwAi9fWqL2nmWTUlV3npjndomMVPEWNahr5YGU2bV09wodSOyOWtN5kpZjTgsph2ZV9oHp8XcxAdJr5okBxwzc7ewE2AYF+5aX3trA7Px0VES7jTd4LPA8amoUcRyxsC5yaEV7oa49ETv72x4QPD/ZiLtzYysHT7u/5DIPJXVtruAIhi8S8rvdBXU9hZJUMNHx5xI1Z7+Lk6JdrKvsS+g09FGNtqKf7UF/3oQMhECUgqs0ClAkipkPOsxcePh1DI+K0kA27bTebwIxHo+EiZPSPY3LO/sNmoEJawuAOALsq1OAAZnYDfcA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3642.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 17:01:01 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 17:01:01 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHc6GzDGhYkqnT02U+T7Emm/l+GfrYaEvec
Date: Fri, 22 May 2026 17:01:01 +0000
Message-ID:
 <PN3P287MB1829DE5A82688FB30D1AA28A8B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
 <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com>
In-Reply-To: <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3642:EE_
x-ms-office365-filtering-correlation-id: e4584942-cf62-4dd6-f9e8-08deb823b3c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|4022899009|10070799003|38070700021|18092099006|18002099003|56012099003|22082099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info:
 vSU6QPs8c89Yydr7S8GBSSHAcR/oSO2K3PQrFbg1H1xR450lpstag89Y9DUiThj8jhWf3IEcg0pUPmKoJc/kVg6U9UFeh4sMK+hr6yvSxOEMQpUK1HO85DCxNlqA6nuA6Mt0meiMF5lnKHlG4tzUY89jBcpZqzj5VB46JoItBquqF+hzZ5ou2+MtPvtLwaL3Qxh7nlnOXhWkYS8YH2wx2Ka/rFs1otEmiRDUIRA71aLD6VNlIfH6HbIiVLf+vze8wrfrr10/lnBC/b7xJC4lWLhyJ8jtt22iVaIEhs3BaVJB+nAm3TSACcWYdJlSzclqMaskcdjoLtOAgXIpUOAZCPkNn6RrJ6TtKMaUlyVVRo+vBdlJ3xB57AkYl4GKunlyHNjMLK/A2NwPsLyBzN5vqYn+kqL0k38eUIe4p58id3YwwEhcy7EI8LIwwmvp+Jgzi6ks9rk44pU551xRKUDMaRrn6o5/GeWD2aW5qjIXcrRgxWxEVjA1HAX80DNLCGs0fhFK5grlkL5mDhON+Ri41Ojz4M7YhDXpeQokCZGMpz7Y3rERV/CWVd9+aM3NmA9PQpU4kFX0CZepOE5fq60CT15g/7ksDUdvetb+LWRuIVlJ0Jyn2DaLUFBfd47OwA0UVQXNG7vTMAOcKV85qXdqUl46oShiaDo0N17Ozfo0Gz8bIO1GKq6+C1mtKjWRhOWSVNk1pGBDsCUigfWX8bXNfkufwr3QUMFzLnCGU48nVLweHzgHl1d7bAThCcFP6EJC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(4022899009)(10070799003)(38070700021)(18092099006)(18002099003)(56012099003)(22082099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LJLfWb2cQu8DNsGgK19++7VNDWeeoBbEcf/Aa6l3Eje/0gxSmAs5V1DP1w?=
 =?iso-8859-1?Q?8jMMv+BcLfQlSn4OmvwGvT5DATG4cjA3UAFOqJnwo1f8emU0Kw0aCqj+el?=
 =?iso-8859-1?Q?NjZq3fz2bVsuhdhDAHruMHyNAoc3brSm0aWWsipCKfj1z2X4vl+i5Qfw96?=
 =?iso-8859-1?Q?F+EugJC0OFUy2B6hxO71ynhXEjmUqEJJcLOGnZGsrpRMjc9Kx2mSMP3L8o?=
 =?iso-8859-1?Q?Kfs78+GdpxpYMro6I3ErFXWfvdrc7I0npcVTXEGtpSclOioJpkSAxaHCD2?=
 =?iso-8859-1?Q?c2LhpVrgSwOI7lu8XMJ71NtinOCVyaqIx+oAlR6UNQTxkDh5ZBzCOJPP9G?=
 =?iso-8859-1?Q?H4IabaS2atPd6QwucMjrwqphGND5Co9pWbU+g58zFPi+nhE3ZB3U2jVgt0?=
 =?iso-8859-1?Q?1/OkNZ2vk1jGi9Qm7FMtEZqeLyoj4R+Q28EPEylUJSxNImoM2ZCX2Q5eNB?=
 =?iso-8859-1?Q?jug0RJStSy/5VD4DxPgeW5JlDF8V/eEVotPw8BYKU1H36arSQSNfKFJte9?=
 =?iso-8859-1?Q?yTy64hfJbKQlo+RCfuMxJ582jf09B/CTSAzljKJS/bxMGkrLGCq5ObyRVH?=
 =?iso-8859-1?Q?68kM7+zy1882Fox70zEsRULfttcvfwdjDXA2Gjp3uBIDRGJAbInwXoRtHX?=
 =?iso-8859-1?Q?WzUdxzfOrQJEzVrpBcGpF+iIvdGpynvndJI78o4w5RFdNYCo07d8EmKtpO?=
 =?iso-8859-1?Q?W7ja8Zqjea3Kfuuvw7DOSbSEbfisOalGU3bm8v+YsCEGAC/p6Vc5o828uD?=
 =?iso-8859-1?Q?5f1FqdxFfecphnxC3CuhPd/tUjz+ZCP6rNqREdgagYbVzP3a6Ih6mCV3vD?=
 =?iso-8859-1?Q?xX71fBJFpclXAFHloPu2W8TSlUqgMDxIDnORoNN5dFvPCOZJpy/kpknxI7?=
 =?iso-8859-1?Q?7fdUpLUFGLWhtVXYLet4tSbLGMmPVlBfjj4vmEQVh3Su1ZaFWHYvitcdTE?=
 =?iso-8859-1?Q?eq666aNM17nY0Xpxcz7F8v5TWaCFjQcLE6nAV1bJoeaXfQkSaLUQPeZFSy?=
 =?iso-8859-1?Q?n/iPchuNSkR0WmxbiaOcGK5Nh0eAuUOSwr0xc3BD0Zh+o8LnmQ60x9MRLG?=
 =?iso-8859-1?Q?fyqr8II7IEhMDdvHFCaGGnTCL+qvcHxxGQwHDziFo+U6ZXYqEdSOgeUAzZ?=
 =?iso-8859-1?Q?9n0IBMJyQxJKHTgnQyw3lox+Ut6BIOMEDEHXBiC3Aqgfz0Z6Issl+lI98B?=
 =?iso-8859-1?Q?kB8i5L8v+BJZUliYVb0couaI/esk9gAh6CUSvr+X3hJT4puIn3MF1q6Ayv?=
 =?iso-8859-1?Q?WGVQVUc+okK7B3bXTCrgoJpFk9rCeg1ObfdIx6Z6i0liw2n7Q+W9swaDfy?=
 =?iso-8859-1?Q?VbrWV9NF79FkJL/1hWeNeCL1Tqjo93sohWGF6HXPVq52prDA87HD4nG9yC?=
 =?iso-8859-1?Q?AaQhicMaII1N30oygvCbYIVwGnj0/Z/vMwQoSJut5QnSsmY1IuvvnoIMHN?=
 =?iso-8859-1?Q?665vmSF5obBCHlVZm0SW1jwxlaM6u/CQHQUwBSYV20H/A/GG3AgaKtUf83?=
 =?iso-8859-1?Q?X9J+Za4DhylDorpxHWC80FaiS4QIxEtl3iSYqOwKsultJyN6zKqNh3R6qc?=
 =?iso-8859-1?Q?BBUStKAUNE3zH5dxsK7ij87qESifi37PmKLJdyFBPXqkRyImbdMPfy5HBG?=
 =?iso-8859-1?Q?BInVAWR7E0s/aUYZYkW9tn9qRL4s9Qgx7DE2f6BNua9M/gtDmRLmRreRYk?=
 =?iso-8859-1?Q?jUW7NVcVgJkIOrJ0W2svOkcJYmc0MfciRiYWEAEKJc067DoHd/LrkQ/iTm?=
 =?iso-8859-1?Q?hyHoA0a1YXigg3u48GX9Tl9Pud7rs9u8qAe4A+j2l27dxzjJ6KiK3WitUA?=
 =?iso-8859-1?Q?rf5ksE0bTc+vXZa69C9EcWbtl1H5svmxT87QegA5Z9UsQoeSzPmHjIs2Ka?=
 =?iso-8859-1?Q?OO?=
x-ms-exchange-antispam-messagedata-1: J+VKBLMsXTNNxUBVDCW+iv3V8cbjrkspCmI=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e4584942-cf62-4dd6-f9e8-08deb823b3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 17:01:01.2737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6BCvJ/1Y+y6c0qXu+m1NVCpuJMNb8trYq4LnIkwCh5K32Ku8xrT5YgfMDjMZOQtjXgLhKljST1VG4/FZRll6tDA5VJNwB3pAeSaMJaFpSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3642
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62633-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 512015B7D61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,=0A=
=0A=
I noticed a few issues and also have one question. Could you please help me=
=0A=
understand that part?=0A=
=0A=
Please check the comments below.=0A=
=0A=
> Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
>=0A=
> IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=0A=
> solid-state image sensor with a square pixel array and 8.40 M effective=
=0A=
> pixels.=0A=
>=0A=
> The following features are supported by the driver:=0A=
> - Monochrome and Color (Bayer filter) variants=0A=
> - Multiple input clock frequencies supported=0A=
> - Multiple link frequencies supported=0A=
> - VBLANK and HBLANK control for variable framerate=0A=
> - Freely configurable crop rectangle through S_SELECTION ioctl=0A=
> - Configurable resolution with 2x2 binning (for the current crop)=0A=
>   through S_FMT ioctl=0A=
> - VFLIP and HFLIP control for flipping readout=0A=
> - Test pattern control support=0A=
> - Exposure and gain control=0A=
> - MIPI RAW12 output=0A=
>=0A=
> Following features are not currently supported but may be added later:=0A=
> - Pixel-perfect crop reporting, account for the shift-by-1 when flipping=
=0A=
>   using HFLIP/VFLIP, which maintains the bayer readout order=0A=
> - Increased framerate (lower HMAX/VMAX) when cropping=0A=
> - MIPI RAW10 output mode=0A=
> - Embedded data stream=0A=
>=0A=
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> ---=0A=
=0A=
...=0A=
=0A=
> +#define IMX678_REG_INCK_SEL             CCI_REG8(0x3014)=0A=
> +=0A=
> +/* Link Speed */=0A=
> +#define IMX678_REG_DATARATE_SEL         CCI_REG8(0x3015)=0A=
> +=0A=
> +/* Lane Count */=0A=
> +#define IMX678_REG_LANEMODE             CCI_REG8(0x3040)=0A=
> +=0A=
> +/*=0A=
> + * The internal readout clock runs at 74.25 Hz. In one cycle the AD read=
s 8=0A=
=0A=
I think it's 74.25 MHz.=0A=
=0A=
> + * pixels, thus giving us a rate of 74.25 * 8 =3D 594 MPix/s=0A=
> + */=0A=
> +#define IMX678_PIXEL_RATE              594000000=0A=
> +#define IMX678_PIX_PER_CLK             8=0A=
> +=0A=
> +/* VMAX - Frame Length in Lines */=0A=
> +#define IMX678_REG_VMAX                 CCI_REG24_LE(0x3028)=0A=
> +#define IMX678_VMAX_MAX                 0xfffff=0A=
> +#define IMX678_VMAX_DEFAULT             2250=0A=
=0A=
...=0A=
=0A=
> +static const int imx678_tpg_val[] =3D {=0A=
> +       IMX678_TPG_ALL_000,=0A=
> +       IMX678_TPG_ALL_000,=0A=
> +       IMX678_TPG_ALL_FFF,=0A=
> +       IMX678_TPG_ALL_555,=0A=
> +       IMX678_TPG_ALL_AAA,=0A=
> +       IMX678_TPG_TOG_555_AAA,=0A=
> +       IMX678_TPG_TOG_AAA_555,=0A=
> +       IMX678_TPG_TOG_000_555,=0A=
> +       IMX678_TPG_TOG_555_000,=0A=
> +       IMX678_TPG_TOG_000_FFF,=0A=
> +       IMX678_TPG_TOG_FFF_000,=0A=
> +       IMX678_TPG_H_COLOR_BARS,=0A=
> +       IMX678_TPG_V_COLOR_BARS,=0A=
> +};=0A=
> +=0A=
> +/* IMX678 Register List */=0A=
> +/* Common Modes */=0A=
=0A=
You can remove these comments or keep only one of them.=0A=
=0A=
> +static const struct cci_reg_sequence common_regs[] =3D {=0A=
> +       {IMX678_REG_THIN_V_EN, 0x00},=0A=
> +       {IMX678_REG_VCMODE, 0x01},=0A=
> +       {CCI_REG8(0x306B), 0x00},=0A=
> +       {IMX678_REG_GAIN_PGC_FIDMD, 0x01},=0A=
> +       {CCI_REG8(0x3460), 0x22},=0A=
> +       {CCI_REG8(0x355A), 0x64},=0A=
=0A=
...=0A=
=0A=
> +static void imx678_set_framing_limits(struct imx678 *imx678,=0A=
> +                                     struct v4l2_subdev_state *state)=0A=
> +{=0A=
> +       const struct v4l2_mbus_framefmt *format =3D imx678_state_format(s=
tate);=0A=
> +       s64 min_hblank, default_hblank, max_hblank, vblank;=0A=
> +       const u32 hmax_4lane =3D min_hmax_4lane[__ffs(imx678->link_freq_b=
itmap)];=0A=
> +       const u32 lane_scale =3D imx678->lane_mode =3D=3D IMX678_LANEMODE=
_2L ? 2 : 1;=0A=
> +       const bool binning =3D imx678_state_binning(state);=0A=
> +       const u8 bpp =3D binning ? 10 : 12;=0A=
> +       u32 hmax, min_hmax;=0A=
> +=0A=
> +       imx678->vmax =3D IMX678_VMAX_DEFAULT;=0A=
> +       hmax =3D hmax_4lane * lane_scale;=0A=
> +=0A=
> +       /* HMAX can go lower when using 10bit AD for binning */=0A=
> +       min_hmax =3D (hmax * bpp) / 12;=0A=
> +       min_hblank =3D min_hmax * IMX678_PIX_PER_CLK - format->width;=0A=
> +       default_hblank =3D hmax * IMX678_PIX_PER_CLK - format->width;=0A=
> +       max_hblank =3D IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - format->wid=
th;=0A=
> +=0A=
> +       __v4l2_ctrl_modify_range(imx678->hblank, min_hblank, max_hblank,=
=0A=
> +                                IMX678_PIX_PER_CLK, default_hblank);=0A=
> +       __v4l2_ctrl_s_ctrl(imx678->hblank, default_hblank);=0A=
> +=0A=
> +       vblank =3D imx678->vmax - format->height;=0A=
> +       __v4l2_ctrl_modify_range(imx678->vblank, vblank,=0A=
> +                                IMX678_VMAX_MAX - format->height, 2, vbl=
ank);=0A=
> +       __v4l2_ctrl_s_ctrl(imx678->vblank, IMX678_VMAX_DEFAULT - format->=
height);=0A=
> +=0A=
> +       __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSURE_MIN,=
=0A=
> +                                imx678->vmax - IMX678_SHR_MIN, 1,=0A=
> +                                IMX678_EXPOSURE_DEFAULT);=0A=
=0A=
This control operation can fail, so please check the error value.=0A=
=0A=
Also, return the error by changing the return type accordingly.=0A=
=0A=
> +}=0A=
> +=0A=
> +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D container_of(ctrl->handler, struct imx6=
78, ctrl_handler);=0A=
> +       struct v4l2_subdev_state *state;=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);=
=0A=
> +       const struct v4l2_mbus_framefmt *format;=0A=
> +       int ret =3D 0;=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);=0A=
> +       format =3D imx678_state_format(state);=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               u32 current_exposure =3D imx678->exposure->cur.val;=0A=
> +=0A=
> +               imx678->vmax =3D format->height + ctrl->val;=0A=
> +=0A=
> +               current_exposure =3D clamp_t(u32, current_exposure, IMX67=
8_EXPOSURE_MIN,=0A=
> +                                          imx678->vmax - IMX678_SHR_MIN)=
;=0A=
> +               __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSUR=
E_MIN,=0A=
> +                                        imx678->vmax - IMX678_SHR_MIN, 1=
,=0A=
> +                                        current_exposure);=0A=
=0A=
Same here, please check the error value.=0A=
=0A=
> +       }=0A=
> +=0A=
> +       /*=0A=
> +        * Applying V4L2 control value only happens=0A=
> +        * when power is up for streaming=0A=
> +        */=0A=
> +       if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)=0A=
=0A=
Use pm_runtime_get_if_active.=0A=
=0A=
> +               return 0;=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               cci_write(imx678->cci, IMX678_REG_VMAX, imx678->vmax, &re=
t);=0A=
> +               fallthrough; /* SHR =3D VMAX - exposure, so update it */=
=0A=
> +       case V4L2_CID_EXPOSURE: {=0A=
> +               u32 shr =3D imx678->vmax - imx678->exposure->val;=0A=
> +=0A=
> +               cci_write(imx678->cci, IMX678_REG_SHR, shr, &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               cci_write(imx678->cci, IMX678_REG_ANALOG_GAIN, ctrl->val,=
 &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_HBLANK: {=0A=
> +               u32 hmax =3D (format->width + ctrl->val) / IMX678_PIX_PER=
_CLK;=0A=
> +=0A=
> +               cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_TEST_PATTERN: {=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_COLORWIDTH,=0A=
> +                         IMX678_TPG_COLORWIDTH_160PIX, &ret);=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_PATSEL_DUOUT,=0A=
> +                         imx678_tpg_val[ctrl->val], &ret);=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT, (ctrl->va=
l) ? 1 : 0,=0A=
> +                         &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_HFLIP:=0A=
> +               cci_write(imx678->cci, IMX678_REG_WINMODEH, ctrl->val, &r=
et);=0A=
> +               break;=0A=
> +       case V4L2_CID_VFLIP:=0A=
> +               cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, &r=
et);=0A=
> +               break;=0A=
> +       default:=0A=
> +               dev_warn(&client->dev,=0A=
> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",=0A=
> +                        ctrl->id, ctrl->val);=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_put(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_ctrl_ops imx678_ctrl_ops =3D {=0A=
> +       .s_ctrl =3D imx678_set_ctrl,=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int imx678_set_selection(struct v4l2_subdev *sd,=0A=
> +                               struct v4l2_subdev_state *sd_state,=0A=
> +                               struct v4l2_subdev_selection *sel)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +       struct v4l2_rect *crop;=0A=
> +       struct v4l2_rect rect;=0A=
> +=0A=
> +       if (sel->target !=3D V4L2_SEL_TGT_CROP || sel->pad !=3D 0)=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&=0A=
> +           v4l2_subdev_is_streaming(sd))=0A=
> +               return -EBUSY;=0A=
> +=0A=
> +       /* Align left, top to 4 */=0A=
> +       rect.left =3D clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_ALI=
GN),=0A=
> +                           imx678_active_area.left,=0A=
> +                           imx678_active_area.width - IMX678_PIXEL_ARRAY=
_MIN_WIDTH);=0A=
=0A=
You are ignoring the active_area offset here; please correct it.=0A=
=0A=
In imx296, crop bounds start at (0, 0), so no offset handling is needed the=
re.=0A=
=0A=
You can refer to my patch:=0A=
https://lore.kernel.org/linux-media/20260424092554.26130-4-elgin.perumbilly=
@siliconsignals.io/#t=0A=
=0A=
> +       rect.top =3D clamp_t(s32, ALIGN(sel->r.top, IMX678_CROP_VST_ALIGN=
),=0A=
> +                          imx678_active_area.top,=0A=
> +                          imx678_active_area.height - IMX678_PIXEL_ARRAY=
_MIN_HEIGHT);=0A=
> +       /* Align width to 16 and height to 4 */=0A=
> +       rect.width =3D clamp_t(u32, ALIGN(sel->r.width, IMX678_CROP_HWIDT=
H_ALIGN),=0A=
> +                            IMX678_PIXEL_ARRAY_MIN_WIDTH, imx678_active_=
area.width);=0A=
> +       rect.height =3D clamp_t(u32, ALIGN(sel->r.height, IMX678_CROP_VWI=
DTH_ALIGN),=0A=
> +                             IMX678_PIXEL_ARRAY_MIN_HEIGHT, imx678_activ=
e_area.height);=0A=
> +=0A=
> +       rect.width =3D min_t(u32, rect.width, imx678_native_area.width - =
rect.left);=0A=
> +       rect.height =3D min_t(u32, rect.height, imx678_native_area.height=
 - rect.top);=0A=
> +=0A=
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, sel->pad);=0A=
> +=0A=
> +       if (rect.width !=3D crop->width || rect.height !=3D crop->height)=
 {=0A=
> +               struct v4l2_mbus_framefmt *format =3D=0A=
> +                       v4l2_subdev_state_get_format(sd_state, sel->pad);=
=0A=
> +               format->width =3D rect.width;=0A=
> +               format->height =3D rect.height;=0A=
=0A=
Why are we not checking here whether binning mode is currently enabled?=0A=
=0A=
Suppose binning mode is enabled, and then userspace changes the crop.=0A=
=0A=
With the below lines:=0A=
=0A=
format->width =3D rect.width;=0A=
format->height =3D rect.height;=0A=
=0A=
the format size becomes equal to the crop size, which silently disables bin=
ning.=0A=
=0A=
Am I missing something here?=0A=
=0A=
> +       }=0A=
> +=0A=
> +       *crop =3D rect;=0A=
> +       sel->r =3D *crop;=0A=
> +=0A=
> +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)=0A=
> +               imx678_set_framing_limits(imx678, sd_state);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int imx678_init_state(struct v4l2_subdev *sd,=0A=
> +                            struct v4l2_subdev_state *state)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +       struct v4l2_subdev_selection sel =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
> +               .target =3D V4L2_SEL_TGT_CROP,=0A=
> +               .r =3D imx678_active_area,=0A=
> +       };=0A=
> +       struct v4l2_subdev_format fmt =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
> +               .pad =3D 0,=0A=
> +               .format =3D {=0A=
> +                       .code =3D imx678_default_mbus_code(imx678),=0A=
> +                       .width =3D imx678_active_area.width,=0A=
> +                       .height =3D imx678_active_area.height,=0A=
> +               },=0A=
> +       };=0A=
> +=0A=
> +       imx678_set_selection(sd, state, &sel);=0A=
> +       imx678_set_pad_format(sd, state, &fmt);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx678_enable_streams(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *state, u32 pad=
,=0A=
> +                                u64 mask)=0A=
> +{=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(sd);=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +       const struct v4l2_rect *crop =3D imx678_state_crop(state);=0A=
> +       const bool binning =3D imx678_state_binning(state);=0A=
> +       int ret =3D 0;=0A=
=0A=
You can omit the initialization here.=0A=
=0A=
> +=0A=
> +       ret =3D pm_runtime_resume_and_get(&client->dev);=0A=
> +       if (ret < 0)=0A=
> +               return ret;=0A=
> +=0A=
> +       ret =3D imx678_program_window(imx678, crop, binning);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "%s failed to set mode\n", __func__=
);=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D __v4l2_ctrl_handler_setup(imx678->sd.ctrl_handler);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "%s failed to apply user values\n",=
 __func__);=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STREAM=
ING, &ret);=0A=
> +       usleep_range(IMX678_STREAM_DELAY_US, IMX678_STREAM_DELAY_US +=0A=
> +                    IMX678_STREAM_DELAY_RANGE_US);=0A=
> +       cci_write(imx678->cci, IMX678_REG_XMSTA, 0x00, &ret);=0A=
> +=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "%s failed to start streaming\n", _=
_func__);=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +err_rpm_put:=0A=
> +       pm_runtime_put(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static const struct v4l2_subdev_core_ops imx678_core_ops =3D {=0A=
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,=0A=
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,=0A=
> +};=0A=
=0A=
Drop this=0A=
=0A=
See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.merc=
iai@gmail.com/=0A=
=0A=
> +static const struct v4l2_subdev_video_ops imx678_video_ops =3D {=0A=
> +       .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_pad_ops imx678_pad_ops =3D {=0A=
> +       .enum_mbus_code =3D imx678_enum_mbus_code,=0A=
> +       .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> +       .set_fmt =3D imx678_set_pad_format,=0A=
> +       .get_selection =3D imx678_get_selection,=0A=
> +       .set_selection =3D imx678_set_selection,=0A=
> +       .enum_frame_size =3D imx678_enum_frame_size,=0A=
> +       .enable_streams =3D imx678_enable_streams,=0A=
> +       .disable_streams =3D imx678_disable_streams,=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int imx678_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct device *dev =3D &client->dev;=0A=
> +       struct imx678 *imx678;=0A=
> +       int ret, i;=0A=
> +=0A=
> +       imx678 =3D devm_kzalloc(&client->dev, sizeof(*imx678), GFP_KERNEL=
);=0A=
> +       if (!imx678)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       v4l2_i2c_subdev_init(&imx678->sd, client, &imx678_subdev_ops);=0A=
> +=0A=
> +       imx678->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
> +       if (IS_ERR(imx678->cci))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->cci),=0A=
> +                                    "failed to init CCI\n");=0A=
> +=0A=
> +       if (imx678_check_hwcfg(dev, imx678))=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       imx678->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);=0A=
> +       if (IS_ERR(imx678->xclk))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->xclk),=0A=
> +                                    "failed to get xclk\n");=0A=
> +=0A=
> +       imx678->xclk_freq =3D clk_get_rate(imx678->xclk);=0A=
> +=0A=
> +       for (i =3D 0; i < ARRAY_SIZE(imx678_inck_table); ++i) {=0A=
> +               if (imx678_inck_table[i].xclk_hz =3D=3D imx678->xclk_freq=
) {=0A=
> +                       imx678->inck_sel_val =3D imx678_inck_table[i].inc=
k_sel;=0A=
> +                       break;=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       if (i =3D=3D ARRAY_SIZE(imx678_inck_table))=0A=
> +               return dev_err_probe(dev, -EINVAL,=0A=
> +                                    "unsupported XCLK rate %u Hz\n",=0A=
> +                                    imx678->xclk_freq);=0A=
> +=0A=
> +       ret =3D imx678_get_regulators(imx678);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");=0A=
> +=0A=
> +       imx678->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",=0A=
> +                                                    GPIOD_OUT_HIGH);=0A=
> +       if (IS_ERR(imx678->reset_gpio))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->reset_gpio),=0A=
> +                                    "failed to get reset GPIO\n");=0A=
> +=0A=
> +       ret =3D imx678_power_on(dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       ret =3D imx678_identify_model(imx678);=0A=
> +       if (ret)=0A=
> +               goto error_power_off;=0A=
> +=0A=
> +       pm_runtime_set_active(dev);=0A=
> +       pm_runtime_enable(dev);=0A=
> +=0A=
> +       ret =3D imx678_init_controls(imx678);=0A=
> +       if (ret)=0A=
> +               goto error_pm_runtime;=0A=
> +=0A=
> +       imx678->sd.internal_ops =3D &imx678_internal_ops;=0A=
> +       imx678->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=0A=
> +                               V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
> +       imx678->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +=0A=
> +       imx678->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=0A=
> +       ret =3D media_entity_pads_init(&imx678->sd.entity, 1, &imx678->pa=
d);=0A=
> +       if (ret) {=0A=
> +               dev_err(dev, "failed to init entity pads: %d\n", ret);=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       imx678->sd.state_lock =3D imx678->ctrl_handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&imx678->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(dev, "subdev init error\n");=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_media_entity;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&imx678->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(dev, "failed to register sensor sub-device: %d\n"=
, ret);=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_subdev_cleanup;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_idle(dev);=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error_subdev_cleanup:=0A=
> +       v4l2_subdev_cleanup(&imx678->sd);=0A=
> +=0A=
> +error_media_entity:=0A=
> +       media_entity_cleanup(&imx678->sd.entity);=0A=
> +=0A=
> +error_handler_free:=0A=
> +       imx678_free_controls(imx678);=0A=
> +=0A=
> +error_pm_runtime:=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +       pm_runtime_set_suspended(&client->dev);=0A=
> +=0A=
> +error_power_off:=0A=
> +       imx678_power_off(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static void imx678_remove(struct i2c_client *client)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +=0A=
> +       v4l2_async_unregister_subdev(sd);=0A=
> +       v4l2_subdev_cleanup(sd);=0A=
> +       media_entity_cleanup(&sd->entity);=0A=
> +       imx678_free_controls(imx678);=0A=
> +=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +       if (!pm_runtime_status_suspended(&client->dev))=0A=
> +               imx678_power_off(&client->dev);=0A=
> +       pm_runtime_set_suspended(&client->dev);=0A=
> +}=0A=
> +=0A=
> +static const struct dev_pm_ops imx678_pm_ops =3D {=0A=
> +       SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)=0A=
> +};=0A=
> +=0A=
> +static const struct of_device_id imx678_of_match[] =3D {=0A=
> +       { .compatible =3D "sony,imx678" },=0A=
> +       { .compatible =3D "sony,imx678-aamr", .data =3D &imx678_aamr_info=
 },=0A=
> +       { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_info=
 },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +=0A=
> +MODULE_DEVICE_TABLE(of, imx678_of_match);=0A=
> +=0A=
> +static struct i2c_driver imx678_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "imx678",=0A=
> +               .of_match_table =3D imx678_of_match,=0A=
> +               .pm =3D &imx678_pm_ops,=0A=
> +       },=0A=
> +       .probe =3D imx678_probe,=0A=
> +       .remove =3D imx678_remove,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(imx678_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Will Whang <will@willwhang.com>");=0A=
> +MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");=0A=
> +MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");=0A=
> +MODULE_DESCRIPTION("Sony imx678 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=0A=
> --=0A=
> 2.54.0=0A=
=0A=
Best Regards,=0A=
Tarang=

