Return-Path: <linux-media+bounces-39461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF523B216B0
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D7DD7A9078
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 20:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FB52E3B07;
	Mon, 11 Aug 2025 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cxV14gij"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E82E2EE6;
	Mon, 11 Aug 2025 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944990; cv=fail; b=PEUpIA5OySC0lrYfgPjAVMCTm3458kXqaR3AoKj78PG3lC8qmbZgPvB+FRdSKYKh8jh5ItNtXmEMF5dV2VMQ5Q762yaubrDYKoePXXyev30Hvz+LedqGx0SAS8Aw2oebZkKEH9wOGECjvNKAILoT+PHPV5IkQ5kPDnj2N8uWqNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944990; c=relaxed/simple;
	bh=0QmxKdTApuRJm+T4XhHKR8jJxIkulhyrG7bDFP9Za7M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dgw1nVFEldr1X1INCw53NfN3+yku7QyKJFR8xWDGCvI+5UqlbIY242NXkRFCCUtJbJEqqnVh2zQOV5DZ8DOhCTbZfy2HeZDfX04IkHL1WBSUWZQDoDtPz93TyRbrkcbBsh22dUBLEyX4A/v+G7o8CgF2/EDrlzj3jVJiRh0CX+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cxV14gij; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaLL0YbOT+y6efkny6b/1XSTZPwARsXFxVY6g3c4mO1ugqimifVbnJrGPJloopDacsyOIv767TU/tX/2wufEfRkxK5Am9wmIY7S6TnSXX9/0XAFmenXKBCxHX2Dh0L8ja8sHMwwtd63wvAdlrSanXxKLhzdo4NIrG1PG8d5ook9ho4bFgD3MxeAXQDHO7etYkytjdJw8G9q4SmGfr73t+aN6BXVH3MU+qx7TT5LquCL0vwdj8YGYMi5VYB7eOi0C82Gr0+oypu6v5WoxPyN1AkB6Ik7ziMhhJ4VssCWmsi1VARwGXrJj98AWlWqVW2P2v7RHLFZXKNOAI80Avn5ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOibDWTzMb011cKotQMH2UhZXlDj2/B4CMCFXf8xjys=;
 b=EtP6v8gN0t5U0hTt0hfHTb+sU5U2DXCG2Q9FkLQC7ao5ma9z+yAFshgHdednJ8Sl5VjKXRZ+oPYkvWfS5AAY8tU6dkYdm36F4gkwHj66474CIbve4IgNJi4wGQkRadRwXyIyjnXIDj6r+CbVZYDrzs0VaApF1JZGi5C2BeUhusdhnyhRYFkrwmz5kvw3WBFx0dT5+38D8rXCnUXlA8d7mNIdxeAZ2X7dMWgg7d8US1ArvuniXVnGE+3rnwC4Ty7tOC2cv8FRICX+62YuncT0sKaMEJtipRssYf4OHCcuqCyNFBD2L0hgrIYR1oULiebJfttLJZ9vpl8i7IJVXEDR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOibDWTzMb011cKotQMH2UhZXlDj2/B4CMCFXf8xjys=;
 b=cxV14gijF3Ta+wghoOFO9Ckpi3nz5Z//ubzLGIbAQ7LpDPlf+IyAvIb9+QRonYViLj0M6hMjovro5wZ116ecMZs6D7LPHOY7iFmqnrACdOS0Zxo0ft+dHk3yoHA2YY+/XC08uTF3K7K8AK2zdNiawuPAAs60UuMXIrySVKrkeBN1YnnTS4YtQzoFhK7QGTvKLcUz8v8jDVz05kRJELp4pyw2yn1nmbk/gq971cQeh2Ye9G1VxZu4Eu532JVJV515hHF1/B7hXqDYYx1/qzuebe2QVtGud0nap3r5E6U2rqYuKNTWNSwt5wicqXhSWVeL6BccQCMoY58M/1X6S8qT2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.11; Mon, 11 Aug
 2025 20:43:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 20:43:02 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 Aug 2025 16:42:31 -0400
Subject: [PATCH v4 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-ap1302-v4-2-80cc41b91662@nxp.com>
References: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
In-Reply-To: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Stefan Hladnik <stefan.hladnik@gmail.com>, 
 Florian Rebaudo <frebaudo@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754944973; l=84307;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9AIKBJyAUyvTm9cSCsgVNzpaBWio0FV4SGQHxlqqF+4=;
 b=m8IzkuqVS99l935YWF3VV/eettxrSo0YHE3ePm5u8TLt/l6oQK5q6Gor/GMcaIHDin0Pld3Mu
 6MXVAV6rohQCmv0Y7np8SCU2x/Ya66/iG4caPhqGLSZ6lv4ZV1jl/Lk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS9PR06CA0746.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f37fe58-ccaa-46ba-08e8-08ddd917a9fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UnRKemVZRFpITG1RSmhMcnprR2xOK1BQZXVXNys4OXd3dkM2Tm9ZVWdkd2s1?=
 =?utf-8?B?WWM4Z0tPaTlMQkFRRXpkRUI2YVJ5ejduekpOR0IyVXQ2QlN2UWhIWnFBZU56?=
 =?utf-8?B?bS9WRUt3Q2ZCL1MzTmJuS0t3eG9TNlE3RFV1M0xUbnh5eTFTdk5JMGRaYWov?=
 =?utf-8?B?NmdvT01UOG5HV3RtR0JnbDFPVHE2RDhwVlk1WERpYXM4Kzk4WStsR2JXUTVr?=
 =?utf-8?B?U283aUFXUzVPbmgrMVlzYjFsc1MzU2dtQkZ6a1lSVFdMUXNRVmd2L3praU5O?=
 =?utf-8?B?ejd5d0pHVzVyUUQ4akplWlBxYTZ5WkcxcXFJdXhTSGNFcUNqMGwvQUJNU0ZK?=
 =?utf-8?B?QUZsaDJsdkd4NG1YTk1TaExiSlBPK2hUSHMwQnQwOGFETy9nUVM0MFdCeDRk?=
 =?utf-8?B?ajBnUXNJNm1GNVcvOTFVREJEY0ZVaGdKQWtMSnZyNytVZUNoV21uOVJIcWx1?=
 =?utf-8?B?TGVHUEhlMDFNOTUxaWZNR0FCR0RXVGZzMlZXcVkvS2I5bTkvUko5S2VUUWsr?=
 =?utf-8?B?eDhST29kcVRYaEc3bzd2OEJCSU1KTDlUc01vdmcySm1tY3lvejRTL3BMSEps?=
 =?utf-8?B?aHpEcEJic1o2VGpBYTE0RGFCWlRDMG04WXlQZlZKVmUxNm5YL2xkNm1HdzRS?=
 =?utf-8?B?V2xVTG9yWUswSzcrUFRlTjZ3TVAxdFpvZUovYkV6RTd3OU9NeThGZktSbDd1?=
 =?utf-8?B?UE1sMm9Nbk1wMnRZMUtNTFZNMVNBZkZtR2VnR3Q4M2ZuVEtjQmk0Uy9uQ3hF?=
 =?utf-8?B?US9BWmJDVjFyZ01FVEZnTDhMWURpM1B1OFhZemprSVBUYzhGZC96THFUV2Jw?=
 =?utf-8?B?dzJuQTNFYnczek8vUGxlcHZubzJ1N0lwVEROMjdFSGt1Zjd6N3ZzbG1qQTJz?=
 =?utf-8?B?VWpPUkIxVUhKUGpyMHhqL3dQSlpza2hTNW9ZQm1OY2tabDIzY2lTSlVPczJ3?=
 =?utf-8?B?MDEyZW5SU3pucFk5eG93YnI3MjF4d0xRakREellwc2w0NE9MNkhNdnVkRVJX?=
 =?utf-8?B?TXp5QUhhS3pnY1I0Qm1iTG5zOUZJMHFRWHhSU1Jxa1dIMWhGdE9ERHpEV2tk?=
 =?utf-8?B?SWZuMDEvZ2h6L2NySjI5d1JmWkRUOVgrelZiRER3WVZ4enJnWm9iU3ZVV2pH?=
 =?utf-8?B?QStSQncvUWNIRjJiNEl3dE5lSWJYWXorZDhSYU1sbzlPcUdMcnhHdUpyTDBF?=
 =?utf-8?B?ZERKeEVDRGtEYWRZcWRmRURIWmcwMHZLbVFyNFVBRzZoVjl1czlYaUZDa0da?=
 =?utf-8?B?ZUFrc2FDREhmdUsrUktnMmlMKzUxZmNCcXY0OWd6K3VRc3BJSkVDNDlDZlRJ?=
 =?utf-8?B?a2V1TXl1cFdJNVFkeUppQ3lEWjVhNFF4NTJKYUNZQ3RHNUc3SjQ4MXJjandS?=
 =?utf-8?B?Wm9TQXhUWC9Bb3FUZEhaNzVaU0YxK1RNcUhKd25mL1dhdHIzdzdpK3o3OXZq?=
 =?utf-8?B?Zkk1YmQ1RW1KeUhOZElQekx5eGtERUV2T0l1aFBTNUptNTlNSzlHazhjK284?=
 =?utf-8?B?ckhMSWJqZEt0emlvVkpKMG1nRmsvY085RitUTnNmMDY1T1JlZjdjL2J1MXhX?=
 =?utf-8?B?Q3RUakxEMmlJUXdGdDFZblprSGFmdWVxWkJwZndXc1VmU3pDVVY1ZmF2Qy9K?=
 =?utf-8?B?QXUraUdwMHRwd0hjdGNoUWtkTUJ2UDRYZFNxK2ZaWnJHdFYrdmE1RVV4UzVj?=
 =?utf-8?B?RUtLMVJsUmtYM1JHZU9qNFJCQWtGcjhjUGtZRHM2WU9lMGRsZm5qNjJHWUNt?=
 =?utf-8?B?MzdFS1hNS3U3YlVlTnI2TStHKzhKVFlpYkFPVWkyRFQrT3F3WUFpR3Vwb3pS?=
 =?utf-8?B?YTdleFRON1d3NElGMDI5aWwyYmZuemJIMHZVdTRicVJua3Y0amNaV3Q4R2Qx?=
 =?utf-8?B?bzFiOFk0OGFKWkx2TjBFUEc4Z1BXNlRYdS9oY0ZqbkVjSytIMEVad3hZVjVi?=
 =?utf-8?B?NDZ5UWVPTDNYTE1OMmI3TkdNaUp4TVhVQVM5WkJrclViQy9zaml3MkxtTXNS?=
 =?utf-8?B?akZsVzVhNVBBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QysrK1pPOW8xcHFiNUt3VWkxN3pRNkw3aGlaZUFINFJRb1hRNFl4bnp2ZHRG?=
 =?utf-8?B?U0xsWlBlNnRYamk3N0V4WE5WbFo0NlpKeVVZVkdUaHV3emcyZkQvbmkvUjNI?=
 =?utf-8?B?dFlCbkIwOWo1RnVpL0ZJM1ZFR2R2eDNqSVB2VVZsUytOQkUvWXY1U3FIa29V?=
 =?utf-8?B?UFpjQ2dRRDNEOXhOUmlrKzZrYXk0K0lkMnZibmFvL3FhY2I5NlVwVTNTYkl4?=
 =?utf-8?B?RE1zcENnWXAxa0xSNTNUUzN0eXRDRHpjWXlwKzRMSElZL0JvSXczZmZVUTZs?=
 =?utf-8?B?MGdCZFpabHFmSVpra3NTQkFnMVY5Nk9QT1FReXF6UkJTdDRBaTRDZkk4anNl?=
 =?utf-8?B?dU40SGZ6Nm5KbWg4Y0RwNmtFem1nYWRvZGZreEpxbStLY29jU3d1SSthcG1Y?=
 =?utf-8?B?Yjk4Wnh1OHFtR0drUldjcWdtbHJ6dFBmKzBTSmszczhBamhxb2UzdXE0cFAy?=
 =?utf-8?B?UjFqR1J2STl6c0daTnl2ejhkQzRPT1FUalNINDRQbmhNRW5rQTlhQmo2Vm11?=
 =?utf-8?B?QXhtK1UzejVOcEtaSmc2Z1NJUDF4MWRRSzNESVlWbldXSS9QK0VoUFJqUW1r?=
 =?utf-8?B?Z1RuTXNjZHFnbWlkK013NjZWODdpOE0vbGszZWNHRGpKWlRoTzd2cys0WC9m?=
 =?utf-8?B?QVZtMUlySms4MjZXWk93SXhUZFpxaUFCUFE3dHpmYmtNT05rMWZjcHN6TDBm?=
 =?utf-8?B?bU53eW5tQVFubzZMWG56VDM1WEZlWEM3K3QyVjhCNU1jeU9BZHg2ZWxYSWY5?=
 =?utf-8?B?S3FPNjBzbEtpRjVlMFNLcTVFTUY3bFRpTFQ2TldwQkJ0dzN4VmZ5bk9IbDVs?=
 =?utf-8?B?UVd1RWNoMjZxZ214NFMyUENZMjZaNVlmTy84bXJuWTllYkZueTAwRGpzMVBE?=
 =?utf-8?B?azJodlBDcGZmTmJEOEsvZXpESjFYOEhRMEZEUHZXWnM0T04rMWZWOTdEVjhJ?=
 =?utf-8?B?M25xWDJJNTlUKzhrbEROZW15akE4THhra0d1UXh1YjJZVUVtdWtZbXNIcERw?=
 =?utf-8?B?VzFlQ1oxTVU2VGlYVjdQaEVFVWpuQWd0MnBrVllEdzBudE8vbmhZRXQ5THdL?=
 =?utf-8?B?Z3Z2NUZyTHk2bFV6ZEo3L0p0OGs5eEh1V1RHRWZXczJoZ05QSVArQlZnOFJ4?=
 =?utf-8?B?ZWVKSUlUV0l2YVkyOGFrZ2dqSzM5VGlISjBaMmlIUDhWb1BreDRUNm5FVG9M?=
 =?utf-8?B?NHZZWDJ0Ymk3R1c3cHVPMXp2OXkvS3RFWEdGZDB4OWpQM2pEczd0bVRlbUEx?=
 =?utf-8?B?ZkNkNWQ4YnJMdjFPaWdSZENxdk9ySVFid1cwUEtNMmpHZVR1RkpYR0o0SkJp?=
 =?utf-8?B?aWdNZHVVTFJSRlVXRlJycDFnNDEvcWRvRGtpVVpOZGZQSGxHUTd2RXlzL1dX?=
 =?utf-8?B?TE14bi9DRWFVZ1B5NXBpWkZtQjg5RnhvMytXbW9jQjV3RnU3WitQc2Z1V2Jw?=
 =?utf-8?B?VjgwVjNWMWFjRnYxYnU2SFRWOGNsemFRWU0rdWhvVjVOc3dTckY0dm5hSldZ?=
 =?utf-8?B?SS9lVU9XN2gxK1g1WnVXeU51dExSMFVQUHJGTXZOTVVzVDZFcU5tNFdGWmhF?=
 =?utf-8?B?dXlzQUZodkNrOWFzTGlRQ1FBZ0FpcFA2ZGdFUG0xSmRpSVd4TkxpbUJUVml5?=
 =?utf-8?B?QlJTQjZ3Nk1DalZuM0trMC9pUnJiODNMblVYTDMwMW5xTi9Mcnd4ZFY5TU5a?=
 =?utf-8?B?UXVlcUx4UWUra24wdStvTXQzZndOMW5UMy9ac3Q3TTZKS3RYdGpRNUhtRERU?=
 =?utf-8?B?ZkFMdHNDdStYV2FneDlJbTFCcVdVNDZJck9odG9GSEpFMmhzUE1CZkR2cFJL?=
 =?utf-8?B?ZlpYRy9ld3lHL3ZaUC83OXVscFhCT0dic1hOalpBWnNrb0IvN0Qza3lZd2xt?=
 =?utf-8?B?K051QXMvRkJoaEJqNzVsNDY2NkVNZU5tTUJRTWpYUzJ4R24yMUNQZ0VQYXhP?=
 =?utf-8?B?ZlNDdVhZdnpZcUk4R0p3dC9yQzlaanR3bWlhMjUxSm1BU1VvMUJEU0tVdWY0?=
 =?utf-8?B?dnlSMnFMZEo0dUYvUER0eG9BY0V4QS9XWDZ4aGNEaHdvY2MyNkErcnloQTIw?=
 =?utf-8?B?ZkhadjBNTTA4TTAxMGNsL3dlOUlVTUJiaFdCc3NnN1J2eVJ5N2hLOHFxQ0hR?=
 =?utf-8?Q?Ag6k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f37fe58-ccaa-46ba-08e8-08ddd917a9fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:43:01.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diwnTo12wCvviLvnELyvGW6SP5/yP8G3ipv8qeDHNz1Wv02YSPFR+BwWiOMGweBu0ZdYNmmz6ldct57ljkB6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747

From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>

The AP1302 is a standalone ISP for ON Semiconductor sensors.
AP1302 ISP supports single and dual sensor inputs. The driver
code supports AR1335, AR0144 and AR0330 sensors with single and
dual mode by loading the corresponding firmware.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v4:
- change back to use onnn,module.
- firmware header format still NOT resolve yet. Need make binding work
firstly.
- remove depercated .s_stream.
- fix missed return before dev_err_probe().
- use devm_mutext_init();
- remove some unnecessary dbg message.

Change in v3:
- add extra empty line between difference register define
- add bits.h
- use GEN_MASK and align regiser bit define from 31 to 0.
- add ap1302_sensor_supply
- add enable gpio
- update firmware header format
- update raw sensor supply delay time
- use gpiod_set_value_cansleep() insteand gpiod_set_value()
- update use latest v4l2 api
- use ctrl_to_sd() helper function
- add ap1302_g_volatile_ctrl()
- remove ap1302_get_fmt()
- use guard for mutex.
- use dev_err_probe
- use devm_add_action_or_reset to simple error handle at probe.
- use read_poll_timeout() simple dma idle polling.

previous upstream:
https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |    9 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ap1302.c | 2829 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 2840 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb2bcd73117d5bbc9fc33355cc86f945da1ce48f..ca07e784f904202ec9947ce68397020eb5cd99b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1818,6 +1818,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
+F:	drivers/media/i2c/ap1302.c
 
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
 M:	William Breathitt Gray <wbg@kernel.org>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c89bb543d3b608412eb4c414b2b60..ad9e39693b5c6468a687c128c3e8b576eaac6ae7 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -35,6 +35,15 @@ menuconfig VIDEO_CAMERA_SENSOR
 
 if VIDEO_CAMERA_SENSOR
 
+config VIDEO_AP1302
+	tristate "ON Semiconductor AP1302 ISP"
+	help
+	  This is a Video4Linux2 sensor-level driver for the ON Semiconductor
+	  AP1302 ISP.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ap1302.
+
 config VIDEO_APTINA_PLL
 	tristate
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee5e576a0400c4e8ab2b31be4d8104..aeb86c219c71c81d453252b08e9a492d6a925f01 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_VIDEO_ADV7842) += adv7842.o
 obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
 obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
 obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
+obj-$(CONFIG_VIDEO_AP1302) += ap1302.o
 obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
 obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
diff --git a/drivers/media/i2c/ap1302.c b/drivers/media/i2c/ap1302.c
new file mode 100644
index 0000000000000000000000000000000000000000..d9fb4f709c478da70801878dbc457ffef38a571f
--- /dev/null
+++ b/drivers/media/i2c/ap1302.c
@@ -0,0 +1,2829 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the AP1302 external camera ISP from ON Semiconductor
+ *
+ * Copyright (C) 2021, Witekio, Inc.
+ * Copyright (C) 2021, Xilinx, Inc.
+ * Copyright (C) 2021, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/media.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define AP1302_FW_WINDOW_SIZE			0x2000
+#define AP1302_FW_WINDOW_OFFSET			0x8000
+
+#define AP1302_MIN_WIDTH			24U
+#define AP1302_MIN_HEIGHT			16U
+#define AP1302_MAX_WIDTH			4224U
+#define AP1302_MAX_HEIGHT			4092U
+
+#define AP1302_REG_16BIT(n)			((2 << 24) | (n))
+#define AP1302_REG_32BIT(n)			((4 << 24) | (n))
+#define AP1302_REG_SIZE(n)			((n) >> 24)
+#define AP1302_REG_PAGE_MASK			GENMASK(23, 16)
+#define AP1302_REG_PAGE(n)			((n) & AP1302_REG_PAGE_MASK)
+#define AP1302_REG_ADDR(n)			((n) & GENMASK(15, 0))
+
+/* Info Registers */
+#define AP1302_CHIP_VERSION			AP1302_REG_16BIT(0x0000)
+#define AP1302_CHIP_ID				0x0265
+#define AP1302_FRAME_CNT			AP1302_REG_16BIT(0x0002)
+#define AP1302_ERROR				AP1302_REG_16BIT(0x0006)
+#define AP1302_ERR_FILE				AP1302_REG_32BIT(0x0008)
+#define AP1302_ERR_LINE				AP1302_REG_16BIT(0x000c)
+#define AP1302_SIPM_ERR_0			AP1302_REG_16BIT(0x0014)
+#define AP1302_SIPM_ERR_1			AP1302_REG_16BIT(0x0016)
+#define AP1302_CHIP_REV				AP1302_REG_16BIT(0x0050)
+#define AP1302_CON_BUF(n)			AP1302_REG_16BIT(0x0a2c + (n))
+#define AP1302_CON_BUF_SIZE			512
+
+/* Control Registers */
+#define AP1302_DZ_TGT_FCT			AP1302_REG_16BIT(0x1010)
+
+#define AP1302_SFX_MODE				AP1302_REG_16BIT(0x1016)
+#define AP1302_SFX_MODE_SFX_NORMAL		(0U << 0)
+#define AP1302_SFX_MODE_SFX_ALIEN		(1U << 0)
+#define AP1302_SFX_MODE_SFX_ANTIQUE		(2U << 0)
+#define AP1302_SFX_MODE_SFX_BW			(3U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS		(4U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS_COLORED	(5U << 0)
+#define AP1302_SFX_MODE_SFX_GRAYSCALE		(6U << 0)
+#define AP1302_SFX_MODE_SFX_NEGATIVE		(7U << 0)
+#define AP1302_SFX_MODE_SFX_BLUISH		(8U << 0)
+#define AP1302_SFX_MODE_SFX_GREENISH		(9U << 0)
+#define AP1302_SFX_MODE_SFX_REDISH		(10U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE1		(11U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE2		(12U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA1		(13U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA2		(14U << 0)
+#define AP1302_SFX_MODE_SFX_SKETCH		(15U << 0)
+#define AP1302_SFX_MODE_SFX_SOLARIZE		(16U << 0)
+#define AP1302_SFX_MODE_SFX_FOGGY		(17U << 0)
+
+#define AP1302_ATOMIC				AP1302_REG_16BIT(0x1184)
+#define AP1302_ATOMIC_MODE			BIT(2)
+#define AP1302_ATOMIC_FINISH			BIT(1)
+#define AP1302_ATOMIC_RECORD			BIT(0)
+
+/*
+ * Preview Context Registers (preview_*). AP1302 supports 3 "contexts"
+ * (Preview, Snapshot, Video). These can be programmed for different size,
+ * format, FPS, etc. There is no functional difference between the contexts,
+ * so the only potential benefit of using them is reduced number of register
+ * writes when switching output modes (if your concern is atomicity, see
+ * "atomic" register).
+ * So there's virtually no benefit in using contexts for this driver and it
+ * would significantly increase complexity. Let's use preview context only.
+ */
+#define AP1302_PREVIEW_WIDTH			AP1302_REG_16BIT(0x2000)
+#define AP1302_PREVIEW_HEIGHT			AP1302_REG_16BIT(0x2002)
+#define AP1302_PREVIEW_ROI_X0			AP1302_REG_16BIT(0x2004)
+#define AP1302_PREVIEW_ROI_Y0			AP1302_REG_16BIT(0x2006)
+#define AP1302_PREVIEW_ROI_X1			AP1302_REG_16BIT(0x2008)
+#define AP1302_PREVIEW_ROI_Y1			AP1302_REG_16BIT(0x200a)
+
+#define AP1302_PREVIEW_OUT_FMT			AP1302_REG_16BIT(0x2012)
+#define AP1302_PREVIEW_OUT_FMT_IPIPE_BYPASS	BIT(13)
+#define AP1302_PREVIEW_OUT_FMT_SS		BIT(12)
+#define AP1302_PREVIEW_OUT_FMT_FAKE_EN		BIT(11)
+#define AP1302_PREVIEW_OUT_FMT_ST_EN		BIT(10)
+#define AP1302_PREVIEW_OUT_FMT_IIS_NONE		(0U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_POST_VIEW	(1U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_VIDEO	(2U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_BUBBLE	(3U << 8)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_422	(0U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_420	(1U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV		(3U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RGB		(4U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF	(5U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW8		(8U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW10		(9U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW12		(10U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW16		(11U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG8		(12U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG10		(13U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG12		(14U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG16		(15U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_ROTATE	BIT(2)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_SCAN	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_JFIF	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_EXIF	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_888	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_565	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555M	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555L	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_422	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_420	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_400	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_SENSOR	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CAPTURE	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CP	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_BPC	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_IHDR	(4U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PP	(5U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_DENSH	(6U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PM	(7U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_GC	(8U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CURVE	(9U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CCONV	(10U << 0)
+
+#define AP1302_PREVIEW_S1_SENSOR_MODE		AP1302_REG_16BIT(0x202e)
+
+#define AP1302_PREVIEW_HINF_CTRL		AP1302_REG_16BIT(0x2030)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_LE	BIT(15)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_16BIT	BIT(14)
+#define AP1302_PREVIEW_HINF_CTRL_MUX_DELAY(n)	((n) << 8)
+#define AP1302_PREVIEW_HINF_CTRL_LV_POL		BIT(7)
+#define AP1302_PREVIEW_HINF_CTRL_FV_POL		BIT(6)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_CONT_CLK	BIT(5)
+#define AP1302_PREVIEW_HINF_CTRL_SPOOF		BIT(4)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_MODE	BIT(3)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(n)	((n) << 0)
+
+/* IQ Registers */
+#define AP1302_AE_CTRL				AP1302_REG_16BIT(0x5002)
+#define AP1302_AE_CTRL_STATS_SEL		BIT(11)
+#define AP1302_AE_CTRL_IMM			BIT(10)
+#define AP1302_AE_CTRL_ROUND_ISO		BIT(9)
+#define AP1302_AE_CTRL_UROI_FACE		BIT(7)
+#define AP1302_AE_CTRL_UROI_LOCK		BIT(6)
+#define AP1302_AE_CTRL_UROI_BOUND		BIT(5)
+#define AP1302_AE_CTRL_IMM1			BIT(4)
+#define AP1302_AE_CTRL_MANUAL_EXP_TIME_GAIN	(0U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_EXP_TIME	(1U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_GAIN		(2U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_ISO		(3U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_EXP_TIME		(9U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_GAIN		(10U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_ISO		(11U << 0)
+#define AP1302_AE_CTRL_FULL_AUTO		(12U << 0)
+#define AP1302_AE_CTRL_MODE_MASK		0x000f
+
+#define AP1302_AE_MANUAL_GAIN			AP1302_REG_16BIT(0x5006)
+#define AP1302_AE_BV_OFF			AP1302_REG_16BIT(0x5014)
+#define AP1302_AE_MET				AP1302_REG_16BIT(0x503E)
+
+#define AP1302_AWB_CTRL				AP1302_REG_16BIT(0x5100)
+#define AP1302_AWB_CTRL_RECALC			BIT(13)
+#define AP1302_AWB_CTRL_POSTGAIN		BIT(12)
+#define AP1302_AWB_CTRL_UNGAIN			BIT(11)
+#define AP1302_AWB_CTRL_CLIP			BIT(10)
+#define AP1302_AWB_CTRL_SKY			BIT(9)
+#define AP1302_AWB_CTRL_FLASH			BIT(8)
+#define AP1302_AWB_CTRL_FACE_OFF		(0U << 6)
+#define AP1302_AWB_CTRL_FACE_IGNORE		(1U << 6)
+#define AP1302_AWB_CTRL_FACE_CONSTRAINED	(2U << 6)
+#define AP1302_AWB_CTRL_FACE_ONLY		(3U << 6)
+#define AP1302_AWB_CTRL_IMM			BIT(5)
+#define AP1302_AWB_CTRL_IMM1			BIT(4)
+#define AP1302_AWB_CTRL_MODE_OFF		(0U << 0)
+#define AP1302_AWB_CTRL_MODE_HORIZON		(1U << 0)
+#define AP1302_AWB_CTRL_MODE_A			(2U << 0)
+#define AP1302_AWB_CTRL_MODE_CWF		(3U << 0)
+#define AP1302_AWB_CTRL_MODE_D50		(4U << 0)
+#define AP1302_AWB_CTRL_MODE_D65		(5U << 0)
+#define AP1302_AWB_CTRL_MODE_D75		(6U << 0)
+#define AP1302_AWB_CTRL_MODE_MANUAL		(7U << 0)
+#define AP1302_AWB_CTRL_MODE_MEASURE		(8U << 0)
+#define AP1302_AWB_CTRL_MODE_AUTO		(15U << 0)
+#define AP1302_AWB_CTRL_MODE_MASK		0x000f
+
+#define AP1302_FLICK_CTRL			AP1302_REG_16BIT(0x5440)
+#define AP1302_FLICK_CTRL_FREQ(n)		((n) << 8)
+#define AP1302_FLICK_CTRL_ETC_IHDR_UP		BIT(6)
+#define AP1302_FLICK_CTRL_ETC_DIS		BIT(5)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_MAX_ET	BIT(4)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_UPPER_ET	BIT(3)
+#define AP1302_FLICK_CTRL_FRC_EN		BIT(2)
+#define AP1302_FLICK_CTRL_MODE_DISABLED		(0U << 0)
+#define AP1302_FLICK_CTRL_MODE_MANUAL		(1U << 0)
+#define AP1302_FLICK_CTRL_MODE_AUTO		(2U << 0)
+
+#define AP1302_SCENE_CTRL			AP1302_REG_16BIT(0x5454)
+#define AP1302_SCENE_CTRL_MODE_NORMAL		(0U << 0)
+#define AP1302_SCENE_CTRL_MODE_PORTRAIT		(1U << 0)
+#define AP1302_SCENE_CTRL_MODE_LANDSCAPE	(2U << 0)
+#define AP1302_SCENE_CTRL_MODE_SPORT		(3U << 0)
+#define AP1302_SCENE_CTRL_MODE_CLOSE_UP		(4U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT		(5U << 0)
+#define AP1302_SCENE_CTRL_MODE_TWILIGHT		(6U << 0)
+#define AP1302_SCENE_CTRL_MODE_BACKLIGHT	(7U << 0)
+#define AP1302_SCENE_CTRL_MODE_HIGH_SENSITIVE	(8U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT_PORTRAIT	(9U << 0)
+#define AP1302_SCENE_CTRL_MODE_BEACH		(10U << 0)
+#define AP1302_SCENE_CTRL_MODE_DOCUMENT		(11U << 0)
+#define AP1302_SCENE_CTRL_MODE_PARTY		(12U << 0)
+#define AP1302_SCENE_CTRL_MODE_FIREWORKS	(13U << 0)
+#define AP1302_SCENE_CTRL_MODE_SUNSET		(14U << 0)
+#define AP1302_SCENE_CTRL_MODE_AUTO		(0xffU << 0)
+
+/* System Registers */
+#define AP1302_BOOTDATA_STAGE			AP1302_REG_16BIT(0x6002)
+#define AP1302_WARNING(n)			AP1302_REG_16BIT(0x6004 + (n) * 2)
+
+#define AP1302_SENSOR_SELECT			AP1302_REG_16BIT(0x600c)
+#define AP1302_SENSOR_SELECT_TP_MODE(n)		((n) << 8)
+#define AP1302_SENSOR_SELECT_PATTERN_ON		BIT(7)
+#define AP1302_SENSOR_SELECT_MODE_3D_ON		BIT(6)
+#define AP1302_SENSOR_SELECT_CLOCK		BIT(5)
+#define AP1302_SENSOR_SELECT_SINF_MIPI		BIT(4)
+#define AP1302_SENSOR_SELECT_YUV		BIT(2)
+#define AP1302_SENSOR_SELECT_SENSOR_TP		(0U << 0)
+#define AP1302_SENSOR_SELECT_SENSOR(n)		(((n) + 1) << 0)
+
+#define AP1302_SYS_START			AP1302_REG_16BIT(0x601a)
+#define AP1302_SYS_START_PLL_LOCK		BIT(15)
+#define AP1302_SYS_START_LOAD_OTP		BIT(12)
+#define AP1302_SYS_START_RESTART_ERROR		BIT(11)
+#define AP1302_SYS_START_STALL_STATUS		BIT(9)
+#define AP1302_SYS_START_STALL_EN		BIT(8)
+#define AP1302_SYS_START_STALL_MODE_FRAME	(0U << 6)
+#define AP1302_SYS_START_STALL_MODE_DISABLED	(1U << 6)
+#define AP1302_SYS_START_STALL_MODE_POWER_DOWN	(2U << 6)
+#define AP1302_SYS_START_GO			BIT(4)
+#define AP1302_SYS_START_PATCH_FUN		BIT(1)
+#define AP1302_SYS_START_PLL_INIT		BIT(0)
+
+#define AP1302_DMA_SRC				AP1302_REG_32BIT(0x60a0)
+
+#define AP1302_DMA_DST				AP1302_REG_32BIT(0x60a4)
+#define AP1302_DMA_SIP_SIPM(n)			((n) << 26)
+#define AP1302_DMA_SIP_DATA_16_BIT		BIT(25)
+#define AP1302_DMA_SIP_ADDR_16_BIT		BIT(24)
+#define AP1302_DMA_SIP_ID(n)			((n) << 17)
+#define AP1302_DMA_SIP_REG(n)			((n) << 0)
+
+#define AP1302_DMA_SIZE				AP1302_REG_32BIT(0x60a8)
+
+#define AP1302_DMA_CTRL				AP1302_REG_16BIT(0x60ac)
+#define AP1302_DMA_CTRL_SCH_NORMAL		(0 << 12)
+#define AP1302_DMA_CTRL_SCH_NEXT		(1 << 12)
+#define AP1302_DMA_CTRL_SCH_NOW			(2 << 12)
+#define AP1302_DMA_CTRL_DST_REG			(0 << 8)
+#define AP1302_DMA_CTRL_DST_SRAM		(1 << 8)
+#define AP1302_DMA_CTRL_DST_SPI			(2 << 8)
+#define AP1302_DMA_CTRL_DST_SIP			(3 << 8)
+#define AP1302_DMA_CTRL_SRC_REG			(0 << 4)
+#define AP1302_DMA_CTRL_SRC_SRAM		(1 << 4)
+#define AP1302_DMA_CTRL_SRC_SPI			(2 << 4)
+#define AP1302_DMA_CTRL_SRC_SIP			(3 << 4)
+#define AP1302_DMA_CTRL_MODE_32_BIT		BIT(3)
+#define AP1302_DMA_CTRL_MODE_MASK		(7 << 0)
+#define AP1302_DMA_CTRL_MODE_IDLE		(0 << 0)
+#define AP1302_DMA_CTRL_MODE_SET		(1 << 0)
+#define AP1302_DMA_CTRL_MODE_COPY		(2 << 0)
+#define AP1302_DMA_CTRL_MODE_MAP		(3 << 0)
+#define AP1302_DMA_CTRL_MODE_UNPACK		(4 << 0)
+#define AP1302_DMA_CTRL_MODE_OTP_READ		(5 << 0)
+#define AP1302_DMA_CTRL_MODE_SIP_PROBE		(6 << 0)
+
+#define AP1302_BRIGHTNESS			AP1302_REG_16BIT(0x7000)
+#define AP1302_CONTRAST				AP1302_REG_16BIT(0x7002)
+#define AP1302_SATURATION			AP1302_REG_16BIT(0x7006)
+#define AP1302_GAMMA				AP1302_REG_16BIT(0x700A)
+
+/* Misc Registers */
+#define AP1302_REG_ADV_START			0xe000
+#define AP1302_ADVANCED_BASE			AP1302_REG_32BIT(0xf038)
+#define AP1302_SIP_CRC				AP1302_REG_16BIT(0xf052)
+
+/* Advanced System Registers */
+#define AP1302_ADV_IRQ_SYS_INTE			AP1302_REG_32BIT(0x00230000)
+#define AP1302_ADV_IRQ_SYS_INTE_TEST_COUNT	BIT(25)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_1		BIT(24)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_0		BIT(23)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI_L	(7U << 20)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI	BIT(19)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI_L	(15U << 14)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI	BIT(13)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF		BIT(12)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_S		BIT(11)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_B		BIT(10)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_A		BIT(9)
+#define AP1302_ADV_IRQ_SYS_INTE_IP		BIT(8)
+#define AP1302_ADV_IRQ_SYS_INTE_TIMER		BIT(7)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPM		(3U << 6)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_ADR_RANGE	BIT(5)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_DIRECT_WRITE	BIT(4)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_FIFO_WRITE	BIT(3)
+#define AP1302_ADV_IRQ_SYS_INTE_SPI		BIT(2)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_CNT	BIT(1)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_PIN	BIT(0)
+
+/* Advanced Slave MIPI Registers */
+#define AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(p, n) \
+	AP1302_REG_32BIT(0x00420008 + (p) * 0x50000 + (n) * 0x20)
+#define AP1302_LANE_ERR_LP_VAL(n)		(((n) >> 30) & 3)
+#define AP1302_LANE_ERR_STATE(n)		(((n) >> 24) & 0xf)
+#define AP1302_LANE_ERR				BIT(18)
+#define AP1302_LANE_ABORT			BIT(17)
+#define AP1302_LANE_LP_VAL(n)			(((n) >> 6) & 3)
+#define AP1302_LANE_STATE(n)			((n) & 0xf)
+#define AP1302_LANE_STATE_STOP_S		0x0
+#define AP1302_LANE_STATE_HS_REQ_S		0x1
+#define AP1302_LANE_STATE_LP_REQ_S		0x2
+#define AP1302_LANE_STATE_HS_S			0x3
+#define AP1302_LANE_STATE_LP_S			0x4
+#define AP1302_LANE_STATE_ESC_REQ_S		0x5
+#define AP1302_LANE_STATE_TURN_REQ_S		0x6
+#define AP1302_LANE_STATE_ESC_S			0x7
+#define AP1302_LANE_STATE_ESC_0			0x8
+#define AP1302_LANE_STATE_ESC_1			0x9
+#define AP1302_LANE_STATE_TURN_S		0xa
+#define AP1302_LANE_STATE_TURN_MARK		0xb
+#define AP1302_LANE_STATE_ERROR_S		0xc
+
+#define AP1302_ADV_CAPTURE_A_FV_CNT		AP1302_REG_32BIT(0x00490040)
+
+struct ap1302_device;
+
+enum {
+	AP1302_PAD_SINK_0,
+	AP1302_PAD_SINK_1,
+	AP1302_PAD_SOURCE,
+	AP1302_PAD_MAX,
+};
+
+struct ap1302_format_info {
+	unsigned int code;
+	u16 out_fmt;
+	u32 data_type;
+};
+
+struct ap1302_format {
+	struct v4l2_mbus_framefmt format;
+	const struct ap1302_format_info *info;
+};
+
+struct ap1302_size {
+	unsigned int width;
+	unsigned int height;
+};
+
+struct ap1302_sensor_supply {
+	const char *name;
+	unsigned int post_delay_us;
+};
+
+struct ap1302_sensor_info {
+	const char *model;
+	const char *name;
+	unsigned int i2c_addr;
+	struct ap1302_size resolution;
+	u32 format;
+	const struct ap1302_sensor_supply *supplies;
+};
+
+static const struct ap1302_sensor_supply ap1302_supplies[] = {
+	{ .name = "dvdd", .post_delay_us = 2000, },
+	{ .name = "hmisc", .post_delay_us = 2000, },
+	{ .name = "smisc", .post_delay_us = 2000, },
+};
+
+struct ap1302_sensor {
+	struct ap1302_device *ap1302;
+	unsigned int index;
+
+	struct device_node *of_node;
+	struct device *dev;
+	unsigned int num_supplies;
+	struct regulator_bulk_data *supplies;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+};
+
+static inline struct ap1302_sensor *to_ap1302_sensor(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ap1302_sensor, sd);
+}
+
+struct ap1302_device {
+	struct device *dev;
+	struct i2c_client *client;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *standby_gpio;
+	struct gpio_desc *isp_en_gpio;
+	struct clk *clock;
+	struct regmap *regmap16;
+	struct regmap *regmap32;
+	u32 reg_page;
+
+	const struct firmware *fw;
+
+	struct v4l2_fwnode_endpoint bus_cfg;
+
+	struct mutex lock;	/* Protects formats */
+
+	struct v4l2_subdev sd;
+	struct media_pad pads[AP1302_PAD_MAX];
+	unsigned int width_factor;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	const struct ap1302_sensor_info *sensor_info;
+	struct ap1302_sensor sensors[2];
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ap1302_supplies)];
+
+	struct {
+		struct dentry *dir;
+		struct mutex lock; /* Protects debugfs access */
+		u32 sipm_addr;
+	} debugfs;
+};
+
+static inline struct ap1302_device *to_ap1302(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ap1302_device, sd);
+}
+
+struct ap1302_firmware_header {
+	u32 crc;
+	u32 checksum;
+	u32 pll_init_size;
+	u32 total_size;
+} __packed;
+
+static const struct ap1302_format_info supported_video_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.out_fmt = AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF |
+			   AP1302_PREVIEW_OUT_FMT_FST_YUV_422,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+		.out_fmt = AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF |
+			   AP1302_PREVIEW_OUT_FMT_FST_YUV_420,
+		.data_type = MIPI_CSI2_DT_YUV420_8B,
+	},
+};
+
+/* -----------------------------------------------------------------------------
+ * Sensor Info
+ */
+
+static const struct ap1302_sensor_info ap1302_sensor_info[] = {
+	{
+		.model = "onnn,ar0144",
+		.name = "ar0144",
+		.i2c_addr = 0x10,
+		.resolution = { 1280, 800 },
+		.format = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 100 },
+			{ "vddio", 100 },
+			{ "vdd", 0 },
+			{ },
+		},
+	}, {
+		.model = "onnn,ar0330",
+		.name = "ar0330",
+		.i2c_addr = 0x10,
+		.resolution = { 2304, 1536 },
+		.format = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vddpll", 0 },
+			{ "vaa", 0 },
+			{ "vdd", 0 },
+			{ "vddio", 0 },
+			{ },
+		},
+	}, {
+		.model = "onnn,ar1335",
+		.name = "ar1335",
+		.i2c_addr = 0x36,
+		.resolution = { 4208, 3120 },
+		.format = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 0 },
+			{ "vddio", 0 },
+			{ "vdd", 0 },
+			{ },
+		},
+	},
+};
+
+static const struct ap1302_sensor_info ap1302_sensor_info_tpg = {
+	.model = "",
+	.name = "tpg",
+	.resolution = { 1920, 1080 },
+};
+
+/* -----------------------------------------------------------------------------
+ * Register Configuration
+ */
+
+static const struct regmap_config ap1302_reg16_config = {
+	.name = "val_16bits",
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_stride = 2,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_NONE,
+};
+
+static const struct regmap_config ap1302_reg32_config = {
+	.name = "val_32bits",
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int __ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u16 addr = AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret = regmap_write(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret = regmap_write(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "write", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val,
+			int *err)
+{
+	u32 page = AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	if (page) {
+		if (ap1302->reg_page != page) {
+			ret = __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				goto done;
+
+			ap1302->reg_page = page;
+		}
+
+		reg &= ~AP1302_REG_PAGE_MASK;
+		reg += AP1302_REG_ADV_START;
+	}
+
+	ret = __ap1302_write(ap1302, reg, val);
+
+done:
+	if (err && ret)
+		*err = ret;
+
+	return ret;
+}
+
+static int __ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u16 addr = AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret = regmap_read(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret = regmap_read(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "read", ret);
+		return ret;
+	}
+
+	dev_dbg(ap1302->dev, "%s: R0x%04x = 0x%0*x\n", __func__,
+		addr, size * 2, *val);
+
+	return 0;
+}
+
+static int ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	u32 page = AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (page) {
+		if (ap1302->reg_page != page) {
+			ret = __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				return ret;
+
+			ap1302->reg_page = page;
+		}
+
+		reg &= ~AP1302_REG_PAGE_MASK;
+		reg += AP1302_REG_ADV_START;
+	}
+
+	return __ap1302_read(ap1302, reg, val);
+}
+
+/* -----------------------------------------------------------------------------
+ * Sensor Registers Access
+ *
+ * Read and write sensor registers through the AP1302 DMA interface.
+ */
+
+static int ap1302_dma_wait_idle(struct ap1302_device *ap1302)
+{
+	int ret, val;
+	u32 ctrl;
+
+	ret = read_poll_timeout(ap1302_read, val,
+				val < 0 ||
+				((ctrl & AP1302_DMA_CTRL_MODE_MASK) == AP1302_DMA_CTRL_MODE_IDLE),
+				1000, 50000, 0, ap1302, AP1302_DMA_CTRL, &ctrl);
+
+	if (val < 0)
+		return val;
+
+	return ret;
+}
+
+static int ap1302_sipm_read(struct ap1302_device *ap1302, unsigned int port,
+			    u32 reg, u32 *val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u32 src;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+	src = AP1302_DMA_SIP_SIPM(port) |
+	      (size == 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0) |
+	      AP1302_DMA_SIP_ADDR_16_BIT |
+	      AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr) |
+	      AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_SRC, src, &ret);
+
+	/*
+	 * Use the AP1302_DMA_DST register as both the destination address, and
+	 * the scratch pad to store the read value.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_DST, AP1302_REG_ADDR(AP1302_DMA_DST),
+		     &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_REG |
+		     AP1302_DMA_CTRL_SRC_SIP |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_DMA_DST, val);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The value is stored in big-endian at the DMA_DST address. The regmap
+	 * uses big-endian, so 8-bit values are stored in bits 31:24 and 16-bit
+	 * values in bits 23:16.
+	 */
+	*val >>= 32 - size * 8;
+
+	return 0;
+}
+
+static int ap1302_sipm_write(struct ap1302_device *ap1302, unsigned int port,
+			     u32 reg, u32 val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u32 dst;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+
+	/*
+	 * Use the AP1302_DMA_SRC register as both the source address, and the
+	 * scratch pad to store the write value.
+	 *
+	 * As the AP1302 uses big endian, to store the value at address DMA_SRC
+	 * it must be written in the high order bits of the registers. However,
+	 * 8-bit values seem to be incorrectly handled by the AP1302, which
+	 * expects them to be stored at DMA_SRC + 1 instead of DMA_SRC. The
+	 * value is thus unconditionally shifted by 16 bits, unlike for DMA
+	 * reads.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_SRC,
+		     (val << 16) | AP1302_REG_ADDR(AP1302_DMA_SRC), &ret);
+	if (ret < 0)
+		return ret;
+
+	dst = AP1302_DMA_SIP_SIPM(port) |
+	      (size == 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0) |
+	      AP1302_DMA_SIP_ADDR_16_BIT |
+	      AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr) |
+	      AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_DST, dst, &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_SIP |
+		     AP1302_DMA_CTRL_SRC_REG |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Debugfs
+ */
+
+static int ap1302_sipm_addr_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 = arg;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	*val = ap1302->debugfs.sipm_addr;
+
+	return 0;
+}
+
+static int ap1302_sipm_addr_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 = arg;
+
+	if (val & ~0x8700ffff)
+		return -EINVAL;
+
+	switch ((val >> 24) & 7) {
+	case 1:
+	case 2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(mutex)(&ap1302->debugfs.lock);
+	ap1302->debugfs.sipm_addr = val;
+
+	return 0;
+}
+
+static int ap1302_sipm_data_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 = arg;
+	u32 value;
+	u32 addr;
+	int ret;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	addr = ap1302->debugfs.sipm_addr;
+	if (!addr)
+		return -EINVAL;
+
+	ret = ap1302_sipm_read(ap1302, addr >> 30, addr & ~BIT(31), &value);
+	if (!ret)
+		*val = value;
+
+	return ret;
+}
+
+static int ap1302_sipm_data_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 = arg;
+	u32 addr;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	addr = ap1302->debugfs.sipm_addr;
+	if (!addr)
+		return -EINVAL;
+
+	return ap1302_sipm_write(ap1302, addr >> 30, addr & ~BIT(31), val);
+}
+
+/*
+ * The sipm_addr and sipm_data attributes expose access to the sensor I2C bus.
+ *
+ * To read or write a register, sipm_addr has to first be written with the
+ * register address. The address is a 32-bit integer formatted as follows.
+ *
+ * I000 0SSS 0000 0000 RRRR RRRR RRRR RRRR
+ *
+ * I: SIPM index (0 or 1)
+ * S: Size (1: 8-bit, 2: 16-bit)
+ * R: Register address (16-bit)
+ *
+ * The sipm_data attribute can then be read to read the register value, or
+ * written to write it.
+ */
+
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_addr_fops, ap1302_sipm_addr_get,
+			 ap1302_sipm_addr_set, "0x%08llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_data_fops, ap1302_sipm_data_get,
+			 ap1302_sipm_data_set, "0x%08llx\n");
+
+static void ap1302_debugfs_init(struct ap1302_device *ap1302)
+{
+	struct dentry *dir;
+	char name[16];
+
+	mutex_init(&ap1302->debugfs.lock);
+
+	snprintf(name, sizeof(name), "ap1302.%s", dev_name(ap1302->dev));
+
+	dir = debugfs_create_dir(name, NULL);
+	if (IS_ERR(dir))
+		return;
+
+	ap1302->debugfs.dir = dir;
+
+	debugfs_create_file_unsafe("sipm_addr", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_addr_fops);
+	debugfs_create_file_unsafe("sipm_data", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_data_fops);
+}
+
+static void ap1302_debugfs_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+
+	debugfs_remove_recursive(ap1302->debugfs.dir);
+	mutex_destroy(&ap1302->debugfs.lock);
+}
+
+/* -----------------------------------------------------------------------------
+ * Power Handling
+ */
+
+static int ap1302_power_on_sensors(struct ap1302_device *ap1302)
+{
+	struct ap1302_sensor *sensor;
+	unsigned int i, j;
+	int ret;
+
+	if (!ap1302->sensor_info->supplies)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		sensor = &ap1302->sensors[i];
+		ret = 0;
+
+		for (j = 0; j < sensor->num_supplies; ++j) {
+			unsigned int delay;
+
+			/*
+			 * We can't use regulator_bulk_enable() as it would
+			 * enable all supplies in parallel, breaking the sensor
+			 * power sequencing constraints.
+			 */
+			ret = regulator_enable(sensor->supplies[j].consumer);
+			if (ret < 0) {
+				dev_err(ap1302->dev,
+					"Failed to enable supply %u for sensor %u\n",
+					j, i);
+				goto error;
+			}
+
+			delay = ap1302->sensor_info->supplies[j].post_delay_us;
+			usleep_range(delay, delay + 100);
+		}
+	}
+
+	return 0;
+
+error:
+	for (; j > 0; --j)
+		regulator_disable(sensor->supplies[j - 1].consumer);
+
+	for (; i > 0; --i) {
+		sensor = &ap1302->sensors[i - 1];
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+
+	return ret;
+}
+
+static void ap1302_power_off_sensors(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+
+	if (!ap1302->sensor_info->supplies)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+}
+
+static int ap1302_power_on(struct ap1302_device *ap1302)
+{
+	int ret;
+	int i;
+
+	/* 0. RESET was asserted when getting the GPIO. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 1);
+
+	/* 1. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 2. Power up the regulators. To be implemented. */
+	for (i = 0; i < ARRAY_SIZE(ap1302_supplies); ++i) {
+		unsigned int delay;
+
+		ret = regulator_enable(ap1302->supplies[i].consumer);
+		if (ret < 0) {
+			dev_err(ap1302->dev, "enable regulator fail\n");
+			return ret;
+		}
+
+		delay = ap1302_supplies[i].post_delay_us;
+		usleep_range(delay, delay + 100);
+	}
+
+	/* 3. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 0);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Turn the clock on. */
+	ret = clk_prepare_enable(ap1302->clock);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	/* 5. De-assert RESET. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 0);
+
+	/*
+	 * 6. Wait for the AP1302 to initialize. The datasheet doesn't specify
+	 * how long this takes.
+	 */
+	usleep_range(10000, 11000);
+
+	return 0;
+}
+
+static void ap1302_power_off(struct ap1302_device *ap1302)
+{
+	/* 1. Assert RESET. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 1);
+
+	/* 2. Turn the clock off. */
+	clk_disable_unprepare(ap1302->clock);
+
+	/* 3. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Power down the regulators. To be implemented. */
+	regulator_bulk_disable(ARRAY_SIZE(ap1302_supplies), ap1302->supplies);
+
+	/* 5. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		usleep_range(200, 1000);
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 0);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * Hardware Configuration
+ */
+
+static int ap1302_dump_console(struct ap1302_device *ap1302)
+{
+	u8 *buffer;
+	u8 *endp;
+	u8 *p;
+	int ret;
+
+	buffer = kmalloc(AP1302_CON_BUF_SIZE + 1, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	ret = regmap_raw_read(ap1302->regmap16, AP1302_CON_BUF(0), buffer,
+			      AP1302_CON_BUF_SIZE);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to read console buffer: %d\n",
+			ret);
+		goto done;
+	}
+
+	print_hex_dump(KERN_INFO, "console ", DUMP_PREFIX_OFFSET, 16, 1, buffer,
+		       AP1302_CON_BUF_SIZE, true);
+
+	buffer[AP1302_CON_BUF_SIZE] = '\0';
+
+	for (p = buffer; p < buffer + AP1302_CON_BUF_SIZE && *p; p = endp + 1) {
+		endp = strchrnul(p, '\n');
+		*endp = '\0';
+
+		pr_info("console %s\n", p);
+	}
+
+	ret = 0;
+
+done:
+	kfree(buffer);
+	return ret;
+}
+
+static const struct ap1302_format_info *find_info_by_code(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+		if (supported_video_formats[i].code == code)
+			break;
+	}
+
+	if (i >= ARRAY_SIZE(supported_video_formats))
+		return &supported_video_formats[0];
+
+	return &supported_video_formats[i];
+}
+
+static int ap1302_configure(struct ap1302_device *ap1302,
+			    struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct ap1302_format_info *info;
+	unsigned int data_lanes = ap1302->bus_cfg.bus.mipi_csi2.num_data_lanes;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, AP1302_PAD_SOURCE);
+
+	info = find_info_by_code(format->code);
+
+	ap1302_write(ap1302, AP1302_PREVIEW_HINF_CTRL,
+		     AP1302_PREVIEW_HINF_CTRL_SPOOF |
+		     AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(data_lanes), &ret);
+
+	ap1302_write(ap1302, AP1302_PREVIEW_WIDTH,
+		     format->width / ap1302->width_factor, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_HEIGHT,
+		     format->height, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_OUT_FMT,
+		     info->out_fmt, &ret);
+
+	if (ret)
+		return ret;
+
+	__v4l2_ctrl_handler_setup(&ap1302->ctrls);
+
+	return 0;
+}
+
+static int ap1302_stall(struct ap1302_device *ap1302, bool stall)
+{
+	int ret = 0;
+
+	if (stall) {
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_EN |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		if (ret < 0)
+			return ret;
+
+		msleep(200);
+		return ret;
+	} else {
+		return ap1302_write(ap1302, AP1302_SYS_START,
+				    AP1302_SYS_START_PLL_LOCK |
+				    AP1302_SYS_START_STALL_STATUS |
+				    AP1302_SYS_START_STALL_EN |
+				    AP1302_SYS_START_STALL_MODE_DISABLED, NULL);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Controls
+ */
+
+static u16 ap1302_wb_values[] = {
+	AP1302_AWB_CTRL_MODE_OFF,	/* V4L2_WHITE_BALANCE_MANUAL */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_AUTO */
+	AP1302_AWB_CTRL_MODE_A,		/* V4L2_WHITE_BALANCE_INCANDESCENT */
+	AP1302_AWB_CTRL_MODE_D50,	/* V4L2_WHITE_BALANCE_FLUORESCENT */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_FLUORESCENT_H */
+	AP1302_AWB_CTRL_MODE_HORIZON,	/* V4L2_WHITE_BALANCE_HORIZON */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_DAYLIGHT */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_FLASH */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_CLOUDY */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_SHADE */
+};
+
+static inline struct ap1302_device *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct ap1302_device, ctrls);
+}
+
+static int ap1302_set_wb_mode(struct ap1302_device *ap1302, s32 mode)
+{
+	u32 val;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_AWB_CTRL, &val);
+	if (ret)
+		return ret;
+	val &= ~AP1302_AWB_CTRL_MODE_MASK;
+	val |= ap1302_wb_values[mode];
+
+	if (mode == V4L2_WHITE_BALANCE_FLASH)
+		val |= AP1302_AWB_CTRL_FLASH;
+	else
+		val &= ~AP1302_AWB_CTRL_FLASH;
+
+	return ap1302_write(ap1302, AP1302_AWB_CTRL, val, NULL);
+}
+
+static int ap1302_set_exposure(struct ap1302_device *ap1302, s32 mode)
+{
+	u32 val;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_AE_CTRL, &val);
+	if (ret)
+		return ret;
+
+	val &= ~AP1302_AE_CTRL_MODE_MASK;
+	val |= mode;
+
+	return ap1302_write(ap1302, AP1302_AE_CTRL, val, NULL);
+}
+
+static int ap1302_set_exp_met(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_AE_MET, val, NULL);
+}
+
+static int ap1302_set_gain(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_AE_MANUAL_GAIN, val, NULL);
+}
+
+static int ap1302_set_contrast(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_CONTRAST, val, NULL);
+}
+
+static int ap1302_set_brightness(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_BRIGHTNESS, val, NULL);
+}
+
+static int ap1302_set_saturation(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SATURATION, val, NULL);
+}
+
+static int ap1302_set_gamma(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_GAMMA, val, NULL);
+}
+
+static int ap1302_set_zoom(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_DZ_TGT_FCT, val, NULL);
+}
+
+static u16 ap1302_sfx_values[] = {
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_NONE */
+	AP1302_SFX_MODE_SFX_BW,		/* V4L2_COLORFX_BW */
+	AP1302_SFX_MODE_SFX_SEPIA1,	/* V4L2_COLORFX_SEPIA */
+	AP1302_SFX_MODE_SFX_NEGATIVE,	/* V4L2_COLORFX_NEGATIVE */
+	AP1302_SFX_MODE_SFX_EMBOSS,	/* V4L2_COLORFX_EMBOSS */
+	AP1302_SFX_MODE_SFX_SKETCH,	/* V4L2_COLORFX_SKETCH */
+	AP1302_SFX_MODE_SFX_BLUISH,	/* V4L2_COLORFX_SKY_BLUE */
+	AP1302_SFX_MODE_SFX_GREENISH,	/* V4L2_COLORFX_GRASS_GREEN */
+	AP1302_SFX_MODE_SFX_REDISH,	/* V4L2_COLORFX_SKIN_WHITEN */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_VIVID */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_AQUA */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_ART_FREEZE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SILHOUETTE */
+	AP1302_SFX_MODE_SFX_SOLARIZE, /* V4L2_COLORFX_SOLARIZATION */
+	AP1302_SFX_MODE_SFX_ANTIQUE, /* V4L2_COLORFX_ANTIQUE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SET_CBCR */
+};
+
+static int ap1302_set_special_effect(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SFX_MODE, ap1302_sfx_values[val], NULL);
+}
+
+static u16 ap1302_scene_mode_values[] = {
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_NONE */
+	AP1302_SCENE_CTRL_MODE_BACKLIGHT,	/* V4L2_SCENE_MODE_BACKLIGHT */
+	AP1302_SCENE_CTRL_MODE_BEACH,		/* V4L2_SCENE_MODE_BEACH_SNOW */
+	AP1302_SCENE_CTRL_MODE_TWILIGHT,	/* V4L2_SCENE_MODE_CANDLE_LIGHT */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_DAWN_DUSK */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_FALL_COLORS */
+	AP1302_SCENE_CTRL_MODE_FIREWORKS,	/* V4L2_SCENE_MODE_FIREWORKS */
+	AP1302_SCENE_CTRL_MODE_LANDSCAPE,	/* V4L2_SCENE_MODE_LANDSCAPE */
+	AP1302_SCENE_CTRL_MODE_NIGHT,		/* V4L2_SCENE_MODE_NIGHT */
+	AP1302_SCENE_CTRL_MODE_PARTY,		/* V4L2_SCENE_MODE_PARTY_INDOOR */
+	AP1302_SCENE_CTRL_MODE_PORTRAIT,	/* V4L2_SCENE_MODE_PORTRAIT */
+	AP1302_SCENE_CTRL_MODE_SPORT,		/* V4L2_SCENE_MODE_SPORTS */
+	AP1302_SCENE_CTRL_MODE_SUNSET,		/* V4L2_SCENE_MODE_SUNSET */
+	AP1302_SCENE_CTRL_MODE_DOCUMENT,	/* V4L2_SCENE_MODE_TEXT */
+};
+
+static int ap1302_set_scene_mode(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SCENE_CTRL,
+			    ap1302_scene_mode_values[val], NULL);
+}
+
+static const u16 ap1302_flicker_values[] = {
+	AP1302_FLICK_CTRL_MODE_DISABLED,
+	AP1302_FLICK_CTRL_FREQ(50) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_FREQ(60) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_MODE_AUTO,
+};
+
+static int ap1302_set_flicker_freq(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_FLICK_CTRL,
+			    ap1302_flicker_values[val], NULL);
+}
+
+static int ap1302_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ap1302_device *ap1302 = ctrl_to_sd(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
+		return ap1302_set_wb_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_EXPOSURE:
+		return ap1302_set_exposure(ap1302, ctrl->val);
+
+	case V4L2_CID_EXPOSURE_METERING:
+		return ap1302_set_exp_met(ap1302, ctrl->val);
+
+	case V4L2_CID_GAIN:
+		return ap1302_set_gain(ap1302, ctrl->val);
+
+	case V4L2_CID_GAMMA:
+		return ap1302_set_gamma(ap1302, ctrl->val);
+
+	case V4L2_CID_CONTRAST:
+		return ap1302_set_contrast(ap1302, ctrl->val);
+
+	case V4L2_CID_BRIGHTNESS:
+		return ap1302_set_brightness(ap1302, ctrl->val);
+
+	case V4L2_CID_SATURATION:
+		return ap1302_set_saturation(ap1302, ctrl->val);
+
+	case V4L2_CID_ZOOM_ABSOLUTE:
+		return ap1302_set_zoom(ap1302, ctrl->val);
+
+	case V4L2_CID_COLORFX:
+		return ap1302_set_special_effect(ap1302, ctrl->val);
+
+	case V4L2_CID_SCENE_MODE:
+		return ap1302_set_scene_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_POWER_LINE_FREQUENCY:
+		return ap1302_set_flicker_freq(ap1302, ctrl->val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const s64 ap1302_link_freqs[] = {
+	445000000,
+};
+
+static int ap1302_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ap1302_device *ap1302 = ctrl_to_sd(ctrl);
+	int i;
+	u32 val;
+
+	switch (ctrl->id) {
+	case V4L2_CID_LINK_FREQ:
+		ap1302_read(ap1302, AP1302_REG_16BIT(0x0068), &val);
+		for (i = 0; i < ARRAY_SIZE(ap1302_link_freqs); i++) {
+			if (ap1302_link_freqs[i] == (val / 2) * 1000000)
+				break;
+		}
+		WARN_ON(i == ARRAY_SIZE(ap1302_link_freqs));
+		__v4l2_ctrl_s_ctrl(ctrl, i);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ap1302_ctrl_ops = {
+	.s_ctrl = ap1302_s_ctrl,
+	.g_volatile_ctrl = ap1302_g_volatile_ctrl,
+};
+
+static const struct v4l2_ctrl_config ap1302_ctrls[] = {
+	{
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE,
+		.min = 0,
+		.max = 9,
+		.def = 1,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_GAMMA,
+		.name = "Gamma",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x1000,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_CONTRAST,
+		.name = "Contrast",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_BRIGHTNESS,
+		.name = "Brightness",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_SATURATION,
+		.name = "Saturation",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x1000,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_EXPOSURE,
+		.name = "Exposure",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0,
+		.max = 0xC,
+		.step = 1,
+		.def = 0xC,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_EXPOSURE_METERING,
+		.name = "Exposure Metering",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0,
+		.max = 0x3,
+		.step = 1,
+		.def = 0x1,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_GAIN,
+		.name = "Gain",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_ZOOM_ABSOLUTE,
+		.min = 0x0100,
+		.max = 0x1000,
+		.step = 1,
+		.def = 0x0100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_COLORFX,
+		.min = 0,
+		.max = 15,
+		.def = 0,
+		.menu_skip_mask = BIT(15) | BIT(12) | BIT(11) | BIT(10) | BIT(9),
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_SCENE_MODE,
+		.min = 0,
+		.max = 13,
+		.def = 0,
+		.menu_skip_mask = BIT(5) | BIT(4),
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_POWER_LINE_FREQUENCY,
+		.min = 0,
+		.max = 3,
+		.def = 3,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_LINK_FREQ,
+		.min = 0,
+		.max = ARRAY_SIZE(ap1302_link_freqs) - 1,
+		.def = 0,
+		.qmenu_int = ap1302_link_freqs,
+	},
+};
+
+static int ap1302_ctrls_init(struct ap1302_device *ap1302)
+{
+	struct v4l2_fwnode_device_properties props;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&ap1302->ctrls, ARRAY_SIZE(ap1302_ctrls));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_ctrls); i++)
+		v4l2_ctrl_new_custom(&ap1302->ctrls, &ap1302_ctrls[i], NULL);
+
+	if (ap1302->ctrls.error) {
+		ret = ap1302->ctrls.error;
+		goto free_ctrls;
+	}
+
+	ret = v4l2_fwnode_device_parse(ap1302->dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(&ap1302->ctrls,
+					      &ap1302_ctrl_ops, &props);
+	if (ret)
+		goto free_ctrls;
+
+	/* Use same lock for controls as for everything else. */
+	ap1302->ctrls.lock = &ap1302->lock;
+	ap1302->sd.ctrl_handler = &ap1302->ctrls;
+
+	return 0;
+
+free_ctrls:
+	v4l2_ctrl_handler_free(&ap1302->ctrls);
+	return ret;
+}
+
+static void ap1302_ctrls_cleanup(struct ap1302_device *ap1302)
+{
+	v4l2_ctrl_handler_free(&ap1302->ctrls);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
+static int ap1302_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_sensor_info *info = ap1302->sensor_info;
+	unsigned int pad;
+
+	for (pad = 0; pad < AP1302_PAD_MAX; ++pad) {
+		struct v4l2_mbus_framefmt *format =
+			v4l2_subdev_state_get_format(state, pad);
+
+		format->width = info->resolution.width;
+		format->height = info->resolution.height;
+
+		/*
+		 * The source pad combines images side by side in multi-sensor
+		 * setup.
+		 */
+		if (pad == AP1302_PAD_SOURCE) {
+			format->width *= ap1302->width_factor;
+			format->code = supported_video_formats[0].code;
+		} else {
+			format->code = info->format;
+		}
+
+		format->field = V4L2_FIELD_NONE;
+		format->colorspace = V4L2_COLORSPACE_SRGB;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	if (code->pad != AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the format produced by the sensor is
+		 * supported.
+		 */
+		if (code->index)
+			return -EINVAL;
+
+		code->code = ap1302->sensor_info->format;
+	} else {
+		/* On the source pad, multiple formats are supported. */
+		if (code->index >= ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		code->code = supported_video_formats[code->index].code;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->pad != AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the size produced by the sensor is
+		 * supported.
+		 */
+		if (fse->code != ap1302->sensor_info->format)
+			return -EINVAL;
+
+		fse->min_width = ap1302->sensor_info->resolution.width;
+		fse->min_height = ap1302->sensor_info->resolution.height;
+		fse->max_width = ap1302->sensor_info->resolution.width;
+		fse->max_height = ap1302->sensor_info->resolution.height;
+	} else {
+		/*
+		 * On the source pad, the AP1302 can freely scale within the
+		 * scaler's limits.
+		 */
+		if (fse->index > ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		fse->min_width = AP1302_MIN_WIDTH * ap1302->width_factor;
+		fse->min_height = AP1302_MIN_HEIGHT;
+		fse->max_width = AP1302_MAX_WIDTH;
+		fse->max_height = AP1302_MAX_HEIGHT;
+	}
+
+	return 0;
+}
+
+static int ap1302_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_format_info *info = NULL;
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	/* Formats on the sink pads can't be changed. */
+	if (fmt->pad != AP1302_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, fmt);
+
+	format = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
+
+	/* Validate the media bus code, default to the first supported value. */
+	for (i = 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+		if (supported_video_formats[i].code == fmt->format.code) {
+			info = &supported_video_formats[i];
+			break;
+		}
+	}
+
+	if (!info)
+		info = &supported_video_formats[0];
+
+	/*
+	 * Clamp the size. The width must be a multiple of 4 (or 8 in the
+	 * dual-sensor case) and the height a multiple of 2.
+	 */
+	fmt->format.width = clamp(ALIGN_DOWN(fmt->format.width,
+					     4 * ap1302->width_factor),
+				  AP1302_MIN_WIDTH * ap1302->width_factor,
+				  AP1302_MAX_WIDTH);
+	fmt->format.height = clamp(ALIGN_DOWN(fmt->format.height, 2),
+				   AP1302_MIN_HEIGHT, AP1302_MAX_HEIGHT);
+
+	guard(mutex)(&ap1302->lock);
+
+	format->width = fmt->format.width;
+	format->height = fmt->format.height;
+	format->code = info->code;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+static int ap1302_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_size *resolution = &ap1302->sensor_info->resolution;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = resolution->width * ap1302->width_factor;
+		sel->r.height = resolution->height;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ap1302_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct ap1302_format_info *info;
+	struct v4l2_subdev_state *state;
+
+	if (pad != AP1302_PAD_SOURCE || !fd)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = v4l2_subdev_state_get_format(state, AP1302_PAD_SOURCE);
+
+	info = find_info_by_code(format->code);
+
+	memset(fd, 0x0, sizeof(*fd));
+
+	scoped_guard(mutex, &ap1302->lock) {
+		fd->entry[0].flags = 0;
+		fd->entry[0].pixelcode = info->code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = info->data_type;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	v4l2_subdev_unlock_state(state);
+	return 0;
+}
+
+static int ap1302_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	int ret;
+
+	guard(mutex)(&ap1302->lock);
+
+	ret = ap1302_configure(ap1302, state);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_stall(ap1302, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ap1302_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	guard(mutex)(&ap1302->lock);
+
+	return ap1302_stall(ap1302, true);
+}
+
+
+static const char * const ap1302_warnings[] = {
+	"HINF_BANDWIDTH",
+	"FLICKER_DETECTION",
+	"FACED_NE",
+	"SMILED_NE",
+	"HINF_OVERRUN",
+	NULL,
+	"FRAME_TOO_SMALL",
+	"MISSING_PHASES",
+	"SPOOF_UNDERRUN",
+	"JPEG_NOLAST",
+	"NO_IN_FREQ_SPEC",
+	"SINF0",
+	"SINF1",
+	"CAPTURE0",
+	"CAPTURE1",
+	"ISR_UNHANDLED",
+	"INTERLEAVE_SPOOF",
+	"INTERLEAVE_BUF",
+	"COORD_OUT_OF_RANGE",
+	"ICP_CLOCKING",
+	"SENSOR_CLOCKING",
+	"SENSOR_NO_IHDR",
+	"DIVIDE_BY_ZERO",
+	"INT0_UNDERRUN",
+	"INT1_UNDERRUN",
+	"SCRATCHPAD_TOO_BIG",
+	"OTP_RECORD_READ",
+	"NO_LSC_IN_OTP",
+	"GPIO_INT_LOST",
+	"NO_PDAF_DATA",
+	"FAR_PDAF_ACCESS_SKIP",
+	"PDAF_ERROR",
+	"ATM_TVI_BOUNDS",
+	"SIPM_0_RTY",
+	"SIPM_1_TRY",
+	"SIPM_0_NO_ACK",
+	"SIPM_1_NO_ACK",
+	"SMILE_DIS",
+	"DVS_DIS",
+	"TEST_DIS",
+	"SENSOR_LV2LV",
+	"SENSOR_FV2FV",
+	"FRAME_LOST",
+};
+
+static const char * const ap1302_lane_states[] = {
+	"stop_s",
+	"hs_req_s",
+	"lp_req_s",
+	"hs_s",
+	"lp_s",
+	"esc_req_s",
+	"turn_req_s",
+	"esc_s",
+	"esc_0",
+	"esc_1",
+	"turn_s",
+	"turn_mark",
+	"error_s",
+};
+
+#define NUM_LANES 4
+static void ap1302_log_lane_state(struct ap1302_sensor *sensor,
+				  unsigned int index)
+{
+	static const char * const lp_states[] = {
+		"00", "10", "01", "11",
+	};
+	unsigned int counts[NUM_LANES][ARRAY_SIZE(ap1302_lane_states)];
+	unsigned int samples = 0;
+	unsigned int lane;
+	unsigned int i;
+	u32 first[NUM_LANES] = { 0, };
+	u32 last[NUM_LANES] = { 0, };
+	int ret;
+
+	memset(counts, 0, sizeof(counts));
+
+	for (i = 0; i < 1000; ++i) {
+		u32 values[NUM_LANES];
+
+		/*
+		 * Read the state of all lanes and skip read errors and invalid
+		 * values.
+		 */
+		for (lane = 0; lane < NUM_LANES; ++lane) {
+			ret = ap1302_read(sensor->ap1302,
+					  AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+					  &values[lane]);
+			if (ret < 0)
+				break;
+
+			if (AP1302_LANE_STATE(values[lane]) >=
+			    ARRAY_SIZE(ap1302_lane_states)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+
+		if (ret < 0)
+			continue;
+
+		/* Accumulate the samples and save the first and last states. */
+		for (lane = 0; lane < NUM_LANES; ++lane)
+			counts[lane][AP1302_LANE_STATE(values[lane])]++;
+
+		if (!samples)
+			memcpy(first, values, sizeof(first));
+		memcpy(last, values, sizeof(last));
+
+		samples++;
+	}
+
+	if (!samples)
+		return;
+
+	/*
+	 * Print the LP state from the first sample, the error state from the
+	 * last sample, and the states accumulators for each lane.
+	 */
+	for (lane = 0; lane < NUM_LANES; ++lane) {
+		u32 state = last[lane];
+		char error_msg[25] = "";
+
+		if (state & (AP1302_LANE_ERR | AP1302_LANE_ABORT)) {
+			unsigned int err = AP1302_LANE_ERR_STATE(state);
+			const char *err_state = NULL;
+
+			err_state = err < ARRAY_SIZE(ap1302_lane_states)
+				  ? ap1302_lane_states[err] : "INVALID";
+
+			snprintf(error_msg, sizeof(error_msg), "ERR (%s%s) %s LP%s",
+				 state & AP1302_LANE_ERR ? "E" : "",
+				 state & AP1302_LANE_ABORT ? "A" : "",
+				 err_state,
+				 lp_states[AP1302_LANE_ERR_LP_VAL(state)]);
+		}
+
+		dev_info(sensor->ap1302->dev, "SINF%u L%u state: LP%s %s",
+			 index, lane, lp_states[AP1302_LANE_LP_VAL(first[lane])],
+			 error_msg);
+	}
+
+	/* Reset the error flags. */
+	for (lane = 0; lane < NUM_LANES; ++lane)
+		ap1302_write(sensor->ap1302,
+			     AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+			     AP1302_LANE_ERR | AP1302_LANE_ABORT, NULL);
+}
+
+static int ap1302_log_status(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	u16 frame_count_brac;
+	u16 frame_count_hinf;
+	u16 frame_count_icp;
+	u32 warning[4];
+	u32 error[3];
+	unsigned int i;
+	u32 value;
+	int ret;
+
+	/* Dump the console buffer. */
+	ret = ap1302_dump_console(ap1302);
+	if (ret < 0)
+		return ret;
+
+	/* Print errors. */
+	ret = ap1302_read(ap1302, AP1302_ERROR, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_ERR_FILE, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_ERR_LINE, &error[2]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "ERROR: 0x%04x (file 0x%08x:%u)\n",
+		 error[0], error[1], error[2]);
+
+	ret = ap1302_read(ap1302, AP1302_SIPM_ERR_0, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_SIPM_ERR_1, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "SIPM_ERR [0] 0x%04x [1] 0x%04x\n",
+		 error[0], error[1]);
+
+	/* Print warnings. */
+	for (i = 0; i < ARRAY_SIZE(warning); ++i) {
+		ret = ap1302_read(ap1302, AP1302_WARNING(i), &warning[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_info(ap1302->dev,
+		 "WARNING [0] 0x%04x [1] 0x%04x [2] 0x%04x [3] 0x%04x\n",
+		 warning[0], warning[1], warning[2], warning[3]);
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_warnings); ++i) {
+		if ((warning[i / 16] & BIT(i % 16)) &&
+		    ap1302_warnings[i])
+			dev_info(ap1302->dev, "- WARN_%s\n",
+				 ap1302_warnings[i]);
+	}
+
+	/* Print the frame counter. */
+	ret = ap1302_read(ap1302, AP1302_FRAME_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_hinf = value >> 8;
+	frame_count_brac = value & 0xff;
+
+	ret = ap1302_read(ap1302, AP1302_ADV_CAPTURE_A_FV_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_icp = value & 0xffff;
+
+	dev_info(ap1302->dev, "Frame counters: ICP %u, HINF %u, BRAC %u\n",
+		 frame_count_icp, frame_count_hinf, frame_count_brac);
+
+	/* Sample the lane state. */
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_log_lane_state(sensor, i);
+	}
+
+	return 0;
+}
+
+static int ap1302_subdev_registered(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->dev)
+			continue;
+
+		ret = v4l2_device_register_subdev(sd->v4l2_dev, &sensor->sd);
+		if (ret)
+			return ret;
+
+		ret = media_create_pad_link(&sensor->sd.entity, 0,
+					    &sd->entity, i,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations ap1302_media_ops = {
+	.link_validate = v4l2_subdev_link_validate
+};
+
+static const struct v4l2_subdev_pad_ops ap1302_pad_ops = {
+	.enum_mbus_code = ap1302_enum_mbus_code,
+	.enum_frame_size = ap1302_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ap1302_set_fmt,
+	.get_selection = ap1302_get_selection,
+	.set_selection = ap1302_get_selection,
+	.get_frame_desc = ap1302_get_frame_desc,
+	.enable_streams = ap1302_enable_streams,
+	.disable_streams = ap1302_disable_streams,
+};
+
+static const struct v4l2_subdev_core_ops ap1302_core_ops = {
+	.log_status = ap1302_log_status,
+};
+
+static const struct v4l2_subdev_ops ap1302_subdev_ops = {
+	.core = &ap1302_core_ops,
+	.pad = &ap1302_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ap1302_subdev_internal_ops = {
+	.registered = ap1302_subdev_registered,
+	.init_state = ap1302_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Sensor
+ */
+
+static int ap1302_sensor_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	if (code->index)
+		return -EINVAL;
+
+	code->code = info->format;
+
+	return 0;
+}
+
+static int ap1302_sensor_enum_frame_size(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != info->format)
+		return -EINVAL;
+
+	fse->min_width = info->resolution.width;
+	fse->min_height = info->resolution.height;
+	fse->max_width = info->resolution.width;
+	fse->max_height = info->resolution.height;
+
+	return 0;
+}
+
+static int ap1302_sensor_get_fmt(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	memset(&fmt->format, 0, sizeof(fmt->format));
+
+	fmt->format.width = info->resolution.width;
+	fmt->format.height = info->resolution.height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.code = info->format;
+	fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ap1302_sensor_pad_ops = {
+	.enum_mbus_code = ap1302_sensor_enum_mbus_code,
+	.enum_frame_size = ap1302_sensor_enum_frame_size,
+	.get_fmt = ap1302_sensor_get_fmt,
+	.set_fmt = ap1302_sensor_get_fmt,
+};
+
+static const struct v4l2_subdev_ops ap1302_sensor_subdev_ops = {
+	.pad = &ap1302_sensor_pad_ops,
+};
+
+static void ap1302_sensor_dev_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(dev);
+}
+
+static int ap1302_sensor_init(struct ap1302_sensor *sensor, unsigned int index)
+{
+	struct ap1302_device *ap1302 = sensor->ap1302;
+	struct v4l2_subdev *sd = &sensor->sd;
+	unsigned int i;
+	int ret;
+
+	sensor->index = index;
+
+	/*
+	 * Register a device for the sensor, to support usage of the regulator
+	 * API.
+	 */
+	sensor->dev = kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
+	if (!sensor->dev)
+		return -ENOMEM;
+
+	sensor->dev->parent = ap1302->dev;
+	sensor->dev->of_node = of_node_get(sensor->of_node);
+	sensor->dev->release = &ap1302_sensor_dev_release;
+	dev_set_name(sensor->dev, "%s-%s.%u", dev_name(ap1302->dev),
+		     ap1302->sensor_info->name, index);
+
+	ret = device_register(sensor->dev);
+	if (ret < 0)
+		return dev_err_probe(ap1302->dev, ret,
+				     "Failed to register device for sensor %u\n",
+				     index);
+
+	/* Retrieve the power supplies for the sensor, if any. */
+	if (ap1302->sensor_info->supplies) {
+		const struct ap1302_sensor_supply *supplies =
+			ap1302->sensor_info->supplies;
+		unsigned int num_supplies;
+
+		for (num_supplies = 0; supplies[num_supplies].name;)
+			++num_supplies;
+
+		sensor->supplies = devm_kcalloc(ap1302->dev, num_supplies,
+						sizeof(*sensor->supplies),
+						GFP_KERNEL);
+		if (!sensor->supplies)
+			return -ENOMEM;
+
+		for (i = 0; i < num_supplies; ++i)
+			sensor->supplies[i].supply = supplies[i].name;
+
+		ret = regulator_bulk_get(sensor->dev, num_supplies,
+					 sensor->supplies);
+		if (ret < 0)
+			return dev_err_probe(ap1302->dev, ret,
+					     "Failed to get supplies for sensor %u\n",
+					     index);
+
+		sensor->num_supplies = i;
+	}
+
+	sd->dev = sensor->dev;
+	v4l2_subdev_init(sd, &ap1302_sensor_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s %u",
+		 ap1302->sensor_info->name, index);
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
+	if (ret < 0)
+		return dev_err_probe(ap1302->dev, ret,
+				     "failed to initialize media entity for sensor %u: %d\n",
+				     index, ret);
+
+	return 0;
+}
+
+static void ap1302_sensor_cleanup(struct ap1302_sensor *sensor)
+{
+	media_entity_cleanup(&sensor->sd.entity);
+
+	if (sensor->num_supplies)
+		regulator_bulk_free(sensor->num_supplies, sensor->supplies);
+
+	if (sensor->dev) {
+		if (device_is_registered(sensor->dev))
+			device_unregister(sensor->dev);
+		else
+			put_device(sensor->dev);
+	}
+
+	of_node_put(sensor->of_node);
+}
+
+/* -----------------------------------------------------------------------------
+ * Boot & Firmware Handling
+ */
+
+static int ap1302_request_firmware(struct ap1302_device *ap1302)
+{
+	static const char * const suffixes[] = {
+		"",
+		"_single",
+		"_dual",
+	};
+
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int num_sensors;
+	unsigned int fw_size;
+	unsigned int i;
+	char name[64];
+	int ret;
+
+	for (i = 0, num_sensors = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		if (ap1302->sensors[i].dev)
+			num_sensors++;
+	}
+
+	ret = snprintf(name, sizeof(name), "ap1302_%s%s_fw.bin",
+		       ap1302->sensor_info->name, suffixes[num_sensors]);
+	if (ret >= sizeof(name)) {
+		dev_err(ap1302->dev, "Firmware name too long\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(ap1302->dev, "Requesting firmware %s\n", name);
+
+	ret = request_firmware(&ap1302->fw, name, ap1302->dev);
+	if (ret) {
+		dev_err(ap1302->dev, "Failed to request firmware: %d\n", ret);
+		return ret;
+	}
+
+	if (ap1302->fw->size < sizeof(*fw_hdr)) {
+		dev_err(ap1302->dev, "Invalid firmware: too small\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * The firmware binary contains a header defined by the
+	 * ap1302_firmware_header structure. The firmware itself (also referred
+	 * to as bootdata) follows the header. Perform sanity checks to ensure
+	 * the firmware is valid.
+	 */
+	fw_hdr = (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_size = ap1302->fw->size - sizeof(*fw_hdr);
+
+	if (fw_hdr->pll_init_size > fw_size) {
+		dev_err(ap1302->dev,
+			"Invalid firmware: PLL init size too large\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * ap1302_write_fw_window() - Write a piece of firmware to the AP1302
+ * @win_pos: Firmware load window current position
+ * @buf: Firmware data buffer
+ * @len: Firmware data length
+ *
+ * The firmware is loaded through a window in the registers space. Writes are
+ * sequential starting at address 0x8000, and must wrap around when reaching
+ * 0x9fff. This function write the firmware data stored in @buf to the AP1302,
+ * keeping track of the window position in the @win_pos argument.
+ */
+static int ap1302_write_fw_window(struct ap1302_device *ap1302, const u8 *buf,
+				  u32 len, unsigned int *win_pos)
+{
+	while (len > 0) {
+		unsigned int write_addr;
+		unsigned int write_size;
+		int ret;
+
+		/*
+		 * Write at most len bytes, from the current position to the
+		 * end of the window.
+		 */
+		write_addr = *win_pos + AP1302_FW_WINDOW_OFFSET;
+		write_size = min(len, AP1302_FW_WINDOW_SIZE - *win_pos);
+
+		ret = regmap_raw_write(ap1302->regmap16, write_addr, buf,
+				       write_size);
+		if (ret)
+			return ret;
+
+		buf += write_size;
+		len -= write_size;
+
+		*win_pos += write_size;
+		if (*win_pos >= AP1302_FW_WINDOW_SIZE)
+			*win_pos = 0;
+	}
+
+	return 0;
+}
+
+static int ap1302_load_firmware(struct ap1302_device *ap1302)
+{
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int win_pos = 0;
+	unsigned int fw_size;
+	const u8 *fw_data;
+	int crc;
+	int ret;
+
+	fw_hdr = (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_data = (u8 *)&fw_hdr[1];
+	fw_size = ap1302->fw->size - sizeof(*fw_hdr);
+
+	/* Clear the CRC register. */
+	ret = ap1302_write(ap1302, AP1302_SIP_CRC, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Load the PLL initialization settings, set the bootdata stage to 2 to
+	 * apply the basic_init_hp settings, and wait 1ms for the PLL to lock.
+	 */
+	ret = ap1302_write_fw_window(ap1302, fw_data, fw_hdr->pll_init_size,
+				     &win_pos);
+	if (ret)
+		return ret;
+
+	ret = ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0x0002, NULL);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	/* Load the rest of the bootdata content and verify the CRC. */
+	ret = ap1302_write_fw_window(ap1302, fw_data + fw_hdr->pll_init_size,
+				     fw_size - fw_hdr->pll_init_size, &win_pos);
+	if (ret)
+		return ret;
+
+	msleep(40);
+
+	ret = ap1302_read(ap1302, AP1302_SIP_CRC, &crc);
+	if (ret)
+		return ret;
+
+	if (crc != fw_hdr->crc) {
+		dev_warn(ap1302->dev,
+			 "CRC mismatch: expected 0x%04x, got 0x%04x\n",
+			 fw_hdr->crc, crc);
+		return -EAGAIN;
+	}
+
+	/*
+	 * Write 0xffff to the bootdata_stage register to indicate to the
+	 * AP1302 that the whole bootdata content has been loaded.
+	 */
+	ret = ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/* The AP1302 starts outputting frames right after boot, stop it. */
+	return ap1302_stall(ap1302, true);
+}
+
+static int ap1302_detect_chip(struct ap1302_device *ap1302)
+{
+	unsigned int version;
+	unsigned int revision;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_CHIP_VERSION, &version);
+	if (ret)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_CHIP_REV, &revision);
+	if (ret)
+		return ret;
+
+	if (version != AP1302_CHIP_ID) {
+		dev_err(ap1302->dev,
+			"Invalid chip version, expected 0x%04x, got 0x%04x\n",
+			AP1302_CHIP_ID, version);
+		return -EINVAL;
+	}
+
+	dev_info(ap1302->dev, "AP1302 revision %u.%u.%u detected\n",
+		 (revision & 0xf000) >> 12, (revision & 0x0f00) >> 8,
+		 revision & 0x00ff);
+
+	return 0;
+}
+
+static int ap1302_hw_init(struct ap1302_device *ap1302)
+{
+	unsigned int retries;
+	int ret;
+
+	/* Request and validate the firmware. */
+	ret = ap1302_request_firmware(ap1302);
+	if (ret)
+		return ret;
+
+	/*
+	 * Power the sensors first, as the firmware will access them once it
+	 * gets loaded.
+	 */
+	ret = ap1302_power_on_sensors(ap1302);
+	if (ret < 0)
+		goto error_firmware;
+
+#define MAX_FW_LOAD_RETRIES 3
+	/*
+	 * Load the firmware, retrying in case of CRC errors. The AP1302 is
+	 * reset with a full power cycle between each attempt.
+	 */
+	for (retries = 0; retries < MAX_FW_LOAD_RETRIES; ++retries) {
+		ret = ap1302_power_on(ap1302);
+		if (ret < 0)
+			goto error_power_sensors;
+
+		ret = ap1302_detect_chip(ap1302);
+		if (ret)
+			goto error_power;
+
+		ret = ap1302_load_firmware(ap1302);
+		if (!ret)
+			break;
+
+		if (ret != -EAGAIN)
+			goto error_power;
+
+		ap1302_power_off(ap1302);
+	}
+
+	if (retries == MAX_FW_LOAD_RETRIES) {
+		dev_err(ap1302->dev,
+			"Firmware load retries exceeded, aborting\n");
+		ret = -ETIMEDOUT;
+		goto error_power_sensors;
+	}
+
+	return 0;
+
+error_power:
+	ap1302_power_off(ap1302);
+error_power_sensors:
+	ap1302_power_off_sensors(ap1302);
+error_firmware:
+	release_firmware(ap1302->fw);
+
+	return ret;
+}
+
+static void ap1302_hw_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+
+	ap1302_power_off(ap1302);
+	ap1302_power_off_sensors(ap1302);
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int ap1302_config_v4l2(struct ap1302_device *ap1302)
+{
+	struct v4l2_subdev *sd;
+	unsigned int i;
+	int ret;
+
+	sd = &ap1302->sd;
+	sd->dev = ap1302->dev;
+	v4l2_i2c_subdev_init(sd, ap1302->client, &ap1302_subdev_ops);
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->internal_ops = &ap1302_subdev_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->entity.ops = &ap1302_media_ops;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->pads); ++i)
+		ap1302->pads[i].flags = (i == AP1302_PAD_SOURCE) ?
+					MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(ap1302->pads),
+				     ap1302->pads);
+	if (ret < 0)
+		return dev_err_probe(ap1302->dev, ret,
+				     "media_entity_init failed %d\n", ret);
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		dev_err(ap1302->dev, "subdev finalize init failure\n");
+		goto error_media;
+	}
+
+	ret = ap1302_ctrls_init(ap1302);
+	if (ret < 0)
+		goto error_media;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "v4l2_async_register_subdev failed %d\n", ret);
+		goto error_ctrls;
+	}
+
+	return 0;
+
+error_ctrls:
+	ap1302_ctrls_cleanup(ap1302);
+error_media:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static int ap1302_sensor_parse_of(struct ap1302_device *ap1302,
+				  struct device_node *node)
+{
+	struct ap1302_sensor *sensor;
+	u32 reg;
+	int ret;
+
+	/* Retrieve the sensor index from the reg property. */
+	ret = of_property_read_u32(node, "reg", &reg);
+	if (ret < 0)
+		return dev_err_probe(ap1302->dev, -EINVAL,
+				     "'reg' property missing in sensor node\n");
+
+	if (reg >= ARRAY_SIZE(ap1302->sensors))
+		return dev_err_probe(ap1302->dev, -EINVAL,
+				     "Out-of-bounds 'reg' value %u\n", reg);
+
+	sensor = &ap1302->sensors[reg];
+	if (sensor->ap1302)
+		return dev_err_probe(ap1302->dev, -EINVAL,
+				     "Duplicate entry for sensor %u\n", reg);
+
+	sensor->ap1302 = ap1302;
+	sensor->of_node = of_node_get(node);
+	return 0;
+}
+
+static int ap1302_parse_of(struct ap1302_device *ap1302)
+{
+	struct device_node *sensors __free(device_node) = NULL;
+	struct fwnode_handle *ep  __free(fwnode_handle) = NULL;
+	struct device *dev = ap1302->dev;
+	int num_sensors = 0;
+	const char *model;
+	unsigned int i;
+	int ret;
+
+	ap1302->clock = devm_clk_get(dev, NULL);
+	if (IS_ERR(ap1302->clock))
+		return dev_err_probe(dev, PTR_ERR(ap1302->clock),
+				      "Failed to get clock\n");
+
+	ap1302->reset_gpio = devm_gpiod_get(dev, "reset",
+					    GPIOD_OUT_HIGH);
+	if (IS_ERR(ap1302->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ap1302->reset_gpio),
+				     "Can't get reset GPIO\n");
+
+	ap1302->standby_gpio = devm_gpiod_get_optional(dev, "standby",
+						       GPIOD_OUT_LOW);
+	if (IS_ERR(ap1302->standby_gpio))
+		return dev_err_probe(dev, PTR_ERR(ap1302->standby_gpio),
+				     "Can't get standby GPIO\n");
+
+	ap1302->isp_en_gpio = devm_gpiod_get_optional(dev, "enable",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(ap1302->isp_en_gpio))
+		return dev_err_probe(dev, PTR_ERR(ap1302->isp_en_gpio),
+				     "Can't get enable GPIO\n");
+
+	gpiod_set_value_cansleep(ap1302->isp_en_gpio, 1);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+					     0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return dev_err_probe(dev, -EINVAL, "no sink port found\n");
+
+	ap1302->bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &ap1302->bus_cfg);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to parse bus configuration\n");
+
+	/* Sensors */
+	sensors = of_get_child_by_name(dev_of_node(ap1302->dev), "sensors");
+	if (!sensors)
+		return dev_err_probe(ap1302->dev, -EINVAL,
+				     "'sensors' child node not found\n");
+
+	ret = of_property_read_string(sensors, "onnn,model", &model);
+	if (ret < 0) {
+		/*
+		 * If no sensor is connected, we can still support operation
+		 * with the test pattern generator.
+		 */
+		ap1302->sensor_info = &ap1302_sensor_info_tpg;
+		ap1302->width_factor = 1;
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_sensor_info); ++i) {
+		const struct ap1302_sensor_info *info = &ap1302_sensor_info[i];
+
+		if (!strcmp(info->model, model)) {
+			ap1302->sensor_info = info;
+			break;
+		}
+	}
+
+	if (!ap1302->sensor_info)
+		return dev_err_probe(ap1302->dev, -EINVAL,
+				     "Unsupported sensor model %s\n", model);
+
+	 for_each_child_of_node_scoped(sensors, node) {
+		if (of_node_name_eq(node, "sensor")) {
+			if (!ap1302_sensor_parse_of(ap1302, node))
+				num_sensors++;
+		}
+	}
+
+	if (!num_sensors)
+		return dev_err_probe(ap1302->dev, -EINVAL, "No sensor found\n");
+
+	ap1302->width_factor = num_sensors;
+
+	return 0;
+}
+
+static void ap1302_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_sensor_cleanup(sensor);
+	}
+
+	v4l2_fwnode_endpoint_free(&ap1302->bus_cfg);
+}
+
+static int ap1302_probe(struct i2c_client *client)
+{
+	struct ap1302_device *ap1302;
+	unsigned int i;
+	int ret;
+
+	ap1302 = devm_kzalloc(&client->dev, sizeof(*ap1302), GFP_KERNEL);
+	if (!ap1302)
+		return -ENOMEM;
+
+	ap1302->dev = &client->dev;
+	ap1302->client = client;
+
+	ret = devm_mutex_init(ap1302->dev, &ap1302->lock);
+	if (ret)
+		return ret;
+
+	ap1302->regmap16 = devm_regmap_init_i2c(client, &ap1302_reg16_config);
+	if (IS_ERR(ap1302->regmap16))
+		return dev_err_probe(ap1302->dev, -ENODEV,
+				     "regmap16 init failed: %ld\n",
+				     PTR_ERR(ap1302->regmap16));
+
+	ap1302->regmap32 = devm_regmap_init_i2c(client, &ap1302_reg32_config);
+	if (IS_ERR(ap1302->regmap32))
+		return dev_err_probe(ap1302->dev, -ENODEV,
+				     "regmap32 init failed: %ld\n",
+				     PTR_ERR(ap1302->regmap32));
+
+	ret = ap1302_parse_of(ap1302);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ret = ap1302_sensor_init(sensor, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_supplies); ++i)
+		ap1302->supplies[i].supply = ap1302_supplies[i].name;
+
+	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(ap1302_supplies),
+				      ap1302->supplies);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_hw_init(ap1302);
+	if (ret)
+		return ret;
+
+	ap1302_debugfs_init(ap1302);
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_debugfs_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_hw_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	ret = ap1302_config_v4l2(ap1302);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void ap1302_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	release_firmware(ap1302->fw);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+
+	ap1302_ctrls_cleanup(ap1302);
+}
+
+static const struct of_device_id ap1302_of_id_table[] = {
+	{ .compatible = "onnn,ap1302" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ap1302_of_id_table);
+
+static struct i2c_driver ap1302_i2c_driver = {
+	.driver = {
+		.name	= "ap1302",
+		.of_match_table	= ap1302_of_id_table,
+	},
+	.probe		= ap1302_probe,
+	.remove		= ap1302_remove,
+};
+
+module_i2c_driver(ap1302_i2c_driver);
+
+MODULE_AUTHOR("Florian Rebaudo <frebaudo@witekio.com>");
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_AUTHOR("Anil Kumar M <anil.mamidala@xilinx.com>");
+
+MODULE_DESCRIPTION("ON Semiconductor AP1302 ISP driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


