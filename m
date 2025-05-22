Return-Path: <linux-media+bounces-33185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2674AC12D8
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1EB3A41DBC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3588229B765;
	Thu, 22 May 2025 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EydrhKQf"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30E29B221;
	Thu, 22 May 2025 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936660; cv=fail; b=M9gM8PAB/1R2k91CLrv1PHNsrIM+RIurvoMPpIs8xDegPBEt11rYTqWRxBMXeu/DF+4ZOD9hm7oovv85I9wHOYETDKS/DpqiUGchMItFTBgcLZ4AaFRgONn3OzymFTHfL0oQhokQr98k7hpG3t7TFpqHymXwK/HVsPFA+H0By8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936660; c=relaxed/simple;
	bh=dN8ODpN+tTAy8TgZSSH3Lz1SaGinboLijPzWlhqnxNI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DLUvcV6DvrvW/DNGBKSTedenEznrVtQlqvuAIqorm7oP004L4AYwjAh/1fRIW0m4mEJYcko3URpOUCc5WU2/+u3cCwRckjCf2cmG0zajiA74KBj1aBn0BySUi/xBygEuvRJnsxquhLAcPTiIyNRBLVY+yIdS4KIFxKLtGTg9tJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EydrhKQf; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct84xf/B6Hr0v9KyH0NcTd4xIxNXoO72u6nkv88ig+++59eCpch12FjNUx/t0nZd4yQ99H5jCu1OxpHO/OCGVi3t0DCLH2C1/7KejAxTIaBz7PQuNPx+yP9lPSZ5aj7xMahgoGMYasOi6rRsED0ft1bNWdQmAfiohDkgPTiDPotj9RWwwyOWiESELYxoTihDUsLKk8Jc4nDvUi96I1YHeCEklCpwW9UDc3k5SCEZ+BmwjJ8gUTMTfN74fzBEKLMQYHilNT8Gqo0+DCTZ/NW2qcxyDan9IUYTKpcG+yaslRF4Dsv8Hnf/ZfV+FI7zY1UKVdT1xOpyozHTNQoWTTjiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvWS0oe93wfZfydGOkO4YkhPPDcZkq+glSSo3ZgQAOQ=;
 b=VZrRkobVawOp45qNKPvdoZ0Me8lD0ZQCTfr/yBlYLOphGiOrCjcIb1tilgsCYcZaevhwLGrl9V/EDsBgu3EQ1F3zlHWQT/U3nd9THI6WMtbOj+hNJ34UaNT4RYE+eQaTiL1h7Cwd/1XuB8zWg8m5q79IGSP2Wa9FRlBLFhxD+qDxtPLdt4aACwBVAq9c1mqNrURVxsM4o0b9IRAJ8UW5B8810jEyKzb47VIyh7yBnwK0o9VLsw49uzT+J8yslYrKVvoGijGM4RbfinhovL+CmjQGjgnuaccnMxqUmC0yG0a4XuwtqcdhAbJCBrgA/oMF3cA4B/OM7osJSRPoAGZF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvWS0oe93wfZfydGOkO4YkhPPDcZkq+glSSo3ZgQAOQ=;
 b=EydrhKQfuA8JSOECjKbhLuE8otUwGlooGc+kUaMPausA4RwRta1S/b4a66oEkCJVRAqiAd5g3I+jtllYHTDZeyoTWmvFXb5/LY96BHrQR4i1/u8FAY+xwR9C6pYyi013U/oV/oR6FcjN9eBBQHiKZJW/ajzynWBTTjIgVRiRcg8RXnR+JXhFWdtGfmzxMJftBofMhVMcNMXf622N/ncc+NRJHDfQg9w3RPK5zudkJcDWqB2KZxv/ZiLPcirfXiFuI6JeXxO1kvAZrV8pG1T/Q/Q5fbgkLSfNVIFqCaBOt7QiZv7GGtlgAYkqVjPJItvdvZU3MFfCKfa1TFV6g0+6+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:46 -0400
Subject: [PATCH v5 08/13] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-8-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=2983;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=zaB/XpRgTLtOf/8XnErKPHAjG6EGhnt3Df6Vz1XFRo8=;
 b=aQDp87hjJQODu+MaXk6bhbU2gWOL6r4ifrGS9B3ArrC9sLPnhjG2KZ7D5YF/AD5XIMb7hr7Hq
 Eid61iHRe7tBCHx1mxHI6m1z3hxH93sQAYr899LPlqqew3vCxxfpSFc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: ef19b122-bd19-4b6b-5a19-08dd995a2267
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VFJoZ1NUeUZpRDlLeHowRGtvZDFsUDJrRTFUL2RuRHR1OGtqR29NL0ZnZUV5?=
 =?utf-8?B?QW1yTnd2VUdYMkZTa3M5akswUno2NDBmZUlVYzFSQTFkbkwydm9LMkNjRFAv?=
 =?utf-8?B?d0VMdnE4SW1Bc3B3SUdQZmNWOHFsN24vUTBYeVQzb1UxVHp3UnFqTFNpNDY2?=
 =?utf-8?B?ejIzZDJnOFpkWTY1MmZTYzQxNlhpUVlBd2FBQVhic2JSMUkrdWdXVXZlQnJT?=
 =?utf-8?B?ZG84bk5meU55N2VRaWxqbkZRUzl1S1BhMkl3MURqYUt5b0Nsd3FsTSt0RWdX?=
 =?utf-8?B?MGxROTRTSkNVMlJ2NEhvMXJDalNrcTlsNWVYNlBjbWpsSFVQemdGYW5DVXF2?=
 =?utf-8?B?YldaVXB4UFpvdkQzMFNZajZLbkpFMGZnYjVtRy9wOXpOalorbDY4Y0tnRE1w?=
 =?utf-8?B?SHVMREcvcEVwZEVPNmFDQ0NKelBPSG1VNmJZWUw4ZWs4TGVMSGlGM3JsVmNa?=
 =?utf-8?B?TUwvVjVhRzNJbXdhdTNpNm1ZenA2eW4vSnByakhaYWpKcHUwY1FvNDQ0M0JT?=
 =?utf-8?B?ZnRUYzY2YXBrTk9LRDJMZXViSkJva0lSWGlPTkRyRzI1OVFVR0pBbzFVV2Yw?=
 =?utf-8?B?VGxQRnRZeGk2TUdLdDZvY2lvMHk5Q0FtYTVUcklqVmJwTVY1TkFqdkx0NjRw?=
 =?utf-8?B?Mm1yYit0dmMxRm9qdGlsN2w0bXZXTElQQlRaNElPa01kMmdxN2gvZ0hmeko3?=
 =?utf-8?B?bXFNNVN2L1M5UkFDL3F2QmdMRHZmTjlPeHZ1N0had2krL2ZUVEM1ZjhOV0dG?=
 =?utf-8?B?Z0tJVnBPblFZOSt4R2J3dVFwMENheDVHTkFqbDlzM0FldmhPdkpGQlptYlg0?=
 =?utf-8?B?aGw4UTFldnh5Qkk5eG1UcXFGdUxUR1BBelRtazFpZkwyRG5UTG9UODZSV095?=
 =?utf-8?B?MWV3dE5UTkVEejhoYWpXTGtHVDd1RmRJUkNGYzdQYjAvbXM2SVl2OTB6akFX?=
 =?utf-8?B?a2hjeE9HMlp6cmVFSzBDU3FwQ1lqcFhrRkF0SUl2My90Tm03YVdkeU9XKzFy?=
 =?utf-8?B?a3BOQXlJVmNRZElGVjlmRzVoRjZ6cWovV1Q3Nk02cmQ5azk0K25SVURXaEZD?=
 =?utf-8?B?Wm40WlptRngrQVVGQzVQWjd2aXlETHU2VUlpYlljQldudlNmQ3FLT0ZrUEg0?=
 =?utf-8?B?VUxnaXFVelBMRHdIWEVRRUNvSVZxKytKNWJCY0Y3c0U3OEhPdUNqWXV5RW1G?=
 =?utf-8?B?Z2FsLzB1NjVqMURjWFVHdmpIdTVqRVU3ZkRVWlRRTFZ2djFyTDRXaDRobWM0?=
 =?utf-8?B?emRxR3k4aXB0QmFveVRwK09pYkpKVWJsRkw2cFBWTEtyQXgrRTRLV2c0OHho?=
 =?utf-8?B?STIvc0IwVU83OTVUaTNRenpFNGtBeThlRTRDZFFIdEdYdnd6U0luMHlSUlZJ?=
 =?utf-8?B?VitDc2Y2OUpGblc5cHlGYXVKMmtkN3JEcFBJMG10V2hFSlZuUkxPdnVYRTRW?=
 =?utf-8?B?NmVvUDdIRi9lb2F2NHBudEpzNzdpT1pvRld5YTRXdzl2V3ErQ1EyVzBNKzAz?=
 =?utf-8?B?YkpiY0ZiTnRxSXZONDdGWkZ0ZnorRG9xK0pDbnRLSExTZnZESXJJODZLeC8v?=
 =?utf-8?B?RXg5a2hySnZJb2k3SWtndUtMczhJZ0lYWVdXcXRZWitPQkJHU00vU1lNVVlX?=
 =?utf-8?B?L2hLQzQvN3pSQ3FoblYxQ3V3ektwVmlHM0FaUWlYenFnMzhuejJ3cGQ5WlAv?=
 =?utf-8?B?L1JvdzRDZFJYMnBBc2VFbERBUk5KTjZucTFlSW5wV1B4UVdwc2ZNOGZ4aWQ1?=
 =?utf-8?B?V3ZRWldZU0cvRyszSkVMTjYzT3F5REdFUzBZVFBJRmxZbVUzR3JiaFNUR2VX?=
 =?utf-8?B?em44V2hlam15Q3lmZlFpWXdoNVVBbGVIOUpIdmJaRStvRnJGOEVTREY2OVNn?=
 =?utf-8?B?RElLeGdUNm9lL1VQMnFmaFZ4R2ZwTWNVZWpsc29YSlhjQ1BvTm1MR2JpZStX?=
 =?utf-8?B?RXU3RlcyVDhlcm9sOTlEdmVWUEVHQjV4aDUreUQvQmhEdjcvZkt5SFNqZlor?=
 =?utf-8?Q?j97nNgl7+BMl9KMQutUann8uBUs79o=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MVoybWpOZHFOdzJBV3NydzdTMUcxY1hnY3NlSXRUa0FIb0pSTmd4VHkzL3Jq?=
 =?utf-8?B?Q2pyUDh2OUduTEJGZUVnUStlckd2L3BvbGNBR01PekY5N21ON3VRNVJ1TFZ2?=
 =?utf-8?B?eU4rQ0diMkZQSksrd1B5eDUzekZkZ0l6NUVIQk1Jb1B4cS9xbjMxN2M2eHFK?=
 =?utf-8?B?Z09MODNZYWhmelkwSGFTcVNKRms2cXM1ODVXbHpsL2tDNWRubVcxeXZld09w?=
 =?utf-8?B?TVZ0cHljQ1VLM1QxenBndzVOSEgwTXJwbXBzYVpNeXJyRDR6VnBxZzlYTVVI?=
 =?utf-8?B?MzR5ai9qZ0lOd29nMnFESWtYQWtWTjA0K01lRVhlUkhxUC9QVTNxc201VUIw?=
 =?utf-8?B?dnhxMDNYcXlxSzR2cmZxd2pTYnJxL2xKVXJINU1pUkNUMHVkRlhaeVJLQmlr?=
 =?utf-8?B?Nmd4MGR6aXg2WkpEWXJnT2I4QWhsa3I2ODN5L1ZmZGVGNllyMGQzV2oxSDZX?=
 =?utf-8?B?eHVGUG50Nk41eDFEajRVelF5OE5iSk55K3F0STdpVVNHR3dSNllteTJZVWl6?=
 =?utf-8?B?Ykd3KzBPMnZIOTRObFFZVE1WSk5neXE0Ym5MMFBYRWo2QmVsT0plWWxEVlFp?=
 =?utf-8?B?Y09BNHNOUE5qeWdqYitOSmhXUjl0L2Vza0toUXZZaW9FOGZHWnNsR0x0cTJ5?=
 =?utf-8?B?aVlsMzlkY3RQNWdTMU01TCt6YXd1TDU4QVBTUWhLSFIzSFBtb1FlM09vOVhE?=
 =?utf-8?B?OGZXOGUyYVYvMGFiZTNvVFlwQW9aRWlPWDVyWHlmSzhRNko3NzhXU2dtWGN6?=
 =?utf-8?B?M0k3SVN5Nng3V2piQ2RqVVRVNmZoOE9xMU5ZM29RTFBqSUJFZE0yR0JRNUJ3?=
 =?utf-8?B?Zm9iQ3d1emYxVFpocFRQbFJjMWEyWkxhbU1Weis0ZHpuVFdTbnJIR0UxRlpH?=
 =?utf-8?B?eEVadjVuQ3ZVUUxnZG1SWk4rUmtBNHowVTlaclk2TDNLQTBIQ1U5VFl1eWNs?=
 =?utf-8?B?UkFybGowSW1zVy93L212R1NGQWNZZ1ZXS1hkWkNQV0JzZVEvaUlvRXpGK0lu?=
 =?utf-8?B?SnY1WmtYMXBlV0N1SVJDUkNJMjh3NUk3Qk1pOUo2KzVWVXdhNU9DNDJqQXVk?=
 =?utf-8?B?T3BkWE9Kb0FEdU54ZmFZdWttYXoxdkIxQ1FyZkNHRnBlYU80QVdaTTJtTWJp?=
 =?utf-8?B?cmx3eGs5RzVFaFJZK1IwK3M5c1orN25haEl5SU52QWprWWJzRUd3QVpOZ3pR?=
 =?utf-8?B?M3c0dm9Ia0h3b0dmQnZiZ00zUFNNSVdIMno2WVFZWk1sSllsYjRPOTE4Skll?=
 =?utf-8?B?SXA2K056V0RreHFWaVVhRmVjYURoVEtpdlNFOGs2clBSUUg0VzB6ZUhjZzAw?=
 =?utf-8?B?WXNUZzVDeUd0QThKbjRZVDA5a04wMjB5dk54S20xZ05rTUNzMjZrZEFjVmUx?=
 =?utf-8?B?RlUyaVIybWhWcFFEOFFZaXd2NWJLTHZzenFRMkVvUHYvSjU0N1ljbUI0UTNQ?=
 =?utf-8?B?MC9FcU9ENUx5QlVMS2I5SWV2SENGeEhxNXYrNERZQjcvRlBnS3cwNmRkLzAv?=
 =?utf-8?B?THRMaDBaTjFDc25IblphQkY2UGhsOUYza3NMZWJxUnJFWGRHL1d4dloyVVJT?=
 =?utf-8?B?N1NJbGhCOEZHK2N1L3VYWEpoQ1BSc0w2enpOenJDMWtYNk11VjdrcXBMN1Va?=
 =?utf-8?B?ak0rSTNqcWdHS0txbkpCWENRL2dFYVNGVUNxenhmUkYrejJpVFRrVVFxdmll?=
 =?utf-8?B?d1YwV1VKa3RNQ3dBYWRsdWI3S1NXb2tUM3lURGh5YzYwcjJCNCszN3BRYWNT?=
 =?utf-8?B?NGVTQzFiQlE5VGNkZk14Yys0dDAzMnROejRRcCtBNVlWbkZ3djZPcUxnc2ox?=
 =?utf-8?B?UEFUWE5uWGlUOWFDTlZxb05Kc0lJRW1sWjFiWWNWUW9sSmxJYjBuZU00UTlC?=
 =?utf-8?B?MkNUN2pNOExGeVhsR2xESmpBSmw2OGxiU01xRGdkN24zMUlxdXplRjArclVY?=
 =?utf-8?B?VUJZbGpWZmVFbTRnQXBoMzJIdkptcTIrZTdWUTVwUTExZG5id21Scm5UUERO?=
 =?utf-8?B?c3dxajMxaDYzY3ZHQ2NwdTd2MjVxdnZJUzMwYkhUejdTcXZFK0JYSFRsbk1W?=
 =?utf-8?B?UE1iUS9Db3YxU0pTbk44Zm5nWDhCbGNHbUpzOXVOQ29xdkhwUlhCeHgxZEF6?=
 =?utf-8?Q?EjCi/y5B/rebR+OJK6OzpcaJO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef19b122-bd19-4b6b-5a19-08dd995a2267
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:36.1638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/PbSi34zE3iInH4Pq1Zqqzx5AuP55KExBv5ZRwAhplD0xWobck3jmJ8cFTAkgNQXEJTh7EkABYoPFL4Lhagvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
fsl,mipi-phy-gpr from required properties and add new reg space, since
i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- none

Change from v3 to v4
- use MIPI CSI-2
- Add Laurent Pinchart reviewed-by tags. Reset description is not very
accurate, but it should be good enough since use SCU reset. SCU reset do
reset for PHY and controller.

change from v2 to v3
- use dedicate csr register space
change from v1 to v2
- remove internal review tags
- remove reg maxitems:1
- remove 8ulp part
- add 8qxp compatible string and make 8qm failback to 8qxp
- limit reset and power domain number to 1 for 8qxp and 8qm
- remove power-domains change because 8qm/8qxp only need 1 power domain
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..3389bab266a9a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -16,11 +16,19 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx8mq-mipi-csi2
+          - fsl,imx8qxp-mipi-csi2
+      - items:
+          - const: fsl,imx8qm-mipi-csi2
+          - const: fsl,imx8qxp-mipi-csi2
 
   reg:
-    maxItems: 1
+    items:
+      - description: MIPI CSI-2 RX host controller register.
+      - description: MIPI CSI-2 control and status register (csr).
+    minItems: 1
 
   clocks:
     items:
@@ -46,6 +54,7 @@ properties:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +122,30 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


