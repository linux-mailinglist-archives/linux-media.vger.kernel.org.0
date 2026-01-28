Return-Path: <linux-media+bounces-51747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLNlAHYvemlq3wEAu9opvQ
	(envelope-from <linux-media+bounces-51747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:47:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02AA4654
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EEAA308DD43
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5252E7637;
	Wed, 28 Jan 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kP0BIH7R"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F123EA92;
	Wed, 28 Jan 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614799; cv=fail; b=DV/PT6VG5spr07dFHIvfy95tPQ/VtAiwO3Z1Eu7dGq58WyeP3yrMqB7ByBS2M/elJN/u93ju2/cOUQm5yn71lfMhzo0Ry+RgCymP2xfXqQoFPswwmbL/fmKjcZsgrYrbAxGIkEEURI06pYlhbh7HC+hwfnRqlRZgCv104kSFfug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614799; c=relaxed/simple;
	bh=6oKZ87crZmgDeUZi4MRoOxspG8TyFydkFer4h7Du0s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JqyKw/bLQ9GLmLVK2EZcnt3+PVYOBdkHPxmcaJ+LP8JWRWOYZE9VBb0Orqwyn9rNx5ng4SNhXlN+hZWNq+x0KFnDN54D4PjxtvWcAosH7DvOJgM/icWVcvKflq3Swh4rEXL0AF2wzIYZCRDx0hLzEOIjT6lrQQrXj9dON7gyiI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kP0BIH7R; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INZVRl08HPELTzn+EblWgzBK9xYYvYfITHaXTlQtxAJeaXKgBZtbRRRY054oomWLcq+ldf4yyYh/dZgaBL9Gi3MgSWTaCaccvb1Y1WaFYhfvy5Fc2VpgzPTxG1p5tnYoRcJZzrL2YmElv2GXtXgQDj0qB66WXf86ZmE98ws+qkj9UrlgwY4OylXYQR5KZ0TAeyOoUXfuyvpTyO2Fo6MsgX20dkLWyNMiqHlSALQT8rAaSZGxJRHWkDOiVSgpwiiBKJoF4yCSeHupi7s7qp64/DUZKlb+ZKfEm87XHT3fRgPCaAKk2m34o63nOK/zepGaYdnN3sx/tTgkCXX5m8w5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LES4Rh5F6V2muvCiEA5HpCLGB+ck3beV7aj/V6fGAE=;
 b=jn0z7LlcKmprm+yVFJhjvAZneapowvVWoyKc/iMfXHTU0TPB1m8wgsgjwChF69q2MzccaGzjo3k7QdpIek5VPZdHZaczYooT5YegGhJsodzWcgucUwIU2fLMRhcZAj1OoF94/ePRzexllchDDAv8bnELNcI1GYV4Bs/B4vVWQB822qeeF/d67rqvALzOTIE50c9Taw3vrNXenfT/asqnmW149tDxsON+DNQfliPJlm7R2iR+/+iRbJixIw7enxztYWNwSgLFvMAUuoxx0REGQfWeDQ29lzRLKAHm7V5NjLdveNCkX2iOrlE4XfVwGa+/277aLi29XsXeclthNmIWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LES4Rh5F6V2muvCiEA5HpCLGB+ck3beV7aj/V6fGAE=;
 b=kP0BIH7RGlu9ronhKyroeYzwdASopzLWsFth9ajE0ktVQXQFPnJk/FZgl6oMWXosYxeg677QLgLFmJRO2MsWlHC9kskB/ZlaWU9NOgrv0T/J/sW5ko2AtBKYvvhPoUCSDUd1huM5F83wSOKqSgYH6Go3SFz7cwsvSqXDdlTeizfZ7WluRH3qBHIWt1ziUtHNPoIv7xqNymAK+QGgutxRQ+IC8uB1xAnVzJ+1T4DD/zpK0ulOC0baX3wJfVsdKo1GlfMJUPpFxJrksgA8p5HaMpuJnYZ2NWfI72pU06uPkcRqsmbVh4w4p5TFnYM0iiCtCV0IXjRBIB6fL53ELbxEVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10929.eurprd04.prod.outlook.com (2603:10a6:800:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:39:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 15:39:54 +0000
Date: Wed, 28 Jan 2026 10:39:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: synopsys: VIDEO_DW_MIPI_CSI2RX should depend on
 ARCH_ROCKCHIP
Message-ID: <aXotwRkayaAQYzt6@lizhi-Precision-Tower-5810>
References: <02ef452575fda61ca1d5d54086fec1223e3421a9.1769540923.git.geert+renesas@glider.be>
 <d3b9fe8c-688f-48a2-aa00-2f640dec079e@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b9fe8c-688f-48a2-aa00-2f640dec079e@collabora.com>
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10929:EE_
X-MS-Office365-Filtering-Correlation-Id: bf61ea43-71a7-4213-b8bd-08de5e837b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZANQMbwU1T9eEaRrax7fcPpS9BIFwWJlVy3WuIQVIoOO4eCv+ovw7DxfvjB?=
 =?us-ascii?Q?qfwVsudsPXWF2ZR/oL0ovsKPv6NGxNehittwWp3sk4zWqAgTYoFTj9fa+xCc?=
 =?us-ascii?Q?4r8ADdyv/JuKD5aVSV2dNcbdjIfc5fIBV+RatA7ISIogVvVjYremuTl75keu?=
 =?us-ascii?Q?NNMtND9aG+BVTrQaO6OsQ5cDuTkWv9bzXHe+cuVtGuu69RbpW8tYvu8teq6+?=
 =?us-ascii?Q?SMCD3nRE19PIswdyBRZJ3aRH1Rm0sC6/BDyKI8dapSadzKMkNv58wnN6TGuf?=
 =?us-ascii?Q?E4Op97kip3oXsqjH0s6dGPWbh/YUTgAAMD9PbXp6JVLufFLvcz4ctfd7TW7C?=
 =?us-ascii?Q?FHNp13YoxS3xULCJmM7D0rtqOBbvLI/9xcrf+fJRhtLH/JKFtlXgG+ZzQsi/?=
 =?us-ascii?Q?CRWigXL9BP6+ZVe9HPj+GlzS6ItdNH0TFRq5ZUzw2ctPfjNaHfUdQLa7rkST?=
 =?us-ascii?Q?IQDq8ocmmd82GG+25m8O6MfPpufThFNPozxJscvYO6hcXqFo/82OWo571YlB?=
 =?us-ascii?Q?3V4z5DV2EOxCxyBWb4FDu+34ETjKKMw6Rp8/Gvh5h673rHFMIHcqx2GtuMDN?=
 =?us-ascii?Q?8iGZX6GPb362qreJMujl+CEXkz6y89qjh8BXtq5502MLLzoq60oXHE5N7igz?=
 =?us-ascii?Q?sGNNE7kNS7rmBS4+9CYwqiDVA2kNU1cGUta8g8hf5LJ+CDjM/8A6bBOwuCv6?=
 =?us-ascii?Q?D6xY6NVQnXhoh0Z8a69pnhxaf2DqsPNXXZCF89e5x/L4gxE2cAH0aWCdVGGQ?=
 =?us-ascii?Q?bE1ytmrl0YAtJcS0utPEqEQnLxqg4qQzRBSccETGZjEplwARn8Em4c3W5Vgv?=
 =?us-ascii?Q?wJOG/iGj2IeYuuIWXjYWg6LCC+mNrhAi3lNzbu7DfWXUWl84K/9To/uR3Wjj?=
 =?us-ascii?Q?kZMVm+7NRibia8f5PaYaPH2/0erFF4oejvVcTWjj+/wpprZtAaj7LE5cc4bf?=
 =?us-ascii?Q?Xo0qOIzx7IlkNlrkSE2en65fs/hK2WPehH1uhw9yVVbAYoINY5UBtJKMV0dy?=
 =?us-ascii?Q?uPWYOcs8r5DFjGZNYD7JshJUxiwiW6rgcYim3/QaQMnhVGOYRZ+uqUD5uo3p?=
 =?us-ascii?Q?BFjfnhAck8uxQjfF7M8J6/+ZOLcsbZAL7Vb+Vmdhs1pXX7a1WPWzb2P84ZIC?=
 =?us-ascii?Q?TeDb3MCVCB+ZGykPh+wrXPyZ9P268Jzo1jU4V77QKhhBJykhG1oArem4itpy?=
 =?us-ascii?Q?B+Fqr7EDbnxFJwbxdZyZuE2pkdTiYMIh3wrbfXiMXfHL3fX2hcDrQKeHORrq?=
 =?us-ascii?Q?OnyCKGGMDWS8N/oKIaU0L0ZeGx8M4W4AxebFDinbz9tBnBQkuWWRlu+wK2ro?=
 =?us-ascii?Q?4goPxi5BL9RPlkImNdlWwXY6j5nIoPnmBmMBVACRMji4Ey2afsMKBvkVF4Z3?=
 =?us-ascii?Q?757SzEq8/c7IFh4/vwNilBxLjd3QnQ6OeEAF0a37Em6gbt8N2FKX9aCBqKRP?=
 =?us-ascii?Q?INkrUPUorj51ZgdIXgKOJguMgm21eQf0xvU5d9HT7//Bj3KDW7Nm+xCKp3O+?=
 =?us-ascii?Q?3dg8zVB4L5xqHpNV28DbqCETTEC0aBINT8Whrq5/z3ld5bhDWEbH1+nU6ylQ?=
 =?us-ascii?Q?tSD9XqjcdmZTCthLHLSftyUHPtZn2JoWr9047ZCOkKWJvRf4mMBiDHQO6370?=
 =?us-ascii?Q?+iupOddiPsSeTebNy9e96AI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yxpgqTkEzURJaBa+AiUHpLrIDozpW3X6C/Y4+w7ii8UbRHSr5WXdNJgjqk4z?=
 =?us-ascii?Q?dZKo9KLNuFre8ou9kzHK6jeTwXJ4vJWJtwZBp2k62Z9PaAC1QcklbLfDc3C3?=
 =?us-ascii?Q?G4gAmAqRCeLH9eTePNNovw1Rszmw3ZkIaQoQ1dRAbHcIWHJguLaqTEjKvnbX?=
 =?us-ascii?Q?CkjsdjaZzc2k7SfDYNdI8WIsSGeBj087TjyN643mtmKOmkSorl3blj0jzclt?=
 =?us-ascii?Q?zMvEcxc08rqsnHZ1EuNcxVTftK+EOEM+vaoCXNszq5QoNAdbu3Rw/osPma9W?=
 =?us-ascii?Q?7eWNr6MVFvClxwof9pHwxk5tFuXiMF9htuARmMFnKBP158FvZeTA1qiSSPFe?=
 =?us-ascii?Q?FdeTm06WVFS8gRko3OBO5OBhP3HO8dw8V6kWJFJ02neHoihiW4ULQeKDzIFi?=
 =?us-ascii?Q?pd7op/2clYtimnDZ8dIQs73PpY7W1jIYNY5nzGI9FrTyZMmwsr4CWTfxa9Ay?=
 =?us-ascii?Q?pgXWJJSZKrTpUps5rIodsdmqZKYfNE6TKSJoGNbHXpSYt1nllUB2wYdpChYq?=
 =?us-ascii?Q?Hm4bmI292zjX63MHiI+rNT0y6J92oHAJY2h/br6opo5NVC0QMByddCLRWCqo?=
 =?us-ascii?Q?946r6Ps7mAdiOk4PiKubTsbaBHIwlkXiuad8QLkz1eaysmttlv0TxSW4LKIy?=
 =?us-ascii?Q?rX3V/UmHZkiM+zVNKPDGtsk8R5mzAG5silaBYWv89/aBnw+hIcMFj6R/wQJx?=
 =?us-ascii?Q?pDzi71X0Slrgl0w/dihPYMq4sp76ePEjylEZxjyeghRP5SPZ5t8pchuMiNZV?=
 =?us-ascii?Q?a2LIKjvm2ds+JYTsy9add+P+TKUnSqTqB0VMgf77ZJrTmHz/i7gGy10m3lnp?=
 =?us-ascii?Q?8+r/equQAh3P52C/A+/C6FSm2CErM9l/wG9N4P5xvXBvE+dqDkZ0ETZrP1eK?=
 =?us-ascii?Q?Ex+7WfJ0gx1EmuflksdB1HsyeJqTijliz4JYD0IEnlLNUSJzu5ETVDZsj+K+?=
 =?us-ascii?Q?/y5wnw0MuGUPAfgWXpx2PG3LXhbyy7GVKhy7xhwJaaJrY2oENtyWVLroqg1Y?=
 =?us-ascii?Q?HnZH2TrE3gLVqDf3iX3N9vDFg4QdRH3hP9aEAADnnqqpMK1qEjuC7zZRZ+kf?=
 =?us-ascii?Q?p2Qx4FnG8S/P49dGuJV+OQFLkH1y8tttNQ9fAZ0QRP5GOOSCuitvnEpUX+dt?=
 =?us-ascii?Q?eYqETFj2bO2NVw804RVMsDe9TLMKvFvzvpqYr3SulVWvbZqQqU9NDawEx9w/?=
 =?us-ascii?Q?Yx+/8NbR5n60E9IXbi7Ra5FC6HEed8/uLC6HKKJlhFkW4DxoTGlAa9yd2Cxh?=
 =?us-ascii?Q?cH1fgSLYtSAVrUCAdNfywUwZVMJmmCS2iP6l4nmtI6Pce5B0VAQWBO81rUy0?=
 =?us-ascii?Q?ufUzcs1mZd6Bi5wO3Dx7KG7m4KZLimERxxTgPc6XaL7TCCtmB9xpeKl8vzFl?=
 =?us-ascii?Q?zFcbdPzJ4PaPksvP2+AsEEo00UfZch1UIFA6jYNjqmk/z/mgy4kVsxoKHWUx?=
 =?us-ascii?Q?VFhuKiKEHDdDLtm2MmpUDRU1jmDAwRK0GA7f8y4NkOpZPUElZ1hvj9P45bdI?=
 =?us-ascii?Q?6snixATJDyJrVNH3EjGkrZjGnTVWyEfZs+GDndumUoGQ2P0ceNrIW8A2iXpJ?=
 =?us-ascii?Q?aYmmiG9ffvks42Ae1yXnh9svz1OcbG+FW8msYu8ghG5ox/IE+DQYD4j07WHH?=
 =?us-ascii?Q?znOLnb7XfHE9Ozws4+hh+hlwzuLc5Fi21dt1b01dnpdq1+baLGKCboHQdLHN?=
 =?us-ascii?Q?+UWDgooXoewEkfdmDA9agIU2YGfO9M81Vu1oUW7P0qd2HuW9F75Kaf4e+ZK2?=
 =?us-ascii?Q?gFs9oFB8aw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf61ea43-71a7-4213-b8bd-08de5e837b6d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:39:53.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+HWyp8Q7OC0h0adr2eaQmno0x2UjE087LLzmP9m+qhDTXzmWOU096u3Hu9gX12f9SN8ilusvn0q4ILTBVMkVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10929
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51747-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email,nxp.com:email,nxp.com:dkim,glider.be:email]
X-Rspamd-Queue-Id: AF02AA4654
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:24:57PM +0100, Michael Riesch wrote:
> Hi Geert,
>
> Thanks for the patch!
>
> On 1/27/26 20:10, Geert Uytterhoeven wrote:
> > The Synopsys DesignWare MIPI CSI-2 Receiver is currently only supported
> > on Rockchip RK3568 SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to
> > prevent asking the user about this driver when configuring a kernel
> > without Rockchip platform support.
> >
> > The dependency can be relaxed later, when adding support for appropriate
> > SoCs from other vendors (if any).
>
> No objections from my side. I kicked out exactly this line when I moved
> the driver from rockchip to synopsys, as I thought there shouldn't be
> any Rockchip-specific bits.

It is fine now. We can change it when more vendor use it.

I remember I already provide review tag. Anyways.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>
> Cc: Frank (since he aims to build upon this driver IIRC)
>
> >
> > Fixes: 355a110040665e43 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> AFAIC:
>
> Acked-by: Michael Riesch <michael.riesch@collabora.com>
>
> Regards,
> Michael
>
> > ---
> >  drivers/media/platform/synopsys/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> > index e798ec00b1897560..8d0f5e3e8cd58eab 100644
> > --- a/drivers/media/platform/synopsys/Kconfig
> > +++ b/drivers/media/platform/synopsys/Kconfig
> > @@ -4,6 +4,7 @@ source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> >
> >  config VIDEO_DW_MIPI_CSI2RX
> >  	tristate "Synopsys DesignWare MIPI CSI-2 Receiver"
> > +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> >  	depends on VIDEO_DEV
> >  	depends on V4L_PLATFORM_DRIVERS
> >  	depends on PM && COMMON_CLK
>

