Return-Path: <linux-media+bounces-25422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8BA22945
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 08:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654141605A4
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 07:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C161A8F7A;
	Thu, 30 Jan 2025 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="kq8ZEa4S"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2113.outbound.protection.outlook.com [40.107.20.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0AC2FB;
	Thu, 30 Jan 2025 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222954; cv=fail; b=NhH8vel8zcU8voGOKF+9gqSwX9bm/yH2K5KnW/DrlH6XlGLW0kfkmR0Nk94XVtU4wuX9j5jM8tGde0u4fRkGnPW9MCMwe2tcUXnpBp97x90HGq63yOEHE2z2663CyP2LY1DE0zaKGXU1CCVB+dHXRfZ0SYzDK2F2BjVsQgh3k1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222954; c=relaxed/simple;
	bh=TkKhvAp/ZbEmaEY9NU2ZzD5V0P741ixUYs69GhqknCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ij9MEAFVWb17l1KK/pOYBZ0UNfspMI6YhAZAGk5h7YRlGFhgz/Dh38TaWhIEbbmorETEwKPJoku5KOSEjzA09lWn7d6ej31JArS48HnLP5TcENTIzOUsGi6ie1+Hr/0lZJJzFgAwX+P8DrHwJmWI88Al6C6XcHgGpKdtfUvN4uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=kq8ZEa4S; arc=fail smtp.client-ip=40.107.20.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyXXS4QNQgfkngh2XtzmLTxQz9CPTrfeoZv00wckP5FsOK6Y/VnChl3Nq3SIP4UDpmRdde4CYAYXhSUXTClvpMI/3DbGZDMl1Mt8QFE/eohdwJbawJl8rIC2Z+FluQwTXsIqkog8lRdY4x0rgr/S9mfH7siP2r90xWuLpiqvNd4PmZe4QnWnW2wsNurNJJFaZaDdgvqE0LNDxH5su4CiJzc0CklbFydk89JizdYmPG2SkpYgv1xkJBjdj+geB1H42KkQTmCSrGZcL7Fq8bluBy0qkKy4PvdeSYsJ6NSDcLiP9bLfgpqSGem0pzvr9c3gh1B6sW3v17IYRV5uZRzRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=radnj0nTIMPXMtBrxhWcSh9J3D6z3WtCvJ4hori6ZaY=;
 b=nNQApfzK360K0AoPd/CcZjLGxISyRBn10N45bDdd0krqudg/WWR04bUgVZl20R66fw0We4O7e3nWM/Y6cTX7opVpDFuOs0DZtfApGaXzKKRl2xJxCJU1GCJEr8ySnEWpKLmFGKwtRjP9fh2WHFB8wGVxPl8IX4KZe4HmS4wkWrLKp6f7/VRqdERGMIFiYoW1ndWbZttCrEJehlB6IKXH71RT54r9pTRIwNujSumEAbBH71nccttqp4/6LRjj8ezOM2S7uJdgOY2aRdAt0Ml3axdhpYK9MU5f7DZuoukMRUWlCIUjumB12w04oeUUAqn6bYg3iapkYZC5u5RVKYFQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=radnj0nTIMPXMtBrxhWcSh9J3D6z3WtCvJ4hori6ZaY=;
 b=kq8ZEa4SymjzEXS1gflFdZZ0tB99usrqhOCRm9Gzfuec5+7FldU2x5+UmJRpKYACL8npwFOqS24Q4hdKpxZa06nLY2R/X4HezqSP8dyNSVxT8nJjMwRKZbCPFGOd3vU9pf8mJNfdS6AOpgefUiR/PRB03xlY5qdMNOBezZ1DPVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by FRZPR08MB10927.eurprd08.prod.outlook.com (2603:10a6:d10:137::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 07:42:27 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 07:42:27 +0000
Message-ID: <8e83588f-7e4e-4805-a681-473b9233d04f@wolfvision.net>
Date: Thu, 30 Jan 2025 08:42:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: imx415: Make HBLANK controllable and
 in consistent units
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
 <20250129-media-imx415-v3-2-d16d4fa8fc10@raspberrypi.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250129-media-imx415-v3-2-d16d4fa8fc10@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0300.eurprd07.prod.outlook.com
 (2603:10a6:800:130::28) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|FRZPR08MB10927:EE_
X-MS-Office365-Filtering-Correlation-Id: ccca2247-7b4c-488e-8f40-08dd4101a4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmdNR2xibUw1a01zT1lOamhQT25rVnRUeU5NZGhodWhxOTdFazZLdFFHcW93?=
 =?utf-8?B?T0VrczlFV0tGbjNjUnRlbm9GM2hyaytXOEtzWE5QakxmYWxzY0NvQ25MSzlV?=
 =?utf-8?B?V3FpTXNlTGJIZXdONDdkSHAzbWtzZldtUUQ0ZHlZMTV0UGxzKysvYi9XT1gx?=
 =?utf-8?B?cm9NK1JHY245TGVIM1BNcHhIZzlGQXp1b2RPbUlycTl1VEgzOWJtQkxBZWlw?=
 =?utf-8?B?VkRGZUcyUmVxY25BeS9Ib2oxQmlmZzlkTWZXbk00aUxYcnFoRnBnb3BvdEpP?=
 =?utf-8?B?ZEYwbU1YbW8zWTdDQU9RdVAxb3JTbWRhcDZNaTgrc0xzaU01TnZ4T0lDRitG?=
 =?utf-8?B?b042TzVGbWtZTDZwZGYyTytIQXZXRXFpZUYvcjBLNlVqSU9xU21ucVVzY0dB?=
 =?utf-8?B?ZmorL0hyenUyK2d1ME5ZN3h2dXNmRHNiOHJGdU5qVWdRakpscTIvV01vTUNw?=
 =?utf-8?B?RFpaQkYxcEExcWtFR283S1JLVGhSYWF0a3BBK2ZuZEduY1kwZEFZUzk2dnZa?=
 =?utf-8?B?dzhNR1NwRFVaQjJUb1lPdmZTRzBkRUMrcTVvVkw1VDlkN3dySmpLRVZ2Z25Z?=
 =?utf-8?B?SEpkVmhuUzhMQVNGWnRLeExvN29LVTFORnFKOS9YSWduZEpWeXBhZXNYaVpT?=
 =?utf-8?B?VHRDQnpOSndEdk9WZW1DYjN2QTUzd3VlQU5HUHQ1bFVoaUZMQmE3UEZ2amJK?=
 =?utf-8?B?R0xwUWpTdHE5QWMwUklEUmVGaElmaE9YNEJ1R2dleVFIN2N1Y3p1YWFBUjR2?=
 =?utf-8?B?U0tsbEF5bWpQbU5RRkdmdFE5VmZQdEE3UDVLQlpKVHllY1E3MmEvN200OXJS?=
 =?utf-8?B?UzIrRXRHZUZ2NUFOeTJtSktlekNzT04rcUJ0VjlDYzhIYUhjQTQ0OVFhZ05X?=
 =?utf-8?B?Y2N6TENyVVpmbUdaN0RDcytvMDNhOWROQXY2a3JaNnIwZzNmUTUwU1VRcjAy?=
 =?utf-8?B?MG5CdWNRS3hYM0hDM3kwajdHYk1DT0cramxCQ1VJYWo0c2xtcm1PamgyL0JU?=
 =?utf-8?B?b3gwKzlONTNQUVJoL3kxOUMwWU93aFFhZnhLSW93ZGt1dWxSNVVmek8rVEp2?=
 =?utf-8?B?UlkwZWtqRDRqMStBdjNaWm5ub3ZjL0ZYN08zRFpnRUJrTlhrd3BtQ1A5RTNr?=
 =?utf-8?B?SnE2Zm1ydCtSTW01WWk4N1R2ZjdSOXRFc0luR2dSSnVIa0RtRHFhL01sSEZ2?=
 =?utf-8?B?S243MDdCd1dxaFY5cE9tSGE4WkFjWmpRYmMrNm5xWTV2a0s5NE5sOU1Gb0Z1?=
 =?utf-8?B?WHRIYUwrQWhYbkUrcEVqU28yaUYrK293djhxa2JmYURMQ0ZTVEVoaFBNMmsx?=
 =?utf-8?B?OUl2cWlEZXBRYmJRdjYwUGRpeHBXZnJ2Q1pwMU1jOE9JVzBOdFdPcnkvNUdO?=
 =?utf-8?B?TlhXZFE3YTB6TFF2WER4blBacU82VUFWM3JXYlllMHJZSlFuSFZmeXBjTm9H?=
 =?utf-8?B?RlM2V0JITGc1eFRLcUtzS0QwQ3ZkRHMzYVVjc2RHbTRoL254ak81Z3BvRHJ6?=
 =?utf-8?B?b3BONmptYXJxNnV1TktQQVhDYWY0a053dzNCT2NGK3A5a29FMWdPZmtvVDho?=
 =?utf-8?B?Z3VzcXI2akVPaE44RWI0WHl4VGVCMFd1N0pTWWVHZzlTQXgzbDh6YTd6RWkr?=
 =?utf-8?B?a21haGw1dXJyZnRDdFcrRzBmaXhoeDlweHNvVDk1cXJkSENlVnBUTkhoa2t2?=
 =?utf-8?B?YmlnUFNHdHB0YmJ6WmNkTjRMMWpkdVJ6ZzhXUnBWMzhxU3NpbG5pdENkQlNl?=
 =?utf-8?B?KzZEaGkrd1pNYUFSKzdMSWRSdVlab2J0U2NoSGswV1U1TEpqS1ZsMC9FQVov?=
 =?utf-8?B?aVlmSXVuV0NaeUJheTgrcU1sN3JLSDdwR2xNN3l6aks4VzQ1M3NYaW94SlM0?=
 =?utf-8?Q?FPGC8rmkvNoNq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9RRGZoTUNPRTBnYmM1eEE2L0hqRE5SMmZEZXp3S1FhQTFEeFVVV3ZycElB?=
 =?utf-8?B?VHkwL1JyZGZacUZXblQrS1dYZ1VkQkFLRjlwTUhpZVlCdWZHa1dqT1g5VGhH?=
 =?utf-8?B?ck0wSDU3STBLYndzU0l2YlZoaUpHQnVUTUF1d3NYUHkzamUvUkNyQlIwNmRC?=
 =?utf-8?B?Z1FGbXZoMkQwclpRaHRWZU92cFhISG5TOWxYRGxZZy8vdzg4WFpWSUxPeFBR?=
 =?utf-8?B?cXowblBVdHdCTkgzMkR3NkkyV3NUWHdmeGJvYUVCZzRTZGZHWU01SUhXSCt4?=
 =?utf-8?B?RXhRN3UzSGRMVDJDN3FPWVd1VTV2UmJlWTNNaEl4b2dPNjFLNjZKSTQ0Uk90?=
 =?utf-8?B?cTFjTHhZK1dKckZmWHZ2aCtDYjhTcGp1QVgvQnROZ1dobHVVcGRRN0N5aEha?=
 =?utf-8?B?b0V3ZlJvUFZPWVJRU3k3MThxN3h1Z0pUQmdZTk5JalkwV0Z4THU2TGlNUCt1?=
 =?utf-8?B?N3UwQ1hJc0pxNE1aNGxPb3lHSnhUUlR5UmZTNXluQWFjS21VaGlac2dMSEN4?=
 =?utf-8?B?QjRqbXlRQ0ZFQlJYRjBrdkpKaWY2R0NoYkcxd1B4RzJuS1M0cjZtUjNEb3p2?=
 =?utf-8?B?SzFnc3huR1NaUWpvQVIwRDNoM1JEbjhHVXBDaTZzei9tMUJzMjVJdFlieVI0?=
 =?utf-8?B?WkF6ZnRaeWpTUExiVmRCWkMxeEE5eTZUSTU3cFVQUEUydnhRcWQ0SUhRcmVD?=
 =?utf-8?B?Skx6emNKQ1hERmdYdjNBRWxDMzB0YkZ0c0oxR3ZYUzgzd0pPZHJ3TTBlS2gw?=
 =?utf-8?B?QUU4c0hjdkFLa3luOGJrR0xIZ2l5UzBOSlV6bUJDSGJJUmRKcE9vRUdZU1Yx?=
 =?utf-8?B?b0xBbENYS1VMZDd6MlcyTnZRVUhLZ2huUDY5UGhyUEJaSndJc0FvZmVac0FG?=
 =?utf-8?B?aUtIYTJPR0RzbDJ6QS84Z2RqYWp5UHI4RFBMajZmbVduZjM2UDg0amlCWjMy?=
 =?utf-8?B?K2lheGxPazJiSTRjaTJ4ek1ySWtmVWVpaUVtR3hkVFpLQ3NnVmt3elVXS2s3?=
 =?utf-8?B?WFZVemk4Q3ZMb24rQW12cXFhTDlSS1o3WUl6M05DSGJNUVhEdHNhQ3ZXdU5v?=
 =?utf-8?B?dUY5Y1FFVWhHa01rTzNEcFhnelYwd216ZVNwQjlNc1k4bW5HYnd5ZVFWT0Nj?=
 =?utf-8?B?M1pjSHY2STFTMjV5bDNLRzUxSm82S1E2UTYzdlUwMTc1ZTU2dzZlbWQ2VDh1?=
 =?utf-8?B?N0d2b1dNWlBuRERQNTNLZWhtK0NxZ1JULzA3Q2FkWGZsZlJ3OTJDYWJDb2cy?=
 =?utf-8?B?aDFDZEZIdExQMWpuZ0YxZjJMcElDQkRyZDJDRkJ2NjNCUWtMc09UQTFEdCtq?=
 =?utf-8?B?MitJcXk0L1BCNDFXZ0RtZ25NWXQ5SFJRMmdnRUxUd2dUR2lxVkI1UjdoSklz?=
 =?utf-8?B?eVhMZ011eXlTRUZueDFhUEZ3aGRKK1poUDhtSWg3YWxaUmZ3bW1tS0cvM0s4?=
 =?utf-8?B?TXkrcHljVDgxWUc0ODlEOVZCV28xYmVrMVRuWnJRT2ZwcHRGaTNPK25uT2cw?=
 =?utf-8?B?azF3UnFid2VHb1FnYkthaSs3bTdVeUt2WUJ4WWJTazl1SGdmdWxlcmRvN0pz?=
 =?utf-8?B?d20zOUpqZElFbE1CWDdEY29oZDZKdXVZRjg1MzhIQmwvRld0NjdTZVhkSU5U?=
 =?utf-8?B?NDR2K09Ld3A4cmJ3R1U3WVA3Z3VYb0N4ODA4TU9yem1WQWtwMGZtRVdVZ1JC?=
 =?utf-8?B?V0dMNGNYZzE4ZnFTNWFMY0hyODU4aDY4bE5DODFLY0NCVGhiZXBVK1FqL01k?=
 =?utf-8?B?ZHBGZzBONlZDNi8yU0w3ZXRWZkpXZzRqWHh4VjFzdm1GNHd5VnJmZm95dmFT?=
 =?utf-8?B?SFFIR1JjTkdVSm5mblgxNzVjY2hpY0xkVnl0THMzSnZjaklpR3RUN0QvNVJF?=
 =?utf-8?B?ZkZrOEZCS0g3K1VxZFNKOUtzNzV2UTlFMVUxRlJtRUQ4R0tnOU1zUHNOeXpW?=
 =?utf-8?B?clNwTzRCbGJvZTdsNUVzNXRsY1lxaDRBam1xRWdYalBrTTRXVlhNa2RPUGtl?=
 =?utf-8?B?QkllOThhd29HKy9Tc0tTb25UN2VBZVpZTFVVbFpPV1ArdVoraCtuaVFyMUtO?=
 =?utf-8?B?SnhKU0FKQUM5ZlFoVXE4T1NQRVRheTJZM0orMFdteDRHOWVlY1R5NTc3eG5K?=
 =?utf-8?B?Z3RjR3Q0c1U2TEZrblczVGNGcGE5aEFoRGhGK3F1MVRQWXFpUGthdkg3VXU0?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ccca2247-7b4c-488e-8f40-08dd4101a4dd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 07:42:27.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu7j76t9Li9yNBxVuomlHs2jAaJjSSRwmUcBj4+C53daB2KjPYpLHu3Fnxy8paAqENYn13IPy59wqcuCqJ+XCFVlyRHNGMm9URVN4MwZuKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10927

Hi Dave,

Thanks for the update -- good catch.

On 1/29/25 16:03, Dave Stevenson wrote:
> The control of HMAX documented in the datasheet is consistent
> with being in terms of a scaled INCK, being always 72MHz or
> 74.25MHz. It is NOT link frequency dependent, but the minimum
> value for HMAX is dictated by the link frequency.
> 
> If PIXEL_RATE is defined as being 12 times the 72 or 74.25MHz,
> and all values are scaled down again when writing HMAX, then
> the numbers all work out regardless of INCK or link frequency.
> Retain an hmax_min (set to the same value as the previous fixed
> hmax register value) to set as the default value to avoid changing
> the behaviour for existing users.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and regards,
Michael


> ---
>  drivers/media/i2c/imx415.c | 88 +++++++++++++++++++++-------------------------
>  1 file changed, 40 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index fa7ffb9220e5..86dbcfcd820d 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -28,6 +28,9 @@
>  #define IMX415_PIXEL_ARRAY_VBLANK 58
>  #define IMX415_EXPOSURE_OFFSET	  8
>  
> +#define IMX415_PIXEL_RATE_74_25MHZ	891000000
> +#define IMX415_PIXEL_RATE_72MHZ		864000000
> +
>  #define IMX415_NUM_CLK_PARAM_REGS 11
>  
>  #define IMX415_MODE		  CCI_REG8(0x3000)
> @@ -54,6 +57,8 @@
>  #define IMX415_VMAX		  CCI_REG24_LE(0x3024)
>  #define IMX415_VMAX_MAX		  0xfffff
>  #define IMX415_HMAX		  CCI_REG16_LE(0x3028)
> +#define IMX415_HMAX_MAX		  0xffff
> +#define IMX415_HMAX_MULTIPLIER	  12
>  #define IMX415_SHR0		  CCI_REG24_LE(0x3050)
>  #define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
>  #define IMX415_AGAIN_MIN	  0
> @@ -449,7 +454,6 @@ static const struct imx415_clk_params imx415_clk_params[] = {
>  
>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
> -	{ IMX415_HMAX, 0x07F0 },
>  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>  	{ IMX415_TCLKPOST, 0x006F },
>  	{ IMX415_TCLKPREPARE, 0x002F },
> @@ -464,7 +468,6 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
>  
>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
> -	{ IMX415_HMAX, 0x042A },
>  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>  	{ IMX415_TCLKPOST, 0x009F },
>  	{ IMX415_TCLKPREPARE, 0x0057 },
> @@ -479,7 +482,6 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>  
>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
> -	{ IMX415_HMAX, 0x044C },
>  	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>  	{ IMX415_TCLKPOST, 0x007F },
>  	{ IMX415_TCLKPREPARE, 0x0037 },
> @@ -497,39 +499,10 @@ struct imx415_mode_reg_list {
>  	const struct cci_reg_sequence *regs;
>  };
>  
> -/*
> - * Mode : number of lanes, lane rate and frame rate dependent settings
> - *
> - * pixel_rate and hmax_pix are needed to calculate hblank for the v4l2 ctrl
> - * interface. These values can not be found in the data sheet and should be
> - * treated as virtual values. Use following table when adding new modes.
> - *
> - * lane_rate  lanes    fps     hmax_pix   pixel_rate
> - *
> - *     594      2     10.000     4400       99000000
> - *     891      2     15.000     4400      148500000
> - *     720      2     15.748     4064      144000000
> - *    1782      2     30.000     4400      297000000
> - *    2079      2     30.000     4400      297000000
> - *    1440      2     30.019     4510      304615385
> - *
> - *     594      4     20.000     5500      247500000
> - *     594      4     25.000     4400      247500000
> - *     720      4     25.000     4400      247500000
> - *     720      4     30.019     4510      304615385
> - *     891      4     30.000     4400      297000000
> - *    1440      4     30.019     4510      304615385
> - *    1440      4     60.038     4510      609230769
> - *    1485      4     60.000     4400      594000000
> - *    1782      4     60.000     4400      594000000
> - *    2079      4     60.000     4400      594000000
> - *    2376      4     90.164     4392      891000000
> - */
>  struct imx415_mode {
>  	u64 lane_rate;
>  	u32 lanes;
> -	u32 hmax_pix;
> -	u64 pixel_rate;
> +	u32 hmax_min;
>  	struct imx415_mode_reg_list reg_list;
>  };
>  
> @@ -538,8 +511,7 @@ static const struct imx415_mode supported_modes[] = {
>  	{
>  		.lane_rate = 720000000,
>  		.lanes = 2,
> -		.hmax_pix = 4064,
> -		.pixel_rate = 144000000,
> +		.hmax_min = 2032,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(imx415_mode_2_720),
>  			.regs = imx415_mode_2_720,
> @@ -548,8 +520,7 @@ static const struct imx415_mode supported_modes[] = {
>  	{
>  		.lane_rate = 1440000000,
>  		.lanes = 2,
> -		.hmax_pix = 4510,
> -		.pixel_rate = 304615385,
> +		.hmax_min = 1066,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1440),
>  			.regs = imx415_mode_2_1440,
> @@ -558,8 +529,7 @@ static const struct imx415_mode supported_modes[] = {
>  	{
>  		.lane_rate = 891000000,
>  		.lanes = 4,
> -		.hmax_pix = 4400,
> -		.pixel_rate = 297000000,
> +		.hmax_min = 1100,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(imx415_mode_4_891),
>  			.regs = imx415_mode_4_891,
> @@ -586,6 +556,7 @@ static const char *const imx415_test_pattern_menu[] = {
>  struct imx415 {
>  	struct device *dev;
>  	struct clk *clk;
> +	unsigned long pixel_rate;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(imx415_supply_names)];
>  	struct gpio_desc *reset;
>  	struct regmap *regmap;
> @@ -597,6 +568,7 @@ struct imx415 {
>  
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *hflip;
>  	struct v4l2_ctrl *vflip;
>  	struct v4l2_ctrl *exposure;
> @@ -787,6 +759,13 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = imx415_set_testpattern(sensor, ctrl->val);
>  		break;
>  
> +	case V4L2_CID_HBLANK:
> +		ret = cci_write(sensor->regmap, IMX415_HMAX,
> +				(format->width + ctrl->val) /
> +						IMX415_HMAX_MULTIPLIER,
> +				NULL);
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -805,12 +784,11 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>  {
>  	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl *ctrl;
> -	u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
>  	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
>  	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
>  			   IMX415_PIXEL_ARRAY_VBLANK -
>  			   IMX415_EXPOSURE_OFFSET;
> -	u32 hblank;
> +	u32 hblank_min, hblank_max;
>  	unsigned int i;
>  	int ret;
>  
> @@ -847,12 +825,14 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>  			  IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
>  			  IMX415_AGAIN_MIN);
>  
> -	hblank = supported_modes[sensor->cur_mode].hmax_pix -
> -		 IMX415_PIXEL_ARRAY_WIDTH;
> +	hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
> +		      IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
> +	hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
> +		     IMX415_PIXEL_ARRAY_WIDTH;
>  	ctrl = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
> -				 V4L2_CID_HBLANK, hblank, hblank, 1, hblank);
> -	if (ctrl)
> -		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +				 V4L2_CID_HBLANK, hblank_min,
> +				 hblank_max, IMX415_HMAX_MULTIPLIER,
> +				 hblank_min);
>  
>  	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>  					   V4L2_CID_VBLANK,
> @@ -860,8 +840,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>  					   IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
>  					   1, IMX415_PIXEL_ARRAY_VBLANK);
>  
> -	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
> -			  pixel_rate, 1, pixel_rate);
> +	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> +			  sensor->pixel_rate, sensor->pixel_rate, 1,
> +			  sensor->pixel_rate);
>  
>  	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>  					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> @@ -1333,6 +1314,17 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>  				    "no valid sensor mode defined\n");
>  		goto done_endpoint_free;
>  	}
> +	switch (inck) {
> +	case 27000000:
> +	case 37125000:
> +	case 74250000:
> +		sensor->pixel_rate = IMX415_PIXEL_RATE_74_25MHZ;
> +		break;
> +	case 24000000:
> +	case 72000000:
> +		sensor->pixel_rate = IMX415_PIXEL_RATE_72MHZ;
> +		break;
> +	}
>  
>  	lane_rate = supported_modes[sensor->cur_mode].lane_rate;
>  	for (i = 0; i < ARRAY_SIZE(imx415_clk_params); ++i) {
> 

