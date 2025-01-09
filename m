Return-Path: <linux-media+bounces-24475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52775A06AE3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 03:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A57162FAA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 02:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD0A126BFF;
	Thu,  9 Jan 2025 02:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FZiAa5/f"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDDBE5E;
	Thu,  9 Jan 2025 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389522; cv=fail; b=W/TgF3clAwgwCFhypouw4fpVbgf4Rx0qyb1cIwLaFagapbswEYyNuUPWAOO+k7pNc6sTKqfOenhKofazN/Kd761suw5h6RDZUDacwOrdOPb4pu3nGGbdYyosZrN4IcMJm38Z2JYggJeMPhJu4vQ7hBC3hdnr/FodFjZ/E8csLww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389522; c=relaxed/simple;
	bh=X/clPeErfQkkASKpQ3L7r2Eu+Jlnn9+2zmrNi5b19PA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eCHngmotzBDiSqRbYgXywIN8TYQtf8jUGpERnKPR9l1soAWajfmJkCTV4eE6nZL7aaNg+c4CFrMc/rwXtgbOyuUek2NoKLvcojnrlxh+hdjBICzLLQiDyNDpZd9VjcNkV/UHm1IvEXoCw7m9xaV4MS8K0Ck7FW6/iPF20h+LSgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FZiAa5/f; arc=fail smtp.client-ip=40.107.162.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9wMkzkpf/fOyZfKcXDykoKygEqe7/Old2IKJAKOcc9JS9U7mhq4GNk+afTx69kqAdpWlI5woaFOAaDmI1Gzr5Qp8fOHNC6SVLwWmE2a1Q3w5tOFmZxY5qvtlPoBUYfLXecwvnB0SSlNFoiU9/pW1kDJ9Gzpih6qQzLjwb70bPZLml8WNnqtMBdEVGNyen9c7Ctje9L/G0ccf+hBP5R+dX/hj8+eonbSZaWUq+U3LXVEZ/urio317j7BNL3jMsW7mUwVHW2f1pz5IoZ5Uj6wph8l9KK2GrFTqIwKWoUh0uqxXvvM+m09/onn2TtwaYMGyTyBg6cfivjj6BK62gpEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3pMp557PsyvPlJFSLBYujoJUCv6il9NIbKKUN8spUc=;
 b=dwa6nwr7UToPqC/UWTYYzrnhnPQvCCs8ulqcmy8gKm2L3msZY9wL03bByKjgXonlZepS8Zr5R4poT9b2tHXq+yvT67HGLnd3Qgu4+FE80NOwgsp3NRQjnfCb8+YSPXsaKNDXvvKcX4Qbesh4KTfAhfjh79qZw3yeJvDGGQRJ2i4B3VhiacMvAqhLIfeQhVA8kTj/HjeoDir197TZjonPdIu7yAQimzNqC4FGD3Qu6Ekq789Sl0BChEB9n9UoDKuks8xMpCAoiCfvaAfdF0qw6mnC8en742eClBtd6IlHGGTXMQXmJhfuj4618fz3KpAfZ+zw6wk/fB+yS9WvH35jXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3pMp557PsyvPlJFSLBYujoJUCv6il9NIbKKUN8spUc=;
 b=FZiAa5/f9bQXYiV1b8SrNJCaUdndLZCzfkRiSk1lNa4ZDdHLOvXk9vQlM0V8vMliNSWHNS9Aymhb9LMMaU7uM3ntiCq68myjaB7Csztkk7I6tGl7zQ3JYfu3YgXVRaIXhB9nuBCmdfW6F2GVk2c3i0z7JDFZymd/Z81NL6E5WeKefDyhdZghKKgdwle0JJE1QBpDS2quQqdgW1hHfRqumzaeBeA6AO+yxy6v3uFB6EkIw8l5IFc+7oTP17sVEYlJa6kR8rMCPhJ1Xp36RnGAIJS5pDc+cU2zV9Au1wEq38MgQwZIFDKfXLKumM0RSIF7nQj4ouZ3lttwAft2GwmPow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB9PR04MB8171.eurprd04.prod.outlook.com (2603:10a6:10:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 02:25:16 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 02:25:16 +0000
Message-ID: <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
Date: Thu, 9 Jan 2025 10:25:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
 <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB9PR04MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 1951ea8b-2405-4b65-f37a-08dd3054da24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVNOOG9Ba3Z3VmQ1TU16Qk0zQTltMkdLcUowRFV6TC9EVksvM205R3FHTUZC?=
 =?utf-8?B?Z0ZZNHdtak5YZmFzMzRUWk80Tjg1SHJUWjY1cjRwRkF0em0vSGVlckFwRFdB?=
 =?utf-8?B?TU5sRkNiZ3lyLzZ3MXBCRW1RaSt3YmI3bUJCbXlEN3hCNmI0WHU1Ny9JQkJt?=
 =?utf-8?B?RHlmSndsMElpYjJvWDFCVDVmRUc0VXIyVU91c3ZUcE5CdGlFSEdDMFFxaTNl?=
 =?utf-8?B?Njd0TVBCSWFZWS9FVVFYK1dTTWU4TDVVZnk3WDVQY21IeFFIZWt3UFRpVU53?=
 =?utf-8?B?NVdrb3FQd3BvTzhNdTVFNEFOSnZjSWJuLzV3QnpQTTQrQW9ydDV5bExBL3g4?=
 =?utf-8?B?TklCNUVHOENKTTV6cTNyejZ4NFJJdHhYMVJPM29pSlJ6c0lWZkROazNaUk5r?=
 =?utf-8?B?SlBoa1d6ZDJmNDlkdEwyWmw5Y3JRdUx6QVdrTzErZVBGckRURVZzdDZEaEhU?=
 =?utf-8?B?Zk5sb2dvTTFJZlJ0citSYmNaN2Vmd2gvc1Q3NXZmajBsdXdadTdyeklXbE9N?=
 =?utf-8?B?TVg2Q3BiVHBpVDBOdEUrVVgvUytraW9iaHRVL0YrSkhEcFBMb3N2aWhsanhy?=
 =?utf-8?B?b1JtNVBvajFvOFJOYzllOEpOejZublpiRENIWEtUdTkxZmVHTks4UGt0Q0xL?=
 =?utf-8?B?ZlNTMlZJem5uNHlHMTJ2bStueFkrYVdDVUI2TmJLYWZDNDRZTW02M1d5T0gx?=
 =?utf-8?B?blJ0djB0WnhjcGNSaXJPOU9JWXl2UWY3eDlHZjQ1b24wSU14RWQ0eFlnMUpx?=
 =?utf-8?B?aU92U3ArbVJaWXZmNUpyWG1TY0JITFRCMjQrVlU5Q21rVDg2bFdEeW43OU9o?=
 =?utf-8?B?UWpMeDh3Q1ZHc0JlQWhrRWppMDlaZ0VsNUltNDZ0bnRPMTdCN3l1RWZ5N1dM?=
 =?utf-8?B?ekFPSVEwNFRJcGNnQ0RaakgvMzE0NDhXcDhsenRnNWprV0RhL3VnbkI5MTNL?=
 =?utf-8?B?SjNNRENvUGd4aVprb0djWnMzbkE5T3djQW95NDBBdDRyMUVhd2dkekhZQ29U?=
 =?utf-8?B?YitrU1dYTUYvTXV0SDJLTVdmTkprcG5zcnQ2c25UTVlYQ1BhdmZ6dnMzelF5?=
 =?utf-8?B?WlRucDNGUjFFV2tuMVBzaitiaTNsZWxPeFpYNFZiZ3pHS1Yzc2dYZjZqYjIw?=
 =?utf-8?B?K2pKMnBxaGQ0UXB1MzNlSlJXM0NnQ21FZ3JWZFRyenF5OUw0WXgwUXQ2YUVF?=
 =?utf-8?B?UlI5MWRHc050THEzQWh3eGM4dk1pcldtYURtOFNTK0VVL2dZY3FXMm11Qncx?=
 =?utf-8?B?M2Mxak5WUzd0SzRkRFdVOEJvUC9OWkpVZkd5SHhGNHpBSVpTdHcrcklidVNN?=
 =?utf-8?B?eXZ1NllZSlJuTHVZZkwrMXdkM09TMHJpbDNqNkY5QS8waG00WGExUUpzYVgr?=
 =?utf-8?B?bGZKaXRSS3Bvdm1Jc21saU5iK2JVYjFyT25sWmtEYnRyQ0t4cjFzY081bS8r?=
 =?utf-8?B?c2locUJnUUdwTU9IMHRZdFdsRllDc0xsdUVXd2JUTXY5VjE2MStnUktrcXI1?=
 =?utf-8?B?MU9hRWVaVUdlZ29qeGlCdXRMaUJ5SmloeFhVc3R0UUpyQXI2VnExbXVUeGRH?=
 =?utf-8?B?aTRYT3NCVjNCZUdUWVRxc1lpQXo0emZIRVp2eUxKam1pWlJwMGhuOEZCVEhr?=
 =?utf-8?B?aUxJVHFUYmxJYnIxS3dsbkQzZnpUODV3eG9ZUUsxZC9DbTJMV3FmanNhTm02?=
 =?utf-8?B?aXNvOVJXZjJ1YWwxbTUzWFd6VUJ2MDczcXBhTUF0R0JZbkh3QnA4dUdvN2Iv?=
 =?utf-8?B?R2JoQU90OHlGRzBqYTNqL1VadEJ4T1dJdk5Ra2dHVW54U25UVHEvSVVKakVZ?=
 =?utf-8?B?dy8rZjArUzA2RDU1Ympua1RuQ3hmeUtqRU85SnpNNkMxWVJMRm1kSnh1bDhl?=
 =?utf-8?Q?lF2LqVN3VmqSB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RFenFWcGwrY3FKbS8yYUZQK0h1YTBjTFZ4WE5QcWhPSlNSOEV0dDZNc0VU?=
 =?utf-8?B?NnRZNWd5eDJ1emp5TS9SMklMeVdlS2pTWE9QelN4S2NzL2NSWG5jWkM3cXVM?=
 =?utf-8?B?OXRVRjNsSUt3NjN4d1FpYUQ1Z0V2VUN1MGpyQUdHU0ZXQkNQaEZBY05sR0Rw?=
 =?utf-8?B?OVdBUG9lc3BpbVlnb0xKejBNV0RHOWNpMzZDbzZSb1I4R3VZWjFaeWNFbGZ5?=
 =?utf-8?B?UnF1ay8xZjVRdi9OdEpmUG5DbDNQTW4vR0JteUJOUjEwTERNUW4yRWxtU2hv?=
 =?utf-8?B?V0h3T0NqK01PZzBSRkxpUkI0MGxxS3NOVkh0MWM4blJ0UDZTUitZTXpOUmZT?=
 =?utf-8?B?Njdtc1lDYWNXNUUrcmJEMXd6amVMc2hMcDMzQ3RIV25WekdydWN6di9NOVBi?=
 =?utf-8?B?SXZ0SkMrMTE3QVQ0WFlURktDWnFHRlRTMklYL1gwV2xCaS9sOGk5aGJsYmh0?=
 =?utf-8?B?ejBuRVVhaUtBV01aS2JiemdVUm0zVkdqMkt0cC9Hd0hTNlYxWnNCZjZhZU5X?=
 =?utf-8?B?eUY0ZEM0ZHZtSlBaUFBOaGxKejVNYUNNb29BVDZRZG80MGN3ZjhTWTBkSnFF?=
 =?utf-8?B?Z1cxN1M3Sy93UG5IN1doaTlxNFRsa0pMSEduclk1aFM5QjcrcUNBMzVnNyt3?=
 =?utf-8?B?T0U5T1k5NTZmbVJqRXU4STgyMGpjSFZldkRXeDVuMWFIREh3QUxMRlhDcnpi?=
 =?utf-8?B?M1I0S01jK1NHWSt0cDREbGJKcE0rYmhCS1lKVVRzbmViN0cyYnIxVTF4MXRT?=
 =?utf-8?B?ZXdmUjZOMnUrbE9YdWw1TERQa0VXbG9NQ0lucDVaWE9GbVVMNlphbkpCZ1hX?=
 =?utf-8?B?dTByQ0pQc3BIVGc3T3ZncVIydmdmNXpYd0k2enZXa0I0SjNxMVNPdFdqd1JL?=
 =?utf-8?B?QVZ0bjBhQ09lb1IvVmNYQlBwTzQvZk94alhlMDR6Znp6UzBOTU1tZDZVWkE3?=
 =?utf-8?B?N1lseHEyV3pCN3c5VUNxV1BTNk95VEsxNHRzam1iM3RXeHVvc0NDeW9Fa2k0?=
 =?utf-8?B?Q2hrRTExcEM2S2EzLzMwOGg5TjdjTTM0RU01RmhMazNoTStLT3RrcGJBNmRI?=
 =?utf-8?B?SEJNOHh0RzcySmhTY01aMEFZOWNqZmhMZnJpVktLRGtpOCtMbDM4elpKQ0NG?=
 =?utf-8?B?Y2ptUkZuaU5TRnd6czMrZmR5eDFiUElEZjNmUFFnVTM0cTdMaWFiMUpmWCtC?=
 =?utf-8?B?VDQ0SkdBOHZPTmdOT25jNzFCNzVsQ2czaXBIa2pxVk42VzN3ZWxJa2l4MSsz?=
 =?utf-8?B?cjMyTklSM2ZIMUZxVG5VdFYxQ2RPaUpaMDBxVG9BMWZvZnBmeExNenZZWVNr?=
 =?utf-8?B?dXBsTlVkb0s3dUJuYzQ1Q0xCS2N5NGdnWThSbDhJUTNOSmVOTFdDSXloOHZR?=
 =?utf-8?B?dDNTUm9tdFFySDdlUUxmUDdYQzFEVWw4Rit3UHVDMTQzVGpNbStLOHE2cStP?=
 =?utf-8?B?d3paWVNiTUJYNi9sTUtSSFllZlY4RWFFT1c5TWFsT3JWMGliKzIvbXZ6TUpP?=
 =?utf-8?B?SmIxY2pzT2dGMTBYcUdHMlVnMkp0b3hLTW55MDl0WWNqYy8zNFpxNU4yeVRv?=
 =?utf-8?B?VjR3WW0vblFkMlc2V3htUEdLN2F1WldVejBOQnRGQXM0M2NRRmwvQk5SWTV2?=
 =?utf-8?B?ZFpXcmNjZndWNWJhZEt5b05lc1J3OWFiZFYrN1B2bnFzQitDdHc1MytZRExw?=
 =?utf-8?B?SVQzSlJFNHFabXpPNS9QU1N4L2ZnN1Njc1IrVEkwZFExbFNSdFpQTHN4TjYy?=
 =?utf-8?B?RzdoTVVmK05qakNsL3l3WHVTOFJYWG5WS0xxeGloek1PcjR3d3FjQUpmS0Vj?=
 =?utf-8?B?S1ovZ2J1QlBuajhpckpWZFphN0tnUkFqN2NSa3I3RXY4bnUxeGRuc2tPZVJm?=
 =?utf-8?B?USsrNmFrVXBTWS9WN2QyclUxQnJVMjVDZm1LcjRpc0phQWQwZWlpcTVPelZz?=
 =?utf-8?B?cHVBL2lKeUlySFIycy9MWGVPVmpEL3NaZVFHRENKZ0xBemd6Y244SzJsUzd6?=
 =?utf-8?B?eVdVNjkweXI1MS9NMW8vWk50WmxiWlRWQ3lIdmdEQnJYSUJocEM2MXhNVzFY?=
 =?utf-8?B?WUxWSmhHZDBleDhiZkRaVWkyM3E1ZGNiZmk1eTA1eFhOWVZ6VXNQd1ZoN2pH?=
 =?utf-8?Q?wUuuqL/K37oPGY3trIuxe+oe2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1951ea8b-2405-4b65-f37a-08dd3054da24
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 02:25:16.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9osS53fDBj8KuOBsUPCzbDIjb9z3D2AD9NrzVT+n5yaeW3VPx1oWTkio7Qm2xI3UnN/Woc1T06lEPEWD3gu8Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8171


Hi Nicolas,

On 2025/1/9 3:34, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 07 janvier 2025 à 14:36 +0900, Ming Qian a écrit :
>> If colorspace changes, the client needs to renegotiate the pipeline,
>> otherwise the decoded frame may not be displayed correctly.
>>
>> If it can trigger an source change event, then client can switch to the
>> correct stream setting. And each frame can be displayed properly.
>>
>> So add colorspace as a trigger parameter for dynamic resolution change.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> index ef8e8cf31f90..49566569ad26 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> @@ -932,7 +932,9 @@ reflected by corresponding queries):
>>   
>>   * the minimum number of buffers needed for decoding,
>>   
>> -* bit-depth of the bitstream has been changed.
>> +* bit-depth of the bitstream has been changed,
>> +
>> +* colorspace of the bitstream has been changed.
> 
> Did you really mean colorspace in the way this term is used in V4L2 ? What we
> want this event to be used for is when the capture storage size or amount
> changes, perhaps you mean when the capture pixelformat changes ? This will
> indeed happen if you change the bit-depth, subsampling (not mentioned here
> either) or change the way colors are repsented (RGB, YCbCr, etc.).
> 

I am referring to the following attributes in v4l2_pix_fmt:
	__u32		colorspace;	/* enum v4l2_colorspace */
	__u32		ycbcr_enc;	/* enum v4l2_ycbcr_encoding */
	__u32		quantization;	/* enum v4l2_quantization */
	__u32		xfer_func;	/* enum v4l2_xfer_func */

For decoder, they are parsed from the sequence header.
Our issue is that when only these properties change in the middle of
some bitstream, but not the resolution or dpb amount, the decoder needs
to nofity the user.  As these properties are in v4l2_pix fmt, user need
to get/set them via VIDIOC_G_FMT/VIDIOC_S_FMT.
So in my opinion, it's reasonable to nitify user a source change event,
then user can call v4l_g_fmt() and renegotiate the pipeline.

Apart from this, all I can think of is that user call v4l_g_fmt() before
dequeueing each frame. But I don't think this is a good idea.

As these properties are parts of the v4l2_format, I think it's
reasonable to handle their changes via the dynamic source change flow.

We're currently facing some real cases on android.

Or do you have any good suggestions? Then I can give a try.

Thanks,
Ming

>>   
>>   Whenever that happens, the decoder must proceed as follows:
>>   
> 

