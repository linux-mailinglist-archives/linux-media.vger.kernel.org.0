Return-Path: <linux-media+bounces-45816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E07C1474A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70F5E3A4E1B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756C330F81B;
	Tue, 28 Oct 2025 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="A0HiN29z"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023084.outbound.protection.outlook.com [40.107.44.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7930CD8E;
	Tue, 28 Oct 2025 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761652070; cv=fail; b=lPBZOn6Z8E6QVh7bo2oi9w+NSIbXty/foM+hbBsicmM6q7KvadBcNItsIHDMoI3rmQ8kJ9E/1C7PShkxmfVo866Ewx04prKrHmNL2yGF7D9Nw0SwzFjfSKzV5ETekrcxyTX+cP3ZAYCJOY6Ct57sd5MqCXfJeOq6dsgYBCx/EVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761652070; c=relaxed/simple;
	bh=ht+DX6yf8G56Uk8Cm/DTEfLR6pw7GwU+AxNZoSMvFes=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aA5IGu93D8/Xr0rId9Gtuig0PKjpWOiU81wLCv591mqmbokq4+FnqFr3f51KTLUG26Dd8n0N8y2aB+nJ1fAK1y13EghYLxiCHWL9hAvY0R1nuN1OwJwKm+jccz0W4+1H50OxQtnt6S1xH1i+BqDMqcPHqjrjQOOUQYODpz46FXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=A0HiN29z; arc=fail smtp.client-ip=40.107.44.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcnkj1SplLqtQ2wICYlSoE1ozlmx6AG0fGejHDXjy+rG1XBh18vakERqNIM85z+1f3Lqb5gcOtZeJ7tslManXFmEDPEvncr/U/kn9ND3vVvv4QzqrrElnAjCZJVFcd4o3b0M9OEbo34vOnU4PS64IAfkm/kfwbmNCpjHMOfaA29Rp9rb3b8sbGMEV3ovoZuckBpDPFoEAiMKynoneb8kx4Bp5lO2B/9zAmNOqAXp3ant6UwdUMsRXZOZWMROzERMxMWybcrWnn/xjrPvoMfirxMZ559aWiRb7WqSh7NUeRine/IVH9ToX+Up6+iRXc0y3y8AwNxcFQ1IKnMK3dKBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYXtOhSZkrmkoHCn6jVLTCuThym4vzJ9yNvD7mwCR78=;
 b=cxAYSnlwU+MM5xRbrk62bjgCEWWWIyyMlMtkkpyMim7RViO1rlS+zsk1zZ+Bm8FdkT2SlKbMhgHgHY3jMtnG+BBj7e8KA32tis3EB5VgGw9/XFcX83/FnPpE4zKGWrxW6OCbGEWSFynPN3drE70Y7aPs3D3kUVh/W5K7y9DXGOMEKTEBO9VmBxc6ZpcSnhzO98CB3DKMW3XG9Nua3BzfijMZ/sGE9e9fY3aL/pbXZpJvUcG10bXTJGU3h+uwd/Ij4iSvqI/MgzXhaRFxg4Daj1qJA8v9XTH9UcLacU5X2oqQidaZAb5y/PKlvQJg2fk/n0SYYNklF/qSWJhqQ8zKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYXtOhSZkrmkoHCn6jVLTCuThym4vzJ9yNvD7mwCR78=;
 b=A0HiN29zxZ5rbZ7it3+Bm9fbAIWba+tSerQ3iTxJ2p+r+quj+nogKF+hqjDPMgwtB7jkaoVsLwdXHiO6fy0p5PaclDAk4zL0J1H24itSgDIXJTecSkoE0043MQQ8gbFVLD/povycAfwp4JUJGuoRVa5hlxLnRMfVOPUOJQfQHpAYxKkx6w9jMmGRQV23cPVL7Wt0IyRmCiq4+cT+KyVlmddWshHnhIVBBIUW5fp3k/MbB42W5JAqtyCOfVh6ip/xsnHR9Lto2JfxhIIgTsUx1moZQR1Ml2xFrKPV5iqxCB7/eSsXyr7wSE7cFQuJBuVTyYCFlJpidMWXuzN2Wh9KIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYPPR03MB9497.apcprd03.prod.outlook.com (2603:1096:405:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:47:44 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:47:43 +0000
Message-ID: <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
Date: Tue, 28 Oct 2025 19:47:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYPPR03MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: b9aa2373-2b33-4cd8-d5a7-08de1617ce7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0xITCttMlgvcytSbVI2d0pMbGhsU3BlRHJVVGNlelFpbS9KWmN5YjlkRVBQ?=
 =?utf-8?B?YzFydTVCZ0c5WS9ZTVJyWDdMME5BMFF5Yno4OERCOXVHWTljTkZYenROelRr?=
 =?utf-8?B?c0QyV3NCYm05bmx1Y3kvT2tlckpDVzcreFAwNWZMbkFsS2RwN1V5VHBJM0hJ?=
 =?utf-8?B?SWl4bzE0bzBuYmhLS0dpNGh0YnJkYXoxeEk4Ty9aVjhzdDIyNFFMQ3c2RHQ0?=
 =?utf-8?B?SS8vNWg4QWtoVmwvVzJlV0ZtZ3BBM3ViMGpDMjlsazZ4NkwzZmovdlBuVTRY?=
 =?utf-8?B?SHV6YU4wa3lwZjhKcjhOMGQ1OHhJT25CSkpYZkxnbERmRjZ3dFpZNjkra1RP?=
 =?utf-8?B?alk5NEM1NG1IckN1TUpmaC8veHBQczVPeHU4dUQ3VGNRZzgzYUJhVzE5WnhI?=
 =?utf-8?B?V3Q4Umw5VnA0Y255ckpCWGdERWR1S1hxMGxncElORWhEQ0xZZW95dnVDNmFp?=
 =?utf-8?B?d0ZjSkxwekVwUTg5bCsvcXBqTEtCM3RVUHRNNit2eDRheTJHamFubFY3aWhP?=
 =?utf-8?B?Y3R6ZXdyWDdMc1dZWndtL1RsK2trNGM1d1ZTY2lwZDgyK2doUE9HeUx6ZWxm?=
 =?utf-8?B?ZUYxcWYrUloxTC84cndpeFI0cTFKdm5EMnlBMTdyL2dBTU9ycU1td3VreUwx?=
 =?utf-8?B?RW5KUFR0anVxVUhTcGlPd0JUQnlReHpKUVhhVmdSck9tMEl1cjhHUmh1NkpZ?=
 =?utf-8?B?UTBKV0gzSlZBQzIxV1ZNT0FXNTFiQStOUnpxTHdXZWlWdk5wMXg3UHBVV0lu?=
 =?utf-8?B?eXdwUXA0R056VnZqSm03c1ZJVHNUTmQrV1k0N1lzcmdtaXR3US9VVzAwV05V?=
 =?utf-8?B?Q2JxWjhDcUViaG9Venk4RkpqZHg3QjlaZkIrL0RYZEFyU3NHcEo4RlpZbXh3?=
 =?utf-8?B?TlZIUU11ZklXbE9WVXlhM0dHR2gwN3NLUGNHMHU3WWZNeWtXSWxiZXM0QjhM?=
 =?utf-8?B?ODRRV1EwbXNYTXRxREVxZWR5STZPZjRFYmtieEc1TUxLU01sZlZNRHZPeVFu?=
 =?utf-8?B?RVdxOHRxT08ybXdrYUJKUVpQRUdOMmxTMzE3OWdBb3RCSkV2Nlh1VTg1cDJJ?=
 =?utf-8?B?dDI3Z2ZZOCt6MkE5emd5aEtINWZGZ2dhNDQzSEltMFNzbU92cHVNRjc3TFJT?=
 =?utf-8?B?VmN4K1JzVkp5ZysrYTFZcjdYVUhobTJSN2RuNmZtYUhHRTN3QU9qdXZzc0Zt?=
 =?utf-8?B?bEpUaDhpMDhBY21iSXhwSEZqSGhtRGRHalJ3akxIajh1aEJJQmhPYlZDNklY?=
 =?utf-8?B?Sk9nRDMxSTIyc2Q0cVkrcmppYjV2bWNaOTVnVmw0VE1WajZTSjJLK2F2RFJl?=
 =?utf-8?B?TzVSUFFPTERrT1lPVzBFampYSXZmUW5RUFlFSHJoYlMyVkpUSmZqL01yMzRP?=
 =?utf-8?B?encrS3U1QS95NU1NSjYrY21BV3Y1YWczcGJHWkxqUFRjZWlZVi93YTFTMGRu?=
 =?utf-8?B?UmRFS0FJZVhrcTJwa25WTHhPdDVKTmxBSDFRQm1kMFVLQzBTYXZVVko4Qk5C?=
 =?utf-8?B?VXBaUHRJRFlNOERkekZ2RTZaY3FUd1ZvaS83ZUdJQS81cDJGaEZHOGpoVThh?=
 =?utf-8?B?Y0pmRWhTY244a29naHQ1YWU2ZStWWDJBcmdVYXZObENhQTE0VGwwRkg4Mzda?=
 =?utf-8?B?dUsxNUNoSitrT0EvZ3ByYWx2RWJmYzQ3d1hhSG5RWDJkREoydkFPQlhxbkt2?=
 =?utf-8?B?K0pneGhEQW9pUU45NmFNdWpwMXlMamY4aVpJRTZ0NlpxTUI0MWI4R3hYRnhi?=
 =?utf-8?B?UlVZT0FtcHFRWFEzNEJIdldFbTBFcXZkWG5NS1g3VWF0L254U3U4d3h4RHBI?=
 =?utf-8?B?eUlWNXBUWXVCOGFGd2Y4djNXeWg3RjJpN1pUOGwzT3BHekJQT0xCUHhMUXEx?=
 =?utf-8?B?NldKUHpRd0FKT1UweTR6NVpXYnBCdzQva055WGJpTG5OOGwyWFU4SmtOSGtK?=
 =?utf-8?Q?Vl518ULEmpZPx7PuCGCkX8kgSKAOqyKo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGlSU1FoTjJsbjIrUUxDWW1uSk1KSFJOWEM1RGZVUTQyVFF0QzBlcEJRYnhO?=
 =?utf-8?B?bjlaUVFFZVc1U1pMZVhCNmpjNGVZdVRvWk5nYzdGU2hlNXdkOHlUcXJwM3Fh?=
 =?utf-8?B?TWJMdG5CU3VWb3dCcGtRR3JjZUpUOGtsMWRJMjZCcjNJdmwwYTJDRUJwOFRy?=
 =?utf-8?B?ekU5QjVNUVRjQ1ZRb3RxeGVHN1RJcUZ2eHhEOEtwa0JSZFlGLzdENmltM2tm?=
 =?utf-8?B?ZkJ3eE5ETzIzYkUyRXIzYkhGdFhTTi9CQUNEQmcvVkFYOW5kczYrUkh6Ymhj?=
 =?utf-8?B?WXNLWExMZFduUk9tTEVubXJDZC8yZTVrb0M3L0NwYjRhTzB1WU9YaDJJNGto?=
 =?utf-8?B?TEhtb1o0RjBtdHJwVXVncFdCdVFGZmZMSllvdWkvUDNBMnBNRXZHai9SNGZk?=
 =?utf-8?B?azlBbU1KMU5ZS09EbExDOGZ3UENtbnp3TnhoUUdiY1MwYXpNWTVIQjc1VUlr?=
 =?utf-8?B?SEFBSk1jVXFTbUltRkt3b3J6VzlpRWI5VnFTNWRGVkFGWXB0OFYzUklKSkFI?=
 =?utf-8?B?d1lHTUYvWW9LSytUWEVJNVB5cC9hWGRsbUVnbGlMOXltN3Y5NUR0aTRJV2dx?=
 =?utf-8?B?bjlxYjBMWDdZaWk5dVlCV3JreTh6OTJiUTBCcUtUcUcraldqdnJpK3JwMVhm?=
 =?utf-8?B?ZnNWWFdQdDJNSWhQQUQ0L3NkNXpYLzJ6N0ZjTExBOHRVYSs1RTZ3cFlRS2tj?=
 =?utf-8?B?ZktwRWFQZFRJbU02eW9sSS9mYkZBWGtnNHVyQnBwQWlnMVFycmd0NTRKMC9z?=
 =?utf-8?B?d3BqZVZTMmNSdy91dU5CTEZKRFdTZkw5aVhJbVBKdFhRVnlwSXRaRWQzdDRy?=
 =?utf-8?B?dk16T3dRWDlXTDR4VXVXMXY0bCszd0sxQnBxR3JUaktLei91Ui9VakhRRlNE?=
 =?utf-8?B?c2M0Y2ZnaURQaXlBWFRmcHRGZHJnVmlsZFVJenBkdnUveUR0dkZraXBZZ2lV?=
 =?utf-8?B?L0x1SGpyRTRxUzlYVVhpMmg1V1BuS3hkRFJQd08rQlJMbE1WTDlOODVHbG1E?=
 =?utf-8?B?dVo0UU1zOGl4QXFnLzBEMTFFNW00ZWZlREJ0SFo3VmF6TjF3clM2eStPQ3lG?=
 =?utf-8?B?cGp2Z3cxc210OFdzOWRtSFBHZnB0SVBwaHFNT0UxK1Rrd1RyM0Z0dmJzdU9w?=
 =?utf-8?B?Vmw0cWJCZ051ckNKL0I2a09JRjdWNGVleHVVSTBuUUIraXBiWkZzNTdUR05l?=
 =?utf-8?B?RDVheXdLV0VsdWNPalVYdENINXh0MnBnaFpvL1ZHUnZoM2JWK0Z4T1V6blZ5?=
 =?utf-8?B?SW9zeTlpVFlYbXlwY3ZwT0srdXU3bXdWbTNnUUdYMWg3UGlCMC9PdUM1cmV2?=
 =?utf-8?B?Wm0yK2hjeThiVmtiYjJtSHZJTm9WWi9Qdyt4YnBJSjlhdFEyaWpQQW52WUZS?=
 =?utf-8?B?V1pja2FTbFRhM0FWRVBLU2FzeVNJRkVjODVic2l6R3hQTlY1S2NIVTlTVThD?=
 =?utf-8?B?WUZMdWF0cHc3NmFjTzVXT1NFRDRGdTA0eVc3dTN4eWM1dkpBaXVJNnZqc0Fq?=
 =?utf-8?B?d21qYWw3N3VTaUgrQzhGNzhhVHRyc3loVmZJOGh6S3JOTmViZ085UklxZWJ4?=
 =?utf-8?B?ekVWOXpMYmVhYkk2cHFBKzZpaDgwSWVkZjlxeGwrVFlTeWxiU0xmQzUwaWZX?=
 =?utf-8?B?K2tRZmcvczF0cjAxNzJIWStlTUFwRXhLbkJvbUlETmhhc0tUL1hkZ0wxejlp?=
 =?utf-8?B?eWV2VTNwRllwWFdKZ3psZDZFNzhhVmFBSVVwLzRQNFZ2RGlRYlYxNFg1Vk42?=
 =?utf-8?B?SDhJVE9rbTNHeitBT0ZYWFJubzhDdUUweFUrcDRjZHJCS01hV2Iwc3JDL1dW?=
 =?utf-8?B?U3NBYmpxT0VubXd2dGdUQllub1pmVHRoSmNob3lIdnRTUTR4M1UwZVVod1dl?=
 =?utf-8?B?QTNCSnAya0lxN0haS0NWVnBJZVRVeEZIY2ZaVkZqKzRxSTRNWHdRbTIrOUh4?=
 =?utf-8?B?MDdzWXpIUVZveTIzRHRXY0pYUUVuWUxxN1p3clBPUjFsT1VXTHQ3NitvdWt0?=
 =?utf-8?B?VXJSc1pQdzBLUjBRc210bGV6QkIyditwelh0TDB1MDc0cDd2d3BoVC94dVNX?=
 =?utf-8?B?TjdWZzN0UFgwdnlWc1VQYklmRXk1N0FhWXhKdTJvSGFpTkk5eVlXRkNoNU5C?=
 =?utf-8?B?L2E4dkd5UDgvWjF1cHRZaXNpdkg4dTJGNTRzRXJJVFpYMHpMd2w5dnZ3cG16?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9aa2373-2b33-4cd8-d5a7-08de1617ce7d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:47:43.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HC5466DTP8VWqfYU8/blhFcoPfp6pjASGJkJOmRs4N8fdNA8EVQ36PBUZqUvW0/GT3WsohdA6FDbA9jLP4KVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9497


在 2025/10/28 18:50, Neil Armstrong 写道:
> [ EXTERNAL EMAIL ]
>
> Hi,
>
> On 10/27/25 06:42, Zhentao Guo via B4 Relay wrote:
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
>>
>> The driver is capable of:
>> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on 
>> the S805X2 platform).
>> - Supporting I/P/B frame handling.
>> - Supporting vb2 mmap and dma-buf modes.
>> - Supporting frame-based decode mode. (Note that some H.264 
>> bitstreams require
>>    DPB reordering to generate reference lists, the stateless decoder 
>> driver
>>    cannot access reordered reference lists in this mode, requiring 
>> the driver
>>    to perform reference list reordering itself)
>> - Supporting NV12/NV21 output.
>> - Supporting Annex B start codes.
>
> Thanks for the initial drop, it's very nice !
>
> First of all, this still requires some work so it would be better if you
> used the RFC tag until all issues are sorted out.
>
Thanks for the reminder, I will add the RFC tag from the next patch 
version.
> You didn't tell anything about the firmware, did you build a specific 
> version
> of the firmware to handle the stateless and bypass ESPARSER ?
> Will this technique work with the released firmwares of GXL/G12/SM1 ?
For the firmware, we need to build a specific version for stateless decoder
driver. The ESPARSER is fully dropped. As I mentioned, this technique needs
specific firmware so it would not work with the released firmware of the 
older
SOCs. We plan to submit the new firmware to the linux-firmware repo. I will
share the commit once the upload is completed.
>
> Will you support the compressed format and 10bit with this ?
No, the compressed format and 10bit are not supported.
>
>>
>> This driver is tested with Gstreamer.
>> Example:
>> gst-launch-1.0 filesrc 
>> location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
>> parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv
>>
>> The driver passes v4l2 compliance test, test reports :
>> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>
>> Compliance test for aml-vdec-drv device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : aml-vdec-drv
>>          Card type        : platform:aml-vdec-drv
>>          Bus info         : platform:fe320000.video-codec
>>          Driver version   : 6.16.0
>>          Capabilities     : 0x84204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>          Detected Stateless Decoder
>> Media Driver Info:
>>          Driver name      : aml-vdec-drv
>>          Model            : aml-vdec-drv
>>          Serial           :
>>          Bus info         : platform:fe320000.video-codec
>>          Media version    : 6.16.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.16.0
>> Interface Info:
>>          ID               : 0x0300000c
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000001 (1)
>>          Name             : aml_dev_drv-source
>>          Function         : V4L2 I/O
>>          Pad 0x01000002   : 0: Source
>>            Link 0x02000008: to remote pad 0x1000004 of entity 
>> 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 6 Private Controls: 0
>>          Standard Compound Controls: 4 Private Compound Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK
>>          test blocking wait: OK
>
> Please also enable the streaming tests.
Yes, we did some streaming tests with Gstreamer, fluster test and bug 
fix is also in progress.
>>
>> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 
>> 0, Warnings: 0
>>
>> Some Fluster test cases are still failing. We will publish the final 
>> results
>> once all these Fluster test failures have been resolved.
>
> As Christian reported, please add the flutter results aswell.
Thanks. We have now tested the JVT-AVC_V1.
Result:
Ran 54/135 tests successfully

- 52 test vectors failed due to interlaced or mbaff clips: The Amlogic 
stateless
   decoder driver only support bitstreams with frame_mbs_only_flags == 1.
   Test Vectors:
         cabac_mot_fld0_full
         cabac_mot_mbaff0_full
         cabac_mot_picaff0_full
         CABREF3_Sand_D
         CAFI1_SVA_C
         CAMA1_Sony_C
         CAMA1_TOSHIBA_B
         cama1_vtc_c
         cama2_vtc_b
         CAMA3_Sand_E
         cama3_vtc_b
         CAMACI3_Sony_C
         CAMANL1_TOSHIBA_B
         CAMANL2_TOSHIBA_B
         CAMANL3_Sand_E
         CAMASL3_Sony_B
         CAMP_MOT_MBAFF_L30
         CAMP_MOT_MBAFF_L31
         CANLMA2_Sony_C
         CANLMA3_Sony_C
         CAPA1_TOSHIBA_B
         CAPAMA3_Sand_F
         cavlc_mot_fld0_full_B
         cavlc_mot_mbaff0_full_B
         cavlc_mot_picaff0_full_B
         CVCANLMA2_Sony_C
         CVFI1_Sony_D
         CVFI1_SVA_C
         CVFI2_Sony_H
         CVFI2_SVA_C
         CVMA1_Sony_D
         CVMA1_TOSHIBA_B
         CVMANL1_TOSHIBA_B
         CVMANL2_TOSHIBA_B
         CVMAPAQP3_Sony_E
         CVMAQP2_Sony_G
         CVMAQP3_Sony_D
         CVMP_MOT_FLD_L30_B
         CVNLFI1_Sony_C
         CVNLFI2_Sony_H
         CVPA1_TOSHIBA_B
         FI1_Sony_E
         MR6_BT_B
         MR7_BT_B
         MR8_BT_B
         MR9_BT_B
         Sharp_MP_Field_1_B
         Sharp_MP_Field_2_B
         Sharp_MP_Field_3_B
         Sharp_MP_PAFF_1r2
         Sharp_MP_PAFF_2r
         CVMP_MOT_FRM_L31_B
- 3 test vectors failed due to unsupported bitstream.
   num_slice_group_minus1 greater than zero is not supported by the
   hardware.
   Test Vectors:
         FM1_BT_B
         FM1_FT_E
         FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the
   hardware.
   Test Vectors:
         SP1_BT_A
         sp2_bt_b

We are working with the remain failures, we think that these fail cases

must be resolved.

I'll add the fluster result to the cover-letter from the next patch version.

>
> Neil
>
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>> Zhentao Guo (3):
>>        dt-bindings: vdec: Add binding document of Amlogic decoder 
>> accelerator
>>        dts: decoder: Support V4L2 stateless decoder dt node for S4
>>        decoder: Add V4L2 stateless H.264 decoder driver
>>
>>   .../bindings/media/amlogic,vcodec-dec.yaml         |   96 ++
>>   MAINTAINERS                                        |    7 +
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   24 +
>>   drivers/media/platform/amlogic/Kconfig             |    2 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   15 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  759 +++++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.c  |  154 ++
>>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.h  |   22 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  263 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  194 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  652 +++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  182 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 1790 
>> ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  300 ++++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  175 ++
>>   20 files changed, 4770 insertions(+)
>> ---
>> base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
>> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
>>
>> Best regards,
>
Thank you

Zhentao


