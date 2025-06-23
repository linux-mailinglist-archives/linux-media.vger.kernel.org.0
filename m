Return-Path: <linux-media+bounces-35701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A3AE4D79
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F31DE7A2294
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 19:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74102D5409;
	Mon, 23 Jun 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lM9EHluM"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301941F3FEC;
	Mon, 23 Jun 2025 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706297; cv=fail; b=MXUj4PIQVnUCjm58CMv55q5YY8XLogancdXs46snXWXdR10CqdQipWyB4wdiYsTY7pgsMe8LlvG6W81qHjlAXJnSpK2ROqTsHclwg18Wcrot26CiVPW1ZBQdoMI1Ke1UyG3J8niOtMVLJ1uFOH7wT2sFvP3EttIZEhEmWj2I3pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706297; c=relaxed/simple;
	bh=VXlJlznvd8sUemk2wIOBUEwWnjTwVf5QdzOAIyjvocE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZQu+4LYo2+Y9lhZ04kIZdNr0UJeMyKlhkR5U+DEvoP1JJWEEu701jHJshy0SRtTFM4kUL40pNQDUyLMHhYKRJh+GVxTLEU3Uwc6LHflBifsDhhpLVvayQGoxUKZKTX4eU5DiJw6eGdL5QUPxQo3T/D2C8dXuvQW7OdKrmRaa92E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lM9EHluM; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFct/8TnjqJv6BcTnjeYcxN/JBj7nezToYE6T87ja8F+mF89dX7PImqMkPJKoVWLg0VIbjU5PDISNehCaXb2VI3P7qdmWD8+mHVQS7ALuJ2niyX52NQhFH2YBj2FrHkbVyT/9uCVxDUWoTleTo0GxNV6LiYzr3AE5b6++uMsmMYdLwQeKFxvGmkiREBi9duw5r00Y5A/k+ISQx1hIHGfx3zpn1h1Ih7mIjJ4MPaEC4Q8jkrXO4KFktM77cGst/9lZUg2RtenvRvs00H/rOfsN9SAODLxKg6GIIc6+Y+hewSxRgXxphM5djhsZ8dixPGAFtKeSmi5CcFPk8dqp/AZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lghO4k5mQf8qCeVn0lVLRRZneIdyIb+ewO8cMeckKc=;
 b=YSoZdmCZDoMqTebOC4CinYtFI1kWo4GtoddUkZiC02IcJcL0ADXBuPPf2pCZoO8Mf0u1S3F1l6jaAGADpZEkoW7rpm3o0iW/QvDqhmOEqJkjeFRSKJXFOzwpgrclckHkpYComrTe1RAIhvDgc4X/6+yA/Z4lY7USbQllfPM6vIdD0FHw+ofOD1RM0DqJEYSyNPiEuf3KfR5axi7XuLu8Oxf46Bcg4gx8Rm2lPp4MCl+PuiaTHu+ywhXtwcMB0JXmS/dCeNMhakkpkWcgHN7ZjDm6km5gOEGs2ttUJA78A1/0BH6zanB6PoVTgHVLOQM/TcQCP1nkIXImTlp9S6mQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lghO4k5mQf8qCeVn0lVLRRZneIdyIb+ewO8cMeckKc=;
 b=lM9EHluM8rPjLV4pBWkWcnxEOgfFouHW9p9qB9NYl/QV+ABvDy8v/scVc7JTlTo87NwziOxInzeVXOn+A5whfwqQR/eztW4X0SGZjS5Dak78yGxaB/wKqNl2RqBVUsdhz2r1Y4F6K2hSukqd91X2uuX8H8ohBrzOpho2WoYddom0uM1yy7U8E+rtnbJmlYn8hKY701LcannVPSKyJw2uNQ5Fhh3dY5QvKA4P9pSMDJRZQynwcKDg8Zj70BB2UPEtSp9Atdbbb6+50yq4/OOnLJS6CdBVfz4eNd4Hbh2goyrkOPTnaY/660NppEswyu7DhXM/XBoFC1UJvDhy1wBnQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 19:18:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 19:18:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 23 Jun 2025 15:17:37 -0400
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
In-Reply-To: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750706282; l=7820;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DQtcvSquUeLrwAVAURJJ+xoQ8hPNLNtZXKZ+/bQ1M7M=;
 b=4ivQx359fP4ZyNcdYhJqkj3uNAp9uJmZdLyny2YJ8Z3Bi/2jyuDz+yOUh/zC8bzv8gG/b07WM
 PsYZbkVASQ4C8mZlv3WK7fTdoQD1sGvf//GkaLFlZS07dOqlVg9Hl8Q
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
X-MS-Office365-Filtering-Correlation-Id: 8334b9cb-7fe4-4bae-956d-08ddb28ab0e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SURsQmlHaUhuaUpYTG5zWGMwaDRUdnJCOVd2dWI5dG0vMjJZTHQyZFI4a0R3?=
 =?utf-8?B?TUduODM3Q21MSGs1TU5sb0RNR3MzTDM3ZDNPQWNHbXFsRXNBbStUcStMd2J5?=
 =?utf-8?B?V0dUNVY0K3dSaXlaam4zOUpQN0kvRzdoSWt0MDFIMC9SakVmcDZ1b1ZCMlI4?=
 =?utf-8?B?V1ZMaEN0S0dORS9iNy9sQmhFVy9mK0p0TXZNSDlZMFdMbWQ5YlBLTXFUbml5?=
 =?utf-8?B?OG9JaGpBeFdLTlN6anBUcHRhY3c2MFRydzFUdHIxUWJzektVbnNYSHdlT0ll?=
 =?utf-8?B?dGo1Q0g2aVpINzdhcDlMSXljVG9rb016YU83eE8vcEdidWQ0anYyVFBDZUJD?=
 =?utf-8?B?R3RrOFNmaWxyc2FXU0t1V2gwZFBXYkxkcW5ZWGZla1lhdExOVTlrT3ZjdGxo?=
 =?utf-8?B?VHVqbldCWnNRczYzVXhGQU91RzJoZGZ4RFhUejlqTk9ydG0wRWx3TVRjbndQ?=
 =?utf-8?B?WEo1T3FSekpiQ2oxN2EyaHFvYXBUeU5KVjN5OXFBY0dFYWxxTE9QTzljMFJJ?=
 =?utf-8?B?Ulh4bkFidEY5RDN6NTI5bzFpOFVtVERRUE1KR3luK214R3VjY2JhdmFmV2hX?=
 =?utf-8?B?VllzQnlXRmFYcGlCaEpuaXVMVll2R2RNMmVBb0oyVTM4ZUFlV1ZWMk1mQ2dL?=
 =?utf-8?B?MUxlVDFqeDA4VGd2NTVBci8yc3JwSzY2cGNCRkNkZXM2MnBEVlY1RUpubDVW?=
 =?utf-8?B?ZG1ubm9wa2RnQnpEMmJmWVZVaEtWSGI1UG9SZzR6TW1pVzN1akJOMW5qeGhq?=
 =?utf-8?B?WklmSzRpWG9PYXVEOFRCZW15V0pXbitJRUJ0WVI2RFBqMktmNjZyRUNPZG43?=
 =?utf-8?B?d1NFOHA3QXNMS3RYbGNNUC82NmpGc1dDcEZHanp2U1NOd3Nic1BjaldCQWgy?=
 =?utf-8?B?eTQ2TlNCdFlPNWtjK2duQnZQYTgwbmtHVTc4VWgzcGdLSVp5eEpndEx3dm54?=
 =?utf-8?B?ZU0xalJsOTlaZU5KS0xIMXlZREh5dEVGeEptdUF0OVpJK1dycWt6UUx1N0Fx?=
 =?utf-8?B?M0xNeWd1cHJQejNzUytIUzBHaEk4WkI0dVp0UTJHa1kvcngrVFBhS1ZUaHNk?=
 =?utf-8?B?Rmk0Y3pNRnlDaHZoL2hLVzFNS093TU43bGZlcTNQQitNbGk3elFkUzZhUWxm?=
 =?utf-8?B?L1piZDM1aG9EODVScGhNclVXMysrVmttSURMZVBIWXNZQWhLdWk2bUYzOEF1?=
 =?utf-8?B?RjkrRklraUJvRERjTXZHck4rd0puS1NxUUMwWHJOK1JZTDNaWFBUTEZNRDZo?=
 =?utf-8?B?VUw3UU5ETTQ2c1BlRDg0RnJYNEJtc3FCd1RoTzRTSTFaUDJVQ0l1cVYwN211?=
 =?utf-8?B?dlNaemV4SGN0RjlrRXdsTnNxUmk2Qi9HSEhnei9IRFJ0V2pIK21yZTZrVngv?=
 =?utf-8?B?UVRqRVdQc1h6NFZzYUlwQlQyN0xuSEgvR0JtM240MStaQzIzZzBFRmV3dUNy?=
 =?utf-8?B?NFdiTDJnTUhNUjlZK25zWEVzclFOL01Rdys3eUJjblpwSE9ZV0VRQmY1Qnk2?=
 =?utf-8?B?aUtSbjh2cjhEWElLWXJFK2pZOXFMSFFwOUpjOXlkblJBNFZWUzFteGIrU0sz?=
 =?utf-8?B?YXY0c3lJKzF2YXNzYkI0UDhIcWNMRzg0S2FZcWV1VE9xUXZ4bU9GMjVmZ1J5?=
 =?utf-8?B?QnpyQk5FL2dBUE5QQmVEV2lQeStLdGovT0VoTEd5bEN5anR0MWRqc1dVb1Fz?=
 =?utf-8?B?UHJJWXBVTkVwSVljUStLSjFyaE9iNkVUL2tSQTB6MXB0OU5NU0s3clNyTDlQ?=
 =?utf-8?B?ZWtPb1NoTWdjOWVBS1dDVE9sQXFZTHVKcSthYk1RdlNka012WEhac1dkYVB4?=
 =?utf-8?B?UXFNdkVTa0lFLzNJVHpJTHFud1JiUDdibW5oOWZJSm95K01JbkU5eHJkdEtQ?=
 =?utf-8?B?TFRwRWErK21nM082WkdoVTVWUTBVVVBoajVCNE5za3M5N2d6RCtzTmVIaURl?=
 =?utf-8?Q?WZl5iSy6Joo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M0lMalQ2V2VDZWIvUy8raDh0WE5tZUFsNmlXVDRHNUZOLytlcFZvckpwQzRp?=
 =?utf-8?B?dkE0d3p4Z1pKaDdGcEUrU1JlVTdLQUw2UjI0cUpZTCsrUStuQW1SUU1wVVdm?=
 =?utf-8?B?U2VabUZ5U0drWnNSOUQyLzVCQzV6Vnc2eHc5ODF5MnVwbGxUejJUMmN0L1o4?=
 =?utf-8?B?R2J5NDJBNUg0OHhXSEh5UWFGdEJKYUJHN2pjRk9keWVmV1pOWnlZZFJCTDV1?=
 =?utf-8?B?VitoaUZ0MnkyV28vUURZaXJOMkdxelQrcXovaUo0WjZFbFJBUURmaWZ6YXlV?=
 =?utf-8?B?T2tjcE45RGErV0Ewc29IN3cwclEzSC9iclhac0lZQXNONXZaeWFyYi9yRTNa?=
 =?utf-8?B?NE5yYlJ2NmU2ZlFLQnRRc3VYUmFqdGZQWS8wRmJ1aHVIT3d3aWN5aG5xWUNs?=
 =?utf-8?B?K2tuc200YjVlaEZ1c0h1Q0lWcFJkY01KelFlM3NTVFIzMTdLSGVKeFpOdWJn?=
 =?utf-8?B?dnYweUp3cnczWVdsUGFmVzMvcDNmSGNSdElIbVR5alNnZVRoVmp0cXF5S1JI?=
 =?utf-8?B?QzlZdGdCZEVMRDczSyt4R2ViTDdYV3JMSXpsZ0VFUDBUanM3bEdUSy9OR2FI?=
 =?utf-8?B?cnpYbXZCRi83S3lsUlhtMnAyaGFkcDl5eFBTdzQvcVNCemo0YXl4dnFOaU5B?=
 =?utf-8?B?WU9sODRpNkpUWFRDOTcwQ1RKTlNsRkZSRGtEenRscHpNTitDYXNFMDdNWlJt?=
 =?utf-8?B?YUpKenEyWDNlWjBNbnpLTzdmZGdmWStyekRlcENoMUlBTWV6dkJjRnFMUTJO?=
 =?utf-8?B?RWtmUkdBL2dWTU5UbFZsd2EveVRqQ29NcXp0ZmNzMnkrSjM2akRHLzFpSnAy?=
 =?utf-8?B?U05kWit1aVRvdndWN1NWUkFzZFppMlZqQTZIZnE0cFJlQUFubVNEbk9XNFVD?=
 =?utf-8?B?alZDTlM3SThNTkN1VEk4ZXFsTTFGNklGa2dGMy9NajdPWkNqUDBKMGN5R01G?=
 =?utf-8?B?RW05bGFodTVyRWZJSkFaS3J2L09YSk92V3RQQjNlZXd3ak1LK1h2clVjdUl2?=
 =?utf-8?B?NjdZSEMzSVJwUmpVSkhtYXB0S3VFa1M0UGU5bHczbE5YejNWbko1QlpoRDBz?=
 =?utf-8?B?OEI3djFaWG9KK1BHaW4wQVkvZytTK0c5TDEzRERHczFYWHVTZGtZdWdyNTBo?=
 =?utf-8?B?UVdzMXRuZjl5MlJSeVlCR2lqWWpYWVkreFVTMTNkS3Y1NmxlNHRxV05lMFVz?=
 =?utf-8?B?LzlNd0laK0FnSVIrak9aekRrckhzVkZZZ1ZPaXM3ek5TaGxReXptQzdZV1RP?=
 =?utf-8?B?U3NEQlcycERMSjlMSEo3cllLajl1MUs0UGdydWY4K0tpbXZaMFJVeW4yMFZm?=
 =?utf-8?B?elpkV1g5NXZjZUFnTldLTkU4MzEwN2xJTmFPYllmcTNmRVFQdjVlaWlLTEhz?=
 =?utf-8?B?aVhQUmZ6b3dTekR6WUZOOU1aelBuMUJYMzhBTkZHbXAwd1JJdWlXUGloVGdI?=
 =?utf-8?B?Z0tSMFFXR2R0SjlzK1ZYV1k1UGl3bUprdnhqdk5RRnB4d1FSWk5rVTk1VGc0?=
 =?utf-8?B?aXZuMC9UaGNFbzBsaTlid3RreGpFYVBoQ3hQOE1YUFdpcHlkVkkvbnYyOTF0?=
 =?utf-8?B?N1NNSVBDdUM1SnRZbWdkZTN3V3ByRmxCQWgyUDl1b2F1b0tVTkVtRkxjeXdz?=
 =?utf-8?B?WUF0WHpncndwU1A0RVlvNjRvQlN6ZE1BU214bk1BZnBiOWNjVWt6Qm1BU1Za?=
 =?utf-8?B?MWZzN084YUdKN055Y0RXR2hqZml6b1BLRFBlRStVZ0lFanNGeFQwc1l6Z3ZI?=
 =?utf-8?B?ckNkcGtreURHb2o4TjQwTTF3VGt2K25aaHdFUjdTejFSc0lUUXFEcDJZYlR0?=
 =?utf-8?B?WkJiREZ2QXZ6emY2WHkxdEYxakw2Tm0xTnVReStJZEtvR2N2NGtBOFcybEM1?=
 =?utf-8?B?WFczUFA0SWRoNEVSV0lQQ2xEYjZOV2tLZGxrdEVvUTFqclJWWlpIVE0yY2tq?=
 =?utf-8?B?YVdqc3RXVzc3SG1TWEJCY3Y0TEhWSjl5clYzdmVaamVZR3J2aTFzYlJ0T09G?=
 =?utf-8?B?NDRpOUZ2TG5aM0tmUFF3b3RnSEdoMEhnbVJNK0V0T0UwRHNzaVMzSmIyKy9K?=
 =?utf-8?B?MTBSSmJCTzJrYS9HOHR4b0M3SlJDR3RtdEZaM1ZqOWlwVkxoVlMzeEJ4S0hU?=
 =?utf-8?Q?Vqe9Mdetmu+2TX5RiPh9VKxGF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8334b9cb-7fe4-4bae-956d-08ddb28ab0e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 19:18:10.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cW49SRxeepHOXGctUivv17welyLiG+Un0u7G68RhvvhZSrQP73XblTT645oxdwPoj5gKsvEOOpwr1QQ6WiZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557

From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>

The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
connect RAW sensors (AR0144).

Add corresponding DT bindings.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Previous try:
https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/

Change in v3:
- Move sensors under ports
- use compatible string to indentify connected raw sensors
- Add onnn,ar0144.yaml
---
 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
 .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
 MAINTAINERS                                        |   9 ++
 3 files changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
new file mode 100644
index 0000000000000..6b745dcf3fd3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AP1302 Advanced Image Coprocessor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Anil Kumar M <anil.mamidala@xilinx.com>
+
+description:
+  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
+  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
+  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
+  Frames are output side by side or on two virtual channels.
+
+  The sensors must be identical. They are connected to the AP1302 on dedicated
+  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
+  from the host.
+
+properties:
+  compatible:
+    const: onnn,ap1302
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description:
+          Reference to the CLK clock.
+
+  reset-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the RST pin (active low).
+
+  standby-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the STANDBY pin (active high).
+
+  enable-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the EN pin (active high).
+
+  dvdd-supply: true
+
+  hmisc-supply: true
+
+  smisc-supply: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    patternProperties:
+      "^port@[01]":
+        description:
+          Sensors connected to the first and second input, if no sensor
+          connect, isp generate test pattern. The compatible string under
+          port@0 and port@1 have to be the same.
+
+        allOf:
+          - $ref: /schemas/graph.yaml#/$defs/port-base
+          - $ref: onnn,ar0144.yaml
+
+        unevaluatedProperties: false
+
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              clock-noncontinuous:
+                type: boolean
+
+              data-lanes:
+                oneOf:
+                  - items:
+                      - const: 1
+                  - items:
+                      - const: 1
+                      - const: 2
+                  - items:
+                      - const: 1
+                      - const: 2
+                      - const: 3
+                      - const: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "onnn,ap1302";
+            reg = <0x3c>;
+
+            clocks = <&clk24mhz>;
+
+            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    compatible = "onnn,ar0144";
+                    reg = <0>;
+                    vaa-supply = <&vaa_regulator>;
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&seninf_in1>;
+                        clock-noncontinuous;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
new file mode 100644
index 0000000000000..68562cf4c00ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0144.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AP0144 RAW CMOS sensor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Anil Kumar M <anil.mamidala@xilinx.com>
+
+description:
+  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
+  ISP.
+
+properties:
+  compatible:
+    enum:
+      - onnn,ar0144
+      - onnn,ar0330
+      - onnn,ar1335
+
+  reg:
+    maxItems: 1
+
+  vaa-supply: true
+
+  vdd-supply: true
+
+  vddio-supply: true
+
+  vddpll-supply: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: onnn,ar0330
+    then:
+      properties:
+        vddpll-supply: false
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "onnn,ar0144";
+            reg = <0x10>;
+            vaa-supply = <&vaa>;
+            vddio-supply = <&vddio>;
+            vdd-supply = <&vdd>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index d6f1670290589..1362d351f2574 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	sound/aoa/
 
+AP1302 ON SEMICONDUCTOR ISP DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+R:	Frank Li <Frank.Li@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
+F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
+
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.34.1


