Return-Path: <linux-media+bounces-19779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 802209A1B77
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F431F223C9
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 07:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CBF1C2438;
	Thu, 17 Oct 2024 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Bh/b7a19"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0013AA47;
	Thu, 17 Oct 2024 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149331; cv=fail; b=ZiIEKz2zg8nyn8Kvlm5Nwj4S9LBuoucPqK/jQyrjmTNLNcmf6VM/Pvxl7mDMt34iRv4bR95mn6nl9FaII2Q+d5XB4kO8vuroolhcrPewe0uzFJpiMA8VF8JqTNXS85t67P9qsdfg7ZhV2dgKZuxULHZRH9ddQQ/vKxDmLyntHi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149331; c=relaxed/simple;
	bh=KgXOpkvR7zX3Ukf0xhAcP61a/CX144U3sSvW+0sPFHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mRfDLNkbSL2FCUkm3/tC12Gp85aw94QP3cAFnVh3iWU98iWu1fbSMX6SKWtB/J9sXJA4rp8npJDmi6e+Fix9X8CPhnXV/J2mKhLdWU31v8NHTWLTExOe7aQYhQVE+OHvJg/cN460CEt/N7ZvG+EiQx3M+fNeKlhbc27DKItPf9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Bh/b7a19; arc=fail smtp.client-ip=40.107.255.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUDwPf5ymT/s/EBhr7OPKxf/+ELL8rGKJdUhFjVUojwPW6JQIwvUy1e3Qw87g8obz4IQWotFhBIVWuWBTt/a23Nq/ngQvSYBlJHGR1SfglFv1bd4DAP5KKqKnV1CwCjRXGE1XlNr3O3wmDliG99N+CcQpw5stq3JVeN9CqxC1pcwA+glrsxpKH1WVLkD8lq8KX+V6bLS97JP3Ez4BOGrntYl1F2sGpoTsMeHi4txfTsIiGPE8xVFSrDwCucLA2IsB4ssFptfbO9WDStu/VdbmnRKW3AyOyxYd3q5DtGusZ2aFpMxWfCPKR4IlCwsx1x1xdTMETK3/S2FEqMcSvMX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgXOpkvR7zX3Ukf0xhAcP61a/CX144U3sSvW+0sPFHo=;
 b=cdqmt9FdbYPmeWlcbv2KzNhoRJ/n7K3L3qJzqdzrxZy/Ik8L3EgrwM4YicAQpZZM9OBnUH7Q4RNSgGcxXdVecs8hHgB5fthn1sukjc23/X2TytfB3Rs3t4Nb3r7KHvW2PxWsndjf709iXdalLr6w9DEFey9cpDf4OYa7nkmSJe58cPoitZwepEKj5uKMtl7wL9KUfk8QVAEcJ6u6W5vLfrmBirPdDQZl6UlEUdNxSGBALLvHcXW1S7G7dRp2K+NM2YJgYPa1frWZrM6Jma6iq/xyTygZh6p/o3Hz44bYHP2iTt65niJV38cMVArQdwCyIHhr45XzsYbvImCVa/9A2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgXOpkvR7zX3Ukf0xhAcP61a/CX144U3sSvW+0sPFHo=;
 b=Bh/b7a19IfseFbO7o4ip6zZkhDuJaJ0H26Sev9dnazDhOqZu+WCA0XWIY6kisRLn+pfoP2shFD5k7mFrMFLtd3oOVajoPX55aOkUZDVo0nzXL2Jd360CLbuhZzgYwyom2Ijw3xJ617zrjIkEsFhf4IIT3Cpdt/cdDPqqGUgqKJGPVHZiKHs9JPyNhwRlMYsKPK8Ar+Hxxv/n5GaM1+lx7Xqm+P5rbQ0YgKV4oI0ogblrQBdoUzQkyvCEU29PYLdlByQB39u6RkizRb3sd879MAGRVE6/H8LHXl8ESBdtXMyQIDMVmy/Iyf9Z1qNFpFx4nJF2QVm3rrPMcxhtzDP+Sg==
Received: from KL1PR0601MB4452.apcprd06.prod.outlook.com (2603:1096:820:7d::8)
 by SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 17 Oct
 2024 07:15:23 +0000
Received: from KL1PR0601MB4452.apcprd06.prod.outlook.com
 ([fe80::212a:57de:588d:c035]) by KL1PR0601MB4452.apcprd06.prod.outlook.com
 ([fe80::212a:57de:588d:c035%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 07:15:22 +0000
From: =?utf-8?B?6YeR6LaFLei9r+S7tumhueebrumDqA==?= <jinchao@vivo.com>
To: Sean Young <sean@mess.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, =?utf-8?B?6buE55CG6bmP?=
	<huanglipeng@vivo.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] media: rc-core: Modify the timeout waiting time for
 the infrared remote control.
Thread-Topic: [PATCH v1] media: rc-core: Modify the timeout waiting time for
 the infrared remote control.
Thread-Index: AQHbIGRUzRCtexoDJEOtIkfLFiMBrw==
Date: Thu, 17 Oct 2024 07:15:21 +0000
Message-ID: <bf2d51c1-54de-45cf-aeef-06db1a047c2c@vivo.com>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
 <Zv2xGbdhm8kXgDFe@gofer.mess.org>
 <TYZPR06MB6895415657AFF1C1723F9020DF7E2@TYZPR06MB6895.apcprd06.prod.outlook.com>
 <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>
 <Zwk3g-B6dJWgqE41@gofer.mess.org>
 <1a2149bb-9ac5-4cb0-9361-c292b66c214b@vivo.com>
In-Reply-To: <1a2149bb-9ac5-4cb0-9361-c292b66c214b@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4452:EE_|SEZPR06MB5576:EE_
x-ms-office365-filtering-correlation-id: b9341a0b-eb74-4673-89c2-08dcee7b76be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2NHVzlxdC9wbjdsMGZMVzEvSTVUeFlMNng2Tk9hNHNiTWoyUWVKcG1nQWV6?=
 =?utf-8?B?Z29tcDA1enFEeHNVVzBYMmxwSWRpVDc3RUUwaXFxQXVFQ0pCQlZtbW1aUGlr?=
 =?utf-8?B?Z1FKakpsM0htOUFsbGZiRzBNQ3BWS1d5T01XWHFvcTVkdUx2Z0I1aGY2blRK?=
 =?utf-8?B?dUNzU2k4Y3BNV1hvbzZJbXlXZlV2Wm5Sc0FFd09CRzNkVm9ubUd0L1RwdWMx?=
 =?utf-8?B?cCtXb0dkSHNqcWxGV1ZEZC9HblZnRUZobjZGKzVlU1Y5QlpzeTRkbGR5aHVS?=
 =?utf-8?B?QnY4RWgwU2R4K2ZiaW1YSFZuQnVLVnNsWERqYUJmM0wzVjA2bmRySWtjejlN?=
 =?utf-8?B?TVpLdHZ0eWJRVXlDR2Y1dWczc2puZ0JCMERCM1pseXI5UDJuSWtuZjc2T2Ny?=
 =?utf-8?B?RVcvM05VMDMyTDN3TlVQQ0x0WEpLZXJDZTlhUGRJVXQ3TDFZWmV6SVFod1BE?=
 =?utf-8?B?QXd1S3Z2WDZsbkNyNmdMZVo4MXhQYjBMajJQdVZ0OGpBZUhnYW5SR0VMaldk?=
 =?utf-8?B?RGtybkw5WlFKUDF1YTAyUWYxQnY2aW50eTdsVHpZdXUwdjNEZTZ5SHE0cGRX?=
 =?utf-8?B?dm1hQlZNajZtWFhpRkozanZLMWkzS1pXKzh4ZisyUnBkYnJYcGlpTGQzTnh3?=
 =?utf-8?B?c3V5NGUvOUpBK1VuZGxReFVBWVQyUGVaWlh6bVlDeUhmVTR2WkxueE1GVkFW?=
 =?utf-8?B?Rmh2bEZPalA0MUZKZEwyaEJ1c3QvTi9iNnpFcGJVTGRFNHMwQTQ2K2N4Z2Rm?=
 =?utf-8?B?Yzk4M09KckQ3TGZibkFhUzRWL0dpSytubUZkalRZak5QanhEY2h1Q3U1ZFB6?=
 =?utf-8?B?OU5EZ1dsbURad3FWelZwYmlyeUd0SE9uZ2tLaVZHMTVVUlFGMkxIUUNPdDhj?=
 =?utf-8?B?cHc1UUpOQ015ZUtpSVpvNllkdm1BNjMvUzZzRGZLalV0TmdWcVBraUFFRlM0?=
 =?utf-8?B?YVVGME9rd1RubEJPTXN4UnFRaWJvV01sV0dDUGI0ejk3OEZHeVRHRVBOOEdJ?=
 =?utf-8?B?eU5sYXpJYzBsa00xRldIbVp3YllrQXNVdzZiaUZlL0dGZFFTMmthcjNLV2w5?=
 =?utf-8?B?Wk5naXltRUtQNEsxTm1SQWR4dTl6dWZFanhXbndjL2JyT0xETSs2Z3pzMTJ6?=
 =?utf-8?B?Y3BGOUdpSEROd1FBdUpHeDRRb25NMldLaVBVWm9HTDhQR00wSFFrOUErbHFL?=
 =?utf-8?B?SUlNUVBpRGZjUEFIcUNwbGFrZWtwd2NDVUUwd0VYZW9CNUVGQkhIcytGVjZ6?=
 =?utf-8?B?ODhudXZuK3dQd2Uxb1BrYm0yQjM5QW9la3BNbWNYcUVHQ3hBa2oxNytXdlh2?=
 =?utf-8?B?dzNTejdYc2tjR0FFMENOYkR0M3NHamYrTmh0S0wvb0lsajRqVS9OdC9oSEln?=
 =?utf-8?B?ZFp2UEpwZXlwQ1BxRTFxVml1UmtuSmp3blhhQjZWbHhUdk1IU0Z6QmF5b05H?=
 =?utf-8?B?NjU2eXZKaWV5MU9BYmRtWUZuQ1NwczNPSllYK2hLNWZsZEROYSt0ellqTmkw?=
 =?utf-8?B?UlF6RVFQdEJHTE1oNms2U0V0Nmt6MytkcEhIb1JUSWNRUjVSRmdSTVJ6cXhv?=
 =?utf-8?B?c0NCdWIvcG9mMmwrUVpkQkZXb3pwZHFJblo2TTNDQzgwYS83RzRUaFZBTWZ4?=
 =?utf-8?B?QTNtbm1hNHl1T0UyMzM1cHBtRmg4SGx0aEV2N1h0ZDJIZVo5Z1hIeGZSNmFG?=
 =?utf-8?B?anFOK3RLNDlzNll5a3Q4MUs2eTM2MG04eU41SlBQaGx1OVo5RThXc0ozMCtt?=
 =?utf-8?Q?Xgq3p2YLgTiR+AqvgMXMCArP3bsW3yz8ktXrAS3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4452.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlpBQmVpZUp4dXd3TmE5aXQ5ZEpTQXBXbG5nR1BJYU9MVXM4c3lxVkd6NVp6?=
 =?utf-8?B?TkFnWFNtY05rYzdtNGt1Qmk4amRSSzdtUHdrakFTelZZYUZHcFJ3TGZHYzFV?=
 =?utf-8?B?MW5JOWpUT3VueVdzNmZsc1lSMFVuSE9aS0orOHVkNHhFVTlPb2orZWVGNlNB?=
 =?utf-8?B?b2J3WGU3NDd1VENDcTJUQUhKbGlvQWdWNWRVNlJ2U0RaVXZ2L3phL0h0b2Fi?=
 =?utf-8?B?TzlqQm1yYmtjZnE4NGs5eWpiMVJQelJxdFlhY0xwQmQzaU9TQ1dWVStxNE1L?=
 =?utf-8?B?T1JGRU5JSEdhZ2E0SUZTL2RUY2NKVno5SDFMQU1Namd4S3B5elk5NHF5eWJa?=
 =?utf-8?B?ZG1EQ2NDcHBUb3ZJMXNsRUlOMGlUMFJrTzgvKzEyWWE3MGdwbTdaa0M0Um5n?=
 =?utf-8?B?YzY1ZktGa1p5T2hmL1FBZFRFVGVLSXB4UEFacFB1d3ZxL0hWOVNTTlVZdlRB?=
 =?utf-8?B?SFZNSzVXZUUxT1pFaWZHMlFmVjZKSEtwS1kraUN5ZVR4bGNVYlFLWU5UVElH?=
 =?utf-8?B?T3BQMWtCVTJ5bGRGcmtpek5hVExjNkM3M0JtOVRneGwraXVSTU1taERjdkZD?=
 =?utf-8?B?ZCtlc25wOVpXd0dJZHozT1RQT05hVHdTY0tUaW0xZXIyNHJtK2tGT2hNTytY?=
 =?utf-8?B?TjduaitnOEN5bjgvamkxMU90NE82cnNOb3NLNmV5c3JnS2FCZENwOWo4cW5E?=
 =?utf-8?B?RDlaQmhKZGVYelEzNlFBZ3ZLdkFId1lNblVNYzMxVEwvRk5yeU9sSSsyNFI4?=
 =?utf-8?B?dkV1QTUxdWo0NU1TZ1RmSXFjazZ6MERVbEdHd2d6di9MYVhQTDZMQXJkM1pG?=
 =?utf-8?B?VWZIRzB2WWkveWMvTUlpZEJnRWpaSEpKMFBnSTZsTEsvUXc3d2IyalE5Yk1n?=
 =?utf-8?B?NnMvRWdLblUxanZrQ1czN2hBRnY5dTJvMElwcHFsVlI1ekxhd1EzMU5BNnJG?=
 =?utf-8?B?aC80RGIyWlR2SHc1c3VQS3dWYnA4T0JiTFp1OGhhQU1xaE1MRlV2Zkk5R0NH?=
 =?utf-8?B?Vm1QU3BwaGtoSVVoV0JDdlJwZlJXbXhINnFtdy83eHpkYkhTbHQ2TXRDQ0Nn?=
 =?utf-8?B?UEIyWncvY0wyNmUrbDBwZVdOQVJYTDR3TlZQUnlhSTNvY09haURSYjdvSjV0?=
 =?utf-8?B?UzNMTjBiUFRwM1hOa1dKRnQ1d2hoRnJiM3RFa0VwT2FDS2dZRHJiTisySXcr?=
 =?utf-8?B?QU1Da0VKOUhud3g0NXgyMnhiNFZXaS9vSCtkbTdVMVo5SDVqVzJxT3NGTzhq?=
 =?utf-8?B?MmgwQ3IzWXVBSFE2SFBFU3ozUEpucU9WU2N2aXE1Vyt0R1YrdFRpbXprc3lY?=
 =?utf-8?B?UWFHZ0FLZnNoRkdVVml1TEQwUjl1RXIwMEYrODkrSkp5cmFJWXo0MDRqbjZJ?=
 =?utf-8?B?OFFsMzhoSk8zRlhZa3Z6cmVtcWZiWmRIYWdVNUFVaEZ3WVU5WWE5RmVsL0tp?=
 =?utf-8?B?azR1S1UxanFVWk1waXN6U3hVcElGOUhCQXhmTXF3ZXBaMHMyOUxvb2Y5ekh4?=
 =?utf-8?B?WEc0NmxYd3VpejVvVm1XMHFkOXNuT3E2UzQyZTVkc1ZjdkdsZ2J1SWxLc1dY?=
 =?utf-8?B?SFQ1eTNQcW8zYzhXZitUWjdZK2NtOCtuRXJsSENTQUEzeGlZN21uVXlERUdz?=
 =?utf-8?B?V3ZDRHhHOUdjOHg3Z1VDMWNHNDdrdy9aSUdSZ0xYcXZqODErNURlNkFqbmRm?=
 =?utf-8?B?VlljYm5NVHNMa1NEd2hoWWs4N1N5aUVWeE9KOXNveUtNTjZmMTVlWWJQQ2Va?=
 =?utf-8?B?OHFTQmY2SjRCRzJ1d2Z1NXdMSzM1T1d5NFhTSDBEOGNIcUt6cE9jUFR1M0dL?=
 =?utf-8?B?SzBiSVJoQWhvNWhaTlcyZml0a3V0L3R0c3k2N09GK2s0bUJtZlZvUE8zdElD?=
 =?utf-8?B?VTdKTGVMVU93b0duZFdsZ3pIbk4yZEt4a0hYK0pqdmZBOFZ2bklIMUFockdV?=
 =?utf-8?B?QTZEcU5vK2FYMzlBaDRzR1hsMXlkeDJvKzdjYlVaMHZRTEZYOUFuS0FpeVUz?=
 =?utf-8?B?MWl3Y2Y1K1ljUStBUkczS1dLd1ovOWtsZ0dHZFAyTTNqdG42VjU1NzFxVDN4?=
 =?utf-8?B?anVEMzlRQ0MzRDNKZFNGcU1Ed0hpU2Z3QmtxRjlYWVhyclRhNGxhT1JCV0Nq?=
 =?utf-8?Q?x6hc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <649A9167AAEF034E92737FE1D2249C08@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4452.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9341a0b-eb74-4673-89c2-08dcee7b76be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 07:15:21.9765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gRuwS0lreJrEHMGp4//3iC4Ku4oqePZ2y7XF7MrhmiR/+sZmhaw29uwn4jqNmKP4WPPE5y3D2w0TSHOMqHZTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5576

DQpIaQ0KTWF5IEkgYXNrIGlmIHRoZXJlIGhhcyBiZWVuIGFueSBwcm9ncmVzcyBvbiB0aGlzIGlz
c3VlPyBJdCBhZmZlY3RzIHRoZQ0KdXNlciBleHBlcmllbmNlIGFuZCBjb3VsZCB5b3UgcGxlYXNl
IHRha2UgYSBsb29rIGFzIHNvb24gYXMgcG9zc2libGU/DQpUaGFuayB5b3UNCg0KDQrlnKggMjAy
NC8xMC8xMiAxMTowOSwgcXVxaXdhbnppIOWGmemBkzoNCj4gSGkNCj4NCj4g5ZyoIDIwMjQvMTAv
MTEgMjI6MzQsIFNlYW4gWW91bmcg5YaZ6YGTOg0KPj4gT24gV2VkLCBPY3QgMDksIDIwMjQgYXQg
MDc6MDM6NTdBTSArMDAwMCwg6YeR6LaFLei9r+S7tumhueebrumDqCB3cm90ZToNCj4+PiBOT1JN
QUw6IFRoZSBrdWtvbmcgYXBrIGNvbnRyb2wgcmVtb3RlIGNvbnRyb2wgc2VuZHMgY29kZXMgZm9y
IG90aGVyDQo+Pj4gYnV0dG9ucw0KPj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBE
IENvbnN1bWVySXJIYWw6IHBhdHRlcm5bMF06IDQ1MDAsDQo+Pj4gNDUwMCwgNTYwLCA1NjAsIDU2
MCwgMTY4MCwgNTYwLCAxNjgwDQo+Pj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQg
Q29uc3VtZXJJckhhbDogcGF0dGVybls4XTogNTYwLA0KPj4+IDE2ODAsIDU2MCwgNTYwLCA1NjAs
IDU2MCwgNTYwLCA1NjANCj4+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25z
dW1lcklySGFsOiBwYXR0ZXJuWzE2XTogNTYwLA0KPj4+IDU2MCwgNTYwLCA1NjAsIDU2MCwgMTY4
MCwgNTYwLCAxNjgwDQo+Pj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQgQ29uc3Vt
ZXJJckhhbDogcGF0dGVyblsyNF06IDU2MCwNCj4+PiAxNjgwLCA1NjAsIDU2MCwgNTYwLCA1NjAs
IDU2MCwgNTYwDQo+Pj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJ
ckhhbDogcGF0dGVyblszMl06IDU2MCwNCj4+PiA1NjAsIDU2MCwgMTY4MCwgNTYwLCA1NjAsIDU2
MCwgMTY4MA0KPj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJI
YWw6IHBhdHRlcm5bNDBdOiA1NjAsDQo+Pj4gMTY4MCwgNTYwLCA1NjAsIDU2MCwgNTYwLCA1NjAs
IDU2MA0KPj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6
IHBhdHRlcm5bNDhdOiA1NjAsDQo+Pj4gNTYwLCA1NjAsIDU2MCwgNTYwLCAxNjgwLCA1NjAsIDU2
MA0KPj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBh
dHRlcm5bNTZdOiA1NjAsDQo+Pj4gNTYwLCA1NjAsIDE2ODAsIDU2MCwgMTY4MCwgNTYwLCAxNjgw
DQo+Pj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhhbDogcGF0
dGVybls2NF06IDU2MCwNCj4+PiAxNjgwLCA1NjAsIDQ2OTIwLCA0NTAwLCA0NTAwLCA1NjAsIDE2
ODANCj4+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiAw
eDU2MCwNCj4+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFs
OiAweDk2MjAwLA0KPj4gSWYgSSBzdW0gYWxsIHRoZXNlIGxlbmd0aHMsIEkgZ2V0IDIxNjAwMCBt
aWNyb3NlY29uZHMuIFRoYXQncyB3ZWxsIGNsZWFyDQo+PiBvZiBJUl9NQVhfRFVSQVRJT04gKDUw
MG1zKS4NCj4+DQo+PiBOb3RlIHRoYXQgdGhlIGxhc3QgdHdvIHZhbHVlcyAweDU2MCBhbmQgMHg5
NjIwMCBsb29rIHJlYWxseSB3ZWlyZCwNCj4+IHRoZXkgYXJlDQo+PiBub3QgaGV4IHZhbHVlcyBh
cmUgYWxsLCBhbmQgdGhlcmUgaXMgbm8gInBhdHRlcm5bLi4uXTogIiBwcmVmaXguDQo+IFRoaXMg
aXMgdG8gaXRlcmF0ZSB0aHJvdWdoIHRoZSByZW1haW5pbmcgcGFydHMgdGhhdCBhcmUgbGVzcyB0
aGFuDQo+IGVpZ2h0IGRpZ2l0cyBhbmQgcHJpbnQgdGhlbSBvdXQuDQo+DQo+IDEwLTA5IDExOjIw
OjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IDB4NTYwLA0KPiAxMC0wOSAxMToy
MDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiAweDk2MjAwLA0KPg0KPj4+IDEw
LTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6DQo+Pj4gMTAtMDkg
MTE6MjA6MTguMjIwICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhhbDogSVJUWDogU2VuZCB0byBk
cml2ZXINCj4+PiAxMC0wOSAxMToyMDoxOC40NjkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFs
OiBEb25lLCBUdXJuIE9GRiBJUlRYDQo+Pj4NCj4+PiBTUEVDSUFMIDpTZW5kaW5nIHRoZSBwb3dl
ciBidXR0b24gb24gdGhlIHJlbW90ZSBjb250cm9sIG9mIHRoZQ0KPj4+IGt1a29uZyBhcHAgbWF5
IHJlc3VsdCBpbiBhZGRpdGlvbmFsIGxpbmVzIG9mIGNvZGluZywgbGVhZGluZyB0bw0KPj4+IHRy
YW5zbWlzc2lvbiBmYWlsdXJlICg3Mi04OCBleHRyYSkNCj4+PiAxMC0wOSAxMToxOTo1My45NzMg
IDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzBdOiA0NTAwLA0KPj4+IDQ1MDAs
IDU2MCwgNTYwLCA1NjAsIDE2ODAsIDU2MCwgMTY4MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAg
MTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bOF06IDU2MCwNCj4+PiAxNjgwLCA1
NjAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwDQo+Pj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIz
ICAxMDIzIEQgQ29uc3VtZXJJckhhbDogcGF0dGVyblsxNl06IDU2MCwNCj4+PiA1NjAsIDU2MCwg
NTYwLCA1NjAsIDE2ODAsIDU2MCwgMTY4MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAg
MTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bMjRdOiA1NjAsDQo+Pj4gMTY4MCwgNTYwLCA1
NjAsIDU2MCwgNTYwLCA1NjAsIDU2MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAy
MyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bMzJdOiA1NjAsDQo+Pj4gNTYwLCA1NjAsIDU2MCwg
NTYwLCA1NjAsIDU2MCwgMTY4MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBE
IENvbnN1bWVySXJIYWw6IHBhdHRlcm5bNDBdOiA1NjAsDQo+Pj4gMTY4MCwgNTYwLCA1NjAsIDU2
MCwgNTYwLCA1NjAsIDU2MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENv
bnN1bWVySXJIYWw6IHBhdHRlcm5bNDhdOiA1NjAsDQo+Pj4gNTYwLCA1NjAsIDE2ODAsIDU2MCwg
MTY4MCwgNTYwLCA1NjANCj4+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25z
dW1lcklySGFsOiBwYXR0ZXJuWzU2XTogNTYwLA0KPj4+IDU2MCwgNTYwLCAxNjgwLCA1NjAsIDE2
ODAsIDU2MCwgMTY4MA0KPj4+IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENvbnN1
bWVySXJIYWw6IHBhdHRlcm5bNjRdOiA1NjAsDQo+Pj4gMTY4MCwgNTYwLCA0NjkyMCwgNDUwMCwg
NDUwMCwgNTYwLCAxNjgwDQo+Pj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIzICAxMDIzIEQgQ29u
c3VtZXJJckhhbDogcGF0dGVybls3Ml06IDU2MCwNCj4+PiA5NjIwMCwgNDUwMCwgNDUwMCwgNTYw
LCAxNjgwLCA1NjAsIDk2MjAwDQo+Pj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIzICAxMDIzIEQg
Q29uc3VtZXJJckhhbDogcGF0dGVybls4MF06IDQ1MDAsDQo+Pj4gNDUwMCwgNTYwLCAxNjgwLCA1
NjAsIDk2MjAwLCA0NTAwLCA0NTAwDQo+Pj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIzICAxMDIz
IEQgQ29uc3VtZXJJckhhbDogcGF0dGVybls4OF06IDU2MCwNCj4+PiAxNjgwLCA1NjAsIDk2MjAw
LCA0NTAwLCA0NTAwLCA1NjAsIDE2ODANCj4+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEw
MjMgRCBDb25zdW1lcklySGFsOiAweDU2MCwNCj4+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMg
IDEwMjMgRCBDb25zdW1lcklySGFsOiAweDk2MjAwLA0KPj4gSWYgSSBzdW0gYWxsIHRoZXNlIGxl
bmd0aHMgSSBnZXQgNjQ4MDAwIG1pY3Jvc2Vjb25kcywgc28gcXVpdCBhIGJpdCBtb3JlDQo+PiB0
aGFuIElSX01BWF9EVVJBVElPTiwgd2hpY2ggaXMgd2h5IHRoZSBzZW5kIGZhaWxzLiBBZ2FpbiB0
aGUgbGFzdCB0d28NCj4+IHZhbHVlcw0KPj4gYXJlIHByaW50ZWQgbGlrZSBnYXJiYWdlLg0KPj4N
Cj4+IFRoZSBzaWduYWwgbG9va3MgbGlrZSBORUN4MToNCj4+IGh0dHA6Ly9oaWZpLXJlbW90ZS5j
b20vd2lraS9pbmRleC5waHAvTkVDeDENCj4+DQo+PiBTbyB0aGVyZSBpcyB0aGUgbWFpbiBzaWdu
YWwsIGZvbGxvdyBieSBhIGJ1bmNoIG9mIHJlcGVhdHMuIEVhY2ggcmVwZWF0DQo+PiBsb29rcyBs
aWtlICs0NTAwIC00NTAwICs1NjAgLTE2ODAgKzU2MCAtOTYyMDA7IHRoZSAtOTYyMDAgaXMgdGhl
DQo+PiB0cmFpbGluZw0KPj4gZ2FwLiBUbyBhdm9pZCBnb2luZyBvdmVyIElSX01BWF9EVVJBVElP
TiwgZG9uJ3QgaW5jbHVkZSB0aGUgLTk2MjAwIGdhcA0KPj4gYnV0IHJlcGxhY2VkIHdpdGggYSB1
c2xlZXAoOTYyMDApLCBpLmUuIGluIHBzdWVkbyBjb2RlOg0KPj4NCj4+ICAgICAgICAgIGludCBp
LCBmZCA9IG9wZW4oIi9kZXYvbGlyYzAiLCBPX1JEV1IpOw0KPj4gICAgICAgICAgd3JpdGUoZmQs
IFs0NTAwIDQ1MDAgNTYwIDU2MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjANCj4+IDU2
MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCAxNjgwIDU2MCAxNjgwIDU2MCAx
NjgwIDU2MA0KPj4gNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1
NjAgMTY4MCA1NjAgMTY4MCA1NjAgNTYwDQo+PiA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAg
MTY4MCA1NjAgMTY4MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDE2ODANCj4+IDU2MCAxNjgwIDU2MCAx
NjgwIDU2MCAxNjgwIDU2MF0pOw0KPj4gICAgICAgICAgdXNsZWVwKDQ2OTIwKTsNCj4+ICAgICAg
ICAgIGZvciAoaT0wOyBpPDQ7IGkrKykgew0KPj4gICAgICAgICAgICAgICAgICB3cml0ZShmZCwg
WzQ1MDAgNDUwMCA1NjAgMTY4MCA1NjBdKTsNCj4+ICAgICAgICAgICAgICAgICAgdXNsZWVwKDk2
MjAwKTsNCj4+ICAgICAgICAgIH0NCj4NCj4gVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24u
IFRoZSBpbmZyYXJlZCBjb2RlIGhlcmUgaXMgdGhlIHBvd2VyIGtleQ0KPiBjb2RlIHNlbnQgdGhy
b3VnaCB0aGUgS3Vrb25nIHJlbW90ZSBjb250cm9sLCBhbmQgdGhlcmUgbWF5IGJlIG90aGVyDQo+
IGluZnJhcmVkIGNvZGVzIHRoYXQgZXhjZWVkIElSLU1BWF9EVVJBVElPTi4gSW4gb3JkZXIgdG8g
ZW5zdXJlIHRoZQ0KPiB1bml2ZXJzYWxpdHkgb2YgdGhlIGNvZGUgYW5kIGFkYXB0IHRvIGRpZmZl
cmVudCBzaXR1YXRpb25zLCBpdCB3b3VsZA0KPiBiZSBiZXR0ZXIgdG8gZGlyZWN0bHkgbW9kaWZ5
IElSLU1BWF9EVVJBVElPTi4NCj4NCj4NCj4+DQo+PiBOb3RlIHRoYXQgdGhpcyB3aGF0IHRoZSBs
aXJjIGRhZW1vbiBhbHNvIGRvZXMgZm9yIHRyYW5zbWl0czsgaXQncyBhIHdlbGwNCj4+IGVzdGFi
bGlzaGVkIHdheSBvZiBzZW5kaW5nLiBUaGUgd3JpdGUoKSB0byBhIGxpcmMgY2hhcmRldiB3b24n
dA0KPj4gcmV0dXJuIHVudGlsDQo+PiB0aGUgdHJhbnNtaXQgaGFzIGJlZW4gc3VjY2Vzc2Z1bC4g
SXQgbWlnaHQgYmUgaW50ZXJydXB0dGVkIGJ5IGENCj4+IHNpZ25hbCwgc28NCj4+IHlvdSBzaG91
bGQgZGlzYWJsZSBzaWduYWxzIGR1cmluZyB3cml0ZSAoSSBkb24ndCB0aGluayBsaXJjIGRhZW1v
bg0KPj4gYm90aGVycw0KPj4gdGhvdWdoKS4NCj4+DQo+Pg0KPj4gSG9wZSB0aGlzIGhlbHBzDQo+
Pg0KPj4gU2Vhbg0KPg0KPg0KPiBUaGFuayB5b3UgZm9yIHByb3ZpZGluZyBzdWdnZXN0aW9ucy4g
TG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHkNCj4NCj4gQ2hhbw0KPg0KDQo=

