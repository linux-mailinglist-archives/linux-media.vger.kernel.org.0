Return-Path: <linux-media+bounces-42980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A786B94E2C
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 09:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2C119035E2
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 07:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD501317707;
	Tue, 23 Sep 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wuIOOti0"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C23F317704;
	Tue, 23 Sep 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614212; cv=fail; b=fKEeni15vBKcCGzdhMKqYDijlHDkBMmEC/FUrcZ2sKekeh8TgDOyBqIyAB86O3Xwbpyt7r4jXO8dTAhAIvE/lcojmS8bgM+mvpxpz4hh/djo0zd45AikCYObNFT3hcJAskEN+jLY88qK0mIk1GoLMzkrkTLTXP205qzy/XdO2Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614212; c=relaxed/simple;
	bh=dE6M6Z/2KeR0XT8QTVM49nzjjmMEZDZdA5F7Ze2BX78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tszPLUrLjINQDj+3nK9AfG0iBKSLWN7lNZAMJ0OslYBcZUI9onMIP5bt+JiMMUlbEsifol5QeqtTotV55i5uU1h6horoWZyQz1bIfYm6EYJgs8pmGb5uqwhPdHp1TjmV4EA/rujLLOAocfSSJRDcynP6NvAneZFZdacRTaRIVbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wuIOOti0; arc=fail smtp.client-ip=40.107.200.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQLqo9y1Z4U1HKrAYZlbRaNkTcll3XawhgcMkdkNAtuAJGw5Hd3vUnaBbVI+Mv1BQNf/k7pRn6zfjg1IGPmT+C7jtOUCHCH90oal30Ogs4lMy1qSJtIenxFZ3nL/PFb6kJPFxnpUzEcU3xs66oc2nb2RWct5yvcZx9GMfJ7uLBA8a24HmX/wx9kILS6A0PVLLZzCdcWpEzf2oph7NfG8CYbe7ESkqWV4wZu+Rp4ZRy4X15dh6ylCnD6Jd4f1EI5EOgABrbeJGTRDzpaQvzYEYmWjhfbUs8GAz2uJ/6mR49jgErNL/DUJQggKBQyCIe6EuQrS4dKUK019o4NJztafxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVzrzKwIAHv7LEbZAi+qnRR3zVQd/rBoY/zqp0EbM24=;
 b=KOG+lwNu9rVY3R1cwsesxy3DOUQzy/s8pTlbiWSqTMHirkxa2fqorAC44dXwDQEpCR6sFxFRZBerMJ4aFs9Q+WhKLj8lSgMGDcCqrzB1ydGhLe5zoJOOmOaKRebTfuILwtqXrPB3rEfHLbFZevY+ONIkTsiy/2AkKX6gIZBWVDEB0psQlqf3LVswqwUVrjxPHU2+QbeVf4l6citdfJbJiPT81O7qohAUvlPVX1FNurGNOtr3VX3wRdLKjnf/feS5V+hgtDBeVY/REuLLrSk4jePdPwG0CSXEs+mwIiYQQhCdCfPqtQAv3dFbV9AgMOvWfjlHUhJ2B8B7CdNm0mL5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVzrzKwIAHv7LEbZAi+qnRR3zVQd/rBoY/zqp0EbM24=;
 b=wuIOOti0WU6NKjGTCH0I2BV4BQhN2sPiK8k+DE84Zv8oS1k0XUV3HISK2kNmIMDY2eOICMoVrVNv7w8sY6MOjpfhWK/UNKNWEM9y3FXdU3b0zuDzJfMuJOWC8S5drro3tT9amFcgwEYRQREX7hMW4vm0hqrBeEOC3yYvV26rhtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 07:56:47 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 07:56:47 +0000
Message-ID: <f053331d-1be2-4d51-a99e-7d69f7bb26d3@amd.com>
Date: Tue, 23 Sep 2025 15:56:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-2-Bin.Du@amd.com> <aNBeyf5ivmqXwzbj@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNBeyf5ivmqXwzbj@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d25537e-f179-4748-77eb-08ddfa76bef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qi9mMlU5eU0raUdMa1JQYzdidU9MVlBjMnlHbGwxbmpGSElIaWNTM1JZRzg4?=
 =?utf-8?B?MTFJMmUwTTdNelZsQVdkNnZSWWQ4ZjRmc3hyelJncEZXS3V4QnliOG4wSWRD?=
 =?utf-8?B?OEZuWTd5dU5MT21ONFU3MlB6eWtEVCt0RXlIeDFZam84NW8rMktDdEpGM1Rk?=
 =?utf-8?B?bzF6KzQrVnFBQUMwTlJ5SEZtbk1KbVl0NVJha05sWUhVUTZMYWJrUkJCYmtt?=
 =?utf-8?B?SExycTNzZGR3UHZpK21kaHB6U0p1K3VKWTZrVnUwVFB2cit6WHpyVW82Vktp?=
 =?utf-8?B?NFVZVXlubUdudGFSK3RlSmdEMVBTelVmVE1JOFM5dlNtQjB1TmllbmxZUGto?=
 =?utf-8?B?UVdFVkRZQzRPR0o1Y1lJUCs2dUhwdXlCd2NWYm9BTUpJWVFHVm84RXZET3ND?=
 =?utf-8?B?aW9BaHBKazl5WnNMLzRuWGs4SENKeGRxOXlJOHFKVXRYWllGQVF3ejZWNXY0?=
 =?utf-8?B?Q2t2K05vclpNR2dCbFBpT1NBN0h4dW1PV1Ryd2hLSDdhV1NyQVBENUEwMzlI?=
 =?utf-8?B?dytNd25OaDMyMHNkcmd4aFNRYnZ3MFphQVFZWDF5aW9xY3VhaUs2Vjg1dS9G?=
 =?utf-8?B?N1JVQWZsdXU2TGNzQ2RSSk40QWc4OFlGWC9oOGN0a2FLa2t4MGcwVUoxVFRl?=
 =?utf-8?B?MytzbGlSazBXZG9hMmQwN05aazZiNHhRa3dndzdMcGJwcmhBWnZ5UExadllp?=
 =?utf-8?B?dE9TNXY1NklwT3BXaDZjcE44L2xsSXh1akhmYTlUbmNKdkhXWEMySDd4K3lB?=
 =?utf-8?B?MXdwSERVci94WUozU2Q2VWRVdEFlQlRJcnNwZmd6Y0IzUnJXTmdxdm1PK0xN?=
 =?utf-8?B?Rm5GTlJocXpwVFNkNGNPaytmb0NwelF1cDdlcnplMVNLVHBodlY2K3U2cS92?=
 =?utf-8?B?b2R6cUZPSGVvZmRTRGpVb256VlY1Q2cvMmVCVWV3Tk55MTc2UGx3UHo1SFhR?=
 =?utf-8?B?Qm1xU09ncXBUUStueHhrU09iOTZQaTJJQzRXV1hxUkhISk04Z0RuN1IxUElV?=
 =?utf-8?B?Rm9ZLzJ6bE5FdWUzRDFuL1ZhaHRyeEhNZUpXeXZtZVV1WjZoajBodit4elQ4?=
 =?utf-8?B?SjdxSEpDNERnSUdlbmdhbEJGeGhKZnJGQ00zWmp5YkJXa0UyY3FLbXdoc3dV?=
 =?utf-8?B?VVBwOTFVYzdJdUZFdldqRldOaFdoM1VROWtlWlNkYXlzRzB5Ykhtdm5hR3pv?=
 =?utf-8?B?bVE2MlhsMHc3Y2lkQVY4eFFXRlp4MzB5TXlEekNseXlxSXBNd0xWRFYwaCsy?=
 =?utf-8?B?UTZPckI2Y3AwQW5BSFpjQjBKUFdma1pXMWJKRDJFOGJXenVaZm1QY01iV1Rl?=
 =?utf-8?B?M1ZnM2xZYmpmaW9SVThwM1U4WDQxWjJHRU5paFlrbDhVVnZRQ2xSa2g0UDRy?=
 =?utf-8?B?YWtQM0REdTFjdU5JdU81VHc2TS90d3JqSzY3aENFVU9ZYlJlWUNWMmtyaUNG?=
 =?utf-8?B?ZElhcDhmanFWODgrS2doQXRmb3pvcE4rM2ErazhlRmZIaHpDVWozaVd6cURz?=
 =?utf-8?B?S0xFSUhOR2dZUEdjc0JvbFZoT0dRWjJSbWZoaHRMRGFZTUgxZXM4YytUL09q?=
 =?utf-8?B?WGtFakgxVk9NQUgrU2I0ekVuQnhjV2UwMVJGUEdxdW43VmxVenNET0luazhW?=
 =?utf-8?B?Q2NkSzhiQVZTdGVFRjZjTUFEK0NIeUNobURxSUFLNXFRdzNjY1hOaHNhemto?=
 =?utf-8?B?TW5oZUlXbHdMZitOVGVPZTJub2lydUxyVzBBK0VmZDhOdjZ1OXFQNXVueU1n?=
 =?utf-8?B?WEUrUWhEeW1IQmJ5Y05ON1BpRDRSMzJ5WllpZGx3dHlMZGhhRkRUQUZGN2FF?=
 =?utf-8?B?OWltejNNT1NsY0dHbXV6L2s0eml2OW8yTmdQdjMvU2l2eEJHcEJBYUcrb1hp?=
 =?utf-8?B?elNYUm8zQ3Q4TFYxdlBMbHF6K29saE1Nc0VKSnFROUV1c3BYa3J6S0Y4a0Qw?=
 =?utf-8?Q?S40uBH3rrpY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFvYktaTDJVMGhQbU96Tk5sWkpVUUJqU251eTY4dE42NlVwem5WY1lqVUh3?=
 =?utf-8?B?eGs3OGtCM2pydEIra0RYUWJuemRJMHNPRWpoYlBkMjZWSFk4NkhTbmY2U3dP?=
 =?utf-8?B?TFZTdFgyeDNFSTNWSzBoZ3Z5T3NoeldHZUYvUjc2em1ycDR6UEdjMVY3MTMy?=
 =?utf-8?B?T2N6bDY2a21KY2RKc2Q3TDRQd0JaVjczQmhHcEhRUjVyR0hMSzlyMGpUZWdz?=
 =?utf-8?B?b29kMTdwanJNMUd4TFN2alEreWd0MlUycmlidVhxT2xrTHJ3MldMc0VzR2Yz?=
 =?utf-8?B?S2tnM2dhZWh6S3FBdnVoc09BSEloK2NQb0E0RWtBT2VXenZpNDkxa05kRlJi?=
 =?utf-8?B?cDF6SGhGZnJodWhMdFNjaGtDTlMxcG44R0pUcjNvWndsR0VyYU5YbElFeWpl?=
 =?utf-8?B?R0JENmtncC9Iait4b0R5UWdTQVRGNTRuRGRGY3h4TzlMbGRva0I2NVFpTlE1?=
 =?utf-8?B?VVRzVzF6RHJ6MVZEajRLVURPZytxK0xxaWpmMnBOeXV2eEJ6TDhxTHorWDZu?=
 =?utf-8?B?bzZzNjNwd2FaenNDaWtxZ2NBMTFVSFNmenROR1g4YXBKM2VOUGovc3p3QjRq?=
 =?utf-8?B?bERURk5XOFJSZVJEdGJ4eG83ZG5WYUVwUytTVVhKeDhQUnMvQXd6dElHMkZ5?=
 =?utf-8?B?UUtDM0l5Q1dtSnF3SW02ZHJrUjkrbTNmKzltRllHaElIWkFWWHFlbzB3YUkx?=
 =?utf-8?B?SHZMc0g4eWVvdTBuUzhUU1YxTUpSRDErQmJjU0tQRGdIYmFCVmg4b3h4bHRC?=
 =?utf-8?B?dVNyTDVpYjhoeVF6WkljVU1Zanh2UllFTmpGdGQ1RTBCV29YckxuSm96ZTVa?=
 =?utf-8?B?L01CK21TODluSGo0RDcyWGtDY3k1aXl1emRFaGFOQ3Y4aHJHMERjNWp6bWpq?=
 =?utf-8?B?bi83R00zbEJXWlJlTmNJZEt6SXdVT0tCTHNWRWlRRk9PaHNLdVU3UWc0MHh3?=
 =?utf-8?B?eW5lcUZrSFZ6M1JSV3JVNE1EUXJpV0tqM1VZQnZsMWdHQXkvWVd3dnZQU25L?=
 =?utf-8?B?a2tvaExkRWkvekk4T21jZ1JsWG0xZG9aZGNMb2Npd0doMGQ5NFJoTnlYTEJS?=
 =?utf-8?B?NWVaSjlac0pEU3cvMzVSYUlpeDB5UURpZVBWc1NiaFZMY0RxTzRUN25aaUhY?=
 =?utf-8?B?enppNUxOU1g2bVZmLy93VndBNDVkVXhiUTc0TXBEdVRBUFk5UWRZQkNxSzM4?=
 =?utf-8?B?MG5zZysrN3hmUHJPeUdOWFhSTjFBSEk0RFpvaEtWUlFLcFRzcTg2ZjJ0Y29q?=
 =?utf-8?B?WnJtL0pyaHF1dFhsN25ZRENXUk9KdXlzMmJXZDQ1aS9XZWJKQTY2MDlDbjJx?=
 =?utf-8?B?QTNQczh4K1Vsc0FuSStWRHBXcGJReTk2ci9jYk82M0daOFNIWXVFckJ4ZmdR?=
 =?utf-8?B?NzFUL2RXTi83VmxWbmNtOWVYb29zVndSWkJwMjFUUzFTdXNJcW9nOU85bnJQ?=
 =?utf-8?B?ZExvM0VUWHpRbGU4OGd2eWVZd3AzZjZkTnFZa1B5ZzJyb0JJZWFaNU9rb0lL?=
 =?utf-8?B?S0w1Snovcm1KeVFHTW1pMEpOcFZSc2xtV2xzVEprc3hFdXUvNFJZRURLNEhk?=
 =?utf-8?B?S21aQjN0Sk1LeDA4YnZTeTEvUXFsMG1WWVdHV3RhTDdaa0hJdlZoNWd6V2Y0?=
 =?utf-8?B?ZVRBT0tWY2J0QXNycDFhWWxNVE0yQW5DOXVZRWFPRkZydXJiRkc2dzhwNGNi?=
 =?utf-8?B?UTJDclo4Vi9wREdncDIzQkNnOUsrcHo5UXh6RG5FUlJ5Q29GTnlDOXBNMTJm?=
 =?utf-8?B?cFpzK0orMTBGdnYxOWwvUU9EMWxMV1VYL25lYndDRkpLRFdZQ3IyczZsM2FW?=
 =?utf-8?B?QVV1WHFCWHp3ZjN5NEpvQTRRUEJiL1M2UVR4S1psclphcmREMXVIOE5WaXBa?=
 =?utf-8?B?OVdCVTk4amxwUE50dWlqTkNNaVJ0RGpoQVpkVGFLMkorUG52Y0V4T0xrNXly?=
 =?utf-8?B?Yy9JMk1NSnozVkRURC80U2lmS3dHS0ZQenprWkhFa3N1S3BIRERvcDJVa3I2?=
 =?utf-8?B?ODUvRTlXbDB4YW4yVG0reHNzL3VJdkNZd3Fkd2FZb20rR3BueWNMamluSCtN?=
 =?utf-8?B?TUNvWUhSbDJSVkpZTEFDSEZncnh2VjVHRE5MRHRSNngvQjZISFNpOG50eGM1?=
 =?utf-8?Q?AuU4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d25537e-f179-4748-77eb-08ddfa76bef5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 07:56:47.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZNRFIry75L9U+MMOxM9nFYp7GgPaU5DVF/aRouL2OAUt1emYl8dS7gSlg+izByz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500

Many thanks Sultan for your careful review.

On 9/22/2025 4:23 AM, Sultan Alsawaf wrote:
> Hi Bin,
> 
> On Thu, Sep 11, 2025 at 06:08:41PM +0800, Bin Du wrote:
>> AMD isp4 capture is a v4l2 media device which implements media controller
>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>> interface for now. Also add ISP4 driver related entry info into the
>> MAINTAINERS file
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +config AMD_ISP4
>> +	tristate "AMD ISP4 and camera driver"
>> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API && DRM_AMD_ISP
>> +	select VIDEOBUF2_CORE
>> +	select VIDEOBUF2_V4L2
>> +	select VIDEOBUF2_MEMOPS
> 
> VIDEO_V4L2_SUBDEV_API should be selected rather than set as a dependency, per
> what other drivers do. You can also sort the dependencies to look cleaner.
> 
> Change to:
> 
> 	depends on VIDEO_DEV && DRM_AMD_ISP
> 	select VIDEOBUF2_CORE
> 	select VIDEOBUF2_MEMOPS
> 	select VIDEOBUF2_V4L2
> 	select VIDEO_V4L2_SUBDEV_API
> 

Sure, will change VIDEO_V4L2_SUBDEV_API from depends to select. Had a 
check, yes, you are correct, almost all driver are doing like this with 
only one exception drivers/media/platform/ti/Kconfig

>> +	help
>> +	  This is support for AMD ISP4 and camera subsystem driver.
>> +	  Say Y here to enable the ISP4 and camera device for video capture.
>> +	  To compile this driver as a module, choose M here. The module will
>> +	  be called amd_capture.
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +#define to_isp4_device(dev) \
>> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
> 
> The unnecessary cast on container_of() is removed later in "[PATCH v4 4/7]
> media: platform: amd: isp4 subdev and firmware loading handling added".
> 
> Remove the cast in this patch instead.
> 

Sure, will remove it directly from this patch

>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct isp4_device *isp_dev;
>> +	int i, irq, ret;
>> +
>> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
> 
> s/&pdev->dev/dev/
> 

Sure, will update in the next version.

>> +	if (!isp_dev)
>> +		return -ENOMEM;
>> +
>> +	isp_dev->pdev = pdev;
>> +	dev->init_name = ISP4_DRV_NAME;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +		if (irq < 0)
>> +			return dev_err_probe(dev, -ENODEV,
>> +					     "fail to get irq %d\n",
>> +					     isp4_ringbuf_interrupt_num[i]);
> 
> Return the error from platform_get_irq() here instead of -ENODEV.
> 

Thanks, will update in the next version.

>> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>> +				       "ISP_IRQ", &pdev->dev);
> 
> s/&pdev->dev/dev/
> 

Sure, will update in the next version.

>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +					     irq);
>> +	}
>> +
>> +	/* Link the media device within the v4l2_device */
>> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +	/* Initialize media device */
>> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +		sizeof(isp_dev->mdev.model));
>> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +		 "platform:%s", ISP4_DRV_NAME);
>> +	isp_dev->mdev.dev = &pdev->dev;
> 
> s/&pdev->dev/dev/
> 

Sure, will update in the next version.

>> +	media_device_init(&isp_dev->mdev);
>> +
>> +	/* register v4l2 device */
>> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +		 "AMD-V4L2-ROOT");
>> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
> 
> s/&pdev->dev/dev/
> 

Sure, will update in the next version.

>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "fail register v4l2 device\n");
>> +
>> +	ret = media_device_register(&isp_dev->mdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to register media device %d\n", ret);
>> +		goto err_unreg_v4l2;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, isp_dev);
>> +
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	return 0;
>> +
>> +err_unreg_v4l2:
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +	return dev_err_probe(dev, ret, "isp probe fail\n");
>> +}
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <linux/mutex.h>
> 
> Remove this linux/mutex.h include. It should be moved to isp4_subdev.h instead.
> 

Sure, will update in the next version.

>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/videobuf2-vmalloc.h>
> 
> This media/videobuf2-vmalloc.h include is removed in "[PATCH v4 4/7] media:
> platform: amd: isp4 subdev and firmware loading handling added".
> 
> Remove it in this patch instead.
> 

Sure, will remove it directly from this patch.

>> +
>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> +
>> +struct isp4_device {
>> +	struct v4l2_device v4l2_dev;
>> +	struct media_device mdev;
>> +
>> +	struct platform_device *pdev;
>> +	struct notifier_block i2c_nb;
> 
> i2c_nb is unused, remove it.
> 

Sure, will remove it and other unused fields in this struct.

>> +};
>> +
>> +#endif /* _ISP4_H_ */
>> -- 
>> 2.34.1
>>
> 
> Sultan

-- 
Regards,
Bin


