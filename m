Return-Path: <linux-media+bounces-52189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLo2CwZSg2mJlQMAu9opvQ
	(envelope-from <linux-media+bounces-52189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:04:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACDE6D4A
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FC7E300826B
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2A821FF4C;
	Wed,  4 Feb 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EK/xDEJF"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76825286430;
	Wed,  4 Feb 2026 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213887; cv=fail; b=Y09RPB0xFXPR8uOkfK9J9kMRUFIIBGXDrKpZV60kD2URQXJIjnit4My27vSJhM5D/MoG6aOqZhDoUFWVduotpp52VBPohse6nr7/1JgKY7koUF/RG2ibwmG+cl2cFYkSKrD+5967RDVFIEOzAtcSJzMSSiZ2HzPTVuv16DAa4PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213887; c=relaxed/simple;
	bh=yLL9Gj9gBDSj8KOdaASb7tYb+L/qxG4RlYKs3/9eRH0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hUf/fTJOBxpQtP2qOze3snxOaqeuBBMzze5F02I500rwM3KCZM7QAtuFiD3iU2AW3IVVRC2G3xY4oTa2/4COkyqfHnH3OvJlj4SJvp1uVObFQqAj9LX4GHmF00uigVle3/N4Vbey7wfoNO1k0lXhx3pww8Oq7aAaG9+rjud8Jms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EK/xDEJF; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI2nkSd1hV79oY5hoPWlry9cdtGGG21Uy9A1cxuY0tIHRSyUugyY9fes314YrFIOrDDCmyZO6+QzwL7zGmiUBzH4QMiZeKQT3QGxChLRCLjknYw6UF3kAe/hO9faytoxdhoMOTJ1mckuV4Rq6DMvbkEPZ1sN1Pmj4KZmYsGhK5Yjhj+tZwRE3S9HN/Fc5VMF1X61TQlQlnkynEV2Ehj3isW8g2M1n4CFqRBIcdtD4br3pFxkadXGYB6reFNqmPgNlXYG3epb/hwIKd1XVanl6rHsw6CZO51CxXHEpBIzCPsYhBg8QKWZpCz4xtraYOWphJv1rIug5DdZEMmGu64FZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hap0AAvtf9cLWmroFJ2hdtp+K5Hke4BT/j11NY442Q=;
 b=FEaphV43bAzpfjGJkhDbINU1CCxMSNLz2pdkYa5Px8L6ugPxGV4VzEy8d/Vk6bCHc0580X3eon84iPXwhQ6BYgx//bT4M9ALJ7NFQt53fQCoe6HjlXpyVbRZ3fgODRVWn7h+6XmQL33yUZXCiL5ZHWTR6QZJLOtwtQcZXElUateULY45YpSCIDp9XmD0y1a3nox2ctz5v3TYe/o0+WqcfekRGGHhsYp4w5430rqPJAJfUbj/WPHxGA7b7loYv9DeqX5P6fm8camNLWvOBar5v5girfv8dWoSiNY965OKBMPCegH91sb9nQ+rGAbxn05EEvsdv0gaPqV7Ihj7n3RC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hap0AAvtf9cLWmroFJ2hdtp+K5Hke4BT/j11NY442Q=;
 b=EK/xDEJFL+oP0h+z5MiGuY8pkVar+PSRO3IJNqIb5smwAJIW7aQN4bXmJghCjYXFtj7YZ3E62SKyk3mq+vO7PusPszAjsuC573BXFBSTKVYmslnfVlVt/ATbCwzecamTs9MSmP46p/Wu3raywl3lLhzhWgwoUkwTqMwcNy9VMphXuXa+tr+iyV1kMx4k6lY7hszIRiOTFCoyY2iV1wmnXDivYd58EVdc5y0/rik3XFfPpC2Ch7MYLdUd6bF4dHIxS5HG/90jipth7kYo6mgr0RhAtGtx0Dl7JiutwzTMCtvIUsL4ZeAMViQTOk9oA/BRx05I1Jd0YiuqL0ItHbkH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DU2PR04MB8504.eurprd04.prod.outlook.com
 (2603:10a6:10:2d3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Wed, 4 Feb
 2026 14:04:41 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 14:04:41 +0000
Message-ID: <59c53104-b120-467b-b232-81c2519e2da5@nxp.com>
Date: Wed, 4 Feb 2026 15:04:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 07/11] media: Add meta formats supported by NXP
 neoisp driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-8-antoine.bouyer@nxp.com> <aYIsHfpMc2DZXYBr@zed>
 <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com> <aYNK_fmqsDX_e8cd@zed>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYNK_fmqsDX_e8cd@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::24) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bc484a-1031-4b78-19fb-08de63f65783
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TTEwUFp1a2p3b3Q3dFpGK2dsd3N3T2gxMHo2TUVOMlMxRlBLNTU5ZWNld2hN?=
 =?utf-8?B?VWtaYW12REhIWUcwY1pRQ0ZkdFo0L2ZxVFNZQmhQeDM3VUhvR1dYL0lxenVo?=
 =?utf-8?B?aDJBQ2lXRnBsRkFZZzhrekg5Vk1DWU5CWTZ4VTNVNCtUQlNpcWtSTWZQZitS?=
 =?utf-8?B?dy9yOUFtUUJET1JZaFZTcHZnMk9LMDcyVHl4SlFTMlQzcHV5OUt1ZG5yaWd6?=
 =?utf-8?B?cXhhQ0JmajY5MDBMTmxYOG43ZmFXR1UxbmVTRmFvTVFDaVNWVkNIZkt5MXBC?=
 =?utf-8?B?ODR6VGkzN3l6VllFMTBqYmdMVHpTY3ZBcHBjMkFsS1FqdXlWUTB1NEpYdU5i?=
 =?utf-8?B?bS91b3VrMHM3eG1sYzQweDZ0WUF5QVpsbVBSRWMyekpQaVZSUWFRQzdTdGJD?=
 =?utf-8?B?MWN2TGhHSFhTaVJOK1R4YTdXZUI1UzhtTFJQOHpRdGVvcUZXMHFvWnBXcE41?=
 =?utf-8?B?R002TXpmR0syeE1ROXNwU1c0Zk1kOEJITFFDNHdkNGtFTTRScnRxNWFIZXl3?=
 =?utf-8?B?QWg3Tlp1NW5FV3Fpalp3anVkMGZvWlRyck1DcXBPMHE2TGN2QnRidml0Mno1?=
 =?utf-8?B?bkdqQUtjQUtQMjVvWEdtU0VLWitlTnp3SVZIZlpya1A4T1FoVjYxcnlUbmRI?=
 =?utf-8?B?NjdzTDVHbDVVOENCU01OR3JIcTREU2RLM3FOQ2dycjd4a1g0Y2FOZ0VKTnNH?=
 =?utf-8?B?Q2FmQllSMjdpclFRMWtIUnBPOEFCaG1TNnNhMnNnR042NzlObUpUZ3ovNWlV?=
 =?utf-8?B?cWtPK2wrc0lxNXczeUpLbENEMTNZdzErUC90ZU9SNEc1WVI0dlg4U3c5T040?=
 =?utf-8?B?bmt3NWRpY1pvUVJPRVlFU20xQi9XLy9xUFlpbEpVQmpUeEZSVnAreGZES056?=
 =?utf-8?B?VnZuTHM5NXdBcW5ZSkVYZnRuZ1FBYmJDZWZqczhkaEVHd0FUbC8wTHZYcllz?=
 =?utf-8?B?RnZ2ZUlrUlZuZW44MlZtemFmWFZJeUJDMmh5WkhucExqRmR0UWpySzBFcEJH?=
 =?utf-8?B?d1kyM20yaUM0N1BQTmpsQmxWZnZ1M1o2VnZXdEFLSmpaQm13RWkxVnhJV21W?=
 =?utf-8?B?NmlLZnh5KzNqMHZxdEVRdW41T0FnYVJQOWJhU3BhYVZZVyt3dkxmeHVuS0tX?=
 =?utf-8?B?YlloOVFjQW8xRVBhZ21CMjhNbDI4bW10bE1NUFhEci94cEZ0VXZjdVdES2ZL?=
 =?utf-8?B?ZFJhZU1KaE41YWt2dWc4OU13UDdGVlgrMGJza2ZOQy9Ub1NLWnBGMU1vbUYz?=
 =?utf-8?B?QkZzcE51SmZ6eERDSm9ZcUlhSGQxYkMwcm0vS01UK3R4aDNnckVwb0FMdnRJ?=
 =?utf-8?B?QU5qT2w3d3pxNitMVUtzVlZ2WFFoTkVISUpScE5HVUxFRWZTNzNiV0xvRXV6?=
 =?utf-8?B?a3l5Vkt2bzZSRENSTmE5Y1NSYmZkYWdNaURtQ2hpYnhRZGdiZXd0bkNuLzY1?=
 =?utf-8?B?Nm1ISjZ3bTJjZ1ZnVnlZYjRHS3BvT0E2dE4rUHZOMDQ5QkR3NjN4R3M4L29W?=
 =?utf-8?B?Z3pMSGhwUkROOHpYV0pITFlWcFBsLzNRRWF5RGFTUy96L0FJV2xObmJPUm82?=
 =?utf-8?B?V1hGVFBmUXpybkI3ZnJ6dVFDeTFOb1Brd2luc1Y2UDdWOGprOGVDRzJMVWo2?=
 =?utf-8?B?UmJTM1F0VEhUNSt6WCtXWU90QzdMZks5RkJINnR0eTdRWnRxUHI2LzdUZjh3?=
 =?utf-8?B?UkpPQi9uVC8vT0NoaGJubjdXRDhFYTV6VUJaWnJ6VGpnZytNV0s5aGpmRE1G?=
 =?utf-8?B?alozdFRXU0VQSEhYOUVUK2xBdHhSaUlLbW5IZlBHVjlOcjBLbUo4YVA3bXhx?=
 =?utf-8?B?V2U4ekc4U3YxZXZtRks3TjlzYjZrOVA0MmdNWDN3Q2FHQVA4YlFvbC9ZaEFx?=
 =?utf-8?B?c0daOVRscHdrZHZ4WUZyaTRBMjZNTmM1L1RYMG8yRGJEUnJJb3ZOelhZRTVp?=
 =?utf-8?B?QzB1RjJWS1QwWkxzOHhyNG91OHNTK09PNFFxR0dJdkMrYnJMcnpzYXRkSHgw?=
 =?utf-8?B?cWhZN0JySXhWRlFrMklZUzdDSDJCZzh0VDgwSTZ2K3h3bUk1dDFUckQ4K00r?=
 =?utf-8?B?amVSV3hJaTkveU0wVGZRYkF3Q1lQcEJnOHE2ZVJ0elFHeHJnM3gwQlErU1Fl?=
 =?utf-8?Q?VnMg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z2xTVDVDakt0L1Y4NXlKbDdXenlWUkZWUm9MaWFBNFdscXp5NzNsWTdJQkN4?=
 =?utf-8?B?bFJ4U3ZQT2pnTUF3MUZkaE1xc0h5WmdlVXlheEdsSGF1MVNWT1c3anpHcFVi?=
 =?utf-8?B?TUZqOUlGQ1NNK05OOS9xY2RNd3AxWDh4UHpTVGFUTEFLa0FKa0ZWbXpFN0Vl?=
 =?utf-8?B?YTNNdVFNK2dMT29JQW10QSs3bUlkbmthNUxKOTVucTN1R0JYOUFVUnRYSnUx?=
 =?utf-8?B?RmlodjNBdC9hcGJheEJkR3l6dVk4dm45aEd1Wk1hRjQwYTV5Z0c0Rm1iWFc0?=
 =?utf-8?B?dm1PRUdQMGp4M3FnRkhlSkFlZFJZVm5tZURZNk1zNDZlYVgvWGk3V2dvTFE4?=
 =?utf-8?B?NFZmd1BVK0pTNlJOdFI1amg2OGRycWFFMVQ2MXNET2NhVjZiaWhmQkZ2eDdr?=
 =?utf-8?B?ZVlRMzZuWFYvaUYrdVBzOTFYdE5UUDg1U0tDbGhJYzZ4SXplZkw1MGcvU0oz?=
 =?utf-8?B?cFpGUjZMQU9YR3U3TFBMZExmcDgzay9DdVQ4bW0yUHo1Y0hoQXgyNEtLR2U1?=
 =?utf-8?B?RnFlRVJKWXdPRk9TMWJQcldTcFZHNkIwR0RzRXJPeU5yMnM1QmZVTEhWdW9z?=
 =?utf-8?B?VmI4eFJmQ3EvaThwS0o3K1ZMRlRPc3h3SjdvaG9EaGp5V0Z4M3lTTXV2dkJq?=
 =?utf-8?B?QWtUYmNmZVFaeFV6dDZBQTFCWHl5dTJNeDlpYUZPeERoZ1UraWVWODBZUXhQ?=
 =?utf-8?B?Zk93bXllQTRHMlAvb1AzZEl0SjQ3dDA2b3F5LzdmL3N5SWE3MjNKdEJJR1VF?=
 =?utf-8?B?NWZSTStJUVcwTERReCtKMTZUcEhWYkNITVgvelRSQzZ2MklpaGJaY2xhcWZE?=
 =?utf-8?B?QllGdjlYNTdBK3Jub2hEK2VxcWVDcFVPbUJRRFcyV09hWVlRVUhYMThWNUIr?=
 =?utf-8?B?UUE5NTBtMVN4aVJpbWhlaEl6R1hoUjE2SHVqMkpVcFVRMldSV2V3WTF6Y203?=
 =?utf-8?B?QjdqT2dGd0lObjY0bUJETElBTUJUM1dzZ2l3aGZTMU9YeUYyd2VpVEVxQzJJ?=
 =?utf-8?B?aHE5MHVjck5ZOGs3ZkZSQmVOaEtyOG5URWkrQ2hrZVQ1RHZYVTEwUEtXOCtv?=
 =?utf-8?B?MmhrYUFmaVoxUHlieEdKSEl1U0NzejVNR29ibytudERYUERoZnNkU1M2bVlF?=
 =?utf-8?B?RFRzLzNxSnRnbVpQTlpEOU1GUDNkSVVjNUowV3JNcEZOODkzWHE0c2cvRGpW?=
 =?utf-8?B?aGVOSW5PVGdjYUNDUDdTV1dKRm9EdzBuK01pMW5yZUR5T3Btc0JUeHJLU0tq?=
 =?utf-8?B?OUcxSXNBdE0xQzBDTytIL2VhYlRXM1g1amZQMXdIY090UW9neHNuampQamJQ?=
 =?utf-8?B?eXpwbGt0TS9BcTR6UEFPcnpHc3lqSzFDdzJDbElMMVJiQzFNYUpnc0NEYVpH?=
 =?utf-8?B?NlM2WjNmSDhMTHhDd1h3MjhTeDdQZHkwOSsvcUx4dmRFNVVJTDlZbUZrbWEy?=
 =?utf-8?B?RVM4SmF6VDBhNlRIUmdNMDNTQ0ozdFYrbjR5SkVHdHEyc0FUVitWS3BpdTFX?=
 =?utf-8?B?NGZqTmlIU0J6ZXhvbmdKZkNLMUkxVlFNVUs3NVpjZ0R2MW4vQ2tKR2JDQk5u?=
 =?utf-8?B?NmVmSUc1eHlhbnVRNHdQdmRWM29RWC90c0tjS0p0ZE9VamplODVKSTIwNktN?=
 =?utf-8?B?RUxLNW9qV0dxZEtLVFJFNVJGUXZXZmRYL3ZmKzdpaWhGUFVSZ1NVWjV5THk4?=
 =?utf-8?B?ZUhyRXdaUW9aRU4wR0VJb0p5N25XOWhWMHpHNVErK1lPbS9waEJqTWRyODdr?=
 =?utf-8?B?bnd1ak1iTzZaNVdIenNRYWRDeHM1TlhwUXp3VnNSTjVBZm1wVEkvdVB0cjg5?=
 =?utf-8?B?MEwxZ0Q0UXFYdkt5bnpqYytIQURXZzltbjBvYXR0NnFNd04rZDFEem9TcDdh?=
 =?utf-8?B?eVZTZFh4NVRLa1o4NS9HV2xPMEx1a01JeWxFdXlrbWRQV3BMTnB3WGJYdzR4?=
 =?utf-8?B?Rk9LZzBPb3RIbXhCRDEySUFmbzB4ZWRsbGdhNDlBTUZMUDFkRk5sTTV2UDFT?=
 =?utf-8?B?VDJnNDdoakRYamY1NzhRbVMwc1pLdGpDelVub3lBNm9BOENBM3YxcVhqUlk2?=
 =?utf-8?B?bEk2eGhqRm10V1FQaGgrU2RvVjZRZks4WDNFb3BxNDFpNm9lREJFUWV3QW03?=
 =?utf-8?B?bVA0RlF1SFdUNHY0anJZRmcyN1VZRHMwUmRrTHZjT2NuZHJSdndzV1ltcGRr?=
 =?utf-8?B?L2JPNzJWTDFGREFJL1c2UzdMeHZKeDJYQUlUZUdyUFpsSzVtSFdDTzJocFV0?=
 =?utf-8?B?OGNlWDBqcG9pVHdYQzdjVU1hSmR4MEF3UFJpTG5WeVVXbXBhRm5DSHZjUDc1?=
 =?utf-8?B?ZGRTZWp1T1hyWSs5eURQS0dNTVpDazBrdnNrejArVWlaWHN4aXZEdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bc484a-1031-4b78-19fb-08de63f65783
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:04:41.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMUnRnyyBAd++1mRT3iLJpNeqI6jG5AzrcfBgQYoQ9P88NdiJfB0ZfoV3ZOWKpEKjif7kyLm8wZgu/Ck2IsJ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52189-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0ACDE6D4A
X-Rspamd-Action: no action

Hi Jacopo

Le 04/02/2026 à 14:36, Jacopo Mondi a écrit :
> 
> Hi Antoine
> 
> On Wed, Feb 04, 2026 at 02:31:47PM +0100, Antoine Bouyer wrote:
>> Hi Jacopo
>>
>> Le 03/02/2026 à 18:11, Jacopo Mondi a écrit :
>>>
>>> Hi Antoine
>>>
>>> On Fri, Jan 23, 2026 at 09:09:34AM +0100, Antoine Bouyer wrote:
>>>> This patch adds new v4l2 meta formats definitions and descriptions used by
>>>> neoisp driver for the parameters and statistics buffers:
>>>>    - `V4L2_META_FMT_NEO_ISP_PARAMS` used for the legacy fixed-size
>>>> parameters buffer structure.
>>>>    - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
>>>> extensible parameters structure, supporting a non-fixed-size buffer and
>>>> changeable ISP configuration blocks.
>>>>    - `V4L2_META_FMT_NEO_ISP_STATS` used for the legacy fixed-size statistics
>>>> buffer structure.
>>>>    - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
>>>> extensible statistics structure, supporting a non-fixed-size buffer
>>>> and changeable ISP statistics blocks.
>>>
>>> Uh interesting, you have existing userspace that needs legacy formats ?
>>
>> Yes we do have some available here (version with extensible formats will be
>> the next one):
>> https://github.com/nxp-imx/libcamera
>>
>> Not in mainline, thought.
> 
> I see.
> 
> However I don't think the mainline driver should support both formats.

ok.

I'm fine with starting from a fresh version, extensible-format-only, in 
mainline. That would also simplify the patch series then, so as 
Documentation, and maintainance.

> 
> And looking at your libcamera branch, it seem it already supports the
> extensible version.
> 

Oh yes you're correct. I thought it started from 6.18, sorry for 
confusion. One more reason to move to extensible-format-only in mainline 
then: it is verified since a while without any regression compared to 
legacy.

BR
Antoine

> 
>>
>> BR
>> Antoine
>>
>>>
>>>>
>>>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>>>> ---
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++++
>>>>    include/uapi/linux/videodev2.h       | 6 ++++++
>>>>    2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index 37d33d4a363d..c797cf11be38 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -1471,6 +1471,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>         case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
>>>>         case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
>>>>         case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
>>>> +     case V4L2_META_FMT_NEO_ISP_PARAMS:      descr = "NXP Neo ISP 3A Parameters"; break;
>>>> +     case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:  descr = "NXP Neo ISP ext 3A Parameters"; break;
>>>> +     case V4L2_META_FMT_NEO_ISP_STATS:       descr = "NXP Neo ISP 3A Statistics"; break;
>>>> +     case V4L2_META_FMT_NEO_ISP_EXT_STATS:   descr = "NXP Neo ISP ext 3A Statistics"; break;
>>>>         case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
>>>>         case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
>>>>         case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 848e86617d5c..5f4992452c66 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -889,6 +889,12 @@ struct v4l2_pix_format {
>>>>    #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>>>>    #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>>>>
>>>> +/* Vendor specific - used for NXP NEOISP sub-system */
>>>> +#define V4L2_META_FMT_NEO_ISP_PARAMS         v4l2_fourcc('N', 'N', 'I', 'P') /* NXP NEOISP Parameters */
>>>> +#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS     v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Ext Params */
>>>> +#define V4L2_META_FMT_NEO_ISP_STATS          v4l2_fourcc('N', 'N', 'I', 'S') /* NXP NEOISP Statistics */
>>>> +#define V4L2_META_FMT_NEO_ISP_EXT_STATS              v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Ext Stats */
>>>> +
>>>>    #ifdef __KERNEL__
>>>>    /*
>>>>     * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
>>>> --
>>>> 2.52.0
>>>>
>>>>
>>


