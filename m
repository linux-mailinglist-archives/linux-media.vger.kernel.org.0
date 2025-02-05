Return-Path: <linux-media+bounces-25688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE6A29725
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9452167D2B
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65751FC0F7;
	Wed,  5 Feb 2025 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ro6YelrG"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7571FCF60;
	Wed,  5 Feb 2025 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775949; cv=fail; b=EgbDiInCmjQMVlcMpba3UOJDIf5OOLaxPTy9bgjySlK2jA+9VUlKDuns6YHSo6lpHUrGaKrk62RljbQJ8GDacqKgjl0lMOLATIMmst2X06UQiKdhijcnUwS/odRoPi7x0zZP4QmDP5vQ2HSXk9zQuHaEfWjkQNktWF2KNg4+cu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775949; c=relaxed/simple;
	bh=H5gTC4PfC7wWWTYky7p7fJU8O57o+xQMMNJDpGMWCcA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cSCozxlFDEcwhzgUI4ukd7rUFWg8s4/oDTImLt4DFH6fwdh0X4JTfYSQXkj2TmVSglcWDW87K5QHeQn+asoOmpXkSv3ekcw5PhRXqZO+cltOJEi3EXBLyLrOzJwIpJZcea2R5UDi5MrDUSdm5Nua0N9Y0jV1y44dGVJpnnSDB9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ro6YelrG; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMNejJd9QssK/uY4mvKAVCQneBCL3TFOm3pJhFIwguq8VIud+kmzWQlR3p9jBWnjdBqS5690TTZm2QDI8dsqjSgIVtDfiTOW0y3/8kLa1DDTADupXZXOgiq/+j+CSzlfffwnMzTTxXGHW9zERBrCsgW+T1VTzyjZgzUMoCqICKUAa4AfVO1zzHT29oS3yNS6HWN5JcHL3o9uNN1MVTwYHWUeSIE4i5EOIVHI6Qb4hwGQ7laBMxu9Kr8vr9Q5W24gxelb/iJBtrOclUW0QRLIY1dEzpQoS2MTMzH3djUgyJoSrDE75rb5lpaDn56edLtqcvDnVQ4XyYvJU6HCa6QJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpqfG/W71tkAw5COWljSL2p5SdgR4d23n2yMtZDxGZQ=;
 b=YrnTt4Fi/qUNK13pwTdS1/qBZytovyz5xjbzH1rsARGFB1BeDE+alswdjDQi4Mx85dqmrya6b7IEOBASWWmJq73lIAfigBh0rzXDPgwv/7mK2NQhb4rsqj74gv0gaDDoN9k8sixwf+6S6AphT0Jx6FWAUvvDY63sTjaNOnx7Rs7o0xJ8qjGyE9VCctgIVQ+4fwfEPLK3AaYc5/p2ghMhbcvJKd1JRn0DTN1SUH873sprLNqV9E/DSr77ediNzj2XyNZLdyjlWaLnuXTP+pkTt0rSbfa+DEd7KbURrNUa/hFgOi+SW1GxMSNYo6MeJx0o6FaoOuSpKBaNMvkhv64Cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpqfG/W71tkAw5COWljSL2p5SdgR4d23n2yMtZDxGZQ=;
 b=Ro6YelrG7pXQZEpuOadvHMfZq7pkBTkTGaIaoVhlpMrC9oh/WAyJD0Ew+hJVJ/gHGdymuxMqatigk+7/L+afMadYtldndxgcLVzvDxqYR629tyQ0mva0kDlEv+3gH/rtHJsoCtn2fCJYqePXWO77v075xIzKLXq5rh9hZemcqwWHyy1l94voe7fFgVxR8Qo/9DpeN/n+k2jqlzCgc2Wyj4jcmeRRw/GB/4r+YvYzE5YOlekF6oCzlq/1pQj8B2c/tvirK3rHpKF6azQB/9d1UmH5RbvmR09YBN/wz1CCIeC7QzRpsjEueqURCWKqwnt12szWBTn8puj8hoxDc/owig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:04 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:12 -0500
Subject: [PATCH v2 03/14] dt-bindings: firmware: imx: add property
 reset-controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-3-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=1140;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=H5gTC4PfC7wWWTYky7p7fJU8O57o+xQMMNJDpGMWCcA=;
 b=U/jH1JkdDP4CXIwgXa1Fnn9fmQT3Aq9c4OOMMFF2UGp5elsODve9veCSPuObzYSt35fVbHjfA
 F8rugV5tF+CDYo3RzHXoHmOyGPcWTQS1N+8oU7OrMNrtwLFnLFgPd/U
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c69450-04d6-432a-3b27-08dd460930b3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Kzh0Q3drMEVpNEVqZTA2cFRkTVF6Ly9iR3VxQmhrelArNjhmeWhlZmJkRGpX?=
 =?utf-8?B?Nll4eUtWL1djcHVjTUkvWUdlNEtkUldMcmtDelVtZFluWG5PZm9WUHd2Z1hB?=
 =?utf-8?B?WHN0NDlLVnJ6TVd1QU9TOEc4cG1zVndjNWRTVmF1MUY5eVBoR1FhVjBTQnVt?=
 =?utf-8?B?K1NBbW5rMWE5QWRoZWI0SFJ5ZWlocnZVMkUwOExkUmNUS1M2c08zU3BRVkJL?=
 =?utf-8?B?VS9MM01vQko4eVpwVUZ4Qmt6WG12azArT2xYVWpXbGkrOTE1WXcwbDlyZ2x1?=
 =?utf-8?B?L3l4QU83SjNmWHBBUjlqRGdCYjQyc1dqeExXTVduRUZzTm4wOFlyZnhObE5L?=
 =?utf-8?B?RUtkTjRkWklJTTFPeXNGazQxNGRUZE5ISkkvSFdFcVd6a3hBdTZJY0NlSHRY?=
 =?utf-8?B?SjJlUzJud0h1bi82RXJLdU1FUGFyTXRWT3FETnF6RkpYRGVmRVBQNHZTSnZy?=
 =?utf-8?B?QTcrWDZlUThyNENlNVZVVG9QVE5iRkJMRkgza1IxU3BPQ3hBenhVcTI1YWo2?=
 =?utf-8?B?Q1lIU0tibHJzaU41bVlEc0ZyUFZaSEhyRE5Bd29HMDhnNUhBdTQrWHArMnNm?=
 =?utf-8?B?UDZDZ04vTDMyako5SXZsMnVRelVtOCswMGZORXB3dWI5dWhRc1hUd2NtYWp6?=
 =?utf-8?B?Q1RHVTJWcmFCVkE0aTBJSjB4TGtJUUp6ZlVBeXNpTExiM1ppY2E3cEtqcmNQ?=
 =?utf-8?B?ZitYeGhaTDArSWNiRlUwOWk3VURWWlVIektPY2pVMjQ3N01icENaWGZSWEx3?=
 =?utf-8?B?Y3c2bmViQmhqNW9GRDl6YVpVbXRiZFlTa1NjaVg3Vm5YRFpzNCtzQUwwU293?=
 =?utf-8?B?bGRKUFRGd0QzaWpNektOLy96QzNXVjk5TE9LTmNVWUNoWE45WXorNncxcCtJ?=
 =?utf-8?B?eVE5d1ZWMFBXa3h6a3QzUDV5Uy9JaFNXbHREeE5MUzBoMVNWZ25uMXJyVzJM?=
 =?utf-8?B?Z0VBYmdFWnRadGtQUWdEdDBjTXFXbEo5MmJwbExmSWM2M3d5Y25VM3JCbnIz?=
 =?utf-8?B?Rk56cTVxQXdTODdydFY2Nlh4OGg5VkNKNkJFUXEwNHNrT2s4b0w4ejk2Snlu?=
 =?utf-8?B?ck44ekN1MVJSU2FIT0ZZS1oyV1dIU2NFaGt6dDBsWVZlcmZ6djRnUEpDZzUr?=
 =?utf-8?B?TVVjY3FkTmF3RXpqZzRIVXBRK1JxeVRkQ293SGg3Y3VKdGt4Sm1jMldaVEgz?=
 =?utf-8?B?ZFNoc1ZzY0FTWnkwTUI0NUx2Y2hBRExJc2N2Y0F1T0FEZlM4NlV3TnRhSjhI?=
 =?utf-8?B?UnlnRkxmV3RBNUoxR3c1aUVVT20vMVBBT3hUTUthSDQ2M3dhNXFpc0JQU0U5?=
 =?utf-8?B?ZGRuNVVKaDFLREtuSFkxRWYxNGRDM0h4Y3dJR1VnQ1F2YnlJNnN4V3oycGU5?=
 =?utf-8?B?aHA3Y0lxUmFMMHhhTU1VQldGNko1NExQN0IrL0I1QStISDZoSXYyWklUNWt3?=
 =?utf-8?B?RWpUbGpGSmdESWdKVHBQRVF4czlOTDJyOWdlRnhGczhxV3RxbStDWXY5VlZL?=
 =?utf-8?B?MTdhMktxYk9saWd4L3drd2pGZm9GcXl3NW9CVHBLN1U0OFc4RkI5RkRRQmxS?=
 =?utf-8?B?NjlYUTExSkhFSzJnVFNXVVRlRFdja2pjbE52S0lLeldIYzlodGtWU3A5R1FE?=
 =?utf-8?B?bGZGK3Z2OUhQMldYMnpyZ0lENUVvNmF2S0llcnlNeVJYWW45dHUwMDJoSC9R?=
 =?utf-8?B?MFNDM2FIVDFYMHUrZFRvekVuWmU1QksrVGlDTytaMU5jNEhFZ1RKSWhwcGJs?=
 =?utf-8?B?aG9SNUdhK0tlVTJkd1kyY0xFT3dCZTl2bUJlRjZ4dXNMTzJyOFJRQURpQnVP?=
 =?utf-8?B?RDV6ZWsyUzNDZGdrVXpERFZKbzRZSDlsZUdkU3E0UXk4eTJ4NVJscWVQR1pQ?=
 =?utf-8?B?TWlBT1M2YmpISTBoM0MyTXVITkE0alhwSHJrZTFEamhhc0kxMXk5MC9WUFEx?=
 =?utf-8?B?L1JWQTV5cDl5OXZ1TWhaOEp3d1dwTTN3SjFoNG05MzlqNnpna1dyZHRvc0ZG?=
 =?utf-8?B?TnRaYlMzQitBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZmF0cWtNZmw5aHBGVHl6eTB4UDQyQ1dDQkVIVlZaN3QwTEtFdmpoNTJ2dUhO?=
 =?utf-8?B?Y2QrSFNzSFM5bk4xNnBQWUtFMTZOemxwdzl2WnYwVGtUcFZZVUJFRk1Fa0Nn?=
 =?utf-8?B?bGdmbzd6N2JXY1ZmSmJWVWZOK1Z1cThNVEluOS85b2dmWWNESXdxYjBVZmEy?=
 =?utf-8?B?aEY4OFNvOE1jUUM1MW5USm1oZVZiT0N1QWk0NDZrcFpWWGtnTUxGWDBvMkJ6?=
 =?utf-8?B?bzNxY2c0T3Z1UTZLZjE3RHpxTzVhUnd0ZTlFRzUxeklvdXV5NzBmVXExK0NG?=
 =?utf-8?B?d2gweHVBT0lMdGF5Ykxxbkg3bXJoUXVxeStsUmlOdkV4UFdGUjgrZkF2NTNt?=
 =?utf-8?B?RHhEcXBkVkJqYzF2c1R5TTlMTEVTY3h5NWVhYmRqcERsdkxOMmZ5R01XZHhH?=
 =?utf-8?B?YU90N0g2S3YyVnIzVEVWQXZDSWd4L3pZWUtEZkZRQmxVQXpZV3JwU2U4TmIy?=
 =?utf-8?B?RytDMDBxcE5KVHE3QmlFNXBsM1NNbGV1V210ZHNhdnZkdzRnZVVhd2pmdjBv?=
 =?utf-8?B?aUhGT05sS2J0eFZ3bEY1RnUwL0FSMm92eFZtY2VZeVJtMVYxWDU3bEljVmdW?=
 =?utf-8?B?OHdGV0IwWllwRDJ6SWFZakw2QXFJQTcySGhrbU9yZlVwaEV1S0Jnd2NRdS9M?=
 =?utf-8?B?eCtUTzZTditmbnREQjZzTDA5T0lnRmw2YmQyM04vQ1JSOVRJSjNkNmFYTkJa?=
 =?utf-8?B?TG52QzduelZxcitZN3JWMEcxZUZvZ2dISlgwd24xa0ZXT05yM0hvTjh0bmYz?=
 =?utf-8?B?TUV0eXByazZ1QVhCeU9aT2s4MnY3RDBDaElmQmhqQ2xOUitaeGNLMGhRMUl4?=
 =?utf-8?B?QkVrL2dlZ084RjVBY2ZmcU5EazR4dUhNMGtpdU1qM0JIb3RyT1FhKy82aTdn?=
 =?utf-8?B?WXBmQzhyK1o5VG1WVGI3SnM5M0h1b2NNMVNzTUswR000YlM2STM0RUw1TkIz?=
 =?utf-8?B?ZGIyWUlVZjFnTDRCRy82U0l2aWkzUVhTSklTZzhLb3RSalo3V0pMS1NibzJY?=
 =?utf-8?B?YXhYcThYOVp0YVBEQU1IaTd5VWRjbk5VTXJQQnJwRHpVcFFzcFR2SWJhRmhw?=
 =?utf-8?B?NGJSMnpHTTN6bWZuOHB3b3RwWlhVZVM4RzZ6TjIzRFRhR0JEUytLbDErMXJ0?=
 =?utf-8?B?UGZKSHN0NE5uVzd1dU16SXVjb2RBQjFZdTd1NFFra3M5Yzh0eExwaFJ5MHBR?=
 =?utf-8?B?VWhJZHpYRHExenFEekNNak1STEhmS3dvVXpqNzBnazVGTG96enI0ZEFVTFA3?=
 =?utf-8?B?YjkrWHA5TkJPNE1CTmhja01tQXVwb2VFQ2pONGYyNGhhU0xDUVgwWmtBZ1Bi?=
 =?utf-8?B?cWV6V0JROVJuYXRlU084aEhiUGVOM05qaTViUjRTNXU2ZGxwTzk2SnJrdnJJ?=
 =?utf-8?B?enJpQUw5SVJsN3hUUXVJK1Y5Y0U5QWJHRHBDbTZTQkVwMm92MHZ3T2xrcWRl?=
 =?utf-8?B?Q3Y4cUJmcEhnSGZwdFREc1RCeWtGaGlKN2oxdWN3aVRUS1NwVGM3VU5ET1pC?=
 =?utf-8?B?QWhhTFpBcG5FM1A0V3YxOUNvVEJNMVl2cGgzWDlkUWpSbHQxYUtaUjVyNi9z?=
 =?utf-8?B?aUFVMmZraTkyOW1Dd2dKUW5MV1dlSEtEanRCbE9yTEZGMTF6MkFGajVCR3lD?=
 =?utf-8?B?RW5LVEhjU211OFlvNUJEdGJJK0NSd3Y3S29hNlduQm9OZzU4OGFyay9KZG1a?=
 =?utf-8?B?eFo0WkZ3K3lSZ29saW9qUWZqODBLR3BzdTVjejVNR3NnQ2t3WkE3NmhSV0dF?=
 =?utf-8?B?Ykcza2ZQNVpBRnpSOHlEV2J4QnFPZ2VoUkpncHdPeDJwcmluVkZ6ZkZMRTJo?=
 =?utf-8?B?TndENG1Xc202Q0tyQ21ldWNLdHlnQkhXUHZHTHQ1YjFrV3BNdUFIb3R6V2p4?=
 =?utf-8?B?alZjNlFIcm5HUThLVDErc2ZFVDdicmR3cDFKVDRzd2dlSzR6VFVYc3g1UThp?=
 =?utf-8?B?STNYWG1lYWdmVzNpSGlnRHIrVHNFRldOZG4yYWZxY0d3eVpKNGV1MEhqdVJs?=
 =?utf-8?B?RThyRzV2OG51dkJjT1ptVHQ3NlI2NXlwTE9EclhHYmtJVk84a0x1M29IbDVM?=
 =?utf-8?B?aXRYeisydVdLbFdTMTkydUsyY1RCSlM0MUVxWGxOdlNwZkwvemd4bzJuQlRZ?=
 =?utf-8?Q?rPfHjNd/UJMSkMxpvdEGl106o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c69450-04d6-432a-3b27-08dd460930b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:04.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf6RNt5jSZm6/1UzM57jvsgqL0G7FWai6rI+IS9jlHkQUszba9NFpavyNdbSulGl7mfOuBQKzn3w5IHNTBxaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

System Controller Firmware(SCU) reset some peripherals, such as CSI. So add
reset-controller for it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- new patch, move reset-controller in top fsl,scu.yaml
---
 Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c22..f9ba18f063692 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -45,6 +45,18 @@ properties:
       Keys provided by the SCU
     $ref: /schemas/input/fsl,scu-key.yaml
 
+  reset-controller:
+    type: object
+    properties:
+      compatible:
+        const: fsl,imx-scu-reset
+      '#reset-cells':
+        const: 1
+    required:
+      - compatible
+      - '#reset-cells'
+    additionalProperties: false
+
   mboxes:
     description:
       A list of phandles of TX MU channels followed by a list of phandles of

-- 
2.34.1


