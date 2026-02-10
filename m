Return-Path: <linux-media+bounces-52544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHvDCV2mi2lOXwAAu9opvQ
	(envelope-from <linux-media+bounces-52544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:42:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6011F791
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87B9F302F721
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63BE3382E5;
	Tue, 10 Feb 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q1JJgFXB"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233F330B2B;
	Tue, 10 Feb 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759764; cv=fail; b=YLXVjDcWmwZWK2rTTsM/TbJuiZQ98zqaGQgd3giCrUkpR7+xFr978pZyBwHpyfrvrpZ4vrAzjcou3RXClM+o1PRQgU/zuuhrg/jOcwAF7m8KlRsOBjlAEcpttYtRXNJw1hdt4aDNfoUJzZiJVBHCswV3EV2i2Wwu9I3o3s9Vx1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759764; c=relaxed/simple;
	bh=kCY1uN6COv9A8vxK3CVa239wRLpInNe8MkUTaRJr2RU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gmP41li+Zx+PZ1qxRaGTm2iXQAzKDaLbPCpoOWHqKztphduMcskF42Lr4A/Vw8a1WQ/qdJuTLyYqleNFzxf3hK9aXfzvs1oXEhBooSJO/FXq5lUk7KJbHcJOhw/UJOq/+m6L8iV7X6GsFZKnVzoaD6WWs9P2dblfb/pezzdquX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q1JJgFXB; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY6UcFLsVF5lGPl8mQb70nKhbc7yfDt2OFAxF2Vu7gYraTmNA5ZwPCKbi/4FEnSkwWUGv0xt308FNi9kla2xXyJ+HeodVW2iJshU8s/+7d2nvMfaOGumqZcYE9YxKuxd2CuA7melCzmUt/O6JgFkw9+YTP6htPtga5GXsThMh3CYIJ9Op/ZXjWewuwY6G8qXT2RVIYmSaFYbM9uNEm/9SaRlmKOFLnBXY5ngCUvQ1jD3RzIhv0mm0KOhKKXriU2iuMm3cEuyhChY5vMNV2Ot6OpHnfXlBbq7fzMhNMHgNB6Bc2tu0sIEGKOeCXIwHvyA5arGaJipmj9dN9ieNyNMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVOibv3ksNa5GtKVtNVxYz0qPMlTGP0ovn47VPgTQls=;
 b=wuP2IYWgpuJFV0wl/pKAyiC1aNupPzYoofdFfAim5WjhG93+jRzgkgaDpkTBiQ+rcN55+e/j1nS1t4QLm/Lhz7tSMfhd/bTAeqz1csDMCwqIkeL7U0QOdkMTO9Bhg+hl+K8yAaw6aQOb+Shr/febIpSqCRKxtwLs/bXos7PZkzAEpbaT8KexinqK2Ys/YuyRIlYsjb5iv5tPE5VtmDqZHeB8vEXtjUb+fJNRXXeSPPjhiSFHMpiWhJqnpEhtApiyQxKPNx7K4HU7eGvloerd8bjnw2P2Rqj9BIyoczwGAcIhmqzwndeZ9vRRx5g9vQesfSVnlZgfT2FOBSwks6EDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVOibv3ksNa5GtKVtNVxYz0qPMlTGP0ovn47VPgTQls=;
 b=Q1JJgFXBvtmORTuGKLHpPbt3RlJUoD7/Sg6fmFNTchEKrjrsbV/a8FC7ifBLP1TIlApSaDTslQduspGOBOoBFv0oqDjGIq041/ciNu1atJ3baEs57wuENUaRKLsX4vhVPhZCMdjEF0z1vrcNMb/9s80jCz5TjlteVPe82yg9pic1B1vk7GxUxi8HXPCVRP15+gzZ6rlUwNdKyPjrnzTHXN85KGMYK7jGbpLNuxdfG43Vj3SZO8vL6l4LYXhM7uwNCUhvx9f229xCt8nu/PxtB/40Pc4O5nDTKlsq0sVMadDxZi4dGSicrJ9QpbNyl8p9Az2ivuNR98zmchxkDJKBlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11401.eurprd04.prod.outlook.com (2603:10a6:150:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:42:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 21:42:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 16:42:21 -0500
Subject: [PATCH 1/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-v4l2_init_register-v1-1-8fe43f7d349f@nxp.com>
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
In-Reply-To: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770759754; l=3165;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=kCY1uN6COv9A8vxK3CVa239wRLpInNe8MkUTaRJr2RU=;
 b=EpQ8siX00cZ3MgLOA/ajPvieiVVz/ThsnUo8z6KYgXfXEX3FbfXBnsUdYPL4mFJNbYpNH5gRU
 QIsJkKWrTfyBOP2xhrXbQrghg48TKGRsg/eB3OwpdIL8LXXhbyLglWM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11401:EE_
X-MS-Office365-Filtering-Correlation-Id: fc224262-440d-4fc3-2d5f-08de68ed4fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjFXNk5WdjNKOWtmM0Z3RWx5M0N3andUMloxT3JrLzE1RkVrVmRQMUNzZTVt?=
 =?utf-8?B?MlFGTEhtSDN0Vm00OGl6S0FVcDYrYjNRSlVJeEh5eUc0TGk0Ump3clNxT0Ja?=
 =?utf-8?B?Q0l0MFRyYm5zOElxbkQxaXFsaE9EVGFVTnVBemtYaGVvcm1VNkhNZVJSRTZ0?=
 =?utf-8?B?Nk04Yi92a0RiK050aW9EdENDbThBeEFZR215SmhRd0YyaHJsRGNMV04zZDdO?=
 =?utf-8?B?UkJkcnFtSDEwUVVpRmtvTm9FMDJFSzBPM21XT0JpbmhSZ0hMa3pjTTE0OXZz?=
 =?utf-8?B?TDdoTXBXWUMzRGtwRHZPQ0d3cTFqcDMyNkJjcUNjU2JRWU9IdmU0bGt0QUFk?=
 =?utf-8?B?TGpiZXBiOGFROTFlUTVJOTZzQkZLaTAvdXhPdnRWdWd2bHkvWmVOZitqUTBU?=
 =?utf-8?B?WUhCRGVYVHhqVFJmRFlGdEdKUE84S1BNcGp0dmtPd2RHYU5OWktjK0E1dVRi?=
 =?utf-8?B?eXV0alVObGlRQWloN04zVG54QUc5NlQrMzVjSWxxOWY0Q0JkZnZSMTVwNnlE?=
 =?utf-8?B?WGxhQitJSHRDU3RMa09mclFaZE1jNlBoREgybVFhSFZ6amh1dUEycVdYN0pU?=
 =?utf-8?B?RnpLdi9HaGg0cS9mVldQVTlQZFpiNC9lMVRXNU5Fd24ybDltSk5kcGkvUHd0?=
 =?utf-8?B?SkQ0NFowTVBOWGtVN2tvbWhjYUgva1JEQ0tRQW5aOE5mSFZuRGpaZ1k3RDY0?=
 =?utf-8?B?c00xaTcxbHFHM3JCejFtek1zMm1URkVqdmg5ZDBHYmdZS3h5Nm5uUVd6ZGh2?=
 =?utf-8?B?NDRaeUhyeDJPMWZpcERBZDJReEI2ZlJBQ21scmJIYVNXK1V3YTZKcGtTcEZQ?=
 =?utf-8?B?VzE4U2ZBb1l4K3VrWmUzSURIYmhydjFEK0ZqUlVWa3IwbEhHa2c3RjBRcENs?=
 =?utf-8?B?ajN2a2NyMlBadTdJbzB3Z1l0YVFJcVZETE5FNFE4dkxmWm1yN2xNaWZLdmNa?=
 =?utf-8?B?V1lIcW9QVE5zcXpDZDZlblpLbFRNRk4vOHJ1SVl1Y2wyY1lHemY1SmE3N2NR?=
 =?utf-8?B?Q2xYRlg5Ukl6dGxzcENqeWxRbWRQY3l3R2FURFNxNkpSOHZHckNrd0tjaFBV?=
 =?utf-8?B?SDgxaTNNRWtPY09DYUYwaFlSN2ZlYnh1bGpPRURqeVNxS0Z3V0tCdnZPS0Jw?=
 =?utf-8?B?WTJlMnp0cHhMSjVGZDFsOEFlREdFaGM2VEFjMlNWSktnVE0xNXdMWThISytt?=
 =?utf-8?B?NHJEcHd0b1h1dk0wTUp1aVhvUkpjN2ZvNmtFOURZTEJqZHp4bUptLzJCMDZV?=
 =?utf-8?B?Tm1Cc0NiZjY4N3I2S0dpWlpveDRiOUV4d1UxbDZGVVREMVZXQytkbDFiWEx2?=
 =?utf-8?B?YVdrMllqRWJqQlZiMXN2Q1JhVXdHR0dGRE9TQlc0d3NhcHVOUHdYaDlUNWxN?=
 =?utf-8?B?NmRPS1ZVbVlEWTdqWENxTXRJdjV2Q3BkY2M0dllpUzhlcFVOcjMvSS9QaFpy?=
 =?utf-8?B?MzhYM2M3MHZsdzVGUyt6dWhORmp5anBESXdpT3Q3eW9uWHZ2N3hRdnVNemk1?=
 =?utf-8?B?M0FsV1QrUlhiNmRQTWFGWHQ3TGlSSHZSemRwcFFERkN6U0VMUGFycVNYRE5S?=
 =?utf-8?B?VVUxNldvM1IvUmNWd2FTUWk0RHZYY3Rkamlwb2NLYW5uRG9SNGsvMHA1ejNR?=
 =?utf-8?B?T09VWkdWWnl5ODFKeW41Q2ZYRGxEMFE5cDBoZTNUYzRHL283NVdJeWRQNTd3?=
 =?utf-8?B?WUhRbkVkcTgzdTZjVVorQ2NXdjllczJMWlJxWWV3YU04WUpHcGo4eHo3M3NZ?=
 =?utf-8?B?cklpMUR1MDF4dzJtclRaVFFFcG90TSs4TS9JTlFDR1JDYUVyblhTUUpQRVVM?=
 =?utf-8?B?YkFiajd3U1Q1SlptVHZVTThTbjNrU3V3c2UzQ1dmS2FwbmhyOTNMTWVEL3ZL?=
 =?utf-8?B?cTlDVDFPVXcyc1ZIRnphUXlLbndEZ0Rra0RMWHJscjJtdjVwUVQ1ZldFRVJT?=
 =?utf-8?B?dkRxakN1VUJKMzVtNk9BTzcyWHlWYkdYMWpDNVlIRDlIMlMwRUF3S0RKT2NH?=
 =?utf-8?B?bDF5UDVkTHVMZGxzVkZwRjRSNS9rOGp2enJJL0I3UXR6VHBlcXFyV016QnBm?=
 =?utf-8?B?T2tlelNLQmY5OTFGUXVwdjAxYlRtZkQ2WVNWM0pJbzlua2IyYjVPenRyWTVH?=
 =?utf-8?B?cHlLODBCM2M5d21SbGlacnVLYjdpSHR6Z2h6c0ZHYWFuRUE0NU55ZExyK0oz?=
 =?utf-8?Q?1l6EUxVsYgYUd68dGQKejcw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVF2SDNCWHI2TFNEVURLdVc4ZHVWSzMrNmFVUUc4WFRRaHBFRC9KemdJOEVL?=
 =?utf-8?B?SnhmdHE5RXJxODZuZUN1WklFVzliMU5RT2dZeGQrYkJLWU5xVVl0a0plcWxa?=
 =?utf-8?B?NVZsN1lWTXhuQkk0OG0zK3BudUFxZFhoelBrdW9USS9oQXY1RzlpNkZSV3J1?=
 =?utf-8?B?eWw3b3dxcmtsdWIwODJMalZncjdzaHM0NUpJSW11dmNvc2JOcm5BeGRNSmQ2?=
 =?utf-8?B?OTJnQ3hYZWFmWXFtZ2prNjhTaU5BQ2d6WEdheDhDdnBaUzlFNzlxbkV5cmx4?=
 =?utf-8?B?R1RmOXBiVU0rWWNYNExDVXFEZUt2cFFzaldTemdEbnhYc2x6akQxbHV6OUsy?=
 =?utf-8?B?SVhQVFJ6SlZOUXZuWUppQjZxNTZ5VU5Vd0YyWGRPRFljYi9HWHp5RXlFN2hG?=
 =?utf-8?B?M21wYjdRYzNnZ2pPRVhGaXFaS05kT0d5ZXpjaHVuTHIyaFhwcnRNRG9MZHJT?=
 =?utf-8?B?NmpBaEUxMGQ2c1lsaEJCZHY2aTVQbi9hZDcvMVQ5SC9iVEEyRGlxRHh6Zm5Q?=
 =?utf-8?B?N0VBbWpFckJJOFlYZ2FOb0J1S1dzZUczaUxOcVlISW5sL0NlT2NOa2lCQ21M?=
 =?utf-8?B?N3JxMTYrRWRkU2E1aHY0by9Ud1V2RjBVdDBSaDd3c2xHN0RLd3ZtT05SWTNk?=
 =?utf-8?B?cFNEblZSRmoyc01XemZuSGJTMGpoRUFzRndDUzNNMGxzRlNMbHA5MmJTYnEy?=
 =?utf-8?B?aDZpekpJQmlnWEdZaUhjdm8wT3JKV21oZnJpQU9BTmhWb3VsRzh6VjVRWTlS?=
 =?utf-8?B?bENIN0VnWVpHMjF5ZGVCSVVpaWd6ajNqT3E0bVBUWVFIeGNWbG0zWmtWUXpV?=
 =?utf-8?B?TzhvZVhSRGJObVJHb1pZYnZLbzRsdGEwNVBMeXdwUVhaVm45RC9KQmMwOUxj?=
 =?utf-8?B?RUhNSlp4U3F6R0JkWnZNckVyWDhZcmxZOGpsdjdLTTg5WXBPdVRBa3JqQVYv?=
 =?utf-8?B?aGpvTG9sUi9UZysrNG5EMEFEc3BwWjdWOVZwWlNySS8rNTFjSU10cFFDbXlU?=
 =?utf-8?B?ZWJpblc3MnlvN1pJcWY2UWFqMW13VjZvSnQzbzJDZDhDMU1TZ3hwbTN5Vlh4?=
 =?utf-8?B?WXVaTkJNaGx3Wm13VjRBWTBVK0txaVpjRGZRN0laRk9yYmZ6Mkx5WFhhaWs4?=
 =?utf-8?B?cVhnUEJSdEZ3TDZNZVU4U214aEZaRmpOc2YybTkxT1BsMlZCTTZFZWNLdUdP?=
 =?utf-8?B?VTVtTzd6SWdORlFwVlkyU0FMSUhlaDhHQ3FEc1lab0FZOUlYaVV1Z3hlM2M4?=
 =?utf-8?B?SEVQdWE2c3pwU2ROUVBPK3dKd051dWlIY2xHQUZGaGxxdnVRWXBqVS9tWGpQ?=
 =?utf-8?B?TjA0Nm5WTnNTYkhkYzVnZWRVRW1reWM1M0ZiTTgrS3ZCckttaGcxdzJGUXdF?=
 =?utf-8?B?QnZuaWZuNmN6ck13T1FpSEZrbjRpdVF4ZnYrakF4UnRpRW9oSHpXWXNuZUlI?=
 =?utf-8?B?eW8zaHBLaUYrQVIwcjR6aElMNU9uZ3UrVlBFbVRKRnhJMFNVWitLRmFuNEli?=
 =?utf-8?B?NjBaTzBTR3ZtclhrZHdhbVJYOFNsdlFDOHZTRDA2WW9pb2dIeDIyQUdRSG44?=
 =?utf-8?B?Y3NEenNqdExLVVlOQlJPbEVhRjVTK1BRMXMvQmR0bnY1UWdQY2VkRDRIOUZ1?=
 =?utf-8?B?ME5EWjVwY3ZGWXdsUkhoVkQ0dy9qRVYyOHBoWHJrakJxNXMwUHFibFlDOFdI?=
 =?utf-8?B?NGZUblEzVUV2Z2pTUDR2L05wOU9lakpFYmdDd2VHUFRwemRzOGR3V2ZQL3U4?=
 =?utf-8?B?Z2NMY3NQNnE0d2xmNk9MdUlOUW1mM1RTNzRuYUIxZ0dQTHZDMnJEQ0Q5QzBN?=
 =?utf-8?B?L1NYSEk2TlZ4UFYwU09RSkRhMFp0WmREeFFOT0p4YUtRNVZmcDl0Mit5VktL?=
 =?utf-8?B?NzBYVzVSY2F2Nng1TWxHQmtuWGNQcFE2MGpacEhtOTJqZDZQbGdvblBnSmkr?=
 =?utf-8?B?LzdtQ1dhejlLc05XdmtUVmdMQjVTeDJhSHkzbGRvaWphRGVRT2lNWEVCTTd4?=
 =?utf-8?B?T2lEUFFleFZYcktzbzJpZHZlblhvTkl3dE00QjFpL1dXRXZiZlRKTUtvY1dk?=
 =?utf-8?B?VTlQbDNRVWMyN2RmcHdtK2tTSXMzSVFGbUNRaFhIeTdlZFJXM1lZWHZDVGp1?=
 =?utf-8?B?RUZUV3BzcEFRc2xHYm5vSmJvV2IxWkFzR3dnM3ltbms0TVlhZGZTUEdLM3E3?=
 =?utf-8?B?SUt6Z29OanZTc042ZmYwd2JhaXNuTlpmNFc1Q0FYUHV6SVJYaFl0aHlPV3dF?=
 =?utf-8?B?T0R1R21FRitZT0ErSzhQSlFHT1I5b3dHTm9tOGI0OVRpWlpFQXFKdmMrdUtW?=
 =?utf-8?Q?sP2XjGeaDkvtawAbA7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc224262-440d-4fc3-2d5f-08de68ed4fde
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:42:39.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSWrnjmS+qsslixzskkpLV3iEbn1CCUgp7eIAMBbdlabZ8MonobLPZKjxaubhjECusFR6CCbMxOmJ0m9G4fohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-52544-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 76E6011F791
X-Rspamd-Action: no action

Add the helper API v4l2_async_pad_init_and_register_subdev(), which
combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
v4l2_async_register_subdev() into a single call.

Reduce code duplication and simplify error handling in drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 30 ++++++++++++++++++++++++++++++
 include/media/v4l2-async.h           | 18 ++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1c08bba9ecb91f46b7479da613d6c1688d4b0b5c..65e4aa46372a02f9ddc04571436f46c90259e200 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -881,6 +882,35 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 }
 EXPORT_SYMBOL(__v4l2_async_register_subdev);
 
+int __v4l2_async_pad_init_and_register_subdev(struct v4l2_subdev *sd,
+					      u16 num_pads,
+					      struct media_pad *pads,
+					      struct module *module)
+{
+	int ret;
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = __v4l2_async_register_subdev(sd, module);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+EXPORT_SYMBOL(__v4l2_async_pad_init_and_register_subdev);
+
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_connection *asc, *asc_tmp;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c963065fd7c19d6d9835df1194bc069..81f1f418a246902178d5fa8f9d5e48b14301386f 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -336,6 +336,24 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
 int __must_check
 v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
 
+struct media_pad;
+int __must_check
+__v4l2_async_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
+					  struct media_pad *pads,
+					  struct module *module);
+/**
+ * v4l2_async_pad_init_and_register_subdev - Initialize the entity pads and
+ *					     registers a sub-device to the
+ *					     asynchronous subdevice framework
+ * @sd: pointer to &struct v4l2_subdev
+ * @num_pads: total number of sink and source pads
+ * @pads: Array of @num_pads pads.
+ *
+ * Returns an error on failure, 0 on success.
+ */
+#define v4l2_async_pad_init_and_register_subdev(sd, num_pads, pads)	\
+	__v4l2_async_pad_init_and_register_subdev(sd, num_pads, pads,	\
+						  THIS_MODULE)
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
  *	subdevice framework

-- 
2.43.0


