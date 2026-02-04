Return-Path: <linux-media+bounces-52167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKYcHo0og2kxigMAu9opvQ
	(envelope-from <linux-media+bounces-52167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:07:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97AE4EAE
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC96A3012BFD
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40893E9589;
	Wed,  4 Feb 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lSCw1K5M"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901D2F2905;
	Wed,  4 Feb 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203267; cv=fail; b=J7awtmKLmVd0fjzBd6llXJ/wZ5kWFDe++v2iLQZaWMK7O+EUeVtTvOjM5zUFwFNcKX5Ct5yVmeK0kEVlADpHqR60GT30Bntr5aWP04uglr5AsqHtwyj/mNaTFNOI+6wzbJZPBKzbAuLe3D9lIuKnl1pZd9iRUMDfQXJ2Mw3ETi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203267; c=relaxed/simple;
	bh=BvhGgGY75ZaXxX/eC0pnKd9byuPohDS+LYINlcZLPnk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=csL6iI70wgAYMjPR1FHUJowjT5qCZTIr9s1Eb9sSUreVGUlC4nkr2BbGPVRf4gxpuZmj5aSd3VDEGLGa5sOPi8sO7bjF0t/OVwYCRnCRUSB0tO4qofNSAhZUhqL3mk3XgmBD5m44IhFYok1SHb/lvKya3Q46En3Sa+XirITsVHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lSCw1K5M; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgdHFGMl+2TJ/24c1Hg8RE4KWyiYTpjFIgwL0A9+xJ+rYG3N1CMm/Az2OALZZK57ZMvGYa4ckthcwt3hshaK7HbQYiQ0jGO2fv0qtqdAqPzGEtOdL+HVkl/1GGkfM/5KyeVWlYr+Mbd0gi4TrrK0Ox9Oxq+z7bQJ5K3II0RvIZ4VS802DDtaqHBKvUjPhO/GUM3CTWVPy643m2GXe1hWzgE+zMB7r9/yjKI9U4XXgW3LmxzycwO9zA7FxqdKhp98G75xlkcdDsckrRwGCfeWsQcIXiIpB7RV+1ZbdFNZfi80eRRX/60AjOrfLY/1zpZGNElgX3UZQIs9f+MDDSRyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=;
 b=PAyzSJThKQUJbGyxf6QWXBVSRPzNnqidfis97QDWOlYRjETViKMPz2Wr1O15KZcxwfdiwzaPxahS8VwjZyB8HggQDDSRsLfaAxqZsEFNbHck8LHfMSym06w/f6zOMUTRNZmOxZ2ELg/RFyWzanCpUB08AxBJZHrPpi1UF9Dr2EZx+pvmpOsQ0NFtC1wWcscoa003ixlgrr2Siwy4RSBFkFNLNbu7LJcfEKghMTzAdz54gfvxal15FOIOeHP6of9uh/7jJRrB6EnLOH14Z1lN2NRcbOf8AgoxDa/bx9PsClEImho0nnHbhvIDghZmE8bANZFBLWk6vS0trWwZrQ2rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=;
 b=lSCw1K5MAIR7t83E9XuIOZuBmEAdliV97DFBGpSKoKzlDZS3bcOZyMhq8L9XN6BI2VRdL2b6TtXYbkoTXDr91yTN6taD1666y1KFDD221eucYW9WXg7PZ/FQHVsdHVx5lkcQo4BesSV39RBD6sqa4+g95qZhP8/TsHD1Bvq952zPpdVejaSOZGkTQBFM0zg/RIt0eEHuQpspMNNsaLOmX4lIQjZHYq4QNq0LmCYwiruNEUULtiQry6sR3GDENzqOii3s7X7CTYMNavvvErzNQI1qbCLZ/pjlwJ98OjfQv+ucZJp9zfLcpupJvzcFPOYxyZYWF57V2CeY83+xLFSsZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by GVXPR04MB10110.eurprd04.prod.outlook.com
 (2603:10a6:150:1b2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:07:43 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:07:43 +0000
Message-ID: <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com>
Date: Wed, 4 Feb 2026 12:07:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com> <aYIb8ZIZDfCJZEZ9@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYIb8ZIZDfCJZEZ9@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0156.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::23) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|GVXPR04MB10110:EE_
X-MS-Office365-Filtering-Correlation-Id: d8725d01-5668-48f9-1a8e-08de63dd9e61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QWVKd0c3WHJoWnNTaENoSlY5M3JpTDAyWk51bGVqa1AvbVdDWGp4MjZPTHBy?=
 =?utf-8?B?UitHWGlZK2FDRnIyTVVncDFHQWpyZllEelM4VG0zWGFrbnVnQWVWa0FkKzRG?=
 =?utf-8?B?YmRvMW9ZVmRoOW5vb3I4Mms4dDU3ZjdVWnRJUTFOUnJBQ3VWdHdMWklPcE1U?=
 =?utf-8?B?bzdPc1BEQW9pM0ZVMXhQOVJwbkxhc0xuQktvanc4SzZGelorMU9uYzVGMlVQ?=
 =?utf-8?B?WHFlYWZwRFhxVWExZmJ0MDFrOThURnBodkFTLzNaeDFqRkZNb1dRU1QwK0pX?=
 =?utf-8?B?Ui9CcktYWnJyaC9BUjdNS2FnTUVwSjU0OGUvaVovczhPN1VzanJWQmxDWTF3?=
 =?utf-8?B?MHZ4NCtWME5NMldNRjFXU2UwL3orSnVIRUc4bU1hY0piMVZsYXlHNmhxOFJT?=
 =?utf-8?B?eHRLbnh4R0hsUmd1c1RYSDd4WGYvTFNRRSsrdUFCUFJDbG4xWkt4eUY5S1Zn?=
 =?utf-8?B?ajZjWE9CdC9Jblg5eHc5RlFDcWdudDY5aThjdi9LZnE5bzVkaEpENjdZZzRm?=
 =?utf-8?B?MDJIbjRhU0J3eHF6aXNWT0RndCtlT1IxRUZSVWZ0d1EraDg1SDJ3dUw2TjEz?=
 =?utf-8?B?K0NHM2t2aUd2OXNHbW9kSk8wYzNaSUsvVXFTbHRncmhua21nZWM2WDdaMUx2?=
 =?utf-8?B?blZRajI5TkJmSDMvaTNodFI0WTcvSFYyVUNqMTJ4Z2NxNFFoS2t3TUlsOHFp?=
 =?utf-8?B?QWxZN1NvTFpsS0tVQThMRklMQ1RtT1BZLzdIZUxNQ1U3MlRra0dnZE9EaXMz?=
 =?utf-8?B?QkkrcHJwL28vdFVBemRENUxXWmZteEVicmxWL3lNNWVJZkNXVUZsUmgwT204?=
 =?utf-8?B?SFNzNU5CMFgzU1N1RFpkRHN2c2FBTnlVNWk3aHVrSTd1OXNkVjVKYmJTcklq?=
 =?utf-8?B?MHhDdFMrT0NNeTVvTHVBLzhBdmViMjFaQkJ6L21hRVFNU2hEdHliYldaanhR?=
 =?utf-8?B?czdQYkVvNmEwSURrczBvVEo3MUpDZkN6REwxTnl4Q1A1WUEvRDc3c24zRzBs?=
 =?utf-8?B?cHZmc3ZGbFUwRWF1MzhxSFlSU1E2WGZ4cUZwZ1RvV2lobUs3SXZ1TEpKUVJI?=
 =?utf-8?B?eHNzT20rdmFBZHlzK2pEYnpzbHF1eDRnbU5OcDNEazA5RkpteERNVGlGcVA0?=
 =?utf-8?B?bmdETjBBNWFGWjZ0dVZHNXZaS2pPRW11VE9CRXBXYWdSbXhKKzQ4QUFrRXhT?=
 =?utf-8?B?encyTUxYcHVadEpBVmprME9PZlZsZ1Q3VHRRa2czQzJwMWx1RVVUb05TOFhV?=
 =?utf-8?B?RFpuVjhGL0lUVUIwK2pDbnFraFYzbThoNGJ4cE9NSkZsNkk1OTBjSWE1LzlY?=
 =?utf-8?B?ellnWDF1aytTSjh2ZGIwRHlxMzlybVJrUmdYNHdxOU14SG13R21kbElXV3Vv?=
 =?utf-8?B?RHRJM3NBUHBWU3dvSmNPcE5jQk1QSWtlYWFVS3RDWnNaZ09JWGc3Mi9oakpB?=
 =?utf-8?B?OVg1clNhZEpDdTFGeEtOUWVZTGFjZGlENFVJdGxXaFZJRk82V1VIZ2VEMkdu?=
 =?utf-8?B?bDcvbzluZCs1VitqZllVdUQrQk1qWFhldCttQ1JueHRoRDc0MTM4aWZkVnhr?=
 =?utf-8?B?MHlIVkNwVHdEcGFVVE1Ma21hODAwbmhYMVlNaGtWSHNjSVdtdnNmOHh0UHJw?=
 =?utf-8?B?d1A1ajBTN0NWczVobFpPL0w1QVpSbFlzREpPdzE3QTF2UHpUeFhhUTlwN0VV?=
 =?utf-8?B?ZWNJL0piMFp1VEdmcE5LMHlZek5ZYUxxT3VUVy8wTWZ1Z3BvZzlRaFAvZW5x?=
 =?utf-8?B?OWpWMjBSclJzYlBzOVB0eURzMnBoNTA4bW1kTldZQXZFUDltZHBiWC9ubkV3?=
 =?utf-8?B?bC83VlVZTjBHa29rQllnWDd3VXYxc0ZmTWdvcDRhZ0hNRjcxQzZSMzF2SC8r?=
 =?utf-8?B?M3Z4Z1FiV2lrZjU0VjJFWVJ3c0F1dWxOeVBSaEdOcHAvc01WajZXWkdoOUVw?=
 =?utf-8?B?RXRrR3p6YjJ4cjZKNWxGN3gzTmI0U0pkajlaTEVydkNZQ09SZ1hmV2x3MXNH?=
 =?utf-8?B?QmV0RDloQW5tWXVhZjdVZVlRemYxeFE1YlFzOExGVlJ1WnhXQ0M5MlpyV3BQ?=
 =?utf-8?B?TndtQ2ZsZElnQW5TQUpXMUkySW9qSFV4c2kzdEYwNGZCd3hibUJLbmxKc0xY?=
 =?utf-8?Q?Bz2Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y0xUMGNPOHlEUzlKYVREWUc4YTNUbzdCaHJMdStHSWphNGlYcW1DOFVYaHpp?=
 =?utf-8?B?ckJHYTNGR2FSRmx6azFUampNYmU3YXp0d3luakVrR0FmcHVEbVhMdFZVMEVr?=
 =?utf-8?B?OFo5cHdWRXpHZGdIOXp4OEtrWG5nekhtaGE3VHNpSjBVdURtZW5yVHYxbzZl?=
 =?utf-8?B?M2RDWndEMHZjaWVGdUhxN3ppUHVaZytDZTRZbjRseUVIN2lUWVRnMGwrUnRo?=
 =?utf-8?B?UTFXeDd5TU9wTlMxZmZlQWRIcG1EZzJSLzJyM2syZG5BTm1DQmIySVNpMHFi?=
 =?utf-8?B?ajhab2M2S051UU9pRGdiOEZ0UlI5WllwVDZwZXB3a3pEbCt4SDdsRGxyZ29O?=
 =?utf-8?B?bWhVSk54akovVXVudlAxb05rNEhKYlMyTENNbElTZlFjRTJzUTdHM0x1VjFX?=
 =?utf-8?B?R2YvM2J1dHVOUlZZZ3o2SG1ERkVDSHJRVjdJeGJOSmpTb1BXS094cERVZURq?=
 =?utf-8?B?NDlCR2dGQkhIN2ZhZHpQc1FsVlgva2JwVTVPaE4vNFBnZkdKUUpDUGVyT2dw?=
 =?utf-8?B?Wlhjd2hISitIU29NOHhRa2sxOWliOHF1Z00rRWRvMEJyZnArcDdVeGxyVzdX?=
 =?utf-8?B?ZkRLWC80YTVrRmpqcFB6cFFaMXVHVy9RTWU5MVJEdkpEdVhNR2lvbTlQRFRx?=
 =?utf-8?B?a3ZsRk5vMmpabVhpRitPTjRZeUlRU3BlTjI4eTQ5RlhFSGM2RnJkV2U1a0ZN?=
 =?utf-8?B?YjRBaExBWElMUyswN3hzcTY4QXlRcGU1RXdQbVVMNzJ2YVI2Rkd2NTRKZFdT?=
 =?utf-8?B?WExiQkcvKzRZQnU4b2FGSlIwYTQ4Vi9IS0tkbFFpS0FIcDYxS0xWMUQ4K1Rr?=
 =?utf-8?B?M05pUmhvdWVvd3dmdEljZVJ4eS9rTUdhbHpSK3dzNThYZE9OWWdEaW9kTWdi?=
 =?utf-8?B?SDE1RFc5NysrTTV2R1hpbFlPWjhPbll1Nm1PcXRraERSejI5N0JCWTBWOHpS?=
 =?utf-8?B?VE5ranR5RndRREVXamlQVnM4UzVpc0NyWjBuM3pjdXQrYmNOU0pGWlptYjNq?=
 =?utf-8?B?ajcrc1BQRlpYNXpMQUtmcnE0eDV3OEtOOTJsL21ENnMveWpaVjZMQlRsQXBH?=
 =?utf-8?B?Um1yWHpadVZLaU5vMnhJeW9JMnh2Y05CT0M0ak9iK1lZb2xPQmY0Mjc5QUhs?=
 =?utf-8?B?MGVrTm5kdkFXRm1ETkxwMyt0dVBGdzE4RkduZVB5RUhlMERvamRCQjRLcTdw?=
 =?utf-8?B?d1RPVldBT0ZZNmttQXBVaDdsN2lrWk43RWVrYm42VWFFZ2l2OVFoeEg3K01p?=
 =?utf-8?B?S2N3Y1ZSRHY4d01BZ3hpUXpUWTVRMXV2NEhPdFF2QzJzM0cycHVYQVpPQ3Vk?=
 =?utf-8?B?NEZndGl0TlZ6N0FpMkVTd2xGY3N0TmJvZUMrYkFibjR1Vyt4V1dkajJuSi9i?=
 =?utf-8?B?bDkyWEoyZUFCV2ovaUs5dlJ1UXRkdzZ0cEkyOGtHWUlnVDd6VHduT2MwNjJt?=
 =?utf-8?B?K2U3dzlZUy9QenlBRmpCRnpjb1l5SGJWRDJwRGRFdkVFeWl1Q3BTc29mZkR4?=
 =?utf-8?B?VTYyNE5CRHZzdi84MC84ZkJtaFhxbFNNQ1VqcnNCYnQ5MCtSYlNXVS9nQlhh?=
 =?utf-8?B?c0d2dnhZYlZEYndGSE9iZ2NXSmN4UXdYM1o3Q3FpUHF6SmF6ZWRaZVhhc29I?=
 =?utf-8?B?dmlXbEtEaTY0bmhXOFZMVGkvakEyM21QMFFURUN5SEVGZWRpQnBUajZJY2lP?=
 =?utf-8?B?ZzB2dzZYOENwaHFlbEJwYUZtME5hTDJzZVZvZVZlVGJOR0lNSTJ0MUVGRjRR?=
 =?utf-8?B?QVRxbG14V3R1LzFpalhMYndIeG9GaUI2UjJ4U21uQjNoN25yWVZoSkxoUFdq?=
 =?utf-8?B?b3FRbjFBWFFrODBmT1VZQ2NIeWh4emJqaG1GNmtza2M0K3k4ZXViUmVOdmhJ?=
 =?utf-8?B?VmZQZmhRWG5mZHJsMmJ3ZjFIVkthcDZ3K084L2lDQXhGSjNGZ2NaQk9KYjhB?=
 =?utf-8?B?enNkMFJySWdVSzVLQVBpMGVJNHNXajlYdStLTVpxTlFoditvcWFLSjlKYjRy?=
 =?utf-8?B?MWJBRFk4dm95bGdIeWVjNGUyYUxPTi8wblN0OVB2S3hGVjE0Ui9Hb1FqSEph?=
 =?utf-8?B?ZmtIWkVlT0cyZ3Q0bWR2eWk3ajFKRjhUYUp4WnZBU2s2U05SOVZSdnN5ZHNk?=
 =?utf-8?B?THNIcVJreCtmRjFtUktGdHo0UlcwTW5MTENKejREN0hsUVNxdEdHdjd1akZU?=
 =?utf-8?B?b3lsZGF6a2FuZ0Q2NzhDWHhlN0tQSFJzY2VmSG1RWWZlNDFkb0d1M3EzVUVq?=
 =?utf-8?B?Z1AyTUl1Z2U4dGkrcFdoMjFuYUsvU1JyV2x4ejZwaG1tUjRSbmplVVU0N3pF?=
 =?utf-8?B?MENHVGIvQWNBL3grdW5TK0pKRkxBQkRnTy9seHBlTExsclhHOGpEdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8725d01-5668-48f9-1a8e-08de63dd9e61
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:07:43.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvgbVuNr87evGfjr3cCjvEh3zK0FkrC4UrLuL/y4hkVbmiXTnb+UiqP0SIrCGHVCYRozz79MmEXUsYvnCD5MHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52167-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: DF97AE4EAE
X-Rspamd-Action: no action

Hi Jacopo

On 2/3/26 5:15 PM, Jacopo Mondi wrote:
> 
> 
> Hi Antoine
>    thanks a lot for extendable stats
> 
> On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
>> Extend the v4l2-isp extensible format introduced for isp parameters buffer
>> to the statistics buffer as well.
>>
>> Like for ISP configuration purpose, that will help supporting various ISP
>> hardware versions reporting different statistics data with less impact on
>> userspace.
>>
>> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
>> definitions, with similar header, versions and flags. V0 and V1 versions
> 
> Why do you need two flags ?
> 
> Params had to introduce two because we had two drivers already
> mainlined using the pre-v4l2-isp version of extensible params which
> had defined their version identifier as 1 and 0 and we didn't want to
> break existing userspace using those identifiers. So we had to accept
> both V0 and V1 as "first version of the v4l2-isp extensible parameters
> format".
> 
> For stats we don't have users, so I guess we can start with V1 == 0 ?

I wanted to keep it aligned with params, so that any driver/userspace 
can use the same API version value for both params and stats buffers, 
and limit headache.

> 
>> are provided to match with params versions. On the other side, ENABLE and
>> DISABLE flags are not really meaningfull for statistics purpose. So VALID
>> and INVALID flags are introduced. Purpose is to force ISP driver to
>> validate a statistics buffer, before it is consumed by userspace.
> 
> Interesting. What do you mean with "validate a statistics buffer" ?
> And if a driver has to do validation, why would it send upstream a
> non-validated buffer ?

Like for version, I wanted to keep same header structure, including 
flags. Since ENABLE/DISABLE is not relevant for statistics, I thought 
about using a "validation" flag, to force driver confirming statistics 
blocks are valid or not.

If you feel it is useless, I'm fine with removing it. Should I keep a 
flag field anyway to stay aligned with params then ?

> 
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
>> index 779168f9058e..ed1279b86694 100644
>> --- a/include/uapi/linux/media/v4l2-isp.h
>> +++ b/include/uapi/linux/media/v4l2-isp.h
>> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>>        __u8 data[] __counted_by(data_size);
>>   };
>>
>> +/**
>> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
>> + *
>> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
>> + *                          (for compatibility)
>> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
>> + *
>> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
>> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
>> + * format.
>> + *
>> + * Future revisions of the V4L2 ISP statistics format should start from the
>> + * value of 2.
>> + */
>> +enum v4l2_isp_stats_version {
>> +     V4L2_ISP_STATS_VERSION_V0 = 0,
>> +     V4L2_ISP_STATS_VERSION_V1,
> 
> As suggested I would make V1 == 0
> 
>> +};
>> +
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
>> +
>> +/*
>> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
>> + *
>> + * Driver-specific flags should be defined as:
>> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
>> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
>> + */
>> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> 
> Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
> could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS
> 
> Or do you think it is worth creating a new symbol ?

To limit impact on potential on-going development, and future conflict, 
creating new symbol may be safer IMO. But I'm fine with using a single 
symbol if you prefer. Most probably this flag customization is not used 
yet by any driver.

> 
>> +
>> +/**
>> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
>> + * @type: The statistics block type (driver-specific)
>> + * @flags: A bitmask of block flags (driver-specific)
>> + * @size: Size (in bytes) of the statistics block, including this header
>> + *
>> + * This structure represents the common part of all the ISP statistics blocks.
>> + * Each statistics block shall embed an instance of this structure type as its
>> + * first member, followed by the block-specific statistics data.
>> + *
>> + * The @type field is an ISP driver-specific value that identifies the block
>> + * type. The @size field specifies the size of the parameters block.
>> + *
>> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
>> + * driver-specific flags specified by the driver header.
>> + */
>> +struct v4l2_isp_stats_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +} __attribute__((aligned(8)));
>> +
> 
> This is currently identical to v4l2_isp_params_block_header.
> 
> Can we create a single header for both stats and params and provide a
> 
> #define v4l2_isp_params_block_header v4l2_isp_block_header
> 
> for maintaining compatibility with existing users ?
> 
> Or do you expect stats and params to eventually need different headers ?
> 

Current approach is to use same structure definitions as for params. So 
I'm fine with creating a single header as suggested, and provide symbols 
to keep compatibility.

>> +/**
>> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
>> + * @version: The statistics buffer version (driver-specific)
>> + * @data_size: The statistics data effective size, excluding this header
>> + * @data: The statistics data
>> + *
>> + * This structure contains the statistics information of the ISP hardware,
>> + * serialized for userspace into a data buffer. Each statistics block is
>> + * represented by a block-specific structure which contains a
>> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
>> + * populates the @data buffer with statistics information of the ISP blocks it
>> + * intends to share to userspace. As a consequence, the data buffer effective
>> + * size changes according to the number of ISP blocks that driver intends to
>> + * provide and is set by the driver in the @data_size field.
>> + *
>> + * The statistics buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Driver shall populate the @version field to
>> + * inform the userpsace about the version it intends to use. The userspace will
>> + * parse and handle the @data buffer according to the data layout specific to
>> + * the indicated version.
>> + *
>> + * For each ISP block that driver wants to report, a block-specific structure
>> + * is appended to the @data buffer, one after the other without gaps in
>> + * between. Driver shall populate the @data_size field with the effective
>> + * size, in bytes, of the @data buffer.
>> + */
>> +struct v4l2_isp_stats_buffer {
>> +     __u32 version;
>> +     __u32 data_size;
>> +     __u8 data[] __counted_by(data_size);
>> +};
>> +
> 
> Same question. Should we introduce a struct v4l2_isp_buffer ?

Yes, sounds reasonable.

BR
Antoine

> 
> Thanks!
> 
>>   #endif /* _UAPI_V4L2_ISP_H_ */
>> --
>> 2.52.0
>>
>>


