Return-Path: <linux-media+bounces-36443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4CAEFD7B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DF1A161C6B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACCA279327;
	Tue,  1 Jul 2025 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GO7FMA0j"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3127877F;
	Tue,  1 Jul 2025 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381746; cv=fail; b=B2IY91YrZsFlaaRlS2TIaYCIwJQqKBEQmG/n+oo3yuHWzpjBqFBNmkbJwdDgruf32kuStiRqDRmHvpe8mMA0JY4H+iu4nvyhleNOg+rooNF/YAMVNCvOg8WqVgwNipIxbKmQbHEC5XWQWzYJVdmBE4WcimWJTyy2LA1VxWAmUvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381746; c=relaxed/simple;
	bh=4dLUBA2nxUwBVRt9XPPpS2Sd6t9tuGRSSKU/TzRiiYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JdIGH6Db12OXsanyEhzekZGWEyEKxqwg2e66UHsKwSEL3YCDtUOSsm9TYYvavkiV0EbPGT0dgv/A7kvNwPwJ8FW5ymdddu3ZcU6P/nhcOAUjVEiolFpbisjuN2e6OfHpnN9tziq8JcaJjogF+IXHmpRVrTTEumF4Jeh6R/UC8Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GO7FMA0j; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhFhFxvolNxwhPAT1ODTn4tch0eNhw230QvBaImXQKxMyRmaMC0Riig3DgJmRE1ei4MlPTSb27lTM9v5SI9hPIYmhBhyTY9ZWtXNq/v76FgB0ikUIx69a/Rpp3IXjutPPA0o/PB50aexOB6QInUup426ixsyC6KcUBAEpO4xhhuvgD0a+wqm8XaUQtjdtoJV6nX7i7MIKWqAeEyNjrh5EQDdIpNOGDNfme29vknlUxkFroCaqtfGYuIsp4Do3oUFj5miPfbztTrJ3vgtla2521PvLjGveaKr/C/RL0uMQs0mLilf4kcirt1+PGmrROLm4SNhEzNM6ApQOzLQdTvUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRfy1/FsypdEnIZ/gdVit1n+BYF8G/ALWq9d5pynQbA=;
 b=GfL2+SXAfmiXUu2kzoX9VTkNnQjB5wTKA+cZc4qaPCXD1ARD6vNlC6EMgTksy4iIeVvIlbNn05A/PciiBy3Q2DozkAZcfsBW15tF3n4gOtY1v/luLRQ/rLjRxud4AJ4Bha8dzpxkrdRYmnCd8yL8HCFJj2lvFwjehgaPI6waXdPyzamZaiWnM+LVEQoczFqXzPjAAT3NxpYMZ0/kewcbanEGq7fCMC67E6iQD4TyCXXYUzEilTT/NtAeyrS57H3QA8O8EWOlEnT5ff4fgVD5pmEGoF9TSoxaiMo++oiFhuEAmpYdmwbQi3OuYOF2sY/NmPmy/1FzzrwzaqQWMvepoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRfy1/FsypdEnIZ/gdVit1n+BYF8G/ALWq9d5pynQbA=;
 b=GO7FMA0jJdSuJhn3NmGiGGP1wZ5jAf66njJosJPue8sXTO11bPdDrK/cyY5WfqJRdIzlyjzTPEdHmi6NbABKajGAa3a4zPHPKf4Zp6tT7x6Z9dQiUC9kctm3PFiHDxcSmRhJRy3K7oJvLsbhxWGRPmMS17F8uyQ9phs6OzpMpI7zSMavUAFdma+6tAxEcvs6XD2KpD7lYt0AYjNExI6QjwziZ1HQpezHu4KUi6i/VJnG/9BHGGj6J2qCh+HAkA+5wo2k236meYeebqE9g7wUOg2e8ytSRiUN+nnmPAE5QRf0eujB714cknAXSSn/tp6UEgbIkkaDVYg8trNdlQvfaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11215.eurprd04.prod.outlook.com (2603:10a6:150:279::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 1 Jul
 2025 14:55:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:55:38 +0000
Date: Tue, 1 Jul 2025 10:55:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 2/5] dt-bindings: media: add i.MX parallel csi support
Message-ID: <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-2-eccd38d99201@nxp.com>
 <20250630225340.GE15184@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630225340.GE15184@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11215:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c56cc4e-1a9f-4e9c-09c7-08ddb8af5795
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?rpL5gBEoHZq/VCrGXIJlo3Y9P2FZSTBFCrYnLTrx3oN8PBtBf6YF1IG51N9x?=
 =?us-ascii?Q?BGE3lmWo/BExPD6WU1kNjVDXMdQglhkpUEcWPc3OoTshNbYaq5pw1wCdcyca?=
 =?us-ascii?Q?EAKOrCfMaXE8xDbh5xDZPXf2kym5DuXEHPZnuPO0TbYcHw4EKfhYu2yFt2QL?=
 =?us-ascii?Q?GQ2Ud5Ygl22kZLZxCmnZx69c4an/9Mev2ih6laHRAQzCRr37+ZdOdEtJSLYo?=
 =?us-ascii?Q?iqVeNi4Ey7FMnlNPzoX6K/8OxPG9Do6pqYhlxGmxTO/555kPlal2PsySFBHV?=
 =?us-ascii?Q?ME4Sxv7iIrLHh8oAjCKHLhqE/HhDuIMulF2ix76aX4GDuq0xvTfvSJwIN9/p?=
 =?us-ascii?Q?+8dEHfS8Q23feOyfGEFw2vzXFGIFMpKM8zcxvWaCOyfojENmqk9A1LEg3Tyd?=
 =?us-ascii?Q?Hnj3kGH6uPcwjIwCwBKc0UpAsX0IR9TlrIh49FS+8gl7TRVAf1isbz5LME1h?=
 =?us-ascii?Q?+DE5NFUyHEJEhpD1Zb4jMAWwAsxaKHMKT7dlIfQ79Yf0ZzwxusyPxYV09U+I?=
 =?us-ascii?Q?PeWl0Lp3M0hHxGYhlZNwaMtGZTj6QNnRGRSCSGkFZOL6F3019ccTAzxsvD/6?=
 =?us-ascii?Q?WSz7Ykg54H8rr7PCB1qmI2veJagDs6ibqYGLXXAiOwI6ny1zQCNE9dv0+MTu?=
 =?us-ascii?Q?W4xFMAIimvkHGKSQ8C7LwHoX7gYIV9MfKmJrNAhsDU6++yzMVXCO96pFpM1S?=
 =?us-ascii?Q?pT1tsvYl0mJI3R97L6YjChIzwet3BgUcDvr4eIT7oyEzWYwN63/sNy3NLoVJ?=
 =?us-ascii?Q?YExmeO1n3ZjlSRAevGkcEx1eCm+LPBzK1GFkP58OlBPvv7DhKLX7U+Su5rTx?=
 =?us-ascii?Q?vsKdhTolLy1WgbXLV8rKo79R+YBCTMvB0+ET/2aSxT7W6Ie5CMs+IN8OlTF0?=
 =?us-ascii?Q?Flu4qdFCUhnFqrLRdVg3SXOiuqiq3tPNOu5WuGRVgdTrKD9/XVqEhoDpyTeI?=
 =?us-ascii?Q?G9mE2ih//D8zuFeYnE27AOYkPsmkNMTMrtdjh9+mWscsy9851TsQRb5ph9jY?=
 =?us-ascii?Q?gQV/kBLE/YRmIaopj/NdEQc7LzmTuuHprEHhlrxwDYmAsEy9Ypr/KIZb0/4G?=
 =?us-ascii?Q?1MMVGeJN4AWCZQNBIjDoinUzgN2BNtvomJFHprsmugigbD29w+LMUCAGKYDI?=
 =?us-ascii?Q?OGAoOIdF1vAvzTjAeBmYezNKjIhlVLlERGffFmY4n2Rc+dJc/MEot4jFApJJ?=
 =?us-ascii?Q?AbYbejpzl+FnaY4NCRFHFRtKMPOFE6s1HbMtKDB4t6RpKDHF5Iikpm9z1X2b?=
 =?us-ascii?Q?yl5owTU3Ekc28uKlHYBwV73lbLChLk5UvcuclMCgNUkYuWoqhs6BZA3J2J+i?=
 =?us-ascii?Q?cs4rQqAn4+v0rmxuMt9hhG7MwNoPs8yKNij9SKBCNFMDtVqEKuaGCNm7rDRD?=
 =?us-ascii?Q?JRpON6I5cuaP/hHziytgoFSQ+ed2s0haPsGbrr5cuRP8LJvFrxUVlI2D0X5P?=
 =?us-ascii?Q?SFAeBx0UHdV97LBuf3b2sNxrkgCtG/id?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7qEmaVOKdGga2LQDxe0Ee/n6HNKJ/5WE6v0B9EJz3kyF+unJaVtzcNsUU1en?=
 =?us-ascii?Q?n/v1shbiyLqT5kh3wuXrWNsw0oX/QmpIV76z+t8RL5UN6uqzCAa94BS0Zw1i?=
 =?us-ascii?Q?avl9yQ1OrHqJlN6q9RjOQFtYqeQFAntVHn1rDCUwyBenMwb4eJGXpN9dsTx5?=
 =?us-ascii?Q?RNqUHWGmg5uC8207QM6LYDhwnK3O/P/uooG+mg+W7vWvTtCQx08DFG+RzSoI?=
 =?us-ascii?Q?fDEZvVw6WilZYQOIe87oDvHOlfDAeTeIh4nrQUG/IHPa/flf653jvBCxaDVm?=
 =?us-ascii?Q?rWijU3acttVYBTGkJCsxU1xDJGv0q57jT52z078fSY0CAPNlQVb9u1ItkpUl?=
 =?us-ascii?Q?JPosQaDRtakjHZg/IlilPHmXXYbOe20w7EDQ7AQrbw8GAl5GqbnaRtX74wcv?=
 =?us-ascii?Q?bcwjjLG9bG4hZRHpLMUW7IzHsdkln4GPAf8/Z1XlN1pByVQco+m1YoMSRp1T?=
 =?us-ascii?Q?Kdhropzb/1fL9Ux8GJC/5xNV0PHxNeoqQ9TUGiHe87NyDWMC81XeCBb5R0aY?=
 =?us-ascii?Q?0s4NMKKfRtTVyN/1Rzz4U0KAYa46vi0TahueiZHv228jstUnDIQOGFcas3B7?=
 =?us-ascii?Q?mgDYKb9XT02B0HfZJwiaq/8OWFTRo3H9tRrUpyOUlefMwShSCZjESTtWY/gC?=
 =?us-ascii?Q?V4AMWNeeCLaTu/yYSY8IYJDVsLUDEpRHuikhmZ0UfM5MAYQpdNr6BW9XCuwg?=
 =?us-ascii?Q?toRXPfZ4kQn8S+8iky3A92i1dHRLnGMtfoic+bl2XRh4mqmuRLkxXPNrCFhg?=
 =?us-ascii?Q?yJIUK9j8grXz+CnPnJ5KcdCdBScINTW6k/18HZwJspR8TKG0hnBmDT9FUWzh?=
 =?us-ascii?Q?4AJgUmLIaHzkT43U5QrF6GbqDzfvWVAi6cwT6TzPBu9PBoWuqhjpsmBM7ag3?=
 =?us-ascii?Q?Pkm6OTG0DY5t5u9k9E4yZEYuvvFfajLnNBqr6w4gJPz9ZuzijKyFifdxwvfV?=
 =?us-ascii?Q?NLEZWWwGgwIokpHuHjzwns5VJR/n7uNwI6DtgaGrWn8KyUmYtiIOHbDFLpuH?=
 =?us-ascii?Q?gotyWpZdQIEawnqjv1F5mwuDMNFXAMjClwyFTSFW7eKmFnpHgfVfYAN0osEC?=
 =?us-ascii?Q?IvO3jtpl7rE5qEeSLeeNbgQWKVCbaz13DbQu+K2ju59YjMclZB82gHaL5abE?=
 =?us-ascii?Q?2+G4iPUm6xTfwcq0wSVwKdmnIXAyo/pC1Yob4ClIJY9bJ9O4JS3x1/X7er1o?=
 =?us-ascii?Q?FwmSpqD06maf9bB4+ap1uwhMOpkVCFZpgfzgTji4qncVQHHpo7PiVpvYTWlS?=
 =?us-ascii?Q?DIGh5eBEb+FFj7ORSVs4MOUP9yLgYa/tvYU+ugjq/8j6YwkW53urtv8QIVSh?=
 =?us-ascii?Q?zgOj77Sm6n29nOE3bLHCBaDKQEOzVMMVbran8LRJWJoSC5EBOgjw+EO/WRSW?=
 =?us-ascii?Q?tzpwPOs+BHCXuIINBaBXieS06qFougLcljxylAervcNhiMs1YQcwv6zxnMWg?=
 =?us-ascii?Q?6607L+rbBvsX9JrDvUkPbxUX2lcpO+ax6Iwsrng5vyu4H4wEzioUhr3AFdZJ?=
 =?us-ascii?Q?rnpHIeG26w6TKfqlqgK+q02f15joMJrr1cFCAvsLHRNzyOBmqZ1VvOwrFiiN?=
 =?us-ascii?Q?zQ/Kwl3NZkYZEUkGDvPPSlCywTgCuhxXKsqsBO1O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c56cc4e-1a9f-4e9c-09c7-08ddb8af5795
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:55:38.7826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9h3Q4H052TpnOmoq51r/kikUs9LdckPmIZ8WSyQnLcvKOWNR7rtDxFJJiED2Jw/0rpEsLY8GBBIbp9Z8yLE1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11215

On Tue, Jul 01, 2025 at 01:53:40AM +0300, Laurent Pinchart wrote:
> Hi Frank, Alice,
>
> Thank you for the patch.
>
> On Mon, Jun 30, 2025 at 06:28:18PM -0400, Frank Li wrote:
> > From: Alice Yuan <alice.yuan@nxp.com>
> >
> > Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
> > and i.MX91 SoCs.
> >
> > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 109 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > new file mode 100644
> > index 0000000000000..b4657c913adad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx93-parallel-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX8/9 Parallel Camera Interface
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +description: |
> > +  This is device node for the Parallel Camera Interface which enables the
> > +  chip to connect directly to external Parallel CMOS image sensors.
> > +  Supports up to 80MHz input clock from sensor.
> > +  Supports the following input data formats
> > +    - 8-bit/10-bit Camera Sensor Interface (CSI)
> > +    - 8-bit data port for RGB, YCbCr, and YUV data input
> > +    - 8-bit/10-bit data ports for Bayer data input
> > +  Parallel Camera Interface is hooked to the Imaging subsystem via the
> > +  Pixel Link.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: fsl,imx8qxp-parallel-csi
>
> Is there any chance we could avoid calling this "csi", given that the
> whole block is called "Parallel Capture Interface" in the reference
> manual ? "CSI" is horribly confusing as it usually refers to MIPI CSI-2.
> I suppose calling it "PCI" for "Parallel Capture Interface" wouldn't
> help :-/

PCI is too famous for PCI(Peripheral Component Interconnec) bus. It will be
more confused.

Can we use pcam? fsl,imx8qxp-pcam

Frank

>
> > +      - items:
> > +          - enum:
> > +              - fsl,imx91-parallel-csi
> > +          - const: fsl,imx93-parallel-csi
> > +      - const: fsl,imx93-parallel-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pixel
> > +      - const: ipg
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - ports
>
> Patch 4/5 lists a power domain, and so does the example below for
> i.MX93. Should the power-domains property be mandatory ?
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx93-clock.h>
> > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > +
> > +    parallel-csi@4ac10070 {
> > +        compatible = "fsl,imx93-parallel-csi";
> > +        reg = <0x4ac10070 0x10>;
>
> The i.MX93 reference manual doesn't document the register set for this
> block, so I have a hard time reviewing this. Is there a plan to publish
> a new version of the reference manual with the complete documentation
> for the parallel interface ?
>
> > +        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
> > +                 <&clk IMX93_CLK_MEDIA_APB>;
> > +        clock-names = "pixel", "ipg";
> > +        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
> > +        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
> > +        assigned-clock-rates = <140000000>;
> > +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                endpoint {
> > +                    remote-endpoint = <&mt9m114_ep>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    remote-endpoint = <&isi_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8dc0f6609d1fe..3bd6772c11539 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media.git
> >  F:	Documentation/admin-guide/media/imx7.rst
> > +F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>
> --
> Regards,
>
> Laurent Pinchart

