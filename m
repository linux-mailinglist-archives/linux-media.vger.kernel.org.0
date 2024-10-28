Return-Path: <linux-media+bounces-20451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CBC9B3A10
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05BE81C220E4
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B601E9083;
	Mon, 28 Oct 2024 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mr7Ge0sr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B7B1E7C1A;
	Mon, 28 Oct 2024 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142411; cv=fail; b=E3xXIlFKpbCamiAWakGB1QuNu3J8JZOl+Y2TY5/ClaNILeWAMp0tD5DJeE/Ipml5uxJogDROR7YBd/czhOOoTHdWqUbJ2ucqWIWve+MunhzC7IgybBUMo8QcL8zfeyOtglW2Ej182uOu4oJwWDHcEq9Ghh3siIv0cPGxyNb3R/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142411; c=relaxed/simple;
	bh=ze18VOlUuEYvCz8CuUb8r9sze2DXTSI73vUTkfoQErY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WhRhIzoOhmEzkpJG9CNEe3jWCjZuWipVhF0CpBun3JU2n5gLV6KLLJQ/Un6GQOVWqyEdlKLv9vkCeLMod3YFZXV/e2SWXMPV1a4mDTePL3y1KSqyUJXm9a9uDtoNiQayifgnWCqqjYTJWyMRFNrSsPkUgIjGCNkJzgcCDwwr0Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mr7Ge0sr; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1gTmTPjaCB2FevM9Kp9ttdcgHZhbpT02HO+5PeEJm3vA5CjqoNHIc2OHrpty3styObjaETkUTmJ07sdKojibzqGZRZSw4567ctZXWPkhUc0uCSCDd2yaJaiaxHzjyFAWONaZKC9/eQBPShIU30UW9tb/eowleaO5HELQEQCJWk91HAOqARK1d5oSKfkL8AA+FhpyY6ds+GJFiQ30E96h3eh+G87nDo9pZDTAkWTS4QwfqlT0UBHOBULaraMAQn6XHCVyc5qvpvtFeshrl7hbmTs+mkqLAmkujz0rjLJHT+SljYEiM4cx4Ce5EPYS17XyqwOEOnLW++4UZT2030JKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdQGHS+Jq5jpQwTAFxf/DaYZzjO5OHmatja9ThcQmDE=;
 b=OCQY8CWYq1ekKWX6/aliq518nEphLckfOSmdDTFWnFFTVSA1I1va4RR8hYd1PSz5rGXk2RBoOKVQ9iS0Ez9yk9HhR8PbkaGopoEMxJGrHaNdkpXmZ381RZhHq3TLdrpYuX4z6oyJmOXv4SGgiEfRm68JbrtPu+to3LZyVkZxToqBQJ+oP5QQ2ZymLafUB6LeL+f4UzBrC4OQgX7s1f2QOsyWvRE9yqFKeNG7ovnX4AymIceli62Tv60hJt6xNZMv+DpWFc4rq4BudUgSyg8NBBv+VAIjHWq8vn0VWYAMcXc3BcNLR6smeTmN0UH4XSfi+Dveb5bKXE8tHIQhOjoXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdQGHS+Jq5jpQwTAFxf/DaYZzjO5OHmatja9ThcQmDE=;
 b=mr7Ge0srrNE+EnshZFqynB3wOvWZkCUqy8/23GPVAjT1rYXJXH6dIqIeXU67BdkPcyYSAWSCm1AaJ3lqbq4G539n6PRliQ7ogp9TJ2AxPc+P6LHp1ypogWl0OxM61SL09ZZoKp1gCspMHT0mMyW2NKep8ynD3VHApr4GAEV/ujqHjFK58n/Irfz7d/Wgyhpd6zSSNJeN6S2mzXzFOR/TMPCkEB8rGQVS2d2pYfDK6hL7jMV1K2FL5zB+25TVtbulxCGnZQWjf+RSep0xqBntpWOV35j0bS9zxePWD2EL0ZA0xq2Xg39hO9znbSCKd1d/XOXOdCl8BTPwKJFhYf3tdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 19:06:45 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 19:06:44 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH 0/5] media: i2c: Add OX05B1S camera sensor driver
Date: Mon, 28 Oct 2024 21:06:23 +0200
Message-Id: <20241028190628.257249-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0289.eurprd07.prod.outlook.com
 (2603:10a6:800:130::17) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: de176d2a-9056-4acc-b351-08dcf783aa1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DoJvLQyUGuA+HRyD84n0mKZzfj38mzPhDp5/cOLBafs2PeqlfAmIzdVT9H/P?=
 =?us-ascii?Q?NjSw+UMNJlAObA169QdFXLP14bEsOEASRPKYpnp2FIycMvqXC46/20bVymeq?=
 =?us-ascii?Q?QP1mYTpgTxqGA0pFrADzGApQnLwdT8ce7p+8fQMPj8vr/FhvpcdspWdZOHPQ?=
 =?us-ascii?Q?GWnv5GirAKBJHFiKpdWsT5kicEHs9vz4vq3iImzHSQDyU7G3kwKlk4iYhZ9J?=
 =?us-ascii?Q?kbqDwJCuuMbtG3ta00gEaarWc3YlJEK2xmQsVhTGkuLvHeK1hfHEsVuZlYP9?=
 =?us-ascii?Q?+KFQhTHTXk/AOYyPOAwkB0et4w7cZsMB7snxoyXLThTVucmdfoylYFc+9Erl?=
 =?us-ascii?Q?GM3/k0PD0ZTDs99DLjRYbQhMIfRkdk/V4IwFUFyQTK3jQFrHh4svf3HTNnX2?=
 =?us-ascii?Q?XQbCStgRGWaJGSvh/OhHn/+B4XuhMWrwdNLRHGY0tVVoyLBrnFlYkxYAHrKu?=
 =?us-ascii?Q?OL7EOq2pKyEwm++R6PzyHmu+x2AeV19UR/JXZR55LSv6ZYD8ZIgMazCVxT0R?=
 =?us-ascii?Q?c+JPAZpyq7EanrI9knw8N4oO+/gS19/zHdDOAjC5F1dYV06Lxg28S88f3Hf1?=
 =?us-ascii?Q?CeoIdKP2z0GOf6C7tMNlGk+1FQmDJWCFa07MT49qTvow/5M0lUEk97y3meUb?=
 =?us-ascii?Q?U+ZL6c/ijfGZI88iSLvs821UebWroOW6+nGpLrspD14FJRKYYuoyGCsGeuKV?=
 =?us-ascii?Q?1FO8z0MoYKKE/Gt1FL7mKGJDyzBf8EzB3emtDbSGCiDQfyoVmmthD+MgHUpH?=
 =?us-ascii?Q?jQnYXVhJL5GKiP2zVZy8Iaf/kW+l5qRCxeaFdwLRI75syBVQb8ATBechCaRz?=
 =?us-ascii?Q?tAtFzIjWUOJQeVmxt/Curw5D0lYkCTbAA79LrzNO3X43NgsEIXUM/QuVM1w6?=
 =?us-ascii?Q?HrPBfVyVj2SkgciSdstsNJr6Lbl97eDY/kS9pQARKT4ZFjIOLIX7E/TpCkBH?=
 =?us-ascii?Q?xQgazO2sALnB6lcBIuc3Cx0dgcshp6rJsovSpiGPXwrT7FQzik+SUH2gf8ZX?=
 =?us-ascii?Q?q/r3S6b+tsm4CPtmjdQylrzb9vHOYDkz5QSqHvQ1433tolHyEdxrbrEB1KRJ?=
 =?us-ascii?Q?ewjCRz8ElS7P5hQpth8n6w+6T0mpy3aoL8BrvO6k40m2x4wZN33FK2aERGo+?=
 =?us-ascii?Q?6Y09oKmug9EdZ91bNcrmXoK9jyHyB1huppSHciBcHNQLHPP9zwoothHVRVZB?=
 =?us-ascii?Q?cYCbxjfUm+c7uUk7jepHKK1Ibu0ntlAT0T5AALi7gn90mosz6UZho9PBiEiX?=
 =?us-ascii?Q?AVtkWeC9RpUdyOPP4AgZSqh3rS6LOrKBRv6qkbb0eSAsmHMTP8dMKGi9ye3K?=
 =?us-ascii?Q?aqyv8/Kujd+OpEEPGTEdH2fejz+U/s7pf2urGFT6YajRB89n0b8X5lmqQqzU?=
 =?us-ascii?Q?nW6ZmI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?isoMz0Ta/CBPYSiUAHEuZEKe8gJVdW3ySQ7hvVVzxxdbpA1+DahTsKJiAMbK?=
 =?us-ascii?Q?+dOpJ00JxFXe3t9GOEbpkdattMWsZ8onGsn96SPQvsBNn4SbLD9OCtCgEMWK?=
 =?us-ascii?Q?WGPJowS/Nzw1U9/nHx9KEDrZ9IxvZs//5zMvA5MH9nCxOmL1o5x9FBz2LVB4?=
 =?us-ascii?Q?otKPrEpozAPe08oJYZ2vF2HVq/7SMSxxk+ghcxoEQBJps7vGfb27TgDJdVrK?=
 =?us-ascii?Q?uyCAdAnmUc5C7IPgUk/KliPJJF7q4cWt5FUHDOe9bvjnDsV7EAqYxBQK4aGx?=
 =?us-ascii?Q?pN/Y1QQTOe+MAwkV5y3R66nZ3Au+utFeQZaaESoJi2Q6di0lnUt9rS+pSiIb?=
 =?us-ascii?Q?L7A+PJZIGI/YHB4G2ORMgdEvFqiqB3CinB1PFOHvAq3l/4sZ4Lv5vH6ZZEqW?=
 =?us-ascii?Q?7hZV0H3T47YPf6hDfqjtijngMwUAq6rImBUDNv5v1wSak7HcNv8pFysnyred?=
 =?us-ascii?Q?ITZyM3GUnVMsuJJNT5k10jE45wRpEMms6A1JSbYU+F9rAR7g2bzwM5mZppCj?=
 =?us-ascii?Q?I/Ff6n6crwCYV6Ze3LPOyJrs5e4QQFrgw/O6r7OMm1AJ+173UId0l87NHzrS?=
 =?us-ascii?Q?mnJsmI5LV609beUa2+LfTvk6JyJF+FvNKM+JNVi2VcVDsnIMFQ1Rrm1J1FxM?=
 =?us-ascii?Q?dQmAethQHKK7Y85Az2lXq5IF3WJINenePPMvVEFQEDOLPgfvcxmMI2x0Wvl8?=
 =?us-ascii?Q?BjOKRYnXGHgfyvYS6JKcnm453hgt0tn3q10n6AZoJfUlQZMi3KcbniCKy8tP?=
 =?us-ascii?Q?EZSy3ubTWGAl6spKy+Bn0x3T0Niq3kULLsPDtjOxW1/n44Jq9Oc4pA3dxvrC?=
 =?us-ascii?Q?JvRQdxMh+pIVoNY3vq2aodAeOdOnT0J5LvB2QQx/EhzKoQmzHlLHN1g/rgcY?=
 =?us-ascii?Q?aQSA+8KgyQzhPcgK3tvo/FXLg/7VeW3DLJneNyjv6/4GK20+Y1HeaEA/737I?=
 =?us-ascii?Q?QavFBs9GNCgw5exBQvHXi69GpzkWiQelqrU9R4zK8HavFwbYmHSju5xEL36w?=
 =?us-ascii?Q?Qu6Tcn0BCTbj6L1nzg+1lTh+IH2qFL29Y3fEihP3sRkwM3U8TSRXaFeCoAEz?=
 =?us-ascii?Q?UislWtXFZowpDX1bBpzbS5fNFb1tl3RW6vAh7zCIFoQTCX43+YsQBrdCAJSb?=
 =?us-ascii?Q?IdGZdEGHhj4GHdPncodplwVWz0Wp0tpcE8Zblo3fG5CkY28ose9XVtRSlIEu?=
 =?us-ascii?Q?SkH/lzadt49pJuQUvSHde06SvQ3KxHDEwsN3JuTJpnhBv5HoN54saF+ab5Oe?=
 =?us-ascii?Q?0drr7AnOs1e5MwkPenkJnSXHdy1tSeAN8wbgtX3RnQWqe/KU6bY/pdScjq2t?=
 =?us-ascii?Q?i2ZST1WKI37g+6CxT5t/WnODVbLemQhBYriEzijhFVmx8qmyi1J0hdWsgtcs?=
 =?us-ascii?Q?hZOGfR2wVuFYzbEUERTRKcUy+9KG+QXEmOi3K26fCl83P/0FEX4RsQJKHd1j?=
 =?us-ascii?Q?12YtqmhRVvxTew/R1Ky8kzgnSeci7wVuB5OfOA7BFaRhUFX8I0yE4y8gE0TG?=
 =?us-ascii?Q?TmXyLKjwOTyYV/Ag6vi22veGknTwvulqEgvmeyeBS+NLdxog+k0DzzcGYF7r?=
 =?us-ascii?Q?yAQBvTXGkeGSgBtMU6XXhgmUJ0PdOKqw6bSvszmqAwrhjcQ3MYrRhPzHaMcS?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de176d2a-9056-4acc-b351-08dcf783aa1e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:06:44.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUWqEkhIKqEvg59rkNWV8K+dv5iHCtx5x2ENIS8Dng2emPzWcPeIEJk52Q5uNyh/stJFef1XTSSQHS0NH7Coiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
of 2592 x 1944.
    
The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution:
   - 2592 x 1944 @ 30fps (SGRBG10)

Support for another sensor, OS08A20, is added as a separate patch, using another compatible.
For OS08a20, HDR mode control is supported, with one HDR mode: staggered HDR with 2 exposures on separate virtual channels.
Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)

The driver was tested on upstream 6.12-rc1 on imx8mp-evk, but also on nxp tree based on 6.11-rc7 on imx95-19x19-evk.

The results of v4l2-compliance test:

root@imx8mpevk:/unit_tests# ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5251, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2e7492386e6e 2024-10-03 13:49:10

Compliance test for mxc-isi device /dev/video0:

Driver Info:
	Driver name      : mxc-isi
	Card type        : mxc-isi-cap
	Bus info         : platform:32e00000.isi
	Driver version   : 6.12.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mxc-isi
	Model            : FSL Capture Media Device
	Serial           : 
	Bus info         : platform:32e00000.isi
	Media version    : 6.12.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.12.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mxc_isi.0.capture
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Sink
	  Link 0x0200000e: from remote pad 0x1000009 of entity 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mxc-isi device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0


Mirela Rabulea (5):
  dt-bindings: media: i2c: Add bindings for OX05B1S sensor driver
  media: ox05b1s: Add omnivision OX05B1S raw sensor driver
  MAINTAINERS: Add entry for OX05B1S sensor driver
  dt-bindings: media: i2c: Update bindings for OX05B1S with OS08A20
  media: ox05b1s: Add support for Omnivision OS08A20 raw sensor

 .../bindings/media/i2c/ovti,ox05b1s.yaml      |  110 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ox05b1s/Kconfig             |   10 +
 drivers/media/i2c/ox05b1s/Makefile            |    2 +
 .../media/i2c/ox05b1s/os08a20_regs_1080p.h    |  201 +++
 drivers/media/i2c/ox05b1s/os08a20_regs_4k.h   |  209 +++
 .../media/i2c/ox05b1s/os08a20_regs_4k_hdr.h   |  199 +++
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 1145 ++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_regs_5mp.h  | 1160 +++++++++++++++++
 11 files changed, 3048 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
 create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
 create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_regs_5mp.h

-- 
2.25.1


