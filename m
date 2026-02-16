Return-Path: <linux-media+bounces-52878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMIKG6cik2kX1wEAu9opvQ
	(envelope-from <linux-media+bounces-52878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:59:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3B14452E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AC07300A32F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFD730DD0C;
	Mon, 16 Feb 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aV+WIKr6"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE6223708
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250338; cv=fail; b=bCO+7/VAEfk4/uS8SiTT+zQiLWKrH41YImd43eiQwio5wbtliJnFq6Fk7dfqLORi9ROFVjTapGemIL+x4FSNe6S5PaQTo23gTsD9vV0lssoTFDEXizPZwdY0nC4BPoMGtnMnstEp4gQegwIjIfBWC2F0KbI4rHsGJ18NYTg5rbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250338; c=relaxed/simple;
	bh=jK/ZaJn52JgYR4xtA/JVSDSjz7G7D+1Prxn457JiEzc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MZxAQ32Jp437uNZVjBxzAk/kUvFO4RqsoBs8Cq58AKi3vV2XTV9gSTIn6oASKjox7r5T0mbDQrDgHWsploP0EjH4Kvc9uC6pVxWeHuNyFD6VWDsqw96tELGe/zMU9ktDWj9DS5N879yNtoau23om8xgLHexjOvfqPShZEGPwMcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aV+WIKr6; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCmEEzLcvPOvmufxZKC2EbDAqIo1RESv1Vt37nbeQnv4UI/Z7kXvM0FRtOfoVUY8fuwyqyroRm2iDOlrL+ClmqcJm8wTCJawaXBhJf/uL1/Oywo9gqqn7U9ihb7TF6uzCs1M+44VmpzgSqNXBnoXvYBTg8HrErJcreBB1Vlqyr+xBrQnXomXGStN3yVqq4jr7Jt6+F2kPLBKBqOdf5GuOFLfl0NrmK24CegCnbc2z+dN+e5QB9lFOMwNrM6sqWxZGGfsb1W1y/E5k/uhgZwB6us1mT/mCc4c06/2B4lZXvf+zNbMbqsiajNlem9jEGrgDCvkUrT5LEw4kY0oHtm4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbVeGBG6Eeh8N6eSO4Ib6Xe/hdQziHgKwxdUEMCJACo=;
 b=OvQn+5G6ZGJZtAhQpnAzQtmuo2baglChZjNtBT35/hG7FNYyjT0VIfmOCo8OrDvHQ50DXYdBKiJGtzUBh5XddEvf31cwrGZqRAlH5uPzccOxyrsRc8Y/Mlz2fp6usuVjbLB3yAue2XtRBPx01BNxc2vwUzt/1THpmnfvRx5xIIl2rVWFgMTXIwZhTUo1SnDR2TiWka8oyQ4xCKqmyiZqZ/o7725XQVQCrb07dJe64kr72R7+p6upcaqyGjJYAwhPAIgfty/ta/nzhEEFy3PvtOYg/rVllob4dMyH8MiFXT8Wdn6byXyT8+GP2vRjAWqxOLLmbVfR00iWT6t4cR7MLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbVeGBG6Eeh8N6eSO4Ib6Xe/hdQziHgKwxdUEMCJACo=;
 b=aV+WIKr61H7hTZanXLpY6kfXLMW77fTrbtgiANs6kqo0YWWJlRXb69Qte8EL15q7Xqv24Kw8UpyIhangtzu6b6xZAwiNix2rdUIpvyVvkwvvY3kvQJ592EEUrgBESj2Fl339MPbGSYZgNLySc35DVnbsEajNnDXV2RjUyWZThxWoqjo03EUE0VtiXEzsCMQ481TF3IH3owMZt/qK1VLlw1k3QMYsHmuCnBbAqwdukZeimagNH6matcm563COmLYKCdb+1qajNEiGOTuTlgwkkbUBK5i4v4YR16sI80qf8+I5qPOW3QAsNKzxABMyG7t3wV3sxzgsz3SOxWN61CH3mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS4PR04MB9457.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 13:58:49 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 13:58:49 +0000
Message-ID: <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
Date: Mon, 16 Feb 2026 16:03:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] media: Document enable_streams and
 disable_streams behaviour
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-10-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::12) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS4PR04MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 03489f31-15aa-4102-127b-08de6d6382c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aG1KaTV3T1hmaFBLaUw3SDNZNWUrbkdGc3dVQXI2eEhzZkxOQXBmNDhMaWJD?=
 =?utf-8?B?aDVHdC9JNmNPQTdsVGt5VkhwbWY4ZXR4QUN3WFR5clNGcTY2WVZLV09XWVc0?=
 =?utf-8?B?a250VjBCSEE1MHZwWUxSa3VTMjFFT1VsL3ZnVlBEWFJSdWNsYnhrdTFGaHVX?=
 =?utf-8?B?RjZOR0FPZ1NVWDRaOUpPUVVuYW9JcEo4MHhqdFIzTzV2N0FXLy9SbTgzODk0?=
 =?utf-8?B?MlhBVjc5Q2d5RU1lWjI4MzVEeUtQbjl4S3hGa2VSSEtPenJQYUpVdk4wU2FF?=
 =?utf-8?B?ZlpWU2hNRVExU2oydTVMT2xzRWhjbVg4VzBKRFJ3N0laYXpsakQyU3ZkUzJ3?=
 =?utf-8?B?Y1BxbFpEMWZ6VGxpV2JQTFU2MUVFaG5QaVZPOEhXNTJJNnlzeS9wNDBpN2kr?=
 =?utf-8?B?eFY5Y2N4ZVFCa3Y4cUhydktIRjJlbXBBMVFPZ0Yrbzh6MkNRREF4MFBPSnhF?=
 =?utf-8?B?THN6NUhMRGxvc0FJQWt3VHF3QUhobFFHdm9KajZWb3VKZmJBeU95WVl5bFFQ?=
 =?utf-8?B?TDM3SE9yUG5lbDloTFBUbXpVcVJOV0dDeThsQ1BCQkJhdW5TSElpOWRxV1BJ?=
 =?utf-8?B?aXk0dE81b05USkZJcFhDZEFjWEJUdzR3bE9VeTRKZlY5ZEI1ZUhrVXFPTVJB?=
 =?utf-8?B?RFc3TjRhYU1PWGRmQUhkYVNVMnd5d0MvSkowM0YwcmRhTk0zdFJYM01SOUdS?=
 =?utf-8?B?RHRCUFhCcWhicEc2LzgrSTRLN04rWmF3aDliNUtXV05tSmNzSEpPUVBzRUk4?=
 =?utf-8?B?c3cwcGlKcFNLRDFXQzRaUkpqZzRpMUlYbDJwL1NxOXBacG4xb1pFKzQ5eFpR?=
 =?utf-8?B?RWJwMkNYd2ovM1JzWkZ1YklnRWM4T3BTRUxUdVRibnlCaUNWNlNmQy96RVNw?=
 =?utf-8?B?TmhZYmRBZWtWaGtkMTZrNnJ4a2pMRlNONENxUmY5TzNlR21iU0J2YmJUZmJU?=
 =?utf-8?B?R3VCUWkyZm1KL2ZkVUc3dk42ZWtuNHB1OWRBR1NNa2hlS0NuWERJKys2WTB3?=
 =?utf-8?B?bnVla1Jkc281TFJRRmhWTDBZNk5UUC8xVjgzRzl6YmNNTUo2eFdDU0xEcmZY?=
 =?utf-8?B?eUtxdmZhcGkyMVNUZFl2UWs0d2lmWDFrOU55d1oyU3JRTWExYTZ4Q3BFdVhs?=
 =?utf-8?B?Qk1oZ29sdkRxcWdMUVB6RHdLN2svb1BzTFUvczRDZ0tkc1hGRFVEODZWaTNi?=
 =?utf-8?B?QUgxZzA1K0lPRGpQOEU5emI0b2JzLzRMeVpiSHdtcktBbHlUQUJBOUR3OUZD?=
 =?utf-8?B?NzhaSU5FKzZoYm5oZnh5NCtoWXlRcldsMUxpbGZmakJCVm9xTkFlNk9HN1ZD?=
 =?utf-8?B?ZVBlbWYrU0d5Vnc0ay9YVkZyeGQ4eCtBQmRMd1BMM3lUQTZJc0RXb0lzVUtG?=
 =?utf-8?B?OG90TGx4TUFSV3NBZTg0ZUJvbU0vSms3SlBJT1RxbGQrUC9zTTQzV2JmZU9z?=
 =?utf-8?B?cGp6TkZ6RVdFVk1uTSs1dUtqbCsrYnYxQ3cxcDVJOCsxVm9UVEsrWVAwUTNt?=
 =?utf-8?B?Y0NRQVBEanFkVEkvSkxFcUlDc21UdnVpU3dtZzJGS2F0amZsVHVUM1NJQzFr?=
 =?utf-8?B?cHFTUG1kS256TzV2eEhIUWk5ZDA1eW1oeWxRQURaUjVBSUx2c01BdFBXSGxT?=
 =?utf-8?B?d0lMeFcvTkdFU1NwWXpaMHkyZEYzdlBHOExYZFZLL011MnpGUnlUQWlOcE5v?=
 =?utf-8?B?VE0rUGsxQWMrai9Ya3oyQmwyWjdVZkkzazhyYWN1bHozWkxFN2tCNk9Ncm95?=
 =?utf-8?B?NGtMcFFROFZEczdyTlJ4N0JZSnoyaHRGaTJqZGpyQ1ZscVhqeWUwVyswR0Zm?=
 =?utf-8?B?aks2S2ROSTdQYjRHbXNBbGJBZHRrSUNScW9xLzNlVjJteTJmR3ovWjlGY1gx?=
 =?utf-8?B?MlNWVjZtZDVNaCtRR2M3aEE1ZzlqUmtuQkY3b3lyUUVQdndrcHB6NU00cTZk?=
 =?utf-8?B?RVVlc0Zzc1ZMRzBZR0xaUEFrVzk0WkhFdGlmcmVBMmFqL0R3M0E5RUdLeWJu?=
 =?utf-8?B?Qmtwc3BLZyt6WTEyV1JUMG5hSkkxNU8rYzFQTmpyeUV5djBXK2c5ME9xOStz?=
 =?utf-8?B?aGt4blBEcm5HTlhyU0hwb0dvTmQrOVJ2YjlPT2h0b1VyVGdHTzFBU1dWcTRx?=
 =?utf-8?B?K2pRaVd4UG9ZeHErcFYzR0dDYk5MNnc4cDlSN1hxREFrbThxdUovc1pNOXR3?=
 =?utf-8?Q?R0b+MomGPFtjv+92kXXbIRs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S09QYkptdTFHUEx1QURJNEdQYlpSeGZ6MXgyUlNNUzlMZGZpZ1hVTmF1NkVr?=
 =?utf-8?B?a1Q0bEdtTUsyWHg2UG43UHRYcWt5UUxBSVo3M3d2czhiRnNoR2FtdmlUaEJN?=
 =?utf-8?B?UHY1bzB0eDRIN1diOCtvbDAwZGpsSGRBbGp6UXNuV0I2RjRiRG9ueVBwZEFS?=
 =?utf-8?B?encwL29DY3BJazFRQmVnaHc1N0dhc3lGRUNRakhmODIrai9GV3NmTWhqejFW?=
 =?utf-8?B?bVQ5ZjBIRFJwc1U3MVdQTzh0ZGN5d0dnUjMxNC96L2xFWW5JOVloOEpOSHgx?=
 =?utf-8?B?N1o5cE1saGl4MGNRKzhnckxQVW9zZVhIT2p3ZDRxSCtxVGZNUWRxMGd0UFBV?=
 =?utf-8?B?WGFzb3lGSWR3TkZKdGpGMUpJTFZXa04rSUEyVG0vcUJQbzVZNGcwbEl4WnBX?=
 =?utf-8?B?YjQ4N3RSRVFrajhCempWd2xVdnB6QWFIZGFYaVJUZ203cVVRTWZrV2s0UzBM?=
 =?utf-8?B?ZzlGdENMNkpZZk9SMVlWcFYxMkgweW5HbGt5OXpxNmsyL0V6bWVGZmxIWnNq?=
 =?utf-8?B?MVlBV1NCNTBQbWxZMmZTMHhUL2wrNlZoNFgvdUZrQVZEMUVDVzVjR0NCWUha?=
 =?utf-8?B?d1BpZ29XUUVNTnhwT3pDNEJ6eEtFOTNUanNWcENHNHJmVjNMd2EzL3pwVHVl?=
 =?utf-8?B?bTRoT013cUcxZUgycVlXZFdBNzlteTJHUEdDNnZJSlNmOTlVN2pJM0VTaUtO?=
 =?utf-8?B?NEljbkZKOE9nczF6R3hsbDUyaVkzeTB6M3d6eG0wVlpOb2V1QzVkZlVDTUxS?=
 =?utf-8?B?ckd3WWpDWDhON283dTlCSlFnSDgyQmJuZmJtMUV5ekdpMDlzNXMyVXF6U3Vx?=
 =?utf-8?B?cnJqc2pMZnRZMnpscXFzSkJLQjc3RExaTmR1dzlHZkNPS29OdndScW85dXBq?=
 =?utf-8?B?VWZxOE1QZmQ2TGg4dmtIU2xleUh1bFIrdDFRbno0UXN0V1FRVjR2WkR0SFF1?=
 =?utf-8?B?bXBHb1VPQTVtNm94WkQ0YWhWSjFVdWJTbGllbHFxOFBqVWhXSisyaTF4Z2E0?=
 =?utf-8?B?alZza2M3UzBxZ20wWkxYUVhpWHV0MEprZEpFSExlN1ljVTlrSVV2MVZTWE5q?=
 =?utf-8?B?ZlQydjRIalJ3eTE0MnBRTlhMVGh5aGtpUlhiOXFmK2w0Tlo1V2hqLzdDWmFL?=
 =?utf-8?B?eHowT3JXYUFPc1Mwb2xoY0xrc3lLekVtTXRLOVJoZ1RGSHFtSjNXYnBtNUR2?=
 =?utf-8?B?Y3N0Um5UNEZaK1FLbzRHclBRUitram9NMUFCNFFDeEZNQVlyNzRMNVJ0U3Y1?=
 =?utf-8?B?ZEVScjl4TUc0ckxDcVp0M0U5aWRac01UeUxwUU1vOGpUbnRMZE13dW9lMit1?=
 =?utf-8?B?YnFmc3RqcTRWcnNyak5SRVZoRnN2Tjl2bHBoaGZyL1FJUmJ5dWJndENtY3Vy?=
 =?utf-8?B?T1R1RDBjRG50a25MbysrOU1ZbTdjVG1SMHdJSzl5bHRqYVYrR1lMaUhRTVRh?=
 =?utf-8?B?ek9YMVFQSUp2L3RkTXhodW5hWDZ1VjVKenhGVCtIZVkvMU5PZlZmSDIycTBm?=
 =?utf-8?B?ZmU5L0NDVGpBNm9veFhZMDZIaU03NkkzNTNybHBKRkVZL084OUFyd1l1TkdQ?=
 =?utf-8?B?bGs2SDRtTWpSLy9RckMyYWtwVTJUMDZnTXhjeldJSDhCYlhMNy85YlFKcUJK?=
 =?utf-8?B?UDBnN1UxeENkSUZtdm9sUW5CLzdCYU43TVEyYXlBSGhteEpRTngreURYZzJm?=
 =?utf-8?B?TDVocG8xMTIvQk5hckFFMkl5bXIvWUltN1BiRVh2UU8zSHV0ajZ4T3pTWDRD?=
 =?utf-8?B?MEdRczNOQnV0S3Zrc2wyUVdzNUpNRk5GVEduS2JJWGc2NW9BSUY3aXY3SGNN?=
 =?utf-8?B?WnVZY2xoUG1yMllqbHAydUdzS3RCR0QxSTFqYlphbnpFV3k0cVJxS2JvbG83?=
 =?utf-8?B?V3MwVzJQWDI5QVN1dmxwME1ub3RaVkpnWXQ3T0VlVmU3MnA2OWo0ZTZ0TWJq?=
 =?utf-8?B?MmZaTFZLRktxVmlUeU9QVzdFRVhPU05qUmVidmZNb1JueW9xQ2lGbEJxV29m?=
 =?utf-8?B?anc5RXNDSmdUcnJBYmZBU2hiSXZoeW1CVTFKRnZ5MGZBZlpTWDk5NlVvd2F1?=
 =?utf-8?B?WEUrODdLc0VSR00xYW1iSXBXYXVtQzJ4cGNIa3BWNlNHQTZWblVtNTZCSTF4?=
 =?utf-8?B?NnZlci9KU1pidzc2YjgzcEpDbHlXUHB6Q1FEWUUrMmJXMmhnOGxjb1pEd1J5?=
 =?utf-8?B?ayswM0tVMFN5RmUwclJ1VFFCTHhIWGlqTStVNVgwWjBSeFM2K2VKSG9XSnR6?=
 =?utf-8?B?VjZEdlpYMWJkQldqOGN6Ynk1ZWRMUmJOWTVEQ1RQSUpMNm9hY2ZRTzlKREl0?=
 =?utf-8?B?N0JUck5iMi8xNEYwdEhHVFVteUhaY240U0k3dUFudTdSVnBWSGRUdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03489f31-15aa-4102-127b-08de6d6382c3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:58:49.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvOrfgXSw/NY7JZGNyOCRKEDbOv0Zl8mBxKxtczMoDktBBecX2mjE0Ocl2GmWX8MMYU0YUv5N8xLPqVUar7zfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9457
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52878-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:mid,nxp.com:dkim,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0AD3B14452E
X-Rspamd-Action: no action

Hi Sakari,

In the subject, perhaps use improve documentation...as some 
documentation already exists. Other than that,

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Regards,

Mirela

On 2/11/26 11:09, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   include/media/v4l2-subdev.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a37d9a847196..de2684b15b96 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -814,6 +814,10 @@ struct v4l2_subdev_state {
>    *     V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>    *     argument.
>    *
> + *     Starting the requested streams may require starting additional
> + *     streams. Streams that are started together due to hardware are called a
> + *     stream group.
> + *
>    * @disable_streams: Disable the streams defined in streams_mask on the given
>    *     source pad. Subdevs that implement this operation must use the active
>    *     state management provided by the subdev core (enabled through a call to
> @@ -823,6 +827,9 @@ struct v4l2_subdev_state {
>    *     Drivers that support only a single stream without setting the
>    *     V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>    *     argument.
> + *
> + *     A stream group is disabled when one or more streams in the stream
> + *     group are disabled.
>    */
>   struct v4l2_subdev_pad_ops {
>          int (*enum_mbus_code)(struct v4l2_subdev *sd,
> --
> 2.47.3
>

