Return-Path: <linux-media+bounces-52278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEvIGXmhhWlKEAQAu9opvQ
	(envelope-from <linux-media+bounces-52278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:08:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50FFB426
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC68C302F724
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 08:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75AB33C50D;
	Fri,  6 Feb 2026 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cutulavh"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8916DEB1;
	Fri,  6 Feb 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365114; cv=fail; b=ekmbMp+GeNI/LFtT3SHgfd/JVIEZKMZbrFHZGwmhOPg5toA4WrcRdxiA7SYE5e338KQEHBYHazSD+F6Xu8xZ0soAPyzB2veY7BTqUa2fGM0yGvJ/9hA1PkTJC/I1OrZ44dviAE7oEPA49F76rDHQ4zw0wymYeA6y8h5+2f23M9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365114; c=relaxed/simple;
	bh=0Dp6BurYGc2Zm7/VUMegtbGFrVhNHVSlKd8oe4GBKGo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vyo0M1SCZpgqKcbzzo5zvduBDzqGnViDZBINhg3FhNwhQElBjJPwBKin2MMXzdeAXeYPI7TX/Q3CA7zb+pKADlY9T4IB94x21Zt6IAcJdnDfMG0qcsU3rzVy2KiuQmD/DKpuAktUGfR4r1rmibZfT1WZ3Fd/jzcsFehbEfwJjsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cutulavh; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHf8uphGzVhSiRof24/bzT7bWfb0S601ekdPLxX2nJ2mF5ViJJ2/sr3eqp6dXPlwQeqKKRQGU/ManVR2j2LbMWu/P4tFnr6maJDmtx/cFdWvmV/LOOSyK4xXafWt9R3yv6b5fzbhhsVHgXox8KysJ3iCrazE1mkByMPMGW8zmv/t3rAcU44COP1veheQnDBkkMSa55h0P+Om7Dc6rF928EMOmgWEr/QlpTRWYbjbwWX36MCFpapVz1B1WLqexJ9d/aiFOBNdIhTJ6PFMCyKFLmEQHQmvi5sgAvbfdCscuFhsb2kKkvJNXxNxPwyn1MZJ8NQjyzjipAjQMF05OZniWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92+YvHeqYLgq6vSVayaKQ7y2crcWeACw9nys+ffRoBE=;
 b=Zbu2zWhjOka4DVMeUTAGshDBp7ZzZpxaDRx1TfnDJxaRRUiuPPgrLoSA9C411bNM0FSI2qif13+Y9eEYDDnGIyYHk0YFzkVSFYL/8FRm17x409BbijMhQ1bPK06CvE5SeUP5RJohjiVEzKAWovIZPj//PrLMWXmKomDuS2NT/LBxIg2GjduEU9IicpJSekN+b8ItB3WG84CvqE/EQ7C+uaQoVBrjMyzo0LlamGCZGtuIKKhr8uKv7MYDA6T5lPJnip/5of/qcAskRB+fBBRBgp5CM+yK2EtiQI0NaCJl11X68Mk0ISLmBoLdd4HL4qSc2LyYo8uFKRb3cMVD584kjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92+YvHeqYLgq6vSVayaKQ7y2crcWeACw9nys+ffRoBE=;
 b=cutulavhMHlMG9zxWEkifurUuQ5mkDiJ/l8kDVqkQB9WCWUb+a+QoFa0c+1bX8sL0pHVXNzt3G0n+yxtS4xftJoHd3fzDubY/SY7totQeaVyttdwP61GWFOGj2Db6558TL0tG07z+yF1e81Y8GuGuB1uaR8g3YNAsqPZr6jlCtdnp2a8v5PJSN+UwDONaOKJNmF9WNLBtrVIdvETJhfhD2NKBnNMJk2aY1TkBK87d6WXGwpc/c7sOuYiVM6kwG9JXRux06heH83J/vkyj9U3m5gkz19e7Utw05umnMDWaWAygUYspuKKNJPyBhHXFgSb/Z9STmXIMMB6mw0uYOc0jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12148.eurprd04.prod.outlook.com (2603:10a6:501:97::5)
 by DB9PR04MB9891.eurprd04.prod.outlook.com (2603:10a6:10:4c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:05:10 +0000
Received: from MRWPR04MB12148.eurprd04.prod.outlook.com
 ([fe80::84d6:aa06:32e:fb63]) by MRWPR04MB12148.eurprd04.prod.outlook.com
 ([fe80::84d6:aa06:32e:fb63%2]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:05:10 +0000
Message-ID: <a093c2c7-1c71-44c9-9b81-59914d71660f@oss.nxp.com>
Date: Fri, 6 Feb 2026 09:04:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: dw100: Merge dw100_device_run and
 dw100_start
To: Stefan Klug <stefan.klug@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
 <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-4-2eb5685eaf09@ideasonboard.com>
Content-Language: en-US
From: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-4-2eb5685eaf09@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0111.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::8) To MRWPR04MB12148.eurprd04.prod.outlook.com
 (2603:10a6:501:97::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12148:EE_|DB9PR04MB9891:EE_
X-MS-Office365-Filtering-Correlation-Id: 3673261e-90b1-4000-93cf-08de655672a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QWhWRk9WcGY1MFlVNDFSWEt6Z3N4WmoyaGh5WHA0amJNbkNMNEZwZi81VmV3?=
 =?utf-8?B?MjVudEd2K3BaREZjaTRyRVBLc1YrNXZjYlFWblJ5dENXdkQ0cUQrV3M4Z3Rv?=
 =?utf-8?B?S0hWRDJ0Y0d6RjNRaGdoVGRxRkttL0VKcFZCTS83UHE4eGpUOXhTcUlBYnl3?=
 =?utf-8?B?bE1RY24wR0g5OXMwOEk5UG04cG1WTUx5RDRMZVlYczN3VWpzYVF2c3JXMmJH?=
 =?utf-8?B?REY5RTBjSVBab2NxRjI4RjY1d0hpOUZQK21kcXlMdXc1a01tRFVmS2gxZGJt?=
 =?utf-8?B?cUxxVTJrS1gwWXN2enJDWjYrTEJyWHBMUGEybWJoRXJwMDlxREltTk41ZzJp?=
 =?utf-8?B?Zk9yT3ZmWkFONmp1YzUrVUhSQ09KRGRUdmFsVGwxckx2Qm14cHVxcnVCQ0xT?=
 =?utf-8?B?TkxqWm5QUlNTNWN6cmZPK1REell4TkpvSGpXTU9oMk1Ia0diTEpqTnVEUkRE?=
 =?utf-8?B?MW4wSitLMFQ4cG8wNUxSNnhaeTl4TnBGZWV2dWhpTnhkWXBocHNTTzhhSXNF?=
 =?utf-8?B?NlA5WWp3bGVtTXh0YUVXclZWNngxdFJaS2lJYjdLdmtRSkZ3bnRSTzdWci9L?=
 =?utf-8?B?TDBxWmhQOHdVL1crR0FXNG81ZEN1dWlsdDJCVnRjZ0NyMlNhSUgxekM4Nnhr?=
 =?utf-8?B?TEhCZFloYVdNZk9BVnkxSGc1S0VqSzNSTWFxbXExbHArUnV6VlRjdjNXRVBL?=
 =?utf-8?B?bTJ2QnZ0TElvMVQxSmMrUmRIb3dhN0dvOFJBeUxvQzRwQ1BPVUZML2JVWXBO?=
 =?utf-8?B?cW16aTZ2elcxbzErYzBxWFhuYkRYSUpQU3M0VEhMakFCbUZpVzNQNWF0K05J?=
 =?utf-8?B?SmlhYlhzcUpMdW5WRytQczBxM2pvYS8yNENEZGxyb2FzT3RDQXRMdHFGdEdp?=
 =?utf-8?B?c2NFU0gyS1Nwc2ZPQ1poQTJJUEMrcGtDTmJYWDQvNGRaSllOQmc3VkJhMlpP?=
 =?utf-8?B?RUhsZDY2UHhhcHBsQk1EMDhaaHo0T2syTDY4MS9YY2hZVWNRTjVxN3lEY0VD?=
 =?utf-8?B?QnpmN0haRTVqcFcrTVlHaUtsbnNQZm1rbXBCUVc4aGhOYUREWXh1cnlnNmpX?=
 =?utf-8?B?VHI3YitlRzdqRUpkMHplSjE2T3Q1L2dqMitlMU1BSmFoKzUxM2tjL29yaDBx?=
 =?utf-8?B?anlYS3hINGZUak1xYW5vdFhEcTNlL1BLQjc3ZWg0WTV0dWdaeWFOQVlPY1ov?=
 =?utf-8?B?MWFLdUVLVWlaSklibjlTa1NIY0NHand5Vk9JU1Y4NFVkWkJ2RXpqemtPeVI1?=
 =?utf-8?B?b292RTJWdHlUUE1NWU9UTFdMb0twckhUUFN2SVBYem5XbU1LU2FzOWpwTC9Y?=
 =?utf-8?B?SUp1REpvU3VEY2dyTk9uTFFOQUtuL09EbktIcDZybGZQV1BiaWdaMEpJUlRM?=
 =?utf-8?B?VEhlY0l1QU1JRkhCdC9PeUJ1SXQvVUppWCtKRDNCUW5ZYmdLelc1Si9JRVJp?=
 =?utf-8?B?cUQ0Uk1OYTBTazljMWt0SVNkcDVuM1BtaGwvTWdFQlpvRllad2ttS2ZSNG8x?=
 =?utf-8?B?azFUWjRFOFNSaUlYNDdvU25mdVJad3lob2hhS0pMQ3hqVEpVWVBtTzRTbGdZ?=
 =?utf-8?B?ZkF4WDE5Y1Z3c2VsV0pYcS8rTmpOWFdka2tCUjFTOTFaWngxcktYWjhnQmJO?=
 =?utf-8?B?Q2VXa0ZWUlFSL0JFRFRhQXYxeVZSMTF1N1YwWm1WMzZuNU40VDZmamNMdHBo?=
 =?utf-8?B?dmJTakFHK2FmaEdjR0NjK1RPVFcxa2dFTUJOVFovT1FUWG9YTXhWVVZvV05m?=
 =?utf-8?B?WjdmUStBSk1EaWZjbyt1RDhndVhINUpmTkpiWFYvcjZ6dHVqUk1maUovQ3JS?=
 =?utf-8?B?YTRyeDJGZHl5cjZEbHZrQWZVcGdJeFRqNjJtUEJCdFYvdVpmcjViMURBejBM?=
 =?utf-8?B?MWpHenBlYW03R2h6UkJCdm1hTlUyMlNWWVY4aDlacTdwS1h4U25ha0FuVTU1?=
 =?utf-8?B?WGVtVFNzU0tFRnNDeFNubldrV2R4dmhhT0FoOTkxWEl6enlqZHdGV1pBNUFH?=
 =?utf-8?B?QTA0YWgralJac3Z3WWtvVmJJTWtIVFM3bnIvaWNPa082UmF6Mjh5QkRhSFli?=
 =?utf-8?B?bVRoOGpNcG1rQVlYKzR5ZDNSS1RJbndyOWJzQWR2cXNoSERLK0k2ZS9XTkd3?=
 =?utf-8?Q?ac8o=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12148.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NTd6Ly8ra2ViTjkwUStuVjZGcWxWZTlQc0ZXWithSWZ1ZGVvRlBwU1VpQ3Yr?=
 =?utf-8?B?RnFSSHE4M245eFdOajRpK0FUN0RybDJLY3d1ejVQdUUvRCtZNWhQTnJhUDVH?=
 =?utf-8?B?S0NsOGhBeHVuZGJhZXNvMERrd1JTNWtVSWhJNE5UQ0J2TGkyK0tXM2NydFk5?=
 =?utf-8?B?cS8yNTB5OEFKd2c2N1RhanhRY2JBVVU0OVlHay9SVmVyOWlaUWlUbDNoNFZn?=
 =?utf-8?B?RmtWV2N6ZXluWDBwNkEzYTl0Z3lScGlxQnloZDJnMlFpemxGNS96ZXNBODAy?=
 =?utf-8?B?YW8rRkxocU9vUkQ3Z3dZTE4rSDNwZmJQNHl5UUJOR3o0RG9GejBkSUpZS1FX?=
 =?utf-8?B?QnIvMVRjelVtM08ya0dtS0UzWVc5QjZDd0M5NFM5N2NORXNVVXZuRnBZamth?=
 =?utf-8?B?Z1JHVWRNd0ZYNjlSNFlNS0ladmRwQUVBRTR0cUhacmc1WVQ3U1QzNFowbGM0?=
 =?utf-8?B?YnNxZllSUENWcHJXaENOY21HYndiakI0L3pMaC9SUzZCYUJ6SWp3NFVrRndV?=
 =?utf-8?B?a2ZjZmN3end3ZGgweVdacGZaVVRtUTFLaEx3bEFBaVYyeWxIaHNjUldSajlZ?=
 =?utf-8?B?UTdGcTZBaitCNjRJdXBJOVFPSlBKZW9JMTFxQzlrUE1rY2dTT1NERDhIdHRQ?=
 =?utf-8?B?WVRZWkVkSGVLdFFqbnpQVWlJQzVnODJ1dnhZMnNJQ1lKT3pGWXZadXhqSXc1?=
 =?utf-8?B?LzYyUUx2YnNnV0tEZHA2enJBWjI2NmtVR3JSM0lsVER4eDhDZkJXQ3FsYUQ5?=
 =?utf-8?B?R2NJai9uSWR0WXJMSmR2dDNTbjk3bVNsUTFPdGxhZjI0VSswVVhkWVJ1MDMz?=
 =?utf-8?B?WTdqUGN2UktGUXk1enBnUitscHIyd25RbmQ5dVlNTkdUWUtsMFB2bENlZTEy?=
 =?utf-8?B?K1JHLzcxNWFESjhyYWFzN0ZmbnIrZjI4QjBrSjlnckJKRnlvRkpPZHd3eUY2?=
 =?utf-8?B?NStKTmpuM21XL2lVNGpFN0RvdjFRSnFzWmtpTlo5WEZXa1BSQUpLbW5mTlIr?=
 =?utf-8?B?MjBTMnpPYnZEeUd3T2ZjbWdlbXFGc200ZGVpSHlhZWpSNWxOMFNBWlFWTDVx?=
 =?utf-8?B?Y3QzWlU4MXEzdEI5eGt6S09OKytmT2NiV0JjdmRjMHZWWkJKcnZ1UlduNXlV?=
 =?utf-8?B?VTZPZEF1UGo3M1JaQVlKc2RqbVVtMytOQjc0YW9PWGpTa1JQeTYxa0MzM2dC?=
 =?utf-8?B?cFBrSkc2M2QxYWVKNGlhL01yMGRyV1FPS3NyaVpXRGJkby9oZ29hYmllWmRR?=
 =?utf-8?B?R0drWDk4TzBvc2Q1WUtJL1dVcnpuejhxbEtnN00vdktudXoyRmJiKzlkWURH?=
 =?utf-8?B?RjFVaS8xdzdzSHhkNldWVWZUU2xrdlcwL2RaU3pGWDUxYUlEaVlPb05Nb2d0?=
 =?utf-8?B?bk43dm9iRGNjRjFNclZRSnc1SGlldVpEcE96ak1GdVNLdGp2djlOWFlqcDBa?=
 =?utf-8?B?ZVlPOURNNklTbXJValRsTEtKSDNKQ0QyVXJJdnMxQnpOaW5BVWphd2J4aFZY?=
 =?utf-8?B?SXJvTVpDSUoxYXpGSThuWlVpUnpGdjlJSTI1RS9RSmZEVzVFUTRKTUhvcGd1?=
 =?utf-8?B?MEtydGE2ZlhVaXlHL3laTlk2R2QvMnppSGNMNFlJRWtXYjBqK21ZUWx6MzVJ?=
 =?utf-8?B?QlM4YW5rVVRGS0s0c0svZUd6akVaS3VMei9oSnRxOEEvQU0ySVRRVlBCM2dH?=
 =?utf-8?B?enJNcUxSWkJ6dUFSanpsblZEUTBmNlBkTzk0bzZGTnZMM3FRZUlLUFBXTDlG?=
 =?utf-8?B?Y1VKNVEzdnJJVkRwUHpsc2dYNXBtRm5Fcmpqd25DL2t0TlBNTEUzU3hpL2xK?=
 =?utf-8?B?OUhkcUNmUkVjVFBVeE9IVTdLbGVZOXphK215YXl5QVdMU002ekRZd2ptQi9x?=
 =?utf-8?B?bDdOYUp6ZlBJYTdrQnhTNit4WG1VTHlEOWdLcWxaYnBKTUlnQXEwd1ZJWE1N?=
 =?utf-8?B?VXllMldNTXhJazdvdWhzN1RtWHBLVEs2dXQ5enQxcmlRRWl6TWxQalhsVWhT?=
 =?utf-8?B?YWt1amtZU1lpSDc5Yno0MUM2eWxMcmUxYnNlaWlHajdzTXFZbWFUYTJIRE9O?=
 =?utf-8?B?RWNZZ2puN1hmSFFCZU1pY3ZTc0dTTjJ2WnhUUmdhSlBHdGFMVUF6NVVQakhB?=
 =?utf-8?B?eGpSVmYvQ1g4alNXVjJBTGYvV0VjaFM1bFhTSVRLa243akZxbUJIZXV3Szdq?=
 =?utf-8?B?MG1PV09zQ1p6ekF2MmFabmNUZTBKaDQ5QVFHUmpDd3JmS1pOTGJMREh4MUNo?=
 =?utf-8?B?NDRXWFdReU52QzRHcUIwMlJrOXNIdCs3OTZYcWE2WEFRRy9IYTY2YmVhMFhV?=
 =?utf-8?B?b2htUTJaQjZROVpqMjU0Q0VYZU01UUdXRUZPSW13NHBBUXhuZUNCM3BOT0tx?=
 =?utf-8?Q?WiJXYYwS2ioXVqSA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3673261e-90b1-4000-93cf-08de655672a8
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12148.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:05:09.9881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeqeoObKh09UEpnw/AX9rK7p9HRwpYfoB2XfXx6oxqrdNbVilVjB00CY5B95t8aDAe76jcjgQRC8dPA2L1SdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9891
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52278-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xavier.roumegue@oss.nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: BD50FFB426
X-Rspamd-Action: no action

On 1/29/26 12:43 PM, Stefan Klug wrote:
> The dw100_start() function is only called from dw100_device_run(). As
> both functions are not too big, move the code directly into
> dw100_device_run() and drop dw100_start() to improve readability.
>
> This patch contains no functional changes.
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>


>
> ---
>
> Changes in v3:
> - Added this patch as proposed in the review of v1
> ---
>   drivers/media/platform/nxp/dw100/dw100.c | 61 ++++++++++++++------------------
>   1 file changed, 27 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 46e3a7b74fb777aa479110a52229f36b8632db44..c7c4249f5769467fb2b1f3c87f5685c4463a0a9d 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1442,25 +1442,42 @@ static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>   
> -static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
> -			struct vb2_v4l2_buffer *out_vb)
> +static void dw100_device_run(void *priv)
>   {
> +	struct dw100_ctx *ctx = priv;
>   	struct dw100_device *dw_dev = ctx->dw_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>   
> -	out_vb->sequence =
> -		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
> -	in_vb->sequence =
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> +				&ctx->hdl);
> +
> +	if (src_buf->vb2_buf.req_obj.req)
> +		dw100_update_mapping(ctx);
> +	else if (ctx->user_map_is_dirty)
> +		dev_warn_once(&dw_dev->pdev->dev,
> +			      "V4L2 requests are required to update the vertex map dynamically"
> +		);
> +
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->hdl);
> +
> +	src_buf->sequence =
>   		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)->sequence++;
> +	dst_buf->sequence =
> +		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
>   
> -	dev_dbg(&ctx->dw_dev->pdev->dev,
> +	dev_dbg(&dw_dev->pdev->dev,
>   		"Starting queues %p->%p, sequence %u->%u\n",
>   		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>   				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE),
>   		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>   				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
> -		in_vb->sequence, out_vb->sequence);
> +		src_buf->sequence, dst_buf->sequence);
>   
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	/* Now, let's deal with hardware ... */
>   	dw100_hw_master_bus_disable(dw_dev);
> @@ -1469,10 +1486,10 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>   	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
>   			      &ctx->q_data[DW100_QUEUE_DST]);
>   	dw100_hw_set_source(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
> -			    &in_vb->vb2_buf);
> +			    &src_buf->vb2_buf);
>   	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
>   				 ctx->q_data[DW100_QUEUE_SRC].fmt,
> -				 &out_vb->vb2_buf);
> +				 &dst_buf->vb2_buf);
>   	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
>   			     ctx->map_width, ctx->map_height);
>   	dw100_hw_enable_irq(dw_dev);
> @@ -1482,30 +1499,6 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>   	dw100_hw_master_bus_enable(dw_dev);
>   }
>   
> -static void dw100_device_run(void *priv)
> -{
> -	struct dw100_ctx *ctx = priv;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -
> -	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> -	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> -
> -	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> -				&ctx->hdl);
> -
> -	if (src_buf->vb2_buf.req_obj.req)
> -		dw100_update_mapping(ctx);
> -	else if (ctx->user_map_is_dirty)
> -		dev_warn_once(&ctx->dw_dev->pdev->dev,
> -			      "V4L2 requests are required to update the vertex map dynamically"
> -		);
> -
> -	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> -				   &ctx->hdl);
> -
> -	dw100_start(ctx, src_buf, dst_buf);
> -}
> -
>   static const struct v4l2_m2m_ops dw100_m2m_ops = {
>   	.device_run	= dw100_device_run,
>   };
>


