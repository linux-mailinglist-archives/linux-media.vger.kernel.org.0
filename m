Return-Path: <linux-media+bounces-37235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B555FAFF677
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 03:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F36E1BC805B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 01:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F8B27E7E3;
	Thu, 10 Jul 2025 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m2GU8PNe"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128A2F56;
	Thu, 10 Jul 2025 01:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752111695; cv=fail; b=neQ/4/r5bTgvO/RM//b18h2cvqSWhAGgqQ9FtURLAmVWYiU9Gtz0/qY4n9qSuYZxWN1EYhOR9h20ANFF6lnyrok5TDBbfzIEMziuYHBPjQ26eMJNNt8PjWOfJbqqWR4khacr5Lk+GYKb3LSTdYjZy70AGGeC4cB1IyL7E7PJTmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752111695; c=relaxed/simple;
	bh=CXTQk0mt/BZ1RMlCbFQbkKqIbLncFIAgKo3MCYuUUVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PKrqtH5AO1CZhXf1i2w3IdDU3ZMxGSTywvLn/ptfrNqjz0EdwYQzLgoYMDkXUvvUlG1pz+H/CVQXbwWsQfIEWtmUopeJ3J5Q5RvrVlH/bzngITHKf1ezLSCS9qGVyr+Neu4H/8cDLBtDlxf9QkoIWODJG3aTgc06x+Ny3Xo4KKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m2GU8PNe; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvAzAhL4pgNCRXaABilzxoKqNYhnPuLplKAsMv78OYVfnUDIh2+lUOG3tPSRBq/UBQ84ZcxgCiQLwzU6Lp1+Od75vzGll858H1xNo1f2VYhTParwaeuXpNwN2A+V2KfsHs38y9/4og5ITp64yZC1zKG+tMHR5LoD/3DLHfctv55EP2oj36txFxpz7EljsIY3X0xpAefFLz6RZvCg1PC7WS3S12lF1r4vF40qAcdangywfYRi7akOpC4peY1FIAIsAS2E3iYDENTxYQyrPkHeJ4cjxlKqousCk7/uc+g9KWvPvFTYTCx4mt7oa3fffzCHrELQIDuWitMP0/7N+Y8rHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InxtNTTIfS8EnADulDN/Zu1b2dDlkItgUHkqxgZFGTc=;
 b=N0yub46tsJofr1jmxrVLLijOyfAJSgHcIIwmnZfLE6ZJhD6XZTb6Jsgbt+93/I+opJttXF1X6jZDIvR2aAjJ0DSdAzN8RQtkCTAeHygHPa9oJ328OfNtejUKh/wQ/cwQBxutWoixLPuCvXwXffEPVu9ZZ2zJO61V26nWCdunUvnMLDG2A2PsP4d4yPsg8l8vxzj8NsnBABIGa486tFiazLt46aRfkOD4Ag3So0hI2DKa9GHmb0irfh7pRenx/XUtuaLBwjEG3LU1slS/fFlJYm8fcuocuzlPsWU1AF23hGxZtKALyMtwATKmWTz7GFvJv2JgDXYPgWT1gU+BFZUdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InxtNTTIfS8EnADulDN/Zu1b2dDlkItgUHkqxgZFGTc=;
 b=m2GU8PNePEq9SHFj46kjBnLCjuZd1TaceMOJ4qe8r4jL2IwpHFo5j8fjkuKYzFsJBEijJnzRrEYsWKuJi4X99JzmN5DDhMIx8EVHk+ioXBH5T4gHODztZw8+6m39DoLxRY3FzWhyqIGN2SOTs43X/d4PFt9xPMY50B20fDM4avknE6jTo/6r1B9hISx8Une4zmIO3WiAD/FephSGXmo4c3ZMDFEyEVevptQUqEqwKY4SHX7+X+eEwTRtJQ45GAqRG1snjeG9Bttns8TsO5itIv+RUsm4f2yRfzuXB3sySWohF54T1C93bENJvzg8fmKDKzuAyPekiIwBSohzEUx7bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 01:41:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 01:41:28 +0000
Date: Wed, 9 Jul 2025 21:41:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 11/13] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Message-ID: <aG8aQ0WxYDGiKtxz@lizhi-Precision-Tower-5810>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-11-d4be869fdb7e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-11-d4be869fdb7e@nxp.com>
X-ClientProxiedBy: AS4P190CA0042.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e16195-f416-4138-f682-08ddbf52e3ad
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?l2aGn7mUcFVyCLQ7Ylp/KDXJmXBnyGaD8dI7LtsXCx6oP0XanAu31xITJUsc?=
 =?us-ascii?Q?eyK7WJn0BzVErk4TJEe4xD+Cw7NZgfwmLZ39L6/5HA5uQIVpHwKADWp9U9Ek?=
 =?us-ascii?Q?8H0FwOiyeNpWDQAXHd6FpOgtcSyKG3w1Os6AimvN86DzxKtzLb9LunAdqjyY?=
 =?us-ascii?Q?US7Tmnes+F4AgSEv1IZ+OIVZupwv0qOBSQAf4bheJwRrP17/D9xZu4WoPPYY?=
 =?us-ascii?Q?/9GVDY6CCXnY9FqHSfi9J1bkt8j1d8N9B6E+zSCHNoK8/L4GJR/tUsn1F505?=
 =?us-ascii?Q?OjDq9oZ9c+Omdbyqdal4NPyrQOEZA8C9cpC41xjcpsP3wPHrNibBKpHAVNbv?=
 =?us-ascii?Q?i1f4TM2rYuJGMzd5GiXUVd+mXp7AJxdZH3KEqiPMcUzAAv542kI7bBdHS3Lg?=
 =?us-ascii?Q?XtRFYVxMk/TDA7QKF5NLO9zH68ov2y7QtY2pPLiebVoE2zLpCwDO4ORF+7p7?=
 =?us-ascii?Q?Km0osRf/AkmJrtr1WMSYNIqBPM35Vj54fsyhrG5o1YZTmlN54HcIHuEH3CJ/?=
 =?us-ascii?Q?vMRILaSpBD4CLymeFtqkgeZuRJhuNcmd6T68/LGE+x/9K4qQNhmi3lliAXRy?=
 =?us-ascii?Q?PZef3A1cArkSWmn0R4Oa+nTFUax/MH1LeulcLZ9z7gkZjiskPzbBLbzDAM02?=
 =?us-ascii?Q?8zczbWVN1G8kDSkOb2JlyAOgvwk5M9XTmmyT0yU+mTzpaA/Z0ebCfFcTzXvq?=
 =?us-ascii?Q?n27vcw71cMf5agx82oz1O5U8BJUIoOkRXJ2hbE+wlBMqbp5UR5qANPZniVOU?=
 =?us-ascii?Q?B+6VLaWC302K/tK1HtuZiEN0YBiIPoZvbE/J3ywkfp/c8L4rPZQYJW0+aKXy?=
 =?us-ascii?Q?5pjA9Drio0dtYZpJWr2ce2Z8q6C+DR2VG89Pp5qzPaJ1VfR1UjYoX5UdZatY?=
 =?us-ascii?Q?BadrIw178VxysM7v8H1j9hKe+1saVqHRWv9OpY8At0W/twgeQcdo/zDeeTus?=
 =?us-ascii?Q?V0P/QBDlu0eTXJ2N3Ai2oYwynsqt/jZJQyhWfjGwJ8Wr0v+cMgMFj/l72C5F?=
 =?us-ascii?Q?SGKd5bW7LM1PKZJRAtRGVFijNrAFYPmrEkZc+sXwx0gzP11PkAPyexMsBtrk?=
 =?us-ascii?Q?4DmSc9voolqBCoApgd8jDT1ImzgBoTNnU1I49YxlalZgnC48iJg3MoypYC+z?=
 =?us-ascii?Q?y/fpA2IGxQ5nGKZwbRfaxb62gkbTEYA8xBnVtTeS1hjFflUPI5/XyF5b9w+2?=
 =?us-ascii?Q?JnGonQIWIPpYUZbLtjgyOknit0/w60GX8BZj8lauY9umJZUQW5uA2XmGk0J0?=
 =?us-ascii?Q?2z9sNtNK1zdAUcw164AYB7ndfQbTxKnkoXl7C7boQYzYVs/G5voO73sz2tvY?=
 =?us-ascii?Q?KXN8dKZ/MNOCwMeFKsRpWWxgRztOcAkpZh7FWCH2A7HGaDlA3u+LE43Uxw2J?=
 =?us-ascii?Q?Ac9Unatr0VGWXcQfuvqrekchCtC6plmlYgDg/VmLqUIXe48piqzXxF++v4Ph?=
 =?us-ascii?Q?m1NFZujtWjAppJWecK0tTV39F2nf/qiJtN9MsmYcYLAi2avTon4A/Qc8CM76?=
 =?us-ascii?Q?GyHV4TKDVfhbzfM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5+MAH8V4mG5335Sn7HfiIdZXa43xeeQ7E8j6knX/O6J3+ulNh+JpoUCwGN5d?=
 =?us-ascii?Q?zAhB8LCMz5jtHhit7aUz/TdRyhxB0J0AazEb+GlO72bueZLKPWMwNh1NLyH+?=
 =?us-ascii?Q?+cylYkZPDNP0RIUI/49WyGQkXzvo9uHy/d4QxGlYOPQQdomZAqGijBZcZSv6?=
 =?us-ascii?Q?o2AvUfE4Xu7lAMOIyH49QatciyHb86NLiElUv6ZUCtNfVYGLdlJVWrRiMNSZ?=
 =?us-ascii?Q?XiFyqMna8Jne46FHeVpHeYZsrS8nd8eYtzgtCclMqzWpD6liDjiy15tD+SMZ?=
 =?us-ascii?Q?n0HDr0JV8W+nxhMlVAXYgYzyAInPMJ8/SDJ+cHR5FJIOMQW0rCz6RlQuJAAI?=
 =?us-ascii?Q?qMSP3oIPZxBbb2DXtjKwbVJ8HTIgR8Klc/AJoD4XdOBHY4aMdX4rnwRCFRNc?=
 =?us-ascii?Q?IaSDDYUCYXZltrE9sswZL5s1wEdwFOCfsAkS8jsUfja2xunKoez+a5tjT3VG?=
 =?us-ascii?Q?8EUy4dH4pHVBOJE4H2jFDhmzfgj1HmuzaA60jDe+pYp0M/YAPjsCa1rnPiWL?=
 =?us-ascii?Q?PF7iObg5mORz61cwslOHLTuOtVTnj00+OSYrzYIakkIY+j7t4G2dQMhSeL38?=
 =?us-ascii?Q?CNnf5+6dpN06tTxuxuZyvmr06Sq6lfTz+VJs9gzhy/q7ot1Gbxc/ylqso6jP?=
 =?us-ascii?Q?FeHvd0fUZsDa5QMY5klsRuh0xj2MFA66W2JmL22fpKON7a6E7VX4HXEi4X5C?=
 =?us-ascii?Q?9mWo+OyY+3z4sBFY2Z1g3Djx/kcDP8DnqVINQX4MNBsV+PoV4SYTaJDZirmi?=
 =?us-ascii?Q?ygEKIgifL9H50kquUfYkHAdN2jVlSUd72vbUMb1dtyw+yht96g/VVWLNYSug?=
 =?us-ascii?Q?hKmlXbbeyQOu0Lf3KaBjOOSrc0qHj39CS1spVz/3pV68P7+BOVgRRJAnclvE?=
 =?us-ascii?Q?XcSHYD71C53fGha/p+7yC0qjmvBUuIRQhLQYv3mctliNNPNqPeeId5avrsXK?=
 =?us-ascii?Q?IiLSI1FJBIfTd1OY9dDpv7DigI+6SpmM11NzZuatNVPaesa0ZsbKBp5WYOCC?=
 =?us-ascii?Q?gJFKy5ZvvopNRsbcpXIB9YwxYIJC18+EMWN0y8pDdZiGWYyQCZf2+ksgC8tU?=
 =?us-ascii?Q?LJPLstra/daNmDLAsOJFDZ3e1sDvPUnw++HHJNUsoDVldtu+ZOF47Q1CxoTe?=
 =?us-ascii?Q?8JcpkfINjGAMACrJGtg73A2fZgyILaSrM+PVQH+GdgHG68wviB0BmiOpPH+0?=
 =?us-ascii?Q?RjGACxuVq5IlIwr8x6RHr/U6Imr2a1LX54XuE/Cad3nm0X3obLU0Jqa0VeYm?=
 =?us-ascii?Q?7G2AR1KpUiICuQeJAdpKpni8uHg9ojAxIKNgU7AoCXJ4uWoRgnZJaw5D64/8?=
 =?us-ascii?Q?OLGLWZyBBZupHgVvw08YM5Y5RlOyJTXV0SeXOgHzSNs38uI3XEQiz7wg2nXM?=
 =?us-ascii?Q?Qiub+vOK3rWscTmkTGLLdXmAqgEGtLDpZajaAsIFi/hFeq0Hli7PxC95jQ9U?=
 =?us-ascii?Q?nZIk+Hmg7+qGInFeEETqIBxL2NQbZ0qSLYGezAIEEe+tE1gyqnhKitjOy71U?=
 =?us-ascii?Q?ZaMoqVFjopEtQv04yEm3QyXIclFn4ujqjxGu4qv12pns38koeqHZfi6CzOVa?=
 =?us-ascii?Q?VVS66hIxTfFSrC6iD7/q7ZdFM/2G5KlEGcZ1MBOs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e16195-f416-4138-f682-08ddbf52e3ad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 01:41:28.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTKMPtFLOVc2llvt1zgcYLNErWG7S/LxQ2770gnEzKlK5HhpMmX5adJrU3nErx+m6uxYJKlNS6d6zVWEto8oEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

On Thu, May 22, 2025 at 01:56:49PM -0400, Frank Li wrote:
> Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Shawn Guo:

	binding and driver part were already in linux-next. Cound you please
take care dts part?

Frank

>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v4 to v5
> - remove empty endpoint
>
> Change from v3 to v4
> - remove unused clock clock-img-axi
> - add ports information for isi and csi
> - Fix 8qxp clock, irq and power domain
> - Fix reg size
>
> Change from v2 to v3
> - remove phy and put csr register space under mipi csi2
>
> change from v1 to v2
> - move scu reset under scu node
> - add 8qm comaptible string for mipi csi2 and mipi csi phys.
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 362 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  79 +++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  83 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
>  5 files changed, 534 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index d39242c1b9f79..2cf0f7208350a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -10,12 +10,264 @@ img_ipg_clk: clock-img-ipg {
>  	clock-output-names = "img_ipg_clk";
>  };
>
> +img_pxl_clk: clock-img-pxl {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <600000000>;
> +	clock-output-names = "img_pxl_clk";
> +};
> +
>  img_subsys: bus@58000000 {
>  	compatible = "simple-bus";
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
>
> +	isi: isi@58100000 {
> +		reg = <0x58100000 0x80000>;
> +		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "per0", "per1", "per2", "per3",
> +			      "per4", "per5", "per6", "per7";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>,
> +				<&pd IMX_SC_R_ISI_CH1>,
> +				<&pd IMX_SC_R_ISI_CH2>,
> +				<&pd IMX_SC_R_ISI_CH3>,
> +				<&pd IMX_SC_R_ISI_CH4>,
> +				<&pd IMX_SC_R_ISI_CH5>,
> +				<&pd IMX_SC_R_ISI_CH6>,
> +				<&pd IMX_SC_R_ISI_CH7>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_csi0: irqsteer@58220000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58220000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_ipg_clk>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	gpio0_mipi_csi0: gpio@58222000 {
> +		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
> +		reg = <0x58222000 0x1000>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <0>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&irqsteer_csi0>;
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +	};
> +
> +	csi0_core_lpcg: clock-controller@58223018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58223018 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi0_lpcg_core_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	csi0_esc_lpcg: clock-controller@5822301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5822301c 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi0_lpcg_esc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c_mipi_csi0: i2c@58226000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58226000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_csi0>;
> +		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
> +		status = "disabled";
> +	};
> +
> +	mipi_csi_0: csi@58227000 {
> +		compatible = "fsl,imx8qxp-mipi-csi2";
> +		reg = <0x58227000 0x1000>,
> +		      <0x58221000 0x1000>;
> +		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "core", "esc", "ui";
> +		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
> +				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <360000000>, <72000000>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +		resets = <&scu_reset IMX_SC_R_CSI_0>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_csi1: irqsteer@58240000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58240000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_ipg_clk>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	gpio0_mipi_csi1: gpio@58242000 {
> +		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
> +		reg = <0x58242000 0x1000>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <0>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&irqsteer_csi1>;
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +	};
> +
> +	csi1_core_lpcg: clock-controller@58243018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58243018 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi1_lpcg_core_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	csi1_esc_lpcg: clock-controller@5824301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5824301c 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi1_lpcg_esc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c_mipi_csi1: i2c@58246000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58246000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_csi1>;
> +		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
> +		status = "disabled";
> +	};
> +
> +	mipi_csi_1: csi@58247000 {
> +		compatible = "fsl,imx8qxp-mipi-csi2";
> +		reg = <0x58247000 0x1000>,
> +		      <0x58241000 0x1000>;
> +		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "core", "esc", "ui";
> +		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
> +				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <360000000>, <72000000>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +		resets = <&scu_reset IMX_SC_R_CSI_1>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_parallel: irqsteer@58260000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58260000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clk_dummy>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_PI_0>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	pi0_ipg_lpcg: clock-controller@58263004 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58263004 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "pi0_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pi0_pxl_lpcg: clock-controller@58263018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58263018 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pi0_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pi0_misc_lpcg: clock-controller@5826301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5826301c 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pi0_lpcg_misc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c0_parallel: i2c@58266000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58266000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_parallel>;
> +		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
> +		status = "disabled";
> +	};
> +
>  	jpegdec: jpegdec@58400000 {
>  		reg = <0x58400000 0x00050000>;
>  		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> @@ -40,6 +292,116 @@ jpegenc: jpegenc@58450000 {
>  				<&pd IMX_SC_R_MJPEG_ENC_S0>;
>  	};
>
> +	pdma0_lpcg: clock-controller@58500000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58500000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma0_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pdma1_lpcg: clock-controller@58510000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58510000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma1_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH1>;
> +	};
> +
> +	pdma2_lpcg: clock-controller@58520000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58520000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma2_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH2>;
> +	};
> +
> +	pdma3_lpcg: clock-controller@58530000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58530000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma3_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH3>;
> +	};
> +
> +	pdma4_lpcg: clock-controller@58540000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58540000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma4_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH4>;
> +	};
> +
> +	pdma5_lpcg: clock-controller@58550000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58550000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma5_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH5>;
> +	};
> +
> +	pdma6_lpcg: clock-controller@58560000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58560000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma6_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH6>;
> +	};
> +
> +	pdma7_lpcg: clock-controller@58570000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58570000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma7_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH7>;
> +	};
> +
> +	csi0_pxl_lpcg: clock-controller@58580000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58580000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "csi0_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +	};
> +
> +	csi1_pxl_lpcg: clock-controller@58590000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58590000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "csi1_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +	};
> +
> +	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x585a0000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
> +		power-domains = <&pd IMX_SC_R_HDMI_RX>;
> +	};
> +
>  	img_jpeg_dec_lpcg: clock-controller@585d0000 {
>  		compatible = "fsl,imx8qxp-lpcg";
>  		reg = <0x585d0000 0x10000>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> index 2bbdacb1313f9..4b7e685daa024 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> @@ -3,6 +3,31 @@
>   * Copyright 2021 NXP
>   */
>
> +&isi {
> +	compatible = "fsl,imx8qm-isi";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			isi_in_2: endpoint {
> +				remote-endpoint = <&mipi_csi0_out>;
> +			};
> +		};
> +
> +		port@3 {
> +			reg = <3>;
> +
> +			isi_in_3: endpoint {
> +				remote-endpoint = <&mipi_csi1_out>;
> +			};
> +		};
> +	};
> +};
> +
>  &jpegdec {
>  	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
>  };
> @@ -10,3 +35,57 @@ &jpegdec {
>  &jpegenc {
>  	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
>  };
> +
> +&mipi_csi_0 {
> +	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mipi_csi0_out: endpoint {
> +				remote-endpoint = <&isi_in_2>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_1 {
> +	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mipi_csi1_out: endpoint {
> +				remote-endpoint = <&isi_in_3>;
> +			};
> +		};
> +	};
> +};
> +
> +&pi0_ipg_lpcg {
> +	status = "disabled";
> +};
> +
> +&pi0_misc_lpcg {
> +	status = "disabled";
> +};
> +
> +&pi0_pxl_lpcg {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index 6fa31bc9ece8f..c6a17a0d739c5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -333,6 +333,11 @@ iomuxc: pinctrl {
>  			compatible = "fsl,imx8qm-iomuxc";
>  		};
>
> +		scu_reset: reset-controller {
> +			compatible = "fsl,imx-scu-reset";
> +			#reset-cells = <1>;
> +		};
> +
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> index 3a087317591d8..50015f8dd4e43 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> @@ -4,6 +4,85 @@
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
>
> +&csi1_pxl_lpcg {
> +	status = "disabled";
> +};
> +
> +&csi1_core_lpcg {
> +	status = "disabled";
> +};
> +
> +&csi1_esc_lpcg {
> +	status = "disabled";
> +};
> +
> +&gpio0_mipi_csi1 {
> +	status = "disabled";
> +};
> +
> +&i2c_mipi_csi1 {
> +	status = "disabled";
> +};
> +
> +&irqsteer_csi1 {
> +	status = "disabled";
> +};
> +
> +&isi {
> +	compatible = "fsl,imx8qxp-isi";
> +	reg = <0x58100000 0x60000>;
> +	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma5_lpcg IMX_LPCG_CLK_0>;
> +	clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
> +	power-domains = <&pd IMX_SC_R_ISI_CH0>,
> +			<&pd IMX_SC_R_ISI_CH1>,
> +			<&pd IMX_SC_R_ISI_CH2>,
> +			<&pd IMX_SC_R_ISI_CH3>,
> +			<&pd IMX_SC_R_ISI_CH4>,
> +			<&pd IMX_SC_R_ISI_CH5>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			isi_in_2: endpoint {
> +				remote-endpoint = <&mipi_csi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_0 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			mipi_csi0_out: endpoint {
> +				remote-endpoint = <&isi_in_2>;
> +			};
> +		};
> +	};
> +};
> +
>  &jpegdec {
>  	compatible = "nxp,imx8qxp-jpgdec";
>  };
> @@ -11,3 +90,7 @@ &jpegdec {
>  &jpegenc {
>  	compatible = "nxp,imx8qxp-jpgenc";
>  };
> +
> +&mipi_csi_1 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a57..c078d92f76c0e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -241,6 +241,11 @@ scu_key: keys {
>  			status = "disabled";
>  		};
>
> +		scu_reset: reset-controller {
> +			compatible = "fsl,imx-scu-reset";
> +			#reset-cells = <1>;
> +		};
> +
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
>
> --
> 2.34.1
>

