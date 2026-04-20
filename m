Return-Path: <linux-media+bounces-59109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ+uM72G5WnCkwEAu9opvQ
	(envelope-from <linux-media+bounces-59109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 03:51:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7087C426175
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 03:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F8343017244
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 01:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54721376BF1;
	Mon, 20 Apr 2026 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g5W5Z8mf"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEBC376494;
	Mon, 20 Apr 2026 01:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776649905; cv=fail; b=td7mtUkna2tg8iBYMpNXWMP+jk5KV+xGyGNYBbDcUNrQVL43tx7jsHP68pxHwMHjRSxX7/ratRC13DeTrUsH7V43y7H+rtJGd0uUjy7ti7hN/L4Sa6V7fzCoegafsKcT5YMroj1g+VNY1yt25/YhpGvr6XILyEgMzwTCILmyovA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776649905; c=relaxed/simple;
	bh=Ab9Oir2MNwq4/a0PCS01qDmbiu3aF30u/58nMb1O7yU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OXBZoTR3s0JQUMJqULcYRswIjDOXPGPzsK8wVCRX71cr3Yyp4kUJ7/rkqA1RFunRBR4fOJaQSDoS0Tnxg+MzX79Atad9tjZ81NDkgIXZNPes05ff//ObxHd3VJvH17uTLztrt0xzDqdSHwxTCRgkA0FGJwVa2x3K71RS/9zNFho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g5W5Z8mf; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s47bVr7nm7IUxRypAVT2iTzLL1qOZHKB4a6dQOB3zPOoYDT/Nm6pu5XU9j9XYE12i3V4IiSSIJ/E2w2VE7oXIll2UP2/eveVWs7Xq90yG+LQ1Mjv9lP0byOSU4+F3uTWqsa6CyVrK7lnRNMus8IDcVIH8sHS+Y84eE1J2cCt060VhfMTkpzHEC3QLj1GPcmiAqo+z+S5OzDqutSCE4sgo77orRxBItySOIKFOd72gh+xFZYGOjX+Fqk/himY0F4sW1B9Nrgc3rYpASa6wwIYEQFRfe6CL9YjK+peeoRcFJk5GwCIC9g7TXTcfd3iXD0coFfe5peoRnJUlN7aa1GgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ab9Oir2MNwq4/a0PCS01qDmbiu3aF30u/58nMb1O7yU=;
 b=QrGcXlHcMvmz2beVaVBjTU9RJZDeI8fURnllyW8iMmgdLzLzJWxweRk0J1cuVEDxKucrOgBYvZ/LwDPTlKWU1jz8K35ryjHCMM8a7eU+r613KMD7TbnZ+EksHqJH2Vtzws+R0Hk3Ax9x8rVV8DAyKKGCOvuQf/LUoymII7I5a8pQX9qbrtUDC4IzTnLpLE7/7cCrk2N2wlkb6VRZTv5pPTfmPNL+1jyWo/nqalR7yrMFeRREPZUViTVzPeK/0IZFkx7U1JErA1+96nPVpB010RCPNZoCUOo4fMYWENfoO5uPFT2AJwec4EUacj+WGNwEBg8+0Lo9+sf5M6Z84L+uOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ab9Oir2MNwq4/a0PCS01qDmbiu3aF30u/58nMb1O7yU=;
 b=g5W5Z8mfV5yA7eDf8oVaSXufdGq44F5LeMCe+bV4UJlwDjp+VbeT7MdEFelSoiH7liJ3DeCv+Z7FBLDVyoumsiFp+HVs5gj4ni5czpuGt0LorYXbievznKl9qozFbDsT1RvaL6FZ4oTPs8CQukx+thjjNTB9DKjRmnAmUPUTFAZUqr+zDij4Bqg7zi9YF3gRUpwtWDT18AZz/EbFH6gENADYoLDg0RxWp0vz4rV8UMCEZJq+jv7ReRPNqPG4CUCRT0mv2MPkjcYQBbFJDG/I8moD3ZkoGegW8UCb5PtApK5aUHlS3vZKQwBJZhGlx52Jl2XS+qM4b3Zwuf2/DeOuUg==
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by DU2PR04MB8807.eurprd04.prod.outlook.com (2603:10a6:10:2e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 01:51:40 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 01:51:40 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Frank Li <frank.li@nxp.com>, "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: Michael Riesch <michael.riesch@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: RE: [PATCH 2/5] media: synopsys: Add support for multiple streams
Thread-Topic: [PATCH 2/5] media: synopsys: Add support for multiple streams
Thread-Index: AQHczIo2oNve5lQJbE+dt8XZHAWO4LXi8f0AgAREqVA=
Date: Mon, 20 Apr 2026 01:51:39 +0000
Message-ID:
 <DU2PR04MB9081685291D2E39DF59332F6FA2F2@DU2PR04MB9081.eurprd04.prod.outlook.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
 <aeHxeCOn_Lo6XgzJ@lizhi-Precision-Tower-5810>
In-Reply-To: <aeHxeCOn_Lo6XgzJ@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB9081:EE_|DU2PR04MB8807:EE_
x-ms-office365-filtering-correlation-id: dd17d27e-ea2a-47c0-e5ca-08de9e7f5d7c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 c5Eo0/YqvvRj/xj8CK4QNqGcxj4Yivzj/owSGYpuU/E7+sRD38rPMnCqK0EPhTvEbltqfQAgMOEQo4QkPv8hs+PlJA/RrnZayhW0EcXLSE7cxMINkqGV89wCx4+gRMGlSCQv9ar1OhmWVOrHM59CoVQUOW9OqDngRNRrz2TdZIcDkNXPXKSgajgKeUxpR+EPb2exP2ND3tcuLG5KxQMOcoOhYNmBdEYvIcfi6bF1Sr/zaxyijQZTKEnM2XqXqwCEdhcQpPPMUdqv/IpC2onl/bcOzZhWpdzTZ6IA5nA7gLP44K/lEZmvMyO20Xn8hXNDFR1DRC1sSvEKrfoBjK+5AZvBDClbKNlbw4iVZtOhJqHvwuMNuXZR3Tcx23laWSEmV70uURwt0WeldRCLhAbLh43aMYdRzXPD44DJ0fDwxiqphhkd4b6kdzaPr5xOh4eFABc0fnhBm2U2oBlcDqzCodWDSvcvWTtmJEKECirP4oxoYV1qQY81oIcFqoMbGdDrY4seSfeVKmRRWwc3z8v1ClEFFdkDCSx9OHFoUM5tKxl2s5/iSWFqY+SgQ6UwyI1bnhhXSnNK2ZeAYu63N/hdoh0qYzeJWGrjjxPVxFlooXhRZ5QZ7hCgE2hF4wlpmKC7/V4JFMJ1++cSt/0HhMZIQ89z1TMd/fy5WFmwahwZCPUbrl3EcXf0l5X4UHl1tKkfWPUAocuztqgebBbRTVoS3+743cndJhgxYlEOqMnHA1evHWsypZBzSMAUQRIXTqigaBDxOjSJe8LK9jwcsVhfEwKxARdWNIo0swWnJPO1n1s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bQJMX7jYY3C8m0pEqpOcD1B2xmszhLMdDVuBQwQue4uADIeureYtll4D4ta/?=
 =?us-ascii?Q?N20CSreuVmULDTKqaX4WGq3MYMnd4E8hGqtorM3p5DRw51xFUTnxrDf0nIXD?=
 =?us-ascii?Q?fZNpKN2g4aeRdUCRWjf1WcX0Mh3xvOkMxJEdmgi9KptGXF6rNbfSJ1nhGRw8?=
 =?us-ascii?Q?ZHTzASfHyQCGU1Evbzb2c/cGfgu1yI8dBAbJs31hcX2Vrs9LEEBAtVuRHE31?=
 =?us-ascii?Q?5Bq4vKDBXT3JDsLmh69NtlrC4LrwKZugH29AGPDGaDPQ1qw1vT8IeF9Bejcd?=
 =?us-ascii?Q?PIMiPbc7DK3YG73yPOjog+WdqwMPZDYhhl/4tYP6Yfyy4IhJfuQuKPJL9Hw6?=
 =?us-ascii?Q?oE0VGBFHhQcZ06M4YGfn8N0qcHs0oDUhrWXcdSLv44m3tonZXSNhMBx2y2zc?=
 =?us-ascii?Q?jw23+yVsph1ZBUX1Gmm8MW154QHKzddg0Uf4x/luLd4vdbQhmNwbL2vpuu+4?=
 =?us-ascii?Q?sajcJ08MGEsu9MQ4ddBRHgU5biU+4KF6zSqcBAybwUSLVSRkQpJcuz4GhEuY?=
 =?us-ascii?Q?dO5jPty8DYpDUaHpXo95AAcmokDYD0dQ31m3r6JpPO2TRDG9uzR4bw/OZXBv?=
 =?us-ascii?Q?+9GcLpaZsxleeSJ9BQ1QEUDeBlJ9wLDO1MrFwOX2yZ0fUlQYmbIOgmpUcH8B?=
 =?us-ascii?Q?znAtC2+KzAofd46F2PF8nZyu/133CBE03Yww1CFYDpP4EjEHh8okBi1luo7b?=
 =?us-ascii?Q?6yzAgsH7p8KdhEkAj4FdXXIr/CjXVq/g2IsdtnvqyAj10fNsRZmo1aXavpea?=
 =?us-ascii?Q?SDQAf0ARNGx/75IdqxrSnl8xruIQNYJzibHcaOZqjqGk9U9C4Qj8mb5pkjjW?=
 =?us-ascii?Q?CEYErUxFSace8hCAASQfFRsHoqIXGHxzd7TBQvd8K4kTf8iP0NtlKMTRjWL3?=
 =?us-ascii?Q?3ADJYtnQsEso4ypSzQ48ahVAwaA13rkjirCeV9356BQl1GzPvY/n/x6rq7gD?=
 =?us-ascii?Q?xy1UU9MrkrsQlimIMRWonvzeMXExgRJ/dSOHGxhWH8wlbcvo7OvPNgZf33gN?=
 =?us-ascii?Q?bDDDx/IBdDaF7pdbAgVbuloia7ZvGAuUzrPtYegq6Xj1LoViIZWOJPZyPdro?=
 =?us-ascii?Q?PzZVuMQkS9v0yuqKtOIdNCHFJBm17kFNbx2oNo4bO6HkqwCrprcVVHnCr9Nv?=
 =?us-ascii?Q?Qu48+e/hIEwG0mo1iNLFKbJocay7zq9JbMC9QdWWHLIt0ensvH/fYk26Cb5v?=
 =?us-ascii?Q?jFyCatX+Pj2E4tCyeoA/DZy9gJchhyd6/Ff5nefDGxdgMSECuK3a9KkyMx3N?=
 =?us-ascii?Q?Ms5QeKGp/+QaTdzkkkiQVQx8KjrILs/GaBn7nC4K9FFHnSxuIArgrbtnuG5O?=
 =?us-ascii?Q?gj3UDhPU6ogzKbn9zo4RHoGsR/BAO7W9yb9WR1MdhSYwIlnV/txmZYsh+M3S?=
 =?us-ascii?Q?4fbU55uUNYKOza76W9/FVVjKVumB5TrNdzqouNGPz3tyWFJlArXPIUgv23kM?=
 =?us-ascii?Q?W8My7CLE/K+H88rnluQ6kPejiIBSuQhch1g0Og/+4MA0K2G5GCW2qAALTRlk?=
 =?us-ascii?Q?DU4PeCx4k7E1XDQkcTyzR5UDe/nzCLIjkEPFwrtWudIH/Woe6fSH2HHRHaBo?=
 =?us-ascii?Q?pCypa5Eaoev69zbgU1AyCR4nBMpyG2n0hAU2T/MQg90pslpym5mx5FM3GrkX?=
 =?us-ascii?Q?29TWLa2RM+0QPEeW5YyC3dxjnACnCffsYB5z+Afp1G+d9WPdmAlaz/jCYxdz?=
 =?us-ascii?Q?Xp+Dw9Uo92QeHF4xZUrFuSkOdDvC7rpdTEipPjslZXo4QI3f?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd17d27e-ea2a-47c0-e5ca-08de9e7f5d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 01:51:39.9408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9D2YGI4SgKHkRsYSRF8Y9vSFR5L5v78SKwo2cASYC3DZwvZwhyDC8glVA+gAb9ZMhV0UqGxtaH1HSVcUzvbyFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8807
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59109-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,collabora.com:email,ideasonboard.com:email,DU2PR04MB9081.eurprd04.prod.outlook.com:mid,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7087C426175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thanks for your review.

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Friday, April 17, 2026 4:38 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Michael Riesch <michael.riesch@collabora.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Heiko Stuebner
> <heiko@sntech.de>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-rockchip@lists.infradead.org
> Subject: Re: [PATCH 2/5] media: synopsys: Add support for multiple stream=
s
>=20
> On Wed, Apr 15, 2026 at 11:46:53AM +0800, Guoniu Zhou wrote:
> > The current driver only supports single stream operation. Add support
> > for multiple concurrent streams by tracking enabled streams with a
> > bitmask and only initializing the hardware once for the first stream.
> >
> > This enables use cases such as surround view systems where multiple
> > camera streams need to be processed simultaneously through the same
> > CSI-2 receiver interface.
>=20
> Look like this driver only one sink and one source pad, how to implement
> multiple stream.

Yes, you're correct that this driver has one sink pad and one source pad. T=
he
multiple stream support is implemented using the V4L2 stream API, which
allows multiple logical streams to be multiplexed on a single pad.

In MIPI CSI-2, this corresponds to Virtual Channels (VC) and/or Data Types,
where multiple data streams can be transmitted over the same physical CSI-2
link. Each stream is identified by pad_index/stream_index (e.g., 0/0, 0/1, =
etc.).

>=20
> Frank
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> > 2.34.1
> >

