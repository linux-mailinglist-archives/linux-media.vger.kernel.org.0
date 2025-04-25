Return-Path: <linux-media+bounces-30969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB8A9BD11
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 04:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 011AB1BA1186
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 02:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE6A1684A4;
	Fri, 25 Apr 2025 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TvCqDN7c"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEAE149C4D;
	Fri, 25 Apr 2025 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745549508; cv=fail; b=i/H2oDZKFCG+cby0w3Pq5Onds5wq594JB2O1qqaFRXZ3RYN2kzfHLdhSc0pdp1vSa/XG9g96/ArY2Z3Z1WmAv/rdZWhWiNq52m/FQn4mo2OUIBowhuqqv3jYS0dU5P2DJU6OlVR0A/q0qMJGVUgNhvFoWtIO0r3YhqIIhhZFP4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745549508; c=relaxed/simple;
	bh=8rNFxOCEtGVseR1jrKBq4tS44cfqdScooYjd+Xvp474=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QowWEecdpr4sekPt+Q5jnzB7qjOlKmfrAfBaq68jOfmReKTozG4QzVe3ZaydQK5K+5pmQDjJNdzZEylUTdifFo9GU9Op6DFFVi4ovKGRYwshE8HCxxCGOgmFvswu81qxzKUdGKOah7f6tQqOZgab6weT5O5482ECQw6nCKXcULY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TvCqDN7c; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfsWDiBeQ+yTMwwRWNGudgPIq1YxvstKg0V9zbqRoIVaDuT0GdNz/POa0qDK8apq1SkFSo137bWHoQ538AJV2Z0MkJ2iwIfhlRzI6KSt+G8wmBicAMXRfrrai1b10mpKDXPjrbbkxlVM8XDE96iG1aeWPaurrwBfXpljQOBEZIKZ+t14n/DCUsX75X0t8/ZxTSrM6ZQ/FDLPNm91PWf2MIqhPxErQBw2WfW4ACP4KGgcNymTtP4P9wqY5q0VdxbCpXqZ5xKravLjGwWtNuMup7BcGaOtsIRM8c+U3TmtcOb9PzV9tdmiApzpuhwAK75dZjifJym8IYiA6+lOq24qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly17wWta1PyoYdzOOu61ptPuUp/Zy4bwIEF+AJ6tvZ8=;
 b=Fe59Exrm1JYa8bd3+cQJrCMGXWlB/AECXXoKV7yzh6JLabvsQ5Tq9ySpGqB5bKH3hpuBEO88Nkuq1NHELDuVluLX+MhzPvdxWRcE+/e1EVKqhWLUnl1rIZoU8umXBQZFrA+ZgewxmqkPsMQ1eDa7ifVDvNMxgVc+PD2zFbb1gbjrvUNflGndgyC/4xPf1l+vTa66bCxWOTYUUbV5vG/vHqbDbTb+5Doy/byu0lqCYjcOh1h2EgSbuyNHCZ1IoSJen4C3Gz734IW72NqIh816U/LSmW49mQCxeIGxJYSxd0FRq6TdY43oPF4lSthbsFb7FwoWFmE7LDWphxHuxMDAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly17wWta1PyoYdzOOu61ptPuUp/Zy4bwIEF+AJ6tvZ8=;
 b=TvCqDN7c0p0bIbZe3j8pieDrEU0QcNF2nRUkkbwWO3K2MO+6q6FbTw/Nw8X0P7N0ULjI4HtLqRZNgO/Tri25H7hpqaUO7axx3rysncFvRfG56NMCYtINVJJoPOjEt8uqN4N0DeuyByciEQnWyB+8AoZqjbjrESPynV/59MuwUpVeGa/nHl8GyrGs3qReVjEdbauiVOvWswEtY4sPtSLIcgo+QLf5Tt+CnJhLMkYRgh67LTTc+jQfE+nz9AGzIf7CWsq6LRVVA2gwbRnhk8bF2AS6nppnqCKKFIytVYAIlpNFn8PhlLPKrTS93QMwJtkEmaCqGP0xtq/oCZpKyqYvcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB9PR04MB9916.eurprd04.prod.outlook.com (2603:10a6:10:4ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 02:51:40 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:51:40 +0000
Message-ID: <cb5df47b-f0f9-4420-8d36-73ea5903d57e@oss.nxp.com>
Date: Fri, 25 Apr 2025 10:51:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amphion: Start decoding job when both queue are on
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Ming Qian <ming.qian@nxp.com>,
 mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240719075007.384342-1-ming.qian@nxp.com>
 <39053a9e0767289cf822beb350819d366994dd0a.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <39053a9e0767289cf822beb350819d366994dd0a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DB9PR04MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd4b075-ae59-4ba8-cdd0-08dd83a419fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2ZmTVE2dUtCeEVVU2o4RmtxUU9EZElIQmpDU01UaC9XSVNzdTlSTVpEOEsv?=
 =?utf-8?B?eDBlZ1VIOURtTWliRUxuaWRGUGcvQkY2clFGcjFtbDYxRnN1TENOUDBRYWxw?=
 =?utf-8?B?QmRtOE1SMndraGZvUXZuOWRob0ZSdUhFL1NnQ3BEUTZFUXgvQnN5U2dsSzZr?=
 =?utf-8?B?Y3hLYzNyQVJpQzJFSWJ2VHZVR0o0RFl5Wm5kL0tjMHBCeFJpVzU0OC80Rjkr?=
 =?utf-8?B?ZC9HcjQxWXRUYUY4bUI5SVFmQzY2RHg4R2FWbjh5U2REWDhjcjMwejFnMkVa?=
 =?utf-8?B?dlFYWDV6UTU3R3hGUEd2MnEvVUxRL3VJOWw0NVhyUmphc3FFb1h3NmQybTh6?=
 =?utf-8?B?aEhhYTZMdncvbVF1WTlUeElsWU40Q0NIQVptaGhFOUpGMW1kWGRYZnlicENF?=
 =?utf-8?B?TTdvbDJmRXVabE9HaytFeXVTUzlhK3dXZ1pBM2NqN2VZd1VjSzdpU2o1U0JO?=
 =?utf-8?B?bjZkNEhQR1p3MDVoOGNMY3cvWG9ZYTJYVmlBWElxMGhIRzRVQkRMYXoyQk1p?=
 =?utf-8?B?OGxWSDJ5SEtRUGZrcy9YcWZwaGVmN094WFMyY2F5MWp6MlRqbENGQnVDcWM3?=
 =?utf-8?B?UHVLRG9FR29ZVTNWbmFSdWFQU3pUSEVUQ2xwWjc0aStWYktnUU5ZTThzdTMy?=
 =?utf-8?B?aGdGL3dnQWRRMk9nZzQyYmdNSDJvckpxTkY5OHo3SDZiZDcwQTM0bW0rYkNR?=
 =?utf-8?B?NU5GRCtKVkxvdHVhUncrT1F3cUF1T0RjaksyaFk0c1VJaXEzbUlOd3FPWUZ1?=
 =?utf-8?B?TlJIbUh4anVKNVpISjJsOFRQSzRTM2NadWZnN2w5M3R4cEY5TElpUjcwMmgy?=
 =?utf-8?B?Q3VMMnBWdkNXMmRWU1ArbjdmTWFHNVhTanBsc1U0bUpzdGZTNnZQck55V1NG?=
 =?utf-8?B?MkhXS0kwekVVeFVLWFlpZ28wMkhvd0hDOFdjQXFHTXZxbm5tckt0bnJyN0R4?=
 =?utf-8?B?eXMxeU5nY0ZEK1R2a2NYTkUwcllDbmF6dFF0bEcyNlNUVm5QSDRDa09Jcmlu?=
 =?utf-8?B?RGkzVXd4TUM0ZHNTd29XeVp1VXZDU3pGLzhlVE11K2pBaVBrb3k5M0JDbDFp?=
 =?utf-8?B?N1YzZDUyWXVGN1RvbWtXdHIvRDVpVjFHSjNyOXFjTjNHY2lDZ0ZGdlJnYlZl?=
 =?utf-8?B?dW1IWXZ1WnZja3JEWll6MEtyNHNXNXhUUkNUTUNCOUR4OXNocGVBZ2xMeVRz?=
 =?utf-8?B?TTNrYmpRdStFUlRUVEExL2dIaTJWWUdscWVScWUxSjlmd1RaZGt0NURDKzBJ?=
 =?utf-8?B?dWhWRWx3bEpBSi9aYXBKT095bkU0UUtGSy9kZjlQWE90Y2ZzVmxUaHNodm9h?=
 =?utf-8?B?YkxCczVTamZIdnBCNlorNHovbjBQaEJjVG1sV0NRbVJGQ3JDUzRkNlFZbEYy?=
 =?utf-8?B?MGdGSXdSVVlWOW90eUlrejF4V0pCWXZTWDhJc3Bxc1IwRUZTVlJOTnFaRCs3?=
 =?utf-8?B?bk9rYXBac0xFMUNTZ0FyTWRWOFp4Q29nYkxEbk9QdHFMUFY0NkxHUkl4aCtm?=
 =?utf-8?B?d0RlUzlyKzlJQmdoQTYvS091OGlPOE9HWGhEQyt6dC9iR2J6SEJmZ2Q2V2Ev?=
 =?utf-8?B?ZWt2dE9lVTM2VW9PeCtFbXVIT1c3dktGRWJPL0V0WnhqcnNocnhPa0E2dm5n?=
 =?utf-8?B?Z1NmbEFwMXVBZ284ZGZodk1iNG1vQ3JNT0hvM3oxWHVFbkUyVHVBU2d1VjZo?=
 =?utf-8?B?RVNZeWwzMXVkVnp1cHZYL2ExZHRSeE9WUWFwSlZCOGpWTkJWdU9iNEQ1VHRU?=
 =?utf-8?B?OWl3R2xpNFNhOXQrMkxYdXBGZnR2SFBZekFKQWFiL040RVREd25oWDJ5Y2do?=
 =?utf-8?B?V3RyQ0NwZmRsZCtmL0hVNHpSUHJja1lNdXlIZHNKUWFMeVpwdVNMdEJpNU1v?=
 =?utf-8?B?WmwyZ28rRmtYbjFjN2kzT2xSVHZmMTlDMjRKbGFCYXgzOUZnajNYZTJrL1g0?=
 =?utf-8?Q?DPr93fqxCm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJXamhEQjRSajAwREI4blJEK1JqNkN1ZFZXVy9lR3diVmtSSEdROFhkYVFK?=
 =?utf-8?B?eXlNTjB4c2ZwUWpiY0M3TnNseDdBWUt4L2s0UTM4ZzNrUEQ4ZjN0dUJNK3JI?=
 =?utf-8?B?cG0rdHM0S3RkQ3h1VmdPNmRQWUJURUJJaWEzUHNHZzQyUG12OHhoc1djaUxY?=
 =?utf-8?B?ZWdxZzY0c21uaEtqN2hMcnBaeVZHNmJlQVpEeGI4Q1c5MkZzSEdZejdLWkUz?=
 =?utf-8?B?dWJ2TysxdHhHbitrMVgvQVFqVU4zSkVDMityWk8rMEVvR0pycWh6SFkrSFlo?=
 =?utf-8?B?ak52NE51ai93YWpUZHhIdFdlMEhmVE1wVWFqOXQ4ZUZVWDRlQU5KNG5qaHVG?=
 =?utf-8?B?SzV2R2hQRWhZSExSUkdnMXh4bUpabTIxZjlXRTlxTlZWOXlZSS9FUU5QTlph?=
 =?utf-8?B?VEhhUEt3bEdFYXRrRkExc0pJZFZjbUF1RVk5M1Ztam9WQjhWb3hWb2NWTTIx?=
 =?utf-8?B?MDBBWTdtdHp3am95c1p2Zkh5cG1rQXRub25vME1BUWJhYldwUy9oc3dTTkF3?=
 =?utf-8?B?SWNJZ2tyT0tMcXk3TE5jMTE2Q0xPOEp1MlZtV1c3R1lBamM3d1VmMnhLSjNi?=
 =?utf-8?B?OWdxNGh3ZDI1cGdtc2gyZGc3K3hyQmNJdEIxQ0JQaTFWdmd2RXRqY0dZNmxN?=
 =?utf-8?B?SmxBNnFHOHFFMXd3ajd6enNyYlNiY2tFVEFnbkZPRmZGMjBkVFpmbVpXUEVx?=
 =?utf-8?B?S2FEdlg5Q1JXK09ydy9tRnJKT1pwd2RNNTA3d0duRHUxcmxVaWtsOTJVaURD?=
 =?utf-8?B?Y1BwZkVFVklMZFlUdDFoNHROMGR4ajhQeDRWQk9ZakgyNVdSemYzK3pxOEc4?=
 =?utf-8?B?Uzh6SnNDR2dVM0liVTFIZDZocktyRjJFSGYreTlMc0ptRDZUSnRSVERBem8z?=
 =?utf-8?B?SWZaNE15TURmanRqRlRUZUZsakV5U21MdW92dk5uVTAweEFtUUxvZ0x2S0ho?=
 =?utf-8?B?bjVHSjQvalBYZWlSbWlERFRjd2E0VnhKRWs2bXcwKzh1TDh3eEw3Uml4ZmNF?=
 =?utf-8?B?bUJqYXhhZUJKYzlRVFE2UVcxazIyK242YTd5UXFUbDhjeXA3S05KU0NnOU1n?=
 =?utf-8?B?WVdPUkxiTHFNSVVtbGYvS3FQdVZMNjlpK0dKcGlkNGNHZGVuTGYxeE41YU42?=
 =?utf-8?B?VUpWM0E0R1JEOHk4MEtWbytxeCs0YW1id2FBZE84dzJJR1pxNVQyNVB2OFAz?=
 =?utf-8?B?aXQyT3lXWEdKaWluWHBGQ0VBMW1CL2F1T3psYnh3NXhqUGZ6WDhTZTRzZEt4?=
 =?utf-8?B?VnJzZkNjZjF6MnhaSkMvMEdvYWpsdjh0VFhMWC9kQjl5VUhYdVNZU0Y1RHFJ?=
 =?utf-8?B?ditQRVRUZ3lYVU9iUWNsWHZVZGpUTCtEYUdNeG0zcktTakhPS1ZZLy9YdWwv?=
 =?utf-8?B?TUpvY0p2MmcraWk1c00rbm1PVHJUNmJwWTh2NDUzUW9NY0dyb3p5NCtoRXhD?=
 =?utf-8?B?cXNHTVF5cG50VWNzMjYyNFdIbW9zR0dibU1PRjVFM1NwTVRhT3IrN3MvVHdz?=
 =?utf-8?B?ckx3VHE4RFlIbnF3cHJ5OUR0VFhIZHlZTUh1MXJsR05CL1hHYnBUazhRc1px?=
 =?utf-8?B?d2xZZ0VYeDJoaEZiMjRSZFMwRStSTXJybVl5aCt4R2NuL1pGZmZ5eTMrcFM4?=
 =?utf-8?B?RHhmdklFQlNSV254VUlQeHVIZGxmM1NJeFUyNDdaUys2NmZSRXFnZXA1SU85?=
 =?utf-8?B?ZnUzV2xndkZsZXlmeGhqOW83ZXp4Vld1c00wcGNsQisyTGpIYy8yeFZ2Yis4?=
 =?utf-8?B?YlVQNGptc3N3cURRUHJsYVhJVnIveEErS1U3aGpBWjR1cU5xV3liZ2VLNkIx?=
 =?utf-8?B?TW96Y0Z2OFgzVU5MZ2p1aHBlMEw3V3FPL3V2Nm9nNExtSkFGWmo3ekdwK0Fh?=
 =?utf-8?B?dVU5dk15V1pRZ3B1Tm1BZGRCRXEyTVRhQXRUWlQzeG5oVW1mNk5FdHdvNFpF?=
 =?utf-8?B?aFJxSSs1R2JDQUtkNmxqd2ZaVjRIVG8zWWJ3Y3pUYnJsY3ViTnp5S1oxOTY4?=
 =?utf-8?B?R3VQUE1JZnc5eDZzRExmN3I2bHFuTWw3dUV4MUY1YWVNb01iSGM5bjNVcXVN?=
 =?utf-8?B?K2JOSDhkZEdXcWJQbnBycWtyQ21oT2hVRm9tTVRjSGJjYnp0MWtTbWhwdzdC?=
 =?utf-8?Q?hv6BGXnQSolR/MCRachMQ4H9P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd4b075-ae59-4ba8-cdd0-08dd83a419fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 02:51:40.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lskS89Q9ve7fufn6IG7Sr1nq3LCrF3+UHn6Bylxf6zEf1KhOzj9WlLPrSfWuwxj0seGsnKnhpAYc6rIkMO6O4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9916


Hi Nicolas,

On 2025/4/23 3:46, Nicolas Dufresne wrote:
> Hi,
> 
> Le vendredi 19 juillet 2024 à 16:50 +0900, Ming Qian a écrit :
>> Start the decoding job when both queue are on, except the for the
>> initialization sequence.
>>
>> Especially when seeking, the capture streamon may be called after output
>> streamon, driver will start to decode job immediately after output
>> streamo, if seek to a new resolution, then the source change flow may be
>> mixed with the seek, it will cause confusion, then may led to pipeline
>> hang.
>>
>> When both output and capture queue are on, it's ready to start the
>> decoding job, and it can avoid the above potential problem.
> 
> This commit message needs some work and I'm unsure I understand its
> meaning. After reading the change, I am under the impression that you
> simply say that once the seq_hdr is found, the driver should keep
> delaying the processing of output buffer until the capture queue is
> ready ?
> 

I just want to do something like v4l2_m2m, that device_run() is only
scheduled when both queues are ready.

I admit that this patch does not have any substantial functional
changes.

I think this patch can be discarded, as it is confusing.

Thanks a lot for the review and comments.

Regards,
Ming


>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> ---
>>   drivers/media/platform/amphion/vdec.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index 6a38a0fa0e2d..ca8f7319503a 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -1363,6 +1363,12 @@ static int vdec_process_output(struct vpu_inst *inst, struct vb2_buffer *vb)
>>   	if (inst->state == VPU_CODEC_STATE_STARTED)
>>   		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
>>   
>> +	if (vdec->seq_hdr_found &&
>> +	    !vb2_start_streaming_called((v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))) {
>> +		vpu_trace(inst->dev, "[%d] capture is not ready, pend input frame\n", inst->id);
>> +		return -EINVAL;
> 
> I got really confused by this error return value. Its clearly not an
> error, but just a delay. I think before we add more on top, you should
> turn all these function for which the return value is unused to void.
> And use a plain "return;" here. That applies to all similar ops.
> 
>> +	}
>> +
>>   	ret = vpu_iface_get_stream_buffer_desc(inst, &desc);
>>   	if (ret)
>>   		return ret;
>> @@ -1555,6 +1561,16 @@ static int vdec_start(struct vpu_inst *inst)
>>   	return ret;
>>   }
>>   
>> +static void vdec_enqueue_pending_frames(struct vpu_inst *inst)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx); i++) {
>> +		if (vpu_process_output_buffer(inst))
>> +			break;
> 
> How well does this work ? Previous you made good care of interleaving
> the processing output and capture, which I could imaging prevents the
> hardware from starving ?
> 
>> +	}
>> +}
>> +
>>   static int vdec_start_session(struct vpu_inst *inst, u32 type)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> @@ -1573,10 +1589,10 @@ static int vdec_start_session(struct vpu_inst *inst, u32 type)
>>   	if (V4L2_TYPE_IS_OUTPUT(type)) {
>>   		vdec_update_state(inst, vdec->state, 1);
>>   		vdec->eos_received = 0;
>> -		vpu_process_output_buffer(inst);
>>   	} else {
>>   		vdec_cmd_start(inst);
>>   	}
>> +	vdec_enqueue_pending_frames(inst);
> 
> Was this intentional to reverse the STREAMON(CAPTURE) call flow to:
> 
>    - process_capture() (inside vdec_cmd_start())
>    - proces_output() x n
> 
> Nicolas
> 
>>   	if (inst->state == VPU_CODEC_STATE_ACTIVE)
>>   		vdec_response_fs_request(inst, false);
>>   
> 

