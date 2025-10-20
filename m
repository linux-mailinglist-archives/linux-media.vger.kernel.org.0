Return-Path: <linux-media+bounces-45054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18258BF24E3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88F1D34B6A8
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F39E283FF5;
	Mon, 20 Oct 2025 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dRN3l/E7"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CD2773D2;
	Mon, 20 Oct 2025 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976365; cv=fail; b=ZcJoIE+0n5l/TRT5zlYz67YOu4boDHspLx5hEmI2dmZfltH++ZH8cBdyA4FLFrS8MEMEQ+hane/HKsslTq5tCmY9jDB52wse5SBYyZzX0TQseoqDY819TNJeondxo2T4u0uMUv3z4aA7KirROE/JmY0+DywZ85UIAgHVoQaWuuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976365; c=relaxed/simple;
	bh=/KUPiGICeWhv54uX2HQ3TrclzvJBmEwbay2JvGRSM+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h8UEaGD4SIB1zV2qwvHEnNm9+puv6FjrXdZhrkS4oRrbkCnASAlSqrt86UfiVv4NGERlOYk4v0R3Ws8sE0WB5V+7aEXEuJXhszSRFDTW3y0+BjyqR9ht4VieJ3Ap8FyfrbVclhzu7DyBHXjq+1VwNzVSlLJT54reEYoJ8j/gTqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dRN3l/E7; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWwQFAHPv3+bScFST4D66yFvFN8xll0B7jUYfvrrWip8Q5X76FM7YZuLUlOrxvpLrXg6DOcPgsYY5MeOiYXzlzlplJHlXSrAAiS/LbyQHDGYBUV4iRWIAlOb7lINPWy0L6wZsQtQhejQOvkV3iZ3c/RbVZsuZ0oV+EF9GrGeS3T9gIM3GpVs/nZLHDK+fmRKDk8/NY4YfU4AuIasKZ0X+DbnOE2Vue5iaN72j9kW7dU3YaV0pGOMPY0FZOfrUth336fRs9R1AWrSrygc0gl2iagORm7oVT9fM75IDZTYTVXcL1lLODTSEl5s9klP3QkSkdLLeuiEARu0Q3Fm73kJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf9P0FNDqWMdj1G/HPTScolx0CNzG4pFyJoPt/6K3Po=;
 b=hAKv/0mNP8vGU7kdszdyIsAJUCfVJ5CzYpsbqoR1z2MUPhQypigODJfmH0UJz3K3wmsD8R3XQ8vaYmDSXApX1JL8VtF/3S5dTmOt97dASoFfV7Mip/bh3HbpWSrlqU3St3WBHXeTeb1gmutC4uiUUfPi6ej8r7LV+2kNW0V55aT5L3iriCbSgxVDZZSWHCoR6379pdRuzsR4MV4ik42k0q6Q9HvlkyZ2i8JUIjXdm6qXh/JPa9sL+bYhx9nm6ty7FVAa5Uk50R33MI5vqDHf+0WmxSOgvNmmVSF/lWmXppMudjCqdOANIzUA24WtcFLoDYibMDzzCgbWU6rR3hf6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf9P0FNDqWMdj1G/HPTScolx0CNzG4pFyJoPt/6K3Po=;
 b=dRN3l/E7O2PU5uWBmoPnUZQcDTYP7cGPUnoVYOvMWnuptiXPeStNPYbs7Cae4/oxsR4BP6vZ8KyJEHaykoj8ZpbS5KVQ4iMT8tEXK2NDFdzAPNpoOwss4GDNNy1Dcjji46hXx83j/PK+jhGJbJhZvwDbT+6eyCQqSOkCGKNpc/7N0cLqtqrVzqgGp56WURsQHXD93i+/gAjR6pk4jzefU1UqI3l5g/lK3OiqO2hGkhKTZbxzLAKnriEjdxBUcVTNvVABOXw4VVGxTeRCLY+X2sydIRieG/imYabnJj0QV/PQH0y0FZtkUm/A/l21tEiFERfXBP/gMXEW7hNIzqKKJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI0PR04MB10320.eurprd04.prod.outlook.com (2603:10a6:800:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:05:59 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 16:05:59 +0000
Date: Mon, 20 Oct 2025 12:05:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: yuji2.ishikawa@toshiba.co.jp
Cc: nobuhiro.iwamatsu.x90@mail.toshiba, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
 CSI-2 Receiver driver
Message-ID: <aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-4-ceca656b9194@toshiba.co.jp>
 <aPB4TLK7GMe8OLgP@lizhi-Precision-Tower-5810>
 <TY3PR01MB99823F298F8D9B42981306A192F5A@TY3PR01MB9982.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB99823F298F8D9B42981306A192F5A@TY3PR01MB9982.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: PH7P220CA0112.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::33) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI0PR04MB10320:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fdb77d-d4d3-4503-8a95-08de0ff28ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGFnVjUwUFh2amw2aGpsV2RRZUI0KzhGci8raGR0SUpmRW83MVcvYjNhK0Fo?=
 =?utf-8?B?ZVJUbXhwQ1YxUW5jNlhxSStiQUtQK21zcDNDeEZkeUxCaEpGU0ZubWp6aURo?=
 =?utf-8?B?dG9TWm9HY1JURVBpd21lUTY0bzhZeXRvS2tuY24zTFdKREUzd3Q0QXZhQ2FQ?=
 =?utf-8?B?YlB6WmJRQ05Bem4wQ0h3a0Y0dWxMRit5aXhaU3NteWhYdFlURFRUUVJIc2ho?=
 =?utf-8?B?UXF4bnZsaVQrYmlrZVdjNlpMUnJNRDZ1WG5Sd2F3SVVJZWE2UW1XbW9hSUs1?=
 =?utf-8?B?V202MGxnZUVvZG1BaVU4cTJVVkJ2dW5KQnJway83ZERvOUx3VEY3NVJqbWx6?=
 =?utf-8?B?OHp6SStqUm54V3hnOGY4ejdDbWRKZjNVNHd3VGx4YTdib1B0Q1NPSGlpRUlG?=
 =?utf-8?B?TlBaL3lJMmQraWZyekI0SSsxZys0TXdjN2JVbUVPNjZRTlN5WkIzT29XRTBu?=
 =?utf-8?B?Z25tZHBWVjZDcG9pS1RRV2hOYXdBOVRYbXNUaXRndkdQSVFVQVpjczQ5dkZu?=
 =?utf-8?B?YlBWdkNLWmx5Z05Hd1QzYk1rUHg1T25QbGZ2RUdPVHRCRng4ZzI5RnlvN3o0?=
 =?utf-8?B?K1g4czRDcUQvazBsZXpXak53RlkxUUJRdFJYL2kxZ1RhcTE1K1luY2J2ZVA5?=
 =?utf-8?B?R2ZKMWZoUk5FaVZsUmlKMG8vUFR3ZE1SMFNZcEVOMUxCbElzNHJ3eFhaZVNu?=
 =?utf-8?B?QzZvU0pScXU4UFBvczc2RWpOSlI0cDNFZGdheU9QTzNkbXBHWVY0b1Rjb0l3?=
 =?utf-8?B?ZTd2ajQxNkJDd1JIZ083ZFkrRUJWR292NkgzRU1XWjRmVU1ydEZQOUZoeTRh?=
 =?utf-8?B?MDQ0Uko3UE1WZzAxaEZjQlh6OWRGN2FvK3V0VFBEOENGYVVhN3pVbDJFRUR2?=
 =?utf-8?B?dW5ySzA4OElxaHMyVEloa2tYZXNuY2NyWVA1WnhabkZXQkRDUjBSRzZBcFBa?=
 =?utf-8?B?MUNhVzVZUjd6V0hEQzhPV1J3cUZyaDNqTlUzZWFxY3JxRXZ4WXR6ZWZiSmJv?=
 =?utf-8?B?WlRVMmh4UWNVQjE2MUZtYmhZa08zV0ZGVmVuM1V1MHVlVU1Cd2ZSbW5lTDdH?=
 =?utf-8?B?VXVXZHJIeHArWVFNdVF1MG1pVXRiRnNWVko2UUQ3OWVLL1F1aVY5VzNNNmpw?=
 =?utf-8?B?cGpGbjdJMmozWFNLeVB3MTRaMmtET3M1Q0FQT1hLa1FXMldHSThLZVowanI1?=
 =?utf-8?B?OGxpbXVLZG1jOTg3aXh2ck1zSStxdG1vUFZla1UrUlByd2h0Q21SNkd5c1pX?=
 =?utf-8?B?WStFaVhnNkRxeUJRaGFmb1BHZG50eTlaSnNzVUs0QzNPRHRjUTRKK1MvT1Rm?=
 =?utf-8?B?dFBuYitFWEZwOEdVV0piUG9DUUh6MGhhU3A1cHRMSUR4Rkhhd3ZSQ3dHTkVk?=
 =?utf-8?B?aEI1anI4UmVHR3daMkl3WXl6S2gwQkdkTTgwT2MwMWpGODd4M1NXUGErb1lh?=
 =?utf-8?B?cFB6UVpiWTJHZzFuRmw4VDdCUTBRRkI4VzdOTEpub05CYW12eGphdnAwOCtz?=
 =?utf-8?B?T21iTUdIMzVCY2VYKzlod1RoOXVJOHl0SytsbGhFUUx5UldITDdPOUJ3bVVl?=
 =?utf-8?B?WitCMEk5S0xDdEM5dDBlLzEyNlB1dmNPTDJLcGkwMUo4L1ZjUFNmR21tK3pZ?=
 =?utf-8?B?TE1uVCtBaGhVTFliWnlqOE5mTnh3UXVSS2k1VnZ2bzBDdm42emdXTXhWT29p?=
 =?utf-8?B?SXRabVpLZHF1NzJrU2p1RkZYMnlKVVBjSlQ3VDhGSkdpWDdKajdIemtlYnc4?=
 =?utf-8?B?eGU0SVpKRTRJQ0ZRMEt6am11bnlqNkpXVWF6YUhYUVZGdWZQSnhaUHltK3dq?=
 =?utf-8?B?VTR2aXJmODNqaERZUjBDQ0VCOFE3aWtoOVhwNkc2TVVhOGRjclo5ckxkQk1T?=
 =?utf-8?B?Q0FjSUtsM1lxaityVmx3ZzZBMFVYYzhUL1N6dDRBMUdnWWwzSHlhMUdPWkxO?=
 =?utf-8?B?akZaL1IxblByNjV4TW1OeEdrbk5HN1NLSlpqTWJhMG1NdXowV01nakpNLzhk?=
 =?utf-8?B?VmVjaVRFSHljMHUwbU1zZVptcG1oTUdXSGl3SzZwcXQvVDFHNzAxZDhIRnVT?=
 =?utf-8?Q?V/+rCG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkF5MURxNDJCZ2JQdG5aTjNxUW1sUkowUUtpbVB3YmtOTTNjNTk1d1dGK2Zl?=
 =?utf-8?B?a2RibVNkLzR3VW5rU1BzNXN6V0xlbWZlcnAzdDNiWVl6eXlZMEo4NzJUWlRI?=
 =?utf-8?B?QXh5RjVsTjJSYnFzT2lLN2QxUWN6a3pPcHB5bnBnc3A4QTlBQmNSb3p5Rmp0?=
 =?utf-8?B?VXdYa0o3VU5jN1BEVjVKTXVWU2ppd3RIZ3lkWmc0d2ZCR0dIaEhmOGNsdDFx?=
 =?utf-8?B?Ry84ZmVPbHcvczVDTnlhaFZlSDBadkgwTEFLdS95V09RNXpTekJ5Z0RhY3FJ?=
 =?utf-8?B?U1EzNWNFWTFITVBEUjc2RnhlaGQ2NFplNTAxSWdRVkNjNHU2a0Q0OEt5bmYv?=
 =?utf-8?B?NEhNeE1CVXVpWkk3cjdQMU1FL2dKTHh5TG5vMWQ5S1N3MG1MQmZGbWpNUHhU?=
 =?utf-8?B?VkVLandmZi9pclRFRTlwUG9ka3dxcDVWYjk1RWNISWpsZDUrczg5ejIrb3JG?=
 =?utf-8?B?WHNIbFA3ZmlEVmt4ZWIzU2tZaUxKZXMrTy94RFhlYjNKMzNpaURuRWVOSy9G?=
 =?utf-8?B?QXdLczhqTVhtUSsveXcyS05McjNUYVpGTHpUTWdqQU9GU0tCbnNPSzNza2dU?=
 =?utf-8?B?cE9QY1pyV2xsWWhnSW1vVWdhMERLa0hhejJjblhhS3U2L2FSLytrTTdOMGE4?=
 =?utf-8?B?L25SR3o0dkExTEh1aDJraUJCcm83N3JCRU9wS29ISWhFb05uUmxESlIxUmZX?=
 =?utf-8?B?SFA4b1NzcDR2ektPdWhvenZwVGpOOTRkVEMvMEVqWDE3MjJZNDZmOERGbWd2?=
 =?utf-8?B?SWRYTytXNTFUdnpjbEVSMmdtaitzY2JwWUJXdDVCQ3pWL09FenJ3S3dJQjdw?=
 =?utf-8?B?enUvY2NkaGttZnhnbVhYdGVnR1NTazZvdXd2dWNObXlaL2dLc1FjMFFqRCtX?=
 =?utf-8?B?Mm9POTkxM0RQSmhKS3FOUEkxd0lKVW1VaDRqNHFSN1JFU2NEMkY3N1BPdjNV?=
 =?utf-8?B?b053UXp3L3JBN0tuSmtwazg3Ym1saUNKN3BGU2xhTTZ5MDFIVG05UWdBM0JO?=
 =?utf-8?B?aUJoWVV5Q1lMRHBlTEZCM1hGOWdBVVc5U3pPUEM2M1llZ1ZVdzZCYjBRUTlG?=
 =?utf-8?B?QU8zanRIbno4S3EranBpV1ZORm1RVC83OWhyU1YyVXVTbk5lcXFDNk51Mjhm?=
 =?utf-8?B?ZjdFaDZKQngvZWFnUUszTHlqVFdkN0pXalFZWmNuMzErSlFXMGQ2ZU9PdU5i?=
 =?utf-8?B?TmhKNDNRTTVkUGRXN25ZNDBIY0xHT2xUbjR5eE5KeHZoQTRsOGhOdmN1U2xR?=
 =?utf-8?B?SitTZ3NOZEpjSy9jNnp1Mis5bDJWQThoYWFFVnQ5aE9VbWhMK1pRZVBTb3oz?=
 =?utf-8?B?OWtNM1BzL0VsYWt5OHRoSlg5TTdxZjQ0YlBGWEZ3Rk81Um5TMi9pSE5RUytQ?=
 =?utf-8?B?R0tlS3ByY3crY2NNc1pGeThzMWpsaTdKQUd6Y3VCcFN5Z2tQSG91NUNrejdR?=
 =?utf-8?B?dWlNQnIwUDhCR2pnM21WWEpxN1BwZVMrYXZmeFk3YUY0ek1IYzVoa01qRytJ?=
 =?utf-8?B?eUpnTWpQb3NsMS9GMWs2V3gyZUtrNk9YdVRiRnQxbVk5aFI3NnBsY2Q2WkRw?=
 =?utf-8?B?S3ZxcHIrR2lscnFkUngvYVppSjR5Z2s4VVN3clFSRVIvOVY2Wm1LN0d5aTcv?=
 =?utf-8?B?NnBFUlU5MVdLQndrdUU1eWtQV0hQQWlKZVZOUjFYdWo2ZlVGcEs2RUVSZzdq?=
 =?utf-8?B?cC85Qll2OHVFZnJwTTVqSVpCaVVTbU5DazYwM25ML0V4TzB4N1hPNFBvYTc5?=
 =?utf-8?B?YkI5dTF4T3JlMEwyUklRSEVGbkRic1Q3c1ZuRjZxVE03enNGYXZjSzZXWE5l?=
 =?utf-8?B?ZGZXd0FOYWxNcWw4ZXFvN0o1d0sxY3ByRGlyS1A0cTJDODRETlB2d09QYnds?=
 =?utf-8?B?cU0vcXBlQnN6ZUx6MUJTazJpNHB4UHdPSVhCRXEvTnJXSzBidE5ZT21zQUxB?=
 =?utf-8?B?WDJ4czgvT3F1eDlwOGZRdlpTbFg4NHROVU1PejB0QmptMDMzZHZ6dGxMTUkr?=
 =?utf-8?B?eE02LyttUUhNVlZYTXdFOUYvZTc5WmpjM0M4Nm05aWZLOE81dmI2c2p2WUZx?=
 =?utf-8?B?UEhYakw1NmRZOTVOV3RndGF4TjY4T1B6U2RUb001N1NuQkxoakg1MDVSbWNI?=
 =?utf-8?Q?wkzap+4dXMVP0rCOYpIkwFK6h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fdb77d-d4d3-4503-8a95-08de0ff28ec9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:05:58.8641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWTBO1TfJrFV6pqIs3brSV3PRv8a2AM74R44wZdUMsuNGKytkJXmLrNYUVVJnsigTq7ReBWwZho8TrkCjc7ZDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10320

On Mon, Oct 20, 2025 at 06:13:37AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> Hello Frank,
>
> Thank you for review comments.
>
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: Thursday, October 16, 2025 1:45 PM
> > To: ishikawa yuji(石川 悠司 □ＡＩＤＣ○ＥＡ開)
> > <yuji2.ishikawa@toshiba.co.jp>
> > Cc: iwamatsu nobuhiro(岩松 信洋 □ＤＩＴＣ○ＣＰＴ)
> > <nobuhiro.iwamatsu.x90@mail.toshiba>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Philipp Zabel
> > <p.zabel@pengutronix.de>; linux-media@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
> > CSI-2 Receiver driver
> >
> > On Thu, Oct 16, 2025 at 11:24:41AM +0900, Yuji Ishikawa wrote:
> > > Add support to MIPI CSI-2 Receiver on Toshiba Visconti ARM SoCs.
> > > This driver is used with Visconti Video Input Interface driver.
> > >
> > > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > > ---
> > > Changelog v12:
> > > - Separate CSI2RX driver and made it independent driver
> > > - viif_csi2rx subdevice driver (in v11 patch) was removed.
> > > - dictionary order at Kconfig and Makefile
> > >
> > > Changelog v13:
> > > - wrap one line at 80 characters
> > > - change banner comment style
> > > - update comment style; spacing at the start and end, capitalize first
> > > letter
> > > - add support for clock and reset framework
> > > - add debugfs to pass debug and status information
> > > - add entries to MAINTAINERS file
> > > - Kconfig: add a blank line just after License Identifier.
> > > - update references to header files
> > > - remove redundant inline qualifier
> > > - shorten function/variable names: visconti_csi2rx -> viscsi2
> > > - simplify dphy_write and dphy read operations
> > > - remove osc_freq_target from struct csi2rx_dphy_hs_info, which is always
> > the same value.
> > > - add comment about MASK register's behavior (reversed polarity)
> > > - use v4l2_get_link_freq() instead of get_pixelclock()
> > > - set driver name according to module name: visconti_csi2rx_dev ->
> > > visconti-csi2rx
> > > - check error before setting priv->irq in probe()
> > > - check error at fmt_for_mbus_code()
> > > - add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
> > > - improve viscsi2_parse_dt() by assuming bus_type is CSI2_DPHY
> > > - use dev_err_ratelimited() for irq handler
> > > - bugfix on fmt_for_mbus_code(): in case unsupported mbus_code is
> > > given
> > > - add goto based error handling sequence to viscsi2_parse_dt()
> > > - specify default value of colorspace, ycbcr_enc, quantization and
> > > xfer_func of sink/src_fmt
> > > - specify sensor at enable_streams() using previously set ID, instead
> > > of checking remote pad every time
> > > - remove U suffix on numeric value
> > > - use unsigned int variable for loop index
> > > - remove redundant casting
> > > - use GENMASK instead of literal
> > > - remove unused constants
> > > - remove unused visconti_csi2rx_video_ops
> > > ---
> > >  MAINTAINERS                                        |   1 +
> > >  drivers/media/platform/Kconfig                     |   1 +
> > >  drivers/media/platform/Makefile                    |   1 +
> > >  drivers/media/platform/toshiba/Kconfig             |   6 +
> > >  drivers/media/platform/toshiba/Makefile            |   3 +
> > >  drivers/media/platform/toshiba/visconti/Kconfig    |  17 +
> > >  drivers/media/platform/toshiba/visconti/Makefile   |   8 +
> > >  .../media/platform/toshiba/visconti/csi2rx_drv.c   | 954
> > +++++++++++++++++++++
> > >  8 files changed, 991 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > > c17c7ddba5af..ce973791b367 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -25986,6 +25986,7 @@ L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:
> > 	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.ya
> > ml
> > >  F:
> > 	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yam
> > l
> > > +F:	drivers/media/platform/toshiba/visconti/
> > >
> > >  TOSHIBA WMI HOTKEYS DRIVER
> > >  M:	Azael Avalos <coproscefalo@gmail.com>
> > > diff --git a/drivers/media/platform/Kconfig
> > > b/drivers/media/platform/Kconfig index 9287faafdce5..d5265aa16c88
> > > 100644
> > > --- a/drivers/media/platform/Kconfig
> > > +++ b/drivers/media/platform/Kconfig
> > > @@ -87,6 +87,7 @@ source "drivers/media/platform/st/Kconfig"
> > >  source "drivers/media/platform/sunxi/Kconfig"
> > >  source "drivers/media/platform/synopsys/Kconfig"
> > >  source "drivers/media/platform/ti/Kconfig"
> > > +source "drivers/media/platform/toshiba/Kconfig"
> > >  source "drivers/media/platform/verisilicon/Kconfig"
> > >  source "drivers/media/platform/via/Kconfig"
> > >  source "drivers/media/platform/xilinx/Kconfig"
> > > diff --git a/drivers/media/platform/Makefile
> > > b/drivers/media/platform/Makefile index 6fd7db0541c7..09e67ecb9559
> > > 100644
> > > --- a/drivers/media/platform/Makefile
> > > +++ b/drivers/media/platform/Makefile
> > > @@ -30,6 +30,7 @@ obj-y += st/
> > >  obj-y += sunxi/
> > >  obj-y += synopsys/
> > >  obj-y += ti/
> > > +obj-y += toshiba/
> > >  obj-y += verisilicon/
> > >  obj-y += via/
> > >  obj-y += xilinx/
> > > diff --git a/drivers/media/platform/toshiba/Kconfig
> > > b/drivers/media/platform/toshiba/Kconfig
> > > new file mode 100644
> > > index 000000000000..f02983f4fc97
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/Kconfig
> > > @@ -0,0 +1,6 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +comment "Toshiba media platform drivers"
> > > +
> > > +source "drivers/media/platform/toshiba/visconti/Kconfig"
> > > +
> > > diff --git a/drivers/media/platform/toshiba/Makefile
> > > b/drivers/media/platform/toshiba/Makefile
> > > new file mode 100644
> > > index 000000000000..dd89a9a35704
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/Makefile
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +obj-y += visconti/
> > > diff --git a/drivers/media/platform/toshiba/visconti/Kconfig
> > > b/drivers/media/platform/toshiba/visconti/Kconfig
> > > new file mode 100644
> > > index 000000000000..aa0b63f9f008
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/Kconfig
> > > @@ -0,0 +1,17 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config VIDEO_VISCONTI_CSI2RX
> > > +	tristate "Visconti MIPI CSI-2 Receiver driver"
> > > +	depends on V4L_PLATFORM_DRIVERS
> > > +	depends on VIDEO_DEV && OF
> > > +	depends on ARCH_VISCONTI || COMPILE_TEST
> > > +	select MEDIA_CONTROLLER
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	select V4L2_FWNODE
> > > +	help
> > > +	  Support for Toshiba Visconti MIPI CSI-2 receiver,
> > > +	  which is used with Visconti Camera Interface driver.
> > > +
> > > +	  This driver yields 1 subdevice node for a hardware instance.
> > > +	  To compile this driver as a module, choose M here: the
> > > +	  module will be called visconti-csi2rx.
> > > diff --git a/drivers/media/platform/toshiba/visconti/Makefile
> > > b/drivers/media/platform/toshiba/visconti/Makefile
> > > new file mode 100644
> > > index 000000000000..62a029376134
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/Makefile
> > > @@ -0,0 +1,8 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Makefile for the Visconti video input device driver #
> > > +
> > > +visconti-csi2rx-objs = csi2rx_drv.o
> > > +
> > > +obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) += visconti-csi2rx.o
> > > diff --git a/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > > b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > > new file mode 100644
> > > index 000000000000..53d112432a86
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > > @@ -0,0 +1,954 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > > +/*
> > > + * Toshiba Visconti Video Capture Support
> > > + *
> > > + * (C) Copyright 2025 TOSHIBA CORPORATION
> > > + * (C) Copyright 2025 Toshiba Electronic Devices & Storage
> > > +Corporation  */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/debugfs.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/seq_file.h>
> > > +
> > > +#include <media/mipi-csi2.h>
> > > +#include <media/v4l2-common.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +/* CSI2HOST register space */
> > > +#define REG_CSI2RX_NLANES	 0x4
> > > +#define REG_CSI2RX_RESETN	 0x8
> > > +#define REG_CSI2RX_INT_ST_MAIN	 0xc
> > > +#define REG_CSI2RX_DATA_IDS_1	 0x10
> > > +#define REG_CSI2RX_DATA_IDS_2	 0x14
> > > +#define REG_CSI2RX_PHY_SHUTDOWNZ 0x40
> > > +#define REG_CSI2RX_PHY_RSTZ	 0x44
> > > +
> > > +/* Access to dphy external registers */ #define
> > > +REG_CSI2RX_PHY_TESTCTRL0 0x50
> > > +#define BIT_TESTCTRL0_CLK_0	 0
> > > +#define BIT_TESTCTRL0_CLK_1	 BIT(1)
> > > +
> > > +#define REG_CSI2RX_PHY_TESTCTRL1 0x54
> > > +#define BIT_TESTCTRL1_ADDR	 BIT(16)
> > > +#define MASK_TESTCTRL1_DOUT	 GENMASK(15, 8)
> > > +
> > > +#define REG_CSI2RX_INT_ST_PHY_FATAL  0xe0 #define
> > > +REG_CSI2RX_INT_MSK_PHY_FATAL 0xe4
> > > +#define MASK_PHY_FATAL_ALL	     0x0000000f
> > > +
> > > +#define REG_CSI2RX_INT_ST_PKT_FATAL  0xf0 #define
> > > +REG_CSI2RX_INT_MSK_PKT_FATAL 0xf4
> > > +#define MASK_PKT_FATAL_ALL	     0x0001000f
> > > +
> > > +#define REG_CSI2RX_INT_ST_FRAME_FATAL  0x100 #define
> > > +REG_CSI2RX_INT_MSK_FRAME_FATAL 0x104
> > > +#define MASK_FRAME_FATAL_ALL	       0x000f0f0f
> > > +
> > > +#define REG_CSI2RX_INT_ST_PHY  0x110
> > > +#define REG_CSI2RX_INT_MSK_PHY 0x114
> > > +#define MASK_PHY_ERROR_ALL     0x000f000f
> > > +
> > > +#define REG_CSI2RX_INT_ST_PKT  0x120
> > > +#define REG_CSI2RX_INT_MSK_PKT 0x124
> > > +#define MASK_PKT_ERROR_ALL     0x000f000f
> > > +
> > > +#define REG_CSI2RX_INT_ST_LINE	0x130
> > > +#define REG_CSI2RX_INT_MSK_LINE 0x134
> > > +#define MASK_LINE_ERROR_ALL	0x00ff00ff
> >
> >
> > Look like it is dwc CSI2RX controller. Can we work out a common dwc CSI2RX
> > driver to avoid every duplicate the same code
> >
> > A attempt at
> > https://lore.kernel.org/imx/20250821-95_cam-v3-20-c9286fbb34b9@nxp.com
> > /
> >
> > The above is the base on stage's imx6. we try to find a path to workout a
> > common dwc csi2rx.
> >
> > Frank
> >
>
> Yes, it is DWC CSI2RX controller.
> It's an interesting idea to have a common dwc driver.
> Let me check if CSI2RX and PHY drivers work well with Visconti's hardware.
> Please let me know the base repository to apply patches.

It's base next-20250821.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250821

Frank
>
> Regards,
> Yuji Ishikawa
>

