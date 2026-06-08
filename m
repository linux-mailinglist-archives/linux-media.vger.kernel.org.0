Return-Path: <linux-media+bounces-64133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xyjuBlBkJmowVwIAu9opvQ
	(envelope-from <linux-media+bounces-64133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:42:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED965333B
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:42:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="y0/ShAL4";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64133-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64133-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E8CE3012BC0
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CEC382F0D;
	Mon,  8 Jun 2026 06:42:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E13290B0;
	Mon,  8 Jun 2026 06:42:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900931; cv=fail; b=jqylXpmI0IT+HwGmaJI+PlIRL5YlQmS7UabRzVcR2iDQ04Gmiqp2klDJyODiQJzRZSoN/bq1WVD58xTruDFdG1FTa9zSFjPXnD2yLZ23JudqnCAv8fC+fxkad0L107Wwl1QAT1LhQfzv2xnNbxsWZJYkICXwGjMu2AL9BsDI4Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900931; c=relaxed/simple;
	bh=23WTCwX9cUbM2+8Cw+OOZoXT1uKwnPScB/Y25s3niJc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NGKzDkdzGgceFU+v+xelRnfpgcZump6HEJeTg6XaxT7QUSPI/i+oMWtYONhJhhptFu7sH74jN3VxZzoSchzRt/nh/40fxevueQdES0JOwz8Qiofh5buozeFinOqx+sPEfaFVQUQMbOYAdpXikbQ5YGgrmg98mZ0KKaQNY/ry4yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y0/ShAL4; arc=fail smtp.client-ip=52.101.201.47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0DhbrrfSCzZbOuyO/b1bLaAp2p2T/ViVl3GQnDf/gRfo9TtKd5jzQ+NlvNsigXQKOCLgVYS6d2/gismNRBJyYyqYBEr3OWSlsN1uHUnMouGSbBPNP6+wQ7yVVt/NmahSQk9yM6+waR8PKp/WoqGO9RcQgsOgUSGRjv/UisCES+/7I/clc956F8F/49enKpUprkA+OGRHJlPIZRP21+2nSUzBBXfwZEu2EKzgMWTQqghem6dovDrFztvumowZK+R+xPzhtnU/CXPGvXVnOsQsBLkv8/I7nyhxIntSrH81NYU3AAUXN/RQYdHRTHbf5q5FcglZRbntQ2RYWKKkPRfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/S1yzBaxcOKzcVQoqSHiatBx5MJa01Q0+RQecGvJTM=;
 b=l7quJ1V9z+G76WP3obzjZ3l2/F9L3ksx1AkhwQRhZGnIMLukdGfsN6wRU/n7jEucvNZs8JcW6jdhWZQA+AQ6nR5W88nVjmyG3KutsmSwGE0l1VuDAGa6LT1gLYJg2PXNNlCPie25UweBUbNozmuEvIfHSUuz8XQPz3gzlUxF7CgIhAm5dFl67pzh2IMpxE41i5c7+fM9Rxx+YF1bPy6FL8V09PnBxWpnynVRQyxIdLcMAamcOv3Y8rJY/nnyqCA6iCAjrmP5y8+PReCeWQ5304dE/SFc9PfZBNQwespXhOwGmOzyR7eQkYi66MW+7s/uG2J/FsgGkjQki6z7P3mxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/S1yzBaxcOKzcVQoqSHiatBx5MJa01Q0+RQecGvJTM=;
 b=y0/ShAL47Q57dmPcdLmxmBNkWDIwVvgRsYCbBy5jW8ecEwMc0O1P3zlklWUU7LHU1AXlhg9uq6g43mq0Mm9Kd5c+GfEQmkb0QjELaNJ9MBuUov9Z1kXvwbKgaBVwu12tyqm43HJOh7Hs8oBJPX84mpnQrO/4N2zKQUWtw+JG5M4=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 06:42:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 06:42:06 +0000
Message-ID: <0c86f5d3-b5e9-4cac-aa9d-30c5c8ecca66@amd.com>
Date: Mon, 8 Jun 2026 08:41:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
 <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:208:52d::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6a4d1a-a5d4-4e1d-1006-08dec5290ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099006|11063799006|4143699003|10063799003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mY4KyWWW0DcqHFDH+GljXAMQF0w7k8a1NECDugI5OUcyPiXURfHEw5L0H/jjaAnk3afo4QTZo+u6m2XH0NHN9SJOKbCFmcJ1evcJdFmLG6LpGa/zi8j6bHdsuoSSua3Rkg+HgIzesf8u7RiQuQ+m9nvtNAB3o2WCU3xBOsOPTYAwZK8Equvc4D9LNP8xGUh+ICyCGNFZVGWb5lNPeP+MIeThSqxhEL8ung5pCW+as9+cKbKzmm9RUshI4Xvjd8hYnr+vClEZztf7ZPaoLkJLADyAWlmRRI0wnO2qprrRSl5XR3ZweDqI4D6bcp4ZEIlhaf6u+l5ybfV2hVEqg7mhHD30dc59KpRf8iBBMm75YSwPIt/mJsw0LIJSjG0IghyegtGONKeleUFZxTbtRcDNr8kAyWXiMmYqDMsoTBCVfQ+YTkxXMTtabYvxZv3YmF5sutipWihqpUozfk9No7sSIx2iREOrXDdcyCxWQKuI9Pk8FwkZ5vRgDciLJKxjwCOfeamor00J733RqlWjYmi8M6XTaiR0GT2HMOcEUiQ05DYXuaFpJOOLgfYkHjz4YPiVUkJ4ziWqbyY1GHuH1YtAMhVQjbuPjd9SQyRPYGzrU0O8NfVo3cyN0b0NAOsSK2O7qw1s4Oo4x42XafsWJ7wiqihXairzTs/a2A7nRu03MDQ22RQmKb8ZToKwSLLjKBUK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10063799003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVdnM1dSOFkrcFBwMldRMVh6Q21lcDZKbmNHM1k4eG13SHdiSUZIVWN4b2xh?=
 =?utf-8?B?RGxYdmR1VkRaazJqdjhSdnViUzJTQkJ3OGswQUpBUGRnQ2pSZVQyZVlBelNp?=
 =?utf-8?B?UzBucXF3ak5LVVZnSUtoLzRnRTlrLzRxWCtXODltNkZRVng4SERBSTA3UWtM?=
 =?utf-8?B?U3RUcTY1T3dnLzBLcnRycHZOZUhIUEV1TkFlUkIxQ3RNTWJJaGIwWHdia2oy?=
 =?utf-8?B?dktjZytyTHJaZ2dsOURBcmIxNkJSUU5yMk03czJyVHRDaUJqOHlDeW1pWnAw?=
 =?utf-8?B?aE5oWVNsYmwrVHJuSFM5MHJxZHl4WEo1emg5aEJDVWc2eVpocVpZVndKbm1r?=
 =?utf-8?B?Nnk5QlltV0doYW1QRXlqUFQ3THZibk90ZHpxaWJEL1hPUUNZUWhKa09WamMx?=
 =?utf-8?B?RkZBaTNrRHkxTTlkQTNHL2FSTS9JWmdxcWJ1eVptQlJBamZRYWd2L1M4dlgz?=
 =?utf-8?B?ZXRhVkZlWnNBT0d2YSszS0JWa0svUEhzeXhRejBIS2t1T0ovZ3laSEY4Uzkv?=
 =?utf-8?B?cDFFc0kxaUtHMnRudFk1ZS8rcWw1b1VkcU4rZFYvVHdkR25aR2k4d1hsNzJM?=
 =?utf-8?B?Uy9rUCt1QThHQjAwd211N3B6b2xqOHhOaFArb3BKZFkwOEt1eGJmYlFGVEdV?=
 =?utf-8?B?VWpyRlE3YjR2VEpvUklXbFpCVlhLZ0xJejRGSDc3WGFaZStBemswR25QOFJD?=
 =?utf-8?B?MXV2ZmVIM2xoeWlDekd0aWlmVzJxc0gzeVpWdFlsaEU0SFBLa0IwOTRCbXBL?=
 =?utf-8?B?WVdkS1RJUXE0N3BBVE9RMHJNV1h2ZUNTcWFtem5uVDJkbE5OWXJPUXpQZTFh?=
 =?utf-8?B?aklLLzhSVXA3ZHB4d2hldjNmOFhBSVp3dmxmOTdpNS9ZMkxlem91SkRiejE5?=
 =?utf-8?B?dHJkcnhZM1d3V2M5V0VMelBSaWFGSFFZb3kzSzJqZVdSMFlFdm93M1dhazBu?=
 =?utf-8?B?VmZnWkh6N2RHbDY3TFVpUnhhMllTbGZSNEE3SSs4NjlzWTlrbmZXdHVpZCtr?=
 =?utf-8?B?OXpSVFlQNFVmMURZcjNwRWFzVEx1UUQ5a3Jkc2VzVDZjZjNuRk1NUnhXS29F?=
 =?utf-8?B?TzFjUVFyTTJGbFc2bXFRT3Y3eTUzd2dmbVozQjVoVGVPcUo1WUdTelNwRkxZ?=
 =?utf-8?B?UTlhWjJSZlNEOGd6aFJpa2R5c1JIdDNtSlBDUnR5QmpvODFDdWFMTGhDTFhI?=
 =?utf-8?B?WDcwWVdLdjd0VnBLdEpsVXo0aVRubWxuRkdJZGdJc0VveklqQnI0aE90Wkl0?=
 =?utf-8?B?Zk9KSlpSb09WWXZxN3hyS0tZZDZUSFFqR0xmT1ZiN29hcWEwVlY2WW42QTMr?=
 =?utf-8?B?eUZkalpyalVLUUFXSXl1NUZuN0V1OWFuTmRTTE41ZzNWUTdVajlTWTJ3ak9u?=
 =?utf-8?B?QUR1VHZ2THFVUjNoOWt0NG1aWW12aE92aXo5ZHM0akh2MG13QVZjR2E0YzdV?=
 =?utf-8?B?UzN3TXNJMUc1SzZUbVdMZGYybDVsSHAvVlhkYVoveHZDZnBXM0NXMGgvTDVk?=
 =?utf-8?B?ODZuSGJmQ0J2V05oejNMMFNvNnBwdTZUUzFFYW0rSmdqdlU1dlI3dEdha2VM?=
 =?utf-8?B?VHdRd3VlT2pZb3cxZ3ZoS1k2SUFiT3JYOU1zQXFzOS9LL0hMRGtXTWp1WjJY?=
 =?utf-8?B?Z25TQ3R0dzdpcUs5Q1JPRmR6d1J4SlZtWFc1RVNnbDhSMGZRQks3TFh2NHpu?=
 =?utf-8?B?MSs0RmtjR005MHFKQ3NmcUtJUVlYL1hsZDJzS1RUcWlHMlcrdEVPcTRCTGxq?=
 =?utf-8?B?cy9JcEZOY3Q1Y3dGVjVkT2wvd3BZaVFEelB5SXFORi9mSWphckxTeXk5K1pO?=
 =?utf-8?B?UnhpUndaL0RlTE4zUGlNbVZVcHFvNzhNcFpGR014SGxFRXR6KzVlZzVrZHAx?=
 =?utf-8?B?djJtSDFzSDF1bWFkRitvZmZoOHRISzZqNzdHNHdWbm13a1I2bEF3aXVla1lr?=
 =?utf-8?B?MDlOaHk5eVE3S29TSzhlS2FFdklYUHNlZWFLeWtGUnFUNnhVZkRYbVFtTkc1?=
 =?utf-8?B?ckk5VzVDMnFxdTZiTnNyam51YkVhWlJjdE9Za2I2VTJSdjFVbnNVUVBUVGdQ?=
 =?utf-8?B?WjdXbW1YdkY4ZEhSc1M0cVVIL28yTVlkcnpPbldjZ292NU9rUlB1V045QnFl?=
 =?utf-8?B?Wi9sQU9GQkRGYVRvVTZIaWNxT1VEbGNXeVRJUnZRdFNlWUdXaFlMd1Ivc0lF?=
 =?utf-8?B?a1NtY3FMNnAvU0dMOUFDN2wrT0RpU29nRzYwdlB2d3VZTHpmVnFtcTVsT0hm?=
 =?utf-8?B?cERLOXRvdGpEcnlsb2MzYUdQWmxQT1d2cldGY2VkNHBzQ0xENmdocG43NSt6?=
 =?utf-8?Q?znPe40rWImS5ws3DgF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6a4d1a-a5d4-4e1d-1006-08dec5290ea9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 06:42:06.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWh0FkF6SRYzYdOHvfJfr8w+wwO5oK+M9PU9O36QSJU9MkFTebDiQxQ0O/f4BSiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64133-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,amd.com:mid,amd.com:from_mime,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6ED965333B

On 6/5/26 20:44, Bobby Eshleman wrote:
> On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
>> On 6/4/26 02:42, Bobby Eshleman wrote:
>>> From: Bobby Eshleman <bobbyeshleman@meta.com>
>>>
>>> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
>>> underlying folio was larger.
>>>
>>> Instead, walk folios[] and emit one sg entry per folio. When folios
>>> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
>>> page. Normal PAGE_SIZE sg tables are unchanged.
>>>
>>> Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
>>> udmabuf.
>>
>> That doesn't explain why this is required.
> 
> Sure, can definitely add. Devmem currently requires dmabuf sg entries to
> be length and size aligned when it allocates niovs for NIC page pools.
> Though udmabuf is not violating any dmabuf contract by emitting
> PAGE_SIZE entries and the above restriction is probably more a
> shortfalling of devmem, by emitting a single entry per folio this patch
> allows udmabuf to be used by devmem for large pages.
> 
>>
>> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
>>
>> Regards,
>> Christian.
> 
> It seems both devmem and io_uring zcrx at least introspect through to
> the sg-table to build NIC page pools (not accessing the memory itself,
> however). Is there a better way?

That's an absolute NO-GO! We need to stop that immediately.

Touching the underlying struct page of an DMA-buf exported sg-table is strictly forbidden.

We even have code to wrap the sg_table and hide the struct pages on debug builds to catch those issues, see function dma_buf_wrap_sg_table().

My last status is that the NIC page pools are build directly from the DMA addresses exposed by the sg_table.

Was there any change I'm not aware of?

Regards,
Christian.

> 
> Best,
> Bobby
> 
>>
>>> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>>> ---
>>>  drivers/dma-buf/udmabuf.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 42 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>> index 94b8ecb892bb..f28dd3788ada 100644
>>> --- a/drivers/dma-buf/udmabuf.c
>>> +++ b/drivers/dma-buf/udmabuf.c
>>> @@ -141,26 +141,63 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>>         vm_unmap_ram(map->vaddr, ubuf->pagecount);
>>>  }
>>>
>>> +/* Return the number of contiguous pages backed by the folio at @i.
>>> + * A udmabuf may map only part of a folio, or reference the same folio
>>> + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
>>> + */
>>> +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
>>> +{
>>> +       struct folio *f = ubuf->folios[i];
>>> +       pgoff_t j;
>>> +
>>> +       for (j = 1; i + j < ubuf->pagecount; j++) {
>>> +               if (ubuf->folios[i + j] != f)
>>> +                       break;
>>> +               /* Same folio, but not a sequential offset within it. */
>>> +               if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
>>> +                       break;
>>> +       }
>>> +       return j;
>>> +}
>>> +
>>> +/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
>>> +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
>>> +{
>>> +       unsigned int nents = 0;
>>> +       pgoff_t i;
>>> +
>>> +       for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
>>> +               nents++;
>>> +       return nents;
>>> +}
>>> +
>>>  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>>>                                      enum dma_data_direction direction)
>>>  {
>>>         struct udmabuf *ubuf = buf->priv;
>>> -       struct sg_table *sg;
>>>         struct scatterlist *sgl;
>>> -       unsigned int i = 0;
>>> +       struct sg_table *sg;
>>> +       pgoff_t i, run;
>>> +       unsigned int nents;
>>>         int ret;
>>>
>>> +       nents = udmabuf_sg_nents(ubuf);
>>> +
>>>         sg = kzalloc_obj(*sg);
>>>         if (!sg)
>>>                 return ERR_PTR(-ENOMEM);
>>>
>>> -       ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
>>> +       ret = sg_alloc_table(sg, nents, GFP_KERNEL);
>>>         if (ret < 0)
>>>                 goto err_alloc;
>>>
>>> -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
>>> -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>>> +       sgl = sg->sgl;
>>> +       for (i = 0; i < ubuf->pagecount; i += run) {
>>> +               run = udmabuf_folio_nr_pages(ubuf, i);
>>> +               sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
>>>                              ubuf->offsets[i]);
>>> +               sgl = sg_next(sgl);
>>> +       }
>>>
>>>         ret = dma_map_sgtable(dev, sg, direction, 0);
>>>         if (ret < 0)
>>>
>>> --
>>> 2.53.0-Meta
>>>
>>


