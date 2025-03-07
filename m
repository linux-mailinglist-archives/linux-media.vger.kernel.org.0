Return-Path: <linux-media+bounces-27840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC6A56914
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 14:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7E6172D5C
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D8D219E8D;
	Fri,  7 Mar 2025 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="cKXQdUKO"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B104219A94;
	Fri,  7 Mar 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741354723; cv=fail; b=hIisaDtckyk1im1cGGZupVy2J4BUEgnqV3cVn8jAOcn/OPSjlywmpUW+p5xTMl4wVj1r8sVXLZKC703LG7PJt1EsMHWkX+eCbx/WHmrfKgSD6jIttoQr/XciXAGjFp+GjtzuwRO2JZd1RSDL/hBjEy5jZDmrnNUWcDZvHE086nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741354723; c=relaxed/simple;
	bh=7v01mL6MYGlbZnANREuhFFgcsulLN+WU9XOg2jQhSdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e2cDPK2yLL3ws7uUKqeSvm2ZidHmkU1eCzo2N25Ntyzh7vmZoc06b0d1IIDcIdcODxgjCiwibkHLMH+030POa9olq//1b6NDDfVkMg26edVhCFg1edbpgPPlmxzEQserZrjvz9jWK0n68BbbIXO5B1TUdUJFojuw3K/Q8+8JWs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=cKXQdUKO; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv9tkyL/K6ObTRcFjbkFf0EkizbupqtwUaEMLS4ov6+WHEKvuQDxhSm9AYKGV42j7qPaJ5xVhTsF7BrqOp/c/51e0yCbjfNsavu8hl/apsPsrqPYiZUqCGkk6toGyejyUTMtRtkLfduic6tQ39rksB/aIKYn0co7Kxc2jhAa9Kf1DlTPWasFrUVVSBt1z1fmfvJEwy7YJJoh9rT2YvQ0Mh4XcRB6ibBnDHXpAQuydeilmeK95CG9u5IDgfeV1+Cp/GECJibP74kr78KHE39YWROc+CGZInvNZYgwlf+3S+azmHmpCNT8GJyyAnRp59c4XGbF4DGvXa4ZmkQP7dsh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4Fwuntd5k4pzx4sjSOCt+EHZTrpZASJNn/tK0Fdke0=;
 b=gEDUvpq4qNJiEcX/A3epiigCAYetMLyqCv1K6pG6gt6iu/GPeiUo/RtLc6cZ37G8Rx39NPQW0A+JdtBPk9qS+qy1hUpyToOHHwXl0Oy1LSpqfI9Dis4mY12nBk+yQCIfL6lx67AdjIBQ7lHMHUILOFJSi97vMvgysxkc/3KSfSpT+MZdhdpOFfqHGQKl+Y8z7OfUJPQh12ACzTou9Zma0AeNBxHM3M9BJI/tOZPCu6vGKEquBdtAVVCOJOUHqJ4/Ar/3EIM3uFK1V9wzvXwrBEaRmhyCjc8IHHHCKaEgWSDY3jh+ZckAKU3jIguapVFTPj/8CJ2DJrJXivx299FpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4Fwuntd5k4pzx4sjSOCt+EHZTrpZASJNn/tK0Fdke0=;
 b=cKXQdUKO15Wy6l0wWuqABFgmAUUUbvfBRk5HpBbmox5Lx/8Q4hsw7mWfmnaaAFfz8ILphMQ2lUrWu/G4HX6+RLCxCkLVBWFdDi6Y7enz3RqUaS2TKNPfuHK1/8At+hp+IlgzKgkgfq1l4ZbkbCaQfkHtI4ZyByvH2zDgOx2GEIKwT6qbTWq4J0UcXcAM5j2jhrOg6h8RmrFrm8LZtdghqHjiHxliNAIk032D1OH0UIiMd8ewNl2c9yaydE6ic72KrkBJCTzlKyrEwEhEWndLbuzlkULl5veWqVJXW0u17ARescFgFj4MOEwljnKOu/wobPIXieWcEOJAPV5/k/mZLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI1PR03MB6431.eurprd03.prod.outlook.com (2603:10a6:800:195::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 13:38:35 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 13:38:35 +0000
Date: Fri, 7 Mar 2025 14:38:29 +0100
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
Message-ID: <Z8r21Z2HthBwGDSq@mt.com>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
 <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
X-ClientProxiedBy: ZR2P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::7) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI1PR03MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: cf480bc9-5d7f-47d7-0259-08dd5d7d5c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1LIpBUXSfHVpWS3TKq9SkxfE+H1KeBQrJ+0+2QwNNgfgEnPXvwcWAL3QBzE8?=
 =?us-ascii?Q?1LFOx9mxB7aB+cCjm1xS2kGjKkdH2pDhM+5RfEX8WzUYG/HH+qwuyKq5qV6h?=
 =?us-ascii?Q?53gGU3j9Y4oPk36PIwNHQktg1K+D8TJ9OdXNIBPD85b5CVRtxWAgDHAw1lSP?=
 =?us-ascii?Q?cYpsWu8LmjpU0FabLX25KcbtfXjIW1ZRBCOzvMqyL0OxbFtNbQZYBUuUk6I7?=
 =?us-ascii?Q?a7itT+qZzeP2PZe8MoOVmpdSm9XJYxdWzIBXUrhcTnHoSuAWD0Q342G83F5w?=
 =?us-ascii?Q?1vBa7JOWsTEkoob4NBzmDaCWh/TVx2umyZ0HgH+lQa3iVILq8dl7298u0JMn?=
 =?us-ascii?Q?2dTw/QvRdLJUKHryr0Asib0a0MQ/4xK7DD+kXFddhUY1BfpOkK6GiMslDqr9?=
 =?us-ascii?Q?lJb9lzxLFMaqEKJyxX109tGPgkkv0RQAz2ONwMqdqmRZPeT1kubTwwb3ZzNn?=
 =?us-ascii?Q?GaXLE2+HsHjyCcDvW8wYA7UbwSdWB1Zg0Hhk4PkcC97dCc1Ud2sDuf2qg4h+?=
 =?us-ascii?Q?M/tkW4H0dSZhk1iGFnAFNaND0D7vX7VHDtZIYN6ygUC4E9BQmJgXFlY+Du1w?=
 =?us-ascii?Q?8nkGNDmrc5z+nvRfvZZIxK6BDthOEfYWhYg7iSC//7wV5hOxOZh2FHYLVGPC?=
 =?us-ascii?Q?c/blvAokclfA84yznhU1Kzr+BqsE/Xzzd7jqA5OkxOeN6eZCEc7gl/AbjHio?=
 =?us-ascii?Q?rEVH4ayW1LkaIV2hzF5tbq3r+UWt6hSo03XiErgXhwqk0AG0KUDide2V7Fd8?=
 =?us-ascii?Q?Rs6v3AT1dw0cLzXKSjqRqXjXYVzND+dmyPn7vXDoNfQfAXeZR9pQhdYiPDIu?=
 =?us-ascii?Q?kGHiJ4WL9pbRg7o8bKkWJbBZ7OoVW7OHGpQLDGjPNjmK6u4xlfSbvci9LnN3?=
 =?us-ascii?Q?JG0qKJU4huun35UprnRtoayHU9hHvhSeBFMmDQxeWv3xKEfZeYGoXJueUQy5?=
 =?us-ascii?Q?AuyZ+GEi9xrHZnz5Z6XW8gu5V5Ni4vrEeT46HkxH/5WS6PhVJEq9G2ymyM7g?=
 =?us-ascii?Q?mPhzFXyKsPYOitC3MCRy5UDJn/jbKF3yvv6oYaxCyBn/wE0LlBq4AHRCqRmN?=
 =?us-ascii?Q?XtY5g17I+NiK1cl+UgWdNbQL3TbhGasMynLwJYXTis2l1atgoL42yhS4ZhkA?=
 =?us-ascii?Q?JgUnZ4EmxGuR8fuBQrv32n75bxmTmCktznOBsH7eg+oeKWlv5URES/l6B1kM?=
 =?us-ascii?Q?8BVEb8cu2rE7vMldZOHFpTvzgq9as50Eo4cvsdHhg1Dmh9sJbAu6bj7j9t2P?=
 =?us-ascii?Q?Q9rPRZK0Rlk9JEcwvr+HoshxTb/BwDhff5JpZFmo9o9a/LEUVBLAqr4wh6Mo?=
 =?us-ascii?Q?q8tf325g0rvb91RIiZjVrmyP+nuv1CWsjKSJoNTDN+RKqjpVQ9b3fxWEE/2o?=
 =?us-ascii?Q?6+nYnPDCR2c3FHhbfQL00F3QKxplhak1Xhf8WdltZDMapQ2axZtqcJfCiGUP?=
 =?us-ascii?Q?tKjP6lL4aLSU+wVBFP81QORAoEhPOyRh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?onBAQfV9YLLW/a0SVS/OZmyPwv3KJgCA3Exymbgq3+Kj6yPbRidLtlqcDvTj?=
 =?us-ascii?Q?qq9vtgGACJJTeB2n7JRCwR/oGgpqXYs2kdr+AJRhZkmijQ1qXKj8QvcTV1+N?=
 =?us-ascii?Q?E5aRFGiEy49Z9UezsypvEpi7cZb4aNuZWmaUo3G2bwAvRYQ37xJqPy/7lzK/?=
 =?us-ascii?Q?XUY1S38Kdgmpw87hTbunIFID/jDsG5alyPb1/8k6Pat9t0tLKuVcyIIGqGRw?=
 =?us-ascii?Q?aOlvHBwt0PZZc1gfs1JVieFl+sE6yoO8W5b3ZSq1mnvBuZwSENmADxSjb17l?=
 =?us-ascii?Q?MU+ia4gb2YLfQY0KzQ1dLn6zaTPeFUOe8YajvcGi9ayw9I4GXqdzQ69KQrj2?=
 =?us-ascii?Q?dvx8/jKXsEd7ldBp7M/h4AwW9fK5TJ4X+OnwS+c6gmmUO33UN/qoSip82eWB?=
 =?us-ascii?Q?Wudx29vAp+5EHStoZu4eSc0wbMtPUZv9kdYBZj5kWk/J8OeGj2BVIcuvMZGg?=
 =?us-ascii?Q?MPV5mZ6HeVqrXJ1Zm6PZGdQhbqYCWpRz1uXA/g+RPHTzZoQ0yOAyptmJUhnf?=
 =?us-ascii?Q?7EiwP4cuGc+fiwKgEIqakKhi5JPnvuERzFtwKI8JMTqA4ehGbMGywlupl6km?=
 =?us-ascii?Q?9437opTIRTXPzNCfM5+dnlFGXxMIaNry6AZyQj7u7yCip8VfG8ouMS36UUJJ?=
 =?us-ascii?Q?L9FVp7a3yETeiOno+Giiv/HvDvxnR6GSa79KJ1mEx81wAcx/mCrdtVv3BObk?=
 =?us-ascii?Q?Kc/pKhHr7eiqErGK3IJDE6wRYRfdStIkr1CwSjkzuN5hyN/34DMqIcj4lnA0?=
 =?us-ascii?Q?abmRNrT7VoUKcSfKFE7K1vtTAVTB3/BvLX40HBtNxh5yj6jk6WimyNpric3N?=
 =?us-ascii?Q?8CZq02mTYca1LDQuLha3yPUCefr0Om/x2JTzxyXQDp08RmVU1Feh+SK3mJJG?=
 =?us-ascii?Q?usvX9Uom0Tr92OBCo9HlsGbaIjPBaUj2O9kufU2g+G8hP0vqxhxXeLfkLoFw?=
 =?us-ascii?Q?De547LDu6sEBxAQCyUJfawXX0zr59n9jFC079o4ZioUJWWRak118ntUDURL2?=
 =?us-ascii?Q?S69D2RKk6JkD55mmWwktP07XATNlKQ3GvwEVH7KMYRWzxeLuGmPU6EFxw2aA?=
 =?us-ascii?Q?JUc5c7Y/VHenHN50oFaduyC/HE1Xun4KI0etZW/0wKvgVl7LXzdHC2SWoINe?=
 =?us-ascii?Q?arHyfwfo6BowiD+Pb/eRPaqLDBa/JXAgMznqqvKsbcgsViXabbpXXBWf19Ct?=
 =?us-ascii?Q?jIWQgiI7e/53SHHlEX8yHEO0Zwf44a7iJUZWWVKz+bs6LY9ryYoJL/dm3Abt?=
 =?us-ascii?Q?sBrkP+V/X2wmJA76XBLGfKOnERo37/n5vr/4Vptc+kSfKShiBFSZ3QViC4tZ?=
 =?us-ascii?Q?2SFCRg+OLUIIVC7FcFD1t8rfrRe5wZj7v6yapuDcKp+6jSykgoKK/aQvXUDi?=
 =?us-ascii?Q?gERKRVkFaSfcfK+5KoFOYTNNSyVpHUqJK9YFs6RjQS3SJSPO4ItLVpWZ5as5?=
 =?us-ascii?Q?uizq40JmkH7MuR4pEO3p+A0Qa9vroyhunOcTeVmjUyP5oh+XTpJycgMAmcvw?=
 =?us-ascii?Q?IqsHNo+N7UES+LigYwgxgxzkEVIiy11ejDyADc3PQBV0eAXLaDtJG2pkeIiW?=
 =?us-ascii?Q?8EBbLchs/BvCCmq+vDaqaoafx14O1VuAmgdVv7bZ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf480bc9-5d7f-47d7-0259-08dd5d7d5c29
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 13:38:35.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWOYyKQ74/2X7NBB/B6cxETzpBEiOdbPStqvdZlePh3Zkcj6NidP3bIGz3WoFIPe+asgThoVrcZPxrKZa0Yk/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6431

Hi Sakari, Hi Dan,

thanks a lot for your feedback.

On Thu, Mar 06, 2025 at 09:13:46PM +0000, Sakari Ailus wrote:
> Hi Dan,
> 
> On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> > On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > > Hi Mathis,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > > The imx-media-csi driver requires upstream camera drivers to implement
> > > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > > implement this function are not usable on the i.MX6.
> > > > 
> > > > The docs for get_mbus_config [1] say:
> > > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > >             The media bus configuration is usually retrieved from the
> > > >             firmware interface at sub-device probe time, immediately
> > > >             applied to the hardware and eventually adjusted by the
> > > >             driver.
> > > > 
> > > > Currently, the imx-media-csi driver is not incorporating the information
> > > > from the firmware interface and therefore relies on the implementation of
> > > > get_mbus_config by the camera driver.
> > > > 
> > > > To be compatible with camera drivers not implementing get_mbus_config
> > > > (which is the usual case), use the bus information from the fw interface:
> > > > 
> > > > The camera does not necessarily has a direct media bus link to the CSI as
> > > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > > between them on the media pipeline.
> > > > The CSI driver already implements the functionality to find the connected
> > > > camera sub-device to call get_mbus_config on it.
> > > > 
> > > > At this point the driver is modified as follows:
> > > > In the case that get_mbus_config is not implemented by the upstream
> > > > camera, try to get its endpoint configuration from the firmware interface
> > > > usign v4l2_fwnode_endpoint_parse.
> > > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > > configuration.
> > > > For all other mbus_types, return an error.
> > > > 
> > > > Note that parsing the mbus_config from the fw interface is not done during
> > > > probing because the camera that's connected to the CSI can change based on
> > > > the selected input of the video-mux at runtime.
> > > > 
> > > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > > [1] include/media/v4l2-subdev.h - line 814
> > > > 
> > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > ---
> > > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > > index 3edbc57be2ca..394a9321a10b 100644
> > > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > >  {
> > > >  	struct v4l2_subdev *sd, *remote_sd;
> > > >  	struct media_pad *remote_pad;
> > > > +	struct fwnode_handle *ep_node;
> > > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > > 
> > > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > > field to zero this way is redundant, just use {}.
> > > 
> > 
> > I was going to respond in much the same way.  This is equivalen to:
> > 
> > struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
> 
> Thinking about this in a context of parsing the endpoint, in fact the
> bus_type should be specified. Presumably the hardware is D-PHY, so the
> correct value would be V4L2_MBUS_CSI2_DPHY. This way
> v4l2_fwnode_endpoint_parse() doesn't need to guess.

I think we must use "bus_type = V4L2_MBUS_UNKNOWN" here:

The i.MX6 has two types of camera interfaces: Parallel and MIPI CSI-2.
They are connected either directly or via a video-mux to the CSIs
(See IMX6DQRM.pdf - Figure 9-3 for the connection diagram)

Pre-defining V4L2_MBUS_CSI2_DPHY here would let
v4l2_fwnode_endpoint_parse() fail if the camera uses the parallel bus.

We could distinguish between MIPI CSI-2 and Parallel input by checking
the grp_id of the upstream device like it's already done in
csi_get_upstream_mbus_config().
But for the Parallel case we still can't know if we should set bus_type
to V4L2_MBUS_PARALLEL or to V4L2_MBUS_BT656 - the i.MX6 supports both
formats on the parallel interface.

That's why I would argue that v4l2_fwnode_endpoint_parse() must figure
out the bus_type from the fw node.

> 
> > 
> > > >  	int ret;
> > > >  
> > > >  	if (!priv->src_sd)
> > > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > >  
> > > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > > >  			       remote_pad->index, mbus_cfg);
> > > > -	if (ret == -ENOIOCTLCMD)
> > > > -		v4l2_err(&priv->sd,
> > > > -			 "entity %s does not implement get_mbus_config()\n",
> > > > -			 remote_pad->entity->name);
> > > > +	if (ret == -ENOIOCTLCMD) {
> > > 
> > > 	if (!ret)
> > > 		return 0;
> > > 
> > > And you can unindent the rest.
> > 
> > I was going to say this too but then I thought actually this needs to
> > be:
> > 
> > 	if (ret != -ENOIOCTLCMD)
> > 		return ret;
> > 
> > Which is weird.  Better to break all the new code into a separate
> > helper function.
> > 
> > 	if (ret == -ENOIOCTLCMD)
> > 		ret = parse_fw_link_config_stuff();
> > 
> > 	return ret;

Good point. I factored out a helper function as suggested.

> 
> Indeed. get_mbus_config() presumably wouldn't return an error but
> correctness is usually a good idea.
> 
> -- 
> Regards,
> 
> Sakari Ailus


Best regards,
Mathis Foerst


