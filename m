Return-Path: <linux-media+bounces-39414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E47B201E8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5E83B2D2A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB91D2DAFB4;
	Mon, 11 Aug 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q5bjIv23"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209982D5C9F;
	Mon, 11 Aug 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754901324; cv=fail; b=mti3rQqDAJ1+29sEp/zJ3pE6quiYKs9X1jpbpJwOH/6gjMzelMUvE91rtxDlIWvuL0WRo0OGxRyg+llgDSIBGjmOjPvDHJfGe/5HLEKYGu5poCrWKMWjXk4nKJzWLShB8LQ/rUkENFiijF0SkR0yTsfUdSUb0syAK+xoHuko0ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754901324; c=relaxed/simple;
	bh=F4nufpBCcunBI5KO9Lfs1MFg/U0ykAvzbVTFtyMP5qk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Icp5ocbbAa60dvSO0c16YVpTr6hlFZYJx7qDMi3+HBNOK6k7jmHJN6VmiyBcw00ifC5MWhiYiwEk2bfSI9MvH1LbUF/tHpdOiQCRkmCkKldctnxiPz7luLnbfrxFIC6js0o9M+L2mTdglUkcSOKs7QFIeomgKr8TpJCBkMdLAXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q5bjIv23; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLJGmvUaIYa/UiYl7R0Ek2uLVXf5pAF+fuhuowdAq6bwQ3ws9WE0uxTh2QkqG1Li9vNZlvEP2FlD2S3xZwCVcW6zJCXIEho0ZXLg4Vx2ZpB+X4BkUO8ocu+YzlgXGd+ANXEIUPm3+m68k+DGAZmNIm5KZGn3kPaImssuqovLK5W+FzJFH7Xb6PEXk+bx4wVcMMZVi5bbTM5qq/mjUgfrqIrx0+b2vSnlBq5EYUqRby1dcn3iX8yf03smGY9l9QT9QrxsIGqMa4cfM8Xg9zaFcxww85Ie5sTf35QBM6ShUT0EDlFNzw3o+6CO5qWIowjJZ1toW0f38RAAT6hD8pkjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlXYNZK0ui02djRrW8Jk1p4p6tDTdpjdmMyKa6u2F8Q=;
 b=B18zZGmLtSQ+gM7fINwPUruIQkJIpuLNggf6G8JuaCM49RLl8XBin/mzjRTgeNE4oJ1eEVbjrhi2Zt3vg+s+7WHgMvC23Hjf9w9frf0TLQT0/n4oWvKVTnmVUCOCYvb91EjO7IfjlpY2xa4+bm+5x1+9K+Aao7NXwzMVrY7qVLnIQMGYJD741TGBAM++vOL1M2kZJFzejWmNhOk0mN6O+IUbOiOfdB1TsJsVhuRYTNTrs7tW4U2vrSobeRtcZbh3ptfHxXHHxXX/QGxki4KKk8wu8hZuvvGL+PVYw132Uv9OCi7gdUYl26EdRCO6NkKnK+Tl/B3c13np5xCVxJJqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlXYNZK0ui02djRrW8Jk1p4p6tDTdpjdmMyKa6u2F8Q=;
 b=Q5bjIv23X4HdOMdY0MJ5VxHF7nCOtQ7jTiRdkHQ3ZWMoNbpNliA4CGfxqz/X1rb2StfjtNlMWxKHOqnFhPBJgzIS4VY6EFPkcy1aiUsVhEvkR5I86SdcPU3G73XF82J86ZIZQ8U6pHqiC3yrHtWWjQesGReMnDG8NO7OnDQWcJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 08:35:19 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Mon, 11 Aug 2025
 08:35:19 +0000
Message-ID: <f85fce70-64d6-4d33-9483-c8e6dc8a79bc@amd.com>
Date: Mon, 11 Aug 2025 16:35:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com
References: <aIh7WB0TGNU15Zm1@sultan-box> <aIh8JPTv9Z5lphRQ@sultan-box>
 <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com> <aImvvC9JEgQ2xBki@sultan-box>
 <a3272335-1813-4706-813e-a79a9cabc659@amd.com> <aIq5EyQ_uuO63dJb@sultan-box>
 <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
 <d8c99b00-e8f2-49bb-8c72-ebc4e783e51d@amd.com> <aJA2S0EY7HhVSSzc@sultan-box>
 <17464bff-6b3e-4962-8b83-132cd7367d1d@amd.com> <aJmEaXkXDtfkVQiR@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJmEaXkXDtfkVQiR@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: f95ad934-c314-43be-62ee-08ddd8b200ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0dzR0pnMEtnOGtlMWFFd1IzTysxb29Pd0xzd1FOUjY2b2U4cUwvL0JScHkr?=
 =?utf-8?B?RDVoV2F2VnNlV3dTMnNsSlQrQmRhVUhSUjRLQnFSenNycWZ6a1VRU2NtVmJ5?=
 =?utf-8?B?Ri9UeFRxSGsxUy9IUEVsNTRRcFl4ODZ4aWNHYjRBcnlBZXlxbkE1RFRpelQv?=
 =?utf-8?B?RWdsR2M1YmdEZ2IrKzVWYXBBQzZNRXRhK3Y4d2ljOEFUOTVtYkl4SkYyUnJ5?=
 =?utf-8?B?UGZtUmgrN2JKNUZzcXAvS3Uwc2hQa3RNRnVzdXZ2VXVXUHdtaDhsUnZyMWVo?=
 =?utf-8?B?NXlJaDJUSXh1c2dKOTRaT3JMY2Q2OUtpU0QzNnlvRGJkU1pwNS9mZFdycGlQ?=
 =?utf-8?B?RjVGUDdBeWVLRUt2WXZVNWQ3a3N4Kzd0NUNGZncxOGpwWGV3NmpyTlFaYzhj?=
 =?utf-8?B?cGtJREVqaTNTd3h3MEh1dDlpMXFJTTBzZEtKN253OFBpcjRUUXo2U0t2VjUv?=
 =?utf-8?B?YThadHJpaUliN0s0UzVsWEhESTIycXZmdEg0NnYvcjF1dElnejFBWFh4QU44?=
 =?utf-8?B?YURmYXhYMTFLVHlKUnJ0QllKazVFbFE2RHU4SHhnb2QydUk1Z0tZYjhrNVVr?=
 =?utf-8?B?L1UvYXhxekxJbUw4U2Z0SFhzL2VTK0lEc25xVGlDZEFYME5wNFhOOU1iV3dq?=
 =?utf-8?B?ZFAxU3RmYVFWUlR4bjcwZHFCOEEvaEo2OVVGdForR2hieXJORHNhS3Jyd3lz?=
 =?utf-8?B?M1JLbEpUSm5qbCs1WEJRSndJc0FTbGY5eFcvdUl1OFJNU3lrM1dGdTFudnVi?=
 =?utf-8?B?ZXVER0srMVpuNTZJMDZNd05vWWJRdXZPOVFVNmU1bWF5dy8wMm9HbERpMzJh?=
 =?utf-8?B?UkNCZGJaLzNrOGNnM0V0b3J5ZTI0dCtzUTBxem9IalhXUWFJM21CT2VFUUJ0?=
 =?utf-8?B?WDRUS2NyM1NiL2p4bE5CMkM0eWhOd0pPSHBpZ3ZLK0dramVyWlQ4eXdQcFNj?=
 =?utf-8?B?NmVMMmkzaGlmT0VvNlI0dXVodFB1UkRXOG5Wb3JUenBNWUpZazkvQm1UczFi?=
 =?utf-8?B?OXFOcWRSSzRlVUQ0TWJrd09EVnBpeWNjMmxzS0F4aXVWTDJNNW95SmIxR0c0?=
 =?utf-8?B?RStLMEN5REhUV05keFVGU1N0aXJXVXRjZnBSMGdLaitvaitYVTVLb3hVbkpi?=
 =?utf-8?B?V0FROVZzV1d0UU9kajRhTFVjdDlrb1hySjRBdGw2dXhSblR5UXdYdVNqMytJ?=
 =?utf-8?B?MFJCQWdheXFtc25ybGR0ZEVEWFlqTGJjR3RCV2lrRUl0YzZHa25QQ2dPZU1m?=
 =?utf-8?B?S0VEQSsvZjQ2cTFnSlFmUmJNeHJMY010eVVCN0ZueWN4Z3NGQXVBelIrTVZW?=
 =?utf-8?B?Yk1GZjV5eTJaR2pncG1KU0poQWJmSUFsSnhnRVpkWUdDaE80TDdTYmw2QmNG?=
 =?utf-8?B?NXMyWGFlMG00R1JjNFhISlBGNm5qdDB3V1QzZGFxWVlObGpPMCtLeTVsSHhO?=
 =?utf-8?B?eHdycUFvVENOOFRsNkowaXF4aTNaVFBwQ1lnVXNJMnM2VlVMT2Q2V292OTY0?=
 =?utf-8?B?N1RKakdRSkZKUGlPNkdRQSt4Wms3RW5Na2l0SFJjbHMvMzlVeWFLd0dKdUEx?=
 =?utf-8?B?VzdMTXlOL2tPNFhTdVFDdHNpZDl2VE9HZTlNcGlhMWs0aFZiSG1DZVd2RVBT?=
 =?utf-8?B?ZDRrTjkrdHIzdjg5SkJnWWRJSUo2WDdHQUtML3cxMlFwTWlYR0phQTB6amN2?=
 =?utf-8?B?bzFSYmk1Y3NWTkNWckdGMWNrUThsY0g5TVA1cnhtQldBdVhEdlMxenhYMTJ5?=
 =?utf-8?B?SkNkOUtyMUFHZDdjT2hlSUV2dTdsWWNhN3I1VUNPaHlDMmF1RDBJbzB2bW1E?=
 =?utf-8?B?T0ZvMUJnZS9ad3lvQmhsL0NaTml5aG9zRGYxQ20vQWJpM3Bmd2dBS1pJcG1v?=
 =?utf-8?B?UkdoNm9VaUd2a25LaWJjbE5jcTYya29yTWVzRnJjUmVrWDlwZjRMU3l1TkQ4?=
 =?utf-8?Q?eP0GQKoeJGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWNNNGtGSURIOWlDMlFmY3pnZWpUc20wcTh2bnh6N3RFVlA4MGcxUmVqRkhi?=
 =?utf-8?B?bzRjSXVoRkFranRXTGc0dktpOStyQm95aW9tYWtpNkc4dUtaeTJyR3hINlRo?=
 =?utf-8?B?VVBMVGJhR2hEQmZtVUNaM0NSLzRpaVNpZlFYZUNZZ2VMNEdncDd0NVpkajcr?=
 =?utf-8?B?dG5sSU9FclVkbVRaOWV4MzhTdEorRVRxdFhCazlUZzFIMWFrREYySnN2TktL?=
 =?utf-8?B?VXBPRldhd28vLzZ0WjJrN0o2dDRGM1VVeWN2TW5OWENPRExpcHhrL3F4OG9h?=
 =?utf-8?B?czU1KzlvZ0trZjdBZkdpc0Y2WHovZnVsOUdKdTRLZnhXZzI1OFFoa091L1ht?=
 =?utf-8?B?bzhSSlpYRkVpaHhscmlOeTZaZlVKdG4wSUVsWSs5Y0NkTnZxYW9IQU5PV0Vr?=
 =?utf-8?B?T3pYSkJzd3NkZE4zRStoMDFkZHVTSkROZzhycWdKd1dUS056RHpYRC93bEtj?=
 =?utf-8?B?Um5PczZxd3FQelcyN2Y2Ty82d3FHYWtBUTcvbnhwSFZlR2lsUDVzK2x3UjZK?=
 =?utf-8?B?ZDF1dEFoUU5Yb3NYUVF2aFVuZXpVUW1ubnNSK3pyUGVqV09JSDAyWVFaQzhw?=
 =?utf-8?B?eUxqUVRMdlRhc283V25wSXhoa0E3WmN1OVc5MHFSbm9wNldMRFd4WFlDd3U5?=
 =?utf-8?B?WFM3b2tqOTRmZXRRbGlSQ0J5S1JqQ2xOYXNWYWFwNVNSNmcyeXpyb0tlUjE3?=
 =?utf-8?B?R08ySVNHaWErMVJwdXZIcmNJbFZQbHBwam5scEttWmFNODZoMlZCQlhmYTRy?=
 =?utf-8?B?ZlFpcXYzWHFWcFkzdlJOeHY0Z0M3WFVYb0EzSEdsY21NcGFUR3VhajlqeXho?=
 =?utf-8?B?azhhK3hQSE5DK1dJL3FTYllLZDZMTnNpZkgxdnIzVmJtRU94a1RDSTVtOUkr?=
 =?utf-8?B?Y1hmd0hBRUZUY0ZlVE8rN0xqQXNXK1dTbmhQUkZRMSswQzFMdnZxbFI3Q3Ax?=
 =?utf-8?B?dlFWNzJ0LzRBblpXY3dwMDZSMUF3RExyRHJ6VjdKZTBwKzJIY0RBb2FydjhL?=
 =?utf-8?B?ZHFNek5GcEhlZDAzeXJ1YTNhWHdUaGR5cHU0VDArQ3dlM3ZtOTF0WGc4QklT?=
 =?utf-8?B?T0hGMGdRSzdFK0JEbzJSdzlreU5oNTdtREJkdDNnN1B4QklXd3FuUUZrVDRq?=
 =?utf-8?B?NkFlQ214Tjh4bFRwdlZKcysyM0pUdVAzVmdmUlNnU01vV1JlWWZndUdRR2o0?=
 =?utf-8?B?RmQ4RFpQVk1mTVpMTDFONDlTYmxpUHp1OXNoekRVMWUrTktNWTBTdTJBNm5i?=
 =?utf-8?B?RXFLZkhvUHdReTh0OER1bkFmcE1SYWRWcFNNSmoxc1lWQTJOYzkybXpIT1VB?=
 =?utf-8?B?V0Z6L2lzU0QwMVFDUTVIcmFrTy9oWnIxRkN0SFJKVjZadnVTeVJBblF6c0Vk?=
 =?utf-8?B?dDRzVkxkVEg3ejJjR0tOZmp2OXR6d3FnS2hnNmk4N2ZReVdKbzBFcHFiT3Mx?=
 =?utf-8?B?VnB4a3JRZWVYbHRGVzBjdVR0MjljUmJCWjJXSHRJdHJ5YklHbUhDTkpReHdx?=
 =?utf-8?B?OGFpL1dsVDJVVTZWZGY5OENtaVhXWWhQWElyNk5VLzJselhvbldqcDJ5Wk9T?=
 =?utf-8?B?dkRIaDRPM1JaOUg0YzA5U0JSa2ZNNWJkbTRLNyttaHY1L0g4RktxRnBVWXV0?=
 =?utf-8?B?NENIZTJVb2JyREtqTmRESkdXT3BJZ0Z1VlBpdzJyUWNINDVGUU5rdkNBaG9u?=
 =?utf-8?B?TENzRThLNExkc3pCVUVpbUlsOWJYUjdaaW9XOHB5TStDUGk4SmFCQWxiem1V?=
 =?utf-8?B?L0duK3FDREFSZGwvOGsyZ0FpNDRUajNKTldCU1dpUG9icmJwY3Z0cGpoalc1?=
 =?utf-8?B?SEp3bzU4c285bHlvcGF6d3Ezck5NQmViYUN6ZndrZGJsTHRveU83bXJhRzhH?=
 =?utf-8?B?NzJ3MzlBcGc0bXBVWktnT0hRWnFkOEZuMklKRkc3VlI3dGltOHczM3dxMDY4?=
 =?utf-8?B?ZkRQZE9tbnVybEJ0YXR5cFdyMUdYS0p6QzdyVkEwMU13WDdFelliUE5Tb05z?=
 =?utf-8?B?RVhsaDl2SHVxRlo1SEdCNDBqaW80SXZGWVE5S2NqRDRYK0MyQXcvSmxMYVd0?=
 =?utf-8?B?cVYwMDhGaTVoVUgwYWlVU0prWE5vdVJzNU44S3NWUlMvSjFRWVVJWTd5cEVh?=
 =?utf-8?Q?v4+8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95ad934-c314-43be-62ee-08ddd8b200ba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 08:35:18.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vycOJB7aHobYGrCP7jFsOc+OqTUnn4FxHaCpe7djftOPuM0nxseczoJ3rkdKgJuX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013

Thanks Sultan.

On 8/11/2025 1:49 PM, Sultan Alsawaf wrote:
> On Fri, Aug 08, 2025 at 05:11:39PM +0800, Du, Bin wrote:
>> On 8/4/2025 12:25 PM, Sultan Alsawaf wrote:
>>> On Mon, Aug 04, 2025 at 11:32:11AM +0800, Du, Bin wrote:
>>>> On 7/31/2025 6:04 PM, Du, Bin wrote:
>>>>> Thanks Sultan for your test
>>>>>
>>>>> On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
>>>>>> On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
>>>>>>> On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
>>>>>>>> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>>>>>>>>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>>>>>>>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>>>>>>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>>>>>>>>> Thanks Sultan, please see my comments
>>>>>>>>>>>>
>>>>>>>>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>>>>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I cannot for the life of me get
>>>>>>>>>>>>>>> the webcam working under Linux.
>>>>>>>>>>>>>>> The webcam works
>>>>>>>>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> With this patchset and all of
>>>>>>>>>>>>>>> the patches you link here
>>>>>>>>>>>>>>> applied to 6.15, I get
>>>>>>>>>>>>>>> the following errors:
>>>>>>>>>>>>>>>          [   11.970038]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware: Unknown
>>>>>>>>>>>>>>> Synopsys component type:
>>>>>>>>>>>>>>> 0xffffffff
>>>>>>>>>>>>>>>          [   11.973162]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware: error
>>>>>>>>>>>>>>> -19: i2c_dw_probe failed
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> With the old ispkernel code from
>>>>>>>>>>>>>>> February [1] applied on 6.15,
>>>>>>>>>>>>>>> the webcam
>>>>>>>>>>>>>>> indicator LED lights up but
>>>>>>>>>>>>>>> there's no image. I see these
>>>>>>>>>>>>>>> messages at boot:
>>>>>>>>>>>>>>>          [    9.449005]
>>>>>>>>>>>>>>> amd_isp_capture
>>>>>>>>>>>>>>> amd_isp_capture.1.auto: amdgpu:
>>>>>>>>>>>>>>> AMD ISP v4l2 device registered
>>>>>>>>>>>>>>>          [    9.489005]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>> The OV05 sensor device is added
>>>>>>>>>>>>>>> to the ISP I2C bus
>>>>>>>>>>>>>>>          [    9.529012]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>>>          [    9.554046]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>>>          [    9.554174]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>>>          [    9.580022]
>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> And then the kernel crashes due
>>>>>>>>>>>>>>> to the same use-after-free
>>>>>>>>>>>>>>> issues I pointed out
>>>>>>>>>>>>>>> in my other email [2].
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Any idea what's going on?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>> https://github.com/amd/Linux_ISP_Kernel/commit/
>>>>>>>>>>>>>>> c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>>>>>>>>> Hi Sultan,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> [1] is for kernel 6.8, believe it
>>>>>>>>>>>>>> can't be applied to 6.15. We didn't
>>>>>>>>>>>>>> verify
>>>>>>>>>>>>>> on 6.15 but we are really glad to
>>>>>>>>>>>>>> help, would you please provide some
>>>>>>>>>>>>>> info,
>>>>>>>>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>>>>>>>>> 2. 6.15, do you mean
>>>>>>>>>>>>>> https://github.com/torvalds/linux/tree/
>>>>>>>>>>>>>> v6.15 ?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> After your confirmation, we'll see
>>>>>>>>>>>>>> what we can do to enable your camera
>>>>>>>>>>>>>> quickly and easily
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>> Bin
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thank you, Bin!
>>>>>>>>>>>>>
>>>>>>>>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>>>>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>>>>>>>>
>>>>>>>>>>>>> I have some more findings:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Currently, the first blocking issue is
>>>>>>>>>>>>> that the I2C adapter fails to
>>>>>>>>>>>>> initialize.
>>>>>>>>>>>>> This is because the ISP tile isn't powered on.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I noticed that in the old version of
>>>>>>>>>>>>> amd_isp_i2c_designware [3], there were
>>>>>>>>>>>>> calls to isp_power_set(), which is
>>>>>>>>>>>>> available in the old ISP4 sources [4].
>>>>>>>>>>>>> Without isp_power_set(), the I2C adapter
>>>>>>>>>>>>> always fails to initialize for me.
>>>>>>>>>>>>>
>>>>>>>>>>>>> How is the ISP tile supposed to get
>>>>>>>>>>>>> powered on in the current ISP4 code?
>>>>>>>>>>>>>
>>>>>>>>>>>> You are correct, yes, i believe the I2C
>>>>>>>>>>>> adapter failure is caused by ISP not
>>>>>>>>>>>> being powered up. Currently in latest code,
>>>>>>>>>>>> isp_power_set is no longer
>>>>>>>>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>>>>>>>>> https://lore.kernel.org/all/20250618221923.3944751-1-
>>>>>>>>>>>> pratap.nirujogi@amd.com/
>>>>>>>>>>>> Both amd_isp_i2c and amd_isp_capture are in
>>>>>>>>>>>> the power domain and use the
>>>>>>>>>>>> standard runtime PM API to do the power control
>>>>>>>>>>>
>>>>>>>>>>> Thanks for that link, I found it along with
>>>>>>>>>>> another patch on the list to make
>>>>>>>>>>> the fwnode work ("drm/amd/amdgpu: Initialize
>>>>>>>>>>> swnode for ISP MFD device").
>>>>>>>>>>>
>>>>>>>>>>>>> Also, I noticed that the driver init
>>>>>>>>>>>>> ordering matters between all of the
>>>>>>>>>>>>> drivers
>>>>>>>>>>>>> needed for the ISP4 camera. In
>>>>>>>>>>>>> particular, amd_isp_i2c_designware and
>>>>>>>>>>>>> amd_isp4
>>>>>>>>>>>>> must be initialized before amd_capture,
>>>>>>>>>>>>> otherwise amd_capture will fail to find
>>>>>>>>>>>>> the fwnode properties for the OV05C10
>>>>>>>>>>>>> device attached to the I2C bus.
>>>>>>>>>>>>>
>>>>>>>>>>>>> But there is no driver init ordering
>>>>>>>>>>>>> enforced, which also caused some issues
>>>>>>>>>>>>> for
>>>>>>>>>>>>> me until I figured it out. Maybe probe
>>>>>>>>>>>>> deferral (-EPROBE_DEFER) should be used
>>>>>>>>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>>>>>>>>
>>>>>>>>>>>> amd_isp_capture only has dependency on
>>>>>>>>>>>> amd_isp4 which is the ACPI platform
>>>>>>>>>>>> driver, it is init before amd_isp_catpure.
>>>>>>>>>>>> Do you see in your side the amd_capture
>>>>>>>>>>>> probe failure caused by failing to
>>>>>>>>>>>> read fwnode properties? If that's the case
>>>>>>>>>>>> please help to check if amd_isp4
>>>>>>>>>>>> is loaded successfully
>>>>>>>>>>>
>>>>>>>>>>> I got much further now: there aren't any driver
>>>>>>>>>>> initialization errors, but when
>>>>>>>>>>> I open the camera, there's no image. The camera
>>>>>>>>>>> LED turns on so it's active.
>>>>>>>>>>>
>>>>>>>>>>> And then shortly afterwards, amdgpu dies and the
>>>>>>>>>>> entire system freezes.
>>>>>>>>>>>
>>>>>>>>>>> I've attached my full dmesg, please let me know
>>>>>>>>>>> what you think. Thanks!
>>>>>>>>>>
>>>>>>>>>> I almost forgot, here is my current kernel tree:
>>>>>>>>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-
>>>>>>>>>> sultan-isp4
>>>>>>>>>>
>>>>>>>>>> Sultan
>>>>>>>>>
>>>>>>>>> Thanks Sultan, yes, seems much close to the final
>>>>>>>>> success. Will have some
>>>>>>>>> internal discussion.
>>>>>>>>
>>>>>>>> I got the webcam working. The same bug happened when I tried
>>>>>>>> Ubuntu's linux-oem
>>>>>>>> kernel, which made me think that the issue was firmware.
>>>>>>>>
>>>>>>>> And indeed, the culprit was a firmware update from February. I bisected
>>>>>>>> linux-firmware and found the commit which broke the webcam for me:
>>>>>>>>
>>>>>>>>       commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
>>>>>>>>       Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>       Date:   Wed Feb 19 12:16:51 2025 -0500
>>>>>>>>
>>>>>>>>           amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>>
>>>>>>>>           From internal git commit:
>>>>>>>>           5058202443e08a673b6772ea6339efb50853be28
>>>>>>>>
>>>>>>>>           Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>
>>>>>>>>        amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
>>>>>>>>        1 file changed, 0 insertions(+), 0 deletions(-)
>>>>>>>>
>>>>>>>> Downgrading firmware to before that commit fixes the webcam.
>>>>>>>> Any idea why?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Sultan
>>>>>>>
>>>>>>> So, can i say the working firmware binary is this one?
>>>>>>>
>>>>>>> Commit 8f070131
>>>>>>> amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>
>>>>>>>    From internal git commit:
>>>>>>> 39b007366cc76ef8c65e3bc6220ccb213f4861fb
>>>>>>>
>>>>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>
>>>>>> Correct.
>>>>>>
>>>>>>> There are too many changes between them, so i can't tell exactly which
>>>>>>> change caused this. So, from my side
>>>>>>> 1. Will try these two firmware to see if we have the same issue.
>>>>>>> 2. It has been quite a long time since last release, will see if need to
>>>>>>> release a latest one.
>>>>>>
>>>>>> Thanks. It was a quick bisect for me, so I'm happy to help test if a
>>>>>> bisect
>>>>>> between those two internal git commits is needed.
>>>>>>
>>>>> Really appreciate your test.
>>>>>> In case it makes a difference, I have the laptop with the 2.8K OLED
>>>>>> display. I'm
>>>>>> aware there is one other display variant on other SKUs, which is a
>>>>>> WUXGA IPS.
>>>>>>
>>>>> Good to know, I believe it won't make any difference for ISP
>>>>>
>>>>>> Also, with that old firmware, my camera only works with the old isp4
>>>>>> driver from
>>>>>> that Linux_ISP_Kernel repo (which is the same isp4 driver used in
>>>>>> Ubuntu's
>>>>>> linux-oem kernel). Does the new isp4 driver you've submitted here
>>>>>> require newer
>>>>>> firmware than the old driver located in Linux_ISP_Kernel?
>>>>>>
>>>>>> Sultan
>>>>>
>>>>> We had a try, yes, both of the old FW can't work on the new ISP4 driver,
>>>>> as you know, for the last months, we did lots of driver modifications
>>>>> for upstream and cause it incompatible with old FW.
>>>>> Now, under internal discussion to upstream a new FW to support the new
>>>>> ISP driver
>>>>>
>>>>> Regards,
>>>>> Bin
>>>>>
>>>>> Hi Sultan,
>>>>
>>>> This is the conclusion of your test,
>>>> Driver: https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>> [1] It works on FW      8f070131(ext):39b00736(int)
>>>> [2] It can't work on FW 1cc8c1bf(ext):50582024(int)
>>>
>>> Correct.
>>>
>>>> Would you please help to check if CONFIG_VIDEO_OV05C is defined not in the
>>>> .config file when building the kernel? Our assumption is to make [1] work,
>>>> CONFIG_VIDEO_OV05C shouldn't be defined. to make [2] work,
>>>> CONFIG_VIDEO_OV05C should be defined.
>>>
>>> Yes, it is enabled and I have only tested with it enabled:
>>>
>>>       $ rg CONFIG_VIDEO_OV05C linux-oem-6.14/.config
>>>       CONFIG_VIDEO_OV05C=m
>>>
>>> That's the Ubuntu linux-oem-6.14 kernel. You can get the full source and .config
>>> I tested by running the following commands:
>>>
>>>       git clone https://git.launchpad.net/ubuntu/+source/linux-oem-6.14 -b applied/6.14.0-1006.6
>>>       cd linux-oem-6.14
>>>       python debian/scripts/misc/annotations -e --arch amd64 > .config
>>>       make olddefconfig
>>>
>>> Let me know if that works.
>>>
>>> Sultan
>>
>> Thanks Sultan for the details, yes, we can reproduce the same issue on old
>> isp driver 4.0 release on FW 1cc8c1bf(ext):50582024(int), after debug, the
>> cause is
>>    - ov05c sensor device is added by amd i2c driver
>>    - When ov05c sensor driver probes, it will try to get gpio description but
>> it will fail because the amd-pinctl driver which creates the gpio resource
>> hasn't been loaded yet.
>>    - the ov05c sensor driver probe failure will finally make sensor not able
>> to work when start streaming
>>
>> Add following patch is supposed to fix this issue to make it work on FW
>> 1cc8c1bf(ext):50582024(int) when CONFIG_VIDEO_OV05C is defined.
>>
>> @@ -1121,6 +1129,7 @@ static struct i2c_driver ov05_i2c_driver = {
>>
>> module_i2c_driver(ov05_i2c_driver);
>>
>> +MODULE_SOFTDEP("pre: pinctrl-amdisp");
>> MODULE_ALIAS("ov05");
>> MODULE_DESCRIPTION("OmniVision OV05 sensor driver");
>> MODULE_LICENSE("GPL and additional rights");
>>
>> Please help to see if it works if you get time.
> 
> There is no difference I'm afraid. I applied the patch and tested with FW
> 1cc8c1bf(ext):50582024(int) and the webcam is still broken on that FW:
> 
>    [   19.523006] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:0)|start_streaming
>    [   19.537000] amd_isp_capture amd_isp_capture.1.auto: ISP FW boot suc!
>    [   19.537009] amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
>    [   19.537050] PHY register access test success!
>    [   19.537901] Termination calibration observability: 0x0
>    [   19.539926] Wait for phyReady: 0x0
>    [   19.541932] Wait for phyReady: 0x1
>    [   20.901654] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>    [   22.070676] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>    ...
>    [   28.769372] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:1)|stop_streaming
>    [   28.769388] amd_isp_capture amd_isp_capture.1.auto: amdgpu: stopping Phy
>    [   28.769868] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[1]
>    [   28.771799] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[0]
> 
> Sultan

That's really weird, I tested kernel built from 
https://github.com/amd/Linux_ISP_Kernel/tree/4.0 with 
CONFIG_VIDEO_OV05C=m and above sensor driver probe failure patch on FW 
c8c1bf(ext):50582024(int), camera APPs like cheese, qv4l2, Camera all 
work well.

Your failure still looks like sensor related, Would you help to add log 
to sensor driver drivers/media/i2c/ov05c.c to see if its probe function 
gets called and succeeds? Here is the log in success case,

amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
PHY register access test success!
Termination calibration observability: 0x0
Wait for phyReady: 0x0
Wait for phyReady: 0x1
amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting camera sensor
amd_isp_capture amd_isp_capture.1.auto: isp_intf_start_stream,cid:0,sid:0


Regards,
Bin

