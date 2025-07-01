Return-Path: <linux-media+bounces-36375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B6AEED74
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 07:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E92117BDFD
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 05:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA201FBEB6;
	Tue,  1 Jul 2025 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="YjLi7zdc"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FEA47;
	Tue,  1 Jul 2025 05:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751346685; cv=fail; b=LjVI7v3dsZh9xnJ6gflDxTt5c3AE2J6l+DVPDB88m6L2S4Ug0R0KpK9kHUJNu0HH2qnkOupBRtrAvJq7Zsy5n53kxft3HhPsvYm7k+07DcCzD3zq2ctZMujRaVh21whjcRG4Q4EURXyNNzWV5Ad4HHqOCTnMMu9Hj5ULI+ga7fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751346685; c=relaxed/simple;
	bh=iFo8AaUw9AVT9PVWCAlcLUYe8ChC4oF+rmu5ELWka9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IN4RGBDaPs6guomEqmz+hoHz1YZbpUZWAtlI7pliFW6al5ciHrCabWKWWMa1Z6kqDsmaZLkibrDAteAfGUh+8uD25rai6O5uDDWSHSRgr+osU0mSvUBOy1Dc1RWIOWqsaeVTZpWRZFFv5FSRBMC0d2Kp+BjD4HuD+Xbcfqz+FyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=YjLi7zdc; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIWnvk1VEnDkXb3haZvLeIgANQnVsT1k5+eCCSL3rwob8QljFRIbkQXtCbChLPOle+tIhhhv7zpVQH4NsPRsak8p0TAfZLKWnsDD0TAlirk+9GnbhYzy/yW4OE/IZX8XDgQEzFAFTnhY9agY1GyeyuXjyzEEQO1QBwiOz+lYjrtBpEkCsydm/hWdAeZrV/HlPcTldVuMd2g67IO+sWuscPIyJxuaMI2j1s4gMqldkEdCTnfNY72O3UJxfujY+Gv7fvkRIdse3kaXuvqMJKtvzbmW0mNvJJWThKCajmfUcX7lvgrIWKZVAGmY4WzHcapGfkMHPYezfyIY/OjaZF6zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR3ZiYiPc9ZCHSEJ/2Rm6c9AaMCkMRDGpxz6vIBO2GI=;
 b=RVe2PrDhgPIdZoBv/P3LD8s9Xq9GNhVEnqPN/zu8C2dlv+plgfgG3i4Kik8rZTfWDMn8K1z24cWvESbW0IY+xLhILJnnmQlhB0ne1TN6BtcA+4r5k94vuN6D5rbw11GRMnTkThSfPo/jX2QhGN/B+rZ5uGMRDWgrn/60pnJJO8QrF/N8uBS3d2kLaYMQWkepyIO8K2R1WndlaU9ctCfynhxxxzXaKaxYDmABFQSPnKdb8t/hHDwhDGQ9pgecucP0pzG8HHnJ+bGzkNwFrngFwPSrEWWvQmUiG99zY44M8aBN4E4SUEyncd3qAGYQvAu2HIpzv1+iCdvPBYvBvZlh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=collabora.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR3ZiYiPc9ZCHSEJ/2Rm6c9AaMCkMRDGpxz6vIBO2GI=;
 b=YjLi7zdc10AwSlqlvoXc1Sqd1qvB8m1yAbF+bEwRHHTy3rJiFpVP3Jkly0cAECLVK/uMZDdkVaWn/rFFmKUlzh0yiIwWaI0eCZFOfk53G7sXNcKFoHN5k+qnJJiEChURuPSpr9gBkK+7RIvu1CaYgMq/7fUp+D+c2fcBEjOQsuc7GwrgYkms7v8qGia6M7ZJ80YpdbMiNVFB83OSTkCzVYGfDOi8KHZt3JYa74MwVseLJcNGU6j2tDcLz4ejrsvnTfBttXqj81lcwfEC5zdC5daca/4buUJ0ikO2PoVKsMwLUp9jPnC4VmF+FcxA91+5v2E+MfR5ztQ9qRxHV6wAOQ==
Received: from DB3PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:8::44) by
 GVXPR10MB8083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:115::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 05:11:17 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::99) by DB3PR08CA0031.outlook.office365.com
 (2603:10a6:8::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 05:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 05:11:16 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 1 Jul
 2025 07:10:48 +0200
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 1 Jul 2025 07:10:48 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 1 Jul
 2025 07:09:30 +0200
Message-ID: <225bb9d1-1c50-411c-bb77-d336b1446dff@de.bosch.com>
Date: Tue, 1 Jul 2025 07:09:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] media: ti: j721e-csi2rx: fix list_del corruption
To: Julien Massot <julien.massot@collabora.com>, <kernel@collabora.com>, "Jai
 Luthra" <jai.luthra@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pratyush Yadav <p.yadav@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>
CC: Vaishnav Achath <vaishnav.a@ti.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sjoerd Simons <sjoerd@collabora.com>
References: <20250630-j721e-dma-fixup-v1-1-591e378ab3a8@collabora.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250630-j721e-dma-fixup-v1-1-591e378ab3a8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|GVXPR10MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 630ef638-7fa7-44a1-d130-08ddb85db55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlRKQUhsK1ZXaGI0T05SZldWTVA2ekVweFZ1Sk1kV2oyQTFwb0JYRk10V3gr?=
 =?utf-8?B?SFlaRnJDbEFvNk1CV2ZIR2RPSU9YRFYxRXFXbDdaV0NoaWN5YWVKU0dzendH?=
 =?utf-8?B?RmoxSFdZQ1NHZ0JkUUZ1bDJ5ZzhiQ05ueFp6YXFJYnJVWHRrczVtcXFPUDBz?=
 =?utf-8?B?S3orNUt1ZlAzYWFQVERwRTdKQ1RsZVduN3JyTjFPT2FvQXE3c3FWRmpPOVBq?=
 =?utf-8?B?UmZ4NC9SZFUyMkJOYWZLSWJNZ1J5Rm5mZVFvUWllQWRCb0J3M1g0VkJHWGRX?=
 =?utf-8?B?MGphenhJbVZYZDk1ZWRsVVhyNkhrUEFkWWVDamJpellzQ1N4K3pYNjhERVdO?=
 =?utf-8?B?RXlya1JacHl1WXVFc0lrV2FhOHNSVGJzYk5ES3RFdzVkMWMxdElOUDk1ZUZ3?=
 =?utf-8?B?Q3A1cUF1VlFhdURreGxJZHh5SVhiQnNUYk5mczlYUW5aYXgxUTNBa1lEVmk5?=
 =?utf-8?B?d0tON2I2dVRwblJXNWtDVzFUS1B2cUxUNUxTWXNsNUpvT0RxM2IzRzdPeElX?=
 =?utf-8?B?ZHJhMWd1bWNrZGxQMDNOc0pkZDlzYWExSGU5cUQ4QzExK0Rza3czQ3B4WGU0?=
 =?utf-8?B?dENrTCtrbmFTRE9SNDlzVmJXZ29LbTlPbkk0TVNVS1p2UzdSOHZ6RUdPUHZF?=
 =?utf-8?B?ZXZtSStEVWRhalhSSWVjVFZaT3ZXc0lzUjhiWGJGanFsbmx2c1hiWGdpRERT?=
 =?utf-8?B?WWpVZXN3YytJUE9mQlBPdFNNWTVSVHBjRnRvN2huazVRdElTUzhPd1F2VHZ2?=
 =?utf-8?B?VWNYRU1vRyt4dUUrc0xoczZ1RUVjZGtjdUlqSTZ3dXpqYmR6SGRpMC95MWRq?=
 =?utf-8?B?N3VsejRsNzN2dkFZbUdnSzBEVHJ3V2dKWDVIeTM5TnNGTHdrelNSY1pvazVT?=
 =?utf-8?B?cG82cmJMTlFSYzJ1WHBsRmZnNEsxUUtFOWlmOUw4eXZEWWZOaFc1ZTdRbldT?=
 =?utf-8?B?ejJNSlZvRmhMUThlTy9pRzB6SDhZMEllM1RQN1d1NGdzZlhUekVkUHpaZGUv?=
 =?utf-8?B?aGFrMllpTXByNG9CbVNkRG0xUEpTWEx0SU1Ma3ZKREhhdUlKc3RjOVk2dlJD?=
 =?utf-8?B?cmluMTVmNk9OZ2hCTzk1bFpTTW5GUzdLMGlNOVNHNjkrT0dYOVNMZUpGaC9Q?=
 =?utf-8?B?U1RhMi9IdkNETWUzL25MQTI1UWwvQkt1TE16UGYrNGh5b2hrT3JKVlgvMDI3?=
 =?utf-8?B?bVBPMXJyZmFGTGpROVozUEtERm5MdWNZSTRIQkF5azVZZHB5V3dFU1UraXU3?=
 =?utf-8?B?a3RkNUdyUlBkZGpjckdQalpjcG41VndlekxJWnJFZGU5TEd6L2tsUTNMb0Uv?=
 =?utf-8?B?UXlYWGhTMUhmQW9IcFpMcFZpZkZLaFA0WHBHS0NhZlY3KzJpajAycjAwNTl5?=
 =?utf-8?B?ajl5NjRqQ2o3MDBzSE5Xa3BtaUNkNGMrR2ZCU2I3aUVxYk5rV2dPYTM0Q1pR?=
 =?utf-8?B?azRBQ0lpUkhLbHZIdEYwYk1yWlFISFA0eE1Tdk9LZTArZ1NiajFwZTltTjha?=
 =?utf-8?B?MUV3cFVVZU9pc1h4V2pFcHlrUHVJQU1lN0hqOWUvZjhqTnhoN2U1VWlsY2p3?=
 =?utf-8?B?MFZudVhodE5sR1BIMHEyejhQWVgvTHNjcWhoRkhmRUpvTlkrdEdWR25JY0dB?=
 =?utf-8?B?dHVIVHBRelFnK0xPUFVmS0NzM1BYTTdWMzZ4Qm5ld0taTFJlSnhSQU4wMzA4?=
 =?utf-8?B?ZjhDSnRtMWdSQXllNEYvekdBZG1iRWJwT3dBZklieFB1NVNSWTc2UGNEN0xO?=
 =?utf-8?B?czhQLzYySmw2QktZU2NES1R3K1pSTjJMd0hLSUVoU1k1NXJHcVpTTkh3b0Vj?=
 =?utf-8?B?VnVwa3pabmVVSTI3ai9QTGJ1TXRiekdXTHREU3VLWFRON3AyOFhzcGVFMWQr?=
 =?utf-8?B?WU9VMS9oTkpwdWhkSkt5d3dPL3Q1akZpQi9SQ2VNc21iTEVjYWIvZUtBVXlm?=
 =?utf-8?B?R0lxRnF4UmtEaFRrSkU1UHR3bjNUQjgwa2tQaGtmd2s4QnBUSllzYncrZVhJ?=
 =?utf-8?B?aHJobjhjeCtFZWsrNHkwVG5BQk8xN0svQVpTTlE0dXZYK2tEL2FteU02ZGRC?=
 =?utf-8?Q?6Owp1m?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:11:16.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 630ef638-7fa7-44a1-d130-08ddb85db55d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8083

On 30/06/2025 12:46, Julien Massot wrote:
> If ti_csi2rx_start_dma() fails in ti_csi2rx_dma_callback(), the buffer is
> marked done with VB2_BUF_STATE_ERROR but is not removed from the DMA queue.
> This causes the same buffer to be retried in the next iteration, resulting in
> a double list_del() and eventual list corruption.
> 
> Fix this by removing the buffer from the queue before calling vb2_buffer_done()
> on error.
> 
> This resolves a crash due to list_del corruption:
> [   37.811243] j721e-csi2rx 30102000.ticsi2rx: Failed to queue the next buffer for DMA
> [   37.832187]  slab kmalloc-2k start ffff00000255b000 pointer offset 1064 size 2048
> [   37.839761] list_del corruption. next->prev should be ffff00000255bc28, but was ffff00000255d428. (next=ffff00000255b428)
> [   37.850799] ------------[ cut here ]------------
> [   37.855424] kernel BUG at lib/list_debug.c:65!
> [   37.859876] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> [   37.866061] Modules linked in: i2c_dev usb_f_rndis u_ether libcomposite dwc3 udc_core usb_common aes_ce_blk aes_ce_cipher ghash_ce gf128mul sha1_ce cpufreq_dt dwc3_am62 phy_gmii_sel sa2ul
> [   37.882830] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.16.0-rc3+ #28 VOLUNTARY
> [   37.890851] Hardware name: Bosch STLA-GSRV2-B0 (DT)
> [   37.895737] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   37.902703] pc : __list_del_entry_valid_or_report+0xdc/0x114
> [   37.908390] lr : __list_del_entry_valid_or_report+0xdc/0x114
> [   37.914059] sp : ffff800080003db0
> [   37.917375] x29: ffff800080003db0 x28: 0000000000000007 x27: ffff800080e50000
> [   37.924521] x26: 0000000000000000 x25: ffff0000016abb50 x24: dead000000000122
> [   37.931666] x23: ffff0000016abb78 x22: ffff0000016ab080 x21: ffff800080003de0
> [   37.938810] x20: ffff00000255bc00 x19: ffff00000255b800 x18: 000000000000000a
> [   37.945956] x17: 20747562202c3832 x16: 6362353532303030 x15: 0720072007200720
> [   37.953101] x14: 0720072007200720 x13: 0720072007200720 x12: 00000000ffffffea
> [   37.960248] x11: ffff800080003b18 x10: 00000000ffffefff x9 : ffff800080f5b568
> [   37.967396] x8 : ffff800080f5b5c0 x7 : 0000000000017fe8 x6 : c0000000ffffefff
> [   37.974542] x5 : ffff00000fea6688 x4 : 0000000000000000 x3 : 0000000000000000
> [   37.981686] x2 : 0000000000000000 x1 : ffff800080ef2b40 x0 : 000000000000006d
> [   37.988832] Call trace:
> [   37.991281]  __list_del_entry_valid_or_report+0xdc/0x114 (P)
> [   37.996959]  ti_csi2rx_dma_callback+0x84/0x1c4
> [   38.001419]  udma_vchan_complete+0x1e0/0x344
> [   38.005705]  tasklet_action_common+0x118/0x310
> [   38.010163]  tasklet_action+0x30/0x3c
> [   38.013832]  handle_softirqs+0x10c/0x2e0
> [   38.017761]  __do_softirq+0x14/0x20
> [   38.021256]  ____do_softirq+0x10/0x20
> [   38.024931]  call_on_irq_stack+0x24/0x60
> [   38.028873]  do_softirq_own_stack+0x1c/0x40
> [   38.033064]  __irq_exit_rcu+0x130/0x15c
> [   38.036909]  irq_exit_rcu+0x10/0x20
> [   38.040403]  el1_interrupt+0x38/0x60
> [   38.043987]  el1h_64_irq_handler+0x18/0x24
> [   38.048091]  el1h_64_irq+0x6c/0x70
> [   38.051501]  default_idle_call+0x34/0xe0 (P)
> [   38.055783]  do_idle+0x1f8/0x250
> [   38.059021]  cpu_startup_entry+0x34/0x3c
> [   38.062951]  rest_init+0xb4/0xc0
> [   38.066186]  console_on_rootfs+0x0/0x6c
> [   38.070031]  __primary_switched+0x88/0x90
> [   38.074059] Code: b00037e0 91378000 f9400462 97e9bf49 (d4210000)
> [   38.080168] ---[ end trace 0000000000000000 ]---
> [   38.084795] Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt
> [   38.092197] SMP: stopping secondary CPUs
> [   38.096139] Kernel Offset: disabled
> [   38.099631] CPU features: 0x0000,00002000,02000801,0400420b
> [   38.105202] Memory Limit: none
> [   38.108260] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt ]---
> 
> Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
> Suggested-by: Sjoerd Simons <sjoerd@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>


Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk


> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..0e358759e35faac95d1520e14a75096375c806bb 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -619,6 +619,7 @@ static void ti_csi2rx_dma_callback(void *param)
>  
>  		if (ti_csi2rx_start_dma(csi, buf)) {
>  			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
> +			list_del(&buf->list);
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  		} else {
>  			list_move_tail(&buf->list, &dma->submitted);
> 
> ---
> base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
> change-id: 20250630-j721e-dma-fixup-5b4f9678b7a6
> 
> Best regards,


