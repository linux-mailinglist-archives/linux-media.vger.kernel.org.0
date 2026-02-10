Return-Path: <linux-media+bounces-52529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA6BOHFni2kiUQAAu9opvQ
	(envelope-from <linux-media+bounces-52529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:14:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6068011DB72
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB5043072444
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F59130F541;
	Tue, 10 Feb 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LVrzi6vr"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7193859C4;
	Tue, 10 Feb 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743570; cv=fail; b=L3WJUq1sVtlYAtLxF8seWwKZ5i5ShWZxkxklyZJtPyRLBfGyAhSEhKb773vy+7FMhBB31O6HMkRACnQEWfoMF0UFRstb7YdSECCsrBGh6rH6KLRyEhPl9gQbal3s+L17fAHZF19y2teKi3KcIp8xKcM9/+HthVexfaafP7vwyds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743570; c=relaxed/simple;
	bh=z0Wr2ZSJlkaM5fTVFO5qWohqLktMeSjxMQpbo9G17+g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eEWmdi+8psLyqOQojIIaDJRu7L2Waf+5HkCaFppLc94UCfAwsoGbF2TIqfVmHsxRiWAagrRrUf0NGbL3pMhKWCgJhKlEgfXVOqL5ihTxvUm7WtsgCc0w8/qYqoG934ztc7S23TbCOTL42Fz14l1FwcVRtDVdc3FOQeL55xCUaZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LVrzi6vr; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMV5kr81BQJI97tN/bu1aFIKEwwCLgzWohj+q0jnS4AAM5SihGKgT0eNQC62s4ZXkWPGDUxuWqOa137vCoGqY+ATwt2xlZANxupL5wrhSxYy+XHNds/Klx2P0rkw1H3YzX1pgs4uQlWrb8bgiqj2KTlYLSyhDlVGSHNDXgQY/MRGA+MUZK845wmBAKv9QVkw76rup1iNZgcNNkgOxzaedHGyAUn+i8Yxr2i2B/Xpa3LrxHFVduzxtDVm2rJFg0AggWoGw8BY4tvsrpnXlmkKPzDKG0Lz1KbtNrdro0Ab20ygcjvmXe5m/WciaW5zmfoRBbB8cRB1YpEPcgMrdm9CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI+nEqNdK0UWkseg2NcFoIJdjx+TXmlPN23gBdI+/C0=;
 b=KihHL3moX9GPElFFpNZmFA8jiwVdRIPwmaG5wh7RN9BBjw8P2PtwqKKRdkgiHosnfCDdwR1HlkUe5U8WeYREyOs2ptqAG+26NTv98iF1qNYBpjCIV5kPkbDHx9hFPZ/TafQQbKdSJB1mhsR1MkpEKNgEXlP7GvcDpH98PT2vxE8lx0KRIzlD4sZ/SOKs50GlooAs31CA3BlgB1TrRyCz1LUzJ41O3nEl2FlsLKwHNXebVaPe+B5CwKTSHVrFZcUvyShc+4QqsumHxl/v0dOn5Ukl2cf/VQj2iF8v7QLyYoGzunkgeR3HhwlVfxKrHWFicFpapNS6yR81qPIbo6u0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI+nEqNdK0UWkseg2NcFoIJdjx+TXmlPN23gBdI+/C0=;
 b=LVrzi6vr3wFSXhNSeCwFfCaY4KN6AVDQ1njM97D6wH4hDdPlMGqlHOVZKDx642pEeFG8HlVmJnxdPBY+t3fkGFwfTDcOrGQNVp5X9mHXNaVNoOWu27rhn9PloBS23nzdjfoYFnn7yoc/6UiIllTqN3mlx/wEwnBBob+YpFSFvCmpti4XGK6f66Q0lJ8lo2H2+/+U3GkPMam/tDNndqxo1qkyrhiBYOelZ6F3A2L6zxVLv+ocqqAU00DVXLl/V//brmcXiVbeqVyMFocIwwmUnlwM2+yIwtZfNINVH4x5m489GPZlNwAjRc+qKgHcBXvSP4kHd2jk6vxEwSx9t4zJxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:09 -0500
Subject: [PATCH 2/6] media: synopsys: only check errors from
 devm_clk_bulk_get_all()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-2-69667bb86bfa@nxp.com>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=1035;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z0Wr2ZSJlkaM5fTVFO5qWohqLktMeSjxMQpbo9G17+g=;
 b=3l2jFycVP/cn0fG/dGD8IclQa0VpH9VjTw7zyd3OEjwpz3d03ImkH6xV1lOT9W1gKiv+B1wgv
 lJ4zo88ThVAAyW0bYzitJZE0SNrOKcL/pbvxrin3hKVVkri2CeZl7v9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 118e86cd-924f-4b45-f88f-08de68c77239
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MU8zbUgzMXdUZmlBY2s5REYrYTR6WGNGVHNTdEpTNThuL1M5WE1jL2lqdmd0?=
 =?utf-8?B?WW9aVEhPdjBQVW5TeXFscHlRbVQrQlFSQWxBeldNaXZ6VE0wMWplWHRPbUx3?=
 =?utf-8?B?RngzNkpnVisrY0xweDVsWEtiaENQY0JQUDZYSy9VeHd3ZzJnL0hrWDZCWW8y?=
 =?utf-8?B?UmhicHJXUmJ3RW9jbVpSS2ZJaTRRS0FDUXdRTFduTHJIY2NTNWpIbENqdDNR?=
 =?utf-8?B?d21jY2VBWmx2TjErdEgvdVlvb3NlU0tmdVFtRzhKckJDRWZhQjZZbkc0bXl6?=
 =?utf-8?B?VU0yaldWeG1uUlFyWnEzeVlUenI3VHF2ZmxtS2tuV0V0WVl3c1Vra25pU0pG?=
 =?utf-8?B?ek1Wc3JhV05HR3lieExjY2JxVTVYNDk4RFZCRks4SFZDeTRja1M0UkpSVGdS?=
 =?utf-8?B?ek81dEltcTF6SmdsN3p0RHp6dGpFOHIzcFR4cHNCVXdsa29qY3ZUVk1tOTl4?=
 =?utf-8?B?SG9yUEo0TUMxZmJhU09vYWUvWWpuYU0zTTJCdzZDdDcwemdGZkNpNS8xSDVT?=
 =?utf-8?B?b0RURU9QSXN0aEwyeFlIQTVOb0pXSjBWR1M3QStvNFp0emx1ZlB0UW8wenZx?=
 =?utf-8?B?YTlZK2hnVG5teWl2MVJ0N0FBSkVsWFRpL1MwUWF5eHhnbXh2bG93ZnpBRXpD?=
 =?utf-8?B?bVJyTlRrYmltUnZUMFd1N2xyVWxucUt4Y1g1YVNLM2dFSFQ0WE5WQXM0QmMw?=
 =?utf-8?B?cUJkMFZkRWt1c0NYYktOaVR6N1d5UjB1YUswYzdiYnNrWko5bUduK1BGVGVU?=
 =?utf-8?B?NkJhN2JlbEVTWlBZdzM0Q0RFak5TNDdFOGF5L2xkdFpNQnBjdTRwRzN4Q3BV?=
 =?utf-8?B?cWJVaVlxUytFY05vQU5SSmtvVWYwNmRwdU9XLy9EbC8yUU5jZ0ZNbDEwRU5L?=
 =?utf-8?B?bGd2MXozTmRleGk3WldYWDM2WmQ0ZjFaRDhISm0rQ0tUSHVnSTl6cm05UDU2?=
 =?utf-8?B?YlY4SGtrTEtWMkJ1akIxV1hNcHlHSVhTcjcvNWg4Z3gzQ1lMNEoyRit6cXF2?=
 =?utf-8?B?TWg0NFVJNXNFdlJiR29WODBvd3EzSEtjVFVIRkQxcWFKNEJ3VCtDK2xmLzhh?=
 =?utf-8?B?TENtQ1lsWnIwWVJvYkRyUkJnTWFXQlFCZVQ3RGdtV2xFNy95VkkwbGhPQlpy?=
 =?utf-8?B?b2FCdXA3NTJOQXRTUzVCeHpPcUc0MEorSFNMMy93YmlTMEowQWxWcG1pT2NX?=
 =?utf-8?B?eGVZSTNHc0x1RmxKSUlxdWlnRjZIK0FsUDdNRFVwY3RQYytWWk5QYnd4TkFP?=
 =?utf-8?B?OUZJYVZoQmErblZqdE50VXZtZURJcUJFQzNCd2llYXkzT1dvOU12a3NWemhV?=
 =?utf-8?B?eWxQRDE3aHc5dFBoVkl5dXhaaWhPbS9hdkM5NlZTTHp3dFdSSURnTzNPTEJ2?=
 =?utf-8?B?eUxzbjlsaUl4TjNZKzBjVXdKc1ZWS0pVVGR1YjFIVHVnMytZNFd5V1FJbnQ3?=
 =?utf-8?B?ZVBZNENqNEdVeE5RWGkxZ3o3Sys1d1lRbGw4VVNiblowV3NJYy96c0I3bEhL?=
 =?utf-8?B?RnZKOW5VcG9KMWV2T0VoMndHd0RRV3lDTXh2WnBMUlBHc0tWdFJ4U2lRcVlH?=
 =?utf-8?B?S1FndHh1NWVhRytHMG52QitLbmMvcGUrd0wyL3JmRThPdXFtOWFZVFZLUC9I?=
 =?utf-8?B?UmNYL1FIVHZMcWVmSGk3T0tRRU5HSnlCbGdZQVp0c2EvZDNGZXF4SlJIelJH?=
 =?utf-8?B?WWVrUTVLRisxZkhWbHdydVZ1d1RtQzJILzlERTNRL2NQQlRDWjdOaEYrSUE3?=
 =?utf-8?B?TFZLRmFKTGp5eGFiUk8rLy84R3Y0UWpWR1J3NStjSWJuY2FDWlBhLzR5ZGsv?=
 =?utf-8?B?ZjlnbVBKRVhCdFdUVTN0cTlPZTRLbWxTSTFNRnZjUUZ2V1JIL1pEU2hnQmNO?=
 =?utf-8?B?czFJR2YxMzZXY0dkQXBoYWY5TGczMElqc3E3dTZxcHkraGthWG9ZeXU0Qitv?=
 =?utf-8?B?ajVyRHlGM1hiZ2JMa2l4bEFWMFdwQkpqNFRqZUdTR2RKR25kMk05L3ZkR1d0?=
 =?utf-8?B?M0JBMkR2b3lzOHZvYk10SHJrWlFLekZFaXVpL00rc1c0dmE3MmRFQ3JBeXVY?=
 =?utf-8?B?dDkvbmhyNCtOc3BSZkNHa2RuaHBGeVExN05nUitwUHB2MGVlOTRYbmt4NHla?=
 =?utf-8?B?TVBybjJyWkVBZ0czMklIZUgwWWpqRWxQZmZJZmRLQ2I3OW5rTlVLT09VS0VG?=
 =?utf-8?Q?dHMZsK92q7Qg4buZ+WrLkVQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c0RIUEdkSUpYQWVsTlJqb1Z5QWlBZHJ4Q0FEMVIwUnVJN1hyMlhjSDAxUnA0?=
 =?utf-8?B?UXp4SWJlZTV6d2oxUkRiMmh0b0RyRXlyMVdmTDdJbDQ2M0dCelh4N1VyUjdz?=
 =?utf-8?B?eWdzcFN3YmI2c2FnOEhyNitsTkh6aEl5Z2Roa1FGNFBXZktUeWhnSUttdnNV?=
 =?utf-8?B?S29tUTgxM3h4WVhlTXpsQkhQUERmTm1tSEoySWNzdC9FeUI4a1hKaThYSllF?=
 =?utf-8?B?ejB1b1ZFRnRPSnh1eFFpb28rczdCK2dhQjdsdGV4cWZ4YW9XRXpxSGdHbzQv?=
 =?utf-8?B?dFlBclFrNG9lWVNvL3VJYmk4azdMVlZldEVyN2tVaGhkUUJIZTc5V2dKaFNq?=
 =?utf-8?B?bDQvb2N4eG5NYnFmeU51NkhOeFFrYlJEcW43SjVNamdrY1lwWDN3aVFGb0lt?=
 =?utf-8?B?WUlORzEyblU3dmhEWWFEa2FPSi84MnB4Q2FDWXlnNUEvbXNSNFZmSzZjWURQ?=
 =?utf-8?B?bjEwSUZuRUZTT2xLVGdDVkpzeGIvL1BSMkViZXhTUGEzbEZIbU5SOWsvdmQz?=
 =?utf-8?B?dUh1UTV5dTMvS1pRRy9NVGdWTGRmZjAxUXFnYkJGMzN6S1VCVGp0U3dQb0R0?=
 =?utf-8?B?cmtZMzFoSFVWM3paRWNldTNCRWgvTCtwV3lBMUtYS0w0aVQrQzdPRjBwblJ0?=
 =?utf-8?B?dFQva21ubjFqVGRxRmJEMzhrbUlMZnRkelpNWG1iTnFUMittMzVhaUMvZ1JW?=
 =?utf-8?B?WlJDeTFWL0FiR2gvaFdhL2RISmRIc3hiZVhGWVp0SHZiODdwaWJwRFAwN1Iy?=
 =?utf-8?B?WEhUbXRoTnhOQ1VLUGxqMlVJTVIvVlRtNnNvMXFiblRFRmtiK3YyYldlODZr?=
 =?utf-8?B?UUFlWTZGaXBsU0lkMHRVaEtQMVU1TzdUUFFZWjlNeDQySlBCdGMrejN4OUxG?=
 =?utf-8?B?MG9uQkdTTzJFa0JJK09UZGF0KzJWL0VieWFORXpMWVExQk9vTm5JQXViLzVp?=
 =?utf-8?B?U0RXNDhnV3VVcXdCRi90eUdsM1VPZndiTmJpbmhoVkZRbFhqYnpMWnh4YURP?=
 =?utf-8?B?a2tPSy9qL1lzRTJsUjBYaWU2Wnp1MHFNK3NMUzhuNTlYMko0dWhNb2xWSHQr?=
 =?utf-8?B?aS8ydThoWnFNUU9oQUN6SmNHVXdiMVJLY1pHUHFzQThrcHcvVEdJV0x3TmRw?=
 =?utf-8?B?amU2ZGh0OFBlR2hpeFd0U0xzQUNZL2FseFh2Wll1YkhQRVZGRFRhSWdMTlNm?=
 =?utf-8?B?TUxwNDhmOXJDTFhqakQrN01mN0dsQmE0YnB4WWVKbUVEb21JZ09TRXUwaTFN?=
 =?utf-8?B?T1E1d2xlQlhmaGgwbUNDb3czL2VoQTBLcHBVZjNQQ2pyWTNreGc2RUN6TGNQ?=
 =?utf-8?B?N1JEcjRWdngrTGEvOEdLNVJXQ0c5ai9mUlhBQzV6aHg5NTN1WnlsMmg5R0tu?=
 =?utf-8?B?RXBmek9qQ2xDMHk4NU05QzMySFFRWnpRMnJLU0FxOXQrb2NrQVhMVmt4Zkt2?=
 =?utf-8?B?Q0EveTFqVklFWDBiSDJRODhXa1FCcytJdWw3eWtFblpoSVJFUHJSdEdXdXVu?=
 =?utf-8?B?eEN1VGp3VFpIUW5BVG91Y0E5Q0gzbUpKZitLOEd1cldBeWhhR0hTV0dDb3k1?=
 =?utf-8?B?a3c4Y1lSTDB2L3RTbzFWVUZ2OWc5MlB2NzVuSmdqdG44UHZCMDhDRk1KdUsz?=
 =?utf-8?B?WTRnaVlLK2lFMkMzc1NVR2MwQ2hmSFREUjJtbDdsK210OWVvZ1hmMXh1TnY2?=
 =?utf-8?B?bldHN0hsN0RPOFpDM240LzJJL0Z3WkNJYWNqSFZLU1BBMk1nYzIzQ0REL3Jy?=
 =?utf-8?B?ZHVhRHlHQ3RTZE0ydlMzMW83M1o3a2YvdGNxcE00Mk5iZTRNK2RGUVJIK21U?=
 =?utf-8?B?TnlyVXZKc2IzUkN2NzZ2bVpta2Fndlc1Tm14RVF1Wk10QXJPWnRtQ01lN1hM?=
 =?utf-8?B?TlBwMVZUZklXbkhCWXVqdnFkSkRHVStaOWtlNy9zMWRRc1NSc2d2NTFzUXJO?=
 =?utf-8?B?L2toMGtCbUpzb3FwdE5LYkJ3YWRBR2RmRmlQa0p1U0Y4bzlyWmxRRmFMZ0ZU?=
 =?utf-8?B?aldoTFZKR3VUTGE1OUo3WkRDb1dkTGtydDM2bmFwTU9tVmNZbHNYV2d5dHAv?=
 =?utf-8?B?TDFnY1NtVTk5MzB0dnBQSnZJeHdsRmZJQzBod1pocjdyRC85NWUyRGJlbHI4?=
 =?utf-8?B?YWRPeHI5ZjQ1K3hiOVpLUkZPVkRDblNCaGtmd1JCS3ZsblYyTUVzKzNLUlFB?=
 =?utf-8?B?Nk95UXViUXIvSW1PUXRCRjdLVkpOWVFDdEtIc2FDMUdyclc1SkZzOUQ4WGxa?=
 =?utf-8?B?amdSZzVOK1U1T0g4d3NKZVBRcFlTWkNYcHFJOUM5ZUdUVHRSbVlFd2RWeXRM?=
 =?utf-8?Q?6eP/3qe0V5cWmykecS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e86cd-924f-4b45-f88f-08de68c77239
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:36.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qksAxc57vNS+p8uyQo14cx3kSegwG20eip5U+Z9qJs3YE2bcWGcVLFHIsQcQhWQIeHmQRgyTR5CgyYVYhloWJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52529-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6068011DB72
X-Rspamd-Action: no action

devm_clk_bulk_get_all() returns all clocks described in the DT, which are
already validated by the binding. Do not need enforce an expected clock
count.

Only check for error returns (< 0) to support more SoCs.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..61cd7f491b3d5b8a37707b23ca03ce709b40a79f 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -630,7 +630,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return PTR_ERR(csi2->base_addr);
 
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
-	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
+	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
 	csi2->clks_num = ret;
 

-- 
2.43.0


