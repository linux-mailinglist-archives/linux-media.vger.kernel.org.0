Return-Path: <linux-media+bounces-19582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E623F99C52D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14CA31C22623
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11C1AD41F;
	Mon, 14 Oct 2024 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XPbtwjiX"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1791ABEC9;
	Mon, 14 Oct 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896973; cv=fail; b=gOfF1Br4PelwW3P+xqDiGP4veTAh4+BgBl7fGfEHuEtdu4FCJUE/2eNYWDycc23Xbkkqizo3jJSouCD/FzS72fjF2cJMyBiSmqgZzOHG44vEBXXxZ+FKDz0qszMZOyT85KOIBvxWkGP5VxhZO+gWeGYXTZzMkUmHN/+Dgav8iEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896973; c=relaxed/simple;
	bh=u0z2S4au1f+koSwRKzJkJR0UpbF+/pwH0rWaOPj2njQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=r0gSjc0av5ej0h1dflHV99ICoQTPkHIwtqfZ3bBivwOhgVWEm0PvOLhfbtrQAb0WY+zFoNs4ZQhcozhgNZLEmrZjCRdbWr7unQKe3NyUaVCwJ10Axt3cBvoLJcW8kFddr3DhgfZjrI2Pe5E85gGwlDNyFSnbO4eCEXMyfle6MLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XPbtwjiX; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWg/c4nOj+sZS5aKOidyP3avsPVzGc1Ckv2YzQWV5LCY+2X+1e3ih6y5cY/AJ0b6dz1cCIYhFRphhKObATgBpSNtvfNlJYMfQwAIxBGCdIBQpG/Wn960qYXt5229ZJnIHz+n5I/zRDo4xy/xKeqqwhTIy/CtwjukmtUmdlkr6PkE7n2qjENfDTSewkT6eejstDbmEzPg6mbEPD6e5WPb87qNqaMjEKr0gF52RMyoY6Ejiu6LkZdid57yI25anyxP1GZ6ZrYq3aapOnoF+iRP/kwq8wKRwRrNWJo4jeuXtX3GqFAwLD+LxTaDgWAWME6cfOuMiGZTJfUTAnCTwsJO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBmZKker1n9bOwmeNWdnZ/y2Rt4qikijZOhEi8TVGoY=;
 b=VpiRy+W07x5xk5yMNgdr4LXsPCyxmAGlqXorkq+kNkBqHo2ksTnNrYJI3+6AaekSXkUwTvgH876+OBPbjHU7Toc/TeP1qngUMkmrTbN/53feqaHNZ6hfK/cHtk823ZpjcmKpUgARInBt2MgPnLdKEO2OJzqhgi/Nf+Wo41Cy+MBoH7/CfoY9EXZyqXVPUtVw4LLifE848PlPFgTgt39sKTKI5HMgHo2HvM/1wkS5/1O5JWmy0/sXPljSmJXgokrWl9y7jZgqV9NIVsK0fshijAvBUipv/SE40zDzHKlrssKJ5lvGC7kN6AL8t7nqx8LfLT1swWBGFS2PGjWjRTG7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBmZKker1n9bOwmeNWdnZ/y2Rt4qikijZOhEi8TVGoY=;
 b=XPbtwjiXlmD5kw+U9zeFYtuoGxt8bjb2J/dGGk39Il+DBe64fYTup4x+iBXhTddw4upM+j8yVJRG9Ak2ZG8BI5jQGa1n+XPO69ymdVinravMpZabbnIPjPmW9fA2zmMuEKChhGoIpkF6bHISmBuNdKViQOlIG3Ol+yqHJ5UyzUCME3bsxqH2slSXgEgXK9KTsoUzuA83u3P5T/yKBS/TNlIzosvFQVPct8wntXygJdDJkduwm6/Uc6vQz18utK4v31qWoCICEKDT7tN1CqRHXphOUiC4wVvbUT5TrDpZ5CuDhq9aIWAD/bsE46qN8nZt0XYOXpsqff4YnBadxuKZ9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10265.eurprd04.prod.outlook.com (2603:10a6:800:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 09:09:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:09:24 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI mem2mem
Date: Mon, 14 Oct 2024 17:09:59 +0800
Message-Id: <20241014090958.1551492-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cda3fd9-cddd-403b-838a-08dcec2fe5ce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cFEyOWlLVXN3ZzRxU283RHNIdmt0THYzalV6WkkvSE1OR1Y3VGZUK0s2S0I0?=
 =?utf-8?B?ci83VGlXQTFja3I4dXVGOGlHaVNPeGNhSXQ0YjQ2Z2s2TEYrMzNuSytGanc3?=
 =?utf-8?B?SzZvR0NuN3NTVDBUcmROeXFJMkJrcXpPVzF5Q1FDQVY4Z29KQkRQVlVBeGdR?=
 =?utf-8?B?N1ZJY3FrOUFIblJlZ0xUaklROWd3QzRpcXAzSUZGSWJWcStPdmlsTEE3TVR5?=
 =?utf-8?B?Sm04S24rc0FSMWVkbTdKSnQ3REFNZWR5LzE2Q21RZ3pPbHBGaWZ5RGRMSmNj?=
 =?utf-8?B?K2NjK1Q1M0E1QXNsOSszcTljUnVXd2k4YzZ4TlY4SHV6aC9SOURhaGkyaVVk?=
 =?utf-8?B?dldPZVVNUDM0Zy96Q0MwOFRLdGlSbS82T2pXWGJBb08xR2tkS0JqYUMycXdr?=
 =?utf-8?B?dGxRS3k2UjNzdDBGL0xOa1RobWdiT2tMRHBDVEZtNDFDZlJFWVpjQ3YwYnhF?=
 =?utf-8?B?QURnZHQxYXNaNVNEUFpJZWdOSm5La0lrbHdyaExWQURPRE42ZmNEeTFFdkI5?=
 =?utf-8?B?NFJ5aWV4SE5FekNBZVhPR0tjc3RMaVZ4c2taTGpqazRkRWhVdUM3OXBtK0VC?=
 =?utf-8?B?Wi9kbWZteWZSQjJBMHZYU283Tk9XYTQ3amQvanFjdDVYRDhWNS84MmYwZ0E4?=
 =?utf-8?B?Y2dNUHJRYmxDMDgyeU04a2lzcmVMWnE1d3NLeFBDczB4QXkzVStaZ0trSkxQ?=
 =?utf-8?B?NVB3RWJHbmlzREZ2a2hNMUJWRXRsMGowN2gwajJraEE4VUpNbjcydjhjK0xs?=
 =?utf-8?B?a3dldldGZzRMR0JXTXArSy9MVHoyR0c4WnJKT1VWcHFTeWlGeXFZQ0xrd1dx?=
 =?utf-8?B?QTBtZ0NKMzd6bFRmUjVYdU5JQ1Vua0EvbkgxTWNKTFdvRFJrL0dBRGQrVE4x?=
 =?utf-8?B?NHZ3VTh1QjMwTEhaNEdJOWtCbURoeW9pa2F4ckVSVHJNaVN3WTFVZUxkdUVv?=
 =?utf-8?B?aGV6Skl3YXhrNkFMcFpFaGxLSlZWUmxMRThwZ0xwa2gxOXB6Z0tHV0tHb1k4?=
 =?utf-8?B?bGx4QUo4MkpoYlpMMUE2SUYrQWEvRmU0ZFNLeUlPNW9NZnRMVlRacEVwQjRC?=
 =?utf-8?B?bTRIdHllaXM1NWV2SWhxYmVYNWU2SnVJeSs5L0crTlMvNnNqZEhJNXd5RExp?=
 =?utf-8?B?TlpEVTlETjZxbW16YSswajBGUlRwQ0NobnRrdWxoVVFxQ1o0NjJYbUJUbkZl?=
 =?utf-8?B?allJZkIvSXdKdFRSSEU0eHZwWVF3dGdrMkFtRzZ3NHR6ZXBYdzZCcDRwbzFY?=
 =?utf-8?B?MGp6dXpObjRENnRYR3QwY2JzNkhMeTNrczZCVm9GN0VVRXh3K0ppbFpBaUFT?=
 =?utf-8?B?dGpOSTVrK2FMNkF2MEx1VWROb0liMk1HNGM5RFQ2dTlMMXZzVktGQmJnejNj?=
 =?utf-8?B?RDdrZFl0V01JbVdST0x3V1F0TE4zenFiWTZlbjFXUHlhQjRybGVaejYvVS9S?=
 =?utf-8?B?Tjc2OGg4TGUxakxFT1ZLejdjOUZ2ZWE5ek5zNW5vV0toc09xekhLMEp4UEZF?=
 =?utf-8?B?Q1RRcDZIekN3Sm1nMGx2ZW9CcmhCOVlacXcyNDZLMkRNc2hxckNyTFF4YlRC?=
 =?utf-8?B?MDlqTkpVU2pscmNyOGlpc2NIZ0xOb0JFM1Y2ZUljaXpMcVVqejZ4cUlIUWlT?=
 =?utf-8?B?anhmUlUxUUR2dm5jQUxjYWhoczdjWDVHZVM4UjJUT2JQQ0FkUDUwVjFxT2NS?=
 =?utf-8?B?NHNCMEY5RDU5WXdZSzM0ZlZqWlBxcU8rRFk5VjJvdSszdWpoUTdZOEhOMWVZ?=
 =?utf-8?B?WDJQZFl2YnN4Q0pubjE3VE1UYWU0YjJQZXJIOFNKTkRPSEVTLzFkVUpHNDl1?=
 =?utf-8?B?OFNVbFEwREE0UnlMS1dxZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WDdpV1dSeVpKUTdweWtBMGxPKzVhcDNTZDlWTjFpM1ZiTElVVVFQUGd5L3Zy?=
 =?utf-8?B?eUsxdWo2Q2w2cTFaUm9icGQ3QnlMVUsxeDRwYitzbHlWb0N2QjlGNUxBWFNU?=
 =?utf-8?B?alNIaEh0K3dNVjJsZHd5RUJYdy90akZOaXBMSUloajhpSnZHUGZJQ29WY3RT?=
 =?utf-8?B?VktqVmhJTnJkcXNCL0I1N2pHclV6cVY4Mi9QaXFscUloVXFDM2tIcHFJaHVy?=
 =?utf-8?B?bDZvOWl6Y3BKQ295bE1RZVIzaVR3TjJUOThvN2oxNFNESVV1MHppWEEwUHFS?=
 =?utf-8?B?RVc4bXp1bkVyYTA1NGJGMk9aWm1QTnhndEtWazh4RW43TVlBdm9LSmZmaHlr?=
 =?utf-8?B?aFlSVzROY0QzNnp6b0M4RTZmRU1Bdng5a3gxZmtwU0pnU3I0S3lNbjN4dWNY?=
 =?utf-8?B?Z0l0ak5BM2ZYZzZwTlV5VTdqVmErdkY3R3ppUTNOdCtOQ2tFU0ZFdUgvSWFa?=
 =?utf-8?B?OFBXZFZHVitGZ2lrZWw2L1ZCdmZYRjl1eTBjeC9udEVaN2tPYlJwTC9iSWx0?=
 =?utf-8?B?MnFIUS95ZTJwblBmSjluWmxZTkthTnNNczNHakgrdThQM2duZUIyV2JJMHVB?=
 =?utf-8?B?dWlWUnVOMTZYWXFLYmFFMTBLN3BmN3dERk5EU2FRUWt2ampHSzFWaERTTkpv?=
 =?utf-8?B?em90MkF0ME9UaXN1UWIwSnRDZFdIVWNMNzhtZlkwTXdRVlg0QUk4TWRza0xH?=
 =?utf-8?B?U3Nmc1ZxL3pYdkl2UTBlTFN5aXZUQ1pCRVRrMGJ6azBCamE0UXlBM09LWVJR?=
 =?utf-8?B?NTdKS3NhRjExbkV6SHdhV3ZTSE9adnRzUTlFWmhTQW1kbmtDZ0JyUTVLUFlI?=
 =?utf-8?B?dlRXZTBhNjhxQWNvVGVWeCtRa2t1djVnWFduV1RpbFVJWFZuRFJPYk9VTlBq?=
 =?utf-8?B?TFNqdTBxU2dyYitWb0hnNmVwalhtMEFhZ2NrZktZd3VmZGNEVUl0dlcvUm16?=
 =?utf-8?B?ZjMxN0wxQVhYdlNCeURWYXhFMndqTXIvWk42anhjZzVpUDJLQmNyVDZWaXVB?=
 =?utf-8?B?SXJ4RThHU2ozUkpTUytjZGJVTE0rMFFXbEhEemJoS045amJYUkZQUXhtQzVw?=
 =?utf-8?B?djlhT0lnRzlBb2FIWWl6UXdSM1hGZmpaRExEdHp6YXdmOWhFUWNWT1VtSitu?=
 =?utf-8?B?ZnpOdDN2R24xU0pXZkZWbE9ubFdibDZFRktRMkpNS2dlVzNONVoySlNLZXlK?=
 =?utf-8?B?ekJwR3RXRjYxbnZuQ08ya2JqYTB2VEJ2NGlVTUZqOXkzWjhjczlkaHpOYlJI?=
 =?utf-8?B?Q3hUSlBPRGVnQUFRRU1xVHZGc0llb2REa1JOVFpWRW5DSTRETEpvVHR1VnR5?=
 =?utf-8?B?YWlnMVo3YldHM01BaGxteGNHa3BxZmYrQ0JCRUNRRkZVTm1Jc2U0T1pHNGxr?=
 =?utf-8?B?Ni9EWjd0WHZFcjN5YU9OTmhpRFFXK2R4NWFreVduUUV5OHlPL2d1Q3pQZ3ZZ?=
 =?utf-8?B?Wks0ajhLNlg0TC93aGFsQ3RFUWhPMmt0WE9Oa2lyeHNjUjZVKzVQQTJRRTBG?=
 =?utf-8?B?bSt6azZtUFVTeXBNTlA2aU5VM2hDMUh1ZkkwMDlWaHBUaEVrZjdlakpXYmZI?=
 =?utf-8?B?MVF1SnFVRUNLajhXNi9EMHRPRkpqb2dKaHBkUkFvSFNlSUFhZlRRb2x4SjJY?=
 =?utf-8?B?dkdTcXgxbWJpdWtJOEtraEJ3UmNEVEUwdndDSnYwOUxDckw4NjZ5anFTUVBi?=
 =?utf-8?B?S3NaMVI1dEJ2elJqUUw4bkhzMDRNZFBhd3d5Q3NBaVhwVzdZcllYRU9NdWRH?=
 =?utf-8?B?OUdxdTFpbUIzRG14Nm1WeFQvb2N6clk5cE0vZ2lGZ3hmdlFwVkVmQXF2Z0tQ?=
 =?utf-8?B?L1NjUGFncEh0WmJaVGdPbUtObzEralpHczRzS0J3RDBYVVpORWt5T2tYbkcx?=
 =?utf-8?B?MlBHTC8wWDdjRFYxNEQ2S1FMYzV3bDFzc3VoYy9SOHJhQ0VYY1BSUFdBRHpJ?=
 =?utf-8?B?V09wdTFHVXg4ek1PNTFpeWFTUVVydCt3czd3VHprQkN1UTRYNEJTVWQ2cjR3?=
 =?utf-8?B?TTJ1aUVnRWQyVW5pVmRseWJGNEdON0FGK3huK0RvZnFPRTB0M25Lc2ZUc1d6?=
 =?utf-8?B?ODhxSkQrWkF2RUMwTFFWK2hBcnJ6TmlhOGZXOUxPak5KNVVhQmhzM0xoaVIy?=
 =?utf-8?Q?0cyHwklDTsjSyM0WJkakc5ivw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cda3fd9-cddd-403b-838a-08dcec2fe5ce
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:09:24.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYNSqADtYc/Ijlqpbuv8Ybx8sZNaA4j/lUqcG6OTciH9vk3vjKrYpHGqF69/6hE1wJgwhuDs3o08cTawB3en0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10265

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add suspend/resume support for ISI when work at memory to memory mode.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  8 ++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 11 +++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 48 +++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 528e723114d5..35a771714614 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -347,6 +347,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
 		struct mxc_isi_pipe *pipe = &isi->pipes[i];
 
 		mxc_isi_video_suspend(pipe);
+		mxc_isi_m2m_suspend(pipe);
 	}
 
 	return pm_runtime_force_suspend(dev);
@@ -376,6 +377,13 @@ static int mxc_isi_pm_resume(struct device *dev)
 			 */
 			err = ret;
 		}
+
+		ret = mxc_isi_m2m_resume(pipe);
+		if (ret) {
+			dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
+				ret);
+			err = ret;
+		}
 	}
 
 	return err;
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941..895b47ef4658 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
 int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
 int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
+void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe);
+int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe);
 #else
 static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
 				       struct v4l2_device *v4l2_dev)
@@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
 {
 	return 0;
 }
+
+static inline void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
+{
+}
+
+static inline int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
+{
+	return 0;
+}
 #endif
 
 int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a16..2d10c0639096 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -722,6 +722,54 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Suspend & resume
+ */
+
+void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
+	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
+
+	/*
+	 * Check pipe for ISI memory to memory since only
+	 * channel 0 support this feature.
+	 */
+	if (m2m->pipe != pipe || m2m->usage_count == 0)
+		return;
+
+	v4l2_m2m_suspend(m2m->m2m_dev);
+
+	if (ctx->chained)
+		mxc_isi_channel_unchain(pipe);
+
+	mxc_isi_channel_disable(pipe);
+	mxc_isi_channel_put(pipe);
+}
+
+int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
+	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
+
+	/*
+	 * Check pipe for ISI memory to memory since only
+	 * channel 0 support this feature.
+	 */
+	if (m2m->pipe != pipe || m2m->usage_count == 0)
+		return 0;
+
+	mxc_isi_channel_get(pipe);
+
+	if (ctx->chained)
+		mxc_isi_channel_chain(pipe, false);
+
+	m2m->last_ctx = NULL;
+	v4l2_m2m_resume(m2m->m2m_dev);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Registration
  */
-- 
2.34.1


