Return-Path: <linux-media+bounces-20978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B39BDEAE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ABB1C2267B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39861192B81;
	Wed,  6 Nov 2024 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FPYH1rW9"
X-Original-To: linux-media@vger.Kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013041.outbound.protection.outlook.com [52.101.67.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB013191494
	for <linux-media@vger.Kernel.org>; Wed,  6 Nov 2024 06:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873815; cv=fail; b=U1Ggv+Q8pW6DYTC/G6XZSPf4tlndTDV/DMELnjXsAbETzbkGfVBFtbwttSssbrUFufryzZ1Z+ZrELe3BFfsmYJQUyQu+xX82oFLJiixsf7QLv7QSsMmOCMe/TWwUm05jwKPKriu4UrIAi/VWu3x6g8B+XVpohsxQGEL5HfzAjAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873815; c=relaxed/simple;
	bh=ivRJYMbM84wlwp6uoS2CN9T6O0uhk/AnaPNw28E4t3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jp+U592CuZcDWggm5w4ETjVVedSUOO/nz3anUHWMcipnN22Ferd31qvylZ0i2vaF39ay6wU3DUfkMAb/BETGO9FrAhgvzQNLiVmtzSaDX+pfBiVNOmE6eDWZpQ6XJEOzF4/xjIFop+LNcUsg0oF4fFGCRONQPo80mCaS81ec0WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FPYH1rW9; arc=fail smtp.client-ip=52.101.67.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UW3bmIrXGfdjmktQdBlbLgdH/dte5XnDf1pHBHg5F7XzYLiODFTDog4x7BkFpxVUJYJpz/1slUncMKYkacYinfBoD7+ymTAH+zDeJq0vzpXuJNJkoqC/3Yny2Af1MR1IhfRaJnLet31cSGmNOGejxD/OCgQQNR7sqp5WrQ93Lre399ABsIQcQjVviEP3H8D133K6rw8Ad//C1tayXaWNTXT8MNRfjnBpsUy2qIfgLT691rAgivk/3jnqKDEjrX/M+GIdUK0ycxG2oFYVc8QaAsd0+H7hFQEyl9DMVxQrRmnlsxlgp9ChthekQHKbqrHktGTqxOIMsOdvTS+Ez66tdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iffvyjG6tA622hD79Q1t/g9sqjsxD4ekfSLnY/n5LZs=;
 b=GEFDZEsKRW63ZOsOedHzy9xggHrE6nOmcji/DyCFxJdry7wYouTtg55u851ZEDpizxmx1E3LRy+y13+1XmtETse6UuV2ywRJlC+crask2Ic1B3nCKxoPqfw0JIYwfgtcgROYoaXR+tZa++GoClxgFyNGl31P0P7Vta8BGQ3AR7XIfRrd+wfJF18X21YGTo/IsFJd0OAA99lGklZZQH87xnlqIOoOqg+bYQtYkejKuLFYbOvRYkccToRePgK83RoaYevRFH9ySN4PIyvbuDGBg6mX6Jt2H8Ufj97BSFBlyulAqGbKp52CSLzrwwMFE/O2kHB6ac2oRs5PsERro2rQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iffvyjG6tA622hD79Q1t/g9sqjsxD4ekfSLnY/n5LZs=;
 b=FPYH1rW9uenyO2Jib5Vwk0arkLA/pSu/5KOil6U1CoR38YwDCTeUm6OE5gOy4aUp8T+q7miTCcaKTHYORngzZoFjhlRjYxTEgcXIdmFt8Q5+etcLBy50ADt1PHOQJwv3F74mqsQ/BcbPUvzbUDco2kcSB2IM+tV6rNAdrn713Pu5earA93g2j1FQKLS0Kz1vhzXEerp7cOLrRzMpuyeKsOGC3SdHIoI/EOcD05iC07LSe1tNRZprOt3m57ZP2TSFGmhZNnaArgFc/L/R9+R7D3+2C3dO93n9IZccW03Viegntdq013F05gZIyo1NMLEABu+dDOoK0CRZimXTAP1oJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:16:52 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:16:52 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v3 1/4] v4l-utils: Define V4L2_CTRL_TYPE_RECT
Date: Wed,  6 Nov 2024 15:15:34 +0900
Message-ID: <20241106061537.211002-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106061537.211002-1-ming.qian@oss.nxp.com>
References: <20241106061537.211002-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 5938c872-2f7c-4eb4-67cd-08dcfe2a9acf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?saKfomrXTRbNmXzyHT+n+ljs3s4sNBZ9Im4CeMuV0AZnuuwGA4nU2zPv+aLi?=
 =?us-ascii?Q?ICsB0FMiG3DfpycCOkfMePyZSqmg4eK2JrIWl8kiS+SLBeLECmP5en0t3r0N?=
 =?us-ascii?Q?o9dw1oDfgrqzgzQwPJsS/BiqwDkelRFQnBqvVmUQRE8h4VNk0/gGXpaZv0/E?=
 =?us-ascii?Q?4jtSX38F6MLeWIRPT9hnjho3Zb/TvikqWJlhhSiK7vDXRDsXx3fymfzCMBkz?=
 =?us-ascii?Q?eSBV4KJQGY/HgkHhzKgFqmDSzVQR/46yOjgkYLt2VxFHiRl1VBuPn/N6w76R?=
 =?us-ascii?Q?PEymBARN/aTTs7mqblT1V/Hx3/TLPGWVqWaO/SRfKZaI3p/iq61L2owE2609?=
 =?us-ascii?Q?ZHALGaiT9B1KSFr32w4z8y1Kybt92zDDLMe3VClohjXplsDS9tYnOqmuKkf0?=
 =?us-ascii?Q?XZ19tI+gcwFujl4OpjPRjQKS46g39MpAndMu46CBm9P2BUYx2I4LMfSvAq/w?=
 =?us-ascii?Q?FGrEMcBRyxQyvU6CY+XrG2q7n9oqkneLy2mQ1N9pIwvzEDlQWdG7pxOusSQK?=
 =?us-ascii?Q?Y52XsxOFEhI203X38PohLjvGSMeLZnV0pIDpLMeMHKI9oEemgjcZLAvNzbMX?=
 =?us-ascii?Q?mKvgITwfZcI/ZzrjhoeL6pVV/4iouHJB4A6aX9lsQ3rin6lyXrfdK1Oxb6tW?=
 =?us-ascii?Q?3pyUsjRFmB5ztH7yvcPZlPbS3Moy+gTC12WIknCZNHwiIrYD26NRjH29L2OU?=
 =?us-ascii?Q?GILM9Wl8hr2o6U/Dh36EkRKdNG4VXE38yvpcn5xtSUnDDViHhfy0HhcwWZfy?=
 =?us-ascii?Q?q3EzVRkxxNZsWFmLcv59CjixfqVpQBkMvjrGzX4rh8GOqLfWrJviz07jyRNP?=
 =?us-ascii?Q?iHFnCO90IiYZxMdchpDQ34ztZnDKsjUNJce14tuo5xd412QUBh+ISuSAIn7q?=
 =?us-ascii?Q?2jXG2Kvg1rY60IumJwVy9Cg4Vu2QtW8w5qjqUNjLZcnlb/RQpirUbj0Fv+0E?=
 =?us-ascii?Q?dnwBVCf6x8XZ+RzZ3IcY2ZXIk91UpLP8jib+1KC3gI/dddZsJRTew0CT+F1z?=
 =?us-ascii?Q?CnqI1iqUI2AKWCDvYGW1/YMM7lJ11zQz3d9HL5BMVRRZv12X7a67g4WnTROu?=
 =?us-ascii?Q?Wfh226AhBHvDiXn2v8Cvy3kkK2bYznIjNRACXhiec1oF1/FnXPixhkIakgyn?=
 =?us-ascii?Q?OhZanSoB+YV1PCJMN4CyZBJgYhleqzR1W5l3lehwtv8Loh9+8T+/zcE8mPfk?=
 =?us-ascii?Q?OTd+B7xhqjBwknPlN/MZnoyaHrh5/DSWM/vwVO9H9NREFFUFVt5iCAVliVga?=
 =?us-ascii?Q?DC5E08qH19Mea7qxuCqp8u7fLcOJh3ffnNBeHYvPazOa+anWGIXYRHgmRZTM?=
 =?us-ascii?Q?/hP7W3eSC4wqChc97nz5eTXQGII2lxeKO3S7cTvVriZax9qpn2hCKQ6ylVA2?=
 =?us-ascii?Q?GlfmQjA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?r9Wp+4v885TFCj4iCupHpJLO076163K5M30X4Kt9cYbKGoASSLJRd3ar3I45?=
 =?us-ascii?Q?WkqM/2ENKljUnG078bJgGC6avIpbswgAFrU2dVncYKTdDKZZMY2DkQvTz2bN?=
 =?us-ascii?Q?tNe1ybqsPR5KzxLY6k36kil2os8jr4lC2DeJsN753UgR68lypGuMx0GR+jfF?=
 =?us-ascii?Q?rJmMPyG4X2r7OqiWplZGXgfDfQlOyBUa9p54ql81DzD8btdtxdl8asZ5vhIt?=
 =?us-ascii?Q?1ijL8AzkXC+KBQtW7S3fIhAPqow2wKE8QLVd6QeTfh+8SPcbHwUQX9+hkITU?=
 =?us-ascii?Q?/RDezwsRYH2EP3ry6SJAjhGxOuVlrQuAHO53nqukM45+h/zINRsI8iuSKmqz?=
 =?us-ascii?Q?PQ7NRf3Fhg9RsVXWxqG67TJf0CzVBLPLW9DTs2QmjxvyX75UIhg5BHmDmFl2?=
 =?us-ascii?Q?LlG1WeR6njKnh0ZeU3s2XcVfvcEgimsgSh4rp4cogsadLkL+6KREMPhDGet/?=
 =?us-ascii?Q?UPXJkKg6NpY9bUnN0Ko1K/B2yOcsHXJRB13qus9WmhgO+XvJPLgwbAWJ3rhm?=
 =?us-ascii?Q?6CETZu5YUKO5XPTWehYxlZHwieJhwO6gczH7DCg7eaj0KPU/pcUj6U3swUre?=
 =?us-ascii?Q?SyQzpOJAkZ/yUbO+tfXz9WRbHVzOAN3s7fmjpjNvBEIIa5Bihg+/vV9jlyno?=
 =?us-ascii?Q?Eollshl0wkWBt9cPunTZhZcGf1ZysoxTl3kWwOUYlgkMtYbjtErXw9CD0OTP?=
 =?us-ascii?Q?qJG95GWlms0So46C7dUZarr70wMReHUKVjwxmojKeT4nh0pLfXKC6PNqk2X7?=
 =?us-ascii?Q?msbOE+Nqtee4iB/UagF0+sk2YSlpRXSO1rArXUiip2i+4DM+vKs1VC2ozpym?=
 =?us-ascii?Q?x1yqfva7tgPqJOspx1oLDkwUBltaYdZk/eODp9D9s2WbSfMpAmw/oUO3Uc8o?=
 =?us-ascii?Q?lc6jgyVOgP3CcKpq3GjdbgH+DISFFORlczv9A5j6rk07KD3wC8rskSctIYdK?=
 =?us-ascii?Q?xCosq6VXumU46MyjpLzjjcKZ1i+3aXwnU8mjnWpC3PcyGflsa7KwzMvokJpl?=
 =?us-ascii?Q?941ZvyQ4pplQCKsYn4jGyie5eHGc/vAf+BwwnA4NOw4GLqK+BziBG2eImsmS?=
 =?us-ascii?Q?kDMu8nplYfLaOPBUIj2BKxGjCApdlcIVv38zndxqB2AfucZXqbsdQ8QIdctI?=
 =?us-ascii?Q?sCkce5AG/vARY6aPtLX7D525b7mxNtGYit3tXbvXyujikrS93XQr9DMfMpSe?=
 =?us-ascii?Q?7XMIoTA1wDt99AhJuSwz9o193sNuUu6zS/VXztwpowVPQfJUUB594bFrGrgD?=
 =?us-ascii?Q?IBM27KdQcFkNHh7mSSd6LY2HP1nD2Lal+zB2ohkoOoEyhkCEb1NP7z066dN0?=
 =?us-ascii?Q?h8+jBX5mWXk0w+OErLyZlspFmA5R7bI0xMgbeHtSTSGQW6l6pIN/nLMFGjf0?=
 =?us-ascii?Q?3Wg0mO4KhmjZMY/GpXaPH9Kd3IhWK7gCYFid72bMmq95Nhch/LKLs7Q8bsyO?=
 =?us-ascii?Q?fnhfoWdhu7QO/mKxU+w2FnxOmCmhi2AuhMlVQxTlSmgcakQYmnEZl7N6E5fM?=
 =?us-ascii?Q?b681phRpSpR4ZRUqnidjfpTBvR7kXBprGgaPZlQvsqVN5Ok1/vXdC6BhkKd9?=
 =?us-ascii?Q?MapglURI9Oml8YMCa4Hi/0693eeqcfrQdSQ/ok7f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5938c872-2f7c-4eb4-67cd-08dcfe2a9acf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:16:52.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYZTPsSmOZ7wHWvyBMc9jX9FRuYiiNfNwP/VJhLfb0GkNjZjazbZ44gy6I9iSZf9WsQBTrd7ybwpWgvx/GypZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

From: Ming Qian <ming.qian@oss.nxp.com>

Define V4L2_CTRL_TYPE_RECT and V4L2_CTRL_WHICH_MIN/MAX_VAL
in videodev2.h
This is a temporary patch

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 include/linux/videodev2.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 23db72afdf60..6aae7e10e90c 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1816,6 +1816,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 		struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
+		struct v4l2_rect *p_rect;
 		void *ptr;
 	} __attribute__ ((packed));
 } __attribute__ ((packed));
@@ -1840,6 +1841,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -1858,6 +1861,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
@@ -1946,6 +1950,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.43.0-rc1


