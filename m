Return-Path: <linux-media+bounces-19988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A25229A6450
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31A61C20AFE
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138441E882A;
	Mon, 21 Oct 2024 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Cr+Qzat5"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8E1E1C11;
	Mon, 21 Oct 2024 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507191; cv=fail; b=AVlW2vBBOuEJtO9BV17xFIgwXhJGJe84KEuMZ70VAGsgBNkZ36dA7t6ISjQXCd2XkcPnGid9yLZCcwwAUGboBaSZf3z8nXrWxC230h6lr3L+H95yEkLXls7C4524BnY+wo9aRbZLUm/fYcnRjiT8Afhcboao9ie1ZGIRT5eJt50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507191; c=relaxed/simple;
	bh=95RpqVFOIXsvM6VXWwYwRqwNrUM32pKCALslL7if++g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hb0InfAYGxigP0e8SnJg6x0mW7Z6sOmZEsuY9wWKhEagCeIE/PMAg+MncjKjQi4Soj+V0OyuPyQN+qKo5NnUiBrN0aDuamXKhJr9m7wysHAV4+hFBQqe9dgnXHZKTaniQn/7PuNPb48g8O7qa8rXbuZuykkKSg5X7uAtKL0775U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Cr+Qzat5; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHj698Z2YY71icFLC2cr1EXjNn2MpoXQUseBQi7/GJVwHBhhGwPaKe3xJxNUPknPoWAdJhnGdFxXJWEwhnSCiRlVgY5pfpWFleHYPN6f9kCx6E1JG/wQIyZ8O4MvOSe5FTCnU2auILdaryf2VpXbodF/tw4Hdhcg7CU+fG0x/JwvF18gUkdZof6JSUfN06/TIN6JqPOmRtbsBMNmL3rf99PIaURbviABy80kfyB+QXjPqFQSa27CdpVp9Ku5cwDQh+cTrFXQOBznUy5KFK++531Ffevf4ceT7MoSxbNYGsKOHkWOr6xWqf7meeYaru/rfRTQrR8lbItnoX9WE5Om1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95RpqVFOIXsvM6VXWwYwRqwNrUM32pKCALslL7if++g=;
 b=t2FRqDeWpTbpRN/nxTG7JGlEUgRGYp+snZHdAviuIKUwCWJmUkKBMGsJ8foWf0cUXwGdttLLJ0VUbYHRCM68F0UD7qoETqoNCXS6QShMeD8CH2BxYoG3w9ZpWLRo840bfaw/M+e+iZk4pnlSdQKY8w558EtcTn0i+l2ZE9jvIau6EeSNKcRaXq8JUec1UeFTAmfg6ADdfegE5LdLA2P+qD9/mhNidCkND9rQF+2U1bxlHzKXFL9FQ7txmLEVCdxVXFQesTicS5UFQFsM5c9TsXphqowyK5ZcRI3RlRHG2Yapntd3l8Ilp7DT+9oelZdIfB7+RQPoodsh8Yblv4MEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95RpqVFOIXsvM6VXWwYwRqwNrUM32pKCALslL7if++g=;
 b=Cr+Qzat537UCtKGWJ9CQeY7ynx4ta8YooeB9tRIldfN7sDfzR8YX10URbYBJL2CZQUJYnNh4X2sXqYsUs8dRu9OrL2IQ8jyTPLB4rkExS29cpYOiFTlQhsXRf/CMO0qVy5cj8aB+61Y7trInl4VoP2bST8oQF2UJZHx/Bj2Ac64=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB12033.jpnprd01.prod.outlook.com (2603:1096:604:242::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 10:39:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 10:39:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hien Huynh <hien.huynh.px@renesas.com>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Thread-Index:
 AQHa/4Vayw10oWeJKk+GlBZb9vTbq7JLcqoAgAB+MjCAAKfvAIBEnfRQgAARbICAAAOesA==
Date: Mon, 21 Oct 2024 10:39:42 +0000
Message-ID:
 <TY3PR01MB11346B60BB61CD7BE4FBE605E86432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
 <20240906235948.GH27086@pendragon.ideasonboard.com>
 <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240907173232.GE15491@pendragon.ideasonboard.com>
 <TY3PR01MB113462B9B0092FCD5238A1CB286432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241021102553.GD31131@pendragon.ideasonboard.com>
In-Reply-To: <20241021102553.GD31131@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB12033:EE_
x-ms-office365-filtering-correlation-id: 7a99b3bb-b242-4503-af30-08dcf1bcac4f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHFFQ3F6anhOeTd6MDBtSmpPdXpWVFNHTEdHS3BRZmE5V252ek5YcVhoUnpp?=
 =?utf-8?B?Y0FUWGVJVVI3VUx0TVFFRVFFUGVUZ0NvNnZ1QkplK3Vnb0Q2WnhGNTcyWXlN?=
 =?utf-8?B?MldqQ3ZCU2pKbXFLOUtselV5dkVlblZsc0lwZ3g2RkN2ZGtWZWdqUWpPWmht?=
 =?utf-8?B?Qk12MFgwUitNTjF4c2g5Y1hmc3dINzlSMEk5bEtkKzZEdEg0cmo1aXdUdXgz?=
 =?utf-8?B?d01EQ29WbEs3L0RKR1pkbUswNjczekJaWWhyVnFkd29zRHhVZk41aUtFelBV?=
 =?utf-8?B?UG9DdGZOT0plSmNrblN5eEZyWEFQSnpZN2gyeWdjOWJmdmZGZHZkMFYyc1RM?=
 =?utf-8?B?VUx6OW5WYmRiM3IxY29DNVQ3MzBnaW5OQWtrZmNEOHBLOXJ1NkhjRmVTRGF6?=
 =?utf-8?B?end1NXNudXhEdEdHbFZyeTJ1bFViVHlBVHROa1NsNlBJV1JuM2JTaS9mTVFO?=
 =?utf-8?B?bHg5eVBHSUdJd0xybjBLOEtmSlBZdmx5dStmYU5YOGprNDMxZVhYZGh0YU9Q?=
 =?utf-8?B?RXRsNzRDTlJpTFhZTThxdVJzQUliRTdpVVFMaW5SRmcrOWJ1ZmlidGVNK2Vp?=
 =?utf-8?B?c29odURQUVJQTis0SVB4MzB4MlU1aWw5Ykthb2RoM0Z0RThHdTJ5Y2tRMEMy?=
 =?utf-8?B?K1lQMnQyaWhsaGgrV1A4R09wK1EwWkIyQmFlRkJGZ21xQXJvcmdJUHRIa0pP?=
 =?utf-8?B?MXpEYU5HNlUxcWlFczExVXI0Um1yWmpQM01KQjFIRDhHWjhFT3g5U1FiUzA4?=
 =?utf-8?B?UUJWKytCTnJ0bCtYK3VoeWJtdkdnRGNGczZKaExzUjRvdXJodEozcmUvdGI0?=
 =?utf-8?B?cStxUnJhcDZPWGdZV3Fhbi8vM1o0OW91QmF5cTlxd3RmL1NqcFJpVGlmL1Jw?=
 =?utf-8?B?VDFiSU5CMHVHZEQvNloyK0FqWFF3bmdsKzBtL3M4eTNQMW9zSi91eXUxWCtE?=
 =?utf-8?B?aFFNbFA2Z09JU0M2b29WbkVGSmUrNnVoby9mcDZNZzgwSjRiSEVKaklHNzVF?=
 =?utf-8?B?NWkzSXRmcks1NXBsQWVoeXUzazNWWVQ1czlObjV0U0RhbjN0M3dudDNLbkxo?=
 =?utf-8?B?SDNnczJPaHJRbmZTTzZrSlJrSVJSbDhJM0FLQTYxSjB1QmFDSmRwendkUkdL?=
 =?utf-8?B?alpZY2h5UGpqUTNNTlh2cFgzVjduVFFDY1FsamJKZ2pGRC9SN0V3d3ptWDQ3?=
 =?utf-8?B?VGoxdUxUdGk2SEZqb2t5WEFkd3NYaWZsQ3ZVMXhPU2t3bEdsM2hqeUhUZ3Y2?=
 =?utf-8?B?d0djR3JPQy9VaVkvbXAwRUozMU53UWJtTlVjWWMyeGVlNGlmeEN6MmVvMUNE?=
 =?utf-8?B?a0cwNDJPMXFud0d1bHlqeUhNakJCTC9tZTlNazlFVWRNaXg3cytrVmRtOGZL?=
 =?utf-8?B?dGZsam14bEJNYUhuRzhQK2w1STBxSnlwaG52c05wU2l6MWt5dmtKME5rUkxL?=
 =?utf-8?B?dmJYellhclkxWENOWjEzb2NPODJPSzNTZDlzOG9MaVVlZjRJcmZaekdmNHZJ?=
 =?utf-8?B?cXM0SEV5cUhSQTZCdUFKbE5tdHphazRISFNsZFNtWVdwYjJCREh1b0ltbmVK?=
 =?utf-8?B?bW1Ob1UwalhQVWhkYXA5U3lqc0hnY1VmVk9SbGhxdFN2bHZuSTFydCtzYmEw?=
 =?utf-8?B?YW4rZlNwQzhTTEtnQUZ3UFV1TlRwUlZaazcvNHljY2kvaGtQdU85WXY5YmQx?=
 =?utf-8?B?ckFqVmUwaUdsdWdWR1dnVHRNMm1WTTZWbmxkTHBBVW5OOEFLcU9CRmdsOWZh?=
 =?utf-8?B?UU00Y2ZkbVFGUDVndDRDcGhMUFdYSm9SOHFObDdoY2JLNEFtbzViV24yVUpY?=
 =?utf-8?Q?sU0E4B83kS86h5og/pdHHjP+yXvZf2acCFZzc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajRXOXRtS0RtOThQZjFpdVRWanVYSzU0Vk91N25CYkVVSjVXckJOTWZKUzE2?=
 =?utf-8?B?VElUSjZmaDAyKzAzQTRKKzhnc0VldDZVcEFhM2RlSFVvbUp0Nzk3RXA5aGV5?=
 =?utf-8?B?K0dObXdxc0pkZlBIVENjbmNRTkdyR1dwVWxiRVEzTTNPVWhnYUozTWp5Ykcx?=
 =?utf-8?B?eWdaU2lad21mRjRSMGJVdDVlVmc5d1pBdFplY2JiSWc4U2Jod3FETkVlM09J?=
 =?utf-8?B?L2U4cFRJVnQ4TkMzaS9GYVdxS3EwTVVJYXliU2lUcFNxaXFVNWVpUXRlZ2NX?=
 =?utf-8?B?Q2ZBRjQxL2ZDSHdhVGhBVExFZE5lbVVEenVIQk5qZjdVcURuYmxmNWlBOU5s?=
 =?utf-8?B?M3ZYMG94cVhpZ2JzeGFxOEVBL3FRRGZTL0dWdTdUR1pCZkM4NGpieVNOaWZF?=
 =?utf-8?B?Ymx5cEhSVXl4c28wcmkzWGtIZTlJNDkvUHlBc1Q3K0lOeFk3aDk0b3VkOGwx?=
 =?utf-8?B?L09FSjlZMEpBMWNTTXo1TUwwK1V4SUxDMVRId3RCS0xoNU9GVnRXQ2JEaE41?=
 =?utf-8?B?RWFNdnN4NysyeUNMd0RyYzJucFhla3VUYnlXeWR3M0NNVTdLODRjNFRiUXl6?=
 =?utf-8?B?SnVuT1R3N3lVZE5xSllrdk4rSFlTbHBScVlCY0xYS0dQNlczMVAyZGNUMUJ6?=
 =?utf-8?B?amZ0YUlTcitSaFJwMmdDNTVkMVF0c3dhSG9tVjZidlo3SGdMUnQ4ZGZLMXpp?=
 =?utf-8?B?YTBDZDN4ZmtUWnpHekl2dWsxSnBnd0l4WlpGbWIyVDYwRit0SmZOV2hqQTVY?=
 =?utf-8?B?V2NIeDdxcHFrcVM3MzhtbTZnUWk3VVlRbEJ4THpVNTF4L0N6UnZPR0NrSWFG?=
 =?utf-8?B?U0hiT3dndFZJT0dvMTNtVmxnVWNjTnhFeW5HeUtoR0VydGZ3ZkJndFMrby9C?=
 =?utf-8?B?aFpNWkdyMzdidFNjRDgrUlk1d3d0M1JDSmg5R3VjU1VaNnBnTWcweXkzOUd5?=
 =?utf-8?B?M29TbVdlNC9ZTFp3TFNQSm5HRzBENit6bzVpNWFBRGcwaWIzVkRnekVYdFF6?=
 =?utf-8?B?T2c5c1FtTjhWMTNFamhueTB5TktpZlQ4NWM2ZysvWUhwaEZhRHVUZzBxNmV0?=
 =?utf-8?B?VDNnRjdnSERaQmFHeHl6Q2d2NEJ2SGU2dXMxbTZidEpJYXFoZkxsVVZqOFFy?=
 =?utf-8?B?Ni8wWm1mSlpYOUZMNDJ1R2dSbVFGWHdNTUZ4VDlkQmdFbExibVpMK2cyNWRV?=
 =?utf-8?B?RlBaRmlMeTFsdFRIL2o4UFVRNlRwbFNROVdjYUxpS3gydmhzcmk3d1JkUXh6?=
 =?utf-8?B?SjJ6RktQdXJoTjM0YktoYVRyeVhuM1R0SjhtRDVtZm1FZzArNmtMNnM2UC93?=
 =?utf-8?B?a25kMHlHdGxHZGF3eWYrVlI4YlNiUnF4V3ByMzlLZ1RwMXFhYk8reDhiVDd5?=
 =?utf-8?B?d0tqMGtncVpROGhpZmtBaXZHWWZOSUZQejY5TURzaUxVQzBtL3ZaR0VHNktD?=
 =?utf-8?B?djVLRmMvSTMyRDhJRkNDM1NaQWlXV1cwUG5WMnB1b1Z5U0dFR0c5M0lpaHRt?=
 =?utf-8?B?L0I2bTRSL1dNRWhPdlZXY2IwZ2xiNHJhck1GTjRIUmJnUC94aW43MXIrYmFn?=
 =?utf-8?B?eG1PVTN5amtNZGJoeEtSQk5hd0xZSkhrSEFkZTkzMTF3ZWsyMGFnOUhMWG5M?=
 =?utf-8?B?S05JeGc2ckg2dnRabk1jUVB6K25COGoxRndHc2lmYlJuVURTdUozSjk4OEJS?=
 =?utf-8?B?dGlNYlBhZVZ4aXJaSnB3NnBZcUhmZ3h0cFFMcmZLbGpjelBpUHZ4aHJxUHVX?=
 =?utf-8?B?Sy9sR3RRbWZrcUlwSFZ3b2lBMmpPcC90akxJWGRtQzkvSUVVaXpJTnp1ZlRG?=
 =?utf-8?B?dGlZVjAvNXZkZGJpMnkvMkxLQWdwVUkwdnp2dTZtRXNuY3BMbGpBdTJ0QkUz?=
 =?utf-8?B?N2lDV0lSV3FiN1NaZnR4WDVvb1U1TFBhcmFMdzJTanZ4NkR2NU5OdGlGYU1u?=
 =?utf-8?B?Q0VHRVBrTjZHeTBHTTYwT0dRYVN4MmNJd0hQVmczK2lxYWRXcmdSZ3ZnMG03?=
 =?utf-8?B?U2N3OHJQRUlTYVhFYWhVaWh1NGhXdUpYNFlibmpoMW1XWTFiOE5hbHY0a1Vy?=
 =?utf-8?B?U1lCVjgvak9WUDZtaE5pSVVBdVRwZ2ZQcjArb3lBUW9kN3Uzam9QVnFrbXF4?=
 =?utf-8?Q?ZuW3/dYoAyNunHuhEi/g8t8Qi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a99b3bb-b242-4503-af30-08dcf1bcac4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 10:39:42.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZWr8Ig5S/Xy0xN+2xOPpPPFr3Yl120OMoso+PQRWUF+TDqDBO7VYn5/k0vVtnjns69d71M6Efz0liTpZJQ+ljvUVL6FFZVa+7PxR7MpuCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12033

PiA+ID4gTGV0J3Mga2VlcCB0aGUgY29kZSBhcy1pcyB0aGVuLiBJJ2xsIGZpeCB0aGUgdHlwbyBp
biAoYW5kIHJlZmxvdykNCj4gPiA+IHRoZSBjb21taXQgbWVzc2FnZSBteXNlbGYsIG5vIG5lZWQg
dG8gcmVzdWJtaXQuDQo+ID4NCj4gPiBHZW50bGUgcGluZy4gTm90IHN1cmUgWW91IG1pc3NlZCB0
aGlzPz8NCj4gDQo+IEkndmUgc2VudCBhIHB1bGwgcmVxdWVzdCB5ZXN0ZXJkYXkgOi0pDQoNClRo
YW5rcyBMYXVyZW50Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

