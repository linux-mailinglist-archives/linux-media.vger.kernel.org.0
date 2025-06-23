Return-Path: <linux-media+bounces-35700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633AAE4D76
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673DD189B512
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 19:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871E129CB39;
	Mon, 23 Jun 2025 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XC1aN36q"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B4A78F4F;
	Mon, 23 Jun 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706293; cv=fail; b=Rq6NzXY52qUJiJx0g8ELZ2f1ipEx9/lhX2l2jFjgkYwtm84IFaE0H92aKcKnjaedITwEjjnygX8iADKHmnuhP4WMSQxK06lP/sM+LnMkcudgdUd1dS4miXsbG4cwU7iv56/Ooji1WiATeX4X3DFRvploSEBxqO8s7+4V4/KVnCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706293; c=relaxed/simple;
	bh=juDYSpLNvsLjHzWvnppA4DpvwkrY63n4OgOs9pY0i4I=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=a20MoM48oKSmQ1TQnz+jArttW8oVIEgoGcvmcYsB4xIANdo9x3eUtuJqLjq3Ue3lFwQZtpZj1mCTLR41DyqnzHvKQdlF8FkDu0TrVqVMFSMxpPs2IxvN+EN5X2Z0cnzLpigPhtqvEopUoQ4eMipAvzaoHEJK0AvzeyHxpzopuoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XC1aN36q; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTe25EdoLogsNaYHOyO4F+LGfn9k4L8pcVSw93m5E4PwAGoixOXRHFebOKcii1o80nKwgiPmPwRPgRF9Xb5YOaBlSc9NiVLoBi3DsKgAvgZiYl9xsvHun7tGwpbkHWPBBY2nvPtgfkK02pCC/A5C6/4UE19M47WOA+CVHL+BOxWzb20gK0juvI/TY7LdwWe8IKoxw14EOANyq1AAJA6mCsA4jN8D3iSJEnVzghop53jz7Ahq1GfXYK5qbCNIjJzGd68ngoWjTXXm/j3z13Jpw6RKcfAzOFTcBgi/hzYlf9xFyPf3pASLH2G7J3SkM63snw5/kjK402RojOJPU7a6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U45rqIIX2EGVPWCfjY0oXG7+1XsFhHHV/gjJrj0E+ec=;
 b=WWoamQFlLru5qRhl5nu43AaDuITeKgxWg9n1FUhA54XOvFtoMwkeRA5EljV0akmKWUVeYM2FkEKDl+2J7eUhkcScF6QuVsKoT6HqtzbqtBGsVpwBK2RXW5u09zav2wU3KipDO0xE2Kp88VOoTcDonglgmRZDiDmPlIkTJ91/zJCxdwKqcgLxPGD5eeUO6xq+yifLTXFy1DtyGRfZkymtcKUSg5SakzGKuMuqKMfzS1qefwfqZOp5Xtv9Eaww56VatL5B+zCQaieD+RBWBbJhKFU6ugSNdFH5RpYHQVeGovV4ZHBo3KiH+LV/R2HouAhjv7P5xndez4xQwQ9DCZh6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U45rqIIX2EGVPWCfjY0oXG7+1XsFhHHV/gjJrj0E+ec=;
 b=XC1aN36qCNP9cVgFp3HpAXBjwb7FhrWv36W+82i3F8GBsB5GAAVJ2QbF0IKHkMA315qzzHxcRa7q6ohL66kf40iwxgAuZgeMXksjZ5WtY4Ykiazkj/AK4ribgn+r+qL2jFtdWyuGwU2g97r8RKWd2bPRRghut9+OFAp+H1R1fU5kPVE8OVrcqxHR6cZJCmFigGr7cV0013HArOOR6EvVjV9eqOqvoaeuN5i8HRn3ikmscNKzoZP53hheudB6xX28flF7LNGQP/Pbym9vaU1/KHPDAuA+PZwZzkFsQThL6/dRfX0xo+8GO9tyPd6SEsoyZwDtpLFaTo4g3ipuslx9LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 19:18:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 19:18:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Date: Mon, 23 Jun 2025 15:17:36 -0400
Message-Id: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCoWWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Nz3cQCQ2MDI10TC0vzZFNLQwtzw2QloOKCotS0zAqwQdGxtbUAofh
 6rVgAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Stefan Hladnik <stefan.hladnik@gmail.com>, 
 Florian Rebaudo <frebaudo@witekio.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750706282; l=1302;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=juDYSpLNvsLjHzWvnppA4DpvwkrY63n4OgOs9pY0i4I=;
 b=3KGZXzKaWENy1nNyHI8yzFg3uwADhTrbLPvXbfGm4E2U3cwkS+qJCdrs13UhNU080hiKn6Fni
 jXKQnxzmfI6DpXKOfSfLKKIUXUw+u5S3RG4FtFgfmjAgi1nM9ZhaIpE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: 964b489f-4502-41f9-639b-08ddb28aae99
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?d0NiYXdWaitNaWo3Y21Qd21xcFQzTHFGaFFQVzd0YUdFTFViYk5vVklyZlV3?=
 =?utf-8?B?WURKNGZTNjNpdWxDL05rcUhodFcweFRab0RaMnk4Sms3bDNPMGMxY25QMCtx?=
 =?utf-8?B?ODNocFoxYjU3T1NnMGp6ZzY4N2tpRlQzVmFtR2dTZGowWHRGSStYbEQ2NTlZ?=
 =?utf-8?B?YW55YmNBbW9UT3lTa1VJWVN4cTlSdkJJSVcyNmVWZ0ZYZ21wbEhMcjRoSjlQ?=
 =?utf-8?B?Mm5mRnNPVTdnbWRSMzhDbFVlU1pZYjNmK3ZkczFVUTEwenQ0SWlPc1VMZm93?=
 =?utf-8?B?RU4wMVpuajJvaEMyNGE1WFljWWlKREdXditIY09qOTAycjdOa0E5ektySXQ3?=
 =?utf-8?B?dEFYZkQrclMzZTF5WXR1QWlRNmRpaGc1NVJjQ1dBdGJEaW15TW5iUUliOGFO?=
 =?utf-8?B?TTIvOXFZOGNRYXducm9BUXo3anpLRnhSbjQ3VlJEWjVoL0kyUW1nek5LbHhx?=
 =?utf-8?B?c1hpRWJISGxpeE9HU3h5SHc3RGdqNit3Ymw2akRMV3ZqaTBHamZ2TW81RlVS?=
 =?utf-8?B?K0dFc0dkL2Jtai9pN2RPOTAvbmd0V0VvbU11RnM0N1ZLeU9KZ2hSMTIvcFpN?=
 =?utf-8?B?OGZjb0pjNFFnTjZlc0p2QUVndjdoNlM2aUx2cUVnKzhjMnJ0MzBNaG9CTmVI?=
 =?utf-8?B?STljQURHN29wU05NMkFXbHkyS0xiQ3M5azFuL080T0RjanZNNG1CZkIrQyt5?=
 =?utf-8?B?UkZPVGt3cWQ0ZFBialljb2Ura3pkZWNiUlNiWUgva25Ec2hZM09CVHpNbVVP?=
 =?utf-8?B?ZldwZ0lyNVVtSXV5emovQ0s1WmRGRmw3YkpWdlRzSzhLcHlyb09jUDBtVFJB?=
 =?utf-8?B?QUxtc0RDbUt6bDRwK0Z1a0NNMDljcjUrMWxQSUVtb2lFNHJUSXUrU1RuOEtm?=
 =?utf-8?B?S1ZiY1dMYjBrN2lacjF3amY0U1FSWUZFYldqTXpXWmpSZ0phZk96TWd5dlhu?=
 =?utf-8?B?RDZBamM4R0k2bmJaR1NKdVljQkMzRDRNeDlTYWY1cDZjV0FCWkR6LzQ1TW9T?=
 =?utf-8?B?VEFNei9VVERscHE2L2hTYWcrTjkxMGIvYXk5TVk1dHZUUDV1UFhQTGpFdmhq?=
 =?utf-8?B?L1ZYcTdsbzNjR0tWRWV5TElrZGVHclFsNFlYNFpFYjJEK25oT2tyWnNDOEZ1?=
 =?utf-8?B?NndqV0NVOTVXWHFPTFdKOWVMUnpsMkpMaENSZ3JmeHdRa1VvV2NDUTZtMFAy?=
 =?utf-8?B?YnBqL0c5OC9uc1BqbnhqUHltVjdPSm5BTXVHNHVZNng1NmdYTjl2N2dpR25h?=
 =?utf-8?B?cWlxWjMvOWJJTk9BZ2FQb0Vjb0swU0h2bE9JMEFpcUVIdmI5bXBlTTlwayto?=
 =?utf-8?B?d01wREV3WW9mdGUwRzBwMU5OeFl0NUlGSFdaQ09WMDY0eFEyZHkyam8xc3pa?=
 =?utf-8?B?VGJENVQ1ekd2eWhCU2lQaWNyN1JRcnFRc3hON0tFQnY4NHdsUjE1eHh6a2tn?=
 =?utf-8?B?OHRxN2JPL3A5QVJNZlVqSzFRZW5jUkRFbE40ajdBazRmcmtqeWdkbDJGNTM4?=
 =?utf-8?B?b0lFUEI1amJ1cUQwandsTEhqR3hzNTdrai9pWUhyQWRabENkSUxQWkIxK0M4?=
 =?utf-8?B?cU5CZzZDMzdFbDBuRXlHcmIzZnBuMnp3MFJvQkNaRWxEYXM4aDFDZ3Z5d2xo?=
 =?utf-8?B?M1IydVpFMjZJMEtGRVIvNW4vNUpIdGxTaVRSRGtjeldKQnB0RGYwTjdOT2pX?=
 =?utf-8?B?cnhQaEZnZ0NmSUl5NE92RmQ0WVY5aTI1bUw4VjFwbW1FRzNSTEJ2M1dmNXln?=
 =?utf-8?B?c3FYS3lPWENpZjh4YlkzaERVeFJJdUtHaFJPVVA3TUNJN2krWXNPdVBnUEto?=
 =?utf-8?B?YVNJZDVoOUQ1MFFIL202Q3FVN1ZoNm8yM3I2QmNxR1lsd0NnVzlFVDQ3bTdn?=
 =?utf-8?B?M3JnS00rK09VSWgxR2V1dDZ5emhqTWJMV3hocURTWmpDaGN2SzBVWUhsUVFC?=
 =?utf-8?B?c3JFVmtRTEdvYjNuUGVOVkNUcWZRZXUyYzZDVnRTUHM2Vm9CY3h5dStCdHJi?=
 =?utf-8?Q?RF9ofasbtuVhoF36qKEKUZXGGm3FIM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eGxYblRvM2VJbTdRRGVUcDZ3ZHlQK0l3MDdOVktKLzVSQlhIWndqOGF5bjYr?=
 =?utf-8?B?a3NPWm1BRDRyK25iTzNLMm01MDZlUGl2bjY1U2pMU3hwU0JMR0VxTnJRbGZr?=
 =?utf-8?B?bGNENm9weXJQTmNNWVhCelZvTWI0V0RQaERoclNtNGtIR2pLcFhEaUVmeVRB?=
 =?utf-8?B?bmR4ZFVEVVhpZzhZdVg1Wm94SjQxOG5lTFU0Sm9vRkoxMzhVS29oODNaRU15?=
 =?utf-8?B?YlRYdWlYWlNJMkMzVFBmMlBaVDZqOXRFckhvZEJFb2ZLeUt5T0x0MmU4TzVC?=
 =?utf-8?B?ZUd1cEJvSzdYV0ZRQlUwZW1ZaWgvTHIxeDc2eUNocCt3YnRmdUpVOW5nRUJa?=
 =?utf-8?B?Y1crNk5SNDBqWHF0U3dXZDRNTlh2VGtqM0lFa0J6Q0ZWWjJlMTVFODZaS3dq?=
 =?utf-8?B?dnlaTXBsa3k2enlpZGlTWFpMTkx1SldUQXloYTl3Y3hPVlQyWk5BS09kNVJa?=
 =?utf-8?B?My9zRG9VVW42eTdObWhFdTB3RHNWODFQQk0xVnRVcTJIeFRXaS9OaHlkQjRM?=
 =?utf-8?B?VjBwOVJrL3I3d3pVSFczQXIvRWdNVEJZZWpUS3JBaXFDVEVvcnBySnZuNHg3?=
 =?utf-8?B?eURLeWY4REErMXYzMTN5ZWlyUHlyN1ovQm9LakI1UUhmWmEwYWVXR2wyeDJL?=
 =?utf-8?B?aU5qMXJMWjdVTmtnMDNSbEQ5dFRoNHQxbE40N0FmYzluVlZOdUt4Z1c2b0lJ?=
 =?utf-8?B?WXM5bDZvSm0xNmFQLzZLQmxkNGY5V3ZFOXlDY3F5OWxJbmNMNmtaQzhGQXcz?=
 =?utf-8?B?UjVNNFA5elR5SXEzbzlJMmdLTjZnYW54SDNFSTV5c0I1cE5kQitPR3h5ZFVZ?=
 =?utf-8?B?dlNkOGlRVmtFdE9mU1BKblRxekRlQ1hRaXRLUGFpbjdJWW5Ha00vREpoYi92?=
 =?utf-8?B?MEpINVQvUkF6MGVWTnJOYU9aaVU4cng2VXRGczJhQUozb09pZ1d2MFl5YnY4?=
 =?utf-8?B?ZVRYbVlha3lIOVdtcnExU2Z3ZlVQQzd3dXd4a0pxcXVUTE5ad0lnWDk4SjlX?=
 =?utf-8?B?UDlWN0d1dHl6UDh6TUVjM25oY3c4blJEblRzWVZNZEdLWklmWlpWc0NESE9U?=
 =?utf-8?B?eU1qSHdVWW1ERVp1N3JvZVV0eTNzWDQ1WEtCNXlmQzBkVXdpVEtMYkVZdDc1?=
 =?utf-8?B?M2FwYjFRVFlkcFROQngyMXVQUVV6YkdFakQ2ZzI1alZCUzhkYTYvNEgvYytQ?=
 =?utf-8?B?ZURLdVBBQ05hZjFoSk9lQVhEbTZhL0Z3SkpFeGRGZll4YStja2QweHIrNXQr?=
 =?utf-8?B?dVF6ay9uS0x1N2UzbnBPblBXSXVrTmtlNjdabzcwRTBNc2p2SHFiWm1JYndN?=
 =?utf-8?B?UVE2WVBZWWlTRDEwZ3JZMTQ3am9pV05oY0VveXpTMlcwQmh4WG8vWnAyVGds?=
 =?utf-8?B?QlpQRzRmS2RUQTFhOXBFeWR0bFN0ek1WUWIrRWEyNVpoZlVqZG12K2pzSW5r?=
 =?utf-8?B?VzBTQUdKSGZDYXVqb29xd0pBWi9nUTVCeDQzcGNXRkRVT29PK2JCTlN2TmFp?=
 =?utf-8?B?bHpmUG5hLzhydFdQRlcyMzc1UHExaUFLdkxxZUJ1cFdBOEszcnZRbXEyUlZG?=
 =?utf-8?B?MEtjSjJZaWVnNUFsZ2xnYU9vZnkwQnZkKzhQTWtHd2I2ekJUanpGdUxlK05a?=
 =?utf-8?B?bUJ4bzRMNEwrWUEySWlBcVVQYkpMV0gxZWgzZlVqem80aXo2OTFmNHZTM3BW?=
 =?utf-8?B?a0haQ015TmdHVzdzck5vcWFpZHQ5dkNQeWRJS2FMQTVjN0ZMTHB4bTE1V1ly?=
 =?utf-8?B?clAvVEl0elpTYlEzKytQdWxTK1I0bm5aMTRMZjhGaHI3ZCtjOGF4TDZzWERu?=
 =?utf-8?B?c1h0UVZoL3UxaHE2V1A1dis2RDNvMUhoNlp6NEVCSml2Z2FBVXdmdFVzWUZo?=
 =?utf-8?B?eC9YOTVGVTFLRUxFZ1Zmd1BSeCtrVVYwWmZ3aGhLdzZaSU9PVFJ3eEw0RTRM?=
 =?utf-8?B?V2VQNEQwcWhsa0Q3ODFFcmlDcm9vTTBPVEpUZ3puSG9YUW0zUWRJRUFUaFZD?=
 =?utf-8?B?bU9DdFNvdG5ldHhBeFIwcWlCQWpHMTFLV1VIYktCUzZMVHhKNTNlUm9rY2c3?=
 =?utf-8?B?dTBoUVpINDlVZ043dTY3eUE5Ni8wb2F1V04xVjh3a0NjQjM4eTVKVG9BY04w?=
 =?utf-8?Q?E3VPjvr3M3YWrupnhUnruQmxw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964b489f-4502-41f9-639b-08ddb28aae99
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 19:18:06.3157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsSfy1OEIjOyLdTWTTtktxWuFhmiRPP7rehjBcSgDsEBo/Z4dG8tSh53OTjLWZJ7ZkTHecLDpGs2TCHuIPmlyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557

The AP1302 is a standalone ISP for ON Semiconductor sensors.
AP1302 ISP supports single and dual sensor inputs. The driver
code supports AR1335, AR0144 and AR0330 sensors with single and
dual mode by loading the corresponding firmware.

Continue previous upstream:
https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/

change in v3
- move sensor in binding into ports.
- add missed regulator and enable-gpios.
- detail change log see each patches's change log.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Anil Kumar Mamidala (2):
      dt-bindings: media: i2c: Add bindings for AP1302 and AR0144
      media: i2c: Add ON Semiconductor AP1302 ISP driver

 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml |  151 ++
 .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |   75 +
 MAINTAINERS                                        |   10 +
 drivers/media/i2c/Kconfig                          |    9 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ap1302.c                         | 2838 ++++++++++++++++++++
 6 files changed, 3084 insertions(+)
---
base-commit: 645ba71558f6294a0a79e1f9c0b6b73ec850dc42
change-id: 20250617-ap1302-4897c591871c

Best regards,
---
Frank Li <Frank.Li@nxp.com>


