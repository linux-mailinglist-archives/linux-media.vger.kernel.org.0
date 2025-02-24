Return-Path: <linux-media+bounces-26768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66958A416F8
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03202171633
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1E722A80E;
	Mon, 24 Feb 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fMtzzyQw"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E424166E;
	Mon, 24 Feb 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384735; cv=fail; b=nOWMxxcIoQSkLm7hg/pBIb9eDDQv7wRS0fGUE1P3znbrk+VKgzBM2YGSl9fyxtC5wE9/xij40FNK4m4IBs41aLjE8Nc3JG5v6wK9t0ripqTC1wz7AMLkj2mRsarvs9cEh7uRFEGiFJb4hATcnwcw+U/CgnHrcd+PvAP5sdsKn9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384735; c=relaxed/simple;
	bh=NywIE+TfyGVdNAZE+Qa8zvRSGkdTkbZevvFpfyEGiAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bSBrLmxob6M4sADQ9pjNeuQFKawu70sMEg3GW4T9N7Pj+wu8lgayGCZRrQxLxiQ2eQBhXtVyp9XUduvjAP5g+t57+EmXo69c9USzMy5Ty/ApXIQObElFnBNafzAoSJbERbgEcPZVV4jkBlDY/BU4hEWg7Wv7/gdNfn26ZBJekqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fMtzzyQw; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCv2/EuAM9Lvmo4bcyR4oaPKzCgqxC7E2NNHTaAbGxJqiqoe1SaBCVykl9P4Z3nSkQVrMgmNCGIlLHdDau2LDjGYAnmdxvGzOUeGIR5sOrFqGjG0zv4mGPvxQXPROYEUvZy+1AjWO+/8uhpKUbKxnf+DxhTWNbcDiuc/xwvjkD6AkY2TF/g7imbC3ZWd4TVqWvh7/WkGcOljtUWNwnO3YXAgUGzbUvbkIRbLWJgQz6g3PCYmVRQNkwX6soLH6I7aMSnOwXumk7LMN3VCgQmv7wpp+KZI9dtcsufV9EP0hEPbm1T4XPt7Tv3YTXvbR9qT1G7bhv9TcfNxnCLDlnJDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A1QXX9qtHafTZ9mUvx2lp6FTi7Gj9eMxGOCmzsNUWU=;
 b=VePtQCtde2pkl/z4ryHxSrLvNkznkHCBRmBaYW4NNVa4Gv24iJ3oCm8J/I7PO7RyuTCLlkyeeVHNjR9sxmb5rhosPcQF9AmCP1wiH3XKrzCu2vNKrZ0bHqWw3mR9wcoC8hM8H9WSoN2lX8tSFUIVpoA40QeCTPMS5JNcXsmsoaZMUn/iUp+G5AmNWcZSXsmj2Xn67RjL8g6Z1gaLTFqo7741rkKrufVVxk3cU1Z/aBLa8IcN5hz8dukrQxl6dIRjmlJSW3Fd8IUubenYhdpO6dUO2yt0XVN7XlpX2V+zGANUmiDi6csEQjCJLh5LXHq9pRJk6Wqu4iK+Ogn94sCJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A1QXX9qtHafTZ9mUvx2lp6FTi7Gj9eMxGOCmzsNUWU=;
 b=fMtzzyQw/ndmx+ueFTGKOtL1dA4sH+OsA2gHwA44JQFEqa/SWWunGeof71JGelbbn4va7SeTcXTPCJhsenbre2fKj+sgmE/h9WI5XZbqvo909KyRjUlq5GiwIxbB/qGEsI2TgiqgdA46AKNu9c0xiKcoS8YCWbvYz3bo5kE/GzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB10957.jpnprd01.prod.outlook.com (2603:1096:400:3ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 08:12:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:12:10 +0000
Date: Mon, 24 Feb 2025 09:11:54 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/G3E CSI-2 block
Message-ID: <Z7wpys895ln2SZBL@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>
 <CA+V-a8vvPm8hGM9Um80ah_L_Rzogmt69UXuKW1T7dMjgYm76TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vvPm8hGM9Um80ah_L_Rzogmt69UXuKW1T7dMjgYm76TA@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: 4185b479-8971-4c5d-60c7-08dd54aaefec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnBhUEVSRTVGT0ZqTTZCY1JZV3IveEhWTjl2QWJ1ZExoK3ZnWnZZNWxEMW9I?=
 =?utf-8?B?elZPMkkzUlpNeTBtNS9xVGJjYjMxQm9pSDQwV2ZkSUZjaFR4UXAzNTFxVmNo?=
 =?utf-8?B?alAwb1pseWpLenZzVm1BRVY0UVpMZE9ER0hCczdISk91VXp6cGM4d0h1dTdM?=
 =?utf-8?B?Q01vMUR3TnhBeHRndk9renJjVFlNY1FUaU1wekFLTkwyTFZ0bXdQRHo0b2Vs?=
 =?utf-8?B?OFpHNU9oOWJmamlnSUU0MFllaHcvUU5nNThKN21KZ2xOZEp3NU1UbDBZUyt3?=
 =?utf-8?B?c1RwT2d3YXhNRWk4UFVzQ0UyVEJCSUhDWHYyK0hyVVNJZ0V0d2VLeGROR1hZ?=
 =?utf-8?B?amlsSHhXWVhaaHFsb3RnckVDRDA3MjVRb0Y1eHFSTVozYWxFUG9mTWVyQ0RB?=
 =?utf-8?B?TUcrMC81cy9xL1A4U2JVbW1Bd2prVjVIMEZxcVFQekF5SkJQTk1ENGR0VWNo?=
 =?utf-8?B?Vk9zKzFYc0dmNVJSQlRuZnE2QjlRYklBdVcyWFBWMWhBREpyTFNFRFdsN1M2?=
 =?utf-8?B?Uy9lUDZ3L1E5SDczSXhpVy9mdmYwYVNuTGZXenYzb1RYSWFhSFZYQmkzb29w?=
 =?utf-8?B?cGNWYy9KNUVxcEswSWo1akFFeEJkWlgyOG9KM2xQUlZyclE2ZjF5NzdrV0JT?=
 =?utf-8?B?NStlcHRzRURiQnhDT3pPTDY4cE16dk1iZ1o2MGlBc3pXM0o0UG5idmY2UkZh?=
 =?utf-8?B?Q3ZTWkdkME5OMDFPcGRZOUVLTkpiSDNoclR3Nm1wL3VMR0Q2TTNzNVRTdHh6?=
 =?utf-8?B?bzV5YzRFbWlzc3RBSkRET1lnVVBGU3FVMGhRV29HZGRhejVkTzRiRDJyOFZP?=
 =?utf-8?B?eHdGcDdhbGhiZ0FyNEpWdS9FVStZZzJnQ3RYSGpxNmUzRGdpK2t6ZHNSbFlZ?=
 =?utf-8?B?ZDNDNmJSNGdYQjIvYU5UVkFHeTJNd0hyaC9vWnl1SCs2SCtpY2hycjVBMEwv?=
 =?utf-8?B?ZWtwTWtTaWpQekFJL3JPV3lrSWtMNHF2WUh3NzNmR01neHRUbVQyWnBRVTVy?=
 =?utf-8?B?RG5vdDJFbHRIRTd6Kzc0a0c1NkdROGl2dXpLc1gzdWIyOExaY3FMTkx4eFVW?=
 =?utf-8?B?V0hialJxUTRMSHBrYm5lYUdMQTRnazJVdUVXbkFDZUJUTk5uTTBFclM2NW1x?=
 =?utf-8?B?UVl4MnBSVzNSOWwzKyt3TDRBaE5takFVTU91cnQ0L0VUUzAycnFPOVpQdkh6?=
 =?utf-8?B?UUducE1jQ3QxS1NXS1pSK0p4ejVxLzlibE8rUjB1L3l3OHAyQ0VzN0JwYlh0?=
 =?utf-8?B?MkFCSlBad29aUGJQYzdlZmVkcjRWZEJLNGJrTUI4UHpKdGRNWHZoQmQzSVpu?=
 =?utf-8?B?YmxZQU9kckx3UlByLzVtNDZ3bzZ1ZnB0RFlSaHJ6eTdtUksza0JqYVgvTHRD?=
 =?utf-8?B?bFNPZXppakRjZmdsR1hzdExHaE1ndDc1UmUzOG8xeXJrVGNXZGdUZU53dWU1?=
 =?utf-8?B?bWFPWm05cWpBRGh3L0lkaGUwSTNHWktJZEZyalZzV2hsSGxvbkhkd1ZLTWVL?=
 =?utf-8?B?OTd2ZU1ubTl0Rk5TTTUxM3dhM0c0U1g5aElsU1BVQWhoMFBlQUtSOEVBL1Fy?=
 =?utf-8?B?V1VjT1JOQnNnUlNvVWp4ZUJ6QjM0Nm1uVVI0cDVpb0lweXU4eDV5cnZaNGU1?=
 =?utf-8?B?K3htYkFrc28yU3NPS0RDSEVGKzJoL01HZHF5T3JRQWFQSHNEblVlaktFS0k3?=
 =?utf-8?B?RDU4QW4yMFVzSkZhQnpLMGJIeU9KRG5HWldzYzJNRVI0QXlPOTgya3hjV3ZI?=
 =?utf-8?B?ZndLeWVFSmpxRjcvVzBHYXBVNmF2bjZuM3dmc0NnUS80MFhIR1lxNnpVTEta?=
 =?utf-8?B?TXJrLzhXKzhDeU5RV2JJRFY2N0dURnFEZGdLQXl2bFVQdVNIMVdvU0JBS1kx?=
 =?utf-8?B?eitRTXVCRm55Nzg2UkxDYXNCVWtGdHd5M0FDRWlMb2FNYlV0QlFvRHFJZ0xO?=
 =?utf-8?Q?gRDF26Nc/mGxO8zVoDu5SLoZwLhiuKWa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNHVGZKOGFyMngwVE45WjYzNjlITDlDcWFaUFVwU00vbkRUem5QcFp3dk5j?=
 =?utf-8?B?V3BQYU5PRWFNTWZTZEQ1MXBjL0QyVE16bnk4V0tNekE0RGJRdWxrV0ZjMVJu?=
 =?utf-8?B?aGppYWpuQlF1T3M3L3Q5V1dLaUhHeUhRdUZlbEwrdTh5YzJRb1ZKekVEckhL?=
 =?utf-8?B?RGZpWVp1T1NXblJvUklXdDRWbXplM2piaGJjNE5RcUQrbWJjbTk5NitJUGtv?=
 =?utf-8?B?TjA5bWV3ZW9ZbkIxdE5GNmpZTUlOelNDREY3QXhFZ3hJeTIwWHZvTVJjR0dM?=
 =?utf-8?B?Rlpra0NXUlVYVExIeFgwL3ZjZzZFcWkxRlFTK2xlRXMvMnVtUkJ6blBHVmR1?=
 =?utf-8?B?RVQrWmtsbzhhaEVMZkN6QTdCVituODdBTW9GZTMvMTRaaDYzeUkyZUtzazFk?=
 =?utf-8?B?QWlPSEN6NGFZcjVrMDl4TWFiQVpoNGQzZGs3cWlJcUw0L3BVNnlwR1hxV2VZ?=
 =?utf-8?B?cnFER1dMY0V1ZlpQc3JqRzg4bjJZcnkwSTd5ZkZoRlN6a3NPYzlySHhjRnV3?=
 =?utf-8?B?Rm44VUNGaERrbkkrM1pVVmVUTG9aR3FWZDJtejZNZDVXK3RyL25qSXRHTXlF?=
 =?utf-8?B?eVAvZk5wR0FKREhJaFBXd2hPS29Ccy9kMmJpeVA5am5uUDF2TEhOSXVzOXRI?=
 =?utf-8?B?bjZIU1ZrQ3JYSXFTa1FPbG9YYUV6Q05Pclc1Tm9RcnJua1IySm8xL2RsRm1W?=
 =?utf-8?B?VS85bEM3WURPOVdma3Z0YzFKK0FFd1JUbTlSeDJZZzhHUEd4d1FFRzYrb3A0?=
 =?utf-8?B?NUlhT3VmckRCSE05Sm5kam45TVZjQzhFL05WMjIvemdQQ3NaMUlxZHN5UVd1?=
 =?utf-8?B?V2MzMy9yOThacHg0OFI5bzZ5UTFFNWhLY2VQSTJMZlQ2cGJHWE5uZTR0RUU5?=
 =?utf-8?B?VEo1ek8vWXYyV2FnM3FNZ2wzR01BVVZSdGZNSG5aZEQxUTlnV0hTVmQyTlVa?=
 =?utf-8?B?RUg5aWQvdUROTHhiSzBSR0R5RStWYkp0L2lVZVZFNUw0clk5dVQ2L1BFQXJZ?=
 =?utf-8?B?N0w1UWx5NERpVEptL1RYQTRKUVFQcld5bEdQbGZ2TU9xcGJiZzRPaVprWVVH?=
 =?utf-8?B?QVV1bGFjcHVvYXVUZXFQNnZ6L1I0LzV5ck9aQW5YdDIwc0V1c3BzeVpOcFhk?=
 =?utf-8?B?OVNSODgyclh2OGVzQ2hhSnlOZWJ2TmdqeWNxSmZ2TjhOSjlhU2x5a1FxdW1s?=
 =?utf-8?B?RkpSelV1U1JWUzBUSllOQWFhakcwU2M5bzZDTUxhTm9TR2dOWmE5SHh2QXor?=
 =?utf-8?B?MHoxQTYreEJqNmxWQ0dST0VYUHdGdXgrc21QZFVIMzNDSXd5Ymh0ZEFhM0FN?=
 =?utf-8?B?bFFmNjBORDV1czYrbW5FSFhQT014b0ZVc2ZsOE9ySkVaWTZhWFpQVE55MmM3?=
 =?utf-8?B?VFM5QWlTSk9SMEt2d1JvM3BlalNHaVlQWXlDYkc5WWs2c2hsUzlLcGlJakZ2?=
 =?utf-8?B?RTBSckswdTVKcTlEVVVnaHowTCtuWXhQTEFldWZvNWhseXQ1TUtXVXpaZitR?=
 =?utf-8?B?MDQwdUQ5ZVFMWHNjVjd1a0tFc3RKMWhKZUpPZEh0Smp1N1hJNTNieDZsVXB1?=
 =?utf-8?B?Unp1a3BQSnVsMVZFb2RGL3BweEhPdmhrOGl0VDh4aDNscnBEcXJ5bjUrMTlh?=
 =?utf-8?B?RUl1TFJCMm1wUkdLWExYbzdyOXY5ekRjdEhXY3R4REZEcjNqUkpnS2xnaFMv?=
 =?utf-8?B?aHV4b1kvYUZsOEhSZC9FZ0k5TVBiZ0RBMW5NZG9QMlRvc2h1TUswOWJaZnlV?=
 =?utf-8?B?UjBuK04vRTJ4Qy82aVhhYWRJZ1BJNUhoRXJ4ZzZhNUFrTDEvR0JrR1VQdktX?=
 =?utf-8?B?WHZ1Skk3aWVTUUkvd3I5VDdKTnhnMG9uU29KL2dXVURpcy9vcExBSERmREc1?=
 =?utf-8?B?ekh1LzZJci8ya0hFQkp4dHBzcnFQYnU3OElQTUs1S2JxZFRxSmsyd1YxcldC?=
 =?utf-8?B?dWt2LzAvbXprRzloZmYxSjZ4R1hLdUtOcGsweUIrTzNJTDJqemZDdnZUVzZQ?=
 =?utf-8?B?enpSUTluRUZwYVBjMWNscS9zTjJZV3FBR3VjSGdtYytqZ0ZwL2xFNGI3dmNj?=
 =?utf-8?B?WEh3ZVkzQ21Rdm9tbEtvd3JkQi9XZXhJcjQ4RFMrYzVGamdScHdySG4rZncw?=
 =?utf-8?B?NHB6RmsrZVE1L1QwaXFLbXBuNTJ6eDI3WkMzbGtjdWxlU2tSdkFZdUIyeFRh?=
 =?utf-8?Q?ZaQNl5C3muEm6/RflLVJkfE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4185b479-8971-4c5d-60c7-08dd54aaefec
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 08:12:10.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZCBNAWtPlIM4gaef6ra64hUzvgrSviwFbRYA0JidpEK69xEu8Q8tYs6CgoFwl0SXhCZrQIZwp7EQqjLTJA3ZGu4lviYDGUAIB+S8Uz1ZljqBpbPuBy+hCA6wsuJ5O3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10957

Hi Laurent, Prabhakar,

Thanks for the review.

On Sun, Feb 23, 2025 at 09:11:47PM +0000, Lad, Prabhakar wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Fri, Feb 21, 2025 at 4:04 PM Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> >
> > Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
> > SoC.
> >
> > The CSI-2 block on the RZ/G3E SoC is identical to one found on the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> As pointed by Laurent, with below added to resets description,
> 
> - description:
>       CRU_CMN_RSTB reset terminal (except for RZ/V2H(P) and RZ/G3E) or
>       D-PHY reset (for RZ/V2H(P) and RZ/G3E).
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Will apply this in v3.
Thanks.


Regards,
Tommaso

> 
> Cheers,
> Prabhakar
> 
> 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > index 1d7784e8af16..9b7ed86ef14b 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > @@ -24,6 +24,9 @@ properties:
> >                - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> >                - renesas,r9a07g054-csi2 # RZ/V2L
> >            - const: renesas,rzg2l-csi2
> > +      - items:
> > +          - const: renesas,r9a09g047-csi2 # RZ/G3E
> > +          - const: renesas,r9a09g057-csi2
> >        - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> >
> >    reg:
> > --
> > 2.34.1
> >
> >

