Return-Path: <linux-media+bounces-41314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DCB3B654
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8AAC365389
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BD62D6630;
	Fri, 29 Aug 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FAZVnETS"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021107.outbound.protection.outlook.com [40.107.42.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378772D375F;
	Fri, 29 Aug 2025 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457264; cv=fail; b=tCc3E8zfm7BD6SovGXEhjqHhsv2lARZOsM6jjW4LXiSXHAL4kI6cjccqgTG4mHo/xT0BiXNdnHjqjv5RY21Gul0WtSe5v9Z632blDgv1OaOE3H3UISo/L2GMCQ94t6KQXfhtZZB25KxTH5Ci642VAp2ZWDBBCdumPvs7eNbwPpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457264; c=relaxed/simple;
	bh=wQIVYyD/8ag2M/ec84heAOv+u3Q+dYpHn4ODUUM3UxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=no/KRmFeXsKrWoZKt1k9g3bFINWPw2vbkfQvFHlOQoUwMvbAxG+7V8qJUBy42vXoNPS7MLtbjvF++nLn8KVOATQBRe5sNGAEw+bGJ1V4TBimwqzB59a//cT/yjVXxY2cO8e73VsBUsndG08UD4ZO4/jKwyuIjTro/icX/66zXuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FAZVnETS; arc=fail smtp.client-ip=40.107.42.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcIetcE4QEnrrHol6Tc/LU7C5iHx9LKIljEpkP6kceL/tGYf97faeRa8cGxGpe6pf33xE6mdw4bZHJL3hsHwDuAAZvAJpX1IfkFIrsrNf/BPf2rPihMpg9VSd3iPJy3gO3Jzvp68twhGfJ6JuWlTl63KwXkCKP5KHRmysyspMeHDOJxwBXrZVKg7L1pyziZy6AvCiCu5Uq5BnbanZSCPA0x3CM+jlVeVrtkjIxBsefcIWOMPEab7z8FXy4xgs/e6KxlaKbYL2Ba6SHaSsUC69NHie8eaD8jV2qOqrF/UE4gegchJ+48r/HowQev9NtNoKU1pQhftjb8VTBnVU5YyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiF4x92VP/1CBJOIk8Kd+Ybe7kRUki6aGfMQPM6jzAI=;
 b=u2QZdsysFcmSVlMVzt6td6YbDMsCQ4//1eeM+uAtK0euH4NhQi/S+ONTfBFzDO2c1dCfUxPioUDog1vXLLlpIU9P3Yw4IatvKtIVlWgXia0U2LHeVc3KXKccr40yFaQZPNeToH4ORQA8nm5H1r2eQF4XQD1PHb8OUBvv/pgyX9e/OUWZHRfRv73VU23hNuluHzzJS25Au2bnQN2xfIgmqnR3greKcbfqu+BdWHD9UupzxGSlSjPrPTimoPSiB2uFSvTi4Hlay8xuc2UGZKSwb8l7S+/1W35VeyKlfYPcSpuljEPKmKxUa44hb88nWpL0if/0OKBBwkuU2+jl05KpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiF4x92VP/1CBJOIk8Kd+Ybe7kRUki6aGfMQPM6jzAI=;
 b=FAZVnETS9Fs5cXnYmW1P3NLE0rCPO9GOD/Os5egVh+V3ibivGTDEeMmd/belDyLZSLW46Xrn8Gky3DcbzSf08J+GnEnkIF39tpRsdfoso3yBHHEH1rOmp7eTkLvAoZYOAFBjz22/ffciugp+wvhXNqfF3evHRrm/eSkgnWzW5Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3039.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:28 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:28 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v3 9/9] arm64: dts: freescale: imx95: Add video codec node
Date: Fri, 29 Aug 2025 17:46:49 +0900
Message-Id: <20250829084649.359-10-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB3039:EE_
X-MS-Office365-Filtering-Correlation-Id: a715a863-5a3a-4ac4-3c22-08dde6d8af0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b+3KsNDeR8R64Tmv+zbP+hIkjXSLiM3LbotO2vhzvsTzezz1G/HReGy+TeFX?=
 =?us-ascii?Q?Bqju3JJQlX8ckpRZ8vFe/L4PJ4BmhtgpDfmA38Nnl1A6nl5uV4icu55dz+ND?=
 =?us-ascii?Q?ptYg4RXXcxEdz+BJ6hS2K70fqq6VsRW9J5Loi5cYEd+fyN1TZ1sUopbpaoZu?=
 =?us-ascii?Q?C72LxT7I66te9tLT3mCOc9BO+Z7zUKRV7MJtrOXNkMEWYxcshyWfz+yW8oQq?=
 =?us-ascii?Q?8hk3G50tr9ulpPWHdgFvcIHGdCQei4GNnAwauL4SkET4XakSTSnKtRs0Cq0h?=
 =?us-ascii?Q?qO6IJNViOL8YXhb0B39J/+wD3FP46M0Ai8YmqNJ9Eo0QBYdUU7WIj+zFyI/W?=
 =?us-ascii?Q?HCWAFNQnz96ELfVFQY1kU1g1BEf9hz4VfOGBNQ3NfHiQaUNPxit3Wc9VyNFn?=
 =?us-ascii?Q?s9U3WktEaIomUaoxsaPaGHm2+Fi24LyjZH0BSw5Pi2XyBn8w5tKcRguS5ie2?=
 =?us-ascii?Q?g2Sv96E5qwz3Z9JX47uvmlMAnEIIOaBdW35KhTwXfPic8XsFY2A0VqEGDbd7?=
 =?us-ascii?Q?IrCsWgYgEKUPQqi0EIFwEuOz61xufrwRQcXUJz2wXH0wLzlR0RDqg2JNi4j+?=
 =?us-ascii?Q?f3oLOCwr4Ncp3gyJmjmIVcRBoYPhtAjaRDx9vI7ajA3eXavSFalIlAEL3BDK?=
 =?us-ascii?Q?LgABG6CB90i7t+p1xJWJqwWip/rclXarHOn0rQGrrTnilJoaPkSxN1922X5r?=
 =?us-ascii?Q?iLj3jmOm0RrbTacI1K9aYUbqYF0uhG16htENCck/4zZpXNl87k2Ds2B5TqS5?=
 =?us-ascii?Q?uDlFseCBcBEuBRZHqFXjQVnko2hvyKpd9RvkrgRBl6pIDkXpJ0Lhh2tpYToZ?=
 =?us-ascii?Q?DzKL4h5XNsdz6azPkj1lBtoI9h0V8uCpmeLSwvK8rg0d292PCuwQr6Y9qT9O?=
 =?us-ascii?Q?LqaH1bdP3BLy9f6cE3QUbUNtBBU9UdtdIlQz+pEUhQpjBPwJjshF433W9NBX?=
 =?us-ascii?Q?mm6xkO3l4t6ZVNZZRZyerqwiPJX7TagxrePxFcuBCiZPfB/Q6dUWO39+fPPI?=
 =?us-ascii?Q?onrE9TciZzoTJAkT8M+ruGXfeWKMyPjOgPu7Kwb76r1VCYI/DfAM/8xCAm+B?=
 =?us-ascii?Q?mgAOrieNap0uqqiVxRaORsRhzK9iHgsGcv9iYfGSNxFdQ0NwJjYaAMrZ7kDu?=
 =?us-ascii?Q?8m2Z1Qpdit/JOn99CAZ0T+Q+ZtjZX/St4vHU4G/YnB9XrRjN+G51to4oVGrU?=
 =?us-ascii?Q?aR/iqJAXg8wp1YjI5xbr43f+PEQm43bM0SR79WU0gTFiprvBCUqy3EjEoABF?=
 =?us-ascii?Q?kGhxjtK2tgnPVjUlXGmVwrfGqT67iRQa4Upj+9zoFiBHT02U3jm6ykoGhxUB?=
 =?us-ascii?Q?GS5LirZhj3XR0mdR7mGwQqyq09saNnN2mT6LrvbTCyCMaDy7oAZvAouEpn7l?=
 =?us-ascii?Q?05qVEf1qCta2bOau+F3rplajMqHsXuDwLJugLpR4tZV6tW1ik+HsPHD60a5V?=
 =?us-ascii?Q?67Zet1GkxzXP5aztKe6ecHlcRw7/ImHv7+ncqgR/afLSnKnz8IxbQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Csy2da8SzKooKQgv6scIVObHm4gj4iZQOk1S7j6uABzZwjvlpWLWjd8vCvR?=
 =?us-ascii?Q?VUiZfBfEXHpI1FFcUE7fEh86HtE3d7+BC+/xzuCk/FbI0Vehsm3AwkdXjVgF?=
 =?us-ascii?Q?g9iYt/5v/pI/Z4LjwcZ4thE1kJ+e5LAc9J6zwVwUp2Xf5KN2cFQnOcrMfxtU?=
 =?us-ascii?Q?DoDWqcQOiDvJ5PmjWU+ys636Ohby/MIsox9q88vR2si1MD6F1wNAvSIcQSIR?=
 =?us-ascii?Q?j/QPuTWwtIn4uSwmfLhNs2kUQbAOcnKh7cb7stnbLSCpq/TQpcGpkf6a3447?=
 =?us-ascii?Q?Mf2yW9BIWTlfMlBnCICSg1rlgIE4VheI5dM2G/0ereDppxJ+IAmmUMMMkxe6?=
 =?us-ascii?Q?QBqJhN8hRDLgqe04cESibLYdQ2cpdqiBtQKwT+i53XcXeeJ8/VDvWJXHsghD?=
 =?us-ascii?Q?XczNXZtjTL3MxA6Z9YmDLVTqtzNIjU9oeuJYsFJyZlsDCWuP2bmJ2x78sKz/?=
 =?us-ascii?Q?jHOiorGkY4/FHCSJjtu8ZTNh0LlBSEj4Q/O8LpUIosYcnwZHMw6K4o+Q8uh/?=
 =?us-ascii?Q?ncap+AaJS6DGSWtrWzhbhtjhHJ+uv7u2hXG9qVKhYfcHwpfIlJgPj41AJhvM?=
 =?us-ascii?Q?1bWt/kLXPZ8dOt600Bm3pvc4j5W4sZEwMD4AI7xcy2RMkGmXVkyF+QLbMkOA?=
 =?us-ascii?Q?MubTwfEfvK4bsYbXGybzsINn/y6oXKrNsmkfkr/FM4VLUazRwfCfuu3T3xUg?=
 =?us-ascii?Q?cgP2jRm5OIFPwmy6xwf2qK77AQQPy2adhi8aLd6wLwJx4LPK9kx7IzspIkVz?=
 =?us-ascii?Q?90eLND/cVCnL4iQkoZJ2R75CFrCCNBNd7ZMhBs7J30iZigvJ/h5IDTpAFUd/?=
 =?us-ascii?Q?/aBpvRSAq+fhJzt5ihfJQ5uAC5CiA7d9/94CU4oWs9l3RiopY+4eUhyfQhlK?=
 =?us-ascii?Q?NFKZOHAE3ohKW8YHR2HBxTmG7NzbcEKpxzUsKSw5idAmqk3EzzmYNU/Ezth3?=
 =?us-ascii?Q?Ngbt+/oz4OZ4PtVH44Sdv5MZwqE8CNL0EJEewz2MU7DRhVbpXYO7i+EXmw1Q?=
 =?us-ascii?Q?S59gXGOm6ehZYKvxM2vlXVdhmbX2bSAlqDqbat7vFuN/O8vGMCBERH/ueFEg?=
 =?us-ascii?Q?9HlzPUcfcssVReqA2yrWX8zO5/kPUnxerAc9v8RemW7LEX5fTJyGhwi8R4Dg?=
 =?us-ascii?Q?JB83E/oDB0ASwbSvQGTvXd8J+bx4j+9VzgnnhdDwNws9fkejHNFMzf/Xk4IA?=
 =?us-ascii?Q?MUXkDJYgo0phL9nj8rLbFbFFcGKYF/yVK46TIG4KfJLFSo/gR5Uz7XFP/vtI?=
 =?us-ascii?Q?InnXFJQWvcRc/WSnd/b/T1mYlkGzCqHp5sHlf/i9xYEVufrGydgnCdqcJMRM?=
 =?us-ascii?Q?9JB72Phpe9aWW35p8Amtb66Gy2n7MkN/rKpWbWLSJgGpUaudY512KAL7TB1d?=
 =?us-ascii?Q?cObbQ2q0wzJN8G5ZAthoQkuGRmMeuLYnQ/u2jbHf9Ynad9jUhdH/70YS1X11?=
 =?us-ascii?Q?Qa07Rd+7PSQXX4HngfS9dFCj0U/9nYwGVHGt5KnU/ZKAM4IrHForVMR4YWOE?=
 =?us-ascii?Q?1rsttV7cw4VVMsm0lWBAzOaQbDF6GxMGaLz9M3Q+FWE5Kb+ghK69kp+COwDr?=
 =?us-ascii?Q?OKtQMbjXNI4/rkkble22JhH+FSgecrSmHVCkClWZxPjchpUwQraBb3HmWCT+?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a715a863-5a3a-4ac4-3c22-08dde6d8af0c
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:28.2509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0gKv4Al9ZOnu5xfMIi7atF6SyhNVeSou4SrBFfEW5/H/xXIJqd0hM6kEkh8rtT4vA+hr8hPatKowHD4RjUxWWztPade5HqZdcRTM2ha4XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3039

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  5 +++
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
 .../dts/freescale/imx95-phycore-fpsc.dtsi     | 10 +++++
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |  5 +++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 43 +++++++++++++++++++
 5 files changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 46f6e0fbf2b0..07e070ae92b7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1137,6 +1137,11 @@ &wdog3 {
 	status = "okay";
 };
 
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
+
 &xcvr {
 	clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
 		 <&scmi_clk IMX95_CLK_SPDIF>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2f949a0d48d2..c9d8b78d5768 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -75,6 +75,11 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vpu_boot: vpu_boot@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1044,3 +1049,8 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
index 7519d5bd06ba..73c84ab60dfd 100644
--- a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
@@ -59,6 +59,11 @@ linux,cma {
 			size = <0 0x3c000000>;
 			linux,cma-default;
 		};
+
+		vpu_boot: vpu_boot@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -654,3 +659,8 @@ &usdhc3 { /* FPSC SDIO */
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-names = "default";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 180124cc5bce..f7c7e676a077 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -696,3 +696,8 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
 	};
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 4ca6a7ea586e..4c14bf9437b8 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1820,6 +1820,49 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			power-domains = <&scmi_perf IMX95_PERF_VPU>;
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			vpucore0: video-core@4c480000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			vpucore1: video-core@4c490000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			vpucore2: video-core@4c4a0000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			vpucore3: video-core@4c4b0000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.31.1


