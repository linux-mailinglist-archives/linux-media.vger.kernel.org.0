Return-Path: <linux-media+bounces-25690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2EA2972A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 503A8167EBF
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6B41FDA89;
	Wed,  5 Feb 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VwgeDs7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923991FC7CC;
	Wed,  5 Feb 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775961; cv=fail; b=AfEWoWyvkTxtRylBP7I+9K0bfQdOTg0uMOuohdEO9DqmfUIS4aXj3U5HhOL80csT6boenYsfjpjEQ1cmjBp9G90FhZHFNUJfaDFjRXgVk183gQ70H8VzyU6sWST5XI8rzo71h2C95ETSkekIBN/8yhRtemEWsY4uWO4Or53i8cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775961; c=relaxed/simple;
	bh=GxGG9fFFzRxcdZNSYtlbvXRnKsvc+MhPS4FEWc08L9E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BKiTqZ0nSHkSzC/nDdQfBy1+3r7maRd/X3OJ7VVzmNHJEa2lr1OD+uYxcVz6x4d7z6LEo3COcewio519B2U+omDbbeZLcTJ6D8F9R3YvE2LoVoSkssZ2JMYqOtUaRSG6wLQI9IGc5ziv6d0w7ayK5v2KjGThyi6MSi28iiTABxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VwgeDs7Z; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHoRRkZhdOPQ34QE5tYdRv+2+74T3Hm7tYQqRmNH/tyFSyWGPGq/OlvuLH2HfsNOnNF6OVE3NImb8OFhvnl3I8fEQXTY+BTePKy4w6iNggI2/FvL1rUPAYVuA2wgRrtEw5Hl0j46skauHu30DHyyOP1bBZZMs38NrqOp0qJZrm6c8LjedYLDGXQnx9z0HCP6FYSkXKuzb91Wme483/T+UzpEh5DkGggIYjSLK3Ei8JfzUJR2VZhg2DfxdF6r6ESk27hF6qrilMco6QInZqQmHk4tIBqUN7aokt6b8AZtSXad3VbGMt8EqOrlUTQMWk7F7J9pd09F8lrdX1VJUZtMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEhhKN5ONhFXXILkClueXeOzJGzn2G9fXScMxxQOrec=;
 b=a+BH/+6C3qrT2+pVW/CE0st2pgpbiexc6wGyX85/JkE/U9XmkFRTO+fWnl9JRfo4HdHTnM9SOFYrfMN/FQUCjJlCfzuU5FJ1cl0VyoGXLaDNm254tWuvvE79ALp4QC9OlGH5yAvQVkVdx2sMo0qISR4LffIdIo8SD9CYmHOMOM1oiQ8KGr1i9qYHGI8Nfuu3QhOJrFnMmWCprpTnC6ElwMYYMINgIif59DMCYobpp2DPofcjA+IzLcutERgSs7fkbxbnAcCbRZMZ72aij1t70UFlGGRPIhtHQLeJZ1Wrm1pZcArINou5vAzz6jMApfwaiyjglEI22svB7Zwp1rVoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEhhKN5ONhFXXILkClueXeOzJGzn2G9fXScMxxQOrec=;
 b=VwgeDs7ZbmvmEphyiDY5gkfUTyASdtEh1vEWQqVOpnqxf9CpXER0f8Kul3nCqTYzOj0CwD0QrAdWKv0qewfRa2iTiD4fOINjqAWX0tq3mhGBwNKAsjh3Jz7Cox0x6p/rCui3twObsybVTVAkTnQD1zP6tX0ffsPOGJGLI5SBHqbiiHCi0KqFw3z6rJbZyCLzml1TiVD88QrcG6l9n4MJQUWp/EZitsg/vIkL1juxMJnrHFvy7BJSeUbLjFcAkzi9Gj6pek6+1Dfr67wNLHuEC4mHaT5Od6dx76mVH33HEB4vhGJfEMsNJt0IK7Ito/nX8VHVXwMgBYrcF6K1jGtyWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:14 -0500
Subject: [PATCH v2 05/14] media: dt-bindings: Add binding doc for i.MX8QXP
 and i.MX8QM ISI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-5-731a3edf2744@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=8352;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GxGG9fFFzRxcdZNSYtlbvXRnKsvc+MhPS4FEWc08L9E=;
 b=sB39olpTq6wk+gZY8i0z6+/eqgxEg7tW9y4QR/stple9kT5/+SjXzSzk1yf2k0sIjaobjByHN
 esee9AMANd+CW9I1GDUqAouWTnaoD/w9FuGqFs3jlQkt6fOAx9MiaVb
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
X-MS-Office365-Filtering-Correlation-Id: fca28c57-1a97-4bff-af30-08dd46093796
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|13003099007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Rm5neWFMNHJmNzFxd2g5U1J0NTdDejNaaGhEME9ISjc2eGJneUdjNUJLRU1p?=
 =?utf-8?B?d2JvRHBOTXFjWm5WQm5DR3l4dlBlZ1NNcFdONzlaZFQ3Y2huMW5pRXZ1MGE5?=
 =?utf-8?B?NmMwNWd1a2VmZDFQN2tBWFZvK2liQStTTmZ4YXFFWlNrNGtQMHNsNWkwTkxh?=
 =?utf-8?B?clJ5dHpPeHB0ZDBYYm9SNFBiN20vcHdXY1ErdzAzai9lZ1FNVVljNXhvaUJa?=
 =?utf-8?B?dWhic1h2REoxcU1UU0JJOWZYQ2xITk1GazFBT3hFZTBJWlVESHpoK3lYZW9R?=
 =?utf-8?B?bjBNRFpTdDhsMkNHR1JuSnVldURFMTcwVUdFS3kzbElmMlZWU3BBRVFIVmMz?=
 =?utf-8?B?TkoyOElXanY0TDFBTWl6ZFJFOWhlZWQ5dE5FQ1d4MHNEdGEzNkE1WUtxUERi?=
 =?utf-8?B?K05FR0MyS3BENVk5STZXdEZOWXU1UUZ2QTJBYk1sZkZHUmZZaFFpUjN3YmNq?=
 =?utf-8?B?RW1teXVXc2tYcVpLSjZNN3BDT2EvZ251VzBUejdvaytrRW53NUNuOUxDaDJI?=
 =?utf-8?B?cThQbHlsZWZIYTM4MHVOa0Y0SFB2U2RhamJ3TlpjMHVrRXBrY1JNYnp0b3ZW?=
 =?utf-8?B?SDE1S1RqTXcyYXlWNURxVGsrYmdMSjMyYlBkdWMxUlhHck5GTEhJdkM3clFC?=
 =?utf-8?B?Z2dWNGRmcUtwUktUVDdPYWRIaXVSQjNRRFpaUmZJbkFFZStnSkRlVFRrV1Js?=
 =?utf-8?B?djRBZndMWHl3ZzFYV21KVUJuQ21Gd1FsM1N6UmxnYnREc0w1OEtsZVF4Kyts?=
 =?utf-8?B?NGR2Q0I5TGYxTFdOM1BnUnVLZ1NyY1lSZXFNRXpvdlJsaDRmQWl5R3dJYnZ5?=
 =?utf-8?B?M3c1UXRibWR4aTMxL0cwZThJdENXRW5HQVNNQ2JLNm54V0sxaFc4ZFYxbUpy?=
 =?utf-8?B?YWJKVGlCQmM5a1ovY2RWUVpLckxtdnFwM2s1eG5MSDNYaUFCUXZSYXpVbUFy?=
 =?utf-8?B?dDNaZ0JVVDdNWkR2ZGQrMXlCT3FKV1d1c0ZueW5FcjU1blVUVzhKSlRObDdP?=
 =?utf-8?B?VXBMd2o4R3RXVGVMcWFWdW54REZvbVpIdTlqeHZCZ1IxWkJYdWdxRXRPZDEx?=
 =?utf-8?B?RUJhU3lDSVVLb2VaVFdSR1JSQWJNNGtwZjJvWk1rWCt1SFJLK0FHLzlkSlg3?=
 =?utf-8?B?cGxibWdTTlc5Yy9hSmRPSjF2ZmFPY1gwYlJVSXAzQjcwdG9UMk5ZMzJLdFpa?=
 =?utf-8?B?TnhubGhwTDhzZUp3SGtvMWJlMW1leW9NeHk4YUFVcXZVTWcwa2xkL09WMlZm?=
 =?utf-8?B?OHM2c25qejJoTnk0eG8ybkZqVUdPOW03Y3hBNm1hVmpkNVZmcTZsQ3JsMXc1?=
 =?utf-8?B?YmlSOEgzMDEzN0hON1RnTlBxNjNRdEZPam1jQ21MU2U1QzdJWVlmc29TRnRx?=
 =?utf-8?B?N0Z2LzAyVFlsWGZpb3RCVVU5em9BYXo4bWd5OExJVHFhS3dkWWd2MnNqaUVY?=
 =?utf-8?B?RGV0c3R1eFBVODBkalF4RkQzb09kTDBsYXlUUmk4R2ZxbExJRjhDNzRwWGdG?=
 =?utf-8?B?U242QTQxa0grWGtlSW83c0x5NzFYUWlTRTBZRjQrSjN6YU4zeWZqb2JZOXAx?=
 =?utf-8?B?MHdOYnBKSHlpKzNBYmhKSjVTQ3RQdzV2Nm80TkZJZFpUTmVsUC91eXlMdTQ0?=
 =?utf-8?B?Ri90RzBuNmdkQk1SWkpVL0tFaGxRQ2YxZkl3VmVyS3VpMkEzUllLZDRMU3RI?=
 =?utf-8?B?cVVEenJPVDFMZU9xWVFRempOOEZ6a2s4MElHcndYL1MrTUdNVmNtMkFkaU1Q?=
 =?utf-8?B?Q3JObjFmVHNnc3VnREIyOGVFL2duZkJCRTBaeURVRVJZeElkcDVRTkpzdjJt?=
 =?utf-8?B?cDFNQ1E3a3NkWERNMzBaaEtVU1R4dmg5ekRNbGhEdzR0MmZYSEtUK2RQRnBz?=
 =?utf-8?B?UWt2U1ZKWERCcGxQdjZ2QUlsbGJiY2tpSGtEZWEvam9tQWc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(13003099007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M1lDS0Z3cldsT01od080WGlLWGtCeEpTdXdmMVU1eGVKZUYwVkxyK3l4ZU4v?=
 =?utf-8?B?cXQ5NGhtTkQwRUEwS1RwYlQ3VzYyeUVkVnMyZXMwcVdnUE9maTFta3d2SGZX?=
 =?utf-8?B?R0I0eElYZzhqdkhyT0dNUEVsd2lYcUdubW5EcE15WEhQRTJnNk9RdTBKVHhV?=
 =?utf-8?B?R1JiN1d1dWVYNTlzNVEvSWRKTWlINE1ZVnY5NU10b1dQL3h6V2tWU2Yxdi95?=
 =?utf-8?B?YkhGOGFYTHdqeXRzSGtKUEN1OUkwRzdSekNhT0c5WVlBMldSV0d1emdPSUdC?=
 =?utf-8?B?VjhrRklNZzNzdGZPV0ordWRhQlhlWUUxOG02K3J5WklXNzJKZmF1TUQwNURC?=
 =?utf-8?B?R0pmYWJqK20vTWJFZ251OHFmb3pjWWJrakxzWmVkTzhZSEdjTVo0SE5nZjVZ?=
 =?utf-8?B?MTc4UFE3SjNVc1B1RGVKaXFNSUhlcmczUkxPaDhQVmpJemFZS1djV1lYc2tv?=
 =?utf-8?B?aS9XZWhxdlQ4S0IvcVJZUCtYOXFpMWFkY2dLdy9tMnU3Q05wRmViVDNQTUYx?=
 =?utf-8?B?NDhraU85bFB3M1VoRVlXd3haeXJSRjdKbWJmYlBGVUF4NEJpOW1XTnRGVjJ2?=
 =?utf-8?B?MUFONHlxRU5oMEtaR3NpKythaFgrb1JWdlhpQUdRTUd1MmVHTzExVjhVUHZk?=
 =?utf-8?B?OEhFY0tOZEpPYUswYnJRWEtxQ1d2ZTJaYXJUZnVFWTVDVUtZbmJYUjE5RFFD?=
 =?utf-8?B?aFZUL3k1SjdhTllXVUo5UWFZeXJSaVJMbk5VZ2FpSFN4RTFkSjMxRS9SNHo2?=
 =?utf-8?B?TnF1N25kVW9rRk9zeTNwclZ5WmtOYS9ieEMrdjlUNlB1dDlqVFJyL08vNkpL?=
 =?utf-8?B?ekJYVzU5ekY2WDRRWERIOERHVW1PcFZkRit2bGxibkNwV0x1Q2RlL1dNR01U?=
 =?utf-8?B?NHY0M0JWVUR3VUFUS2ZJNWVUYi82dFQwWWgrV3hEVGlSeDFKajcyWXVnL2Z6?=
 =?utf-8?B?bzBCVXZGdXFTa2pnOC8wSUplTDM2bTNnNm5jYW02T1RmQXBUaTgzc3pxYmww?=
 =?utf-8?B?bGZnaWFXRXB2MmdaalErOTZGUmpuVDhrKzMycW5hNmd3MGsyeWR4QmF6d243?=
 =?utf-8?B?Z0Y3WW5aYWdCVXRQZSthT2Z6angyQ1hTMDlhNXdkYVY3MU9QdnlabU10Z0Iy?=
 =?utf-8?B?Zm9jYWxwUm43N1Q1NytRZDI4a0FMbEkyamNPcHFRUGliYWtOYnU1amVwOWFQ?=
 =?utf-8?B?REludzFwQzlhaHoreXhNaGxVM3k4a1pjU3UraGQ5eE00VGdOTDBoV0dDM3pk?=
 =?utf-8?B?ZkpyelpjbVEzZS83Z1VJMUVnZzVBTThTK0Q4alRHd2c1dnlEbG9BVVFsckIy?=
 =?utf-8?B?dkdFK2lqZVpHTEZYQ2RVSVlDRndUYklkM2pkYzg1ZEJ1YjExWmVMYmFXTnhB?=
 =?utf-8?B?djFEdnNwaTNXamtEK2dYYnVTdlVYcTVrdlRjN1h2WXBIVzJDVUdkUVVwcUNC?=
 =?utf-8?B?RmxYcnlkaFlLNmI5WUJ1UHEyRDNVYXY2NU9mZGw4S0FDdnk2a0Z2SnBwSEZp?=
 =?utf-8?B?ellPRnFBTlNGV0d1dk5hd1U0QTNXb04yTTlaWlBOakpBUXVab3ZzeGIycVVQ?=
 =?utf-8?B?Vi9WK0lCa3g0SW9tT2hObjFieXpqY0o1QW1FbFd1cmpmNGVyelNudHkvdnFh?=
 =?utf-8?B?RzJJdHB2Y0hFK2RsM09kYjJ4VWZCc2RURWh5cHgzTmdwbUdBTGdHaEtFNHpI?=
 =?utf-8?B?ZDE5cjNwWjN2SEkrRE5KUjQraG1RWTgvQnN3ZEJsdURsZVQxSUc0bHFqRFVN?=
 =?utf-8?B?TmJwY2htamZqc0VhdWNzaVlNNGkxSlVpaFhtR3Y0QWxqWVppUkdadmlYeGNJ?=
 =?utf-8?B?d1Z5eVdYYWFtckhONmxWT0x3S0l6akhjZ2RnbzcwYkdqcnJpKzRaQld1OW1n?=
 =?utf-8?B?amI3eDY1VFVkMTdNYzlKQjNmM21mQU9HWjBOdTlPYVNaS3pLbUFrZzY4VEZ1?=
 =?utf-8?B?Y0ZaYVZUUE9XNU85VHU5L3VWYjk4cFl4WGlQTXI2L1YxaGVnS1dKSHpHSFpQ?=
 =?utf-8?B?a2NoVTgrTHp3ZVpKaUhJQUt2Vm44bGZ6ajhKL1BJaDdTbG5kRnJoa2FrTXV2?=
 =?utf-8?B?a2hiNGZNOWtkMlFFQU9qeHRQTzZTMlhoQTBLZ0puRWJJcVdxeHBVVHRTSTA0?=
 =?utf-8?Q?neNct15ZAMOug0pY1mNdHjxzz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca28c57-1a97-4bff-af30-08dd46093796
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:15.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY8ENg8KwIhbipsFZI/MmwSFLKM2HgTl5dOp2DPAl1o0vNM7Kkc4Pug5bPRWUZhJlf7lX/xJInXF/lwZRy/onQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
power-domains, and ports differ significantly from the existing
nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.

Add new file to MAINTAINERS.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- create new file for 8qm and 8qxp accroding rob's suggestion.
---
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 221 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
new file mode 100644
index 0000000000000..61c551673e2a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QM Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 8
+
+  power-domains:
+    maxItems: 8
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 1
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qm-isi";
+        reg = <0x58100000 0x90000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3",
+                      "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
new file mode 100644
index 0000000000000..818fea0e4679f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 5
+
+  power-domains:
+    maxItems: 5
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CSI-2 Parallel RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qxp-isi";
+        reg = <0x58100000 0x90000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>,
+                        <&pd IMX_SC_R_ISI_CH5>, <&pd IMX_SC_R_ISI_CH6>,
+                        <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 40d1b7ec30fde..f243257ef7653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17000,6 +17000,7 @@ NXP i.MX 8M ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 F:	drivers/media/platform/nxp/imx8-isi/
 

-- 
2.34.1


