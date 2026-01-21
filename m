Return-Path: <linux-media+bounces-51286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPSEEVD/cGmgbAAAu9opvQ
	(envelope-from <linux-media+bounces-51286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 17:31:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E721259EAC
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 17:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DEED74AAF3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426AD36C0C1;
	Wed, 21 Jan 2026 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MvXF/nis"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF94374173
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010576; cv=fail; b=I6b7V/1M/9bn+YY7Gzr+WRsn1xR23UGAUwJhfJE1grtHyvvoSxReL6ETwpVV9F3tKkhXEh3/wwMJhTEt+2KPp9MCqdArbC7q75Ihs2fw2IcWRtrsEDKE76a3a72XK81xpdgDmJzGzZRxF399elHGeC7RlVtxu0V9I1zxGTCbo/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010576; c=relaxed/simple;
	bh=zPSqWlITbYd9oc1JFB4J2oao2Qv8PSYllK2u+MyUvqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fjsrdTX+Ze35Ew2TlCZ09YiBgA9QemTXY7SXoWlz+cs46+NJKQdAN2XkkdkYjaMXMMijGIN8kyytlFVWvRgXeIOWlnPPZmH5cCuoTfiMl5Q2225kLJxSKW9Kq7sDUe6u0lfSUlTFSFg720agfqYMk2w6YC02Vcfz6Uu38rLCnCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MvXF/nis; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlyRL/YJ0vYmuv7S8reValh/cZ21VtxJNIX6ekWKV0lAozX4Sg/7mG124/orqWMs6LRkP7HM73qwMtFxGC9dli5F8Z/VnyfVgQT2uKCQZXGYtziQi7cVJci5quO/Sqa3pNaZ1HMbaZ2oJ/Dfm0CO608LbXrCDrLZTrNHUHoOplU8sTiec+dLhaeAwug2qfAA6SfbBdZX8CatEVmRmR7HTUV1ZpQhmnEi7/TIFobYNI6YtLwxGu4Im2al+9NfgdY8mIjquqxgcEOQJ/QUVCc/+gHK1BtU+tcu9Mtb6mcxw0XuePULtvmHxcuFKAHmt9pHtoapCQOSxYoiXpecdQ7qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxxCFUOv4YnwnhdXnKZqzCrTJF08ytgXZqlXOHGrEd0=;
 b=zCH2sJ5DsxdvpKPUWcGf2awgiQ3KxngrWRFfw42/AcIByIKj0ybn2qngOL0edE/DSsCtG/2DbrmZSe31LZXr2dhctxagSezZweURHL1e6U0kurOpjiisdf/uGupG3k9fNKaw9XUyzJP0hswMwuiy/ZjKCz7MTxumFyoXm1ds3pWvX94RaP2hU9kdHHUSP8JfF8vZ3GrjObSEPtDVVgXRPxV+VYcT/eCxW+Wt6GzzFp39HOz0Be/P6NXFTOM7FU2J6h5aMZTlHOnvOLqSI21CdnxezeTVR/Hx+iNjouKcng3F8/Y/c76bdaokLfvvO0KwsTkBNgwcFFNizb59qBclHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxxCFUOv4YnwnhdXnKZqzCrTJF08ytgXZqlXOHGrEd0=;
 b=MvXF/nis9G5jmsRLhYWLO8lwIdaY2NKU5G70gijp4CE0v7vxRYStqQV07Gxs4SmZiPmurvO0p1k8p8bPQ2K6tOuZRWE/9GJTprXiGz4eJDrMYjuT/zSv8kErryflzXDN5Snh8mGrUK8M/5X0v5coca7ADzcKsqyxYXEO+orXAChBOe9ti6lWSc/ecJDmvYbuQPwovCvB55sSyDf+lgX5B/1ShYQvzjPkvtPSCNdJXaW5J040B61HShqlBF6uSp4mLHdRyorpNhS5pYuhtbA8RQvSVjGB0VV+1G+C8QX3j/fulJV6RGnmYQfCZ2Hd0kogSa/c+/GhLduQC6YTe4Ievw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 21 Jan
 2026 15:49:29 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 15:49:29 +0000
Date: Wed, 21 Jan 2026 10:49:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rui Wang <rui.wang@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.20] NXP media drivers changes
Message-ID: <aXD1fwV/l3dz1jlf@lizhi-Precision-Tower-5810>
References: <20260121031423.GB409142@killaraus>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121031423.GB409142@killaraus>
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d1c278-a75a-41eb-e547-08de5904a938
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cVZkMGVROXhkNk9VNU5IZ29nQWNqV2tEeENsRTc2MHpQcnNYKzV1SlRYWENC?=
 =?utf-8?B?RHJjZVFpVSsyano3U1BtSlYvNmkxRzM4S0N2bTdrVVFFZmNoMHhXSkFJU0JZ?=
 =?utf-8?B?TXV3ZGd5ZWs2TTUvRzE4ekRXZXZnNno1cGJSOEs4N1NJQ1QvZS80d2hhY05N?=
 =?utf-8?B?VkNWUkJHSWRCNzY1U3p3VXJUcUdGQ09KY2tvV0tPcHNscWpxMHlFaEQ4Y3Vs?=
 =?utf-8?B?bTJGY2pVQzFBUGhTYXovZUJvYmRUVlZQdE9jYWlnQkpqYUwwNDE2TFcrczNW?=
 =?utf-8?B?emVrS0ZoWkZZbDhwMHZDSkg3RTlEbVRFaVhWR25CaVJMV0paNmNEZUpzMHQ4?=
 =?utf-8?B?ajdlZU9pb1F0STFCVThxMVR3bTJNRW9EM2JvMHZxd0RYTXV3SllPTW12aGtP?=
 =?utf-8?B?WHZORDdXUFdkSXBoZXJjczNMS0hxblhmQzR0Z1cxTjh0Y0FMR0c3S2pJY0R0?=
 =?utf-8?B?MndtT0F6SUVTL1hxL1NxMEdLWU5EUGI3TjNqMHFpVUJzTDBuQmFTQzh1TVZl?=
 =?utf-8?B?T1VJdEZwNldZNXR3OVhXMUpyQ0VCSDB2UWw5UlJYV0ZFeE01cDJmaCtwRDBX?=
 =?utf-8?B?cXppMXByZ2M3MS9jdU9DaUE5TW82S3ZOYnliaEJ1RUZHWjJ2b1c2em9UcTdn?=
 =?utf-8?B?b3BaUjlPY1BVeE9IYUdMSE51UmxYaEdzWXZJTnlqdndhV2RlM2wxbzZkdENT?=
 =?utf-8?B?STlIRVpFQWpRUnAxRUw2NmE2NnFoR1hHR0JtYjdrZVdzRFFqeVlFVHp3ejcr?=
 =?utf-8?B?cVBOL1prZDhyQTFwWThWQnhSc3NOcVRnQm5pUVI3VUQ4cnpPajVEU2g5NEJ0?=
 =?utf-8?B?OUZORUVSL0d0MmVCNVVJU0dZeVJibmRXTU8wR0x5Z2JvbDJLZlVLWlJyTWth?=
 =?utf-8?B?eDNKWXZENFF2NExPV1ZhUkNKRFN3MGw5ajluZXcwNWw2eEJDRzliRDA4ZjBT?=
 =?utf-8?B?clhPZThUQ0U4Y0JyWG52dEJUbTV2NHBEejdsTWR5c1VQU2Z5bDg3aXRmc0pT?=
 =?utf-8?B?c2w2cEs0MEdRZzNmT2d6QlFDT29iaFRnbExnQ3lXL2R1NkdBUnozMEY3bkdU?=
 =?utf-8?B?dkVuZTh2RHIzNFNJNmk5VW00enNnOTgwZlMyckdyd0VqUENDNnVzMU8xL0ww?=
 =?utf-8?B?VDl5UVVHQmdOZjR4VnREZml1cTBuazFYUkJCK1F3NldHbjZrckQ1M3VsSnV3?=
 =?utf-8?B?ZXdjMHNjRDNUSHpNYk5ncmFSK0YvLzNDNXFtV1RrSGhRVFlTNkxSUXB3OUFX?=
 =?utf-8?B?c0xaVmpEakxzRzdSbEIwMmd0WllIdnZpa0phcGhhWEc1UXFFQVdFNHZKd1dL?=
 =?utf-8?B?a0xlQUQ0Zk8vSUFGSmRiT1VRYlc4TndQQWFIVmhnNnlqeld4VlY1ekhOKytL?=
 =?utf-8?B?SHZsR0FDSjNYNFgzTGFhMnE5Rkl4alBXd3BETFlVZkZXamM3S1pKaGNFYUZ5?=
 =?utf-8?B?US9TcTF5MkZHakZPT0JOQmozRy9jdVR6UHR4VEZjT0hhUkxRdTZvWjdBT3o3?=
 =?utf-8?B?ZmdxdDlrSWxrdWk4OE9OekEyWWNMK2pUZERpRGRwN0VpRnpaeTBUVWJQTWsz?=
 =?utf-8?B?WjF5QzhwYkxJcVAxcGZzcHBLUTJUMU5pVHRGaHhsNW15dnpMSjU1YllvTU9Q?=
 =?utf-8?B?dGd2MDVaYnUwL0tKVUczeTVzUXF6ckRZOXQxOExBaHUyZklyZEJDS0dOWXhR?=
 =?utf-8?B?Myszb1d0R3poSFZBQk1GbkxZMXlmek1UNjYrZlgwUU5VdmVuZXZaMzUzemw5?=
 =?utf-8?B?Y1VIMjJHd0NjaW50ZHkxb09OYWVTZjFKN0QxUGJPekVZZ3hCUVNhMXh1ZjJZ?=
 =?utf-8?B?UC9oellxa29pSWpoNHhTRFJ4dG1PczVlT2hpR2M3SllSbjFRWGd3WjBVbzNz?=
 =?utf-8?B?TmVnSFBtdkhmcDNNS0VFTDZudDl5WnE4V0N3SWE1V09FbUY3WXVYbVVxaHVm?=
 =?utf-8?B?Z3hlNUU5UmhLaldSS3dpMmp3eWxVK3Y2eWEyaWozRjVoYXlncDJuNDhaSnJY?=
 =?utf-8?B?c3BGWklLT2hvNm9rZEhGeUZBYkIvd2E2cFZRVzE4a1JXVEFBcUtSVUYrSWJR?=
 =?utf-8?B?Q0c2VHFPREpjc0JaRys2ZmdmR01iSGxnZVNiajZtTGZrMEVVSjBUZGlyV1lu?=
 =?utf-8?Q?qWMFSTAS8Uj0RQL3WQpbKkVdm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NklpdTg0a2VMVnlHa2swVkdGRkgvdjU1OGxmWjUvS2t2QXgyQnBIUjRzM0p6?=
 =?utf-8?B?SDdaaTAzd3lSeDdNV0tkdmNwNjFZUHZ0TWszMUJ4QUxzdkZ1OFVWejZ5WVNv?=
 =?utf-8?B?M2tacDNqejdrNzZPWnJEZ21IQXdhV3R6RTZ3eS9EVW1TNDdEQk1obXFmc0FM?=
 =?utf-8?B?SHFNSE1QN01BcyttUUJ4b01GZFlDOHNocnQ5eU52RWFMYlErR3VOeXF0VW01?=
 =?utf-8?B?SUxaVGw0NXhZeFJRWFhRZGtXNFFKWElFSjFoL3Z5WTdFeVpuOEZyUG85UFRz?=
 =?utf-8?B?UjkveHNnTUl2M0VHNXFZcGtEb1JIMXRrQU05QVFIcE9lK0hQQzN4eGJTYU5E?=
 =?utf-8?B?dkVMdTRXWVAzak5MckZRUGVuTGZhclFDMUViM1FiMWpDYzYxbGo5UWNOYW1H?=
 =?utf-8?B?M3lOeWxReWttdTU5aWUycnBIWSs0d1ZCdkQ1TDU2bWpXVmNNTmwvbHBvQmNX?=
 =?utf-8?B?bHE2RzZVam1DWTRNTEdlVmhVVkpBZk1nUS9CR01SeEUwK3dta2psWWZKWUJY?=
 =?utf-8?B?YTdMWGNsS2RKdG9IVE4wZ29lbm0rWTU2eWUyYU80YkN2ZFBGUnFHRkt6YWto?=
 =?utf-8?B?Y1E4cWVYOSthb29ab0tiK0dQcWVWYzN1VTdFSjBmcGMvVG9CMGk2cW9QRGcz?=
 =?utf-8?B?RDFiYlRLVjdlcTVHOFNKc1ZzcEEwN3ZMcWN1RGNjdVBFUzdpVERlQjVEaTdM?=
 =?utf-8?B?cXo2V1NnM2xrMWdPaTYwcXpzc0hyTEtmVFhiU2JpVnEvSnFKNlRNL3d4d1Bw?=
 =?utf-8?B?amwwRG9JWEFwaGs1M2YvMnl5MDRkUUVWeGFtdFd6QUluRGU3QVByYzEvakcy?=
 =?utf-8?B?QmVlVFp1UGhURnUrNXh0K0xONGE3S2dhZElJcnFSQW84MEU2RFNHSThoWWZr?=
 =?utf-8?B?cUlyVXpCSEphTXhVUDFMWWlQZWhkVkZBZjVwcnhNbnZiR2lzajd1THYxL3RR?=
 =?utf-8?B?eWJSdVJhTDNYK2FZaENxT1JZZmtLV1E4dEZERzRKSjdxMmZlVzhyUVViWmRS?=
 =?utf-8?B?bXlNak9USkU4TmFxZVY1ODNDQnE0dkdaY08zRXF2dE1qTDJjU1NDa2FVTVRu?=
 =?utf-8?B?TmlPZGVZand0b0hsV05LNU8wNEZnNWd5WFVoYjRROUhDenhhQTBmMzhPQ1BN?=
 =?utf-8?B?K3c0bWxzM1lhK0JUa0Y4TW1Qc1FrV292aUgyQm8vWWo1Y25tSWFJMkQ2UXlv?=
 =?utf-8?B?cDlCUm1vSEJIOFhsOXY1UnFUQjdBUmJqNVkzc01NV3RnVDlZbTgrc2dtbExJ?=
 =?utf-8?B?eUVsR1g1Zkw3K0s2NnlCaUZPYy9abGxQZFc1aU5vWUQ0cjlZMTlVYk1KRzhL?=
 =?utf-8?B?b3JTclI5UWxoK3UxK2pMNXFtdUx5OHVLYTBmU1NQdXM4VVRkSEMxZ0FlR1Nq?=
 =?utf-8?B?M2RaTEVETE5Ueks2SldGU0ZKT3BiL1ErRWwzRlVuS0JraUQ1NVQ1NnRQUFFz?=
 =?utf-8?B?YXlkZUJUS08xbGJnM3pZQ3RITW1PK09EOWJMQVhaQnJlS1VPWThPMktDRXRt?=
 =?utf-8?B?cnNxYlh2YlJGejdTaTRpVXo2SU0xeXMwdFJKTS9GMThWSnhYVnJEUTQ0RXdJ?=
 =?utf-8?B?UCt3RWZxdVcvYVRxNWdMcFJKMGY0aXJRaFRJRGJzKzlHeGR0a091V0xJR3Vs?=
 =?utf-8?B?ZmxYWU5WT3NlelZ6SGJvQWJVWDllZUVUcHZtS1BIUERXbzcyWTJUVWNBZXQr?=
 =?utf-8?B?ZmVqdVIrM3BRdHljOWlIMkxZT2dKbU1xSkNSdmNnb2hqSkhpTlB3V1VzTlh3?=
 =?utf-8?B?a3gzMzAzZEovMlA0V291U1BITkNjdjQyUnNNbHBnNUxZR0RjRW82OGdoVDhn?=
 =?utf-8?B?ODYrZ0YrWU5CbTRoNzlUMUZnVzdDN01pakFtbUNDQ1YrYzJnbGlUWHcvbVZk?=
 =?utf-8?B?bnJ2UDhMVW5WZEVWbjNYdGxMajZSWlVWaHc1TlYxWERFcU1aNlRWWFM0Tkwv?=
 =?utf-8?B?eEdXZnN2bWtVTkc5Rk9oSnZYWHMvUE1CUU54VmtHYnBCUS9EUlhRVDBvM3JM?=
 =?utf-8?B?ajhWbllqV1pCamxncWZlanpETnRmOTdVMHdpVGYwQ0d6VlJrNks3KzRQVWwx?=
 =?utf-8?B?NWVxN21WMFdLSFVncjVzQzJ0M2pOZzZmMkl0TzV4TzF3MlQ5Y1VnamJNYVpr?=
 =?utf-8?B?VzhBV1ZIZDZudExVUC9ZOFViY2RCTDhmQXNVNXNvMWFQbmpUS1NSRDdLSGw2?=
 =?utf-8?B?SXR4OG9kZjhrdHdUS1Y0RGkyUUNCZlltaFROQjhoRjJ3U0JkNGVWOHRFRmNy?=
 =?utf-8?B?ZCszbXFmVFFOdHlFdVRWbkVRb1FOVWdOOXBSc3BXQm00OUlwTk9QQ01WQUpP?=
 =?utf-8?B?SUdqNkF6RmFIOU5aVGQrcDBVZkZuZVdMSXJXUUpVcndMcVJJcU1IQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d1c278-a75a-41eb-e547-08de5904a938
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:49:28.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBYA5BOeNnwKG1HPlvRwtEREuynnVXrXE3w69P6XPgUYp3pnAqyzfwlJHCPoqKM30yO2ueGNovN9zN1hOKgHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51286-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,i.mx:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: E721259EAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 05:14:23AM +0200, Laurent Pinchart wrote:
> Hi Hans, Mauro,
>
> The following changes since commit dde659d37036c6edf5eeef81274b43fe12dfad53:
>
>   media: iris: Introduce vpu ops for vpu4 with necessary hooks (2026-01-20 16:22:24 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260120
>
> for you to fetch changes up to a26a438dc814fdffb6f53add5296dde3f4d3b3a6:
>
>   media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code (2026-01-21 04:16:50 +0200)
>
> ----------------------------------------------------------------
> Improvements to NXP media drivers:
>
> - Fix filter configuration in rkisp1
> - Discard pm_runtime_put() return value
> - Simplify code in various drivers
>
> ----------------------------------------------------------------
> Frank Li (6):
>       media: nxp: use dev_err_probe() to simplify code
>       media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
>       media: nxp: use cleanup __free(fwnode_handle) simplify code
>       media: staging: media: imx6-mipi-csi2: replace spaces with tabs for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
>
> Laurent Pinchart (1):
>       media: imx8-isi: Drop unneeded module alias

Laurent:

Thank you for taking care of the i.MX patches.

Could you please give us some time to fix the small issues you pointed out?
Otherwise, this series may be pushed back to the next release cycle
(another three months).

It also looks like Guoniu’s patches may have been missed:
https://lore.kernel.org/imx/20251205-csi2_imx8ulp-v10-3-190cdadb20a3@nxp.com/

I have a few ideas that might help improve the process going forward:
  - Pick up patches on a regular schedule (for example, once per month), so
    contributors know if they missed a review cycle and can resend their
    patches accordingly.

  - Have a clearer communication channel for important messages, such as
    patches that have not received review for over one month.

Thanks again for your work, and I’m happy to discuss this further.

Frank

>
> Rafael J. Wysocki (1):
>       media: rkisp1: Discard pm_runtime_put() return value
>
> Rui Wang (1):
>       media: rkisp1: Fix filter mode register configuration
>
>  drivers/media/platform/nxp/imx-mipi-csis.c         |  31 ++----
>  drivers/media/platform/nxp/imx7-media-csi.c        |  14 +--
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  17 ++--
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  58 +++++------
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |   5 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c |   6 --
>  drivers/staging/media/imx/imx6-mipi-csi2.c         | 106 ++++++++++-----------
>  7 files changed, 94 insertions(+), 143 deletions(-)
>
>
> --
> Regards,
>
> Laurent Pinchart

