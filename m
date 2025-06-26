Return-Path: <linux-media+bounces-36019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39698AEA21A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 17:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE75A4E6948
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A82ED86E;
	Thu, 26 Jun 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aYZQymBo"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E172EBDCA;
	Thu, 26 Jun 2025 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949941; cv=fail; b=uqo1YpZfjlDlf2nWYQ7qSQIIqWL75bAMI0tq1FabWOWzrMIAr/nUCkVW+bmeNBIUgIeXbAFk/BKEWpS1ErNGa0k/n50pv8/xGKlrDG1WjRHG+Rbnc1Nt95EDx9TmJVV+QAhrfQO2XiEXQKH7t7nNiE/xx5BT8U6saVP00uqBzMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949941; c=relaxed/simple;
	bh=0EoPE+lgozMwme7OBgnq2a79gulSW18EWI4YbW+uOvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RNGHS49oUxL6153B7hlSj4C9hFujVqyWxhXnBgO5No3T/Lt82FKHqt+ORUIDk4yO10moNotgaGbQL8TOHPGDEOu/HDRNFom/gqwnrNhkO7y6Ghb4E/uQk0TtF9yvqxtT9W/cuOm270bnlJwM1MiVG8pKdAz+1Q+9ImjFyosRd2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aYZQymBo; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3ZUhizdGU9mMQ1nuo7yTfa5Qooj5rERH8OoVNP4HQ9/D2z3r7+Wnv7QcOUnZ2QUbSMP3P/l6/CLri6GDFYL1afcICOlpOln2n98VGMt/XtsLDxnpfQq5aZu2R8isHVvAWcTqqZ+qZTvtQFQWZ2VlxHIXiAGdqP/WakdUZsdgSNsaWBlWw8JxtxPxXV1SFpqH7TOFB2YNnokBpmfM/OUbWOKrcDiiYDOHR8D2erW8vh2V1nOjfCpQj8ItCvge9Thzd58SwWHjzCG3gOcj5XxUNJxwM27S10m9yqDe94ctlBnF89BEKNI3XjiDKG3KKFQhUkVh1gJZlUvnJBOjIr8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr0GLTkojtx4mcGiZPz9uMMWE+SjPmqYqOLDy5Krr8Q=;
 b=dn+Pq7oio93ww6slTslCFhT+A2RERqWPKHww2jayGa/xEe9Fp2hcmsHk69LnLJova6HBnZTTte3rgvYKHkbhIciDL+szp+tPbV8gpk9WQeQiuYt5ycOfdULv3B0yz5ndMarMygZEd9a3lJeL6EVM3bNc8j8hSD/WtFDMe63aPGI/Xggcug3WbgszdC6Z8X6Jb1Lkqo3BklbDG5At9vQxWq2U1fDMU74sJJYK6s1fcPF0NAczRVqP/9AREcy7BNfv2jRDoSzsNRW5OgO1OBYowhlU6fm5w91+7BpaDcHP2r4fvvaq9exLWWRg5UpBcP6TgCrtj39SHLiGkpzwUSU61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fr0GLTkojtx4mcGiZPz9uMMWE+SjPmqYqOLDy5Krr8Q=;
 b=aYZQymBoQ6gtavOK4oWZzAMg0bzkB88vhjXlSqyaZCagnU9YP4HmGQqvXBhgctARhmMxyiQ/Y3kEOKLjCvwBezCng9dK4Gg8ekFiOKqywsk5V0z2rpDzqizghWmpjO1qHQfl6bpShkOmebA7mM4/wDy5PskLTNFMuDvULLSxVIUo2r6AqVyW+lphhHvQO5WuJ1YSOiroHJXN1pd20Fe0Ccfbe5sYfFVNsJdQDkWo7qtJdZU3i6XKvkMmpSkUDPtbe/Lt7HngbIyhHZMh2Ct8C4RMi/BK/qtYaQy2V41PSj83Fvb++Y2vsI8IWbHkDzsg/bPzE3PNaxjMdDtBI+bLCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 14:58:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 14:58:55 +0000
Date: Thu, 26 Jun 2025 10:58:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aF1gKGjpbEPZYBr2@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
 <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
 <20250624185643.GE20757@pendragon.ideasonboard.com>
 <aFr6Ehpl5Kk+nt7m@lizhi-Precision-Tower-5810>
 <20250626124224.GK8738@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626124224.GK8738@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P189CA0055.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fa7ef7-b190-43e5-f716-08ddb4c1f8fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ek8i3344kY3GthSlH+VghhEzqKfU7lIDGtzu5Oc0SLDLMjpTN77NAkVgA1bl?=
 =?us-ascii?Q?eUeUZVJFrfsAzBWc5uHgyLsvGX0Dp10HLo8tk/hVyd5S0k961aj0yiN4DudC?=
 =?us-ascii?Q?y0ANSYhDJvRX6/7DW2nx9eRvIa7kqA0kDD3XNRNO5q/V31zll/2kUnriZlhA?=
 =?us-ascii?Q?immrsIvecKo1NgZo20nBFubZv1GpZEBTx0gKLVN/k1D2e3DDiZFIGqTcZwMV?=
 =?us-ascii?Q?paYg4mSmtLY2qYdzb7CwBT45Z40W/LCVElnYcAIjUN5dS5TiAwId4xUZT+TA?=
 =?us-ascii?Q?/F+wX5e4uVMv+r2oJGahN9Mx7ip8jLj7wIS9wEeyFtlp/b+VjuGqqFba197S?=
 =?us-ascii?Q?b3rTd3DtRexc+8ULG2iWYZDyYX4e9ooca0wUv+D1/KIg4z7XSNLm7kvXasG7?=
 =?us-ascii?Q?QTMkVXsdE1CZSWATNg72K+tWF4bOzDHbGvtJTfDjY8VCOVBGoq8dRu+yIAsU?=
 =?us-ascii?Q?aj8qQ8YHp+XpFf2SP0bA6DvSrJ+Yxq8qBjz/WkjGrR37q4gvqlRE/L750AXq?=
 =?us-ascii?Q?jpTMB5XO6mU0EC71d8Gp8ZLh/mk0zcivF9Zr025cnCK13BLSq0I6ko7cWrb6?=
 =?us-ascii?Q?aTYeMmAD/e3HA1I3WAkP6D3D12GG48sC8jpVyjsCclWfl8oqnPMsujmSejcU?=
 =?us-ascii?Q?UoOZJFwBVeVBp9FtFx0tiZ4Vv9qQmLLEAYg9tGXX0JXPudv6t7Yr0Z+tK0FO?=
 =?us-ascii?Q?EHFdvFeAsDuxl2sqTFD12l9YGpYTahf21bzASRQPrixRtRFM0w/d++z1hHmx?=
 =?us-ascii?Q?xp3lyCU/XRm82Im+7G9UA6o2naTR+XlhQqCZsCD8SBC0NTXmFhNAkXEwe+LW?=
 =?us-ascii?Q?Fv4xwitpdODoL+iw7070ByFkGhAHRFFruO4IeqLFXpgITUphv/vsiFuQgoa7?=
 =?us-ascii?Q?QBIaaXmh7Pif0K+MR2TKcqez4VapCk+PxLxdMkasiJx0JqeHxxp0e7nmORIZ?=
 =?us-ascii?Q?TBaZY4RUoLqaOFups00EH8fS/taxeYZGu6eZ+4UiFNEYNWIHKOA9OVncY8UV?=
 =?us-ascii?Q?AZzVXP7UAMIqZDInGc9hB6BtyGFPV00bFffbMb8au1gTL2IukwzEAoocAFeP?=
 =?us-ascii?Q?4Heq6dJMekBPWncNLtQtOnc09WdkENkZrVmeUMOnWrgIyAY7Jv81uQl77TQS?=
 =?us-ascii?Q?KpUAhOo2GMuW6jwSNBPGvXPZs305FgRNLLHHInIpZWEKH3tQbFi7HCYWBiry?=
 =?us-ascii?Q?vlz/aHiJqUe3vGh7o7CmwPuQUjumb87Y4kpJ8VDc1vWYDblH3maPcezug/qG?=
 =?us-ascii?Q?9ebviqnbxV4G8YQ4v2mNp7crnwHvhuX9KIwjJPUDcst/eEE891F6ROf7FI4+?=
 =?us-ascii?Q?BgHfe1qhVs6hlpkSvcIy1d9XNOdYUCcTcrMWLMxt+7FikW7+WzgrvJLZdaOu?=
 =?us-ascii?Q?PhpmhBb0jpEGBwtu+PWQMh5XcbmJnISGKoo4X3EAZZBhKrV3SefZkQRLtzQM?=
 =?us-ascii?Q?2/VVnC7tpnv/9qT/quUeJOIYMPjhVs7BguJhKkgzUTWlISSiWFUIRA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6Ozh9iSuXvhSZDXhxs4GOCnVXKNpsQo3Yumsbj033Hz9150efSbXzZvdDf+T?=
 =?us-ascii?Q?6d0fFNIuQ3vhs692bsGgaqCpWvxaFvdf0nx/DhbRcAX3RfkpHP9IObZYsdXq?=
 =?us-ascii?Q?40ugwhpjV0aKEU3AisZExABTVI5yMwfZhzix72gmPD4+y555dSBWqNBnMZvi?=
 =?us-ascii?Q?V8aVruLwD+0g8HIFWymRdarEv4UsZmpA54WpFaI/UeyC8zaEWQJ8l+fZTf5+?=
 =?us-ascii?Q?n/DP+S0wt3a+paHt506MNVYKzfqidmDZnKc7rH37OvphVk2/OsnAKlczi1fl?=
 =?us-ascii?Q?ufBh11LZTV6kc6/7NTanba7UOKoeLNvpk/GXcB9p4rSMIyc4BRgxVVv3MuJm?=
 =?us-ascii?Q?HUHbLLBhrjoiaEQHBih2fOA09xlc57zb0aADZAZdXU4Z039CjYkMxQ2AWVAB?=
 =?us-ascii?Q?v4FoblmvRTHovpdMtQEuJyGGQJBFk5zzOw9JLCczC17s3M5Xxw1ILrMyfwWr?=
 =?us-ascii?Q?7blhzNNyNPXRRt6lkvfQVN50r5efKLc/DzH7LWcdEky3gWYT63K8Waxt7B+E?=
 =?us-ascii?Q?psmBAplodo1Xvyv3iCDWk2v9HPX9K0CzbHd24UqWxk4XemtcmmJ5iL4rKAVm?=
 =?us-ascii?Q?Y13fOjpDFc1N747TpOGZWK8bQwAqCLP72gPgjlgdAKfZLLXckF0uGiBnoDJg?=
 =?us-ascii?Q?q4W0rWq7si/PEc3S2VkdKLUkeQHpsic1bnhkxLQ/n6dwvDkY3gUdRxTwgDqB?=
 =?us-ascii?Q?uULr6/ZB+U677xAEQk/hhAXLBAmzoG61qRJ+0QdRFV5Dc0CRe0/07SdkhV5g?=
 =?us-ascii?Q?nYi65jFZtoFvQQJSpm2ZnQcOdmOWpQ39sP5Jr4B9Yj/zS7s3qIgAdqOW+IYE?=
 =?us-ascii?Q?CrdAeY/EEXn2omWW2o4iMmJmSU2dl0pUwCTNI/XXat8OYu7zqjbpF2dgnKtc?=
 =?us-ascii?Q?GyePM/Tzax0olYUp++4oMtoBi5j+KIFawBuVEIlQp7JJuBCC66ZN6x84yCK6?=
 =?us-ascii?Q?OTNUDtaCrcLDPw9I3E811hQ95Suw0WHsNbFHWJZ804KBuofLanMqc4zeaGLw?=
 =?us-ascii?Q?0RTa9YfL3X8orD8pjin7Net66HpU+5Bigax0TFlEzphvq+VFimHZjQ4Hq2sI?=
 =?us-ascii?Q?l0RwMm2tFVxzRYmlDy0lDokYw4vabhU9FQBVjPdFW32eA7f33bcZnJwM9pt8?=
 =?us-ascii?Q?OP6qzWETYpvZ6/qlVKVMP/gz6coDmaA6Ob9JcXq1Rn6rhzWdNOHoITrtr6r4?=
 =?us-ascii?Q?mT3cUEzjXD8RERUhjrH5TdIeP2DAk8luO9UZn7NG4Un0XcY+NdMIcx0sbNbo?=
 =?us-ascii?Q?zMkGiPijDY5zt9n8f3/WPCdBubHeIuaw2ldW0xtbwhx1s+VPfj7iXpzbMCCw?=
 =?us-ascii?Q?AgaoerPbs712CF20NpU7Erd1eFgLfddDhQiGiuRFDoQkgCCJqEVas1rQnxyF?=
 =?us-ascii?Q?SN8p7IO+z/nZJCyJfXOIGi6YARBzf/P0Gdv6upoc+A07ORU17HbGBZuxt6e8?=
 =?us-ascii?Q?DxyUovI2DuQlX+NaAbUpMlRK80H979W4RPpMK1JHpPSGEzaQvZ/N0eTv8Xm2?=
 =?us-ascii?Q?GVDfzhJQUybRzt7mD90t1gzs35zVYJTIdVbcZhVYOexWOxjWW9F8cSia6ru1?=
 =?us-ascii?Q?3o6P3JS4I9hYg4SqvF3iduMSN5GGWyrY8q1Xznt7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fa7ef7-b190-43e5-f716-08ddb4c1f8fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:58:55.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBhODxYQxcEiOjscHitAqm6JvJLk+uTKpFSO5CdYe2gveUYPD+3R7lrEVy5iLesCXT7uPTJZHQ4ce/f1TkdPlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653

On Thu, Jun 26, 2025 at 03:42:24PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 24, 2025 at 03:18:42PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 09:56:43PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jun 24, 2025 at 02:47:10PM -0400, Frank Li wrote:
> > > > On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > >
> > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > > > AP1302 ISP supports single and dual sensor inputs. The driver
> > > > > > code supports AR1335, AR0144 and AR0330 sensors with single and
> > > > > > dual mode by loading the corresponding firmware.
> > > > > >
> > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > > Change in v3:
> > > > > > - add extra empty line between difference register define
> > > > > > - add bits.h
> > > > > > - use GEN_MASK and align regiser bit define from 31 to 0.
> > > > > > - add ap1302_sensor_supply
> > > > > > - add enable gpio
> > > > > > - update firmware header format
> > > > >
> > > > > One of the main issues with this driver is that we need to standardize
> > > > > the header format. The standardized format will need to be approved by
> > > > > onsemi as we will need to provide not just a driver, but also a
> > > > > toolchain that will produce firmwares in the right format. Furthermore,
> > > > > some time ago the AP1302 firmware was extended with the ability to
> > > > > dynamically compute PLL parameters IIRC. This needs to be taken into
> > > > > account.
> > > >
> > > > It is quite common when work with firmwares. Generally, it need version
> > > > information at header.
> > > >
> > > > The driver need check firmware's API version, if miss match or incompatible,
> > > > just return and report error.
> > > >
> > > > we can't assume firmware always align driver code because many user just
> > > > update kernel without update rootfs or firmware package.
> > >
> > > Sure, but that's not the point. The point is that there are multiple
> > > out-of-tree ap1302 driver versions, developed or adapted by different
> > > SoC vendors. Those variants use firmware files produced by those SoC
> > > vendors, and they not standard.
> >
> > I am not sure if firwmare is open source. Most like not.
>
> The firmware is not open-source, but I don't think that's relevant.
>
> > We need create
> > difference compatible string for difference Soc vendor.
>
> No, that we must absolutely not do :-) If it's the same AP1302 and same
> camera sensor, we must not have different compatible strings when the
> AP1302 is connected to an NXP SoC or a MediaTek SoC.

After read code, firwmare header only used for sanity checks. can remove
it for initialization version?

Frank

>
> > > We need to standardize on a firmware
> > > format to upstream a driver, and that standardization needs to involve
> > > the device manufacturer.
> >
> > we need workable version (easy extend) firstly, when let other vendor follow.
> >
> > Frank Li
> > >
> > > > > I want to resuscitate this driver and get it merged. There's more work
> > > > > to do, in collaboration with onsemi, and I haven't had time to tackle
> > > > > it. If you want to propose a proper design for firmware handling I would
> > > > > be happy to participate in the discussion.
> > > >
> > > > who is onsemi contact windows.
> > > >
> > > > > > - update raw sensor supply delay time
> > > > > > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > > > > > - update use latest v4l2 api
> > > > > > - use ctrl_to_sd() helper function
> > > > > > - add ap1302_g_volatile_ctrl()
> > > > > > - remove ap1302_get_fmt()
> > > > > > - use guard for mutex.
> > > > > > - use dev_err_probe
> > > > > > - use devm_add_action_or_reset to simple error handle at probe.
> > > > > > - use read_poll_timeout() simple dma idle polling.
> > > > > >
> > > > > > previous upstream:
> > > > > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > > > > ---
> > > > > >  MAINTAINERS                |    1 +
> > > > > >  drivers/media/i2c/Kconfig  |    9 +
> > > > > >  drivers/media/i2c/Makefile |    1 +
> > > > > >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  4 files changed, 2849 insertions(+)
> > > > >
> > > > > [snip]
>
> --
> Regards,
>
> Laurent Pinchart

