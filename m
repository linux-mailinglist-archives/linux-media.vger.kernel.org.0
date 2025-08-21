Return-Path: <linux-media+bounces-40528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57620B2EF2E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0580B16AFF2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEC42C11E0;
	Thu, 21 Aug 2025 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="sGD2eD7E"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020096.outbound.protection.outlook.com [52.101.84.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC927F732;
	Thu, 21 Aug 2025 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760385; cv=fail; b=L6kc2EML7RzUi7/ZqOzTptV56hV8JyxHa77JOnzCqaG0sVV7ivsW8/cKA5u2I+jx5T5bvsGCkmjClyHsWrHRYfnUDFbKYyFr/xSE++aueBT4LdZLHxj6IuRV+dPJbxPgAkyz1IscJcjZyBjvtR+pjs57ImH2LdbvEr2eJ1KSwHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760385; c=relaxed/simple;
	bh=eX2N4h64JEZ4Gt+elYZ20ZFXhhTxvOql4LgokDhDHXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QvEgakGnM9HrGbPUi6v9pjc1SHMxBdnXy26XgT/l5bqeT++vrRAgl5S+NuEzxDoJHSKYqvV2TPJPfBQ60DOijfIb5T0A4Q6VzkEdgauky6J1QU42ZW4Ao1g8K96kOQ7atWi4933I2TmNL7KuE/n37LUSIv8U+9TyeJLUpZUAz3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=sGD2eD7E; arc=fail smtp.client-ip=52.101.84.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKCpZOgpVOYXZt8q39kSMQ4LQpRSagsuFyITx5ZEu36++dsg7q+J1b2yD+Xx7dnOHCjQ60+HRynMeJTRMP93phXBjHiDVRu18EDoVNKH2e5wdhyUprRm3Y6QAdCpwN6MhTBW7lR/sLXqrckuYjJrlVZRH1GKj/uXxbSoXViUNvYrch4sUERkNmXcmYUQCHlxVymVFF0jaggKjfshuJkD0CrtlZ2Wl1py3icRRfvzlZPIfHs9/ZNyk+IsrSRpRYQ831gdHxp7UIt2871XT2bFeJq/nxZlEeXcoNvjIo0hIegRcJVexvJPcmeg0kxcj+8a8EiItvXHgpeAtxG71ymB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuBd3LuT5Xuue9fzr+0OFXAsE9ygMeMJflYzGjAziTo=;
 b=bascHanH+OOWAM9Slh4LQ9ctZIugIe9qL7OrzITQ3/QuONwAvQPM7RvvQAlf+YQ9m7neFtdVaRcDiAFBj1/hgwEWc1Kju95Pu26Rn/3B+BC5dbAa+TxkIswgdhAm5DyedWv/hYXuQ4Ft2RnxjgO73bcTLAD21fGmctv304S/hZFLXIoakch2A3dWfvKv9NuWi7NrAHbBobzUlr5Jzn0KsKjPMZyeIma1ckc5zMfFRimse3Ipu1iQg0WhLgOVgs+QnVjNytTuaSeRLh5PArgkwr8J584XaJx8q4lqrveq+XMc7DqHa3NXeybIWPUC9BtzNWgNipNyi/1cVMXtuRQpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuBd3LuT5Xuue9fzr+0OFXAsE9ygMeMJflYzGjAziTo=;
 b=sGD2eD7EEjAbP38SWl9p9YMtQHSizCAEq0sLgA6s5aca90WAfBy6LOuXzsf7puCn2eRmXgxyAkNmYBvS4TaQYjCE8ammdRYvjHRt7U9ys5Qh/BOoif1zz1gcNuia7gdqM0IFXHQK0K2W2d19VnFeqjPUtQKv1xiPn9Dgye+KqX/OMkQQwoWDzCh6BtNpz+aepJcUB8p82nit94v6Hl9e6zaq5VMGemM61EIcaRzP3VC/wz2pB/tIzRHMOUmM+lAyw02FuckRivjB2RdsGMQ2tVfXLLJNnSIDRp4ZyS1Ufwoyi0e3wODKJHnaEey3wU+nJRdseBG0eLEabJo8cRrLBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by VI2PR04MB10907.eurprd04.prod.outlook.com (2603:10a6:800:271::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 07:12:57 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:12:57 +0000
Message-ID: <ad489c18-c01e-4b50-a713-a060b894111b@gocontroll.com>
Date: Thu, 21 Aug 2025 09:12:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: mc: Fix MUST_CONNECT handling for pads with no
 links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>,
 =?UTF-8?Q?Martin_Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
 stable@vger.kernel.org
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
 <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:208:14::48) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|VI2PR04MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d313dd-a282-4f37-d0df-08dde0822782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0t6SGEzUUdSSmdrZDIvQ2QxdGRBNCt5alFTQm1JR3hSbEV4M2YrZWtQZCs1?=
 =?utf-8?B?Z0tBMWVKNmpFQzkwUmJKVlJRaEI4Qk5DcmhpSUcxRXZ2cmo4azN2LzRsbmVl?=
 =?utf-8?B?Q21UNWszZUM3SkU3WkRlMzBWNVNmU3U3NkVRem9JZlhzYnVScHZmdEF0SExU?=
 =?utf-8?B?amhuK0ZHOHY1b042cGVhaG16V2FRZjNZOWJ6ekt5eGZCYklqeUdub1lCY1RK?=
 =?utf-8?B?cm1ZNHNFNnJ0MzVvM20za1Y2RExIcVAyZnBDZ25OUytNVGdwOWw4aFErYkZI?=
 =?utf-8?B?cnk2R3oxUzRuWHBFcUo0bDc0MzFybTF0NC9ybkNRbVdOM3NFbDNNZmhQMVdW?=
 =?utf-8?B?eUNtU21WT2V1K3pSQ2dKQlVucSthN002a3hKc0ZvcHNIay83MU11aGFMOEJI?=
 =?utf-8?B?SUdJcDRUYmFVRm53ZzlJeXZaRUR0QjhXNm80RUVRbUxmYnl6Y1l3L1FjbGV6?=
 =?utf-8?B?amZHc2t4T3pHUTF4R0hkdVRkMjEvUEFOTUtTcWhDZHU0aFpIZmw3VjBoN2Js?=
 =?utf-8?B?eDJhVmFDYlNueXZadE5OeWVvTmx1OVZzVDJLZUE5TEtKenZWanFFQk15S0dD?=
 =?utf-8?B?N1UxWW1YTVhSNHpDUlpXNlZONVl1dHNESTJtRmk5VUlOMXJwN3RyVXRtcDl5?=
 =?utf-8?B?UnFmbmRVQjAvVGZXeVZnQXhDclQrM1VxVlhEbGFlOTIwcjhRcEd4dGh0aWEx?=
 =?utf-8?B?TTh4M2FiYXptSFBwdmprcGsvcURTbVpKSG5CVlhYRVBYWi83OU5mdVAzOWQ3?=
 =?utf-8?B?Y1Uxa0h5QWNtTmZZUlM2NnVYYTE3MEVyL1p0SkRuNllYVU5pYWpMbVpxZ2Ju?=
 =?utf-8?B?Q1JRM01qdytLVlRvbjhjQ3JwSmNzR296cTY5emJldU1neHJONjJjeEdEaGo5?=
 =?utf-8?B?UXZ4SHZrMmwvTkZJMTZ2dncyejhxSTBOYk16UmpmNm9JcFBJc3UxNWoydWFB?=
 =?utf-8?B?b20xWGdVMGtSak5hU0NZTmQzV2tqZW5FR3ZUdE9uM2xTOFA4Y1ozRmxiS3cr?=
 =?utf-8?B?MVJZUHdCMEFOV1kzM0d2T2V1YjQwRTFGRFNVcDlqSys5eXRGakNFeERjeE52?=
 =?utf-8?B?RW5zVmtzcmVHRlFPOU9tYkpYQStWVUpQSVpuT2czV3dRa1RCM3ZsaS90OFVZ?=
 =?utf-8?B?MnJva25MeWRPUWhyV3VLdHM5QTl4THl5ZHBZM2x1eWNncnlIaUV0QVFqTTZW?=
 =?utf-8?B?M3c0RUZXSUhhbStBUjlkdngzc003YWphaS82cDBEdk50QVp0ZU1EbmY2b0RN?=
 =?utf-8?B?cnBkUFRyR1ZiWkpUL0tnNmNwT28xa1N4bGZXMUwwWkNPR2szcEVnMW51S2tL?=
 =?utf-8?B?c0FCcFkvVDlJQ3dpWU8vTjI4cFpqa3VTaXQ0NUhMSGtoVGxhWnFZV2JQVkZ2?=
 =?utf-8?B?TkVwc0lTdC9yR080WUNwQjVvSlhhcDUzeUNxbnA5SE9GTyszTkpuUk5BMEta?=
 =?utf-8?B?WmFaOENxa0c1VkdNSDlDT0NSejgxUGVINmNzQ21iUytSWmJOaVd0M1VjdUUx?=
 =?utf-8?B?YUx4UHVyK1NwRzdFSW55WWNOMUJsVWcrRjl5WlB6TlFQMDN2Z2Jvd2l4TDcy?=
 =?utf-8?B?Vk5KdXJmNFdGby81Rll4VVVYSkJyczdFM28zNWZGbk83UFFsK2hyeS9RZEVy?=
 =?utf-8?B?dnVvSDRXenRkZHdxRzNuWkJ3OW5vWTlUaUc3Q1Q3b2pGL3BKRGRRamR5eVNX?=
 =?utf-8?B?R2Z5M1pWQlI0Y3g3OGRaUWJJQ0JnTDZDVDJ0Y2lrbzloKzhUanlnMWxiWW4y?=
 =?utf-8?B?Y082Uk53UXNqa2tVQndGV1ZoL0tncUdGaUpwNi9zSzZrMExqeGQ5S2lJVFFQ?=
 =?utf-8?B?VWxtU0UzN2pQdkpPZ05WZWxIV0lUY3dIRnRvNm5rS25LYXBBdlVFK0lrS3My?=
 =?utf-8?B?cHE4TzFsV0tmNy81N1AzZSttaXZCa3ZBTWhCVUQ5RmEweXo2N0JNKzUvdDFG?=
 =?utf-8?Q?nBSwcCarapM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckp1T1BKM3dvR3BhZS9DRFJHUnpCNytyanh0SEVnMUZpa0NkT0hSaDhyN1Ju?=
 =?utf-8?B?RHRZbHhqeUVVSjFId2kxbmN0OTdJWlZjK1VSamJkZFZCTThKMXJXUmszR1hH?=
 =?utf-8?B?Zk85RzZRQXpqZ0NvUlVwQjJZcVgrNzdhTHEzRTBvSUpwUnQ4eWRjNEZTZ3BV?=
 =?utf-8?B?amRRMTlJTjYvVkRIU1JhRzFuS1plQWJuckp3SlVrZHZXcGRLbjR0b1F3dlBa?=
 =?utf-8?B?aklyczRTM2Vqd2U1NHRxMjFicHJvWE1PTDN5cGFyV1RuMklxSzBtaDFXazBy?=
 =?utf-8?B?c2NQbjNvUGlZWVJ4dzlJTVVQeGtXSTJ0S1pDankyR0dHS3owQ2N2TFBKcHVK?=
 =?utf-8?B?Sy9iS1MrYXltRGNzNDk5aUZXT1hYdUttREE1clFpR3ZrN2tibUlHaFBLTEh2?=
 =?utf-8?B?UjBBZ1h0eVNXUjJWbThwb1ZBVWNaWDNwVmRPNFVLdmptTU9wSzhsa2RicW1L?=
 =?utf-8?B?R2FDTUdNKzFuR1ZKck96TG4xVlV0M2ZSbTFiWEg5Q3ZmQkIxSDNsWmxMR1cx?=
 =?utf-8?B?VDhuYm5jcUZlSVN6K1hGMG9BRUFueVNDQ2prY044d0NGSVVCMzBjRDQwcDZT?=
 =?utf-8?B?YkZFQ0pyZDdkZ2ZmRnBwMXJkbEdWZWlTbkpCV3ZBNkJ3ZDRDYm5SYkhJc1BP?=
 =?utf-8?B?TzBLUXdVYVRJZC9ablJFRGV1MVZoMDZ0V3ppZlhnRVRBOWtxa0tuclFYdUZG?=
 =?utf-8?B?Z284UGgvOC8rWEMxZDF0OEtveHdoOGNHR2phNTZLdUYxVUlCcWJjOXlRVzhL?=
 =?utf-8?B?KzlucjJqZ3FlZmswMHhGM1RKRkdVbEY0STdGU3FBdHYrZS9vdElLb2FWYTY0?=
 =?utf-8?B?WlVXZ2JEbmplUW1hSlJzZ1ZKUzJhVjJGelpNSWlqZ3poYTJFbitxL2VYQThu?=
 =?utf-8?B?d3ozL2VLOWY0NmZMdm41dzIzbytnZzZFcFNnNE1qckhUYzVVZWltNzNQTDRY?=
 =?utf-8?B?bnh1SGFldG42clpmVnFLeFJWbjNIcjdRTzVWTjd2eWRkTlp4MEp5c3FWQVZl?=
 =?utf-8?B?dmFQNEtacjdsV3UrYWt2cWUvZDd5RklKcUpROUsvVWFyWnV2OUtQZVo0MWtI?=
 =?utf-8?B?RUFmWEFSMXRtT240WDdaczJaR00weFEyK2w1SmZtZm0wREhVdDRjNWRFV2cz?=
 =?utf-8?B?ckFuNlkrOEd0Qnlxa09DczdwWkNzeUJ1QVJkOC9QL1EzNUlvZ0lISklJaDhk?=
 =?utf-8?B?bWY2R3RKT09uaFliWDRUOXRUbGxGZElpQ0YrcDNXMk4xVFZKY1ZWNXpHSE1n?=
 =?utf-8?B?UTRTUXpjdk4rQVJ5ZkJEL0xGbzkvakJ3NHZncllVelNxTzlrcWx1KzZJYUlk?=
 =?utf-8?B?U3NPVlBPL3Z4cXQwTmY4cG5uVkNNeGhRUWFJL1N6ZEZ5S2t2UEVGaG1iNEE1?=
 =?utf-8?B?aXhqcWcrYkEwaDY4enJITFRvNUJFR0ZGN2tVdTkwd2lZZWQ0a1VnakR6aVdM?=
 =?utf-8?B?cncxdWU1S1RzRkhNR2dtWlZLc1pyVGM5NE54R3dGeG40Y01YZTBlTUNaOFhE?=
 =?utf-8?B?WGkrQ0NLZ0dleEFlMjBQRWFRVVZwNktlTWRPZWdjanlGOGdrUkZKMWhqSmt1?=
 =?utf-8?B?Qm9PaWlLV0J0RnJiaTlsNDRTNjNURXVsZXdzc2w3QndkRVF4cU9iemxTNGhn?=
 =?utf-8?B?VlVvblhLb05YWk05cnc0c2hLL3pCT0RPa3JRV1dwQ1hrV04yRjVoVzhnRVZp?=
 =?utf-8?B?aVlVUjRnc0M4TFozckRqbWRkYUhqQlVLM1dFQ1h3eG1yOEs0eEYvaWxrUGJL?=
 =?utf-8?B?VnhSQnZrcEZZSFh1TzFNRlA5ajQweGliWjFLYWg2UjQza3J5TkpVd2grVXht?=
 =?utf-8?B?QkcrTnJhOStDOWppY1V5aUVLN3duQXdkQzY1VFlXUmVQZFp4R0crNVVEM2p2?=
 =?utf-8?B?S3VDNGdmRnJnZVMvd1lSRFdWdm5tZDBTVjNYaXptcFRCNVdIbG8yaG9kQVhl?=
 =?utf-8?B?ZFpDSG1RRXBBb1JLbnVLc0JWcmh5YzUvSWhBQVV4Vng2OW1Yd3Vyb2hYYTNO?=
 =?utf-8?B?dnJDaml3c2F3MGxZTjd1bTIrc0dvWVoxaS9KdDFXS3daMWNFQjhrd3NjSmE5?=
 =?utf-8?B?YVBvLzdSSzZ3U29lbUVFUVlmTG96OVVQdDhxREh2RlNRdzY0dGZsR3VSTWNm?=
 =?utf-8?B?N1h5dXd5dDV2ajdVdXQ2c3J4WkdCallpaTJxMmc1QXBoMks0ZHFvUmd5OW5P?=
 =?utf-8?B?WWl6M3BjUlErTWxMS282aUdYZFNvVFVHV0dnVWZTbVd5c2tHYTgrYldOMTdH?=
 =?utf-8?B?OFV6bVZoK2dOL0prM2tmN0tSeHZnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d313dd-a282-4f37-d0df-08dde0822782
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:12:57.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbWdVuHWQs10ZJgO3PIkjGKZHl/eQs3GuHTGQWofp0zojNVDeSt5Ffnug8i9hB3khrta3qhEztWFaKUzbpdyIR7gqOJfmnrA+5c1Qf+V7xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10907

On 8/20/25 16:00, Laurent Pinchart wrote:
> Commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> require an enabled link") expanded the meaning of the MUST_CONNECT flag
> to require an enabled link in all cases. To do so, the link exploration
> code was expanded to cover unconnected pads, in order to reject those
> that have the MUST_CONNECT flag set. The implementation was however
> incorrect, ignoring unconnected pads instead of ignoring connected pads.
> Fix it.
> 
> Reported-by: Martin Kepplinger-Novaković <martink@posteo.de>
> Closes: https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@posteo.de
> Reported-by: Maud Spierings <maudspierings@gocontroll.com>
> Closes: https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com
> Fixes: b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always require an enabled link")
> Cc: stable@vger.kernel.org # 6.1
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/mc/mc-entity.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 04d69f042a0e..928613d60e8f 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -696,7 +696,7 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
>   		 * (already discovered through iterating over links) and pads
>   		 * not internally connected.
>   		 */
> -		if (origin == local || !local->num_links ||
> +		if (origin == local || local->num_links ||
>   		    !media_entity_has_pad_interdep(origin->entity, origin->index,
>   						   local->index))
>   			continue;

The panic is now replaced with an error in userspace as it should be.

[video4linux2,v4l2 @ 0xaaaaceb8bc60] ioctl(VIDIOC_STREAMON): Link has 
been severed
[in#0 @ 0xaaaaceb36510] Error opening input: Link has been severed
Error opening input file /dev/video2.
Error opening input files: Link has been severed

Reported-and-tested-by: Maud Spierings <maudspierings@gocontroll.com>

Thanks!

Kind regards,
Maud


