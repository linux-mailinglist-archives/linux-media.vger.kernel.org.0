Return-Path: <linux-media+bounces-28793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F709A71A72
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 16:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C427A6B26
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 15:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF2A1F4190;
	Wed, 26 Mar 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DxLGeMl/"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E041F4165;
	Wed, 26 Mar 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003187; cv=fail; b=eNdAfxg3ddEw/R6EknC7viFcBmyhy1pCsgJSb25VuKYvS6k7RW7x/Ys+rVQSviic9KnKONhVm/nDruhil4i6PimqpxsNGCq2eqq+GT6xv8fNeAwCPSUM+SR1bG3Z6nC2oWhNW/uePrMt3MF6jsGuXfF1WsljTx+Cw2AFMpftWpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003187; c=relaxed/simple;
	bh=MqdYSZIrEH10z+cZwwO7F7HDBXBPngGytPvxzfeoUZo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bunk+ADezdHId+QEbJhX+NExV5SZXEkaSzrVUkWZYZhMlFmC3ArHOD6778HQ+GEnsdjosS2VZBSTjDAy/djGI9ulVbKoquByN4ha3BC78T91t1PQzgqsPYXGF9P+LWJFktGvarv3qgdtOtnetAw8tksHBI2ln7ux4U1eAZ5T+MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DxLGeMl/; arc=fail smtp.client-ip=40.107.249.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4zBpmZvFu7qemIvf2M5Wq4Qgl1ZY7OHdYVALM7jdlv2DqH60EPYfRuOk5bGB5e6P17SZE1LRmNTm3Su6IzgWYjlcrzZed/M3GSj4p2BCDiCte3BjglgGLPvQCP5XuBgl/yKIS8UVyJ54CSQIV5sW5hRd1hpN47iL5vITFKe4eJMLlt696JXpjCvEACbWj0pNC4G3G2+0j+SkWnh7GB2liVTwukT/MfUEBN4o3Knzqw8yq7AL3WxId1zRFSAksLBXMRZ6GNKkTGiFF39DpTvB9Uh/BoUiN53dUnvkE15s8JguLgGHrYXfNTeosIovZqLZki3lJkphXdUiv7JnDJMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dySaXBD9NKsB4xS7d5jyNrOg9fiPJvDiKjhQX1WV68o=;
 b=psAEbMa0IOeEtWr8u935BZglNal33KSjaApRwocCzCse2sSzmcglFycKGrw2v2IfE1nXXzNvSvzYog5xpz+TS94bFJL1mVhNO+zHSGlAGwHVGwHwdVtV/AHCRrfrkkARd4WrNpqpXOtv3EFs6ADUT0JGb7T2kqpiuYpj0BkG29k2UhKJ4abUw3P+8yJ8W1TIqFYOOE9Xku2tFGRNb4sj4T3AZLZsXKVD0tbHEVaVsPuwEfVt4sGTBxLCcxHuWu9tz4AK2p+XBh6yg0cZDbRhnIUeTh0VPlKulCa6gJVxl/MkXtfne7/xlaUcxVTWAZvft/9J7GGumITZjwH1hMcZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dySaXBD9NKsB4xS7d5jyNrOg9fiPJvDiKjhQX1WV68o=;
 b=DxLGeMl/IGN90xY3e8y20iyaIY46Zqpjc4QqTeYwXM7jua6ALVA4v3BSeH//nXlJU+v3YKFWC4a73ZwRTHu9rAI9TQYsn9li8xQ3qsrggvAcDDMtvox8/QVHzgAF3xywS4XGRGxDYdlBT5nXU2uRZ9HGPDoNAiJH18ZdjiBD7qTH4e9QA+K7bO+WRe9KB79GslU00dmQyFrHIoAHwGR05iqPkAihi60ryY2VSDfwmpO91d9hqQY6Yd25Jeuy38C/FUA2yGa7uD38R9s1YN9oYsRPc92ix+FhNb6vPRSB8U0bDUMoHtMbhPpp8ch2RUnILAZqRngYkvNELNOnbahoTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 15:33:01 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 15:33:01 +0000
Message-ID: <9e4e8d6d-f4f0-4332-a30c-ab0429e1526d@nxp.com>
Date: Wed, 26 Mar 2025 17:32:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "bryan.odonoghue@linaro.org"
 <bryan.odonoghue@linaro.org>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LnxRevLi <LnxRevLi@nxp.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "mike.rudenko@gmail.com" <mike.rudenko@gmail.com>,
 "alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "umang.jain@ideasonboard.com" <umang.jain@ideasonboard.com>,
 "zhi.mao@mediatek.com" <zhi.mao@mediatek.com>,
 "festevam@denx.de" <festevam@denx.de>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 "devarsht@ti.com" <devarsht@ti.com>, "r-donadkar@ti.com"
 <r-donadkar@ti.com>, Oliver Brown <oliver.brown@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
 <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>
 <pzbbtaltu7wcrsjvjg6n2x33uwm3us4uwpykektc7xlj47s7pz@odqzjc64db2i>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <pzbbtaltu7wcrsjvjg6n2x33uwm3us4uwpykektc7xlj47s7pz@odqzjc64db2i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:208:55::23) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b3381b-a79e-4a42-435c-08dd6c7b7dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czZ0Z0dUUnVocHkrQk16b1Vuc2xtUmsvV1lnM2ZrQUs4ZjR0WnhYcjdxWmpW?=
 =?utf-8?B?M1RQNUUxSHQ4MkhEcldiaW5TZk1Kb0o4THlKVnRub1NEaVMvS0FsY01BOVFH?=
 =?utf-8?B?SS9xbkwxNTJXdlBsRGxRRzZqSVZDY0dkVkpSaTRjbUw1VHBITzZIN0dERE9s?=
 =?utf-8?B?Rm9TQUx3Ry9HeDZXTUVHTEtDRVRoeTc1cjNza0JUTlRQb2dEK1VJSHVoSDZ3?=
 =?utf-8?B?bExXUFBFZG1hZWt6ZXgyaVhHTGhoU0hWK3FKMnJpRE9kaC9tSW1Ia2Z4WFdr?=
 =?utf-8?B?bStnM01jRjBicnIyOWRGdWVxZzhHU1RvZjFyTk8vOTJNRE1pRE1KTlZXYXVt?=
 =?utf-8?B?ZjZZNHlPNFl4eGRjOTRuNGZ4U2hjOWFKNHNIT0krbnpGcDR3cTJXeU94SkRF?=
 =?utf-8?B?WVVOV3RDNHpXRjRvd2ZueXZWdVZDcys4aS9TNUhCVzlwMzAvTEhjNElXL3Jm?=
 =?utf-8?B?MjFmTXAyTldTQkIzNVZYbFo2QXJ5VDdVd0dJNFlSbjVLWDV2VGgvMWUyY0dD?=
 =?utf-8?B?WDNiYlBxTXplc2F5QlptYlJ4NXVYajFSNHBrRk1yb3FxZFN3UlcvWVVkSWRt?=
 =?utf-8?B?MjFNYTdQYVN1ODBKRGc4MlZ2MWptbWRBZGdra1Z0ZTNub2hQRzhKdzZKYy96?=
 =?utf-8?B?ZmlYdndobGFoLzBKdjl4NHFlTCs5ZklkQmtyZ05kQkF6S2JFVFJXTzVCeEFO?=
 =?utf-8?B?WVhFYzFRcEd1K2dLU2JvRzh3QVpyUEhDVkdQQXl0cyt3aUlqeUJXbDRLbzB0?=
 =?utf-8?B?MVNJdm4vb1FmMHNEUTJHazZ0eGowV2hldjNBMWdkRnBBdUhlcjkzajk3ZXBT?=
 =?utf-8?B?czhFdFE2RkN5ZkFFdEZzbzR5RnlMa2Q3K3ZEVlNmWEhieXVMdW5jUFRJQWli?=
 =?utf-8?B?ZVROVDZkanhHTTRUYUNzL3dsYzJzK0NDaTZKclpvSlc3Z0h6ZTF1K2lsQzhq?=
 =?utf-8?B?akk1N0drdHY5ZkpwbXB6S0ZBc2I0TjRNdFpDZHJJYi8xRVJ4ellKSjJJekdt?=
 =?utf-8?B?U1RSNXBOd3pqUW4yRG1lS3M1OVlnMXpKbzgralUwd2txRUNvRlZFUUMxNmt5?=
 =?utf-8?B?VWVhbEp3WlZyZFp6Z0hCYXQ4VnRueE92YzVHdDJBdXRSdEJzSTdjckZicldR?=
 =?utf-8?B?RTE5UTgrcWdnOUNJdmF3Ynl2L2M4WWRSOUZLbk0xVUx3V24ydFFodkF3NEl3?=
 =?utf-8?B?S1RNZ0RhVUdhMFNGTm9LRUNWbUFhQi9hcTdWYStJTkhFVmJnL0h1MXdybDNr?=
 =?utf-8?B?S3BWNm9pMWhvZktPMjNSaVpPYlg0aVRFUit5Q1kraU9nR0ZnTi9OUEpjVjlv?=
 =?utf-8?B?Nkg3S3dvSVBBRTV5bnhTK1ZaY3p0WVNKNC9ZcUxrcU1iOEt2UUxSc0RTWUNi?=
 =?utf-8?B?Y1BaSU1naVVna1o3V1d0TjR2dzJmL3ZyR1lrbEVyRUM3YjNBSEdmUFp4NDM5?=
 =?utf-8?B?T1pvSnZnZ0JLaHU1cFk2UnptaW5wM25QaVl0a2U5UFZpdHhoQ0pBNHF2cTdq?=
 =?utf-8?B?TnJNb1RIL1ZCTSt6Mll1Z0ZNTG1ZUVcvNzBETnpSR2JkamNtd05OQ1VTVVpR?=
 =?utf-8?B?YzVUMWlKakp2R2ZFN1B2SEVhVWRVVC9xaWNVZ09ua242NEZDVjlKWFJ1YlVS?=
 =?utf-8?B?bzZuQkl3Q1RoeFh1VFV5QnYyN1J1MmhCQjVCcjNOVVRmSml0b0pKM1dCNDN5?=
 =?utf-8?B?aXZNbERXejg0aEtGVVNlU0EwcUk0Qk92ck90RVc0aXdPR0V0VGs3MGl3bTRS?=
 =?utf-8?B?b29IaDdJejl2a3NKbzFGUDYzQU9YdU9aMmFWcGFVZGkva1QwNjMxRkRoenRP?=
 =?utf-8?Q?7HhQvohIjDXS5YYRTRnQaqcqkbF4lQpt5di3o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjZ6VjQvRGxzR291dEN5NFNmbTVmODZnc1FicUIvdUx5K0lUdEFxR3laR1Bv?=
 =?utf-8?B?Y2l3TkcxVUNjeCtDanhqUXlLeW9NNzMyemVjdHlCbWpyWmtJTExMc0VuajV1?=
 =?utf-8?B?dGk2d1dWRXlEN0NNTUxTeVRTVWNyMmpNdGg5UkVORUd6dUVLQis1YVBISXk4?=
 =?utf-8?B?cnc4OEtER1VZdzBRWlV0RUlsM2pXOEUvMytxS0hnSXc0S2lOKy9qYk1ScGRu?=
 =?utf-8?B?bFAydnVhMHZTSnFHeVVvOFhVVFlIckVpOG8zMjc2UlEzbXZ1Q0hLSE1hMVdp?=
 =?utf-8?B?aWxLZ0x6SSsxVy8rOFpCNUU5WnV6WlZnNjRjZ1I1Mm5RWXFlb2p3YW9EeWo3?=
 =?utf-8?B?UU1raGIvVkJENWZjakJyWWZST1crdW9QSGU1OVJjaEtsdmswVjhKZ0pERHZS?=
 =?utf-8?B?TEtrVEp0aXNjMi9hMWdVak10Vzg3a2JaMzk4bXozL2I0VC9EeVBiUlU2ZjBR?=
 =?utf-8?B?bFduT0xtNktNSEcwYlpCdmU2YVZkL3NLSFdGRk0wRXAyZEljKzBGdmlkQ005?=
 =?utf-8?B?MkZmT2t6RkJvRkhIOVlZYWFJRDJEVXZrVFBnQlNRSHpoUm5seWxpYmp2Ukpm?=
 =?utf-8?B?allOS1JMQjNPTFRmc3pNVFdhRWlBb3VQaEphSU13d1F0SDFtbWcxdTg2NWdD?=
 =?utf-8?B?SUVNeWFiWlhXYWJrMzNUdDhKOVlxWk5oYlhKV1JsU0NTeXdGTXZkcXJ5VFZp?=
 =?utf-8?B?RjlKbk9jcHUwajhqbEdnYmxKVElaQXBPWFJST0ZFOGorTTFld2RYL2UrVGJP?=
 =?utf-8?B?ZXRKNkVjeVRCOHZmNzhhSThlWEwzZGhUNGNFbjI5RHdxMVZuYXl3am5nTTZG?=
 =?utf-8?B?QWtwenRJMys0L3QxVEdxZjZScDZUSVYrcjR1TGVWS0dFN3lrQWFvQ3hzZnZG?=
 =?utf-8?B?Y0tXMnhxZllSem5nTzJXdHpRMTZLMk04aTYvYVNtVDJtR0ZnWFJQTkwybFRP?=
 =?utf-8?B?NHVMVXNRTGxjdlA3SFNnZVlaNGhydmtvNENlcEEzYWFRN2RGL1paaGdkb3g2?=
 =?utf-8?B?UFVTV0g3MDdiZ1hoMnlFQXFuZVhibXRRODROVEF6QytlT0JKU0JwMElpTDBu?=
 =?utf-8?B?U1FNZFlhRkdWWW41WU1QMGRRVStEYUw3ZDlML1RQT3hXa0tDcHhodXUxUXd1?=
 =?utf-8?B?VXZKV1VoUlZuZno4NWtvVUlHcXVGSFBTMnIvZUVxdGkwNS8zTlBqYzJRRzVB?=
 =?utf-8?B?SE1tQWtwNWwrSnFySUcvaC83dVA4L2tJY2Z3bFEvMFhJenBWR2R4VG01Q1V4?=
 =?utf-8?B?QVc3UERKcDg0YWgrbG1KdWRScVIzMGZoSjRyczIrclZZVUQwbmxJeTFyLzN6?=
 =?utf-8?B?Zk4wUy9XUzhMS1dqRGNER0tKb0xEWXBoN0QraFZNMVJkdE8yRm5RV2kxeVBt?=
 =?utf-8?B?ZzY3UVYwYy96TW9rUEZhVFkwQVJ0TnlZcFVDdkdjeGZ6YnhuSDdRenQvZGlH?=
 =?utf-8?B?ekJIMG1Ja1pxZy96WkRIdFhSRnJtRmMzaFE2NGpRZHZvMWVXTEhra1pvN1lH?=
 =?utf-8?B?SUJvWmQ5R3A4SVpOYmRuT1d6TCtQSUZheFcyVEtwQ0dFbWl5L0hHZTZFbzJh?=
 =?utf-8?B?eS9SYTZPWWF3K3h2QWZReVBxZmxKcFNZbDFiNnkvMmJWMzdNYUNhZldZSmw3?=
 =?utf-8?B?S3lYWnhIamxBWDJLUFdZQU04eHBDSU1aTURuMnBzdjFsQU4zNG44YjdOWVUv?=
 =?utf-8?B?MnFLaEpIdWtJNGJkZHQyQmJWZ2RyVTVKQzA4VUxVZXZpcXFZOEJkUmVxK1k2?=
 =?utf-8?B?cUh6dk9RY1lhWjdSbFlFalpYOHVrODhKQ1F4cjYyc0ltZThZS2RzaTVhTGNy?=
 =?utf-8?B?bzJ3Q04wT0I2bFdnU1cvMWRLVHFlMDNaZGNyZ2UwTXlJMWhMZ3p4ZTFCKzNa?=
 =?utf-8?B?dllqVFJzTStJOFh5VTZGc1R4VUdoTDYxbjBWZmlKL2t1Ky9lZG9ETFhHWmF4?=
 =?utf-8?B?UllMR1hmYkdUYzh1OWJOTG51NGRuY0psTmpFREsrMXhMNkRQdW1rSTNseGZU?=
 =?utf-8?B?T2F4RVBvUm5pU0FxclVHTENDSFEzakNFeFFnNWx6dkxkRnpHazRwMUY0V3do?=
 =?utf-8?B?Q2NTSmljeVhYWHB4VHZqTmRXNzV1bjJJQ1NEZ3lSdDJjQ092ZFEvQmp3bzhP?=
 =?utf-8?Q?fIe/GfB+n2bte0L4JstI68FOZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b3381b-a79e-4a42-435c-08dd6c7b7dec
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:33:00.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/b+qGw4Q7ZBa48S0CoQpCzdcu7X+BHYnqu53qUqgcRONRLWE++mebhkr/DBCC30DtLYQHugCAm/GNyq87uG4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

Hi Jai,

On 25.03.2025 18:02, Jai Luthra wrote:
> On Mar 24, 2025 at 17:32:01 +0200, Mirela Rabulea wrote:
>> Hi Jai and all,
>>
>> On Mar 19, 2025 at 16:40:30 +0530, Jai Luthra wrote:
>>> Hi Mirela,
>>>
>>> Thanks a lot for your patch/series.
>>>
>>> On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:
>>>> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>>>>
>>>> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
>>>> active array size of 2592 x 1944.
>>>>
>>>> The following features are supported for OX05B1S:
>>>> - Manual exposure an gain control support
>>>> - vblank/hblank control support
>>>> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>>>>
>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>> ---
>>>> Changes in v4:
>>>> 	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
>>>> 	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
>>>> 	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
>>>> 	Remove some uneeded local variable initialisations
>>>> 	Fix extra/missing spaces
>>>> 	Add missing ending \n
>>>> 	Use return -ENODEV & return 0 to ease reading
>>>> 	Rename retval to ret in probe for consistency
>>>> 	Use devm_mutex_init instead of mutex_init
>>>> 	Replace more dev_err's with dev_err_probe
>>>> 	Constify more structs
>>>> 	Remove some unneded ending commas after a terminator
>>>> 	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
>>>> 	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_setting_2592x1944' was not declared. Should it be static?
>>>> 	Shorten some more lines to 80 columns
>>>>
>>>> Changes in v3:
>>>> 	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
>>>> 	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
>>>> 	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
>>>> 	ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
>>>> 	Use const for ox05b1s_supported_modes
>>>> 	Device should be silent on success, use dev_dbg.
>>>> 	Drop unneeded {}
>>>> 	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k BGGR12 mode was stuck)
>>>> 	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state only for _TRY, save it also for _ACTIVE
>>>>
>>>> Changes in v2:
>>>> 	Use dev_err_probe for missing clock, since it is now required property, and use NULL for devm_clk_get (no name for single clock), remove check for non NULL sensor->sensor_clk
>>>> 	Remove dev_err message for devm_regmap_init_i2c allocation error
>>>> 	Added spaces inside brackets, wrap lines to 80
>>>> 	Remove some redundant initializations
>>>> 	Add regulators
>>>> 	Make "sizes" a pointer
>>>> 		Use struct v4l2_area instead of u32[2] array
>>>> 		Remove the count for supported_modes[] and supported_codes[], instead use sentinel element at the end
>>>> 		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
>>>> 	Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes
>>>> 	Refactor register lists to allow multiple register arrays per mode
>>>> 	Use GPL-2.0-only instead of GPL-2.0
>>>>
>>>>   drivers/media/i2c/Kconfig                 |   1 +
>>>>   drivers/media/i2c/Makefile                |   1 +
>>>>   drivers/media/i2c/ox05b1s/Kconfig         |  10 +
>>>>   drivers/media/i2c/ox05b1s/Makefile        |   2 +
>>>>   drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
>>>>   drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 ++++++++++++++++++++++
>>>>   drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
>>>>   7 files changed, 1064 insertions(+)
>>>>   create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
>>>>   create mode 100644 drivers/media/i2c/ox05b1s/Makefile
>>>>   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
>>>>   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>>   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
>>>>
>>> [snip]
>>>> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>> b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>> new file mode 100644
>>>> index 000000000000..1026216ddd5b
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>> @@ -0,0 +1,951 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
>>>> + * Copyright (C) 2024, NXP
>>>> + *
>>>> + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/mipi-csi2.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +
>>>> +#include "ox05b1s.h"
>>>> +
>>>> +#define OX05B1S_SENS_PAD_SOURCE	0
>>>> +#define OX05B1S_SENS_PADS_NUM	1
>>>> +
>>>> +#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
>>>> +#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
>>>> +#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
>>>> +#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
>>>> +#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
>>>> +#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
>>>> +#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
>>> There is a non-trivial overlap of registers between this driver and
>>> ov9282.c which supports OV9281/OV9282 (1MP Mono).
>>>
>>> There are two other Omnivision sensors, OV2311 (2MP Mono) and OV2312
>>> (2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX05B1S
>>> and OS08A20. Unfortunately those two have separate downstream drivers in
>>> RPi and TI linux downstream trees respectively, and haven't yet been
>>> posted upstream.
>> Thanks for sharing this information, I was unaware. The question of
>> how much similarity should two sensors share, in order to stay in the
>> same driver, was also on my mind for some time, and I’d be glad to
>> hear more opinions on it ;)
>>
> Same here :)
>
>>> It would be ideal to have a single driver for all of these Omnivision
>>> sensors, or if not, at least a common C module that can implement the
>>> shared functionality like gain, exposure, blanking (vts & hts) in a
>>> single place, as this will make maintenance much easier.
>> I would need to get more information on the sensors you mentioned in order
>> to issue an informed opinion. So far, with the OX05B1S and OS08A20, I have
>> found some small differences regarding exposure and digital gain registers,
>> so the overlap is not perfect, I expect it will also not be a perfect
>> overlap with the other sensors you mentioned.
>>
> Sure, I had some experience with supporting OV2312 and OX05B1S in the
> downstream TI linux tree, and while they share the registers for
> exposure and gain, there are some other differences in features, aside
> from the 2MP vs 5MP resolution.
>
>>> My question here to you and the maintainers is, would it be okay to use
>>> this driver as a baseline to integrate all these different sensors
>>> together? And secondly, would you like to take a look at supporting
>>> ov9282, so the other driver can be dropped?
>>>
>> For the first question, I don't know what to say, and I cannot tell if
>> we are far or close for this patch-set to be accepted. Also, I am
>> unsure about how maintenance would go on a driver claiming to support
>> a multitude of sensors, who could test them all, whenever something
>> changes? Are you thinking to add ov2311/12 as other compatibles to
>> this driver?
>>
> While it would be ideal to have OV2312 support within this driver if
> there is a significant register overlap, it might still require some
> effort, as TI's downstream drivers for the RGBIR sensors capture two
> streams with different exposure, gain and IR flash values, and different
> MIPI CSI virtual channels, using the group hold functionality. Which
> IIUC may be quite different from what your patches implement, and will
> require adding streams/routing support so the userspace can configure.

You are not alone on this ;)

We have an internal solution for adding streams/routing support to this 
driver, we used it both for ox05b1s (AB mode with 2 pixel streams on 
separate virtual channels) and for os08a20 (staggered hdr mode with 2 
pixel streams on separate virtual channels), and also a separate stream 
for embedded data (same VC but a different mipi data type). I did not 
post these patches because of 2 reasons:

1. We are waiting for internal pads to be accepted, and possibly the 
common raw sensor model

2. There are issues with the individual control (exposure, analog and 
digital gain) per exposure/context, with the current available standard 
controls. This is an entire topic on its own, maybe I should start a 
separate discussion thread on that.

>
>> I agree there is a great deal of similarity shared across many raw,
>> mode-based sensor drivers, and it sounds good to have some common framework.
>> Some steps were done with the common raw sensor model. I would definitely
>> also like to hear more expert opinions on this.
>>
>> For the second question, as of now, we do not have any of the sensors you
>> mentioned, unfortunately. I could help in the future to test patches for
>> this driver on the sensors that we already have, but cannot make any
>> promises for what I do not have, best effort if we find these sensors in a
>> form factor that will work for our boards.
>>
> I agree, having a single maintainer would not be feasible given
> different sensor modules may have incompatible connectors. But yes it
> should be okay to provide a T-By tag or a Nack on the shared driver if a
> patch breaks your particular hardware or usecase, similar to how other
> popular sensor drivers are maintained like IMX219 or OV5640.
Sounds ok to me, we cannot guarantee to test the other sensors, but 
having T-by tag from other users will hopefully cover it.
>
>>> Anyway thanks again for your series, hopefully this will give a good
>>> starting point for upstreaming OV2311 and OV2312 soon.
>>>
>> I would like to know more about the OV2312 (RGB-Ir) sensor and if it
>> has many similarities with OX05B1S.  What hardware are you using to
>> test this sensor? And what interface to connect the sensor? We are
>> working with MIPI-CSI on most imx boards, and also RPI on imx93.
> For OV2312 I have used this FPDLink module [1] with the Arducam V3Link
> board [2] that connects to the EVM using 22-pin FFC MIPI-CSI connector
> that is pin-compatible with the RPi5 connector.
>
> [1]: https://leopardimaging.com/wp-content/uploads/2024/03/LI-OV2312-FPDLINKIII_Datasheet.pdf
> [2]: https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf
Thanks, we don't have any ser/des involved in the ox05b1s/os08a20 case, 
if we will ever get into the position to try ov2312, probably we will 
look for some solution for imx95-15x15 board, on the RPi connector 
(22-pin), cannot tell if it will work, one can never tell what may go 
wrong.
>
>>   Regards,
>>
>> Mirela
> PS: Your mail client broke the quotations on your reply. I have fixed
> those here, but might be a good idea to double-check your client
> settings.

Sorry about that, I may have edited the draft from both Thunderbird and 
Outlook. Hope this will be ok, sending from Thunderbird now as plain 
text only.

Regards,

Mirela


