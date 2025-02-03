Return-Path: <linux-media+bounces-25535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B8A254BB
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D45E1881D81
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4C41FCCE3;
	Mon,  3 Feb 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GNMftkVB"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211D1FC11A;
	Mon,  3 Feb 2025 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572239; cv=fail; b=SfQx8eSQhxva313xm/O9KtJAkRuYqMj4DkhsXjnX2WKzXcCbBrjQ13P5X5b+Ct1ah6kBqUVo7ZyBeo7oOKU9Z84PCW2dwpTILmrxVKieS58IIqYaX+4t+DtZmd5T+oVqURXwysZ3kuWlDSej7krxT4u2OmR4OHXg4b6ac8ZnGPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572239; c=relaxed/simple;
	bh=2vQTMMJul6s2jMmaUpwaSF96/vGyMfByCRFFvS6jAGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mBj7lLVcxre8g7kcxCytwBpE7+HeGaRU9rEE/XE3zW/64VwiUngQqDz63Iw+6vE3Jyv5LDqDVxpKXb0/G+HSZDodxkBIWAZHjhhwAnKpk7TUQwe62CBOQjUdqHL+Qle5PdJ7VfWKZvwWZD8FBMfBvmXsdfZf5MIKh8dH5YK1HrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GNMftkVB; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AITU6Rk43ryxHSsMx5ez06YO+XoSVQnMpH/cULDxsORZd7fGqeCyxsyF2XwpxXuPtHeNa0n/S8pmYgG5hQ2XaT+ZB1c9vzgb5V/Xv7qfO1VzabJs7KExjfjS24D8zqNDROrQzeraTO6uoHBf9tCtOuH5aa5jaKSIL3F4Hi+QZ8jUEBVXVu0EfYEb+wCpf4+k9mG/mvsG4fAgbxmNG4WAjKiQ/HO3M1Px5iGqCcKBncMV9FjipB3R+yPb7tty/2h3inj8MvwBB6mLRlN+VL4I0Ib5/1xnTqZpxr18RCERlHhMo6I9JyS7NAEpC2B2YoKmB7lnal12HMPIYZ7riZLy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE0k8iDGsa4nNNasSZit40bLPJOJ+5HqsdP9Y0K5bqI=;
 b=jlubdkDPfm/dgO/B1ZyLbAgtITB3Xu9tZ1Pq3lS6p/5tMODCSUTua8FyKlKX1TygPjJ2bSvcKlsyyIo2emlpQoQabTnxFEHdkyJSve3gj2XU4sWocsMSfAWnoRsqX4vyQ7TywHzN1jeSVkZVZywEx2kEw3k0eTaJeB6Z4iI2TZH3lKhKO9yOfkYf0vja77bjQhnrjDEZlqb20X6RnzPhQwJ36FoAhTIAm0Gkg8GyoPLXWb+sJfxfQR2evlX4vjmZVCWwbAiANDkkgsAIhSFeMFoOA44O4ZMezkSlE5kaDT0Vkh6boGaMivcJiD+bAZIkYPu21DxK4B7aX4WmP1PTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE0k8iDGsa4nNNasSZit40bLPJOJ+5HqsdP9Y0K5bqI=;
 b=GNMftkVBhISaHD4JW7sp4LTvPOjQAOS6g2ZehX+WlAqaRrh3v6qWcXHpHGRoFpN0MxFrQ8frORix6TPMq+i96l5wPIg1cihUcf3TwNzQplIOuc0eYpaHTeL3bVrlkLsD6BgnlzaB7rHXzSbOGnDebbRwAHN/JS6s7ahmOvuaVICR/WiTmB0wsnzuUYXrm9kRA2RF+mDpkKNmqNmK19CoqiLxz93TMNQYaul1gfksizCqq1lTD1i7DIYJh7gvA3gk5bzi8AygaQVMOB7NavihJv50ZSAdQd3u3E8RJtdpkhbdi5mLm3XGKnrEvzSkHRLs373ZKWmBwDtNEC9r1Wxtaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 08:43:54 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 08:43:53 +0000
Message-ID: <56fe323f-ee09-4a60-ab57-be2baab3af30@nxp.com>
Date: Mon, 3 Feb 2025 10:43:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v3 4/4] media: ox05b1s: Add support for Omnivision
 OS08A20 raw sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
 alice.yuan@nxp.com
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-5-mirela.rabulea@nxp.com>
 <20250124-bizarre-cherry-mayfly-9f2bce@krzk-bin>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250124-bizarre-cherry-mayfly-9f2bce@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::10) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fb1d47-a76d-485d-cdd2-08dd442ee37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZOeXRpRnpodCtUaUtlUEgzSEhzL0hJOTY0dkFXdlNqblUwa2pNMzV0S2x3?=
 =?utf-8?B?VWFXa1B5K2JJYnZLU0g5VWJpVGE3ekVTamkwdHdKK3ZRWktQZ0pZU2ZEVTR6?=
 =?utf-8?B?R3dMbDBSOFBzL1JJckdybFVMZThmMGMvTnBsd1p3czZmTjBhMk1KSWwvVFp5?=
 =?utf-8?B?UjFIWHJmK2ZONklqYjVZVWhQQWdGUFVtRXlwYWY1VU9LbWtOZkFnWVhvYVNx?=
 =?utf-8?B?TTkrUzQ4a1BJV3k4SlZ0UW1GaWw2QXlpS29kYytQNG5PMGNmbFcrUDBaK2Uw?=
 =?utf-8?B?dTU1MDZCSU1aNmVlSldzRFNTM2Fpd1psQjRnTllNZUJVWlFGYVpjR2M5TUsr?=
 =?utf-8?B?Q1BlYjVPcXBZREpCVWdrYlFNUXJnTTBTR2NqSmtIOEVIRTlwbG9HZGpDeVdp?=
 =?utf-8?B?YlNPQlRFQTdvTVdCTmw4NUNHOUpIYkFQcktGbzN1bDJSTkF6UFdjTEFIZWpo?=
 =?utf-8?B?ZVVHSlVYbWJVV1UrKzNGdGVUSTNpS20yL2tEdVBRa21UUWZRNjVxUHdXTjJN?=
 =?utf-8?B?TDJIUnE5SHZNOXM0ZXRxYjI1Q2x2Nm00emdIazRpZGN6TTllZTFEcW5rRnc5?=
 =?utf-8?B?WjV2ZThiMFp3eU5ldXNEVWkrSEFZYkh4OXpiZEZETExROXlIZlh6akkvNTFG?=
 =?utf-8?B?M0NLT3M2MWRkVHFDZ3QwOThMZ1pCaHQxRVMxTmFnY05TUjNYV1N1dS9GcVdo?=
 =?utf-8?B?SHBBS0ZaWXBrVnBhTmpkemdicDlQZkFZTXNBckNCTGE1bHRZTmJCbDhYUnEx?=
 =?utf-8?B?SzVDbm5nR0JmTjBrVHZKa2R4SGpNTUw1N0laRkpDYk9rZCtPUDc5cFA3bEJk?=
 =?utf-8?B?R0ZpTXpoNGR1OWpUbG5OMENCSnpmd3lvazlBTjA0QjZsa1ZlQWtGS0cvc3Ru?=
 =?utf-8?B?NEtGVXRETy8wNzZ5SG40SEsvSmhVSDFnUE1oZlVvRDN1Zms4MXVWekJ1anYr?=
 =?utf-8?B?YXI4MmwrbTNQd0xGOU5NVStjb2RoMzB0UVlCanlIUktNNGhIMVJMZEFiVXA3?=
 =?utf-8?B?TUxudUFSWkhmaUhSNUwxakI4SVgxVS9Fc3RiRThZY2RlejFXUGRFYW81cUo4?=
 =?utf-8?B?Rk52WUErbjY4aS94bUszcThqVUNVQ08zek1paXhqWERxU05NRWtiMEpXRGsw?=
 =?utf-8?B?eTJ4Y1lYZzdGeEZYNFFCOHh0TXJReElBVURUK0ZmbjZCaEdpUWdieUl6Rktn?=
 =?utf-8?B?V0J2a1JVeExRRGhkckVrN01iUUdJTENBY2M3Yy9HdnhaOENYdnh3TVRNNU5R?=
 =?utf-8?B?SjZ4QW02cUxZZlVKSnc0RllrRS95N01wc1FYSnd4ek5WR1pKTWJna0x3bmZS?=
 =?utf-8?B?cGJOYTdxak02NTdZaHhpRnFzVHd4azdaU1ZLNE11cms4WGZxWDRCdzVmcjZ2?=
 =?utf-8?B?Ti9Yb1lySUt2SXYzN042enlMbUkwRnovbnUvSlBsRHdwYVFHajhacWt3dytF?=
 =?utf-8?B?aVF0S0hiUkVtWllFMnJ1blNFckRpVnYwYklLMWg2bUZkMkNZeFJHTTRlZndn?=
 =?utf-8?B?bGNkY0RYVTJlK2RPV0JXRmZRamI0SEpOOVRsTi82V3VQNmdrS2Q3QVRmK2pB?=
 =?utf-8?B?UFBJVGxsNTdwUWpsTmd2T2FFeFM5SVB1N3pmNmNwSTZFc1czdGF1RkJ0RFIv?=
 =?utf-8?B?STlZamRIaVkraHUyS2RRaWhCS0pTVENGeWEraVpCNGpEN1YrdFZ6bktDV25W?=
 =?utf-8?B?UCticTZuQnVJMUF5d1pONTNmOXM1WGFlTzVGT3hUMEZBNmU4VGZqZ1luakJN?=
 =?utf-8?B?NjducnBZaUpES2h2RWJDaEFoWHdqQkRISTJmbGoyaXJDaGpoNVRjWUhmM0hq?=
 =?utf-8?B?ZEp5RUZxSy9BRFhDdFIzdkxuTU5ScjI0NXVPaFl2cXZtcXFkOHA0NGJpZHhE?=
 =?utf-8?Q?7SQC+L5nRQsCl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEd2aDViWHRQNHdvNmtWVjJNajlzNkR3RnFTRFpDSllVTkFrazd2QnRWbHB6?=
 =?utf-8?B?Rzh5SXBJUVdwbVp2NzNYVHA2KzJ6bjUwbytIdHJIRDdEYVc1eGhnaUhKNjNi?=
 =?utf-8?B?Q1RIWko5U2p4V29vMTV3bGdLZU1VaEw5dnlIQ2tZNmg5eTJyRFVLLzM3ejUv?=
 =?utf-8?B?dEJEczI3Mm1xQ2NMQWJOb0NXc2ZveG9kNHVreGFBMW4vRjFIM0pFZ084TUdM?=
 =?utf-8?B?bWEvNmc5UllFcE1jZ0hKRkRpaHFKRlJsVE1zNVdjcWwrSEM5d3hNWTkrOUg2?=
 =?utf-8?B?RWVkekx3QVg3L3l4elphNkZVVTZ5R25EM1FHaEp6emd6QTloeEtnTS9EZ1Bv?=
 =?utf-8?B?aFR5bjRzVVQ4VFp6anJDenl4UnIvTG1jTnYyZWJLTkJoRkcxSWF1R3RZOFNu?=
 =?utf-8?B?cnVkZlpkZFpLcXorOFVaQzRYWm02a0ZxdVV1RXZnY2RSZC8ycTdjTXlZN3pR?=
 =?utf-8?B?bHI5SUdvOXc2RjZmTEpXa25QdzBYVjVSRUN2TEs5ZEYzM2hNZUlDYXpZSFAy?=
 =?utf-8?B?NEJ3TFZEUzF5Smw4NDZPSkoxZWdxaFpSTnRWTUI3RndqdTdqeUFJSjMrZUZ5?=
 =?utf-8?B?c1BMNDZZcGdiemtUK2NjT0tIdDhoVm9GNUFKTEFOV3piZGJON2E5SzNuNlIv?=
 =?utf-8?B?UWgyTFNFdURHeHpLUUhQTndCb3E2UXJsMUhpVy9Nb0tneVJTK28vZEhMaGdG?=
 =?utf-8?B?NkUyeUdzdHFkc2RoVXpFMTg1eG1pd0tUWlowSklxQTIzOHZlSnY2SFprMGt6?=
 =?utf-8?B?cnU1bVBzbG1LOHBnNFBZUm5UVnJXdFMrQSszWkhHOG9QTDF1TE0vSjFEQnZq?=
 =?utf-8?B?blhVQXBLbWdmMGl6cjRiNU5rVUpwT09WRUZpa08xaC9Da044ajhaMGk3Q3p6?=
 =?utf-8?B?bFN3ems4Z2laS2ZrUjhUYjJlNDViQzRmWG4zd1g5RzRabGVtTlJUbG16Y2Fw?=
 =?utf-8?B?cDhoUURFekViNkRna0pVcE5RSWdLSTVUd0IxK3RCOGRMRUw2bnBkMEd5OUd6?=
 =?utf-8?B?M3lNK2FpbThYZUF4M1VHTVpUblBSZkxwR1dPeVdoNkRLUHl1RFg2aStnN2pF?=
 =?utf-8?B?d2xJcnNlamN3ZDBqVWFQcXp3RnJoUXNlL3dZamczWEIveHY5bFNDQ201NzZo?=
 =?utf-8?B?clhTazgrS1JTK2F0eWllYnFWL084am5nOUg4cWpBVk9VZVlzYlkzekxwUVB5?=
 =?utf-8?B?Sk4rYmJYNmx3L3RTc3lJUy9jSGcxejFPUVJHcDhaQjZYM0J5YXlpWkI1OVFv?=
 =?utf-8?B?US9icDNZcVhkbmd6eFdjVWdwMkVjQkdKS1NPWkVhM3dTSFVGSWJYUHErL2la?=
 =?utf-8?B?Y2g5STFHTmRNVXVGYXhadWJCaW9MY3hVbXpKYlNaTVZERTlvYmNCUDk1YXAy?=
 =?utf-8?B?OGZubFJYMDhzb2U3cW9tNm9oS0xUd1BVZnZUSDB6VlpjOXRrcHlnbmhtRWJa?=
 =?utf-8?B?eSs3NmtZbWtNN1NYSWVGY20xNTFDcCsxQXRXMnV6elZheGtsVkRDN2NSZU5q?=
 =?utf-8?B?SFpNWC9tSDFLMlhwUzdRTURvaEFtdi9id051NWNwL2NiUG4zV1NnYy9TS1Vt?=
 =?utf-8?B?a3BKSnMrSEwyeUV0N0tJQ0RzOTZUUitHRGFZQkovNTU0aHZ4RTBRMDUzL3k3?=
 =?utf-8?B?VWNyQzYrQVhYTG9mbHNXM243a0hRbURVU2tXSjlzdkQxK1VvRUV6bVdNcG5u?=
 =?utf-8?B?WTdlbklKZHNMcVorR2xrRlhMQkpXNmg3VmcyODBieUdmT3BqTGYyUCtOS3VD?=
 =?utf-8?B?Q3h4dmtZbzZ4bnhwM2dHUkNsd25IYmdnY2RwRTlHNDQ0dmFiZHVxMWVHOVZV?=
 =?utf-8?B?bzFxWHhjazYwTTkrdzlIZVBwRldCbGg5MnBMWHJBQ0xPcnJJTFJPU2cya3R3?=
 =?utf-8?B?aU5MeEJHbS9ONytrbVpCK1prbUNCaVg1bnhLdEQwWmFlUjJBS1pYRGpKbWw2?=
 =?utf-8?B?emxyK0MwOCtmd2tTN0IwY1dCeG5IbHIyeXFJM2cvRUFOOWtqOFIxNElKWUZJ?=
 =?utf-8?B?SFZ1a1k1QlJYa2lDU1M5Z0Ntc2JiVnhqelAySVpDVVQvWjllYXJrZW9LVzNx?=
 =?utf-8?B?dEN3OGZuTzAydFlSaE5SZ1hicmdwY21oMDhDWWFZQU1SY2ZrOEl4YWhTWEcz?=
 =?utf-8?Q?186V11BlSZ0yxV3Fa3v9bc9z7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fb1d47-a76d-485d-cdd2-08dd442ee37a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 08:43:53.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9NAE9/rtTadZ0SE9gpnPa3JxMDn+uo+nAhMV3uUnqELvQAew71gE92YatteOnM7LN1jAGAkTfeEFiRCOM6Y1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778

Hi Krzysztof,

thanks again for feedback.

On 24.01.2025 10:09, Krzysztof Kozlowski wrote:
> On Fri, Jan 24, 2025 at 02:12:43AM +0200, Mirela Rabulea wrote:
>> @@ -758,6 +914,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
>>        }
>>
>>        switch (chip_id) {
>> +     case 0x530841:
>> +             camera_name = "os08a20";
>> +             break;
> Ah, so here I see missing second device support.
>
> It is still confusing to see that you use here some sort of
> autodetection, but in the same time not.

The two sensors that I included in this driver have some similarities, 
but also differences, for which I used the platform data. I made 
separate patches for the two sensors, such that it is visible how much 
is common/different.  The chip_id reading is for validating that the 
sensor that is actually attached matches the device tree. It happens to 
me sometimes, that I switch the sensors, but forget to switch the dtb, 
and it helps to see which sensor is actually attached. Also, it helps a 
lot when the evaluation board is in some remote lab and I am unsure what 
sensor is attached to it.

I saw most sensor drivers have some kind of identification of the sensor 
module by the means of reading the chip_id register. Some examples with 
multiple compatibles supported and chip_id validation: imx296, ov9650, 
ov772x.

Please let me know what you suggest further.

For your other comments, I did prepare more structures to become const, 
hope I did not miss any, it will be in the next version.

Thanks,

Mirela

>
>
>>        case 0x580542:
>>                camera_name = "ox05b1s";
>>                break;
>> @@ -900,6 +1059,24 @@ static void ox05b1s_remove(struct i2c_client *client)
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
>> +     .default_mode_index     = 0,
>> +     .supported_codes        = os08a20_supported_codes,
>> +     .hdr_modes              = os08a20_hdr_modes,
>> +     .hdr_modes_count        = ARRAY_SIZE(os08a20_hdr_modes),
>> +     .set_hdr_mode           = os08a20_set_hdr_mode,
>> +
>> +};
>> +
>>   static const struct ox05b1s_plat_data ox05b1s_data = {
>>        .name                   = "ox05b1s",
>>        .chip_id                = 0x580542,
>> @@ -912,9 +1089,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
>>        .supported_modes        = ox05b1s_supported_modes,
>>        .default_mode_index     = 0,
>>        .supported_codes        = ox05b1s_supported_codes,
>> +     .hdr_modes              = NULL,
>> +     .hdr_modes_count        = 0,
>> +     .set_hdr_mode           = NULL,
>>   };
>>
>>   static const struct of_device_id ox05b1s_of_match[] = {
>> +     {
>> +             .compatible = "ovti,os08a20",
>> +             .data = &os08a20_data,
> And here static configuration of model, not autodetection.
>
>
> Best regards,
> Krzysztof
>

