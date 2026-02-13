Return-Path: <linux-media+bounces-52786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Cf2Cb2Jj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:29:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820B1396B6
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77D9D319B0C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953E1295DBD;
	Fri, 13 Feb 2026 20:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IKP5lVZ1"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0E28640F;
	Fri, 13 Feb 2026 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014371; cv=fail; b=gVpFsziufHxlHNdlnM7uYBcAudFD8QbZkP8qOe3aoUhn0J6jqm0jlVld5Q9phM0zUcfFHnjvwZCwjsijMIq1P6dyiWA0AFM4oBdMAEcgKTi9OJnd6PDAihVvJZoafdCZDkjkJuB1GiYVju3oaG4T2mFlvlCS6naZt3a00QBfsEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014371; c=relaxed/simple;
	bh=pxFIBr5aZQGVHaV8iI6HWNdJne6U0RbD1T9WCzeSNKg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZKt2vjaSsI5JTP/DlxaFopjVn8/1DnG3BczrcicLIVD2otRd9flrNfA+UG+j7yyNuihLr5mt5ASH5z8nhvDXhsqWKe3Ukr7r5NmeVC4b5E4etbeO/Kyizr7Vef9icd2soGcfAOU+y0LG/R50y2QXnqexyAh+Gak8VuLiAxoZrHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IKP5lVZ1; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYr3lsiP94la8C5IsY5PnJnir6/my+rdHgwiaj3NZ8UFtATSOf6JEDgf7Oqem6ELvnv8bViB5f1bGn82MDBUjDyB55UnVlc259NsBV/DZ1tA+pF1HEr+aFli3fjA/SCyvOpvh3Zi0mObaBZAQGhB5S66H2FLow/m1wHwTA1xsaMQ6rvy/Th248KkH95/vLcm14SzDBH6qkgkq88aNxOR/fbAvTM4xog2Uqfy2ypVRE5B/FbXVebWuAKYlDf4aHs8+732Ksmd9jciOQ1970WgUl5Pc/t4QfU0fRUQg+nUtM6j2ZdaNRmQrTL8+ZxMb0j/DucTEyVhq/McToUW8p2Fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Xyqe6EQ7TGp3CDhiPR9jGdADqj2UtF9L5aGaJr9c4=;
 b=W87qeoAiHQEVThaqNsCLOFwlvgthXUv5OisSI/sFCNOq+21YWZ/Am9ayR4x4/EF4/IZV0BgXfz/K1VJc1KQzuHImBC+aT2IY13Xsjfj3lhs/BOd46MG1TZIixygdxo7GqnWewu9jy01Q6tGmrBl3+MGEpgavkGnQ4E/ZBL9E7fQwujE6+wlTLT5L7Qsg58kG00qlFqWicu7VWmF19xUENxNdz2C+qU9NbcyvXNEdtDcKMFKDDaNVPsjJmO93pN3nwXzuwzooRTM7U3g6Wm+CVsv9ri2R2NLKmdNELeHziK3MI2E1KN4jn8c3jYKfWWUBQ6OG3aCo5qVkxVb5c54yvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Xyqe6EQ7TGp3CDhiPR9jGdADqj2UtF9L5aGaJr9c4=;
 b=IKP5lVZ1Xem9lfx6JGEpXaNPVpyhvHga2ea7ZOiuCcQQ0sFe/8/ejV9OGNkztnRigr9UQD27H5rGyorwJv3qMh3uErMRRv7/koC/u9eTjo0GBSJsiVbPVQ1q4mTVYQfXMTcXYujQCFGjuPOcgj2h4X2IN+Mgigduk1Lg9/i3j0vGZNaRM6juz3Rv/jPgEG9x8DSGajOOUipvIFIPoXSvTHgzVzOr8I1tJRlbbYmGQ3WJtpV6oTV4ssM9Aa9TcAv6moCkrBnj5vsAapfRJ9tKgIW1Mev97pnEwWeuW4hwjqgFZeLEfL4eTVyDjrjS0kYyG8Dd7SjSyyW2wSzE1t0kOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:26:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:26:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:15 -0500
Subject: [PATCH v2 6/6] media: synopsys: csi2rx: add i.MX93 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-6-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=8457;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pxFIBr5aZQGVHaV8iI6HWNdJne6U0RbD1T9WCzeSNKg=;
 b=23jiL+NxpH5XUNm+YlA9yGE6Pao/brLSvlRX1MpGCqxRDmQ6EXe71Np48YtFooLEPLiU+z8UC
 fP515QSR5GMAvmiOtWU2lWFgYGMF8BY/YZD2m1nyrS17I0NXfpd7XBW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 194d0902-da4f-4e94-b3ea-08de6b3e1cf5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TTBwZ2t0VVVLVnU5NW1XYWo4MVR2SEpsNVNENmhvNXViSmphUVZrN29FaFNG?=
 =?utf-8?B?aVRpMjRjM05tSC9kaHNNR3ZhTWJ2bmt5SFJoM1NlQTFZQlZXNzRhckRBaVVy?=
 =?utf-8?B?cXR3NDNZNDFHcTEzakUxblpnTHFTUDcvUTRDNFBkU2VCaTNLNkFHR2hnTlY3?=
 =?utf-8?B?cVZsSTJEdXNwaWJOOHVuTmFYQnJMQjNuMFhGNzgvMXBnZmhXaWJzRXFFSHYv?=
 =?utf-8?B?WWxueDgwVXNtbXZjZkpNNGtULzcvYThLN2s0ck5TS0xGZkt1NW96UkVUV00x?=
 =?utf-8?B?c1JpQlZXSEhkMEJrdUkwY1Jqd3lTVDBqU1BmSVFJK1ExVE9OOGpNclN5NGh0?=
 =?utf-8?B?eDArOHFnQnc1eXVuay9Eam96dnd3Sml2VnhXN3EyRkFFKzN4TUhENDU5NVFx?=
 =?utf-8?B?TDdVZStRVy9jb3lMMzd1M0Qrd3NsSExkOFpDYkNrdE04eFBocVYxU24yWjF3?=
 =?utf-8?B?Zm5Ua2t5UXRPNDNiS1FuK0VMS0IvWVJWUFl6VkJVSHZ3SXhlUXRkcWhORTBv?=
 =?utf-8?B?M1JUNmxhKzhQUkF3bTgrdGg4U0lkTEl6Z1J0ZVJYNzZ0a3lNUllpUDRTTTRH?=
 =?utf-8?B?cmlVRGRaYjNXWUltL1JNL3duTFk3d3dzcXFqSGl2NDNuOW14UkRreXJadnZj?=
 =?utf-8?B?OE1HdlFwNVB6KzRMY0FHUmJ3dEU0TS9iUTB4djhyOEExNzdyTXI5TlJsN1Uy?=
 =?utf-8?B?SE4wR1NONEZScEEvUFlFa1lGQjU3Um5NdnZGcHQrb0tBUjlsanA3WTBicFZ2?=
 =?utf-8?B?ekE1MFFrV1dTOVd2aFVpSit5N2ZWQSsrbG1XRC90TTBJRXhSNlNqZ1d2TkdG?=
 =?utf-8?B?eFdNTk1KdFFiK1ByUFZQaXVGc2dJekxTcmV4UGtWQXMvZno5MUpKQU51VVdH?=
 =?utf-8?B?azlCNEVORDlsR1N0eEE3djNHRlBYbmtrdHJndXc1T3I0RDdiTEluK2lMQ2x6?=
 =?utf-8?B?RVcxL09iZkZVNE5wK2hpNzMrUHFoem1xcFZuUUlLRXZ3a2JDS1Rkbk5RcWRx?=
 =?utf-8?B?REw2bkxJOXVISjVNLzZDaFZWZlZ5VkdVMUVvVms2T3pENDhlYk4rTGVUVjlD?=
 =?utf-8?B?WTE2aFpFMTBYMHFRUGo5WGRrWC9zOHNhOG9Jck11UUlNQy9rN0VHOWZqRVp5?=
 =?utf-8?B?S1FrZUlmd0dGZ1JTWGREVEVYT1ViNWpPTUpUKzlvRnM2ejNDVWRkaHRmTE1T?=
 =?utf-8?B?aUtOMGxoK2YwWnVVWVBDUFk5a2hRb0FtUUx2V2tmSjRadlhiUHJRRU5PWG4v?=
 =?utf-8?B?K3IwRDJ2RlFLSGVKK0xFYTVVMWNnS0dEcDRRbzF5M3NtQ0ZxZ3BjKzhQenky?=
 =?utf-8?B?cmFTNkduTGtkNktPSGlYVXc0WjVDVnZYMGlQNjVIQWxybEFGdHNjSFRvUllN?=
 =?utf-8?B?b0diSlprUExoTDdGZWxpZFBwMi9WT0pONkkvN3Yra0xtTzNzK09OVmRuWjdG?=
 =?utf-8?B?VFJ6Mk5BSDM2OWF3Y3RraThYNUlWTkI3MUpDbDBPWGtVaWp2d1BHVldLR05G?=
 =?utf-8?B?eVBPZlhzelBxNmh0MkF1SmdLYW5mWVVTQVZNbTRodGlJQi9zUFNDL1Z4a2dl?=
 =?utf-8?B?OFc0RGE4WVlySHJ6WGNQb1p4K0xUcVFZL2ppcGJ2dEd2RGplQkhQVFhpYVcv?=
 =?utf-8?B?QXZtTytoUXJud3NJM3VLbnR5aEkzNUxXbG5mTWtjTFB3UGZQRE5CeVRnNkpv?=
 =?utf-8?B?T2xkclRyL1hiaUVZLzg0OTlvNDh0bDczM29ZQVdpNkw5VFFlM0tiNGJDQ2FR?=
 =?utf-8?B?VmVzWURiSngwNVRIY000b0IzY2tqYlR4Yk5NV2c4NEdXOFE2d2Q3U2tGNFhE?=
 =?utf-8?B?UXgzODNwOFp0WGZsdHdmZjFkeHg4RFd5Z05SMWFUUGMvN0p5bFVqZjgreFdV?=
 =?utf-8?B?VDNER05qUUxVNnFuUjJBRFRaU2VqOXFRY0I4Z3I5VHVURGQxVkR2dDJqS0Ur?=
 =?utf-8?B?U2FiREtoaUFvNjE2UTVXN3pYTFlVbzE4MnRNV0pham85Vk1waDl2cVlIbmdq?=
 =?utf-8?B?TGtsY1AxemdsN0s3QnhJYUVmYkxabmQxdmg3bWV1NVNGeThLb3Y2UHIyMUZ6?=
 =?utf-8?B?Y3AvRGJZZnl3bitmdHQvRUVmMFNwUjdkRllKbU8zVk5mODFGYVJCb0FSS1Bl?=
 =?utf-8?B?SW02UFVZMEVldkQzTlpIY3lqQUtQa0FId2c0SVQ3emJkVVNJMXFKV0hYSW1v?=
 =?utf-8?Q?HP7z3r6uhUvBPcam7iqx2uQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q1lPWllYVU13dytnclpEa25aTy9adVN0SkMzcnpHNVhhT0UzSG5nNCt3MW02?=
 =?utf-8?B?RDlWcFpuZVBSSlZpQlkrd3JaeHpIeGVDNnRWdnFVbXg5WTBWQXdZVFFzU0NY?=
 =?utf-8?B?SVUyMGJtMUhrTTV0Ny8xWElBN0JvUkVnNjZtT0ZpVTh6M1d4eEpVQlQzcHh2?=
 =?utf-8?B?WUwwbU5kNnY2M1FZa2cvZlh4STRuTFRKbTBFQ1VpdUVqV2ExUUM4eHQwU2JU?=
 =?utf-8?B?UWx4RS9EeDZJdU9DKzJCd29zTXppZUp1bkJnUC9sWGk1anpHZzd0YThWOTV0?=
 =?utf-8?B?N2NQN1BCZERETStHNitoSTVoSnVrYUVpR3JRYXlZZnpwd05ydGcwTk9aM0o3?=
 =?utf-8?B?WVB6MFlEQ0U3ekF4dlhkTnpvSkdBdnpkVjVBcWp2aUp0Q3BVVnZQcXk0RHZ1?=
 =?utf-8?B?R2pncXZFR3pUWkVzdjJ3b2V3Y3hvUDNIWmNvamYycUxNOGptbkMweGV4cVVv?=
 =?utf-8?B?TlV2UmJ6QXEwY2hXekNuWlRjOWh5TTd5Q1RuVW40RHpuZ3BmTG5RNEZHdjBP?=
 =?utf-8?B?S0owTmVRTHlOT1Zvd0ZIYjU3Q2xQc0t1WUxPWDRHK1p0S2NOK2tCMXUzdGcy?=
 =?utf-8?B?RGl5QTRibmFSY0VzY2tlcjVrcUJMempyLzlxOTYzMTNaRDZPeXVUeUdhYlB0?=
 =?utf-8?B?MWd0UldpOTVOSmhwL2Y5S2ZuMUZBdEZpYXJtZXF1ZXNoUFloczlqNWswdHo5?=
 =?utf-8?B?MDEyenFMbCtZWFRyOEp2Vjh4Q1Z1ZFA1QjhLRWhNWnM3RDhMZ0VMM2FRR1Ur?=
 =?utf-8?B?Z0ErYUt2V2x5aUgxQnBzcWJqdnNHa3JFektxRmpSNmp2eHV5Sy8wd3RKK2Fz?=
 =?utf-8?B?N2hsNEVOZjR0d0pZcjNvaENmcmR1M2RHQjd3ajRsUVBhMDIvaTR1d1BLTVhC?=
 =?utf-8?B?OUZFREdYSFI4cEI4ZTlGZ2h6cisyRTZOdTZnLzFwdTlvcGdra1dSekx3RkJa?=
 =?utf-8?B?d255NThqY01zQVpnZitDTU1CcEd4T1dweGY3ZHZub01rOStpeFlWRUlqRGEr?=
 =?utf-8?B?TldQZGFxbVRNbTlKaC9YOVR5c2tMYWJQRythRnd4OW94dVd2VDlJRytlYjZj?=
 =?utf-8?B?VGo2TE01NGZjaE5GcXhmS0VMMmh0OTdScHk5eHZKb3NreU1lc2E1U1RpQ2xR?=
 =?utf-8?B?c0NXRVpnRmxtWTIwR01FWmtSWlVWZDdkNFRJK2xSRHIxSkZJTXJibWNHNEVl?=
 =?utf-8?B?SXAwNFhnRGI0QnR6QjZpQy9RWG5iVmY3cFdnbzFqVytWSVNYRTUxOWZzeExQ?=
 =?utf-8?B?RVNUVXRMRzdKbGFaTnNZSnZoMWtJdkxTRWM2ZEFNR3FBc3lkUUg2cDZNbGxE?=
 =?utf-8?B?MCtqQUhDcWVmekp2Qy8ydGE1Qi9GT3huUW1ENnJIejM0MEdWa3drMGt6Rzhj?=
 =?utf-8?B?MTRhcHZSUkwrN0UxRzNicG9TcENMb09hK2RuMXhYTElIdjlDbnY0NHI2ZmpX?=
 =?utf-8?B?ZWhBTzd5NUpjU2Q1c0p0bm1jR2M0cDRqY0lBc2FnUmkxUzF5cDFGM1pDOFB3?=
 =?utf-8?B?eS9YOGQ0SXAyeTQxWjROWjRja3FyR1R0OE1OUlZVaGdONkJJNi9McjJ3OC9W?=
 =?utf-8?B?bkZSYWsvR1NEajl4TWFZWk11YitGVjFsSitVSFU1Z1hZbExJVmlhS3htZ0ox?=
 =?utf-8?B?VkVSNGprZVFWWFR5ZVNMYlNMdC84VzN0ME1xUkhzc0N1TXY0VCtYVWI2YitH?=
 =?utf-8?B?SHFjclFmNmdLeDRiMkFPallCY3lDa0F5TWZ0SmhLdkp3LzByWXlUY3NySWxM?=
 =?utf-8?B?bmE2QVVPbjRzRDIwTVAvc3U3Y0xhMkZraHliVktKSVBRUXJZN0pqWXhxWUFl?=
 =?utf-8?B?UmNhdVdBYUhrNGs3ODcwcyt3NjAwVERDSmpKb01jZ2JZUzZWRmh5NkVwK1pR?=
 =?utf-8?B?UVpDOWZLZ2dPVW0rVG9jdmUyQmdIeXlNbDdtcjFVeGxyT1JPL2hCeHFSUjRG?=
 =?utf-8?B?VTlkTDVvYmZ5N0VwOFZqdlZNbE81NExrbEZ6dGpMRGdOaklzUzB2R3ZDMHhW?=
 =?utf-8?B?eUVWSGxCZUNmcGNja1ZPUWE1NHVsU0VUajRXM2ovckh6OC9KOGRYWjFDOERH?=
 =?utf-8?B?YmNVOEc2bHhOcDBwekxMY2lhZlJwdG4yb2xmbExDQXFUT09sTDIycjVRZGI5?=
 =?utf-8?B?UXpRNWN2LzBBZDQzOFRDS2djdURNY2t2bDd3OWFLRDBlSlJBQ3FTbEkzb053?=
 =?utf-8?B?WGFVczdvK1hhOEg1ZldJRUswbEkzMStadWhtQTg3dk5mak92ZUVYMGphb2VL?=
 =?utf-8?B?czdnN2tiYmNiaVlsSmJsN0hXNlhiT2JlSjRQbmRyR2FBTm5BYnVZR2luNlFI?=
 =?utf-8?Q?W8WQQYvUcW18yNCPir?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194d0902-da4f-4e94-b3ea-08de6b3e1cf5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:26:05.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsBnx4tAiFBa1kHrCm4jaowqzrNT8P1SeSCbtgxFTjXFy7cjcyE3rRS7uRlwk568EpIBQswT0yD41NLK1zVghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52786-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 7820B1396B6
X-Rspamd-Action: no action

The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
register layout and included an Image Pixel Interface (IPI), which convert
the received CSI-2 packets, from byte to pixel format, and  produces a
pixel data bus containing vertical and horizontal synchronism information.

The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
and .idi_enable() callbacks to support it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move macro define to header
- use new register access method
- Keep check register exist to avoid print error message. keep slicence to
access unexisting register may hide problem.
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 163 ++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b00ae5fb328da4cc78fe36b629d6661d438e124a..ff617a38e8e9ffed4701c15f59aebeca8e4c5553 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -35,6 +35,22 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
+
+#define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
+#define IPI_VCID_VC_0_1(x)		FIELD_PREP(GENMASK(3, 2), (x))
+#define IPI_VCID_VC_2			BIT(4)
+
+#define IPI_DATA_TYPE_DT(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define IPI_DATA_TYPE_EMB_DATA_EN	BIT(8)
+
+#define IPI_MODE_CONTROLLER		BIT(1)
+#define IPI_MODE_COLOR_MODE16		BIT(8)
+#define IPI_MODE_CUT_THROUGH		BIT(16)
+#define IPI_MODE_ENABLE			BIT(24)
+
+#define IPI_MEM_FLUSH_AUTO		BIT(8)
+
 enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_N_LANES,
 	DW_MIPI_CSI2RX_RESETN,
@@ -44,6 +60,16 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_MSK1,
 	DW_MIPI_CSI2RX_MSK2,
 	DW_MIPI_CSI2RX_CONTROL,
+	/* imx93 (v150) new register */
+	DW_MIPI_CSI2RX_DPHY_RSTZ,
+	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
+	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
+	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_IPI_DATATYPE,
+	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
+	DW_MIPI_CSI2RX_IPI_MODE,
+	DW_MIPI_CSI2RX_IPI_SOFTRSTN,
+	DW_MIPI_CSI2RX_IPI_VCID,
 
 	DW_MIPI_CSI2RX_MAX,
 };
@@ -54,8 +80,13 @@ enum {
 	DW_MIPI_CSI2RX_PAD_MAX,
 };
 
+struct dw_mipi_csi2rx_device;
+
 struct dw_mipi_csi2rx_drvdata {
 	const u32 *regs;
+	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -103,6 +134,21 @@ static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
 	.regs = rk3568_regs,
 };
 
+static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
+	[DW_MIPI_CSI2RX_IPI_VCID] = DW_REG(0x84),
+	[DW_MIPI_CSI2RX_IPI_DATATYPE] = DW_REG(0x88),
+	[DW_MIPI_CSI2RX_IPI_MEM_FLUSH] = DW_REG(0x8c),
+	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -319,14 +365,32 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 		return -EINVAL;
 	}
 
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
+
+	if (csi2->drvdata->dphy_assert_reset)
+		csi2->drvdata->dphy_assert_reset(csi2);
+
 	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
 		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
+
+	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_CONTROL))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
+
+	ret = phy_power_on(csi2->phy);
+	if (ret)
+		return ret;
+
+	if (csi2->drvdata->dphy_deassert_reset)
+		csi2->drvdata->dphy_deassert_reset(csi2);
+
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
 
-	return phy_power_on(csi2->phy);
+	if (csi2->drvdata->ipi_enable)
+		csi2->drvdata->ipi_enable(csi2);
+
+	return 0;
 }
 
 static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
@@ -334,8 +398,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
 	phy_power_off(csi2->phy);
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
+
+	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_MSK1))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
+
+	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_MSK2))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
 }
 
 static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
@@ -687,7 +755,94 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
+static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	u32 val;
+
+	/* Release synopsis DPHY test codes from reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
+
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
+
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
+	/* Wait for at least 15ns */
+	ndelay(15);
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
+}
+
+static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	/* Release PHY from reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0x1);
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ);
+	ndelay(5);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0x1);
+
+	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ);
+	ndelay(5);
+}
+
+static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
+{
+	int dt = csi2->formats->csi_dt;
+	u32 val;
+
+	/* Do IPI soft reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x1);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = IPI_DATA_TYPE_DT(dt);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_DATATYPE, val);
+
+	/* Set virtual channel 0 as default */
+	val  = IPI_VCID_VC(0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_VCID, val);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
+	val &= ~IPI_MODE_CONTROLLER;
+	val &= ~IPI_MODE_COLOR_MODE16;
+	val |= IPI_MODE_CUT_THROUGH;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = IPI_MEM_FLUSH_AUTO;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MEM_FLUSH, val);
+
+	/* Enable IPI */
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
+	val |= IPI_MODE_ENABLE;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
+}
+
+static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
+	.regs = imx93_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
+	{
+		.compatible = "fsl,imx93-mipi-csi2",
+		.data = &imx93_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.43.0


