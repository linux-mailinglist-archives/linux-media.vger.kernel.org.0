Return-Path: <linux-media+bounces-62016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKckDc0sC2opEQUAu9opvQ
	(envelope-from <linux-media+bounces-62016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E056FB43
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60D613046075
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D007F351C04;
	Mon, 18 May 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LO3L/M5y"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D52FD1DA;
	Mon, 18 May 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116827; cv=fail; b=uXXLH8+N4EWCthJuXQgztAyCV7KY9fYEkI7dBQGaSbAw+2CWK3xhcq04lNFT2NNs0NWHvigEBblszhrwkvXrVN95YRtq6pQGbmxMKX7vt8ZYkFQZS2tcX+8/mSDAp6K4EeX2DB24iwE5lh28b6xPVxpzcmpq14jHXnoU3nmu92k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116827; c=relaxed/simple;
	bh=avH2Mw/e6OlAaqzBXAVyasBS/d7X9VIlxk2h5Z1rPLo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B0oCLU2H4RVfPjtAleByj6M6X1yl+Ta56/MHNpb9Y1DrS/BUtAlDkWaEGcWo1J7kBY06BEI08b2OmYGWsj5HH/MgT8jm83Og4Gy06XlYPwnZbsCzBIMLnwOeoVmVbiCAj4QruYB7lhi0ahDa8hOqctq1ikeIXW6yfv5ve1ljbDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LO3L/M5y; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7wLLvV1Nk+d8AGiwb1lXu4o38lIcs2oYEHx6jXnpflz2iVwZ7IAag4YWN43ND5nSjkMtbHn8lr1QBZAxGVo4kqDKR1E1MA3exPAPUUZri5pbYBmU+GbrZ7ob6+8Qqe/LGPjvvEarNggsT75Ga/Tg6NquClwWuX8LV9eWYfY1kY5iuBV5nx0MfbToO1DQzYaxqAy7uP4FwaQC0hymE+X3SENhMqwHzMWFUPUUKRY2doGIadJgkTEoZ18JlpOlC93S5E32kmQwoxDlEqtdgAabIi6p4NuQ4Njg1PXm1qGfw3bYQGsDGZF4jcmNkUNxYa+0BsgjcPbt8LHCcNhLwrMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBAKV68rML2SzmDcrxEnmVCuZ2HbOmy+OYcYF9i09Hc=;
 b=FjPcbB9fXcPj2GxkpjxLaR0mB4sDoTF0lV9BpYUeiOFFJIA+qNuIN6CDE9UfalG64gTWbbIPLih6hD/zygKkhhP0tWxTBooUdOQC/h3Bph/bVzu1/GOKjdC2XVEqXNR0uJD2m6uOR7KCJfV8cJ+zzBdQTY9ohVtGGlK7p4Z7FCQCf6K6+MNPj2qTXUtV34pWhaFadCpjuYWCV56Qi02hVHPWIM4immwwUtJFDrYaHcX2B+JpDDTrhIZoqcaWgkKKRV8raHKvyne43FDAnDQxuXxYHjrDSbDT29m0C5avcpDzfb8N06uCt4/jX8x7U9xTCDAU8FLS/0aCyj3txQotFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBAKV68rML2SzmDcrxEnmVCuZ2HbOmy+OYcYF9i09Hc=;
 b=LO3L/M5y7o9KBE+wk9qwDirKgnwdXD1caWyvSYUdKqp+oUzSu05WmEj1awoKxgpnDvTBCTcrFGPxRGibPE/oB7L8FutUa+imknNyMvGn6haQ53Uc0MsRc4HzIygDVNnsvYj5XfgGBTETGRqTKJXKDgtS7R0pRXy0ozoo6eloMbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 15:06:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 15:06:59 +0000
Message-ID: <15efb253-2171-4436-bf97-0b0d0408e7e2@amd.com>
Date: Mon, 18 May 2026 17:06:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
 <1162f62e-9c65-446b-9788-bb289a202e6e@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1162f62e-9c65-446b-9788-bb289a202e6e@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:208:23d::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: fd318ded-88c6-442f-3fad-08deb4ef1bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|11063799003|4143699003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	deFyHXmC38/j1yuK0aViM4+abTpaeAv10g4yS2ccKfi4qIeNj/EQmQbiOxP/2EfBK6WpnF23s+06ErrUGSKWoBu9HqTEyJRESFkkONlY/jSlkMvYqSlVyV5fRROHaYojBoYpd1QCjM9QNuUrFUW7Dn6CTUr2wn14NtbSNZN01yNascduTnFZAXuPez6uwqiFA9DswN2c03MX9dCh6HKKim3zt2SCNAPduijwE3XjNjr2Q5Es+Q0iCw9ufnlmVu47JxHigU64Q6AFqdBuNJ8gUTWy9kzeQBm2td+R89H5LuC/XEUk95LEBAQhn7d0utdbvGrhJmVuq8rhrvGRRP6wPDXBPCKmcB6eiNmi+sUSAmzueudnWA0Q5ePc5mYy59V/o/sQ2wbZQ8S2GnXiHNdFUhHEpDH3ZF3MEHr/8TP3C+E7P0z6Tf86Fxn0bZE28s1gfiWO43mhx+NmifNYk957GuKvJIcHi26NHFVhEpw8NLHV7tYRCwfa/wPn9mIRZpXMRUDVzeHCAt/BS6uAOzAO/zXw0WdnA8lWt/AWIyZNoiE/ifs7uceVIOueGUqa/H5cxKy2sBdd7I1L0eVoKHtjG7UMk2zlGNTNvFOpvJV9GGM3i2pxftHDntEnNDLaoWYaw9qIIEgz+z6FA/jvQ1jLzXEN/onvckdrOu0gs8JwZhlfnr/lNOstENBMlWfa919u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(11063799003)(4143699003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkpsaUNISExTWU5lNjA4OVJiWDNpbVloWXRmOVRGSVVUMFB4N3R2ZVRpY3M3?=
 =?utf-8?B?YkhIa0Z5OWJlelJrMllHRGxnSlBSMlc4QWJOeXpTd0F4Wm9xZkNVU3dKbmNM?=
 =?utf-8?B?TGNwMURacjZ4LzlBOFVEbERKQmY5cW1DOUttOWp1Z1Y3SWUwZkZNbW5scDBn?=
 =?utf-8?B?UThNeGcxSWd6VXNpYThHZ1A2SlJyMlRmR1ZqWFlMTmc0SjNNS2RvK0QyenBh?=
 =?utf-8?B?bFVEVnorZ0lTSDFiWFV2bkI2WW0wMUNiRVh4dEdOaVA1QmRhaUtsS3lvbzV0?=
 =?utf-8?B?VHF2Q2wyNGgzMzNoOWF5czlTOFUySEpIdVpnM3dYNzBIWjVrT054Qm5OSVlu?=
 =?utf-8?B?M1plNWc4Q3dldEZ6MEY2bHM2V1hQWk5vZit5SUt1S2U1ZzMyVm94ZHpIYnl0?=
 =?utf-8?B?dTYvN0JCL2dxMXRmV3ZWOXFmVXh2Y01LMzM2WjQ5OU52OXJpbHlXV2hFU1R1?=
 =?utf-8?B?akVKR1VPQXQ1YXN5WlFrTmUyQ0JVRkdDWTI5cVJxdW8rSFQvVGRZOHlQR1Qr?=
 =?utf-8?B?UUVCSTZXYmNkRUM5ZTJkc1VSa1dETEpLeXdZTWwzQTEweUpIcjVMbmhoWmZy?=
 =?utf-8?B?cHdMZ1AzaHRYNUx0L0Q1VlFsRm00V1JRQXdhbHIycDNWR3kvOCtJSzRHK2pI?=
 =?utf-8?B?RWovUjlOMFdqUFFJY09scjA4YXB6OXZVczJ6bkpvQ0FseTJyTTV0emI0UllB?=
 =?utf-8?B?b1dvV25mbEJlOTAxeXNITGFCL0w4MEN5Y3JKQlNiaGN2WW1VRUpNeDQvWVE5?=
 =?utf-8?B?eVFHdEZTd0dLaGRsY3FaMjQvdzFZditkd0ROSXh5cmZNTDlYZU5hQnJrUk1k?=
 =?utf-8?B?UnVXckloS3YyQ0NBM0R1Y3QyNjJEem85SmdGaGt3Nklmd3p6a1FUZEFYMEgz?=
 =?utf-8?B?THZhSEVPSmllSWFNTHNJbXBYSE5SY3RmS3FUcG9YcGdJTGNiU3MwcmRMRzZU?=
 =?utf-8?B?NHR1SWhHOGRVcEpqMFdaSEU3RjdGaTBqRnpkN1FwMHNEWDJyWTRqK0NRYWxl?=
 =?utf-8?B?V3JRT0dUNllVRzNFK2xPTGV6bVROQS82RnJ1bEtENEhrdUs4UWFjaVRRTEVC?=
 =?utf-8?B?NGl4ZDFsZk13SVhRb0g5K2FDaVBOV2ROOU9CRExDdGU2V0poRU90cmhPcFgv?=
 =?utf-8?B?TytWVDAzMm53UUFEQUYvZ0ovODJrMHl1YXg0ZjR2akZQZU1XTUlzRGRZcXNC?=
 =?utf-8?B?NGM0NitjakJZNEp0N2NKZ2ZVTHEyMU04MnpMS3NGUnJGMnpGQXdXekVCM2lK?=
 =?utf-8?B?K0RCUm5KcGdrc1NMTTdVUFZOMEZMaHY2SjNKd1RDQ1U3Y3RZSjQ2R2FMcjhk?=
 =?utf-8?B?Mno1UER5eUhZL3lYT2M5cDN3dFlIN0s3Uy84RXdGQ1N0OGdYa1RsZDNCcjZ4?=
 =?utf-8?B?ejZ4MzFWbmtqRm5WUFROcWlGc01QWFJwVVkwS1hTMHpCbkdkOENuUDgvVmsx?=
 =?utf-8?B?aFduNGg3ZFlJY0NuV0dpTlREVWVZUGdVcWpsSEVHRnJyMVNMU0Y2UjFWdFFK?=
 =?utf-8?B?Ny9NSGJkaWtBY2VXZEZXcGhLMnJJNUxjM0FwUEFTeHVvRkhyb05ZVVFHcGVC?=
 =?utf-8?B?Qnd3UFpVVVVDcFRydEkwajVpbFdSRlZiNGloSUlJMlRkUHNacVN3U2s4L1Ry?=
 =?utf-8?B?Zko3SFJTOU13UitVS3UrbDVVWXhmZk4zYS91UmxEb0dtRlZ5RDlsdkh3UlRW?=
 =?utf-8?B?ajkxRzJieUd5Q3pIS3pUM2FRSy9KaC83SmVxSjBGTTVWaFI1b3FLdTBVN2Fo?=
 =?utf-8?B?R1M5dk5FRUt5Q0JSeElYcTd3em8xMXlFc290ajV1bitqUXNQUVJBWE5GdTZy?=
 =?utf-8?B?VXVNZW9MY2JyYlB6dHZxNGRZRW1nSVN2Z3gyRno0aWdMTmgrZlNwbTBVY1ZY?=
 =?utf-8?B?YzdjUE9MMEg0K21QVHBKZFBVV3NrZnpnazVtcWVpSlB0eEZ4UnBudmNtcGU4?=
 =?utf-8?B?U0ZPYm53cU9JOE9TUnRkT1p3ekI2N1MxejZOaExnbnJkQjQwUWFTYloxS0JV?=
 =?utf-8?B?VzloUHorSVVNNmVJeFdtYzREM2h2L000MGMyOThpNy9kY1BOZlFWbWtMZmFX?=
 =?utf-8?B?bmdnVi9KMHhPU2t6L0NDWTIyY2Vod3pERGNBdmIxcXZjRHJnN2lNa0sydnBB?=
 =?utf-8?B?Q2pVQlR0TXV1T0l4WGhlc0VySDB6VFNKZ3NremZibDl6TnBpRWxIOVRjSytG?=
 =?utf-8?B?UU12YzRtTWhNVDlWMVgyZU82ZWZKOHErRFU2eVNzcURMSWMrWm9acDB5Syt3?=
 =?utf-8?B?TlVqMUtLKzNoeXNybmh6YUx4YmJIaDVDRll3NkxTeGhTUitoQkp0RmROcHR3?=
 =?utf-8?Q?/HEFmbS5jYNPkPEqGV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd318ded-88c6-442f-3fad-08deb4ef1bad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 15:06:58.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiRuQoDUwaEfV1oy5CCosYqHD0aJin7XzUSclP5RGd7fz7j+zadbS1naF01K4rjC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62016-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F6E056FB43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 16:59, Michel Dänzer wrote:
> On 5/18/26 14:41, Christian König wrote:
>> On 5/18/26 14:02, Julian Orth wrote:
>>> On Mon, May 18, 2026 at 1:58 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> On 5/16/26 13:06, Julian Orth wrote:
>>>>> This series adds a new device /dev/syncobj that can be used to create
>>>>> and manipulate DRM syncobjs. Previously, these operations required the
>>>>> use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
>>>>> and DRIVER_SYNCOBJ_TIMELINE features.
>>>>>
>>>>> There are several issues with the existing API:
>>>>>
>>>>> - Syncobjs are the only explicit sync mechanism available on wayland.
>>>>>   Most compositors do not use GPU waits. Instead, they use the
>>>>>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
>>>>>   DRM devices means that compositors cannot consistently offer this
>>>>>   feature even though no device-specific logic is involved.
>>>>
>>>> Well the drm_syncobj is a container for device specific dma fences.
>>>
>>> Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
>>> some kind of dummy fence that is already signaled. I don't believe
>>> this is device specific. That is also the path that llvmpipe would
>>> use.
>>
>> Yeah I feared that.
>>
>> This is the wait before signal path and if I'm not completely mistaken that one is not supported by a lot of compositors.
> 
> Where did you get that impression from?

Kernel space seems to not handle that support very well. We added the flag at some point for drivers, but only a fraction actually implemented it.

I wasn't aware that the general eventfd implementation can handle it, but yeah when compositors use that one then that actually makes sense.

> It's arguably the main point of the syncobj Wayland protocol extension, which is supported by all major compositors (except Weston, where it's still a pending MR).
> 
> 
>> So as far as I can see using drm_syncobj for software rendering really doesn't make sense, eventfd is a much better fit for that use case.
> 
> I agree with Julian's rebuttal to that.

That eventfd is missing the timeline functionality is a pretty good argument, but I'm still not sure if that justifies the extra kernel complexity.

Regards,
Christian.

