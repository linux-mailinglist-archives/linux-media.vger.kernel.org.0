Return-Path: <linux-media+bounces-45764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858ABC13AA1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2ABF188845F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263D62DE1E4;
	Tue, 28 Oct 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pm7sVcOb"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F752DC76C;
	Tue, 28 Oct 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642065; cv=fail; b=UWlrZm1Uy8BC3wlrY4XyXAE3gHj4yH/kHkvwZlHMQQbWgktKb2y1HZP4LeakStFNwajkXPUwWoYCiBVr6dTr2+VDaLZcmygAimuYbcA+z+vq0ZxCLzpcTINEOmECH5iNQLW1MHHacmchLFA/woSq5BNBxtQpQWMieQKFHuHYmU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642065; c=relaxed/simple;
	bh=4SCvBT/MyBoIgfeNp8+rFJ9+lINKBaogSDpQ1T6DzgU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oo6FZ3WUIL5DrbODBLsS8ZRoWhzQE+zRm6yyRzzZ/M4VWXfid1X8dSbil35qS+zxPRrF/qTEzflXCoGi85ckp6XnqBWnwVrt/SrhqFcn0L9ee4tgEHFNUvQkVeAtLHcCBUf4NOWLx4q9ZQYW9ril3jvCBHrdOwxx+6wqWF8a2Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pm7sVcOb; arc=fail smtp.client-ip=52.101.53.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3bltG5Yo7sfTjEt60tprHOATDnkHzne5cGu0aRLXqhtwiugJ7/vbllgY4j5t4sBfMZi00QIh3K5gWdFSYbhHcVoL8RjHZzn3tLo+H125YNVWD/jnUfJOWNHc8us421ScZIfJ6FftQxgsjyrWWa4WoO9iRuyvREJDpkOYmhXxgs2C6CuBk79k5rlF0TzCkv2oQWQ7F4pOI3RruISSC6jJdo/gYZM73LDrVQoxzU7nvcvgejBkmb/sQJpXCULInXm1RIo+yZS6gXuNtBGUL4epLoIhRZDyBlwLoO+KMk2+lxHkNVQoYGkwxqtj5s4H6n9CZ3ylrkeAsbr+CNLelQ67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUCBQmD78Hg5LqrL/zAYwejN6WKS7PXRPCmgpYqrGLU=;
 b=R/SGmvS5QZI/E7npcZX22XOdxIl0yGHaeFhbTvxlVJ6oXrLyeDmhCSZZhnq6XIW4WCtAENzqRiq4J++uOvzKnS8hTP+al7N9vX5UBOE9kqeGGfXk9cREjRgNxbNeJJk8vQli7zPDw0FDJWn9sT+66QbWYxTbJMUgc7qoQaSqmJd7ZU+9dvp9EtB7qGBIOEXFb2P+QhJYPFw7GS/y6ECEiz+TenN+mVlmX1/OJWJ59RxgYaSltQKXkrK1OhomviRsaXsNjvRYdAjx8NOoQvAGDzR3ITeguqmEgk/V7SxBpaEK+BgmsJWrEXfIbTDwP3SH/3phpnjE9npNJKR/+5O6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUCBQmD78Hg5LqrL/zAYwejN6WKS7PXRPCmgpYqrGLU=;
 b=Pm7sVcObYEMvwAN06wgcDrBUIdBPWpUthVrjQTl6xK8AsJxl92yOEftvU7bWJ6DQaZYz072YMBMSFSruFIH6L19VH8CwcOYHZOaH5ZxFAvrczuFm2LtK/4P230VkrxCs4/wYbWq8jJbND5uGRONnDkfhCUesY1eg4gbcXYy0o60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 09:00:59 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 09:00:59 +0000
Message-ID: <7b20fb08-fa96-4bd9-8240-05b7f8f31681@amd.com>
Date: Tue, 28 Oct 2025 17:00:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251024090643.271883-1-Bin.Du@amd.com>
 <20251024090643.271883-2-Bin.Du@amd.com>
 <93233d51-5ff3-4f10-96f6-a2957325f1bd@kernel.org>
 <2c7ee056-546c-4891-abfc-c1d41e2c1632@amd.com>
 <3194b3d3-5158-472f-9c68-0b0187e2c145@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <3194b3d3-5158-472f-9c68-0b0187e2c145@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0070.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::13) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa4a1f8-53f3-4eac-b8ef-08de16008374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHBZTSsrdjdkTXdhNSthckc1ZXJnZUFsYm1rZzlJQ0N3WnFGcE5tUXZzVnNZ?=
 =?utf-8?B?cllDdHpjQXJsMEp2UldpdC95anM2eE9CRk9VVHZKOU1ET0x2MkFKalZkUW53?=
 =?utf-8?B?cWFVMXdVek9rYkdyMnJmU2RkMnBKVVdRRldLZWlNRWtSSW5FV29EeWJ3bUlt?=
 =?utf-8?B?UlRld3BReVErZGFUVGpZaDVwdzN6MWp5RnQ0MHlLYWREV2JYdGY5QkVBbDQw?=
 =?utf-8?B?ZGU5Q0pBQkhCWHFFOGNBRVV1ZWo0ZDFvY2NHeHR0dzRuMGNhL1g5enFxT2NX?=
 =?utf-8?B?TmFsMVg4TUpYT0hEY09rTTFrMWxraGdtT05QS1VCTnRYY1R3dGFXYkFUWVg2?=
 =?utf-8?B?TG5ydnZBQ1EyZnFzMVNYZ2VZeHVGaTdoRDJqOCtab0dmQnZyeWtiUDEvcXBl?=
 =?utf-8?B?cFJhTlRqY3ZxcTFSa2VWY1FrWTV0dnVoM0tvaDhOME93WlZyMlFST3hjazFM?=
 =?utf-8?B?LzF5Tnc2NHJLemErK2J2anlyWGxPSGx5S0VsWFBDZmdLSmNzS1Mrc3JUdWIx?=
 =?utf-8?B?WlRWbzQ5SFRqM1Z4QmgwL2tuSVp2NFNPenFjZG9wQ3dNdnh1T3VxNk93cjJB?=
 =?utf-8?B?cUxlNlowbG9uYmZ1OTVmaGRqZk9vQUpxbjVQUjFGeXJHMlF1WmxzUWZGbGo4?=
 =?utf-8?B?T3N2OVdsODFkNXpjazlCQWJWaHIzd1pidWJwMXcrYStxRVJMQ2F4VDRIU3JW?=
 =?utf-8?B?bG5PV1VHNGQwd0l6RkpKbWFCQkpxTEl4WFRSN3RZNGkxK2Z6RzljK2t2a2FP?=
 =?utf-8?B?bnJLY3NXNHZCN1A0ekRKVnZnZ3UvNE1pNDdhajNMOW9vdE5rZ0E2S1Fqc0Fi?=
 =?utf-8?B?ZWU3U1FUWUNtNWZxb1pucnRWZEVDVXhZWkFhVkxsTXNHNDcyVG1qOUtha3Vn?=
 =?utf-8?B?UEp5M3I1cXZpWHNTMEFMVEZkTXIyWm01aFQ1dkVwRXd6blNpTVgxME5GTjlF?=
 =?utf-8?B?ODl1SE9QTHU4d3NVU0tMK1MzdkxNR2wrR3hTTGptL2dDeTUwNDRCa3BvenRZ?=
 =?utf-8?B?RmVXUlJnNFBReTFqay9PZVNYQ2VmYVhpclBIbG5NbVdUanozcFBiQUQ3bVpI?=
 =?utf-8?B?eWQ4cytubzV4dG9wSHFyZ2JjaUx4eUFqbGZNaW4zUWNpTXhJdGw1K3Z0ZGxV?=
 =?utf-8?B?a0ltZDI1Tm9iY1lZRjJ0UTdoU3BZY0FTOW1pN0hVbFlkUUxzZmRhaGtCUzB2?=
 =?utf-8?B?eWh3Q0tXSm1RNGpRRGMyVVFSd1NUcmxRRmIzU3BzR3RRVU91SjAwNW43Znhu?=
 =?utf-8?B?b3I2SzczaU45RmF0QXl4djlJYmRqWHUxd0RVS2RaMW5JNUJXWXF6UXdPVDU4?=
 =?utf-8?B?Yk9Oam9aYS9ySjhDSGlZS29PME5yZHdwWnpVY3ZpNDFxa1I3SDl3SXc2K2VW?=
 =?utf-8?B?enh3b1ZtQWNMdXBaY3Uza3hsTlc1Um5rblVwZUdmWXdjMisxcFJNVUdXcjFX?=
 =?utf-8?B?UXNYMitUaFBKTE44SGdmdGZyZE54OWU2d04yNkZJeWYvQW9nZDhTaUxsOEta?=
 =?utf-8?B?WWV0eWl3YlpGaWF5MFpYcGtWMWl6NjU5YWkvV1NPTTlWb1IvNjJWRkJWMWhZ?=
 =?utf-8?B?ODAzKzVDQXFOMXFJYktFb2xMcWJ5SzNqSmNWT05lWjlyL1NKQ3dwWWphbUli?=
 =?utf-8?B?WXJrTlVQY0JrOGY0VWtjaFhiMnRGRi9GdnlvRngvUHc5Y0Fsamo4WXFWVy90?=
 =?utf-8?B?U1h2Ykg4K3FZcVVwclJoOTB5Q0hqanplUFpKbEV2aHorWDVzZjNRQmJ4NnFN?=
 =?utf-8?B?c09YclNsckxRSVBqbk5MRlNiNnJZZWUxTmdvV3FlMjdCOGNYZEFKZWZQMmJj?=
 =?utf-8?B?UVErYlJDSWh5ZnU5bU9TMEErcUcyRkg5eS9QOXdiWmpRckJlL1VQSXR0dmQr?=
 =?utf-8?B?VU9GWVFDQnlkd2ZLcTZ1OHNxckhRRjB3c2NlbVVYMXIwdVlxMk9PdUdGeUdL?=
 =?utf-8?B?UVh3MjRaSUdBSFFHREpXbERaTGNkb0FjMXdIZitES0lyWmxQb2JzU0NqQmds?=
 =?utf-8?Q?kk/Z6nd64Zu7XLSJtxz8+/qBNlpNXM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE82QWVUZ0lJZ3FoV241VFQyL1NFRnJUSE1YYmlJd3hXL21pSzRqWUxNbVc4?=
 =?utf-8?B?R0Y0QXBodFFpaG1rOC9iODlDdm1FR1lFR2IvOWpEdXcvelg4TzdRNlcyc29z?=
 =?utf-8?B?OTRNT25TZVlwZUlVek9yNVdWdzdiRGRWVmtsN2J6bzZuUCtkUmJvTHBRdUQr?=
 =?utf-8?B?MDRTMk9KUkxnbjBBc1ZiQWg2SC9FTnIwUTFHaExnNWEvR2RycHVOWkFBcWp4?=
 =?utf-8?B?a3MwWXU4WVlrbS9PblRLcUJLajNlb054b090aHJLbnRiSVMxWDZudnRzaDQ2?=
 =?utf-8?B?UVZ0VnBBUlZiRFpXbkVFUDhTdk9FV1pXZWptVUFrWDg3eGpGdjBqMWlCS0d6?=
 =?utf-8?B?OTdUMDExSW5rWXZ2ZmtWOHpUbitLZDRlM1htcmg0czQ2encwR3BnMjhobDNO?=
 =?utf-8?B?RWZkNzJkQzFGVmM1WWlFbnE2QVpSVjZUTS9YWlV2cXA1Q2FHai9QZmVBakZE?=
 =?utf-8?B?YkN2ZlFGa1hSYjErZ3VJVVlTdkFRRUwyT2JoclNYVllHdUl2dnpLSlk2Zy9L?=
 =?utf-8?B?aW9Na2I4d2R1WTRKRnVZSGhTRDM2R0hTSjc2Wkkwd0Naa3k5V2w3K2pUNGpT?=
 =?utf-8?B?bTFUL0t2Z1ppTnl2eHd6SW41WFI1U0ZoMkJUa0o2VTFSbWRER2laSkFxQXZk?=
 =?utf-8?B?TUJ1c1N4aFRQb1BUb2puU1JZaTVlWFkvMzV5WERIU2UyWlZrazBDeG1UVkRP?=
 =?utf-8?B?L0tqSk1UaUZnTUdybnVjSm9Gamc0bGJtU3pOUytGYWNFazRvZzN0RldMNzhy?=
 =?utf-8?B?UE1NQ0lSbkw3RWhMQzNzV0F6OEdNbmx1dHZ3OXprcjJMbjVlcmo4Q08rVnN5?=
 =?utf-8?B?MDRWNHVlUE1CS3dTWlA1VkhETXVLUWFnNE92dTZlRE5oUFhLQTI4bU55cVVB?=
 =?utf-8?B?Q2pVczI5L1dJeWlCd3FVTUluV3FWZFFqbDlhb1JyUWRHK0dpcmdnNzk0VEVH?=
 =?utf-8?B?dDVscG4rVzRzcGVCRDZEWUY1NFFRcWtaM3RTODlHbXhFM3lITTJLeVl1ZG9p?=
 =?utf-8?B?cEdvSFQ4NE4wRWg0MHlCa2hWZ1VNc2lpVlc2SmVpcitJempOalZzQk5SMTln?=
 =?utf-8?B?cVlHYlpSUFdCb2pqOWR3amZnemhESExtNTVkbHZwSW1GemgvSTJ3cnkrZ1Bs?=
 =?utf-8?B?RmFhd1lJdXF0U0k4dE8xV3phWEszeEc3aW4zSXhaRE9BZ1BFQTUrbDlEMjFJ?=
 =?utf-8?B?d3dMOWRON0NFVTZpT1FOUkhSRjFSWXk0OU03YUtlQ1JlR0cwUkFjTUY2dGlv?=
 =?utf-8?B?Q1c3WTc0UjBybTdtT0dOcG9aWTArYXhPejFRMkhEZTQrREtwVTBJcEtXVE1u?=
 =?utf-8?B?a1QxeTl4Z3o2U3l3MllJR3ZiREhlNW9xYmFGL3B2UmhZVndaSm5HejROWXlk?=
 =?utf-8?B?Vkp5cURIOGZueGNIeDN5S0xXZS9QcklGN25GbC9uRXB2K0h1R2kwRi91c01H?=
 =?utf-8?B?emdueE5MNktyV1FCS1RDc3Z2SW1XckxXZWtRVFRGU1RJZzZQbzZCenNHZjhZ?=
 =?utf-8?B?Vjh1VmNLWGUxdmJTcWpIcUp4K3VIM01EME5ub3FGek9kVDV2TFY4bDJ6QUFv?=
 =?utf-8?B?U1JCTWdVYXpRS1NzYldUYkNTN1ZBalZETDNHNGtaYXFLTkV3K3dCU2VDazFB?=
 =?utf-8?B?TXFGYnBNa2YvSnMwTXpmby9tU1I2NS9vWHZCSFYvNHQ5TGszU2xpYkoxVHda?=
 =?utf-8?B?eTRSUkltN1hSU2RKdi96THFOOFRVbUhZaGpCNTZrcXJGWUtpVUhPTVJJa2Uz?=
 =?utf-8?B?ektMcy9rTEdJbHFkTFh3bnVqU1NEb0lOQWR1N3hRRGtZa1lMTHNOWlczWE9u?=
 =?utf-8?B?ZVhEamxlNldHcXIyR1oxTXZvNHk3dDNqdThURHh4UExMQ2pOeXdGUFFwcjFB?=
 =?utf-8?B?Lzg2cEo2ejNXa1QyT1RJSG54K3EvVnozOHptbWV1Qm5oYkdiZlR5dFUrMUpD?=
 =?utf-8?B?TnZ4cVNTdG5DRDBwK2d5dmhydkFoeFFRZDd2RGRVbGdkcmdJaWNwd25UTHUw?=
 =?utf-8?B?eWZOWko2L2FUTDJDRVNuTUFqN0JSMTBvU2NRYlZ1SkY4Vys2UHVLUWgvc0Jj?=
 =?utf-8?B?UGhDRUU2YXJkTmxsOGhhVHNPL0xSbkJ5WWRKOTlaQktvZy9VUlRaQkhBZUhF?=
 =?utf-8?Q?NyW0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa4a1f8-53f3-4eac-b8ef-08de16008374
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:59.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXg4cWaIhmt/q/7cC3LVXCQlQoHWrH9+VrGsCVxm/JBKvPuyViRMz6+1i++Uqsll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780

Thanks Krzysztof.

On 10/28/2025 4:41 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 09:30, Du, Bin wrote:
>>>> +	}
>>>> +};
>>>> +
>>>> +module_platform_driver(isp4_capture_drv);
>>>> +
>>>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>>>
>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>> usually it means your device ID table is wrong (e.g. misses either
>>> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
>>> for incomplete ID table.
>>>
>>
>> Thanks for the clarification, yes, MODULE_ALIAS() does not apply in our
>> case and should be removed.
> 
> 
> You don't have ID table, so probably this should be fixed, unless it is
> instantiated by some other driver, e.g. as MFD. That's the only typical
> use case for alias in the drivers.
> 

Yes, our device is a MFD, so alias works for it, as alternative, we can 
add module device table, it should work either, could you please 
indicate your preferred option?

> Best regards,
> Krzysztof

-- 
Regards,
Bin


