Return-Path: <linux-media+bounces-27456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F49A4DB12
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A07A7A6032
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B26B205AC0;
	Tue,  4 Mar 2025 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="jju6ZoZE"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DF201246;
	Tue,  4 Mar 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084703; cv=fail; b=neHJY72crpZN7/WE/GGYfi4teTSZ4XJLB9vIqa35ep1P207YEoIGw8Uj55WPScuopnnBdcNU8Xt1lozJISZAoj7qQfcyq/h3whEG/6Tnmgo10Ie7xmhoM0gra1Jl7Sz3LX7OSiGrmk/KBT5a0/0dkJVRLvxIDg1eKlhSHs94P9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084703; c=relaxed/simple;
	bh=b4fK+edd7YVCZxJCcKo6w0HY3V+2FHwEedvNTjyN9HE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lecpEC+a04ZhtaibIkkXXnDitvM6rvp9Agy6qvWs5O4g/E/3iSh8kHCrHyWdXTAZVNgUbhgzn5X8fLyoHnTHQa9SdYL++/3XGZ3cu0ay8k2zyu6fbF7X3tfhOrLf1zz4yVHJCLTVN7xopTlbEh2KL6FwGxZlplaFkuSSQ4DANZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=jju6ZoZE; arc=fail smtp.client-ip=40.107.21.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgAhC7patcVDk4kzfoqlOk4cttetzpv4PiVAxi0s+itUI6yjIRpENX6mGDtLIeknXxIk3wna/X1LNI1larER2cBfmJF0rtYY1xbJqkafom/IP8i4ZT/M6222vSlSjwqFpCtNE0r4eSn2Kkb59aaTVRMzETzzk2fSjTxgj35/XioPsIelgGHKTPljdUk3s/FYU+7jNpfFQtxG7BPb6epXgkypFBFuaJof0/0clEH66Vgmf/6k/tIUwFPYTWzZgbo8OtfeAGQPQEMXrdIfuMZUDpkpVJE6xbpGUm44of2Yh48zZRF4eOEEfjQ4rKNkUHTlK/9l+d6GEyw1cKwBj6nC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoxEMd4lbmcZ0AjWQ3GTKbtk/B6gzDYrVvjXL1xzn18=;
 b=iXNd86HfM7axKI4dQ2XmezvUklnZLiHRCbTHMZ0f/SDQObFOFPm1vVXFlbabVS8MQX1Aqm/CxyIPtAz7dvlwfRHUQfb2FfY/GnIm2tMKuzJSVDb/e+rSjcHnrZmoVGlBjW3bBA+TWKDp1Q0KpguYUREFtKcyY/xQxEUX2wNUTScXfvLI+1LIagBHAWGesUnBLZ4RBfrUzDt3PomTenYjlhVCoMv+j5U085+/jGMNuGL3sAuqlNw7R7LcTIrpNUtO9IltMmHQduSSrdjUNoE0CnYsE/Lr4REUg6rE9SXRZk92Lu42j/iwIR9z+KSvzhzc01KDcyomX+iwpYrU9HrDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoxEMd4lbmcZ0AjWQ3GTKbtk/B6gzDYrVvjXL1xzn18=;
 b=jju6ZoZEWEWT47zCWwTw8kKw3uq5h2G/Lv5zkbhUzfail8UN5b/c0B5FFSbHTfcMDhIM8q6ExTZj/FD8GldFhHGtILWIS2SMe1pExBoHhkwCeBb0tYtN3qTwHer1oum/KXvs3+PkcY0KvJkT92ZIERyi24n7ivmO8KYnjuEfUcjvuWZ3pW0Pzf9DaIHSdMSE2N+/rxb+f5yzWSDsVGnp1WISPss1ZnJsoer2ArxXp0Hx8gtEED9PEWpycvyLEDruLc4a3tImr1DGgoqBZbyezB5dOFhKCEd/uRq4ibQu9sQL/STTLWDfvbPUADJlvnWHdO0ADRf3nPvmT0mHNG12lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by AS8PR03MB7383.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:38:18 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:38:17 +0000
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
Subject: [PATCH v2 5/7] media: mt9m114: Allow set_selection while streaming
Date: Tue,  4 Mar 2025 11:36:45 +0100
Message-Id: <20250304103647.34235-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::7) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|AS8PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f644417-1c95-4c31-f422-08dd5b08acbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tih1fb8PxX4qXBz9KSkO6DCWv1UNkxJXN/wjT0DstJk8V8AzTc4obYJk8WNe?=
 =?us-ascii?Q?ek9U/WXkpjyKkLFY60227BPYMaGUaorPTW8HQbU5soNsvBjXmyvkzOyLCLIX?=
 =?us-ascii?Q?9ADnav1fK7V9M3rbSpI7wtoBTtHFJyUfCC7lUzdzStcb2jN+wuV8YSz3EW3m?=
 =?us-ascii?Q?pWy46zTucNzy312xb3w4ZBPvXKCPLzoakD7LwluzGnNuEhBNT3uw2bW+IXI8?=
 =?us-ascii?Q?ThpL5D2kv4MkoiSxGZZL9qOGjvYLFr7f/P6nc2me9LuLv0qhaLPTDjmyeHzS?=
 =?us-ascii?Q?Bk8vfMxRiAlXL6tGEqJPPePcdOzXnr77IPm7TQl4kvMHnkytmtKJ2lOANAu9?=
 =?us-ascii?Q?8HLuJJ4nAjODhzcRDDHuHJcvHXBL5M4S0RcsF6EYjkgIBTnMoT3/OEUsjrYe?=
 =?us-ascii?Q?vZTQHWY9cXmBCA22qHGeiIyJjjiS9xQ5NHV3hhGqTNOCDPBauZ+0IdXEm8Ai?=
 =?us-ascii?Q?CjoeID28T5w06D8BayapI2r6Is3wV6QObUUcJ+JSsyi247n+wn6H8l7gHiZQ?=
 =?us-ascii?Q?qLJTR27l7pbQB3/+X+d3ALrX3XuXep7BOnubwlKfgdZDxo21QFiyXWIMrZo+?=
 =?us-ascii?Q?t5gAmz07QrccAE0LMnpsUt/49emZRL+BRGaqk1zHrcAAznUoGNe+we0hnmOB?=
 =?us-ascii?Q?690kfx+YsRE+TdYzPpOL8ycvPSMfBAYJl9cbvDGKjs02PoREzVVxGU3F0pXr?=
 =?us-ascii?Q?rp79T91ZhwjZNvg4/u13szVNjkBQ7ovo1cqEdbBqHHSY5bat33cSY5gI2+I/?=
 =?us-ascii?Q?K2jDrqjU/m70O8xzqN2KxZqo20mfyKYugWl1eFv0OlpjH039GfQla0nqbZJ3?=
 =?us-ascii?Q?NMXqTX0zaHq+6MmpgwaPvD994VlBg0XK8R+dF4J++TZF5AvMPnK7neQpeDo5?=
 =?us-ascii?Q?utpTwfmw8YXuz6xP186d9bRV4PmT+q21TdQ3Djfpg4ik6clzbJ6RIS0BN/e6?=
 =?us-ascii?Q?qZj6+Ur9+q6DFb3pDDg1GlXBbmkGp9Bh+8UdlsRvX9Q0P1nS4HCe4ahAEvbk?=
 =?us-ascii?Q?e0P6h+6lsKZzR6wYaOvcYXANtMoAKwxlOGufPtyzyLaL2MlPWS2IZptrvwgo?=
 =?us-ascii?Q?sZL24mkJB/vhMiTs30OGU82I8WXrFRe5dGw1VGD+rUjna9mZ9DbYP0o2ToQO?=
 =?us-ascii?Q?k5CF1pzgfYDIVPYAFomYJ++Y4SyOZU6j545mprQa2sBIMYpTR3z9KqnZaAAd?=
 =?us-ascii?Q?jnlXH55kgbGYNzV6m1gKTvE5kWaFk/U7OTFIGueZNBlUlZ83eCk+cMlDj+he?=
 =?us-ascii?Q?rd9Z3wWtJrBsGThsLxRA1i8Bmp6A8VsKOl2QaUb0v6vlCenV4fJfugatbSMJ?=
 =?us-ascii?Q?FOKK+gTd+PFct4AIhsmb/5ltcBRhMih4SIz+tpV0d1BtzMJPqGI7swBFCCvw?=
 =?us-ascii?Q?t0KTs+bY8AwQZgvGwEEatmN0H30DbXmaoPBg+uXh1MCrljWRyh7AV0rLGsWz?=
 =?us-ascii?Q?K5J5ZfCx1aA3+1Gcxh+FEixmcYGtxyaN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KeKaCZz/SrUFHC466YgQmZpGueuHaV2yGpHZUSPg3iVnbIrb9T+ayszYWoix?=
 =?us-ascii?Q?FmLV5Rs/s7vy0SGUFwbdqF2zrDSsRcKaZUHJuCrSBN1Rs3KkFD+U9N06L7BM?=
 =?us-ascii?Q?fiZTNYykYihJtvPpIfQ/ZkqX11qeLKVqYYz65TyGmR2cxjs8cPwenDOWhv3w?=
 =?us-ascii?Q?HR9SSxme/tRgVo8DJaxKU2fU8c/0ajcfRbCU22MqKKxx0RG2+j65heeh6dNa?=
 =?us-ascii?Q?9XLIaUJEHLq0zYHX5j2AnK/jZ9VkrquZgr1m8Muftg2fLWGhktCuAhqv4N3G?=
 =?us-ascii?Q?6r5YQt3Po/nOlj8tBbAv8gzdE6NyQ5VUBgH1cNMl5L4kHtSdK726d0CTBd9g?=
 =?us-ascii?Q?v06FbuRi56X9fRjfC6gqmQQDWcb/oZ2wa7wlFOfOdlhb0dW67o8pPbwf3VyF?=
 =?us-ascii?Q?NT66pMcBcjH9lBtusq9Nfn3tqyyUQh9rUx7MIRdBB02Dj9wYlpbhKfcRJk1t?=
 =?us-ascii?Q?7FOHxyokrhJkQfpysRdSq+annUZku0q+9KRT6CRwdRt9jUrPXQ4OYBaxj3qj?=
 =?us-ascii?Q?Wj5nN/97jmo2Ca94qN09erf4N+Zb/Qg693urgVcargBiiNccFi6vbH6Kjri/?=
 =?us-ascii?Q?3TzXz6FpzKWMtJI+y5ewqn57qFaSFqHoC20vG8j86jX1Sz9IH3kY8o5XRBfY?=
 =?us-ascii?Q?OQjCD7hbjyE94snVzn+LRRSQUSXCsBdGuSsnHv9QiX2Yf/4InJxFNs85Dtxn?=
 =?us-ascii?Q?DXIdpUeeEGmhmIbr5pXobTCgFVVU47AW4JGkakazXel9Gu98aYaHw3Jz95Ix?=
 =?us-ascii?Q?cxUyoeMQKpkG2f4Y/b2sVA3fqv6JDHXBA504LifB8V5AhiegGlnfprPS2bA1?=
 =?us-ascii?Q?OQw0kp0CjO5e9Ntc0Mb2sXfAVpXVbsso3YyuDV8ijvd4UCiAArMDGDSv4n1g?=
 =?us-ascii?Q?97eejwfZrWJpxAhNcJ1E1zuDVSAuZT3O1YHAa6nTLZwui00hSKCLHJ7XLegf?=
 =?us-ascii?Q?hcrHut8oyPExOlb268f1n0e+v7bdIF7mxsTqM18PnAxJqr7p0URff63fdXF9?=
 =?us-ascii?Q?1uSABwCAacxkSB6clEXC4Y4aeNv3WfyCrPGaBF//f3AGFKvsrlpLF2x3MeL8?=
 =?us-ascii?Q?KHO2Jv68g01oQ05qgTl9mRIjYQfkibA72bpqS2F4D46FB8iEiTa9xFOQYr5N?=
 =?us-ascii?Q?xKtCF5Y37YmqAWBrJPToU9QMWqap9nPm091iQArVI5GGd1M+hMvY7nZjKBmX?=
 =?us-ascii?Q?RmE6p3VxwaQToIEYyMtYbXoaN2GSsU1CalhUeoSV9ezbNyjCynokAckNu0QD?=
 =?us-ascii?Q?WOml7AE0/09PY4p9+J96s4MJh6IeVWbOKx2zBv5XDPXTfR0UCQpdl5K8sZmb?=
 =?us-ascii?Q?myHohuqVONFAhxQsLtTrOfB0SKwOBvi4losaseUGWjhHVf/2YdwoKaiYrFyD?=
 =?us-ascii?Q?95jXKWIew6bXjWQas7uvHo2D1EXAQWYpmRA59Kq9rCoJtzwO9ep+rK4X2n6v?=
 =?us-ascii?Q?84ZRMQ9IaSrsGNlx0VsEmiJ5JPLfbPeIMr1BY9/5XGwSkuZE8+aguoElOalo?=
 =?us-ascii?Q?NZqQv1wGFQWvpDYVgH1b0feuKbiVKgiy61se6bh/7duTFluLuOzNMGdAlT89?=
 =?us-ascii?Q?oKKjyD9GFdtLqTmYdoBd/P+nhPk/QWCp/2/i9/1L?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f644417-1c95-4c31-f422-08dd5b08acbe
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:38:17.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uErpPuYENAvq3yITVWScmPje8CGAP+s8qwtXS+aAqfN5uYbyykZQRFhGHK3T+e7jKFDB2JrZghrSLUT/YVz+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7383

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
index a91bacc1421f..18419de6491d 100644
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
+				MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
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
+				MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
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


