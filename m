Return-Path: <linux-media+bounces-52929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kn+Inxuk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:22:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB248147469
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5038130715E5
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F43C2EE607;
	Mon, 16 Feb 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wo16smZe"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843202EAB8E;
	Mon, 16 Feb 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269561; cv=fail; b=szTzO2E2j3/ytU4YIXxjrRuFjrgC2O8AXHF5s0I/ldeZAjp5vuzgrexp6E6t7aN56szAJ4j8PVfbrxLRoaFpCFfACctMMESoueNCPLWSYSojF5M49GBUmnM7y+sLfZFhJvMibBFHA0R0TrTFK61TVZlDTyz/4V1y1n6aQRpqJio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269561; c=relaxed/simple;
	bh=g5Y+a7o6xhlSPt5RGrt51rlBibUPPOw/D1QhMAxZG38=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K6nn81liFH+0CmVkH45ZqCKD2mrrZWli6Taz4BW5Fay8P/pRFYSwAO404jVmgeh1s8dJylPue/cvpa+IxQ2pyy7ovgAl/Pu2YamcJPH5WDPHuZ1+m/ELf0C+54cUJccnwMA7ceE1yq5khlAmv2hK1FjXojSjfuMlOwn4dSc9ibo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wo16smZe; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9RO++rerzgq/pwCx9Z2stzTdSBd1iQGyhtM38fZ0XhIItFjvxn6KdgRB2y6lq6Nwik8kn+/av2zR1ILFxt4UkMtjvW7DQyNdWm6BuDEzA6jkW6lWRHlIHHHOW4ek/EbD4eAV8Rj4me/65cn4b6L6JytiZnMT9eTxcTBagr/ZMDV9sd/UcGQUJmT34W4bOXg+SlA6NJMPbNGeokqdj/jqgGywWOf/Hy70wlOYqjzCp/FzLPu3qym/Fk/ZS+4Hp0pO17t9lcf63j174Op85oH9ZIbiu8hp35g6fMv6/RjayxCffQkmP/z/OnOwR4TWTSqpr1AFnj87XFZli9dNpVajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPmc/l/LsI56/u97kX6TH7nO40BZLWV1IGhfaKrnBxg=;
 b=OKqGIoduYMAshGDNGK8mUG4qcFWb5n0wojy2m3kEeT0S849KMVD84bHPldaCIfhRT/3taQqVuu2eGiQd8SvNY5B6HrMp2R61XeSNjjywE9Rz0Fh74cIYgARu+YVCMgcafi44jN/s7oR/eOAHUpvU4uZJXaqnfnMY5fk6dc5i8W6d7CzHEzt+BWJL/ABGfhC3TAnyoHDHy8AR0Bu5dgO5bZYcDM42v/+IAsbx8CxrrKeOloybHPuP/NDE9x3hWMWQPHjU0sJq/73nOW35gaCwNXNVJOzQjFZ+ezwSPJxnX04BVFs0tlg3mg67rcFVX+5V4yKInz9Tl9Vqn+xZNACTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPmc/l/LsI56/u97kX6TH7nO40BZLWV1IGhfaKrnBxg=;
 b=Wo16smZeQag3qFRdz4yJbq9PXbQDedAfRl/h532UcJ9QfjkH38nIP8I+ORSOFaAEXdbxvhoW4K/jgAPjoM4OmyD8Vh/OW0gnKu2dD5S5UXInwkWDTN5TQZaZfMtzD4niePw1a5ZdQKcdgRHcvWVd3GY07WuT9np16+lD0W0tU2IPINCu+UniUbl/UEr+HEch/mQ7nAM0jQCnzyD8LS/Z2Ld4+8hdgNaGoqQXk+bDpBMKey2PBW2rh/4oJmoOFdT95ylazaDXCv3RaMnU/bZoda9nNCvRySTBJMy9kXZW7SPGWQZMAs/lXei11Cmpd8SrdcBbNYh8q1fztBGjk08Xsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:19:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:19:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:44 -0500
Subject: [PATCH v3 6/6] media: synopsys: csi2rx: add i.MX93 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-6-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=8651;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=g5Y+a7o6xhlSPt5RGrt51rlBibUPPOw/D1QhMAxZG38=;
 b=WxMmoTAvgs0wbVso6GzB4RwAaC/CBWXVxWhrIadf9s/i6PCATOWuhZ5Ep4mvqHMj0bCCmNK5f
 yrDyXEGik6hDrcb0aFCSCNb662Dy1h4Fo98Fb9aln+8gmdqxXQR9Gw6
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 835e8843-34ff-496f-8009-08de6d9044be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?emljWXdRZ2hDSTJiU09GTGpoNDdXQmFvelJzVXZadU5YbVlVUjgrUXpSb01J?=
 =?utf-8?B?ZFhzdm5hcGt6Z2gzWW5HbTdVcWVZS3ZHbG54WGVwbTY0VHV5WVJqWTFPYjRN?=
 =?utf-8?B?UjFwanJHZFlvNWVyT1RJM0s2bHhIR2NyYThhVUdOSDNUTitZTzE5dXR2ZlNw?=
 =?utf-8?B?YmwvMS9scWpScTkycGN5dFVQVHREdUh0Q1BsQWVQYzBTdWFrTVBPb1J4UmRv?=
 =?utf-8?B?eDFCTStnUXM1Vk5jVnhneG1seWw4SGxSeGNWQ2xpYUZDTE9uVkxLU0NmTExN?=
 =?utf-8?B?U2VhSXF6dWxTMThIRFZhQ2JJTGh0dGhIOG1DTk9nYmVNVzRLNTJRQUh0OWc2?=
 =?utf-8?B?Q21USnNlQitWRy9Qdk1MU085YnRHcnl5QWg2TzhON3NEMUZ4UWtnclN0aWNH?=
 =?utf-8?B?SWJlaTg1ekQ0d29jelFHTkFrditHY1RoTTFwSDR5d1MzcE13a2NNVDFEZTFS?=
 =?utf-8?B?ZWExcHRjSEEvclBFcXEzVTlZOXUxRVI5K3Z1cXhTQnZ4UVRrZnVKUDdJZnRB?=
 =?utf-8?B?MGdYNStKWVRkTHk2L3pZaVFrMzZRRlJPcHBmTUVVTmlyV00rVnczSDEvNUNq?=
 =?utf-8?B?S0UvMHNqYUhYNjZ3SUFRMlJudWEybUdrMUk1MFJPZDN3RzhHRk9lNzdXNEJC?=
 =?utf-8?B?OW9IbFdMdlQwdUVMdHdSOElsQk5HSWlHNk5jRUpMU2wzOGdVcGVERk93VENt?=
 =?utf-8?B?Q20wQmM2RUJ6K3d0Y3JyOVR6Vzg3V1VyWnFtUEd4dEdTSWxKRWZ5ckNlR0pP?=
 =?utf-8?B?MSs2R2dOeGZGM1FMNy8xYTZFWGlrWmV6ZXdubldVRlpSUTNZNGt4TU5GL3NN?=
 =?utf-8?B?SHlVSVgzVkszN0M4c1lkWWF6NitiQ3NLWWZZa0pqN0h1cmpKYlZwb2p6bS9T?=
 =?utf-8?B?aGNialN2Y0k2MEx2Vm1GVWhmUWlCL2d5bkdFVjdpSHJkTzJwVk9mUGt4Yzdm?=
 =?utf-8?B?UnoxZk1UamkyZ1g3b2ZHTWRwY1VmcHVzVEFvb1B1ekNNMHFqa0ZpMXl6S29o?=
 =?utf-8?B?WmNJWFdyOWlNeXI3WS91SisyWUZuQjRSVWswZUhZRURwR1VLQTNBdDJRVmxv?=
 =?utf-8?B?cTlUZ1lXWW92QzFhc0hxSGVKTm1IYklRbU9PcHk5R3ptaVVRZ3dBVnVpeVZq?=
 =?utf-8?B?L1pmZk85dVN3alRhZm51WUJYMVRzV2dUNWZ6M1dIVmpyVWlndEgrY1J4YlNV?=
 =?utf-8?B?SUVqdUw2ZlZpdFdiUHM3b0FwUHpyWE1WU01ydnVFMXJ5TkY4TThUR2IyMWtK?=
 =?utf-8?B?YTc2T1NyS0c4R2NuNFkzZGNvR2x0aStvdVVJQU9MZXR3Kzd0VFZhaytyRkxE?=
 =?utf-8?B?SHVpUXc5alF6VlFsQ3BDVUN5SUhIMGJIUzBZcGord2JNeEJqaFl1a2h4ZXVL?=
 =?utf-8?B?RmR2Y25nY0pSMUZocVlUSU9zR1hmSEhnTzZLNktYVWhsdmRTVzBUb3BnK2FW?=
 =?utf-8?B?eVhXOTVXV3NQMCtGb1RNNFpGL0JwZmFDaXVHTG5SWmw5a0FGcURkeWlNU3Rx?=
 =?utf-8?B?akZ3TFRkTUJoWDc5UFM3dCtOMytGSDJKYTRsZUxLK1pySUphUU9Sc0xUU2xC?=
 =?utf-8?B?citQWEhGbmlKaDJOUE1YNnRsV09Nc2VDS3BLMmp0RDVreGEvZU9mK1ZZck1X?=
 =?utf-8?B?aVlqckFWU2dNOU5ER3VacVUyYXNvZWxhZDN3QktXYm90SDZZQnRHOE5ZL1Vu?=
 =?utf-8?B?alppeGw0cmY2dGdjZTRTQlJHaTdDRm9GdFA0Tk1SYW90QUpVTTNOSmY0cmRn?=
 =?utf-8?B?TXVYdnY4RWRiL0dQKzN6dlQ3bWE3T1psbGk2STd0a0NkNU9MRy9BRGhGWUdG?=
 =?utf-8?B?RGpNRFpkVWVwTzNabE1FeVZHMnhkdUhJZ2dlS2NhWnJJQVMzSDBRWjFmdGln?=
 =?utf-8?B?N0N1Wk85ZnNUSnNlcEl2OERlMTRkV1luNFhoVE1QbEs5bTlDeVFJeE9MQkRv?=
 =?utf-8?B?WmhhcGlubHUxSTdZSUpkRWlJR1JRNkpvaU1uNlYvSzNXOFZpZG96V3BGVnk4?=
 =?utf-8?B?UXZDdWZWMFdiNWtrcTNPeDQ3V0ZvY1ZpSm9qZFhackEwdzZNQzgxSGI1WUZY?=
 =?utf-8?B?TXpJNnVBeVVRa1EvNlVQcThFWXhiZDhtaVpBN3B4Z1o3OEpIM3NCRXRQQlBB?=
 =?utf-8?B?aUlOOVphSHdHcVhiSnVuNXBvM3VRVFdQb0RJcnJmS3E2M0gvUXV4ZUx4dFFr?=
 =?utf-8?Q?xIcc354Dy7ERegpLvNdiDZ4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bE9KaVAxcTc0MTlpeGZYTWh2TWYrSzJocXprNElTZ3VnSW8rMk5GYjlJeVBD?=
 =?utf-8?B?VFE2b3REbDl4dW5Ra3BLOTdjNGxTUUtCS3pTSU9GWjg2cU4yak1mUUJPVlV4?=
 =?utf-8?B?VHJBZ25qb1hMbWUwelhWNXlBeXdiYXdPcVgrd2lubFVqY21sczdOdFU3MkRK?=
 =?utf-8?B?RGF3M1lUN2pVbVpvelZaVzhFellkaDYrK0IrWm0xU1JENmdMMkV6TEFUOVBV?=
 =?utf-8?B?RjdOUEJuc3MzYVdWRCtET2FDV3c3YlRLOHlOWWdMODRiOWx1eVNMV2tkcU5O?=
 =?utf-8?B?UXJnK0tDbU1LTDBNMmNWQ3RscVh6SmdDRVBXYjlrMXI1c2pGKzZCaEM4Q2sx?=
 =?utf-8?B?Z3FnTmJCOE9lNTdEYVpaRXZOamx5M2xjd0QyUnhsZlQyVWczQzdXcEJCeXYr?=
 =?utf-8?B?OXJsdFViMGRmaEhRMlhPV2NMRWM5QnJ3T0gyeEw2Tms4SERldVJCQVJUZ1JS?=
 =?utf-8?B?M0JhMFN1NnZBaUlGVllYZStqOGR2UjAycVR3ZDNzMHJ6NDhJcnNzWjNQYURm?=
 =?utf-8?B?NHVWb1VxaVFpOVV4Vm1UcU53OGNhSGJuR0NRcEtyL1Q0aVJLRGVIWU01ZGFV?=
 =?utf-8?B?MVVsYXFuenRpaDdUakxDMmxhS3NJb3hPaDc2VzkxNTB6elZkVEJOMkxBcXVw?=
 =?utf-8?B?M2NvTzQ0S0ZRVFVCOGVXNmx3YSszMEdCdFJJcS9GNHpPZnVEeWdVcU42KzRi?=
 =?utf-8?B?QXlGeXpSV1ZRaldoS0JjZCtsRlZ6d0U0cGZmSSt4SWM1aEVtM1hxWFBEeHZy?=
 =?utf-8?B?eEFDNE9QT3BNV0pRUVpHYkNnK3lDZk8wekI5bUZ0Y0RwTERSV2pIZERLRXBw?=
 =?utf-8?B?S3Q1MTM3Y1VLeDEwMlc0ZXl1Z1JKV2xtL2JLcFlkUUlZK0M2ZDBoT1lLeEhV?=
 =?utf-8?B?VkRpc0hrTDZSc0VkdXFzYmJzd0JmekJkdU95QXhNQllzbFc5bHlGTjhKQU8z?=
 =?utf-8?B?RGJqaE9SdVJpTzhEOXVhRnlWaHdWbkNMUkVUVWVQeHh0a0pMeE9ZcVUyeERN?=
 =?utf-8?B?N2xnTjdZd0ZReGpOYURKVDkwQSsrQnRwWGp2dHhFOHEwd3A0bVhkUGUwbU5K?=
 =?utf-8?B?UGFnZW56OVYyV0VCSmttN1d0eW5oUlVTVTduQi9tZFlqTy9SSUE1VzMxTWVs?=
 =?utf-8?B?dmVIVVhxNENjdFJIenlrS1d6elZadFhKWHFjeDFta3ZIWFVQbnJIdm5NYzZN?=
 =?utf-8?B?dEpBa2xQaHI5VUVFbkVLb1ViaWxqUzBrOGtiSkFsQ0h0WW03QmZPaFhzNVlR?=
 =?utf-8?B?NTkxbk54endSZWV5VDFZcXVvekJ3SDZ5K2dvRHc1dkkxVjlmTDBWSlZRNUdv?=
 =?utf-8?B?N3NlNkhkcHRZbVRCTVczVlNZNzVvL1B2K1QzOU1CRURDcDBuRU1nVVQxeG9B?=
 =?utf-8?B?NG12cHFXampqVHBhVFgvTWlXajVwUmNaZmRZcUtYcXA3OThiQUh3d1NMVEpj?=
 =?utf-8?B?ZzYxejdJVHZZV2NxTS9WQm1UaUc3a0xhVFVsNE5oZm12OW9ISlJBVnlRNzc4?=
 =?utf-8?B?VXBPR2E4d0xUekJIaWJMWWpSeC9sV0NWOFc0L0J3bUdYYW1yYjlyY3lDdFBh?=
 =?utf-8?B?ZUllWk13R3N4cE9LYkFlOG9rZHlFU2RCQVpPYkFjTnhCQjVwZFRnS1pxUTQ4?=
 =?utf-8?B?YXdhbDU0MWtwLy96SndRZE54NDN3UjMrWHVqQkVKd0dvaG1jc21YdGw3RkZ2?=
 =?utf-8?B?NTFTd3M1cDFFM2pTLzZFQjZ2OFFvOVl3dlJLa01tZ3hVUHBtRjUzY2FSc0ha?=
 =?utf-8?B?cHpsSys1STlreEs4Q0x2cWZwWndPUUh3dHVSWitaVC9vL2U0M2ZGT3hzWjNm?=
 =?utf-8?B?SFFjV2dkaHdHVGJMSS9EVHQxL0RSTG1aRG9WN1J0a0dtU1lDQ1RyaU1CeWJH?=
 =?utf-8?B?bTVGa2RwblZBUHdyc21LUjBmZ0FuS2pmNkl3cGlYYXJlUlNRSnd3cjdkY0RX?=
 =?utf-8?B?a3dDNWZhS21reitiU3RISkJsak9nTXRHVW8yOFVnZXYrZ2ZXY2tkWUFRVDl1?=
 =?utf-8?B?TGU3L3IxUWxwZWVVck01Y0N3WDRuU1c1aWZtN1o1K2Z2bnhJenVlSWJoc2tw?=
 =?utf-8?B?UlRvOUY5ZFdRVGtrZGhDVzhVMEtOQWpGTzNsZTlxT2tlQXFxajdFQkYzM2ti?=
 =?utf-8?B?SjROL1Uvdll2bkRScWo1bXFzZm5tdFZuRjFBQ3JrblZhWTFOVGkzb1F3SVFM?=
 =?utf-8?B?TlVqL25SdmV0RzdUdnkxUFYxRThSd3V2dzVCSkM2Ny9xOG5IdkdoRDRZeW9v?=
 =?utf-8?B?TkVUSy9vZW12ajREOWc4SVBpSzREOG5kbU9wRjQrU1BsSSt5Y3MwNWVwUHZU?=
 =?utf-8?Q?vP4FH2FxQWOR11Gkep?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835e8843-34ff-496f-8009-08de6d9044be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:19:13.0980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8cnJN7FsokoHxDDUxbFrDnL49zrb2r8e9OHsXM1M55W94cro8yKUqOgd8emAS8CXj4UJarSscO5n0y/ldNyVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52929-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: CB248147469
X-Rspamd-Action: no action

The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
register layout and an integrated Image Pixel Interface (IPI), which
converts the received CSI-2 packets from byte to pixel format and produces
a pixel data bus containing vertical and horizontal synchronization
information.

The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
and .idi_enable() callbacks to support it.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3
- tune commit message according to Micheal's feedback.
- Add Micheal's review tags
- remove first comment about read before ndelay() because it use read value.
- but second read() before ndelay() is dummy read().

change in v2
- move macro define to header
- use new register access method
- Keep check register exist to avoid print error message. keep slicence to
access unexisting register may hide problem.
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 159 ++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 536e5df2b4172256def2e2a35b362cfbddf712fa..036f9c7a1b68360dcb5744018d385d4b1a15d506 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -34,6 +34,22 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
+
+#define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
+#define IPI_VCID_VC_0_1(x)		FIELD_PREP(GENMASK(3, 2), (x))
+#define IPI_VCID_VC_2			BIT(4)
+
+#define IPI_DATA_TYPE_DT(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define IPI_DATA_TYPE_EMB_DATA_EN	BIT(8)
+
+#define IPI_MODE_CONTROLLER		BIT(1)
+#define IPI_MODE_COLOR_MODE16		BIT(8)
+#define IPI_MODE_CUT_THROUGH		BIT(16)
+#define IPI_MODE_ENABLE			BIT(24)
+
+#define IPI_MEM_FLUSH_AUTO		BIT(8)
+
 enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_N_LANES,
 	DW_MIPI_CSI2RX_RESETN,
@@ -43,6 +59,16 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_MSK1,
 	DW_MIPI_CSI2RX_MSK2,
 	DW_MIPI_CSI2RX_CONTROL,
+	/* imx93 (v150) new register */
+	DW_MIPI_CSI2RX_DPHY_RSTZ,
+	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
+	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
+	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_IPI_DATATYPE,
+	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
+	DW_MIPI_CSI2RX_IPI_MODE,
+	DW_MIPI_CSI2RX_IPI_SOFTRSTN,
+	DW_MIPI_CSI2RX_IPI_VCID,
 
 	DW_MIPI_CSI2RX_MAX,
 };
@@ -53,8 +79,13 @@ enum {
 	DW_MIPI_CSI2RX_PAD_MAX,
 };
 
+struct dw_mipi_csi2rx_device;
+
 struct dw_mipi_csi2rx_drvdata {
 	const u32 *regs;
+	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -100,6 +131,21 @@ static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
 	.regs = rk3568_regs,
 };
 
+static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
+	[DW_MIPI_CSI2RX_IPI_VCID] = DW_REG(0x84),
+	[DW_MIPI_CSI2RX_IPI_DATATYPE] = DW_REG(0x88),
+	[DW_MIPI_CSI2RX_IPI_MEM_FLUSH] = DW_REG(0x8c),
+	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -320,14 +366,32 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 		return -EINVAL;
 	}
 
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
+
+	if (csi2->drvdata->dphy_assert_reset)
+		csi2->drvdata->dphy_assert_reset(csi2);
+
 	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
 		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
+
+	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_CONTROL))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
+
+	ret = phy_power_on(csi2->phy);
+	if (ret)
+		return ret;
+
+	if (csi2->drvdata->dphy_deassert_reset)
+		csi2->drvdata->dphy_deassert_reset(csi2);
+
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
 
-	return phy_power_on(csi2->phy);
+	if (csi2->drvdata->ipi_enable)
+		csi2->drvdata->ipi_enable(csi2);
+
+	return 0;
 }
 
 static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
@@ -335,8 +399,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
 	phy_power_off(csi2->phy);
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
+
+	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK1))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
+
+	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK2))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
 }
 
 static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
@@ -686,7 +754,90 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
+static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	u32 val;
+
+	/* Release Synopsys DPHY test codes from reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
+
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
+
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
+	/* Wait for at least 15ns */
+	ndelay(15);
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
+}
+
+static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	/* Release PHY from reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0x1);
+	/*
+	 * ndelay() is not necessary have MMIO operation, need dummy read to
+	 * ensure that the write operation above reaches its target.
+	 */
+	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ);
+	ndelay(5);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0x1);
+
+	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ);
+	ndelay(5);
+}
+
+static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
+{
+	int dt = csi2->formats->csi_dt;
+	u32 val;
+
+	/* Do IPI soft reset */
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x1);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = IPI_DATA_TYPE_DT(dt);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_DATATYPE, val);
+
+	/* Set virtual channel 0 as default */
+	val  = IPI_VCID_VC(0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_VCID, val);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
+	val &= ~IPI_MODE_CONTROLLER;
+	val &= ~IPI_MODE_COLOR_MODE16;
+	val |= IPI_MODE_CUT_THROUGH;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = IPI_MEM_FLUSH_AUTO;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MEM_FLUSH, val);
+
+	/* Enable IPI */
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
+	val |= IPI_MODE_ENABLE;
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
+}
+
+static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
+	.regs = imx93_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
+	{
+		.compatible = "fsl,imx93-mipi-csi2",
+		.data = &imx93_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.43.0


