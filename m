Return-Path: <linux-media+bounces-57189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBgKHqn1xWkjEwUAu9opvQ
	(envelope-from <linux-media+bounces-57189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 04:12:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD99F33EB1E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 04:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB715306DA5B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 03:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877AA356A37;
	Fri, 27 Mar 2026 03:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eE+SWqEz"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B3225B305;
	Fri, 27 Mar 2026 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774580833; cv=fail; b=hb2MMrPNEZl8rxMHij/whJ+zStJeKPXa9gzUXEd3Xnq9hG6oW4Xf0KrpDxXzTMquBNmmNmop4BByDvwMJQm/yuo/ReIiTsLPOO0KmaYHI3BEGPNSHr8QNX6VQ6AgoVPRXXezur+/WDdqWM24ZZ/GP/OBPWFjaKDnbq9c8zjtkpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774580833; c=relaxed/simple;
	bh=9hG+txnaAUiMb8qSkAKlkTP/NbMZZVEv/Q81uVoJRIE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H7oXUEnsTPXBF/fU67JtDJOsD/6bNif43RVdv3V0oo3b+eGFojhQJaEUbqGlK/Jp0AuM51Kwe6CMiYsiHPHzC1UGBOXaKbl2+rNgT6/cAdJOK0YaI50tE44qasET5vx8zpdMwCxo7S55nmqQg5coENb9tSolPc7Z8Vkkozz3eu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eE+SWqEz; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyRDP5HmvHX+ebt8hcYj+55u6tQgloe6kZzcAHd+mWvrRnsxvDjN2uzvSxksgj5aWIBA7oXtZNbWWrY5d+Gq39cqGTG/BqXu1leiVJ6/dZBo08vRMPSrJW4ZbWKwae0Uc8KPzeqH6rDOog1tOooDHwHs4o5IxZnCEgDVdvLgdNHAu6DJITDm2o1uHWE17rJwIfkrQvI/KyZWOlveiWt4kwFHfAun6i3uSyEZTeGPaOqhdTaV71QH+VjwtK5mYRrPbTIp2OOne6N7w6LA+wVy3YoXEAaXBG/hOSNhf23hGAzo9E9jk8yw3q+DiEi+uCVNmuPBp6Old6ynXYYOSxXnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP22zalGveD8D+QLzfkBajycGfyS5M0r3Vss1T1w+r0=;
 b=g2TxQt5K4uzVsuIQn+FLYASM0ycILaGi9M3dcolcI3rGnahUPDaDE6tpIWLGcVFjxlf0n48KER3524K/pIbch8gwVZPke7YfWj2Ae3TgaGWMJw31WYgrvzmWZ4PL87zrpWZUsW/7NAsiw0HvJsRMdsSBdIcXmHklpJ5l2mb1uR45HMr8zfULbh8S99V8lTKTxwammkteDWUu0JnWO6JVcdAQjVJkISCTHBq+ItjT18wwZFnVZ2+2GEWwTs/EAc1S03yBaMMo3h/DBb+Y6Zniy21KKrjW94huCutzHmSZwwB/1xRg4l4WkS/5AWXeP9VwQ8pAppwpm1K7ura7gyUP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP22zalGveD8D+QLzfkBajycGfyS5M0r3Vss1T1w+r0=;
 b=eE+SWqEzNG2ZXyPTA62NsriwaaqOVB891rbvX+lUDFjKcsXCzOeZF0nm4QKZYinfPgPMgNVuKruFRn9fD9sn4/iuEeFGrjVGwolI4sMZNxWz2vhMfThbtj+eyrMx+QKXmzPdzPool3jbDYfQmxVRkVHGjkmAjbAOsU5sd9ohdRjNx7EDPatvPURnvhYCFb87VLhlH/VOyF5YaCbVUb5o1ngswGaV0p0I7SBbjpPC3CMzCZT4lUYrc47bgHb9UlfuJ2SEWsRw9E9R7QuOS1ClHQcMJR2d4WafkZoMrPxV7GpFSHuK+7Jd1QXmok2DsBJ64vxp7+0jz8mAtpWtNcdzWg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10983.eurprd04.prod.outlook.com (2603:10a6:10:58c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 03:07:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9745.022; Fri, 27 Mar 2026
 03:07:05 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Frank Li <frank.li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger
	<martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: (subset) [PATCH v10 0/5] Add MIPI CSI-2 support for i.MX8ULP
Thread-Topic: (subset) [PATCH v10 0/5] Add MIPI CSI-2 support for i.MX8ULP
Thread-Index: AQHcZcaHNbokVTIHB0mQTLv9vjDhgbXBnLkAgAAKXICAALmLAA==
Date: Fri, 27 Mar 2026 03:07:05 +0000
Message-ID:
 <AS8PR04MB908006F414F7D360B5F553C5FA57A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
 <177453839102.4969.6512848643800500076.b4-ty@nxp.com>
 <acVXhxohG8RS67_U@lizhi-Precision-Tower-5810>
In-Reply-To: <acVXhxohG8RS67_U@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DU4PR04MB10983:EE_
x-ms-office365-filtering-correlation-id: ca9491d5-f783-4037-411c-08de8baded1f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 JfE9Vgy59iJ5Ic1HOfD2eeGjJo6s1fCXnE8OEM7QnPOyWe66Jz2FBDe+C5crky9iU6u6txNQRFph4FRjYc6WjhdSIswg5LEBilshFtAXg5jKfXp8MvfPyXW/f2u/aNYuFxvS+82+HfGKEC0ljGRXYrKoD9PxGKwaNt7LP8OX1dcbatwf/qSFWCZxSh1g+v20uigwgIhrvxLc8ie3bTAezZsehwcjRgP1lQLV75BRLoc517w6mCEcOvIs3Ogh1n1iXmoL5x6HOEkZMt0nAOk+3EwwJepGNE7IcIYe8On4hRRe024VobVkMgXe24aZfq7eMt1Cc3tSlVln9z+NOo/m9/jEC75jl8hFVWp0EqA3vDX0gIXzUchzD4JzG904xt1zumRgqT4JCxVBTRSPB8NYnaL5B3BZ4Xh2uoIdzj38RqhAYEd82xXlGVAk51Poh1rhU6nvdoKa70OCSepBBwd8TICU4QJDn7IPC+OuN55Yx2JqN+94xA1u0DCd+oYM/LgCb1PIqJo96+YEr43quiA6dgkB8Y6sLFOKS32okN87lbsOYNERpd9WeFacpwc6J7naqSHzErgcwLJPwYJVhq+AisjISk+W04NW2eAq7JgSC5PYoqkI8p1q1Evy+zI4kc89meY9yuHuFEIa6ZaZ2WfVmrLxIdO4VqQc+n+v5n7RO0Pl1dfwnD0hZJy3Nv/S5IGUsEK/HJ+8M5oINyHfB9iCArkyzOosK00++MbSMyeqqrGd1AZNqf++C1MuVv0pVnA4Pkz3dk1fP2Yml1Nue0C3O2A0G4w1QeBGzXkPcoZCZA4j5oRFZxrXtzxXGd+MQext
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ABXLLnZgKQyL5/26PKGRsqMyhwwglRjlAqgrxg5DILTI3fvmqVn/nTuhPOwq?=
 =?us-ascii?Q?i1xVzFSV/l3a0l0fObPPyzWcNqJ2G6BmM25BY7sw5D0ThD5vQkecFwjv9b/4?=
 =?us-ascii?Q?EN1KzsYoLFWfQ+8mBrs53VWL1uidqCSUT0/JQAoscPy8lhPQ79TYFy1Wtloc?=
 =?us-ascii?Q?UhZFSnOkxF7sIHH3iQTWDEK171vzwFzdyYQWiOdnqa/Qgeb/RMuYQOkb+mRH?=
 =?us-ascii?Q?t9/p+X+ZUBFijxJBIWeDrSz9Pl6hFVbp0AnFhOSHg+R82+BNvfin4jLqeeVW?=
 =?us-ascii?Q?dSg9D+iaEXu+rti1g+1qfBo0Yg6m4zNzwNXRvsUa/uFOm3N5GARh5ZQFVAJZ?=
 =?us-ascii?Q?TBLHoqdEC9cgCzudSBObVkgE4EEi+SVSIx8qVogQGfNjRMxlr7k+H68/1zS9?=
 =?us-ascii?Q?GR9/Xs8MJU8z3t9ZJVxGnQeC2/NGIKbFzvLCgWDcqyjH/kfvDuXG1v6EotFP?=
 =?us-ascii?Q?BmG8uFS97+PPtEUmUUlckSr82iKqg5Jbqc6pwpgTNrgi14/u5Yv/qzcla0Q6?=
 =?us-ascii?Q?h4zvDqpNm5UxK2/baOsfUx/jJc4dWeETGSK99LaspF92uXb0brrKjILp8ToH?=
 =?us-ascii?Q?CaGXYoGedyFqAw+JfGn1JE3PTKPGp29YBYcZ+aDhyK6HY2mig9YyFPh+Mtnv?=
 =?us-ascii?Q?o0nWSYFTfR/xgIP50LesysKclj92zsr+BlBYGmR3+qPJx1bN7MRe3jcqtPFl?=
 =?us-ascii?Q?jh317ygsckLjGd6TL7WMHBbXUw5PGS4ZZc3r+th+eOsiEt4v+7edMNN1nQmo?=
 =?us-ascii?Q?LWzwltR/448+gaceL6JPywzXW7Gpf6l2MJr0KDfzrDoLOvvF7BlxjUIrERfo?=
 =?us-ascii?Q?H65RjzdgQAgFBK9SA+3GycvBQXCaYO5Lhh1YM/lE98thUySYEAX+pcVpxwGI?=
 =?us-ascii?Q?mB+Dh+HhXG0QirGFAJL+vSxHMRWi0BT3bEltMxlOBX58xaVQIZLW7S0BLfCQ?=
 =?us-ascii?Q?bOwswF/w/ZSdO5dPAjpv/r3qu1yTX4HcnNFPbaqicRhjf9h4wPVqChc+4381?=
 =?us-ascii?Q?F1mE8Mvy7yzRA13a0ygsOPkpeagMD+jHkxFwZvWOFu6NTmr4FYQuzSGlarl3?=
 =?us-ascii?Q?tL5Z14VNvO0iJfRfvaAj7n1M2xEuiiY95XFksqKVcHrz9OMOtRjObuhBUatY?=
 =?us-ascii?Q?a1Cv5n6Zy6lpbfGhCQ2DmYWqIlOk1MNrthHeynozAeEKzEjKMRVGq+N19Kl4?=
 =?us-ascii?Q?Vh6F3dzvdMkO4B89EJuYAkkvVNol8WokbxKmh0Q8tHtpvXRkywIcmNCf7C8D?=
 =?us-ascii?Q?5aSSqCdJ4Kzf2pf0mwyeXzugzvY1W7AQJTkCQb73L2OI0hRNdbaGICTjjnjF?=
 =?us-ascii?Q?/Y/usdJoI+XMNs5v89wCXjpSmZ2IAv+R6NrOYtT2uxbIxuZVkM++LBZ88fGD?=
 =?us-ascii?Q?AG+bx7ktadoQ8Lr9YiJqcXNYuCokzJHC2Sx9zLzlUMMSq9Xs2x8JChG04Kpw?=
 =?us-ascii?Q?UwegteogsjjkgHCkrS7IapaNJId0ps+aZoYicUdyXkjtI1jzX1ROe/Z4ZwH4?=
 =?us-ascii?Q?16r9y8aGIdKuC77zk2vHxNqCgnkAwJbE3dahGX1SduLxfrFSjpxqolo8nZGN?=
 =?us-ascii?Q?JAkT0xgnMeQPPXGwrbD6g+AsVj5xpTdZRJk7/VCXy1lmlGXrttQJmco4/ul5?=
 =?us-ascii?Q?HUOhGjhAAoocdSqJgsujnJIyHA3KlyEmw7kH1y8mgQBPF6tOzoSo5b/1+az9?=
 =?us-ascii?Q?jDldIZl89vwGm+RNw8T/KjQMVQCY2QPiDtAfBFLlvXf56Yh4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9491d5-f783-4037-411c-08de8baded1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 03:07:05.6674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sE6Ji6IFXW+UKB1LdG2KnyIrML9D3UoiEhlTXo5eVkSkXfRfi6clozsumQGuBlSyT6SwQne4d72cKk+a4X01+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10983
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57189-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,ideasonboard.com,posteo.de,puri.sm,kernel.org,pengutronix.de,oss.nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD99F33EB1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Thursday, March 26, 2026 11:58 PM
> To: Rui Miguel Silva <rmfrfs@gmail.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Martin Kepplinger
> <martink@posteo.de>; Purism Kernel Team <kernel@puri.sm>; Mauro
> Carvalho Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Philipp
> Zabel <p.zabel@pengutronix.de>; G.N. Zhou (OSS)
> <guoniu.zhou@oss.nxp.com>
> Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Conor Dooley <conor.dooley@microchip.com>
> Subject: Re: (subset) [PATCH v10 0/5] Add MIPI CSI-2 support for i.MX8ULP
>=20
> On Thu, Mar 26, 2026 at 11:20:54AM -0400, Frank Li wrote:
> >
> > On Fri, 05 Dec 2025 17:07:42 +0800, Guoniu Zhou wrote:
> > > The serial adds MIPI CSI-2 support for i.MX8ULP.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
> >       commit: 73f3ca0f85285b2fc4ea05affb9a44bf899cd595
> >
> > Add extra empty line between reg and child node.
>=20
> Guoniu Zhou:
>=20
> I have to drop this one because miss <dt-bindings/reset/imx8ulp-pcc-reset=
.h>
>=20
> Do you miss some dependence?

Thanks for reporting this issue. You're right that this patch was based on =
a=20
tree that still contained include/dt-bindings/reset/imx8ulp-pcc-reset.h.

However, Rob's recent series [1] removed this header file as part of the=20
dt-bindings cleanup work. I'll send a new version that addresses this chang=
e.

[1] https://lore.kernel.org/all/20251212231203.727227-1-robh@kernel.org/

>=20
> Frank
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>

