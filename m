Return-Path: <linux-media+bounces-29253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA03A794C9
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87773AE298
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 18:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A96B1AAE2E;
	Wed,  2 Apr 2025 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oOM/h3ca"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0619993B;
	Wed,  2 Apr 2025 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617037; cv=fail; b=CrEjJbsa1pUXgmO9akHbe6jQA69kpzOoq2f66bVif2EmiSnSYYeQClydyHO0qaFVfcj0jN6Iz5vxmu/YGQ6Qanmgz4VAPqhx2wM7CvEgjiZNGfc53rjqM8JplN+8SpLgCSvIsWAB3PY96n755wSCOwaHaQzSijsgihs9a3O1pwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617037; c=relaxed/simple;
	bh=lgGKqsfwHtUI/moZaf0qqkjIZkt5sRvexiCV1ZUdZWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nl81iDwCqRUkjXOzUhWnL27cC/vzPWaJDfmgaOb5EaxPWFYQBmZTlvDrGamPM/nnTVYPUTxjgo4BYSHOTT6D7CIQ2QjH8/aZMEoxTxveSDLJIL/7mhFggdnFo4Xz77eu+ohgy4BlWb0WTG6OKKNvd3wDf1dDkfI7gDAI6s1mbuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oOM/h3ca; arc=fail smtp.client-ip=40.107.21.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJduTeTZ+xv4bI+HhRhYvfwLgFrFaKEcQEqZxzkEFEzji3KuvEv1+D39vkphSzTyakGtmxALB10vxAc8HztRTNee+HPT+4vaWvlZ167JMijaV2KTOkSCkAd18v46dRvgQB/O74bpbeScQwcxeH83XC5nq229Z6RvxhjTeWhVok6K8g/PgMrIASrO6GVUwd2ORX8ACAVS2C04ViqgDM6B4ofPcmu2F851YPYn7YgyzxLNKgaJmA9EutM5X9kMBY0Ut/iZlX3fbpbYzWS0Ec1u6P/38jztlzc8kjZ5hxQTljUhNYBIECVSm0ltUvkW37O6HuDGsOxGRW3yijvoLUz/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtwyV13W7jXj+sv7O7G/GKWc3g/z/IpECbc1hsFvijQ=;
 b=LR5G4nJlhVIq/4Wpycz1uSTGpUKcGvnz9t2+XZR6EQkYgKJ/+ybph7N9p8g4C8fx1ZSSyp+IoWuABYw2szJFFcDnqzwAuwjtRghKqxU8Z/rmZJDLs2SPjKUrnq8FNyGB0oFkshWyuPrZhTa9dU+xJiw89UoBois8RKMY4SpmIkA9++yb1nsPJsVdKmGd3+/xvjHtkKHbZLb86u68JY2toj2h7bvR5EIydzquq3CZ6onQHq0jL9q6w8ee4cmJaFb4F+Qk9fzCN+fXX1EO9Kgvq731NXohHIgLTNbDE1K1WDzq1J1JLpo0aXYFZ+P8Dxh1T9PrU/1IOIfifz2BFREWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtwyV13W7jXj+sv7O7G/GKWc3g/z/IpECbc1hsFvijQ=;
 b=oOM/h3camjBQwW6xky+Pm45rmljPby8ivSNUsaJNzjo7vNmVfQ3oAUsW/tqh0Nsopw3BZY6V2MQ59LLWgwpVfy4bfKKyZPXlqbniROV9bf2ycW5Slh3nREZP8zYTgq5ijhJ7J20ok7Td6oDbxkG91y+fbFFJ7IlZe9+EIdEimOSbB+4KSAJxS8Q2UceYKP21vaQkuIY59GYVIAnYOWX7We0ApWtem4vwtzS+mRS4icsR5b7RamSqOpQV/YilaWOJspLXoS0yHO2ulYgJI/7kgspkCrdUoYSKRqL5aBhpa307w7ujFilRn1hQ6Yg59yqOuO/AsRjFBDolR+Krwa3L9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Wed, 2 Apr
 2025 18:03:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 18:03:48 +0000
Date: Wed, 2 Apr 2025 14:03:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z+17+YucWkGUMIZJ@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
 <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
 <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
 <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
 <Z+v6Q1TRpJUkF2oh@lizhi-Precision-Tower-5810>
 <3b212947-0495-41fc-a143-c695c0c92269@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b212947-0495-41fc-a143-c695c0c92269@oss.nxp.com>
X-ClientProxiedBy: PH7PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:510:33d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10079:EE_
X-MS-Office365-Filtering-Correlation-Id: 08201930-741f-4658-d77d-08dd7210b74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v0wpaXgdZZ4KQzIbcdhjLQcvuVm9YG8h2L67CgnYIMwO4xZ4TSQH02vN7oq4?=
 =?us-ascii?Q?G06eMgAMbG364Sh/Sw8iWhGNWHWbNUAAUa9pRLFwwzt5uIuaDAD5TSAfklL4?=
 =?us-ascii?Q?kQS5C9FcFs2oIPLYYQEAda32lAHxoUT/3kj1UOobvyrMDL3q5v9dMMI4GQOP?=
 =?us-ascii?Q?G65bPh4O/il6LY32LIqFMuFqJud3RCRUvPqQVEhnZqOEBYTck6IHVqFK9CfS?=
 =?us-ascii?Q?zvlnTisG9fAmmBO26/kgrFV7dU5KexXceB2QjtJRImG5+iFzJ6IqoTRFxYKL?=
 =?us-ascii?Q?J40QW9wSVR85Tum8YhjV/5Sa0BURox3Q+vq57wGk5PHXkdwIe/AcFsyz2seu?=
 =?us-ascii?Q?L3yTyIWHQntM7ZV2SVTwJX58RA4omDb1zTC/D4ViMYBf8LgUuYyV84V4I5QJ?=
 =?us-ascii?Q?HtDm2tz75Z9Ht9m+3FhOLQsdWN3Li5lhyupce92YDaNklmeOsUcEjJ9TEdga?=
 =?us-ascii?Q?DGjFdlVUHItVzkgKdXZ2tPeIwlbDUvEnRn9NIqHpqxqGUXUeIYS+p+K+SGGL?=
 =?us-ascii?Q?L3aAIwr3gT25Oeqypeuri9+tULV2D7IOXSe8YyXnBcJO+jCn3GEA8WITc8fO?=
 =?us-ascii?Q?eh9tNnbjMG22tbXqV320A6dCp3Ur4F9vmHb7rjuyJJYSwjs0+8TbZ4mZOKQk?=
 =?us-ascii?Q?ZgkRyNs2Gk+ytdbyjL5QpjwoWTjxY6pBkZxL+nAL2lPA/YK0DnX0iwbJwevJ?=
 =?us-ascii?Q?A6faIUApYxYd8/lsgGrlFMQXDCy6XRBF3qOb2XzwVMTovp4IzbiOLRN6QtQk?=
 =?us-ascii?Q?TR1oGQOYdBE7uYcBk2XqpO/Tgo5xSm6EJ/0yBvfd8wR7z70df4c7SOpLsaeR?=
 =?us-ascii?Q?ozA6nSu6eyrtNxdDr+uynlPmh1XqoxsLpRNjKI6rUy6CBWF9YbsQFm1R4pil?=
 =?us-ascii?Q?vZN8IxCu4nzkY57+BFBUc3M2EJ/EZV825ZA300drRH/SGmooZaGn2mqHcdOH?=
 =?us-ascii?Q?aBUr4KMe4Zxa6MzR/PMyZUJeQXWflRwvg53dk4lEegR7KRMxRRkXP/wSxlKw?=
 =?us-ascii?Q?FeaeY9GLSV4aHCAingucRZxkWBT5Y41QUBR8DdJU9JwBO3TweLzQH8OVZfYj?=
 =?us-ascii?Q?F9BzfJAtjA1o8IHK2fUvOtQX+98VNIlOTMswriIUJrV73isoIFAzgr4nXagf?=
 =?us-ascii?Q?/YFSh6fdl3qzhsbzSBMT3kyiUq+xrIsstRW61jsQX4/L6D98BtQmtSYwIMf+?=
 =?us-ascii?Q?eI2+GP57mg9O3LiBv5I1gW9YxAO3RibyPr+RMjWIOMgYe504fmZxBpVJwLd2?=
 =?us-ascii?Q?awM9ZP8xwfczCNAJIGcf4w74LNqiqHtKwJNFbJy055GX4Q9aqWd5XQszpgx2?=
 =?us-ascii?Q?+LcZ0MUJW0EfcmeINO5biWV56QAFkks3JaUDMtRrWv9+6bI88be6abIKxzf8?=
 =?us-ascii?Q?nfd8KIHVlqqwFdt1UiEnKkq1M4CY8ZxhPZUKTkwQTQd4tu/l4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V9n7lecaYZZ7f0XGUWJghDUP8KPn8YRWs18D/VE5R81vYGGzDmn4TogEC1cm?=
 =?us-ascii?Q?h9AFkkbdTo4etw6JBYOGnPMcI8nut3xDmTjrbsTCaMywIvU6rUF9gnojeikt?=
 =?us-ascii?Q?Royh7PL0Kio/No3L7P0UzP8Jluqm6FNBk9UmLJZU74rOu4YffDWILcDGlmQA?=
 =?us-ascii?Q?ak+Ze2wTMJXTz5bmUzHed+4SfEa1+d/QTLw9urwIFYs7L4h+Um6DLmcLlKmB?=
 =?us-ascii?Q?+JLeigJxGqKes0fkEHVxpxG1X8hzlvQqMnO1oUjdZKCUEcE6OMThBlG8S3cP?=
 =?us-ascii?Q?v5KcuohFwNRbChR1s/1cf4ihxjrHyTsysHoYsN+VS5ZEsoutsG3BCssmUqdh?=
 =?us-ascii?Q?7IlX5ZYjBQ+ehWLT6+xuNdqV5FeMqc8rOxjD1HdY7xdQ3FBqiQ7sDQlVN4Ka?=
 =?us-ascii?Q?oID04ClSid1P3StRi7KUjyiDfFefUqas5w3d6pBuG6aMmv6eUTGmd17JQgTU?=
 =?us-ascii?Q?Su1K/Xa9vDQ70ObBA1r65mEPsBIRdkR6CbFInW1Zhp4ovezrv3B27LPf6ndp?=
 =?us-ascii?Q?oW6wJLEi52iTuvzxPE9WnoHxY7ikjq+6cjzTq0CjlHeF+agFgD85y2Doozl5?=
 =?us-ascii?Q?FaN+jrV1o30TS1BMJtIBSNAyP2QDnJiN6cn/GaDdwzTaGLq/iqPnox02c+rB?=
 =?us-ascii?Q?3Va52u/9nhvBEWce4Fal3NKNg59kxNDzzxc1KcK4OyStWHeXiQdUMBnK2tDj?=
 =?us-ascii?Q?1ckt2BIvGyN+FakL0KezHSyPhKTy9tr9csWiF4dvxWyOnGQozOfcnbpTkjiJ?=
 =?us-ascii?Q?pw8Saqde1IgkjdBrHDPLfD+kx8Xz+f/y4O+LiKskzykkmYQH4AEBJ3KJc63R?=
 =?us-ascii?Q?1bLnoldmVPKHQX+BRyY59nocx6WUO68AeHzMEgXGGtlGy8BYBVqZPrl0WAko?=
 =?us-ascii?Q?7wx40GqbtYyvDEwQgTYyeFh8CfxnXjBi8u4Jz25jN1yPjXihSNZOHgMmZ7Vf?=
 =?us-ascii?Q?K0lhAPJzfj2LvRkaFhhMUisD2ONJ6CteE8Pp38/m4ZrD/Rf1gq+wThX01Phc?=
 =?us-ascii?Q?9A/siHWvTtD9CvSqM39RlSxvhoT+BYigP3fk04nAyKxGJvIacweHHrhBfWEs?=
 =?us-ascii?Q?sM2C9i5DDC2OeK02DM/p6+Vgas8NOte7xxPFb7EfWOvtA/IgLdala9NrLJXg?=
 =?us-ascii?Q?NQc/yzNQ2UtR5XOmwVoYmtvQOxwI+/JlMQoeq5cVhOSZ3vit59qPztyRCXbF?=
 =?us-ascii?Q?Yub6DcL8fY6SX4/lf4XG7syhACetp6VULi1dulRN7GZkBo36lTf413tJRY45?=
 =?us-ascii?Q?Q25k3eFueF8mFJ/Xn4dz1tIc30mTolDm7sI/nZN+BhVSSOp3NPFyPcZ1a30/?=
 =?us-ascii?Q?x51YjqLj0ge6j9UoDZruKXcjsIhr2GPbq2NOXvPFRBHyeqz9iQxAjRwPUDD8?=
 =?us-ascii?Q?SF9l1iGjbw8RUXKQlEtN92JiIOttJnLv1QRLBMd9OZ5bO2OQmwO7YvRO+kYV?=
 =?us-ascii?Q?7jbnFScn8jreTh1DiH3KE12o6unRlP0YdyP8VyOC2KOXGri1obedPJ7AG4GL?=
 =?us-ascii?Q?5zJiucFdNxvpsI8nkzuh7Djdnq9k2DPItGGYpL+ffo85sab2VutiMnU6WN6Z?=
 =?us-ascii?Q?H7nvzonkEfR0wazmvqlU6RCEvZ1/7+fVtu3CCXny?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08201930-741f-4658-d77d-08dd7210b74e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 18:03:48.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elnSL8Y74JrwF4v2v8APOkWL8bxXrFAT8mbGXQGcHAOIldZPLnh1464rOMaFd5TJxrrMP7uxxLx8KtC8kvV4Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079

On Wed, Apr 02, 2025 at 01:34:00PM +0800, Ming Qian(OSS) wrote:
> Hi Frank,
>
>
> On 2025/4/1 22:37, Frank Li wrote:
> > On Tue, Apr 01, 2025 at 11:17:36AM +0800, Ming Qian(OSS) wrote:
> > >
> > > Hi Frank,
> > >
> > > On 2025/3/31 22:32, Frank Li wrote:
> > > > On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
> > > > >
> > > > > Hi Frank,
> > > > >
> > > > > On 2025/3/28 22:45, Frank Li wrote:
> > > > > > On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
> > > > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > > > >
> > > > > > > To support decoding motion-jpeg without DHT, driver will try to decode a
> > > > > > > pattern jpeg before actual jpeg frame by use of linked descriptors
> > > > > > > (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> > > > > > > used for decoding the motion-jpeg.
> > > > > > >
> > > > > > > In other words, 2 frame done interrupts will be triggered, driver will
> > > > > > > ignore the first interrupt,
> > > > > >
> > > > > > Does any field in linked descriptors to control if issue irq? Generally
> > > > > > you needn't enable first descriptors's irq and only enable second one.
> > > > > >
> > > > >
> > > > > Unfortunately, we cannot configure interrupts for each descriptor.
> > > > > So we can't only enable the second irq.
> > > > >
> > > > >
> > > > > > > and wait for the second interrupt.
> > > > > > > If the resolution is small, and the 2 interrupts may be too close,
> > > > > >
> > > > > > It also possible two irqs combine to 1 irqs. If I understand correct, your
> > > > > > irq handle only handle one descriptors per irq.
> > > > > >
> > > > > > Another words,
> > > > > >
> > > > > > If second irq already happen just before 1,
> > > > > >
> > > > > > 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> > > > > > 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
> > > > > >
> > > > > > Does your driver wait forever because no second irq happen?
> > > > > >
> > > > > > Frank
> > > > >
> > > > > Before this patch, the answer is yes, the driver will wait 2 seconds
> > > > > until timeout.
> > > > > In fact, this is the problem that this patch wants to avoid.
> > > > > Now I think there are 3 cases for motion-jpeg decoding:
> > > > > 1. The second irq happens before the first irq status check, the on-going
> > > > > check
> > > > > help to hanle this case.
> > > > > 2. The second irq happens after the first irq status check, but before
> > > > > on-going check, this on-going check can help handle it, fisnish the
> > > > > current decoding and reset the jpeg decoder.
> > > > > 3. The second irq happens after the on-going check, this is the normal
> > > > > process before. No additional processing required.
> > > >
> > > > Okay, not sure if hardware provide current_descript position. Generally
> > > > descriptor queue irq handle is like
> > > >
> > > > cur = queue_header;
> > > > while(cur != read_hardware_currunt_pos())
> > > > {
> > > > 	handle(cur);
> > > > 	cur = cur->next;
> > > > 	queue_header = cur;
> > > > }
> > > >
> > > > with above logic, even you queue new request during irq handler, it should
> > > > work correctly.
> > > >
> > > > But it is depend on if hardware can indicate current working queue
> > > > position, some time, hardware stop last queue posistion when handle last
> > > > one.
> > > >
> > > > Frank
> > > >
> > >
> > > I think it doesn't matter, the 2 descriptors are the cfg descriptor and
> > > then the image descriptor.
> > > If the current descriptor register remains the last image descriptor,
> > > the ongoing check works.
> > >
> > > And I guess your concern is as below.
> > > If the current descriptor register is still the cfg descriptor, but the
> > > hardware has finished decoding the next image descriptor.
> > >
> > > I confirmed with our hardware engineer. This can't happen.
> > > The first cfg decriptor has a next_descpt_ptr that is pointing to the
> > > image descriptor, when the hardware read tne next_descpt_ptr, the
> > > current descriptor register is updated, before the actual decoding.
> >
> > Maybe off topic,
> >
> > CFG->next = Image
> >
> > Image->next = NULL;
> >
> > If hardware finish image descriptior, current descriptor is 'Image' or 'NULL'
> >
> > If it is 'Image', need extra status bit show 'done'
> >
> > 1:	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> >
> > I suppose it should be DONE status if just finish CFG description.
> >
> > 2: 	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> >
> > It is possible curr_desc already was 'Image' after 1.
> >
> >   if (curr_desc == jpeg->slot_data.cfg_desc_handle)  //not hit this
> >          return true;
> >
> >   if (slot_status & SLOT_STATUS_ONGOING)  // not hit this
> >          return true;
> >
> > fake false may return.
> >
> > check two aync condition "slot_status" and "curr_desc" always be risk. But
> > I don't know what's happen if fake false return here.
> >
> > for this type check
> > 	do {
> > 		slot_status = readl();
> > 		curr_desc = readl();
> > 	} while (slot_status != read());
> >
> > to make sure slot_status and cur_desc indicate the hardware status
> > correctly.
>
> I confirmed with the hardware engineer, the curr_desc register is set
> when hardware load next_descpt_ptr,

The key is last one, does last one set curr_desc to NULL when it done.
If yes, the whole logic will be much simple. You just need check
curr_desc.

> but the ongoing bit is set when
> hardware finish loading the content of the descriptor, the size is 32
> bytes.
> So you are right, the slot_status and curr_desc is not synchronous,
> but the gap time will be very short

Yes, it will be really hard to debug it if met once.

>
> This patch is a workaround that hardware finish 2 descriptors too soon,
> irq() is not scheduled on time, the driver keeps waiting until timeout.
>
> And I agree there is still some risk that the ongoing check may return
> fake false, even if the probability of occurrence is extremely low.
>
> When the fake false return, the driver will finish current decoding
> early, and the decoded image is incomplete.
>
> But we don't want to change to poll the done status.

It is not poll the done. It's compare if status is the same by twice read.
Most time needn't retry.

The basic idea is the same as
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clocksource/arm_global_timer.c#L73

>
> Considering the probability of occurrence and the respective
> consequences, I think this patch still makes sense.
>
> Maybe we can check the slot_status register twice and add a short delay
> in between. Then the probability of returning fake false is basically
> reduced to 0.
>
> Thanks,
> Ming
>
> >
> > Frank
> > >
> > > Thanks,
> > > Ming
> > >
> > > > >
> > > > > Thanks,
> > > > > Ming
> > > > >
> > > > > > >
> > > > > > > when driver is handling the first interrupt, two frames are done, then
> > > > > > > driver will fail to wait for the second interrupt.
> > > > > > >
> > > > > > > In such case, driver can check whether the decoding is still ongoing,
> > > > > > > if not, just done the current decoding.
> > > > > > >
> > > > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > > > ---
> > > > > > >     .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
> > > > > > >     .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
> > > > > > >     2 files changed, 20 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > > > index d579c804b047..adb93e977be9 100644
> > > > > > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > > > @@ -89,6 +89,7 @@
> > > > > > >     /* SLOT_STATUS fields for slots 0..3 */
> > > > > > >     #define SLOT_STATUS_FRMDONE			(0x1 << 3)
> > > > > > >     #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> > > > > > > +#define SLOT_STATUS_ONGOING			(0x1 << 31)
> > > > > > >
> > > > > > >     /* SLOT_IRQ_EN fields TBD */
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > > > index 45705c606769..e6bb45633a19 100644
> > > > > > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > > > @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
> > > > > > >     	return size;
> > > > > > >     }
> > > > > > >
> > > > > > > +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> > > > > > > +{
> > > > > > > +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> > > > > > > +	u32 curr_desc;
> > > > > > > +	u32 slot_status;
> > > > > > > +
> > > > > > > +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> > > > > > > +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> > > > > > > +
> > > > > > > +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> > > > > > > +		return true;
> > > > > > > +	if (slot_status & SLOT_STATUS_ONGOING)
> > > > > > > +		return true;
> > > > > > > +
> > > > > > > +	return false;
> > > > > > > +}
> > > > > > > +
> > > > > > >     static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > > > > > >     {
> > > > > > >     	struct mxc_jpeg_dev *jpeg = priv;
> > > > > > > @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > > > > > >     		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> > > > > > >     		goto job_unlock;
> > > > > > >     	}
> > > > > > > -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> > > > > > > +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> > > > > > > +	    mxc_dec_is_ongoing(ctx)) {
> > > > > > >     		jpeg_src_buf->dht_needed = false;
> > > > > > >     		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
> > > > > > >     		goto job_unlock;
> > > > > > > --
> > > > > > > 2.43.0-rc1
> > > > > > >

