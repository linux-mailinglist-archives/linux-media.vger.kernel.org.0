Return-Path: <linux-media+bounces-36397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF6AEF37C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C357AC76A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47B226D4E7;
	Tue,  1 Jul 2025 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oComJHA7"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D35130A73;
	Tue,  1 Jul 2025 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362623; cv=fail; b=NjT9RIbb1F4J8epzAM1hXfxSGEQSmKtc5NJdLWQuFyjGSx+9n0lq5qMKV8bCm8pv5LTCPLkj9pOniNqh9ZTtt1sQ8NPxuzg1kcEfFQ4ogz0BCfFqdPF0Rx+2C6Xa2uX6pHCQMLhVwQU1yJRZwXTNaqo6c2QvvXU3j1IZFOWMOzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362623; c=relaxed/simple;
	bh=+jaxuokSHZsh7PHaeo2V4SlPDU9injMx/ymB187kH+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ERSMuLibKf619QyNjOfU+xTfBBe57EXYEWTSW+e/wwNIPLh14P2Q1+xwxCTm4dQvTvRinSte+9YZecFekOUYiQOquhnu70+ONQq094CqLyprh7UTPFpss1EZ8H7WKAvWCqkdB5vqMEpKNiyg4qehXzA7gP1phuaKkTpYrSkYYQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oComJHA7; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0x1we34AGnhb70q/4PsBSTxeglvv7/yCUvu/3Qla9Za0Lzy49V3l9hmQW/CKs58DJkdU4Vjr+9LRCZIUFLcG8FLRB++4ekjqkTQhVkLG2D+zUJjGogvl1W+DIwjrmlOA2jTHdorzwMM2NrzLovcS+rosdvzS/EAKNF+8YLkUWyKzo2F62VcZXPwGI/ybsHH6Q2+KPic53FH3Tk0Xj9kGlUOQQsvrKrjJjQQDlmxhMORM7k14rRJgBkhLPd1jXa9oDqId7iG8LHQhy3uTFnF3DO3v5evCYuKW96rKJuc6CUJO5jq9K5fZIjkteUHJTPFe4PbXgzfl9T69oDbsCJBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=al7ply/EvpkMKlpihNL0uRZNIP4lYYXDSRMwCB3+ZpU=;
 b=bItlOJmm6mAbtD/INIzhXB29SQXUX3zTFlk8ihyYk82yhdPQe9XExUrOt+nP59g7IhGuWreG5Efh8vTMDSej0oDj3FN+XQB2gugA/MOd36bMfyjBvF3MT+ZSCHgpNXu9BG2ho+UFDiK2R2Bv5eNdSxWS1L+OjVcEE8BWyRDyaPxSMApjNix28HsTTbdrLLBcMumSoXmAqYDvgccOkfzrEWJy1AFosW9OsIFr4avEB5WurklzvT3yiB/g7BjnUu5Z9ULvNzXes+iYOZEiy6pfiMB87qzBZQLCtnqDVxLHQKQ+ERtuTOi79k2v6WhpFqHfZ/CnDOpzSei6LTDPE8dmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al7ply/EvpkMKlpihNL0uRZNIP4lYYXDSRMwCB3+ZpU=;
 b=oComJHA7u5NoSFK7IIw5KfGO6VH8l+44hd8Uj5fQUpsW/qhuR5JSty0HHKNQl1IFnEIXOtMI9Wc+/NW8Xrkq2Iyy7bdtyb9Dh3P52UxcEpIn+zye9bkFmJNFH1TCCrYe6mb5k88AQltzB8THnSyBE5tCfttxtIeuBiIcNw7bab9d8qpxVLRvDa60IZU9wiPf4go5+kq+21jQOBojafcP7mmrO8tgjqfmIgoXB2jLSkk3lFqRmdJ98P260OlmaTzMcV2h0cahTETd05apcdhsUat4hztAYm0+3KcLlL3rCrMAloxsp2QJ8Cg1bcqHUkdhYqSALL8kz8VLRjOgjc7Urg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 09:36:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 09:36:55 +0000
Date: Tue, 1 Jul 2025 17:32:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Christoph Hellwig <hch@lst.de>, 
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <h7ovqshmy4s6kehal3gywuxxj6zf4uajqpu6lxdmo6id5mpvs5@e47v6d5tfe4q>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
 <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
 <20250630173851.GH20333@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630173851.GH20333@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e02513b-5221-405f-c49b-08ddb882d160
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/CmWMpjLL9VdoNvgD+vRguIQ7u0sIvEVL8znu3dj5KjtZUawX8KHvLkKxqT2?=
 =?us-ascii?Q?h19rVszCq7S0szPqigsZQRPCRVkWXkOrTVP2ll/sBFnWLZPecyYNIRCaaGZL?=
 =?us-ascii?Q?mfPqbIztHql2aXkl7RiunR3MT8Q9SHJMA9sKBP9SEYwe6HlpW6SjxpK5cKYP?=
 =?us-ascii?Q?rBn3wPV0o12t6IyJICpizCXJbdvkWrmEUkvrlLvL7IyJiY0rre0AdAKjd34l?=
 =?us-ascii?Q?eFje5X1LNg2MzDIDX3mJC6It7XfVh2dQkOLGxskMHYJZxMhaPmQgxfKx9kvf?=
 =?us-ascii?Q?SaYAiVf6krl+SX91Ii8b8R6PO4Wd4IP7aJufFS9TVL3lik0do+lGBZ6M9rk9?=
 =?us-ascii?Q?9JD7gLYtbSijQQIebcnXS3gLdse4HuIn3MqsokKopNk5+qhrwA5IsVCO5Cs0?=
 =?us-ascii?Q?Kys2ZOc0B4vSNVxLdy1roK0wAw4B+K73odhLEKSPWXlyMPL+v8ySKAzHzUJx?=
 =?us-ascii?Q?yhqysylif7Brg2PbsvEer8clhIqJaboTqWsox7AkZqCYcZvW6Q5uJsH/Z51P?=
 =?us-ascii?Q?l0SjlD8DfNkU2T61OOFqheWFyAWTYYPOGsyAcrLib+eWtyxMN9geDbMeCxR+?=
 =?us-ascii?Q?uQHLiqaxWGJXhjTEi05r91rN5ICTt4gVAL5p/WBPEIMIEPszABjbe92GbIDJ?=
 =?us-ascii?Q?M/r+8fbFXiMLFEHRN3GnfraBxT72IwnCcBqC2sZ6MaaLkgkLZHgqJ14jecKv?=
 =?us-ascii?Q?1xokS+NOzRlgCb7ycciID2aejUoOpZokjm5Euw3n+Kx7FKQegrJjCJ9KtfK6?=
 =?us-ascii?Q?JOhtOO49g4n6VdQCqySdtMKo+AKX+wrwJGEDA5E5BSdSHA9FYp8MbL8iL9Bc?=
 =?us-ascii?Q?T/tZ10Sg12svBKanDL1BiXyBO+fzTkKU3NULZFv3ilsc+uHSFbiMGohZ33ky?=
 =?us-ascii?Q?Q/3dasWLpl+n0l6m/qjP0I3ak1jaGTiLSrE/SER+pHaLPSWpaWoWmMvD+YnH?=
 =?us-ascii?Q?M0W8M+j3dUMNZ0iWlQqu4dWqoxvGeee9RwpO71KE7fTaId6kJUWlh60ex91G?=
 =?us-ascii?Q?EovQK/JKVEKTv+E24T9hWupHry4tzAjAU6QYO284yuBnCvY6OVphMwwp2adF?=
 =?us-ascii?Q?E16GIxKOs5Ie8+1BV/FdKQr4KTwfyYICJ5f3XP7iUFy3vP402EPlmfJ6npqt?=
 =?us-ascii?Q?4nLG6V1rIyUtJm9gN/W4YfM9BGUsLw4DqK5sHvLPPxmBtFOlCAfOqptO2TJz?=
 =?us-ascii?Q?ytngPgFeenrk5csmuEE0PeZGrtNx95Wx8T5tbvdvtowRK6tirUd95MXGAoYT?=
 =?us-ascii?Q?2plwV7Dn45zNp7Ikh99/d+KxyTbjvV6dnlecChImzCE8zqSTf40HPBvrdLgp?=
 =?us-ascii?Q?JXwwuFMVsBDC+aQ641WDqQdipkoJlHXfNNGAqlyR8J3Vs6FUqhFhH/T920tl?=
 =?us-ascii?Q?2cbKfacuo3NZqWUXCZDKgZSv/ZbfDjKyonU32/SZBIjLcBU0XYRZ0Ay7ayyG?=
 =?us-ascii?Q?xkkczBRHYs5+sCuc2HwgNgAnUytOYiSFjsA+TUSI+JmOkMJ8sx9wXTHcvJzl?=
 =?us-ascii?Q?Qfv7Hc4hQFotGOk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4b7ub7MchxeFUmihIZGwfBCskP3pg0a6v4MEV1PfHX9/Pmo53t8U5nItMe0g?=
 =?us-ascii?Q?VOUPu7EqDBvZjC/eCeh5WnyFW9werlVHJ0/2gi1b+hHonwhIyT7fDBlV5UDF?=
 =?us-ascii?Q?Vy0kRj8U6DDv5CzPnAVa3ISNqW8JT6FrhPcMMFMu4QpUIwPSU9QKQgpYKcnA?=
 =?us-ascii?Q?c97p+SunF/M9w9yyJ8Ch9diOHraZBPgppm2i7N49bRT9jay5jbbycLGKC81a?=
 =?us-ascii?Q?Sk1gaVMDp72n1letVowF9z1QKss0jY+WePYoedElYj/iMC4LPEWK7jf/hk/G?=
 =?us-ascii?Q?+2+4anJnHW2sf2s6YjrbwpKiaBOW0g4U3k8+wRzFQB/GLGRudx8QsJiJ6ri7?=
 =?us-ascii?Q?/NSOena3liifpS6plrw70oDeI8jHCU2Bgg/oiNH12IPTP/v+4dXxF55glbHz?=
 =?us-ascii?Q?hBxu2tDgw+OvALQk1OEM1YYGkVwHvbSp0wIg5x1V0Eb4FX4mvkdBoccnL4OD?=
 =?us-ascii?Q?AhBt2Eot3sbmh1PfEgG64wji3l8iPSm5UVbCcFac3mUF6bCLg4vv5xXV6kVa?=
 =?us-ascii?Q?lyA4l8Z5kjkbA7sdLEkxuy+yw9q1F5LVnhiNQwXuxquikivZZilZk6a6OKdR?=
 =?us-ascii?Q?FeI+0bOawWK8/89MrwHizLSjKPt+COtRVZXuJfJW2fvU6jrdlwsvoAiDdYZK?=
 =?us-ascii?Q?qpX3B0/AcLhta+z90T+JfYqsXT5AArmZHZuf6gXfRNragn4iPMKooLzJ+7fV?=
 =?us-ascii?Q?pl0IQXBE/EveBBrKbqmyipvp1cTGvlL7ZNQHKOs9DrDE5jJPciheEYBYnc1d?=
 =?us-ascii?Q?kF0f1visNGX6+b79/inltP1p42M1HDbPd4afxTRogAeUswoIBgtxblehtW4s?=
 =?us-ascii?Q?1QWKlexTARZ51ZsPKmSzt1WG8dXwtBbrQKDKlPKFR65OWImBv6lHnbegfv5o?=
 =?us-ascii?Q?JJvDSdcbqPWP31xZ1ubivyp2m4fDeVRhSpES2EwQxlWC5E/bHGHfunQXnlHl?=
 =?us-ascii?Q?aresscEylPiFWTAEd/Y9b58wYi2zV1zPetW0TFXQfCmbp+ZN13C1XmQg/hJA?=
 =?us-ascii?Q?bDUbH+uizTpvxhAflhoNZ6hpqBEPY8EwIIEj1kEdoyAKxcYrH3kpL4paYzJW?=
 =?us-ascii?Q?OCsncAFd2wE917/2WVJitldhKUiKmAo0KHGqNC5yvVvH8AMMSxFkch//RGSp?=
 =?us-ascii?Q?rzp2vr+XxPBG/BHqB7RgDye2tVouYUFVrnpwGUZnACvyfIsAujA5U9bbPXup?=
 =?us-ascii?Q?AmFGibYCmTnG3RHrzhqNmvFTgGZeCg9PS1gIvUJAZvhpzicZIWT3oP+IQ6x9?=
 =?us-ascii?Q?hcsB4ywaGRyfrkxep2+cbFA8BEqczd+5XE296mcRy2JTcqBs0LaGkRyJhM9L?=
 =?us-ascii?Q?gedHpna/J53vtUOu34j1qGaNTGX5XmVJYknkNAaRFve69aZxBAEDPrizKI3I?=
 =?us-ascii?Q?9J0dcQBA3k8dn/FzQKdFfi4fMiwUJ5hB5pDrxFwj3D7gx2QjxsYxazjFMgf6?=
 =?us-ascii?Q?cBOuCrpWViuO05C3+0VmbXr31du0NS7RBU02mYWUxv4kEvh0QUJfTglYx8QJ?=
 =?us-ascii?Q?HeGK7hny3bbU8G8qYdEP+WDMUWjNy98vvqdDty+JQX8aycXa4njxLGJ0Ee+p?=
 =?us-ascii?Q?m5EKVz4DNx2foopsy6waif/HV75I1muph4kA+CCP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02513b-5221-405f-c49b-08ddb882d160
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:36:55.6522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbKZdnATcsVgWPq+fN3+UTT4dR/9GVp72cjXBIBjvH5v2Yt4I5xkcG7s+lqfOeNQjkOnV1KRLi6CgvBLUGQcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186

Hi Alan and Laurent,

On Mon, Jun 30, 2025 at 08:38:51PM +0300, Laurent Pinchart wrote:
> Hi Alan,
> 
> On Mon, Jun 30, 2025 at 10:16:30AM -0400, Alan Stern wrote:
> > On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > > > Also, the material that this routine replaces in the uvc and stk1160 
> > > > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > > > here?  Was this omission a bug in those drivers?
> > > 
> > > According to dma-api.rst:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> > > 
> > > "Once a non-contiguous allocation is mapped using this function, the
> > > flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> > > be used to manage the coherency between the kernel mapping, the device
> > > and user space mappings (if any)."
> > > 
> > > Possibly the uvc and stk1160 missed calling it, but since they won't be
> > > the only user of the USB core, so we'd better call these APIs.
> > 
> > Documentation/core-api/cachetbl.rst says:
> > 
> >   ``void flush_kernel_vmap_range(void *vaddr, int size)``
> > 
> >        flushes the kernel cache for a given virtual address range in
> >        the vmap area.  This is to make sure that any data the kernel
> >        modified in the vmap range is made visible to the physical
> >        page.  The design is to make this area safe to perform I/O on.
> >        Note that this API does *not* also flush the offset map alias
> >        of the area.
> > 
> >   ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``
> > 
> >        the cache for a given virtual address range in the vmap area
> >        which prevents the processor from making the cache stale by
> >        speculatively reading data while the I/O was occurring to the
> >        physical pages.  This is only necessary for data reads into the
> >        vmap area.
> > 
> > So invalidate_kernel_vmap_range() is not needed for data writes, that 
> > is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
> > needed (but only for OUT transfers).
> 
> flush_kernel_vmap_range() for OUT transfers and
> invalidate_kernel_vmap_range() for IN transfers make sense to me.

Many thanks for your suggestions!
I'll do it in next version.

Thanks,
Xu Yang

> 
> > On the other hand, Christoph may think these call should be included 
> > regardless.  Let's see what he recommends.  Christoph?
> > 
> > (Actually, I would expect dma_sync_sgtable_for_cpu() and 
> > dma_sync_sgtable_for_device() to handle all of this for us 
> > automatically, but never mind...)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

