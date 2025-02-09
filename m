Return-Path: <linux-media+bounces-25847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B35A2DEAD
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 16:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6A13A58BF
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 15:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4055B1DE3CA;
	Sun,  9 Feb 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="agkp0Npb"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A6F9FE
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739113596; cv=fail; b=Qxd3VniJdNFfZZDEPeCJ/26HcVgDBu0JQVDIpYdOcLZgF3Z++N/JG3nX85keVI9AMfSw8v0HCx4vE4ClmQ4dARiKpRBStRaMRxsUCaIbnEpI6t46RywQ9WoSvmpUXymeWV3s2ptjOuo4PUCrM6Zzchjma5yl3vLfxOmH8e2pqK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739113596; c=relaxed/simple;
	bh=NDEgqpXiQCJvH70Ge2I73BcmEvAEb/K0WAAHSa3IJLQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dP2ELyhXp114KXVovH2+z6EXl9XT//XlHHtRL7F16Bs25gQzeH7P33wjjqmPUeC3UtBzw0W0TxFgvxIwwpF63qE6dIcGEUrNkG/v6/wERTzQDM+KkSGtfYqkIthcyT0lNvG4yqBHc8NEKlqrm2EmYzgLLNOjL+jFMsJDazll2is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=agkp0Npb; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agjBCKklK2OV7I3ejboHdy107Oikl3VnWK+GNBpqJEDpp1AZ8cdtCzXmjyrSlwNpfljhLsYrdxnB0859442gDLMaFKLBeNK72mM/p8cFuEtMeKrYKujRI9poXDB56m7/SYqlDIYZcMAjRPOKW+4yloqeJiB/Yd46gQ5AID5mved62kaolzzS7EbNhbkvmafwnoSqlwqIgJI8PvdW0M/iMxjVDp4X+le4JD2P0LMr1x5OV6aSXjlEm96lPOZl2avaDpVzoUGnWMPXE7087qNJQkPXBSDNodmVyT7l0Q5MlsSpBrM8DvIlnB3JirHTRXZB5k4qPbv6FZBPYiyEvt9x/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1O20YMFRkvMxene/lp4jMkeZ3D1QaZexpz0vojWH3Q=;
 b=NwrohqCQDQ7cBCjSOua6Jey+bNeqkKhFWxx272Mg7co6uRCYQmEykgqIXoHvvemoDDsuM1pLIUqXt8qZIZWhttoRPejlWjf9PCW02GKPWLxV//kgqYlMrFn/hMAIeoKR8C5zmLHsZG6FQqNFmjet3fhxPtRNoiyzE2Id48ijrj31ccn0YvCtNAqd44tUEqPJqvgV0qSMiyoQTchIFeld0OhtkoCmrTe/QUFcZLl+adU4FX7JzH+MWbx/zHYj1LvG8swC8sLodW4b13EMPlKrHepc5QL6eaMBxPuEfPObX9NAaO4IK0CzIhVncWyq4n7RttXTsmTx45ROqzNGdbfFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1O20YMFRkvMxene/lp4jMkeZ3D1QaZexpz0vojWH3Q=;
 b=agkp0NpbgBnzeFhZyqNcSLtLF0laasX3+Ubb6KjvTKd+bHyodPCvyDLBLbIdxhgE4d1xS9Rv/jgM99K0bKxsLihWSWeMz7wgDC0zyCg0YMQrdfWDwLLMTaWkS8JI4QdX4WG6F/5V5bDe62uzRexvDGYtLqn2kuRCQvep75I7SKXAFLDN2zy3oYLvmBOPgTFLBh/VasMcdjnuDRRwUhbcaaES4jBlo1voP/d8ezCza8vAGkS84SPQob5bHoTOmJ98kDY/WCZEc/Dln9UjJZJ/o8P40lf4IWijOOa3zbnfI5AM7E3V0TSppb8PiekUr4YoFkdC372TG0bfbBND3QzQWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Sun, 9 Feb
 2025 15:06:31 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 15:06:31 +0000
Message-ID: <81e717b6-f565-4fcf-8d3c-054bd5e41a0c@nxp.com>
Date: Sun, 9 Feb 2025 17:06:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: RFC v5 01/15] media: Documentation: Rework embedded data
 documentation
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
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
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250203085853.1361401-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c4f4d3-f303-4010-ce61-08dd491b55e6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZDJSTlRZK2dRSitZdDJTYlRsVytLVHdHUFh1UDRMYXphNGpuejgzRUZxNXZD?=
 =?utf-8?B?UXJNbkxRV3duc0pQVW5TcTYxRzhtbjd0dnBUNmtUQmRLYUVMcVE4RlMzcDZM?=
 =?utf-8?B?ZjFNemRsV042S1NaUWhDbCtZTnAvYlZnOWJWdStaVnZCZUxJNHhkZHhma2ls?=
 =?utf-8?B?NXlYRGx3VXhic3NmRWFRc012MENkK0ZVMXY0RllDUFJWMjQwSjJOZEFBSUZF?=
 =?utf-8?B?STJEbVJGeHdpOUJnSzRNTEtPZDRsRnRmTjZnUXFwYkFicWFTY0J6czdnd2x5?=
 =?utf-8?B?Zk83ZmlESStIb2N6YndtVWw3VzF0eklKSWM2eUJTUk9UeklLSTE5WU11ZTg2?=
 =?utf-8?B?SXh2S0dRSE9uaXN0NFYwQ2JqTEtWSFFkNFFEM3hCU0RJcUhOQkFKdGIxa2R3?=
 =?utf-8?B?RWlROFEraTE4K0paNE53d215UlcxdU4vdGNLWXQzbWlVUjdxRUxUaUMrT1FB?=
 =?utf-8?B?NGVaNHExN1VHZGVzem9YQXVWMEtkMjVHaFFoUFFCZkFMTFkxbnduN0p0N1Vx?=
 =?utf-8?B?c3NIamM0SGluMnJWRjVWN21Cd3FKTzFoaDBVdUJYT3RoS1FkbmFIdUdrc1Zi?=
 =?utf-8?B?MEUyR1RzbXFuOGUwSU9hTlBDNFRZOXJrOE9MVDlkSytFbUdHWmloeTh5NlV5?=
 =?utf-8?B?RmdRRWNnaHFjVnpsZGdRMWpHTmlSK2Nqb0dZSXhMNGttUS8zK3M4U01kb1JU?=
 =?utf-8?B?K2FkZ2U5SHVZczFEQ0FjZWF1N05XdkpDVSs4TlVFblBpa3JselUxQ3owKy91?=
 =?utf-8?B?TU5FS2FzSzZ2N0FPMXF2aCszcDA1aDIvV3dWTmZvNHlSdVVZRFY4UjZ6aXFY?=
 =?utf-8?B?bllsQ3ZqRElXeFk0MXhNZGlZQlFhYm5Wc1N3TGcwQXF2RjllZVdQRVhreE5O?=
 =?utf-8?B?NWRHa3lTRnFyWkpRWHlIWkpWZjBUbUJadEhvZE1WOWwzLytsK2xJMVZteDMx?=
 =?utf-8?B?MFZhdFlPVG5BTjRWZ24rdnR0UTBCTFdnQTZ5UXZZMmVaYVRsWUY0MExjTS9j?=
 =?utf-8?B?eDhOa1U3UWRidWZmVmNVRGlFZnVQSlZFSFpGMjJpUFBUbzZNV05HN09BT0Z3?=
 =?utf-8?B?Z3YxWnU4aVRFVVpMV2FYTDFLNnZUTHdIUS9ta2RnUzhjYlhPVEJNOEZxeHBr?=
 =?utf-8?B?WGVqM2puaXRjeDlTU1o4WlpoNDNiNlh4a1dBa1Z4V1FOcGk4V2NuYUpqNE0y?=
 =?utf-8?B?UldPcFRhRHpqNHBlOEM1WTRZaWNPZ201YW1QaHhWMFpaUk05UmVLV0FzdzF5?=
 =?utf-8?B?aFBlRHQvelpWUFg3UnBrc1YvV3hiOENaTWZ0cStyU1Zlb2tlK2pQV04yNCtu?=
 =?utf-8?B?cjdLMjB0Z2RiWkJnTUxGbmdXM2c1by9HTFlHMFZhWkJ5U3ZIWXNsK3V6ZXNM?=
 =?utf-8?B?WHhQZkhEdmRBUEJNeElyblNpS3NVMlJPanBGbmJDbGU3NHFja2E0c1U4ZWlR?=
 =?utf-8?B?ZjZyTWtKZVBDcGtzMUhLRzVyVWlmRVR3SzNkT3JYZk5ZWGV5Um83ajFZUVJo?=
 =?utf-8?B?dG90UFdBNXJNa1h3RWQvRGpPSVQxcFFYcjB1RFFSWi9KYWllcFJNTEJxMnNr?=
 =?utf-8?B?NkpCWFQvK2c0T1h6YXMrWTlOT3p4U3B5UmF2Vk1BWnpnWmxSSkkyR0NQbnVC?=
 =?utf-8?B?VlNNUGw2TElHOFRSV0tkUHdSYS9LcWQ2MnYyM3FucEpmV1JkejZLU3lXSUhr?=
 =?utf-8?B?MUxWbi93czQvOEtVbERWS0p5RUUvTE9uNmx1V3BHMlg2UzJ5czJzZXhHb0Zt?=
 =?utf-8?B?QVdCN0dpenlJN2s4elljbHRiY0p4ZmhQdHJHcDY0bG5tVFg0MTdnNG1vSTNz?=
 =?utf-8?B?Lytqa1d4a3ZUNXo3L0h2OVExK3NyRkJ1clU2RkFXeHRleGovbVRERU1udlEr?=
 =?utf-8?Q?+oat5XXndj5md?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dDVuNVBEdyt4cnhoSC9wSXhZaGRicmozbk5GUi9TK29wUkNIczlVVEovTUNO?=
 =?utf-8?B?a05JclBNL0ttUEovTktLWmxYSElFdU5LMmpjZ3hmQ3VpSjIxQ1BScnFCL0ov?=
 =?utf-8?B?ekl5N1BQdEpsZ3ZuRXQ2OHRlNGMrYUVoU2x0Q1BsQklSWU5Tam9oRGRQTjRj?=
 =?utf-8?B?Y3BNSGZSWWtyT1dEekw0ZEw5Uk1uYUNvZklWOWhEbTJLV2dtSk5PNTVKaFlY?=
 =?utf-8?B?OXZSblE0R3lTUzl2Vk9DYStRa2xUV2E4aWRmMFZCQXFXTDdHQXZpMmNPLzd3?=
 =?utf-8?B?SWNPeDZXOHRXMExVSzIwQmJRT2Myd0l4TEdrSncyUDVBRjBUc2I1SUxXejJG?=
 =?utf-8?B?ZzYzckRhVnJINkNtT04vVXlrYTEwZ3lwOS9zcE1NdjBWdG9tOEp4L3JkN0Zk?=
 =?utf-8?B?MVE0T0E3OHNGa3R1VThlYU1xTThKQzBxR0lMMWpwbmtpajR6enNtT2toYWdH?=
 =?utf-8?B?aWcrRmY2b2ZIRm5YVXlJeXZBY0dLR2gyaENQNHp3UkJjL09Zc1ZrdTRQWXFZ?=
 =?utf-8?B?RWJPWS9iOC9VS2IzNUdISFB0VWVGQjlXRUZxcmxPRGNSMUVEME5uaXpscjFm?=
 =?utf-8?B?VytUc3dURjNJdkN0WDNHNDRzU1dYUmpMSUplYXFEOWM2SzZadG1uRUJkQzRq?=
 =?utf-8?B?RExrdmxTS2RBSjhjdkJpZExzcGxXeDVLeG5xYlBhNzYrYnROTnNGdHViTkZ5?=
 =?utf-8?B?K3lPSVorQXFnSGFWdVB2ZzA2QUtMN05XaFdRTGlCYmdyTHZGMmxnZlB1UTFt?=
 =?utf-8?B?TTRnN0piR3puV3BWZlQyekpYN2U1QisyaUJRSlR5Z3NaMnBIWTluUDF6dHpy?=
 =?utf-8?B?aUcvTVhVcGRaV1UxU1hTRU9LV0M4ZXVFQjNVS0pMQWdpUklxRHU1R2duWVBF?=
 =?utf-8?B?SzJXRVltRS9SMURqeFJjcXpzdmpkQ0ZmM0hTbjBaYWpzVUN4RUJxTVE4Nkpk?=
 =?utf-8?B?cmFCaTdiYVA1NjlWanlNN0ovd2hoMWEwZ3h0bThsamtrMlJZWmR5dHgvR0FS?=
 =?utf-8?B?UGJMVDNlKzdNWGFGY3I1ei92UXNyS3FXS09sNFhlU0d0elhzNkVWbFJKeC8r?=
 =?utf-8?B?c1lUTE91bXM3U09oVmRyWnVyWUo5a2IwNFQ2N0pWdlBvWWFnSDg2dDVoYWw0?=
 =?utf-8?B?M0MrdXl0dVNYZFoxRWJpUVprWHhRRDB3Yi9BaFRNRmcyWjljT1BWdlhrTis0?=
 =?utf-8?B?NEVpN3VwZCtYaHFBcWE2RGJ3MXc1elhTclJxaHZuZFRWQklCYURjQ3BXeTBs?=
 =?utf-8?B?c2RCc1JmU3h3c3pZTWNadDdzbkhhbzlDWjBmeFdJZjBXdFFLajV6Uk80ejF3?=
 =?utf-8?B?RDFOcWFieWV6eGpKcHBYNXRJbnVZcnpzVERJcUtONTVyMGpUaEd3YXUwZERx?=
 =?utf-8?B?V1BTcmdCWGF5TW9sU3ZkUjhOaDVCQ0c2aUczUXpPRy9UOGxFS21YeDVSR2NW?=
 =?utf-8?B?WnA1c1A5QXNaSm1LNVpubU5hZ2VhaDBCRG92eWlYL0VRUm5jVGV3eHNEQitD?=
 =?utf-8?B?TUUwZVJPdEI2WjJ1NUs4OTYvV09lRlhiUzE0QmFneGNRUWNZYzhyK3BLd3FJ?=
 =?utf-8?B?NWorK3pvK2EyUm5GQ2FPdDNFb1labnh3NjRsUU52NnhETTl2MmhVVnZ6WDY3?=
 =?utf-8?B?U2dVTHNZQVAzbUVJbE54TFJRenVMVWhoKzNhRGV4Ym94b3pTREVCc0xINkVN?=
 =?utf-8?B?d3JSWFNBWUNNdG1OYTFJTEhWc0c5V280N3k2ZC9ISGNtcFNucHYxL1FGWExL?=
 =?utf-8?B?TmpBTGN3NTRQSFNsYzlXbksvZ0k3dGRDN2pJV3NvaU11dXB2MUI1VzR4YS9W?=
 =?utf-8?B?U0RQVE53MThMb2VBeUJlOTdKQ05rV3NlTDVqNHpWejNRWEFGYjVPR0N5cmdV?=
 =?utf-8?B?MmdyVUVGbUMwWTNKaXNtOEVidEhFbDA0WlZyamRHUS9CT1hVbHN5MmZDTWV6?=
 =?utf-8?B?MEVWekhta3MxSWwvV1NLTDI2WjNRalk4aWNhL25KNTVxQXlydmZNS1RKLzdN?=
 =?utf-8?B?bWlGOXprTzFsMXNLemFPWjIydFVlTEgxRVJCRjQzanZEMmpRRGh0bXd1ajJY?=
 =?utf-8?B?enVQNkNkbDg1N3AwVlV4TkoraDRreGY2dmZ1SlBZclhSbUh5Sy9MaW5acEQ1?=
 =?utf-8?Q?OfSZfcr5zpTRS5ZM0fcRi61rq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c4f4d3-f303-4010-ce61-08dd491b55e6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 15:06:31.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qujh3JZkFGwPRO+/5GFOJ+/qH7BTW3Lx6YA74KoWGVd6zf/M8vo2S7TMouiyswvqsOan9JtOCD4mTNCfl0A0Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

Hi Sakari,

On 03.02.2025 10:58, Sakari Ailus wrote:
> Rework embedded data documentation by removing the reference to the pixel
> data stream. The specific documentation of the embedded data interface
> will be elsewhere, in the near future either CCS or common raw camera
> sensor model documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index dc415b8f6c8e..8e1083417ae1 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -111,13 +111,12 @@ the sensor configuration for the captured frame back to the host. While CSI-2 is
>   the most common data interface used by such sensors, embedded data can be
>   available on other interfaces as well.
>
> -Such sensors expose two internal sink pads (pads that have both the
> -``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> -<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> -embedded data streams. Both of these pads produces a single stream, and the
> -sub-device routes those streams to the external (source) pad. If the sub-device
> -driver supports disabling embedded data, this can be done by disabling the
> -embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +Embedded data support is indicated by the precence of an internal sink pad (pad

Just a small typo here: precence.

Other than that, Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Regards,

Mirela

> +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
> +format to model the embedded data stream. If the sub-device driver supports
> +disabling embedded data, this can be done by disabling the embedded data route
> +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
>
>   In general, changing the embedded data format from the driver-configured values
>   is not supported. The height of the metadata is device-specific and the width
> --
> 2.39.5
>

