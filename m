Return-Path: <linux-media+bounces-59191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMspJSz45mnr2AEAu9opvQ
	(envelope-from <linux-media+bounces-59191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:08:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0243637D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75EFE3052A0D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 04:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68C9287503;
	Tue, 21 Apr 2026 04:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EnwKDtU5"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D21FE471;
	Tue, 21 Apr 2026 04:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744248; cv=fail; b=cT5Ho2F4506EAaQyFbzPysF/lJf59t1AO32v2xICNFROw0mbNMBIsvWj0vb66Pw9gbYui4jIdYi/s7c0sLolKbJ1Wg/sPd5FftxeyPkjp8hi1gsbgM6BBAWfmNcuuRdU+ubGPdmOvw1LIWvi5T23Fqc0fb+dkw2yktWxCsNrw2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744248; c=relaxed/simple;
	bh=FuEhG57hwtFYqRBy/ucC+ZICKLWh6Hd5grRCGcXLylo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AyW1Iu1xjuZPHZCVdrVqYELKtd6nFq0gf2tsX1Rff81hDXKlX2IwSqCLgtLLYcoH0/cGonHl4IJwdTMUYHRO7ctb9nUbtmHuUitraVRfrTFZc3Vp1vR6FfKRxW2As95tjAuif8s1qjVCrS48FwmDaDPwx/pqsqzrGBTA9XSx2eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EnwKDtU5; arc=fail smtp.client-ip=40.93.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYznuLA1WXZooJtZfP/yciGlirBOD6PQwbUqqYezjRgpwVo9Ovy3QkQKXK75mmgqJcwbdVpnGKArwtuepQATWbRQpkKE49T4vEEzJe3G2cBWNj5cw+k3O1zF4jcgs9AO6N2YTIu4CO9RiAEY1SI+uJm2uE52Oj2KWIE4qf9VGlxFc7UdWYjr77mPnT+K8t39GDD7E/Yk01yNiImPDsC92De72/+IaTbtcgOQ6fsqNlFmCt01HGZqGdsUYhMlOakbEh2Vrwg3f4r6JS8hRHUPpDtiki9pthUJ4KqhroxWunN0DExe0NQiRwprzT+NkdcjkbrKxkB5S440uMY+JrRvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prbG0fFZdCBtJYktY69R0nSL0ySB0wNLn/aXmKhFppc=;
 b=J4QgsV92zGoovKpVRNKqiFmZM+Rb1HmAL3QIpcWARHZmAsw+Y1Kk/4a6RXOa1OtPmSq7ESiCN/zzT3hxs49o8LbOKpc9KcH32gwyiuDE9tCjB+OBydXbL6RbL/GnQ9yET8V3JlOiO+Mld/Q4oSR8LX6PRjhABn2PIjN6/J8/Dgui8b5mD768Ip6H7PSxflzOi02XUzXHh4O0/oC8b68MgniSvyOIPR0BL+lwlXAaQLQGkn5AQkRhXUaYiUe8KL39rYouZ/wFXOCZpgXrYAD+T4o3MOLsuCj68lgOkGcyfzDrpV4vn5HQNQKNvdj1bEJeDfD1eCm6mERKYcGJCGfCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prbG0fFZdCBtJYktY69R0nSL0ySB0wNLn/aXmKhFppc=;
 b=EnwKDtU5rS7euyIPH9QE30r+OGhDmNlWby4/DvK/oG9KsIT6OTQUbdM+yHjkTxgzgzirDEjm34XzY2VxoVP9BhJgypnmiKLP1Qxj0R9vyrmwhRWvMmJDRu+ODLgmvCkJ7pG9xVcA3LuDhMir0v0MUzCHLFbEaPLlLBH1VYBiZP+LkSPhde20opFUvA8+L6mUJFxiLQbZntalDGhPS8mBRGwHCZgC0xGNQ2w81iIbFzJPFGdLvp7Pwl3wbTR4QvpHeOFph+oSmas0TA1cU5P0sCJJvNjdpnGFxAEwQi7ArZxcJZaTv9xgH/oT7N48GRpy9/jepdt2fOuv5m9JFZudJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 04:04:03 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 04:04:03 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 21 Apr 2026 13:02:39 +0900
Subject: [PATCH 4/4] media: nvidia: tegra-vde: Fix iommu_map_sgtable()
 return value check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: a6529000-a038-4bb4-f841-08de9f5b0676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bKeITltp0i0UA88NFQWzvf3XEs/704sP42U8ixC592IqFObbsT+JXtzpIhXS+Ux2VSw/jeWo5XoOajdGy8LS7/kG/BaNrz6pdFgT7puNK7pmLbpFmT3GXkryONLte7L5FHhR7kjc2bNvXQzKMuzxrGDP3ZBENbA5EmGPwZ2EzbeWU2/tivQvXOz0pQp4EhOl3DzDIyt4v7lBAsISaOQlS8umiizlwfo/rCB9aG9LZ4ja5vEMCqhON2TR8PR3FpYhpSFQ9W0pvVBflhyOKi1eSRwhfhI0UUmYb8XklRJ873w4Sw6IKRhhH8xfZPOYVq29XIWXMrpChoZWcFsUDRiEqlf91YKPBWqkmZcIJyvNrCYWm+gzsRh71gsuKvgdL9bShKsI547Rw6ZIRheDWWLTXuUpeuGklma/HVZDhK6sQ6yvuW6RqztGAYUt84eP+ISFDEmsMcZ/ueXRYdFUOaDBrkl2pwuDZAaIvJetvC8dWsFXafttnWdQ5A1WQhIlruGQkv/BdXPfakkZWSM4uonoLPFrtjs1gls3EJw5V28nlBS9SHbOaKnB6Z9IxIwtmET2S5/q0wfdXSHRRMTVN1haQI493ljO9G12N5yUE3VnDi0tSDboU93p0cPfYAPR6Qq9weAKiFi1YBk/3F/RQs9EbgOBdrupgyafwWd7B7BUYDpMXbHeFq8rxj/+tLP8kzC7hJBfkRHKUS5Hqy7nJb7cA6GdSBzrQlHIJOkbF+3wdyfHOv4ZlzCSbmptj6/Ey5NKlmG6GDZXt8JxEXB8+JrJDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aitqS05CV0JneVJtc2RnRFNMNy96bEllL1RSemc0WnorbkEwVHRpR3FIeXFK?=
 =?utf-8?B?bmpKTlpXWDcvZmF1aHdtem5QZDVGT01rVTJEbWQ4VWgxcUo5WHYrcThFL1NK?=
 =?utf-8?B?SkVsTEJQMENQTkh2ZGNJMW9IczNHTGgwVHVRcFgzUEd0TkZEKzdBbjcyanI5?=
 =?utf-8?B?dUdkS1Z0ck1OeU8zcHFkY2FhTE5ndllyaHFHZUx2dFd2eG9oREZjeWJpblFX?=
 =?utf-8?B?TjA4eVFHKy9TRjhNaVZrTUZYWXhxTE13bXFwMXp2Zm1KZE4xYTVkMmhER3Nz?=
 =?utf-8?B?eHZtOUY1NWxPdUFLUDdxMUdNdFZhSWlvakEyVG4yeVlBSmNGYk5XSytXSnJs?=
 =?utf-8?B?VkR5aGVOTm9MYVUyTm1oeVNjSS9oSXBhQWliUDJ0Y0ZxUTZ2ZWovT2kwVThC?=
 =?utf-8?B?SWkydDF0WkhIV3FqTTNKLy9va0U1WTA1dWtJR3NyeEQ2NmovbjZXQmRoUVd6?=
 =?utf-8?B?NXJGVUtScGszVXJrcDdwOVg1akpBWmVCMlRiMkhYSzR4b2lwQmNXOFFDSWFp?=
 =?utf-8?B?TUVvSkl5elAzZ3NrSS95QVlwYjk5SWJMaDd0eWRjVnlPaWNLQ3F4cFlTSGg3?=
 =?utf-8?B?MVVUTkhHdXVqYXlmRU4rbjR4dUhDeTRpQjRrSHVNdUNqUlIzdm5SSUhZeWJQ?=
 =?utf-8?B?akwrTHFOVzN3TEhYTEZOVXNENTJ2bEd4SXp0Q1Nrc00yMFh0RnNMSUZrcDVa?=
 =?utf-8?B?TVZ4bTlydERMc2lyVEZtSzlyYUN3d2pvc2tIVmN6QWxIbFRKRGpmbWdWTnFm?=
 =?utf-8?B?Wm9YVCs5WlAxd29JRzg4bVIwVlltNmlicmpjNVU5NXRQREZJWVpaam1lajV3?=
 =?utf-8?B?K25xY2l3ZHNSUlNCUW1COWd0VjBQbklEMUd4S2FTNkMwam45LzlkT1ptQlNG?=
 =?utf-8?B?cnhOUEIwWFFRWmFkWnM2YkF4US85TnI5Y2JLQmFGQWVoTFdtOVRsRWNhSDhL?=
 =?utf-8?B?MGM0OUI3bG5hTFI2Z2tPOHBNVEoycEhhR201ckNFMjVLMjZvcTIySjdHbDZL?=
 =?utf-8?B?cUtIcU5PZlo3b29ma1dOYzZHYkUyM25jTDBYZDZCb0pLMlhZb1JwQUxsR3d2?=
 =?utf-8?B?azQ1QkkxU2NsUnhyZWxBaHh4TkUra1VXQTJkU3RUWTJOeDZZRDB0Q3JvSVZQ?=
 =?utf-8?B?eCtOZ2NLT1ZZdXNlTkxEb3BQQ1BFeHc4cHYxbWZqOEN1WHRNNFNIYjNpdTJI?=
 =?utf-8?B?dUtUVHBWMWJtSEhjMnJidG5nZzlsOXRzZDc4U2lJaGFFTk8yRWczdVhDeldB?=
 =?utf-8?B?V0dNRElNbmFNNHRkK2lKb1NSdXE5NkZuRTZNcmxHdnNvZE40ZFhjb0dSSkNW?=
 =?utf-8?B?cWFHd28yZFZ2VS82NytKL0lBMHd2Wm10ZzRScXZnN3YzMUJSU0ZBanlkd015?=
 =?utf-8?B?dWRqUlY2ODlrR01VOVRkT2pwME1CSGxuZW9CUTNmZWFzQ2RDeEdDRnhsRUpD?=
 =?utf-8?B?eEh0RFFTVS9WU1pjRXh2djdhQnpJdjNNOC9ibXZMU2V5M1JuK25RVzBPZ3Vt?=
 =?utf-8?B?RVJkcjJEa3JtL3M4RmtLdHJ3QmlaN0NPUUl3ajc5dnBZR1I3eE5ZMzdzc3Bz?=
 =?utf-8?B?dTY3bmhsSWVsRTlxaGtjNEc1MjBvekRzOGowVHRxSjJjeWx0QjdGQmFMR2x1?=
 =?utf-8?B?aFI3clJGWWVpSTJYVXN0SldiN3Y4TXdWVXJ2M2dsYytjTHFMTis4ZUI1SHlU?=
 =?utf-8?B?blM0RmVVOFVrSEEyR1U2ZktWaVlLMnluU3NzSG5mOHorUGpxb0RCTStWZlNh?=
 =?utf-8?B?RXJ5cGQ4bWZPZURMSkRoZ3U5ZVZyUkg3ZHAzTUdQSGtMOHhtcXhXZXR6c3lt?=
 =?utf-8?B?WDUvcnBORWgrbmVibnZYS2lPbFRjazAvNDlFSjhXOU1JVTNPVEJXSW9BcHd0?=
 =?utf-8?B?RXlGamlReDZHbzFvc3ZLdWdnemszY050bTFYTUswRWJQK1g1QlcwclV3VVp2?=
 =?utf-8?B?aEV6U0xqTHpiMkdrQVYyYUlkRitOZkJ0QTdzajNPMmZGdi84YUt5ZDdncitp?=
 =?utf-8?B?SldSMEFNOThJV2hHd2thK1dXNm1tR3ZJLzdFYlg3L2lKWVhnUjZmL3BaRC9m?=
 =?utf-8?B?T01ZY3hRV0hCK3JobXpTWlNyUEY1N2J1UUNTM3pibEUxcnZVSXNIV1QvdEZv?=
 =?utf-8?B?N3VzWXlhNkJDWmlNOGNjcDJnMEYyUGRGb1dKVllYVkRkM2JyTTZTNXBvbHlm?=
 =?utf-8?B?L2pMQ3d5OVlPSU5PSERSL3VuL1h3WStyUG92cU5JYVV0d1JMcTBDeFh1MDMy?=
 =?utf-8?B?U0RqTSt0YnhtaXNucTFYTC82b3U2NFRQajgxU29mbFpnUEJUZktBeFNoN2VX?=
 =?utf-8?B?U015a0ZFeW9FZU51YjR3TGd4c0JpanpNVXYvNjNjSE9DQ3BDaG5OUXRDbmJq?=
 =?utf-8?Q?JCzPu9xCT+WGyGd9oymJ74DT86Qw/fX06ZExThG0fGpXF?=
X-MS-Exchange-AntiSpam-MessageData-1: Mq7kpJBEYjBI/w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6529000-a038-4bb4-f841-08de9f5b0676
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 04:04:03.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZQ/ORAc2I5Gl2vTt7aKoDo8w+c1b6kAecOjlz6+cVM5+zrCWvEHFwXUmUQWQofU012BGNkRwTDScQGPuZP6ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59191-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDE0243637D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
changed iommu_map_sgtable() to return an ssize_t and negative values
in error cases, rather than a size_t and a zero.

Update tegra_vde_iommu_map() to correctly check for errors from
iommu_map_sgtable.

Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/media/platform/nvidia/tegra-vde/iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
index b1d9d841d944..824d2aa80a43 100644
--- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
+++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
@@ -25,6 +25,7 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
 	unsigned long shift;
 	unsigned long end;
 	dma_addr_t addr;
+	ssize_t map_err;
 
 	end = vde->domain->geometry.aperture_end;
 	size = iova_align(&vde->iova, size);
@@ -36,11 +37,11 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
 
 	addr = iova_dma_addr(&vde->iova, iova);
 
-	size = iommu_map_sgtable(vde->domain, addr, sgt,
-				 IOMMU_READ | IOMMU_WRITE);
-	if (!size) {
+	map_err = iommu_map_sgtable(vde->domain, addr, sgt,
+				    IOMMU_READ | IOMMU_WRITE);
+	if (map_err < 0) {
 		__free_iova(&vde->iova, iova);
-		return -ENXIO;
+		return map_err;
 	}
 
 	*iovap = iova;

-- 
2.53.0


