Return-Path: <linux-media+bounces-29568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EDA7F2EA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68BF3B5E65
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 02:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F7222594;
	Tue,  8 Apr 2025 02:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a/Kxxtfi"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1176253B4A;
	Tue,  8 Apr 2025 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081112; cv=fail; b=JnGoZ+FF6fGF4YihuLFN2qbGsVy5N7Gi6Yrnkc6/pxRgAM4IBAGrx0F2bGFk4A+Ynse3ZRE5+osHObRmJ1HFLYuuTvccJQ+YpYCZhT3pAgtKUfQ20L28iZfziKiiR1/N8iZNtyX5uYO8GHpM4LdoePTUjt3fb9IWo5Inzp0zZKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081112; c=relaxed/simple;
	bh=TpWrDh21/nsyDrMobowTS1PX0SXTJuV1gdxloWTh+04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=teqBpw6Wl2wUDiV2NW6k5WarvaY3tG4y7tBSPKrpBUhsyI/hDThbK4YoafTkliN9QolsJRJbPtseOkZHZdg/dxU9gOvgHIldIuO1iMIK8QBBFAAFmepiGyJemAR5HZUQDSpuNLnw7ZhiaIV9D6jmfsvvEiBAOlS9Hhn3bSMWFrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a/Kxxtfi; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvJagqf70MIXCUi15CDVruDzZs08+I3QvzG+jhDeYuv+BWTIZCEed5i1mLlKPeDau4/pt7KXQlQVpcTGC8iJi3HxfiiDRtJksSLKd0ZDhMpgWmYBHF9TsJ3JM1lDjODpkFQKoaFnJFH+pNTro5NYX6lWEzfxPQMKRKe143hUa20Nme/n1w7Cqq/FGhWUOj/eGKBj+eR6GNDGE9LlUaT/Z48nQ80ifNXnXg9JQ274CVtuKOcgUEQ/zU93BnyF1lWv6jQQdPfrEeanXRYH2j61qF9gIPuF73TcDepxgminFwXqQb0e2oEB/seQ37CdnMsOtpd7ylLpO1Zmn6ZWmV1Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEwnsUOYFD8PB9vSTS06sKHvcoQ+lMaOkizrKjAAqko=;
 b=efmHdGaxNC+t2vLLtSxBnBdX45ZY/ofzvP/5eR1i/U533LtC9UmKvccVse0PhxVkQR88f4/6a6loGZTxwvDYPVClABJ0mF5U9V0RCQPRWmS2vHRDhR2PTtV46YUT7tfEkbjfVoqOYN7Uso7bDSYsufPLv7qpIUJtGt81Dhs97W7CUkCmPMhtF5pZGj8mxnlRe/LWqcneUxGfHIw6bInu/nDnHamfmEKcabuqQKjzt93ISedCN4hvbUCTnbQjbwTW6wTsDUiH3VE8zDNxlqHNvig6YQgaeVWzOWgDRirw3Sd5hYjzV7xwb8abxU2DU2T51+s3IZiUZCyRVjK1E5Jxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEwnsUOYFD8PB9vSTS06sKHvcoQ+lMaOkizrKjAAqko=;
 b=a/KxxtfiUvMWBNMc02TcqZIXm+Y47C51OkH9rnuUeV7woAZE3eEIyHtM/n+cx+IPyU0wDNYEWshY2g4MEpZNYznUAPMENQiZYnuJIiKGSdj3TM6z25NI+mwy0jvrwyZ81rcd+SQL40a36cenqgOuInjmfNY+inf+rRhi2E/zrksuSaKso354YytI866UaN3pbVymiosQEJKa7y0nS7O1vxXoasvDj+2UC39cynxorlAoYwTR5X3k6naUgzv11l+OnoTIycyfB6ML3DdEb4wRTFwrEGyH2vF/+eCw8UYf4Zm44N1GcSg+76qwwhw6qfY134LlhwBcqI0wotV+lXJ6QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:27 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:27 +0000
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
Subject: [PATCH v3 3/4] media: imx-jpeg: Change the pattern size to 128x64
Date: Tue,  8 Apr 2025 10:57:19 +0800
Message-ID: <20250408025725.1244-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250408025725.1244-1-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceb8768-9418-47b4-7a93-08dd76493c21
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7xXkgeeOEF+PCSX2a120+Z+IRLVQfOUlslfjA4zUoh4viWQawwAiF4sW07pg?=
 =?us-ascii?Q?FsBGmEfc5/y6VGx9iaSLYQ+xRYBqYl3BvFNAChcMUE40TxSZFnI2zUnKZ+9z?=
 =?us-ascii?Q?jLo/BfJ+iy139MlqR4kRqwOTWldH93VKa0eDUsGq4qh8vmPI+kS+i79qg6T1?=
 =?us-ascii?Q?MmZy+Xf391QVNx8BLQkSofzgGS8lxSzZ7pBhAuDRf9edn1xQ+h6T+Anx5b2q?=
 =?us-ascii?Q?kfNpVcZ5Z7koBj3/Y8ETVDtA8ImC1HuzVgfgcrcNSUzIO5zTPW3fx/khuvzd?=
 =?us-ascii?Q?Mqlh6kJk0fHtb9I8qWn1oB/2qK8fIEv43T3TpJShJrUdydEJlSX8JYXy5KHN?=
 =?us-ascii?Q?wfUWxWhNt2MqxorizqPPgLc91ATm60CQ43PpMDF+obsHds+UfR0V7rfjLbp7?=
 =?us-ascii?Q?eaYvI7ZEEzKu3JVCjuOqyH0PYvOgGMiKcAIlbYi1+xN4DXbdQNjlHy4U7gNJ?=
 =?us-ascii?Q?FfSLn6yyFAW2f30VgZNN50HFWySguvXMOTOJy9wGrvQVWv46dH/4WxduAO6Z?=
 =?us-ascii?Q?Pp+HeulVrVxF2+idksgqs4YEI7YfgF9/nkYHQSREcRMC0BHqhTHBbBHyc09M?=
 =?us-ascii?Q?+mJnsSyxYeU/KVzja/D1hq/LrcLbOGbQl35/w+cMWzEmgI/1WV5kIhNUipS+?=
 =?us-ascii?Q?L2NF//FZE23IJr4PVQd18nL/SDO/XeUc1gtPbkNrg+MsPYAsXb6NjZ+25iIW?=
 =?us-ascii?Q?AgNOxbnO42CzmAx+aw/Y6dd3l8bNp0ayHYpUWOE6ZIiPkkjuezITCH8XXkSX?=
 =?us-ascii?Q?b85rO5dav9XlKFyNWGviBmRKaoypiP0uQdhD6r1POKq6Z0bhS759kewq6pR7?=
 =?us-ascii?Q?wGu9gjnAGcfahNE+kiPhuIbt8Z1+8Va1q+4DYBz3aM06U8GMA5N5uchfrACt?=
 =?us-ascii?Q?P9f6pEa74JjPbS3XBg+L002uUU8w4plLAw9W7zilxDDstsjk6yQqX1q9uOtP?=
 =?us-ascii?Q?9Au0Uh2W9m/teOTf6vcbwtlvYPaXJDGOqUow9KpMa2IcCekl0TblPNdTyvvA?=
 =?us-ascii?Q?z4w0+g1KLuqSLFNUnwgYDnjLx8/6y29QPTh/muMGbnacxdt9XxYHaZhBqT2B?=
 =?us-ascii?Q?57qj8MVSTBIRQA4upZti7Z6Ij6rlhMOzoK0NgRrlL1ecuFa4C0PKzSnivs85?=
 =?us-ascii?Q?1DdQuoGUZ7BKCoiQyzinsfWhOAoFxzZ0DbrRfX/qSzpIHLY5kPGNs/0O3wwz?=
 =?us-ascii?Q?lY47atkjnvfGOP1MKJjBdPnxGhOtbZAAdhBxT1Kpu4LvYXzVIfuhRPMB6KEU?=
 =?us-ascii?Q?9GrlCr+JOULtZK3twN/I7SOu73YUHWh1bzD68/DxSpBAK6VZgwgDFnzBVE+Y?=
 =?us-ascii?Q?MFf6KulyihsaeyjKKkw2C0dgOgjV6KRHB75lTKKRMi6dTh9uvEHDrTuOXXUO?=
 =?us-ascii?Q?Bm8ZZlSx6O+gw1c9Q6oEm/q1EE36uV3eJTUOoA/ullsd2j2J8hqgV687n6mt?=
 =?us-ascii?Q?+a/01Rd5xiADE/sFVdJR/OOI1Pqso2b3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PB8q4fXlxSHIhcxbP2/bXcUFeymrTYFYTILB2xl+8sVAZLw32X5Kbv6GEJjA?=
 =?us-ascii?Q?alHz+SU7KRBh+tZ+QsBfN9iOC0zjA85gCWwzhAbM65N028u52zuxPT2LExgs?=
 =?us-ascii?Q?2qMEIArUm98kVjRLPrO9OsKfrKgVvpphcvOZDuO5BAVToV2ExAuYmj9uB+xT?=
 =?us-ascii?Q?sfBsRNsmRWj9EDBPOTgGgUXh+8OerR9EqhdJV3nFXK2r9WbuCcKo3VDTlyKn?=
 =?us-ascii?Q?W57d+l8A4mUhM5MjBo1YcnbP+Pn8xYmaeMS7ESAytKhMRdrS1nYi6zErNqhV?=
 =?us-ascii?Q?IJz181/QxxdRHX2sxYOSk4k3LxxE/nQw/PQUhRnPBstzMrwYKJ15LfzLE+jV?=
 =?us-ascii?Q?xXqjB+KY+V5cKlu8dxx6f0Jy5uLuMoSGFNBVTCDqFYQG3+Vz8z4D3JBjwFkV?=
 =?us-ascii?Q?s5ciQCs4s4Ms4s/6HOv2MubZtA5WyfN9jxk3XDo9ROjysoXqfxuJprN6Djpp?=
 =?us-ascii?Q?SxJCgObVDLvQmXTSsb2XaAz3B1XwNyLlWu1L58uMGege5Zvq9ck8vjJ3pC62?=
 =?us-ascii?Q?oxh0q9H+efhWeg2kXIM8ZH+IIjJrp6ZLNg+KayZZx0/wK/DKGzMTm6jatg9q?=
 =?us-ascii?Q?UpMrir96Fwqd5VNtSvxg1jm6zoGya7rm2r+VSNhnzTNKeFlj95wfw11u2jeO?=
 =?us-ascii?Q?CS8LcQ/NtNdvjGnOStitvTXihM3Bmq1WvGBUtSI99xww0gbt9Jg4YQZCWR22?=
 =?us-ascii?Q?B3qwisQKjs01/NIMYrXtNJtjFt6hRU/4fo6EtJ58ZTgvNIDEqxjdFRh9hqvt?=
 =?us-ascii?Q?FUa7FY/sK1NZ+3zjifvO8pbpHUlytGU+lvCcW7lQaKmMtdkxxx283cjZkGh5?=
 =?us-ascii?Q?rD5KeEtIMQC4BSd5lTVIw4X3++N8MtBrWYzBgyovkFRAKOp0eWRHdCGIyL1X?=
 =?us-ascii?Q?/BU5rljnY84yvg5e8fRfSqXxsBPEJhh+BcEyUe+MSV0idpxLIEmPIPVat5vz?=
 =?us-ascii?Q?Yg4Tj4j5xDwdPdV+croNm4xa2LNO7Exiar9B5HqwnUFUkeIALGMwqK53C8J7?=
 =?us-ascii?Q?p0lsJhxMIDaJjbSrWWtXlwjPpy+iIO82idEt0VBNvkOKjR12zoQgdtDUi/QH?=
 =?us-ascii?Q?auPcQaEDHat5/Ok9Sx1fFHTwB4oL4QHXkt8y6i3ciVZMiRmPLD7FoP1PKCaQ?=
 =?us-ascii?Q?T13g7U6AkMAx4wW7I5QZDsZkrFjQlgRCJ1r92QufhY1FZpnaQX0DPcF/OjeX?=
 =?us-ascii?Q?5WQFFoINGGLDY/TXeZdExsL6Rf4bAfKjsxJykFezmMW3FzTa/8Rlu/UH+nAK?=
 =?us-ascii?Q?zKE3jsGpT7K57+cnMwjlKiWpYzdIXIo2t/J8p18tUKM3T9qWqBYvguY7IkD0?=
 =?us-ascii?Q?2vDrD2u8NuztVXKvPuLCyoc7CPQcc1YiLbMSC+1APfbCs/gwIo9ux5LhOep0?=
 =?us-ascii?Q?mTvnZ+jThzNjrJO8ROOjSoNfdWVELGPQhzpaF2zzeY1pIWbMmzUHISS9fp6q?=
 =?us-ascii?Q?lblZgpzYzChhUdhSTXNeSVSl76LpT/NPRvZsWocrLnpGjN7RM+IOHnxbenBw?=
 =?us-ascii?Q?18VRufh24NvkESzdWnW3fGu4EWJuJsf97Ua7AaKNekiP8o9T/EWM+YdLkSoo?=
 =?us-ascii?Q?8LnJA/WaLTTYtg9Btd6oSnCwozQxDQ4rdlo9vTcd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceb8768-9418-47b4-7a93-08dd76493c21
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:27.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhG592xggi4/LTSNiycVLSBAAi2elirXdapK/bMEli/1jROgn3uyG4VHVjOpuWtcuUFjmz0YR0HTDE0F347EmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

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
v3
- Improve commit message

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


