Return-Path: <linux-media+bounces-58185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIHcDr761GmgzQcAu9opvQ
	(envelope-from <linux-media+bounces-58185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:38:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B33AE815
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D9763042989
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 12:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812533B47C6;
	Tue,  7 Apr 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HC5VYDTo"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4CE26AF4
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565340; cv=fail; b=m9eyG/5MjDoxZjuXyk8icO8RViF9N8wYhL6+133woLC6GwqzTkRNwzHYPiB+jcACk6g5/9j3AZ3LwFUf5gbjPPvlMhZv5u00dyJ2Zjs0uaunmk7Eg8rANaxL3IXjh01DezhdY5TjDIPPoIU3nSQ0yMVNeGELbWXJnOmsGW6XCpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565340; c=relaxed/simple;
	bh=Gr3TY0GB6KjDmD+WF9/Zi9rXV6KpWkJg7+nWSgDZry4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cxgIS7gwacZFKf1J0pFmIZ2B/MrAglxBxSvMr64KCi8eeCRwllcbbIL3LzXq5iGqKXz9YM9r7WQIQTGRJTslIpJpT9aFW8E5MJ0oOrDvjdvWzdYcSb6irQ3pT7P777wTaKO5gPGWmmZcIabdZQ/LwhpEdnyNlX/TxkeVCfYZvi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HC5VYDTo; arc=fail smtp.client-ip=52.101.48.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM5l6aglDOJn+HFwlTvfuJiJwbj3o4NXtFPVV5LXP/LLxdjbNfdSzbry/4jw9DJQp+dFB6i1efkb08MryjV4vrZxqLdghnt83Sg9u2s5hD/dkmhB59iIcq8Wp/BggvwCTUibjyp8MfBursar8CxoNSlWPRQEWTz6knvJidjzPnimhbJAUIf27A9/DrjhvNr/uDCvhS3RHMNTkT15QssLJz8tYBQDUYW/GXNHp4sB2/3Fn/AKJDU3ml7A48/BbiNBEwqvk8NMD/IBBlat2aqGExQk89748ad/SfBnQ+46q9mvjJeLy9oKaDSRidb2SaFP2YUqjA/azs0CpIFaFegmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWv55mxEEKfHjGexondYGX8JivN3oN0uSlgsq+1qlV8=;
 b=QzQ0BWx7NyPRGA9Jph3kfY702P85KVFerjVw2Ffn8WhoCyIEisSedUCme98zWnlNeefY1PsM2LicORik5671R2UHKw/is1qOI8rZhU1t2E1BOsG2+NSKU4AaiRg21amomPqfEUqkKmjFYsS6PHoVgyE26fosW2ihVf1Ox8APJo3LivXIiU0FJWqYXBWRrl8q443wgz9Sgd80oazS/m1m6DIt2uWJYgqtiR5UZO3jwoNoDTkw6AvjemhIS7i25lCwbfqLpWm1GgdJWVc0tSmv+TjE/tDfjH7pv5GyI+UF7v4qtCtHIUwPqgujubicNhIulgrJs+CwXRE6yLTyShl88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWv55mxEEKfHjGexondYGX8JivN3oN0uSlgsq+1qlV8=;
 b=HC5VYDToNcI8MR+QU5k/eOpohciMLizfPvTvKr/pkNELLh/Ny7CZkwP41EQmkRosoBQKzPft68Ib8aQSJQVyg0ZGNmiiitHcuOt94KKkFXa5G7kovdUMDjCMQbDfH+bkO8x3t6TOLH+BA5wdt3VC5adWkSb3PjHIrckUCz0TwXJiMUGNFQeOhrR7+wXvFH7B0psjkNyBnDHgxWgQz15ELRDgaTn+oDs27RyLw2RycnvaL/BjdOK1r3/Xcm2DD61e+AzueAgTfFmdaARWmfA/GfCcvTmX6/Hp6/7U2TppzXTZrVn79YFpXXdsBSXeMjhh4G9MePcM8GK5V0zKNzXBWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 12:35:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 12:35:31 +0000
Date: Tue, 7 Apr 2026 09:35:30 -0300
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
Message-ID: <20260407123530.GA3395114@nvidia.com>
References: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
 <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
 <20260302130113.GV5933@nvidia.com>
 <c088698d-0bb2-4b0a-acad-946ec3df5777@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c088698d-0bb2-4b0a-acad-946ec3df5777@amd.com>
X-ClientProxiedBy: MN0PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:208:530::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4e8650-770d-40eb-cb20-08de94a227ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hw5ViQVwNfqXa3dyBxkhQFZSHzx9+SN9ZX2NieUHaIXOv0aYmZO7GjPoTb2MPPcW9RhpRBqRor9Lgm6HDzaKVK+ZcPfbeqmI+vQJ6TSnYb8w9YiHNIwtWaOUpEgB0rHAQseeiVDEhEcFFAWwxQYAfEdoig8+fsr8zVJGN6O6a6pR4hJ12a/QkzwwyJSRG49Jvlfv7hjs2iiqVDcaqoTpb3H5l0OX5YTjPv80T3KlRKEDfpkdYt/dXa14BBS/7Zte512040XwR5477qWEqnRJ4jrewnUEc9DJhq/pvwGW1tqRlCr0ttfowUrt+Q9OdS86PvVhWHQIdStZzvj9YhokMcv4CpoCNR+KRzY6S+YWWE5YasQeil+LhrI2uQ3gVnXkVWAd2G8kRzloSgPQyZ9P91QBtConTommX6uvm+/SkibcT+eJCV1jw8gxf+BVXAI7NlWFkwElBJJAz78roev3dBmJfuZqWtvfgJcciBDQya/JwC9Nw84MFFipgpUwkPSoqjMKNAXMFUAkZ3L/fKAYq5KVjxmiFV0FC7o82p2oAjJ3m58roJ1XmWv56obC2g2L2bWGD92r/7LbCbW6NjIEVcj0k29OCX5KKcufhYkUS7yAixJCw2ZssKsowcwM6mFvXWxGoHZRZeZsU0xOiJMkLu02s+D8UYWQjdKzW/k7+RJDEHZK9BNjSNUuApMAQ3qd0DJw9skX1M0/FyajzM+2dAvW/PSwnx4l7hEa6ARMDcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNuNmoyWmErZnprSkxoeEx2SnJzM2lVdXBsNzllbUZzN28xbFJoZGd6Vm9D?=
 =?utf-8?B?R05LbWZFV2UwZUp5a3oyOUIzUnpOb0tpeU1ScXQvUjFkUFpKUEpsQTQxalI4?=
 =?utf-8?B?T2xUUDRNaW9ZaTREK2VKK2RPUG5CMnVYQ2pscUVsMiszeHlVSEtxeE9WRG5D?=
 =?utf-8?B?TXlsM3Awb28zd0wrMmFLK0Rid3RBOGd2dVBnUHI1c3Z0NzRZbC9KK1VHdGlI?=
 =?utf-8?B?UW5QMVhHK1MyaWNmRUFaMGZvdlZaZTBGMU1lMkI0N3lWZ045dWpKUnFzQWM4?=
 =?utf-8?B?VHUxSEdrbnpNSWtjSUxLaHNkL3NTMnJsZEtSZ1FQd21ZSGF4YmM5RXM5b1hM?=
 =?utf-8?B?bDdsNm1XYlhYdTR6MkRQVC9JWWFnSk1LS1llL3phbVdDbDlMZTVkNEMvSW8z?=
 =?utf-8?B?bXYwWHc3YnlTZFNoa1R5dGNiemFoV0V3MUlRRVlMYjlxaTdWVmpKcVhvVEJK?=
 =?utf-8?B?WEY0VlE2Uzh3bFVObHJSd0tBUWdNSlRTZytEZDcvbno3aXd2YmdpSisyQUxZ?=
 =?utf-8?B?QUtwK052TGJGMURDUXZYb01SckZnR05OR1JBcm1JMUl2NFkrU1ZFekNlZGZM?=
 =?utf-8?B?M1Z6d2R2SzNIVTc1dDNlM21RbjRMWmZIZTZZOE1kcUc1MGhEU0llNmlreEZ4?=
 =?utf-8?B?UVR0N0xpYTRNbjIvS2NZUW9kYjJTNnR4QVZtVlNXVHJrY0h1dUY0UVBDbXVN?=
 =?utf-8?B?bFUrWjZnazFzNTNLM0p1bzdxUllDZVZhSVlkZTlTLzJJNW82OGVXeVFEWEoy?=
 =?utf-8?B?SFhQUXAwb0QvUmk0UzBpek5KNEJGdyt3TXFrZWQ4TWtzU3RZYVZvOHJhS1Vx?=
 =?utf-8?B?M29HZmE1bnpERjFlQW5BWnZzUzF0N1RVUndhTHFXZ09OcHdtTHJYNFF0V28x?=
 =?utf-8?B?OVZrcmNqQm1sVW5HblBPR1gvZWdFWm5ldDlUMllaSnIyYkk1T1JmcXUzMTh0?=
 =?utf-8?B?L3AxcXR4ZEU1Z0lQcW4vSFNkMkU3RjY0QWdoOXpUalh2b2NDNDdNQU13b1cx?=
 =?utf-8?B?d29DU0RaSnpjZWwvNjhka2dpaSt4TkpqRVNWa0tKTTNuSGRNZUFsemR0Smpw?=
 =?utf-8?B?TVVmZW9JOTR4OVFmVDlETVVOdGwzMVhwbW5pc1BPUGhobXMwYmxBbkZzUzJ1?=
 =?utf-8?B?SFo3MHd6cW9IR0I2UGQycDIwamJJcTlnVGVEWEhZbytsYjRUV2h5MTk0cUho?=
 =?utf-8?B?RUJsdDYyS0FRMUZ5cHh5OCsxK1Q1SVI1TVg2Vlg0ZXF3cE13SXBycjhUaE9Z?=
 =?utf-8?B?SW8vUWpJdStGRzVMQ3Y4andYTDBVQ1kvZHNIaVJTR2h0cXlrNFJybVhjUnJE?=
 =?utf-8?B?MWp2eGp0SzBqYnJydXBjc1hLWGxhOEhRRDhicTJzU0xCUU1iQkhSRURvd0lQ?=
 =?utf-8?B?NVBCNGhmVmxNcUVoTG84a2xZWE0ybzVzZW03MUlKT1hrWUE0dlNIVWxYOGhM?=
 =?utf-8?B?ZW51b0cwV1VGd3RYRmIvdjRMY0p3Q1NEWFJFeFFGcnZwVHUrMnpLTFA0cmIy?=
 =?utf-8?B?akZBcnJWNE1XR1FocXdBQmV0cUN0SCtnUVFQeWQySGQ1U1hqaU1ZV2laQVVB?=
 =?utf-8?B?V3FRak9HdXVPSk9HeTcyMjA1T1VqaGRxazVBSjJ6bThYVVN1RDlnSjByNGY2?=
 =?utf-8?B?MEorNGhiYmw4b2dMN01CdGtndUo5SEU3bkt3U2pSb3QvVG8wNWk5eFVKSUl5?=
 =?utf-8?B?Nk81N1I2UmNLdGJWelAzVHd6aGxCWkplSGk5WHQ5TVZqYTIxRVBRWUp2WkRV?=
 =?utf-8?B?ZDZIUVV3a3pkZUxEdFM3RmNVdkt1VWtjYUE3dHhQaTljSjFlL0tsa0hwMHo3?=
 =?utf-8?B?clVmazU1eHNoak0yVGgvQzFMNWdmeXRxdXo2T2dXaUJVZ2QxNVA5bzJpTldi?=
 =?utf-8?B?eC81TU53bGR6M2xYRWNCRnQ1akJXOE9JY3dZczd0MVJyanUvOWZYc2l5ZXd1?=
 =?utf-8?B?SWd1NEMwUFZacDVQekRRUUpUTTNBU1JvM05QbkxhUnVuSFZrRDVpbm1ZQk03?=
 =?utf-8?B?TGV6OGxkVElnNnFYd1ZRT1EyS1BWTWgxK0RibWdKKzNNbUFZR1NCMXNCaldB?=
 =?utf-8?B?aHg2UU4vTHlpNFl6UTl5Y2FmUHlXYks0VUo3WnQreXhpNi9DRTl6RGloVUZR?=
 =?utf-8?B?U3c1ak1zWVhrU2RuZkUwWmVaR0pkUldpeFVFRXN2R0g4bjZnOG4rU3l2cUNY?=
 =?utf-8?B?T0wzcGJBVVZHVVA1U3lVeGczcW95MmNudzVsODNOSXg1YTBZNW1Ta3VTS1F3?=
 =?utf-8?B?citEZ1ZUeHkvMjFsOWNDRTdQTWliSnVQUnROUmlxU1lZRjRBRVB6cStYRjZy?=
 =?utf-8?Q?4ykTtG2JM19L7xP7Fn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4e8650-770d-40eb-cb20-08de94a227ef
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 12:35:31.1115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4WPNTkTW6uKIuvAj/QzabbVjOwz3R7TNXYhrGTAl9eFgJTYgWJ+MHTikTRCP6ZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-58185-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA9B33AE815
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 02:58:55PM +0100, Christian König wrote:
> >> No idea when or even if I have time to review that, but feel free to
> >> add my Acked-by should that go upstream.
> > 
> > I'm confused by this statement, aren't you the person who would send
> > it upstream?
> 
> Sumit and me are the maintainers for DMA-buf, but the
> drm-misc-next/-fixes branches used to send DMA-buf patches upstream
> are used by much more people.
>
> > It is just a kunit, I wouldn't expect an intensive review. The tests
> > still run after all
> 
> When somebody else has time to take a look over those patches I
> think we can push them to drm-misc-next ASAP. I just wanted to note
> that I'm ok with that as maintainer and those patches doesn't need
> to be reviewed by me.

So, am I supposed to do something with this? It's been a month, I
didn't think this series would be an issue.

Thanks,
Jason

