Return-Path: <linux-media+bounces-20566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3549B5E81
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002BF2840CE
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359C11E2039;
	Wed, 30 Oct 2024 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AKQKszcr"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B121E1C2B;
	Wed, 30 Oct 2024 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730279658; cv=fail; b=ak0Jt6DSwY4IjoBlwFn29tSJkX4VFWRioQ5pqQmZANmKkLSw9M5WM2gRxDMyB0XfSRYC0ZkB+lCvHaNZaRCqK2ruVoOFRzloGFtgDEHS7BgZBsC3YVPi8SIE5S3lnzCpRlQPxb+ruvvMsJaRW/9UL6m1soijXky0jJOH/K4a9ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730279658; c=relaxed/simple;
	bh=RT3zZ2O4IvwbV6RPLgGo9GLdLBZQGqumimcMJCj71EM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hHQE1nt6NfJd/1CPtIi0NrO7zVJhv8mfCk16pL7UiQ1fMkCvq2r4kO3bUo4kVE+wmaJ6AIORaYRNG78I8y3PMVQ+ppzh0xERLwlLwOwiWQutGgtVyapcmf2NwYy6iom1vnFZYtxFmbHHPI4DwpsHqv5KQghKfx5zm/MAiQNeKDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AKQKszcr; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbskGB2ZrN5C6yY7dZSbWKyUTiU31kI+7uInA/f2TbjU46iwaRvXr366LN8AnpUG35pCrvyQlgUm7murEj57sbNg/FwCDj7nlP4qbxlcuDXfpsqSgvI5NDg04ZbhJv1+dEGLLJdRX9K+Od1d7U/iEC1s+qtbR74PGosKsXfzb0Un2FNMNPrrtQ/krd4a8nlJjmSAXdlPgMfyluLS77sPc0wiuPQnX8Q0kVq4mQMNfwumTVkX6mzPFkYHBEIx5IV6O2m8JYoXeTHGBIvprdUZh/gALmLq5HQzzytZBym3zMgYNlp0iUT1MR9q0u/XK+/OhaOr0U2q8Io2GqJ737UbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zonL8mo8XQ0/I1WkoBbRQ1lv13XooAR66wiu8t3cSWs=;
 b=yKkQZaYztO7gBPzyMuDGBd6R1c6Ljax9GgP23Z+It7ceTmDWYg9a94t89QCKG5fcZ/llqAoFwLN1Osp69I+dhrGSCwTiKN8kutsgplwKLhUZFK8yaRGvFi/Cijf/NM0kwsXAHye8LpL4hoo7nZfA5/ZljuenTsa2He2kjGHKtJDpW8MesYPfHNRetzDKE0SIszBMyo7K9eCPA7cQ+LlnMYj9IWO5kTul9LQ8ChyyblT4F2oh42eGmgGj27KukTJJNYS5fOX/Q61PTESpwYM94PHqyUi+Vhwha5/e4ztkn41XPjhpvuvku3Y/Xafj6kce7P8OMgL9cvqzmgO9+DQtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zonL8mo8XQ0/I1WkoBbRQ1lv13XooAR66wiu8t3cSWs=;
 b=AKQKszcrksWXAD0UY1+1UTfvFls8BFJ98+aXJMsRJwxQlkgY9NmCxJnvHj52LriiqO6Q5Wn+XrJSMK1EpHoxQ/exrcxh22guAsSu77d70kzGOGkK/znTQzdohon0wchm1ukC3klDDOmQYbkmub6YDzrTyIIITUjwJnP+n5RZjJ6X46AhGkbOqrk0couwdvywHgY5bGNLEpqXBg8E7NtLF3v9G7lAo2ihxg/wYDwsQD4BVme6sY8ndtXFngVHn/iSffsn4/8dO3Ao2+9NZJ+lM+iTA0xg0ofSHp8Tu6FymPERTdKuwf+tWr9hIazBSYm38zLQad/kfYgryDmuseqO5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 09:14:11 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 09:14:11 +0000
Message-ID: <abf15705-01de-45f1-a869-49f96c9b82b9@oss.nxp.com>
Date: Wed, 30 Oct 2024 17:14:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
 <20241030022134.1098589-5-ming.qian@oss.nxp.com>
 <6b38f07f-f992-4b25-af09-4e106e875994@xs4all.nl>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <6b38f07f-f992-4b25-af09-4e106e875994@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:3:18::35) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de24803-5385-47b9-8ef0-08dcf8c336ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3hCNUhuaENYQ21hUjhOZ2ZnM0FyeFBkM1ZaUjFOdWpEbDJZeWFNSi93WUpJ?=
 =?utf-8?B?c0Q2V28zVE1jUHpEaGxGV2oyZm0zeUlCWmk5NnhORmVFWWZpSGV4RVVqdEFV?=
 =?utf-8?B?cjVIdVZlRmJ2SlVZS0xmZmg0dUtnVzVHOWhoVElzRTAycnBwNVpld2c5Nk8r?=
 =?utf-8?B?MUVjbitQY281L3d1eFIvMHpDNWllWXRPMnV0SFN6RUNyMDVMOEVJY1dhbGdw?=
 =?utf-8?B?ZFhtQ1hFbzUvUUl1Z1NteGhHZ0pVVDFZNVBMYWVVcGI5aWJsTk1jUFlXZ21K?=
 =?utf-8?B?OWRVbndOTU5raXNSblFKUDRaa1FoWnhtcVBlVG9PdkxKd0tPbUNUVyt0bkZw?=
 =?utf-8?B?dlcrZDZtYm42YlNCL0FPNHRpejhxU2l2Y3ZCTHkwWmZtb1RnYVVxNnJCK2FR?=
 =?utf-8?B?TmtxV0kzbGJmSXgwa2dRbkRrem1ocFVqeG55NVFOTDIrdUZzckRCbEdyVWZ1?=
 =?utf-8?B?VGF4Ly9vd3Y2bEU3QjBFUUlzQ2pONzFSN0huMGpSZTNPSGtmeWlOajBUUnVm?=
 =?utf-8?B?WVY1WWQ2Z0J0clBpTDAyL0NnMjhObVM2V016M2hVK1dUZG5UVU1MaFhydThH?=
 =?utf-8?B?VUtySzZzOEx4eDluaEg0VVcvaFkyK2tuamRTcnlmekJ2NGRCa1JqQkRodzBN?=
 =?utf-8?B?N3R1VEkxOVFnK01BVmRIN2FSNGRRdXovSm5RbEdTTTNsSzYyWGhKbmhpcWIx?=
 =?utf-8?B?aFZCeTFkUGZOWFVWMGZFQ2RyUmZqN3dob1RqNnoxRUtCNDhMZGZzZVBPVWpT?=
 =?utf-8?B?UHM0UEdFMU1tck9odW5aYWZwdmhwd2NsQ3FQRGUxK2d5WVk1SFdZbGo3RkJm?=
 =?utf-8?B?S1M4cXg3UzFHdWQvL1pBdUZ6T2VMRnFXRUdiSk5hbVVjMGRKUjlwN2NNMHpM?=
 =?utf-8?B?eExKNmNaRGlMZ1UwMzVnT1FoRzEzV0h1RXYwSTNXcEc0cmhuQVROdlB4d25a?=
 =?utf-8?B?aEMvWjEzS2RzUVp1eVZxaFZvTVFRK2R6MHMwdWMxMEs2eHZ0QUl3d3pCY08r?=
 =?utf-8?B?N2NVQkJ4RFdzanUrdUlXMmlsZFI5TWd6Q0pPckFJbnF2Rm45QlJwK25VVkFt?=
 =?utf-8?B?bzFnWmJHYmMzL1M5b2FEenN5Y2VmUzVCVnl4MmliWjBCOWFVb1VsOHAvejM0?=
 =?utf-8?B?QUJKRlNxMWloamN4ZDZITjV1NTVyWGs4ZndjbmZHNW9LcXFoaURsRzNmZVF4?=
 =?utf-8?B?UUlmRCtjSGFBa0VtdWp0SGlmQWNJWmJTcmhMa1NPTVFwOVRmc2JPMlJQR1hH?=
 =?utf-8?B?MlZibExQZ0RKSGhXMk9obDZZOUJDL3JuSEdwOUtXUFIrWFJrUjBUN2UvMlBy?=
 =?utf-8?B?bHV0R0VQcGMyeVp2aWtOUjN0MEpaOGxWc0daZFNyUjVBUEo4bTN6TnlSUUNB?=
 =?utf-8?B?M0R1YzloUyswc1hFMzNVa0ZxSERWTVZrRzRwMWljc2pnVkREdWdYYk5oSTla?=
 =?utf-8?B?LzVKa2NDUU5BeUcwTEVVMEt3UmZQQWl4SCtPUmxmcExqZ1hGM1NRR01XUkZz?=
 =?utf-8?B?Ukx6amdtblhlamhSK0NrTGsxZmxSWFMwVE8yVUQxWmNhcGRwTXo2VXpBSjR4?=
 =?utf-8?B?SW1QQVdhbU5KTUtjWjhqYW5SV2ZCSXR2YlFwaVBodk9zSHNRUnQyWGZUT3ZY?=
 =?utf-8?B?UE9QVWh6UWlVRmNsUnU0cWRqYWFYRWJmVDB6clJieHlBUVNvakV3TldUQ0Jj?=
 =?utf-8?B?K1A3dnkzemorWElJNFo1TTRsSnFXSmwrUm51WStpeXR3VU5tRzJYL0dpeTZG?=
 =?utf-8?Q?qDqPsz/rsFLxlmaVzEuEr1Iwnz93NrWC4xNXvtW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXkzbnd3ay9heU9BUEQzNC82TTZBMXNnaE53amxtd0RjWlpXdFE3cG1WTHcy?=
 =?utf-8?B?K0VJWVhJWFhiZmF2M2lJM1JYVDBZMFRKMld1K2RUQzQyaUU2RHBXejc4K1Bp?=
 =?utf-8?B?UXFyUXZSUm12dXFPWlhHd3dUdkUzWjJ3NHRjamw3eTRNM3o0MTdIK0NsU2cx?=
 =?utf-8?B?NjN5VTU0RnFmTmNJVlE0eXNBK2hKYjh0T2NYK0dIMXdjbUVuNDhGNlhNaU9R?=
 =?utf-8?B?SlBPSVRRNWxWNHlsL3hSVmJOSzc2Z2Zid0hMVHFtMHhKQ3BNSklUWjYyYVAz?=
 =?utf-8?B?Zkw2K1dha3JpUFBpY2xyVmhFVTlZRk1uTEoxNFNua2VRd1NlZ001TU1jS0FG?=
 =?utf-8?B?cGlWTTNrcEdHY090MWpiRWVYUmY5MUhCOE85Um5EM3ZUM0hSTlRnSnJkZGdL?=
 =?utf-8?B?U0RtMFFKNEVHaUxlZjhDWklJQk5NcVNzV0RMTmp2ODBrK3NLNW5paG5pZXJ6?=
 =?utf-8?B?WEdXOHcydVorQThnbmVGUXFxYlFvenlvQnQ5NzBkZ2NGV05FV25HR3NhZGF5?=
 =?utf-8?B?QWlzU0xOMWZGSGI1S21QV0tPd01xWTFVS0FVSHZYOC9kVVczWkR0VFQzbllG?=
 =?utf-8?B?b1pIc3FiQktXcUgvVHhtT2hNS01uMUpTQ0c1ZXA5QjFuMUhLT29JdTN3R2Ev?=
 =?utf-8?B?c05oRzRRdC9TMUsrd1FJWUU3QjZaUU8xV2RGNmxrUVJaQ2lkT09EVCszaHZx?=
 =?utf-8?B?MG5aYXZFdlltNWptdW5ZWE92WXRXclVtb3VwZGFrZ3ByWWtrRWR6VHU2STQr?=
 =?utf-8?B?eUgwQ1RxUFhuUFRKMGZua2VCa3lZRDRpSitVYlBhUWQyWlVValhaZ0daQm1q?=
 =?utf-8?B?RllPeGVLREhNU3VpMFFXSUw3YmFSZDVWTnptTnU0S2ErV2RwY0dUeUpObW5i?=
 =?utf-8?B?Qzd4ZnVLdTJrT2sxY2R2cW4zWnZ3WU9CUjA3aXVaYWM5Mkg4akFFOXk5czRZ?=
 =?utf-8?B?b1pIRmVvZUhKZ2hUc1ZSYml5UEh4cDZiemdnQXBYdzQreWpKQm93ZFFLd0FZ?=
 =?utf-8?B?R3JNTUM3b29BRW1nUTgyMG41QXBYdWdZMDRxWG5udjd2NHJNWGgvdFNSaUtn?=
 =?utf-8?B?WCtONUpWZlA4bDBxczJocENNbk1zY2huSVkzYWRNTjluaTNOblNTUDUrVUha?=
 =?utf-8?B?dEhqTEo4eHEwWndOd3d6RjFTcUk2RWxhdDVDQUN6YW5ra215b1I4RkNBdXdi?=
 =?utf-8?B?T0FMTEVJakVsZmZNcHhCOWorOWs1d3ovK1BHS3ZqeXo1Q05zWVpHMjNkRUo2?=
 =?utf-8?B?N0dzSUhpa3p4TzVFc1JFcFM0eC9GdGMrZzJka1JFNFBwckYzTE5zZitNS3BB?=
 =?utf-8?B?TUVmUE9qcVVsZFQyUG1SMnQ4VHBZbkZPN2prR2ZkMXZCeDFMTy9hdU1ZdDd3?=
 =?utf-8?B?R1czamoyZzdxbHM3VXYra0dEQ0FIUjRrZnNpYXFVZGdCVmpCelVncHgrdEtq?=
 =?utf-8?B?czhWWlZkdTVkWFBvajh5MDV5UXRXMEo2eUJrZVZZaXdWUktld2x4a3VsUmpR?=
 =?utf-8?B?K1Y2bU8yeGZxMVVhaXZtYmdpVEQ3TmE4aldKUFd6S3JlaDgvc05xZXYyNDgz?=
 =?utf-8?B?WERFQlorc1o0MGJoMVZFQWFPOEtOcVdOV3lRWkdwVXc4ZWtNV21Na1ppbFRn?=
 =?utf-8?B?Um9Jc2NjTktvUll3ekd1M0ZObXJYTmNSNTgxK1dzQktoUWtwRXJnbDgvVGlN?=
 =?utf-8?B?WHJyeXoxQ1dOekF1USsxYmkyTm1YY1YvRnMzR2Y0L2szQ1oycjBHOFlUeGJT?=
 =?utf-8?B?VG8rc0IvUVdyZ1QwV21Pdm85Y29JT2pkTXREMnN6d0VqNmpidEowY2dSWlRN?=
 =?utf-8?B?OUxhTldkbDhTVnBhbXpQMGFYR3dUS2pHaWk4cTBmNFZyVU5OWmZPMDRFV0pV?=
 =?utf-8?B?WFRKT29IckJHYUJUMEcwK2dKT0RkRUY2djlKUjRkOFZyaTdDUndwc0pER3Zq?=
 =?utf-8?B?NkxiSzVoQ2tQNmRROXlESjJLTDVwODdVRWVXdmpBa3NuM3k5Rk9aWjVCM0lL?=
 =?utf-8?B?Vk9rTjFDU0ozZEhtS2hjSTRJR0RQb3pjbWNrQkxVbTBiNjJ2NDJ6TkpwUmdv?=
 =?utf-8?B?Y2lkRmQwRVdoOTM2UEJHZzY3R3gxSExlRlBqd3VTN3lKNHhDaVRJM2dYeWU5?=
 =?utf-8?Q?A0uHrCoU9//E9EVP8I0dMtUuA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de24803-5385-47b9-8ef0-08dcf8c336ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:14:10.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tU3GDxRZcAmX030ShBsDqFtXykHui54NlvWpo7YkagaREzgzuzuRD51J+iQvmMHo0cF5FEvTqemEDApTkWlRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

Hi Hans,

On 2024/10/30 15:32, Hans Verkuil wrote:
> Hi Ming Qian,
> 
> Thank you for this, these descriptions are much better!
> 
> I still have a few comments, though. See below.
> 
> On 30/10/2024 03:21, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@nxp.com>
>>
>> Add some ctrls to support the video encoder region-of-interest(ROI)
>> feature. The ROI QP Map and rectangular configuration are supported.
>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
>> ---
>>   .../media/v4l/ext-ctrls-codec.rst             | 131 ++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 ++++++
>>   include/uapi/linux/v4l2-controls.h            |  16 +++
>>   3 files changed, 193 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 4a379bd9e3fb..7b4327c4a14e 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1667,6 +1667,137 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW custom range.
>>       Applicable to encoders
>>   
>> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    (enum)
>> +
>> +enum v4l2_mpeg_video_roi_mode -
>> +    Indicates Video Encoding region-of-interest (ROI) Mode, enable different
>> +    encoding strategies based on selected areas within a frame. Choosing a
>> +    specific mode activates corresponding control or combinations of controls
>> +    to configure the ROI, e.g. for rectangle delta QP mode, you need to provide
>> +    V4L2_CID_MPEG_VIDEO_ROI_RECT and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP.
>> +    Applicable to encoders.
>> +
>> +    Possible values are:
>> +
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
>> +      - No ROI in the MPEG stream. Default mode.
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
>> +      - Rectangle ROI mode and specifies ROI delta QP.
>> +        When enabled, define one or more rectangular ROI areas
>> +        where QP delta is applied. The control
>> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
>> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP is used to
>> +        set QP delta value.
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
>> +      - Rectangle ROI mode and specifies ROI priority.
>> +        When enabled, define one or more rectangular ROI areas
>> +        where priority is applied. The control
>> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
>> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY is used to
>> +        set priority.
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
>> +      - Map ROI mode and specifies ROI delta QP.
>> +        When enabled, the whole frame is configured into a grid map
>> +        according to the ROI block region size in raster scan order,
>> +        and each region can have a QP delta applied.
>> +        The control V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP
>> +        is used to configure the ROI Map with QP delta values.
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
>> +      - Map ROI mode and specifies ROI absolute QP value.
>> +        When enabled, configure a grid ROI map where each region
>> +        has an absolute QP value assigned. The control
>> +        V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP is used to
>> +        configure the ROI Map with absolute QP values.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
>> +    This read-only control returns the ROI block size in pixels. The struct
>> +    :c:type:`v4l2_area` provides the width and height in separate
>> +    fields. The resolution of the frame will be rounded up to be
>> +    aligned to this value when it's partitioned in blocks for QP
>> +    maps and the number of QP values in those maps will be the
>> +    number of blocks of these indicated pixel size that comprise
>> +    a full frame. This control depends on the encoding format,
>> +    and the detailed encoder hardware.
>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
>> +    A struct :c:type:`v4l2_rect` provides the rectangular region
>> +    described by the position of its top-left corner, the width
>> +    and the height. The unit is in pixels. And it should be aligned
>> +    to the ROI block size, which can be queried from
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. If it is not aligned to
>> +    the ROI block size, then X,Y gets rounded down, and width/height up.
>> +    The maximum number of rectangular regions depends on the hardware.
> 
> What happens with rectangles that are completely outside the frame?
> I assume those will be ignored?
> 
>> +    This control is a dynamically sized array.
>> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP`` or
>> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``. For overlapping
>> +    regions, the value that is first in the ROI array will have priority.
>> +    Applicable to encoders.
>> +
>> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP (integer)``
>> +    Specifies the ROI delta QP of a rectangular region. The delta QP
>> +    is the value that will be added on top of the frame level QP.
>> +    It can be positive (more distortion) or negative (less distortion)
>> +    values. This control is applicable when
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
>> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and must be used
>> +    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
>> +    This control is a dynamically sized array, and the array size
>> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
>> +    the number of configured regions is the minimum value.
> 
> I'd rephrase this:
> 
> "If the array sizes do not match, then use the smallest size for
> both controls and ignore the remaining elements in the larger array."
> 

Yes, it's better, I'll apply it

>> +    Applicable to encoders.
>> +
>> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
>> +    Specifies the ROI priority of a rectangular region. it can
>> +    be positive (more important) or negative (less important)
>> +    values and is compared with non-ROI region (taken as value 0).
>> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and must
>> +    be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
>> +    This control is a dynamically sized array, and the array size
>> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
>> +    the number of configured regions is the minimum value.
> 
> Same here.
> 
>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
>> +    Configure a frame-wide grid map that divides the entire
>> +    frame into blocks of the ROI block size, where each
>> +    region will have a QP delta applied. The ROI map is
>> +    arranged in raster scan order, and it's configured
>> +    as an integer array. The block size can be got from
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
>> +    dynamically sized array, the array size can be calculated
>> +    from video resolution and the ROI block size, and the
>> +    width and height should be rounded up to be aligned to
>> +    the block size. This control is applicable when
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
>> +    If the array size is too small, the control should
>> +    return error. Applicable to encoders.
> 
> "If the array size is too small, the control should return error."
> 
> That doesn't really work. You can set the control, then change the
> video format causing the control array size to be too small, but
> that won't return an error.
> 
> I think you should either ignore the control completely in case
> of a mismatch, or assume that the remainder of the grid map will
> use a delta QP of 0. The latter would be my preference.
> 

I agree, But I prefer to ignore the control in case of mismatch.
When there is a mismatch in array size, it's not just a case of
missing configure data, the array size may be calculated from a
incorrect frame size. Since the array represents a grid map,
the defined area may not align with the intended target area.
So, I think it's better to ignore it completely and give some
tips log.

>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
>> +    Configure a frame-wide grid map that divides the entire
>> +    frame into blocks of the ROI block size, where each
>> +    region will have an absolute QP applied. The ROI map is
>> +    arranged in raster scan order, and it's configured
>> +    as an integer array. The block size can be got from
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
>> +    dynamically sized array, the array size can be calculated
>> +    from video resolution and the ROI block size, and the
>> +    width and height should be rounded up to be aligned to
>> +    the block size. This control is applicable when
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
>> +    If the array size is too small, the control should
>> +    return error. Applicable to encoders.
> 
> You have the same problem here. Except that you can't use a QP
> value of 0 if the array is too short, but you can probably substitute
> the value from one of the existing codec-specific QP controls.
> 
> If that doesn't work, then ignoring arrays that are too short
> is probably the better approach.

I would like to ignore the control if the array size is mismatch.

> 
> Regards,
> 
> 	Hans
> 
>> +
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 1ea52011247a..4d89309bf8d0 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -612,6 +612,15 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		NULL,
>>   	};
>>   
>> +	static const char * const mpeg_video_roi_mode[] = {
>> +		"None",
>> +		"Rectangle Delta QP",
>> +		"Rectangle Priority",
>> +		"Map Delta QP",
>> +		"Map Absolute QP",
>> +		NULL,
>> +	};
>> +
>>   	switch (id) {
>>   	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>>   		return mpeg_audio_sampling_freq;
>> @@ -750,6 +759,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		return camera_orientation;
>>   	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>>   		return intra_refresh_period_type;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> +		return mpeg_video_roi_mode;
>>   	default:
>>   		return NULL;
>>   	}
>> @@ -971,6 +982,13 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>>   	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>>   	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:		return "Video ROI Mode";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:	return "Video ROI Block Size";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:		return "Video ROI Rectangle Region";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:	return "Video ROI Rectangle Delta QP";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:	return "Video ROI Rectangle Priority";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:	return "Video ROI Delta QP Map";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:	return "Video ROI Absolute QP Map";
>>   	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>>   	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>>   
>> @@ -1512,6 +1530,34 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   		*type = V4L2_CTRL_TYPE_INTEGER;
>>   		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>   		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> +		*type = V4L2_CTRL_TYPE_MENU;
>> +		*flags |= V4L2_CTRL_FLAG_UPDATE;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:
>> +		*type = V4L2_CTRL_TYPE_AREA;
>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
>> +		*type = V4L2_CTRL_TYPE_RECT;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +		break;
>>   	case V4L2_CID_PIXEL_RATE:
>>   		*type = V4L2_CTRL_TYPE_INTEGER64;
>>   		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 974fd254e573..bf67d53af737 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -900,6 +900,22 @@ enum v4l2_mpeg_video_av1_level {
>>   
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>>   
>> +enum v4l2_mpeg_video_roi_mode {
>> +	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
>> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP,
>> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY,
>> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP,
>> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP
>> +};
>> +
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MODE			(V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE		(V4L2_CID_CODEC_BASE + 659)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT			(V4L2_CID_CODEC_BASE + 660)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP		(V4L2_CID_CODEC_BASE + 661)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY		(V4L2_CID_CODEC_BASE + 662)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP		(V4L2_CID_CODEC_BASE + 663)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP		(V4L2_CID_CODEC_BASE + 664)
>> +
>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>>   #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
> 

