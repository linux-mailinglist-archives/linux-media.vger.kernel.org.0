Return-Path: <linux-media+bounces-37238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C88DAFF6B2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474314E4F10
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 02:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577A427F01D;
	Thu, 10 Jul 2025 02:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="q6jGa96A"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030C25B2FF;
	Thu, 10 Jul 2025 02:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752113976; cv=fail; b=DL36Kb4f2sazjAqwQKypAK4Qk52PAcs50ovxi4IGt80sTXgUmPelUE4m2BGRFdjPEr0xEt2bp4aocQCg8S4vGN+XfhP+iMdyN9rywsT44R4hUvJe3md6DWLKLIlxnYRTjkuq06mP2Rjpvzg0fENCoUo595afapVCZ+maoEi2PbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752113976; c=relaxed/simple;
	bh=q2AxEWeui03kFzOD5eNInLc2J0g3ccdf/jhdOolASOw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qxr5fLOzbHhu6xWgeZVWjy/vugNx4XSxV91qB7WsUt2voqjx482c1HGJFLw8YHDpAnE/LqHVirDkBcAQYgxDA7jYryOes8f8sSQQ8NOkYBkoe0UQFwOOa+oQzpSJP4dTLehvRL/2wpuzY7PBM1EugDVoKPeb7WMfq5oHBg/aRf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=q6jGa96A; arc=fail smtp.client-ip=40.107.75.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFHuA+s4aDx8ve2nTgGIi/3Hx2d8am+np2qN7xavhIRckAAdLOYY8ujx2MehcgUmVc03A/+54RItKseWneEWIIw80/dXMuPKvBBm9B86mTSnauefMltTiekkWtm5b1quWzC+/PGex5H0bFLpayAoE1YSLXXR7CVYBKylJ0WNTE5N/aN2F9hdQExHLRhU6+TibvP+x9zVX/cObQH1ZTRPEPDyz2MNXWuYj5iTxdE0jYXgXCGZ8m3B+Cjxqst2kkDaIzh9zbejUP58lk1A1BBVUTolajD4ur247ox9dDagv4jilg16Os4+tfqlbMjJW+fmKNBpG9MvfsfdmDXc0QOLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEiHwzqEq1wz9NoKJTpfwGZvy1LaZkI9en9P2ikHOUQ=;
 b=Q2/vlhVSU2QrbSEG9cLciS1i4oP6GKCjEZyothFCO2fk8Rio2V0KRRFgZ5dPA38kH9232xpbgzaWsQVP5Y5Zasphu/5edt57VaWLwKjdzzMcezqLERahxA11g5VASqytgPJEpPzstESJvPrFb9we1XNwaOaOy4SgHu4u3KFRxtvcci03SKSS6COsb/zNn+BFnzR92ZNR38XEzx0g+jSafKi/qHuxYXAtXgRrAvXhKEeDJ6ykUnlTx6WRra13ztoREr1EAyVn2muNG0dlX33FM+5J/4BIoWc6UyUFCdrTW31FkE4S4tvgD09WdTaPb0WxthtenAYWVBePw0XJBHbnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEiHwzqEq1wz9NoKJTpfwGZvy1LaZkI9en9P2ikHOUQ=;
 b=q6jGa96ARjhiBwIBwwhWEUw4MTfwKqwupgh95Akpa4OgxJed9O74qiKTKhJhhVkB//pXQAS1HNLcdlef8fbEQTWNuHRrIrQDdlZPp0A5ttxAf1wGoNAWjvd5BkCqBO4oQAHR1Pi/V6s17NHjgUEx0rBG+1fQVehNZbOzaBK2CPEybbhRtvLjrb+4TBT6TNjSPhnlMTkCLwjowIXbB61ttNjL7JDjVnobPoxaSC+MN74F+FgAPrlJ8MjVRPeqgZJBK9gNdOo8Zlyns9XMkTFBaycyHgCS23weIHz9SX7APV0yOVCdGW8q2lajt6qXA3sqfOT7BLhB8Qdv6HHU/zLxtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by OSQPR03MB8770.apcprd03.prod.outlook.com (2603:1096:604:276::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 02:19:31 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 02:19:31 +0000
Message-ID: <fd518fa2-be83-4b51-a5a7-d3e7d0aac08d@amlogic.com>
Date: Thu, 10 Jul 2025 10:19:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: Introduce V4L2 extensible parameters
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|OSQPR03MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dc6db8-f12a-40d5-9906-08ddbf583400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3h2NjFrdGRnOHBudWpGRDljSjgwNVJDN3B3c2dQdEJOQ2J5OXVzZWhqdVBk?=
 =?utf-8?B?QWtxSFE4bGVDdUJJUDdvNHFGVWkwWGpFaXVKdHMwTFhEMmY2UmlBK01RMGxy?=
 =?utf-8?B?cEF6VG82R2NlQWRORDJFQmZLT2tYdTFzcXhLSmlXVm1xVnN1Q0lJYWQ4a3R6?=
 =?utf-8?B?Z0dHNkRxS2piRFpsUk5nR2swK0JmR0ZGR0dPczBIWW5QS2NPSTRHamFQUmlO?=
 =?utf-8?B?WXpQMzB6S0VZbU5tRTJCMXJ3VkhLVVZiRnhkT2N4NTBmRmVDdEkveWhQZjJs?=
 =?utf-8?B?WlhJbTYreXJMRkZzNG9qeURFMmJOenNMNzhDTFJ2Q0NnZ3JGVmQ2ZnpDcUV3?=
 =?utf-8?B?ZE9TQUhHTHpXOHZkWlRRUjIwYVdsV0RuVC9xUkdWcGUwc25BeWJRWjc4Nmcx?=
 =?utf-8?B?RGk5Tkg1M1BXdlB1UVNESTlGYUp5dE5FSTNhTzVhdTV0ekpqQnRsZVhkRlVt?=
 =?utf-8?B?a3RCcGtkN2pCSHdiemp4RVVZWTRKa0lmSXVxb2JMdWJVK0t5SGUvR0w2dkFk?=
 =?utf-8?B?VW5HVjlkR0JpY0JYU3IrMTYxenQ5eFNrVXhmaWVhMlJWMHR1UDRJODVCb1I5?=
 =?utf-8?B?QmV5eXBGRm8rKzQxWCthczRRTmdLSmFRNXUvYWh5Mk1GMGJ2aEJjVkZBMjBv?=
 =?utf-8?B?c2tUVXIydFVqektRcmxIL0grdkNZcU5jQzhMSjNkajZ3K093WEp3VnZCaHFo?=
 =?utf-8?B?Q0V5QXUrWXkyQzJOVmMrRUR6RjQvNXNiRG1VQ2hLamhwMG53V09rZzdsamxW?=
 =?utf-8?B?NzQ3OCsyalRlUWtXclVyNnFFVEFrZU1WcWhwS1ZCQXNtUkhEK3RmRk9BR3ho?=
 =?utf-8?B?SDFZNnhYTTA0RDFveUhyZmRKbnh4ZVUvOE5sbFg1RWNCYVdibm50YlNMMk1S?=
 =?utf-8?B?M0V2SmxwVm9TR0RlTTNrdXdUSGJwTFhSOEp3N3BGclJ1bXN3MnBwOWNhNHgw?=
 =?utf-8?B?dnJQekxUZXVVb1Nac3dSVmFUR3dRRS9EdE9ma1V5aStKUHA3NjZYd2pCak56?=
 =?utf-8?B?eDV0T2I0Y0hqRkkxeWhjUEVJNkdYaFBVdm1NSHQxYnZnNlVkVGJWcGVYeDN6?=
 =?utf-8?B?NG9RZVJDVVpGcjF4d2x2Q2JsK0U2M1c1cEljWU04a0Y0YlBjN2VGRElpN3V5?=
 =?utf-8?B?UndPYS9HczQ2bDNuOGxvczBrRWVpY0xVOEhRZ016OEhGT2dVbmRpaG91R3FG?=
 =?utf-8?B?c2s1Sm5jeUIwMmh6N3J6eTU3MktSTWoybmRDOHU2ZTZZYkY4bVhYa2NpNzUv?=
 =?utf-8?B?eXZ6d0N5RW1QQndRR2pCY0hzOWw2cW5mQjFiQmVFZFJtY3NSd3JmM0tMdEVm?=
 =?utf-8?B?MXYrbUJlcGxBOFJFeVdFdFd6S05MTTBUdEtaTUdmR2pIYzBMSHBWU1VsYTdr?=
 =?utf-8?B?aUhWd1J1cjNya0dQN2VSTTJpT3FVblBFQ1FvNE1vRkNvUWpNaytKVlZoUnMw?=
 =?utf-8?B?RW1CbUR5OXo1RlVOQUZ3eTFuZmtVNnhiN3FsdGU5cnAvRU5jbkVzZS9IR1lP?=
 =?utf-8?B?T2ZwdUppYy9Sbm5IcVFXMHFCYWVqOFV4clRya2ZnSy9ieUs1OS9KVEpjaTla?=
 =?utf-8?B?M2V1OUhzYVg0aHZnVlVRaFNIRlZhVGFKd0pkRUZVZWNBQ1MyZzNBd3YrMXFZ?=
 =?utf-8?B?UUxIZitRcVdzeWY3c2ZxcVpRS3JxTEU4ODkyYmsxM0VWU2dRQUJxQmRPc20w?=
 =?utf-8?B?ZDBQV0EvZlFEYU9xY0R1VjFQUW95a3RHN2xscVFxTGUzZWMzUVFaeWRwWWpJ?=
 =?utf-8?B?WFJCNEE1YlA5dnpFcndwYnM5YjZTWXhCRHRzZGpxUUd4dUtGQ0E4ZWFYWlVU?=
 =?utf-8?Q?G9Nlfm3A0VEHPZGt7sJqj6/lTXCzJaZdsvtN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alZITHQrM2t6eUFLR0Ewa2ltc1pFU2g0aFRyUitaMXF4TnZ3MlBFaHFBL2dE?=
 =?utf-8?B?OC94b1F6b1hTMHhTcjhxZ0sxT0xpZnhqU0dnUkNncFpPcks0d1VLRXlGQ1pi?=
 =?utf-8?B?bzl2N1VwRURSMUsvMGhEOTd4MGVlblNGQ09NNFFVeUwwblp1VER2RlcxWjFq?=
 =?utf-8?B?T0grWmE5TXA1dU52cjJmVzJLZ1lqeXNkdnpmWVU0SkY1MHdkQlFNZk1POVl6?=
 =?utf-8?B?S3pOUVNYd3NIczBoMEFaNzI0VzVFWDdTbGgzcG9kbzlWcG1kWUY4UndLRW41?=
 =?utf-8?B?K28zanZWRk1wNmEycTkvbWxCSWx0TlRIM1djS3psSFd5cE9ob0FHeDJYME9v?=
 =?utf-8?B?bmdheUVCUFJ5VFdVbnlQNDNtY1ZSeng3OUtXOGFNQ1dvTHZYeGk4K2VuNVFB?=
 =?utf-8?B?Q0c1VSt5UjZMU1hsQVpNN05pL0oyMXpDOTExVWNkTTF0Z3l4MXZVclJOUk5Z?=
 =?utf-8?B?dW0rZk0xMytJUXNhVVBwclFWcnJJeWxtUG1vNXdmdHBxUjEzUGdKWXBMT3k0?=
 =?utf-8?B?aTVOWHRVNFQwSGR6UmdwWEF3c0Fwd3VNZ2RpYk1sQUJJelJKbU40MWN6cHBw?=
 =?utf-8?B?THB3cnA1M2diNkVZZkwvL1BLVVRGd0VrMXJVZFJqM2lTMUh6OGRVUjd2TXpu?=
 =?utf-8?B?cjljdDlUK3RYMWVmZXExTGk4ZzJhNWJCZjNxTnh5S0JEeHliRG0zcjZhdkdJ?=
 =?utf-8?B?TVV5WTNRaHFkYWordVhhcXpld25heG8wZDJVV2tnOGYyVyt0RCsxQnlUSmEw?=
 =?utf-8?B?eXVzWlZMaGNqZ3hUcGVrZEsyT2dacXFYYVNGc1dHb1ZXSzVZZE9iYXZFOVE0?=
 =?utf-8?B?Z2dENjMvYVlhSTFDRVg3NGZPbE83blF3Sm9MZG45blk1amZMZHUwQk8vQThC?=
 =?utf-8?B?ZFpZNlBFZHpBT0p6Q0ZaWEVsUGJUYW9VR0lEbXhDZnJ3OFJsK2cxWnpZNis4?=
 =?utf-8?B?WG1rQkp4KzBwcTErL2o4di81WDhQWHB5RGVNazhhL3FUTUVscys1eEdHWWpL?=
 =?utf-8?B?SjJrYjkrbllWUlF1Mk8weE5OSWxEWlV5WmplRE5XT1NZTmdIRmthelkvN29W?=
 =?utf-8?B?T1J6eXlBNjVQN1lhREh4emFzV1d5eE8wL2J1akdKWXluQ0RSNURXRUtwNXI1?=
 =?utf-8?B?VDNSRnBMaTJIM3lrMUJRbk1MdFh5RTBuTUJsOFlXSVgrK1NGNzRteW56aXk5?=
 =?utf-8?B?WVdXajRYNzAvTXVZdituc3YvK2RycWtrdXFOd0dKNHFoLy9QbmVBaDlJblU3?=
 =?utf-8?B?WkhKYnBaR3R5T0o5SHYxL3dkN0U5bDEvNmh0QWhFaXBhMExmYlBxSWNKQkNm?=
 =?utf-8?B?b2U2Zlo4eUoyNDZCb3IyMVBQbGNoZ3pLY0JoZGlMY0NJTnNqWklIcmh5VnBY?=
 =?utf-8?B?SkZ2cjNuRlVkRUM4ZEZKN1Y4aUJ0MXkxY29nRkZWV01qNXJKMHd3M0ZYbTFT?=
 =?utf-8?B?bEJ2UnBqeWR5SExUN0w5YUpzRldRb2F6bG5aY1o2NHIyRmd0bm9OeWNvSWFV?=
 =?utf-8?B?M2I5UTlZTU1KdzNEbGpDcUY2QzNIdHB1ZzBmL3pxN2RENEUrWkwvUjczcVhH?=
 =?utf-8?B?UFVkTThWSGorTGZ4MjhCOUxOS1g0VFVUVUNRVFJ3UUJaS0h6UnJ3U1AzdGdr?=
 =?utf-8?B?OGxoUmtqVXJnZjNwVU9HRS9VdnpwQ0haNi9KeXF4YWovdWhhc1F3TnR2NWV6?=
 =?utf-8?B?cG1VTmxKOVZPVjVUWGVDcFJFSVZSSDliQXhYYUxRaklEMEhqeHdkV214MVFR?=
 =?utf-8?B?TEErWTQ3UDVCb2h2d2Yrc3RFNDNLRUxmallhcUJPMHBCUEpVVHAxSDU3QmNl?=
 =?utf-8?B?YTZBQkplUjlzdHRQLyt1SkRudFVyRmkyZUdWVGdIS01UelZINkxpS2YyOEFC?=
 =?utf-8?B?ZFJFKzc3SHZrSmtFWlRMMEw2eGc5OTI4MzNVZjhZTUNmVEE2WXI0MUhCUlVn?=
 =?utf-8?B?L0tITVJsWjZOTmo0ZnM3bTVwK2x0dkJvb0VWQ3JJVE1uMG9kWkVtR0wydHNJ?=
 =?utf-8?B?enIwL09ZdUl2c290REdwOTYrOFFabnZST2VHSG1yU0JnUnVaWkJ3c0tnamdX?=
 =?utf-8?B?am9Jd0Z0WFNhUmg1YW55U2pWbkxvb0lVMzZCWTZQWm1mU05pcTJ3WUhIQ3hW?=
 =?utf-8?Q?NGbz7VehS5w4IZ3H3PWrEr17W?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dc6db8-f12a-40d5-9906-08ddbf583400
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 02:19:31.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02rDgCp1nZtPdaYnLM5MwRrE5FNGS6Zo7j1gYGqu978zDPIME5rTpHTMTi/FEe/9Q+x5jKFimLMC9ChrpQISNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8770

Hi Jacopo

On 2025/7/8 18:40, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Extensible parameters meta formats have been introduced in the Linux
> kernel v6.12 initially to support different revision of the RkISP1 ISP
> implemented in different SoC. In order to avoid breaking userspace
> everytime an ISP configuration block is added or modified in the uAPI
> these new formats, which are versionated and extensible by their
> definition have been introduced.
>
> See for reference:
> e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
>
> The Amlogic C3 ISP driver followed shortly, introducing an extensible
> format for the ISP configuration:
>
> 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
>
> with a very similar, if not identical, implementation of the routines to
> validate and handle the ISP configuration in the ISP driver in the
> c3-isp-params.c file.
>
> fb2e135208f3 ("media: platform: Add C3 ISP driver")
>
> With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> a third user of extensible parameters is going to be itroduced in the
> kernel, duplicating again in the driver the procedure for validating and
> handling the ISP configuration blocks
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
>
> To avoid duplicating again the validation routines and common types
> definition, this series introduces v4l2-params.c/.h for the kAPI
> and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
> and Amlogic C3 drivers to use the common types and the helper validation
> routines.
>
> If the here proposed approach is accepted, I propose to rebase the Mali
> C55 driver on top of this series, to use the new common types and
> helpers.
>
> I have been able to test this on RkISP1 but not on C3.
> Keke: would you be able to give this series a try and see what happens ?


I have tested this patch series on C3, the result is OK.

Thanks.

>
> Media CI pipeline:
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1465950
>
> Thanks
>    j
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Jacopo Mondi (8):
>        media: uapi: Introduce V4L2 extensible params
>        media: uapi: Convert RkISP1 to V4L2 extensible params
>        media: uapi: Convert Amlogic C3 to V4L2 extensible params
>        media: Documentation: uapi: Add V4L2 extensible parameters
>        media: v4l2-common: Introduce v4l2-params.c
>        media: rkisp1: Use v4l2-params for validation
>        media: amlogic-c3: Use v4l2-params for validation
>        media: Documentation: kapi: Add v4l2 extensible parameters
>
>   Documentation/driver-api/media/v4l2-core.rst       |   1 +
>   Documentation/driver-api/media/v4l2-params.rst     |   5 +
>   .../media/v4l/extensible-parameters.rst            |  89 +++++
>   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>   MAINTAINERS                                        |  10 +
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++---------
>   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 364 +++++++++------------
>   drivers/media/v4l2-core/Makefile                   |   3 +-
>   drivers/media/v4l2-core/v4l2-params.c              | 106 ++++++
>   include/media/v4l2-params.h                        | 166 ++++++++++
>   include/uapi/linux/media/amlogic/c3-isp-config.h   |  45 +--
>   include/uapi/linux/media/v4l2-extensible-params.h  | 106 ++++++
>   include/uapi/linux/rkisp1-config.h                 |  60 +---
>   13 files changed, 775 insertions(+), 453 deletions(-)
> ---
> base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
> change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>

