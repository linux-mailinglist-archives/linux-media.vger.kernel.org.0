Return-Path: <linux-media+bounces-63004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM1IJAI2GWrzswgAu9opvQ
	(envelope-from <linux-media+bounces-63004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:45:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47A5FE19E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55F5C303A26C
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521FE3AB28F;
	Fri, 29 May 2026 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2XCL9Lob"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0983AA9F4;
	Fri, 29 May 2026 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037111; cv=fail; b=MJVUuFrAHbSTdFPAw7eOHTdWXdYv9+5a6gs0rjuFFyzLLInuL9qEUZ7CgT7yRTMzcogHOmz/s7J4mVrTP/Q1eoAitJStngTetkVCYmbaXwYZ2Eb+KaQY6lq9GIkblESDS1xl5dTHLLl6kv4AL3MXgD1dfPMkCpevLnuCoChdEFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037111; c=relaxed/simple;
	bh=Cla61bTDgNCbD4rB7T6tLIYwm4f1cLe2M+5YE0Cuv4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2LgAeY6gzWycSIErE3DXkD05kDosdr7AHA5HO0Oz3fRmry+Gy1C63ysELkYjQ64brrasGLQQndKpChTHLVHs9LiaY1aOcwLNJvIYw7zKvsU94YbmmjWN48SdQN9W22EJsb0bgY5JY1oas3AFl/HwgP2BwJ95y/HBPsBktp00/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2XCL9Lob; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCjBHFL4X9L0dFM+sbxFRbKnOmIj7xk5pyAbBGdzLJGz4D+K+LK9DlSHq0OprwqbcicC0VprThlgLeWihY2uil5oXwam/YOISzmMigKUJK5ZK5Z+xdzOSL/RrcQ8kIHtxHpcCESPDk/MFBcw4fMNU7FqouR7TpVydJ47BU5BAXPx53iiKzhO6vzv4Y2wAWsB0FZq43Le/rrz/zlomM7ge7GDmUMWQIxv/wHa0wgsP8zHSD0y+JYcln9/msGXul1jCCM99O6MfjzNlLO1pONWlRG/QdOX9H3kdb46xW8Fa2MU9qEBi6yR9pz2GuWJT3cbV4se+v5Nke6zP+ADAZH8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUpsoj1bpW7q8NG+lOwdTJIuw6iQo+p8cwklpKIbG7c=;
 b=c2giGSB7kIU8mlf+4LSaKjT4J0wkH3dOCb/XJdipQwp8QAUi1SE84MaAoWG0WJn9dcTqrBMhukoAZvSx/8XziZlS9za56w/Moc+OobOEnJO96VVOOw4uMkotKu/dAD9rsgnSBRhBgxlgrT8JHik9cv+hnDvF4OaVbLGjGrX+0PIOGUK7x+FEB8i3fUEhPoPcNwhoajOxlgl1e6VTo5ixhED4ttOUTm4IQDYaRAReH9dPS+eorVhjIzW28JQlbEEs66OFuLZo1jzKftASJ/xD1jcnALJQFdKGwvX8RluFn3UMQPkKP5CDpLtSQT/0iozFqSZiBEmweGFRJq9RYZNvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUpsoj1bpW7q8NG+lOwdTJIuw6iQo+p8cwklpKIbG7c=;
 b=2XCL9LobTLbmj5+4FBXAP/jH8GtXdoKmq+J6PCk83m/rc+Fd50fKTdFu780l96EvlcKWzzYw8/nyf9ekSt9UqO1PhSQNydDxoUaPL2cyyEEo/P3rPLKa38/rvDMiLXjXQyk9wmawEUrA1i3EsU6HbcwlhBQWqw+0sF5lXulPKFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:45:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:45:06 +0000
Message-ID: <bb4d3330-822e-45ae-94f4-65ba0e351f57@amd.com>
Date: Fri, 29 May 2026 08:45:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/prime: fix dangling dmabuf entries after handle
 release
To: w15303746062 <w15303746062@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, jeffy.chen@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>
References: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
 <20260528132932.1078483-1-w15303746062@163.com>
 <62c256eb-1df4-4633-8040-222895b54f97@amd.com>
 <7bbb8946.9d19.19e6ed958df.Coremail.w15303746062@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7bbb8946.9d19.19e6ed958df.Coremail.w15303746062@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1b7477-68dc-4dc8-b4ba-08debd4dd1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	m9Uh5bKJohjIrTCAgZ+e2mfflx1+ivgwx6bHHdGfGP6ZYxMLq6P0riHNDWwPRPlrQoB3XUpfsPvxhYyFvWFknnVPoj0WhHSABwr/1WKB3XVQnNpaQr1ffTAGej2di18c0CQEX5z8jFri6IFppt3bUITKCE0bG6xXyWeX9+tZU6ih6UNgHxa/DwsyBE+/Z4uGRtbqN1RJ+FvIXcL/dHZ6TroiexDdQSBOEvWGzaAnOCxYLvVhrNl7ZxLzRwBha5OhzUcPJGdLplVBM8BYlQ3yrobtfkUPkC1Fjf1NcgzLeT2a9CDpXsgxvnrChDiKoSDKjaYPIK/cDWhAS32k+CEVEUdkE3V9lS6J/gq7P4YPVASqd7FFVGl5ZimK+aPDGWY6wmbd6BoN4Dcay5jeLreQcWN45+qNCg+49hzyDjDPKOR5bia61SDqV0Y/ohXBVX2rvSYVYtNQ5eIVqqx4RSeEJRiUlnR+AB5QriRHhmOsG4T7d+1VRNUuBuj2syZcJQBvXd9F9GHNk2wvquuJfiPwSRv9EPfMGCZUB1cqEF7gt4pDl7c38PzJ1k1On8014SWLC+9dZjVLRc87v1gAMvKEfggi1am3b9luz+WakNaGO28ALekzLnwMe4H4mGbj8t40x3uJYqqzVab//B57KEGwzmeBovmEtoME5BDjxBjhGcf1M009cjfoo3hD1vxzlnWtmbeN/ZT5Z82iSvAItJSw4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkRSNk16eWhQVEo4MjF0aWJHUURQdnp1OTZGblBXS3VxZ1FzNXhSMUdLelcv?=
 =?utf-8?B?cUlNNTFqUWxpRm9iOXErNTZIdkQ5ODZxSlF5THlqd3VybWMvcjloalRoQ3Jy?=
 =?utf-8?B?V0RXazNIQVhQVzg2THlpM0hnQVp6enhiVk1LOVRJcjhRNXNSdlRGU2gwUzZl?=
 =?utf-8?B?YThZQjhFUDFpZVFtekNSNXVVZWFFVFh6UVQyeUxrMTZGUlg3S0hvOG9udE9p?=
 =?utf-8?B?bkVCL1ZJL0JiczFuOGZ1ZmRIUjc2MU1WTjlWeTRFemNOWEV6SE9vcmZsY1Z6?=
 =?utf-8?B?UVAxWlBnc3NUdHhjbnNrejdJdUg2SUVET2VIaTBNbDgwRnBjWCtCK2htaTMz?=
 =?utf-8?B?SldWMXB5RktEZkk4ZG9mTlhtcDgyZVJNdm1oZHRyQ1BPUDAvRnVlRE1xbXRR?=
 =?utf-8?B?Uk9BL05lM3ZxZk82RHRNM2VaSVBBNUZSb2E0M2pydFFoQU1KcXcrUFZKQWVK?=
 =?utf-8?B?OVpwdFlxNHUxQVVKU3FjSksrRHFBSmlTTk5PYWFCZDlHNkJpc1ZrQ3J4ZU0x?=
 =?utf-8?B?eWN3Q091cE1Qb3V0U1F2NDNybnhRNFhzQU8zNTJTMnNOczc3SFNIYnQycm1M?=
 =?utf-8?B?blErNEMzTW5HY2RmRDNpdGlDRnZSejcrRGFDemp5aytweGh0THBuNTZxSWJX?=
 =?utf-8?B?cldmc2lINUlnOUxtQUgydHV0ejRFWDlUc2xJRXZFNExFclcwcmlpWXpzWHRa?=
 =?utf-8?B?RzVkNHZteGVuNlNDWENreXBzV3RjTVBEbVpUOWJSNlpBRlRtdm5HUGY0aUpP?=
 =?utf-8?B?ZW5QaS92dXlvTXN2SU5NaTk5UUdUM2NSSU1EYmRVMU5NanptL0p2WDZ0MXlw?=
 =?utf-8?B?QlVXMm9UVU9hcnlWTm43WDZJdFlrTHp4YkJpU0xZeUhYZXFld0pUSzQ1WUls?=
 =?utf-8?B?M2Y2VjdUdE8yN05VdGwwbGRVTktsSVhYMUkxUFBJTm9HNGdYK0Ftd0RZTVJw?=
 =?utf-8?B?cWJnYmdSWWJpOUVXR0JYdDRRMi95VFBHV1RYM0ViS0V3clY2b1lXdGovWjVG?=
 =?utf-8?B?OS9wQzh5QzUwYWdDTHVWbEwrNjEwZEVvOXdFK1J3VjJGRHRGcm9GU3BUWUxn?=
 =?utf-8?B?R0xpV012S0xyaXkrK1dpb2VUNk9MMXphZ3AxSWZoajh4R1JXZ1NndFJWQUlD?=
 =?utf-8?B?MEw2MndqeTZOaCtRN3lDbDI0SEozbGJjVEwwUnplSTJHR3RyWnJLNmdFQkMw?=
 =?utf-8?B?bTFxcy91RVZKSzFoT29zZU13cEt5bDV0ck5BU3NzTnpPdjg1UGk5YmxjeGlW?=
 =?utf-8?B?N0lqWi9jcy82aEtFdVRCT0x5Z2N1Z0lpdUpQZnUrUnBUTmFiRzR1QWZoU3F5?=
 =?utf-8?B?K2djV2dhUXZKaStHSFZCUXNQR2VKdW40R28vaDE4ZzBvNEFLUGU2THVBd2NT?=
 =?utf-8?B?SWdvK3E1cnBoT2FWNkgvc1VOK1Fycm1qWXlnNjkzZnY5QTFlN2ZGK1lGOEY2?=
 =?utf-8?B?MWljOGg2amdZeEpZVjVKZ3Y5N1hsR1VON1BxM3VOaHlJR3NBclVsTXIraEV2?=
 =?utf-8?B?UDRzY2V1Ly9udnllNVo4MjVSS0FabjJkNU5LYjJ2cHFpV1hiNXlVbmpnZzNn?=
 =?utf-8?B?VG44YlN1cjNUUnN4S281N3U5OGZKdldTeGVVYVMrYnF0YkM5dE5QYWlUbmJB?=
 =?utf-8?B?SDFyajdacVFnVmhpTmY1NXU4enJDbER1QVNUQ1FSQzBuS1E3R2NqbFdpY0hJ?=
 =?utf-8?B?MkZ1MGFuRmZWQ0QzaTluWk5VUEJnZmU5Tm5GNkx6Ri91ZjRIT1RYYXZFTWNK?=
 =?utf-8?B?RjM2RXVRa1FDYWNCTkxNclV6aWNxd3VaTlM0NDZtVG1qbzN6ZmZGUTlYMHpK?=
 =?utf-8?B?c01OWWNYVXc4RWo3LzhXZTh0Wlh2dFh1REZnWDBnNGZ0T2RYNjMyM2pUbWhp?=
 =?utf-8?B?MnAwRkt2ZkZvbFFFOWxKdys4UVFNbGFWNmc3WnZ6TkdNMzVkL0lsRkJyQlRz?=
 =?utf-8?B?WnVIR25Tdk16dlpJTlFRbThEekQzY1EweGNLRHVtQWx5UTBxeC8wRnVHOUJh?=
 =?utf-8?B?WERtcmFZY2FzeUc5anIwL0NxSCtHUVBkQzcwL0tlSVgyMTB4NUtaWDAzZ1hG?=
 =?utf-8?B?Uit3ZTYrUnB4OWtRUlBDSGpSdXVXNU9LbVd0YU1YeGhQdml6dGVqL1I1ejRw?=
 =?utf-8?B?L2NtQWM0eWx5aHJCODR2b3VJZHh4Rk1GOThHVW5aLy84TlhYZGExWXRoYTdW?=
 =?utf-8?B?Y1IvOWlrY2c2Z08yd3p1VjM2TGdBbjFsellQYmUvMllwZkg2WTJuTXVaQVVU?=
 =?utf-8?B?Qjh2R24zRE0ySi8yR1dUQzc5OFkycGt5cEtqbUw5M01laml6OUFrbTI0Tm5r?=
 =?utf-8?Q?APmkVO3/ovMEfRqVf6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1b7477-68dc-4dc8-b4ba-08debd4dd1e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:45:06.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apdb3CctwC3UYDEjbmAkEr+JVSzdQLNJnn8nXVqRFSqBcZLLpHb+oJTfU8GEvV78
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63004-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,rock-chips.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,stu.xidian.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF47A5FE19E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mingyu,

On 5/28/26 15:49, w15303746062 wrote:
> Hi Christian,
> 
> Thank you for insisting on this. I've now gone through all callers
> of drm_prime_add_buf_handle() in drm_prime.c.
> 
> You are absolutely right: both drm_gem_prime_fd_to_handle() and
> drm_gem_prime_handle_to_dmabuf() perform the lookup under
> prime_fpriv->lock before adding, so a duplicate handle should indeed
> never be inserted through those paths.
> 
> That said, the syzkaller report clearly shows that the dmabufs tree
> is not empty when drm_prime_destroy_file_private() runs, which means
> some entry wasn't removed. Given that the normal add/remove paths
> appear correct, the trigger might be something more subtle — perhaps
> a driver-specific callback that bypasses the generic helpers, or an
> error path that leaves an orphan in the dmabufs tree. I haven't been
> able to identify the exact trigger yet.
> 
> The proposed change to drm_prime_remove_buf_handle() (restart search
> instead of break) is intended as a small robustness improvement, not
> a fix for a confirmed race. In the normal case it will still execute
> only once, but if the trees ever become inconsistent for any reason,
> it will clean up all entries for the given handle and prevent the
> WARNING.
> 
> Would you be okay with such a defensive approach, or would you prefer
> that we first track down the precise trigger (e.g. with additional
> WARNs or tracing)?

I don't think so. As far as I can see this is not a robustness improvement but just papering over an issue.

Leaking memory is usually only a very minor problem, things like use after free or random memory corruption is much more worse.

And such things is exactly what starts to happens when you start papering over issues.

So I would say find the root cause of what is going on here, you have certainly stumbled over something, and then we can look into how to fix that.

But just sending out random patches where a bit of simple code reading can prove them incorrect is not really helpful.

Regards,
Christian.

> 
> Thanks,
> Mingyu


