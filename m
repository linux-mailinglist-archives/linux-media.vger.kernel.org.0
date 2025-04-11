Return-Path: <linux-media+bounces-30003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C910A855C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 09:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3BE4C50BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E8029614A;
	Fri, 11 Apr 2025 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H3ait/bH"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013046.outbound.protection.outlook.com [52.101.67.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802B293B6F;
	Fri, 11 Apr 2025 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357481; cv=fail; b=PyFlgxjhwJjWvAHk/dXCZXNAwjgYNI9V/zvhnesXGNoHKEVO8VTwIcvNYOCyDG1FSVHP877CoE4/q/t8iERB5w4dRQL1Q/2y/V36mqPx5dHOUujeU/9iR4mGKKOWpXWlXbazJhkyNywCoX0M0cPi9DuGGXWVYtaHq2qARpnkoiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357481; c=relaxed/simple;
	bh=ME8SuFzZ4v6a8do7HqZGfaVflAsgugr117l82XRjXrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRuLUGz6gn8RAp/BGFCkXcDljsStDdHgTEjTt6RAny+34z2QOO+o6aoq7/A+s5sobVV+oPQFYUSONXN2GjI6CBVYvB4UQI9I9MvqGLu0EZ6gpOC8/YefE4WMPu10xihSghX52Uc0NE6YtSlCLMasYlQ8XoEtqqA4jjoZfqpsOuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H3ait/bH; arc=fail smtp.client-ip=52.101.67.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl3bcmseHbjhpz7/ziEMAcT0wiLV4xxTg+Vu9VZFz27jgCh41DH45wdHUn01ivstLm6SqaqpYnEqjIwCiRDnpTYkvAPxof501whei2FfbxRLBI3nDbY6Lu7GgL65TOUpPmHFYSNtTUQ8M4VY4VtXqzB8UZjimC/8oB3HOAea5qVNkTwdH5kqjTY8lEHBiuZeg8G2rNYhH4fGdrAnHOPzkOoG0S2AKacbjCIfYuoJBEvlCZhv3t4LZNvgAunoq9T85iVG36oUk30EJ5lbXNJsrPRhvsjm2aINx3yndQy/wXLrtqOgAevaKbR8NXmAXZh+6QBfmX1vjw5TVfw/eWvxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/D6T5zFsRpfpJEfS5Zlr2nAIaNHGxMB/wO3S50O/zQ=;
 b=c38MU/MMjW6d9pu7zXrECfnSG7reWJhTkqe5PQnB4WX7SULPXA7im4RVJoGn15SpUMkyY3/2vp55/CrU3al2oJ0y5SJ9VhD83nIpOV2z7n+gjwCdmv/tn2D3v0t2oXsIZVizEceNR8fvs+tUYJvmltjeeolXMopI3tD+ihiaXrhHBg0PdUrc84yzVOYIdztOiqqaqQYpB+M28jWQ+92o/PRhK5RRex95XcPNtyH1SoRt6wnQQE2hVxaVoOf08DiLUU2RWpdv+mii/XdVmDOaDpz6Bm9vGN+aQlWcWrfhhwvCjp8qZGc7Fp1ledr/e5QtVtFjHc9s7tm1Tw4ZSZQiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/D6T5zFsRpfpJEfS5Zlr2nAIaNHGxMB/wO3S50O/zQ=;
 b=H3ait/bHyh2FbeHJFWtj4kcg575v3tkApmaLmSbt3m49RW0TFHR97o1MZgzkNZzvH3tYDb1JT05THFsyBHpcaYpIoibGGQ5+Q5hI75MLuZV7+obk1X1RG7ZtY3ODklbk8QXEJhPR5bUp9ENEBGnt6xw9cgUaTbE9bsN3HhU0uJ9NR9iXMrb//9NGR+yn16QFYrpKQkOuxV66Z0yQVhsP5h/7iEm8lXAeKkjTciwIjbJafkZgPiPkNFklhYx3/vahO3s8iA3NjhGeIZJ/gROB/CRD0hCRTuNMXW4lSJ0xP2GiAwa4N2DpTfvW7lCm6rV8d+OflO0MvqlXxd8ZD07aaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB8028.eurprd04.prod.outlook.com (2603:10a6:10:1e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 07:44:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 07:44:37 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] media: imx-jpeg: Change the pattern size to 128x64
Date: Fri, 11 Apr 2025 15:43:42 +0800
Message-ID: <20250411074347.809-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250411074347.809-1-ming.qian@oss.nxp.com>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 270be5b2-5e9c-4542-6f89-08dd78ccb59e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rc82peUE1Ar+FHTxrFtTsjwdF3V/NWu/mWCCOml+uWwKD6z5BWBSS8VgXVk+?=
 =?us-ascii?Q?T2zIOde8jYJvTK78+ZBZdZ2mWnZ1qnenrFIas4+flPIqaPspUw4wMaRItN1J?=
 =?us-ascii?Q?al0NJF0AaPqg3DXRqsi1MjDdb0YMk52SwF8FIyndIDlav56N1BwXb45/sjjQ?=
 =?us-ascii?Q?xPc8EMl5il5Vc1seBMZS1b8zRSkdQo9gNjqks28zCQ1fmcCM5i4PwMyUhIzt?=
 =?us-ascii?Q?JG5FPFi5KuOpS8dhzqnYwdXCGk/+OUrNhfqVHGS6KTavLl1TxvVPjfe6/LkO?=
 =?us-ascii?Q?uxU44C3pRmpkFTi72ltO0j29f5+H/yW6xpz02J5CrwrnNiPAD9LKFUXzASnd?=
 =?us-ascii?Q?Q9+rS/aqEbsc5wYeIF/DJKMNM9DWyiPcVvSayizEe6d4e8+G6wQURAvCn2uI?=
 =?us-ascii?Q?wFn0mRhP8AfdPt0CWi/BLPmDg8j84yMIbyTJoCqrZQRB0VGGQeBrc1WRMfg4?=
 =?us-ascii?Q?twVBlbo9lkx6JSRdylMVPsroovMPTXky3X63RTyTZ9NWeZ1RykN3HFKUcWbX?=
 =?us-ascii?Q?36odJKBH6aNeFWtgO9P5nyiRmwNLMGqAEXAYoo7hqKfdFfF5pCnZKmcrEgeA?=
 =?us-ascii?Q?8fctjWFidhwjZAVyyuYny1izn9ns1PfhgDNiFrhnZKNE536nTsdnevv4da8s?=
 =?us-ascii?Q?+JptEc80EXGtjc9ZuoLSgNKCUYOdALHYDpIKqQXBaJ6unAyOMSuvV3PAsL7r?=
 =?us-ascii?Q?jfwl+sJF3Jx3LSQDyro6TyNSbK3EGor9CruiKkZ267gf/dhpZN3nmNFEZzrb?=
 =?us-ascii?Q?e5QOoLbW5QpzAyFciTcwfXbncYxSF+gz4+NFJslW1FdTKdF0uIC21Qem/47D?=
 =?us-ascii?Q?a2z9umGu3/3CEIF8NpM6lCxtxpYJ0mfFrmzYuFffRSpi7mXOzIcrM3qpWZad?=
 =?us-ascii?Q?JUkAuZusdBW6sav3r8DzFjsan7eeVa69W4K8WluFpxiRsl6gmuK1IYdT6IJv?=
 =?us-ascii?Q?3z9Og5cnD+yKX6GG/PxcZjlpZYzkTvovyMdGE1yFEHjW0qm8mSg4eIrhikB/?=
 =?us-ascii?Q?OyAuM5707zGgDk8UVJgD1jyOg3vE2skzFvMIxg72UHPbs11vomNPMIGs0cPq?=
 =?us-ascii?Q?JQIytzHzB9s2dx5rxR571Q3MP5b2r1ZEQUg8E67k/l7DtQ24YTiPAu/7o/Uu?=
 =?us-ascii?Q?DExbEy/LHdEHiUix117Rs3I3KJd0wbrYgwxDWBv148Nu5nNH6rhbzomNwHaM?=
 =?us-ascii?Q?+bq33ou6aaig2mMOQ/1v3Iip1Y92v/JPCN1ts9ALrAHO/ZNqWOtcXzgzr1xf?=
 =?us-ascii?Q?sy/5q8CpbHggjdTTtBpIsQxV9PR01jG/udJbHa0RZNA3D2wrkAZtLypD/D0P?=
 =?us-ascii?Q?w0PuoSw7HASTPxTWoSbkajQImqzK1XRqyjxX4zGCPQGdpp8FArs2GHbMW/RB?=
 =?us-ascii?Q?/ckx+Zi5XJXtV4UOVzeG4rT/zgVKEYQKO+UR5zc7MXxrsSTX83RP+5fDicEB?=
 =?us-ascii?Q?x8xVvIW1HmuTeEPhybxIj6SHwii1vC0ko4wwSJDdZyV+p6cIG+gbcxX/bgIz?=
 =?us-ascii?Q?xnagjzVTIB79WAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4pKUz208lAmkYL1WaAtesvty/T9OOC4FUPa4tcM+6uzudZWHZIrT9VySwXkw?=
 =?us-ascii?Q?NzpFQQa3ig2a340t74w9z5uePKYzMYEJFMzQAvF9gX/EjBSpmEi/dmOKrR04?=
 =?us-ascii?Q?1wjUXj8cce+IwjVi26aNZjUaDY0PYB9zunqnwcURDQaOjt8CxhBg1TyIldRC?=
 =?us-ascii?Q?2wQD8fAPkhtCcQWhpxqWKGqa9GGBTLhK9iXAVlzvY06IqMDfT7iqkx87zabG?=
 =?us-ascii?Q?qwLhYo6ZRc2huEK4uMsH4Rnj+dAecRY+YnBiVVRQ+uhkLaHC4PsTHQMANffx?=
 =?us-ascii?Q?R/+mBG8dJzdZHZIIA7Fdwp7ShG5bVLrJTE72sR25w6YkbH/Y5fX4f2f8Oevy?=
 =?us-ascii?Q?4h2MVquiPHVrc5iGM/EbtmJKkSrfZ9Y5rcOm2mX5q3tWr19apquE10ej84Tp?=
 =?us-ascii?Q?DJPzIxmYQ50D/plW8xCDtFuecFz8rtrukpYgUajrVWEYNB+EfAgIQ0TpuHvE?=
 =?us-ascii?Q?k/3rTty099bf5Bs81fZ15zClUCVmoDK20PaSwY9rLnsmTqHapmhO/pRN1MKc?=
 =?us-ascii?Q?ItdkT7SYZLAuUNIZLgAo0/mBp8Hz+HmyW89NXLyvnzXTS57R10IOE8KwB/TG?=
 =?us-ascii?Q?nGUtE8B9aUCp8b4jpa/vxqKakTwihAH+/nMcC2xKu1zBFs7oFEmEDbottOzG?=
 =?us-ascii?Q?fDbkOzQFwWP/jm/SegYGWNHW8LOlKyJJdXKFyZgzE188rIpEM87EqqbZi1xQ?=
 =?us-ascii?Q?k2roDQdkUmUL5zRVg07c7/sR0b/QgIi2i4SCU/0bYMipg1KiGr6IIIsxDlNi?=
 =?us-ascii?Q?x8pmvgl9X+5pDchEUBEFy5HO3HpDc79AH2zj7gAZU9DEH32j820izz5EX7nH?=
 =?us-ascii?Q?s86hOJfa/BOmEH3MKMTrttm5nPdsczNevg3ey2PSKE7TjMueTuoNLqiOFUDA?=
 =?us-ascii?Q?TvOJw54Ktmx8C2aYw4M/OsWQeMMpmAPJZXwGyMGLnG70K9QbCmy/P1FtdpZv?=
 =?us-ascii?Q?bFlETU+qfcRVSmzhS7OX/bfnKH0zeN/EemDR7dzEGvOqaOGpeOA6eyle2LkO?=
 =?us-ascii?Q?NFkYD+J75f7oy/o4XuXOAipgUKXeyVEV96aY9OswKV6HZou9w+Vydwf5Yk64?=
 =?us-ascii?Q?66ZSK0zMnpJKInR00H5n8b8WS3nBxJi8zEISL0NeIvYjaNSH3FHCzgzenh1M?=
 =?us-ascii?Q?kX6KbrXa0q4yNJLHes+gZ4nHMsD29Psb9sVirPj2XYhPhCMS6EIDS0HZj4MF?=
 =?us-ascii?Q?SFzLkjqH4TQjb94OdxHc2gAT+rO+h9sMRTY/SORzU3UiFIrHudtKcizbuYUM?=
 =?us-ascii?Q?uAqdIzH4RrNdGwDRzKujdIf+aLwrqJMzDXgFx9FLwKBYCbiV5i1a2HhAss1h?=
 =?us-ascii?Q?snHpSBWMG9lkYdBNpxwMlOdxXnTq1A468K3YqhUNobWYcN+PIkg8mHv2Hx/3?=
 =?us-ascii?Q?bN/XxobGEju7hiF7Fh00ZZCaxXii7bar9gnTYW6oPu88bS/lNBOPl1oH841+?=
 =?us-ascii?Q?E3XD+h4Dy4jKXeJInDV9M7EN9CFnASEIWy5NcJCJQOSZjHzSt/a2AvxaOP3N?=
 =?us-ascii?Q?N4YxqvqRz2hE1TlFYX7clvaxZT2Zbo3bNUeuH267/Zjagk3mWYD3FAq0RHtu?=
 =?us-ascii?Q?/cYxWjHx8CGz/wEOwduBTZHQZ8ptUAnwa8xNLj3y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270be5b2-5e9c-4542-6f89-08dd78ccb59e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:44:37.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2JGjIzQ1TVD/qlo3cEcFtEnHRHpm9HiTSWcKFuebBuz8PCjEQUUCaqODmC3AmZjRNl2B8dZp2B2dXMarV/ELA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8028

From: Ming Qian <ming.qian@oss.nxp.com>

In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
the driver will first decode a pattern jpeg and use the DHT found in the
pattern to decode the first actual frame. This mode is called
"repeat-mode" and it utilizes linked descriptors.

The smallest supported resolution of 64x64 was used for that pattern to
not cause unneeded performance delay. This choice, however, can cause a
corrupted decoded picture of the first frame after the pattern, when the
resolution of that frame is larger than the pattern and is not aligned
to 64.

By altering the pattern size to 128x64, this corruption can be avoided.
That size has been confirmed to be safe by the hardware designers.
Additionally, a DMA buffer needs to be allocated to store the decoded
picture of the pattern image.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 12661c177f5a..45705c606769 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
 };
 
 static const unsigned char jpeg_image_red[] = {
-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+	0x00, 0x28, 0xA0, 0x0F
 };
 
 static const unsigned char jpeg_eoi[] = {
@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
+			  jpeg->slot_data.cfg_dec_vaddr,
+			  jpeg->slot_data.cfg_dec_daddr);
+	jpeg->slot_data.cfg_dec_size = 0;
+	jpeg->slot_data.cfg_dec_vaddr = NULL;
+	jpeg->slot_data.cfg_dec_daddr = 0;
+
 	jpeg->slot_data.used = false;
 }
 
@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
+							   jpeg->slot_data.cfg_dec_size,
+							   &jpeg->slot_data.cfg_dec_daddr,
+							   GFP_ATOMIC);
+	if (!jpeg->slot_data.cfg_dec_vaddr)
+		goto err;
+
 skip_alloc:
 	jpeg->slot_data.used = true;
 
@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	 */
 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 					      V4L2_PIX_FMT_YUYV,
-					      MXC_JPEG_MIN_WIDTH,
-					      MXC_JPEG_MIN_HEIGHT);
+					      MXC_JPEG_PATTERN_WIDTH,
+					      MXC_JPEG_PATTERN_HEIGHT);
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
 	cfg_desc->buf_base1 = 0;
-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 86e324b21aed..fdde45f7e163 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -28,6 +28,8 @@
 #define MXC_JPEG_W_ALIGN		3
 #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
 #define MXC_JPEG_MAX_PLANES		2
+#define MXC_JPEG_PATTERN_WIDTH		128
+#define MXC_JPEG_PATTERN_HEIGHT		64
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t desc_handle;
 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
+	dma_addr_t cfg_dec_size;
+	void *cfg_dec_vaddr;
+	dma_addr_t cfg_dec_daddr;
 };
 
 struct mxc_jpeg_dev {
-- 
2.43.0-rc1


