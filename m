Return-Path: <linux-media+bounces-29281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4687A79BE9
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3C13B0C92
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 06:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6E519F416;
	Thu,  3 Apr 2025 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fWkQqjzl"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281752907;
	Thu,  3 Apr 2025 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661413; cv=fail; b=RLbEOCRdPGNsIP0zDwkTopzUYYoh7VJsacqsfbnOdwLgm2cLBzVQiIukIBkGfBYK598VyrSP6SAWgsc7dQlJwRkeZ3wOLJbuek4YAwSf6jgbg6Euldo2wMoNTpNc4Mtj5BD/sptXwaCYTGbzulh2A/l2WxXQKA3yKAmK6sLvvYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661413; c=relaxed/simple;
	bh=vpwZ7uUu5fQncbyYIvWK4QqBdX7piBaNFwimXyFivRw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ny8I0S1238hSqc7rdmh1OcC65WGBqdko6zeTaoEpCz+tgmN69Miv0HGMp7ipT1h5z4QFBl7pzpx5iXoVVa/PPQ7Trw8LxB4j0w+h3BtzBHNorGApANO0qJ8QCZztwhd8DjsVmaO0FrtVZ6cFmCnUmk2SRLt1I9A2QQ6FCvf0xN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fWkQqjzl; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLWjn/q2XMg6KM+Q/n4Bhoz734Un0hraje+ikajCCVME/1TF8V4cntOrZNiwNqHdMxubMdySRMg91yA9xVwBDmbflALSNWb0vmIENta67ZQj6U8hmgGoXuLXp6i7+2of3Q+KQva2iTFYL6b75JqnOobiy1e9r4hAbLFajbsSsVQy9KG6wgkPMhpplxEk0KoCz/qg5Kxp9jvKc6sgm8dq5ViKsarQeUOFa5rq/tMF9896cslDFUQpNjO8tMGET+rVXVnG4F2wBfGzZKw4sz77g3P14hLg02eIa53MDjAWVa0bqlWRzrGnFzjTsYW3HVFooBCdzss4DLhXVkZAqaH3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPR3MyF7keRVFpNEspdzTHzSH2dHcOZdfSbXNdAJRkg=;
 b=J7JokhaPVKLne0FaMLk8PGe7Jrz6MVLhXzuLRIuUMujdJ9/CNfZsVfkt1C20NGn0IupJ71i75tteKE0IOIpM4FwsF6xQNQ9kY60Z6jWY11Sh56ivO9kof3zJ8oN7s55q+3cYTKdus4Dx/1UlidtLJfcdV/crU7IWEqT8HNwDsjFCtTbEFkifQEtfR70kqPxtsAxDwNU3ybfIPQutwW0cZBu8R9P/xrcCetK4T9x+h5xw+7cWsQvzB7cpstmnuM3cDLzNEa3izuHKvusewvW6Et3xzpQzJmv5jAAKSAZtZPwE+j1ZQjxDdCz/Gqd7LsEq5Fe3BKtUPMd3BzhI6D9O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPR3MyF7keRVFpNEspdzTHzSH2dHcOZdfSbXNdAJRkg=;
 b=fWkQqjzlFWQsCrtmwdBajGnSMjZIfgIAhgDtEH6ByUf6XXybovxDSQgHKdpb6CDf4T1yt9Z98J6hiC8McOpc9+8KN34XSBxA/quC3IOeh5dU+s2bgV2sAGfa5s+DExudntTXZ6k3Ohtftb8HG1olqrQ8AhJvZqT39FK1NOzev2fLbBKGjgmgabwNGn1gLvIFXJJgU6en+L5VghYXdk1cT+rhW6k2oa1gj68ngTaWVDbC3M3OtGr81exaahlPE9D3hebT0LePNbVkk06cQRBjWv1rz+xyKDpkG6xIFr+ZzhfCj+2oCRuY68qD+xGzAFMiCFCi21H3tqUnzRC9tcdYSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB8789.eurprd04.prod.outlook.com (2603:10a6:10:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Thu, 3 Apr
 2025 06:23:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 06:23:25 +0000
Message-ID: <c97c6fab-cc13-4fb9-a91c-58ce0bb5e593@oss.nxp.com>
Date: Thu, 3 Apr 2025 14:23:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
 <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
 <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
 <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
 <Z+v6Q1TRpJUkF2oh@lizhi-Precision-Tower-5810>
 <3b212947-0495-41fc-a143-c695c0c92269@oss.nxp.com>
 <Z+17+YucWkGUMIZJ@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+17+YucWkGUMIZJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d2f06d-79ef-4baf-9824-08dd72780a20
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTA2L0FxS0VUQmZUcW9jTTNDV1ZadThZMzNjcHpJSDhqL21sd3RmeWcrOXdl?=
 =?utf-8?B?M3kweHdvYTdxb09zZklqcklHZmpSSU1UNnF6U3hEVUZXd3RZYlc3dXo5Z3lZ?=
 =?utf-8?B?cE1SM0RmQUlSYXpoMjc5WERaS0huVmhSOWZPUSs3b1AyWWRjd0dmcVNkRHlV?=
 =?utf-8?B?T2lpRDhwVnp5K0JCb2pBZ0o0aFd5Wkd1WDVXUS8wNSt6ckE0d0xNZENuTll4?=
 =?utf-8?B?MndLWkN1VGlCYlppWjV1UXlSNjRNVlBacmxzOHVzeHpyQlREcHpxNnIxbjBs?=
 =?utf-8?B?a0NFVGo1amEzelRGVjRFMDRsYVZCbWgrNURFaWpJNVV6Rzlzb3MvL0dUdE1H?=
 =?utf-8?B?aCtkRW9HdTFBUS9ZMlFUbHI4NStuelNtc04yeDY3QitYazAxelZUOEVPUUFO?=
 =?utf-8?B?cmtpeDlUcWEzbmxhWjN1M1YvUDgzNWY2eWhLZE1ZcFkvSnFia1hJZ3NoTVJJ?=
 =?utf-8?B?MDM2TEpaR0tvc1Vmc1hWejdoRGwwOS9BSVlqeW03ZVpmSHV3OVFjMHplTisy?=
 =?utf-8?B?Tmx1ZnV1M3ExNWN0U0lpQ2piSGZkak0vV25uOFlQbDZxY3o0TlY3UVBpQlYv?=
 =?utf-8?B?UVZXK3J6RXRkVTlGL29RRExFL1NVbnRJUzVhZ0JEZ0FQeit0bGRLYkw5aS9j?=
 =?utf-8?B?ejNWMEFDdC85OEgwMDVva0x0R2d1eDBQV3l5b05VRGpIVkc4UkxOZTBkdzM4?=
 =?utf-8?B?S29DbzFSOTlIVThnK1ZvZ1hDdnBXc1gwamxMcnJxeGxYNmw2dDRQdVhvWkZD?=
 =?utf-8?B?TzNXMmlpTlVyY0VOb05GS2VRTVpjWU9xdHQxV2J1VVV1dkdabFBYdnVueU83?=
 =?utf-8?B?aHdhNlg5bzhGV2l6QTNhNEN0NlhxMkpmczJjM096V1QwdGJ3elFxWEJpc0Ux?=
 =?utf-8?B?anBiM3ZIWjdXTlBHeUZEQmZHbXJVeHBSRkdkSDV1czd6RjZ4MnBIYUNJZkp5?=
 =?utf-8?B?bTJGMmI1d0tabzhnVUc5VWVrSWk0UUtrUElUZXVjZ1g5MlJQblhtZnhIaFRo?=
 =?utf-8?B?RUMvYXI0L3IzQlFMQUhGVWpaSWJVTWZ6YTdiS1JJSmtLZmNJT25JMHJaNDln?=
 =?utf-8?B?NU9yZjZjbzVZTm5kZDZDZUNtZURTMUZhbnhFWVVFWjVCbXcxT3pieTNEQXVh?=
 =?utf-8?B?Q3VkNGxQUGVpOU1LQnp1aWZKc3UwWFk3SU96dzlEbTAwMXYwZ3REbW9CZzQ0?=
 =?utf-8?B?cnBkNzhCMFdUalFhTXI2ci8yeFo2emZDNVM5dEZhdVhjUWNzbGVtYVhTeDFI?=
 =?utf-8?B?SDREV1JSWkZ5RnV0UERlZTNRSUVKNjRYZXhUbVhQanhGSG5DUXgyczA4M1hJ?=
 =?utf-8?B?clpVN2xNNFRpa1JSRTdIODI5c2c1SS9DZ2Q0MmdxWmZLeEZDdzl6Vmp2MGxC?=
 =?utf-8?B?R2V5d2gzYmVJUkFRYm1qQVdIYSthN3dEMnFvK252c0U4WUVsaURRclBjTHBU?=
 =?utf-8?B?TjdHT1VVU1ZsRFgzRHhYUzVhU1dLNjdFbks0NEdsM3cxcDBDazBpOGZjb0gr?=
 =?utf-8?B?WFJOSTQ5UEkvMFIxb3hUZ2hIQzdsb2Vrcmt5dDVmOTgwK242eS9FMEVPejBy?=
 =?utf-8?B?eFRsSHpOcFlCWm9kcC9xRWtwUVY1QnlCQ25jdmdPWkc4T25jTEMxS1ZRaFNL?=
 =?utf-8?B?RmJyWU1EZFM5UXhKcHdCY0JsZkFkazNaOTM3dnZEKzkybXZiWlpUVmFJOHgz?=
 =?utf-8?B?YjRsVW5UeDVaSjlXbUg2SGRaYTBEMzVMbzRLTmxnNkRaV0NwQUlaUGVlaTN0?=
 =?utf-8?B?dlcxeFB2U2hQbHN4c0lKeVVsK2lJMFk1UXJDWFFXbDF6WnBQd2cyTk02d2dm?=
 =?utf-8?B?OXRoc3hKdWxheWJXUUxjUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdmWE5YOGQwR2w1UmQ5bUV1WVRQWTRYNVA3dElsKzZCREtUdVJnSG9reXNv?=
 =?utf-8?B?czRKeDlpUkozSWZVZ2VqdFpjWkxSbUtNYTVldXJQZlAxQlRqVkJWMktlSXpn?=
 =?utf-8?B?ellIclYzNVgzNldFZjVSNHUvRDVrV3FGMUkwdVNLR2cya1RHUkpQS2VQYUg5?=
 =?utf-8?B?NFVXVUt2Z0F6L3BCZ1lpZytabklabnFsdmVORzBMUzlSZm1IK0kwRTlKdzdK?=
 =?utf-8?B?WmdYY29VN09NNFhQaTVDbkZvYTBJWld1UmRiQ3EzRml3Vmc1L3BJNVozb2li?=
 =?utf-8?B?elN4ZDNsaVVqZUwwQ1VUT3Jwa2tENkpVVFBIWURjVjlTSWFoKzFGY1lsaXY2?=
 =?utf-8?B?VFBQeVNuWUhtUDEzSytMR1lNZHZ1TTNIcUo0eGdkNkEzc3dnVkhSZVlTS3JF?=
 =?utf-8?B?SHUrdDZLMDdNRzJubWJ4ZG1qcWFtRGNsaS9vNEJkQWdIdS90Y3NTaERZOW5w?=
 =?utf-8?B?TzRvSVpLTzh2Tjdyeit1NXdPL1BieG9KSFpYd2c2dDFzY1pUTE56b3YzV3lo?=
 =?utf-8?B?bWF3TnZka0ZSaE1FQytxbVI4eTNjYldJVkdySm9SK1RUWUloWDVwQStFZTVG?=
 =?utf-8?B?UUxja0haQkNEem4wMFFvMlNwNVBEZXkrZ2xqbnRuN09nM0Zic1ltQWRuSW1U?=
 =?utf-8?B?QWo3WUtRN0NjODFRT2xxVGw0QUFnc0FuK2svNE81T1RMejQ1YVZpWnVidnZ3?=
 =?utf-8?B?UjVQdExiaEQrOGFwaml6VFNQZ0d3cDFUUmNyTEVQNTJpRmd0b29uR016c2JO?=
 =?utf-8?B?Wk9sOWdRMllIRWpxaWdJVWYvVXc2VXVxN0MwZ3J2eEZrbzV3RkxnMzVlTHI0?=
 =?utf-8?B?Rkx2Z0tvVnBCejkrL1BDU2ladGlwRGJZZmVmdGZib2hoc1BCTWhqZXZZOWNL?=
 =?utf-8?B?NmNVc015Q2E3YkdZSEJOdURYNzNGR3VBZ25LVUtIQ2wzWDE5b0xKN1B3YXdM?=
 =?utf-8?B?L1BIZ0REdUs2bzV5RGw3ejllMGVIMWdDc09yK1dOKzFVamZaWXZWaFlSZmNE?=
 =?utf-8?B?UDB1U0J5SGxEM0dCTURWSWpkR2JMaGZ1RTFZZSt6M1lDSDN0aDJYQVNzOWZh?=
 =?utf-8?B?Vnk0UE5CVDExQlQzek1hd2FtN2lzWDNRL1daS0kyR0RLWDJMRGxFRnF2bmJm?=
 =?utf-8?B?Yjc0bkRlKzhqNW44S2hJQ0hHaWp6RWlvRDFnRUl6M2N5OXM0M1JmN1ppRmRD?=
 =?utf-8?B?a3FnRDBWRzZOWUVMSWx4blFVWDZCVlNHTDlrUDVGaEVCaGtUUFdqTmdTY3M1?=
 =?utf-8?B?ZTJLaEJKMUlHcUpvVExPcWRxZ1o4Yk1KcTJlRTRON0FtNURJbEptVlR6ZUl3?=
 =?utf-8?B?eEFlSENTWEtGRUxzZEtzNXd1NjhnaXZrMUNJb0hyODJJcm4zTitmRUpudXVL?=
 =?utf-8?B?NWVxN3VRbENGTzhvTENaOGw1TWlYTnR6alkwaDNub0hQa2hJU2owWU9tQnlt?=
 =?utf-8?B?c2FLVUNIM0Q4eVcrK0VSODV0MlRnQ04vTlY4TUJiUlVOcnY2MThPZFpLMHpT?=
 =?utf-8?B?QWFVY2FSOEppSXh3VWdoQVl2T2EvZnhXaFJwSWR3VU5GRjhEWEZYbGtQTjJK?=
 =?utf-8?B?TEJEbkdBSEFmbCtWbk5uVzFnK2ZpeGhSc2dhdG9KNXRNZU9jS1JWZCtyYmZO?=
 =?utf-8?B?ejl5eVVhRUZlK3lHc1JjVFVHVk9zQnE4UnNEb1JEUGpzOVVPczJoVDh5WlYz?=
 =?utf-8?B?WW9OcTBQN3V1dE91SFcyMmQ4aklOZzNsUlQyZlE4NmtjdjVzNy9BTXlaYWMz?=
 =?utf-8?B?WGNpdm1YWkdhZHRqOXc0TUNaM2NSVXFYYWJBZFVFY2tCTU5NUW00WUxWMEE2?=
 =?utf-8?B?L1JmK1lmMWUvbGIzRkdOeFZQa0xjZTNTRVQwS2p0TU8rdGdPL1E3YW1mazlo?=
 =?utf-8?B?N1JHbGY4eDZjNjlscjBnNnBlSUFnVHZkTlpZcmx4WVlqV2loc1BFQUF3THhN?=
 =?utf-8?B?Z3lIY08yOURna1FkY080dEtlUlVzUWttWWxkeTFtamlkczMvcjBmUUlkLysr?=
 =?utf-8?B?c1dHVHdZeHB0aGJObk5IWVRPSlU1TGh6UExlM20vcjBiZ3hwN0VMaVh6VDV5?=
 =?utf-8?B?VE1wc213ME15VjAvckJxeitEYWxuaWRvZEJJWWNIRjY1QU1HYk42d3ZMSm5l?=
 =?utf-8?Q?vcj35pUcIoN51f47+tGde3yXN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d2f06d-79ef-4baf-9824-08dd72780a20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:23:25.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRH/ahDZClPQhEjzALGpJD9a9GIkxZX35y4zfy0+e1/9SAcKSCKGGPYpgy5oR7q3sdY+JPWWVrSdwib28r3L0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8789

Hi Frank,

On 2025/4/3 2:03, Frank Li wrote:
> On Wed, Apr 02, 2025 at 01:34:00PM +0800, Ming Qian(OSS) wrote:
>> Hi Frank,
>>
>>
>> On 2025/4/1 22:37, Frank Li wrote:
>>> On Tue, Apr 01, 2025 at 11:17:36AM +0800, Ming Qian(OSS) wrote:
>>>>
>>>> Hi Frank,
>>>>
>>>> On 2025/3/31 22:32, Frank Li wrote:
>>>>> On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
>>>>>>
>>>>>> Hi Frank,
>>>>>>
>>>>>> On 2025/3/28 22:45, Frank Li wrote:
>>>>>>> On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
>>>>>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>>>
>>>>>>>> To support decoding motion-jpeg without DHT, driver will try to decode a
>>>>>>>> pattern jpeg before actual jpeg frame by use of linked descriptors
>>>>>>>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>>>>>>>> used for decoding the motion-jpeg.
>>>>>>>>
>>>>>>>> In other words, 2 frame done interrupts will be triggered, driver will
>>>>>>>> ignore the first interrupt,
>>>>>>>
>>>>>>> Does any field in linked descriptors to control if issue irq? Generally
>>>>>>> you needn't enable first descriptors's irq and only enable second one.
>>>>>>>
>>>>>>
>>>>>> Unfortunately, we cannot configure interrupts for each descriptor.
>>>>>> So we can't only enable the second irq.
>>>>>>
>>>>>>
>>>>>>>> and wait for the second interrupt.
>>>>>>>> If the resolution is small, and the 2 interrupts may be too close,
>>>>>>>
>>>>>>> It also possible two irqs combine to 1 irqs. If I understand correct, your
>>>>>>> irq handle only handle one descriptors per irq.
>>>>>>>
>>>>>>> Another words,
>>>>>>>
>>>>>>> If second irq already happen just before 1,
>>>>>>>
>>>>>>> 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
>>>>>>> 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
>>>>>>>
>>>>>>> Does your driver wait forever because no second irq happen?
>>>>>>>
>>>>>>> Frank
>>>>>>
>>>>>> Before this patch, the answer is yes, the driver will wait 2 seconds
>>>>>> until timeout.
>>>>>> In fact, this is the problem that this patch wants to avoid.
>>>>>> Now I think there are 3 cases for motion-jpeg decoding:
>>>>>> 1. The second irq happens before the first irq status check, the on-going
>>>>>> check
>>>>>> help to hanle this case.
>>>>>> 2. The second irq happens after the first irq status check, but before
>>>>>> on-going check, this on-going check can help handle it, fisnish the
>>>>>> current decoding and reset the jpeg decoder.
>>>>>> 3. The second irq happens after the on-going check, this is the normal
>>>>>> process before. No additional processing required.
>>>>>
>>>>> Okay, not sure if hardware provide current_descript position. Generally
>>>>> descriptor queue irq handle is like
>>>>>
>>>>> cur = queue_header;
>>>>> while(cur != read_hardware_currunt_pos())
>>>>> {
>>>>> 	handle(cur);
>>>>> 	cur = cur->next;
>>>>> 	queue_header = cur;
>>>>> }
>>>>>
>>>>> with above logic, even you queue new request during irq handler, it should
>>>>> work correctly.
>>>>>
>>>>> But it is depend on if hardware can indicate current working queue
>>>>> position, some time, hardware stop last queue posistion when handle last
>>>>> one.
>>>>>
>>>>> Frank
>>>>>
>>>>
>>>> I think it doesn't matter, the 2 descriptors are the cfg descriptor and
>>>> then the image descriptor.
>>>> If the current descriptor register remains the last image descriptor,
>>>> the ongoing check works.
>>>>
>>>> And I guess your concern is as below.
>>>> If the current descriptor register is still the cfg descriptor, but the
>>>> hardware has finished decoding the next image descriptor.
>>>>
>>>> I confirmed with our hardware engineer. This can't happen.
>>>> The first cfg decriptor has a next_descpt_ptr that is pointing to the
>>>> image descriptor, when the hardware read tne next_descpt_ptr, the
>>>> current descriptor register is updated, before the actual decoding.
>>>
>>> Maybe off topic,
>>>
>>> CFG->next = Image
>>>
>>> Image->next = NULL;
>>>
>>> If hardware finish image descriptior, current descriptor is 'Image' or 'NULL'
>>>
>>> If it is 'Image', need extra status bit show 'done'
>>>
>>> 1:	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>>>
>>> I suppose it should be DONE status if just finish CFG description.
>>>
>>> 2: 	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>>>
>>> It is possible curr_desc already was 'Image' after 1.
>>>
>>>    if (curr_desc == jpeg->slot_data.cfg_desc_handle)  //not hit this
>>>           return true;
>>>
>>>    if (slot_status & SLOT_STATUS_ONGOING)  // not hit this
>>>           return true;
>>>
>>> fake false may return.
>>>
>>> check two aync condition "slot_status" and "curr_desc" always be risk. But
>>> I don't know what's happen if fake false return here.
>>>
>>> for this type check
>>> 	do {
>>> 		slot_status = readl();
>>> 		curr_desc = readl();
>>> 	} while (slot_status != read());
>>>
>>> to make sure slot_status and cur_desc indicate the hardware status
>>> correctly.
>>
>> I confirmed with the hardware engineer, the curr_desc register is set
>> when hardware load next_descpt_ptr,
> 
> The key is last one, does last one set curr_desc to NULL when it done.
> If yes, the whole logic will be much simple. You just need check
> curr_desc.

No, the curr_desc will remain the last image descripor even after done.

> 
>> but the ongoing bit is set when
>> hardware finish loading the content of the descriptor, the size is 32
>> bytes.
>> So you are right, the slot_status and curr_desc is not synchronous,
>> but the gap time will be very short
> 
> Yes, it will be really hard to debug it if met once.
> 

I think we can read the slot_status twice to reduce the probability to
almost 0.



>>
>> This patch is a workaround that hardware finish 2 descriptors too soon,
>> irq() is not scheduled on time, the driver keeps waiting until timeout.
>>
>> And I agree there is still some risk that the ongoing check may return
>> fake false, even if the probability of occurrence is extremely low.
>>
>> When the fake false return, the driver will finish current decoding
>> early, and the decoded image is incomplete.
>>
>> But we don't want to change to poll the done status.
> 
> It is not poll the done. It's compare if status is the same by twice read.
> Most time needn't retry.
> 
> The basic idea is the same as
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clocksource/arm_global_timer.c#L73
> 

I checked the _gt_counter_read(), But I think its usage scenario is
different from here.

In _gt_counter_read(), its purpose is to ensure that the upper 32-bits
do not change when reading the lower 32-bits.
1. Read the upper 32-bit timer counter register
2. Read the lower 32-bit timer counter register
3. Read the upper 32-bit timer counter register again.
If the value in step 1 is equal to step 3, it means the upper 32 bits
are not changed, and the lower 32-bits are right.

But here, we don't expect the slot_status is the same by twice read.
Now the case is:
1. curr_desc is switched to the image descriptor.
2. the ongoing bit is set after the 32 bytes descriptor is loaded.
The 2 steps are not synchronized.

If slot_status is read twice between step 1 and 2, the value is same,
but still return fake false.

I'd like to check the slot_status twice and add a delay:

slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, 
SLOT_STATUS));
if (slot_status & SLOT_STATUS_ONGOING)
	return true;

udelay(10);

slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, 
SLOT_STATUS));
if (slot_status & SLOT_STATUS_ONGOING)
	return true;

return false;

This delay should be able to avoid stepping into the intermediate state
between steps 1 and 2.

Thanks,
Ming

>>
>> Considering the probability of occurrence and the respective
>> consequences, I think this patch still makes sense.
>>
>> Maybe we can check the slot_status register twice and add a short delay
>> in between. Then the probability of returning fake false is basically
>> reduced to 0.
>>
>> Thanks,
>> Ming
>>
>>>
>>> Frank
>>>>
>>>> Thanks,
>>>> Ming
>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Ming
>>>>>>
>>>>>>>>
>>>>>>>> when driver is handling the first interrupt, two frames are done, then
>>>>>>>> driver will fail to wait for the second interrupt.
>>>>>>>>
>>>>>>>> In such case, driver can check whether the decoding is still ongoing,
>>>>>>>> if not, just done the current decoding.
>>>>>>>>
>>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>>> ---
>>>>>>>>      .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>>>>>>>      .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>>>>>>>>      2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>>>> index d579c804b047..adb93e977be9 100644
>>>>>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>>>> @@ -89,6 +89,7 @@
>>>>>>>>      /* SLOT_STATUS fields for slots 0..3 */
>>>>>>>>      #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>>>>>>>>      #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>>>>>>>> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>>>>>>>>
>>>>>>>>      /* SLOT_IRQ_EN fields TBD */
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>>>> index 45705c606769..e6bb45633a19 100644
>>>>>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>>>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>>>>>>>>      	return size;
>>>>>>>>      }
>>>>>>>>
>>>>>>>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>>>>>>>> +{
>>>>>>>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>>>>>>>> +	u32 curr_desc;
>>>>>>>> +	u32 slot_status;
>>>>>>>> +
>>>>>>>> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>>>>>>>> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>>>>>>>> +
>>>>>>>> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>>>>>>>> +		return true;
>>>>>>>> +	if (slot_status & SLOT_STATUS_ONGOING)
>>>>>>>> +		return true;
>>>>>>>> +
>>>>>>>> +	return false;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>>>>>      {
>>>>>>>>      	struct mxc_jpeg_dev *jpeg = priv;
>>>>>>>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>>>>>      		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>>>>>>>>      		goto job_unlock;
>>>>>>>>      	}
>>>>>>>> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>>>>>>>> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>>>>>>>> +	    mxc_dec_is_ongoing(ctx)) {
>>>>>>>>      		jpeg_src_buf->dht_needed = false;
>>>>>>>>      		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>>>>>>>      		goto job_unlock;
>>>>>>>> --
>>>>>>>> 2.43.0-rc1
>>>>>>>>

