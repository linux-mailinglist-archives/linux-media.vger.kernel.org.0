Return-Path: <linux-media+bounces-28236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5AA614D1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3BD171D34
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F0920296A;
	Fri, 14 Mar 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="NiC8qz10"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138EF1C878E;
	Fri, 14 Mar 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741965985; cv=fail; b=BtuDhPEpdDBGlIowBHOOQXUXaZtR+4n1nsTZ5yJBSV77p4vQhcDgrl6u1rMof7Irn5Y8cAUrvi8D2s4Gsiz228QUHxafoI/o80WIXNROANrRQCkZClaB+/x6Nzy0IDtQC/uQoPcuR8qoZE8RZnoc+OEa2gyILAO5pAfjGPW4Hr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741965985; c=relaxed/simple;
	bh=lkTcyfToEJOPo/gO3ZvEPAhs2uz7f6UPojI6pQGZPeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qMvlExTAFNJbeorbvJpLTKs26R+2KFRyb7pFwO5oP6EVFkYlc3kqQ0MMlu1tPkXo6rWu/qpr2Ad+knARY/KFo43xVi9Lzlq5eCrSclm7MEadcxhRbDm0zRY1+w5HOwfI9TCMwJZalLTYrjL3RGPViMMkxjNIo9FSs9tJZJg2vRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=NiC8qz10; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqoMDziCBap1Yu2Dqusqp9sx4oBjJZdwcGqNvFosKTw4jW9JpYiLpWIRQcib7l/BFWn1Gk9ZUNIx3kpBaFbcPyuqzw974b8SHJm9wDh9h74pOFlYzMEUVwWLYEjTiXOu0uwDBLo+NLhCyB1wi4c71/b8fwsFCI4C408v3SvAs117TGOGY07MLSvViXJiY29zKE9B2TRktoDhZErGoM1Tge8e03fFZU5HkcBWtsw5gqDlgE1FjeeFPDLYNH8jaQm5rK9OqCWDMfKNojFS3cAD6How5Tx7fRaXuOwWmELLoJXxoaw16FaE6+jwoZ47VfnvURz35BeD5c/ZVF1iCfkMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex/U2kEkckYFBGjtS1F1srxDj0oUEaowyXHHuu7xQZ8=;
 b=lX5ACNm42dEQLJRSAb/XJXaQ0fqqPD7FmhNxfwvWJHKR3cekREhH3bW7hEziX0z3J3oUh9oEqgxXU2q8D6hS9pgysLbsB+f1TGiqHZMBPPLwjbko6X3cUnUgF3xYE2JNs6khXy9TuR6h+E3Q4TeXFPF6Tra/g/HLqmrsY7Rp1kgfNbGtLPM3t37VRIzrwZR6Hj7RiS0aIib1tXAmlQvZ7emZfc8XKkcoywio33BKpItaZANnru5e2FLry3jGtLbnYSHKCMpCOuQxurTindRyNcpEGO+YaWtoLLynF+bEDORe7ECDY8nhwt5jq+80jvJ++Kk9saaw22s+ze5UlOsoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex/U2kEkckYFBGjtS1F1srxDj0oUEaowyXHHuu7xQZ8=;
 b=NiC8qz10L7nwQxaR+rCQNBQ70NQCQrfBxZtNTcxZqiGY567H86bFtAZ8PJGj5tOKfLDCjz0TDg4FcL94B/gU0A6/nv+fz7RPU+n2pim8kva0dweUWcyUVoYcRsNXrqaYibYJQVqwGoZxYbwWc0nLaQvXt34inVTQ94fHW6UQ8pAruxn7DL6+Ci41S3olbQxAfNribgxP9t8WWzSM/Q9GaDhaZlz5SPRLYVk38L0NcjcBwjBlU7bnbcdwhreKZIzCaBX4OW2pljNDfssQ7zk93JwV6XReu9aq79yk2jKCsXjJErNh9I9hR027qdKnIOcTfzkgfqZwIBAtEzkPoXYIZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 15:26:20 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:26:20 +0000
Date: Fri, 14 Mar 2025 16:26:14 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z9RKllMJ0Duac83Y@mt.com>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
 <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
 <Z8r21Z2HthBwGDSq@mt.com>
 <Z86-AFnPQ2wXKidi@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z86-AFnPQ2wXKidi@valkosipuli.retiisi.eu>
X-ClientProxiedBy: MI1P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::13) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU0PR03MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: d2af97d4-98f5-4c5e-9356-08dd630c920a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vsk3WQFMExYDjx2jHkbi2xWNM65PO2FnVpSStZlK7zLP9a6WFd/tPh57F2BS?=
 =?us-ascii?Q?Mh31FVkPQ//0vWXVerBFVUNh2KDZrtTkXsnSTdgIDp/l+X0aGc3AKuQHLFaJ?=
 =?us-ascii?Q?aZAQMFlHhdHmmg6XO4855oEk99XKHteGHg1Ya3V3FYX7tBxytkZCGuNgoG10?=
 =?us-ascii?Q?JnnJrmBuHXjZSYuOovTIaEDMsSY1llazP/IIPZsdIgV3zg2eJ3Dsd150p8ol?=
 =?us-ascii?Q?RUH/Sy7jR13NxH+gghA1vt/7pbUkEJkcyfRLr6YA6fZAoPTMXuWDBXsO903U?=
 =?us-ascii?Q?e4DVBRnzXYfstT2AJYZCjTh/tF5wMkv3O95XKv6qQ5pLBPEIa3u78h1xTe5m?=
 =?us-ascii?Q?CGRHpkoyUaLqkBYDipBO+hi5i8/pvJNHuRLjRcIZM5kosmUU/kfVhAqbVOj1?=
 =?us-ascii?Q?fJUKpOFs8Ou86TKe3K83CBA1zPTRI+sasPOyNjhlKjDDhNFU04Yt00NzetDl?=
 =?us-ascii?Q?EQu76h0fd3zUNT1iKEJRsk7M8G2ulPwob9Km6K6MRi82Nv1jGLenCatLVgOL?=
 =?us-ascii?Q?26Cc5dL7HjhQZ99W9IWlZlBTc78C3taEKkw+g9aLJu7jD/oCYoLD43crD7To?=
 =?us-ascii?Q?jZ6rm5joSmDeeee7LDShIdPklP45uEQ2FhoSPesF04tCBugOO67ARgtKIHUX?=
 =?us-ascii?Q?yUabRfCw7Vg+Gd5gK+kYDgFVHYeRMsJaCnfmKoDb7AUqLex5TVYllxjA6vHx?=
 =?us-ascii?Q?ujfKixNN1Wfh61DNv0CJKtIg841tnrXz5bAb5Jz2v2GoOcTzX8TydtlfFg2E?=
 =?us-ascii?Q?sarCFFUkcGyo9wvK1/3AQ8GSXXQokn9k88SVjGT77OGx9I7gvnJiOQBiFk+C?=
 =?us-ascii?Q?NAA+nG/I/dnOzv1BW3PZOMxztTD/NzMFI8vxzpJhehT968SeZHqj+piY3IF2?=
 =?us-ascii?Q?uH1mfnxm2syz14ORNuoH2oluLrlp/GNSAxb9plulM7fTP927qkSaW7z8bTAS?=
 =?us-ascii?Q?4yDaI0h8nWOr5ruuQYzCVdrulsIqZNlcKmZDuk0v7NSU3KXuOCdR9IkoGcuK?=
 =?us-ascii?Q?aiXBWQ7lMWXnpxnERzx9txM7FPCckNpGV+Qb1B6oFpNu+Eqdu7CeqynR5sIL?=
 =?us-ascii?Q?v4936VWeX6wEKrjJL7sqKHwcdVo6CHsbN8usFdBjjBk9kCwxWSbGD3jtHUzZ?=
 =?us-ascii?Q?Vn+2v09WiVRmqYDfEW+tvDdsf9zC4/gYRdUhpSZW4yyuBAaVg+W73ISTuNbc?=
 =?us-ascii?Q?/bNil3KdqBW/Dmh9OYyBm86H8ElJ+qXdPzOpSrdL125xrQAnAgLxGhiAGyTB?=
 =?us-ascii?Q?cTiT6eDPp1acDSxXh6qMXRluVe2XVz6zh24HPi58PYg1q3DW1hSOPCYLF4vP?=
 =?us-ascii?Q?iPLQKxx3FVP1vpaWpgl817SsfrYbBhor6XYCXoyK2mYHGfGZ7m94peYXiU1G?=
 =?us-ascii?Q?PPvLWSFqtjUk3t/RiMDwP1qhkMUjkeVDhFOAA78soelNZ1WtAJQK7V6fK0wa?=
 =?us-ascii?Q?WhTVcoSVpYXez8fzs4ji+5T+J018eaz6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X5gYPSGbXNDbOiC7aLBsQuredoqbW/jDSKcTZWvkklYSTrRAyqItT5zHk5Ii?=
 =?us-ascii?Q?r4lWsFbUSlWTYdm+enpCdMACGPEIsPHWZAgCUhDBck3GDdXSQAWZnxkqwPJb?=
 =?us-ascii?Q?v8QOSPt/1bn5MKW6LWzFp6mQlKhoO4C4iSV0vg7mQVC4BhB0MQsfifi6TW+l?=
 =?us-ascii?Q?mGEB0Tw/PGG68k8+x/LEeqLoEP6Ch6JRrCHarq7hHhDa6o9bKhYPValZRRxD?=
 =?us-ascii?Q?vpAfcuUhUYuXQPrYeqQxVxaglm/cBjHyZ4QLmRQDJr9Za5bgrOHNr08Xle4+?=
 =?us-ascii?Q?wDNH5WMovbvqO6l5YQgFsC6RUL0TY3xakLOSBzNEpLg663E1upuRXFeeszPd?=
 =?us-ascii?Q?Obm5Pjxg50Aao5c+laWNYZ2QeesVzORlFzExjtl33Mwj/7NhYGgwR5nxieNf?=
 =?us-ascii?Q?oTqciUM/Ct2adjrQPSMTXWg71M66u93SrLy5zuhhSKMB7BUK2eUsAC36Evu3?=
 =?us-ascii?Q?pSRrZBE+qGFdZf9AJD8MgomR2GaNNplLdEkSJ/D/oE/M1wsq79XlQD+LGKcc?=
 =?us-ascii?Q?dnMnALTDzaX1MfSUu5lSNsedQLtakvoAP+8a0s8FBYvznTvdRgMNcrwIuqX+?=
 =?us-ascii?Q?zrD5npDSUqhMGjTs5lUe1zLJ9bU6AI4ZsrBq983rDUz850VmUJyaZGvsVFYu?=
 =?us-ascii?Q?V/XWHiRCdXOarvU8L9UppmTOiyUs5jPZPdKGZUMLUbHQvri1l4DYokwYBLhs?=
 =?us-ascii?Q?vaaWmdXa10ACsWrQC2Q3uZKyEY8OtHegriCmqpx0xNYqGI89SEvipNJhv8A5?=
 =?us-ascii?Q?mcz2c4YWaTRUmn9McyKItXvfc7EhZO/mAtYfW3BpDIwFcPd2hiG6sI1Xjd1c?=
 =?us-ascii?Q?8mo08n2bbxUfrNWd/21r3iRV62lotMeUyMM+lr5Hk6yiYTAO0M/Q9w+zuXVo?=
 =?us-ascii?Q?orvf50MMbz6okNSdWuAgke6KbbV9R/2CNe/QohYA4YcEDsBkD3DcnpdRfT8l?=
 =?us-ascii?Q?WfF2RdS1zsBE5FBYzjvFWwWH+GnVxG3fJwozEE73PBEcpf/4XDwEgHOQsyLB?=
 =?us-ascii?Q?GdlFKKCUry3ghdc+CXmZmXalvzmaPOtFQ0TABfBQhGp3ZrXoGorFV5skoq42?=
 =?us-ascii?Q?82XK02VmPpeb8QafyivDfBSaPvNyyOtZlrb95o9hpveSpIqQzzQ2z43mpmcY?=
 =?us-ascii?Q?acsoBEja6//TqguddYygxnCPMMNfjPdJqlKQyqxvk2GPfT5uLBQWpkO8EoZv?=
 =?us-ascii?Q?fawYzG6bMHqnD+f8c0PazQP5BtYTqneyMq1JAA0+JtYhirx+ZboCZunGm9Bx?=
 =?us-ascii?Q?Y9QizZzzZbJxjiU5pjnT/u5i45h31gybtbL9OFqNu88C+32hVs7YdY9dX47+?=
 =?us-ascii?Q?fWcTSjooobQZJAv+PXta6nrocbKWBwo0fPkFuN7OhOn96X5KUlCOO/NZG/Ks?=
 =?us-ascii?Q?6kI+24txp3SZsXuThSL3SB9720Dx7bwt6g7L6LaUB59XMBlflpvmR9+8w+tU?=
 =?us-ascii?Q?cGLanQnYd6KgwFT/MTcduEXcwRLzfabSyzYEWT8Shy421IoNnIUascayOiin?=
 =?us-ascii?Q?cHhwbgHuooJQUBdm6fVE70MavmwjxJarSLCDSVCCFaFlWj5TUYKsXLKAhhkV?=
 =?us-ascii?Q?whn3MpNTOhLYju6pTsYDgOpO2rrpGcZtKj1BBcEg?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2af97d4-98f5-4c5e-9356-08dd630c920a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:26:19.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt9Noa/RdxBMY/u2hFasC1NinHd1/H29/M7boNej2ig8ZItyv8jocT2T6kA5uBV/kyOu2/pFR8ylJi6xOI5LUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599

On Mon, Mar 10, 2025 at 10:25:04AM +0000, Sakari Ailus wrote:
Hi Sakari,

> Hi Mathis,
> 
> On Fri, Mar 07, 2025 at 02:38:29PM +0100, Mathis Foerst wrote:
> > Hi Sakari, Hi Dan,
> > 
> > thanks a lot for your feedback.
> > 
> > On Thu, Mar 06, 2025 at 09:13:46PM +0000, Sakari Ailus wrote:
> > > Hi Dan,
> > > 
> > > On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> > > > On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > > > > Hi Mathis,
> > > > > 
> > > > > Thanks for the patch.
> > > > > 
> > > > > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > > > > The imx-media-csi driver requires upstream camera drivers to implement
> > > > > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > > > > implement this function are not usable on the i.MX6.
> > > > > > 
> > > > > > The docs for get_mbus_config [1] say:
> > > > > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > > > >             The media bus configuration is usually retrieved from the
> > > > > >             firmware interface at sub-device probe time, immediately
> > > > > >             applied to the hardware and eventually adjusted by the
> > > > > >             driver.
> > > > > > 
> > > > > > Currently, the imx-media-csi driver is not incorporating the information
> > > > > > from the firmware interface and therefore relies on the implementation of
> > > > > > get_mbus_config by the camera driver.
> > > > > > 
> > > > > > To be compatible with camera drivers not implementing get_mbus_config
> > > > > > (which is the usual case), use the bus information from the fw interface:
> > > > > > 
> > > > > > The camera does not necessarily has a direct media bus link to the CSI as
> > > > > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > > > > between them on the media pipeline.
> > > > > > The CSI driver already implements the functionality to find the connected
> > > > > > camera sub-device to call get_mbus_config on it.
> > > > > > 
> > > > > > At this point the driver is modified as follows:
> > > > > > In the case that get_mbus_config is not implemented by the upstream
> > > > > > camera, try to get its endpoint configuration from the firmware interface
> > > > > > usign v4l2_fwnode_endpoint_parse.
> > > > > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > > > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > > > > configuration.
> > > > > > For all other mbus_types, return an error.
> > > > > > 
> > > > > > Note that parsing the mbus_config from the fw interface is not done during
> > > > > > probing because the camera that's connected to the CSI can change based on
> > > > > > the selected input of the video-mux at runtime.
> > > > > > 
> > > > > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > > > > [1] include/media/v4l2-subdev.h - line 814
> > > > > > 
> > > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > > ---
> > > > > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > > > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > index 3edbc57be2ca..394a9321a10b 100644
> > > > > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > > > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > >  {
> > > > > >  	struct v4l2_subdev *sd, *remote_sd;
> > > > > >  	struct media_pad *remote_pad;
> > > > > > +	struct fwnode_handle *ep_node;
> > > > > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > > > > 
> > > > > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > > > > field to zero this way is redundant, just use {}.
> > > > > 
> > > > 
> > > > I was going to respond in much the same way.  This is equivalen to:
> > > > 
> > > > struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
> > > 
> > > Thinking about this in a context of parsing the endpoint, in fact the
> > > bus_type should be specified. Presumably the hardware is D-PHY, so the
> > > correct value would be V4L2_MBUS_CSI2_DPHY. This way
> > > v4l2_fwnode_endpoint_parse() doesn't need to guess.
> > 
> > I think we must use "bus_type = V4L2_MBUS_UNKNOWN" here:
> > 
> > The i.MX6 has two types of camera interfaces: Parallel and MIPI CSI-2.
> > They are connected either directly or via a video-mux to the CSIs
> > (See IMX6DQRM.pdf - Figure 9-3 for the connection diagram)
> > 
> > Pre-defining V4L2_MBUS_CSI2_DPHY here would let
> > v4l2_fwnode_endpoint_parse() fail if the camera uses the parallel bus.
> > 
> > We could distinguish between MIPI CSI-2 and Parallel input by checking
> > the grp_id of the upstream device like it's already done in
> > csi_get_upstream_mbus_config().
> > But for the Parallel case we still can't know if we should set bus_type
> > to V4L2_MBUS_PARALLEL or to V4L2_MBUS_BT656 - the i.MX6 supports both
> > formats on the parallel interface.
> > 
> > That's why I would argue that v4l2_fwnode_endpoint_parse() must figure
> > out the bus_type from the fw node.
> 
> Right, nowadays you can indeed do this -- it wasn't a long ago when you
> couldn't. I presume the bindings do specify the bus-type property is
> mandatory? Where are the bindings btw.?
> 

From my understanding, it's not even required to set the bus-type as 
v4l2_fwnode_endpoint_parse() will try to parse the endpoint first as a
CSI-2 bus and in case of failure as a Parallel bus if the bus-type is
unknown (see drivers/media/v4l2-core/v4l2-fwnode.c#L493).

About the bindings:

There are bindings for the MIPI CSI-2 receiver:
Documentation/devicetree/bindings/media/imx.txt
I think here it's not necessary to make the bus-type property mandatory
as the imx6-mipi-csi2 driver enforces V4L2_MBUS_CSI2_DPHY anyhow
(see drivers/staging/media/imx/imx6-mipi-csi2.c#L677).

For the case of a camera with parallel bus, the camera endpoint is
connected to a video-mux and not directly to the CSI. Therefore, we cannot
make the bus-type property mandatory on this endpoint as it this wouldn't
apply to other use-cases of video-mux.

> > 
> > > 
> > > > 
> > > > > >  	int ret;
> > > > > >  
> > > > > >  	if (!priv->src_sd)
> > > > > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > >  
> > > > > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > > > > >  			       remote_pad->index, mbus_cfg);
> > > > > > -	if (ret == -ENOIOCTLCMD)
> > > > > > -		v4l2_err(&priv->sd,
> > > > > > -			 "entity %s does not implement get_mbus_config()\n",
> > > > > > -			 remote_pad->entity->name);
> > > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > 
> > > > > 	if (!ret)
> > > > > 		return 0;
> > > > > 
> > > > > And you can unindent the rest.
> > > > 
> > > > I was going to say this too but then I thought actually this needs to
> > > > be:
> > > > 
> > > > 	if (ret != -ENOIOCTLCMD)
> > > > 		return ret;
> > > > 
> > > > Which is weird.  Better to break all the new code into a separate
> > > > helper function.
> > > > 
> > > > 	if (ret == -ENOIOCTLCMD)
> > > > 		ret = parse_fw_link_config_stuff();
> > > > 
> > > > 	return ret;
> > 
> > Good point. I factored out a helper function as suggested.
> > 
> > > 
> > > Indeed. get_mbus_config() presumably wouldn't return an error but
> > > correctness is usually a good idea.
> > > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

Best regards,
Mathis Foerst

