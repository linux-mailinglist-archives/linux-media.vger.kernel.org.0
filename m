Return-Path: <linux-media+bounces-58978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMzIGVjz4Wmv0AAAu9opvQ
	(envelope-from <linux-media+bounces-58978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:46:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B7418E1E
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B9C331DA6A8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8953AEF58;
	Fri, 17 Apr 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FrwMq52c"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CC53B2AA;
	Fri, 17 Apr 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415107; cv=fail; b=on4zs9O227XhA1VpM5lqFIZaaDCJ++nYzcnMRBUXjj1hbFgsKkPVPBBoWQSyV+8RtGa520NHNZowZnsAgJe9hguQV/dFOL6m0CuFkerkW1bjyrYn+cLr1U96qfJA5e1dOVYPU/b0V5+nqWDDRZlJ9rV0rVGwwpSe3u6rz2yh06I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415107; c=relaxed/simple;
	bh=YFEDu02q44MLsx8oQGkhtf/ys1giJJR+YZDFWnzGUSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lftJa4b49PLUmjMDZnl+cPBztKWHaiw3kd2ZVir2bkoXnPGdDepSlMhofjNC0ukyyXIpWkoGoGYOaY3X3XBks3gyb6B6awGDfDeFhdn2zXqD174RVJBJiAn+PSrRDVJxkl1UjABboOBzHwvwmo7zF4M6GiFqYvLQYWmRJpkY4T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FrwMq52c; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6FMobXTrqjh60C5r2XeLVfxpDwYxjNzPFjyGzrSYyLOryKhOmR13t0VghKQXk05LWoBixwn5T/4IVDR5Y08ywyCyVY/pwKOGtYl43WhH1VDZ265sDT8/Wt6JSNmNfmFLvzFaIajXyYkl82ZUKmGslHLIC/aRACiM3yrbTsGV94B1DW01vojp6KCt+AsdFy5TRjpjhvB43E1/8D7rkaCxHPr3gN8t6Rfk8cbM+eZbdCQXq8Qs7r1Gv+T47Ccc6wb1/ZgnHEsjcs2inBsEqo3ikAipQybhPQ41VDx4QBn63s3rO4LcF6CZodmgKygriqQm/emV/k8rCSODNbPZSyj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFEDu02q44MLsx8oQGkhtf/ys1giJJR+YZDFWnzGUSk=;
 b=obSTH1jx92WAsHJ9B0HWYNkSrVv5jIo6L71tdbMKok2kXRawfAuiqNjFutGGFKdJ/xpgEJ/c0B3MleJTsWBV0ioF6D+TgntcWL8ne+yWMhjzBr8DjZ3t4oijPOLaNpleq8I82sFxTHI4KbYPTowq2kxmGJndldRvOgcC+YvR+wsq0FLJ3aEmdvDXVTctRFB1wJB2ng2p/kXPT5WudYZ6Nug/jOCGhk/65jlvKojPsFhTQqxYnbFyptplwCPfKDljVkfKEnSZSYgwJMphUHMAnZcE8Fyyk6BXbBcEq58Yz93NH0oo9808MazdfJliPNP98KSle35Y+Td23bGFS5rD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFEDu02q44MLsx8oQGkhtf/ys1giJJR+YZDFWnzGUSk=;
 b=FrwMq52ckcXHY+n44y4FNJZzH4Xes7bkfTYLzIHdL9WQ7a3ZoCO6efDerfV6Wv38bEAoZiC0X2DoT7XWVy/nMnpOzHe47CdZ4suh3BCMG8TIraq6QALghS9g/5NhEcvPSNt+6xcgyKcAkG1tDb87mINpPqe4qJJe0IDPZYDRmMXv95MjWJvIiTKWIc3KsvJOp1dYxoC1VtutVtxetEp/bzNLUYLJLQefbnPcLM9d+lqtfcnUIwn9XOuJ3+qfuO1D/bmHm40c8OMrYOr69Br+doL7c5S/y+agc8izhX0PcvaUZQstd0Fea1hs3cfCzTuTcGyqV6SwrXDtEgzBxkT5BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:38:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:38:22 +0000
Date: Fri, 17 Apr 2026 04:38:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] media: synopsys: Add support for multiple streams
Message-ID: <aeHxeCOn_Lo6XgzJ@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:806:127::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: d519725f-d2a4-458a-1a32-08de9c5caf13
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 ivG5WEzSQdjNOyIkUsBjTJH2rvgHWtaELYBHVvdKt2pkARg58Y7SfZI3KfhjJLUzi7j3JcbNnis9/2W3O8SBP+FZ2kTzHYJ/+U86dYS9uURMJEhfwrvHiuZ3gT+41CB9U0hGEL1uJHneo2zNbcC2LFQ3SvadQLYlW+pBEgR6P5aywr48CawWs/mymqkNtQCZJ2dZQxcP4rltzOEpcCcG+l84UHDe+olGfp9XISFeUWa5K9rwnKrPK1k8gOM45TP4He6Bsk+I0SQOR5qQSBddNjw0bo6WC3OX/GYcncSRJXAyvQBXsP6NW5fyfeoAdNbOKGLjFQybEbVWeP8Eg4a2VIKuPCre9YtVqKgTAW2r1WNRSaIGQL/Q82b7vWxmJe6RjZM9R9UlvjAQNI3hVg+kPgJvO5RfM78tmqJAzYC8UeV87G/ln2JMSOIPLjkiz53uwRYffXvwbE/CO45WzlI+xjJsgwBAQRvM0M82b+rRPMyvDuwDRvBGi1GD3UM4T9JDkiA53Fo73uBTgeZ6xxd2e90N4vrZZOPvi+LfGdqQ96RqlNxPon6VMVKXEyLruti5DZbFCqwKZgG/lC+zmABnLXGpKEvJDRiPzvhY4yRyZvJx7LOhALxApiHmoDwOLz5rtvX6qyBRoU0et9LqSs83wxtSxP4W2a5A7AFk+ADrZGoNAhlt0/H0FduYh2thnrrnN7v7ulzEGrR2NfVYs7rM2/0atKhDCXzUiwjXY7UuMdkNnGEJu2UGjpedHMO/nHRYqe3LIb/OXgM51jnOZMJo3NYrOSpn6opktuVcKJoIXEQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TH68uuZrwjq9h3SLwnIWaGf9+Yv5qehRaBZPSEO9jR7R+Sp4Z/CPQ1K1mCTr?=
 =?us-ascii?Q?fTljGDnmAg9GJLlIPhPmtFCkv9NqtOHJyb0aIhEKYqexODYAGo0C/aHv8KaI?=
 =?us-ascii?Q?g1ZSW9NzveIycn+blCncUQAdcO8htJdIr9SDiWK80K7qwbejyHoMaUPR44B+?=
 =?us-ascii?Q?aCXOODqBxLvl4GWIJmHxfbKSSS7G1VkT80xEdQMROVOgvysDhZCFwiDOvSNy?=
 =?us-ascii?Q?0qNDRMHOfm5w88r6GqMDN9Hw/hLE/wjS2nFVSat9FoiCzjQ9B074EF2scy1T?=
 =?us-ascii?Q?VoqyRtZgX/liK3nqvwqBoQmVEjtYP5zTx2doARYuc3QkEp9BaplZUg4yNohq?=
 =?us-ascii?Q?70jkreYvq3bSdHXJq36H5e2jP8FmX98K3OROShnXIvaN9c7HQ+RcYhula7Z/?=
 =?us-ascii?Q?D3rCZau3rTp2hmHfQcNUjVj0r5f4bYvk4ZayaMQXPdD+n2GkGKt3CmXCjy9P?=
 =?us-ascii?Q?IvllZ/azRXQKDknW2WxXNoxf/JjBBoDRotrxtzdEwCufDM9TwF5cAMg3NtzP?=
 =?us-ascii?Q?Oyiy+x079ygmKjdpGtGZGCOg33A4I5EpFfSLcEbsNblzx2Yej04EpryLfvCg?=
 =?us-ascii?Q?tQ12Z/8sO5nsl244nzdkUmBeSdHarSyO30AeRIpjhiIJ3py2oZal90JK58g/?=
 =?us-ascii?Q?5j28jIKGJm4t6zV+R7k6Jh6vqjF1JDukqdT1NMhAC05IVKjoMmkC3SIFXE7m?=
 =?us-ascii?Q?UwVLJs6nzwzv1DJtUeBjauvuSut+mYNPUeBMuYm9b1J6+gbk5FqtD/GpCJtJ?=
 =?us-ascii?Q?LgTlWY7vCVZF/LZ6Nd9dJIDkakjzn8Pfq8vv3mM5LsCXHrBNnHPsFSbH3QOs?=
 =?us-ascii?Q?Vk4ixLFpS52wVKGFSYYi89+J92KTYMynPlSr68sWC4EbOLIGKJSk7in9jMQM?=
 =?us-ascii?Q?66eoAR8QMwGOgO3SCsNnZUEcVo56nji7VlISgW3hPiOdLS6FDPQ2EdFEKtYI?=
 =?us-ascii?Q?CZ9xSAfPb51ZX3TsmaJnBeukMtm3ffChf353NTmRJqJTDoCr9gJKi6Xq7csC?=
 =?us-ascii?Q?gc+TXktYudiJ+35tDVB9MmlZ029piY6vkaGJRgGMkkCwU8IyL+qDhu2Xzb/t?=
 =?us-ascii?Q?ZvmNXth9+EbdFdp63aMZA6cv6oLynOTb7SgxRG7eglYGRh05fwHY30aErSWC?=
 =?us-ascii?Q?QqUWh/qr4twKj2vVQ+T1vOYGtxB1Rg8Sv7BOq615gBfk22lnr61MWIk5CF1Q?=
 =?us-ascii?Q?fA/JMGtDY/aOLEEKyRCRFtwvXRi0ZeG1WPGGpq7vB0Ii5/0t6L1jX8OUwzt5?=
 =?us-ascii?Q?OwmZYgmRhZWif0E9RvILPyE0/wMBRz2b7pOecM/uPE8dUCVzLXvjk0oo3vuB?=
 =?us-ascii?Q?hXfkUb2ieeokh1vbd5lT13QjsNA0/HtefKDG+s/0+8J8iT6UOQKXj2DUOtJF?=
 =?us-ascii?Q?1bS16IppNSDSUKsWsXlQR/ysEKfmc5lm86Uail8as7RsRxxTt12YMIRDUcX8?=
 =?us-ascii?Q?mC7KmlM2KgGivootVe+zZlv6+85dV1qr78mJ5Je4Mf6f/3MfPJSXdXanOeWn?=
 =?us-ascii?Q?e5MoA8U7yhPhCc+AcEcD4MiQwuIqMqQK8zaRWO33DtqRyphEDre7HSARYDvH?=
 =?us-ascii?Q?IjDz6XEvGHpySx39cg24naWW6mVkX0SX88SKOHolDu8KzxKAp85mo/Md8xnw?=
 =?us-ascii?Q?wNd/EU6+IZyEDV6CVHHCf7QPEyJ9ei2Is0+xvTPk2w02jYRcv3gyHAcXX+r4?=
 =?us-ascii?Q?soObH/KuEiA9A0zlPl9jnwSrDnp2Hx4tyCC26VjpoqoOL9r51wMlcvyIXxWR?=
 =?us-ascii?Q?Sx+E7lWLZA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d519725f-d2a4-458a-1a32-08de9c5caf13
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:38:22.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QrORUYSJE3CS2F5F9OCeFrmHFfBxNTzsEWsQ/2GFa2OcVnBXjq/b3xRLddTOhO0uzPuW2iGcYusvWwWLTOsNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7753
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58978-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D90B7418E1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:53AM +0800, Guoniu Zhou wrote:
> The current driver only supports single stream operation. Add support
> for multiple concurrent streams by tracking enabled streams with a
> bitmask and only initializing the hardware once for the first stream.
>
> This enables use cases such as surround view systems where multiple
> camera streams need to be processed simultaneously through the same
> CSI-2 receiver interface.

Look like this driver only one sink and one source pad, how to implement
multiple stream.

Frank
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> 2.34.1
>

