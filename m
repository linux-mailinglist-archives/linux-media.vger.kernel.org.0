Return-Path: <linux-media+bounces-20804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AE9BB5D0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 293211F21FC2
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F1217BD9;
	Mon,  4 Nov 2024 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GKI0jBT+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BBAD5E;
	Mon,  4 Nov 2024 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726481; cv=fail; b=NgW4shgGnwHnnGKNNdbAqmpV0qaIOsrc5PZfnfqy/MTB5AMxMJ2uA7lz0OPmP00nVnR+9TcgHG7C7tSosATNWJIUEwQJFRmKpmtUUxmpId7DifvcLHbJLQZSwR7/nPyRUV+efS3mrGXoXIZqKMnDk+YOY2IGU49xvQSG4oLOBRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726481; c=relaxed/simple;
	bh=j+9w/bYWubfCGrek7E8pzIOMhj0sJLKEFtK9RiGgGC8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CJOzvAUWXzLXCqp5f+PZ6S0k75MT9+Fug3UL4mo/ylFsgG3K5G/eOcQbsJT8O9mSBuYwwwh2rLUXNvELO03t2F3JUcENtlAiND1W4fbmozDWhqACy2sFNF0mZJQ6IAcZY6z7c326MBdcmWgaE+zPGovO5HuqhtfA4qlAE/3IzuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GKI0jBT+; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFsaXwt/AbmxxC3ZBt3jOUWWS5YKi2DKSfIDJNgZY30SBm/ZJLYwxFGQOsswyjyUS1NuDrTg4mVqxcFKt4UeAIJe75ZvT8ZhmXRYhmQwRh03p3XFUVt0bV7suaautDcCYaAENFktCFRKcZJVTHklJmWKoOqpYfVYj2gnKoWsKBgTSJotBV1Bt8Ky2coIUlHJmjjmPKdB+3w7hDpGUIW3yq933K6J8NpPujIE7DZFLkPuUTHCk+zAR2bnNdKuIf00FkKQDG7KSexjcRUfXqcJFQkAOAbNy+BgEXDu9TBM+fPxA8ncghhM5iKGrzILH98sIeMJCPJlSXMyBjwyyHScEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpYXOadyXG5/9uLdGLX2KNq89NswvlydXf5bP76HZX8=;
 b=lW/bfWhwc9tSOX8LlOBmC5pj/4n8zb1nuwn+WqFn+8gUueIBlWiOyKxZpMRlLJFFTgi5fag+hDE+Vaimch4oaPEsftyafi6MCbkYKTvPv1T0UnP6P23wHZseZfd5Qx2abh8PSgAl7xgtUOtBoXvTaT9MHuBEpJtm/hgE1yPxKjE093AbcFBnMu6SkgLusq+2jp1yGhHc07HOPPLAiOvztdz6CGRGzUEp71g660dYRg6/VYhKKw0HGGxqxMdiLJONOVdaGrDhPLnJD4DC5ulPGDHHe9moDl5DAG7vduFVD4xjEsbC6G5dP27mM51dGXwjuvepwLH0UpkIwzKCpmyWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpYXOadyXG5/9uLdGLX2KNq89NswvlydXf5bP76HZX8=;
 b=GKI0jBT+HzSP9W86o1rRvUXvIDtcx0q0dY66byT3SaKp2dCUJdPEipdUGGGvJSUN4BJ6N/CDt+JkOzL9hef9apx/Z7wosElEHXBssWpekhBPtRXh7M7I+LkuzJEyvIXayZwNpNQo2gf9B9+vroQ9CIPMJgWqamKPramCxISkT0GVWGuWDeWJT3y6h2DL311wKnOqaFd2l045Q3gnI+6M2N0RH5aGacdUgaGTPlPFDiiUwIIUqm8KAW3K5ZN/ErHla+wGmcdxSyd1cBoif9rMAqDp7NXZnhhdjtEWD2JkvlfFmqp+/wf1Khfshv7boh/zR3SSyjAC7SsHzZo3AxheQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 13:21:13 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 13:21:13 +0000
Message-ID: <45c27c16-93a3-44eb-8534-f2b210dc740a@nxp.com>
Date: Mon, 4 Nov 2024 15:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 5/5] media: ox05b1s: Add support for Omnivision
 OS08A20 raw sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-6-mirela.rabulea@nxp.com>
 <ZyTE0X70SI7Wdqvs@kekkonen.localdomain>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <ZyTE0X70SI7Wdqvs@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:803:1::16) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 68082369-80d0-4dcf-97fb-08dcfcd38def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3A4ZU9RY3hrck42elBIdmtxazh0L0V6aGhZSTF1VGgxc2dMNzJ4U0JjOUtS?=
 =?utf-8?B?YzlIQVZOL0FXRnBDLzYxamNNVjM1a0ZhdWxJSjhKLzRyQytFeUl4STJ4RlBT?=
 =?utf-8?B?cDlQSXRKVGZFZERGUlJuSWRnQnJOZk9Nbkh3MUo2UW94OVhuK0dPRDdack9S?=
 =?utf-8?B?SXQxQkZ0K1JBRVc0YkM1aEFOTUVSd0hlZzVNc2d5T0tTakMwdEJwNUQ2OW94?=
 =?utf-8?B?Q09NRWgvUi9KQ3hDRVJrNDVsMjBjOFo1am9BTHFCUDRFVUhqTjRZRlIyRnhK?=
 =?utf-8?B?djIwREpUaThlQXJrUG9sdEhpN0c1UUtSZnJxeHpMMHJ1eExpMzFNS3FpS3RR?=
 =?utf-8?B?TjZycmlGUFR4MUtuVURiS0xsQUhxZFJ4TXcwUG9ScUVBTm1TRFJYQS9GeGxH?=
 =?utf-8?B?My9KMGdWdFF4cHNKR0VoV1hZZmR3RTcrQjNRdUhzVmFNWWFpcDlOdjNQNm1I?=
 =?utf-8?B?K2hsVjlhZ1hEU21wdnhJNWtOTnFFRzhpSm5wbmdQeDJOaE5ZS0pKK2pYTExE?=
 =?utf-8?B?MURDbURSN0lJaE1hQ1dMZVFPNDBQRDVoMm8rWURGV1FnbHg0V3N5K2FITWE2?=
 =?utf-8?B?elNxdVh5Z0JMSnJHdlZFbWJ5bjhKZDFhNWFlbTdJNGtKdGhkaXdjS0VIQkY0?=
 =?utf-8?B?ZFZLVG84Y0JYTDYxYlhVTXhIVUsvUWc3VE11dDJITTRqRzJJM0YrKzVzWmFC?=
 =?utf-8?B?WERqSytMODNnY2swa2x6VGFZUGhsb012c3JIUW9rSEx3QktRVVN3dkJmb2VZ?=
 =?utf-8?B?QTJhZW9IRURZSTY2NjMyeUptaXdQdGJFci9FTDNMMUt4MFlJOVJUc2kvOE1w?=
 =?utf-8?B?a3lJb1M3SDhOQVptWEZlMTZ5WEVGbElobWRBTDE4YzVhbXNhRHE0aCs2Yi9X?=
 =?utf-8?B?OEhYYkd6K0ZRamt5bjllN21sZVl5eElhanBDcGZxR3p2R0M1SXJ1aHBMY0h2?=
 =?utf-8?B?VU9vajRTTFZ5M3Zqem0vSVpGMTBiR0k4WVZERzFIUDk3QStxUHFWcmlZUnVH?=
 =?utf-8?B?dGJoS0ZsVkwwRlBRYTB6b1kxNHlFUmJJdHZ6cnowMTFEMTF3WHpUVjZ0VE1h?=
 =?utf-8?B?aXJqNlFpcXNDQ0JjSmNIbU56RnliL3ZBUVRzSEVjeTBldjZIQUlGNjRiRDN4?=
 =?utf-8?B?OU1lWEVadkVuVHYrNXE1SnZodndSalN2OHFSQ1B3aHBXZFplN2VxMS9aZS9H?=
 =?utf-8?B?WW9MQnhlNjQvWmFkZ1RFZThGZlFab01GekQwdkUyS2l1UWpLcVducG1pQ3lF?=
 =?utf-8?B?aHp3bHBtMGs1TGZmRWljMS84THpmU1ExTzB2NUwyRTVqaVBhd1g0VlhnT2dw?=
 =?utf-8?B?ZHQ3aWx5emtuUVA1RzV4TG03SFVhcGJWY0lONi9aOEh1YUpCcGdnZFFKcU9H?=
 =?utf-8?B?bHg0T1hRbXYxVnR5V2pPSVZ6bmMvWGRtejJvU2N1VTRXSlNHak9pOTNxQlQx?=
 =?utf-8?B?eDBIanVuQVdTb0ZVSEE4bXlmQnBUYzYxSGRFWG8ySGV1OWxtOVExc2pCRjZL?=
 =?utf-8?B?Y3FkMEZMVWN4UXVYdjZFdnBKZ2xaV0RTMzM0MFhxS1JxZ2Z0ekVmcStlZE5t?=
 =?utf-8?B?ZlZwYXltMHMxQ2dvc1VYMzNjY2hObnpGTVJHTnRaQ2p3S3VKcDgrMjA0WGdM?=
 =?utf-8?B?a1BLR1BzdjhtZTc4ZXRIN3lLQW5uUlFVdTdzTTJDS244N0FHTTg3cmE0RGlO?=
 =?utf-8?Q?bJU1aQkKszanCBt/NfqS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHcvY3dOcERScFQwaGFvbVV5U2NjMm9kZUlaSXFpY1ROdWR5a1lwOGo2eGl6?=
 =?utf-8?B?YTdtNWovekRtWktYVWkwR0hxTkNCTVFSbjRDNGwxZ05jeTBDRnZSRnJDYXdr?=
 =?utf-8?B?SGNMV2Zzc2F0aDRUOS9NRUtqVU93TnJoTUwxaGtUdXZDdjNzdnVROGdVSjZO?=
 =?utf-8?B?Z1N0dDZTWGhlb2RHY2NEd2xTOEhtNmtXS2h3Z3lnQ3h4MkFjTFV3cXBWVDZy?=
 =?utf-8?B?R0FMSklSUmdFeU82TGJlNU9ZOWdWV05zS0sxUlRad1FEUU55MzFva2d2Mkc3?=
 =?utf-8?B?UGhVcHd5VVQ0K2VkajhMRE5SY25Oem5XRWJNNlN2V2tUUk1pL1pRS1QvSnIz?=
 =?utf-8?B?MThDSVBobzUrWXRHYlFLc0pEYzJybFlVcUgxbnhYbllWY3RCcVZUSWVWTFcy?=
 =?utf-8?B?UDJjVCtqN2lQcUJIcjB4WDU3aHZHNzRXYVAzclhVaUdXblNZUHBKNFJBc2c4?=
 =?utf-8?B?d3hiNVM2cDQvS05zTlZLNFZqV0RzN2FVT1ZPNlFhZmlCNFVkRlMzVnBONGVW?=
 =?utf-8?B?VFcrcHZTRmhRV2M4QzV1dlZNSjR2ZEgwTHJNMlpMcmlMeE12NGREaUZmcXJw?=
 =?utf-8?B?Z3pzUGxnNTlBdWVBL2hrZGFrM0JSNjhTaGlqcjk2Z1FEenorcEZuUEMrQmZK?=
 =?utf-8?B?M0p3bFFyR051YTFXMkJFcDFSS0I5Q2pwQkZEdlhCdUVNRElxZjFLLzdTMlRu?=
 =?utf-8?B?eldFZVJOdmlBTTVFNjF3bWhJWXpVREhFYTJ6U2gyNm91VlB2eDJJQlkrZWFh?=
 =?utf-8?B?L1FPVUdjUUZpZURaZThpVG5UNVlaQURuUmwyUjQ5VlJWM21NbEFMMWlaello?=
 =?utf-8?B?Rml5cG1FcEVWWFNDd2J3QWZ6c1AraHRnWjlYTUU1OFRnQkhmREhNVWc3Z2ww?=
 =?utf-8?B?d09PeHZNcXhMSm1Yc0NhZ3g0VEVyM3FYTUNmM09jTWlmNkhGTFVGNUtkdXdr?=
 =?utf-8?B?aEV6RXpZc2VuY3NUemVzbHZMNjVVaFdSdTZUb2xpTnBRVDBoKzNOaG1EMXFy?=
 =?utf-8?B?d1k0aWZpdnNNNmdFSnJST0pKLzRRRUxndGkwa2dySnFXSUJsbnBoTXNTb3pG?=
 =?utf-8?B?N04wU00zbWlqdURiaWVnYWxyZ0JQSmR5b1BvQ2NpN2src3Z2UE42OUZ5dCtp?=
 =?utf-8?B?WVRhR0tpTEtWZWlQU0UyZHAyejRtdHQ4akZxc3RLdG5sbFRaOGlpd3E4YitR?=
 =?utf-8?B?cTRIbldJcERyMndOZnN6M2Nacyt0aEZidm11eXVmd0QyTE9aRHRoelp2bTJn?=
 =?utf-8?B?M0Fpb2M4b1MydjR2dlFTWHJ4djhJaGJSN0p5b3hjNHBONGVuN0puOXVEVng2?=
 =?utf-8?B?VXloT3htekp2T1VUTmFpaS9HVitQMjliWkJ3MXRMa2VsVWFXdlFjRnRhSzJu?=
 =?utf-8?B?U29ONVdkS0FMckVLYUpWTTN0SHI3YkF3clpHcDk0eDlmRHNYN0VzZGtYU0s1?=
 =?utf-8?B?bFZCN1Z6b00rWmNsWXY2WWFwaFVDYWk3TzRQS3luTjVDcWdQMkRGNldUeDdF?=
 =?utf-8?B?eFZxa2krWUw3WStQTFhTaWVGU09RUklOaVAzaTJuM3ZybXFkT2phZXFuamE2?=
 =?utf-8?B?U2RlNXBCWEUybDJsRjhFcURlYnVjbnpVaUtCcUZRemZkblJnTGpvNFhEQVE0?=
 =?utf-8?B?ZDlTd1hSOFFlUm9RNVptM2JZSG5HVjhua0kwbFZtWWY4KzE5UU5jVm9EeVNY?=
 =?utf-8?B?SklscGRMK0lkTmo3bWVudU5XR3BoZVIvZlZERUlkNUtRM0xveWVBcEpMNjFG?=
 =?utf-8?B?WnJ6TFI0Z2h3UjEzYkVvZmVPQjhJak5FbVdTKzhHNTNkaG8ydEJpTmFKZkNN?=
 =?utf-8?B?SGJBVlJRL2ZJcFo4ZWpiUUgyS25kbVp1YlRteGIxazkySk11Rkhvei8xOWRx?=
 =?utf-8?B?OXJ4N3NKbE9wVktNYnRzQitkdlRubkNKTnRtb21Sa1l2R1BCUVoxa1Bvc2N2?=
 =?utf-8?B?d2RUMjVxWlo1WUd2aS9wN0JrRktkWmEyUEdHNHRJSUNveFpWeFNDVWNKZXFS?=
 =?utf-8?B?TTY0bFoyaUVienBKR2lWWE9Mdmk2RVFTZ1QyMWlEMFJURzIxTGgvNGJzMHRD?=
 =?utf-8?B?MDFMRFNjbnJXM0hrUDlkM20rMStuUlkwUWxLMzM0TXlNNldsdFc1ODhVeFZM?=
 =?utf-8?B?dzhLaDJYaTlwcmUrVkVMemdjS2lGL3pFSkkrRFYwclF2akRkVDZWUytJbGtC?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68082369-80d0-4dcf-97fb-08dcfcd38def
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 13:21:13.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9okJvc/r7+Zaj6caGZe9qhYnrXIWDjMI5rOr/0ldwTHT1YbPF5GTpD82/m7XK4qmFO0qXZXRZWm/jScZbHbIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784

Hi Sakari,

thanks a lot for feedback.

On 01.11.2024 14:08, Sakari Ailus wrote:
> Hi Mirela,
>
> Thanks set the set.
>
> On Mon, Oct 28, 2024 at 09:06:28PM +0200, Mirela Rabulea wrote:
>> This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
>> HDR mode control is supported, with one hdr mode: staggered HDR with
>> 2 exposures on separate virtual channels.
> The patch still declares just one via get_frame_desc (as there are no
> changes). I think we need more documentation on this, including sensor
> specific documentation on the HDR mode as the interfaces don't provide it
> all. There's Documentation/userspace-api/media/drivers/st-vgxy61.rst that
> describes the existing usage of the control. We need more than this,
> however, as staggered HDR is more complicated, requiring processing on
> receiver side.
>
> Neither I'm sure the control is enough as an interface to configure this.

Indeed, when HDR is enabled, the sensor sends data on 2 VCs, but only 
the VC0 makes it further, as you noticed, it is hard-coded in 
get_frame_desc.

I did experiment with both exposures, sent as 2 separate streams, and 
the 2 VCs, each of them assigned to one stream, with get_frame_desc 
modified for 2 entries.

I did capture successfully the 2 exposures as 2 streams, however, I got 
stuck on a clean implementation for streams & routes, here are some of 
my questions on the subject:

https://www.spinics.net/lists/linux-media/msg262705.html

I would much appreciate any thoughts or comments on that.

In the meantime, while the internal pads support settles, I could add 
some comment in the code, to document the current limitation?

Do you know, is the HDR merge for ST VGXY61 done inside the sensor? For 
os08a20, it is not, it will be merged in the ISP. There are other HDR 
modes available for the os08a20, but we only experimented the staggered 
hdr on 2 virtual channels, and I think it's unlikely that we will add 
other modes.

The other HDR modes for os08a20 are:

1) sequential HDR, can be achieved by using context switching, further 
documentation missing from the datasheet: frame1 long, frame2 medium, 
frame3 short, frame4 long, frame5 medium, frame6 short,...

2) staggered HDR (long and short exposure frames overlap each other); 
there are 2 possible output modes:

2a) first staggered mode, uses MIPI channel to differentiate different 
exposure frames (this is what is enabled in this driver)

2b) second output mode (the new staggered HDR mode) with dummy lines, 
where no VC is needed (did not experiment with it, and I also do not see 
any specific documentation on it)

The datasheet I have seems to be confidential for NXP, and it is thin on 
the subject.

The other sensor, ox05b1s does not have HDR capabilities, but it can 
operate in a context-switching mode and output on 2 virtual channels 
also, on one channel frames optimized for the RGB component, on the 
other channel  frames optimized for the IR component, each one consuming 
half the fps. We did experiment with this mode, in a similar manner with 
the os08a20 staggered HDR, however, the current mode used in this driver 
for ox05b1s is with the RGB-IR together on a single VC.

Please let me know your further recommendation.

>
>> Supported resolutions:
>>     - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
>>     - 1920 x 1080 @ 30fps (SBGGR10, HDR)
>>     - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
>>     - 3840 x 2160 @ 15fps (SBGGR10, HDR)
>>     - 3840 x 2160 @ 15fps (SBGGR12, HDR)
>>     - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
>>     - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
>>
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>> ---
>>   .../media/i2c/ox05b1s/os08a20_regs_1080p.h    | 201 +++++++++++++++++
>>   drivers/media/i2c/ox05b1s/os08a20_regs_4k.h   | 209 ++++++++++++++++++
>>   .../media/i2c/ox05b1s/os08a20_regs_4k_hdr.h   | 199 +++++++++++++++++
>>   drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 189 ++++++++++++++++
>>   4 files changed, 798 insertions(+)
>>   create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
>>   create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
>>   create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
>>
>> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h b/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
>> new file mode 100644
>> index 000000000000..ab9977c56a10
>> --- /dev/null
>> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
>> @@ -0,0 +1,201 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * A register configuration for Omnivision OS08A20 raw camera, 1920 x 1080 @60fps BGGR10
> Over 80, please wrap.
>
>> + * Copyright (C) 2024, NXP
>> + * Copyright (C) 2024, Omnivision
>> + * Copyright (C) 2024, Verisilicon
>> + *
>> + */
>> +#ifndef _OS08A20_REGS_1080P_H_
>> +#define _OS08A20_REGS_1080P_H_
>> +
>> +static struct ox05b1s_reg os08a20_init_setting_1080p[] = {
>> +     {0x0100, 0x00},
> Spaces inside braces.
>
> Quite few of the register settings here are also shared with the other
> modes. Wouldn't it make sense to refactor these into a single common list
> and then mode related lists?
I'll see what can be done.
>
>> +     {0x0103, 0x01},
>> +     {0x0303, 0x01},
>> +     {0x0304, 0x00}, /* PLL_CTRL_04 (default 0x00) */
>> +     {0x0305, 0x2d}, /* PLL_CTRL_05 (default 0x3c) */
>> +     {0x0306, 0x00},
>> +     {0x0308, 0x03},
>> +     {0x0309, 0x04},
>> +     {0x0325, 0x45}, /* PLL_CTRL_25 (default 0x3c) */
>> +     {0x0327, 0x05}, /* PLL_CTRL_27 (default 0x07) */
>> +     {0x0328, 0x02}, /* PLL_CTRL_28 (default 0x07) */
>> +     {0x032a, 0x02}, /* PLL_CTRL_2a (default 0x00) */
>> +     {0x300f, 0x11},
>> +     {0x3010, 0x01},
>> +     {0x3011, 0x04},
>> +     {0x3012, 0x41},
>> +     {0x3016, 0xf0},
>> +     {0x301e, 0x98},
>> +     {0x3031, 0xa9},
>> +     {0x3103, 0x92},
>> +     {0x3104, 0x01},
>> +     {0x3106, 0x10},
>> +     {0x3400, 0x04}, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
>> +     {0x3025, 0x03}, /* PSV MODE OPT (default 0x02) not used */
>> +     {0x3425, 0x01}, /* R ASP PD SEL bit[1:0]=stream blanking */
>> +     {0x3428, 0x01}, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
>> +     {0x3408, 0x03}, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
>> +     {0x340c, 0xff},
>> +     {0x340d, 0xff},
>> +     {0x031e, 0x09},
>> +     {0x3501, 0x04}, /* Long exposure */
>> +     {0x3502, 0x62}, /* Long exposure */
>> +     {0x3505, 0x83},
>> +     {0x3508, 0x00}, /* Long gain */
>> +     {0x3509, 0x80}, /* Long gain */
>> +     {0x350a, 0x04},
>> +     {0x350b, 0x00},
>> +     {0x350c, 0x00},
>> +     {0x350d, 0x80},
>> +     {0x350e, 0x04},
>> +     {0x350f, 0x00},
>> +     {0x3600, 0x09}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
>> +     {0x3603, 0x2c},
>> +     {0x3605, 0x50},
>> +     {0x3609, 0xb5},
>> +     {0x3610, 0x39},
>> +     {0x360c, 0x01},
>> +     {0x3628, 0xa4},
>> +     {0x362d, 0x10},
>> +     {0x3660, 0x43}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
>> +     {0x3662, 0x00},
>> +     {0x3663, 0x28},
>> +     {0x3664, 0x0d},
>> +     {0x366a, 0x38},
>> +     {0x366b, 0xa0},
>> +     {0x366d, 0x00},
>> +     {0x366e, 0x00},
>> +     {0x3680, 0x00},
>> +     {0x36c0, 0x00},
>> +     {0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x373b, 0x02},
>> +     {0x373c, 0x02},
>> +     {0x3736, 0x02},
>> +     {0x3737, 0x02},
>> +     {0x3705, 0x00},
>> +     {0x3706, 0x39},
>> +     {0x370a, 0x00},
>> +     {0x370b, 0x98},
>> +     {0x3709, 0x49},
>> +     {0x3714, 0x22},  /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x371c, 0x00},
>> +     {0x371d, 0x08},
>> +     {0x3740, 0x1b},
>> +     {0x3741, 0x04},
>> +     {0x375e, 0x0b},
>> +     {0x3760, 0x10},
>> +     {0x3776, 0x10},
>> +     {0x3781, 0x02},
>> +     {0x3782, 0x04},
>> +     {0x3783, 0x02},
>> +     {0x3784, 0x08},
>> +     {0x3785, 0x08},
>> +     {0x3788, 0x01},
>> +     {0x3789, 0x01},
>> +     {0x3797, 0x04},
>> +     {0x3762, 0x11},  /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x3800, 0x00},
>> +     {0x3801, 0x00},
>> +     {0x3802, 0x00},
>> +     {0x3803, 0x0c},
>> +     {0x3804, 0x0e},
>> +     {0x3805, 0xff},
>> +     {0x3806, 0x08},
>> +     {0x3807, 0x6f},
>> +     {0x3808, 0x07}, /* X output size (default 0x07) */
>> +     {0x3809, 0x80}, /* X output size (default 0x80) */
>> +     {0x380a, 0x04}, /* Y output size (default 0x04) */
>> +     {0x380b, 0x38}, /* Y output size (default 0x38) */
>> +     {0x380c, 0x07}, /* HTS[15:8], total horizontal timing size */
>> +     {0x380d, 0x90}, /* HTS[7:0],  total horizontal timing size */
>> +     {0x380e, 0x04}, /* VTS[15:8], total vertical timing (default 0x04) */
>> +     {0x380f, 0xa4}, /* VTS[7:0],  total vertical timing (default 0xA0) */
>> +     {0x3813, 0x08}, /* ISP_Y_WIN ISP vertical windowing offset */
>> +     {0x3814, 0x03}, /* X INC ODD (default 0x01) */
>> +     {0x3815, 0x01}, /* X INC EVEN (default 0x01) */
>> +     {0x3816, 0x03}, /* Y INC ODD (default 0x01) */
>> +     {0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
>> +     {0x381c, 0x00}, /* BLC_NUM_OPTION (default 0x0e) */
>> +     {0x3820, 0x01}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
>> +     {0x3821, 0x05}, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
>> +     {0x3823, 0x08},
>> +     {0x3826, 0x00},
>> +     {0x3827, 0x08},
>> +     {0x382d, 0x08},
>> +     {0x3832, 0x02},
>> +     {0x3833, 0x00}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
>> +     {0x383c, 0x48},
>> +     {0x383d, 0xff},
>> +     {0x3d85, 0x0b},
>> +     {0x3d84, 0x40},
>> +     {0x3d8c, 0x63},
>> +     {0x3d8d, 0xd7},
>> +     {0x4000, 0xf8},
>> +     {0x4001, 0x2b},
>> +     {0x4004, 0x00},
>> +     {0x4005, 0x40},
>> +     {0x400a, 0x01},
>> +     {0x400f, 0xa0},
>> +     {0x4010, 0x12},
>> +     {0x4018, 0x00},
>> +     {0x4008, 0x02},
>> +     {0x4009, 0x05}, /* BLC CTRL09 (default 0x0f) bl_end */
>> +     {0x401a, 0x58},
>> +     {0x4050, 0x00},
>> +     {0x4051, 0x01},
>> +     {0x4028, 0x2f},
>> +     {0x4052, 0x00},
>> +     {0x4053, 0x80},
>> +     {0x4054, 0x00},
>> +     {0x4055, 0x80},
>> +     {0x4056, 0x00},
>> +     {0x4057, 0x80},
>> +     {0x4058, 0x00},
>> +     {0x4059, 0x80},
>> +     {0x430b, 0xff},
>> +     {0x430c, 0xff},
>> +     {0x430d, 0x00},
>> +     {0x430e, 0x00},
>> +     {0x4501, 0x98}, /* R1 (default 0x18) bit[4:2]=not used */
>> +     {0x4502, 0x00},
>> +     {0x4643, 0x00},
>> +     {0x4640, 0x01},
>> +     {0x4641, 0x04},
>> +     {0x4800, 0x64},
>> +     {0x4809, 0x2b},
>> +     {0x4813, 0x90}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
>> +     {0x4817, 0x04},
>> +     {0x4833, 0x18},
>> +     {0x4837, 0x16}, /* PCLK PERIOD (default 0x08) */
>> +     {0x483b, 0x00},
>> +     {0x484b, 0x03},
>> +     {0x4850, 0x7c},
>> +     {0x4852, 0x06},
>> +     {0x4856, 0x58},
>> +     {0x4857, 0xaa},
>> +     {0x4862, 0x0a},
>> +     {0x4869, 0x18},
>> +     {0x486a, 0xaa},
>> +     {0x486e, 0x03}, /* MIPI CTRL 6E (default 0x03) */
>> +     {0x486f, 0x55},
>> +     {0x4875, 0xf0},
>> +     {0x5000, 0x89},
>> +     {0x5001, 0x42},
>> +     {0x5004, 0x40},
>> +     {0x5005, 0x00},
>> +     {0x5180, 0x00},
>> +     {0x5181, 0x10},
>> +     {0x580b, 0x03},
>> +     {0x4d00, 0x03},
>> +     {0x4d01, 0xc9},
>> +     {0x4d02, 0xbc},
>> +     {0x4d03, 0xc6},
>> +     {0x4d04, 0x4a},
>> +     {0x4d05, 0x25},
>> +     {0x4700, 0x2b},
>> +     {0x4e00, 0x2b},
>> +};
>> +
>> +#endif
>> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h b/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
>> new file mode 100644
>> index 000000000000..f3d5f0fe1b61
>> --- /dev/null
>> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
>> @@ -0,0 +1,209 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * A register configuration for Omnivision OS08A20 raw camera, 3840 x 2160 @30fps BGGR12
> Ditto.
>
>> + * Copyright (C) 2024, NXP
>> + * Copyright (C) 2024, Omnivision
>> + * Copyright (C) 2024, Verisilicon
>> + *
>> + */
>> +
>> +#ifndef _OS08A20_REGS_4K_H_
>> +#define _OS08A20_REGS_4K_H_
>> +
>> +static struct ox05b1s_reg os08a20_init_setting_4k[] = {
>> +     {0x0100, 0x00},
>> +     {0x0103, 0x01},
>> +     {0x0303, 0x01},
>> +     {0x0305, 0x3c}, /* PLL_CTRL_05 (default 0x3c) */
>> +     {0x0306, 0x00},
>> +     {0x0308, 0x03},
>> +     {0x0309, 0x04},
>> +     {0x0325, 0x47}, /* PLL_CTRL_25 (default 0x3c) */
>> +     {0x032a, 0x00}, /* PLL_CTRL_2a (default 0x00) */
>> +     {0x300f, 0x11},
>> +     {0x3010, 0x01},
>> +     {0x3011, 0x04},
>> +     {0x3012, 0x41},
>> +     {0x3016, 0xf0},
>> +     {0x301e, 0x98},
>> +     {0x3031, 0xa9},
>> +     {0x3103, 0x92},
>> +     {0x3104, 0x01},
>> +     {0x3106, 0x10},
>> +     {0x3400, 0x04}, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
>> +     {0x3025, 0x03}, /* PSV MODE OPT (default 0x02) not used */
>> +     {0x3425, 0x01}, /* R ASP PD SEL bit[1:0]=stream blanking */
>> +     {0x3428, 0x01}, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
>> +     {0x3408, 0x03}, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
>> +     {0x340c, 0xff},
>> +     {0x340d, 0xff},
>> +     {0x031e, 0x0a},
>> +     {0x3501, 0x08}, /* Long exposure */
>> +     {0x3502, 0xe5}, /* Long exposure */
>> +     {0x3505, 0x83},
>> +     {0x3508, 0x00}, /* Long gain */
>> +     {0x3509, 0x80}, /* Long gain */
>> +     {0x350a, 0x04},
>> +     {0x350b, 0x00},
>> +     {0x350c, 0x00},
>> +     {0x350d, 0x80},
>> +     {0x350e, 0x04},
>> +     {0x350f, 0x00},
>> +     {0x3600, 0x00}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
>> +     {0x3603, 0x2c},
>> +     {0x3605, 0x50},
>> +     {0x3609, 0xdb},
>> +     {0x3610, 0x39},
>> +     {0x360c, 0x01},
>> +     {0x3628, 0xa4},
>> +     {0x362d, 0x10},
>> +     {0x3660, 0xd3}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
>> +     {0x3662, 0x00},
>> +     {0x3663, 0x28},
>> +     {0x3664, 0x0d},
>> +     {0x366a, 0x38},
>> +     {0x366b, 0xa0},
>> +     {0x366d, 0x00},
>> +     {0x366e, 0x00},
>> +     {0x3680, 0x00},
>> +     {0x36c0, 0x00},
>> +     {0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x373b, 0x02},
>> +     {0x373c, 0x02},
>> +     {0x3736, 0x02},
>> +     {0x3737, 0x02},
>> +     {0x3705, 0x00},
>> +     {0x3706, 0x72},
>> +     {0x370a, 0x01},
>> +     {0x370b, 0x30},
>> +     {0x3709, 0x48},
>> +     {0x3714, 0x21}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x371c, 0x00},
>> +     {0x371d, 0x08},
>> +     {0x3740, 0x1b},
>> +     {0x3741, 0x04},
>> +     {0x375e, 0x0b},
>> +     {0x3760, 0x10},
>> +     {0x3776, 0x10},
>> +     {0x3781, 0x02},
>> +     {0x3782, 0x04},
>> +     {0x3783, 0x02},
>> +     {0x3784, 0x08},
>> +     {0x3785, 0x08},
>> +     {0x3788, 0x01},
>> +     {0x3789, 0x01},
>> +     {0x3797, 0x04},
>> +     {0x3762, 0x11},  /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x3800, 0x00},
>> +     {0x3801, 0x00},
>> +     {0x3802, 0x00},
>> +     {0x3803, 0x0c},
>> +     {0x3804, 0x0e},
>> +     {0x3805, 0xff},
>> +     {0x3806, 0x08},
>> +     {0x3807, 0x6f},
>> +     {0x3808, 0x0f}, /* X output size (default 0x07) */
>> +     {0x3809, 0x00}, /* X output size (default 0x80) */
>> +     {0x380a, 0x08}, /* Y output size (default 0x04) */
>> +     {0x380b, 0x70}, /* Y output size (default 0x38) */
>> +     {0x380c, 0x08}, /* HTS[15:8], total horizontal timing size */
>> +     {0x380d, 0x14}, /* HTS[7:0],  total horizontal timing size */
>> +     {0x380e, 0x08}, /* VTS[15:8], total vertical timing (default 0x04) */
>> +     {0x380f, 0xf0}, /* VTS[7:0],  total vertical timing (default 0xA0) */
>> +     {0x3813, 0x10}, /* ISP_Y_WIN ISP vertical windowing offset */
>> +     {0x3814, 0x01}, /* X INC ODD (default 0x01) */
>> +     {0x3815, 0x01}, /* X INC EVEN (default 0x01) */
>> +     {0x3816, 0x01}, /* Y INC ODD (default 0x01) */
>> +     {0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
>> +     {0x381c, 0x00}, /* BLC_NUM_OPTION (default 0x0e) */
>> +     {0x3820, 0x00}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
>> +     {0x3821, 0x04}, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
>> +     {0x3823, 0x08},
>> +     {0x3826, 0x00},
>> +     {0x3827, 0x08},
>> +     {0x382d, 0x08},
>> +     {0x3832, 0x02},
>> +     {0x3833, 0x00}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
>> +     {0x383c, 0x48},
>> +     {0x383d, 0xff},
>> +     {0x3d85, 0x0b},
>> +     {0x3d84, 0x40},
>> +     {0x3d8c, 0x63},
>> +     {0x3d8d, 0xd7},
>> +     {0x4000, 0xf8},
>> +     {0x4001, 0x2b},
>> +     {0x4004, 0x00},
>> +     {0x4005, 0x40},
>> +     {0x400a, 0x01},
>> +     {0x400f, 0xa0},
>> +     {0x4010, 0x12},
>> +     {0x4018, 0x00},
>> +     {0x4008, 0x02},
>> +     {0x4009, 0x0d}, /* BLC CTRL09 (default 0x0f) bl_end */
>> +     {0x401a, 0x58},
>> +     {0x4050, 0x00},
>> +     {0x4051, 0x01},
>> +     {0x4028, 0x2f},
>> +     {0x4052, 0x00},
>> +     {0x4053, 0x80},
>> +     {0x4054, 0x00},
>> +     {0x4055, 0x80},
>> +     {0x4056, 0x00},
>> +     {0x4057, 0x80},
>> +     {0x4058, 0x00},
>> +     {0x4059, 0x80},
>> +     {0x430b, 0xff},
>> +     {0x430c, 0xff},
>> +     {0x430d, 0x00},
>> +     {0x430e, 0x00},
>> +     {0x4501, 0x18}, /* R1 (default 0x18) bit[4:2]=not used */
>> +     {0x4502, 0x00},
>> +     {0x4600, 0x00},
>> +     {0x4601, 0x20},
>> +     {0x4603, 0x01},
>> +     {0x4643, 0x00},
>> +     {0x4640, 0x01},
>> +     {0x4641, 0x04},
>> +     {0x4800, 0x64},
>> +     {0x4809, 0x2b},
>> +     {0x4813, 0x90}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
>> +     {0x4817, 0x04},
>> +     {0x4833, 0x18},
>> +     {0x4837, 0x10}, /* PCLK PERIOD (default 0x08) */
>> +     {0x483b, 0x00},
>> +     {0x484b, 0x03},
>> +     {0x4850, 0x7c},
>> +     {0x4852, 0x06},
>> +     {0x4856, 0x58},
>> +     {0x4857, 0xaa},
>> +     {0x4862, 0x0a},
>> +     {0x4869, 0x18},
>> +     {0x486a, 0xaa},
>> +     {0x486e, 0x03}, /* MIPI CTRL 6E (default 0x03) */
>> +     {0x486f, 0x55},
>> +     {0x4875, 0xf0},
>> +     {0x5000, 0x89},
>> +     {0x5001, 0x42},
>> +     {0x5004, 0x40},
>> +     {0x5005, 0x00},
>> +     {0x5180, 0x00},
>> +     {0x5181, 0x10},
>> +     {0x580b, 0x03},
>> +     {0x4d00, 0x03},
>> +     {0x4d01, 0xc9},
>> +     {0x4d02, 0xbc},
>> +     {0x4d03, 0xc6},
>> +     {0x4d04, 0x4a},
>> +     {0x4d05, 0x25},
>> +     {0x4700, 0x2b},
>> +     {0x4e00, 0x2b},
>> +     {0x3501, 0x09}, /* Long exposure */
>> +     {0x3502, 0x01}, /* Long exposure */
>> +     {0x4028, 0x4f},
>> +     {0x4029, 0x1f},
>> +     {0x402a, 0x7f},
>> +     {0x402b, 0x01},
>> +     {0x0100, 0x01},
>> +};
>> +
>> +#endif
>> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h b/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
>> new file mode 100644
>> index 000000000000..2ae79ebae436
>> --- /dev/null
>> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
>> @@ -0,0 +1,199 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * A register configuration for Omnivision OS08A20 raw camera, 3840 x 2160 @30fps BGGR10 HDR
> Ditto.
>
>> + * Copyright (C) 2024, NXP
>> + * Copyright (C) 2024, Omnivision
>> + * Copyright (C) 2024, Verisilicon
>> + *
>> + */
>> +
>> +#ifndef _OS08A20_REGS_4K_HDR_H_
>> +#define _OS08A20_REGS_4K_HDR_H_
>> +
>> +static struct ox05b1s_reg os08a20_init_setting_4k_hdr[] = {
>> +     {0x0100, 0x00},
>> +     {0x0103, 0x01},
>> +     {0x0303, 0x01},
>> +     {0x0305, 0x3c}, /* PLL_CTRL_05 (default 0x3c) */
>> +     {0x0306, 0x00},
>> +     {0x0308, 0x03},
>> +     {0x0309, 0x04},
>> +     {0x032a, 0x00}, /* PLL_CTRL_2a (default 0x00) */
>> +     {0x300f, 0x11},
>> +     {0x3010, 0x01},
>> +     {0x3011, 0x04},
>> +     {0x3012, 0x41},
>> +     {0x3016, 0xf0},
>> +     {0x301e, 0x98},
>> +     {0x3031, 0xa9},
>> +     {0x3103, 0x92},
>> +     {0x3104, 0x01},
>> +     {0x3106, 0x10},
>> +     {0x340c, 0xff},
>> +     {0x340d, 0xff},
>> +     {0x031e, 0x09},
>> +     {0x3501, 0x08}, /* Long exposure */
>> +     {0x3502, 0xe5}, /* Long exposure */
>> +     {0x3505, 0x83},
>> +     {0x3508, 0x00}, /* Long gain */
>> +     {0x3509, 0x80}, /* Long gain */
>> +     {0x350a, 0x04},
>> +     {0x350b, 0x00},
>> +     {0x350c, 0x00},
>> +     {0x350d, 0x80},
>> +     {0x350e, 0x04},
>> +     {0x350f, 0x00},
>> +     {0x3600, 0x00}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
>> +     {0x3603, 0x2c},
>> +     {0x3605, 0x50},
>> +     {0x3609, 0xb5},
>> +     {0x3610, 0x39},
>> +     {0x360c, 0x01},
>> +     {0x3628, 0xa4},
>> +     {0x362d, 0x10},
>> +     {0x3660, 0x42}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
>> +     {0x3661, 0x07}, /* CORE1 (default 0x06) bit[0]=stg_hdr_align_en */
>> +     {0x3662, 0x00},
>> +     {0x3663, 0x28},
>> +     {0x3664, 0x0d},
>> +     {0x366a, 0x38},
>> +     {0x366b, 0xa0},
>> +     {0x366d, 0x00},
>> +     {0x366e, 0x00},
>> +     {0x3680, 0x00},
>> +     {0x36c0, 0x00},
>> +     {0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x373b, 0x02},
>> +     {0x373c, 0x02},
>> +     {0x3736, 0x02},
>> +     {0x3737, 0x02},
>> +     {0x3705, 0x00},
>> +     {0x3706, 0x39},
>> +     {0x370a, 0x00},
>> +     {0x370b, 0x98},
>> +     {0x3709, 0x49},
>> +     {0x3714, 0x21}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x371c, 0x00},
>> +     {0x371d, 0x08},
>> +     {0x3740, 0x1b},
>> +     {0x3741, 0x04},
>> +     {0x375e, 0x0b},
>> +     {0x3760, 0x10},
>> +     {0x3776, 0x10},
>> +     {0x3781, 0x02},
>> +     {0x3782, 0x04},
>> +     {0x3783, 0x02},
>> +     {0x3784, 0x08},
>> +     {0x3785, 0x08},
>> +     {0x3788, 0x01},
>> +     {0x3789, 0x01},
>> +     {0x3797, 0x04},
>> +     {0x3762, 0x11}, /* Sensor timing control registers 0x3700-0x37ff */
>> +     {0x3800, 0x00},
>> +     {0x3801, 0x00},
>> +     {0x3802, 0x00},
>> +     {0x3803, 0x0c},
>> +     {0x3804, 0x0e},
>> +     {0x3805, 0xff},
>> +     {0x3806, 0x08},
>> +     {0x3807, 0x6f},
>> +     {0x3808, 0x0f}, /* X output size (default 0x07) */
>> +     {0x3809, 0x00}, /* X output size (default 0x80) */
>> +     {0x380a, 0x08}, /* Y output size (default 0x04) */
>> +     {0x380b, 0x70}, /* Y output size (default 0x38) */
>> +     {0x380c, 0x08}, /* HTS[15:8], total horizontal timing size */
>> +     {0x380d, 0x18}, /* HTS[7:0],  total horizontal timing size */
>> +     {0x380e, 0x09}, /* VTS[15:8], total vertical timing (default 0x04) */
>> +     {0x380f, 0x0a}, /* VTS[7:0],  total vertical timing (default 0xA0) */
>> +     {0x3813, 0x10}, /* ISP_Y_WIN ISP vertical windowing offset */
>> +     {0x3814, 0x01}, /* X INC ODD (default 0x01) */
>> +     {0x3815, 0x01}, /* X INC EVEN (default 0x01) */
>> +     {0x3816, 0x01}, /* Y INC ODD (default 0x01) */
>> +     {0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
>> +     {0x381c, 0x08}, /* BLC_NUM_OPTION (default 0x0e) */
>> +     {0x3820, 0x00}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
>> +     {0x3821, 0x24}, /* FORMAT2 bit[5]=stagger hdr en, bit[2]=mirror */
>> +     {0x3823, 0x08},
>> +     {0x3826, 0x00},
>> +     {0x3827, 0x08},
>> +     {0x382d, 0x08},
>> +     {0x3832, 0x02},
>> +     {0x3833, 0x01}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
>> +     {0x383c, 0x48},
>> +     {0x383d, 0xff},
>> +     {0x3d85, 0x0b},
>> +     {0x3d84, 0x40},
>> +     {0x3d8c, 0x63},
>> +     {0x3d8d, 0xd7},
>> +     {0x4000, 0xf8},
>> +     {0x4001, 0x2b},
>> +     {0x4004, 0x00},
>> +     {0x4005, 0x40},
>> +     {0x400a, 0x01},
>> +     {0x400f, 0xa0},
>> +     {0x4010, 0x12},
>> +     {0x4018, 0x00},
>> +     {0x4008, 0x02},
>> +     {0x4009, 0x0d}, /* BLC CTRL09 (default 0x0f) bl_end */
>> +     {0x401a, 0x58},
>> +     {0x4050, 0x00},
>> +     {0x4051, 0x01},
>> +     {0x4028, 0x2f},
>> +     {0x4052, 0x00},
>> +     {0x4053, 0x80},
>> +     {0x4054, 0x00},
>> +     {0x4055, 0x80},
>> +     {0x4056, 0x00},
>> +     {0x4057, 0x80},
>> +     {0x4058, 0x00},
>> +     {0x4059, 0x80},
>> +     {0x430b, 0xff},
>> +     {0x430c, 0xff},
>> +     {0x430d, 0x00},
>> +     {0x430e, 0x00},
>> +     {0x4501, 0x18}, /* R1 (default 0x18) bit[4:2]=not used */
>> +     {0x4502, 0x00},
>> +     {0x4643, 0x00},
>> +     {0x4640, 0x01},
>> +     {0x4641, 0x04},
>> +     {0x4800, 0x64},
>> +     {0x4809, 0x2b},
>> +     {0x4813, 0x98}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
>> +     {0x4817, 0x04},
>> +     {0x4833, 0x18},
>> +     {0x4837, 0x10}, /* PCLK PERIOD (default 0x08) */
>> +     {0x483b, 0x00},
>> +     {0x484b, 0x03},
>> +     {0x4850, 0x7c},
>> +     {0x4852, 0x06},
>> +     {0x4856, 0x58},
>> +     {0x4857, 0xaa},
>> +     {0x4862, 0x0a},
>> +     {0x4869, 0x18},
>> +     {0x486a, 0xaa},
>> +     {0x486e, 0x07}, /* MIPI CTRL 6E (default 0x03) */
>> +     {0x486f, 0x55},
>> +     {0x4875, 0xf0},
>> +     {0x5000, 0x89},
>> +     {0x5001, 0x42},
>> +     {0x5004, 0x40},
>> +     {0x5005, 0x00},
>> +     {0x5180, 0x00},
>> +     {0x5181, 0x10},
>> +     {0x580b, 0x03},
>> +     {0x4d00, 0x03},
>> +     {0x4d01, 0xc9},
>> +     {0x4d02, 0xbc},
>> +     {0x4d03, 0xc6},
>> +     {0x4d04, 0x4a},
>> +     {0x4d05, 0x25},
>> +     {0x4700, 0x2b},
>> +     {0x4e00, 0x2b},
>> +     {0x3501, 0x08}, /* Long exposure */
>> +     {0x3502, 0xe1}, /* Long exposure */
>> +     {0x3511, 0x00}, /* Short exposure */
>> +     {0x3512, 0x20}, /* Short exposure */
>> +     {0x3833, 0x01},
>> +};
>> +
>> +#endif
>> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>> index 5b9c069af19b..15559265d8f0 100644
>> --- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>> @@ -42,6 +42,7 @@ struct ox05b1s_sizes {
>>        u32     sizes[OX05B1S_MAX_SIZES][2];
>>   };
>>
>> +struct ox05b1s;
>>   struct ox05b1s_plat_data {
>>        char                            name[20];
>>        u32                             chip_id;
>> @@ -56,6 +57,9 @@ struct ox05b1s_plat_data {
>>        u32                             default_mode_index;
>>        const struct ox05b1s_sizes      *supported_codes;
>>        u32                             supported_codes_count;
>> +     const char * const              *hdr_modes;
>> +     u32                             hdr_modes_count;
>> +     int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
>>   };
>>
>>   struct ox05b1s_ctrls {
>> @@ -66,6 +70,7 @@ struct ox05b1s_ctrls {
>>        struct v4l2_ctrl *vblank;
>>        struct v4l2_ctrl *gain;
>>        struct v4l2_ctrl *exposure;
>> +     struct v4l2_ctrl *hdr_mode;
>>   };
>>
>>   struct ox05b1s_reg {
>> @@ -73,6 +78,9 @@ struct ox05b1s_reg {
>>        u32 data;
>>   };
>>
>> +#include "os08a20_regs_1080p.h"
>> +#include "os08a20_regs_4k.h"
>> +#include "os08a20_regs_4k_hdr.h"
>>   #include "ox05b1s_regs_5mp.h"
>>
>>   struct ox05b1s_mode {
>> @@ -104,6 +112,68 @@ struct ox05b1s {
>>        struct ox05b1s_ctrls ctrls;
>>   };
>>
>> +static struct ox05b1s_mode os08a20_supported_modes[] = {
>> +     {
>> +             /* 1080p BGGR10, no hdr, 60fps */
>> +             .index          = 0,
>> +             .width          = 1920,
>> +             .height         = 1080,
>> +             .code           = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +             .bpp            = 10,
>> +             .vts            = 0x4a4,
>> +             .hts            = 0x790,
>> +             .exp            = 0x4a4 - 8,
>> +             .h_bin          = true,
>> +             .fps            = 60,
>> +             .reg_data       = os08a20_init_setting_1080p,
>> +             .reg_data_count = ARRAY_SIZE(os08a20_init_setting_1080p),
>> +     },
>> +     {
> These fit on the same line.
>
>> +             /* 4k BGGR10, staggered hdr VC0/VC1, 15fps */
>> +             .index          = 1,
>> +             .width          = 3840,
>> +             .height         = 2160,
>> +             .code           = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +             .bpp            = 10,
>> +             .vts            = 0x90a,
>> +             .hts            = 0x818,
>> +             .exp            = 0x90a - 8,
>> +             .h_bin          = false,
>> +             .fps            = 15,
>> +             .reg_data       = os08a20_init_setting_4k_hdr,
>> +             .reg_data_count = ARRAY_SIZE(os08a20_init_setting_4k_hdr),
>> +     },
>> +     {
>> +             /* 4k BGGR12, no hdr, 30fps */
>> +             .index          = 2,
>> +             .width          = 3840,
>> +             .height         = 2160,
>> +             .code           = MEDIA_BUS_FMT_SBGGR12_1X12,
>> +             .bpp            = 12,
>> +             .vts            = 0x8f0,
>> +             .hts            = 0x814,
>> +             .exp            = 0x8f0 - 8,
>> +             .h_bin          = false,
>> +             .fps            = 30,
>> +             .reg_data       = os08a20_init_setting_4k,
>> +             .reg_data_count = ARRAY_SIZE(os08a20_init_setting_4k),
>> +     },
>> +};
>> +
>> +/* keep in sync with os08a20_supported_modes*/
>> +static const struct ox05b1s_sizes os08a20_supported_codes[] = {
>> +     {
>> +             .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +             .sizes_count = 2,
> This doesn't seem like very nice to maintain. :-(
>
> Could you make sizes a pointer instead?
I'll check it.
>
>> +             .sizes = { {1920, 1080}, {3840, 2160} }
> Spaces inside braces, please.
>
>> +     },
>> +     {
>> +             .code = MEDIA_BUS_FMT_SBGGR12_1X12,
>> +             .sizes_count = 1,
>> +             .sizes = { {3840, 2160} }
>> +     },
>> +};
>> +
>>   static struct ox05b1s_mode ox05b1s_supported_modes[] = {
>>        {
>>                .index          = 0,
>> @@ -210,6 +280,18 @@ static int ox05b1s_read_reg(struct ox05b1s *sensor, u16 reg, u8 *val)
>>        return ret;
>>   }
>>
>> +static int ox05b1s_update_bits(struct ox05b1s *sensor, u16 reg, unsigned int mask, u8 val)
>> +{
>> +     struct device *dev = &sensor->i2c_client->dev;
>> +     int ret = 0;
> The initialisation is redundant.
>
>> +
>> +     ret = regmap_update_bits(sensor->regmap, reg, mask, val);
>> +     if (ret < 0)
>> +             dev_err(dev, "Failed to update reg addr 0x%04x with 0x%02x\n", reg, val);
>> +
>> +     return ret;
>> +}
>> +
>>   #define OX05B1S_MAX_REG_BULK 16
>>   static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
>>                                   struct ox05b1s_reg *reg_array,
>> @@ -239,6 +321,67 @@ static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
>>        return 0;
>>   }
>>
>> +static const char * const os08a20_hdr_modes[] = {
>> +     "NO HDR",               /* No HDR, single exposure */
>> +     "HDR Staggered",        /* Staggered HDR mode, 2 exposures on separate virtual channels */
>> +};
>> +
>> +#define OS08A20_REG_CORE1            0x3661
>> +#define OS08A20_STG_HDR_ALIGN_EN     BIT(0)
>> +
>> +#define OS08A20_REG_FORMAT2          0x3821
>> +#define OS08A20_STG_HDR_EN           BIT(5)
>> +
>> +#define OS08A20_REG_MIPI_CTRL_13     0x4813
>> +#define OS08A20_MISTERY_BIT3         BIT(3)
>> +
>> +#define OS08A20_REG_MIPI_CTRL_6E     0x486e
>> +#define OS08A20_MIPI_VC_ENABLE               BIT(2)
>> +
>> +static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
>> +{
>> +     int ret = 0;
>> +
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_CORE1, OS08A20_STG_HDR_ALIGN_EN,
>> +                                OS08A20_STG_HDR_ALIGN_EN);
> How about returning the actual error code to the caller?
Although unlikely, we could get different error codes from 
ox05b1s_update_bits calls, so, for safety, returned -EIO.
> Also this requires reading the registers over I²C that is slow. If it's not
> during streaming it should be fine though.
Yes, this is not meant to be done during streaming, but in the initial 
phase only.
>
> I'd probably make this a loop.

Will check.

For your other comments, I will address them in the next version, thanks.

Regards,

Mirela

>
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_FORMAT2, OS08A20_STG_HDR_EN,
>> +                                OS08A20_STG_HDR_EN);
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_13, OS08A20_MISTERY_BIT3,
>> +                                OS08A20_MISTERY_BIT3);
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_6E, OS08A20_MIPI_VC_ENABLE,
>> +                                OS08A20_MIPI_VC_ENABLE);
>> +     if (ret)
>> +             ret = -EIO;
>> +
>> +     return ret;
>> +}
>> +
>> +static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
>> +{
>> +     int ret = 0;
>> +
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_CORE1, OS08A20_STG_HDR_ALIGN_EN, 0);
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_FORMAT2, OS08A20_STG_HDR_EN, 0);
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_13, OS08A20_MISTERY_BIT3, 0);
>> +     ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_6E, OS08A20_MIPI_VC_ENABLE, 0);
>> +     if (ret)
>> +             ret = -EIO;
>> +
>> +     return ret;
>> +}
>> +
>> +static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
>> +{
>> +     switch (hdr_mode) {
>> +     case 0:
>> +             return os08a20_disable_staggered_hdr(sensor);
>> +     case 1:
>> +             return os08a20_enable_staggered_hdr(sensor);
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +}
>> +
>>   static int ox05b1s_set_hts(struct ox05b1s *sensor, u32 hts)
>>   {
>>        u8 values[2] = { (u8)(hts >> 8) & 0xff, (u8)(hts & 0xff) };
>> @@ -307,6 +450,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
>>        case V4L2_CID_EXPOSURE:
>>                ret = ox05b1s_set_exp(sensor, ctrl->val);
>>                break;
>> +     case V4L2_CID_HDR_SENSOR_MODE:
>> +             if (sensor->model->set_hdr_mode)
>> +                     ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
>> +             else
>> +                     ret = -EINVAL;
>> +             break;
>>        default:
>>                ret = -EINVAL;
>>                break;
>> @@ -369,6 +518,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
>>        ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>>                                        0, 0xFFFF, 1, 0x80);
>>
>> +     if (sensor->model->hdr_modes)
>> +             ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
>> +                                                            sensor->model->hdr_modes_count - 1,
>> +                                                             0, 0, sensor->model->hdr_modes);
>> +     else
>> +             ctrls->hdr_mode = NULL;
>> +
>>        if (hdl->error) {
>>                ret = hdl->error;
>>                goto free_ctrls;
>> @@ -670,7 +826,10 @@ static u8 ox05b1s_code2dt(const u32 code)
>>   {
>>        switch (code) {
>>        case MEDIA_BUS_FMT_SGRBG10_1X10:
>> +     case MEDIA_BUS_FMT_SBGGR10_1X10:
>>                return MIPI_CSI2_DT_RAW10;
>> +     case MEDIA_BUS_FMT_SBGGR12_1X12:
>> +             return MIPI_CSI2_DT_RAW12;
>>        default:
>>                return MIPI_CSI2_DT_RAW10;
>>        }
>> @@ -775,6 +934,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
>>        }
>>
>>        switch (chip_id) {
>> +     case 0x530841:
>> +             camera_name = "os08a20";
>> +             break;
>>        case 0x580542:
>>                camera_name = "ox05b1s";
>>                break;
>> @@ -915,6 +1077,26 @@ static void ox05b1s_remove(struct i2c_client *client)
>>   static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
>>                                 ox05b1s_runtime_resume, NULL);
>>
>> +static const struct ox05b1s_plat_data os08a20_data = {
>> +     .name                   = "os08a20",
>> +     .chip_id                = 0x530841,
>> +     .native_width           = 3872, /* 16 dummy + 3840 active pixels + 16 dummy */
>> +     .native_height          = 2192, /* 16 dummy + 2160 active lines + 16 dummy */
>> +     .active_top             = 16,
>> +     .active_left            = 16,
>> +     .active_width           = 3840,
>> +     .active_height          = 2160,
>> +     .supported_modes        = os08a20_supported_modes,
>> +     .supported_modes_count  = ARRAY_SIZE(os08a20_supported_modes),
>> +     .default_mode_index     = 0,
>> +     .supported_codes        = os08a20_supported_codes,
>> +     .supported_codes_count  = ARRAY_SIZE(os08a20_supported_codes),
>> +     .hdr_modes              = os08a20_hdr_modes,
>> +     .hdr_modes_count        = ARRAY_SIZE(os08a20_hdr_modes),
>> +     .set_hdr_mode           = os08a20_set_hdr_mode,
>> +
>> +};
>> +
>>   static const struct ox05b1s_plat_data ox05b1s_data = {
>>        .name                   = "ox05b1s",
>>        .chip_id                = 0x580542,
>> @@ -929,9 +1111,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
>>        .default_mode_index     = 0,
>>        .supported_codes        = ox05b1s_supported_codes,
>>        .supported_codes_count  = ARRAY_SIZE(ox05b1s_supported_codes),
>> +     .hdr_modes              = NULL,
>> +     .hdr_modes_count        = 0,
>> +     .set_hdr_mode           = NULL,
>>   };
>>
>>   static const struct of_device_id ox05b1s_of_match[] = {
>> +     {
>> +             .compatible = "ovti,os08a20",
>> +             .data = &os08a20_data,
>> +     },
>>        {
>>                .compatible = "ovti,ox05b1s",
>>                .data = &ox05b1s_data,
> --
> Kind regards,
>
> Sakari Ailus

