Return-Path: <linux-media+bounces-57464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ+FAJsKyGnMgQUAu9opvQ
	(envelope-from <linux-media+bounces-57464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:06:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0334F421
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74C6A301BCEE
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005843A1CE3;
	Sat, 28 Mar 2026 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VwkVf8WY"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CB3126C2
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774717588; cv=fail; b=rgJbi9dhnuEvWv7RUP8HBKkN+Ac4kwoGDpvFO6q4xlFCAzEFI7JazNXJa5IWrrA/qSYiQH3mLj0wWHFPnAd5Om+yOSGK0vmAuLH5CR2Qjm+zj9ZzY5qWkA0oibyH4VnE63hiOj12352SSuxqU07KnwM1YU4JRJ65lGc0kRwRUk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774717588; c=relaxed/simple;
	bh=q4JxqfU81BS264gMvaoJufY6Lo8qwFTFuMtyKg49oAA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NSjuKvGa3974NMXWib9j08PnZRmBHUIdlXejot2eTOHDW5ok0UzlEvBeOQd5GgG3eLMhjCoglnDtq5BTv96dew4vxUcwL9aIeGTFErl+yyVw+3E4tLB3lYEGHFvifZjmp+zczRRWNiU/r9Ke/PWwa4pNK5wE0ZxiMWGpXqM4Pko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VwkVf8WY; arc=fail smtp.client-ip=52.103.32.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vh5bVvFo7O5/xwJEq+OwK/KbjPo+PiQ6mtY+51OnAnSFdWdcQby3Z2ekor3sTtEQtjD/gdf29kjDRrvjtDBn1Es8kKsqm1jL+jAOUPsc4P5CFMIb8BD3/QmgyDYFWRP3gWMxLeL4oQk49KzEr4Me265HoCZa96bOWPjfc5j0u21zSWc3/FKh468oWfQIogPpicujb6NaQe1T2FGDosuV4zs38n8Osi78ND+FfTTQx4s327mGx1BDoFJd87m6X1qMdwSmjmj4Bhelj/u6FRL0Xc/gKfHzZvo5IuPWE7cm9HY84RHWNud6WM4uI8Ypa50dbyPnTpj1hyf/oRy8K/km9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLSL+davCeOUs/v0d0GAhLuUZRLrbdXHEG/Fz2jcEgY=;
 b=K5unC1sarrIHUT0zS5RbrxpasMLAdVQlCqxDw1blfpDgf6oX47o9lo6xYZo+hmFzYH2v8X6D0wuCAIPqGyY6GOVjRSQLfWIFI4Syv/Hkq2R9Fdx5JD0gqDsm+MAchUejorSaJp3gmVP14ztDLxzEeTCSdsYnm2nGC89qH7EjfKLjH9ZreiTnRyFFz3rSlf6ijekqtBTcTMCNRnjaiFU95qfAGUH4QJlln2rqHCpWYGxvdIqVzpK/6J1hFli/w3xli5jxuhAm5aj+W/fNhVS+m+9je3Vkr3q2pSN+AFo5fPEtHkHoAiurbdJfv3UxEmP3wqaOs0frF1u1Y54y+9qEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLSL+davCeOUs/v0d0GAhLuUZRLrbdXHEG/Fz2jcEgY=;
 b=VwkVf8WYQhuHY+mxhswCNfgnzXQ/OrkNvTxGXDoIKEUByTHAIUYYolGr5dXlRmPmZZuWe+egdM4TPW2C6Y+nOX40agPwvr6m74oeuGasIzST6ID0BX2bCxd6qXnb84PK+gzXExE1xi0U7R5f6lo+W1fLI3JIVL4sKVuLVW0EAHFKMyP/QnxOrIIMaMIXwObL7Mg+LQfiJ1fm0/4SFwcS7/p0IaTGvErEVWHc2qIDJi9jPp+VdX9D+/NNUqgELOp782xaaEZw/pZdkEggwD8YdEgcPkt4s0oF7YlUUK2tmuVoEfmjr87hGF6GkPdsxNNkvuyxOzrM9Vlm2RKo+DH48Q==
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:736::6)
 by AM0P190MB0577.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.25; Sat, 28 Mar
 2026 17:06:23 +0000
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13]) by AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13%6]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 17:06:23 +0000
From: Michael Anthony <manthony.nw@outlook.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Subject:
 =?iso-8859-1?Q?Re:_[PATCH_1/1]_media:_dw9719:_Add_back_the_I=B2C_device_i?=
 =?iso-8859-1?Q?d_table?=
Thread-Topic:
 =?iso-8859-1?Q?[PATCH_1/1]_media:_dw9719:_Add_back_the_I=B2C_device_id_ta?=
 =?iso-8859-1?Q?ble?=
Thread-Index: AQHcvUjdLa+AMeRY8kGsnrfFFkF2PbXBGJgPgALGKQCAAFA4LQ==
Date: Sat, 28 Mar 2026 17:06:23 +0000
Message-ID:
 <AMBP190MB267809B3CA21BF6BAD9D07A3ED54A@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References:
 <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <20260326174909.2746696-1-sakari.ailus@linux.intel.com>
 <AMBP190MB2678B1B58D91EE699BC5D9DDED56A@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <4c1742d2-eb3a-4556-b2ab-0a375f70c6cb@oss.qualcomm.com>
In-Reply-To: <4c1742d2-eb3a-4556-b2ab-0a375f70c6cb@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP190MB2678:EE_|AM0P190MB0577:EE_
x-ms-office365-filtering-correlation-id: 63c66169-fbc0-4f4c-1add-08de8cec5726
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|37011999003|8062599012|19110799012|8060799015|51005399006|15080799012|15030799006|461199028|31061999003|10035399007|440099028|4302099013|3412199025|102099032|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TUJ8QfosRqbGFJDGuDYGkEKDEibGJeaaWaqbsuntm4nX79t4NE7rJSkMa2?=
 =?iso-8859-1?Q?3rrWpU4I3DRwwEamO4M/mSz96ANYn43X+bAJGfmm0NLs9JqEIepW02qiH1?=
 =?iso-8859-1?Q?dVurQiNiqfnjQ6BKNsr7378zN8tdCI9+mrRPW5blFz2Puqlo/zN94nZDCm?=
 =?iso-8859-1?Q?1pMLLhbuRX4PSMiJpXo+DhKT2kHpwkjHvFpHxsVgw7D3STCL4XD/0XQ7K5?=
 =?iso-8859-1?Q?kmK0gJzayeA/Tf6XQvRZWtemurlo2p/6hSdGUsA/VTGSh393PZD94wyGkJ?=
 =?iso-8859-1?Q?A2nsALf/fGsnHfuMBKX8kRiAhIBl30LqD24dJp7B9njHHirolTTVA8l+0e?=
 =?iso-8859-1?Q?nVCEYO63g+h2LLNFv/W3oUIxsoMLD6Ms51WQWsF77u+a7vTdFKFVX7zCGt?=
 =?iso-8859-1?Q?xqJlSckj3N3LdHCbi60/LY2+K1HOrwXKYSfnu0JZdZdxQaeNUuEzE/zTDR?=
 =?iso-8859-1?Q?Rmn1gqQT1taxh/3cReVn2vhHuQGgklY+M44hO2tEtHNDfG9Bxf+2szvfBU?=
 =?iso-8859-1?Q?IjYuxYgzc5CnIwRNZFFn63g8gVERmmooBWaBYTQM5f3Fx6wffRz5zfp7C8?=
 =?iso-8859-1?Q?Mrbg4XyskEcSpgco0b8Fv5dGt+yxyjoOWn8e4hODn3AVe46dZLvPsEps6+?=
 =?iso-8859-1?Q?A35lD/NLSpjPe0+F+fks3FVotsX0LA/Az5eSpXXz+cRgup+I1DPrSY2ymP?=
 =?iso-8859-1?Q?KGY7qvCDA0TESNw9x+U0bCSyYWHGx5fj+noDwZFAI8FTbAvvEIoam6B/uB?=
 =?iso-8859-1?Q?I88fn3Ik5GND79JcYcDgVUsJQrcg1ubryvZBV0gj8pu3xldxnbbCVnmqRv?=
 =?iso-8859-1?Q?LK0IAs3E7csxo9SdyGtYuQnGF8+bKkFBLsnGN95pcnaTNaRuDK+PUIBSFw?=
 =?iso-8859-1?Q?f48NcFj5ALpY+oNUKveQGpDC5e0BzArXrNljPb+oWfWdlstnCSrEq3rIHE?=
 =?iso-8859-1?Q?Q3K0kE2LO4ey78Ss12S1qOlZRNgOsoBDYaUwHDyFIS/9O1iAIarpSBSBgi?=
 =?iso-8859-1?Q?ELmfzNCWXrIecz9jBH+rDwy6U3645HUzoNLzsjSWloOkp5xjg6t+dEIwR0?=
 =?iso-8859-1?Q?H5ydEL5hCcjLi1l/HQPyRW1rUz+rD5kSZsNog/+Od2qNuSRX+GfRt8KU6i?=
 =?iso-8859-1?Q?6FLZoiaw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zLQA+UOeq9rcJ1SG/d+xAUjrn6DRCR3e8qxWhRPQkuDjhI4Jy0AOCWOulW?=
 =?iso-8859-1?Q?Yii0pubGP58J+CRYZZDo14pJHTNmFWawakvEJCNBAS0mF1F4vkLT+Rzitm?=
 =?iso-8859-1?Q?+wCUoxxJLmPhikvZfRswmCJ3tJ8rG5Pz5wNSj9SYXfBb7fsjQo2fSu4Vll?=
 =?iso-8859-1?Q?fHQcyie3Mn9la0AWZnIs7aQwKNROZRL9s7Ten5gdczEdv00bol/RL1lWMB?=
 =?iso-8859-1?Q?5cVvR6De8dM+JUAN9dqYSwWY5kB+iQ+WkKA6vo1/ofFhSmPlxm8bsXOarj?=
 =?iso-8859-1?Q?pduXktN6AqnMWzu/u00rjPHfNl2zjgg7k0SQ0d5Xv6FAMqJAQ7MovwsRHZ?=
 =?iso-8859-1?Q?s4+olNuhB6udXifSBWMPE8LIVZbfCwduz+1wdDHNM1sMp4X3djlWb9MP+n?=
 =?iso-8859-1?Q?T4jV8LcOqIwZL5m2oXb90JMyshE+998vdbi49PVGgamNbHvJy0QP9mF8mi?=
 =?iso-8859-1?Q?LcvBDZgK5uW6zX3K+3SWDZzhNlZ0JUMCti0jnngbhDkHw2kY8KU/bk7eQ2?=
 =?iso-8859-1?Q?qOAYQN8EibCDep/vOJQugsgwHPvVtjJr7kvmGYspS6BHpSmKXXpfDHBeyU?=
 =?iso-8859-1?Q?gMdOXtlB7dHGkIipr25alnosWbyb5opnTH8coW1vjZoKDsfmfXNONuoSJA?=
 =?iso-8859-1?Q?ZZd5j9P6/B819wQESi+MPSwDG5pFKcYJGTKR1Euz2e1MBGyDMm6htUJL7p?=
 =?iso-8859-1?Q?nltqDAc171NknjvGUlTtfq4GcDd1azQtY2SJcGrFeYBTXogy+DGcHwMRNH?=
 =?iso-8859-1?Q?tBFnBY/CJemP85Can5voBTbsEN/x3iizZSl1BmdW4RylmzqICCwOaDu8dl?=
 =?iso-8859-1?Q?jM7vOCornAApwrg3kc/V0M7bVCX3LzGvPJS5ZLxnBhsvveDkNDM/L9zsX6?=
 =?iso-8859-1?Q?okA5STB0TZ0vGWsTmJi/5zWDbLAKhHGsiNB2i9/VbP5vHRjj+1+hinQ+Ap?=
 =?iso-8859-1?Q?3HpJtNG5SZobyyDldgQZpzJrtK7qJeCuBlH80vxnocqXVltfqt81VBXMjP?=
 =?iso-8859-1?Q?guq/o9bKOPWsSwYS1tHczE9KrsIs+Qf4Td9pIIQUAFBgHP7tSmhIWkxPXX?=
 =?iso-8859-1?Q?JQh/OEq8ELH8p06bOi1Ljq2hYdjTz3rCm2gpT+0MVxU4zhh4+0bdktrHXY?=
 =?iso-8859-1?Q?CFbURn6oXorrB+rB8RSajBh8i0ivOvKc1vhuUAUAkGgWvWo5XrQXYsDf4b?=
 =?iso-8859-1?Q?3JW6HF2oC6fGMA+sv2ytfZOraNbzmH0tdJLlDZL3y/6WkJMabHAbEFiLET?=
 =?iso-8859-1?Q?ku3Z+JDp1ElRZfLpOAn7gtdfiXej1vPGaMdqWbmN7E316gKCWUcrwPtPwO?=
 =?iso-8859-1?Q?vYP2N3WKAfscyRIKNg0L8NftpDjlJ+J8NTbmvrVd2ORyWmN5DDXeOZi5ga?=
 =?iso-8859-1?Q?bz3oeA0vBsa2zkgjWoKP+pjd8TkMWWAcmIFo0diaPiVUNk2s97yUGvsnqx?=
 =?iso-8859-1?Q?ToTbPYUBrr2xetahypQEzdt0KUk3SFNqGV6dgd1Vv99hCLXH12cFPoaUFq?=
 =?iso-8859-1?Q?kxULtSQvx1KApm9ITVSiZG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c66169-fbc0-4f4c-1add-08de8cec5726
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2026 17:06:23.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0577
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57464-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manthony.nw@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:email,qualcomm.com:email,fedorapeople.org:url]
X-Rspamd-Queue-Id: 44E0334F421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans

I have installed and tested the patched kernel following your instructions =
and can confirm that this has resolved the issue.  Both front and back came=
ras on Surface Go 2 are available again and produce an image.

Thanks for all your help.

Michael

________________________________________
From: johannes.goede@oss.qualcomm.com <johannes.goede@oss.qualcomm.com>
Sent: 28 March 2026 12:16
To: Michael Anthony <manthony.nw@outlook.com>; Sakari Ailus <sakari.ailus@l=
inux.intel.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>; mchehab@kernel.org <m=
chehab@kernel.org>; hverkuil-cisco@xs4all.nl <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/1] media: dw9719: Add back the I=B2C device id table

Hi Michael,

On 26-Mar-26 19:04, Michael Anthony wrote:
> Hi Sakari,
>
> Thanks for replying to me.  I am new to linux and not sure how to test wh=
ether this fixes the issue.
>
> My report was based on this being the only relevant change that I could i=
dentify between the working Fedora Kernel 6.18 series and the Fedore Kernel=
 6.19 series that stopped working by searching through the history on the k=
ernel.org website.
>
> I have reported the bug to Fedora as suggested .
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2447694
>
> If I can provide any information from my current working or not-working k=
ernels, please let me know.

As I also mentioned in a comment on that bugzilla:

Thank you for reporting this.

I've started a Fedora 6.19.10-200.bz2447694.fc43 test kernel
build with the dw9719 patch you got from Sakari applied to it:

https://koji.fedoraproject.org/koji/taskinfo?taskID=3D143771571

Note this is still building atm, it should be done in a couple
of hours.

See here for instructions to install a (test) kernel build directly
from koji (Fedora's buildsystem):

https://fedorapeople.org/~jwrdegoede/kernel-test-instructions.txt

Please give this kernel a test and let Sakari know if the suggested
fix works, then Sakari can take the fix upstream.

Regards,

Hans



