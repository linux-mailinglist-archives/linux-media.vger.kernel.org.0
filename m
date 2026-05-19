Return-Path: <linux-media+bounces-62148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P30NENqDGo8hQUAu9opvQ
	(envelope-from <linux-media+bounces-62148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:48:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6790757FF9E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03CB03063675
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A48B369D44;
	Tue, 19 May 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OpZCYGfo"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598EF32B103;
	Tue, 19 May 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198470; cv=fail; b=r0uo/1R35QSO2WIv08ELMOZIOFhJCkeNwKRVGjCb/RB2lOx6fgZv9Lzq6D7rVZurow9qJ27xR9BRaynqIVi/M0Fgt+pljS8rebldBiG9eEEtRT4aJKnkNYfX/W2qBIK/GJlySwCkTMWkmp/OqYu8NulP6Kk3KXBAsNFYOd7JnQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198470; c=relaxed/simple;
	bh=rpC95WQx0ZPaywEu/Sy/oAm9cflQEdR20P3p6qZIu/o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kYKMxhGAl28U2Z1WR9uff1jkIm31M2HFLIxc2S8DYwYrgkwL5MC9KFes3HtMrnDeEYOEqJzkyM1OG1JPHqOzi9Nl9rq2qW/7/hOGLwr2rnRYDPPVJaVEpv+kCNI2IAYah03kdLIsV0dVXxjhHreLo92Vn+rvJERPT3UttsicuDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OpZCYGfo; arc=fail smtp.client-ip=52.101.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsmEMV5jC+YUbSc6yosV9YA7+ap3tt0ezMcCD4P6MsseDYlugbk9ZlNNxEpKRO4sHevSbFaxeX6bLZ6i75GqOb9zCmP3ozZBo6+s+xwS7i48TWv7IC0A38klxIYWLqudmjQ+9cO1cte0iF9lzdDlLkZzxHxMIvhZoczl5tKB7qT+0d+LpUGVAxDA6NZZun7mXnJl6WuUwPz3IOxrrij1oQiM/NQV7YLgmU4ZgnrMqUpIuVpYblYFBkWkqNrvgG5kULmoJjCWf506fmLDhLQYI8NxOpzTqwGbdbkcONlfP+qlq4orEuB6OB54U/qURcJMIK8Qo7tJQ6jszvpia5RGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OX5jHQ8vDq7t+AhNCSae+kQct/tCLpdC7Zt7uyzpdo=;
 b=aW2H+a2/AbT7h7fHSL9xruf3uibEqNnXq/Frn+/YQs5yPnzOvYqn37KBny8fplwFzGycQkxktwecD03GkwkOlhz1AbUdoWH1U4N6scUEObJZ2Fu2K8q1f246EtGXpJU7Sw2lEFiCw9XZyUp/ClF+xbdV+H4Zxg3Uf5VO7HNVaJRCmDGXLEypFoJX2UBUutFmkMD8RqSqMurVQXr+LFH7blsq2PnuoMwIaAkjqm0wkWMN0pDSepZKn9H7JUXUZcIFZbsCYXuZ42rWssf/AvyMW05QJDN5Su+ulmJVtbsApRjTKul5VCxtr96sZu/JpQ8GxCl51lPQJ6l6KZ0AqWV+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OX5jHQ8vDq7t+AhNCSae+kQct/tCLpdC7Zt7uyzpdo=;
 b=OpZCYGfoNyMwivP3x5hnxDIZA+jVQfrc4iDuIrMZV3pc15f+ssIuYSmArTJl7H4+jb6OXAB16wJF1uqTIrTYb5plSiwqNKtPBaWcyq8u184ESOk0o5B1NBIgwc3U7DY3PGaF4UTb/f+OaOJbW9c2xpIyiB898Co1kedjIzPxjvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 13:47:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 13:47:44 +0000
Message-ID: <98f2705e-fc43-481e-b8e5-68c7d462ca90@amd.com>
Date: Tue, 19 May 2026 15:47:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix recursive ww_mutex acquire in
 amdgpu_devcoredump_format
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <CABXGCsM_YJ+UY86yFJF-jBcbQXRoc0qnSw0saaGWnaSYWG0mmQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsM_YJ+UY86yFJF-jBcbQXRoc0qnSw0saaGWnaSYWG0mmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfe0c7c-290f-4a85-e7d9-08deb5ad33e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|11063799006|56012099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5AMK9MqV5bWHsK+arR2yCBA8pnXASwKbclDlJu/DhNl05xF04m32Tq7mebkrwuUrUPtAjABJjOrKX1wNSdYM8Y4od6WwYDyaKFzEzV6eOH2C2vfjb2vAg5k5brqT0FfOO0TzkMGXJBFHFjmJcEvjA7TrZQ7kwHEiIkVPdBgmZDwJNPkhixmkfUo3gWrTF7BkCMLv4eraObXeSIRgpFQwoRQXYoxSj10KiQKe4p3tJ9sSM+99VU4RcY9M5L1ZPjJLZCnY02S+mP6gF4Fx0Tr3lIIy2dXH8eOZa6U1VhwCFMDdd3vS3kij7kBJ4zF2ueYg17QWCrbkpo4oSOTzQEK6ljJZT6PPyr0V8JQquDtAnjUcKNfehSOaJftGf0X18dDJiMCIKNgdJPjQMHUFi0+QqYZDHSHmm5rPKWn0zPwK7Kn3RLP/h2dz0np1Rk1mXxqH9WWMl9Mkni1zHiW3J+KbResBsaEe7ScXb76xJoY88we55otu8cnLBl3L82WhRyIYdA9wScwpefbNikgBqx4K8rzylf17KSNujmQkoU6yGE5dTxJcZohgD7pP0SRs3jsgEfLNa4Niazr2eDrWOzI9ZtRGGnRk/aL+FRjUvuCW9EFWb8OPnDdhvNcaWQkbqgoxdSTxrgSGn021OKv3r1q0cgaXKtIC4gWm6nA5asCywGeegpCYo6dpOy2vZznfSBb7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFNTHNCbXJPRysyREE0QzdBVXduRzdKMCtIYWN3MlJtTnBjYkVoQm1qWEta?=
 =?utf-8?B?elNQUGxDYkNFMXFoMXRzeDlCUXVhUXJhNFhSWkxUUFN1Wk5oNkg0M0lYYWNK?=
 =?utf-8?B?UzFqRXgrd0FIVXFoQWtKY0h5cGkrZnFoTnNUQlV5UlB6NCtCcFUzSUdXSCtC?=
 =?utf-8?B?UnFEdDlmaURWNmpFTTdBSVhwdmtKS1NsSjI5dmhlenh3cmVsM3JtSEEwMkZF?=
 =?utf-8?B?RnZ5KzBpNm1pcmhmSEZyNlFqTHNpUFExdVVVY2Y5Mm4yTDZ5M3BsenZEWmI4?=
 =?utf-8?B?bmgxNUV5Qys4NncvdmxlZUF3aHBCUUJoaDVILzBPNnVzUlA2M2hsai9TYS9B?=
 =?utf-8?B?cmd0TGlKdDM3bzJSb0ZoT2VTSXlHeWF1SWFtdXd4Nkd6VnNOT1E1RS9BNWUv?=
 =?utf-8?B?SW0zcks5ZVFSUnA4a2NzSUIzZ2N0ZjNYN0xWc0N6bW1EYWNiYUVSdzFYRmdO?=
 =?utf-8?B?Sk5zVkxFYldya0FkUmIzRmdpSnQ2Mld3VnRIV3pFUmRFZU1zelpsRFczcXJ1?=
 =?utf-8?B?NS9nL3pWSEtBK0dqVWpVenZPeTlhaW1aWEdjclFZWUtFUE9IaU9aNHNDRHFH?=
 =?utf-8?B?MFlFb0d0ckdsVEhFSFFLS3JOWGhwTElHOGNkZlZodUNBUThiejliK0doUVZX?=
 =?utf-8?B?dVhOVWx0Q1RMQndNbDhjbk5DcmVHQUtUYTZiYm5WUmNSVG01VVQ3ekZZS0Nw?=
 =?utf-8?B?d1Y4TnJMTTlzaXlzdjN3YlZQeW40SDNabkFXbzM4RG1sR3c4WlkrM21pd0ps?=
 =?utf-8?B?dTlYRzUzLzJVTzRreWdRT2d3bW9YTkFENmlZVHJpTFpaYURiV0dNaGRGajQ2?=
 =?utf-8?B?eFpzMmFCS3AwbWJ0QVd4cGlTNS92KzlSTGF4WW5ZQmtZOTFpeUFtc2VvbG1X?=
 =?utf-8?B?cVpERlpuQTc1NHRDZXVBSlZMdTBhYmZwN3A3MDNZTUV2R1IxYnpkNVFTZ0s1?=
 =?utf-8?B?YWtob3g0dzVXOGdZRHdIQjRTTmdRNWVrREZ6YWZWczlrd2hxNUF3c25seFZh?=
 =?utf-8?B?QjJlUnVQbERlbHhRQm5weS8wbWtDanlra1FGeTRKRXNJdU81NStUTXpBbkZQ?=
 =?utf-8?B?Mk9VdW1EOEVtRXQxd3hqUHdHK0JISHNOWjNkQlp0c1NUNysyVEFqR3JHRU5C?=
 =?utf-8?B?NWYyMi8yNUVsckdacmptTFhCSTdSRFRLanFvZ2YxeWFOd0xEVFY4aU8vSllz?=
 =?utf-8?B?Z3dlVittdUZES29vZnB0YTk3Z1ZnbUcweXAybGlDQUkvdkQ1a2JmbTRLK0R1?=
 =?utf-8?B?NFZjMmYvQldTNWUvYlRESldwdTBVQjd4cUhIWURKcTNGZ3hzbjlnWVZwZEdR?=
 =?utf-8?B?anVmZDE2Q3U2aUFKYjljMzhwM3RwZTRBRklBQmxpWlc2NG9DRzQ0WUVQejFR?=
 =?utf-8?B?WHNTbEFwSWd5aXVqRmliei9UbEViczZLaWpYOFg2Q1J0dVdIa2Rlcm9UL2dx?=
 =?utf-8?B?WWJ6S1Ric1BPdWZCNWttWDVtcGtuaVkySmw5NXBaUFZXYWhDWW5Ua0ozZ2Nq?=
 =?utf-8?B?SS9UZzNNd2I4c0VCL2dRVnBQTWRpcmRoRWZjcTNLWEI4Zkg0ZWdFSHpEbGNB?=
 =?utf-8?B?Zkxya1BLYW41V3FBbWMrTjBjWEd2bSs4MEdsb0hMV0FIUUFEbkxpZi96NVl6?=
 =?utf-8?B?dFlhRGlybmNVUEduZ2dPTkttVW1WZ204bUF0dUJBb3JscFZSM3Z5RGltSUxo?=
 =?utf-8?B?czlQY25UaVZrY1Q3TjZmcUdBaDRSLzBtMitLZENCTWVQMkVkaHFFN2FJK0R2?=
 =?utf-8?B?VytHVzl5bFlDY0ZaUkxvTEZhNUpJT2JSUzhwOWorNVlNNWJBZCsrb0R6TnFK?=
 =?utf-8?B?L2l1RUJ5VmRiWXZCNDBmdHhkVXFmeXB4SWRUOVpzQUZBNG9iaVNtdUVSTzFz?=
 =?utf-8?B?RVN6RFdRZFVTYTI3cW1BM2l1dmI0RG1CMnlWSStNcmJzSVVEdEF3Vzl1VHZq?=
 =?utf-8?B?eC9RUUVHNEZmOE5hUmZHZzk2aG1WN0syZzNnZWxPaEZJaWd1ZS9CM2tGWXVt?=
 =?utf-8?B?MVRWSEUvSFZITk95aUhRSlduSFpuZ3I2Y08waTVrVEJoWGF0eHlDeklWVHNX?=
 =?utf-8?B?THEzTkxEUlVLbk9tQ3AyRzRrQTJqVTNjL1ZhREhhWndIYU1YZHhFYVdaRjlE?=
 =?utf-8?B?TEQ5emZPK1A4dXpXYm0wSHhhMGRtQnBvYTdtdEQyT3h6dGxpVHA2UC9LVFY1?=
 =?utf-8?B?ZzlSa1pmRGl0K0ZJb0pVWTRxaGZyQ29Dc0NSM1ZrTkxUb2oyVWdNWGN4Nk5a?=
 =?utf-8?B?Zmo5MnRXcVJrOVMrZDhtREp2SVkzWWh4MzljcTBDR3BtTVUxaVRqWi9NanRO?=
 =?utf-8?Q?lGvdVUKnOQDrkWuH3i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfe0c7c-290f-4a85-e7d9-08deb5ad33e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:47:44.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTnzY3SiDoYvRAHMel9fu/rkM/ujuN1qCGne99omWsngTGU1yit9K5Pc7qVidn8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62148-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,linaro.org,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 6790757FF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 15:05, Mikhail Gavrilov wrote:
> On Wed, Apr 29, 2026 at 7:37 PM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
>>
>> When dumping IB contents from a hung job, amdgpu_devcoredump_format()
>> acquires the VM root PD's reservation lock via amdgpu_vm_lock_by_pasid()
>> and then, for each IB referenced by the job, calls amdgpu_bo_reserve()
>> on the BO that backs the IB.  Both reservations are taken on
>> reservation_ww_class_mutex objects but neither uses a ww_acquire_ctx,
>> which trips lockdep:
>>
>>   WARNING: possible recursive locking detected
>>   --------------------------------------------
>>   kworker/u128:0 is trying to acquire lock:
>>   ffff88838b16e1f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
>>
>>   but task is already holding lock:
>>   ffff8882f82681f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
>>
>>    Possible unsafe locking scenario:
>>          CPU0
>>          ----
>>     lock(reservation_ww_class_mutex);
>>     lock(reservation_ww_class_mutex);
>>
>>    *** DEADLOCK ***
>>    May be due to missing lock nesting notation
>>
>>   Workqueue: events_unbound amdgpu_devcoredump_deferred_work [amdgpu]
>>   Call Trace:
>>    __ww_mutex_lock.constprop.0
>>    ww_mutex_lock
>>    amdgpu_bo_reserve
>>    amdgpu_devcoredump_format+0x1594 [amdgpu]
>>    amdgpu_devcoredump_deferred_work+0xea [amdgpu]
>>    process_one_work
>>    worker_thread
>>    kthread
>>
> 
> Friendly ping. Pierre-Eric, Christian, Alex — any thoughts on this fix?
> 
> Happy to spin a v2 with any review feedback. One thing I'm aware of:
> the `Cc: stable@vger.kernel.org # 7.1` tag is probably unnecessary
> since the regression only landed in 7.1-rc1 and the fix will reach 7.1
> final naturally via drm-fixes; I can drop it in v2 if preferred.
> 

Good catch, but the fix is complete overkill.

You can lock multiple BOs at the same time, something like that here should do it:

        drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 2);
        drm_exec_until_all_locked(&exec) {
                ret = amdgpu_vm_lock_pd(vm, &exec, 1);
                drm_exec_retry_on_contention(&exec);
                if (unlikely(ret))
                        goto fail_lock;

                mapping = amdgpu_vm_bo_lookup_mapping(vm, ib_addr >> PAGE_SHIFT);
                if (!wptr_mapping) {
                        ret = -EINVAL;
                        goto fail_lock; 
                }

                obj = mapping->bo_va->base.bo;
                ret = drm_exec_lock_obj(&exec, &obj->tbo.base);
                drm_exec_retry_on_contention(&exec);
                if (unlikely(ret))
                        goto fail_lock;
        }

@Pierre-Eric can you take a look at that as well?

Thanks in advance,
Christian.

