Return-Path: <linux-media+bounces-54091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kICxAZ6LpWk4DgYAu9opvQ
	(envelope-from <linux-media+bounces-54091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:07:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737911D97AE
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C33D30774CD
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 13:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744A43D902F;
	Mon,  2 Mar 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jFP3wpzO"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE63D5236
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456479; cv=fail; b=P/6/JD+dfNhSF5QteBrLCHcbxewICWfBkG+y2SiD7y+rBhVitp32xOnfWkmr+nWy2Dw+Va42NlXsTOAErbPSh+jttYxC0V457RbBcqapr1Oi6fhFTsf3n3ss8NL5+m04VMFtq/Z0MnwXlhGmf/6zy8gDZpGQtUyMuOvbDm7XGWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456479; c=relaxed/simple;
	bh=otl2Un076yp9W4+wIvlfDYlhCGdEkNuXMZMFckOISZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QRkrCZCPlKuDtbfMQiulk123WcQ84fhzYAZ4hjpezVE+F5sOMCohIt6mifsect2Aw3cp34qRq8DoprFN50AYFhbweI0h+s239S2eOOsFJgz/sjMicmHdMGEnYfZa2UCbZ3Adjx58M4kF5IKEhZ56KZLG4ImjcYI+L10I6b9aeqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jFP3wpzO; arc=fail smtp.client-ip=52.101.85.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiGUd8m2jnROz2SNq6S8ka7r0olIUCMhvy0aefEH5HUYnOgGSKeit29Cb/azQRu/VTQ4qTrf7XuFUNH7uu2FclhCzs2vsCes11Y95gU6OKlilETjeLRlciPG7IP0yqfUZ32+ZeoesI4YANNWO2YnR6A7aMN/cPsBFVJ3GX2Qaqx1aP6rquYy8L7Os6YC6XVh2yg4HyNBi3lIa7mJeZhCUT2DfZwZIeFPkijN7xz0COVGtem48Ug2NcXaScFELVxWW3JLRz0JQzqytEzKdIREKlkv5sfMA48ZCJUQNG5Uz1fTfQoy38cKYPHsn+T1CN2TdYpKUF4sex11SAsc0IL7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+o2wlpXB1bK/DdnAp3VPWeW9yYsMqjwgTNXOJLusUk=;
 b=ngqFbf3xZhGiqaNpySylZ4pmstWjN0nz1M4ObHObn+FP3gZe/KbuyxvNidc/ag/d8owpvlx/p4qxjQa3SdjXYfjOVoJqhWfXun2VLZ8ppB0K3K0iL1421jry5KEC7wwjKy7lRuz2DLZJsEqKzxL3mG2B1cX0qh+9bv/iiTqqma057tfCeHYe0NSQy4tNq40HSPLtjN3W7qsWAJBxtaXyeICr7AAJRxCL+SA1KKRwgxgtEW2Kcx5K4sIBmocSaPKh0S0WFh0QEqTY87zrpG9OD1RQ7djshLKY/wPS5oCmUZ4UiMEgK6f/QqpG+FUtim/S7aWItp5c5/4hFR44jbA8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+o2wlpXB1bK/DdnAp3VPWeW9yYsMqjwgTNXOJLusUk=;
 b=jFP3wpzOxj2sqvZv8+iyv7NfJ3RiVlw1HWYbxnH4hoZ23MniMH9PALJPYyWCPH+tUdoayfg6E/ZgyQ5nubcRu4GkhMHMbXPP0Cnpzk5sp7JvNXxXZRkRpoWHiiiZAtCJYJ9XDlTu26t9ZGCyZvF0UtFrBuwmtKvgscDGKkBO/5HR6S7w8Pm0Mcp6/RLWAjxeEHaIE0aCEM/rHDVdVsL2uGnn6fTPTHQrUhIbtjw3ZHKiLDPliVxso/2CotYLQMaOoPAl8tonY322KcXQF56BRWXnyvyZE5a+BTKPmzgLN2DyoMyMmrf2D5KpNFpLSmXCgrZnPmxd8G+HlQ3zTmQjsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 2 Mar
 2026 13:01:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 13:01:14 +0000
Date: Mon, 2 Mar 2026 09:01:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>, patches@lists.linux.dev
Subject: Re: [PATCH 0/5] Replace the dmabuf custom test framework with kunit
Message-ID: <20260302130113.GV5933@nvidia.com>
References: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
 <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
X-ClientProxiedBy: BL1PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:208:256::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dcc66f-32d4-40d7-c9f2-08de785bc932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	kaQN46E8hTbqy+dFeC5eJvrm3jzvhUv9+toRqe0aAPg7yn+MqVgRrxY5OdDWoRlsG6bDBYGk+7ZKEMSmMICU396eMB0L2GaN6n6bd0yB67p1umgsn7O8W8Wg2dAJVAhsoadJS+b5kfJYEyrv31YUSlaaSZSi/bf2KcAUuNDYpRPXU9+lsJ/gu0f1r47mXbKRUYjYTqZIoyQt8I+S8k0jgpJYxIOGsVfytZWzh+YKN6b0+rPSxIbnzkGbyOcFEV2MiC5MnJe0N6rtIgGQPer/Xlo3iowWwdOrzJO9ZCADo7TvT3DDA+nMCAWB9TU9keFOrDkADxkoRno57/x75nFDntvTevWdOUhDpWQh/E4Q96IH5mr7CLvdxxKxjIeoMb7ZrhT0bCa90HumtfPS+WUf30SB6WoIDt0e/kE0kglfNoHda2jxTSOj4KNsKeTtJP3keDsL+WwAM6p5X4AUBf1cZHbwlRHQJmNQsro0m5xxDWjG5WAJNToX992jcuEEhXemV9ltmwkDV+kKiGdIOfbvo28BojM715gMEaq3NxDLjzTJZXYcHlkffpA/Ozg8XVQMUH2k9X5j0BHaTvbCtXUfpvvv59MdTcaR0P9WRZ308JDP4qNMq9nX1mX3eEXgg4UxqAnGx/dcRSt2lUj7rtnKzMtmK2Zx56jmN03M4vjWDn1vDDRkPoDJFIIlhISk/Dwlu6FvYc1oIvaWpqIQbgkut8DmQaKu7ztMfB19vxEIJNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpQREJINVlPWVc0M3IwVUZIaWtka3dxbnl6bUtvdDVUREYrT1BIbVg0L2JX?=
 =?utf-8?B?K3VoMjZHLzdzZTFGQVhEY3A4dnpxVDFmMHI1Y2dUbTFvQ1c2S0h6UzRZam1u?=
 =?utf-8?B?UjEraXdwSFpjTHExVEZ2bnhpeUpGaTVnZENyc0ROWkdmYWdDWDZqZDFsZ3lH?=
 =?utf-8?B?WWdBS2NKbHJUNmdnanZZZDZlNW1kdmszblNJNEJBZjdWYld5Tlkvb3FKOXJO?=
 =?utf-8?B?Ry9PZ0w4aGlmaDRpeTJIbHNHTmwrZmZHMFdJWTZtckdnQ1JDVkdUN1pkTnhi?=
 =?utf-8?B?WE9FSWZSQVhMVGpkVlFWTVozd3dnS0xzY1V6Q1JQYUgrV3ZrNjFYdnlQa1lo?=
 =?utf-8?B?YXlQY2ZRUHFRZEpibWFWUkN5TjhQeTVKM0M2Y2hMZ3orUXRaRlNrbytCZlJs?=
 =?utf-8?B?SmtJaTNxZS9OMTRmNEIzUkdNbXlVYlJMM0xtNkFXemtTRTIwdkMzaWlOeW0v?=
 =?utf-8?B?Q1NaZE9sQ1dsbFE5Q0g1eWxFTzlab056QUFmZGRCNERpMXlWS1YwVFN5emEv?=
 =?utf-8?B?L1k4UnhSdHd6bW9LelYxaDE5MjZjME1ZV0ZFSHFGUGhpN3B4VlFmTG9QM1JX?=
 =?utf-8?B?dk5YS1Z4TUNVMmQ0WHlaVHVyOXpudzFoS0xpdzRPejdQZHFoL0FxMzVENFlE?=
 =?utf-8?B?LzRpaEhFVGtsbklkRElhMURNUXF5Z2RuYlRlOHUxdzQweGhsbmwrZCtrdFdY?=
 =?utf-8?B?czREaUttajlJMkZIMXZoa1hHREFqS09KSTNsYWgwdDdLWFdOYXNNVnc4ZkRJ?=
 =?utf-8?B?akhEWHg3NUpBUmdmb3lDVDNLM0IzSERlNUVEVm1RTUlZSEdtTTdubnVDQmdM?=
 =?utf-8?B?a3dHUE5EL21ZOEk1dDJ3akVsQ2xBM0V5UHh1dUQ2SVdTWXpHMEpydHBoOTkz?=
 =?utf-8?B?ZjdJdkhXWE9VbFZHTU5PbHFodGx2bGlZYmx4MEtFYzRLcWJTTURoQXZabFJP?=
 =?utf-8?B?MXZHQkpaQkxvZGhHNE5PeEhPOWhGZzdQRzhpeHNaampoTXV4WCtueXdkWXRi?=
 =?utf-8?B?RGlyRjJocWUwK3VVTTdUSEtPNUo2S3dTZ1BVeVRxVjJTUWZ5ZGV3eE40NFQz?=
 =?utf-8?B?ZFFDb2JndFE2TGViMEo4Uk1tc0YxdWpVZkV5cTVwbWFlbmppTFJpNmZwMXpQ?=
 =?utf-8?B?aHBudW02djdCbS9pRHFCK1FnWXBaM1kranFkNkFKOFdzcG11MUVDbEpnU0lp?=
 =?utf-8?B?VHVyTXVlQ2h0QlgvOXhFS1g0bmtvNEhqdldTeWhWTVBZclpJR0dJM2ZNUjZM?=
 =?utf-8?B?MWcrNG04L1pUZHpGa2FUYTdhSVNWZWZ6bm9vczFiSDkwcm40aWdQaVRVdDdX?=
 =?utf-8?B?UGppaHF1OWpWL2dPcEx6MERudFVrSDJWaVRFNGVQRXNyY29vbWdOeFhJaXlY?=
 =?utf-8?B?VjZmeG50WHpIQW9ubVp4aHFoWU5TV1ZyRnpUeFdzMXBocWdiV0Y0TmRPOHFL?=
 =?utf-8?B?cmFYSXd1U2lybkh3RTE4aE52QU8rVmxSQjhvQU0wbGlPaThKWVMya2EyeDY1?=
 =?utf-8?B?bHE1K1RFQ25KWWxrMktxRVJXWTlBMVAvNXJ5NVlFVjR4b1o2NVVYK3BlWE5B?=
 =?utf-8?B?QlFobzBSbWJiVVByenZ5OWRkTmxJWGJHR28rSHFSQkVldWt5bmlLUTI1REJm?=
 =?utf-8?B?bXZLTElnWGQyTlpIa0NEbXEvZ0crb2J6ZldQMmQzT0ZDbXJNYWlPOXlqN2NE?=
 =?utf-8?B?Z1VEOWZBTGZTVzNKejBIZml3RDQwcnpZTEVpOVVlS3dXVTlVSkxWV3c1M21H?=
 =?utf-8?B?cEdhSEVVVUt5c1hwNlV5Q3gyOGYyRy81cHJRLzB1K3J3aVBFY1A4aXU4MHJS?=
 =?utf-8?B?c05JOGpWQzlFVHduYzR6OTZ2aWZRK1ZQZGVVdnFHQ09xNXFrdHN0N2l3aHBt?=
 =?utf-8?B?Wktla3JVMjg1TGo0MzlqVCtzeG9pK3R3SHJpZnZJdW0wSTI1eFZTdGhid1NM?=
 =?utf-8?B?TytPdU5zcmNsdDBzOEZ6ZkFaa0o2UlZPekVlQWZUQm8xZGprL2ZILzRPZ25B?=
 =?utf-8?B?TDIxY0lEWGZlc1lhd0lCc3VhdVAzMzFpSW4zZ3h1RGJLN3BmbllYclNjNEZm?=
 =?utf-8?B?TlMzWkFpZ0hrNGRNcjJnMWN0dzQzaHNabE52ZG9zZnF5cWRmMExHaFhpd1hw?=
 =?utf-8?B?bzNydnZJQ0Z0Vk9XSkdaYUNLSWRtdzdNVkhXVk1QQnZhcVJTWVJ1aVZQQzFW?=
 =?utf-8?B?SDdSZ2I4ZWoyZi9JQytXbEhxZjkzWTBxUmdEWVVtcXdjR1lHc3Y4VlNQQ29V?=
 =?utf-8?B?bi9nYWdGdUEvRmdKYzNidWtvK3lVdTZGWjZxenBqTWR3VHFIa2J2ZFl6N3ln?=
 =?utf-8?B?Z0ExcnFMdkVqWnZxM2thRDFIZVdzNkZVMVZKWDNRTjJPTytVb0hZZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dcc66f-32d4-40d7-c9f2-08de785bc932
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:01:14.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtqQhApGP+lYZ8IxD5RUmassMLP4YE3ecL6QP3IpQukTcNAEbWlUvwnRYj/JT4DT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-54091-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 737911D97AE
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:43:34PM +0100, Christian König wrote:
> On 3/1/26 19:57, Jason Gunthorpe wrote:
> > Using kunit to write tests for new work on dmabuf is coming up:
> > 
> > https://lore.kernel.org/all/26-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/
> > 
> > Replace the custom test framework with kunit to avoid maintaining two
> > concurrent test frameworks.
> 
> Oh, yes that was on my todo list for like an eternity as well.
> 
> No idea when or even if I have time to review that, but feel free to
> add my Acked-by should that go upstream.

I'm confused by this statement, aren't you the person who would send
it upstream?

It is just a kunit, I wouldn't expect an intensive review. The tests
still run after all

Thanks,
Jason

