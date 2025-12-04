Return-Path: <linux-media+bounces-48215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BECA30D6
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C71DA3006FE0
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAB73346BE;
	Thu,  4 Dec 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="dcUuw9pE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63D30AABE;
	Thu,  4 Dec 2025 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841353; cv=fail; b=DbEwVeN16PpBrlEa7tFb0LAHyemJREfZTuHWpXterxQ+YVhWcc1TCCC+X032d7ALaLRsL4iG//T0fRCbFc5b/ALwTjt47250mbIWum2TiTdP1QvUMxzeZ1LjuOwzWcixR/0BJMR6SZfnHb7JlTdD9hLbd28QHeO0kSVqVNDJOFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841353; c=relaxed/simple;
	bh=a8HeycSt6Ue+aXxt/Xa10a85bLn9UEKTzccAO0CF0Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uFsWKrQ12/aXT+KUjpMe7DC58eWYvKxzW9zKdhhPBNThET4sC5iLJmhVZZ0W1pyJZdPCp031oK+pYPz0YjKUZpw85OP5277/C0NeKcTiktyo1F8SK5+UB7C6pOgMSeC0afcP8UmvjpOMx4heU6QfdLJXhxjzzmHDRLwY/4cZdR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dcUuw9pE; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47HFSV930165;
	Thu, 4 Dec 2025 09:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=6havd0grU
	H+NXs2/TXbSNv33+NvAG170QBakrKPX13o=; b=dcUuw9pELifNhN6/TrN3pCvl5
	thUm58nJ/OIG3gRPOOAOXX7qsV6REM6eyLKdOHCKQRCj79o6iY8z/YR4/LhS4sKE
	LLsp9BUJ3A7LgLEEc/e+M4B/DTuvVakiMgdrW2i1lyA7hvcQxBF1e1958oJDhXMw
	FY1uxThJNalcizkYVOnnpdgM6E8P7IJ1Pft1rB1QUmoz7NgksJagHcqgg5DKuKjg
	j6tYO+2HGVFXMYKso0FRtob7CdwBq6xZEpoM+Ti1xbvGeuADehEhWT8nrhXp4vk6
	bkcMlh0rGfD2UN1sjbDrqmlO1oHMYBPzz5bc6qX5mR1W/0I17foXDsV+UsuFQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e6n5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 09:42:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjQsbaTQLvpYhK00cDq45s3szaGpqj5RAKZWpbU2eStqftAg9QjFu3IhM+Ro6DRuPaPm0KBvJgIe7GuBOtv3+BS/nWtjXgwltWPpe5QdBKCrHHhRNg8nz8Gfcm/PxKNWWy+TOeXPftKqhmBnOMU1KkL2/UogiwX1C2Io8AfUflN3W4W+nu4JB39drje1xIZ6V1SXTPx6QonNAKF8cFV1VT5Xc7GGmsRkctbu/sZR5OIPSNcVnUwUWtmRwK75TPTldlt7MCBduy+NacuCWeQ9ENxrCZCi+sA/MC+H4J9G91KvdDhQFTFBFMvuod1EZqu8rcPDK76c+/0tEtoPJ/Cy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6havd0grUH+NXs2/TXbSNv33+NvAG170QBakrKPX13o=;
 b=NKCjwl7p4G/qJan1dsF5Xrp/9siK9CyhOXVZdhDag6KvmuPaCBIaJhSOMT0t8HzfJ5+OIMkmWc8qFtxuchF4UZGWi46Rk/kc0nivDWqQwugJTAwo+zXWxdHiDephFKiPxHFRSY0b30VYN/V8dH2QrEy7RRx3OuFoKECMMpx45G4S1gqciHdqul3PcIE+gF2XRTV2LzwyTbFjXQa5C1Z0sWpsXsJJNMbsP0sI+MF7A/n+jyH8tP2UAi+shw7Q5DOug5V5kxuUzg20NqmXGad0PEpwxgReuHDLhNH9a22CS5QBl3+5iLnMPEJ6+SxPj8ZirdXqHImcyh9ZqG2RsX7jPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 09:42:07 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:42:07 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        nicolas.dufresne@collabora.com, hverkuil@kernel.org,
        dafna.hirschfeld@collabora.com, xulin.sun@windriver.com
Subject: [PATCH v2 0/3] media: wave5: Fix critical issues in driver remove path
Date: Thu,  4 Dec 2025 17:41:50 +0800
Message-Id: <20251204094153.1530331-1-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 871fe2d9-a293-495b-45d1-08de331963e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2RWK3BkeVM2Y2JZRFJPbFdFVWkxUjBaajBTbkpVU1EzaVpuZlROU0FGd0I1?=
 =?utf-8?B?RU9NUFVWQ3lxNDYwdzA3RHRDM0RremozUlg0YkJIVmVWakVObXJycHp2T0d5?=
 =?utf-8?B?UjRwYWxKVjdOQXdES1VPd1pvZEEyYVZqc0dTbmwrTUR1TW5WQ24vbjFiNUV1?=
 =?utf-8?B?Wkp2d2hRMUFqaXltZWpuWjdsVTJZQWpmc1UwWDhOYi8xSWhFRlZ6WmM2bXUx?=
 =?utf-8?B?eVQ4UUo3ZDhhdzVqK0VTMmhYZEYwa3NiWmVONUxXTVF3OFE1ekVKdlRPbEk1?=
 =?utf-8?B?UnF4UEpjYngxeThjSElFNGJyR1R1L1Zwa3AraWcrbng1TlZDMmZVNDFQYkhh?=
 =?utf-8?B?WmsrZnZmQkdoenQvb2NPdmRBR0drdlZwTjN2TTdKVmM0Vlh2Nk13VzYrOGl4?=
 =?utf-8?B?TEpSS1Z0eGg2RU1zQW4vOGlmY1hvT2wyVWNoOGJtRXJkcWNlYkplWE5zbzFt?=
 =?utf-8?B?WnhNRFIyZ2JhdWFXM1V6Y3ZjbVZjQ1kzTjFVRTdzT1JLWVJ6MnBUSlVOeXJu?=
 =?utf-8?B?NVBnR2FGTHhrTE5ONVBsUzU2ZTBob1J1V2Q4Zi9JZE5QOFJtNEhOaVhsY2ZE?=
 =?utf-8?B?NTFJNUxDajBra0ZySXlkZGk2QTFtb0RBMno5MnIxRFloQUxxNExxVjhqUjZX?=
 =?utf-8?B?UnorN0pCUjArbmc5R1pudU43NVRKQnVrMGFzc2ZZemNQeDBFUDdxRlVrd0o3?=
 =?utf-8?B?MEhXaXpCdkR6dVdTU043b1FMZENLSUV3aDRqQ1d1NTB3Z0RtU1Nza2dVcnZi?=
 =?utf-8?B?d24wNVh2eDVRb0NrMHFOcGc5NlRENld0aWhjeE9YTUZ1SkU3ejRTZU9oak5D?=
 =?utf-8?B?OG0xc3RRVFhpVmcrYXNiNDA1a2djeVJGQmJzRDJ3UWtIZTlIeXJSNEpKV1J3?=
 =?utf-8?B?OXI3MWthamJISjBuZzZUeEhwb0VBMys2dDN2Q1FHZC8zZWVRSjBXME5pM2VM?=
 =?utf-8?B?Q2lJaHk4alozWURQK3FNYytHbXV6N05zODJWR0tOUDhTd3pMRTNOOS9jK2tu?=
 =?utf-8?B?aVhzY2ZMNTNnT3JUQmRtdzNHVytSbnlVV3BQUnQ0MHUyUDJFc0RmSjRSclk3?=
 =?utf-8?B?REhTOEROUUo0WUZNbWhaUyt5U2J1dUVmOVM1SVhOWkJFUzBoU1Q5RjhrNFpv?=
 =?utf-8?B?MktpWk1aQ2NkQ2w5c2ZId0pad0hlaGlDTEJoR3NRMy9YTUxiWnZJQnJTWlB4?=
 =?utf-8?B?K3FiV2Y5YjRHUUo2VFVvSENVQWZWVnNUVUNUb0lacnA4dXcwUnpPblNvcERP?=
 =?utf-8?B?WXZYMVV1Tkg3VlFFMGRtTXdNams3Z1F4VytVeG8yWE9YcWFyc1ExVXBZU3NI?=
 =?utf-8?B?T2h4WUpLZlArWTJ4QU8wTkVLYnJZNlkvUEFjK01FNk55YnlrdjBOZ1JIUEdH?=
 =?utf-8?B?QXRxaXRnaUJpTnAyNFUzMks1UEsveWUyejk1YTN3clF6UkNJNGF1TW00TEpK?=
 =?utf-8?B?YUpyQ3J6NlppOHZQcWdPSnBGSmJjSlpnbmZBd3lrS3N1NldSRmJDVlJwNjc3?=
 =?utf-8?B?ck1YdE1ja05mZnRwei9wSjc0TUx1LzR6cjNvbi85N0t0Z0xsdFYycHhIZzJF?=
 =?utf-8?B?d0M2Yk5Sa3JuV3ltUmpCUDdiZDc2QnNWcEhBbEFyQ3F2QkVnczU2eHU0Z3Zh?=
 =?utf-8?B?NmpoZ0ZNVjVLQW1OdWYyWW8zSTVqam92QllkQXFMYTNsVTd3UDFBTEhxL2FT?=
 =?utf-8?B?UG5GdVo5a1BZL3RSVEJMcm41L21GTUJVSnIwRjYva1pHYWRldXVtZUdHT0h1?=
 =?utf-8?B?RkpxV01SQnM3SVJPUDJEOHdrWEVaV1BxQ05SN0cvYm4yMDBwTDNLOUZVTVZX?=
 =?utf-8?B?cHBJb2hiZU1RcGhkSi8yVXVEN04zQm13aGZxWkpwNWZFTm90TGFFQng3bHBr?=
 =?utf-8?B?MnZqc0ZHNjZzRldoQTZtR2hwbUEyNVBiUHNxMW1UYStHNnVuTWlpOFBOVTZN?=
 =?utf-8?B?d21UTG9Dd2VRWVgyREVQd3RxK05ZK3ZkdWFLQmdmYkg2Z1hMQm83cHJpM2xm?=
 =?utf-8?B?Zm9NMjhRMU1rcmtaRk5LeUVlZXRVZTJXR044ZTJhUTlJMGhxaFlCdlRYOW43?=
 =?utf-8?Q?HtR/sD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2dBQm9nK1pjT052SHNRdkZuaElHT1ZaemMzRjJmVk5ZcGlyZ05xYmViQk5i?=
 =?utf-8?B?QUVqMXZWQ3p4QjJjTlVxbFg0YTNPR1RKclN3R3FqUFZrVG5pb2RJQWs3TDRH?=
 =?utf-8?B?dlh0UW9DOUdwMWUza3FJL3A2bFRMZE5iTjFORlZTTGlzQTB3U21LSEVHdGpy?=
 =?utf-8?B?Y3RFSDBvVWYzMXRYcVhCY0s4KzJIeHlHWU02S3QxL3k4Z1FZZFlJZUdrMDI4?=
 =?utf-8?B?WExjRE4xUU1uWndwTUNjZm1EcUpBYU1QSmwwZG5vZXQvYkwyTnZtazZ4Z0c0?=
 =?utf-8?B?RmpvejRiN29tK3FtdmFWZFB2UXhodG40RjNUU0VzWU5JWjQ4U29vbmx1aE1j?=
 =?utf-8?B?bnZNSW56T3hJMnVUeDBCTGFZZHZlclFKeUJiYUVmSTZKZ0NYQVZkWkFqQlZw?=
 =?utf-8?B?aVo5aEhUM1JsTng1RUppazM3SytlQWRyL2ZGRSswbXlVNWFVbjZSYkhqOWMr?=
 =?utf-8?B?T1Q5MHZ6Umt1akdaOW5nRTZBYlMxc0dzMTE1V0svd3ljVUtrdzIzTFJBWUln?=
 =?utf-8?B?c1ZydXZSdi9PaUJRTU96TGtIWmdjQXBrUXBOMzFveVBCTDhGWkpiSUdPeERJ?=
 =?utf-8?B?WTZmYVpUS1NpWVhFS3RlaGRRNXpRMVNRSWhPYW1pZk5xNmF5UDlFaGtJUDdk?=
 =?utf-8?B?UzVFTDRVSWNSMkNFNUpDVFFCRTEvOEtOUXNuaDR6ckFrVUtXbVMwQk81Z3Bw?=
 =?utf-8?B?OTExemhjdHJNaFpER3pVYUs5bVd3QTZuWmNoMnk0d2p4L2tUSlR2OTMzeTVo?=
 =?utf-8?B?aU1ZR2VIR0wwMDZ5UmZoUTgvZFc1bWQxTVJkWkpUbTR0NitBZ0d0Zk5OM3RL?=
 =?utf-8?B?QStqWnllNnJ4QkUyOWlibFZpWXZndW8xbEFFK2l6Nk1xNmZibDViRDJ1Z0JW?=
 =?utf-8?B?Q21Qb3pHYVpOOGhjL3hSOEdDMklhUEd6dDZHSnRzaTlTM3UydzkrRDEyUjV0?=
 =?utf-8?B?WkNHMzN2VmVyWU9RSFgzMzNQVkhXeUswNTc4N3pQdVpYa0ZKM05wV0ZJSFZX?=
 =?utf-8?B?eTV1d2dJcUJnVzJyQkpySGo4UFB1Y05NdCtKbTdHM0E0ciszbnVacVFiSzZa?=
 =?utf-8?B?VmhFNlFmU1ZVM09NaCtWbWJPVHVBdDZQOG5NeUJFWFh4VHNldUxsYlBOWmFW?=
 =?utf-8?B?ZjBjblo4UHlhbVpCMWJjOXBqVnE0dnlnQnhlSnppWFRSYytId2txWTV3ZW5p?=
 =?utf-8?B?NVZqcnB0Q1dkcW5BNldjTWZFb2RqSVN5cWU2U0h6NDEvSmpGb0hralJJS2Fh?=
 =?utf-8?B?Tzk5djNDR2FZdThBc0FIN0lhYXZ0d0lGbWUwcDhoTTRMVmJ5cUxVLzQxMytG?=
 =?utf-8?B?TXpIZ3REVmdyTjNBaTQwcHhSR2Q0Y3pOb2RqTEIzWFRVajMyTHhSUUZpYTBi?=
 =?utf-8?B?MjBvMVhlRDFLM3JsNDIxcGswT29wMFExaitPT2FiVEdVR0FDNEc4TnpIb2dz?=
 =?utf-8?B?T083RnB1dFFSNm95Wm91WE9NR2QvOUhNUFNrd205d3l1VVdxdXZaR0h1WWgv?=
 =?utf-8?B?bUFKU0V4My8zOS90eTJId0UzOVRtWFNZWE5HT044S2ZCbkVobXJHWkMwWDJI?=
 =?utf-8?B?MUVQU3ZzOGV1OFpwbEQ3VW1obmljcHJSUWlmVEVYKzFWRDQyUCtxL1RpZEtx?=
 =?utf-8?B?T3cxV0ZlQlBFYUQ5OUJBaTE5QVRsSXVGc2Q5ZkMzb3doSkxEMjRHMVR3alFH?=
 =?utf-8?B?cXJCWHNOUWFQU1VucWFjUlQrUHc3bXRvSExFRDhmQlRZK2tBSDRMNmVRcEZt?=
 =?utf-8?B?Wm0vbkxrUzEvYmZwOG0wNUcvZGtRMjRzMVBFdlZFK0ROQlhIV1MyTldQeVU3?=
 =?utf-8?B?Tkw0TmlyUDdSK200Y1FpbzQ2M3pTSzRiUWgxenRNZVZ2SHRweTlia3hGK1E1?=
 =?utf-8?B?bVJMVmZha205NGRzWWJ2ZmNGVHZFeEQ5SE04WWVzYzNwTVVtZTFFRU1aWmFL?=
 =?utf-8?B?M0FOY09qaHRkSnh4emhRZWlqMTZ0emVYT0hGM3VseThqaXJwZ2NzQXhSVzlr?=
 =?utf-8?B?Q29Nb1FPQVk2eldta25TK1F4L3dSQ1UvbkVzYW9LT1RkZFZKeG01bmd0Zjhn?=
 =?utf-8?B?OTNFdUNNcG1pMGlPbHhuUkJuQUdWWFhQdVFDeWJuMHFuaTNubjQvSHBKbE5J?=
 =?utf-8?B?bFc0R1V1Vk5xdU5mbGhwZjRGSnpYMmppVXpHUjBOYzFlSG95R1JEK1pkajg3?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871fe2d9-a293-495b-45d1-08de331963e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:42:07.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEDSWpIQJ8HspPMwM5U2/x7Xu107snGus7JjpeMU1yAWn209Ad5YXfXWiUPmU22udCHP0MuVR4dJV/u3J0nHrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OCBTYWx0ZWRfX5rUHC3GfZTdK
 LKqp7chEbbT3Jvzfg7jqLwD592HoZjsHZEHf9hc/Nu8qYpuKQZqwRoED5g5fDRMT7MBio/K7ZUh
 o9mD4RvM75eNvMBUe0gRD7CtczqCyJWwLDXBL6r9U+TqMrc1qqYZQ0TmUKyHrZ75LZhGEOTQGZl
 WUn6YvLehoGj+/KDSFzYOrGe8ZHyVc2ugNGE9HHVdueDT1vzzm3iACscTxGiMlIGmR+GilV5jtZ
 v7jafwDv3P3U3UavGzpp1N4Crodyin3r59b5QcMaCIFCKfYVEzEYQlW1bM1xRbD5l8Gr/QJrUSi
 VKerGduGaJ9xy7+tQc3DILnxNPWtr4fOaQnaKGPc3gMdKkBp7QQYTG5tCB4+xee22gWYgzA4xU1
 JmWSh49uykAKXH3s7c/Y+x8eXDpe/w==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=69315775 cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=KqZzv8Zscl-aSvcBOYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pQirSx2Q53ebeo2-St1m9qsdP5_QJQGb
X-Proofpoint-GUID: pQirSx2Q53ebeo2-St1m9qsdP5_QJQGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040078

This patch series fixes three critical issues in the wave5 VPU driver's
remove path that cause kernel warnings and system crashes.

The issues were discovered and consistently reproduced on kernel
6.12.58-rt6 with the TI AM62A platform during extensive testing with
gstreamer encoding pipelines and module load/unload cycles.

v1: https://lore.kernel.org/linux-media/20251203040935.2685490-1-xulin.sun@windriver.com

Changes in v2:
- Reformatted commit messages per maintainer feedback
  * Removed "Symptom:/Root cause:/Fix:" section titles
  * Reordered content: fix description → root cause → symptoms
  * Added Fixes: tags for backport tracking
- Retested on media/master (6.18-rc5)
  * All three issues still exist in the code logic
  * Issues are harder to trigger on 6.18-rc5
  * Applied patches resolve all issues on both 6.12.58-rt6 and 6.18-rc5

Patch 1: Fixes PM runtime reference count underflow
Patch 2: Fixes kthread worker destruction warning
Patch 3: Fixes kernel panic due to incorrect cleanup order

Testing performed:
- 50+ consecutive H.264/H.265 encoding operations
- 100+ modprobe/rmmod cycles
- Tested on both 6.12.58-rt6 (TI AM62A) and 6.18-rc5
- No warnings or crashes observed after applying patches

Xulin Sun (3):
  media: wave5: Fix PM runtime usage count underflow
  media: wave5: Fix kthread worker destruction in polling mode
  media: wave5: Fix device cleanup order to prevent kernel panic

 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.49.1

