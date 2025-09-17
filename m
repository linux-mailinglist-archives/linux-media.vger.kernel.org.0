Return-Path: <linux-media+bounces-42648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97BB7FAE2
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 16:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639A71C040EF
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92493081B7;
	Wed, 17 Sep 2025 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Acyc673B"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DD2306B38;
	Wed, 17 Sep 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096934; cv=fail; b=BYWRqDhN+8fyYRDUOPj6DQ/mUQY1F2yKpW4qb+XlzrBRgVHZbr6NF0SYMmJtjNJhJyrcqjKH/bK0uhuJEwcR60DMc4LmihJl5L/0pVTWItKb5iX3k6ql+UnukiG8JjL242WQejRzxLEM1O5UCUDbOdnDG2m47Ub5zT82h6TNvmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096934; c=relaxed/simple;
	bh=f24UoovrQXpK8Jhefp6gzJiH7VIf9BTAQHIDgAh0IyU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hrirNxSGVlBct052lMjTJGuPr2gmgmbSp4eC45pDgsAdhp8oI2w6AoRedCBpO8m0Ec9UBjwCoyPdl/6M2n7Cr08gvPyCFy3xtPr0ZBpFIE4+uamzt2FxUU8UcO5bDtYhVfggW0I/yJcS7s5Dv2fusHJW7XuMNTkA1wRMtLBTuL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Acyc673B; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3dg7AL74huEwZ0OxN9S7p5B2jOj4i74a6T4cawOR+oDQ2iIYbefzppJvKKb0F8QEeh7jLFmJWZg5MzpLRBO3ommPjfPFlkiPzWw7A0HW+uICFhIj4E+PwiM7cIgTeXmVf34nm4Wokr3fjunc02iMwxrqZCYB6v3+MILWGYAL2Tdi9+S3YS6vehVY6eWLEgoRXHhXiQxI3E/yV1fkCFQt20YI8+v0gAJaoQPGlUaqorLYRkDFsG1zInWs9vBMncrfpsYzzCvU3fjL1ClOs8Iqpu75MMh5hoz2rndMxPK1ngqyWDjF/RKMA2y9hhHv3uaKS7kZ4TpvOTWvP88hNziJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+Yy9qS3QzlzxNdqcVxf0cmGckqJvpZPm1D+S5UHM+w=;
 b=BSimEhZ4cjMox93Hl9Dv/XdVZ0IDMbg/XQ4I/G/qwK041P6f5Yf3+HhMMn721UZkpuXlP8aXybsCnqusfPJPiXRP05LhuIWzPwYgUgKeBuCK/wI6AiBQG8pJmr+wIo4UrZ0iWOQtaMJVbjaD64SZ4eTUF9fsX5MnxTDZ/ePy9SkjaAdTykG1gFNs1MjN9tl5zKQeijzVcMOuQ21vRgmxfQyw7jdGisK418yVaYbl3REvPkk7zD2mwkm+Ltbxyc/z4dJnPby1XmukLo+/Y020K5PVZd8hxJuy8rUIRS1fEwG46SN6nfkofpp5OpBwnsSJ5uwB25YrzGinvjdx0Xz4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+Yy9qS3QzlzxNdqcVxf0cmGckqJvpZPm1D+S5UHM+w=;
 b=Acyc673BWRR1nU37Z5N7sDzy+DmYkFudOX24J7KDlDZa5ZWvJvBxaiY7pVLcN5GTTGOTVe0OssRra9/X0jDou3ZkCig+mtQbMxKm7KRGYktSfDSbrerhQccWGmF4STS/VMHjhZJ4XQq71ynqVYH/navW5aGrtbkkzpCBefI+ZSGAp4HUIg+E9IjFggFfhKzL9XFKJul30K2jZavyabU3PPjzFVy7cl+yzoSRXw3x/SAyHVwe2R2FxX4HiIFfabb2aGOxDYWOySJOBpTxlkCEyIXNxBXtDhGCXAB0vQ3lSs45uP59YrYghqEXRWdi0MEAcvCepjdK0ZDpNdpg2RcIdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:29 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:29 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Sep 2025 16:14:51 +0800
Subject: [PATCH v6 2/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi2_imx8ulp-v6-2-23a355982eff@nxp.com>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
In-Reply-To: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=1105;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=JMKj+pv1nKAd7y7U+WzK+yPVWmsKn/i7C4N2fVG0/mU=;
 b=tic9YJc8/i9iOPvwKeDh+XYoBr/Sr3KNUsEbTfXqmmY/RtVXu4Kudi8UsLlLDP6IxICeP5aP8
 QdYxi50v9GJDztH7CTfIfF+mNh+3JXIvSOmjjCqG+8AWqXLBfQiyFhq
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 4447f2b1-8654-4cc9-da09-08ddf5c25ce3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?THh1VDlxY1Rkamc4SjJTTEVJclpjbDI2aDNmbVZXazFZK0xUZnZveXBGZ2or?=
 =?utf-8?B?dUhlWk5JOUdXOHhsenhnQjZ4bk16azZUUnloM1VmL25mV2ROZUxnR2tXWG9j?=
 =?utf-8?B?ZExHenhJSCtPSFRUNGdnbmRQd2lnQk5ZM2R5QjExNGdLUGhtK2N5VzZ0UnB5?=
 =?utf-8?B?eUh5b1VpcUJyeVg0cS9GbUhSWFJlaGNMSkUrbFhqYlRSdjVoR3FiLzRzRmtj?=
 =?utf-8?B?NXlDYU1ncEwrdnFLUjVIN3dTblJHdXdUVmFkcG0vRTZmMjM1UWwrQ3VRTW1a?=
 =?utf-8?B?akpTSjJjelpkNlpmOXdtOE1UelNJdHVHTFNoWjhFcjEyb1lUTGt3djIvVG1B?=
 =?utf-8?B?eDAxRjI4czU1SE1sQXpHTU4zUmlZK1VmWk1ZdDhRK0RaVHFlbk9Rc3B3NnVS?=
 =?utf-8?B?SWd6NFhDRXFiZSszSnRMWDRBdWQ5OTVJWVFpOC9nZ0VxZlB1allFZmNObEpp?=
 =?utf-8?B?cFd1NDFXODFHd1Fxalg5OFg4M1RDWFVzQTNYTzZwbU0xMFd3RWoxQjkrNTA3?=
 =?utf-8?B?NEoveUF6dDNmbC9Xc0g5QWpydWloVjBjTkgydkwveXp6dkpyYS82QzIxdzNN?=
 =?utf-8?B?YnN1NWU0eTljWlNNNUpMRytUeGtIY0VoTTF3cTBVcmprbHdyc3lyN1phTm1u?=
 =?utf-8?B?NHdJTERTSjdkUTg4K3F6U3liYVplemV4OXZ6OStoeTUyRGJMSmZPbytYS3k0?=
 =?utf-8?B?UWVLbk1MWXFyb1Fxc2VLQ0hWaUx0bGVYQ3RobnliT3lNY2l4eHZwTyttckRu?=
 =?utf-8?B?SWFwV09XWkxjcGt1Tmtsamw1cnVTTGlDbXVNOXdzMFlQN2RRN2paUDAvYXIr?=
 =?utf-8?B?VHN5aWYzQldEd2ZiVGdRdGxsNnAyYmlVVjBYNnM1NWtYTEE2N1pEeU4zTzlZ?=
 =?utf-8?B?ajBDVG1wUWNQQjE2U1V3ZHpWSXY3bnhpYnI4WHQvUnNPWmg3enpnazg0UkFV?=
 =?utf-8?B?bmxsaFNUV1BZK0dzUW1yRXpmcFJxaWVvQjNFdGhEWnQxeHVCRDQvTkNET1kw?=
 =?utf-8?B?WXBQT2JYMHVZSG0vdDV6NGxGMnhhV2hTN1JoeDhxZnJSWWxFdmtRVlFmajBv?=
 =?utf-8?B?ZUpjQkVISmJ5RmNNWGgreG5WMU1Ec2ZSMWw0K0ZuY2RSc0VocHdkbXdLeFlM?=
 =?utf-8?B?VG5ESHIwWWFEU2ZGV2loSkVmVVJKUlg0Vmt5ZEp1dk1GOWhwY3VETm5BbDAr?=
 =?utf-8?B?UFVWS0RrYkZtd1Uvdkg4UkhGLzQ3c1ZVM0RDQmhEMW9FV3V2VG91eXJma3dk?=
 =?utf-8?B?Y01weTFGTnYwdVNCekJOVU1YaHJVWCtoa2dscWlEWEIyMkRPM0MrVTVTcE5W?=
 =?utf-8?B?Y0htQUVmeUJQVHRsbEIrR2k0VitNTElxQjZYNHR0ZHQ5K25LYTczeFpPdytU?=
 =?utf-8?B?ZGQwUkV6Z3h2TzNUeDEvTE5RS012WmJYRDVLRkRHZDdDc2Z6Y2xmdURjbG1u?=
 =?utf-8?B?UHdCd1hIOUhTaUJGaU5aN0ZnNUQ2N1NtWjIxS1cxU2g3YTZpQUVFYlpFK0kz?=
 =?utf-8?B?d0ZWbDFsQUZ4ZmgyTEk3UDdSQlROQUlKN3dBMTRrZFhNS1ZlSXYvNE9VNTMx?=
 =?utf-8?B?RXRraUl0TnVQR0Z1TEsrVWpRM0ZhOFd5UDdnZUtzcE1NT2xGVC9vMDVPZisw?=
 =?utf-8?B?SWFKc0h0U3Q1cGN3RWNkYTdqQ0ZacjkvejF0UnFON3lEYTRxQ3hEdnlpQ0Jm?=
 =?utf-8?B?OHVpZXhjem1aYzdVQTJLMTA4QVZaNUFzUEN0cXAxMlJ5Z3lrTDNzTldNNmpn?=
 =?utf-8?B?QS9Ec3c0ajVNT2hvbTVPa0xaYnJ5Sm1maWpCcHhkUmxKNzJYa0szNWRtNDlE?=
 =?utf-8?B?V3VNeE1SSkRPNSsvY0k1WnJXTm5tNkhLT1Y1d1paaE9kOE5XWE4zSXJTNFBh?=
 =?utf-8?B?cUJxcGMvbFBHeUlNdGo2RW1VTmZ3RFp2QVN5c3dQMnh0ZDNUNzROSmZ5RE9C?=
 =?utf-8?B?ZHBEd3VTTDFQMVpXNGN5OVRJTVBpM0FIeldKTWFIWStlbG43aU1OYW1YeHYr?=
 =?utf-8?Q?t9QnyZN/46aZzWSULAxjAeUy+NCTMY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eFBsTEs5VTFEL1FrbTZDOGJsNGtSQXBBMVB2dW11REI0Z0hxdnFNQnlzVmFW?=
 =?utf-8?B?N3ErTzRGd0hzOXNlM3lLZlo4RzE2TFY2UzUzazU4UVc0ZTRrbkRGemRNMU5W?=
 =?utf-8?B?VUtyL3lFUTliVkowMDlCbEl6b0RnMmdSQlVHUTNQVzNpU21OQmF4M1N4NGh5?=
 =?utf-8?B?T1BWLzI1Nzhub2FuNDJMSzB0VUxDSGhXUk8zeWVQZnh3TVl1N3ROZmxwWld0?=
 =?utf-8?B?OWdyZG16S3FKV0RCUCs5bmNTMFhwOVlra2hRWVZKd2tUNHlvWXV0MG85WHFm?=
 =?utf-8?B?TVFJMEExaE1YbDAxbnhMeHhybWtrVHNSSkFCdkZsSzdRYWlMVjc3OFBsNTFT?=
 =?utf-8?B?UktYS0laQWRvV2VFcGt6M0FCZmtmU0VudHZUMVMxSnlGOTllT2xDTkRxYzZU?=
 =?utf-8?B?aytPR0hkYXh6T0pyZjNHU1RxOWZYS1lCalRNM3g1T24xVGd4K1M0OFo3d3hs?=
 =?utf-8?B?dmpsMFk1RUo1eW1XNEZta1lDVXN0bHdYVmk5cWlSN08zQzBYYkg5VUxHSXp4?=
 =?utf-8?B?dnN2Z3JJQlg2VjJZT2F1K09yVnFxUjVJNldnSm9JQUM5RGNiSVBxU0MyUHlo?=
 =?utf-8?B?dzhBdnFWRUVrL3dyQ05hWVBPdU9aYkRCbWpJempWNG5Yb3JSTHBGalJtcmdx?=
 =?utf-8?B?bTB0SjJob0JFcDJNNXFPSkVwbnJxQmhzbEFVSkxuZmJuZU5TN2UzNzZqQi9Q?=
 =?utf-8?B?dFBxS3pqcFRpMUxIc1V4SGR1Q3JnTlQrUnZyRklucXNYNi9WeFkvWE1SajBt?=
 =?utf-8?B?cEZTTFd1R1JndkJQNmpJQ0lRaUlIaFhWNmJGWUNVNTUyR0diUXdjODBERFBX?=
 =?utf-8?B?ZHI5L2g2dytxbzd2L2tMYnh4bHlKb3Q3eXV6bUp2Znl5K2dWemtmUVJDRmJo?=
 =?utf-8?B?UVJLb2JuUHMzOVBLMkJHTktiU0gwVHlrR2x0TmloTVRmOEhaaUc2UkI5TGlF?=
 =?utf-8?B?RjlpRURyTTJjSGhrSlh3WVMyakgxOU45aE1BVHVUall6em5Pc3daRmkreGxU?=
 =?utf-8?B?MVBobWMxTHZTRzhaR0VHYjN4clZUN0hhNEhCWTcvcU40eEh1Rzh6Tk15cHN2?=
 =?utf-8?B?YnhVdS9oU2lxK3ZjR0ptTDBMcGMxZVJRNkxsSWtUeExjYks2QTg0bUdiSlcv?=
 =?utf-8?B?K1M5VHNXd3p1NUpyZE5sak1RNUtzOVNWRmZhcGNrMm1XTTFuR2lid1R2VVIy?=
 =?utf-8?B?ajlCL1JkYjRkcnZ5dE5oTngzYjJNcUhkQU1jeEZ3Rzc1VTI5UGdNWGNPQTBP?=
 =?utf-8?B?Nmgrc1d5dytyVWxPaDZyMVpmM3d1TjBOTGdOeG1xcExlYVlLbG82bEc3UzRP?=
 =?utf-8?B?VmxFWlgyUEY2VGE0MkJYM2hnblJUd2p4Wm1BNVBBbFRrcWFrWWx2dUtmVTdI?=
 =?utf-8?B?TG13c01WSGtKakwzdEFLUnc5U1FiZU5aMTBaMmpXZk1BdWFQa2JhSERoVlVa?=
 =?utf-8?B?R29yanJ5dCtVVklmNVhNRnBvdWhsTGI2clhlQlRNNnJ5YlpvL1o3bXoraVJH?=
 =?utf-8?B?N2tVVnI0eFU2elE4RW1DOVZGT2p6NUxubFNGdE45ZlM2amdnaWJyc0NWeHVa?=
 =?utf-8?B?UytEcCtTNVZHa0dxRlE0OGRtbzNxcmlyOG4vK01XdDdNa3MvdDhNRlhadEoy?=
 =?utf-8?B?SHJUVkR1RVl3WHFzTG5CV09lOHNqakFMQTZISnlOV3h0ZkJQVkpsaDBFc25M?=
 =?utf-8?B?dkllNlVPYytNL3RYaXZ2QTRudWFEcGtNUkhlczBwRmVaTXpEWE1oNEJGeERk?=
 =?utf-8?B?MmhpRkxpWFY1Q0JwdVVVb0hoUmZiSDQ2MEduT2FGYTZjOXU1cVFFNDBEMjkv?=
 =?utf-8?B?d0hoSzFxSlFwQXY5S1ZaMXFRSHAxYkwyaVhYd2Yzc3VrRTM2VnNDc0Q0cmk3?=
 =?utf-8?B?dW1iRm93Sk5OeTQ2WXdicUVpYmZ1Q0w5SmdTeC93T3N2YWlRQ09KbWE0VTN3?=
 =?utf-8?B?TE5FQnRicUVDWno1K3lxVm1uOFFJblF4Si9PZnA2aWV6UGpIbU1rRGR0Q1lE?=
 =?utf-8?B?MVhxUDkybHpTbTN5QVJ3a2ZYM2F6MldLVm8rdEpSL2NKWkIvbis4SWtkMDIz?=
 =?utf-8?B?YUJhcVFBdjVhT2RONFBYTksyUTF6Nk5LQjBBMjRUZ0l6cU45TjRLci81Nzhy?=
 =?utf-8?Q?ajfFleKIs8c6sefNnwb4nyT2k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4447f2b1-8654-4cc9-da09-08ddf5c25ce3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:28.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEBqA7SjyCs6mVaXwS70zwGkRR/r7Z3XI/txWd3YSR0zZOyC+ccPlXzE7z8nKAaLhBR5xKju2zJPnFdJbPoDzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
clocks and resets, so add compatible string for i.MX8ULP to handle
the difference and reuse platform data of i.MX8QXP/QM.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..f46ed7a291c9afbccad90e8498a6c99900922e2f 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1095,6 +1095,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
+	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


