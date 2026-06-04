Return-Path: <linux-media+bounces-63836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o4kpBffOIWqyOQEAu9opvQ
	(envelope-from <linux-media+bounces-63836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:16:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC1642D46
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=IdgBlu8u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63836-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63836-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BA513023DF2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4F6383C97;
	Thu,  4 Jun 2026 19:15:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D608351C34;
	Thu,  4 Jun 2026 19:15:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600550; cv=fail; b=cleX4lXH3vgxI/ev8ubjT7O30iNw9FlnFxdYI7UfE/AimYhpKgm29g8bZ3/qrjLmRRP6qExqjPM48ShDRsDGPoc4ZboTfR0gl22hih3BVsFdO1ncsy3ZM1ARJaf+GOPQgxxCleebsXmDKGRZRQOYo1oY2m7Z0gyEngaQqBW8zGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600550; c=relaxed/simple;
	bh=UvdrL/1V8I3pX0waX/br1lYgukScTR6oVfb7eScZo4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TkkZXolgH4LUOUogxPPNGFgtVCn6Y+idQm0zGD7xvitv+/YlnKhSeLndmKZBjbPsdfTRy1xT007OnAsTzDBaLy36b4CKM7KCBHYyZbdtP5Tni8QeL1vmLyzjgFzxKGTBt9B9K7/qK+6mY4YsCDgofxEWUroGc4mD/os0tm63ajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IdgBlu8u; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6EDwvHNx/GtApqKb7bjnZUtKNVtxg15i7K0Ne3LqlIb8TPSFeUf2qa09kYm+U8+5RdXBI9TuG+Gl9LnaXe/CzwoYb9fr0Hsml555DB4+mmdngKKLXX1ufvrq0p2kFusJzMLFd66x2XdVSZ6ZDMF+sNit8GYfAV0jZAoZRzx4RZRwMPDGS+7pdqbDLd+P2U9LWoxwVsxmUjw/gELU/sa5N+92nEDFXHYkS9s03e+i0XKn6U9t8QWZLWKzYWe6zj/MdQYdlSzjAP92G/h1uKcLW1DusLO2H6C77Hjaku7onkQFMMJoOV8WOSDwQZ9ndbPRuMSbiOLvFxOE6/CBhOEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6EGrg5UwnV5IvidGXvqgZQhsMkGhuFYeQPlqZ4EPK8=;
 b=wC7diGh7/yYiTsdNuFga67YMSTZjmS8ggod3J1J2kTeiZMzDojoDT3PtLGla2txbLoA7O4RAwkRdnZ5fAx7Pkp06MQFg7neElbeW4bO8lNsCiwwXbDGTQjjiMXeBY9fJ5A2Mw8WityEzQAE/HzdNMuMJCjzPTxysLSG95vQDtkBRZxjxZUgYnygceOiMsf5tIPT+RnBciM9mu16FdLcMTAmovqj8vTqGbXAPpc+51AzD5otN8JTfIw8rhai4f+M19qxak/CtBIQmDgCpw0q1rnBr+tQu/qocC9YSSZeU1vxDKWuGlXLO+b4TLDiEnraF2t//wZfQC8LmCpK4SQAhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6EGrg5UwnV5IvidGXvqgZQhsMkGhuFYeQPlqZ4EPK8=;
 b=IdgBlu8uz5zhrU/B2fwQiGIoVgGkqLV4OAn6tqykknKx4c2uQbZ9s3RiHjEpUSF0L1lvRBXilGEfVJUAxWqjQxxy752DYvWnJ3GbA3MzGcZs7J1Lh+rwmmFmETQpf0kV1pXTN8MuEVgy8fdaexY+EGyoJr/xzhsTDE+yRoeArFRIOVRXwCAAUYtRgCYmnD/pi2hmegDl9TPw5xd79WMTs5L1eDOkQ/dvJEyiojuMLMfIxsmeunmBr90kZPHg/ROVneBI+q4HrXQbiN06C61SvhAwj4iwz4lw7RyUSi+KjNFMsGou+ZTUvdJVFQ/MbjgTbDSS2XTOpzu4g9g1u4QptQ==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 19:15:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 19:15:45 +0000
Date: Thu, 4 Jun 2026 15:15:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <aiHO2sjVL96zEVJi@lizhi-Precision-Tower-5810>
References: <20260601041336.9497-1-daniel@quora.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601041336.9497-1-daniel@quora.org>
X-ClientProxiedBy: SA0PR11CA0192.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 44866be3-2bfe-4b30-2b8d-08dec26dad4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b7sQ8u027c5HABFHZBeAQQ8xLouXUkQF3nIWgXdY+GKOfEm8WaI8U0dcGAL5COgjECRZeKqr1cNazwl8nEfzQTwaOyyxI2x2nQk0tPJUbc+mpOnnu9OiGhFppPkFhey9aLZ+pEEW5BEDW73jPeQKJ1zTiBvEwJ+SRl+9xfXtyRSd64suMvkuF5VnDOFgTq06HU62vGG0Is6ZHZj4eaXKsC62EZMYyWzYdsuWXUYZuypciIiAPMiJJqQ3SKUKcfMJyL+bLDq5Z7k6fJD9Law2KdkLtCrt1WRfLb7S7wmPCSTpGNCCpjGtUPZELZwrrf6b5vMMUBUUjrcTPXqiKiVlOpQVYJv0Ui3rl/rpTmiF4aWQVn2xAK/tOeOp76j0wd/M++IQAtKa3YJG/ifBMZiyXAaz9UsXuBiUHI9LS2UoVG6CQdtDw3SxA5JHDtuYTtV8SjE+UfX0kmIyj+ZExHAF+NZBwhiGiJpLUkCxnDbUA+5dCyei0to86jGJ+m2DfhQdydT9rVcZ1jpI7Vzu1iKGW7pOohld+4AEnN9gjbuqI1963RgtX5ejKrWzXvC7GqUmKs+q4qyFcYl843cqNZLOna3SpRPR2FSk3VLyxOeum/ru0SzB5x0WLO5nJKafKGfW3TLLq2RxvdCsKhY0QsoDPwn1qKWc5WI8aot0M9ZoJ0gRrmfxamRWsw/eVY76segKt7QmS/J2akjden2i4UMqeAnjPo+pUfO6CyaCfLEa07oblPwc9pIDQIxpRB8prsUs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YzmeA79QBHkFeDSxBA9kNbRVYCDmKZwvsxxi9J7lQlkkj6RdeVZ5yPP7142G?=
 =?us-ascii?Q?VvwY4i9byOQyZ/0hYYofJ947HOJHyZGa6NQ0mF9KvkWZ6IvipMTXgaB3xK3/?=
 =?us-ascii?Q?bB2yHvhbCZ+XxKQNSMJQdZ+qJ+bfM63kVCJfeNJteqVrFxAqo4x91XAzZZox?=
 =?us-ascii?Q?I/YT38j9LtEcXrM0hfxIkqP8UNdGqjzz2mYIcZ0i3Ms1cIV4ZEWti/34X/9X?=
 =?us-ascii?Q?9bf2eH2COun9GpqvJJ4SIf3OiIz7OeU4d9xTGeTgpa7FfRM14ur9giXvyjzF?=
 =?us-ascii?Q?DzZCvw+Js07UYUCLyz7uLys+GvMCzm74pnFvFIj+JnQ+yM9dw//TviVxDAna?=
 =?us-ascii?Q?8EZ2Rd/R02QbnXm8jcxaNkUjfZk4zU/zke+L5FhF5XdF7p/SdKW+Df1PN54K?=
 =?us-ascii?Q?mCDpLfVkHqro1B245L/0jg3B5AE2vso+gAWi3yUtGpzpjqspV+XF9CEcdH7w?=
 =?us-ascii?Q?lRG7LEVhgyn2KTI9vmM5HPKtuBvAgv47BA4OhrPtDembnnqJk13WluCJ/YF0?=
 =?us-ascii?Q?2uzkNJsncimI18hc4DYG9c3kKFt0Vu9chT3gkkZ7wCZ9OODY7qBtIpEci7zM?=
 =?us-ascii?Q?wiFo1dkrXePZTUAcR5sMSY5RjXvea6+m8CiNbt4NizoHPntMKM+FfeBMcZ8M?=
 =?us-ascii?Q?siITaEW4ae5D1HIJtaA0ZkgzHQPMJIgk520AW0RtgZgofIfXqw9lymtaFE1T?=
 =?us-ascii?Q?vVSOr2Z5BJ30I25HwXAv497qDqvJTWDmUqNkMR/8+/saTCPNBTVVoFMlz7zd?=
 =?us-ascii?Q?h2GpruAn0sLqqRjn1CYHnccmGJccNKQb2tBBu1hBJ4DUai9uV7BpjGjrot55?=
 =?us-ascii?Q?FFymUP4+4nU+ZgLwQqtPp9VuM6a/Q0k6RFQSujojbnDoXlZzyGUvF/KYrHbT?=
 =?us-ascii?Q?opWBpnQTtcmr+m1x2ShveWNRx5h6ucJ1+6ij31eFZWzlXmPrvGkz3h6YGWEJ?=
 =?us-ascii?Q?YkCssAA7ZX4GnHZOYIG6KPUfXcHdC8ZzFwPgK41V851uDjNU64drf0X8LYp4?=
 =?us-ascii?Q?OgmkP2J+oqWl5GBUx7bI8ZX46Sdsnx5QR1GOxVEqPwklqLFerZaixPmXMLhC?=
 =?us-ascii?Q?vqTinGLx/HhrM/3rcUOdP+sgF4botUJNsyU5BOf2QNj6yqwBU0u1m7iCU6z9?=
 =?us-ascii?Q?P2oSg7ivi1ZHliFYd/RixRwWiCEidc2HEMjDozGgoO1HnATN2sCBM2MG+O2M?=
 =?us-ascii?Q?g9h1K4pwiv663BwQJgi44AwcqkLvb9v9HemuLFuwz46ptIvEUaORI7S8iadl?=
 =?us-ascii?Q?TkR/zSf130qT28fLAox81SWuCVLiGl2zrYc4BezAhecVEc8eEhveh+fDYz9L?=
 =?us-ascii?Q?w5uBsr6Gw2GVnFipVK/AIasogEz1cwH02PlymZbk6QJUimAQQNT4O0lSBI/d?=
 =?us-ascii?Q?dN7bOVp/o+eJGvHIKwEsr+Uq77jAaIh/rR6O2XIcJbhYExdZWeT/ihN7OCms?=
 =?us-ascii?Q?3PBfYgQyWocuMFyqdy4Fz8WrAGOOVzipJXbmxL3Yg8vwM8z5WlJTkJaf6hMS?=
 =?us-ascii?Q?Hy+AEsEF/R9iLZoQDgb0TCsGJY9/TE7BCLkwowwxG21BUCVjn3v59wmiweET?=
 =?us-ascii?Q?mmfeUhD1erP55OyCZgOULJhuOTR9MFbYbWJFA3W196cA6Okv4+rCMJkigYDR?=
 =?us-ascii?Q?WuDxyaaNf0k+sEaZz+5ZXGvyFzSgKm69W/2GqbnvSNdmwdtrEx/o/KKhKm3K?=
 =?us-ascii?Q?OMqo/Ds4hv/drowArMzaHHE7O4DBhIe/KOmJbwNGb2amzprMX34A82JRN19e?=
 =?us-ascii?Q?Jriy6faHqg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44866be3-2bfe-4b30-2b8d-08dec26dad4c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:15:44.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIHQL3X5ZD0KGPrz2FsHXli857HCXPpOGQmAxRbsVhN2H73Ek1Ls97UouN0+//AeatAkrmu2i9Sql3cjTyyHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63836-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp,quora.org:email,nxp.com:from_mime,nxp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64CC1642D46

On Mon, Jun 01, 2026 at 12:13:33PM +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
>
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.
>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b5..6359e4953d42 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -80,7 +80,11 @@ properties:
>    dma-coherent: true
>
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

Suppose you want to special iova space. does dma-ranges work for it?

bus {
     dma-ranges = <start size>;
     iris {
	...
     }
}

Frank
>
>    operating-points-v2: true
>
> --
> 2.53.0
>

