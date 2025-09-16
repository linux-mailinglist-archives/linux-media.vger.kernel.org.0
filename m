Return-Path: <linux-media+bounces-42610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F8B5928D
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B819B7B1467
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A4C2BE655;
	Tue, 16 Sep 2025 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g2zyX5In"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7A2BD58C;
	Tue, 16 Sep 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015840; cv=fail; b=gV0eT4aaNr3LKmnlWV3hitLuXVUjUGLllPAiU/PSX9xNMmL1XmJD/W9L5wweD0iM0bVS/b1rauGMDK9cqF8AQtTh7+HarmYIbNl3E0z/xzla2cy8naeOFY5yJupqAmxKmYMhWNuHPgnv0bpWwRpgAybpgp5EwLQeEYZofXxtqUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015840; c=relaxed/simple;
	bh=TkMiOPcOvTw0a+hkyWu2vBiYNFQjE+hICld50L+yGUk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IXOEWOoWbiprpQ7zAFBz1PSiYvzILM0VGVMxQOQ7FtddaVWie1OgOhgAUD8Wp4Me3fyMfAKTHrKyzeXHIhcZQghkdLN6QtXp43eStZwSws/mQDUzmq5S1CNnkJZBOIOmjP0U6p3bVguCUM5ZMJdJPM5l80Gc+ibS84Q68pl/RFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g2zyX5In; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aphx4yE4JB/NNkdmiNC6NENVKwYUoni1H+YG5BjKkiZz7xAmzfwzz4yLHaXeJdqUpp3Ml+Vu9Ivg7TBFBYnYn272MJFgTjdlLEg5iXsjbmBMVArUhsGZiduSM9KAOBl9zQ/wVrvk0d5crMK8gVftjzRABIoBwwxIXahhiM/NW4VsjawV3PT4c4/PaUz1VC5pfG8b7oc2a2QEcME+eBcPMONgXkP0wdYn8MyE/T5W1g3U/wAk1bXKC9H4SvySZfcIvlnz7j+SPPUtTvYyS3hCHUoZ1oSqd+WaRGp56AZMOjIUqcriFrDzx0JwDKGGdHeJxGFQlIv+jkwkXDTP9N5x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEEOkL2SbRZFcPJo7kVfKI/4VDHij8cuDuzrJ9mNKtw=;
 b=Yl7F6UpBgkLyjxYVgu2dk5jw+0nT06l2pRXhyw+O8Mv2e2lDuw4mor9ZVi2aZgQszJrE7pEhMre/mk9V4eF9tSEsR/qVd1/mQTo9NP6iOqQiDtULPl+xY97F3fBarNzR5Bmw4ejB1onyaOTWmDBe+R97d7AuI154L4rhMkkT0vvbbVTZJ5kpKwkGZKYfgsbqgMYQQ0C9H9KP+WYPuyeuGUrGtgKSO0B5Sa5EGbOKOtHyoMzzzuxP5LxfqOI7eC2YPhm1Xd0Ryl7fIyi6T6bCg3nuS/TwvcZK2eWWUxfsKN4c9tdWJetcGW6cwEbZDICkWwcVD5QFCzCjCwGFeCBd4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEEOkL2SbRZFcPJo7kVfKI/4VDHij8cuDuzrJ9mNKtw=;
 b=g2zyX5InHteWCbzFmSZAxvktiVnHvWgST5LJ7VWBuIlCPlWpEZOgu3q9EbCJXQaVS1XwFKiXn9lAsRVU3sUEbC9HBYtJ25lAtUbLpMxzBHVrfN3zughq64aOQ1/BU9v1w8XVXaJ6jKV4wbNgElPzMilCmyXziSiEquz/QuFUXAshdMVULIW/ay9htVf9Jvczf/Pxnr40+R6G1nuvl1yTClZjyBenrFqAlWHC+6mMSS+C7luhT0q3pZ5/zQjE/F94M0hpeEO4qIBlb9maccNCLUq6rByabzGExndnWkqzL/DhOomwszwpJdkFVvXT+OvOP+d5gXizAs+H2uyd2Qu0/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 09:43:54 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9115.015; Tue, 16 Sep 2025
 09:43:54 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 16 Sep 2025 17:43:43 +0800
Subject: [PATCH v3 1/4] dt-bindings: media: ti,ds90ub953: Add new range for
 remote GPIO data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-ds90ub953-v3-1-bb7bc6545da7@nxp.com>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
In-Reply-To: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758015845; l=1343;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=TkMiOPcOvTw0a+hkyWu2vBiYNFQjE+hICld50L+yGUk=;
 b=yY/f0+izaC0FfEgPRTNeHjlFpyvrl8JGrSRXXbaJm6P105USo3JIzRu0pl06F/QV6Vs8QJeSI
 t4SUGFefNNEBEDQQdBHO2EFuD7nfSpSLy/I0UtrEvXRF+0ISTlKb2v3
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 985d7ccf-44a2-433b-86fa-08ddf5058ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anZqR2x4M0RVOFVGczc2bE12RzVXbzRrY2c5ZzlCNXl0bEtyaUU2bVZteFNq?=
 =?utf-8?B?QmNJT0VpVzcyeTVlQ0haVk5pN2xMKzhOOWNvWXY0U3c4cEJ6dndHOXJPM3lW?=
 =?utf-8?B?YTFOUTMxSllMWmgrTFZiTndiS1JyRFd0dG52NWZlaU5SQzdKMExGK2ttUmx0?=
 =?utf-8?B?VE1yYXozTXZDMHluM0QzNDVpTDBwNUlnZnc1b09Wc3lrSjlnVjNrN0JqWnM5?=
 =?utf-8?B?QUswQS94Z3NlWmpQZDRPNWFyaEs4OGg1NlkxSUNYNGRGRklleXF2MWpWQ1g5?=
 =?utf-8?B?NUQ2cnR2RTJZbnpobG5IUDJUcnZSTEp4TnZJdHBvL01NWFM3TS8yNXBFdnU2?=
 =?utf-8?B?VW8zdEVkek9iaXFtamxWNEV4WmllLzBPMWtFSWdqaG0xSGppUTlIc1dKWXI3?=
 =?utf-8?B?RlkyMjdMRitNaHQrdlZ4THJqVm1LQ2FyYkpPQ1UyY0hBQXpTbVRYTW1od1Jo?=
 =?utf-8?B?OEN1VFhjVlV6OFZMT25ZOUZqNk43R3F0eDRNaDdYMDRTcVdScFBIV2k3VHUr?=
 =?utf-8?B?YkR3RDlXaEVQT1hNOGVHdzFGcHlEM2JleW5BZ0hOYmExVUI5VGoyZ3JMVzVK?=
 =?utf-8?B?bHdSR0xvNFVrU2xoQWxFR1JjamJIREFDVzhUNmswWDl2UW9YTkt4cjFlQzJX?=
 =?utf-8?B?WVBLSGFnejZsdE55UjQrUnJvYmV5ekM3RmZPZ1NUbms5V1E2YVpTcy9Od3R2?=
 =?utf-8?B?Mk95R1VDL1lmeHBRTTBJMkhZYzFncFZyN3BvU1FCVVp3MzdZNTRPdGduS3lO?=
 =?utf-8?B?WlI0L2piWFFKM0hHNUJueEFMWXVqdjd0VHlleUVZTGxxNDhyLzdJVnNrMFdX?=
 =?utf-8?B?aWdZM1pvSzZPVE9uMDZxK3pmT0hWNHJKQm5yYWc5Rm9SZ09vV3paSGZoWS94?=
 =?utf-8?B?bGxtd2hlcVNSOXEvbVgrd2cxUUtpMmhFcFVCNUNYTE9yWHdhMjRZQU9TQ1B1?=
 =?utf-8?B?TmloK3F2blduRzBxeTRMN0QyZ0sveTBFejBsMHhudU1KVktNdTd3Zk5EWmxO?=
 =?utf-8?B?WUVmN1VPVFFTdWN2Y0xJT3NlVzFOQ1l6Qi9XTnlmL0l6Ky8vU1NGWEFBQTlk?=
 =?utf-8?B?V09qNUdCQjRRS0g4ZktCTUllTVFzZm1peFRldnJvM3RmcXo4djZvSkZMUFl3?=
 =?utf-8?B?OUo1a2g2ZGpsS2tWZmJJVkRnd0drdHZQSXJ5ck5Nb3Q4bkhJK1VjT2tnNkhv?=
 =?utf-8?B?bVVlRzJHRHRVMnhBeDZPY2xmU2xJYUthUElhLzVoUW9pMzNOZmhEWjNLT0Jl?=
 =?utf-8?B?bFlVL29jbzVWeEV2MkV1SkwwWEp2c3lSN0doWVdaWGowbFUzTm43REZ2VlN6?=
 =?utf-8?B?YkNlQXBnVjZ0SHFFa05FeGp6Vk1ldWdGVmNJMzZ0SUtSMHkyaVRhNU55RStB?=
 =?utf-8?B?MGFkRm9ZcWRiNVUzYmZQTmtDcDVnWkp5M1ZydG9GNGp1ejRHeTIyM2NEcVE2?=
 =?utf-8?B?dmVwb2NzNzVvK3pjdjF3VXYxeFdQaTRydGdYekFsd3ZydGxTQ2x2N2YzZXN5?=
 =?utf-8?B?dGQ1emdVTlhjS2lPNDh5bDExSXdNbFV2V2VOeXEvQzZEb2dzSHV2M2ZwejBF?=
 =?utf-8?B?M2pRbG5OWTh4Q3dEdFY1Uk1ibWlCOEphNUcwVUhuSGt6Y29Ld0ovY0VEMG1U?=
 =?utf-8?B?QlE2MlRFOHUxRFlRc2kyMkFMa1Z3bW5ta3o2YlFIY255WVl0R3lsMHRNTVNq?=
 =?utf-8?B?OXJ3S2R3M3RPMytnSjhVU3lhM2JETUVCY2tJSzVMTFl3K2EvYTlPL0psQTlB?=
 =?utf-8?B?WFVuSnhEallQOTN5N2hwMCtGQTF2TmhVaFFXYnY0aWVQdTFNbW5WSFhlMzdD?=
 =?utf-8?B?aDFDamVtQ3lUb21HelZ3cVFUKzhCZm8zRHRmbkRjVWhRMlhIY3p4eUpuaU9s?=
 =?utf-8?B?WmtiUzU2WXhBZllSRnFOMEJrZDg5aUJJb3JnS3VPbXdPQXJkNk1YM3JIQ0tX?=
 =?utf-8?B?VUZMR0tFcGVlaFpSckhJam9jekJmUnFONnBwck91c2xwdDJxUFcxM2tadlJQ?=
 =?utf-8?B?enpyellJcWhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2o1Q1BHNjRDVFArdFBzZ1ozTUp0Vk5SSDEzQ044UUo5cldNUi92V2VBb0FS?=
 =?utf-8?B?MzZnT1M4OEZxRnUzTTlFR0FSL1NjSE5Cdld6V0tjNU5pNTI1Z1R6MEE2YzM5?=
 =?utf-8?B?ZnlsSDRRZ1RMZzA0TXQ2WTNGWVdOYXFXM2Q1K1JXUllDOWdMV2psbWt3b21X?=
 =?utf-8?B?K0p4SGgzWVJ5dEp2NVZhVXNjMTFvZUZkRHNmTGZyOFRiallYbGxNV3QrUmk5?=
 =?utf-8?B?bFA2cE9GdzcyYjl6Zk5Wc1dpc0JvL2FORTgyQnM5eEI3ZVZJZkpKRVVxTWJu?=
 =?utf-8?B?Z01yNHhOdVYrVmJsblI4Mm9PVEs0ZVowQ21pOVVBVHRSM0oramd4RWF0U0hN?=
 =?utf-8?B?UHRvYjNaeE5jd2d5YUN4V3hzeXRJeDhVL1Z6K2FqbXFyZjhVeHpDSmsyVE05?=
 =?utf-8?B?VlR3eHRqbVg0RHdUYUZIamVoZUw1QUpyQmY3WjhLMXl2UkxZSnEreUYvd3R6?=
 =?utf-8?B?ckx4L0VNaGhJWElFQTQ5cmtTbEQwYkd1MGVUNFVuZ0NHRG5lOHdLMEhYWkVz?=
 =?utf-8?B?dlZTQ1FJdm1yMXI0bkVNSWhwT0Z1YWlqUjVOUE9LUkdPTzBOLzU1Z1pIeGZX?=
 =?utf-8?B?SktKajF4SDNGajQ1RHE5VCtVT3MzOUhtNHI4Vm9KZmtxcWduMGRtT284NW5R?=
 =?utf-8?B?SVkvK04wOGFxNnJsb0M4dWdqQ3BRN0lERUZwSUc5ZEl4MTZuVzQ3Qy9Lb3Z4?=
 =?utf-8?B?Z1oxZ1RhNGhzUXJMeDdjWGN0MUxxMFJvZjJTS2lKWDYySWtsQ3JXTXcyemMx?=
 =?utf-8?B?dGIxZlVjSzRuRzMvRFdVYmRqTGkraWU2T0hKOHEzVHpPOXhleFpjWFFhdlNO?=
 =?utf-8?B?Nk9BcVVySytHTVlhSmZuZkhMQ0NxZ25ERkR1UFBxM2V6eElPdElhNnZ4TW4z?=
 =?utf-8?B?UTJ5S21IY0FTQnh5bjBuTUtFMmtTMVdwdGJXS3lPRXQyWGlLMXdPQkpLOUVO?=
 =?utf-8?B?NEQ1L1lyQVhwdEpjWW93bXI3QS9HRUlVV0F1WllDTDIxT2V4VDhjSjlLK2lZ?=
 =?utf-8?B?R0ZvNnlKeXBCUWZzaGNXakVKSzU4YWtHYUt4MWgxSytzMHdxUjJsdkJvTWZV?=
 =?utf-8?B?K3p1SkZwUXJ1T2c4UjhMQzVKRGk3eExrWmt3elluRHZwVVIyRS91ZzgyNENh?=
 =?utf-8?B?aHhVTWh6UlBXY29hdExDM0lJazBRQXdSbTB5UG1UYXJEUFJXNCtFWnpVSjQw?=
 =?utf-8?B?OXFNUk5VUER0VVJsbkxTaW5lVXdiYzhSUHVoYkY2TVpZcWYrR1UxeUxrZWIz?=
 =?utf-8?B?ZzY3MS9vZWFsNlptWFN0cnhZeEN6RjJDYjhyQ0Y4TS9BZ2l6Y2hGdkt1eGYz?=
 =?utf-8?B?bndtS1dieTl0Wi8zdFAvYXlPdnJCOThqQkpCUVhPMk5peUZQTXJVbXhkd1Bv?=
 =?utf-8?B?WWtaQ0pCQzk5d3lTTEZya2pwVVo3VUFCM3FDNTJnY2oxcHJ0WkJmblZreEI3?=
 =?utf-8?B?R0hHSXlEZDh0NXJOQ2ozSG5BaE5VVm9vN3ZPZmRKajZMQWppR3lBbFl1U2sr?=
 =?utf-8?B?NHpObFM2WXB5SStCRWpCdlB3ek44aE1ZbWsydkRLYi9Tdm9leGtuS1ptdE51?=
 =?utf-8?B?aDBZaEk3cnlCdG9uZG0xeUlTamxsWkZBUkdGeWJBU2tteUlML1AyQzIzSGVa?=
 =?utf-8?B?RWRtU3JNck9nUnNycCt0UzZLVEdnQ04vdzQrRlU2eGx1NTVuUmFGY0labXEv?=
 =?utf-8?B?emNUQjA2bUUwbzFWS2haMHBrOGFvS3FrVXdNUlFDU0dZckJDMUV4WDM3QlpS?=
 =?utf-8?B?cmpPZjIvTnliS1RGL1JuMHJQZ2xhUmFibTMwZ0JOb1dwTXpUV0h3a2RTNXZN?=
 =?utf-8?B?RCtMUFdCUTVqMUpybVVVczBFU1E1ZzMzdEt1V05ISk1wMk8yMndPK2tCdmtZ?=
 =?utf-8?B?KzBLL1pZNXliWEc5aElhWUQyWUY1aU00WFFjRFBxdEFtZ0t0RzR0TkIwRkx6?=
 =?utf-8?B?U3pYbk92RGFoTVRQTE5jay9IV2NBSlJBUFRhdVZlY1dtbFova01tOWJpMUZu?=
 =?utf-8?B?cFp1eDVYUlE5M0tTTm9jbXFvQWg5cTl3alhDUWp6VGg5d3JadXFsem1MN2d1?=
 =?utf-8?B?Zmw0YjV3SnR2cGVNVjBscTdpWXBYNGJGTjViVm1VOWJ2OGZTTmQvazY4OHhq?=
 =?utf-8?Q?5SKys8IBMCGbUY1JhTsEO28wC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985d7ccf-44a2-433b-86fa-08ddf5058ce2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:43:54.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gzvzJCkA4hAd9C0sTAB66VnqwTRZOmLBEwZoLI7Z9SdhqHVLu8mPoDWO+qGQI9VRddW5nSruPIZbnqpYM74jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833

The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
output, it can be programed to output local data or remote data coming
from the remote compatible deserializer.

Make a different GPIO range for remote ones.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..234276a8738a7fbe9fadad62f12366697da97b11 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -20,9 +20,13 @@ properties:
 
   '#gpio-cells':
     const: 2
-    description:
+    description: |
       First cell is the GPIO pin number, second cell is the flags. The GPIO pin
-      number must be in range of [0, 3].
+      number must be in range of [0, 3] when enabled as an input.
+
+      If enabled as an output, the GPIO pin number must be in range of
+      [0, 7] and [0, 3] for local GPIO data, [4, 7] for GPIO data coming
+      from remote compatible deserializer.
 
   gpio-controller: true
 

-- 
2.34.1


