Return-Path: <linux-media+bounces-33349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AEAC3ABA
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB481734AC
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EDC1DFDB9;
	Mon, 26 May 2025 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="tsX0CjDq"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022122.outbound.protection.outlook.com [40.107.161.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1B258A;
	Mon, 26 May 2025 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244888; cv=fail; b=HSY5Tu68ynS2K1G1f1dEXrBrKaHDOnOXvcWDNVVQhliSUBfUAAP4UbShzt0ttzQjJjYAIjjrTPkdtpTR+EzbbgBkjfR/xV1VE+E8sdkzsVMwoEdTx7ed/4BViKBlJhdNa/ZIJEfyoKqXFUgShGEIUxUO1TVYcmNdCMz3o2aBcs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244888; c=relaxed/simple;
	bh=WJ+VLd3o23AbFP30rOpzOEV5z2UjHhic3vKqh9azIlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SQUpvVwKcXlghb6edsucUP9otWdV9wyv8E9lM4NQoqSMoLmAsxMwH6vU6nnKNlW0KJpVOoLWjqsbFo9it6QRq9YjK/TZ9YqGMJDpBZ1uqyqQaiFjuEoY22gGz5QY5vTN9K428XZQ6yJx7w9LsGo8nBB26gbg1cWtnGfwMg7hBKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=tsX0CjDq; arc=fail smtp.client-ip=40.107.161.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5Xu5oCMgapy6hG5NVm0NR7F/ERjgqio7jHk83Ai1ZBjE0Iffu3mPMpLAaUEvYDFhcSEHHhy5ll+0CzTyugduUp9aW8Y+Z3KShip0uA0uWLnpp8K+DhxyO+Ldhxo2SQtyLhLlQVkqQCnAU2y1EeytMSty1dCvqUT0k+xHskkkWfA6SbixlsmU6q6EeBou0A2Lua9eS+9mF17H3pjVM+KYhD8MS1c5KslpcXyrtF8izhv88gnSXobtHN2hYYlqvHt0tjxHJBZ6W9vohPTKtqnDyleILPes+ZFLom1IBZGD2rNKpkUtgOUhvQZWb5rImu+Q4c6sWatZK3IQnzeEt2GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m5G8IIFuKFy+bm9E0aFX+4SdC/rMReTf6ynWkbeyOg=;
 b=JfMBF1j1BhKTEa00sQief+pFbuH0nwncI0tV0Wwqfn/Oi0PAQEz86aqrOgP7TRtgQZ+IyAoNQDXm3k6YKwLqCU+/2d+SdOCqTL9xVbVFUM7VoSWxHLzxaTNXO0CxucKU1T4Zy5hriJHonKxSwhWnfEnOorVQwqVVtwuvbX7E/t80IfrZFHeMX115e2cWrktSiOruCL940XIwwckkGLTAK9dLNqNzvXX2aK9js4k22GQDCFk19T4kbZFhnVOxdLaiv9dZJ47bWDSeoazXmJAdJemKw5+ZGzeSHVBoVcn9aKA3A3fiH2jep5kz9tvX9lzhyPG2fIpvbfeiki+y08h6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m5G8IIFuKFy+bm9E0aFX+4SdC/rMReTf6ynWkbeyOg=;
 b=tsX0CjDqCXpB4dsh1W0TbotIzJY+C+R7vUEIdfRbtjeFQBNpGbAd6gzoRa8DjVHDUqu0dDAwdWDu8pUwZyl45SodO8v/dHPXzedUJjGHBtuuD8RXa7gb6E2yZFhLzsgzHk2+GlcZiBTb+O2n+pYrdl5Vm5X4ZTXY177y5iv1rPkbU+YwRzMrWVTEetQAEWVT2D9j64fzBBra3MjWYiuy4SIrrnoQ784z8y9NInUJge2vvowfNve6PzUmvA8xMqp7YhVDDFCffekrWrS59zOyUlxYWc/EjjWa/DpiENHCoMaTKm26TcoRk7zcGmp4uMCZYAkgAuUtmKA+mpygMjoB+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR0P264MB5164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 07:34:42 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 07:34:42 +0000
Date: Mon, 26 May 2025 07:34:41 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kever Yang <kever.yang@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
Message-ID: <xbpci3wbas66kfw3vw7sjskgm3plmcjnop2pszgndhtxgxqldw@ptrhnapfm7q6>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
 <fa5aef76-272c-4c9d-b156-c71f3407e8d7@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <fa5aef76-272c-4c9d-b156-c71f3407e8d7@kernel.org>
X-ClientProxiedBy: PR1P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::7) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR0P264MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: be56f618-d33c-42aa-abfb-08dd9c27c772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MytQeUVEWUpSYUhKR1NmRUVIZ2NFNm90MXhVWTlveG1pZmoxSDJ3REV6TWF5?=
 =?utf-8?B?NGZkTk1IRE9hNUg0b3NiYkUxQTd6VlhRYi9DL1ZQc0psYlV6bWQzajREMkpi?=
 =?utf-8?B?RWhKNTlDZExaYm9iNGYwZ0hrZ0xtbXBWOFlsMjNBVGRCY3FvNXZKUXFZc1I0?=
 =?utf-8?B?ck9DdmFCVVVNN0JNUzBrRjJtYWg2KzZISTFwM0xrUkhGenhjMG05eUdTKzFm?=
 =?utf-8?B?SCsyeTZ1QUNwM1ZYQTkvSjhQS1N4VEF6YWFxbmFCQ2NBUVBuVGhqNzk5QVly?=
 =?utf-8?B?czJndkt2RWtGR1ByWm15NmpQbUc5TWVIV1dyMlVEcXZpT1g4QjZCWTZpY2hp?=
 =?utf-8?B?cEx6K3lrcEFDT0NWa0YwYzZDdXhWOUZXZTNkNldGc0JoZTlTR3F2c1Npd2R4?=
 =?utf-8?B?YlU0Qm8zcjNBYWtSRkJ3ZkE5aHZCQ2pra1ZVU1pETTNVVjhpTGkvbUQ4YXJR?=
 =?utf-8?B?MGhEaDh2aHpCYTFDSFBzdGl4cnhOYmw4bU1obk1VUHdQVk1JcXF3YUs5dW1R?=
 =?utf-8?B?VmkrdXlkdk5KclQ4QUZPY0N6bmtTaHVzaHJWZ3RpMTF3eXB3UGJQR1dseHU3?=
 =?utf-8?B?RHNHSWlNZHE1K24zOExUdHJRR0xSQUkwN2Zkajh5eklPVy9EZ3JObkFKejRw?=
 =?utf-8?B?d2QvVm9iaUJ0OVpJd2d6bFF5RTY4OXByQVpvZ0ZaQzhtWEFGcTlITnhSMDNr?=
 =?utf-8?B?M0o0WnhwMGd6TEhlUWphK3MzbEtNYXlqalF4dUJlRGFFSzIzQW5HampSRGQx?=
 =?utf-8?B?SkIvOVNkTDlqZE5UUThlOStsVUpGTlNvVWVTSWx0ZURGNm9oRDF0VzFpT1N2?=
 =?utf-8?B?OGdwRzZNN2szbFp1eTMwUVpjZ2pDNitmdXZBeEJ1WmxXeVFvQ1FTdW9lamQ4?=
 =?utf-8?B?NWZQNVdac2EyU0VXd0lybnVobk9uaGxOYmRWMEFpTTRLbGp5dGZYU1RjVjRL?=
 =?utf-8?B?UUtVRWYrOVJ2UVUzQW94LzV6ZmRsV1RoYXN4V0d6SElDdXpDeGpzcTVEY3Rn?=
 =?utf-8?B?bWtzeHJkZ0tHU3I3cGl2Q2YvMTJmLzg3WjlnUFh1cEdTdFM4RFZ3MzFjMi9H?=
 =?utf-8?B?V21UMno1alRqSWlWL1lDcEpnQ0k5YWxsclV6dm9pN3lxUXFUYVBvNTRmYmZ3?=
 =?utf-8?B?R0JaNmRyRmhNYml6YkNWUnc2Z1ZjNXI3UjY5V1ZRTm9hbFZJYmw4empaRGdY?=
 =?utf-8?B?UmxnektWcElZM05iQXIzaEdNTGZ6bFlLaEt5RWs2dy9heFR6cS9RcThubU90?=
 =?utf-8?B?UE9ZWENXTEdReHNlK0hEcEJKVWJvUTFvaTRGbGRpQTZaSlZTTVpaSXFLN2Y0?=
 =?utf-8?B?ZVcvQlRTUHI4MCt5ZGdvczlxS1czWkdXaXJlL3pzWEJsQk4xdWFGcklURmpq?=
 =?utf-8?B?aUpBZHdQM3F3SWkyOGFrcDZnZkttd1lWMm1IUWlVMWJQTi81SXEwTTJNbnVZ?=
 =?utf-8?B?QlB2NytOeFRpUzFSUFBUTHRKRnRmRDhuSWJSV0VBVE5XNmJHZ2FSTkJwbm1q?=
 =?utf-8?B?Tm5aRDExRzc0OWhldUlCbHZPalVUV0huMVZJSVBEd1ByZStvbUhsVDdzZEhR?=
 =?utf-8?B?eVltSkdNejloMGtDVXpoSzBlN3BvdlNPbFBORUxwYXRiYVdNUDJMVXpjamNs?=
 =?utf-8?B?dFp1ME5SM0JwbTlmeXBzSGk5eHc5UnExS2JteVRkMmxVRlFYVDlRVjF5QlAw?=
 =?utf-8?B?Y3BUSHJEcFg1bkhUQnBmcG5KSUFRQVMzV0RlZUh5R2k5UkNhZWdOMDAvT0NG?=
 =?utf-8?B?ZjFxOG1BSEg0Tmg4Y1Rrd0JBVXI0SUtiTVBNclBuZVZYT0pzOVY5cjgrMElJ?=
 =?utf-8?B?bE5NUjR1aFRyYnNTK0lycFVpcFljMzY2Z1dGRWlpWTdLdi9DOGh3MWh1dldh?=
 =?utf-8?B?TFpodGVVTDhaMjRHS3paN2J0TSt1cE5oMi84aEVGRGtaQ2dRQzdYVnRLcExY?=
 =?utf-8?Q?3zrxyNuQtDw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXd3cmQ1T0JlK0hRZWxVM09YczVLZUQ2Ty9JdGgxUjlXNTBWVHc2cDBEYk10?=
 =?utf-8?B?a2hwc0pUTEJ2SUZUK29aRmwzS1lkaFFuN3lqRmFaNVhDTGJSNmdFbTI0ejAy?=
 =?utf-8?B?VUFQeHcwM0VvUUhJdFEvS3gzdDJxWVNhR3Z3dW5uQktEcEFFRkhLRS9qbm0y?=
 =?utf-8?B?RVJDRWR2R2w0M256WDBsUnFhQmx3K3VSOE05cWNGazZvN3EzZWNuWndJczFE?=
 =?utf-8?B?K1BiV1VHUUJDM3NwQ1ZIYzJZYk5VMzB2YnRWdytaUmYrL04zbVV4WTg2dzFh?=
 =?utf-8?B?TzczdVhaYXpYeEc5Zy94NnpZak9GNmJScnJIOGlUNUlWRjh4emdVU0paeG5W?=
 =?utf-8?B?SEhMcTFHeE9HTDV5MmtVaUlIWXFaRUN4V2toUDEwOS9oOFRiZndPVFJVNnpU?=
 =?utf-8?B?MW9xSVM0UC9LWjRqdG5lUVdjY2ZsL1NreEw0OHRGZ0FXS2JkSmxtWEYzVGhp?=
 =?utf-8?B?amE5R0pxMktFZ3B4V3R0Vjk5alEzQUw1bHNxVDFkSmVGVkQzV1J0ZzhGVVFQ?=
 =?utf-8?B?L01icUFDVGsyaW0zOFYrejdncWZyU2RXejBmQjlabmd6YjhtSlZ2UzNWOEJE?=
 =?utf-8?B?QjROcFpTb2MyQ0VLM2Jwb3RSSkhnZzVtR3A1dDBaY0FoanRZa2hIOEJUT3VV?=
 =?utf-8?B?MnhSSkZzVTkxOFNnUmhSSnpPT2lHNlo3dmp3RUErNTV2RVQ3ZzlJa0xvRGxm?=
 =?utf-8?B?MDh2dXJEZGxnUS9VbXlVSHI2M0UycDlITnFDSmE5YjhZYTZBMlBhTnJMSW8z?=
 =?utf-8?B?STdJcjZoZ3JCRkNjWlpLWkNuUjhzU09URThkd2d2d203UHQ3REk3VlhNNFdM?=
 =?utf-8?B?SGNUeDg5R2Y3QzJ4RTBlWTA3OHEwNmhXVnJCekFSM1c4QjZzQ0JpUXZqSkJI?=
 =?utf-8?B?QUVoQTUvM3BZR0tGUm40ZEgwSmNLQVNNYkJTd2FDSk5aOFovS20wb1QxVE5K?=
 =?utf-8?B?ZEd6Wk1TSWZQditqVmwraDZQcnhyeEZOdXViRUtwbWRaMTZ1cmJJd0NPeUgr?=
 =?utf-8?B?SFNtbklveFRTMzI3RHJHZkpYcHdZVzlTZGcxeXhaZ1lpd1d1dDRDQ3lYNzlR?=
 =?utf-8?B?OE4wTnRKTHU0WEhzTHhBeTBjaXdGNTZlN3h4Wm1kL1FONlFyN0ExelpjQXQ5?=
 =?utf-8?B?WjdtSURDYXVzUjBxVmJhNm93bkx3Wkd4cXBZYloybG9CTXpRRmQ3UjNYRTMx?=
 =?utf-8?B?YXhkL3A2bUd3eW8zdklNY1hTZi9TQmFWMDFjZjlzUUEwLzVnNWVBdFNtbmow?=
 =?utf-8?B?aWNaKzhDRlVIaHB2SDJtaENqVzJNOWd5emRzR3QydExrS1JuZjgvR3dNTmFi?=
 =?utf-8?B?VDRHWVZ1MDZTUUZpM2hPc3NVQldvV0pGbWJualdwZ0VGYzVQMFM2alppSktl?=
 =?utf-8?B?Q294QWtvTmtKREhCRkV6Smk2QTdodHJqcHhuOExtUUxjNWdjNlBZejZOU24w?=
 =?utf-8?B?Nm9qSWNVZjZTeEJXMnYyZlprazYxd0JOQWlXbUh4cEY4MkR2U2wvZDllUlAr?=
 =?utf-8?B?bzVyYmV5TzFYVHR0bHpnL1BlZlpWdkQvZTlkbTBCckt1WDYrckVaYm5yWEE3?=
 =?utf-8?B?MTRrT05SeU9vMGc5UUZ1eU4xZXJBTTU0R0FRWll6d0hneE9tOEVYUDRXdmtM?=
 =?utf-8?B?KzNOTzgwQkplc1p0MEFueDN2VEJ4SmEzWEVpTG14WjNndXJKRStaNXRxTGRu?=
 =?utf-8?B?U0FYZnVRM3lyaW5DRnE1RUdueGlKNGVyQlIzR2FtcWNEMmtCTU12OHpOTFg4?=
 =?utf-8?B?TGlFMHdsNTFhM2ZlTjJCc3ZRdk1SU0hqUEhLVVJ5S0QycE01aHBEOGhRTWk2?=
 =?utf-8?B?amJ1Y3YwR0IwNUlnMUlBNGNZR3pLSnlES25YcFdxUnVsdWN0UzN2eENjSW1U?=
 =?utf-8?B?NXdOTmVQY2lvTUhod2RJaktQY2JwNC8zUVRTaXRQWkdzMUVKbEtqQ1ZmdVBr?=
 =?utf-8?B?ekhKLzJMS0ZzbVIyOTgvM2NkdTdQRWtYdXJ0NnhwenU3cmJSRVIrZGdUcDRB?=
 =?utf-8?B?b241SkVZMDZVRE9xanJwdVJkYTA4TFFDa3FSZDNlZ0Z5VG83VnM2Z2hrcWtV?=
 =?utf-8?B?Nm5wWnVEZ0lLeVdGZVR2WUdVOURzekQ1UWtkVm5rVmpSQ1lXZkJlSUwrWTlM?=
 =?utf-8?B?RW8vTVdQMHpld1VCWDNrSDhhUEQ2YmxOSnVOZXpEVHF1MFVIelU5WXJtWXhF?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be56f618-d33c-42aa-abfb-08dd9c27c772
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:34:42.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfnZR8EaiYtBoT2McImKgNS3HTcF+1dtiyRNRVXvI+fvE70Mel+igV9cyWVt7Y2kC47MbnOzi0InaR3Ym3SGeaUnyM9pGGQ19cyi6+tb0AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB5164

On 25.05.2025 06:40, Krzysztof Kozlowski wrote:
>On 23/05/2025 15:41, Yassine Ouaissa wrote:
>> Add my self as maintainer of the allegrodvt Gen drivers
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e59011a36e6b..9285bb2f43d9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -802,6 +802,7 @@ F:	drivers/platform/x86/dell/alienware-wmi*
>>
>>  ALLEGRO DVT VIDEO IP CORE DRIVER
>>  M:	Michael Tretter <m.tretter@pengutronix.de>
>> +M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>I already disagreed. I commented on this and nothing improved. I
>provided arguments that you do not know the process, thus you need to
>first read the docs.
>
>THEN you sent it again still not reading the docs and not learning
>anything here from previous comments.
>
>You sent four times the same version, ignoring review and not
>understanding basic versioning concept.
>

Again, I do not ignore anyone reviews.
This set of patches is to start cleanly, and to focus on creating the
v1...vX patches.

Your previous previews will be applied in the next version.

Best regards,
Yassine OUAISSA

>You need to first understand how the process works, what is a bug
>report, what is the review process, what is the reviewer's statement of
>oversight. I suggest sending several patches and contributions prior
>asking to be maintainer.
>
>So still disagree, but this is now disappointing: NAK
>
>Best regards,
>Krzysztof

