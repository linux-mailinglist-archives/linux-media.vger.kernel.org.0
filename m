Return-Path: <linux-media+bounces-58963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A0OLlvq4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:07:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F5418677
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4C99303A4E6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AA3378D97;
	Fri, 17 Apr 2026 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="cUzx5wTI"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022140.outbound.protection.outlook.com [52.101.126.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D77377014;
	Fri, 17 Apr 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411594; cv=fail; b=e3ggoVhO0uNW1HAdfGJhxaSIAwv3dDx8H76owX8j9UeZxp7jyf5EchCnsHjxGKpY3JbpSUtBS0kCbnWiuK4OX3O3pKtoTQORbwH3XvnXt9Mv8BgCR3sPg1udznMzrjOgpb288DWmn0ODpSej1+LqYUgsIcnj7z9V3a3dK1WIf/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411594; c=relaxed/simple;
	bh=6T5vATP2D2Q6CCSD/EW0PjgWOXx53QwQYDdqLqBsGhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X3pRoomxTzCOx+Vuq+Ko352p1WyyJlOti2tIOyaVB0Lk9iWL5litS7FXcU16yRregt2KaC8dTRRRDCDzyrsd1IzBfu3+yaVnsRJUZqhCx2r4+WEPmOsDk5uU5mWuTvqzuoWipUyjaNHQqf6RINjzTplrnxugk2/dfS7LvKDjNxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=cUzx5wTI; arc=fail smtp.client-ip=52.101.126.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZFc5m/wKlt7+Zelja6b5UWEvUkWFHiZha6geC1+QhJzdW8gFm3kACoOCZI3Ywdmc/xep1I8Hoo7lRxBUKkg9dhVRTwMoqRWLFPDG/rTsGL3iMLWEVO0dE31JFIKWPhpdQLY1S/6hbnMJhdK6sN1fkAHsy/C+tlcq/0etpPDu/XtBRQ/epn1kQAViv+yC5POwnwXpoT3X6FMa6NTB7BESBmZbJ69dGQ/i7inef2clyYldNf8nkd0UfrhANegeRjm5LtbcByOTB2NvUJH0tN47OCkaNZPdR4WZBT9SW302dYYz7MIRV5FMxc2ytEsghXAfwJbPUf0yUnQwnWcKT8BZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm6TWhhrdQSYVDxQj8BxmluFx7laVPeaM8UQbLC/Fp4=;
 b=GMwcn0I/sn9XpomWWUXDJslORZQVxT6Qtbv/dyF9CuoAcWf88bOCJKX6GwZltK6IsICa3dBzZDuPnwoAYkapdrZ362yfrUOTeM+Ca0KrSs9M0qUEswJaHjiV/3z2PR75mFMXAOFOjve5brI8wzgn0l+LnNimw8OR+2gaw1LPJqZ2+wUGizddcVU2pzYEW25abkAPhB0MqTZENtZ6DS7VGJioM1tBv+56iRR2FpKGS40N7BE8SCiuIzKoL+QijqyBO9uSVR10LZ0vA4BOa9obLMWkXl8iHxNOvtuTuaDt0re7YZsMQFNvocGHrGQD0+6bYF8gVEJ0SFKtGKb1K7UEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm6TWhhrdQSYVDxQj8BxmluFx7laVPeaM8UQbLC/Fp4=;
 b=cUzx5wTI+m0uKQSjuh6mWhCW+JijSIKjeQscoJK69SSbBE0/wOqSPnQ1syfPkZplU15LytflWQA8OdezIyyyY5QG9wz4vm2uElOnsqXHALY7mtHdb+tDEhTU0TUj2IwIJiP4wYGFIFDhA/BW5kvgO1T4fTu4dAVfBr/Y7LKbgsSTZ054Xo5jPghlvPS3pHMHzr0Y4WhfL3mmXUqX+ACNCUa7PJZj/mHZNYEJqo6qKJAXJ1u9xhxubSSKKmQX3QK/v3iMDnNZ+YdriIEf8XLLJ//uRkkCtGmG0GQs6gybBFsCo0ocf7Xgfgsiy6Pf+Ij28gyGsUgPpPOoLtOPcdySXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by SI2PR01MB4105.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 07:39:47 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 07:39:47 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH v2] staging: media: ipu7: fix boot_config leak on queue_mem failure
Date: Fri, 17 Apr 2026 15:39:39 +0800
Message-ID: <20260417073939.2686170-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|SI2PR01MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 558025ce-ce05-4028-9847-08de9c548002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|366016|52116014|376014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eIHttmMewOvIdtx49NRbDs33Spusdbmlkj/i83soX7js3aXrNO4aEvoup++mYYx8xCBvPU2lwZVCtjLrAEgWF9mTtmjVw88HUp6Yq5GrwEGfcp24ubTfuq99Dq+mjBFPCQ0xxIadgubP0kDGm8T0jSf7qRS6x7FwDrbNfdFiVh82PNIkdtbaYpQjAol9OQvK1y2p3I8po0sA3nVznMDP56bs64acDVwGEy54eCyIc2VfLYJ+uTLcR9+aWdOrVJPA9p0HesXztUFxtuSWMnG+Z7kWm1OLoClFHnjDHbULQMSyVYPVgd9XHVk+uAQje/5zPcGCG1Cjwl0Gtl/v6hyUSpXxIJxTua31fS7L/GfbPKJ+onaUVcSQzv7ibv2V2uQm3LyIEto2ZVX0PztS6WjZgTTJBaN/u15lXJBLUkwMUgo1u6UiFWazLzDaYwL37GhL85JRwbojrx2el358GunaMco+1Hq8zQSTb6j4tQUzehKo7GxPcQETGL+IuEdIPzKjC4Af8fM+3uFGi7fSeED8naCHPHaiQhy2DJ+OhrudAgHiXxBjRKZqu0DYpr2WAiwtufIx9ZHBFs2vUpgTbGrIOWmz+5eAair3zt+GDbaNr1C694B0A6zQSGO1+JXHCN6C2vyqoNBitPz9AmhBmqOmoTezKgwoGQ+0Jou0zrK4QGkcrDUpyhGtbIfzzXe+QtmxXkJn+yJ8KLIFlm/YX2OQcn01iDwgFu2gSlyaghBaQmjrEyVQVSWNHAyKREo4i9BWNJPWbiWIFkq9hIkSE2kTizWgfV22fP4iRUelYR6ql48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(366016)(52116014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxCkGAyqDGfflcnYc4fhIAutTcRmtMSMc/PjyCZ4WOSqD54l91V+NOKaZ9n2?=
 =?us-ascii?Q?qDkNF+ZZTKEh41traYSyPeYEJacw/9vfKWxoP6Kdg2TGND6BR6jg9cJXn2sE?=
 =?us-ascii?Q?sqkk712xn4Fmap+ucmnn8uLGx4iHrLmyLikM57FnN4GB5lnabRm08ykqN3Ih?=
 =?us-ascii?Q?UTfseFi3tOkSuIflylY1nW4/uaBcU2tZ+IZnN+rf2g81dqEfONZ89ceYLWPa?=
 =?us-ascii?Q?ytG2lTKXr1GhfkupFVO+kUVpn3j567ZGRi+RpogDKsxrERZ1tI6mVPKYo6Iq?=
 =?us-ascii?Q?PA4roYTw0C8Gy0RILcUzmPhP/4s23KsaMDzshf+I5jP4OBH/7zsekC/UBsIv?=
 =?us-ascii?Q?qgdSIB2mxXFETXs+PO4tHCHQmvMsOE1WQ7YlY9E8BPK3ZzW+xRxza7AJxw6i?=
 =?us-ascii?Q?corJbxIldIVrh5QLtP4PD+PiGcl/a9muV9sIC7j5ajWVdTRs4iUyC22N6VDU?=
 =?us-ascii?Q?IdxHv+VzZ0QSqVXcG1oQoHAGzBnMiPr9XpejT4JrOGkACPmyisi9vy1WraiT?=
 =?us-ascii?Q?PHAaoecQdUcLxEbO+dv/NzEEs52eGfNI5e4Ewvn4XAjaPS5rmSdc6EGHmj8x?=
 =?us-ascii?Q?4gZRZjD3P9FWTkWIhHSovqUgT9pr6MIhImSZeMM1uh0r/eIUtjyIzcNHtsbt?=
 =?us-ascii?Q?NEDPBSKYRBi/vCWpyoX4e66DPD52ztkygH0eQWtAoayAhSVAQTLIbKvjrinU?=
 =?us-ascii?Q?/gceFGO+Q+0B/6B114kyojjIVD4jExeuRqe8okvBuaYdTiprZJi/HgbR8h3f?=
 =?us-ascii?Q?YIsmNZPemrjgrNfjdGRyjImXlvNT3zgR1VH59mEbRuMOc66Xsm2779qpkK0H?=
 =?us-ascii?Q?Ook71obuVGaRHSYZNCA0RHPjVnBl5C0pu9aDLps2sijoeygrRzL96GBuxCHw?=
 =?us-ascii?Q?HbKiexXgK9D6YwaKx/BJmJ9Ua5noplJldLtdS32Al7Cl/2FhoNFFyxEntj9h?=
 =?us-ascii?Q?nFiWZXt1zKcQ4VVHH9SymUgV+JN3NW831AGdOPfJCGYYeL6tSSVQYVeqqsyw?=
 =?us-ascii?Q?NOiYja3v2l4LImkV1kW12TXgGdeSo6bk67mq1ZOeIaGkT7A7WOgt8EYcBDOu?=
 =?us-ascii?Q?RLfQ1+t5xYexjgwM87SjdBbqIwtYbm9O8zgk+hSAPiwNKYq4mlFTm3z+doN2?=
 =?us-ascii?Q?29t/v0yKcKMtD0xsEoxVnvETwRykgSJ7QK+ASyQkCq9CEyw+WovHCN1qyufP?=
 =?us-ascii?Q?RBdopAz4cMumE+Eb1qOr7Zd6W/yq3t9v/yLyMNMNpqkDV6lQVX7pFF3k12aH?=
 =?us-ascii?Q?UWQ9q7kZXaPvJzv2UcjdAE0Te2wlWoxjJWlsL6Aqddd6ne1k8GnYb+XWPLOH?=
 =?us-ascii?Q?Wy2Lr/CGZ3kv11XxfJxuVtqDs2dkhfKgdp0B+zokp4ACq5Vo9u68KfdQTrsm?=
 =?us-ascii?Q?S2HWlcKaso9JKC2gdloWJVE0U3bVB/pRxzVk3D1aiQieLnGBXGmY44mwBeI8?=
 =?us-ascii?Q?U9u0wIDP9i7WvLKi+ukQnYKZ9tCuu4Czn8rBwpRNT5twc5+kRKszopPX1wd0?=
 =?us-ascii?Q?QemiKMwOGGxRjMDyVaMawe+6c1u1tLjPjJ1evXCngvfTrWnJHI9SjM3Qm665?=
 =?us-ascii?Q?iQT0pZs1iLWpMn76u8I3MID6Zqcab/zKrnAh85n/zi8NUAGMipsVmtFjOtWl?=
 =?us-ascii?Q?FH7qT/5dDOm5yoYF4AmEbRzJLe8jjsCE3SQ+8l422uRbxYHiCovh0iqtQRJq?=
 =?us-ascii?Q?1ngSwloAEL8a5Pwt0ECJWQpfU6QhfX2/l0A9FzogkInwMBUPQJJFYcT4pdQ6?=
 =?us-ascii?Q?zUXhkgdz/w=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 558025ce-ce05-4028-9847-08de9c548002
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:39:47.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fblz1G+S4gOfhjE3IgsXlQrFb6jnQbGX2Jp62+XRa0+FgnLgyEOt8R0OfACbDY8cbysjhO2bjuhHtK/OWoJY6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR01MB4105
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:dkim,smu.edu.sg:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[smu.edu.sg:s=selector1];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58963-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[smu.edu.sg,quarantine];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	NEURAL_SPAM(0.00)[0.221];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 818F5418677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a memory leak in drivers/staging/media/ipu7/ipu7-boot.c.

In ipu7_boot_init_boot_config(), boot_config is allocated by
ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
the function returns -ENOMEM without freeing the previously allocated
boot_config.

Add the missing ipu7_dma_free() call before returning on the error
path.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
v2: Reword commit message in imperative mood. Remove unnecessary
    NULL assignment on the error path.
---
 drivers/staging/media/ipu7/ipu7-boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index d7901ff78b38..495b3e05a9b1 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -263,6 +263,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 					   GFP_KERNEL, 0);
 	if (!syscom->queue_mem) {
 		dev_err(dev, "Failed to allocate queue memory.\n");
+		ipu7_dma_free(adev, adev->boot_config_size,
+			      adev->boot_config, adev->boot_config_dma_addr, 0);
 		return -ENOMEM;
 	}
 	syscom->queue_mem_size = total_queue_size_aligned;
-- 
2.50.1


