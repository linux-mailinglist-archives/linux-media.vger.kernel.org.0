Return-Path: <linux-media+bounces-25686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E61CAA2971D
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18071885D15
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022441FC11F;
	Wed,  5 Feb 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J2GtytF1"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D061FC0ED;
	Wed,  5 Feb 2025 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775937; cv=fail; b=UTsVD1k/eYtzri/uApWAy84byl6r5SOeneXynN+sA/8lCnzrlyMa1/qCs9b/x6yZ0v8nCRw0C3ic9fmJpXMATfXjRJ7vxE+6jRva4S46H9Wof3Th9BJd5DGsCAAONhx2cohJBLzcjSMHhIgTDZbd5epXd+ZryPpBM6xN+0bME/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775937; c=relaxed/simple;
	bh=A8k95VM+oL3O5WlaQNt56vtzC2uFbQ5X4+I480wAqUk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pQqJJ00Y28SdNmj/Asf1St4mi6qnxDaVeJqjxucrUYPVSPPYgNoaaCv5p/dEopowMIjTfALsu/8O1DPnV+sDZ1p5s13gWCosUlxwRAMQ9R/aKFs/ml4UuTUgUKFXkM0+p34/qFIQuO37imXLtA2nYMmiS+kEDUVL88KOskDoqbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J2GtytF1; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF23ltn10b7sxmHUbpJzjB7Ek01c9p5nI/ruedhK+/6MZosWgzCP0B+FpCqXempT9DyHn3LAGGBcssYaLvHHz89hZy1RMvkL/X3/b9FPYoPQQfCyUFFWQEOQKG7a0wpTG31PLWuCKP4EeyKdpe0CSfLuYET74E5Ydo8N7auFUzSjka/rk0dJpCchxx7Jqn+5HbnGhY9cqFQlLR1Q4p4Eegin5/uF5hgtXdI5DgkVC/FovWOtU1ZYhDbW+IkiD/e02chKqdgFalgspkpjoxevwU37BMylC0uf7aVGqSWhUaQPhGIwYhwfEF9iyvfMIrStvwU9Nc+WBxKtmcX7QF4RcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzhiG8R734aS82se0EiNULTgw2yXXhD/6oBtZtnqYhM=;
 b=O8P+ghzx3glhkOn3b5wbsHaTVgsFO6OxDb31ewO+PFYB40M0oC1dX+HRMRuVeAUX6w4Wsh/jkSsiO4fwAVZV33TAjotgdeIEneOhuE4u1X/euBvpm+7qlxkGAaU+LqJpwFdXd3lXdZGkad8N2ocSX0RUPdBeJgpgihI/kf2+OL+vNKD63tuJme8JDZrzgJVeJAc2kgejsQozJJpkbpE3XERU9no0Kupm05x5nUj7zP6nMpeP6tDXUSvVArPuATc14qPGOQuNN9vtBkYM/F4KlK4CY+7uXkTLA80Xh7W05Ozpx83fd9KIx6K9sGSs6DLuIMzqexZXitIVk8Au6y4MLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzhiG8R734aS82se0EiNULTgw2yXXhD/6oBtZtnqYhM=;
 b=J2GtytF1JRxJY8kSpSbn9QRX+WrWG9WPapbR+IrZVggukiXUwHVVueikysydLUvKe6drRwKfPo0Y86Pnxum0Eo27vEiUuAhz0HhIAEC8KuiFuMOvCX9wSczzS2airTap+KEYxMPlOO2myTsfLofMWhrs3upxyJ+JKKGVgF6+DmWI93ScZAGQrJpda85SJUghr34y30mwPE5XLNM4peN4G+QRtwfhjucyRwoBg7n6JuqlDYYHzuU2QnXGCHoQf3ffwINVOqHUBhxJeAL1CZihATjzeRSDoXScNHiwHEib6vyES7BFTQA9BGE7qnZh7XvL+ScUYw5M21ZJUXPXKfe1JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:18:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:18:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:10 -0500
Subject: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=1944;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=A8k95VM+oL3O5WlaQNt56vtzC2uFbQ5X4+I480wAqUk=;
 b=lrMY6A671q5kDqgbUdDEAGvShQd8UeRi3kodb6ZumB8Kd3msvModiEGsvij4+H7QCyqi13nG3
 talXx/17U0yCF7A1qBwmEm4ccxnzWM5HWbuSQj3E+N0iTvDQZHeUEmr
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
X-MS-Office365-Filtering-Correlation-Id: 81b265a5-c813-451f-1099-08dd460929a3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T2F3RFFzZ3lkU3dLVTRoZm03YWM1ZGVpMENUVDJIWDZmRlVsKzVWbGdzMU9O?=
 =?utf-8?B?SjZuRUJ6dVBNZlliSEs3RWNkaURWTlhIYWZqL3lETzQrdDB4WXl4QXkza0hU?=
 =?utf-8?B?N09tVUtBdFhLSDJmcVd1NzhSNHVNbVJ4aHMxME5pd2Rmdm5lakkxNnY3U1B2?=
 =?utf-8?B?Y20xaDdoOWJRSi9ybnZKV2NQdEdrR29hZEZrSHNBQnQxR1BEdlFMMnRXV1RX?=
 =?utf-8?B?WUJtS2J1bEFaZXE0Z3h1TFExMEcwWTVFWHNJS3NrUmFQUTJjZWpwWTlVZEFo?=
 =?utf-8?B?VTVsMTAyZlVjWHdMVkUvS080TFJlaGFMNFBndlFpak5PR1lpNnpNd0IrSTl3?=
 =?utf-8?B?SGJnOUZnckJ5WVhGL3lqc0ltYU5Wc1lRRXF5SlZqQXZWeUUzdm54KzkxMGVh?=
 =?utf-8?B?cHd3ak5CVnhZZGQzWGtUd0t2Y1FPWllVbEdWaDIvUUpDUEpLN1p3eWJWOUZJ?=
 =?utf-8?B?d2lmaWQxekp4ajU5L2NHd0IzWDgya3VqTVFmdm45YkZYNTk5RVY1bzg0N3pS?=
 =?utf-8?B?UUpUZnNLcGZ1R29IOUtERzI0aStPNU5IYjgyalJHQ2Y2Z2VmMmd1VFNReEVL?=
 =?utf-8?B?R3RMREwwUzNEZ0xveG9VRWdJR1JvK0NOQ25TT2UvZXZKTllVZnlvVlN6OHkz?=
 =?utf-8?B?ckdhbGNTRzBCeERUeHFmRmJ3c1o0dllEb3FQdDROL05SZEdma3RiRTUvZElF?=
 =?utf-8?B?UjN1SVF0d3JFcVZvMzdldnlFTUVnQW4xaGtrNmpmNHNwdW9kTVJkVWYxQ1JI?=
 =?utf-8?B?cnZ4Tmd4VHUzNW1Pc1ZFNWNlQnAwQTRMeVlYZ1RKOVVJWXc3T3hvbExpN1J2?=
 =?utf-8?B?dnJ0MUFPOU5LV3NNV3p3d01lbWlZMGgzQzBNQTZGajRQVkZ6K0IvMlRGWWla?=
 =?utf-8?B?ZXFQdVV2Yi91K3NVR0NDQk8yeFI2VGdva2JkK3kyQnJKTlBYV2YzVmNjdEFP?=
 =?utf-8?B?UWcyc0gwZkVHek9MUCs0c2ZJanduUkpkUVh5V0psOE5lMDZ3eFk3MTg4Rk14?=
 =?utf-8?B?bUhGWUlnT3hYNUJYZDlCUVZwS3pwajd4LzZkcnkxQkVNSFFuTGFKZzBLNkRj?=
 =?utf-8?B?QjRxTTNreFc1VkJOR0RGb21xNERVTFVwclFTSGZqK2FFbS9yVUVUcHo2MjlU?=
 =?utf-8?B?ci9UZGpPeFFXTURBTGZwTlZON2VUaWpYZW1BemdmdmFEWXJwNGdWS1FxOFoy?=
 =?utf-8?B?KzFEREVYcjB1MnBUOTZDNDZTMm1aQ2NwRU16RngzS2RITVBMN3VXMFpUNnJ2?=
 =?utf-8?B?a3Q0N01TNHVmWUNZK2dQTnp6VVJ4UHdsbnZhQzR5K3V3RGpVN3NSdFhyeElu?=
 =?utf-8?B?dlFyU0I5SGc1WHdWUWpKSG12SmJ6QTJpalV1cXNTNGxRbGVESFVRSGhjaTQ3?=
 =?utf-8?B?cFFUOXJsTXdWSXVZTEtWTFl2M24rSTBzck1NQzIraWhsUThJSVpLREdtRmVQ?=
 =?utf-8?B?OHFEbHlsVDJSdGpNM1g3ZTlBSWFyUFR6dWVVK3lwaXBFMTdjTm9ob0tiOXVm?=
 =?utf-8?B?WVVGZWErM2wrSlpWSHF6VWFNT2V3VzR4WmxXdGpvakZObG84WjB0U1NKRGpu?=
 =?utf-8?B?MVpVcWZlcGJCVk5nTFZvdkV3dGozWW9KQUZ4eGlRbHhQQldHM1MxbExmU2s3?=
 =?utf-8?B?Q2ZnU3Nva3FHTGhYZmFCbmNpVk9CTzZlUklXbnJ6aXpwbUhSdkhBaG1uNXhK?=
 =?utf-8?B?ek1jNm5ydTFvL2lOVVhvZ0E4NlljdEtzNWZoTVRxbFpYemRPT1o5R3prTVB0?=
 =?utf-8?B?MTY0NGJGdlQ2UGRKNjA4VU94Sk5TR3JIWG5NQjByNGg3a0txNDRpOWFmcFlP?=
 =?utf-8?B?NGlPaWJjMkJsaU5wc0ZTV0R1OEc5cWV3YnJlUjYrWkh5Ym9zMk90WVNJSnZm?=
 =?utf-8?B?S3lmT0RCWXFBdlVuYVdGblg3b1UyVmNsVWZibDlJNExhQkE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eGFyYmM3VDBuR1NyN1ZOWmMrcFhrRGltMjBwNjZrWm90NDhSVDdpb0RuY1Yw?=
 =?utf-8?B?a0FsK2xUYmF3MVZRVi8rQ1F3ejM4V2RPQUI4NjhzN1lkQ2hQTmlyM2UrVVZ5?=
 =?utf-8?B?ZXQ4ZU9uSGsybjBoMWVSYWh0UmViWExydmlOajB2U0hvSlpSanhkNlhqT3Fm?=
 =?utf-8?B?a1pzdHFYQ3BQR25RNGR0akhNTWpnOFRVTitMWmphR2p6NnpQaXlRbmZ3OTNH?=
 =?utf-8?B?aHVpMHJWbTh0SHYxNGgwaVVkN041OXZNK2xzZHFjNjMyYWUyMGdKV2R3cEI4?=
 =?utf-8?B?WFd1cGxZOWkzWmtmcjRXNFBkZlNEM2UyYnN4Z0pXUWpHWUdSYlhjK2NsM3ps?=
 =?utf-8?B?ZmZrSEFnVkxnME1CSUlJZDlaUkl0ZCs0b1Q1WmtUWWJHMElPaWR6STZyRzJu?=
 =?utf-8?B?aU9kMGd2MGNMcXo5alNUc0YwbjBwMVM1cng0bUhzQ3JmMmVMNU9Nam5rTUJX?=
 =?utf-8?B?d0JKU3RmVlg3eExWamxYWDBlUmU5UjhsdjVDelA0UFBRc1V2UDZJQkEyNnoz?=
 =?utf-8?B?SFRNTmtGQ2l4aUtVU0xoWTg0Ty9meldMdk1PMFB1Z00zTC81djZtNkpkejR3?=
 =?utf-8?B?QmpqQVoxNDY5ZVloNDd1Uk9ZOTJHWEFZR2FqcXZQVGkrQmdqUXJmTTlQS2pF?=
 =?utf-8?B?Mlh0bzlQa0xaM2xxRTI1N2pxNDBFTHYyY0ZJNS9qY3NFZ3JnbDVaa0o3THhs?=
 =?utf-8?B?aHBDRWsvUzVzc1JmNU5jUjJFcmJKVVRINjlmV0tqYTJzZ21YSU81cFUySmRo?=
 =?utf-8?B?ank1Skc5YmJJT2p3RDV6WElRamMzTVpIblI1elR6UVIvL0dSSWd6YmFlY2E3?=
 =?utf-8?B?dm5hNHVkL0M2dGRPcm8xeGlZeGlDWEIyR2hyOGZ3TndRMU84SmNrNWpJQzBs?=
 =?utf-8?B?VkFKWXo1NWdhTlB0TVRFdDhkQWt4aUFqTVZhTS9HWFROSGRqcS8rM0RtVGtU?=
 =?utf-8?B?aitDdHdTa0dzU1ZyMTlLTFp1bWFMdUQ4RjZSNEVPODI1eVVZV2k4VzAvUlpu?=
 =?utf-8?B?TFR4b25JNXdsNWF4VVVCVU9tVXJWMVNNcXF3YjY0ZkUrV3lNQXhJTStGNVFI?=
 =?utf-8?B?Rnc5MGw3bG9tdnJXU3h4YkdDQ21IOEVJNldxRzgzSEx0QnZ5SDZUYXpZMDF0?=
 =?utf-8?B?bHFGQ1hjRnkzanpZckhjYkRnT2J4ekRVekxiVm9JOG9oUzA0OFcwU0RYbDg4?=
 =?utf-8?B?eHZGVWczeVhOUVhoVEVyRlI0b1J1OXBaV3JEUFRoK0dzTnBRQXVjaUVqc3dL?=
 =?utf-8?B?UUkwc0dJaFVVNFJiZDJiS2xhQ2ZrMEw3QlU4enJ1VzRKeXM1QVZpcENHc0RW?=
 =?utf-8?B?dSsyU1RFaUxhYnJPMEQrRkZiN09aR2VzRGcvZjh1ajV6UkJBVitmMzAyTmRU?=
 =?utf-8?B?OUdRcG5DKzY5RlJsZ292bFRpOC94VWxBUWRTN0ozSVp6RVlDUmhoalZuRVNR?=
 =?utf-8?B?Z1JrKzkySnEraDlKYUlqTUdKUU96QWFMMXRCT1d0cDdZRWV0OHBHZUt6dklT?=
 =?utf-8?B?MEZUL2E4d00zM0h0eVFjOXJZSVdqTHl5R0ErMTl1aFlHTEk1TUNyQktCREx0?=
 =?utf-8?B?b2UrdDZvdG5jZyt5RnBZU2ZiS3dYQ3RhOExGM1A0aWZJYm1LMmFrbnRaWkU2?=
 =?utf-8?B?VkdDbDVsS2t1cUVjbUdMMVpVU1g5RjdENjdwSnFoaUpQV2p4Qmw4RXhKMWZJ?=
 =?utf-8?B?dG13MU5PSStNVzBFV0RFRFo1RGdiZWNLMHM3cmh3ZGpBQklHaXZrdzJoeDcz?=
 =?utf-8?B?VkN0clZjUkYzV0pWbFRoYXhJZlUvNmtPZGJCaWpGYzFKak54bmw2YitabzJ4?=
 =?utf-8?B?d0VkMEJFTHhRcmZiODNHemZmdGk2YmZlb0l5djd1ZmJUZVNJcDArTFJQdTcx?=
 =?utf-8?B?dzBSSlNMYjVlZWtJb3FKZlNzWnZCbHhJOCsvQ3VXR3VBQ0ovRHZSd2lwRmtj?=
 =?utf-8?B?ZDRmbXplQjVzcDFSbVNJZ2VSL1pOdnk0YmxTaG41aWpsN05kakt0VU5YQjhR?=
 =?utf-8?B?MkVSVURuOExMc2lOK2c0VjY0Q1FPWE9xRzJOSkt1b09YaWdMTUIwd3kvbWJn?=
 =?utf-8?B?Wit4VmFWSHJzSkdEVHRnTmx6UW1LQXVOSG5PaThqWnBXK3c0d09ZcWU4NFQ3?=
 =?utf-8?Q?PvDaHZbHbIrQ6y+sI7z/IB8Xk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b265a5-c813-451f-1099-08dd460929a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:18:52.4974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFZaB75yTkmzO2bEi7HAf8hiU/Wb5B7NVqaqwJThUW5CWGFjuuwYOZSMNBgkt1dYmsQkSa9GwSQjNnQuBssNQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
- Move reg to required. Previous 8ulp use fsl,offset in downstream version.
which should be reg. So move it to required
---
 .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
new file mode 100644
index 0000000000000..7335b9262d0e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8 SoC MIPI CSI PHY
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx8qxp-mipi-cphy
+          - fsl,imx8ulp-mipi-cphy
+      - items:
+          - const: fsl,imx8qm-mipi-cphy
+          - const: fsl,imx8qxp-mipi-cphy
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-cphy
+    then:
+      required:
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@58221000 {
+            compatible = "fsl,imx8qxp-mipi-cphy";
+            reg = <0x58221000 0x10000>;
+            #phy-cells = <0>;
+            power-domains = <&pd 0>;
+    };
+

-- 
2.34.1


