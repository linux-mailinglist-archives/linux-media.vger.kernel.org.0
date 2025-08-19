Return-Path: <linux-media+bounces-40251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF595B2BFB9
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 13:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5511BC517E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6905F32A3DF;
	Tue, 19 Aug 2025 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Zn3g+78j"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012014.outbound.protection.outlook.com [52.101.126.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14929326D5D;
	Tue, 19 Aug 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601279; cv=fail; b=jQZkzLE+gsSZDTXB9DIAHlBvNfzPy+WGc+DIJQfi9NtelQUZWpQCEC5yT3PqQXuyYNuX5rpT+4Da/uRAU7aTXOMcQxIaDEE4pEJUGQlf+xJ9rnUXlCVbyQqUhCCoIqNt9A0CAmmxsL5wLKE7k1IPtuouxXQCeQMhE5GWr3O21IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601279; c=relaxed/simple;
	bh=9wFMiAWfsC5J65gxelXIBOna7T4PyQTo4QJ8PLbDP1U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AVx3hazFf/Uilud0yQ9zx4cMBU+3m5kCwH8P9S46LtlyPoYaSPSR2sTZyqqNlUwsC/aS1OjeA1+kmMO9W4dCaVdLn8SCEC1WSZN4TNPq1b/GoxgNcW+YGMPjjqIwlHqZFA1uVwJkffMoQl4nfxhtpdZwF0qEiMBPQD3NJFG1/c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Zn3g+78j; arc=fail smtp.client-ip=52.101.126.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVJ9BOWCzDup/AqABGNNDc9sr+Z0siGnpSL3PlnOgHR6JmN7hyahirOtEwXgSP0lUv/8XoSH105/oBM4mSih5VKFv39pdsM8Q5SkoHzl/Su1waVQWkzV2sRdMPU0QsPXI0zF9//+17IVo+FSJbQ+KunPpg0zRRcLC2dszDp3s6mJbMu8GA4Dxho6Ru3bSK9thTSS47vOH/aLZFJcXlDXi3H8/k12ivDm1BH+MFDqYnKp+9BFcVUZxmNVWLTn05U/DcewRSBqZzCkNQ4oskrqHMkUtt3dnVNRahf07KaRrgjtjfOh0sdbON4WVo+T7L/XlGFi6+ADMWY+lf6AjCSilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWZZ5h+v8NI6KSDXRtfu/6Ds7seEb0xyuPhQ3KwZIbU=;
 b=qjl/gubM5VwBdcgfJSWLtxuigoHYe1p8rUITVevEgbLZxMtRI/yO/TTUgiwM9xVGLzGUy4B7nWgMim1ausS35xZb7U9P8VfPA539iY7VmGgMFJhOM95m3jPkHSkw2v3b9WKk7t0SKTvpm7vUS9k1RgUYBhcXUvflNogWVUDIVMf+78KCoXQ5C15dLw3lTrkFbEc+KsGZ6r5rzOnePshU0qEavPICkYDSSAEvZIufm/NOl6xkd5fs+6FcyusGn3rhyVFqj8aVQGskkk8lPs0yQMPRdXCVhcWe+eDMNhdVJRacTP9QfBdVjfpYYsRQzZMJgEEz2OpsB2JHgImTjfe/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWZZ5h+v8NI6KSDXRtfu/6Ds7seEb0xyuPhQ3KwZIbU=;
 b=Zn3g+78jLe7xlbPFGxhplJks6GE2eBwUgyAYUbwT0Negws/I4lMsDmA7FkCYiAkFLJOQsTS9WfvpJZMuJIj9cDH6ya3juvS+XKg1OFYEr+8GWiphyxRqq6a4vBZYFOPbwNdBdwmR83IuFtdTH8sJCWTjTkEJn1+Fw3UGe75TTYYUgKCgzgDnp1fls2Akh25FOWBCpCcQbLiwWtC7wrlqhgPtcZabhsdJuKHeVUP6mvDpIwOQd/JwL4uiyd2F+5mbr36L5Fzk1ZIvrEd9xof4lm7JdLh4Z23cB8us6xWDw+VR01/2Hp9tI+o3Ud0mxdr5nTvcbG2ANRqN1y7X1xI7YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6021.apcprd06.prod.outlook.com (2603:1096:400:336::8)
 by SEYPR06MB6375.apcprd06.prod.outlook.com (2603:1096:101:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 11:01:12 +0000
Received: from TYZPR06MB6021.apcprd06.prod.outlook.com
 ([fe80::a774:9376:52a6:8783]) by TYZPR06MB6021.apcprd06.prod.outlook.com
 ([fe80::a774:9376:52a6:8783%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 11:01:12 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v2] staging: media: tegra-video: Remove the use of dev_err_probe()
Date: Tue, 19 Aug 2025 19:00:59 +0800
Message-Id: <20250819110059.578149-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To TYZPR06MB6021.apcprd06.prod.outlook.com
 (2603:1096:400:336::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6021:EE_|SEYPR06MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: df2f28dd-76ed-43c6-070c-08dddf0fb5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5S9e/Zvn2g8vJrDXesCQrSDEI1/gq2HORsXLiZau0upjXHA50b/K9etmxXWs?=
 =?us-ascii?Q?gtlErQ6mSfCXg7UtuBhQx9AtymJ33mmVcmSl3M6jWwlSmMTqctEKydsOPCAJ?=
 =?us-ascii?Q?Iizd2czm4M/AEpcRWJQrNGwBH3JUWOXwzd42WTcsgKF+kU2fPXb8O2jbxA5j?=
 =?us-ascii?Q?eqPf9Cv0vTDllAP2mjGmS71/xb26RxwUG0t/5qWApLasjRvNcPqN4EnoNzzX?=
 =?us-ascii?Q?g5J+bxEkNwi9J8q9+e3O2xPRH2ABciplu9VfAgIDy1YXLNUo+u13MTIQJHXo?=
 =?us-ascii?Q?qlsdAl5ptpuCQ8c23Uah/3NKHpkFq4jmuuLjbtUoUZxf9YKy01GYyc8jrQc3?=
 =?us-ascii?Q?ceIgq1POl4vBsLgG4BWHexeSupaU7kU4y7tORO52w+txh6G05w6xx9D6EiUw?=
 =?us-ascii?Q?0EXrm/yU9CxYTGAT5y5zOFB9lXGAanOhPudKzdnPKj2sL7cIk0Izj7wZt5Hf?=
 =?us-ascii?Q?rilwrYee4cwwzgXvZYiKh1K6jhJHGqkpFjDMD3/CSPAzxQSDkeRDYWCmVpnC?=
 =?us-ascii?Q?fKTV84HMCntJGgbYDUNv/ulBuWT7rvYzs+e6Kab0i5lb1Jndkfn4CiumcVFM?=
 =?us-ascii?Q?H6UChML7tz7AMpd5s/c4oP82Lu6jKkOBruVLWLT+eXKcWp6yXru3kzSsgrDE?=
 =?us-ascii?Q?qk3EaZvDaaJEnHEawzPBbYU2VemxdvtzAz18OSfNByU+nzj2Ep1bZ3Er22bD?=
 =?us-ascii?Q?9T6pk9db77+ZCjK8JUkxYiPYU0vVqDEUjduyWgfOUzP4gh2y7FtcmN+ArK5H?=
 =?us-ascii?Q?CS6GePk/Cco6r3MNvHlb3zrcF+WBYczkN1eKsT4XYDj4cAZvzJ3qWnWpW8ai?=
 =?us-ascii?Q?zKEpkuAHr72fYiSgsKMy6lwthPT+DZ+ObP7fwuA8E+NYM783jvb+qXJCKV37?=
 =?us-ascii?Q?Aap74tLCbU7of9+GfbGknxMfVY9YwojaG+9CG8J6UCyVk2pKChIOzD5KbG6K?=
 =?us-ascii?Q?tFKPHU4adV4smfc6cx/rzzncdADbiuGRLqITYNKo6l/J+WIaDKq6SZfWgfE/?=
 =?us-ascii?Q?KyucJXGwYRF90V0C1YlYxZdiais7pyURedgB8v7XRO93qKo1GJNGYDZ8np8H?=
 =?us-ascii?Q?1ccuA4Tmkl0L/7cmbWs9vgjLmg4GNt0bYj1rKOODI57+Iha9RU362pkMky14?=
 =?us-ascii?Q?3ytpzsYpXOmDHO3hEnffDBGsMzDc1gVbQRX/5mv8vaHV4gNrqCyqAHmI9pL1?=
 =?us-ascii?Q?uPmrbBi3dJawcBK+/bmFkkNkv0u41TmZid4BlkQ4/A/Qduwi+PzDkENOpXzz?=
 =?us-ascii?Q?RGKxW/AIzbgwsSUvpLEUdn+IpWFa9ED/ofBsv6VP3xZNIRJsPHhlRwOKRvgJ?=
 =?us-ascii?Q?gNld1PJjuXptrfgK06des75CjAt087xe2sOFwCd65gDfZPN7JqbT6EnFG8Gq?=
 =?us-ascii?Q?g6HKIRLfZcWfDYNsm7VG4AyKh2d28EO2JdygbB0E07rYKlWqfbxmnDe4F1Ew?=
 =?us-ascii?Q?pE0hlSneZdI0K7Oc/+0xfSdN9lAclNxt/eJzv/v7ntxz9lBXEGoMpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6021.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oxVQ0djIK2EopVZ5wnTMr64rBY9Z7D6WMHLC9ZJGZ0X1eVURkkrI7gcMw8si?=
 =?us-ascii?Q?iGOJbsRuREZ/dZozRmHlt+wkcgoisqrgPp3THNcmyKLdzvgkSY3ouc6BZsDc?=
 =?us-ascii?Q?/gxePM0ssHuFCxGHb9mrSX/fluzgIw4jeX57sy7u3yPTSlBjasMoSP/CXtYs?=
 =?us-ascii?Q?7BcwbiRFU+P8a6qu1hdQGvJKS3vS3KssqfGC71lMhdtIwBciUaHHZZzj+K48?=
 =?us-ascii?Q?F0TQ/qOqRw4GJ5qRE75MT0QLiTg0rmC0TJYTyzzOrCTfmEn3MiMR7BTYzevK?=
 =?us-ascii?Q?+FgAj7Gc1TwTQ3VcDXIi+fnPs+TohAITNi9MNBhVQN3QNmAMExZcdILIOGFO?=
 =?us-ascii?Q?BaP1sIyuKBmkqp/vOO5ES7JDdB4swb9m2XyRJO8DFIVCF8BOgnW5HP46/qk0?=
 =?us-ascii?Q?wJHkgUH9AZOIJPH8BaiiLop3YBLD8+fLvNhtqTysMvju2DtlJ/27mMg1A42d?=
 =?us-ascii?Q?84gFu5ht/d+YCvioaeUNje7J5UXJp9LyIP/rXZtTBH1NPQwxK65FC+K58Hbd?=
 =?us-ascii?Q?sHMtc/gA4SislMpMVsJhgK7zpfhMPb20BO9enZlW2YEcTmBKAMNvr6RrknFx?=
 =?us-ascii?Q?GO6jbjbwMNlTiQ0wIa9ixXheFT5Rl3tuq8iupSuzqDQBRSUvaSn1iv3fg7fp?=
 =?us-ascii?Q?E1JDqqH9IwXH2fRgYZ4fWkbij3+tGctvDt+Z9N1sZ7P0kFxFo+vHar2poSW/?=
 =?us-ascii?Q?FfZXRi8wA3mxIj0b0M9kDvLAFN1QCmWaiZWRsY2xcCUw+V1uM8qTbwHk9UxT?=
 =?us-ascii?Q?j/T3HXY+SJCvChBpiqYJrnjId2+a8xq2hNQoscLo0nClZRaSR6Rvrq/0LHpn?=
 =?us-ascii?Q?dke9TEovdmEle7G/zraklViWD7unNAKbUG2bLKsHSg6Xdf1mj2kVotYJzfci?=
 =?us-ascii?Q?Ks8B/IT5h06Kkk8p5IpEyYBKLgdjUvez2/814kgOQS4z27zTdca0y3NehHRi?=
 =?us-ascii?Q?KAINo3Xg+WNbZLo9Kr6a/4s6bpAvNtel6J5t36VPfLUyFrDA7O4Mcp8vt4nW?=
 =?us-ascii?Q?ru6vyBXmwA6fa17m9D3Ajt42IXR020A0jJn80CD8JUVv9VmDjK5vKqg2Of4a?=
 =?us-ascii?Q?+Kdb6Bt4wCo3u9f6vempIooB3tjG3hgBg3yXfIHtRUNJY0x2ByAtKDHGdJNX?=
 =?us-ascii?Q?HZqYskKuejCf2Yu5xUoonLb1Ybk0oylQ/H4k50dRSfP6p7estMNbY1iXC5wg?=
 =?us-ascii?Q?vh57tAwaWvX7JbTI6NTCwHsTCCArDQTRUVmzRnHYaVJZ0fEF671ErIf2b6rg?=
 =?us-ascii?Q?8g5uryNZOvGMEcIHA5uFJO8qn83pbWsG1ltshYKA4UBVc8b41WEdct+ExrI+?=
 =?us-ascii?Q?oyblyEPMfermS3ksEfwE7pFO/k6s+GnNkpjw/b+KZs+BLqrG57TN+keFPaCY?=
 =?us-ascii?Q?lkF8uZ2WzPnMF85yzMiMiNWGaP1VH/wxubVnDh36YT+Y2yI0I/GCSmJ5jOKV?=
 =?us-ascii?Q?B9K2t0jw6ZjQejYZ9y2rUaeDDkBfN6mMAb2FGm3S/s1FztPWfLQ5BccrMFcy?=
 =?us-ascii?Q?tzwH0hwwlfWqBtLKJixsij5qQxgVw+SJ/EFLy+sPw/1S8/dwz2eqm5Q7JydX?=
 =?us-ascii?Q?tMzsOj5XMwRLYFITrAVG1q3+zwJrPJcNBDwIqtRO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2f28dd-76ed-43c6-070c-08dddf0fb5ae
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:01:12.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXFYCTLxan3L78vVpPQHNnd6nqeQTjTpNP1b5sWBIitYwQ1WP3GUs2jOOCSD6HVVfRpMVfyXKjdofwHwUaA3lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6375

The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
Therefore, remove the useless call to dev_err_probe(), and just
return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..ee65e89c119c 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -255,7 +255,7 @@ static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 
 	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
 	if (!out_sp)
-		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
+		return -ENOMEM;
 
 	chan->mw_ack_sp[0] = out_sp;
 
-- 
2.34.1


