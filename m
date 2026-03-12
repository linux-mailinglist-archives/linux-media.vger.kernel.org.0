Return-Path: <linux-media+bounces-55459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAWPADQmsmnlIwAAu9opvQ
	(envelope-from <linux-media+bounces-55459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:34:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752226C455
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4206030EE3A2
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 02:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B825375AAE;
	Thu, 12 Mar 2026 02:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oShGdH0b"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAA344025;
	Thu, 12 Mar 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282579; cv=fail; b=iQAADEBJeKjphgSmvrcVC49vHWqVa7KvSaXuhg9gGUtAxd5bSImofw8JlACxWuKMHHG+dQBrQ7PH2kSb3UwHDtPGH4Fv4u7+/suMVH4M+o2S2j22/uacNlw6nOlQL7cITtsdcluJ8/9RSwlKh9BGx9EJrgSvFJhIDMv5gQoEFcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282579; c=relaxed/simple;
	bh=+RrF+dN07PqiQ43RPvC7EO+rA8HXW4o3H/fTasbx0VQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bmGcIcRKI5buOR1511S1HCYor1au2YEHpBfrT/6bIa4YGXPU9g89YDBTbbl8dIu1cThQjIBEGjmzDZfqgjmmJQPfNfmdxobygGTj6kyKZVSc8ASgnH4YKMP5D3bky4D1SjaWhIwrv2tbeoSJlMuvvQbOlrGdfc46764mlxMxu80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oShGdH0b; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW9VmKCgIhSFO7t++koJrtbmtWdKNGbSr9712BSLG8p7SXNsrBSovEa2JlMTO3tdoLKvdFIzxsI+Fy3rB3LI8kUHlylL2Pd3t8fNQa00xol8Zhq+0H0n8X5qI3rdgaL11USlGA7ycv764/Tw8SEP/KxtpCy+d3xFRSbaPnShfnrzWdRLTISp2BvGMC+ipucUQX+wywOTZUwuZjCIF9FWlY0Tw0Z2KOzra02MXeR/2uch2EIq+unRkKKuEwUvBXLc7E3qArFi7pEletBDagp9xl4MYaEbGeO80o2z46C7WpIb3ykyAkOaXYnGjAN9rnO9odZcbIaDMuLla0H0hcW4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2lnaQDYPky/RqMMtbeCrXPozBlMGwl67wy/ER1CCK8=;
 b=Ld6e2chYzeNHepArSrJYm/fqezh7waUzyQSe+0bCtORUK9G6I0DjK1IsKGxIkXbat+yWc325TAJ1/Wu8ToBM20pQBATqp6vEL3arD7xKJ/Vrd2n5goU74L1txoCSeTHXQhRWkkO/BBR06BS2vZqgEWoNfUkkyFLsAgvzQc1pc3FLQ/EDtTg1Cc/P30RrtKdRS8LuMoaRu55fx2mBw++fXTf4dtbS4ShFu/ne5yX3AsxANTdGAin1TrBgPUop1R5M7L5DCh9eUYfUeiV5h1zjjTdxVF9TjOP5/7caO9APJnYUHy7mFwuzr+mPIvciCiEuPgqEKRm20KG6yxPcJVF8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2lnaQDYPky/RqMMtbeCrXPozBlMGwl67wy/ER1CCK8=;
 b=oShGdH0bIPOJ+BUb12offSyR2oikFOYMOxDrpbGsMtf7RUeIH2Q4ksdSOdg1GM43Xq5BaKfFr3QJ5hHNJpVuVWG2sdWb+feC4wwN85ZBggQVFlAVRi3SjhFtfJOhp710cEBOkEI4zHBo/v+0HOIbvh/TczOJLsuZRs1UmnmYECVC1/9rVyZKrFd0II1/58Zq8BNyVh/NzwrO5TXWnfMkIQMl6RXlGR+7yqFe+Q2WYKCP9Jep0ZcVnFGeXAEZja2Qlgxr31BJYbY3ADM4nG4kSSUMYLYAqsaQyR44x8pwOb6CW9toM1gEDqvtT4sgcgf2UxSvZoNFW6hnszsZZXfPOg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVUPR04MB12424.eurprd04.prod.outlook.com (2603:10a6:150:345::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 02:29:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 02:29:35 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Frank Li <frank.li@nxp.com>, "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alexi Birlinger <alexi.birlinger@nxp.com>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH 2/2] media: nxp: imx8-isi: Prioritize pending buffers over
 discard buffers
Thread-Topic: [PATCH 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Thread-Index: AQHcsS0/+HczSjdtgkShfnlaMsnlsLWpdoYAgAC3OiA=
Date: Thu, 12 Mar 2026 02:29:35 +0000
Message-ID:
 <AS8PR04MB9080DD294FD5D4C7AA20DB77FA44A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-2-c9299d6e8ae6@nxp.com>
 <abGLVqeJ1C4_Fyhb@lizhi-Precision-Tower-5810>
In-Reply-To: <abGLVqeJ1C4_Fyhb@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GVUPR04MB12424:EE_
x-ms-office365-filtering-correlation-id: 401e01bd-cfa5-4e37-e2b0-08de7fdf3395
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Uk++zZO3WrMwAspHL6CUFVopve2uvQlC55w4jlIfmrnSVp1OJWNt+IEO2zgmK0XuYqC8dJWgSSDVbRjk1QbCd4iuz+vrzFm5FcOjO3osGCGCXL+GEYRkE6tVHBTf00XfhZ8f9SHSoBxRw6tBf+pp0MPIRg9/KCjoDnDxlpuX4cM5KgtQA/GYc1Ev8UjqrK+7aIoWNZDqVRl0rj7nOj+Ua0iYrk0HmOb5os79roj8hpFMv5ik0pYe/kGRF9a+gg6gE2b/sqWM/daYQge9f+P8c8UDN3/lcV+bkOoGPzzoLCCJ6zZpMVq69kYgYVa/3x2cJE3/dhIUAKccNfiF9sePJocTLZn8DJGD8W0iAn46I3vr7r/e4rdPbKYZOi1W+JQ3e5Uw5rrdHoffzJ3NKnKBnKBjDEbYxX7OmBscyUjW03CH3da5OnaGs4ECcMa3YgW/aj5XRO/5d7ILIuxLC4JIiXtxKAEWpTvKW8uV/v1GAy/WRa1xHehm5TinmHtJbKOgxDtR5lvAig6p1Nm7ThLWZa18hDWbWe9o1cS4JBmnN3F3eCh0VG/6Lin5lxdvpU1+68h0x5/CL2HvvgAr5blwQrvs08+fT1TDq+adWs0kYfuI1BLNIBf8CTlxykohcf0fhzHjPlAV/lu8a4u9BwEP2z9ESmirvSGkWhrtz9ri59JF7eqVKJT8F9P3B6uHQv7wBprWX/IRQd01+mozvsRqZz01JYwwfAqUxQMorBPlX+Mw+kY9kuRUT+qDaFVbSDIdCv/+EZxPeTSWKpkdYnBoQtRE8Y971gjVrPCs52u8yN0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?b5QhHrJ8SkFErkHFM7AITs88WwJOcY/FoajgzOKmKhyDY744ZEZMdc4gxw7A?=
 =?us-ascii?Q?Loy3mYm+qmZDjJAh0f9euz5rtb+0tWP2ECwg/0NQ8i4Ne7EM+MSzxwBO0n2K?=
 =?us-ascii?Q?lb/E48TpUgtjpN/x9MSiRqdFkIm/EpCXEYj2+BuWtSBWfQlGtflP0QCC19er?=
 =?us-ascii?Q?/b2MNGGy1LEKNwCFLE+rm0/jw/r46YWkztNpPgh4AUQMk8op1tp/FcAbv0xg?=
 =?us-ascii?Q?VJJEmXw3UuwxdM+lvn91Hm+dzb2beL7FwWuqFr7KBuRC0HCLnkpV1/mGA/Gk?=
 =?us-ascii?Q?04OAKVQKvrxio4/E9k3HPwyNeHZ9tqPI/NISmlLoxVsbQziItybYbdwaSuXA?=
 =?us-ascii?Q?MZpMSflgPvq0emR/dzNopI2TKy9IZueD7+aeM08Y9H/seLGbyXwAOZU73BHz?=
 =?us-ascii?Q?nSCbTNO7ylG9YREGuJIOztbhsczMUZrcx+1cm6dKyBrm10EQm6NzMvH0iafi?=
 =?us-ascii?Q?ZCa41HzSNPMZmV1Z+lbRUPMoDVaBr8s4+cz7T4B+ug5a/F6em+xVllgvIgB8?=
 =?us-ascii?Q?OO1QTuDjXPpK5o0ar7Qmdqge00iCk4ekepSBU2i8xTeautVKVWGbP2hflh5h?=
 =?us-ascii?Q?vizs3P6Wvb8SKiSKVJXZuuHZyzbwfi4D5uQ/Om3aqWBueslPwxxh8lrGJpuT?=
 =?us-ascii?Q?yn+SJrnxB/tatoiDgp0QiV6kkrEVS9gq3fS4C/4HLxej2PDb/0ikZisGAcUP?=
 =?us-ascii?Q?z3xSLCBNrLnyXi+idM4Q9XRp4PYQEvaMezo925YDXUKi9kWxuBKHt1s+gZf3?=
 =?us-ascii?Q?fLaVz8oYbJd3PQzRZVngnBt0TcAtbU4xcmBRMhw9DCotyh4l5uYJhVe9UQjH?=
 =?us-ascii?Q?+uWBh+P2QqZflCMOO4NxCDZyRdRYu3IizQSlt3zirP3qPuuKor3RyXoz40s+?=
 =?us-ascii?Q?zZPeQv29j/yw70n3/ayp0BgklO2cWuV4sTSebYxZ4ktuEZubuNkZLX8WAffT?=
 =?us-ascii?Q?+uUssoxQeP3NzRN1Uvh02XCPAsO6R+r2gyLyak+/h28csJsWy9Yhkv7Hhb03?=
 =?us-ascii?Q?Lo9IboLMg05yJ4rVj4SsvoGENs+MaO+VREPHzXXpEB43Y4VMzMVBNvFVaPCS?=
 =?us-ascii?Q?SrVN0VQUu6jw+VMqJAo7HEMJyeJ/VSjXrGTrob1m1X+nVA4fTVk0pulj6R5x?=
 =?us-ascii?Q?WaUs4mfPg1GSlQOIDPRY7OQ1MF5gk2zSJA4dGec7g7Rswf4zefk4yP4ZG/uY?=
 =?us-ascii?Q?kHxs6RqInC8a97zz6RBkSJ9XSB9wwj4Ss3p7FdsImbNNcq05I61qusuS1EXv?=
 =?us-ascii?Q?WRt3yNSAASsrvTXobSiEEl2Lk1kepqkjrxJBHY3a/tvECbqOFF2ou8AeNuEA?=
 =?us-ascii?Q?yyV1EEuKFctxqajgqWt1AEDU4PXfH4gWjKTQxp5dBd74N8BTDfsTKcwUwOVR?=
 =?us-ascii?Q?Z6ZqtnX4+QAwb1FuQCQnFuFx3FVla51rHlqoOAHA9emAbBMLYRMCZ9K+6R8Y?=
 =?us-ascii?Q?HsttSK7Q0QJJwX2jZuwERbjoY4Lapfim6vyiKackS5R6fI3Q+2lBlc9MbnNv?=
 =?us-ascii?Q?/SlEfZEfjTda6zdWFellO8RoqW0jsboL/bMSN7HjB0IDDg7bl3hz0luxwFC6?=
 =?us-ascii?Q?5JSvpmE2ksG6ZwD4ijcYswWZf6Da3alXjFJCL0DgNJGtF3FGJyVSJZSToeJ0?=
 =?us-ascii?Q?MytqcrrzJlpSt9Yhpqw4Pea+ZIjDTFAZqtr5DcqhnRrlByDUASrl0t4rqklL?=
 =?us-ascii?Q?kP4sypzEBaHL1qLqpDptK2MfZ33tCNUgxu9UkC5R7HwT5pX0awWBEdv4CFHo?=
 =?us-ascii?Q?hHzysGHyAA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401e01bd-cfa5-4e37-e2b0-08de7fdf3395
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 02:29:35.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AH+pbnlrdqCYyPI3vJCrjodFOL4XD6H6G5XKhOXGh92VvzkRMREX1J4QghvWenQnkbbfN9+DWBoIsNASYust4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12424
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55459-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[AS8PR04MB9080.eurprd04.prod.outlook.com:mid,nxp.com:email,linux.dev:email,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 5752226C455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thanks for your review.

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Wednesday, March 11, 2026 11:34 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; linux-media@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Alexi
> Birlinger <alexi.birlinger@nxp.com>; G.N. Zhou <guoniu.zhou@nxp.com>
> Subject: Re: [PATCH 2/2] media: nxp: imx8-isi: Prioritize pending buffers=
 over
> discard buffers
>=20
> On Wed, Mar 11, 2026 at 04:02:59PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > Change the buffer selection logic to use pending buffers first (up to
> > the number available), and only use discard buffers to fill remaining
> > slots when insufficient pending buffers are queued. This ensures user
> > buffers
>=20
> Nit: Ensure user ...

Will update.

>=20
> > are utilized as soon as possible, improving efficiency and reducing
> > the number of discarded frames at stream start.
> >
> > For example:
> > - 2 pending buffers: both slots use pending buffers
> > - 1 pending buffer: first slot uses pending, second uses discard
> > - 0 pending buffers: both slots use discard buffers
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > index
> >
> 2405baf21594cd18cf2b349234313c5e103b7802..53f4f74369f7855fe6b6f372
> 294e
> > e569f40a8ae6 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > @@ -786,13 +786,14 @@ static void
> mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
> >  		: list_is_singular(&video->out_pending) ? 1
> >  		: 0;
> >
> > +	/* Queue buffers: prioritize pending buffers, then discard buffers
> > +*/
> >  	for (i =3D 0; i < 2; ++i) {
> >  		enum mxc_isi_buf_id buf_id =3D i =3D=3D 0 ? MXC_ISI_BUF1
> >  					   : MXC_ISI_BUF2;
> >  		struct mxc_isi_buffer *buf;
> >  		struct list_head *list;
> >
> > -		list =3D i < discard ? &video->out_discard : &video->out_pending;
> > +		list =3D (i < 2 - discard) ? &video->out_pending :
> > +&video->out_discard;
>=20
> Is (2 - discard) the number of pending buffers? put commit's example as
> comments here.

Yes, will update in next version.

>=20
> Frank
>=20
> >  		buf =3D list_first_entry(list, struct mxc_isi_buffer, list);
> >
> >  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs,
> buf_id);
> >
> > --
> > 2.34.1
> >

