Return-Path: <linux-media+bounces-27766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E765EA551EC
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D7B51675EF
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7B825A62F;
	Thu,  6 Mar 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="RwGXkvcV"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5532566F3;
	Thu,  6 Mar 2025 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280181; cv=fail; b=csDdC0oJhcGvZ800N3oRvyV3mSuqh5bRmQa8hWBq6ghdAa/aMk9hEKwJ7gVPh4l2kuxGYbN4jgRR9ScguNh/4j4o3ZZShu5FxGD3l2zfXddFZC7SKPnZGITicSfxXu3pzJ0iwIMMB5KwKW9mPImKrVKweMta9geVbuKlvRr9JYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280181; c=relaxed/simple;
	bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dw6Z+jaQGL/ebei6PfBfC4j/WOwhAX4BB8igrprSeoz0TI3HXtTG+xF8apgi4rKLy7REKKa7mEGxcSsHQyTjAdrgo/+1fqZgsb4Uli7JNSBHGuparU2GvH/oyp6GjMPANy3JF08RKuCl1PCuA6xo2kdEzO3503VkGs5cXbjecq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=RwGXkvcV; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvIjx23a1+752CYavo/t5TJkWr4aFUnd3U1xWwZyVz9QKgJnzenEOfLHGy+fOAtU8i0/bzHX+m6HqlMY2FV3WSutmCXP+chj5OS7mBPqXJ9iCg3hbWFMmMcPA7Norap6YeeJnWuXizISuSAAN/Hp98yYpRA7QaTgeHg7aBFIEMoUc7CzAgxadPJ6y2s70ms6bW73nV0wLK9U6CpG8uUoXjz7A8/Nw5vhM0m4LgqfVqFt3UH/t/8ZxHFE1stBq0ZElWqi5neHuXe1LIs8CMMvT82YBQo60tpUClBrv9MQhhv+5ni4T4IkZ0dBLEJMyWnPxTSmzuGv3Y2vQS/XoGU2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=mlCTw3WAygVyvTg9+/WYc7HEzny+2i9DCQ10uMizBu05bUGcMjDOzzZVclo9QeRpxQarwsx8mJ+vRexN8MqOHhl/LvYaManpbP1tKtBbyoniULgdHF7YR5PY9ueciOOYG4MthTUnW6EMV7NeY6P5RrP4DS3DyoK9qZ71vffuDMJGH3qZg6yyaUCXwTg00J3k+3ucLoFbfXOsRCLnrk97GEP3doauPWbSpO8/8RDQ2IpeEXlNrDTh1+zmASR7jpUIeTSkFj1lpNkRSYZGvLTGr8DXnRsOewoxFqC89MV7xzvY6Bl2t2sW9Fc7q75VYaaWbVpSv4v8PhxEsBRcBjkgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=RwGXkvcVI1n8Od9nmWFyRp9HsGqDPokF/DUpQIbtbuWbyf0HcKn42CS6xLFVbSXUqBckUgviupaz0VTmKPveIVHK4BcLUdmiGxF5jQJsdZXGBd9c0b2txqNvz0fxNLUV9unkfWfKPVVIPl064w2txng/cv87+fqAVrsa9t54/yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:10 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:10 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:02 +0100
Subject: [PATCH v5 01/11] media: dt-bindings: media: video-interfaces: add
 defines for sampling modes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-1-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=948;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
 b=/IRBgkWUArO7MkXxGwelGUT9g/3OnYNnsJQpQW5eyshnrWdF3hQ7rAk0dfoEfVbMXSJbgM7Oq
 tSjKhpDc3bzDjGB17xWrUziwH02+9BLsETQUd8+oFpck0vhqW+FwIAM
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1121058c-6107-4a3e-9c02-08dd5ccfcbd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXQ2RUNvcHNFV3lVaFRXb2I4OXNvQzVVUVVpMXJkZis5TXEweW5DOW1VYXQz?=
 =?utf-8?B?U09kcTZhSFN3MWtJTXhEalVmVTNFRXd6YnAvMWNWZUFWakprR1pUQzFBNXpP?=
 =?utf-8?B?eXNWdDNBVWs0OFBIdnZOMUVtYjVLZEJIdUcxV25lcnNTVjJDN29CRUNGT1ZT?=
 =?utf-8?B?Y3pPakFkOVo1TWRiL2N2eU93Mmw0NURqVFdpYWV3aXl6N1hNa2p6RUt3Z2t1?=
 =?utf-8?B?T2I2WW9HVjBnbkU1YkdLMENBeE5vQW9Ebm1VdWpGYmJSM3lKdU5mcGN6Q2xp?=
 =?utf-8?B?U0tveXRnSVlPU2RFcEJURi8vTU0rQWgrVVRIS1VYcVU2Mm5OSzBkay82R1ow?=
 =?utf-8?B?TzBlR3U4UjdvNlJ6ODRRRUNMRWQ5ZUluRlFMYjUxZnlXSDZFMzlaTEVFa1lV?=
 =?utf-8?B?a3lFUmQ1UDNxNXNMd01hUThNZDdxYnRWa0h0UW5KTk0rVjRVK3NZKzgrWDlH?=
 =?utf-8?B?bUQwR0o4NWVRZzR2ZmNyTjNGdlh4V1VjQk44TmMweFdYMDI3RWpYdDZLd1M2?=
 =?utf-8?B?UnlhVGRoVDFuT3VQM0lTZzY1S1VwMnBTZm1RVFlIaWZhMGsxaElVTnpCUks4?=
 =?utf-8?B?V1JxV1VjV0FkaHQ3L3pocDR0ZU1sWk9iTDI2UE9UQWltN1FKdjN1QnhoU3Vh?=
 =?utf-8?B?Y2ZDYUNub28zcDM0STI0NWF1cHFNa3FFN25CRS9XNmJHWEt0VVdiZjJna0NK?=
 =?utf-8?B?Y0p1WFI2M1RnNnVpbVYrM25WK0VmTlpxaTVXak1iTnM5aWd6WE8zSDZKalFt?=
 =?utf-8?B?VzBoSkdXc1Y4d3U5bDJ5WEhRVEx5aStzWXlwd1VRMlNPcEhvb0xNekJBeWJy?=
 =?utf-8?B?bVk2aGNrRzVRSXNGaUY1WFRyUEVGcFhabmtPUlM0Sk11eHN1WmVKZVJ5OTVj?=
 =?utf-8?B?YXJrTFoybHBmckNPOGM2dHF0Wjc2N3RQMTMwUXdNeUV1M2o2MHEwcG9Mb3Jy?=
 =?utf-8?B?ZFpsb29QbSs0RFA4Q3RnY2RpcFp6dkpqNVIwNXF6RVJkSGFIaWZMUDN3S2hP?=
 =?utf-8?B?U3Avazd0Ni9mV1dFRHhHNjNxS0NkZWJoa200RE1jZDVld0Q3T08rZlFwVWQ1?=
 =?utf-8?B?Tm9nQ0Z5STQ0WjE2WmdlaWtJK2NCUlFIWFpXTWlLYjFTOFc2RVFOSTJrbnJm?=
 =?utf-8?B?cFFqSm16T0NJdm95S0U3VVNNZFUwcktQYUdBK1hxYWVLaXVmQWFsZyt0bFU5?=
 =?utf-8?B?MEV1Zml1NmRXTVMzYXAya2E3UmVSdlQ3QVFraUlPZEh5K21SSzRpdzhoZ2VR?=
 =?utf-8?B?OGdGbGZIczVZSmxYY3hxSGcyemtJRkNOaXF1Z0ZkTFF0YVZENXRuR0gvcDBs?=
 =?utf-8?B?S1pIZU1xNXdWMU9xNVFLVWhYTXJaMmpaNnc1elNId05JRzNuMkI2Q2pIamdJ?=
 =?utf-8?B?eURLemEvbmkxbXNURUhMMjFCelRwN1ZzbjEycmorYk9iNjduZnVOVHpyUjVC?=
 =?utf-8?B?QjB4czhHNXV2TXE5UXgxdTdwSzJnT0ZtblpjdFRUd1h3ZzR2Ym1jRnFRdjN5?=
 =?utf-8?B?c3R5MXl3TTFTd0ZmZ1FCbkNnTmdhVzIrY3gxK0U2RlFQWFlLMFZJeG56ekVE?=
 =?utf-8?B?N1hmU09CUER6cjJubHVzQnQwZitsMXBpcEVBdCt5WEw2YmN1RVlHbGlnZ3lT?=
 =?utf-8?B?YjFnRCsxaVYzbDVFUzZacjlrUzlieU94L0NxNVpDUVJqYkZMeFFRa0NOWDR2?=
 =?utf-8?B?VHVLQm54cUp4NDA2VVllNkF5anJKQU5hVEhrM1k4ZWZUOUZoTE84eXBweWs2?=
 =?utf-8?B?Zm43WUQvcGlzMnBTb2NTWStNVGFKYjhsbHk3aElDelFHcnYvR1hHVHg3RkZG?=
 =?utf-8?B?d0ZWVGJlRXpJTWY5dGZlaEttVEtVRSthTW01V1JISHZiNll0RE52NExsNzln?=
 =?utf-8?B?UUExNVNwMFN6cHZiU092YWxiR3VaNGFaVjlQVWRYV2dxVFlzL0dvYzFZQmRz?=
 =?utf-8?B?TXU5cjdDTTFHYyt0SXZNemkySUJ1VW1CWHNNTFA4Q1dRVnJlc2p1anZ0Njk5?=
 =?utf-8?B?eVowS1JkM3VBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzFhalFRM2JOL0I4SUp5ZDcxeGtvem9yNTFMeko5QU15WlNVSWJzcHVPL0lp?=
 =?utf-8?B?c1pwbit3OGlYZVN3aUdYSzJ1T3o0MDZjcXhEREorWVQwcmJRRk8zZU9ZeitS?=
 =?utf-8?B?RCszdXZZeVByNTRIY3RNMUR3RXJNaEdobkNhdWswdFhwUk1CVDJ4MUIyNVNP?=
 =?utf-8?B?Wm50S0FOUGVyMkxINEJEdXExZzMwRjMxOUE2YWdqUkFnK1pDTmIxSDRJNC9y?=
 =?utf-8?B?UldkdFd3dXN3N01SZU1WWnpUYmVEVXJNRXJZTkFMNWlhM0tPUWtwc1VMcE9x?=
 =?utf-8?B?SGlkTk5USzV6RXJQa1JFYUp4TXBZbDhMWGRJVG51ZzlNc21yL1dDZ1dCMlpK?=
 =?utf-8?B?V09Cei9YM1lZZU5qL3NLNmc5ZG9NWnZpYkx6YnNkVXlWdWtjQThqUlZMdnpV?=
 =?utf-8?B?c0x0YytQQVNNSXpYNzl6aCsrZVpjQlRnZ1k2am8wRGQrMDFqTlVYSXQzQnJV?=
 =?utf-8?B?NVZLSU5sWFJrQnlXQ3hsMmRxcWVyWExOVi9sZFNrclhwOGl1Zmp1emtDVE9Q?=
 =?utf-8?B?Q0JyaVFVdXUxc0dTaUlpSkJVblJUZUVpUWNvWUJDU0tXeVl5YXhYMDJWc2pW?=
 =?utf-8?B?YzArRVdmcFdRV1lmODNkclh1cW52UVY3UVBpOU5VblVQMjhydW9sTzBzSTc2?=
 =?utf-8?B?aTkrYkpKRmdoVzlGTzllZlgrMGpVQVhrcFh2Q2F0RFcyM2xhOUJ2WkNhdkc5?=
 =?utf-8?B?eUlBUjFONUhjNHAyRTcyajRucUdlWHJIb3lXZlBUa3A5eDNqejNEcGE2eWJ6?=
 =?utf-8?B?ZXo1Nk54eVdwUnZGYmE2S2RUd2RKRGlSbUwySHVFNmljMDQxU2xiQTBoK0o1?=
 =?utf-8?B?R0d1VUxVU3NxbXd3YkhVQTdCR01DUzBMVlFGVUdncjhpR0JOL1AycG1zbUFE?=
 =?utf-8?B?K0lqbkViZEJvR0RsdHFTQVZ2bEg0YkJQZ3FnUG56dVZBMXBDUFpBYm1ic2dX?=
 =?utf-8?B?Sm1nR25pTFRGMlBiaW9HUGUwaC9uQnU1NUVadENPVjFrcUJnYmFSMUF2ZXVS?=
 =?utf-8?B?STdqZGJnalpoMXNXb3J5djFYT1AvbWlFaGloellDUW1JaVR2R2w3bjNnT0do?=
 =?utf-8?B?UVlzUWhMMWxPcTJ6TFdlczZGWlB2SnRMclVxZ1BzZ0xVcS93WWwyeDIxZk9D?=
 =?utf-8?B?TlFtRDR4Q00zZ0V6UWFSaENnaTRXclA1VUZZWWF4TUJMaVRrSWRZa3R0WFph?=
 =?utf-8?B?N2ZiRU1xbjIwNGw1NlBxUGFyd00rVExkQk02Ukd1YWdIZGF4VGIwMmd4eUli?=
 =?utf-8?B?RnZONHAvR2dIZFl1S0xhNGF1YnZLdVF4VnZmK29NVjFlaTE5NW1TcG1sdGFZ?=
 =?utf-8?B?WUM4YStyUHNNWERhTkZWTWpnSEx2NTltOEJTT2JNSjMwd0tPdVlOZHRad0pG?=
 =?utf-8?B?Rm9WK3hrQ2dPelk5QjhEa0kzeTRBdXdkbHVzbGJWbUlMRWxhS0dLR0RydUFs?=
 =?utf-8?B?elFQVWQvbEZ6UkF1U0p1NjE0SERudHdEUTY3d25nZTJUQWFubkFOZk9OSnNE?=
 =?utf-8?B?NTNMMUZBN05BZWJqOFZVNUpSSTY5Qm04T0Q4TDE3VHZwUXdsbGZPV0dwVzZN?=
 =?utf-8?B?ajVLbkI1eHJuVC8zVWlFUWNUeGNNbWlDaTVyUDJNRmZweWRCTGl5WlVYN1JF?=
 =?utf-8?B?cXJBN0RzbkUwanR5SE5DWEtWVTVkMC9kUVgvTzhXL1dXWkRGMllMYWFGYy9P?=
 =?utf-8?B?cFAyeG9Nb2FhN1RZQkd3dy8vaC9LWWxsTlJ6dCsydDdCTUVDbGFXOFAxZzlz?=
 =?utf-8?B?MGhmVU10SzJEeGJKVXJSeUU2SktaQjgvam8rVVhxZkI3ZVJPcXdOYVcreThH?=
 =?utf-8?B?ZThYT1NyMDhjNDBLakluZHpleDRrSUxxUlpLR2UyTkQ0VGNJSVd0MnlXbE1h?=
 =?utf-8?B?YmVDSWwvb01KMkF1U1ZxbWcyTTJPYVp3K3Z0UlMrL2tyLzRlZVhLRG9KdDc5?=
 =?utf-8?B?ay9oZHdBV2prNlhtWlhSOVlPcXY2SkgvOGtuQjNCZEtpSWkxTlhYc253bHdu?=
 =?utf-8?B?MzBER24yRTA3elY0aUJUTDhudTZVZ0V5K0ZqY1NlQTV0QWVQcXFobklndnJF?=
 =?utf-8?B?VjRaMzNYRUorMW9tNHlIVlNORlh0RWtmSm9UbTdqWlYrNURlclN6OGRINGp2?=
 =?utf-8?B?eDdRY0RXK085NWVIWFZ3TmRGQUJsZmVNVy8rUXpOQUxTOVFJZVlvUXRxM1JV?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121058c-6107-4a3e-9c02-08dd5ccfcbd1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:10.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e8QWRnOat5yeg+WZ9apTi7dgGL8E/IYEIwmhMf7D7ZjBh/fP3rfzEVLVTL0KhZrnqgVtUvlRWi8D7PLEgilcqOQ5Yk08eMfXykbcQwXmsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.34.1


