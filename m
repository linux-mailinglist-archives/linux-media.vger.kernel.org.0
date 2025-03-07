Return-Path: <linux-media+bounces-27807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D68A563EA
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 211AD1602C5
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9A620C024;
	Fri,  7 Mar 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Hy4q4LjD"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013056.outbound.protection.outlook.com [52.101.67.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4120C009;
	Fri,  7 Mar 2025 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339921; cv=fail; b=UZ2slsfuXiv7kkzPZ+vkbvOqAMcrzYw4LgSb0jn8oqsWrVqGATyiQQPYRsFH9JtvL09o326n8WhUD1dlik3jNsFWAuBy/UQSmCXxvHfGzZmiG2mxThoXnhhXTn18zi7yWivDZF7PujUjj/S5dJY2089EcZcdWJT2Ve6C/Jh1geo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339921; c=relaxed/simple;
	bh=pVMNGUV1PB/mobzQMPLtPz/ep7urQ9B8qlXQsWqrHRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYIkvh7Yl4xM7Y7/x9OeruIrv2bqXn1ia0RHj0kztwfe/THigcCS/6VCHEqvTvSJxKVItJFmwhNRRYEsgSc4Y93Kj+gss+2n/GipozlgloaNUyw9MhoQ/hCR2uTGh7wWzZKxV/XX5zweR+pz6pDXNwI+OdJDcWnBP8PgYm+VcLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Hy4q4LjD; arc=fail smtp.client-ip=52.101.67.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3DLd9KlQ4bLKTwnyb5zIB5i5FTnI/vsDSP3FnYWIrP3+pulSfPxNd3AFTr5+wFN9lSBIkEMjscUSY2ymZXXaGsqyxS7cB6Zcf3VIQwojSb/9N1DWu2mMjYMGTFV9ld71MGgmX/D6gC50vROhpSsmTceKq8lwPVOkIi/dBwecKEeoF1Xdp1p0A9UuCNo4xlEkoBy+zAJbwFig70/XXOVP1vnApnHk2cS2RGYH3aNaj8SwOPnYI1cRreEDSs4fcfz81awIGcpHkbRmXCInccLzjxp1syyJnmMmu++w7gS0CG1ECBKpcJDuN5FZQiY3UFBolf3yUq1+IyeSi7YjhNcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxq85QUHaK1HU0Nbdgh9OedAClT/R2aPCyYfhzt6uiI=;
 b=lConTycO1qPhZZLJtD6fNby3bIuzTiSlCD7UdzgLd673STAgc0C6f0IIUyVI25QXAB1aRBZTSlTtbhGuilXe8qwO7ybSbsiHe625Ll0D1tB4rJM/WZD70sJi29W9OuXc0X9GLGqew9bg333xpicz0H/BogfnUhG2PxdBjiVAYCsj+kzr3RhbeqXUkBbJttVnx58fVcc8b/5D2C/m0K9kFq/+dtGxWicmvL8Ipsa8HnhVXHjj/JOPmNanCHoNNMFfhbBw74GGzR5RBW+EiuTmwnpMncnnORCXZiH3ceNl3D2dgny0Bgl/y0cXw0QpfF5WqNqKIeNVhpEgUD0M3DiAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxq85QUHaK1HU0Nbdgh9OedAClT/R2aPCyYfhzt6uiI=;
 b=Hy4q4LjDe3PDyyDqQgYvnBFTJ7PW9QD9nmFq0vMkrQ3muppQUgOgcHpd2dt+3rywkIpphnP9fCD5TJsMGhnKw9AGEfaVK+7E1Z5czhgIO5yBs2wdLIiTnAKGL/A3pzPOAXit7+7pe0sGXgqPQJl+hopQELpQINm596UucJmDmDJiBvWdJQZjChbNfBUEqqbWntEu5/gl19zjWZiptHsKiEmkcbBGzyVB3FUMsr5yfHyts4LhaUcV63DBj5sNnxK/uFaefMZ2p49HNhZ7H98GQIrFjSRLBBHsCPS5gVQ7fcS/xsQVI+rQOh+8qlqbYMh7XIl9+qFNsc0L+uaQQGNoAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DBAPR03MB6630.eurprd03.prod.outlook.com (2603:10a6:10:194::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 09:31:56 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:56 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 4/6] media: mt9m114: Allow set_selection while streaming
Date: Fri,  7 Mar 2025 10:31:38 +0100
Message-Id: <20250307093140.370061-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0213.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::19) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DBAPR03MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 985c2ecd-c3a2-4f27-625f-08dd5d5ae6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1rGd/jizslG/8n3N9V2SmncFz/iZMMHEo6t551qaMxzFi8Du5cdwquYn7dRk?=
 =?us-ascii?Q?RpIHpW5+3jjctdhv8lLy3dBPoE16ds2mKHxokCseP3JRqNCGhdZnn8uX1EJS?=
 =?us-ascii?Q?TvVa8uKWrS/yMd8M+RPk1mK5r5gFEwT8/d6lWUUunTJAhB43NQK+GEuXAbS1?=
 =?us-ascii?Q?dSJre8PzZuvxS6N0qbs1XTcnrA8sXfS+xOHjLAP4Wplc++3nq9TcXTLNyWv8?=
 =?us-ascii?Q?gzkOawtxaJI4ES3LMNVIT2TZgSysbHxQvpWxXssimkw+e/0tLEVC7PA5Aq1f?=
 =?us-ascii?Q?gNqIPciVXN85x3X1zBd0a0JeUNUpwyfr9ZbVggmyY6V6N33lJOHj16tOb5rM?=
 =?us-ascii?Q?IRkv86rAWBC+LhLca1gE7EBqA+C8bGmQSF4GcbCo5vvN12/k9oM8YTHXjUWY?=
 =?us-ascii?Q?zK00dvOSYuRkfTFbsgX7+BI+oSWzYW7DOkCzJUt2QL9l+RblPsN4DjYKbkpW?=
 =?us-ascii?Q?Xg0e02sNURL7v2EbOV39OU9A6JrFQzkOfkWJv0QgqkkrfYcZerUayDoSesjr?=
 =?us-ascii?Q?RqJVPb7FTPNwuSDZmcZTcMJ6uwhK10I/vKgkl0IpQ9AzCA1GzIdhOiZnP81a?=
 =?us-ascii?Q?RDAm2zZsZiWHHsYJevAMYkCsmhxmHj037WmUbJG1T29+agVpGVdxdja/wFu8?=
 =?us-ascii?Q?6koZ+IuBD2WJi/Z1ur9pETmlaVHyPSkBjlVDgqk9zdL8zBHBSbRPflyDRhhl?=
 =?us-ascii?Q?HVdkhfeBe8AqB2csDxVrpZGM7WrAnCOsC8EU3Hua+erjt0Me+qZjKCBnT3cO?=
 =?us-ascii?Q?mn4nxLrP6g2H2YvnYrLbxJGDzZCiJyQ66nYnqalstkg6tUW/neKMpPb9h5DH?=
 =?us-ascii?Q?IPvbE+k77egwiqB9ox/dFdYI7cKS49VMrSLwLMeA+kcd0TjxzHkp8LjTuH+r?=
 =?us-ascii?Q?dYBd/Bi2ZB/yeJiEmnsaFB8qVRVaobU32Vucpkroe4/nP14k7ID/ycBdriNQ?=
 =?us-ascii?Q?o5mVChKyJRbrtCQI2D75tUrDsjl09T7U4BDszhIoz5qkwH8MwzwLr+Zg/mX3?=
 =?us-ascii?Q?NvcU4/XvybmWi6pw3KuEReLsBM7W8sMjkwUYlLmaja8Wvyxhu7s8JlqUX8lb?=
 =?us-ascii?Q?/JBVvOENZ6VjSpzbKXCkh4VSRHUj7QXLJrjkJz8bazItVrXbyKkWLNZM4pca?=
 =?us-ascii?Q?A/G00wIg/CzEo1Ln3bfhRlmowNT4XXDU1+Wub4CmCy5VKVdFBfxe9ch3uhBt?=
 =?us-ascii?Q?BpPWKN5bhvUkTlXhtSCw4vLYcdN7R5f8EsG3fsdpxjjhVbv9taWiI2I3FnkE?=
 =?us-ascii?Q?ZIgE2JWhfDkiUoFWXEFwrvj6b9R/yqraA0uhU7SXIlvm4UvPDrdvyIQCU3OQ?=
 =?us-ascii?Q?Gs7TLd6ei4RKIGytnrObFogbsdU7x7SOIzmZr9CiwaJ15xTKy4QKbPavgGwy?=
 =?us-ascii?Q?eO0ZdNOGP8qHBl9xu8t4V1FnPMSBKadSljzZt7Hvvp1PMtNl7V8qbJdQcxyy?=
 =?us-ascii?Q?vxzLTvgYv1fZBaWWUwtor/SFGFR7ZZ85?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1cuX9DFOeHb+42E+OI9nthzCRv6RBE/wF3pfTSkGVE/5otj+bitQRKm43WaB?=
 =?us-ascii?Q?Wnwz4sZ4vxziY0J+gbtE9aoxVOPWbpDS+NSJ0w0ijhjHh1Evu4KlaCe9hGzn?=
 =?us-ascii?Q?YelcfZg0YsWSdhACvC64mvQ7Nt+hTYCFpVmg/PX1jAUO2Mxky0r5ZGUeDFfd?=
 =?us-ascii?Q?FtO+16mjLVeVNNRzFJoWdc8/gQxmASlVTQ20kwVwrkZF92gYOx4Jresmv75t?=
 =?us-ascii?Q?xjXzHojcm6WMbfIuc6sFzrN/OV751OYZV18pJLyG6byOgG/HrUr3McVilt5g?=
 =?us-ascii?Q?1q1g4mIV+xBfJKh4SqUUPDnE/oPPZt9SeUIDstgKKCyNZL/jv9/uNeJ7GL39?=
 =?us-ascii?Q?H47tstrJbxtZJmUAqBaFxC9aLHbfRNMDfK/dllhwuu5UopS5sOjQZEU0xQDf?=
 =?us-ascii?Q?4qyxmvXaOU+W9OMjsMlnI1c/nXctemysClysPZxaPdFN2UHJCgcBPCf36lCx?=
 =?us-ascii?Q?saRC9MHB+hYgMxyyKepG4HogfcRbXhWW4aRuHqwbYfUHA69MlXZnyej7bkGW?=
 =?us-ascii?Q?z6HHK/nD9NjB9emeNON+r4BDRyGq2M1svdjtnDl1I9MVA8x8EEyPvUSh9u9N?=
 =?us-ascii?Q?Wy9J0905yqNh/o65COSgd+hVQMQROwG8Ai+o8R1DHmO7pCqVEvc6WCw7kIWG?=
 =?us-ascii?Q?Qz/pt06EVp9rNrACxCSYIGfuCs4AGihTlN1j8+f45Ycnpzby/e/4SGUFRdh9?=
 =?us-ascii?Q?fo4nhZMOVGjVOBXnrkxIajGA/kY19bgLJbGJyD+OMQvfGIy1rs/6jFjV9x5Y?=
 =?us-ascii?Q?pAXSgFSAHNtLI7ypljaW+8nDYe6dDEGapj5fT2qju1O8B2FQcTpDISgghvwP?=
 =?us-ascii?Q?teICEUAKRBEfcb11DK9ucwZ4pOHYdsJYGceJ2O77f7T68JDmKGUigXvuIQkJ?=
 =?us-ascii?Q?9Iw70C6WJIEOh3QBWnmR0ttidE6juLSMl3dhayS/c2UrQWm5Ai2/qq4xK5Jv?=
 =?us-ascii?Q?r7luzExd+5OwMdDRHf718snzB/XZH3t42OEyrbzbAL4HS7BEK7sWH2QSv+/4?=
 =?us-ascii?Q?rp06hJbbbuxaCyW8XE+YAjHVFXJaRFQQy3PhHACZW3ULXggoD0B92KauL3dk?=
 =?us-ascii?Q?3dDHlnjteG/ajsfczn89zXEPrTWLZuFzGp4W5FFGCv2jjcmGOVONb4oklw+b?=
 =?us-ascii?Q?U4IJ1e/rvVWwSIO3XkEWSBrMRD+xLhaiHpVBqh7pgb9XipMBQBpJkdTRS3QF?=
 =?us-ascii?Q?dyk3+/mX/Kee9m3TP/w8ATVlOaauUIdSKPo8sGx62aE4OK3elmg4OYQKmnJ8?=
 =?us-ascii?Q?IUhC//0+Yh1HVRYPXSLxN9bq0kyf523RkpMAz1jLKaJMDY4NM125MnIWoN9P?=
 =?us-ascii?Q?0j2Puwjhr7/DgM5Z/l8bs+enQMJCqySqLgBrycN6vBB0Kam03U/xp5BQkfCd?=
 =?us-ascii?Q?WFg3SvMUiprzWgkFQMzgocKD+1LSvyQxtl1LCjPDpJgWtejW4HXgOXXd+kqP?=
 =?us-ascii?Q?FEDrqO/HU8qR9dgrzJNV5Vsy348yqRUupbAFtjZC5e+4tZPASUVFM6n3suKX?=
 =?us-ascii?Q?MNUmW62xr8B9+tBLv0Q/0dhpZaU8sXbvYxcLQfthAiQ8RLM85HBeaO1WjOmH?=
 =?us-ascii?Q?rGLlK/i+yAWj9+SS19cfITKg8P6AWga2WvzYxeGe?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985c2ecd-c3a2-4f27-625f-08dd5d5ae6e8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:56.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8G7r3HNAELx2tq/CEJ9Px+54eN8C813bXbiSGMir0UL8kBMLstEHb91gtISX7DIlY3uwQUa8669UiQKKOtFi7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6630

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
The same holds for changes to the V4L2 controls HFLIP & VFLIP.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and issue a CONFIG_CHANGE to apply the changes
immediately.
Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9a49dab65180..65b9124e464f 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1098,6 +1098,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	case V4L2_CID_VFLIP:
@@ -1105,6 +1112,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	default:
@@ -1286,6 +1300,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
@@ -1316,10 +1331,21 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/* Apply values immediately if streaming */
+	if (sensor->streaming) {
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


