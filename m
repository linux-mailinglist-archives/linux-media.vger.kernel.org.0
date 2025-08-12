Return-Path: <linux-media+bounces-39481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34AB21A46
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B911A25794
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 01:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB37B2D94B0;
	Tue, 12 Aug 2025 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hIrrrJ5L"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB52D780D;
	Tue, 12 Aug 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754962586; cv=fail; b=SXbi09LtDw5PZ7iEVHGW3RxNUIFoYDgEOvjtJxGO0291X+SeN/PLR5STLHhDEqy05vpgdrc2MgiPl3F9idrd30JNcOYrplmM35gecPJ70k8sGcTI8aDE6xGi7f/DI7kD9wv4r66uqfmpWSFlJHaDAQg2e6TfEZqs5nNsT362gtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754962586; c=relaxed/simple;
	bh=kCYtddKnt8UFOjg0JlaxMPv0bA0yifDTrNGwC2Xeujs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hO6k7DUe9f82EcVyNNY5bktBeXqTaRX3+HfIYIUGL03QF8UGSmavrsT+hMHQPHo3FOPCwea2Sjimiub4Fk3K5U4LOko0k1pYoYsLikS4rzbB3SLiKzfe9GBXm9vCJytP7Y/X3aMsMC+foRLFJtIoALQwurv8il/eMq0SFtGvunU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hIrrrJ5L; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVUk4bV43H7ARfaPdn4Oo5D0iTQ4xhvYW9SU/qxoi7vtBHaiRWedboIg1EM0FxvbNy0RD5r94Ra5XTtm7t3VmIxZEZvsD3cKXqnQwwE1INtYrTqj9Vz6OgFxh1te+PgrJHffGWRE+wN62DGeK1F5dY8Z9Y59roasxn/UAJ1Y6AjYv26VNd63ezBXa4yqD1SVh1XO6sCyHvxuaBL6YEcfPFO175NDEtDD1/Kz9wg/DAQCR4Sk6oJvUJEK2/vxO7F72S1PmnpWe6QWw2Vi/jkUlPgzBxWClj08qIfn5ZbdKrtcVq77CXr5J3XnUywVIxyxoBydhVWUqSitbqu6QF2NiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntaR75wGtQGVFkNMHLnfELhztU95NVMmiKdeqEdKRgI=;
 b=CLflYk6I2+Fgi8eiNvb/YXla0QsEZm8vuCvbW2yHTRXcfB+Wy4rIAWIiEHSwe0yRsXc5o5zL8BCYbaDM/fiWryevikTdoh/1dR7S4OdFstfhHT97vT27CBvS6+uudsZll5LYcmaTCyJ9wX8XvvB5KfIfCNK60D9mKZ1zRyXI+kcxTa9EyBeX01FG3qBnFRZgVwgGdTEXCAbvqCBJCjLrnkiuPZcu6LI4D/nMBYBa0Gr40IRY9UQ+TE0JRydgzDV8ju0Dwf7YQPLvf1qZGrioJU8JBH1Mc0aXwJoUFjR20sIlO4STIR5v1JHllgG5YPutiAsfSx61BW/n2GqKetY4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntaR75wGtQGVFkNMHLnfELhztU95NVMmiKdeqEdKRgI=;
 b=hIrrrJ5L7glF5M+VjIZ8UTHMNiJO+cKidKO8qkCE8UT/3fc3Py6p6eV0HcNyne6su9e5yMR2BUhkhEcgL6sfR2XZJ1srI4wLEEW2ZtbEuq1Q48bM5BHGVFxTpjL5meuhkJfXtqpfQ1OP3PXYn/QkeQ/AKTeJr33d4LbdOn9xY5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Tue, 12 Aug
 2025 01:36:21 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 01:36:15 +0000
Message-ID: <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
Date: Tue, 12 Aug 2025 09:36:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250805113719.GF24627@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: 1960e476-5262-41ff-9af8-08ddd940a033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlBqeGR5YXV3TkZvNzFSOTM1UWN1dE1kakQvVVpxTFFVamxPKzVxWHJpRm9X?=
 =?utf-8?B?TGp2Qm54ZkVrbGE2T0Q5dVhpYzBlY0MrOENWakJFTFRnaTJaNE5ycVRBOG80?=
 =?utf-8?B?NkpRbmY4UjBzMDBHY2MwckxzOVF2U3BaOUNqU0IraGNoWHMvQko2eDE4WWh4?=
 =?utf-8?B?ZTRSVEpyQVkrMUg1bnAvUjNpUzA5VWl2WjVPeUYvRkNTdmhhYkV1VzVLRWI3?=
 =?utf-8?B?TkZZZGF6Z0JJL2pxTkpLMUpRSHQxbHlVb042VFBLZVNzcUpyQkVhMFptbmpy?=
 =?utf-8?B?RE1rRk1xenB2YzZaTk9VcG1JKzZBMWFlM0xtZ2NZU016YnQ3WlhhUFJYclRp?=
 =?utf-8?B?NHZZSEZFa2pwV1NWSW9nRjdXNEZaZjhQaTVOVWx5c09lSzdnbDVwUWhxVGk4?=
 =?utf-8?B?bXo3TzRqU1BKL0lrdDFDcWNwWGYxZzVzdEM0NllqZktFY2hlU0VYVWtidmZy?=
 =?utf-8?B?TmVxZ0dTRmFLT2ovN25iMDU2UDdERWtaSHJzWmJ6NzJoZ3dLMGxlcURkM21l?=
 =?utf-8?B?VnVNbSs4QWV5SlBTUC8xRDR1anMwb0VnS3luZ1B6cDZLRzRvSDFQWXhLU3Rj?=
 =?utf-8?B?Wnd5QTFHdmhwaTB3WFczNzlNMVVtUzRzeW8rbmJzdDJnbmcrRG5rY05SeFg1?=
 =?utf-8?B?NDZncFBtc2VWQ2NrbVhsWVEzZU8wS0xORHphU0tJRVFoQmR1enlrSWt4a0wy?=
 =?utf-8?B?ZHM3SmdwNUZ2V044UHdkbDk1QVFlMzJERTI3VUtqZ2syZlpTekg1cWNMdG94?=
 =?utf-8?B?di82ZDl5Wm5iVHUxdkYwVTZwOGZzS3p4RHF4SHJjN1BabDNnT2FtSjdRVjB2?=
 =?utf-8?B?Tm5rQVFSd1RTak9jR0lLOGM3VGtCQTdnUG5KK1JIVGIwQ2JGZjh5WUMyRmxs?=
 =?utf-8?B?d2Juc2pMMnJSOXpGY3RHR0lCMkE2UEV2WitySFRGTGVYUUxkTDJoRGoxUXF6?=
 =?utf-8?B?bWVUL0tVcVBKRGdkNEg0TmpDS1JaRm5maXdYN2grZW84aWE0Z3VnV3hITHdR?=
 =?utf-8?B?S0Vlc1l6VjJqRFh3S1FYSTZhZVVWT1Z4ZUwxZ0hIcHhEMzM4eDVxN2ZVR0Vz?=
 =?utf-8?B?SE8yUmQwQk11akFnUXEwWWVabjdZNm5aSzZXNFN0L1FvN1FLVXc2enVGU1Q3?=
 =?utf-8?B?RDJQaVUyanU5UWZHMWJpbXVYRzFLWjJXV0NIT2RVYkhqV25HZ2VBM2JqVVlh?=
 =?utf-8?B?anlHMituOVZQK1RlYlJjMERFTlZablpGQ25rcVEzVGJSNGRGSDRZU3BHQ3ZF?=
 =?utf-8?B?bE5jOEIyaURRZjNqNkdFVTR4MWh4UldqK2FFaHdEWFk1bHo1NkNqU0J3TDRs?=
 =?utf-8?B?OFFkSE9HTnA5cHU0YW5PZGtVZmo2QUhYMlF1UCtLVXI4SERzejU1SS8yaUFN?=
 =?utf-8?B?Z254WHhtOW1BVVBRQ2g4TjlvSzF0NjIvTVpVMFJML29IRjV2QnpYZTZVNks3?=
 =?utf-8?B?bFpacjIrMk8weXV2MnVNNEg5SUZCUy8xK2NLdnA4QzhZdFJIbjFDdkF3dUhJ?=
 =?utf-8?B?MU9pQVRGM3pZWGp0cnhaRGxDTTlYTzE2ME9LODJzOEhzVzlFN3NVV2hHaDAz?=
 =?utf-8?B?R1U2ZWVZYUhDRUxTeDJ0MVNPRDRvQnBNeEFneEFRWkJhQlJjdFRpMDdjczVW?=
 =?utf-8?B?MjRaOFhtcUNXQlRWd2l5N1lrdXFvbi9lNVoxdGZGTXl6NTB0WkdVNXNwcEtl?=
 =?utf-8?B?UUJDTUg4eE5lcytyTmpLU0ZaMURPbmZ0RStJWm93OFhjeDlncFE2bXJiZ29v?=
 =?utf-8?B?STNnOGhGZld5TFY2WTJhaHlEYkFpeklrWk9zMGw3bTdSa1RQR2FNb3NXWVEr?=
 =?utf-8?B?UktBUjVSNnZzUkJxam52VmdtdTdpSTJyK1VUc2NhaTRZMUUxaEkrbFhtUkRR?=
 =?utf-8?B?VXZid1dRNHNTWnlaT0JtUm44T050d2hRVmVZWEhwbkQ1M0YyNU80TUI0Znc3?=
 =?utf-8?Q?iwwwfZuaZfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHRWWTczNDZnOXltWlhDU1A1RTZyTXZ0ZGJod21iT0d5YnltYnNBb2Zkd2dj?=
 =?utf-8?B?dzJTN3RUOFd5Z2xjQWVmbE5pS1h5c2szanFTNFRDMnlraGxwblY0QU5HOE1Y?=
 =?utf-8?B?bVYxQXlyUXJ4Sk5EVmFlaGx4REZnQWVSWkIzMEpoK24yQ2granBoRkl3azFD?=
 =?utf-8?B?bE5ZcWVQL2ZxMWJab2pVTWwxY1ArS3o2bVAxdXh4VDIrZFozbXVkSUJGMzRS?=
 =?utf-8?B?QUt0Tkp2aW1zaHNaeTE2Qjg0ek9aampQdkhzM0pqbGdLeTJhOXRSLzdWVVNZ?=
 =?utf-8?B?emxwSitZdEx0bXJCWVZhYmo3R1JVeGxNNWJITmRqL256cFlBNW1ac3VTQ1ll?=
 =?utf-8?B?UGJReDhkSGsxcnVoQVBMNGtaUGx2NzQ3c3hhejd1Z0c1NkxoK1MzSnRqSktk?=
 =?utf-8?B?c0NqM212bDBDTEVqVUpDRlovSHBJQVJiYkYxU1JFNWpsS1lhUXFFNUdQT2JD?=
 =?utf-8?B?akJ3OEVsVlpFQk8ydkJvdUh5eDkyWXRDVnNkOHk3T0RsQm9QR3FCV0dUanA5?=
 =?utf-8?B?VWZKV3hwS0NwWEhpWFVwbUF4ZE8rWHcwcjl6Qk1vV0lFZ0lQcFJYVFhlaTlM?=
 =?utf-8?B?L3A2ZVJzaHVnZHdCYXM3OENiOEV1LzVaV0lQNkxuL01IOGpVYlJ2MncvYWRq?=
 =?utf-8?B?V0J5VXV0aEdkb3N6aTRnRTJ3b0pPRUlhK2tPUlhmTUxpUmpPbXFRWitmQzhN?=
 =?utf-8?B?U3BydGVVY3ZTNm5vY3B3MTZ6VFY5NmcrRXhIMml1d2lRZGlPeEh1STlYSlNV?=
 =?utf-8?B?S21EUitua3hPQ1lOYk1vSkFybXVacm5IZmJhQ2MvRjUvVU05NzNLRjVRdlI4?=
 =?utf-8?B?QzNSZUpuTDdXUk9yTXU4a1h5VTFhY0NNQ0xkeUVIWGRxR2VZMTFHLy81RUVp?=
 =?utf-8?B?WU0ySEJEM09NQ2VaWU81eFk4UG02YW1Pckg4UVRUUWJQSHNuM3pKV3p3M1pB?=
 =?utf-8?B?ekNhYjhyckYvcWxwOFBWNXhhUGVHSjQwVFBxNmdvV0hsWWRSa05HMm1hdERM?=
 =?utf-8?B?NW9OWnl4c2FHTENKRU82SFlnVjFkNis3QUVPOU4xcUllSzNwZnJnd0pQTHFu?=
 =?utf-8?B?QXgzTHhhWW5nOCttbW1yenNPbmVWZVdMY2RlMFBWRWVlZHdaZC9WaVRnK2x0?=
 =?utf-8?B?MGcvZ2s1YVlvYkNsMlMxRUhSWSsvaFdtdnR5aFFXQ28xK2grRWFTNUpwM3g0?=
 =?utf-8?B?a2hhZHFOMWhBZGFreUQ1NG9PMldhTDVtMkVjWkdjK2E2T3FNTGRYaGJQWmUr?=
 =?utf-8?B?VW9hOEJ5MGg5Q1Y1a0poOUdBbTM1RzVvNlVNZGk4akkyTjkzZWtzdURROXpE?=
 =?utf-8?B?eEczTmROL1l1dURmZThROEtaM0JmcHpSV28vcmU1U2JJbnVEL2N3Yi9TZkxT?=
 =?utf-8?B?dXY5MGI2TnFOemVFai9OUzRqK0dYckZ1eDFpck5mZmIvODduZUxJc080cXFp?=
 =?utf-8?B?U3ROaGNxaHJMa2RTWWV3M0NVMlBiWDVmTUN0cmNMZTFJc3RoaFlsUk9EKzhC?=
 =?utf-8?B?Wmd1WTRMbEE0SmZHVHpRd0xqWlFvWk5sSCtxcnFiV2RxY1dYUGVkUUJ4SE1l?=
 =?utf-8?B?VHJIVGpKNlZmdnRiUElSeEJtU3dZdEJkaUVOMXhFN1Q4TGZiblpmRkJ3dWpT?=
 =?utf-8?B?OWJucFhBM0JWMHZ2TzFTUDAzTXFOOEE5aU8yMHlKanFUSVhudUhyajlHYUZ6?=
 =?utf-8?B?N3B0WEVpendHUTBsVDR0U2w3Ryt1WmZLR3FOazk0MTRMQTk5eFZqMjBWdXR4?=
 =?utf-8?B?VUduTTVvcnJOc1VyN0dsOU1VSEZJbnhKaUxiYzQxMWVkRGhDc2Y2VWZZcDM1?=
 =?utf-8?B?b21GcmZqdGVVT2lkWS9OdGRIb3BxVUxPR21jUmE3bHZmcGRrRkdzMWNraWRR?=
 =?utf-8?B?OXBJRlNCUkJQT2xNQVdjYTZyU3Z6TmUzblB4djYvMVQ0bXcxOFJucVpLdEtq?=
 =?utf-8?B?N29pbzh6bW5IRDRkTXZxVDg0enROWmk5Y3AyQ1Qvajh4NlZqYlFFb2pUNGxD?=
 =?utf-8?B?SkdRK0xNTnlmY2tsdFE4Q1ViUG5uY1FOVUZ6L2VBS2ptVlY1UzFlaWRLa04z?=
 =?utf-8?B?cmIvVnM3MnpuK1JidklVSnBOSUgzd2s5TURQbGF2UG1Ubld2Y3FQa2ZJVlFZ?=
 =?utf-8?Q?KgRE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1960e476-5262-41ff-9af8-08ddd940a033
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 01:36:14.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG6/NXUa/sQfhaczoTh7xrxAoLGsQN/x4SMDwmLpRw33AQpq+3EKy166ZzfcEaMZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8

Many thanks Laurent Pinchart for the review.

On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
> On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
>> Add documentation for AMD isp 4 and describe the main components
>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> ---
>>   Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
>>   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>   MAINTAINERS                                   |  2 +
>>   3 files changed, 74 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>
>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
>> new file mode 100644
>> index 000000000000..417b15af689a
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>> @@ -0,0 +1,64 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: <isonum.txt>
>> +
>> +====================================
>> +AMD Image Signal Processor (amdisp4)
>> +====================================
>> +
>> +Introduction
>> +============
>> +
>> +This file documents the driver for the AMD ISP4 that is part of
>> +AMD Ryzen AI Max 385 SoC.
>> +
>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>> +the Media-Controller API.
>> +
>> +Topology
>> +========
>> +
>> +.. _amdisp4_topology_graph:
>> +
>> +.. kernel-figure:: amdisp4.dot
>> +     :alt:   Diagram of the media pipeline topology
>> +     :align: center
>> +
>> +
>> +
>> +The driver has 1 sub-device:
>> +
>> +- isp: used to resize and process bayer raw frames in to yuv.
>> +
>> +The driver has 1 video device:
>> +
>> +- <capture video device: capture device for retrieving images.
>> +
>> +
>> +  - ISP4 Image Signal Processing Subdevice Node
>> +-----------------------------------------------
>> +
>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>> +provide interface to the user space.
> 
> Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
> subdev, and calls v4l2_device_register_subdev_nodes().
> 

We have exported subdev device to user space during the testing with 
libcamera sample pipeline.

> As far as I understand, the camera is exposed by the firmware with a
> webcam-like interface. We need to better understand your plans with this
> driver. If everything is handled by the firmware, why are the sensor and
> subdev exposed to userspace ? Why can't you expose a single video
> capture device, with a media device, and handle everything behind the
> scene ? I assume there may be more features coming later. Please
> document the plan, we can't provide feedback on the architecture
> otherwise.
> 

Currently, isp fw is controlling the sensor to update just the exposure 
and gain, since the 3A algorithms run on ISP HW rather than on x86. In a 
future version, we plan to introduce raw output support in the ISP 
driver, allowing users to choose between AMD’s 3A running on ISP 
hardware or a custom 3A running on x86. If the user opts for the 
x86-based 3A, the firmware will relinquish control of the sensor, and 
hands over full control to the x86 system.

>> The sub-device is connected to one video node
>> +(isp4_capture) with immutable active link. The isp entity is connected
>> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
>> +also responsible to configure CSI2-2 receiver.
>> +The sub-device processes bayer raw data from the connected sensor and output
>> +them to different YUV formats. The isp also has scaling capabilities.
>> +
>> +  - isp4_capture - Frames Capture Video Node
>> +--------------------------------------------
>> +
>> +Isp4_capture is a capture device to capture frames to memory.
>> +This entity is the DMA engine that write the frames to memory.
>> +The entity is connected to isp4 sub-device.
>> +
>> +Capturing Video Frames Example
>> +==============================
>> +
>> +.. code-block:: bash
>> +
>> +         # set the links
> 
> This seems very under-documented.
> 

Yes, documentation needs to be updated.

>> +
>> +         # start streaming:
>> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
>> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
>> new file mode 100644
>> index 000000000000..a4c2f0cceb30
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4.dot
>> @@ -0,0 +1,8 @@
>> +digraph board {
>> +	rankdir=TB
>> +	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000001:port1 -> n00000004 [style=bold]
>> +	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>> +	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n0000000a:port0 -> n00000001:port0 [style=bold]
>> +}
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 15070afb14b5..e4455bde376f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1113,6 +1113,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>>   L:	linux-media@vger.kernel.org
>>   S:	Maintained
>>   T:	git git://linuxtv.org/media.git
>> +F:	Documentation/admin-guide/media/amdisp4-1.rst
>> +F:	Documentation/admin-guide/media/amdisp4.dot
>>   F:	drivers/media/platform/amd/Kconfig
>>   F:	drivers/media/platform/amd/Makefile
>>   F:	drivers/media/platform/amd/isp4/*
> 


