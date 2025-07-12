Return-Path: <linux-media+bounces-37544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA29B02C1E
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 19:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42D5F7A6C1D
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 17:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020AE288CB5;
	Sat, 12 Jul 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LLqHLwmU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503527C145
	for <linux-media@vger.kernel.org>; Sat, 12 Jul 2025 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752340915; cv=fail; b=Y35mej2bWEE826tkiz/uF0l78YalRJTva3nnK2hCzegPFeJrj50a9Lm1LgRxbNiXxq7ZC+l3mZFNp1MhP5ZaHUXvooDVVV43wRtec/CduGZxGchxavDkiy2KIL/hKi50a+mWaOIQvm8QKPVUUpyWWlhCxt8L3YltWsw0xUuIDDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752340915; c=relaxed/simple;
	bh=a7/fb9yY2kS09xaVWYyyGMZAu303/pbhzZQRIQGI1Nk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DWxfwQnEi9X0I+vaCHwozcFOeSCsGRvjOpnwFxnVqQOY2Nh4dIdCl9V9I3XxX0+DUxiPxJYTgTDqBlp+4x8gSDVpoBbEVJj9BgqHHtD4/yn1MTliF3vB3oJ1+fhLnfK/I1EJJLlcL1FvjjS7o4EizAmC/jPOPj61zcA3RlPIoFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LLqHLwmU; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTKBfi+MAgdkieaXaICKVt4c07ZyrZ+fntcNKAIZnauGTLWmIs1FoQmKwz8+xtkVC32cj2QaU8zPX1vTkoHKSgRHm+07K8SmAPQSuk4PG0Bqjzqu42qet+LDZH/Ui8sVuHKeEHs2rhg34fkjVtPheWYtt9JmwV8zzmruWdfuyRgcnhsCosPKkS0KBbGlcHkC03mN0NfwjAKF3gOmztE2eDwLC56eKOPKlTIBaiJN8/N42X2j7iLzTF/lx+XNbm/+n3sy1GQaoMebmRt5C1wcfEsYs/jrmaAS6Nd7/5otY9u/2VhzEG4jB7vkDucQvkjW2yYgrwK5Y/6DBbRyxEaIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK2sPU9P5lhPjouKHsteLSJsD2fSn21QGO/gnTmhsyo=;
 b=t+Tf8WJl5i4f1PZVYmBK2hUJiu2gnjFZIpouMPrB5EfS2DhOro7dI+SENADoXv6yHB0nuJUBw+J2hLHqCdyeRVAJMElM9rxOkjOdbejtusvTppFchZx1eEKv+1FwJMR54MIW775LqlzZ1WC6IkXt/wAhgayPD76Fi0OfD8+Dpgey5t08Mrfv7H40TIum2OqCGkd8pgjrFjtfzXTa7gChT49asqFvct15y2ArWn5rohV64m75WR7IJLIdxQD37C6wTkC1VHBeIWhqF9p3yRlQoWGjH7YnwbVpSjTzF1k0pNGTIVQlS9RacIm0W7BBK/hLn8/sqGcuj8Z91bnYXAjvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK2sPU9P5lhPjouKHsteLSJsD2fSn21QGO/gnTmhsyo=;
 b=LLqHLwmUlFwmnIzLOX3Ze+9OvdiqpeU5fREGJmI2Hv2omwxBYJGK8cG7cCPPdrqZzsbOdY8oj5Pw3fseK0lt8I0IhwT03YEu+Bcv8M8HovtxCRG21PcW8G9+/krL8LkNtiIG+POJ39q0OAF39ABhXq3qEyaPYXewlwTmmdl2yb4xhsbhAGP7z27l+x7XDXOx9HJSIFhVzsQDFfQxTqV77P2Pqnw8PeswNPdNd9pFGUu7GSMNY3Xq9z02UoIeGRQUhL+xSV2aOXS0CnKOL8y5CfqMKsJWJX7HDd4G1UHYmyLZC8Im6syRUXqjbHwhw//FGYjNOfrnvx/avZtNpX5uig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DBAPR04MB7304.eurprd04.prod.outlook.com (2603:10a6:10:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Sat, 12 Jul
 2025 17:21:49 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Sat, 12 Jul 2025
 17:21:49 +0000
Message-ID: <349615b0-2823-4360-bf61-14f5f00f9d7d@nxp.com>
Date: Sat, 12 Jul 2025 20:21:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v10 12/64] media: uapi: v4l: subdev: Enable streams
 API
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
 laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-13-sakari.ailus@linux.intel.com>
 <5q2j6zf4o4xyt3k3xpi4n4mbyckxkexmfho2hfmpvtpfwb35tx@hwjlkjm7krm5>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <5q2j6zf4o4xyt3k3xpi4n4mbyckxkexmfho2hfmpvtpfwb35tx@hwjlkjm7krm5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::9) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DBAPR04MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 2355f9f8-026d-4eb1-aa3d-08ddc16895b6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cDdWK1ZibTE5KzFHb0RNNlByR2pIMEE5Uklzc3hBZDBweWt0WXRzQlIySGEx?=
 =?utf-8?B?TWJHK09IbHZGdGNlQXp6ai9sSVQzWkZmUy84bjRDS0NEZXpOZ2RMMWdvOC9M?=
 =?utf-8?B?ZHgyYlB0alZxVFAwYWRvNmFsckNaL2VMQlpGMDFIVVN2TWlvaWkyN0JwRzRp?=
 =?utf-8?B?elNpYkJtQm5ycTFkeHNsRGMzS1hSMkFqTVhjc3hJN0E3OXB5aTFnZkpPS1Ba?=
 =?utf-8?B?VHJGZEQ5R05QMW4rSW82YWJQVjc5Ylg1b09pZFBYekZqRWdINUttdjRHcTRE?=
 =?utf-8?B?NUF4OGNtOHJtRHQ0TzZ6b3dWZ1lobW1xb2VmWGlGcitITW9QeGFNQ3pmTEVt?=
 =?utf-8?B?bVBzVFlKOUZyL04xZTBIenQ3K0c2S1VFQkpOek9FWmZ3NmZlV1hUTnNINm5y?=
 =?utf-8?B?YWdnb2NPZ3VTZ3pDUXBNRTFNZCt2UFA3TzNBN3pKU1VKSGxwc2JHbFVrYUJo?=
 =?utf-8?B?eDlaaElsUjFUYm1DZmRDakJWZXJoUEtaZFI5YWFFUGpJV1NJdjFPbDdzV25D?=
 =?utf-8?B?VFNHSFBBY3B0dnI3T202MWZtNi9ZUm1VQlRzSnEvK0dOc0dxZzB0U0VPY2xW?=
 =?utf-8?B?enN2YkdmY1pGcU1tMDdoSnliUEswNStRaW9IbGRRbHVyYTMrMXpaL1g2V1Uz?=
 =?utf-8?B?djZQU1NPZldUSUs2em02d1ltRE1ZVlhGK2ZyKzlEZnVSMjRYcytRaHRUQlRX?=
 =?utf-8?B?d29jK1JicmVDclIxTWFKVCtjSXZseFJUckZCUWJEbXZBUlBBTkVhWkh6Qldh?=
 =?utf-8?B?cFU0VEtTVWQ5eGh4Ni8yUkNuYnBLWEcxWUlBZ1FtUlU2UmZWVTBVeTNEM0lJ?=
 =?utf-8?B?RW1wSmh1Z2xhWW5jaFhNdU8yWXhaR0IrY2orUy84SUtEOHVDcTFSVTAwTmpG?=
 =?utf-8?B?clpkM3ZjU3BPNWZLYnNNVFBBeDN6aDZpUWlFU1dTTmFseGZMK0luVjRsSWY1?=
 =?utf-8?B?MmxSUHNWTVpxT2N1MlJTQUtnVEhjZEZBS2x0RGVrOUFjeXdBcnAvbWJVcTZF?=
 =?utf-8?B?QWx6T2xMT0tmQUJXdlRML3FVSFUrSnc2WlpwN3RyMFJjc202RlNUb3lKRzZZ?=
 =?utf-8?B?N3Fxa0x2OC9FR0pMTmp0c3l4MHNUQU40Z1FiRXZMbUNiM2syVGJKWkQyTTlK?=
 =?utf-8?B?Qk5qRC8rU3dLOFpiNWwwQlYvRUZndit3UnM1OUFPclFxUWRZOEVQR1Yxd2pW?=
 =?utf-8?B?dGpKZ3NhTUhkSEdTTDNDaEVlVmNzb0pmajE1bGhEQ2dvaFFsL1kzbUNmbExq?=
 =?utf-8?B?bTFmTWdQK0tWS2RuR1hiL1RvamN6TDJkVmNTMGlhTW5zQ081bklCOEZuSFI4?=
 =?utf-8?B?cGtuZG56NXNWWmhiQjBPc1Y5WUxYZzFIbWRxQW5Pd0lQRlk1RytidXdtbkE1?=
 =?utf-8?B?dGFpMHg2OHJEL2gvL25NcWRxS3BCamhnNEhPTVUrdEVxa2d4aUMzdVJkaS9k?=
 =?utf-8?B?cGhzRDZGUXlNS2dzaFBZK09vVVZRc3l2dlFHeTFrY3diZHVpNVJoVXdjelF5?=
 =?utf-8?B?djY1T2lISlVkWEtQaWsrNDdzWWoyNGhhSndZd2x3MmR1cFVhdjNhd1dISzdX?=
 =?utf-8?B?c0tLQnczT0NhQTlSUjdXU1BqU0hVd2RSaXY4Vjg1a2FGc0ttanBSUW5DeWIv?=
 =?utf-8?B?QXZWL09EVVZzczYwU2RybDJTVFhrM2JBWk1sdHAvUVluZDIwd2YwVnBjODgz?=
 =?utf-8?B?UG03T0wrZWlCRVpFZlhieHhjSGJpL2k4cmtHOTN0UUJib210M3BUVC9zMExJ?=
 =?utf-8?B?b3JwMzV3MzZaejEvOWcrd2ZpaHh5Q21na24yRm1OajlFK00rVThkOVNSUm9y?=
 =?utf-8?B?UEVSVXp6SVZnUGlrUHBNaG01T2ozUytiNTc1cFdRSWptOFlHc0JRdjJDRU9l?=
 =?utf-8?B?NEZDOFF3TjEzM3RxcGJ3QnMxVEVvdDZzM0xGNHk1L2JROEwxYUhpbFkzYWk3?=
 =?utf-8?B?MGNMaTZOQ29hakM2TnFYZWMzV2pUYUE0aEh0cTcxbG5jNU9kOUVrKzRtR2hU?=
 =?utf-8?Q?hRqXBQHH+gm1+FPDJvq8Nb6Dc4rldU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Nk03Z3dSUVh5VTZMNSs4eWZaMWU1UHB0YmlzNUg5Rm5sWFhORjJKNWZQMjd3?=
 =?utf-8?B?STY0WFVScE9tMTFzR2xaYXp5ZUdjNzIwMzRmSUZmSld1d0YzOVFzTTl2b3RW?=
 =?utf-8?B?WDBBNWcrREpGeVVqYmpQRThseS9MUjk0MW1QSDhpRTExemxBU2RaVWlpU1Nj?=
 =?utf-8?B?eFFYWkZiU3R6dzZsS1lsQS9uaFB2TFVVWlFvMEt4Y2wxUjlSTzU0TjJtcDZw?=
 =?utf-8?B?RVliaFJYUll6V1cxR2FuaXpXNlJkcHpWQlRBTWM1YXptb2ZaU2xjNCtGN1ZO?=
 =?utf-8?B?aWdqT2tGUkoxZVJ6Z2w0ekJ4aS9wQU0vQnpBL24vNDhRVzgwcThlWS9GL1hr?=
 =?utf-8?B?a2FpWitqWVo1Yk1wck1LS2tWUTN5ZHNnSnZ0WUw4bDM1dHpieU5wZEVIakNx?=
 =?utf-8?B?bE9wVVZNcmFobzkyRTJHOFg3eENGdDd0bWtNWXJLSGRjd1BKWldjSE5DdWpR?=
 =?utf-8?B?YzBtMmJUckJHVVh1Y2F4N3Mza1ZHblVDd2dSUnRnR2phc3VoMGVRaWk0ZVdq?=
 =?utf-8?B?Y0M1MzBCK00rQkxWNzVMd0o0MUJLZUFPdms3V3pTRFNqU3pQWDlydXltOVRa?=
 =?utf-8?B?QjNOOThKS2lQUHV4bDJKdWlnNzI5UzJYUE5xVTBxK1VVRXBzN2hld1YyeXZm?=
 =?utf-8?B?Q0dLVEtodEV5RVhlR0p6WGxVUjNLallzNE15WE5rRUpmYlp2cWpQZDVvNXpR?=
 =?utf-8?B?M29DS1U3cHFQRU1RS0ZIa2hpZnl5NjRTczBpeDNkMHZQSFlEcmRFSnRxb0RM?=
 =?utf-8?B?cVFGSmhOQ1QwN2hwMDZac3AzVGdGQTBxZUdvYVgrM1J2UG5iZ3hPdG9Xc3Er?=
 =?utf-8?B?Y0RnQy84aGlkbytUcERhQVMycVFrWHFSdCtHVzlDRGRlaUhWRjU5MUlvV3k2?=
 =?utf-8?B?MisrTHA2cFFPa2xQeWU4elBCN0VWNFIrRWhpMTlBS1p5QmNTQ2hJeFJYOGND?=
 =?utf-8?B?V0hPQUxqYWI2czlYL0tRTGxJWTlLMExPV0srUWZRNG8xd3RMNjBiK1BSOHZG?=
 =?utf-8?B?UkdncXR5Wk51Y2ZOd0ZYTUJuV0laUkJ3akh0aDNHbTVmU2JlY0ZoRkdDcVha?=
 =?utf-8?B?Ykg5cG9HOG5Oa3lmNzZvTnhqSlFxekh5TmVac0pheVRaN1lmUnM0TzJtNVBC?=
 =?utf-8?B?WGl1RzZzUFhRMkhnOWh6QmJtRDN0NHZ2YktaYytqVUE0T216N1VCRE1kN0kz?=
 =?utf-8?B?cEttc0Z4S0xxOVFlM0MyNnozM3FkR1RsK1h1bU0wWm5mSlNIcTQvOFBtUDlT?=
 =?utf-8?B?ZEYyZCs1NUZFL1BJRklTMFQya1Z2dVdJNWZ6TXZGc1RScWxHR3RHV2JjRm1E?=
 =?utf-8?B?RU41R2pFWSttVXcrZlFjT1JHcUxqMGtNcDRXTzRLTWlXenBHNzJJKzVOaVFa?=
 =?utf-8?B?WE50b2pZRGtVQ0N4aisrV0VXWWRNemdNWXFQZG1UdmZUZmkyVkhiTndLU0tl?=
 =?utf-8?B?TlM4NGpuclA5dVZCQzNibWVkcStvaTM0TFpIR1ZyUVJpeDJUcjF0WXNyRUMy?=
 =?utf-8?B?UEtLODd0bDhuZkt2bVpWZjRCNkMxQzBBck9qUWF5TG1LcEJtVTRCdHgwMXEr?=
 =?utf-8?B?MzM0b0RLUy9Ld1pkUTl3S01sYzREb2JzRnlpL2tHL1hMeHU1V01relBmcm9I?=
 =?utf-8?B?ZHFPc0lqNEFaWjkyNGFFdWxGVkpxRW1rTCt0bWNZTlRpVWh6djhTeW9QSUg1?=
 =?utf-8?B?YTltbzR5bkFXS1BoZlptTTdCNnBFblAxSHRZRlhwNEZSTW4xWGc2MUNJYVkv?=
 =?utf-8?B?SWFWdmhXZEQxSXh0NnBQSStzUk5tSXJRaVgzZWNyOUkvL0Jqamc0RnJFcVFr?=
 =?utf-8?B?clV1aDNWcUdqZG0zaTllRW9uWWUyQmN2RmlESnY0YjVBUHJldS9EUko2STBu?=
 =?utf-8?B?bElwY0I2d25ETnNKdy9rWGlMcjFDZTdVMmZiTTdPc3hCT1pvYmxrNGVzSGZ6?=
 =?utf-8?B?LzZiMk9jZWR0UkViWkx5M05yeTRub011elpvdnpaKzU1emFUTEZadzBqU2Y4?=
 =?utf-8?B?d0JtSFhaRWJEWmQ0SXdjRnR5QnE0OEJONXNycGZRcmw2ajArbFJKNVdwQy9u?=
 =?utf-8?B?anlKcVprNTRVK3MvSGd6NUVldkM5ZTdYVG1SSTNtaWU4WkJCcEhYY0pMK2xh?=
 =?utf-8?Q?gSAaGq/SzsJqfOIAZ1hp7DVlw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2355f9f8-026d-4eb1-aa3d-08ddc16895b6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 17:21:49.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wLv7wr+TpxRQA6sr5c5wIrhPz02yn9XxoIiWjZ+EKAolfA+mznFJNpyjvprfnsIj1nTbkWTV8Zr2+sDYvYUug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7304

Hi,

On 6/20/25 14:10, Jacopo Mondi wrote:
> 
> Happy to see this one!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Same here, using it for a while now...
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Regards,
Mirela

> 
> On Thu, Jun 19, 2025 at 02:57:44PM +0300, Sakari Ailus wrote:
>> Remove v4l2_subdev_enable_streams_api variable that was used to easily
>> enable streams API for development, and conditions that use the variable.
>>
>> This patch enables the streams API for V4L2 sub-device interface which
>> allows transporting multiple streams on a single MC link.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
>>   1 file changed, 30 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 13d6e96daf3a..30549aca9dd0 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -26,15 +26,6 @@
>>   #include <media/v4l2-fh.h>
>>   #include <media/v4l2-ioctl.h>
>>
>> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>> -/*
>> - * The Streams API is an experimental feature. To use the Streams API, set
>> - * 'v4l2_subdev_enable_streams_api' to 1 below.
>> - */
>> -
>> -static bool v4l2_subdev_enable_streams_api;
>> -#endif
>> -
>>   /*
>>    * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
>>    * of streams.
>> @@ -620,13 +611,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>                                       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>>        int rval;
>>
>> -     /*
>> -      * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
>> -      * Remove this when the API is no longer experimental.
>> -      */
>> -     if (!v4l2_subdev_enable_streams_api)
>> -             streams_subdev = false;
>> -
>>        switch (cmd) {
>>        case VIDIOC_SUBDEV_QUERYCAP: {
>>                struct v4l2_subdev_capability *cap = arg;
>> @@ -980,9 +964,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>                struct v4l2_subdev_routing *routing = arg;
>>                struct v4l2_subdev_krouting *krouting;
>>
>> -             if (!v4l2_subdev_enable_streams_api)
>> -                     return -ENOIOCTLCMD;
>> -
>>                if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>>                        return -ENOIOCTLCMD;
>>
>> @@ -1006,9 +987,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>                struct v4l2_subdev_krouting krouting = {};
>>                unsigned int i;
>>
>> -             if (!v4l2_subdev_enable_streams_api)
>> -                     return -ENOIOCTLCMD;
>> -
>>                if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>>                        return -ENOIOCTLCMD;
>>
>> @@ -1086,14 +1064,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>        case VIDIOC_SUBDEV_S_CLIENT_CAP: {
>>                struct v4l2_subdev_client_capability *client_cap = arg;
>>
>> -             /*
>> -              * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
>> -              * enabled. Remove this when streams API is no longer
>> -              * experimental.
>> -              */
>> -             if (!v4l2_subdev_enable_streams_api)
>> -                     client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>> -
>>                /* Filter out unsupported capabilities */
>>                client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>>                                             V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>> --
>> 2.39.5
>>
>>


