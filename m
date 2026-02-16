Return-Path: <linux-media+bounces-52899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGucEhozk2lx2gEAu9opvQ
	(envelope-from <linux-media+bounces-52899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:09:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F9145255
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E715A3009F37
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2022324B38;
	Mon, 16 Feb 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AAoz1Br7"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCF320A0C;
	Mon, 16 Feb 2026 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254156; cv=fail; b=mk69Hybc2nfr+OKU9ZToauj0wks9iIgI5Lqc+i3IeYD5CkDPdWqkpI1i3+EA148zM3zRKGQ5s+9cq0E7kcuE51kmZoOumMAf68LfNdJ5YAFwtWbCpPM3muwPdCw3QWcvYcpYTnAjO6vmGIemSJYttpVzrXmTyrBZwyKYmZjeCRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254156; c=relaxed/simple;
	bh=h1VTCU/VpgJahB+/lLvvsHac4eXAwQ6HcMVlAURjjJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KU3qFn8VQKJsECmPKPWZTq1ENcissfAuu3JzxTIkGI0jv6962brANxRnje3o/7KxrWut/QO7YeII+z4pLmlgHr8+EV+0r0u0euab0W2FOZtaSBKnGAkz5F5v0A8O8640O/WAQWGMEECvUJ7jKooVzKt2FhnL6qFrezKVOzeLXSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AAoz1Br7; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZIMhZkiHgmqk0gPILCLJIE1CJDWPQeE3E+Eriuwvoo8lbHMrLx8NGfyquSvSRNNYmjo61CR0w5DM88iDpmfAQGOq1vo8qDnbFeWOeBDbkf0OFjjnaZKSmqhdGz5qDnC1n2/80mqd+sRQoxO15skxeQLzkCJUdBvdz4gOenG9HuX8hcNo9yRScXoYdoKN2Yd/2c7Dm0+XCL+T4FMoBHzp3EO3gal0GGEPTLthQ9SnFJ9GdPrQXHcNTupi4C6c4DfaCiSaCiD77WaSyFsCIsBNPEjd8wMzMSsxCdE/n4isZDPCbmN2mUygoDPbMmTZP69vKCiytQNZ0cMCse+QbZaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2QP30qlBTI87sS30T7F97QhAM6HXJVPVs33LQxl5pQ=;
 b=jLKMFLT61ZNWOAQeTNu4c2ty6mgl2OQEhOns+/+l4pKASsWcDk6wx2qQFzZo6VL5PUQTG6Dv3bg5LRi1wujcbUIanT3jKjBfop+wetyUKKmXBYp2fCLqONpWYwRAVEgI/FCRzdr5tJFLETpiRp/xGvfuSqc9lKbfmi+FCITAv4Tks8SxIWXU/27/4cgyX2QTIEJMeZKv7smLzGqXSemaxKGLahLzhcYgjYfTxJImm6lSQ0BjfwrieJ3SehbOvtY8G8UyDzPU09cgGwm2N0du3DYYx8xaAl+0aOkWIR66aoioge9uAcoOeRDjd28pl0eam8S51nw2SnGxtatagC0DyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2QP30qlBTI87sS30T7F97QhAM6HXJVPVs33LQxl5pQ=;
 b=AAoz1Br7b+FkaPtIBEgQaP52N2DdMl7hF8k9BAt3ZSMO1wbOTZq41H7fY3JvNE3UpWS7HOxEtauBECEB3Ae9AiLBxKVw2tL7BfLki5HUlyIlJdysZZWmFL4mguvR64nOfKjkzwVI9SliPent+OokNwHAkETx7xWiajnO0AO/AR9R5N8PfK2jc+PilubnwK4BMoNv+acATwBblBx87Ec508m0QntwhaHCXJzXoVycHtyVs57pGY+PWxRl01wqa2bw2OzbmI+cbzgYFJ2VFHsO/ZR3bE8G6je07r5CIIGS76i+PKLSDdCZKn6TGdbID3fUxAkANVRNdnDJ65EH2iHFPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:32 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:31 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	chester62515@gmail.com,
	cosmin.stoica@nxp.com,
	adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com,
	Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	jkangas@redhat.com,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 08/13] dt-bindings: serial: fsl-linflexuart: add clock input properties
Date: Mon, 16 Feb 2026 16:02:00 +0100
Message-ID: <20260216150205.212318-9-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cfa55c-6722-4f01-3a01-08de6d6c68d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUo3YXh4dGR6R3A0RDIxdjV6bWNxeTlIZEoxMnNuUzRGWTBzSWpYVGE3WHUy?=
 =?utf-8?B?bFByb1hzS1hVbEx2elBaNVhSa2ZRN2oyZnpCbVlCK0EyRzd4anJkWU0zTU1N?=
 =?utf-8?B?Q2hDMzZPM1hrQktaN1hwSTB1TDJWb2xMSlZLTEkyd2ZOUEl2MkYyODRmVGdL?=
 =?utf-8?B?SFlmWjhZWVc0dmFPYlVxUXBMZWhKRDhoSmpoOEtUUnc2dHBCZy9kcG9RM3BY?=
 =?utf-8?B?cTJ6QlpEa2M4aStCTG1pSTloSGhZWkJtb2FPQTFsOEdYK0lZRkdlSm1zTld6?=
 =?utf-8?B?ZUQwWExEZytndTBGUkpNRmZNa3NEeWxmRVAzS2xub1d4SG1wQURRVlFRTVhX?=
 =?utf-8?B?WEUrTkJEOFBzeHhUajlhQ3ZZc0VoQXk1SlNRL3dmY3h2UFVGR0ZOT2RRc2Rz?=
 =?utf-8?B?OHF2ejhUaUo3SWhMNCtXRExFd0wxUENUZk9KRHRyNTI2UGlETnJ0TDZreUxy?=
 =?utf-8?B?Z0pDK3o3YzFzQVdpVW5lRlUvV240ZEtYdGF5T0lUbTNyaTdZbHZBek5jUHVV?=
 =?utf-8?B?MmxVdUllSXlUWTVBMWgzRW5vZllmU1FiU0hzUjdlYXVRL3dEV2pZZWk4Y2lS?=
 =?utf-8?B?bVZ0R3lQS2dqeUNSVVVaeWY3ZGpuUHM5eHJMV1pWZGhxY0F1YUJwazQ0STNI?=
 =?utf-8?B?MExXTEdGdmczOENPdVJCSVF0aHE3a1RnVzZrbW5XRmlReERhZFN3cmlJbGhP?=
 =?utf-8?B?SG10Y3VyNEF2R1ZpdGlKNlZpaVU4WEY5eE1GMlZDbHJ5d01CNWYvODQ5bXBa?=
 =?utf-8?B?RmV1Q1R2ZkthYXBlZHg3YlIvYzZrbzZtT1VrUlVuZ2xlSno4TEVBcmR0R0VX?=
 =?utf-8?B?WDhmeVhWNmJsNGxVQTFsSGdMNENwUGdvU1dyTWhYelVhRVBLTU55TXY0amJM?=
 =?utf-8?B?NFh5SHZwQm4vV2QxVnFhNzYyY2MwRkZXWnRCUXlJWDByaHp5V1VtWVF2bmVW?=
 =?utf-8?B?ZEo3RTJUZy9EeXNWMGxQcXE3NUZjU0tNcWRGTFYrS0tjV2FlaW1hcWhlbCsw?=
 =?utf-8?B?U3lBekJhZXd6Z0M5UXBXRHJrY0M0ci9nMDFpMTIyMnU2eXB4bDc2TU44Lytw?=
 =?utf-8?B?UGR5QlEzd1dndU9NaDBIZEJPSUlQZmZBT0ljMnhzdlZTUXFUMXpQNi9LUXFm?=
 =?utf-8?B?ZWMydGg2bTNoK2pPQzJkZ3VMMDY0TzZUaWtKQlVtdDNrQnNZeGRQTXo0d1lu?=
 =?utf-8?B?Vi9nMlJtQ2ZTQ0wwbEY0T0lZa2Y5TEI4NlNzSEVNZDZHME5HM3pkZzJQOEtm?=
 =?utf-8?B?N3F3SEp1VGRHamZnaEQ4QkF5TkZvN0FydUxtT0dxTmFFYU9Hdmp5b1ExcXBO?=
 =?utf-8?B?QllGMzhYak9YRHVsR010bnRYL2FUUnVOREk0U0VaSDRPZ0gwNG10ckRXNUJB?=
 =?utf-8?B?eVROandxU1Ntd0w4dlZqSm15NjNIZEx2WkkyZC85VjV0M2RtN3poZzcxVHh0?=
 =?utf-8?B?RlN3NHhZYXhBb0M0T2ZJQU9qb0Y0cmt1RzA4UEhVTEtPMnFQMlBRbWV6Z0hx?=
 =?utf-8?B?azlvdjhpcHRIczYvSFBHL3R2dDZndzh4amRneTdSR2pDRk9VNjJIMDRUY2o4?=
 =?utf-8?B?c20wUm51bjd0bE4va2dPbmpaUkc4NXVLaU11emFPZkdaK1hOT29hZG05VWhS?=
 =?utf-8?B?V0YwTDdOTWxodExUaTBkZUJCRmF4azlTQVhWblk4RWIvbkZkOExBRko5c3Zt?=
 =?utf-8?B?T3I2QWMvVEpjWXNnV2NuRkdFSjViU2thS2VKd0REeDJRT1JWUU9ZYkxUL3FW?=
 =?utf-8?B?dFZOUW9xMDR6UTN5U2t2aHlVNmRJVitBQmpVUW1mMWpmNVJoblBvWU1YOW9p?=
 =?utf-8?B?Z2tsRVVUaVA2MVlHSjVvOThVSnp6dm44MmpwRm5CYUpwVUo4T0JVbWZHQ0h4?=
 =?utf-8?B?UHh4dFJMUGdSYmU3WUVKdENLQ01QNG1sekZjUlREeXFjTWJmNzlzb2JzM2ZZ?=
 =?utf-8?B?ZDd4ejNsWVNWQ09UUXpESTFmN1dSVXlPR0RsVWlUL3M1Q0FEUnJTRldCUWhB?=
 =?utf-8?B?RnZLK28zbm4wWnZwWlVUZGppakEwWmxudk8zdDI0N3lZNEZSTGpSeUlXWW9k?=
 =?utf-8?B?TkluNWE3VmpQSWlpYjhHSjZLWmZqUzhjY2htZmV3QzdPSm1nOGNCNjdHTnVY?=
 =?utf-8?B?a2RVL0w5R2pESjdKNkF0UG84WEFvaWl5bG80VUZjV1JUWDJmczFuOURkVFFx?=
 =?utf-8?B?Mnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlRHRUFyQmMvR2c2QWFqd28wNVlXWURtaTdQL21pTGtjZlNEVnRua01lRG9l?=
 =?utf-8?B?QTFIdWFzaWFLcG5FelhsQmQyajN5aXZoSThjT2lqV0M2dm1SN1AzWlhaTjR3?=
 =?utf-8?B?bEtUSlA4M3lJYmpjVytoa2drUEgzM3lFUVJuclZpcTVYQ0U2VUdsYnZzak1w?=
 =?utf-8?B?SjVoM2lVb2VRb0JSc203L25qditpUHpBeFlYVU0rc3hteDNJMkJKczBIWmk3?=
 =?utf-8?B?R3RobXhBMC9udTdkMDlSd05VQloyVmNuME5MazBpRlRhb0w2dWsxRDNJQTBP?=
 =?utf-8?B?WHdzYk5WTmpvMWRVamo3Qm9YK0hxZkxtZld1V1RIUXV1R0phZzNYK2hhSFh3?=
 =?utf-8?B?WE1iSW45a1JOR0VsM3F2SkoyTCthbStpTlVJUkFFSlYyc2NPdmFyeUFYOXRV?=
 =?utf-8?B?S2R0UTF2a0FiK1k4a1p1aDc2ZzlPR2tnS1RJZDJBeWpvVlhNZlBUTEgrQlR1?=
 =?utf-8?B?eDlkOU5TMXArNmhmVEtYTnJMakdEVzczZXRXRHRxSjFYeURzNGhZcHIzRU4w?=
 =?utf-8?B?OXNWenQ5Vmo4ZHR3TFBhYjFpbUtqalVmTnNuUURhY0hKaVgzMkptS3poVlRX?=
 =?utf-8?B?MjJBRUlmcHZ3RHN3NU5WYjYrWmo4SXc2bUVOZERWaTNtZEhqVjVUZEo0VGQr?=
 =?utf-8?B?RGo0a0c4NFJiOFZrbnpIMWF3NWRoTUp5VnRTT0g0SGs3SWhTbFRpWTVKb3Mv?=
 =?utf-8?B?Ty9GZnE1ZklNUUtjYmhxbXkvMk9aYmo3VHJVS0M5di90NGExamhyZHFJME12?=
 =?utf-8?B?QTNzaGdySTN4UGMwSndjdVo1SGEycHZpSTYzRFhxaGFyTlQzNitndUdZT0ZT?=
 =?utf-8?B?NFozbUd6MGxDenFDc2c3bFFvdmtVZlJqSjZvNmptcXdGNXBHNUVFeFNJQjNL?=
 =?utf-8?B?WlcxT2psbndMbXhneVNabFgvOTZaQmdXK1VyaG8wdnFQZWxuZy80SGlQa0Nj?=
 =?utf-8?B?ZFlpT3JaVTJkMTdROFJGRjZORlMrYnRzWGw3bmhFNVpTS3RwdlBzZHlKdGwz?=
 =?utf-8?B?YjBkNUxOSytsVG42WkdtS1Z0QU1RcTdZWUhpNXF3MFNOQWFVQ3ZDbEFiODBm?=
 =?utf-8?B?ZER1ZmhKeCsxa1VSS08vdWlBYWtSRVpmT09taGdQWjVhY014Q0w2ZStLUW8y?=
 =?utf-8?B?SExCbjF1RFFkMHh5MngyQ3dOT09wRXJLeDArSTBiM0ZuemdYZGQxZVMyWm9w?=
 =?utf-8?B?QTNnVW4xQkxzb1Z4QmdJSCtVM2xlRlo1ekhYeDVUSldWVjBhV2Z5OU1qczMy?=
 =?utf-8?B?N2J3K0xIVGtsOCsrMGRkYkt2M2doSzhLclpZVUVQMGxsKzF3UEJMejVFbWRj?=
 =?utf-8?B?QlU2VmQyZUZVSXp4T3hXMklIRmdvT2tHZ2xvUDlhbFhPdEFJS3BqQVhSbGdW?=
 =?utf-8?B?V0pIbVRyYm5zN3VHMHp1Snk5V00rRTJxUGg3SnEzWVh1OHRnZHA5YnJwWTdo?=
 =?utf-8?B?Z0lpUkVlMDBONkN3clZtSTF3YS82MTBmRzJST0xweEF6Ym54c1dYMmhqUUVS?=
 =?utf-8?B?cDJkUVRiSVE1SEVxQmNlRWQ5eGV0S0VvQTlMb0pTM0ZlZkhTM0N3VXNQNzhY?=
 =?utf-8?B?eFg4K2k5LzhRb1ptQURYdk8wQVdaRk9qdm4zcVhkbG41MXFQdDJVTUNSVEk1?=
 =?utf-8?B?QVJFd2d1dUQ0enFzUEJEWkV0M3NQMTN2VjYwbzUxZ1BaWFBRbU9tOWl6eENp?=
 =?utf-8?B?djkwVzMrbUZ5N3dFTm9NZVFTa3JxNFAwZ3RUM0d0YW56MmxKa0xiSWdOSGhX?=
 =?utf-8?B?Sm5RWG00eDBHeEMwZjNoTmh3Z0FoUVZXU0NBQ3Z5anFrRUNyQnFYWkR0Z213?=
 =?utf-8?B?Z1VTc3JhOW9PaDZSbmU2eFJqZml4RmdwN05xV1ZYZnZaaUVtUStHUXJHSzRP?=
 =?utf-8?B?NWRXVy9wTFdvRzg1ZHFmVU1xTkZSS3RhOVg0QzBLZ0ZoT1pzaHIwaGFsdk05?=
 =?utf-8?B?cm9pcGJRaTg4ZEVqOGVSNTRuVUlINTZJM0t0KythTy80enpBMmMzbmpvekIw?=
 =?utf-8?B?OXh1MVArMDBsbkJ0dERCMUZGZ250MmRLTXdjRndGUmMyYTBZRERzQS9WSmpt?=
 =?utf-8?B?WjJTT1VwYnN1WEtqb2NzVUlQQUhSMnJxdFFRSDVmemNJc1p6STRXbmFCY001?=
 =?utf-8?B?NkU0V2lobW8xdVZYbFZYTmoyczlpaUZadUxTTDRWcjkxWmNiMTJGL2lPdm4x?=
 =?utf-8?B?VWtGalp0S00wdUcwNjY2cHQ1cmVxaUJ2K2FNYzIrOXl0SlVqNG5ZV3pxY3dn?=
 =?utf-8?B?MVdIcFZlMmdKTmh6TUYwV1NRV2xxV3c2bm1zTzl2aXV6cHIrTWFReDhGTXUw?=
 =?utf-8?B?NEFsOThPSUpqaytIUEs3WExTMzdJWkZPSWFIZzdVZC9YTkN4MGZ4QXdvL2I5?=
 =?utf-8?Q?hvHgxhZyFGZKKkes=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cfa55c-6722-4f01-3a01-08de6d6c68d4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:31.8709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2YPcqPA9GqDQA1B6J+aiCyzZ/imC6skQNS2WOs1STNugTUcTNBtHyfPnnHXKVhfXrq/PCULzx2m3JutGVXu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52899-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,401c8000:email]
X-Rspamd-Queue-Id: 717F9145255
X-Rspamd-Action: no action

From: Radu Pirea <radu-nicolae.pirea@nxp.com>

Add optional support for the two clock inputs used by the LINFlexD UART
controller:
- "lin": LIN_BAUD_CLK
- "ipg": LINFLEXD_CLK

The clock inputs are kept optional to maintain compatibility with the
S32V234 platform.

Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 .../bindings/serial/fsl,s32-linflexuart.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
index 4171f524a928..885f0b1b3492 100644
--- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
@@ -34,6 +34,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: lin
+      - const: ipg
+
 required:
   - compatible
   - reg
@@ -48,3 +56,13 @@ examples:
         reg = <0x40053000 0x1000>;
         interrupts = <0 59 4>;
     };
+
+  - |
+    serial@401c8000 {
+        compatible = "nxp,s32g2-linflexuart",
+                     "fsl,s32v234-linflexuart";
+        reg = <0x401C8000 0x3000>;
+        interrupts = <0 82 1>;
+        clocks = <&clks 14>, <&clks 13>;
+        clock-names = "lin", "ipg";
+    };
-- 
2.47.0


