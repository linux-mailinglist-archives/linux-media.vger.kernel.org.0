Return-Path: <linux-media+bounces-25710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D0A2A54C
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67821882339
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62DE2288F0;
	Thu,  6 Feb 2025 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="XvtL7otr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E53227583;
	Thu,  6 Feb 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835890; cv=fail; b=axeqV4a9yPblBft5cZNRoOpFzUMzy7B8YJ45QhleU/D0s3rH9OMJShC48Db0K1Ng0uaqq8ZKjES0ZpIBWaia4hM4oXgVF04dCMNND6Kw0UEdevxDnCSXoTVlD4Kml6hMV+e418sMS8fN1WCnbnzs28d9G6ItTic7SXOG7Yw+Wio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835890; c=relaxed/simple;
	bh=XAUyQebd/kIeP60s7a8uULFfE6nUdjkkCSmsYkQbEPk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pOkKnv/vpLmHOk/UqHQNDvBtMpe76TdAi95xnmOyx95tG9PZuqngQGtNC/EQPG7hSCMKQ27F806tmrxiJfMyCDPdnYISsAZEjR3WbDTGjpbKUW6Qyq3q2pyLQFI0B8TnfHDMYVRaOY+E9Ur9CyYmPH+SuZEZJbFseD8r2QVQyR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=XvtL7otr; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFmViqNAVFVfGo6kFMawyfxCc7G4WecoYiHakJC4VN8n72XpKPbqH7X7C07ajWvOFLWZgOIX8kKp3FVXtx0E4VA3bsyDqWUq4Kyeumj/U7WfhanR063eMMu/Xa2PHCJg8gkXZmzOne2fOr6/f249if5FV+eW7v8FjTxR4wdLUccleJ3cU1jNeGgTpvKkd3fX/yA+/tnCdh7orC0O7OMVwzWdEiaSiLkNvpys7Osxa90VOX2MJy7JS167UCInCdXSsA19H/2CQ3WN2zMt57GHeMY72JQGZqkF0a45ISXAzs65iiaEiSAknocvEbWGeTMuU3SQN8oio9So/4SHq14xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=HdnhDQlqlsxFd0+XErhlFnRXAdkbUxrE7ozws5uwmKlRzxqnz5kZBkFUNZd89WutEKBffCqc+UJvoS5Dg+1TOfWjbZKB1YcVGywxSBGF+RjvQ4d4c4GrZBV9MfjvF7ZBiEv5hD3t90ghFlpDhcUiz6tNVTU+MsRkB9h062dXTxKHHOTMWX/NGN8NdLbzMY19oq8pf8JEBPmzyW0U1cS449OwHXw0TM3gslmu576geFFtQOr2Llvd2Rqgbsnew88KZhIBwn5mIYd59tCBbpySzFM15mSikVtFnlunEaN6pDQWVG4AuGHfUGuncd4eFvaFgdxDSFulfeKcuJLbEZqyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=XvtL7otrCLF0B2HtZZCwErCMCV9VgF04wufZBOP9qUpo/kVgGCxrMlOlvvvPRlEU9mV2PmufJZzvcG5GI/+AnumrBf8nnxZJ7+6MuzhlUBAbRXf1V1pZQ/SweE7ZnIBmp9r104DR/vIB50Q0npvHzAkKAt1nVBJlmKNyy7SYq/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9185.eurprd08.prod.outlook.com (2603:10a6:102:30d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 09:58:03 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:58:03 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:43 +0100
Subject: [PATCH v3 5/7] arm64: dts: rockchip: add the vip node to px30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-5-69d1f19e5c40@wolfvision.net>
References: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=1271;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=B4x8zY3KX5X9wBT8dC0eI+dkSq+U/fBGBr32XMjj84I=;
 b=vciibViZMy/7kPert2YZRaS3MgUQhvH3o81l+dtD9bvS5vbS3PK+e/yzvr5w90w98T/F8I1Aq
 yIsiVO9dtc7BT8AyBpaaQOajgEktAzCYTu/Lxhj95dxqbXSsfW9iauV
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d93be46-6b7e-4a43-4a1d-08dd4694bf34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjNNYzB5a3F5UEFzNGhuM29lQWR6TEpDVmxaOTMyTjhuSFcvbFJjU1VQV3g1?=
 =?utf-8?B?cU1xbWI2VFppdmVzV0h3bEVJZm1NZTMxUkxTbTdoRTJYVkswdFg0NC9GS2VI?=
 =?utf-8?B?dWo4VjZHaFcybldXNDJES3o2Z1YzNm9rcFRGUk85cTFRWENkSFBjVjQybG8z?=
 =?utf-8?B?K2hqSWI5YjkyeGlzWFJseTJlTzU1KzlkeXFGejZ0am5LU1Y4L2tKb2VwU2py?=
 =?utf-8?B?UE02MERrQ1NuN0d6SnFHRW0raDVDQnN1NjFVSndHSW16SW10Q0hTMFEyQWFB?=
 =?utf-8?B?RXkzTUF0eWcvMDlCWW94Vk53b3R4MllUaTdIMkJ5VCtrYmdhMVFpTTlaR3Zq?=
 =?utf-8?B?cHhrRG05Sk4zYktIRnhhMldic0kxTVo4MzJnVEVncjB3eHB2N0VQbHJVZE5F?=
 =?utf-8?B?cE1jV2pENlFQajYzdWVBUjRkekVsdGU5WVd5bS9zWGwzd3NjV2FmSE1NaVdl?=
 =?utf-8?B?VHFIQ0JGdnh1TkN0cEV5TVNHN0tqWSs2Y25HRlRadVhvOTdFVHdpZkV4R1dv?=
 =?utf-8?B?bVJDZ0ZSazIvKzdRbFhIT0pDMVAxQkxnWFpKbmpMVDZkLzl4Z1J1dkhDRTB6?=
 =?utf-8?B?dlY4MGFPVGpRdXJONFFsa2tNV1ZrTzMreXVZUG42Y1pLbWF6MUV4NlYrUWh4?=
 =?utf-8?B?L1lNZVNsSnBCOEZjTm9WWlNKQUw2S2MwS2lrQzY1K3VBM00yQldWWmMwVXY5?=
 =?utf-8?B?N3F0SWl5NENEYlBqT0FWTEJPa1hlcm1XeHZ1b2dNVFI1N2g5Ym5Za1ozZFdQ?=
 =?utf-8?B?M3padzdBT0ZXZlkreEwwMWtLellXYUlvZ3VkbGJuV1Y5MlZlWk9sNDRRNDEz?=
 =?utf-8?B?Uy9QSEhyZ3RObUliaDk3UFJWR3cxRXpGTnZ2VWw1akNPOW0ybWQ0b1hGbVFq?=
 =?utf-8?B?NVBKZEpJNnRGU2JqRjUyelk3Q3NlaEFseVBRaiszZWtkeHRwTVpLOHBUS0c0?=
 =?utf-8?B?SnROS0xJazZvTXpXWEVmUTlYcWx4OHFDbFdxYTNqK2lQUVhsN1RzTkZUeXk1?=
 =?utf-8?B?blpsUS9FNmxtTUhSaFNCQzVPdmxIVEZTQTNtQ1dhdGROWkxyUzRRVzJaL2VT?=
 =?utf-8?B?OWFCeDV4T2tkOFFpUDVMU2dRTlZFZkRFV1k2b3U3bVpOajRpUXFGU05GWTAx?=
 =?utf-8?B?UnFwTFUrRkpURXU3dGdqOWVZOHVlM0pVbUNQeDJOUzhWVnZ4R2Zpd3ZET0RV?=
 =?utf-8?B?aEpGT1hTK0xvVEFvRFZaWk13UDd4RWpFcGYyK1dNUkpldGZGWWZuZVQ3UHd2?=
 =?utf-8?B?enJlc3M5dlhhMXBGaWdsUDdzNm5kR3plZStoaEtjaVJLVUZqYkZGdGtZK3VT?=
 =?utf-8?B?UVpRK0lWTWVZeTNhNXpQK3hKWnJTSU5WMjRISGo5Q2ZDTjJQQjhnMHNEaUJE?=
 =?utf-8?B?azZxSlFVTDB2alQ3ei9hWElJUnNpNXp0aWhmQk96MFBaS1ppRWhvdU52dEVE?=
 =?utf-8?B?NVQxNGlNVVVxaVRlWEpQbWN0OWZ3WXY1SjRVeW5HanJlazB2R2lIWUQ4MHVU?=
 =?utf-8?B?aWJpVkNsbDllUmd1dzdjb1B3ZDJuWUhKcVNxVkwvdWlkakdLWnkwOWQyZHJi?=
 =?utf-8?B?ODlZdFBjejExVDBoRkMvSE5maW5xWkZLUldvTVdER0RkRDdvdkdrZFJUMEtQ?=
 =?utf-8?B?ZURleHFKY0hqN3FyQU1TSnRGZVZhSEFPRkRUS1lTOG5wclI0eDE0RzJ3N3NJ?=
 =?utf-8?B?ZXQvVGt0OTJkYW9mNXpPdFlBNUVHTUN3OTVQQ2I4eUtSQ0R1RURvU3J0dzZT?=
 =?utf-8?B?cldWSDBVRTM3TGdoTE1kV2dWZnliNTIvc2x4RERqT0N1cFBBOE5DZ0pNRkVn?=
 =?utf-8?B?Z1QreUtRWjlRQXhJNkJqSm9JK3FxZG9VK2FOYmFiZnhYeEJuNWFsNDVGeGFi?=
 =?utf-8?B?aFJReGVoblJTZmxaK3JiYzZKeGFYcC9YcWQyTVIvVlljU3AvTTJHOUhlRnFD?=
 =?utf-8?B?aWRsRWp5RUpJRU9PVGV1TzVTY1I0NFFNbmFWek5tR2o4UVZESFlFK0VKTDVL?=
 =?utf-8?B?T3RaTW9QZ29BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2RkZ0sxclNoMzNuVWxTdFNOMUlKbjNtVjZ6MDJ5QWt4eVdDSHFKek8rcUd4?=
 =?utf-8?B?YVl2ZURpNW9zMTZTRGZUMGpObmk2eHNWTmxEZWs5OWUvOVBCVk43VWV6ckcw?=
 =?utf-8?B?cllEYVlsTTArajYydENIYXFiYktsc2w2ZkEva2QvKzllQVNNb1c3ZmFmSkQ3?=
 =?utf-8?B?WUpqSlJadTYvYW9YSVEzdEVXdEkzMnZWZ1p0dzgxekNiV0FPMUNXeTlGSHRz?=
 =?utf-8?B?R3A2YVR0UDYrOHdFc1hmc2xYZVZOYkNiQ2xsRmRab2oxb0RRSUFGVWRoMVVm?=
 =?utf-8?B?WmdEMjhkZnpCbU1UdXdFQjI5ZEw1WlFBc1p6bGZXeXcvdmpzNGNLTFhBMDVN?=
 =?utf-8?B?cHBjeXJSQjd0WEFoZDJoN3EyaVlzUC9xQmJhRzVDL2dDZW5KNjUvVFpZYlNy?=
 =?utf-8?B?Y3JMaEg1VTVQSHVxYW1yNnVLR003NzhlMnMwK1drT0VNMEMvR1AvR1djSGgw?=
 =?utf-8?B?UVY0ZDRsSzFVY2J1OWtZU29Vdit6VkU1VnhjTkRodFYwNFE4cmkzU2Y1RWl0?=
 =?utf-8?B?aGtjRjRpT2ZvQTcwUFFsamlqazMvUGFtQ1Vxd2pIcGlsdWJtcGdJcHdGdVlR?=
 =?utf-8?B?ejFxVExCaS9zb3dVallmWTliajA4RFJlUXZlWmw4ZEo0WmNyamtHelozcjdj?=
 =?utf-8?B?a2pJMUN4b0dHN0ZTd1pOOTQ0U3VXbWlKNDFRaStoMWRSWVp2QVYwdDhCUGMv?=
 =?utf-8?B?SEVZT1psaklseldpTEhDL0JlaVV6TFZzRm9OQVRmcWV1U2tGcVZGYmF4Tmdz?=
 =?utf-8?B?RUVqbGI0TXBVZTlRNzAzSDlyeTdpVVpJYktBMXRwd1NBeGNvZkJCNURYSnVU?=
 =?utf-8?B?anp3a0tKWllOTks1Q2RpVmNzQWJKOE1kMHhWQnNWN3NSU05meDJydkhJMU5h?=
 =?utf-8?B?K2RvMzFiaFluMVBhdCs5K3N2WVpPcUpCZUtSVkh3MnpBSXJKZmNBaXczVU1K?=
 =?utf-8?B?M29Wa0pENUI5MEhMT1drcGNlbEtLRUUvaUVVYklLQnlSdmQrRTQweGNQbW5X?=
 =?utf-8?B?aUpiRFZrSVVmRkRtZWhIbDdHZXdNVWdMbWE1bitRVWRDbFlHTmRhVDJnOTZx?=
 =?utf-8?B?Q2k2dUVOeXlqWEt6WjF4R2t4blNBclllL2lRTXlIOGN4U1hka3NVL3M5cXBw?=
 =?utf-8?B?eHFGbDdaeGZzZnhkbVExV0xueUxwUnVwanZYZXpvOE1acHJtQVJNNUlJMldC?=
 =?utf-8?B?MFVKY1E3OEJCM0NnNG5pdysrSnZUY2JYUFpCWEV0Vjl5V3JjR3owMzd0aUxo?=
 =?utf-8?B?ckZEQ2llZyticG9ScERzbTdNZTJCK2JSeTZXWHJySFNaNjVacVpXcmYxNmpo?=
 =?utf-8?B?N0sxdDFnZDAwbjYvc0RPUUFlV3dPWk45NFltcVd2blcwMXRwTU9TdDM0QWZF?=
 =?utf-8?B?VGl4MVZDQmRTc3JyN0l3RUZkUS9pbHpKc3ladFpIbDE3N0NhbWdkekN6Qmhk?=
 =?utf-8?B?MWpJbjFCekZScGQ0RlVmTElFMFhvRENudXBsckZpR0JPdHYwM0pMTGZWbits?=
 =?utf-8?B?QVdWM1hBODNBbEJ1cTNQN1grMGNzUjFtaHhBMlFiOG9JWTF1Ni9hQXRHclh4?=
 =?utf-8?B?TnNJYkhyVUFvcEdyNnRBdnV6ZjNUNi9rSmRyT25kRVZxaWs3SEhxMHltTzBN?=
 =?utf-8?B?REh5MFZYRTV0aXBkVGJrb05NTGVlS25VTU5pS0I4cE9KSXEyQ3B1bk1abFhM?=
 =?utf-8?B?eU9VUWRIV1pGang4dnJ0b1lHTjV4MGl3OTAxNThpWVRwbEFKZElmNlgrUktK?=
 =?utf-8?B?Z2hwSVRxY0h2WUVYbTVLcGJvNzc1VVhBT1FZZlNmd1JnRUEzUWxid2hvbGxS?=
 =?utf-8?B?ODJUK0xCcnhhUmRuaWxIQ2NlTnBkY082STB5S3hFL1RBMnVrN0xPZFpkRldX?=
 =?utf-8?B?ZDd5WFJ5ODRrQlI5MUVERm9JbC9oQ2tNdWJlcVNVLzMvMmtqRDNCdUhkWll0?=
 =?utf-8?B?ZktRbTl5NHd4TjEvSnhabllhazJaR0x0dHhOSjdaZ0orZlRNamZTanN0dlRE?=
 =?utf-8?B?dnNPZVRBenErd0Qvdk0xTGpZYit6TEdhUTV1bUtyNFFKQVNMYlE5YTlHdDlx?=
 =?utf-8?B?ZzhWYjNGeEtYUGV6VW82U1RNeE5BV01NQS9xaGpaTHg3eFBuNExXNHM5VlRk?=
 =?utf-8?B?RDN0L25SRm83TG03MUpOZGY5b2YyektnYlZNUUpNTk1RSjYrc1dqeGhONm1V?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d93be46-6b7e-4a43-4a1d-08dd4694bf34
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:58:03.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eoSHJE/PWfo9dDITJYF+UERmPzymR55zcn+UOjwy5C6V9hg4OQdk1iCu7XldTrOik4JXos9qFCiwYcY6C7L/pItpEDO4MoS8z/RQpvmyu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..c2acf5952d08 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1282,6 +1282,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.34.1


