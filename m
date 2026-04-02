Return-Path: <linux-media+bounces-57932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DpYJD4uzmnIlQYAu9opvQ
	(envelope-from <linux-media+bounces-57932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:52:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34182386511
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35D383045279
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F51939FCC5;
	Thu,  2 Apr 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mD/s6PGg"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FAA325726;
	Thu,  2 Apr 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119900; cv=fail; b=EMq8m/0aawW1QK1joT5p2l7ZyND8rS+2fHWciMzttzXjw/IFdllE7lpkNnIlo8R8ETb6IoZtah8I2zVyWPegKCxxbwLu3gRJeECSaFyKCzmOypFgN3+X2A7A+gbyRbp+NGlhTyU0XdYDAn4ecbjBYalrsKakAXF6JunphjPYFwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119900; c=relaxed/simple;
	bh=zUYCdo/UrwSKBZ9rOw6VATluUMJI63mm6aQDtmywBx8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uQV/hm569fhJdcddBajYUHrpFk83WbqdEEnUvE9Lb1p36y/7jYXLX1gMeM1vvxi6tQ88pDuXjRMQc2Q0vpHxT/RqSRORJ/5Hj6Yiz9pP7HpKdcy6pYT+tBO+sVMAmJcnAlmjpfYRzvN2N5rIRRCyEr7cW8ziFS3TMi0crYwzkfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mD/s6PGg; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbQ63ABYxRqX1j8GXSY+O5sSK9wMtyBS15vhpAxx+KV5FT+Cmw0wn+ClvwiUoO0SYPRnQWS/GuHDxJDuUYt/x8HxOpFbq+ptbZkC6im8XvxCY0yGHSXiQCtIL03FEdzeHmGopoxaB1bjLGmH5eS6k27lYRlWXH16U60amCp5ejt8CBwptUtyREnzAClkYydCX4crR7tSW6ZaKp+tIauCqloFDuIV6j5g/24CB0uGh27kgqO3hUjxWp0s2cDFaUsJFkmocyzMpZR4LkLGWIS3rjF0JZAL+pA44czPl5072sfMf9pGxaP5stuklR+tf4v0sVylBhqiKPXOVNXcL+jJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfYFd+OYL6X+fIJMKO6wCt+DP0m7OAFnvn6SbXDBQIc=;
 b=TkzXtOs+7cIDj6pTggZi1QTJ7E3I2L7qN68kQ6Ds5b53VpmMrtzGnLmV33St/8ZUPNQVif1B+QUVdkqT4qpXnE35fLfd3PWGbsxRQgFCQODHR9Zs2XItdtNS1DO9ktJWX1l1Y8tW+1W2v50adkgT3T6j3tD1P1z0B5Vcpberh4fCKQa+JVQC4hMEAiNiMjTOphHudQRai+ZA91P8P/81w7RqSThvsZmLSRhOcleCweiVwNVUHLwt1rvIajtcAmAYJ4BL+roHOTXwcXvWIS1G2fvFfOi2U4KEZdH/WZbtgBuwG1XRJobQSy+8YjPMUg2Iw9Uyr2Oou1eioxTRHxl1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfYFd+OYL6X+fIJMKO6wCt+DP0m7OAFnvn6SbXDBQIc=;
 b=mD/s6PGgUAjbFq/zc676GJKTozEsgR3fuIChSSfT89tQd8824o6vloigYun+iWYKQbLYufWChrFwDpEUW2jMNMLg/eV9wZsGn+omvGxJxubRszrjJ//W8sYkTyl/vQ80bpYNdXcAZl/K63HVFvSRZ7W2iE9kUR3Bxbf02OzMNh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 08:51:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:51:33 +0000
Message-ID: <9c1545d0-6a5d-4260-b921-e8b1d3525f33@amd.com>
Date: Thu, 2 Apr 2026 10:51:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
 <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
 <998ce121-e027-441d-a3f4-2f3e41e10830@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <998ce121-e027-441d-a3f4-2f3e41e10830@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 4162e61e-251b-4917-f30a-08de90950a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B7Mx2G/D/bguQBr7wYKmKlgw7h/ymHSBxi6DbEESlZR1PPZjacbgfrQbdgTobkq97Ph5aYK/Wrstgcm7OAstI8fY8ghm9m0qcIHwYVS+MdhcrQhlXpUpWM0CnK825iaXCB4JxGmWRRWTxA9vWdQcG1p+l6arBpHYkdJIbwPMdaseSbJ8mOBWBJbPZHe5orXHWap7DZxWSley1POhsElLTNSyaKg3oYYh9rbcb5WUc/2gwxY6dJiEZZnZ6pbID9TUtv3gUC2LkFIxJzj4AG62qlaa3sIEGC+aKwp2HjEVydSSj7Lsv5dzQrIEE3H8Dynk91x+NQULbOAIKPgX1Jj4EskRLG7gbaDYB4Xd9sk9az1LGoiElz9kmetzF8D8OwsDkK8s95LIbHq7v3F4fgeVCj+0tVsi7RBoPMBitWws4KsgZ7BQfSYvGAccHoojRLi5jtLFkJ0PvyUo4HM00H7dvKPODk84ebSsEzCdetEsaNC3iDr89gM3YCgVTqcPs5yeEJLCxLtPZeqNUi47QUFUKfBNLE2jA2Ge2Wga3kYQujeepTQH76CN7/7zOVELp9+WTjpzJnr+WTVCgZcWwZag+FPs/yGvdyZJ2M9jkzMti+mX6Z92sjP5tNMCiZrlaO3hJ4ISaCNAiPGlpSYTybpdxmf6jZ3dwStaMHwaPNLztovB5J8/LBkmXiCF7T9Wqk9ba1mZ1Oo26GpgjzkL3IeWtZfbRcOhrnMnDzuM/ffHkF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDdoTjZSVFRTSk9IK1BPdkxDTis0dE1YcDFZMTJQbGZDMnQ5UkhmV0NVV3JV?=
 =?utf-8?B?cTVqb0N4eFkvRkk3RzY1N1Vxenk2NkZ4NkhNdk9kR0VDMHJqRmo4eHVFcWpM?=
 =?utf-8?B?WlMweXJObUg5Z3ZXclNmMVZjSEYySE4yUDdncGZWOUQ5T2dXNFlIdGFReDh4?=
 =?utf-8?B?K1pFb2FFY3oyVndDNm4yVzllTDhnTTZXV0FoaklteWZpYjdpYXNhbStnd1cy?=
 =?utf-8?B?Mnk0dGZvZ3RQNXVmYTBXR2txMEc4WUVCVlordG5rcTdWRmliQlExbUZaRTZK?=
 =?utf-8?B?bmhjSlJPMDYzUnpobGx0aVdXcmtza3UxRVZsWjV1RXBMMndKSkgyTER4RHZ3?=
 =?utf-8?B?eGRDanVnZnlkRWE0K2k2ZEVHWVFrMXhyWld4clFmbk11RUlYbzJld3BIaWkr?=
 =?utf-8?B?YTQwcEIyS2pyb1JYR3lEaUdyZUdkZkZYZGtqNTJTdmRHQ09rMlA1RjRrVVpR?=
 =?utf-8?B?Q3RiUmJvMC9ySnNvRkhuNGtac2ZWeXhpOXV2T2dZMzNqU1hhRWFpYm1RZm85?=
 =?utf-8?B?ZDJNd1NEbGljWi8vOFo0OHZqL01LMEUwRUNKS2ZjVnFLNzNnNW8zYmlXdHJ0?=
 =?utf-8?B?NDBKeHpyOGpTSUU3Qno5eFE0TndGU0k5WGxDL1FITndWNXhFdkxpSjNkZTZK?=
 =?utf-8?B?cjcwVFZ6QXlCeXFEaHA4M084ZUNZMnh6L29MZHQ1VmpLeEpJYmU0MWtGZkdY?=
 =?utf-8?B?OVVpQUpHZU4vcWpHOHJsbm5iOTU1NWIzM2dvZkZSRmZmSXBwQXJHRGZsR0J5?=
 =?utf-8?B?YjVjOWtwQ0VwdHBJZm5YUzM0aEZmdHQyN1RvWUJvWXhEdGZyazR1Q0lNdkNU?=
 =?utf-8?B?UFkzY09Gb3VpNzlTcTZwZ3FIS1IxV3BvUEZaTDZCSUlQUkRnUGhBN2VjeG4v?=
 =?utf-8?B?bnpVcDdlSXlDQjlvOFp4OVJCcHFTMVgwbWUxK1duOWNaUlJDSmZtNG9SVC80?=
 =?utf-8?B?M2FzUTdDT09aUjRUNjlSRjJGdVB1QmRXWnE2SzJHOFEzWmxBRGtROUhXUERR?=
 =?utf-8?B?RFZCMmdzUlM5K21KZERYL2JiMDg4MERONVZBUUduc2g0NHVmR0pvREhxSi9u?=
 =?utf-8?B?Uy80S2thMU85OEhBMzBUeFpMYUE4VFpaeDFRQ3pvc2JMZVA3cDJyVFRDTlBu?=
 =?utf-8?B?WHZuTmNNeUZYZVdNZEtQTnlvMU9NNko0QS9RTDFnUzBoZUdVclVRd0RMZ2lX?=
 =?utf-8?B?SVgyeVRXWXp2R1Vtb1lBaU04ZDVCbGsxSWdrbktHdm9mWUVOaUllMjYrUUVJ?=
 =?utf-8?B?NDc3bkh3NVUvME40RVRpbktyQ0NrZVFndmlYZGhQWUk3aGtLU1pYZTN5Y1pL?=
 =?utf-8?B?KzYxb1FKVGhVb2s5TlJkN2ZhbjRiVkpLNVN5aVRBSlUrWmxlSTNlbGlCdGIz?=
 =?utf-8?B?SHlnR3NVRkp3b2hvZHRzT0szQWo1ZTFjY3VCeHMvU2RCajF0S3VyVFFrYlhC?=
 =?utf-8?B?NmJLcStBc1hBSUtqSGY4dWh6Q2VRL0VUNjdmdVhHdmdLM21LK0FmZ2JpeEVn?=
 =?utf-8?B?Nkk3ekpaWW5qcXhuUmtWVDFZL3hJV0RxMnhIbFYwN1Q2NFZGaXZ0YWpCdHBw?=
 =?utf-8?B?NzdFdHJBNVNHQnZDemFXR1VjV3BvWktEM1dWMDA2M0FKVW0xYStSSjRPNUYv?=
 =?utf-8?B?THlld0U2cjNOcTUwTVF4M1lWMVQ4VlhCbkJTWEQzYXB2bVBsT2pvQVBPczl1?=
 =?utf-8?B?TWYzcjR1RW15V0dYQUpKcFVwdTZObmw3K1JnZ0pncFdnc05lK1czU0g1bWJk?=
 =?utf-8?B?REpqWTF2SjVFSlNNdG5od1V2V090SDRXRHdjMUVJeHdaUXhrSDMvYnBudENs?=
 =?utf-8?B?VGd6NWhDRDJ6VnUrTFlWRGsyc09wbkIrbnpVUjMvMUEvaHI2WThvem13aWc0?=
 =?utf-8?B?YStYYUpCSzcvQldEdjVHM3N1ZERmOEJxVmJjaDhKOGU2MXIzOGdWRVkxSGF0?=
 =?utf-8?B?NVpzc1FKYzRSNnp6eHVXQWxWRnVhaTVmQUVjd1JwY09TTlZFU1kwOGp4WGJ6?=
 =?utf-8?B?eENwZ05qWTBpRE5DV2JTbHFRTXlaZGljV3VJNFYyU0ZBek9TODF6Wmw2VmRI?=
 =?utf-8?B?UWZUQ2s1blMrRWhIbkxsQVpFVTZiR1JEaVh5VWZzd2lUYWxpemtCS0Z4N2pa?=
 =?utf-8?B?TERMVFQybFlxVS8yalZLMWNpQ24rR0VtUlVqNkRESC9KMlpCY29zQm9VeHN5?=
 =?utf-8?B?ZXdjVmUzZCs2VXJrQXVjSWh0d1kvaXF1MzFWb1o1R3Z4enZlOHV5OWVkRWRG?=
 =?utf-8?B?bGVNLzBHcHZSVkEvbjZLT2tVekw1R3oxckNlbENBTUdOWFZVUWhQN1VRNTRC?=
 =?utf-8?Q?4/CE1y1oxCy4eB6hTz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4162e61e-251b-4917-f30a-08de90950a46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:51:33.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/XRxMWkAvpNNl8Q7G6CWyWR0PZDVl21g6ICTR65EiOfwpP5VHY4vM/3zqPQ8YdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57932-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 34182386511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 10:36, Ekansh Gupta wrote:
> On 3/9/2026 12:29 PM, Ekansh Gupta wrote:
>>
>> On 2/24/2026 2:42 PM, Christian König wrote:
>>> On 2/23/26 20:09, Ekansh Gupta wrote:
>>>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>>>> it with the existing per-process memory manager and IOMMU device model.
>>>>
>>>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>>>> including dma_buf references, attachment state, scatter-gather tables
>>>> and an imported DMA address used for DSP-facing book-keeping. The
>>>> qda_gem_prime_import() path handles reimports of buffers originally
>>>> exported by QDA as well as imports of external dma-bufs, attaching them
>>>> to the assigned IOMMU device
>>> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
>> dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
>> This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
>> the correct way, what should be the right way here? On the current fastrpc driver also,
>> the DMABUF is getting attached with iommu device[1] due to the same requirement.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779
> 
> Hi Christian,
> 
> Do you have any suggestions for the shared requirements?

Well I don't fully understand what you are trying to do with the iommu. Usually it is the job of the exporter to provide the importer with DMA addresses which are valid for its device structure, that includes IOMMU mapping.

Can you iterate what exactly this iommu group is and why you have to attach the imported buffers to it, how that attachment works and how lifetime is managed?

Regards,
Christian.

> 
> I'm reworking on the next version and currently I don't see any other way
> to handle dma_buf_attach* cases.
> 
> //Ekansh
> 
>>>> and mapping them through the memory manager
>>>> for DSP access. The GEM free path is updated to unmap and detach
>>>> imported buffers while preserving the existing behaviour for locally
>>>> allocated memory.
>>>>
>>>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>>>> which records the calling drm_file in a driver-private import context
>>>> before invoking the core DRM helpers. The GEM import callback retrieves
>>>> this context to ensure that an IOMMU device is assigned to the process
>>>> and that imported buffers follow the same per-process IOMMU selection
>>>> rules as natively allocated GEM objects.
>>>>
>>>> This patch prepares the driver for interoperable buffer sharing between
>>>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>>>> lifetime handling consistent with the existing GEM allocation flow.
>>>>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ...
>>>
>>>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>>>                 qda_err(NULL, "Invalid GEM object size\n");
>>>>                 return -EINVAL;
>>>>         }
>>>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>>> -               return -EINVAL;
>>>> -       }
>>>> -       if (!qda_gem_obj->iommu_dev->dev) {
>>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>>> -               return -EINVAL;
>>>> -       }
>>>> -       if (!qda_gem_obj->virt) {
>>>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>>>> -               return -EINVAL;
>>>> -       }
>>>> -       if (qda_gem_obj->dma_addr == 0) {
>>>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>>>> -               return -EINVAL;
>>>> +       if (qda_gem_obj->is_imported) {
>>> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>>>
>>> Userspace needs to mmap() them through the exporter.
>>>
>>> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>>>
>>> ...
>> Okay, the requirement is slightly different here. Any buffer which is not allocated using the
>> QDA GEM interface needs to be attached to the iommu device for that particular process to
>> enable DSP for the access. I should not call it `mmap` instead it should be called importing the
>> buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
>> should the dma_buf_attach* calls be moved to some other place?
>>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>>> +                                          struct qda_gem_obj *gem_obj,
>>>> +                                          struct qda_iommu_device *iommu_dev)
>>>> +{
>>>> +       struct scatterlist *sg;
>>>> +       dma_addr_t dma_addr;
>>>> +       int ret = 0;
>>>> +
>>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       gem_obj->iommu_dev = iommu_dev;
>>>> +
>>>> +       sg = gem_obj->sgt->sgl;
>>>> +       if (sg) {
>>>> +               dma_addr = sg_dma_address(sg);
>>>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>>>> +
>>>> +               gem_obj->imported_dma_addr = dma_addr;
>>> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
>> I might have a proper appach for this now, will update in the next spin.
>>> Regards,
>>> Christian.
> 


