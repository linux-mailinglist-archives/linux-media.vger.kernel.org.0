Return-Path: <linux-media+bounces-43412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D80BABD53
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F049E7A42F8
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 07:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6527AC3D;
	Tue, 30 Sep 2025 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DnLGflG8"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011472BFC9D;
	Tue, 30 Sep 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217465; cv=fail; b=MopkH+TZil7qYkTAL3hQw17JOqI04o61T5wmV8af3FYmqnNK0Q+9yvw1f86cdMDuykj18PWjCSOdwcwM3VezUCVdIyIp9vOiEcBq2Sm31J2WPbj377heUm3z6rMbZcDyOGC9cswrdRhfw62fJYWWGNx4d5UwiIbybyytKwEhPX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217465; c=relaxed/simple;
	bh=AkRddj1zpYI5dq1jcFPaBeYGKQokIvVYcnVW53Z1Blw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DR1wVHsGnFSUU67TtoAok/9BCFU9DauQYQWAf/kbBcnxvgityGDuTJJ2AB/z1nYV9uMRWT7+JNQrJawWWI1WaOga+w/sQzNqwtIoeMvzurCE11eS9gwPIggIJLBsOAPO5BHN41HU9L3SSou41VprKuBmx5NAehSN1kRAOKr2MMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DnLGflG8; arc=fail smtp.client-ip=52.101.193.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjF3U3W/LgEjvqeE05jNwcH7EFgIIkqg65+N/ej2a79Z21+gol5FOTskXq0xAtziqTJZRKM4fclRDB+izosflE6Gw+r6bzlwowyh/w2EcbjXIabLG0JpNX74MhLbt825qV+I797ynEOMi7/Y8dOmRtTUGfYR+e3qWC71OBhS651D8zRLR6a9HxkKMYiV6z93kHoBC33a3d85xsiQDT6xOmVtJV/0IixOwOkPI0eONV9764jL/RV1sJUOV0L0lkJIgDHF6qd+raqdSo1hNDg0UMApad+JMxYqamcGg68p205F7B+5DpRo9KTHWgIUq4Hz/fRHFgOxmLdObLTv+L4hFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l26HctOz6lXPd6HNossT2a4300AXAYUarrrOFSsG6Mc=;
 b=LnftgFzT5KHC/6GrjvwAnWad5ljGVnVleptoC4GfUHxth2/5YriYlR9pgxSvxXle/0TFzBHKOr5XbmMeeopiRTYh1LKc5GHAD2YDAEt6pSOv0guGi2HjStI8HpfLpB7d675QbCpmL2WP+/7LsVo4hyQlASsZMpMOGHyTdwrZ9/DuS8ZbP9mQp/3Ic/EfewSaA0Un+I10qUrlwOE81B8jlKxeg4iwqJ/hTw8rQSJVX8LpxEHYYJWU1xO3HOHVc/wYCnZpfGoWUeqz568Gbq+bvY2svQh59ZUKlzmE9xfyWgajzokBNiswC39HkwxUh1FYBntMQeInKZKfdlI46Az4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l26HctOz6lXPd6HNossT2a4300AXAYUarrrOFSsG6Mc=;
 b=DnLGflG8MDywCbddAzwnDBLsoAvRfYHEahcNa033rcBbsaxbO9xZD8x3aY41YeNV0i/TBTC79/2weWZeszm5M1Ikg70uVP/wglZkIaX8M2QNZkYkFu+hGOHIEiHj5wapST6zQI3MowCVpQSj/MDIMhurtRbtJkHHDCH57sEKaBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 07:30:58 +0000
Received: from MW4PR12MB6875.namprd12.prod.outlook.com
 ([fe80::3d7b:7e5b:458d:a32e]) by MW4PR12MB6875.namprd12.prod.outlook.com
 ([fe80::3d7b:7e5b:458d:a32e%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 07:30:57 +0000
Message-ID: <c63a56cb-23d0-4c5a-8e1a-0dfe17ff1786@amd.com>
Date: Tue, 30 Sep 2025 15:30:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-5-Bin.Du@amd.com> <aNJK_tZe99_jWNdR@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNJK_tZe99_jWNdR@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To MW4PR12MB6875.namprd12.prod.outlook.com
 (2603:10b6:303:209::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6875:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 463e4a78-0b38-4715-8678-08ddfff34bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WURhdFgvTW81NkdDdnlDNFNUNzlHV1ZmcVh6eWhrWUlEUDZFNVRmc3lnQVdq?=
 =?utf-8?B?OVJKaDlMQmIvcU9xNzFoZjNIVDg5enBjOGtPdWpEWGgydkJsWjVHTjFnb1J1?=
 =?utf-8?B?NDBwZGExMTRCbUhrU2xUY2dNUnpaS0tNL1JJdERNbGdqa1BzV25Zb0VmVDNQ?=
 =?utf-8?B?azZyaWxpbUl4TFZ1NEY2UGxtcis5WCt3bk1hU1Z4QXJFdHFhU0hrUFVwdWZt?=
 =?utf-8?B?Uk1FK3ZZclNqa0psRElObDBHQkJhRDUxRjVONVR0WEwvazluVzZISkpJamZh?=
 =?utf-8?B?ekwyWVhNNnNoVmpZOEFNeXljQkU0UzlUTlhMYS9FK09pMDZxVDg5Q1RmY05X?=
 =?utf-8?B?cDEwdUs4MUpzeko0MnE4eHJPMmlOWjZ0cDErYTdZSnJsUGcxMEluVjhOaUJI?=
 =?utf-8?B?Z09YUHJZUU1FTkE1Z3VWM25yTy8xQ3UyNW5oVStob2hzTWRWZXlzS2l0ZEFG?=
 =?utf-8?B?YnB0b2Y3cm1HNzl2U3dDVUNDL093eWxZWG1Mbk1Qd2RpQnZWV09CR2wxL2Fz?=
 =?utf-8?B?QTBKdGVwU1ZBSzg0eFI4SFZuWWhyK0s2L1ZsbTEwMXdSbXh3WkgxTWNGajYz?=
 =?utf-8?B?MVMyL0w1Q3FMbFZpRWJUdmdLUTI1ZStTZW03RDIxMDE1NnRaTGRMZkxuWkho?=
 =?utf-8?B?ZGNkejNuN0VScFB6NlZhWng5ZDVnTjkxOXpmMUwrZE1DeUlSQVk4RDZFbDlJ?=
 =?utf-8?B?Y2YxeDRuRFNrRDd5TFZHeldtM1RDSWxUSS9EZWVXQWZnNUVqOHJBMmtXYzNV?=
 =?utf-8?B?VHYwUm1zVm10dFR5Y3RoS1dNTWdsdUh1Nmg3cmUvWnRnRWhnd1E5em9nZkwv?=
 =?utf-8?B?QWRsR3BHcU9JVlMrUEZvU3EvNkNiV0VidEZzbkJoN3hQNzUzOFdIc29KS1Bn?=
 =?utf-8?B?aDJVVmlDZWNzSTlEVEoza0E3OW1FbGNCcG5KNzl4cUlKRXh4VjBFZjhxSkUy?=
 =?utf-8?B?MWN4SXZCWVJJYVpTOFl2djVpWXE5cnFFZmlRaWJxSDFINGJkcG5zTVFvVHZK?=
 =?utf-8?B?Vk01dkdqeWM1V0ZpY1pyK2JUVGNyVFFncjhxN2R1RE9GdmRkc2dHNnkzSTdB?=
 =?utf-8?B?TUlxMmFManpBRXhLSzNGRFNsYmRCblZlT0dCblRiSUM4dW9YZmxCanUySlhh?=
 =?utf-8?B?Q0hmeWlJWXBNZ2JLUWFBNjkxdkl2b3BTQmMxMlkzeVJsblUwY3RTTzV5YmFp?=
 =?utf-8?B?Q1NrNFdjK3hSd29wUDk2K3pJTkRvbHlOeDYrZlp2OHREaTU5NXEwaVRudVVs?=
 =?utf-8?B?K05kMjFSbXRiajgrSU9CYVJMa2lqVlZLeTNRMTE1VjJNWmZtOGxoVjVleEFW?=
 =?utf-8?B?TTVjQ0QrNzBKa3ZFa1dkUEhYZTJVcW1sTzJrVzlTWHBnUWR3UUdmL1BtN3Ev?=
 =?utf-8?B?OGU2YmFXSkNYMGdpWVRIamJqUmhVOVI0R1k5cXJnNmxJU3Q1dWRlUVVmRVlk?=
 =?utf-8?B?MGtWSlFZeUFWRkd1d1NML010elZxNEt1N21hMEVYcndUTk5KY0ltQnZMK3Er?=
 =?utf-8?B?Sm42c3JpaVZ3OFdoY21MSk00ZFlkdEpUSHhNU2FaeHFBZGhodlBlUW9JUEoz?=
 =?utf-8?B?SHlQUVhjcGdoanprQzQzT2Zna2NKakxEVE9IR2pQT04zTUo2dDZJK21aOXcv?=
 =?utf-8?B?UDZhOEZCM3NzSDRLWllaVzhENmFIVDkrLzBPSm5YWm1UN1p4NHdHL2FDTEps?=
 =?utf-8?B?TDRubXA3Yk93Q2paZGxFbDFKS1lYa1RzTVc4L01CTnhISnlOK2VDR1E0Z21i?=
 =?utf-8?B?VjdRd2UzWE1sVk1SamtTQ3V0RkJ1dDFnT0oya1YwbFJlVkVCdDZCQUlTZ3lR?=
 =?utf-8?B?VmgycFQyWlErdWxxTmwzTXZySFV6aERKK2M2TmxEN1N0c3JUZWt0WXlLWDZy?=
 =?utf-8?B?YW5mMEx1aXFNazBxSGNPS0ZxNTZHbCtOTzQ3dS9HRllJOE5TOExFWjU2bWVj?=
 =?utf-8?Q?/nU1b2OguEp+AUxSnK9V1JBgS5ulXQdI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ty84eG1kMXYvbVNTeFVFUXdUSHdLNk5MUGhXRC8wZC9pQXZjQm42bTQ0Vjdm?=
 =?utf-8?B?OVRyM1ExUU9LN1ZXNytDWWlWdm5IN3RRcGpYVEVuSFFBZUJaK0x3Zng0cXEv?=
 =?utf-8?B?RE5VVGRaSlVqVFJkQzBUT3REWU5IZnlHcGJ1RkYxcHRIK2JEUXFibENvV3BJ?=
 =?utf-8?B?NURRclVlSmlQYWx4T0JzdFVPcFROS21Rc0hxeGVpYnQ0THhGVjBtSUNGbGVv?=
 =?utf-8?B?M2s3NUFiYTFreHlwSXIrdTloUEZldXppbkJiQ1RPQ3ltMUpBOWFFanhyOTkx?=
 =?utf-8?B?bnlNKy9PMEJZZnc0Z2I3QWJoNXhRaVRlLzF1Z1h2Sy9aaFlvRmpXUi85clFu?=
 =?utf-8?B?SHNtLy9ZbEFIcWlrcy8xV3VqRGdTV2lsRDBnd0xVa0lVaTZXc0NYaUdPNmJ5?=
 =?utf-8?B?NnRWS052NlI3RU1kMStBTm94cVUyaGFWUFREbEpianRkNXRvVzc3RlZRZGNm?=
 =?utf-8?B?OFQ4U01zOE9vNTZWR0xKWk5NVXJ3ZGQ4c3ZvcFV0c3RUb29oUHBPYmx2ZWIw?=
 =?utf-8?B?enlnTnUwTnJudGw4ek13bTc5SllzT2gvT0NYNUFjbmV6TTJtbUNLTEdsUWNZ?=
 =?utf-8?B?QUtIRmZOTEkzMXJXekxMZ2poTEI0NlR2b3FGRzNya3M4dGtBeE8vZFdUOW94?=
 =?utf-8?B?aEpoNExFcHJsaUNhYnczR1RqakZzT0dkZWRVSXYydkV2ZlBVNmFIbWM1YzRH?=
 =?utf-8?B?Rko1OTV6MHdkcW81UTVUcFBUWmcwREQvck5oT0VWY1ZsbEpEWFdrUk1vTjds?=
 =?utf-8?B?aWhWUXZidldqdEdnSUNreUVkbDZxcVdRQS8rUHpGYUZ3NXpEaFNPTC9YNTVl?=
 =?utf-8?B?Vm9jZzBRWWR1VnpUeUxDUnZJYVNTVXdEaTloRlFETHlmci85czlyNnlwaGNx?=
 =?utf-8?B?Wmp0ZTRwdU90Y2VjQ3FCck1IWHNIdFRkOEVxS2FxK2tiT0hkd1JNQ1BwMXhE?=
 =?utf-8?B?emdkVklTdEdpd3U2YUU3aUVjOXJmSjFVQmdPbUkxU202MTl2cXBxa1BRWUJX?=
 =?utf-8?B?UWdwNGxTVlp2Z2lpTC95M0ljTDNLbnJCMUZpTG80RDZ5aUEzZmUwUmNKYVAz?=
 =?utf-8?B?QkN2QUtNc2w1VlJGMWg4SndsMFR5YVJyUDJBRTFEL3JmRnFUdU5CUS8rMVN2?=
 =?utf-8?B?aU9Ba2JrWHNGRGRselBRS2F5MGloY1JBOS9oRDdoeFVxR25JMVR4NnZVdnNG?=
 =?utf-8?B?Y2w0N25lY0cxRnJNMmZaM1ROUWVCRUY2RFFObjMvM2dqOHdjSkFhTHBBSk15?=
 =?utf-8?B?Sk1CcWJYcU96aUs0R0N6WExBR3NIdzk5NVkveGRxa3FWeXoyVURxOTJDWkQx?=
 =?utf-8?B?cThmVVFtUyttSmw3ZEQxcnl2OWxzYUhQNmxLQ2o4V2pCWnlTVzNKOTBXZ0dx?=
 =?utf-8?B?VXVLV1FXa0FOUjN4ZXovam42YSt5akJ1OWtBSnRVNFplcHQ2aCtTd2dYdnkw?=
 =?utf-8?B?aCtsSml0bkZEbzNydU9TY3ovUmIvRjF3MjhjejV1eGNQc0lyUHgzMTJsVjBP?=
 =?utf-8?B?WlduTDdRZGcwSXIyVWMvMkZqeS9BVzFOKzAvVWo0VVZERVFWZ3NqaWlQdTZ5?=
 =?utf-8?B?TWZaa1BLQTdrZFJFY084NmtsdUZwRVZqL3NkQTQ1eFgrbEJ5Rm5PTDcwRWxW?=
 =?utf-8?B?Y0laWkFyakQ0TFcvZlduQjVwSEtnZnh2Z3U5VDFrcGl4R3dNM3E2ZTE0akpk?=
 =?utf-8?B?MUpTaVJBejJBYWY5MVNtcURqQW9rRDJ4LzFoSEFlYTlGOGY4QnlJUWdFem51?=
 =?utf-8?B?MGY0d3JOK0Q2alJuRnkyR2k3WnljZDVjY1NtVzI1OHRXdHlaSjdpc2ZnS3lD?=
 =?utf-8?B?Uko0MTJUaFdNTldXcEtPNXpyRDVaczFxak01VFBITUdJK0xWM0tEaUNoMWdL?=
 =?utf-8?B?VmNRWXZqNU9oRmNwTDd6UEFIVFBCK29mM1VVcUVtSElHYVgvaVBUVjRSOXFX?=
 =?utf-8?B?aUNMRk1mendoR2xrand0SVJpK3Bxc2hOdlJpd3lsRmh0c1U3d3FpYnA3YUtN?=
 =?utf-8?B?SVNxWDNtTS9EdytGcEhKelEzcjNNTUlLWWpnelZhWSs1NnNicTRHYUI5T2hN?=
 =?utf-8?B?L0dnUXZlTGwrdVg1endnZHVkRGV1Y01VZXdadUc2dFdzUkRlNDJuS050dWlp?=
 =?utf-8?Q?cEqo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463e4a78-0b38-4715-8678-08ddfff34bff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 07:30:57.7127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n09c06I+DwxHwOs0aAoG8L/C19bXjWdxu7EKo92gUWlck/MIvs+HpMH2krZAV1FA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

Hi Sultan,
Thank you very much for your thorough review — We truly appreciate it.

On 9/23/2025 3:23 PM, Sultan Alsawaf wrote:
> Hi Bin,
> 
> On Thu, Sep 11, 2025 at 06:08:44PM +0800, Bin Du wrote:
>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>> capture video node, and supports only preview stream. It manages firmware
>> states, stream configuration. Add interrupt handling and notification for
>> isp firmware to isp-subdevice.
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -5,13 +5,19 @@
>>   
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vmalloc.h>
>> +
>> +#include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-ioctl.h>
>>   
>>   #include "isp4.h"
>> -
>> -#define VIDEO_BUF_NUM 5
>> +#include "isp4_hw_reg.h"
>>   
>>   #define ISP4_DRV_NAME "amd_isp_capture"
>> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
>> +	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>>   
>>   /* interrupt num */
>>   static const u32 isp4_ringbuf_interrupt_num[] = {
>> @@ -21,19 +27,95 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>>   	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>>   };
>>   
>> -#define to_isp4_device(dev) \
>> -	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
>> +#define to_isp4_device(dev) container_of(dev, struct isp4_device, v4l2_dev)
>> +
>> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp, u32 index)
>> +{
>> +	if (isp && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
>> +		struct isp4sd_thread_handler *thread_ctx =
>> +				&isp->fw_resp_thread[index];
>> +
>> +		thread_ctx->wq_cond = 1;
>> +		wake_up_interruptible(&thread_ctx->waitq);
>> +	}
>> +}
>> +
>> +static void isp4_resp_interrupt_notify(struct isp4_subdev *isp, u32 intr_status)
>> +{
>> +	bool wake = (isp->ispif.status == ISP4IF_STATUS_FW_RUNNING);
>> +
>> +	u32 intr_ack = 0;
>> +
>> +	/* global response */
>> +	if (intr_status &
>> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK) {
>> +		if (wake)
>> +			isp4_wake_up_resp_thread(isp, 0);
>> +
>> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK;
> 
> The INT_MASKs and ACK_MASKs are the same; perhaps the ACK_MASKs can just be
> removed so you can just write intr_status to ISP_SYS_INT0_ACK instead?
> 

These macro definitions are automatically generated from the IP design 
by the hardware team. INT_MASK and ACK_MASK represent specific bits in 
different registers—the status and acknowledgment registers, 
respectively. While their values are currently the same, they could 
differ depending on the IP design. I prefer to keep both definitions to 
maintain clarity.

>> +	}
>> +
>> +	/* stream 1 response */
>> +	if (intr_status &
>> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK) {
>> +		if (wake)
>> +			isp4_wake_up_resp_thread(isp, 1);
>> +
>> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK;
>> +	}
>> +
>> +	/* stream 2 response */
>> +	if (intr_status &
>> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK) {
>> +		if (wake)
>> +			isp4_wake_up_resp_thread(isp, 2);
>> +
>> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK;
>> +	}
>> +
>> +	/* stream 3 response */
>> +	if (intr_status &
>> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK) {
>> +		if (wake)
>> +			isp4_wake_up_resp_thread(isp, 3);
>> +
>> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK;
>> +	}
> 
> I think it'd be cleaner to put these masks into an array and loop over them in
> here instead of writing them all out by hand.
> 

Yes, that will make the code concise. Will update in the next version

>> +
>> +	/* clear ISP_SYS interrupts */
>> +	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_ACK, intr_ack);
>> +}
>>   
>>   static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>   {
>> +	struct isp4_device *isp_dev = dev_get_drvdata(arg);
> 
> This is technically a data race because setting drvdata and reading drvdata do
> not use WRITE_ONCE() and READ_ONCE(), respectively. And enabling the IRQ before
> the handler is allowed to do anything is why that `if (!isp_dev)` check exists,
> because that is another race.
> 
> Instead, pass the isp_dev pointer through the private pointer of
> devm_request_irq() and add IRQ_NOAUTOEN so the IRQ is enabled by default. Then,
> when it is safe for the IRQ to run, enable it with enable_irq().
> 
> That way you can delete the `if (!isp_dev)` check and resolve the two races.
> 

Good deep insight, suppose you mean use IRQ_NOAUTOEN to make irq default 
disabled. Sure, will add support to dynamically enable/disable IRQ 
during camera open/close and remove unnecessary check.

>> +	struct isp4_subdev *isp = NULL;
>> +	u32 isp_sys_irq_status = 0x0;
> 
> Remove unnecessary initialization of `isp` and `isp_sys_irq_status` variables.
> 

Sure, will update in the next version.

>> +	u32 r1;
>> +
>> +	if (!isp_dev)
>> +		goto error_drv_data;
>> +
>> +	isp = &isp_dev->isp_sdev;
>> +	/* check ISP_SYS interrupts status */
>> +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
>> +
>> +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
> 
> There are four IRQs (one for each stream) but any one of the IRQs can result in
> a notification for _all_ streams. Each IRQ should only do the work of its own
> stream.
> 
> You can do this by passing devm_request_irq() a private pointer to indicate the
> mapping between a stream and its IRQ, so that isp4_irq_handler() can know which
> stream it should look at.
> 

Will do optimization to remove unused IRQs and keep only necessary ones 
(reduce from 4 to 2), actually an IRQ won't result in notification to 
all streams, please check the implementation of 
isp4_resp_interrupt_notify, it will only wake up IRQ corresponding 
stream processing thread.

>> +
>> +	isp4_resp_interrupt_notify(isp, isp_sys_irq_status);
>> +
>> +error_drv_data:
>>   	return IRQ_HANDLED;
>>   }
>>   
>>   static int isp4_capture_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> +	struct isp4_subdev *isp_sdev;
>>   	struct isp4_device *isp_dev;
>> -	int i, irq, ret;
>> +	size_t i;
>> +	int irq;
>> +	int ret;
>>   
>>   	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>>   	if (!isp_dev)
>> @@ -42,6 +124,12 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   	isp_dev->pdev = pdev;
>>   	dev->init_name = ISP4_DRV_NAME;
>>   
>> +	isp_sdev = &isp_dev->isp_sdev;
>> +	isp_sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(isp_sdev->mmio))
>> +		return dev_err_probe(dev, PTR_ERR(isp_sdev->mmio),
>> +				     "isp ioremap fail\n");
>> +
>>   	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>>   		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>>   		if (irq < 0)
>> @@ -55,6 +143,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   					     irq);
>>   	}
>>   
>> +	isp_dev->pltf_data = pdev->dev.platform_data;
>> +
>>   	/* Link the media device within the v4l2_device */
>>   	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>>   
>> @@ -66,6 +156,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   	isp_dev->mdev.dev = &pdev->dev;
>>   	media_device_init(&isp_dev->mdev);
>>   
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
>>   	/* register v4l2 device */
>>   	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>>   		 "AMD-V4L2-ROOT");
>> @@ -74,19 +166,24 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, ret,
>>   				     "fail register v4l2 device\n");
>>   
>> +	ret = isp4sd_init(&isp_dev->isp_sdev, &isp_dev->v4l2_dev);
>> +	if (ret) {
>> +		dev_err(dev, "fail init isp4 sub dev %d\n", ret);
>> +		goto err_unreg_v4l2;
>> +	}
>> +
>>   	ret = media_device_register(&isp_dev->mdev);
>>   	if (ret) {
>>   		dev_err(dev, "fail to register media device %d\n", ret);
>> -		goto err_unreg_v4l2;
>> +		goto err_isp4_deinit;
>>   	}
>>   
>>   	platform_set_drvdata(pdev, isp_dev);
>>   
>> -	pm_runtime_set_suspended(dev);
>> -	pm_runtime_enable(dev);
>> -
>>   	return 0;
>>   
>> +err_isp4_deinit:
>> +	isp4sd_deinit(&isp_dev->isp_sdev);
>>   err_unreg_v4l2:
>>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
>>   
>> @@ -97,8 +194,13 @@ static void isp4_capture_remove(struct platform_device *pdev)
>>   {
>>   	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>>   
>> +	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
>> +
>>   	media_device_unregister(&isp_dev->mdev);
>> +	media_entity_cleanup(&isp_dev->isp_sdev.sdev.entity);
> 
> Why is isp4_capture_remove() handling the cleanup responsibility of
> isp4sd_deinit()? The v4l2_device_unregister_subdev() and media_entity_cleanup()
> on the subdev should only be done by isp4sd_deinit().
> 
> Since v4l2_device_unregister_subdev() is not called by isp4sd_deinit(), this
> results in missing cleanup on error from isp4_capture_probe() when
> isp4sd_deinit() is called.
> 

Yes, thanks for catching this, it's an issue, will move 
v4l2_device_unregister_subdev() and media_entity_cleanup() on the subdev 
to isp4sd_deinit()

>>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +	isp4sd_deinit(&isp_dev->isp_sdev);
>>   }
>>   
>>   static struct platform_driver isp4_capture_drv = {
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> @@ -0,0 +1,1095 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_interface.h"
>> +#include "isp4_subdev.h"
>> +#include <linux/units.h>
>> +
>> +#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
>> +#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
>> +
>> +#define ISP4SD_PERFORMANCE_STATE_LOW 0
>> +#define ISP4SD_PERFORMANCE_STATE_HIGH 1
>> +
>> +#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
>> +#define ISP4SD_WAIT_RESP_IRQ_TIMEOUT  5 /* ms */
>> +/* align 32KB */
>> +#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
>> +
>> +#define to_isp4_subdev(v4l2_sdev)  \
>> +	container_of(v4l2_sdev, struct isp4_subdev, sdev)
>> +
>> +static const char *isp4sd_entity_name = "amd isp4";
>> +
>> +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
>> +{
>> +	if (isp_subdev->enable_gpio) {
>> +		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
>> +		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
>> +			enable ? "enable" : "disable");
>> +	}
>> +}
>> +
>> +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type = {};
> 
> Use memset to guarantee zeroing of padding bits.
> 

Sure, will do that and add comments

>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (!ispif->fw_mem_pool) {
>> +		dev_err(dev, "fail to alloc mem pool\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
>> +	buf_type.buffer.buf_tags = 0;
>> +	buf_type.buffer.vmid_space.bit.vmid = 0;
>> +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
>> +			    &buf_type.buffer.buf_base_a_lo,
>> +			    &buf_type.buffer.buf_base_a_hi);
>> +	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
>> +
>> +	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +				  &buf_type, sizeof(buf_type));
>> +	if (ret) {
>> +		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
>> +			ispif->fw_mem_pool->gpu_mc_addr,
>> +			buf_type.buffer.buf_size_a,
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
>> +		ispif->fw_mem_pool->gpu_mc_addr,
>> +		buf_type.buffer.buf_size_a);
>> +
>> +	return 0;
>> +};
>> +
>> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_set_stream_cfg cmd = {};
> 
> Use memset to guarantee zeroing of padding bits.
> 

Sure, will do that and add comments

>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
>> +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
>> +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
>> +
>> +	cmd.stream_cfg.b_enable_tnr = true;
>> +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
>> +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
>> +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
>> +		cmd.stream_cfg.b_enable_tnr);
>> +
>> +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
>> +				   &cmd, sizeof(cmd));
>> +}
>> +
>> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type = {};
> 
> Use memset to guarantee zeroing of padding bits.
> 

Sure, will do that and add comments

>> +	struct isp4sd_sensor_info *sensor_info;
>> +	struct device *dev = isp_subdev->dev;
>> +	u32 i;
>> +
>> +	sensor_info = &isp_subdev->sensor_info;
>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>> +		int ret;
>> +
>> +		if (!sensor_info->meta_info_buf[i]) {
>> +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
>> +			return -ENOMEM;
>> +		}
>> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +		buf_type.buffer.buf_tags = 0;
>> +		buf_type.buffer.vmid_space.bit.vmid = 0;
>> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +		isp4if_split_addr64(sensor_info->meta_info_buf[i]->gpu_mc_addr,
>> +				    &buf_type.buffer.buf_base_a_lo,
>> +				    &buf_type.buffer.buf_base_a_hi);
>> +		buf_type.buffer.buf_size_a =
>> +			(u32)sensor_info->meta_info_buf[i]->mem_size;
>> +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +					  &buf_type,
>> +					  sizeof(buf_type));
>> +		if (ret) {
>> +			dev_err(dev, "send meta info(%u) fail\n", i);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	dev_dbg(dev, "send meta info suc\n");
>> +	return 0;
>> +}
> 
> [snip]
> 
>> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>> +			       struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4sd_output_info *output_info =
>> +			&isp_subdev->sensor_info.output_info;
>> +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop = {};
> 
> Use memset to guarantee zeroing of padding bits.

Sure, will do that and add comments

> 
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_enable_out_ch cmd_ch_en = {};
> 
> Use memset to guarantee zeroing of padding bits.
> 

Sure, will do that and add comments

>> +	struct device *dev = isp_subdev->dev;
>> +	struct isp4fw_image_prop *out_prop;
>> +	int ret;
>> +
>> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
>> +		return 0;
>> +
>> +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
>> +		dev_err(dev, "fail for previous start fail\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	out_prop = &cmd_ch_prop.image_prop;
>> +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +	cmd_ch_en.is_enable = true;
>> +
>> +	if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
>> +		dev_err(dev, "fail to get out prop\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
>> +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
>> +		cmd_ch_prop.image_prop.luma_pitch,
>> +		cmd_ch_prop.image_prop.chroma_pitch);
>> +
>> +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
>> +				  &cmd_ch_prop,
>> +				  sizeof(cmd_ch_prop));
>> +	if (ret) {
>> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +		dev_err(dev, "fail to set out prop\n");
>> +		return ret;
>> +	};
>> +
>> +	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
>> +				  &cmd_ch_en, sizeof(cmd_ch_en));
>> +
>> +	if (ret) {
>> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +		dev_err(dev, "fail to enable channel\n");
>> +		return ret;
>> +	}
>> +
>> +	if (!sensor_info->start_stream_cmd_sent) {
>> +		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
>> +					    out_prop->height);
>> +		if (ret) {
>> +			dev_err(dev, "kickoff stream fail %d\n", ret);
>> +			return ret;
>> +		}
>> +		/*
>> +		 * sensor_info->start_stream_cmd_sent will be set to true
>> +		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
>> +		 * start stream
>> +		 * 2. in isp_set_stream_buf, if app first start stream, then
>> +		 * send buffer
>> +		 * because ISP FW has the requirement, host needs to send buffer
>> +		 * before send start stream cmd
>> +		 */
>> +		if (sensor_info->start_stream_cmd_sent) {
>> +			sensor_info->status = ISP4SD_START_STATUS_STARTED;
>> +			output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
>> +		}
>> +	} else {
>> +		dev_dbg(dev, "stream running, no need kickoff\n");
>> +		output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +	}
>> +
>> +	dev_dbg(dev, "setup output suc\n");
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_init_meta_buf(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	u32 i;
>> +
>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>> +		if (!sensor_info->meta_info_buf[i]) {
>> +			sensor_info->meta_info_buf[i] = ispif->metainfo_buf_pool[i];
>> +			if (!sensor_info->meta_info_buf[i]) {
>> +				dev_err(dev, "invalid %u meta_info_buf fail\n", i);
>> +				return -ENOMEM;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> What is the point of metainfo_buf_pool? Especially since metainfo_buf_pool[i] is
> not set to NULL after this "allocation" occurs.
> 
> I think isp4sd_init_meta_buf() and metainfo_buf_pool are unnecessary and can be
> factored out.
> 

I suppose you mean meta_info_buf, will remove it together with 
isp4sd_init_meta_buf() and use metainfo_buf_pool from ispif directly 
which is vital for ISP FW to carry response info.

>> +
>> +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to  setup fw mem pool\n");
>> +		return ret;
>> +	}
>> +
>> +	ret  = isp4sd_init_meta_buf(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to alloc fw driver shared buf\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = isp4sd_set_stream_path(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to setup stream path\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
>> +				     struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct v4l2_mbus_framefmt *format = NULL;
> 
> Remove unnecessary initialization of `format`.
> 

Sure, will do that

>> +	struct isp4sd_output_info *str_info;
>> +	int i;
>> +
>> +	format = v4l2_subdev_state_get_format(state, pad, 0);
>> +
>> +	if (!format) {
>> +		dev_err(isp_subdev->dev, "fail to setup stream path\n");
>> +	} else {
>> +		memset(format, 0, sizeof(*format));
>> +		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
>> +	}
>> +
>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
>> +		sensor_info->meta_info_buf[i] = NULL;
>> +
>> +	str_info = &sensor_info->output_info;
>> +	str_info->start_status = ISP4SD_START_STATUS_NOT_START;
>> +}
> 
> [snip]
> 
>> +static struct isp4fw_meta_info *
>> +isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
>> +		      u64 mc)
>> +{
>> +	u32 i;
> 
> Change u32 to int for `i` to match other ISP4IF_MAX_STREAM_BUF_COUNT loops.
> 

Sure, will do that

>> +
>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>> +		struct isp4if_gpu_mem_info *meta_info_buf =
>> +				isp_subdev->sensor_info.meta_info_buf[i];
>> +
>> +		if (meta_info_buf) {
>> +			if (mc == meta_info_buf->gpu_mc_addr)
>> +				return meta_info_buf->sys_addr;
>> +		}
> 
> meta_info_buf is never NULL. Also it's easier to read with the constant operand
> on the right side of the comparison. Change to:
> 
> 		if (meta_info_buf->gpu_mc_addr == mc)
> 			return meta_info_buf->sys_addr;
> 

Sure, will remove unnecessary check of meta_info_buf and put mc at the 
right of the comparison.

>> +	}
>> +	return NULL;
>> +};
> 
> Remove unnecessary ; after }.
> 

Sure, will do that

>> +
>> +static struct isp4if_img_buf_node *
>> +isp4sd_preview_done(struct isp4_subdev *isp_subdev,
>> +		    struct isp4fw_meta_info *meta)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4if_img_buf_node *prev = NULL;
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	if (meta->preview.enabled &&
>> +	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
>> +	     meta->preview.status == BUFFER_STATUS_DONE ||
>> +	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
>> +		prev = isp4if_dequeue_buffer(ispif);
>> +		if (!prev)
>> +			dev_err(dev, "fail null prev buf\n");
>> +
>> +	} else if (meta->preview.enabled) {
>> +		dev_err(dev, "fail bad preview status %u\n",
>> +			meta->preview.status);
>> +	}
>> +
>> +	return prev;
>> +}
>> +
>> +static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
>> +				  u64 meta_info_mc)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type = {};
> 
> Use memset to guarantee zeroing of padding bits.

Sure, will do that and add comment

> 
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
>> +		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
>> +			 isp_subdev->sensor_info.status, meta_info_mc);
>> +		return;
>> +	}
>> +
>> +	if (meta_info_mc) {
>> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +		buf_type.buffer.buf_tags = 0;
>> +		buf_type.buffer.vmid_space.bit.vmid = 0;
>> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +		isp4if_split_addr64(meta_info_mc,
>> +				    &buf_type.buffer.buf_base_a_lo,
>> +				    &buf_type.buffer.buf_base_a_hi);
>> +
>> +		buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
>> +		if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +					&buf_type, sizeof(buf_type))) {
>> +			dev_err(dev, "fail send meta_info 0x%llx\n",
>> +				meta_info_mc);
>> +		} else {
>> +			dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
>> +		}
>> +	}
>> +}
>> +
>> +static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>> +				      enum isp4if_stream_id stream_id,
>> +				      struct isp4fw_resp_param_package *para)
>> +{
>> +	struct isp4if_img_buf_node *prev = NULL;
>> +	struct device *dev = isp_subdev->dev;
>> +	struct isp4fw_meta_info *meta;
>> +	u64 mc = 0;
>> +
>> +	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
>> +	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
>> +	if (mc == 0 || !meta) {
> 
> If `mc == 0` is always an error then why pass it to isp4sd_get_meta_by_mc()?
> Change it to skip isp4sd_get_meta_by_mc() when mc is 0, or make
> isp4sd_get_meta_by_mc() return NULL when mc is 0 and then you can remove the
> `mc == 0` check from here.
> 

Will remove redundant mc == 0 check, yes, isp4sd_get_meta_by_mc will 
return NULL given mc input as 0

>> +		dev_err(dev, "fail to get meta from mc %llx\n", mc);
>> +		return;
>> +	}
>> +
>> +	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
>> +		ktime_get_ns(), stream_id, meta->poc,
>> +		meta->preview.enabled,
>> +		meta->preview.status);
>> +
>> +	prev = isp4sd_preview_done(isp_subdev, meta);
>> +
>> +	isp4if_dealloc_buffer_node(prev);
>> +
>> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
>> +		isp4sd_send_meta_info(isp_subdev, mc);
>> +
>> +	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
>> +		isp_subdev->sensor_info.status);
>> +}
>> +
>> +static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
>> +				enum isp4if_stream_id stream_id)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	struct isp4fw_resp resp;
>> +
>> +	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
>> +		return;
> 
> If the lifetime of the kthread is managed correctly, this check shouldn't be
> needed.
> 

The original idea is to make sure isp4sd_fw_resp_func only does real 
work when ISP FW is running, will refine the start/stop sequecece to 
quarentee this is always true so to remove the check.

>> +
>> +	while (true) {
>> +		s32 ret;
> 
> Change from s32 to int to match isp4if_f2h_resp().
> 

Sure, will do that.

>> +
>> +		ret = isp4if_f2h_resp(ispif, stream_id, &resp);
>> +		if (ret)
>> +			break;
> 
> This loop just parses responses from firmware until the ringbuffer has nothing
> new left, which kind of makes the IRQ useless when this scenario occurs, meaning
> that you can mask the IRQ from the IRQ handler and then unmask it when the
> resp kthread goes back to sleep. So the IRQ doesn't fire needlessly.
> 

Very good idea, will add IRQ mask as you suggested.

>> +
>> +		switch (resp.resp_id) {
>> +		case RESP_ID_CMD_DONE:
>> +			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
>> +						&resp.param.cmd_done);
>> +			break;
>> +		case RESP_ID_NOTI_FRAME_DONE:
>> +			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
>> +						  &resp.param.frame_done);
>> +			break;
>> +		default:
>> +			dev_err(dev, "-><- fail respid (0x%x)\n",
>> +				resp.resp_id);
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
>> +{
>> +	struct isp4_subdev_thread_param *para = context;
>> +	struct isp4sd_thread_handler *thread_ctx;
>> +	enum isp4if_stream_id stream_id;
>> +
>> +	struct isp4_subdev *isp_subdev;
>> +	struct device *dev;
>> +	u64 timeout;
>> +
>> +	if (!para)
>> +		return -EINVAL;
>> +
>> +	isp_subdev = para->isp_subdev;
>> +	dev = isp_subdev->dev;
>> +
>> +	switch (para->idx) {
>> +	case 0:
>> +		stream_id = ISP4IF_STREAM_ID_GLOBAL;
>> +		break;
>> +	case 1:
>> +		stream_id = ISP4IF_STREAM_ID_1;
>> +		break;
>> +	default:
>> +		dev_err(dev, "fail invalid %d\n", para->idx);
>> +		return -EINVAL;
>> +	}
>> +
>> +	thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
>> +
>> +	thread_ctx->wq_cond = 0;
>> +	mutex_init(&thread_ctx->mutex);
> 
> This mutex doesn't protect anything. Remove it.
> 

yes, will remove it.

>> +	init_waitqueue_head(&thread_ctx->waitq);
>> +	timeout = msecs_to_jiffies(ISP4SD_WAIT_RESP_IRQ_TIMEOUT);
>> +
>> +	dev_dbg(dev, "[%u] started\n", para->idx);
>> +
>> +	while (true) {
>> +		wait_event_interruptible_timeout(thread_ctx->waitq,
>> +						 thread_ctx->wq_cond != 0,
>> +						 timeout);
> 
> Why is there a timeout? What does the timeout even do since the return value of
> wait_event_interruptible_timeout() is not checked? Doesn't that mean that once
> the timeout is hit, isp4sd_fw_resp_func() will be called for nothing?
> 
> I observe that most of the time spent by these kthreads is due to the constant
> wake-ups from the very short 5 ms timeout. This is bad for energy efficiency and
> creates needless overhead.
> 

Good catch, previouly before IRQ is really enabled, this is to make sure 
ISP can work normally even for 120fps sensor, since now IRQ is enabled, 
we can increase the timeout value to like 200ms to avoid the unwanted 
timeout caused wake-ups.

>> +		thread_ctx->wq_cond = 0;
>> +
>> +		if (kthread_should_stop()) {
>> +			dev_dbg(dev, "[%u] quit\n", para->idx);
>> +			break;
>> +		}
>> +
>> +		guard(mutex)(&thread_ctx->mutex);
>> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
>> +	}
>> +
>> +	mutex_destroy(&thread_ctx->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct device *dev = isp_subdev->dev;
>> +	int i;
>> +
>> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
>> +		struct isp4sd_thread_handler *thread_ctx =
>> +				&isp_subdev->fw_resp_thread[i];
>> +
>> +		isp_subdev->isp_resp_para[i].idx = i;
>> +		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
>> +
>> +		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
>> +						 &isp_subdev->isp_resp_para[i],
>> +						 "amd_isp4_thread");
> 
> The kthread name and also the IRQ name can be made more informative by appending
> the index number.
> 

Yes, will use distinct names to differentiate multiple kthreads and IRQs

>> +		if (IS_ERR(thread_ctx->thread)) {
>> +			dev_err(dev, "create thread [%d] fail\n", i);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> [snip]
> 
>> +static u32 isp4sd_get_started_stream_count(struct isp4_subdev *isp_subdev)
>> +{
>> +	u32 cnt = 0;
>> +
>> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
>> +		cnt++;
>> +	return cnt;
>> +}
> 
> isp4sd_get_started_stream_count() is unnecessary, remove it and just use
> `if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)` instead.
> 

Sure, will do optimization as you suggested

>> +
>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +
>> +	struct device *dev = isp_subdev->dev;
>> +	u32 cnt;
>> +	int ret;
>> +
>> +	mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
>> +		dev_err(dev, "fail for stream still running\n");
>> +		mutex_unlock(&isp_subdev->ops_mutex);
>> +		return -EINVAL;
>> +	}
>> +
>> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>> +	cnt = isp4sd_get_started_stream_count(isp_subdev);
>> +	if (cnt > 0) {
>> +		dev_dbg(dev, "no need power off isp_subdev\n");
>> +		mutex_unlock(&isp_subdev->ops_mutex);
>> +		return 0;
>> +	}
>> +
>> +	isp4if_stop(ispif);
>> +
>> +	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +	if (ret)
>> +		dev_err(dev,
>> +			"fail to set isp_subdev performance state %u,ret %d\n",
>> +			perf_state, ret);
>> +	isp4sd_stop_resp_proc_threads(isp_subdev);
>> +	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>> +	/* hold ccpu reset */
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
>> +	ret = pm_runtime_put_sync(dev);
>> +	if (ret)
>> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
>> +	else
>> +		dev_dbg(dev, "power off isp_subdev suc\n");
>> +
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +	isp4if_clear_cmdq(ispif);
>> +	isp4sd_module_enable(isp_subdev, false);
>> +
>> +	msleep(20);
> 
> What is this msleep for?
> 

This is the HW requirement, at least 20ms is needed for the possible 
quickly open followed.

>> +
>> +	mutex_unlock(&isp_subdev->ops_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
> 
> `ispif->status` is checked under ops_mutex elsewhere but not in this function?
> 

As you suggested below, will use guard(mutex)(&ispsd->ops_mutex) to 
protect isp4sd_set_power, so this won't be a problem any more.

>> +		dev_dbg(dev, "camera already opened, do nothing\n");
>> +		return 0;
>> +	}
>> +
>> +	mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +	isp4sd_module_enable(isp_subdev, true);
>> +
>> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
>> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
>> +
>> +	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
>> +		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
>> +
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret) {
>> +			dev_err(dev, "fail to power on isp_subdev ret %d\n",
>> +				ret);
>> +			goto err_unlock_and_close;
>> +		}
>> +
>> +		/* ISPPG ISP Power Status */
>> +		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
>> +		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"fail to set performance state %u, ret %d\n",
>> +				perf_state, ret);
>> +			goto err_unlock_and_close;
>> +		}
>> +
>> +		ispif->status = ISP4IF_STATUS_PWR_ON;
>> +
>> +		if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>> +			dev_err(dev, "isp_start_resp_proc_threads fail");
>> +			goto err_unlock_and_close;
>> +		} else {
>> +			dev_dbg(dev, "create resp threads ok");
>> +		}
>> +	}
>> +
>> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
>> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
>> +
>> +	ret = isp4if_start(ispif);
>> +	if (ret) {
>> +		dev_err(dev, "fail to start isp_subdev interface\n");
>> +		goto err_unlock_and_close;
>> +	}
>> +
>> +	mutex_unlock(&isp_subdev->ops_mutex);
>> +	return 0;
>> +err_unlock_and_close:
>> +	mutex_unlock(&isp_subdev->ops_mutex);
>> +	isp4sd_pwroff_and_deinit(isp_subdev);
>> +	return -EINVAL;
>> +}
> 
> [snip]
> 
>> +static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>> +{
>> +	struct isp4_subdev *ispsd = to_isp4_subdev(sd);
> 
> `ispsd` is the variable name used here and in a couple other functions but
> `isp_subdev` is the name used everywhere else. Make the variable name consistent
> for `struct isp4_subdev *`.
> 

Yes, will unify the naming

>> +
> 
> Add `guard(mutex)(&ispsd->ops_mutex);` here and remove all uses of ops_mutex
> from isp4sd_pwron_and_init() and isp4sd_pwroff_and_deinit(). This simplifies the
> locking and also ensures that the lock is not released and reacquired when
> isp4sd_pwron_and_init() needs to call isp4sd_pwroff_and_deinit() on error.
> 

Very good suggestion, it will make code simple, will do that.

>> +	if (on)
>> +		return isp4sd_pwron_and_init(ispsd);
>> +	else
>> +		return isp4sd_pwroff_and_deinit(ispsd);
>> +};
> 
> Remove unnecessary ; after }.
> 

Sure.

>> +
>> +static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>> +	.s_power = isp4sd_set_power,
>> +};
> 
> [snip]
> 
>> +int isp4sd_init(struct isp4_subdev *isp_subdev,
>> +		struct v4l2_device *v4l2_dev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4sd_sensor_info *sensor_info;
>> +	struct device *dev = v4l2_dev->dev;
>> +	int ret;
>> +
>> +	isp_subdev->dev = dev;
>> +	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
>> +	isp_subdev->sdev.owner = THIS_MODULE;
>> +	isp_subdev->sdev.dev = dev;
>> +	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
>> +		 dev_name(dev));
>> +
>> +	isp_subdev->sdev.entity.name = isp4sd_entity_name;
>> +	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>> +	isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
>> +	isp_subdev->sdev_pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 1,
>> +				     &isp_subdev->sdev_pad);
>> +	if (ret) {
>> +		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
>> +		return ret;
>> +	}
>> +	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n",
>> +			ret);
>> +		goto err_media_clean_up;
> 
> Missing error handling: v4l2_subdev_cleanup() is not called.
> 

Good catching, will add it.

>> +	}
>> +
>> +	sensor_info = &isp_subdev->sensor_info;
>> +
>> +	isp4if_init(ispif, dev, isp_subdev->mmio);
>> +
>> +	mutex_init(&isp_subdev->ops_mutex);
>> +	sensor_info->start_stream_cmd_sent = false;
>> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>> +
>> +	/* create ISP enable gpio control */
>> +	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
>> +						 "enable_isp",
>> +						 GPIOD_OUT_LOW);
>> +	if (IS_ERR(isp_subdev->enable_gpio)) {
>> +		dev_err(dev, "fail to get gpiod %d\n", ret);
> 
> This prints ret instead of the actual error, PTR_ERR(isp_subdev->enable_gpio).
> 
> Instead, add `ret = PTR_ERR(isp_subdev->enable_gpio);` before the dev_err().
> 

Yes, will modify as you suggested.

>> +		media_entity_cleanup(&isp_subdev->sdev.entity);
>> +		return PTR_ERR(isp_subdev->enable_gpio);
> 
> Missing error handling: v4l2_device_unregister_subdev() is not called.
> 
> Add another goto label and use that instead of returning here.
> 

Sure, will modify as you suggested.

>> +	}
>> +
>> +	isp_subdev->host2fw_seq_num = 1;
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +
>> +	if (ret)
>> +		goto err_media_clean_up;
>> +	return ret;
> 
> ret is always zero at this point. Remove this `if (ret) ...` and change the
> return to `return 0`.
> 

Yes, that's ture, will modify it.

>> +
>> +err_media_clean_up:
>> +	media_entity_cleanup(&isp_subdev->sdev.entity);
>> +	return ret;
>> +}
>> +
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +
>> +	media_entity_cleanup(&isp_subdev->sdev.entity);
>> +	isp4if_deinit(ispif);
>> +	isp4sd_module_enable(isp_subdev, false);
>> +
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +}
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
>> new file mode 100644
>> index 000000000000..524a8de5e18d
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
>> @@ -0,0 +1,131 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_CONTEXT_H_
>> +#define _ISP4_CONTEXT_H_
>> +
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/types.h>
>> +#include <linux/debugfs.h>
>> +#include <media/v4l2-device.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_hw_reg.h"
>> +#include "isp4_interface.h"
>> +
>> +/*
>> + * one is for none sesnor specefic response which is not used now
>> + * another is for sensor specific response
>> + */
>> +#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
> 
> Only two out of four possible streams are used, yet IRQs are requested for all
> four streams in isp4_capture_probe(). ISP4SD_MAX_FW_RESP_STREAM_NUM should be
> checked and used to limit the number of IRQs requested in isp4_capture_probe().
> 

Yes, and only two IRQs are used, we reduce IRQs from 4 to 2 and request 
the used ones in the isp4_capture_probe

>> +
>> +/*
>> + * cmd used to register frame done callback, parameter is
>> + * struct isp4sd_register_framedone_cb_param *
>> + * when a image buffer is filled by ISP, ISP will call the registered callback.
>> + * callback func prototype is isp4sd_framedone_cb, cb_ctx can be anything
>> + * provided by caller which will be provided back as the first parameter of the
>> + * callback function.
>> + * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
>> + * unregister the callback
>> + */
> 
> [snip]
> 
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev);
>> +
>> +#endif
> 
> Add /* _ISP4_CONTEXT_H_ */
> 

Yes, will update and check all other header files, sorry for the bad 
macro name, will change to _ISP4_SUBDEV_H_

>> -- 
>> 2.34.1
>>
> 
> Sultan

-- 
Regards,
Bin


