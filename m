Return-Path: <linux-media+bounces-23857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD129F90B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC7818897B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22DB1C5F19;
	Fri, 20 Dec 2024 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oyQDA2F0"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630C1C54AF;
	Fri, 20 Dec 2024 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691800; cv=fail; b=S5OwInSga0B4XHWqQqnNS1+a/tNsNdtm0ykBUrBI59FoQsPsgTR7eih+VwFWl7gd36vkHkUsCvzg2zBAjXT2vjbU/7CTiRv24Rmn38an4r/9SHfAjOrm2NF5B+YBr+AscbTbjBgPl+G50aY7vuevyAWPvnt+uiv9Wfuhms4XNzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691800; c=relaxed/simple;
	bh=npSYWQh6aeYrlen/MjsmisPRK8JLzBn6Fl4/ss5f3Uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p9retGdFD0qazseCmMU/XTUx6J/0glNzegL7QJG5i4qnlo0kXG1XwYoDiTGE/zcp5buuJOc0/Fyg2Sxif7kzMbsHH5EphqVopCbn/ZKl20sVAnFpnkDQK4iFWrAEN4VJfDpO11SMPa97W129+PiAQ8z0VREDOvjuSTBnywI+Tcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oyQDA2F0; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuTMhYvSJda/+o/FUIDTEW5Qql6+/unMQaauvidmnVMy+07hKsbyWQuM/oYHhQOhQShMyzkCsF5/glGfFYH3YMzupWHHocQ5zmJQGPEEY9Rnkj7L5rXjAQny5WGGpkrpRRqHb4KT5gnRdlpFegN6nVMiyA+KIvRXyPV07g/VFhCECVeQtMwk9t1BAvZ8V/2J/v6IW42S3MV3OoLCPJ3Wgc1XWpd75/rrL/zrTTzPWv/QaN4PQnQ15c1S/1ceejTvcEcsrFdlb04Axx3Sl209BCBs2puRA0fassAa9R+jr120SdeE1HV5Zvq4zqSgFOW7BHWyqczPB34kXV7z/EIcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwR5AL0DYCIopmlq2/DLRV2nhNwApjwls7xQBB1Wms0=;
 b=WJ8jt3jMeFfSwe3oELZGTa3hAEKzd6DgGA3oEvvegedVr0foVoptN0VVthLHvWq+f6RnEUa6H+DfSK4LeniuCoS0erhyvORLq60HScWkZsfSQq1LaS77o2Kllt2QUesM3FWl+SFrUHFt2nfs9ydo3NGEF07OLqBqCA5YChnDC1HbXEDAxb/JusMGfzVpagBzHeG4z4zL4E+dA93JhCMQ+dJz9P7oc0sR+eDDVQwrQjdv043xGl7IBGzwaVZnq9XTVQldPXrJ32fBvgVjwf01CXovGp+SG27S7nhnlEY3N1CdisZtDoCsmpRDeir/dRHOXtPHtEZCV9YsoZAXIRccgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwR5AL0DYCIopmlq2/DLRV2nhNwApjwls7xQBB1Wms0=;
 b=oyQDA2F0IQ2a6kb5/vfKJKIL5HVcRppMmw+87R9FGvVcM/+ByLpE8BX+QXEt1IS4O/n7pShbuFjOukBWuxdhpb+Qy6LkK82a0v5ew6ZT4OnJY2RnJqMNhzXgNLz6m2bSbLNRgatvJenL5SNnVfgLzVK6qxS6aBEvk5tJe2jjBW9MFkF6ukXBxT0DYezkTLsHKPtUJppNIaO+/JIXan5obz1BcUzRWnZiWF/fLQlsA4SqzDMwfbWskvC5yWqzqyqo+6eJKjgtoEnWA5eraoEQhox+rtQ+BnDK90U3VvlzkQkNcXTTLJUuuMzfzIAsTgnqh2ZsS5K8mX/H3Z90fKO2OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 10:49:56 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:49:56 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/3] staging: media: max96712: remove extra debug register flag
Date: Fri, 20 Dec 2024 12:49:37 +0200
Message-Id: <20241220104939.503547-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::6) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 912d5390-b74b-486e-d10a-08dd20e40a9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hFCyaCPwoDBTNaj1kQqWSAVXXtenrK0OLLAGoA5Tmk5nE27zC5NVHxUD2f+Q?=
 =?us-ascii?Q?81bKJh3deNZ8sT605AqAz7kaxSqAoy2/xvvBEt2o5a6MJmZf7wq4AeI74bc5?=
 =?us-ascii?Q?BGOWACoim/9G7jleoIaGwdW7mOI2fG1oSdHvVded8FVDV0wDoEJI0a/o8YQb?=
 =?us-ascii?Q?hQqW+WxitxJLjv6gTZ9PmB9o2fZsNA1Dk68GXdz2z4LYgJZSKZ9V5+huN5lI?=
 =?us-ascii?Q?LFvQwQ0N95+165Qa+Ryjysv4XxqmP3WrZWiEF9aXyhu/mLs2sX1XzusGIN8L?=
 =?us-ascii?Q?LteislWCZzCNQbbmCpqD6oV+ZR6d1g8R2Ynu5SWLCyAlAVrk6Mir18jl+pL3?=
 =?us-ascii?Q?FncIiW1GgUS5UrN3MMR4FxFJiK/O+hpE8jx8TdKqWtyQytf1ryR7KCpoUgTi?=
 =?us-ascii?Q?2SyqH2u64ehFjDCU3BGCLwXlxWoF2yEQA2t2Cn+99jV2znMwnahw+x9uJeKr?=
 =?us-ascii?Q?E5KVysLMXXK2TRpY86OQY2IFxmmrID1P9VpjstQRvoAmCr+2U9ROmowhVwXA?=
 =?us-ascii?Q?jWHsQM9GgHvlvMThHWRT/xZiIRXCa5y83eF8TKqh3fjToPFGAoIrxPtyRtXE?=
 =?us-ascii?Q?HF3Iv/TVGw0QckQtkbnEy5XGOh8YotGUO/lk9o0X/DBby86G0GzH67FrGW3m?=
 =?us-ascii?Q?Ga+25NDlvVsektNhbSSZ6pBqhYCwfG1yoi0mcp639Fgx12GQxirXqZgPRpSP?=
 =?us-ascii?Q?E+dHgAHiGhIOUqOxdbavtzBjFzu1QhXlmJELSxbj/kj2a7DjZjXD2uq0XuSS?=
 =?us-ascii?Q?FEvmu39dCG1M1yXJX93ngEiLE2meGKXifYjsHcgD2PeLprXdwQZ+7MDHpT4S?=
 =?us-ascii?Q?kiaO9cUZppc8r13xBr7iWZmkjxH4TpmtEYbg99puciVAQn9bqAGOxUifP9Ok?=
 =?us-ascii?Q?iAf4CGIyj88f9d/Bv78Nvh5MumzsPQ36xpnCPsn0LYft2D7BcGDC2AsY0EH8?=
 =?us-ascii?Q?nzYhAgn+r/AfA2LHafWpWOqbsLJed2DRXPBQPmmEUZaHOrJc/z1U494CHv9T?=
 =?us-ascii?Q?7/Dtutk2iIcQbKeHZM4UUZfT5EIqPw6HE89gLpygIyp21vzdMhO5dWSrsNuN?=
 =?us-ascii?Q?UYOHjxgltpkZJW7SvwUEETv0f5J1LJysQxSGR/1K/Gg0MQ5IpnSV5AT6nnEK?=
 =?us-ascii?Q?ARG6RgazG3ZLbNf62Lygcjo6Ok1vQ1GuWh3PuotD1nOaymG+QpArKXo26XsJ?=
 =?us-ascii?Q?w6kDV1PsPgrLJKtfH4ao0lFqJt/WWz2SyM3EZGmfTpkuxpQrUvuUNgMblacv?=
 =?us-ascii?Q?6kj7f0aMUVY9x4kaXn8/e6hUE0OYLoIV3LVvByAxH20huEUyTfgd4usWOP03?=
 =?us-ascii?Q?rbn1ZLPPVaonCUFgvw8rO4vjSd6WpCWd28vclfFNORrOwt+LZ+lJJxFd1L5i?=
 =?us-ascii?Q?2GKhqQ6j/Gw7+Lmqnuo7KDINrdZc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V0/7GCE9rl27YCqjecDYMTym31qSvxXQEMzzjqybRbqq7ehNTjhBfODp4JNJ?=
 =?us-ascii?Q?//8KDEWcCUbVJ8LCcqEaVEuvVl1Eu6TE+qxS6Ive/YsFFdBRfvDj6mAb2VN3?=
 =?us-ascii?Q?y59sEu01E4gZanqrA6e5PKVcUuIcq21VbR4avBZ19aaaIhIutlifSdXz5NuQ?=
 =?us-ascii?Q?ojG2K0eGiF/5TxEMbEUXefjfqLitz6Wdg28vxoszgMTtKsfpl5ilaOKj5wzi?=
 =?us-ascii?Q?4GT3MMcslH/JbfPbSyGzvheFQdI+P6p+dwmkscf5095fvwWwFvZFjfelzS9v?=
 =?us-ascii?Q?WTqYjNOzMSw/afDXK/Kf4zLiGbqzQQpoh/mW/EuMUYCPub6K068gMIy0YGxg?=
 =?us-ascii?Q?9E4uvC4K2YQyxDIPUNr7xe3En79YMasARGHPmUrelZckYB1zBYi5OQGhpRHn?=
 =?us-ascii?Q?SdqQcb6TZYBonTjE4ENF+1OswWLAVBSMsGFhv2TCIOKcLTfqyKSuRVyN8Rgz?=
 =?us-ascii?Q?OxQ9No507MvXgsM1Dj3E0MCm01f4286v7AVseQvYtzCdvo8jlBL8FXgacTV5?=
 =?us-ascii?Q?PZzr+JZ1mh0jaOuXvWNF9pyHILio2hJFN6BctyVubnfUVCF1MdaEym/ij2ZH?=
 =?us-ascii?Q?1lIMA1p8DQJpODnxvVrKcLrQeV1ic8nSUGenGt7R/Ptro1tbDiHhMTPGKbfm?=
 =?us-ascii?Q?rEm8VWHDyaltJm5YXjJYBYlBwnmGIC6yDQ9U63heuVKjZl5JJe89OOnqh4qb?=
 =?us-ascii?Q?7FtOzVLJZ3lxRgwDi0uJiTkWua2apTMxVn92LFdK1xQojax5PJyBrQpW+C3X?=
 =?us-ascii?Q?gsKUUQWUQGhS5Pt3xN+mcL1WRQsC0WfrafA/gSUFV/ARyEeRqhDuvzDPoHbr?=
 =?us-ascii?Q?aIPIvx8c3p/5h/sc0N2RAW1L0B1PI8U/nXqKU+XcdrfjAb6q3pUoH1H8O9YL?=
 =?us-ascii?Q?ArzR6kEPLYGxRzc2rzx02qbCpS2aaRZYyJamXRpnhNkQaZsLtpQ75WjoVrfG?=
 =?us-ascii?Q?OIzZB4P8rkR3P00xFno2fLg0cDHcX+PNbb0PN7B3MTvOldtqfYI7tuPzGF05?=
 =?us-ascii?Q?ximAPhOhxNwUb9DR3HrS5JmmoZWeVjh1ys2hlJoyKzHi6MOiCpdHFocFPwG3?=
 =?us-ascii?Q?Mx6YZ3Z1VKUoQjZvit4LDP6H7ZdZOfEeR7VSqLeX5GxBPEE9FHa9NQ6xaR0L?=
 =?us-ascii?Q?aGwRQkwEhlo81FwFa4LTiCbCTNfIcIVwkxZy8mDHrkKzJf6w+H6SRYewW06m?=
 =?us-ascii?Q?RQpjh3pVr/CXz/9wj0pO7x3v2R3A53vSWqV5KmpMThi91jBTMzr5GZy5RH/2?=
 =?us-ascii?Q?E2Sp1XtouY9O6sUFK8d24/SqeTEN2AfEwSN2gKEuHY6wH1tnEgRdnuka2Jit?=
 =?us-ascii?Q?D7daHwLeSUi5TqVKRuRV/DRlonPvX+9MsyIXuSmK1O4lsOsA62wiBgQujt2m?=
 =?us-ascii?Q?OdtC+N1Y/y0BjxVOfhyAVIkEKXC8bilVqa01sb1ontIWJLp1At/aT4PI83Vq?=
 =?us-ascii?Q?Q/42UIo+lqsPqyCbbX4s6qWBEIRvEpMmGTBlurJ7PIYiyERCLqMqx5Q/llGP?=
 =?us-ascii?Q?3dJciDf5sl69vjbBvT/H2ZDKSYxNN5WKKwnU2uSxiUo/StSwOFebGNjj0hBf?=
 =?us-ascii?Q?J3ENEMTgut9KSuBun5js1wFG/KzzV6eWvTisSww5D7P6KbV6EyJige6z2Coe?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912d5390-b74b-486e-d10a-08dd20e40a9e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:49:56.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDvC3dM8iIZuGy8VZYYjSth6vUFAs0DhBIYSFJUWWJ7UAdsYGkqusCbewb3yCYCr8DW38qnX1Ns7kJMSVpoWbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300

The current implementation has the register disabled since it is not
documented in the MAX96724 RM. However, in the chip's user's guide [1],
in the Video Pattern Generator section, the register is documented and
it appears to work just fine. Before the change I was experiencing
approx 10fps when streaming, after: 30.3fps.

Hence, since both max96712 and max96724 have the register, we can remove
the flag.

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
v2:
 * addressed Niklas' comments and removed the extra debug register flag;

 drivers/staging/media/max96712/max96712.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 5228f9ec60859..ed4d5db1ff8d1 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -27,7 +27,6 @@ enum max96712_pattern {
 
 struct max96712_info {
 	unsigned int dpllfreq;
-	bool have_debug_extra;
 };
 
 struct max96712_priv {
@@ -174,9 +173,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 		return;
 	}
 
-	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
-	if (priv->info->have_debug_extra)
-		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
@@ -457,7 +454,6 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct max96712_info max96712_info_max96712 = {
 	.dpllfreq = 1000,
-	.have_debug_extra = true,
 };
 
 static const struct max96712_info max96712_info_max96724 = {
-- 
2.34.1


