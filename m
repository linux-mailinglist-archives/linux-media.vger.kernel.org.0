Return-Path: <linux-media+bounces-20083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F209AC1F9
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D02C0B23AB3
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF4F15F40B;
	Wed, 23 Oct 2024 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aXzbZHgk"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7515B0E2;
	Wed, 23 Oct 2024 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672889; cv=fail; b=AnQNZsC7CnayQZQYSmVdCR7hl3N+lba0uYGxxe0WL6Yv4gkcQoTBooPptrC1AVR3yaq1k7+wasngOhA5zlUflcFv7Kf1RJO+OTez6E3n9TNRnXE4pgNX0Yf5Ex0lWjbaJ/PFCIaAzALamcvYmiV+ni00Gwnm4Btdc2xiKqDnzeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672889; c=relaxed/simple;
	bh=LIoaPzRb5Ts43e1Pa0CWtIXJQifX4d3yI7vPZnIpY8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DLULhcYgC1eUKPxnCGoslJHc3/fNOHBrEVqMzEHb+xJjiqC6KjVSiPq7fXQ40DbjA5hL8BvJV+KS90fMKjaS1y2hdXlnClZu03WqeRvXQj8MAJCT0sxMtjpbVIjdqAaVySkj0qqMbP47W5j4xRjl/JaiNkvVwoKVOTnfzDtFNKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aXzbZHgk; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xulo8HCeTJXyuQBi+Dif8uPgZAewXUny1kQZ9c92XEdl1W3ZVWDBPsJJaxoSaNU0dARtlw97ywtXYrm2e3DZ1v+aCNYNiOaQ28bGwn0d7zomp//vm49fyzjZDTs1lk60iAu4DMQJaqyNk4oh6ojHMWiw1sFHLIluxm3QTzWyvFIdlw0qhTWwwSsTXm4t3rNt0mG/VgZjy+skt7ZRwy6qEvb5k0ma8NVB3/qRzCUC2/fi5Qk2rFLntdRTwONl/cyvVZC2JoHwjRuZcywz09zsqkcTI6XLluQjOF80u4LZB/pTqCuBQkdpFdF5JGe+cxCQVaWvGk5BtXSIcTdo5UOZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx6kBDaQZE/EiHL3xS3TkZt8wrRjHShV3fRez9GxyHw=;
 b=tU7ilyQJ+DRDF1/fxFutHSfq6obKO0KFOfxJEZaTnjfcTbPOTBwi5eR+F0XvFUPKxw5ewROBbw+A1Pbodb3+XK6v/0CuEquT2nblrZ+KB0O8KqWdiGKiQ9palrF8hdEN6te02qOR5x4qm4ShzOwUNy4Fj9P3bq50dAHaOvjlwcpcDxfDbSoaxO9VgXwloibMQfEE3HIs1sKz62AFv5rEeVElxoV3un8pG11vUSxB8bd2aO4DWcudDsbnJPzRcImwAI1t9WvAaXMYTrllD3TVsEdWLDXJWF7Wf+DpmqnZocCdsYshyo6C4WJpP9b3DuIDybChym9M8uJX+T/lWrzbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx6kBDaQZE/EiHL3xS3TkZt8wrRjHShV3fRez9GxyHw=;
 b=aXzbZHgklRDgTVQHSqWJg1yGrzYsydyij+MYVWqxM92Vu+ujTDr42iOIFUIarU8Brg3lLdEbglJsmvAaToKSKukpqLPHgr7OVGSPneo8S9Xwo5T1844ic0B/QEpqEa+im12H1IdkXrjEZPKU8oME7JFxyThmZbTDGrFW+Ow8QwtIvKwYWlNFl0yCBvBDBRfP+j4lVK8hzSfpDkhxQikGvYDddIgmqOUPiDcbSPrYCzTgZgTRM2EPmyc0G74Jc+rBVW79h+hnOJ2kFeMZFp8AsriTcMmzCC+xLR/J38+WMg6fQcY6Z6MtROEwKkCIL2odOvGHTqOe0aTF+Fx57KLDwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Wed, 23 Oct
 2024 08:41:21 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 08:41:20 +0000
Date: Wed, 23 Oct 2024 11:41:16 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Riedmueller <s.riedmueller@phytec.de>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Christian Hemp <c.hemp@phytec.de>, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: better handle the m2m
 usage_count
Message-ID: <3bgx37htukergd4zph4ahwp6bbz4n6efevnjgaivokhwjpx6e3@fl5bq35gbiin>
References: <20240927080420.3867806-1-laurentiu.palcu@oss.nxp.com>
 <20241021230519.GB8113@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021230519.GB8113@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GV1PR04MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f41426-2e5c-41d8-7cb9-08dcf33e77db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9CvN8EPxUFcjK1tDGDMKS31kv+dWk0Vp5iSFcbRL/VMmYoZbpIj8RIEyg5Zo?=
 =?us-ascii?Q?QXjK1jaTXLhXeH9I6JfQnmSVNWwJm0xikiP0Yy8/LQixvCtqhU7blvu9QYW4?=
 =?us-ascii?Q?c/VddzcAF2RMiihyqS8X6absBb9DJLiuDCoKmUhi6HMohgJO2aK+5J0kK/MB?=
 =?us-ascii?Q?zxQ7Kve0eR1/D4y3279YXiuykDAm7YBQYNNz5IMjsMiHjz/Fg8+YbClhXmlO?=
 =?us-ascii?Q?H/4ngua9cYX7FNp5M/p2sxlUSD7Doak4fe6MfFwdpLgwQTyx1BcyVKwctTAe?=
 =?us-ascii?Q?+L3fm0U9GJzVFU+pwqC3mPQHWxsduLmtfAvbNFEnHOiBFSY+2Q42xdYEN4Cw?=
 =?us-ascii?Q?ZDu3gngkSjxMUzTlBtp4ZanafK8QbEDMk61eoQIwIFzgY5Sa4ZI72GW7oDTe?=
 =?us-ascii?Q?HfHnPOgGy2lZdWuwRbbqyKYmAJHfWJ9t90yKik2AZ/v3tlgsjNr3RLBImpUB?=
 =?us-ascii?Q?6YHVZrC6l142tj0gAX2pVhTIWgh4Msd5ev0pYcbye+hC0l5s+qMb7dPzV12H?=
 =?us-ascii?Q?zqxzfDRwvTxAvw1B9swcb8y1v1OhJh/j5P+rCchG4mKtKOH0r3tJfyQyLdMq?=
 =?us-ascii?Q?9eVn7d5hB5BOK2m+fMgJ0eLoqjViZwJqwJhCxICt64955ObylXCbPcK66bgm?=
 =?us-ascii?Q?Q+aplf4CKCu/r3jepZkjrpk6LX4lwZFhpkYIzREhigRXt5cPIuTJg1kEHFZB?=
 =?us-ascii?Q?82DC/9H+gmQDTrfT7wgGpaubPbs1QpK0ZkfNN7c/jEjzod0epoFYTlkZvmq8?=
 =?us-ascii?Q?q9EU5gDgabMoBvWjkWZoIZ6Tb5OdHfYAgGQet6seESjf47kFlouE+7JknUoQ?=
 =?us-ascii?Q?cuYDdpDKwV+gjMu8DVnSXuDELicRC4VybgFaiJNrn31YWDKENA3HH3S0yJrT?=
 =?us-ascii?Q?Ci4FFDh/pkVEoIQZTjHgQz2FLeumtR2L2PCcwBHBU5IPEvbqQOKnDscsZdnD?=
 =?us-ascii?Q?cuIHQQwMCWTCrq1Wt3uMBATbGl260GErQaqrMKrVSzWV7FkWkl5v2uetS8Sz?=
 =?us-ascii?Q?tt0pvUmp2NZhMh+3uSJjtN47HkWnHRVULjQ0tIq+bjXi1hGzSwo5Nd58v3vm?=
 =?us-ascii?Q?lP4vr3M4+C0KCjwJmQfWKv6LG2RBALbGi1fNyuLUlI2WUAa5BahEUrAPJdDb?=
 =?us-ascii?Q?vJBtc+ng9rRN49k5oCm68fV02XQQY5oCdJac8PlAP9bYIlD8CQdAmhxQTspm?=
 =?us-ascii?Q?tgV48mCkUvZ0xmsGlgquAgyNf3PHlsCo/Nq3XDFq5JUfxe6XP2D04p/Q2Y5w?=
 =?us-ascii?Q?qAchoRdFGZz3cw9XZ6lf/irxHH8UT70ciDGLjH+ms4NRqhfdvydd6Bhj5BVA?=
 =?us-ascii?Q?mqtCAS1O2R3GxjQqn4eNRNAs?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?raAk5yaPIlho6UlW2HI4uvrjq021TiWe0996sAoqm28Fgdh4N65FlTMzKvnc?=
 =?us-ascii?Q?71yYD9xz2gKsIOxZhJMzBlDNT3s7PJIaLgegvL5QBRwmy3N0YuGlpPqjhbyT?=
 =?us-ascii?Q?KHdAD1CS9FqXPYjAMa8cn0xePjOHDES934Ang4JSH9yiAjjTzl5jZeEU62s2?=
 =?us-ascii?Q?jZNuppnCJGHagczSXaLDT0NNbvLgEBf/qjRgegAJh0zTu+hn2wZvXt03inXx?=
 =?us-ascii?Q?yHCLukTLWkQWQgj4jhrcZQagIWW6dDh5x45R6Wk6CkwwpaqfU/3tiWFhTLCA?=
 =?us-ascii?Q?JHdOuHEEMdHXxYKRc1+uTAmOmKaS1+0LGw1AYY2BlCs5tIAAlCACADjWlbat?=
 =?us-ascii?Q?FsSmM1g29ak3RIDTCgSsoeA/aJX5oq+m5rzSvpLACuThzJkPTkfUAKWOX7GX?=
 =?us-ascii?Q?mkmDYCttGFUySU7p7NNI8VIsQIqkHQ0U+kzzhaW7jVHjwbXN1G1CLo07ibBJ?=
 =?us-ascii?Q?NID00aiE1QBkH6V2x2qM8KBhAJgYEKmlSHAujv4P24fZ/Q2rM+iwl5CMBEIz?=
 =?us-ascii?Q?OSHxfC/W1XF2jYgWp6xTJcLVUSxyTqUSkFqB7PEr8Vd80+dVRBVxcGpDu8kZ?=
 =?us-ascii?Q?ecr01URizxPMwB0LTVamqFeEF+Bx3UlKbT8t+tox5AxscJfOk01VCE1u1/bN?=
 =?us-ascii?Q?kC8SiBIXRP4feSvECosX5X43eeOVbvGovWedzqDEVFQnbzu8QYaBwZ0Nqyh+?=
 =?us-ascii?Q?HBKEwc0ZM5ADBnzapQTMqmfI6RtHIc3Shbs3U72WidlD8cANGHU/Ch4T4FiU?=
 =?us-ascii?Q?v733pM6aao6eexV0jF0TziFZC2OAxm1dMsgFeRJAEW/TwltPNExiioP+iipc?=
 =?us-ascii?Q?zjty8kkGvUcJV/+72e5dEd5+l6pLiKp05vAZ8PwRuXjkaaPmWNVnQFPnbRrl?=
 =?us-ascii?Q?KOzY3IYylVLZzCfRrCjEWr5KeN9FaLY2adCpcp0+gleTgbmM8yZXu36fAkLC?=
 =?us-ascii?Q?i0tImfsCYyQqRnxI5FwHJR1VFl2g04eqp16Bzm7NJT/k8yGq32iQ6grWIbTV?=
 =?us-ascii?Q?MM0Rjusjjxrq1LpPNqEfnRW9S5GbWw0z5+DOjz3UrIoXSodkivbJZUc8suvH?=
 =?us-ascii?Q?xP66bFyOzbelLpecl4LyNOXcN4HqOye2y7FeO1tUkMd4K6Fm0/U5xvVEZ6xN?=
 =?us-ascii?Q?YO6SQW5bc/5viZXV3VFMR0dUbdOs1wnu0LJsuYd/NZFYOS/807b2Z+x9DqJK?=
 =?us-ascii?Q?TSsc71P68CNR/i6OCncb7+9jvB0dOLeBBtMsbAZMnZGcUzjkuz2l1zEsIX+F?=
 =?us-ascii?Q?UQrdDPi37h4yaS8TfN8iMaOvyKBLIabzIcCXldS11mcf7/hoCjVS1/XrXOgD?=
 =?us-ascii?Q?TlLRyg69/yAGx1imom2UBOzOx0CPR3+Zz9kM7MBCFNnK1G85PUkf95OrUAuY?=
 =?us-ascii?Q?hyHvQLkK84J/OuANbh5qHr2xhQehnXOqJd/zrywIuen4kYhtgQwYsNsZLfep?=
 =?us-ascii?Q?osqpkQOjLQ/R5apHw5kao0wvMoyGKNwhhMb96NsVC/z91o9xB8sEtEugn90o?=
 =?us-ascii?Q?c701MnM+7Xlff6cw0Tbs429N7nG+PiFwVAznDYYf0J91AE6Yq+XqvdRR851Y?=
 =?us-ascii?Q?zb1i/644qBSir4qqirgb4ZBp+Ld4ntv5KS3cFUppTiDwc3633xkdzPmLuOad?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f41426-2e5c-41d8-7cb9-08dcf33e77db
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:41:20.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U68p4RAnkskprLpd/eGyj69ALwRbfPO934ffWoHIdeaXXfRVaczi0UTkWPzUBcN+kGrakswCPTPBTBN/ExoqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9071

Hi Laurent,

On Tue, Oct 22, 2024 at 02:05:19AM +0300, Laurent Pinchart wrote:
> On Fri, Sep 27, 2024 at 11:04:20AM +0300, Laurentiu Palcu wrote:
> > Currently, if streamon/streamoff calls are imbalanced we can either end up
> > with a negative ISI m2m usage_count (if streamoff() is called more times
> > than streamon()) in which case we'll not be able to restart the ISI pipe
> > next time, or the usage_count never gets to 0 and the pipe is never
> > switched off.
> > 
> > So, to avoid that, add an 'in_use' flag in the ctx structure that will
> > keep track whether the output/capture queues have been started or not,
> > and use it to avoid decrementing/incrementing the usage_count
> > unnecessarily.
> > 
> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> > v2:
> >  * Changed the way 'usage_count' is incremented/decremented by taking
> >    into account the context the streamon/streamoff functions are called
> >    from;
> >  * Changed the commit message and subject to reflect the changes;
> > 
> >  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > index 9745d6219a166..3f06ae1349e53 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > @@ -65,6 +65,7 @@ struct mxc_isi_m2m_ctx {
> >  	} ctrls;
> >  
> >  	bool chained;
> > +	bool in_use[2];
> 
> I think you can store this in mxc_isi_m2m_ctx_queue_data instead as a
> 
> 	bool streaming;
> 
> >  };
> >  
> >  static inline struct mxc_isi_m2m_buffer *
> > @@ -491,6 +492,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
> >  	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
> >  	struct mxc_isi_m2m *m2m = ctx->m2m;
> > +	bool already_in_use;
> >  	bool bypass;
> >  
> >  	int ret;
> > @@ -502,6 +504,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  		goto unlock;
> >  	}
> >  
> > +	already_in_use = ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE];
> > +
> 
> As the streamon and streamoff operation are covered by the same queue
> lock for all contexts, you can do all this outside of the m2m->lock
> sections. I think the following patch (untested) should do and would be
> simpler:
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 9745d6219a16..cd6c52e9d158 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -43,6 +43,7 @@ struct mxc_isi_m2m_ctx_queue_data {
>  	struct v4l2_pix_format_mplane format;
>  	const struct mxc_isi_format_info *info;
>  	u32 sequence;
> +	bool streaming;
>  };
> 
>  struct mxc_isi_m2m_ctx {
> @@ -486,15 +487,18 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  				enum v4l2_buf_type type)
>  {
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
>  	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
>  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
>  	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
>  	bool bypass;
> -
>  	int ret;
> 
> +	if (q->streaming)
> +		return 0;
> +
>  	mutex_lock(&m2m->lock);
> 
>  	if (m2m->usage_count == INT_MAX) {
> @@ -547,6 +551,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  		goto unchain;
>  	}
> 
> +	q->streaming = true;
> +
>  	return 0;
> 
>  unchain:
> @@ -569,10 +575,14 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  				 enum v4l2_buf_type type)
>  {
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
> 
>  	v4l2_m2m_ioctl_streamoff(file, fh, type);
> 
> +	if (!q->streaming)
> +		return 0;
> +
>  	mutex_lock(&m2m->lock);
> 
>  	/*
> @@ -598,6 +608,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> 
>  	mutex_unlock(&m2m->lock);
> 
> +	q->streaming = false;
> +
>  	return 0;
>  }
> 
> If this works for you, could you turn it into a v3 ?
>

It's funny that in my first tries to fix this I added a 'streaming' flag
to mxc_isi_m2m_ctx_queue_data too. But I must've messed up something
else as I dropped it and chose the other, more complicated, solution. :/

Anyway, I gave your patch a test and it seems to work fine so far.

I'll send a v3 with your suggestion.

Thanks,
Laurentiu

> >  	bypass = cap_pix->width == out_pix->width &&
> >  		 cap_pix->height == out_pix->height &&
> >  		 cap_info->encoding == out_info->encoding;
> > @@ -520,7 +524,10 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  		mxc_isi_channel_get(m2m->pipe);
> >  	}
> >  
> > -	m2m->usage_count++;
> > +	if (!already_in_use) {
> > +		m2m->usage_count++;
> > +		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = true;
> > +	}
> >  
> >  	/*
> >  	 * Allocate resources for the channel, counting how many users require
> > @@ -555,7 +562,12 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  	ctx->chained = false;
> >  
> >  deinit:
> > -	if (--m2m->usage_count == 0) {
> > +	if (!already_in_use) {
> > +		m2m->usage_count--;
> > +		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
> > +	}
> > +
> > +	if (m2m->usage_count == 0) {
> >  		mxc_isi_channel_put(m2m->pipe);
> >  		mxc_isi_channel_release(m2m->pipe);
> >  	}
> > @@ -575,6 +587,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  
> >  	mutex_lock(&m2m->lock);
> >  
> > +	if (!ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE])
> > +		goto unlock;
> > +
> >  	/*
> >  	 * If the last context is this one, reset it to make sure the device
> >  	 * will be reconfigured when streaming is restarted.
> > @@ -587,6 +602,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  		mxc_isi_channel_unchain(m2m->pipe);
> >  	ctx->chained = false;
> >  
> > +	ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
> > +
> >  	/* Turn off the light with the last user. */
> >  	if (--m2m->usage_count == 0) {
> >  		mxc_isi_channel_disable(m2m->pipe);
> > @@ -594,8 +611,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  		mxc_isi_channel_release(m2m->pipe);
> >  	}
> >  
> > -	WARN_ON(m2m->usage_count < 0);
> > -
> > +unlock:
> >  	mutex_unlock(&m2m->lock);
> >  
> >  	return 0;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

