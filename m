Return-Path: <linux-media+bounces-41638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44AB4183F
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 467F67A70CE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B642E764D;
	Wed,  3 Sep 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wk0G5I3n"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C22D97A0;
	Wed,  3 Sep 2025 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887656; cv=fail; b=EFVw28J1j0BizW4rR809ARzkhuy1xb9F6UCYahPyqvh8EmsH8hg7Xk52jHJvRN0y2V8TMSR9UzgA/vniFyyKphnseFliCo7JKbXryx2cXaUBkXyJHWJ0LgJ1+iJy1BmcXS9y2UFqIv0ca4Nt00nhQ0V+1qedsdxB0LQOyGwPFTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887656; c=relaxed/simple;
	bh=N/8CEvxaRRC4q/OkrShW3zhItt0LtcgWPezKLxmJ2xs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1gyLtoeNJCAzSbVmskx8gbHPQob6E2VLYtfTgDsXQreFgHJ+q+qWX8lX3MndPCRum2Q0gyX+Uuxqy93P3uOc4ImwUNq1IeC2xDFOXsMTJqve92nU/QU3elhR/3GTlRc4bsaLUWFFtPTsKkdFWYZp58GYGD3zBI5ZYKVytCP8cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wk0G5I3n; arc=fail smtp.client-ip=40.107.212.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViNKz947/WgTLJxhg3nEjWZAIdXTPXVrJaeUbRDB0H+Dq8KrqbvK+j96l2QPCcmvX0Z60SxhM1C3ulCttOVEemQKPHLl1KUBsT40oTbXcfYmwuxjGK9DSLZsbRWp8d8otls5wgggbCKrJts1ecfTjFNK4jFNexPDGu0Ka58mbo/wKGuV1cNMmS9wGhxWQH+r/VlOqnfev+uDf0e929R0bl2hJhh3Rlvk2uUdMlWZzyqBfG9JR6VvDlj+ZYuc9Y2LswxYURKrp03+a2cFkraHYAjqCBLizGhz46j7a801MUi9FDxi+SVGg6nD75MA3g+h0NphCeHD4nlhE1FPqFXNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75ycDMrg7Rx5EtjfpJpLaLODkezsAgoirrNKZzWQfu8=;
 b=H8KUqYV3sAOg0coZ1ktCA+ZL0mdDPydV1ojLr7L0zS3y9dI7PoL5VxHEUA7VYVJd8gITqWT46RO+wDSlA1kyCrghVSX3lRa3TR4S9SkDv/UNLv+XUXzXvpmh27H909X6/yW2YBQnNAsue5+oORcLwYtKCHzVL06xw1GoW+cAqVWWra4CQfPDHY9CxaRqZlxTlmRPfcVj4hcyGQO902xL6lwquaLHLxmnUl4mHsQVfSGF+0Rs7BVgz1Xj9jFHzqcvVAQCCAaYm8/TE+1PbV5nvXySy35X3DMuB3pVb0tOO30F28WzbMB0qGbc0mjRbNKe5QQwlomhiPkli2SAHVnwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75ycDMrg7Rx5EtjfpJpLaLODkezsAgoirrNKZzWQfu8=;
 b=wk0G5I3nuR/BLqMlcmhSqjxJ4BF0ZzT4gZLIuw4kfElpwSHONFAh6uEhItWoY1ZExrszM9kzXabiO+A/QgrPUuycAXHfUQ/+GYEn57frJ+VmGgNQVHfxOiOV43+2TUE1yo1uQgXWnrto9RufjyheOv2F6HRHn62AWgk6WewVsrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:20:51 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:20:51 +0000
Message-ID: <a581b619-ecb7-4210-b025-9516d0fb0c64@amd.com>
Date: Wed, 3 Sep 2025 16:20:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250902124932.GN13448@pendragon.ideasonboard.com>
 <2464e531-6ef3-4d27-8053-5e4874a15b8c@amd.com>
 <20250903075152.GA13448@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250903075152.GA13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb36a2b-5c15-4f61-19e0-08ddeac2cafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2Z0d0FzV1piZTdEZkMyOU0waDZWdEN2UXpiRWF6S09PVCtFZGFYcG5SUWcw?=
 =?utf-8?B?NUk2YjZtV0dLOUFxdUZoaTVHdTJmUmFuVkYrQ3JJOHM2aFdtQkdZUEIzK3gw?=
 =?utf-8?B?RkNTaEpFWE9Ja0tuSGRiUWFHY2o1Q3cyUVJrMjZyRFJzUlBqd3NVUnBoM1dv?=
 =?utf-8?B?OUhadmkvckdyNUkzYW1DR1pwdXRTK1JnL0M1KytJR09uSU53b3R2d3ZMWEZy?=
 =?utf-8?B?QktlNFZ4bzJ2d3JEaGtuWStpTjBZNHl4UWZvTUxvMktrdWZxTDhoV0c4dFFP?=
 =?utf-8?B?cERhaWVqaDI3VWVwMUZTL01VSVBHU0wvTVlBZjlZMmhzRHphb2d4RHJ1cFRV?=
 =?utf-8?B?SFcrL29VRE5CbitrY25WZTN5UzVRQzFFV1M3Qjl3bGpHblhhVmNyZFBoNkU0?=
 =?utf-8?B?c0phN0pndTBZczRpNXJWOS9sbEU1YXlPRnlEZCt1S1FVQ2lMSEFuMHN3b3o2?=
 =?utf-8?B?dEZ5V1h6ejNxSTBPeGJUWkU0THA3QmVzVWdmbUZpcStvTitadFhKOXYrSWxx?=
 =?utf-8?B?TWY0RjNJc2FvZTFUWmNyQjhGeE5qYmtFSXFOWkhYUklnTHFaWldjV1FRcGtC?=
 =?utf-8?B?RDZCby9BSC93Ylp3RnNwY3ZsUHhzTUg4WTNzVWpvbzQweEdDdDZOZWRFRzlB?=
 =?utf-8?B?azJieEdKdWNEdVhQenc5KzBheFhJMUc5MVEyTjB1OWlaNVJNRXBXSVR1cXZh?=
 =?utf-8?B?WWRKWkxQZDBJZDF3ZC9rdlpGMFR1MjRUelI2VnlLampRM2hNQ3hUQmlicWdC?=
 =?utf-8?B?RDhzL2htc0tyUjJPeDU0WGVRNnZhR1prY2RNMkhsaXN1eE4yODZrdldHT25w?=
 =?utf-8?B?V3lGeHNjbHFBQmJKREVwZVNYZk1jOHVrRGFmZW9manl3eisxeG5DaU15Wk11?=
 =?utf-8?B?U2xXZGJGWjFMclhOVUpuQVhGeDNrTFlEOEhjM1pEQkJzYXM3NkllYUpsUS9I?=
 =?utf-8?B?eUxuQkNRazZkSmcwQk5KZFdGMVhINk0wZ0RVb1ZmTGpzQWcwbGYvTGFXK1Ra?=
 =?utf-8?B?M1hzSzlMalRuWGRwTXFmRVVpYk1VSmxNbHQ2STlSenZGYmdGSEFSVVlzMlhs?=
 =?utf-8?B?K1NKTkNaSEpzZkNFQWUzU0NXeEN2M3l2MlZOVGtlRUVNeW83WFlyRVk2NFpJ?=
 =?utf-8?B?OHp3UWp5SDF4Uk1OLzJ5Z1VxSHhaTEw4TndKbzJ5RVVuYzNhblVPbmFSOFFV?=
 =?utf-8?B?U3pKQWFXMUV3bUpteXBYLzBlSGpscTRqMklzWm05NXVDekI4OG1LSXYvTjBS?=
 =?utf-8?B?VjFrcW9kS3laZG11bFdLbEJoa0tkckh3WjEvV0lnN1NCN0RudmVvUnZQWWNx?=
 =?utf-8?B?Zm55bDRDRU9lbm5jcW9PQlJFNXdXZ3FtSnQ4WFNxdnQ2RDZFeFEvdHIwSjYx?=
 =?utf-8?B?ZE54VTcwMStHd0pON05TUTZFZDdWb2gxN0REQnNYenhxUENhRGNHOUpocSs2?=
 =?utf-8?B?c1hFeDZYaUh6a1pjUmpKQzF2Q1dVZUw2U2RBbG03VFNMdldrVXJHVmc0eFM0?=
 =?utf-8?B?RVNLaFp2NFJzWVpNMXhJQlVVWEZDZnhMRGU3clRpSzJwOVJMZmZFRVo3VHlU?=
 =?utf-8?B?eGtSaWEyL3FHYXZ5RVNEcGlBQlc4eFRNdFVsanZZZlppcnpqdGk1TjVCcWFa?=
 =?utf-8?B?dDViS2V4ZXpGd3ZwNnZSU3lHK1VTbExkRkg2VW4wYW14RFM5b1pDaXo3VzI2?=
 =?utf-8?B?dWVuNGpVNWE3aXdydGxXbHdJcmRwVi8rQ0QxYlEzSlFSQ0ZXRDBoNFNtWGRl?=
 =?utf-8?B?MGNSU1NSWEV6TUVQYWs4Q1puaXE0QWt3VVRyOUphVGpIaURZTTM0S1c5M1Vj?=
 =?utf-8?Q?8sjjjbn+BPFyuqbzl2feQnMbYtW2tUl+DccC8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a25YODdCc2U1ZHE2Y3lsNDRkaTgrd3JpMDlvdDB1ejFndWpuRmVIR3RHN0Zo?=
 =?utf-8?B?U0x2UHN2T3lHRklLeCs3TGhPKzJ4YWJUSExIdWFvUmlFTERTQm9BTTh2bHJo?=
 =?utf-8?B?VzJNTG9hTUdRMjByNDVTWkRDa2c1Y2ZQV1l4ajhNZDZMQnpOa2h0b1hGRmt1?=
 =?utf-8?B?MlZpdnpwQTNWOGhSK1dvcGVKTDlTeW9JQlQvdE1PUjRWekErV0dvc0V2cnVY?=
 =?utf-8?B?bExjb1hic2UvbHJDYWVTbWtBeHl3cjdzRE1Mb2xHLytueUtxeGpmRVZSWFpM?=
 =?utf-8?B?dy84S3J0TlFERXY4SnlqeDR2ZTlTeWtOdk5wUnNtNTV6Nnd2Ny91ZitKVG9N?=
 =?utf-8?B?WnhPWDM5ak5lS2Y5UGVjakdBbC9GWGRTWGprdm1YRFA1UEsvUWxHcEdRZU55?=
 =?utf-8?B?UDVWUEFPeFVUWDlNOWRSUVMvVmkvR1pMYWpET0NHQ2ZLb2RGUmphMG9SVndB?=
 =?utf-8?B?d0NIdk5lTElKdnBSd3RSUkR2ekFYdk9rVGhNY2c3Tms4TW9JY3NuaHNhYWNm?=
 =?utf-8?B?MHZnb3V6NTdmdjBiOU1vdkdsL1RsQUdvNkxLTytmbFJ5UytJU0tPTXRtREFH?=
 =?utf-8?B?SytqOHNTcGFha2JxSjFFdVZLUnNEdnF2U0JMZzFSYWtiYU5SSWFubWhkOUFw?=
 =?utf-8?B?THNyL0p5ekpSaWprL1k5eHFlMUVZVFZHeXVjbk0reDdDdG5LcEllYm1VbWRj?=
 =?utf-8?B?UmszWmpwOEtkVTM1QXhYUkZmemM0VitUeTNYaW9NVzMzdzc4dURjTVFDa043?=
 =?utf-8?B?MVNEOGlMQVZ4amZ6dlJpMGlkK0xLSWk1emE1Zjd1S1pRWHFLS1BCczE1emVa?=
 =?utf-8?B?bUFyMGp3OFZZdGdEK0plMXdyRWFrWHN5NXFiSVRONGhNZThPM2dpWmVGR29D?=
 =?utf-8?B?bTR6bWt0cFIzOUZ1NmRWenZEaUIySXJSVjZJTGMzTDA5QitsWTZ5L3ZDdzRx?=
 =?utf-8?B?am9CeHVFVTJqei8wb2p5MnNQMENqbldGclpTUHhJSVBXeFZVOFV4aUt2cjV4?=
 =?utf-8?B?Z3lEdVQ2Q0FOVWRCZ05kYnYxSVJOZWk2WkpkbFZDemZFempmUGd2WnVxbElx?=
 =?utf-8?B?TW1aRkgzOXdCR0hjK0hUR0ZLOXlKSE03VDRpbnh0RVBLMFBqcENZeklCdlZC?=
 =?utf-8?B?aGx3ZWpvYUxYZ1FOZTlqenEvNDVIMVA4RG5YVk84TTRsclJiVys4STNTczM1?=
 =?utf-8?B?MThKLzZUOThDQU5NQitQRHpJVUNJNmhVUDFrZ2dLejhQckUzZ3BWNlR3UEhW?=
 =?utf-8?B?bjZoYURmY2lQeGZ0bHNQajVlZElQbVFPaWM2VXZKWEU3bFMzQStCaHB6bXY1?=
 =?utf-8?B?QTRERDYrQzdoemQrYkx2SkZnb2RLd0NrMlA5eEh5V21aZm5zaVFBTnZsTDZm?=
 =?utf-8?B?MWczMHo4VTcrSkNVS1EvV1hrWFlXejU1aDR6cUE3eEU1ZDcydkZzS2xhbndS?=
 =?utf-8?B?SldsdjU0RDRRWkNQOUlrVUZCOE45VkRHeDdWMXFyMnY2Vnd2aHBUODRDWnJQ?=
 =?utf-8?B?dnJrVkxrMHh1YVlla2pzcnd5TUhEL1JFN3IwZGd2MXgrN2FxN1dJZ0lsRVVx?=
 =?utf-8?B?RGt6VUdack5iemRmWGZ2Y0xVTkFHL1VXSWE2NzkydnlDQ012VlphM0ZPRjlZ?=
 =?utf-8?B?UjBLek51ckJ6T3h0SU0wazNUc0FramhoeVFzTy9jcVpNTVArTEFLWDFhc1FG?=
 =?utf-8?B?Tjd2UW03ZjZvODN6SVk1Q3RTMlM3Y3ErcmlhV1JrUFUzQVNOcDhIZ1pXUnJl?=
 =?utf-8?B?QzdTL3RNek1Sc3BBK2hUbVREb3B0a3FEbnpBZXlDTUVmZTVvOUVqdUZDdUxI?=
 =?utf-8?B?SFd1NU9ReFd0TmJkNlh0THByUXhLM1dzSlhMb1N0cGJONzNRUUJBK2R4aHV3?=
 =?utf-8?B?SXlSUEdXUkg2dDBPcWd3bUxybGhSU2kwdFJwbk5GMjk0anpsVWVvMDdnWVpT?=
 =?utf-8?B?WVF4cVR6UG5wZm81UHIrRWhGMkRUaC9HVGxCMEkrSU9oNWRRazY4cHlyQUNa?=
 =?utf-8?B?cGtCcEMvT3pJdlZJTmhQcmJmS0pvdDFVZmNwOEhEbnpFcEZxamJadVc5dlF3?=
 =?utf-8?B?MlFVWG5CSFNFSGZuRE5WZUkwMytBVVZSZS8zYlU1OW1YUkoxMmZLTmlOMlFh?=
 =?utf-8?Q?U9Xc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb36a2b-5c15-4f61-19e0-08ddeac2cafb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:20:50.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k67yciHIJ425LxGGdS71ESv2sD6mUxHx86bkocU0xUtWbNx9zI5xz3wJY+uZN9AG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413



On 9/3/2025 3:51 PM, Laurent Pinchart wrote:
> On Wed, Sep 03, 2025 at 11:22:27AM +0800, Du, Bin wrote:
>> Thanks Laurent Pinchart
>>
>> On 9/2/2025 8:49 PM, Laurent Pinchart wrote:
>>> Hi Bin,
>>>
>>> Could you please provide the v4l2-compliance report (please use the
>>> very latest version of v4l2-compliance), as well as the output of
>>> `media-ctl -p -d /dev/media0` (replacing media0 with the appropriate
>>> device) ?
>>>
>>> Generally speaking, you should include a cover letter in patch series,
>>> and that information can be included in the cover letter.
>>>
>>
>> Yes, there is a cover letter for the patch series
>> https://lore.kernel.org/linux-media/20250828084507.94552-1-Bin.Du@amd.com/,
>> because of some server issue, the cover letter and left patches are sent
>> separately, really sorry for the confusing. It does contain
>> v4l2-compliance report, but the media-ctl output is missing, many thanks
>> for the guide, will include it either in the next patch
> 
> My bad, I even replied to that cover letter, but then forgot about it.
> 

Never mind, considering you have hundreds of mails, :)

>>> On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
>>>> AMD isp4 capture is a v4l2 media device which implements media controller
>>>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>>>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>>>> interface for now. Also add ISP4 driver related entry info into the
>>>> MAINTAINERS file
>>>>
>>>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> ---
>>>>    MAINTAINERS                              |  13 +++
>>>>    drivers/media/platform/Kconfig           |   1 +
>>>>    drivers/media/platform/Makefile          |   1 +
>>>>    drivers/media/platform/amd/Kconfig       |   3 +
>>>>    drivers/media/platform/amd/Makefile      |   3 +
>>>>    drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>>>>    drivers/media/platform/amd/isp4/Makefile |   6 ++
>>>>    drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>>>>    drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>>>>    9 files changed, 185 insertions(+)
>>>>    create mode 100644 drivers/media/platform/amd/Kconfig
>>>>    create mode 100644 drivers/media/platform/amd/Makefile
>>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 

-- 
Regards,
Bin


