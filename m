Return-Path: <linux-media+bounces-52902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NI6LpUzk2lx2gEAu9opvQ
	(envelope-from <linux-media+bounces-52902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:11:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7001452F6
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41547300AD75
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F1931691B;
	Mon, 16 Feb 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kv9FdUqM"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26250326938;
	Mon, 16 Feb 2026 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254162; cv=fail; b=urPvokKvKAaxXdhldRFbGHdFXWhjwm5Im9VBIAUJtNWlWHHC1rfzG4eNeYUbd+YdjrotsBvpIpFVvykSE2jdZZITQcA+IPaaaQqU8vQYQ2P+WUBFsgo3A3h5oQzSVHgVvTGgVWAmjiJz4api40cCvSUvn6TPQMmvqpzwgdUh4Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254162; c=relaxed/simple;
	bh=FWhDwBY1ae3lSYyP4KqDqYWkrDQlLr0T0KvQo8fP7Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a0GaG5MLmLysI0efSnGDIM5oUqToEdoqJpGL5vj0arr6E5QeUhWxtC+mujkp5DF61wpT+bJl23SI8v6/AW++g4ZaCHd9eEKmH43lLbfiv7bbRZrtFTouRZQKMLteM31rIVX84PbSfvHdFhcQfrfDcsHOQ0hajVVaHSwIevga++Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kv9FdUqM; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dlwdq0SNzWzsJZTWWv9iqIoLonYD9sCU3lGmhntGrw/vZYK8Nlya1Pis95tMulk6ZRl4PJn7Uszrra9dkLMJwMg79Kl3OfSA4J3PrDmCVSjgUAxJ+OvSzJrAzmwpomVOSt7xzdfb/TaibC6gm+bFk/XMYP/t3qd6ZZxp/SpgKb3/92U0yKOGe3zTP4Bx4h0o5UlInbBcM5oLEZCo6+1i5AC8HFENorBwIyLJAPQrtSmWve7I56ghsyGEu2qav/61p+uuHnJ9jAxVfBuRMrQ4KLvPzc6+JKLE/eD+38dEoAUoxKX82TpyTWR9LTeno4NfBoGiK8RnjUgllzSH559pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvsAfQCJU0iiY3Can60fIRGL6JmPoWYxtt8UTQRcqbQ=;
 b=mAMt70PIi01/2dbNVFE1FRyJGuZtA/DuLe3th5T5y0ano13g1+hxclqMehKgklzh5qxbnBeLF6DFOa2Fjr9kJyF3yAlOYxkU5DFxY3VqbZgYjT0zmW7AdVZL/pTiIwI82Gk4DxiO+WQbrXDpZJHo9G707eYkIJpzaO+WAzeq+5khIcJcTEk8vVuMnr2VXjVjY5zXFaw+lqQ4GEKvl1dzU46mgl9Zz/hIoy9vXB7xZft9x7X2FEv/AzKZEjEqZ5+Cr5MLnG4drCxuoAJTEPQlPgFnwFsqEdcpe1iZKM4YB1ubCGVOYJHrN0KUeJovIzEAHwbC97VBWAYZiPMTv/I68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvsAfQCJU0iiY3Can60fIRGL6JmPoWYxtt8UTQRcqbQ=;
 b=kv9FdUqM8QOVMuCxtQ6AH8N55cpKbtv6UGAjlFyiUOPkJAFKpayNPcKgZnjccgfVjrlQyiTh2m9aDzNvPvrBvO7AwQHwFEaTCvKn7cQ44u2cbfz5QsqMyX58eyXAfNRV3sAGjJFGI7//AG1rarBxgFHvTuD/PTNl7FfHRKKAEfteKA0v8aSsM3SixXhdjKk5u0+oavEM9y+MOTqpWHpjygueEjYEZyAJfI6FXFJ2mD1quJP/I1d1KpDm38LD4I3JcuKeivo5d+8EIIis7kriFT2YWH40AOxJUN44b+s9INy2viy3b7IDIACxx9+ZAHQEEjYSRPL0Z1mUqR0/d90zGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:37 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:37 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	chester62515@gmail.com,
	cosmin.stoica@nxp.com,
	adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com,
	Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	jkangas@redhat.com,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 11/13] serial: linflexuart: Add support for configurable stop bits
Date: Mon, 16 Feb 2026 16:02:03 +0100
Message-ID: <20260216150205.212318-12-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|DU4PR04MB12026:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f7577d-6b06-4658-64fd-08de6d6c6c54
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnNNQ3dHU3VPcSsxaUJFUUZydXZ5eVdVcEZidlhZdHFNWStIVEtDcVVvNStQ?=
 =?utf-8?B?Sm42WGZ5Q3NWS3N1V3BFbS95VC9paU9tRXBkRnk5QzA4R0d6Y3hkMjFnZVVE?=
 =?utf-8?B?SGFCbUhCQi9Id2N1M3YwTElWUXhleE1yaDBtd0dRZ1lkVGZaamowdzl6TWtu?=
 =?utf-8?B?b2g0K0tYV3djcG44LzZjd014aEpWd1huK3BFUCtVRW1lU2pQU3htMlRjQThp?=
 =?utf-8?B?NWF4bEdHdnRNNk1vcVhRMVhxc3RnOWJMdkVQdWpJOHlGUjEyR0V1Sm1UaGhp?=
 =?utf-8?B?Y2ZGQkZxeXZidS8wUkVTWWJaUkdicTFlMzZLajV6ZEM3YkpPOXZPQWxtL2Ni?=
 =?utf-8?B?K3JrVGpFNEtrMU9ybVE0QVg5WHpKV1BBMmVBdlJLMXdLdHNubHZIOElLQjhH?=
 =?utf-8?B?d1piZXd2bkxWZkJyUktZcHlSYm5USmx2T3JrVUZ5TTBuV2tFOEIrUWNvTExR?=
 =?utf-8?B?MHRYYk5qWGFaSERxcHl3cXd2N3didG1mSWZwU3A5R002OFU3aWpaSGZkWDlw?=
 =?utf-8?B?R1NlL1laY21yVW5Eam50cjBFbXFEZ2lpMld1eDhxc0hobTJzWkMzMFVoeHRB?=
 =?utf-8?B?TFVya0hlc3A4MXVLbVQvVyszTXFEOXduT3U2bGR2VFg2UnBjWFFucVpWZ0gw?=
 =?utf-8?B?MTZaMElzTDZZSXRqMXpucURoZmtlZnhRUERwL0pLNVJzcFFWek96ejcyN0Yz?=
 =?utf-8?B?K2dJalZ5VnZmU3g3Yld0am13eG9xbDVwd3pxTytFd284L3NOTTN6S29XTzN3?=
 =?utf-8?B?dWtkNGdMcmRyZk0wbDJHNStFL3kyc2E5a0tqcUptTUdRTFFyMGpYRW1pWVlG?=
 =?utf-8?B?aUdSbXdPNjduQjduTE5GcDNidTNjWkxzRFBDRU1CaFJMbW40eFA3QTVWL2ht?=
 =?utf-8?B?RXJXNDMweWlpSkVmM0F2VnN5dTJvVjA3dHlOT3RzK2dLRVdtb3hQeTVzTVFx?=
 =?utf-8?B?Vm5Ga3FUOC84OW9oVnhLRDVZbXFoRFpEdStCU1NwWFNxeXlUcWs3Q3ZWRGFF?=
 =?utf-8?B?UmVqZVJZdS91SHBsdnpubU5NcktXR1ZXQzJmbFV2WjJPclFnT1M2QTlmTFdr?=
 =?utf-8?B?WVYySm1ic242dy84Zmh2b1NQekpvdTZZN3ZJUmZqemtZZzVBWWcrNVA0MmFV?=
 =?utf-8?B?alE0QTE5Q3R2ZDFYMHJXdlFOaHlMTlowUlJLUmtEaFlUam5HQlM5T3VUbnVx?=
 =?utf-8?B?VVZjc3k4Z3JoSGZzUVBHckVpUXZCNnMyVU9hZ3o0aUxHU0dRenBSVnJ4aElx?=
 =?utf-8?B?SEViSklYV2VEYWxBdGYwTDFRUXNuNTFxV0ltT1ZHZ1VvT2dSR0dXVi9XclRv?=
 =?utf-8?B?RW5vSWV5TU9tQ0RsQnNsNmVTUnpXTGdIZnZtN0kvUjI4RWoyL3UxOTBYM3dq?=
 =?utf-8?B?WDBZamM2YmNxanU0OUFKcnBnS3Z0OStQWW1wWUhxRE5keW5GMXlmbGZXUHNo?=
 =?utf-8?B?UElHU2VxZmYzYmRiMTFjTzdaWkpFUDlBSGtDSmtKcndrM1hyNm0rd3JGMmdM?=
 =?utf-8?B?eUlEYlE2c3BqODIyWGloSTJLQnZPY09RT3VRbFhKL0tqQm01OVZ4R3ZCS2wv?=
 =?utf-8?B?MUltMk50bmxERW5GZGNnVzI4dWZzaVRrTU1lZ3ozUHVYQ3dqc2NGbzJBcE12?=
 =?utf-8?B?RmUrRDI2N2xNY2Q5VHVLSEpiWWhWV3Jyb0FkVFdTOS9CNW9lcFd2V3BWeDl0?=
 =?utf-8?B?UnpUQzVla0dNTGdJRm9EOVZJYXJZTzdkSmJRZk51RzhlS05reXA2YVZwKzhw?=
 =?utf-8?B?YWNvZ1UrYzFJMUlLdy82c1N2bjJiZHUxR2xmeHB3VytBNU5lTnJFWjJXbXU3?=
 =?utf-8?B?MlV1a0RuSjJYZmhSWllhemx6eUdWU29tR1MzVkJuNXFick82OUtaNG8rVDBZ?=
 =?utf-8?B?L3NUU3E0c3pTMjY5eGlVaC9rUWdkeDJHeCtoeGpoTUZLVm1zY0RFUTJ3S1Vj?=
 =?utf-8?B?TTZ2ZEFDT3pOM0lPM2JydWdwNHFET01ZMDkzQTAyL04zV0drUWtmREFuemVv?=
 =?utf-8?B?UmRGOEtYN0E4d040RVNNQ29PalYwRWtJWXlaU2U0RlBtc295NlRPNldMamJW?=
 =?utf-8?B?bnBqVmEyUk5vTGhXMkhtdGhkZUtWRVVpV2xrL2tqbXY0dGhkeWhOVjk0NnQ1?=
 =?utf-8?B?MWJuUjBKUFBkSVVDN1Q2UEFZSEl4UVFUa3kraVRjeHUyWVhWL3VPNHhrNnc1?=
 =?utf-8?B?MGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R05LV3o2akk0QXZQeDV1WExxTERjZitwdktwY1ZFM00vZ1VKRzVkWkJDcUky?=
 =?utf-8?B?UVcxQytSZXgyL3F3Q1ZjTTBlc29VekdRUS9JSVBZUEs5bjgvQnlNVEFjSHJ3?=
 =?utf-8?B?c0h2cXRPQUQzazg2Uitja3NnTUlWeDZ4SjVZTE9CTlVabExPS0FnTGNmaUNl?=
 =?utf-8?B?OWRHZjl1VGZEZVpjUjFNMS9yT3Y1eUJEK2txVzVGaXR2bTJwV3VjSFFqQXRz?=
 =?utf-8?B?djU0alQ2RGp3Q3ZEaE54NTRlS1R1NXJoUis1U08vQXVzL1RaZEJBaVRYdDZa?=
 =?utf-8?B?UVYwb3FsM096N2JPeHJZbjA4RFhaRThrRk9xekpyUFFZRmxONUdxcUhqM1FC?=
 =?utf-8?B?TzFpdkluTVQ4R3oxSmg5WXRGdHlSZ3dSM2F4U2s1OG1WUlkyU3NzVGQzSnho?=
 =?utf-8?B?c3B6SEpvRTMrbmtpcGxMd2hwNjgwL0xYOGtIeTBJaS85QjdOS2pYaFplaVFV?=
 =?utf-8?B?UTVFcGZYSmpualphclpTYmU5ayttekw0c3VPelpIYzFFU2VTenFFZmdON2xJ?=
 =?utf-8?B?Vk1EK3JDNlZnQkV5MVNtN1NpdjhxSUY5emk0REt3MGwwdEl3dzhSZ0dvalJj?=
 =?utf-8?B?bi9VSjAraE9nRVJoN0RaWlhSSGdUSW9sNUZCUTlQY3F0YkJ6c0cxVWVjc0pB?=
 =?utf-8?B?YTJld2dKczhuZjFNcFlEL2Jaa096Rnh0TFo5VStUK2NMaVkvcmdjU3NLWmpo?=
 =?utf-8?B?aUtQcmxlN3FPZ05SaUIzOWtDOUplMlkxWmNhaVROc1JGRGl4SzdaUUorV2h0?=
 =?utf-8?B?d21ycXVqS0o2WWIybUhMb3JxanNzWklDY0lDenRiU0UxQWpHeGtqUmE5K0Jo?=
 =?utf-8?B?dmxTclpTc1lKSUNMYi92OUN4NVRNR0JiMU5vNDI5cm4raEVBOTVwVHhPSmtY?=
 =?utf-8?B?ZERwclZmTVRndUUrMEt0RUdTZ2JnVXlaL05sdkE3ZXlaejB1Ym54QnNkYXF0?=
 =?utf-8?B?OHhMZkVYbTQvSGQ5MiszTjV1UytoVkl5OGtGMkIwb2lXZ1NBWHRzR09YQm1N?=
 =?utf-8?B?K2RaV0w5UERRUUh5eDNJSXJxYXNVZndVRU5CTzZ0ZFczR1UzMGo2ZnZHSk5x?=
 =?utf-8?B?M1FvMSswNXlnS2hLNnNyYnhvQmE4VFhFWUlTVVFOdFNzaGUvWTJoL1M2WDRK?=
 =?utf-8?B?SzQ5dlJqR3pzNWFDbi9TVFZaSkdnQ2NCL011cktlK1h6dFlOaTlXTlZXZkJn?=
 =?utf-8?B?RkZhcWRoWUFLMHZCbnlwbmxnUFE1Z0tMZ2Zuc3NuQ0MwQmpNS1lkbVRsc2pi?=
 =?utf-8?B?TnZGbEdJMjk0akJPVW1jcW5PK3VLSUpaTzVCeXBrU0xiYTNlRXgrZ0N1eVIz?=
 =?utf-8?B?dkxySjZ6dExCWWZTMFRyNzZGVTQyOC9xT09mMzVHaTlETUgyWmV4bUdLWG5Z?=
 =?utf-8?B?WVN1ZG85MVg2SzNxdnE3R0NVeW9qRnRFK1h5Z0dnczhOQS9FRTdTdFNYM05t?=
 =?utf-8?B?bjZvUllKNGZwYUhNOXJ3aTlvSm1wMTB1S3ZxdG4zb2JldUhpU2x6Y25OdDM4?=
 =?utf-8?B?NzVJZmZZdW1EWlpLeVVURUE1SStWMksydWl4d0J2MCszS1ladUk5UXVLeHg3?=
 =?utf-8?B?TGxNVUV5alg1ZlZBT0JOTlhVK2JvbFBkaDVwdklxdEF2dnlNY0gyTmNwVnRn?=
 =?utf-8?B?UVplUHQ1a2dlZ3h5QzB1NkpXSEJRekV5NDJIN2lNb0FaYytGZklaSHg4Y1hJ?=
 =?utf-8?B?K1lCQjdmZ2wzVit3VlBzMUowa0JHOEpVSmFFTUFGdG1WOHdUQXhVbGJzbllO?=
 =?utf-8?B?eDJIZEUvbTdHbVlsSzN1Mm1raUJrK2hKU3BSTUVucmlVSnNtV3RrKzFkZlZY?=
 =?utf-8?B?ZVVpT1RiS09rczM4VGlOMFQvTDhrZG9YU1ovYXdBM0NjQWE0VzM1UlJ2WTFH?=
 =?utf-8?B?V2ZsTkNodWZZRXhxVEc1SmpxMkZlbXlPZnhDaEt0U21jUTNNQUg0a2VJOGI3?=
 =?utf-8?B?Q1gzUkFoelZ6YVh5ZEpLb0hXb1NvMWpOa0xYdks0aXVYMmk1aFNETHQ5enJi?=
 =?utf-8?B?eEg5T1VLMlNQaUR4RCt5N1NxRGJMSkZPWXFvc0Z4eHpwbTl3TnZjRVh5QXBE?=
 =?utf-8?B?Q3NhQ3dXaElQZXh5WHVCVXErSnFBRUtTWERpNCt2SzlLTHROeUlWa3FVcHRN?=
 =?utf-8?B?Sk4zMGlaK1FUbEtRUDhkVE90clMyMmtYZktreU12N2FSNXo4Tk5KZmpIckZ4?=
 =?utf-8?B?cDVtTWduOFJ6Ykdjbmh3SFZ5Z2JwOFNKQlJpbVJETmloRkZKQ0o0Tk5Ldkti?=
 =?utf-8?B?YmQzMU81N29iU3NITlVpVTFDd1dtWDF6VDBEK2lkN2M0T3ZsK252elZTVkNi?=
 =?utf-8?B?eXg5YkdOcE9XdDRGRnBIdnhUNTNncXZxZUplWnVrcTBONkxmNnh5NUtxcWVH?=
 =?utf-8?Q?kIQV0aNftiLRjnLE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f7577d-6b06-4658-64fd-08de6d6c6c54
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:37.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fsKUZXMPNiiDNlO2mb4Sxv4ZUpz8Qoq/dttV1VaxfiTeg+0JyvEGTvQ+1l3XgluuXzhgeb/8GIlmyH6oL7e4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12026
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52902-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: EB7001452F6
X-Rspamd-Action: no action

Updated linflex_set_termios to set the number of stop bits based on
termios->c_cflag.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 31 +++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 36c8f90d975d..a5a34fd81bcf 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -75,6 +75,10 @@
 
 #define LINFLEXD_UARTCR_ROSE		BIT(23)
 
+#define LINFLEXD_UARTCR_SBUR_MASK	GENMASK(18, 17)
+#define LINFLEXD_UARTCR_SBUR_1SBITS	(0x0 << 17)
+#define LINFLEXD_UARTCR_SBUR_2SBITS	(0x1 << 17)
+
 #define LINFLEXD_UARTCR_RDFLRFC_OFFSET	10
 #define LINFLEXD_UARTCR_RDFLRFC_MASK	(0x7 << LINFLEXD_UARTCR_RDFLRFC_OFFSET)
 #define LINFLEXD_UARTCR_RDFLRFC(uartcr)	(((uartcr) \
@@ -124,6 +128,10 @@
 
 #define LINFLEX_LDIV_MULTIPLIER		(16)
 
+#define LINFLEXD_GCR_STOP_MASK		BIT(1)
+#define LINFLEXD_GCR_STOP_1SBITS	(0 << 1)
+#define LINFLEXD_GCR_STOP_2SBITS	BIT(1)
+
 #define DRIVER_NAME	"fsl-linflexuart"
 #define DEV_NAME	"ttyLF"
 #define UART_NR		4
@@ -456,7 +464,7 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		    const struct ktermios *old)
 {
 	unsigned long flags;
-	unsigned long cr, old_cr, cr1;
+	unsigned long cr, old_cr, cr1, gcr;
 	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
 	unsigned long ibr, fbr, divisr, dividr;
 	unsigned char ldiv_mul;
@@ -521,8 +529,25 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		cr |= LINFLEXD_UARTCR_WL0;
 	}
 
-	if (termios->c_cflag & CSTOPB)
-		termios->c_cflag &= ~CSTOPB;
+	gcr = readl(port->membase + GCR);
+
+	if (termios->c_cflag & CSTOPB) {
+		/* Use 2 stop bits. */
+		cr = (cr & ~LINFLEXD_UARTCR_SBUR_MASK) |
+			LINFLEXD_UARTCR_SBUR_2SBITS;
+		/* Set STOP in GCR field for 2 stop bits. */
+		gcr = (gcr & ~LINFLEXD_GCR_STOP_MASK) |
+			LINFLEXD_GCR_STOP_2SBITS;
+	} else {
+		/* Use 1 stop bit. */
+		cr = (cr & ~LINFLEXD_UARTCR_SBUR_MASK) |
+			LINFLEXD_UARTCR_SBUR_1SBITS;
+		/* Set STOP in GCR field for 1 stop bit. */
+		gcr = (gcr & ~LINFLEXD_GCR_STOP_MASK) |
+			LINFLEXD_GCR_STOP_1SBITS;
+	}
+	/* Update GCR register. */
+	writel(gcr, port->membase + GCR);
 
 	/* parity must be enabled when CS7 to match 8-bits format */
 	if ((termios->c_cflag & CSIZE) == CS7)
-- 
2.47.0


