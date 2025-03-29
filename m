Return-Path: <linux-media+bounces-28982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8679A75460
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4DE93B0F15
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A751C3308;
	Sat, 29 Mar 2025 05:46:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4C1C32FF;
	Sat, 29 Mar 2025 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227161; cv=fail; b=rO2d+jNuXeRt8qI0Coejmpz0HHs9kLgqwn8yngGfH4Sv7Ak3Ab5ts5IelPHpStGIFzrhypbyZcOFe3Vn5CdRXfPSc2sM+crae44iEU/ph9HCTqqJ8qd2k0lEuu8OssWyYOBiXCGQCWlKnACbCKf99sVqzw8eDGMz0wYsYeCBikI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227161; c=relaxed/simple;
	bh=R2E6UWbsdTBXGeGv2pFRHXMAI96iJpyyemv8Ojm1/BA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MywD09168Mtzd3SOmW0XrIW0P9R97muQEOtgGsF8KikA57o85ZHniDvoPRJddbaHOjXdqqEveWQjWRfIZYzwF6gj7q/gT2AojMqQOWwfjlQMqFSsBIwhXIZ7qjcD3e+zCv1shDWMMjUSMbq5fg+EMQgTBTumZGS6zZeXLIouyXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd61oSPHRh4kwi7K+uIzrSIXrAf3ijZ9jqgCt4h/v3gwfu6us/eDVGetiFkfzIIcGUIAY2UegAJBti2XthMdTy+GI+sIsAc3jJ1WATkgWfQFP5IcrvCR7t6kseb5f5kGnBT0laGQH+B09gSJE2SDfWdULjTCI0suBy2prgQoAjEelf7lESO178NOmnNIxXi6iKxB7PSdGf0DA15YvdcSHCsA30jPKpc+3/1IEfzSg54f9ni0+/nuVwhJ5nkJQ6F4iefmYMVIxVVDAUEBaQ/Cslgs/e5I08OMvzZN1QHSHmhEeOdBQ+Zz7YBYOB1yxarSV3jqnwJqzmDwG9VBvc3xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYRwZqbOrsMSpEOh9pkDkH5zF6rzHfxTJVD60HzvQbk=;
 b=ES8K7TOsCBaVsPlo130OPpSlr45cmwcUDstxJvPHhhkhGOtTWnisWof7PTDCcjI1P1iHQVB/xe7jLyyXCnk1/AXcIu4t2gbx5zlW9W/ZyO/C0N4+DtDfcYHPLDvqVL+AaGIfSpbfX+cAD3i76RlPPfQWIbR3zkPg6m74EXnLN+kNqYjAOruwPau6ypC9i2aB+E2fZVHclfLWE7cTI7psgoK1DdfNO1Fi1Eki9iIVdpHe05vuFLTXSnHd4qkoZKtFUa9DSjkuhco2vP4LhtFauTUg48otIgAgH1hp5If43QUOXrkWbLi3W4RkyJMj+I6eVaYes/WHZ6KRR4sC3NDkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] media: i2c: imx334: switch to {enable,disable}_streams
Date: Sat, 29 Mar 2025 11:13:31 +0530
Message-Id: <20250329054335.19931-10-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: d692fdd2-6698-4d3e-4208-08dd6e84fa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJdRZVNLgoUsQlxwp2obg+Xy3/lm3NLa5aMwmBiXW4PynkLIhXAxHXEigk8u?=
 =?us-ascii?Q?uSrtjY8nL35OPwo0aVOSmxngE718A4F0jzPM5xjFBsT2wHAMPJhKNrOVBt7B?=
 =?us-ascii?Q?WjH7N+usGYn6OmuYTafCf4g2S4w03Xz04YX7jhg8ubkoKYWIVx8ND5yBTxyk?=
 =?us-ascii?Q?HZzttFndVarbwg3IsVLIFryPwnwgHukV/J+5J4Q1nH55wWky5RzTU/oIZ6TY?=
 =?us-ascii?Q?YhenwI4uH/+96Dncp5/Vynr8KHPxkAX0a6d/esgWpEE4HhVPd11P8NUWeBJK?=
 =?us-ascii?Q?wcEzXeF5Ed85Ie1kCz0K+KPtGYF1CzmXwQ299WC4wjrN5DCqLxVHAaQXWeSY?=
 =?us-ascii?Q?jE7xOiF6mrhJgHFyfggR51CYj/92AqMPTatJDHi2f5cSTpvfqfyQNAVmkurK?=
 =?us-ascii?Q?YPfCyRrirCYRPaLh7Mn7UBSimBC4buQMq8atl5Mo2b509/hZiQI5sI79U9up?=
 =?us-ascii?Q?eWZ6Bv5FdMwoGA0IdHIiU0jg7+2fNsvpQfGQ1eeD0Mw++KkwZI6dnNTyiDGN?=
 =?us-ascii?Q?50WVKaFqMap5L6WzuoSnArfDMOTp3DWiLS07cKxcKeJ1+7waN7gvUCQnHEk9?=
 =?us-ascii?Q?NKaaN9RjefSSXpsw9g9YLZibu9Swp0VnbDJMnV91ZQfGJKe2FTTYacZ6M9QA?=
 =?us-ascii?Q?RX3qcAzc710C4ZSdanZJwxVWLM2XRSNVtd92YzM6xFkr1kiMAjDp9w5rS18c?=
 =?us-ascii?Q?W+7R8Pk76kFelQrMH3FZjJKPWOBWd+kjZ213JfWhYeLzoeUKerN3m1jZ3B74?=
 =?us-ascii?Q?rPeY0s488F0tMydvmHfv5sg/4tifF4jhP3Ve7VKvz33t2SCa4ai8TQd85vxh?=
 =?us-ascii?Q?NK2iCMiwTSItVCEZ8HKSYaklepHJSjiYPK8iCNgrx8TU7UvvqyUw/CqNPuKb?=
 =?us-ascii?Q?2SS7Lz2w1/Ey4y7ndJM/YG+gclbProVj9m4YPt3GsBfzcjDPtY79bCgoX42t?=
 =?us-ascii?Q?KVzHNjDAJ8kTnyK4Jf0/7Im1KFTZ3r0icD+gRy06efzKWrkoojAlTxl8K9PQ?=
 =?us-ascii?Q?4nv1DmdYeXB80/L3EuK5bPL1ZtmSpDP1DKDZenPl/yL5a/9WsGb6PwyghO37?=
 =?us-ascii?Q?SBmhc1LVQUglzGidpBJ0taeWu1M8NhYv4hKdnF/NAS7Ef78XhP2bDFRJYkAO?=
 =?us-ascii?Q?JT6WJxW+QLbakmXAQTgEcQztkhnn4S6Nsril+CII8KOavZzED6cM5cdDTZE4?=
 =?us-ascii?Q?2IRKow9KxmhKah7gOQxtBZRCwJiU6amqbgReqFzqOdddEbc3O4LlBwBpaqhP?=
 =?us-ascii?Q?sEujxe60DyGyvt0sNxPYCVrFIz+MyVOoJ8c9gm/7DL7qatozUo+mb1SqMiEJ?=
 =?us-ascii?Q?88/kzh3HQ2IZ4ZOL8Z4lDCwVtE8lkGoEXIVSal9WVa4jlmD3mjd3nSMkkxMS?=
 =?us-ascii?Q?oDRarQGquN/4MrXcfM7Qq76q1SqdclwMkVmzFpOZ5KOGIhlPLEeluv2uOACJ?=
 =?us-ascii?Q?9fWlm/NuXLX4fTiqH3QW3TIv8G0gWxru5aTFKmI1gbKU9XpopniBdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AHTZgzGViZ7qAmh44Ru1Ce0e4cyMDEN+E+VY4glvTpeIM63JOBj1VeUQCQ7O?=
 =?us-ascii?Q?BXA+i1cGzSf8MqK2PWDJAm4Z6l6+2YJNrYiS9vB0FFxMPj8DuQp10ayCbMe8?=
 =?us-ascii?Q?nd8Vap4jHZK+j/kHh+GxpjwEFlGf+s7CunwUgGyGkW6S3o0c9uYpHZeFFu39?=
 =?us-ascii?Q?i4c6NrR30iAiM4lIxdJxvZYUDjBjtyUZYTbDNHScyyXITynfmi14C+FGQ0lE?=
 =?us-ascii?Q?BaOKb50Mv4en8JDPXu7KufpnPhj/UA5NeHydaibtNBRARA6nkAYRnjGTePas?=
 =?us-ascii?Q?CgICpe0+gzUObZjifxnVdXXsuw+o+k7K3I5Ffmdo2tnS3wAIsjteXyhsDIm5?=
 =?us-ascii?Q?n0dLG3ZDi6nwWkDVIc4whKAa2h7UicZVqfzCSspqZfr/Z4jePSvNs8lu94Xn?=
 =?us-ascii?Q?W7L1Gumrh+Ok77F7DdtZ8/jZS89X/w7AQsAlGQWoFoedGmCKMtQsDUtzCKyN?=
 =?us-ascii?Q?w8RKGxdeHsW8XdTMUINKYQj/P9rNHSxeFMzh97+Ce61iL0JOXokpjy0jHb9I?=
 =?us-ascii?Q?gCt7pNls2c33Y5Qj+AP0EnpZCnjF1CGIwMxyPVG/wSThCZpB2qYZJ4yj0JZE?=
 =?us-ascii?Q?1WZtPhIEHqxLmOLfXeyTYpse1xxgF2cGXDyZUnVl7IKsSiMvao5A24IGgu4h?=
 =?us-ascii?Q?i0Ro2+/Stq6yud4VKbN4+URZfkEOHraDXs04T6hTwizTO0Yz+ZxcfrcRDP7O?=
 =?us-ascii?Q?bqA0gRE696w07Ffx8nM5piCTKKxsvwjm0QFtz4xvwrgFQBPpnYQ0i5FGTZQO?=
 =?us-ascii?Q?cFfEiPbKjI3jj5ocvErSP+75FLmSYuQoAep9jYkw55xcIOSl8XR9Y4JzPQJz?=
 =?us-ascii?Q?I3/dtH2seNszSZldbXQCV+IiU4UdysttiIBUPapHx8Gy7cS4E/aYqrSxLo2U?=
 =?us-ascii?Q?QlhQGaEiytXEbOdClLH9KzBVQUs/ww/6Bysck0GDGJlZrjJ5FL6nuxN6+Mp7?=
 =?us-ascii?Q?q7LJLQR7Ypd7QGz3TQpRS7f5ibJi3zZFEcUiB0fElrhOq6ZEl7kwU6W/ZyrI?=
 =?us-ascii?Q?bo3VrBXwGrO/QfU3qbqInm9KVQ61QuUiQLOUz/znoW7Jtg8E57/dcRoiT2GM?=
 =?us-ascii?Q?FCvoX+u+U5IYCOm17OeVlw6RBGXLCNwaJtft3+rSa3pJvxKZFhfiGg0QLSVy?=
 =?us-ascii?Q?R9B+HyYpQzR/5a28ANmLYDA5duqq7f8j5Ah59HSCf+1JNxj7JG/AHtHuZuAJ?=
 =?us-ascii?Q?kKBV1ctqkbG5uR43w0WchqdGpjEAQJmCA4x26LuXvS8UqOrkBPKk1iGiTqIh?=
 =?us-ascii?Q?HIWGa2lThS2E3VzbBkL2k6UdGHLXYFaeR59D9gHu7gzsXPRgne2Xv+NmeXkX?=
 =?us-ascii?Q?La+VtA0UbKtPZhUY/WmUcq49JjFAtvsJ9oVW5HNP+j0yqcD4dvkGMjQjjLXZ?=
 =?us-ascii?Q?mq8MaDscuTnJzutyhkfWIkFTTa2gH7z1vmi2jNP0hIPXZ7skfcpMACujGEct?=
 =?us-ascii?Q?Or7VfoAbfNTStF/qSXHvktbbjkiahfHeUiTobYQZh5wuEV9zZ+aZryli9P0m?=
 =?us-ascii?Q?MoF12RtkPVVDUbwwhih+CG30eGXah3xvXxB/UJlRkC11RgPgyOzR0/HpJAWl?=
 =?us-ascii?Q?47O2aM17VtOF5PqlevhIAf6WHewTDEIVTm2VZk9bMk9DI6Fmq+mA0dj2PakU?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d692fdd2-6698-4d3e-4208-08dd6e84fa17
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:56.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBwvPXK7AjGIPgdZtV9yErWWfWlk7ZIZy2GANnme3ATWp4HK7DB9Vslv4kpK8cJ37papVgdhXTRCibJfunvyL6U+iTAjbYUXDT/igfIFjAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 78 +++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 29eec4dd28cc..fe4e9155bca8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -847,21 +847,31 @@ static int imx334_set_framefmt(struct imx334 *imx334)
 }
 
 /**
- * imx334_start_streaming() - Start sensor stream
- * @imx334: pointer to imx334 device
+ * imx334_enable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are enabled
+ * @streams_mask: bitmask specifying the streams to enable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx334_start_streaming(struct imx334 *imx334)
+static int imx334_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
+	struct imx334 *imx334 = to_imx334(sd);
 	const struct imx334_reg_list *reg_list;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(imx334->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = cci_multi_reg_write(imx334->cci, common_mode_regs,
 				  ARRAY_SIZE(common_mode_regs), NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to write common registers\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -870,28 +880,28 @@ static int imx334_start_streaming(struct imx334 *imx334)
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to write initial registers\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	ret = cci_write(imx334->cci, IMX334_REG_LANEMODE,
 			IMX334_CSI_4_LANE_MODE, NULL);
 	if (ret) {
 		dev_err(imx334->dev, "failed to configure lanes\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	ret = imx334_set_framefmt(imx334);
 	if (ret) {
 		dev_err(imx334->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx334->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx334->dev, "fail to setup handler\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Start streaming */
@@ -899,53 +909,39 @@ static int imx334_start_streaming(struct imx334 *imx334)
 			IMX334_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to start streaming\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	return 0;
-}
 
-/**
- * imx334_stop_streaming() - Stop sensor stream
- * @imx334: pointer to imx334 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx334_stop_streaming(struct imx334 *imx334)
-{
-	return cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
-			IMX334_MODE_STANDBY, NULL);
+err_rpm_put:
+	pm_runtime_put(imx334->dev);
+	return ret;
 }
 
 /**
- * imx334_set_stream() - Enable sensor streaming
- * @sd: pointer to imx334 subdevice
- * @enable: set to enable sensor streaming
+ * imx334_disable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are disabled
+ * @streams_mask: bitmask specifying the streams to disable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
+static int imx334_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct imx334 *imx334 = to_imx334(sd);
 	int ret;
 
-	if (enable) {
-		ret = pm_runtime_resume_and_get(imx334->dev);
-		if (ret < 0)
-			return ret;
-
-		ret = imx334_start_streaming(imx334);
-		if (ret)
-			goto error_power_off;
-	} else {
-		imx334_stop_streaming(imx334);
-		pm_runtime_put(imx334->dev);
-	}
-
-	return 0;
+	ret = cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
+			IMX334_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(imx334->dev, "%s failed to stop stream\n", __func__);
 
-error_power_off:
 	pm_runtime_put(imx334->dev);
+
 	return ret;
 }
 
@@ -1040,7 +1036,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 
 /* V4l2 subdevice ops */
 static const struct v4l2_subdev_video_ops imx334_video_ops = {
-	.s_stream = imx334_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx334_pad_ops = {
@@ -1048,6 +1044,8 @@ static const struct v4l2_subdev_pad_ops imx334_pad_ops = {
 	.enum_frame_size = imx334_enum_frame_size,
 	.get_fmt = imx334_get_pad_format,
 	.set_fmt = imx334_set_pad_format,
+	.enable_streams = imx334_enable_streams,
+	.disable_streams = imx334_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx334_subdev_ops = {
-- 
2.34.1


