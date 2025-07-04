Return-Path: <linux-media+bounces-36823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8349AF8F43
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68C434A2FB8
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27E22F2376;
	Fri,  4 Jul 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g+F0wMOo"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1E2F19B1;
	Fri,  4 Jul 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622931; cv=fail; b=mk9esUhDkvTQQHYJv1ogCRo8KJiIXOBBSIFgdC/qnrXF6/I8BYgtSnNTMFgx8ItkBd+fB55LxxmK/o3z7iPtPHC1qy6mp8/Xs2ffTMkHkSXBK+xNuImpJAC9qkcQ+m+T9KwDXrEFku8niyCqJvE3g7G1RJjXI9Cej3JPIQju7pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622931; c=relaxed/simple;
	bh=M2fqwYIzZZpBYLU8MQchWZ1mwnvl2EvZFGMF9dqGkSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OSsY8QVSfXIFb/JSPS/ZooiaR/3bzp2zYwV+Nzl2g4MaoSdSDR7JuluS/XyfjtDclPtx6EyDxYBK1Lf5YoLsRpqyth3HrD9AmIEUfuLESBAzA1D7ZtAQdGBgWHirr6FfkUsqLwXcNfTqAmw51Nv7k5SUdaE/MfePRTuP70YXFlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g+F0wMOo; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr/OtAokCDODx9RJdCIECCak4AwkxwOKqF2lKEla7YN+LIXw74RFzfmKIn57VdgqMK/2L3SFm9K3WsmY2ByHfTtJZ5YxQBOvBDnDhgxnyC/wuapfRm/Yigasz4CI9QoMcfmGwumvRRLBAAEgtZn33KB1Bnz37R4h+nj+HZtwBdcKQYqTCSHhE4EhKIa8MyEMjrH1IfIz3mPPi2zEOnOIFLIiH0jZLeIncBHmAODzHQXjmdWnydAeQ95KKFeTcZm+5G49hbEaurhgpYBk2BnZ+qicIFBw2gGQUgL5MgThDr/vsWrbvcL1b5aj0/7biV5unVDdTfQvBFxDz873/YIgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDwh75zy2d9+2GdFJzuGjlsy5usankGsF4uj1NKxZRI=;
 b=OQYL6LXanu6ZodK4+nGfRLgkKGAQffb2AkafHnfA8H5MltFtFrwx62jnrSyJ7wXfz1yUHsDtEwCeext/B9op8Aod3geWiM8tFdcYGx0pybNB4siohko7QAUgbfcohz2+ewlrCL3j5r9fRwtDf3dYtH1NQoliAH0CXv2yCn6vF4UWWZjZJu/5fpg+UfD3aMeuaqSMSjCT4JwTn+YtuM+DHjQaBYDCA8T5Q2U1BAv79i9cNo/dTyyWzoM3o5iPvXG9Ccc/NnVe8VXLFuzevi1pmBXVge0CqX2A5UrzHguiYCGb1i5CwEeR5vvKCqKqGY5U/XhTA7d3HHJJQSIctrl1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDwh75zy2d9+2GdFJzuGjlsy5usankGsF4uj1NKxZRI=;
 b=g+F0wMOoG/Yc6yxDAPqtU7XehmWj+q9iINBT7UXAVWapPamlFRrmmGZ9+mZs0oossHafzAa4eb70aut9z6fabBy6VLp2sDRclFsDJdRmDwxO4DMJTCw8FEX5whpFnM5jcQ8R3z6r/Rf3nUU1kE5sF7/g4BW8q+HnqOq5pIFsztkpdN8YlH1j4BFt3XvbKtmNRRnuXy8GsBVgtRdOwVJ5dxDs7HUXolwiHAQBZVxg4ZeViEkCRYiMBDvpgWwBtdijzBfkXCkJhkEkydaNCHTdhe2B8q22zrk41eBgcStDsOVRpLf3YHqFV9AsFIzTd21JqDf1taAKwGHQQ8f/RdsNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:55:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:55:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v5 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Fri,  4 Jul 2025 17:57:50 +0800
Message-Id: <20250704095751.73765-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704095751.73765-1-xu.yang_2@nxp.com>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: db823697-72f6-482a-9d57-08ddbae0e6d2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xSVWylrohH0T4hD6mx2h08YP8Y3L1f/JDv7NhvXOi75zvzV7lWIwBe/g2br3?=
 =?us-ascii?Q?Adf4FMffQYkiFcd0U4qtcx79LKoNkr7uQkXc7BPhFmr2RiQmZ/Fy9jsIf6Ik?=
 =?us-ascii?Q?6xpWXp6WMyLSDzw7BLeQMwEwUJXYF7bSjk32y8d8PQOnHHShsROdzX7x2JAV?=
 =?us-ascii?Q?CPuPrZ194udKD0hb0QrAUu6R98MRTUyY50hk5q1/vbgfHM/S8GqSqcX4J9On?=
 =?us-ascii?Q?hG4tdeMaMCcfui3aAnlUX3EnRF0/ivpL1evZjc1A5DUIT7ulJYOGg8fFZYOv?=
 =?us-ascii?Q?aqgEGHsMD60kp7O0MybdTW7V4S1FrQJUyfL/Uw7AyeYe3HnbbtkucgooxGmx?=
 =?us-ascii?Q?QP6Gvv5ASQrdsWugHeW58bxg65PdJTcIZSBE+4A5JxsVcvgiENWT3V6bw/qu?=
 =?us-ascii?Q?PRYcLyGakPwBIDwRZox2x3RaU+mdt/DyZp04JF5vdmMmN7YIeBWk18py8vUk?=
 =?us-ascii?Q?Ta25JyGov6SNFVdvPXom35+XQ+64CEbL9RycePfpYIKwHPVUP7e8Uetbw8jo?=
 =?us-ascii?Q?eKWQ8/Js+5vYoxGmyxjvs1XYQb4pSoKYtVp6emGFsT3V5gcVmDa3EthfyRoW?=
 =?us-ascii?Q?XdW9EpMZfBZOuQKrO65Ke+YR45qBP/b9ISyb086yobtF5/uTgjUZE325O5vQ?=
 =?us-ascii?Q?3QiCatjPHhYO86P4M1mbkP9ZcInzmtt/ZQKTLn/QPOiMHk5KCSKP6iEDBCjx?=
 =?us-ascii?Q?zQ4B39hqas9sCXC48mGmv07TVwUhwm4EhJjAyjCygUIDmK5mlCm/RAayaASb?=
 =?us-ascii?Q?CVhNShT8P2gllvtmndd/wn6KwqqVIuh/sb3FfPlii73mU/G0FRPCyh0h+As2?=
 =?us-ascii?Q?C5tzMQYIcoS0zCL/9IOwD4BYjjNp6iL0mnpQD1DBNINdGNj9v6juTvOxeXfR?=
 =?us-ascii?Q?olsHujA0o1MO6ayY7va9k4t56yBFpVnHHZ78oeh2mV7VH5g4nNwELn94KpPf?=
 =?us-ascii?Q?bEJMJrRkRUxp8PO9a1Z8AW/HelQu1964dF3KkH+Ih3COK5o9LRKqMIw7394e?=
 =?us-ascii?Q?sHmpCflMaQ2DGPmqzKjKvXmVuML8pgm4H/EBiIYWnRlx5m0RZ+9rqwa0l6Dy?=
 =?us-ascii?Q?BE33aVYSlIM2BUwQE4TBnfScLfLtoLDTC7PDmX7nNvwji3/epW2ldxmq7Sap?=
 =?us-ascii?Q?p9XBbVb5jyk5ZSaPo1hRCGKtil9AzvU+5Y+GbIuQhRzMrUm38MPHQWJ/1Y4+?=
 =?us-ascii?Q?HERVxOpCEkuopIFlVPyI5QZ4JWXQMc0EBQmrwopSyquaTCMx2vWSy7P1Hzac?=
 =?us-ascii?Q?lKPAecqEYDH6Mm1qDlt+/j7aCaXE3xEC342b8pJVXm5Op7wUuMf2O0nJSQwr?=
 =?us-ascii?Q?p9HB2NI+kTAjegMjQiOkPhHAs8H3imRxl639/mYZmB7eB/gfbrKF/7Mp94ky?=
 =?us-ascii?Q?5l9Luh8fnMLJPYnZUSfrn0+YEzaZPgp1Qxn8u1QrYZTcdXOn+kH9YD7LMBSp?=
 =?us-ascii?Q?i6tzPewMtpNM4Hi0xMiA1hrkRpfNDMSJIZ4vW/98rZkJJkIbcGUjfoppWOAK?=
 =?us-ascii?Q?YVxMa0YXRGdt9KI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Bys7ZhzJnRhescdYJaUIx0xp3zCl/6i68biDgEFcpivxmTrcGnECdF2uy8k+?=
 =?us-ascii?Q?X6V16DHq9JaMddwoFBPOVxrb2C00Rl2JytlsStk3Xf7v5SNoU/ufVfnAsuGE?=
 =?us-ascii?Q?M8CLAglZ4ldzx6OWeTyd68PGcPApZU3uVccsLFMrpGp5OHmJbiTwllbkzku7?=
 =?us-ascii?Q?NS53lCKX2dLOqSPVx8/4nIpPdCfPMXNCtbuI8xXobacaNjh47sfdAljCUQ5i?=
 =?us-ascii?Q?Je3tn4pdLKMbcpmrRM0dLSToz6DhaIDP7DShVlJ3jqvBiOCoGTo/RwyL20aZ?=
 =?us-ascii?Q?ziSiL4HQPBWcMM74NgmLyMKZ+vz3wxne26CgPhEBkwB7167Wx2l5+Sp/5U9Q?=
 =?us-ascii?Q?sKadVJgBiHgO8m8gV/4JHUxYbXmWXrYJH+zNE3s2OVgrANwbRa8naPflSWZO?=
 =?us-ascii?Q?GMiHSpWxB21hnOydfFDKguH7ouYRS2H+WF0ddN76qvmngJQO9E1/RjQURFnD?=
 =?us-ascii?Q?rYD2zQwxHj3/4IFWo21hqE/knAC+6txl7xI8DxwrV1tqhCdrkQ4CBMjUU8pP?=
 =?us-ascii?Q?r93Q5NvVWErQaU4eRRsqkHGDcgFecdUJZb8wKL5FWNNwjCrGKKDIyQXberDu?=
 =?us-ascii?Q?0dzZ54DnPiIATRAzlSVSqdJNATU40nYP4p0puDIYJeQSJy6nZ40nZQwx85xc?=
 =?us-ascii?Q?y/HuDjjRqSoa+3+xWfdrBifLlL1qe/kQqOP1NAPY+JmW81nQG3HfqIzHT6AM?=
 =?us-ascii?Q?RYENgHPdukAKC4EAsK1HQ5BpvkRsCkoLe7OLhkAFcydkgh5uaf7ye/CsuW++?=
 =?us-ascii?Q?/1gFb2BZcX3GwuNquksnE46P4cJihca7Op7Pk4cgyAd/lHzu4fS0tGtpCy8j?=
 =?us-ascii?Q?LtbEK8jmzLzhZpjv5oDFP49xuZ1++E8fRImL6yOubHgb6yPmsoUBuBPZEfpR?=
 =?us-ascii?Q?yMSfIyl30OE5+SN0ICBYDmV/WsOcGfRARRnPrETch82KuS6zfmy6OI5jLb3x?=
 =?us-ascii?Q?Me7TZFExLOV3TnfSDRbFP8rm6shHTjfRc3sEL22KAnEGXXUWM92eWdZAm3C1?=
 =?us-ascii?Q?+Q1EBTxeS4VBt1Z0qbhJWvZDAMO0Z8uvBiWDu4DEPCzppaufV4g5rV4TPSl9?=
 =?us-ascii?Q?sJqOI+NpsSrmZ13b67M2syXkn5VwAMxZOdnLZ25YIyPOnpaUT5ESHWE/yAil?=
 =?us-ascii?Q?wyMRMnID/OhkZAqKm3LP+WiKbZiaC/gE8bn4W1e67Jlrz6ixMVV08U1GFVQC?=
 =?us-ascii?Q?QRKQtSiBuH+M8kugRzCYTCy+BP5mEB98O0vMBB0ElbXnvcPUw3gMPV4gvQxf?=
 =?us-ascii?Q?gyZstp/xDfaCD6Yy970jQzeWXbLnWnn/EgAEA9FNUkbj7CsnepIwGnLZuzcz?=
 =?us-ascii?Q?sqLiKuX3THOTR2WuL2ZHSUK0+4/hc9jVdbQUZbjst2Woq4bYcxKRzSsEyukW?=
 =?us-ascii?Q?K0YRBA7Y5sqOpKSvCe9ZwC9FoXNWn/C0cNz7ER7nJB/A/czS/G7wZWjEzb/1?=
 =?us-ascii?Q?onX8BR8D/LoC6NBb8qNR7qVZxIuLXRY41pa1NPcqRAkL6PgMIojlNcRMRxVs?=
 =?us-ascii?Q?MWTISntKChNfgX1tJRLZamA/1Jwory4Hkv7DA0lD1PyhWk0LQygERpe+r6Rx?=
 =?us-ascii?Q?0uF4srbRdmvnbrgv6/SstduGYz7Jnpm6/6gi1+Ve?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db823697-72f6-482a-9d57-08ddbae0e6d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:55:26.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on8J1Xa1/qO+/6WM4owThllUjDhldBjYUzGB62x/6OVLRgZ0MrRrBwJki4wITLqOeU893O/ztCGaFSdjPoQSzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

This will use USB noncoherent API to alloc/free urb buffers, then
uvc driver needn't to do dma sync operations by itself.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - add Rb tag
Changes in v4:
 - remove uvc_stream_to_dmadev()
Changes in v3:
 - no changes
---
 drivers/media/usb/uvc/uvc_video.c | 61 +++++++------------------------
 1 file changed, 14 insertions(+), 47 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..a75af314e46b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1275,20 +1275,6 @@ static inline enum dma_data_direction uvc_stream_dir(
 		return DMA_TO_DEVICE;
 }
 
-static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
-{
-	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
-}
-
-static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
-{
-	/* Sync DMA. */
-	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
-				    uvc_urb->sgt,
-				    uvc_stream_dir(uvc_urb->stream));
-	return usb_submit_urb(uvc_urb->urb, mem_flags);
-}
-
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1310,7 +1296,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
-	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
+	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		dev_err(&uvc_urb->stream->intf->dev,
 			"Failed to resubmit video URB (%d).\n", ret);
@@ -1736,12 +1722,6 @@ static void uvc_video_complete(struct urb *urb)
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 
-	/* Sync DMA and invalidate vmap range. */
-	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
-				 uvc_urb->sgt, uvc_stream_dir(stream));
-	invalidate_kernel_vmap_range(uvc_urb->buffer,
-				     uvc_urb->stream->urb_size);
-
 	/*
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
@@ -1750,7 +1730,7 @@ static void uvc_video_complete(struct urb *urb)
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
-		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
+		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			dev_err(&stream->intf->dev,
 				"Failed to resubmit video URB (%d).\n", ret);
@@ -1765,17 +1745,15 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
+	struct usb_device *udev = stream->dev->udev;
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
-		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-
+		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
+				     uvc_stream_dir(stream), uvc_urb->sgt);
 		uvc_urb->buffer = NULL;
 		uvc_urb->sgt = NULL;
 	}
@@ -1786,26 +1764,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
 				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
-
-	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
-					       uvc_stream_dir(stream),
-					       gfp_flags, 0);
-	if (!uvc_urb->sgt)
-		return false;
-	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
-
-	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
-						 uvc_urb->sgt);
-	if (!uvc_urb->buffer) {
-		dma_free_noncontiguous(dma_dev, stream->urb_size,
-				       uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-		uvc_urb->sgt = NULL;
-		return false;
-	}
+	struct usb_device *udev = stream->dev->udev;
 
-	return true;
+	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
+						gfp_flags, &uvc_urb->dma,
+						uvc_stream_dir(stream),
+						&uvc_urb->sgt);
+	return !!uvc_urb->buffer;
 }
 
 /*
@@ -1953,6 +1918,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->complete = uvc_video_complete;
 		urb->number_of_packets = npackets;
 		urb->transfer_buffer_length = size;
+		urb->sgt = uvc_urb->sgt;
 
 		for (i = 0; i < npackets; ++i) {
 			urb->iso_frame_desc[i].offset = i * psize;
@@ -2009,6 +1975,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 				  size, uvc_video_complete, uvc_urb);
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
+		urb->sgt = uvc_urb->sgt;
 
 		uvc_urb->urb = urb;
 	}
@@ -2120,7 +2087,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
-		ret = uvc_submit_urb(uvc_urb, gfp_flags);
+		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			dev_err(&stream->intf->dev,
 				"Failed to submit URB %u (%d).\n",
-- 
2.34.1


