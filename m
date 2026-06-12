Return-Path: <linux-media+bounces-64745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0iO5E/lxLGqoQwQAu9opvQ
	(envelope-from <linux-media+bounces-64745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:54:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B867C651
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:54:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=mMr2GwoT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64745-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64745-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1013E31A8D22
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BDB370D79;
	Fri, 12 Jun 2026 20:54:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FAA1F099C;
	Fri, 12 Jun 2026 20:54:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297645; cv=fail; b=n2iKt9tFGWLU7LZhTwK4LjTZGTIHAVg9uTrPIcuiYnW0Wj0BUG/+6d76C8jDKn6e0IQAqHnGePRZ8P4AQlv9o8dQCQlQCppWJJskmBgqxJ/tANW3LnqTbW4uAkRhht7LESQ+L/YgTHs05nK33JH56RV18xSqFArls/P/GQQR7PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297645; c=relaxed/simple;
	bh=CgAniYpgMUrSXh9r3c0jO1goSgiq5MvKaPtWDKpTi6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LjqzHFZ9bvN3J7G3kP1eRd7AYyRg+0Lqd2zr0BlRq63LDxr3cGMRdq+CZRboZhSsDNmFLxGSnk+4qmoc2CmaBRi/7dxfmwT9OFFiVB7JEcO+dKyNZF5YuoTuWY6R4eQupdz4TolSmI1bZ3KQrZQvP7cEZ4ZJkpsxg7yqn1gdWA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mMr2GwoT; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKLg2zIp1LdsNyJ/S7r4CteYyqpkqw9F1PL16kRIf1TBgtnBDUHD7h/JsK39ZffC8cQwHBjmZR1VfhpsWO2JjQMaNw0WlanjKVLhtRTYup734rxhW++n7EuENi5QGRnhGEQvNOrqGesjoZx9LT143Zan0lJH2EGr+lp4MQR5wJ1C9a50Dzx5SQ34CXoJmTJWJHY+myzZRsq5IxdnqKPg6OkPXoENR9/IhuUEe5bqszYXOaEnm1ihJAm4qJ26rBwXVOHQ/g69wIHtMbuw2nBkVFIpuYzLkCXLQbkTbF96dqCAYgzOXH3vt9VQO0S9dOoqAMf2biwAdx0e3FcwWa0MtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKCdbi0m6mH3WzTll4nL+MC7yD9LKcXC/Su89ZJzKys=;
 b=ILQlVvqlQJj5dOGUI0Xx/8f3k4/HBtqibD2E0c+iZYc2aE8jI8H7m839OsqoDJ4dNYNUxC9eBZNGdv2qQl6nn7Gd+kVlJ5jMjUu0RG/S+UlrWN8Zev6ILgJfQAXr9XEbHHuHzHXN9RE9vDv1S1jS8aDAMTTykPcAx8eRTswOJddl776yEI0ucqgUqPeeIOQhDPuQj2FFqukGQWsqHtk0Ubqbfi4rRR/pUEVBBvr6UVhSqotp1l6uDb68tziWSnp4nsxd3sw2aB45uTVZV4uf9RdgSu8nYqQQDg6tee9wP+9OTgUUBlMefXwJLdpxOnyzIfFWnF4OgkkZmuFAs4C0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKCdbi0m6mH3WzTll4nL+MC7yD9LKcXC/Su89ZJzKys=;
 b=mMr2GwoTGprokwEB8yUYvhChbzlB5YD4fjls+6M7enkDXae5Nj+wsADbtp3paSUJyCzH9hB4RPVf+RdvDqkiUl05pU/Nw7OjG8k1ncFR8TeKjrId/7LWgpw2swXFSL4qgp/Fhm7XQU5lD0DC30eFf//brs4UuSjFKkgZLtDoJJmm8QMBg5hokEEUSLsLYhIvC/oFU7aI6hheRQCwHM8xHAncDQVUKedHsRrgRpNuJkNkNhU1z7P2NHCXYT7Enk46dVgw06+M/aqJ1N0rjjHM32NyvcK2Xh9m7uBMJyBiJPztwnRSVXtWTQGCZOLku5S+eYPMxj7BauobGrAhQz8mTQ==
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV1PR04MB10823.eurprd04.prod.outlook.com (2603:10a6:150:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 20:53:58 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:53:58 +0000
Date: Fri, 12 Jun 2026 16:53:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <aixx35f-1yp03-c2@lizhi-Precision-Tower-5810>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
X-ClientProxiedBy: SA1PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::17) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV1PR04MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a3a907-15e0-4eb0-12d2-08dec8c4b959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jAku+UjUNhoV/fixpn0vInQv3G3diSXt2K3KIl9GZPasquoyh9ephHLEaCI81lEGDHJmxpEgPWQYtDYhfTw1JK6b/fCLpHpjcv8oJLwzoycFPUhRVOfZyNeUCjuOhsIg5I4SksJkHv0VBmCEFO33sD68W6h0mqTOVJzVdhqrqRvpVmrDJMjABUKG/5tgX8H7XUXrZ9C6zX/NO059eM0uozJKl2Nz/zSQMC0JrW8kBI0yXPUHyI1hat7u9BAkTcEw5AQ9v0cpW+PCeIUVY2nwGHYfAdthEbpgMIPPYpWNeySSWPElvPo8oANOuV3iL0GUcuQF2L30y6ZdPKL7FJArhJ+2jQdom0US+DJOy+GO06YX0k/c37yHozDxeuZTs0NxbX59xwnLrm1kbrlGyAhzmvLnU8cwCaXT5tcO+NY12w8Ql+c2rpnO2RHEgN6SBGPhKC5SItoGnxISS7mEge9f5ks1r1Tf5Mx9/4cHHbxGTzTpIvVQyHMIzDqFneDDI2mGhLb9iM7rFrRBph4R4IGKT/gJUD4UcLAZisb0HdBxLlM6oup4+hlrCec92eQqJsItHB+nm+u4GFfhJQ9ySJbonqP/xemHFOax2BJEjGD1JMCNRRevL5xc9hI0aC/VVulmDovZ8udbMyAO4PXq3VPJTIIuLgM4s/IDp7eLtYlhfPhRD/XS1c5yU+YmgIBmy/Nx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kH4cYMDqhDE0FOB4frvhgZIuDPsGbcPSvTuNqmMdnFIan65+N6vxm14MObZG?=
 =?us-ascii?Q?8g+p6i4F/UcJouJ6/8SL2vhp/jnjc5qax9lq7kNbqODkyHvRc2rb/eMnhc6t?=
 =?us-ascii?Q?e3Myldnd3hxUsMeWPe845e4dx9rQa8up8QT5c4AMfB8/S5HtkQMkWXey43wJ?=
 =?us-ascii?Q?juqPt3XXZ6O8rLgXn9t4oNeZrXD9NC0sShYVoOW9/r5ti19rydqPnaQ0Pgvy?=
 =?us-ascii?Q?CMpWJpSYnlQZsL8vWxZv19pIiY7C5l8OwqKfw1Xg5OXyuhXEwFCJEurdbMtn?=
 =?us-ascii?Q?Cq4E/5QfnW+gjUWXwBum2Mq0vgq52TkYN50RfInbHbzfi0J4iKGwsZr39w6N?=
 =?us-ascii?Q?UaEv7KemFjJMN0JX9rk3+po6pAe6pDbz5xkgI8DvCELpBiLqUCZhw3W6GbvT?=
 =?us-ascii?Q?2seBcUERCKUHA3dKObK4oV1JfB59vbBM/w+LDBI/cqAY9C0e0DolIjFCrUzc?=
 =?us-ascii?Q?wDA9FF3AmlZn4LXkD+F9zOHTSJYumoPWcNoW/9q4yAPnHvYu2PPqYSaygBUg?=
 =?us-ascii?Q?FZFB4Yv+YwG9y/mZS8Fcb/pB1X/82NsXbapCCCUSBEjtl6CZeAG7jxCwjAcq?=
 =?us-ascii?Q?FHrPTX9mP9h7FsEkXaihaHcr+3BFI3ci1gnmiSVeVSlF0vPmV0xH7XpdhY1p?=
 =?us-ascii?Q?w32eOormHteCfmnkdbof1WcSeEsIQnK3UfR0YWm39HAE6yyJOyC8ilFJyBL9?=
 =?us-ascii?Q?5I2Q+NU/1g0VQcXJYJ3VTKcwoAJMOJUMoivFNqfX3B+7P3L3mkrZZhx+P4MF?=
 =?us-ascii?Q?d2eEbiSUN/g4Iv7zR8DRSe/1DDYr6nxrS7M34eZFCSmZ1phv/+Q+I+r527D/?=
 =?us-ascii?Q?WEPURuFK02M2qf9N6h6C1GLNdy2JvBcoUKYnZChejOJ4Xg9Q/Qyv5x06Gd86?=
 =?us-ascii?Q?r0V7lKGbG3blSO15AYvSWBhTknXQb/sugWy76+vce2o5XJO2vkY/5zValHlD?=
 =?us-ascii?Q?M2x/TefNGFdT+vnpNeMQ8tUd0ffdvg+lgvMGvusR8w3Bw6rAI2zltT1mtLZb?=
 =?us-ascii?Q?fu1IUtqkdRmEaOjX6Rkc/kfdSST+LZmNK9iAquPb2P5pLoSj/h82PvK/HqTB?=
 =?us-ascii?Q?U6ruNWO8Yjy5TlTpcHJzqYXza+DPCjf+hx4VuKGqDdVR8eneSUpGbVD01cLn?=
 =?us-ascii?Q?uzSJAE+hkxekO0Wco7GO4A+IDnsuDcDZ35MpGdIvp5UjsYaqRdwsGPl5d65Z?=
 =?us-ascii?Q?XkF+IVejy8GBrgQPKzuezwgGqYBEnAyZNpvYmMuoFPxykVvhsuPl9MZLj3Br?=
 =?us-ascii?Q?yPcsX7w0UEPk103XzP/3HvLKNxgsNUiolLYTvUxhpVjIz6CiOh7UPNfJiY7L?=
 =?us-ascii?Q?8O9CdCXRrEQy7TTA1e7qcj/cMsPzGHRJYYq2w9QSWdMaSqWnKZw609lmMV9M?=
 =?us-ascii?Q?YFtj+5iNfsBUxa2P7J9TfDx8UVm3MFxrVtR1ys2K6KZ5DWTkbopc1vFeD1R0?=
 =?us-ascii?Q?oN5VTxQBrDxtgulZIBjxW2cAD1L5rDLE9Uz/0T/k/k9d7oAfu9MSDUFyd1es?=
 =?us-ascii?Q?g5Spkw0lWAkI0kl0bYvn6TMYp1FtMVcKcVn6ZnilHddfIjoiXr2P0jU8umsb?=
 =?us-ascii?Q?v1aMhJPOJZlV1K9woCIETiRF3HlKeITJV+FYnpjLWXQzS500dxpDeKSAqQca?=
 =?us-ascii?Q?EtOyFSZ92gnQUgPQmXt6ZOFMz7RXmgfm8SqE0IUKyZeo98pIIds0roK4RYwc?=
 =?us-ascii?Q?T8ZUxkaXw4I5nxnkr1YFmFMqf30nobZxftOPwfqvsrLdaFk/1cRi9fkTEW7C?=
 =?us-ascii?Q?nGTEEMiU+PiWxaZm7i/NSWIodKzlsJEOzGrkwzT429TbwlQP4oHL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a3a907-15e0-4eb0-12d2-08dec8c4b959
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:53:58.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFRXRM4sH1N74h449ovGQbyWvphLTHhytq4TQ9m7O8SEGJ1x6O4cjxMgoAKUNcscVoKQCh6nr983M0r7HGNPw7g24xm2QLl2S+Uv4DtIdmIeGzURFdT32ho3ehcKMCoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10823
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64745-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp,qualcomm.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B5B867C651

On Fri, Jun 12, 2026 at 10:44:17PM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
>
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
>
> Initial support in this series targets SM8250, QCM6490, and SM8550
> class platforms.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
...
> +
> +static __maybe_unused int qcom_jpeg_pm_suspend(struct device *dev)

new API needn't __maybe_unused, check below

> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	qcom_jpeg_clk_off(jenc);
> +
> +	qcom_jpeg_icc_off(jenc);
> +
> +	return 0;
> +}
> +
...
> +static const struct dev_pm_ops qcom_jpeg_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_jpeg_suspend, qcom_jpeg_resume)
> +	SET_RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)

use new macro RUNTIME_PM_OPS

> +};
> +
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev = &pdev->dev;
> +	mutex_init(&jenc->dev_mutex);

devm_mutex_init();

> +	spin_lock_init(&jenc->hw_lock);
> +	init_completion(&jenc->reset_complete);
> +	init_completion(&jenc->stop_complete);
> +
> +	res = device_get_match_data(jenc->dev);
> +	if (!res)
> +		return dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
> +	jenc->res = res;
> +
> +	if (!jenc->res->hw_offs || !jenc->res->hw_ops)
> +		return dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> +
> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));

  when mask >= 32, needn't check return value.

> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource_byname(pdev, "jpeg");
> +	if (IS_ERR(jenc->jpeg_base))
> +		return dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
> +				     "failed to map JPEG resource\n");
> +
> +	rc = qcom_jpeg_clk_init(jenc);
> +	if (rc)
> +		return rc;
> +
> +	jenc->irq = platform_get_irq(pdev, 0);
> +	if (jenc->irq < 0)
> +		return dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> +
> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
> +				       jenc->res->hw_ops->hw_irq_top,
> +				       jenc->res->hw_ops->hw_irq_bot,
> +				       IRQF_ONESHOT, dev_name(jenc->dev), jenc);
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> +
> +	rc = qcom_jpeg_icc_init(jenc);
> +	if (rc)
> +		return rc;
> +
> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register V4L2 device\n");
> +		return rc;
> +	}
> +
> +	jenc->perf = QCOM_SOC_PERF_NOMINAL;
> +
> +	rc = qcom_jpeg_v4l2_register(jenc);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register video device\n");
> +		goto err_v4l2_device_unregister;
> +	}
> +
> +	rc = devm_pm_runtime_enable(jenc->dev);
> +	if (rc)
> +		goto err_v4l2_unregister;
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
> +
> +	platform_set_drvdata(pdev, jenc);

It's better set at early phrase, include some async function use it.

> +
> +	return 0;
> +
> +err_v4l2_unregister:
> +	qcom_jpeg_v4l2_unregister(jenc);
> +err_v4l2_device_unregister:
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +	return rc;
> +}
> +
> +static void qcom_jpeg_remove(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc = platform_get_drvdata(pdev);
> +
> +	qcom_jpeg_v4l2_unregister(jenc);
> +
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
> +}
> +
> +static const struct of_device_id qcom_jpeg_of_match[] = {
> +	{
> +		.compatible	= "qcom,sm8250-jenc",
> +		.data		= &qcom_t165_t480_jpeg_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,qcm6490-jenc",
> +		.data		= &qcom_t680_jpeg_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,sm8550-jenc",
> +		.data		= &qcom_t780_jpeg_drvdata
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
> +
> +static struct platform_driver qcom_jpeg_platform_driver = {
> +	.probe  = qcom_jpeg_probe,
> +	.remove = qcom_jpeg_remove,
> +	.driver = {
> +		.name = QCOM_JPEG_ENC_NAME,
> +		.of_match_table = qcom_jpeg_of_match,
> +		.pm             = &qcom_jpeg_pm_ops,

pm_ptr(&qcom_jpeg_pm_ops)

Frank
> +	},
> +};
> +

