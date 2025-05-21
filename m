Return-Path: <linux-media+bounces-33050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0AABFC55
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3E947B5677
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E4828B7F1;
	Wed, 21 May 2025 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KAWAqpTu"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D828983E;
	Wed, 21 May 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848892; cv=fail; b=ox9UaSgcN7LgbMnlMVpIkfpWTNIWEzh+5/obys5BlhDDvPcDNYo8+/gAEBNqjA5DfZf0LjDD9pQpKZtKaKTe4DrNmsucNgfp6KC5gfKEah7zlPEnQOooISzQnro7+9oRp3ol3t4SA5F5ol2Di2gGBn4AZJiL5rWYspO1J7rYgWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848892; c=relaxed/simple;
	bh=yOMZBF1bZO0InEI5OyJmTp9PyQ2dhDVFCVm7Am+ZEPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AY5BrUADjUzCcBgstWGeJH/fuYh+kLcHs8rNH3TBWE4YWni1tCW5vt6yAAfYODflspjbgHQUUWMT6szB3ppdlFeiPESw1cVK5uvEEkAgG30PAGkR9W35THzUszvExo2AMUxm/d3OPU1zDkrYRCkvtygHuM4MTb8uWH/9WmhvZkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KAWAqpTu; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJhrFxOqVPz4OGJqF9iEcb5I0NyP4PNUqLLYFvnq8n8KJLY8dml3t0+pei3/y9iKgW14Z1/rXa+WfUVeX0IXIqZmfpPUI2S8cZoceT34spU3k40pwqhccD0daMUIyUU12GRWHKPklrRMr42UVMCvXRftHhshxXdI4qwWKJm7qO50Iv6H5ChnRzAVCyQApMa6cLqBLzXb4t8jVfRw7Th6/CbtTFJNj0PMHzkpOI3FE6pT3kjriPLJBffkF7BsLmimbF9U7mwbpkPRPWx9LUKIDeU8IPXtJCWbKauKXzqTBHsJUOnE/Nx7B+Iy25kDReKS0DkvYNufuhf4azSYAIuDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H2K9NjEnn7Xzxm3xgWbGZBc/JhO3UJ7ePlgGmrHrmk=;
 b=qBLI+cZFLkubKchtsgylNjKRzOttlox3O2BQP+Au02XFEhL3UCN00E1fa+5BxMSNXYzl9lGtNe1fLmYweOLmnvivr5YVlSy82uS8iK4EcwQ2HGexOrgAfmJcu0pcLUlw0GdoE4c2mSi6z7IGrcKkQEqp0R2zUmOlFv9luZDZU6aci3+RxXO/YDgqzHx4o7uKpTUXKITjA008/Kh2fb1vfXWVC/8h2jiKhD6gCPX6l+lwfjvaURFvgr/idP2Xje75WJXCFwb1W9ScYQjm7RMZJ/6JYm70jwZFNcXl1PPbx4Cb7qPY6Sg+daVUjN/uMoHUKq1CUGc2of/iPWgYUu8euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H2K9NjEnn7Xzxm3xgWbGZBc/JhO3UJ7ePlgGmrHrmk=;
 b=KAWAqpTuZGEGY1tjvXL5u1t2b3c8b8MZ4M46gtFZHnvs8uVwRK9lKp+fwyJD9SndRBvHhETk9PUW1/rbrInxM1dGuKp1DSiB9Cl3c/eFnuw8xOjXlVgeGG7mp85hH3YMLEX9Lx7cVisUxbupWiKF3U6IvUwxDBLmifYETNraSQhzgSBDmqzK5Ti71BOJFNP8X/hMg0mlK5zTEP7aoFc6fJhGV38oyHjxaoWNumhJyWq+4Hoqkqk87bldKc41ftkSfjReaBCS/hiMkayvGBLvj7Xr9DBU5VjwuUPOEQYmtAFGXaXdUjDoFVzaLES856sUFX98J5O40UFSpcI2KHlJEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 17:34:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 17:34:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ming.qian@nxp.com
Subject: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add compatible strings for IMX95 JPEG
Date: Wed, 21 May 2025 13:34:03 -0400
Message-Id: <20250521173444.310641-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: d182a602-b930-4317-fb04-08dd988dc875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JoQpvxKd5f4OOPoiM6nur8zuBq+NKGTfqGmOQGffm6L+sBNl+lKLdvsCoQWQ?=
 =?us-ascii?Q?QCB/jmhP+roDAY9lyrymtmWYnF4I+uG16HE2rAKKJRFZUab7slOKzvYTuBdm?=
 =?us-ascii?Q?RVn8uOptPwLvjmqiLvo4mILQyDGG73NYO9yxoHj2UJqoLX/iSuEnVG96+1T7?=
 =?us-ascii?Q?h5TKoEHI7afQckIszCHiqTmhdZoK/klr3VDqabbYjNUTM6EbPCRltTDqSOpC?=
 =?us-ascii?Q?TyD5OEZEZEWVEaS+9LNYj6cePdoUF+KzKNU0lzQgMA/T2gpC7wANqsfvKbhc?=
 =?us-ascii?Q?Wi5vXpBor+eLFBL2gP96r3erBKSbwFXhGLiYeCNnhGVmhiOs1Qo28LWGWxn0?=
 =?us-ascii?Q?WqvND8VThgmW0/ab8uCtsI4DhYwnkCsP6/T6LkVDzoNN9xIV2G/LSEZjr2r/?=
 =?us-ascii?Q?ExeCV3e8SLyQbRHxbxRNAXItLFeuNTimbCjwPRKMg0yF785B0mugBnKAg9w5?=
 =?us-ascii?Q?YXu1Top/zszOw2vJYVNK4/1eXLR+CVfvJO0Y5Ysf5uUJd8gF0W745vO16hGc?=
 =?us-ascii?Q?a0ia5kwY9B76a8LDZ+ovR7oKxI1I5frX25Qo4+onLlLOg3Re9YEInXRt6yiD?=
 =?us-ascii?Q?ANHnClTCbtehF2qFjR3EPKD2YCN48kGtYT4gj/jlAzbaSWdpgY4zeg0L0N6A?=
 =?us-ascii?Q?GMkVlKx91NhzioMOQJoqjhQOzYyaKzNVzNcXXyFi6qRxcpQP9k9JiTyDcilU?=
 =?us-ascii?Q?9o9q84pY5ICTjo2F3I4QvB1IEF4F0tc0Dxu8sUzGF9UDj6r55oVPOnzGcsI6?=
 =?us-ascii?Q?ccmNMQO87sZTjx0PkaGUlEo4x6Ly8YFPI1rk2QwgrlFNXrFuR+KEwwBO2h79?=
 =?us-ascii?Q?fmoV6/bjGwHbUg1n7GmPUpGQe0ApagmFd57qhgLQsCAUNagN8XdyDBsouU5D?=
 =?us-ascii?Q?Z5XQfz1zwjPKBSPOJLMRj0SmKgR03bDWchbD4u9C+OuQh+RoTGmG+nmX3T10?=
 =?us-ascii?Q?QtPw6eoFyl4Ngwyh+zr5xq06oPd/61AsUpyX+DRvlPsPnZY7r8Ekd1vdOOJ8?=
 =?us-ascii?Q?YoTpf31ogbkU7zDq4PiPeDoY/hJjudquoMkvLNNYMaZzuGuU4pMVIh5JyWOr?=
 =?us-ascii?Q?0E4URnj21PuJiKMN92/pALbGu22MoB2QSETO5r4lImTj5Zo1m6mFtOAHn0SG?=
 =?us-ascii?Q?kFyPdN2cVzUfYOyV89F5asEXQWU4q0tuzZIAd3Ki9Vq2NwRAf6RY9VJrwbmi?=
 =?us-ascii?Q?5PP/b64ErwoqRyeoUQ4+FQ8yQFrTdPEW0xt1fw3XseswaRqWn4EUvuqBIDSR?=
 =?us-ascii?Q?PmgRy4oNxk/oOadl/Yj/wgHMYDL9fCcFpB3oPv3zSmQaJQiQsKeYPq/TGQT7?=
 =?us-ascii?Q?yxvvJmAbFgLY8SYHPHHHS1aYSG29T9/cxrzDR7eZCjcE9dArHvgqjV+JPIS1?=
 =?us-ascii?Q?0wAMdkcfVwRl8WAf7FV3Es9glAzr6PozNHppw/xR/KSQyM0mcouHqMImccpE?=
 =?us-ascii?Q?OlwHtMYYTxuNI2ZSYTkoQLH6idragiDjGrejVBVLDWaHgwWwHp+2ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AoWDQg9F1glVQHo1Msk2Z6JAX+yLwGOC9PC0ndnUYD+zIjIJBN6i7MDCSHt?=
 =?us-ascii?Q?kFCpKvQwLpSGf5VDH5J5DBbwxUcWHKAy2RtNiV/46RvK4i2me0tX3QJW609H?=
 =?us-ascii?Q?poiLv0gHKzn1vv+3CZcP3NBEdzcqTypoduVC5KOlNycZbB+6Dv64O3mhDxve?=
 =?us-ascii?Q?gh6RfQ3Fc7L1R59HZxqW0K+IDj5nN5cU7D6jJ2NpfDGiJtJL7yXeqoaL+bxZ?=
 =?us-ascii?Q?ODektEFO2cnsCwpCM9Oo0hF3JY3wpWqS3xmnPmnvWltsCI8oOl7EneeVT4eR?=
 =?us-ascii?Q?In0N815zI7WmDKxScuHsadbqETDglUOJMaJh7edrgSpVF8H/y9wBT/OG7DJM?=
 =?us-ascii?Q?DRhFOb7d5fnpnIJ/d/i2V/fjx6g0CTwkfpAugiMCyEEmIhnAZTYvLfiee5Oi?=
 =?us-ascii?Q?P8ZYssEd/Ngt9Zj/pPqpmsvwbm1F5VNbgVw+jcpP3aqDwiAfYI6RiEeK/xKI?=
 =?us-ascii?Q?VuvcWIeu/AhIqROkLURFAPqWK0EsFO1cswqqYjovHaHCIHv18JVpoITvrtiS?=
 =?us-ascii?Q?tQHt+8Wr1t7iqrBUQnUf/m6OwJ2NtwfjvWMfbLfIgEnRiTsWBsFuum4cQUJ1?=
 =?us-ascii?Q?bF4tH4jmUFdyb+wBXEYVMbvaPmBr3DlHmQRmyTfFe0bVuCUQu24p66JV1Xsb?=
 =?us-ascii?Q?oWlP1QaBeREEr6u9WQnfuaCk1AsJRph8EozEAIWh/3FX3aHQAi9FK4N/IS1V?=
 =?us-ascii?Q?ZJ5Qa2P1oaZmTzuPrw+X0EB9Nu9nbLVCEZ9bSiWul7brtcoldgWbSzk78BSm?=
 =?us-ascii?Q?Fi/FcN51mDaVyajcN9x2e/vEjWV0n0Fli8lUAMxqKzHUaBjb5yn6SRWy1LP4?=
 =?us-ascii?Q?+9dyHWRPgZAteZT0CV8NVSfmm3ewWCL1rh9igKY58EYq/c5nVhZbtD415AOY?=
 =?us-ascii?Q?CY7LS+hCsyHYMGYaMAvtMzTG7kIGATMleNlNNg5Z053UwE+lw2nDWInKQPqd?=
 =?us-ascii?Q?h0e31Asj8efZNzP/U7VhkDvOk3WVmR3c/BpOuT6lgC22kOK11ey+Oh38P/FH?=
 =?us-ascii?Q?TtwyuI8yKgl7F4tz7eWaJo36Rq07EUdISYEfTuww2z7i8jtGgAfPJ5JA1+6I?=
 =?us-ascii?Q?C4H//WN9juSAgpFoioXZ6nmERc/Blg4GPD4zKkoJUD5Up7APiP+pVaNncyz0?=
 =?us-ascii?Q?XjDJRaaMH5r1rUeDmTmtHdQC3zFIr/mxrABr+cWFJfzvNpT8j5JBv5ZvX0TN?=
 =?us-ascii?Q?2JXTH4JV9KP2lyjCV6H/IGRNUqRQRiQdkRDATMGwpIdjE4kOokWFLS71ee4y?=
 =?us-ascii?Q?ymRglod2GeZeAxSMYFeQIrLa0Om5VK4lTSSngpqNHmk2imhVbWEySrvJyseQ?=
 =?us-ascii?Q?dmJ1SzRWtmhXBSkh1GRyEAOlLcFLn1czCLmT3nV8zb91o5P8I2DKNLcUDa4T?=
 =?us-ascii?Q?oJpYbmjJKrvXfSBAuJx3pU91nysYkt+sVmzGCp3JFXgVLUlsjLxGc3jkZvM4?=
 =?us-ascii?Q?e3fpVDwMrl4X3IgOzoEXaWzUA5bBQWIGQRyJcvydAGPRtgdf3WO1BWeZ4irN?=
 =?us-ascii?Q?tCO8XNIo3158XYhxPNXb21C5zgFgnq4h1NBxw9Efg56DWC2SR6S3EhIgtsV9?=
 =?us-ascii?Q?MapdXaI125Jxbq7LSmqCyMf59aDjUi+grq8h/nQb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d182a602-b930-4317-fb04-08dd988dc875
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:34:47.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNFW4bVxLYlAt6dAKUBCBv3KHWpwDKTW/BRb2doE79suQPtdp6r4ihcsYFePIjoi579q1QVp65RN8KlYpXq3vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389

Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
are backward compatible with "nxp,imx8qxp-jpgdec" and
"nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
wrap and all slots together. Reduce minItems of power-domains to 1 for
i.MX95 and keep the same restriction for others.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/nxp,imx8-jpeg.yaml         | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 2be30c5fdc839..4cba42ba7cf72 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -22,10 +22,14 @@ properties:
             - nxp,imx8qxp-jpgdec
             - nxp,imx8qxp-jpgenc
       - items:
-          - const: nxp,imx8qm-jpgdec
+          - enum:
+              - nxp,imx8qm-jpgdec
+              - nxp,imx95-jpgdec
           - const: nxp,imx8qxp-jpgdec
       - items:
-          - const: nxp,imx8qm-jpgenc
+          - enum:
+              - nxp,imx8qm-jpgenc
+              - nxp,imx95-jpgenc
           - const: nxp,imx8qxp-jpgenc
 
   reg:
@@ -48,7 +52,7 @@ properties:
     description:
       List of phandle and PM domain specifier as documented in
       Documentation/devicetree/bindings/power/power_domain.txt
-    minItems: 2               # Wrapper and 1 slot
+    minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
 required:
@@ -58,6 +62,24 @@ required:
   - interrupts
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,imx95-jpgenc
+              - nxp,imx95-jpgdec
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+    else:
+      properties:
+        power-domains:
+          minItems: 2        # Wrapper and 1 slot
+
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


