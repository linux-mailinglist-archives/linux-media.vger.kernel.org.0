Return-Path: <linux-media+bounces-59338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF3OGtPK6GmZQQIAu9opvQ
	(envelope-from <linux-media+bounces-59338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 15:19:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 039964469F6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 15:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6070830A1F11
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349B43EAC6D;
	Wed, 22 Apr 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s8lASLao"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8843563D4
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863629; cv=fail; b=cxATIHv8hFmCTT+h8ZZFCLoV6BrNS+qGKPLgBCShcywsZR4+49VVENCHiu29k4svJ83FqcuaMRO9MT8IHIXs4cIjlm77VoNsPEvRK9/txEwSVZA3XGl8Fk4Q1rj70QxMbYfkpCnQxsj+AwZRmdA5VT8gh5sHO2BcruHxGIOPdiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863629; c=relaxed/simple;
	bh=by9hGXBTYqMF9TUNBdVhlm8gjz5b0dZvQqrcMUgURgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EZLqpZvx+UvvT0FBmygrYdpMdjOTTyWVksj0nKfHz/mUdLqjkrJYeo03z+ZXloXjJLVQtkWrNYTzSQVgRISwUVF/DbIzQ1Ymk24tjUDtzlUxJzeaj0lS6c0YE120/aW7t/E2bZBTz7CSaa4ttdlPowV6eMKrz81JnFhaNFbQQ7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s8lASLao; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rlc3RILa2ziO+1FZpahA+dVEZTAWgWPAs27Gu+f38SN7FM3hNuiF88chXoeFeXJ5zS/5X+0MV/itgfJmiKEUBd1xrbntyApUYpPMk9T3A3RfsfFLT7C6kb9MQ3yLwEzhwPPe5BwoWI1yBjbgJSDdPaOhXddfNWUa7Tbynx6OQTzHs68qWVfLfJhLNvpOXKyRvQYndUqcVkbMNW9r+51xqRqBmzJQglyeqCopoInsCltttgr/ulPEQvLD1poNNEWDMEX1lo/8vTTxz+RuPUaO6AjRc4N/ANEbCrBNyU9UBlzFbaZjGNdWaLSF14xYXbjJfsq+eXoWLUDXJ4AnSISHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbdQ4Oon2/UIiFXS7sv16rW4AiBiu4pllSVmm7EkSxc=;
 b=tOEkjZqSQOJd/wLqcmw9mKRGRuQiacsaFkih1D3RQ0ccG2pKUbh6fg7TW1JtVP5NTbSo+eCOkxw7VVg1PV3mqpSr5Sla2NpjDk5AQr8uio980LlXlKY6TkXzav4Qey737BRk23NSvtUncVxBf0pvOgpZ2G4NOnBzl128X1k4cVxIDSrlCjX0QglDc+IW9+uCUdlyiuxodsZfxe75X7h1PLOkBUkjMBeQFwasbiKP/MihpHB325y0F1Uo/db8z5H0p9Jiv+5Owm221SvTvZNx4ZaCaKXMZnGqDcHE7jzIFa2pW65uCWCiQpxEotWhhQHmN798fc0YhSGtOiSrVdKfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbdQ4Oon2/UIiFXS7sv16rW4AiBiu4pllSVmm7EkSxc=;
 b=s8lASLaoml8ngJ6EzRoYVuFBh5f9iWmiu6w3CdBlzzu2vlmfUur7UAUgfPjDtbBEhIHHjFBoxEqEGC1elc+A0fUKPvOsY9vayRdJbKpMg/h1pJzHHHEnb8lFWLUcagajdtM3cFegXJMocNBANvtff42VDwC5YJkVAqPgZL9ejxpWxGDnq3cCLziTZt5NoIqI2sAkwZ4lpFB6rpJHVghIJgbHPgUefdGJlNNXkA5z3FS4fsDrkjdPvA2V+z31tXBWwvbWMbXpQagWji45UEJKvYer3tsrAZdp7qXmYPvLbu7ie+Ne4uIMyoQ9eH7w0njaSewiKfgl/l+gdrH2NUiNiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPFA8EB66EE9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bde) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:13:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 13:13:39 +0000
Date: Wed, 22 Apr 2026 10:13:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
Message-ID: <20260422131337.GJ3199414@nvidia.com>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
 <20260413121628.GE2588311@nvidia.com>
 <f6d38a08-009c-4efe-9dc3-6bcf00ac35f7@amd.com>
 <20260422115306.GI3199414@nvidia.com>
 <fd8065ce-fd0e-4df5-9c80-8e9603657cfe@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd8065ce-fd0e-4df5-9c80-8e9603657cfe@amd.com>
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPFA8EB66EE9:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e83959d-5582-407c-7cee-08dea070f7d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	elEBSodNLqkwKYw1fIQEg+FXcVgdTXEKTsFLeOIN2v28I7UHUtLgmVauoZYOK41s+7rC5IJtPFgPoRjcUCw2QvrJmgslPkPorWngRNG8oVQaWggEmgn29Q18Pi17FgRuMQ+AWUdWAsAMYL/+duUmGW2t1GF1UEOQP+6EJbdT/q6Z76+e3W6NT4gD/3qug9Bu9QQJGAFRDoY+4WsDc9DYOOVwjffArMjw0Pv1GSURA3fS6vshN/AozDI4QtvOpWLSmML8Tt9CP5tpFq09h4Q3W6wlh2Hrf/tUpE+YjbJD4WXm87yVfOtV89mXQn+G8mCy8Dp9WDm3f4NC/3zylaz4J4f+XuQY6YMdeqZRwXILVlFTUb5oMYWTb0UF0w40F0GjXslIXWMXsay9CeZuuiOwSJ+BaMgHyck9d9iV4wOuwZMPygMsU53/3fA57ivtifaVc7+MlN9G3ZZ8yclEKYdpzeew8haGzdi5PPvCMAuKoYOVDi7+kbSJlXOzLb91jwOhK7Y5Woe1/CWCPqO6Y2JyQN+34WJBG0AC7b5RxsXgSYLE5Y5iERKm7TMlRKbecjN6gMULFdB1pxvh10Mod3XdCwqwHO7M4l9KrLH1vVe7xjbBLChoDGTuidah3b0K8S2uQMyd3yGMTy+e101ZmlQSl1tc0kE2GUBTHTfx4Org1KnKAS01s72iTvvmCK73c2ltwrCCpn/B0JWa1DuVuRYHKycXfS6jzwupfg4Jv4ZoKwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXQ2aUtobmlZN3Y3MlhheW95cW9JcWo4azNCWDlWTUNzVmZEMm1KME9IQ2xW?=
 =?utf-8?B?R0VLUnJBRk9zaWZUbExVV2ZxVmQ5T3J0RHVKNlh0aHlzSEsxYXlhbjFaU1hY?=
 =?utf-8?B?TFZHTjZKZzNobXFtOVhJZGRsNHNwUnV4ZHRyZmt5bzNwZlpkWUcvYnlQNnBC?=
 =?utf-8?B?alZUMjZ0RitMSnZ5RXdHS2NYbENJQ0JjN3ZVTzRsYTNFNk01MFlwaGtwbDVr?=
 =?utf-8?B?dFFaV2Y1MC9mLzlRNE91ZmwycG5GQ0JjQXhGNUxsN1dLQUhKLzNpbDdFNUov?=
 =?utf-8?B?L21tZy9sTFZUWWdRRTJxVHRVOTBURlR4TjNLblZTcUxYVFNsQUFVbXY5MjBz?=
 =?utf-8?B?N25CenVpS2lhYkNDV1ZIWUlwN1krQTlTcWJnUDY1QWJJVWtLYzhCSHhzZDZN?=
 =?utf-8?B?d3hDcVdUbTVhU3dCV3lFMVFyNG9zN3VZRTlSYmhwQk41WEw3M21WRUZBRnJi?=
 =?utf-8?B?TTBEQnBBOFNOTFllbWExRXJPaTFMWDAwdUl0bDdNcGxSazZTRnZoSGRVUE9s?=
 =?utf-8?B?VC9Fai9KTWt5WlVQemtKVHpuS0RvWEw3MkphRmZBQ3FHRWIyaUtKQUR1c0hL?=
 =?utf-8?B?Y2xsNjQ1dVluZFFDNUFlU1JFUHFJaXp4K01heExFbHZmWjRhdEhEK3ZTNGJp?=
 =?utf-8?B?MGUwcUVQUmE0VEJ2QXNjLzlmZlBrR0QzUEo5WGluWkVTcU9VRzJ5NFNreTlM?=
 =?utf-8?B?Y1pObndCWCtzblVNSFFlaEFsQUlxTThMWXh3K1NOd2REK2pPYWZjU09GYlJ2?=
 =?utf-8?B?R1RqSjlmNUVLcDBiTjF6QjF1aUhHK1c4WkhSbmpybEgzek93SzJGRituQTNJ?=
 =?utf-8?B?ZVRQOHVTUzJQL2FnVFpIK1dwVDdVM2l0eEhkMkI5ZGtIdmRPbEdlT2tHTWU3?=
 =?utf-8?B?WmtvMTM5MkdXV3dTTWNjekZZSmJEalE2WkpCcFBwZlljQVRGM0liMjF1TVZJ?=
 =?utf-8?B?UzQ1T0ZkT05FS0x1SE5aR08xaXY4dXpEdUdVcFpFS0VMdGRZY09hbFhhRy94?=
 =?utf-8?B?Ritsb3pBYjlEVlh1VzlMNGlHWDIxajROUlFEQ3c1eVVEWkJYTUNIR25oMWVm?=
 =?utf-8?B?RDRKd280OUVEN1N2QjI3K0dmMXFVVkNpZFllYU5XcnVtelgwYzhxb1JSU0g4?=
 =?utf-8?B?L2pTOTBoSmRlUFp3R2F4SWhjcUdjaEsvMFdZdjg2eS8vUlF4aUhiY2lTamVH?=
 =?utf-8?B?ZFpyZFdYQlJyVXRrcEZNMUg4MTFFR1pOaEhFc2NGWGVTNnp3enI5Z0ZyM1BY?=
 =?utf-8?B?Q2JwY0Z1cUdjYklWNHFPSkhzYUZLUGpmcGlTQ21OVm9qc0IwNEJ1eDBodk9w?=
 =?utf-8?B?cWgrWDcrdlBBOUk1R0xLd0tpTG9XRXRjb1N3OWhaeXlJaXhKRFdpdWY5Ky9p?=
 =?utf-8?B?MWUvOFBPc0FwWjhJZEdsR3djT05xVHd2K0paOXEzZjQxa0hZM050eG9lWmtE?=
 =?utf-8?B?NWN1Q3ROd2JiR2cwNisrNjBJZm5KUm9MVzlPajBHc1FQczhUVXd3bWh1NkN6?=
 =?utf-8?B?NEkxTkxMcDBvd29ZVS81bERhdXorUHlvUG5hUDIwbm9iTzdyNnJyL0dQUXNT?=
 =?utf-8?B?WHNlNGlHZ3V0ckVzNVpta2FjNHJGUHhaMnFqcUhVejRncEtjdlVvR05aTEl4?=
 =?utf-8?B?K0IyRnpYZjJRc1ErUVhNOHluV1VrUmUzMHMwR2UxM1RZZUpPdlhlNnNieXo3?=
 =?utf-8?B?eml5Tk9UajhheXloOW5UemM0QVFKWUNKMEZyYnhZckFUeDZoOVZjL0ZvNXhq?=
 =?utf-8?B?aHl2L1ZSakRwZGJNSnYzR0l1MUx2TVEyNWh5TnBrYTJ6d3YrTVBnQ21jN3ND?=
 =?utf-8?B?NUl0N29HeTBISTJLWEhJNXFNTGZXdlZ4Qllvb3BobElHeHNZbjRURERwRFor?=
 =?utf-8?B?YTBsOWg1azFSUXNGRUZvMXk2dGI2U1pXZlJ5WXBFcFIyR2NINzJvTlR6elpn?=
 =?utf-8?B?MmtoRTVqYnc3SW9CbWJoQmUyd0xZSmFUa2VYWmhIUlhSVjdlUFFKU1RIa3Fp?=
 =?utf-8?B?NUpWZFJaQTVOdzVDQWsyeVhreTBNcXZsTER5TTE0VzBERmQzbFZ0ODkwblFT?=
 =?utf-8?B?aDBSaklVbkVzYk1WRGJYeGFyU2k1Y3U5dG8zUW5XRTlzZStSRkI5b3Yrb0Vl?=
 =?utf-8?B?MTdlaGcyL1FWVy85T0p3dFdhQWF3d043WWRRL0tOb2pnanR5WnBFS2paV0pE?=
 =?utf-8?B?K1cxVWkvUzhjaTYxZHhpb050eTJIQ2ZLRFQwVFl4YnN1ZlF5TnJsMTZ0UFcw?=
 =?utf-8?B?NVl4WmhGUm5oYmZ0K3NRN2J3QVluSkN3YXAxa3I4UzByb3ZjeEROSmZpVy9o?=
 =?utf-8?Q?48y3zmp53sGMpECnS7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e83959d-5582-407c-7cee-08dea070f7d4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:13:38.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+cJtViCSkXXQmrbzln+k0BCYjqAPmGzkOGIwwmf0KgwWmRhwvqj58Si74E+CFrB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA8EB66EE9
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59338-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 039964469F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:39:16PM +0200, Christian König wrote:
> > Can you be more specific please, I still have no idea what you are
> > thinking in terms of an acceptable implementation.
> 
> Let me try to describe it differently:
> 
> The iommufd deals with iommu_domain structures which userspace can map different things into.
> 
> So of hand I would say that an interface to map DMA-buf into such an
> iommu_domain should look something like this:
> 
> dma_buf_map_attachment_iommu(struct dma_buf_attachment *attachment,
>    struct iommu_domain *domain, unsigned long iova, unsigned long
>    offset, size_t size, ...);
>
> The DMA buf exporter then maps the its data into the iommu_domain at
> iova starting with offset from within the buffer and size number of
> bytes.

Well, my first reaction is very negative, this suggestion is leaking
deep internal details like iommu_domain out of the single place that
needs them - iommufd - into about 6 exporter drivers. Not nice. I have
the mirror of your concern that I don't trust DRM drivers not to abuse
the iommu_domain pointer in some very creative way.

However. With a suitable helper we can largely isolate this to a
single function and yeah I can see making this functional.

Not sure how this can work for KVM, but I'm getting the feeling the
way forward here is to "live and learn" together.

So, in the context of this series, your proposal is an iommu_domain
mapping type, to replace PAL. Yes?

Do you have a positive feeling about the general mapping type system
from the earlier patches?

I think if you want these kinds of APIs there are going to be several
mapping types required to exchange their very narrowly defined
details: scatterlist, scatterlist-ng, iommu_domain, the Intel vfio
thing, UALink, driver private interconnects, and whatever KVM needs.

Thus I think this is making a stronger case that we should have this
formal negotiation protocol between exporter and importer for the
mapping types. 

Thanks,
Jason

