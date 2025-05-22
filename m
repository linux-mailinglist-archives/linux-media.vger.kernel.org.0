Return-Path: <linux-media+bounces-33140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964CFAC0DB1
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B27A26CC6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B5528C5B9;
	Thu, 22 May 2025 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="J5jTOx6B"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4628C2C4;
	Thu, 22 May 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922830; cv=fail; b=fzbPvofzS0maY4rEtD7cjcr4TSJjQWnv5Yl2aHxXAqKtVcxGdoNfxVfLETwe4ZayFLfaOCnK4U36uJvGsieVvfrKhHtJKD+BSF0tfmOA5lzdQMgtPwMQdHH7kZnHLHsQYc6e5/kooyAm5J90rohVMvkNyAS6BFUSgoOetPd/kEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922830; c=relaxed/simple;
	bh=yynIDOVjmpFxfgOZTW5Fz6bmIac2z55qSPd9sXAN1vI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TGq1uL12oqJxPfoSWfMADB6m8iFq8jL2H90tfaqa0eA7Aka4+7g01d9RmtJnIf9P3N7qBNIxgjKWm5vcqBm+mK23CIy6dvFcAVFhooEHbvYzuhJfEQ0B1as1fxbsXeAckRqynBll/A3tvoHIHzWDKi0AREC6pZgAt17JXTkskAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=J5jTOx6B; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sabZoWCQLOtG40qmStFQU5iQVXGDlbajIjbEqBcLTsb6G6OMbQ0596VBtQQBzFSTKJsMZw9m9w0OPpTLt6Eo0KykzkZSZKaxicZMbI65YOq90Li8fnIWbRrD7XfX14dPiTNk5j3zzjAVAilDmDjbnHNWSWS9RAYqpD2/lEXt7Q1DsyMxkZ5PcyCqsWJu5RVd4wOdNHAogjGuoCacmPGL5kLgW342eqsCbqd39c5W/VqYj7dpobNDsymLr3K+E9pB8IfOqqwQl3JkPUeGLUWnWvtuJ5uyVqiR3RVnheedf06gKX4WS3vxktMaNzIhlqQE+nAo87/2h+AHBEm/RHhYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+gNzjTTFQkzpGpt+tdyw+nCIpPKRQUc4BxpCVaEsos=;
 b=Z3F9yBxV2ZzjvCzGXQjvVDUjw/Jpu9/yNmo7Z0/+Jy9SBheNuRj1uAeoZCIaD12Z2eNIjkswCWZqupxPYtHJBqByWNcpsp8IIily/8p61ZDLBSUAuUm+ggiyVvc1oKMfrnZUCaNt49doV8m5349ZtFSMM6aI+nm3OmBilHrpADC9zQwFeVR0LEVo4KSPNzvXEsj+ppfRxJvZixq6GiPUArryh70JtYJJSGQi9N2uUHmh/lGo28AfDIIx5fz/VqwN6F3CRVBiCDHfi6q/uOKkDefkFDSC1TdGEhNNq1W+/RTPUWnTqH4lJ8s7cC9BPzXnvS7ax8Wa41Bp0XJPNhwauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+gNzjTTFQkzpGpt+tdyw+nCIpPKRQUc4BxpCVaEsos=;
 b=J5jTOx6BUPlVdVQe2DvPjWvHK3/tCrRMMKGHgSy747eHJ1am/GPyj+/yPJfMHrx06swroRtkqqIMhye/0nP59HK4KjtZ3mSBWn5W1OTWVhYlyJJ7ifFjMJBOwF7WzK4FulH7StWKdFH9RlanfOXtdUI8TVcyOx947oRy1TUmw7o1dPOHKKzrVNSz6bXrTT2B7Tsk752sn7zs/z3D9sHIRZ2hoEYTst+ZY4bbfRgKvJKRs6yjmfz6Q1RP6jgpiIUo6wNCeou0WGEjBknGx872wTIxF1BIjEtQBAHJGjKaEQoxahDV2KGhs2p1Vx5GANrR/03uz+VbaELyk9L4aUxd1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:07:05 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:07:05 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 5/7] media: mt9m114: Allow set_selection while streaming
Date: Thu, 22 May 2025 16:06:11 +0200
Message-Id: <20250522140613.104963-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0212.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::27) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f10336-2e15-4b07-f166-08dd9939eec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F2cOppJtUIb8py8Rj+B97aXuxjeGFXHoAC//Nvr8+aQtq2+KGhw1xCQyfQBl?=
 =?us-ascii?Q?XLLAqxxKayd4HYYTHr3+FDJ466EKuZZAISeBatFE3MkVcQUSZZQTktOlW7rm?=
 =?us-ascii?Q?HhanHq8dMGDNWSHzaAZkOhzQmPKzBzvSXum2z5Lq4uWWebCf7J+8IQwT4JZd?=
 =?us-ascii?Q?VuIUwPSLCAsXfD5KqsL8TJ+OO6dZKHsmHqQ3cvpUjm6Th6TmnWk/1ldgScUk?=
 =?us-ascii?Q?IeLYVgvwceNcPT8ZlsWLT1b5jWporROQeXwIq/ktA3FukDWWTc8aPN7Zb2Ng?=
 =?us-ascii?Q?6NB7Wh26n0/G5mXZsGiuX5T16pIsIeuoLyG/3AIYVBkYTFDgdRChaMZYfeub?=
 =?us-ascii?Q?uXBt7fc/h4VexG2lyWrcYiG6Amrhk5ipX7GTilfG59CX7/tDUhnhPs1F0Xtb?=
 =?us-ascii?Q?vHr8RnekaG76Dbc+rupx/uxUATX/7KuMv+oUDYZuofQMzCsc/FmtvaxzUpx6?=
 =?us-ascii?Q?u5pu6mcuDP/vwJKOLT7rXjtgha2BvVWON6Fsx2HZSChn//fbwtCGqo/M1ILp?=
 =?us-ascii?Q?sCqPiIoxUM6L3kA1dZx9vNk03/8+SynfBaXVVrxUuNZqbhhMr/rfr5amNB1o?=
 =?us-ascii?Q?fE0U6a8ZNn3iIoBAg2S2aq3Onbka1fvXZh5GNgEvzbVuxHLwQxHljOEKYTTC?=
 =?us-ascii?Q?9+VINJElsm15xfIzNqbk0sVxK+toI4eky/vDEYZ4L+EmKbdd7sLVIOeVC4Bh?=
 =?us-ascii?Q?Tjt0Efndrbq8PFlYZWGXisCpw7HWRwi0v9+giBt9113BjGTSpgMw8nsil2bu?=
 =?us-ascii?Q?JPSLQbNvg33jA0DjgPn3kR4tKsjxvJL4DVBr4IBOlHqoPdtcl4GlbnA0s7Ve?=
 =?us-ascii?Q?sUC2tsFvvxcf7NyvjWOhNAvkcCFgnkqx3XhVXOoNcFFSWyJwpTAd/2Xj1Qgt?=
 =?us-ascii?Q?WOAsOD0eTaEsGI+vSCzcRB+HfBtTrR3ljnoAapCdGT3W8cPJDchFuie8P/Li?=
 =?us-ascii?Q?qSX/g8ZLMkUIIQ+GNwkMKl83UZ1zJaNuoOy/7G8ZIGHsFeXg3ziNgshtukOB?=
 =?us-ascii?Q?6W3tgy4HzhIERXtpiXuHkmK0UmM32hHepYttSWADCObf8OJfBkYTZffmTFZS?=
 =?us-ascii?Q?KSMrkJTTJ1NhoEeXo0VaIESkEg9d/WgRhVpsjlgH7OpCqIwNuDHIMmRIc58C?=
 =?us-ascii?Q?a2f9rWaqA7m/jv7kGXVAMh6QqJxXxJApP45g8UvnfvpQURDPaI2XQVeQYqkc?=
 =?us-ascii?Q?6FbEdO0Bm1aIrf2COeTblWaOotSSAAbNNmDNtqaDT+F41bGTTzQdC0LH32EV?=
 =?us-ascii?Q?FTp+08iub6XLAqakedHZDqtAX5oEInv+rF2PS1iuqrsRPvFMqKugXxwD1e6H?=
 =?us-ascii?Q?pTYnxhUdDcIIWGuZU57by1e/vf7KnsW1nBqAhPza6rsbcAHthLIXWydAm2+b?=
 =?us-ascii?Q?xsc2apsjnVYPNOLrM7aRORPDoK+WF8sBPAOHAez4TLcwZlSGfC53r6xlIE5F?=
 =?us-ascii?Q?3yBP8C6CDpTXDrgEtCtlKFzgJvo85ZP93greV0gf3q+9kmK7s2HO5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rSb9ylBw9PzHGlnlT6pWD2NZuDeKr5WBYHK+wQxfv/r7n1SacGiCq8wfmBxj?=
 =?us-ascii?Q?bqPC1LCBHO3z3fCFrUaBNZBSDfujoPFVB0mP+cGKYMjghFsKQahhk81Tje9O?=
 =?us-ascii?Q?mU/CM7LenIF8A6zzLcJAe+KFtHEgIFjv842gTqonY9ex/sTrRLppLStLY9nU?=
 =?us-ascii?Q?d+cUe3CTGreEXOtvBdAXn/Ub0m/MJXK/C8c9p4DEZ4IKJeEBVyzrDaNb+Sfh?=
 =?us-ascii?Q?AFL/6kPh2eeRo37P0J80Ny0pOLx5uKm+80AlgV3MFcwMh5zDzgYJFHfOTWjy?=
 =?us-ascii?Q?x+36esmHS4GX+ggj+F+ptJDp5kJN2qPKDTKGUmTqMbajueVVBQGniW/r0cpX?=
 =?us-ascii?Q?/0IJyMmtaGT51sWoQWKFpusqjdpupmBouE30/rGpFFNg/EK0B8trqF+WHJ29?=
 =?us-ascii?Q?N/4x6RLbeJqNBlZnalV9Tg2ZsGLnRhhVlLK39pTpuE2hTmpj6G+Wxiin5Q0g?=
 =?us-ascii?Q?NfVYxSbpWajyheGYp+UIuXzXf7cDyMuM6I4KXHVGdZXEl83FGHPorAIu60r9?=
 =?us-ascii?Q?j6CyKtBq7G0uZVpmTXcoTEZc0D02LW3ZtqByYbO5cWEifQn4GoIymL5ZgO76?=
 =?us-ascii?Q?sDFUvxeiDmieE0Mat4Q6EY0p1pKVnRQxoHCxe+dTAiSjACp7ZWP+aCmGdqxs?=
 =?us-ascii?Q?5WeCMrCa9bXTmtNJ5I/X/20/H+JkBib7ggwnMg/FHALQb3+H1VjRdVAE5h69?=
 =?us-ascii?Q?EIc4mdsNEWy0stX6ZgiXGOa9m8o7fWlFObvp4xjWp9xEo7xnvAI4v51LhRUb?=
 =?us-ascii?Q?ceY2oHqgOE3MqO7U84tn3696aX3mSC+MveI9h8vrHBgEKQgYUSCKAX5I+viU?=
 =?us-ascii?Q?5fzg/UjCS24IMJWtCw9v3vsBUl5uTIwHxB0aLPEWzMtrGvlHaMsznmpOnxc+?=
 =?us-ascii?Q?wS8JU/SEQkWK83o8oqVpev0oZRyXAlCWVYPKu2mYUYMysK9EqPBkt/mjjrDn?=
 =?us-ascii?Q?5KDBffcJnXrvDLeVe0tDe5/m36TSx41haIzOhLotg/bboYyXIh4dYaEw0BVJ?=
 =?us-ascii?Q?0xujvHLXwquOBGZL43psdjjfStDDPfmQ3Ul9FjxAJlY3YgsXKf9MGZDIc/rd?=
 =?us-ascii?Q?654QYb769ozaWnZwYKRgXTq3XpEvc4+4lT1R8mhY+EpoGsoa9/CkVza2L88w?=
 =?us-ascii?Q?o8T7N0vx6HrRl8mwYhnZZl/lKUkKVIP43qifNU1Erk/G+gf23OF02AhzC9Mb?=
 =?us-ascii?Q?UrHieDv1ShwdVXG5xJem5RbyexDGyA50qkwE4l3uS4geSt/D9h+gL78aXd44?=
 =?us-ascii?Q?BhkCWpR9pipgowFXBkffC+ByexYVtrzRS81r2xc3dgofwcZUfixeQHc4eEPp?=
 =?us-ascii?Q?ZnBtSsW4Xn5QPVSdYoMUkcKQ3WEBqVFGy0su1GsqBtsUnbpwWXfYp07WKAJ+?=
 =?us-ascii?Q?gedK+ymxSGf2c/5wPzKhJl1lCYtwbknEG1sw5R8slMgt6tKPJbE1/i311ykz?=
 =?us-ascii?Q?dsjBxm1Q+ec+f9N+pmGHBx/N19i1Sg5UBbp2AtvUNkAn6HocC+wyx5wx8XCo?=
 =?us-ascii?Q?qDe9RiDHw2tP+ujQlDlcB/rSuQ6eNdHKLhFLFdoVcr8r4y5uO+fzKud7hy77?=
 =?us-ascii?Q?c3XehOdcEO8epxekuK0dCPz3TkznfSnp3T9aPOQc?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f10336-2e15-4b07-f166-08dd9939eec1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:07:05.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ9BUu539wfo2eqr+kQpidFores9qXDemywq4g1tUZ/ArqlZaYflbmYeN6z/ku2JCW2vUEJLaBX2T1lrGSaxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.
Under the condition that the width & height of the cropped image area
does not change, the changed cropping configuration can be applied to
the pixel-array immediately without disturbing the IFP.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and the size of the cropping rectangle didn't change,
issue a CONFIG_CHANGE to apply the changes immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 7d39978835fe..e909c1227e51 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1301,11 +1301,14 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	struct v4l2_rect old_crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	crop = v4l2_subdev_state_get_crop(state, sel->pad);
+	old_crop = *crop;
 	format = v4l2_subdev_state_get_format(state, sel->pad);
 
 	/*
@@ -1331,10 +1334,25 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/*
+	 * Apply values immediately if streaming and the selection size did not
+	 * change.
+	 */
+	if (sensor->streaming && old_crop.height == crop->height &&
+	    old_crop.width == crop->width) {
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		// Changing the cropping config requires a CONFIG_CHANGE
+		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	}
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


