Return-Path: <linux-media+bounces-38247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50FB0F1A2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA96B1C276FC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD9F28B7F9;
	Wed, 23 Jul 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L6c8dSrO"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E7245021
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271482; cv=fail; b=algTqW7+d/Zn+AX2YrQSXj8GaEYqMwg3O11ypXXqv1EJZI8bjdr9IVELkCiqfS+XKY9zeQLSg7neg8oQCP7YK7V3mAoQasHRvZknsKX3fc0rNT0t9R353+0uV2hEYMOH7DhXPv5BQoIpmwShZ2zYNamQ3b9RDI360dqywmBGt0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271482; c=relaxed/simple;
	bh=gIfHfcLffc2dAczQ2n/mfZPLHSCP+3Xhin1SlRbrNxc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L7gv1r3+N+rH2S00eyRH1As3E6aQ37AhlArZdAxbAoH7EZ+N6ZaMOIX3PqoXQDTjo1LbD/GhIC2VOMXPktkZb3ZeDe3yFnQinzpBoZ+qH29PmkONw5XXZ+Vi3k7xfrBILJofILCy/zhmD0sv0HzoLM7rEu2Zj+VpgSbRbSHEjc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L6c8dSrO; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNTTN1EWFmRpII1uhJcQX7A8CUeT1zlKO3CjEIZECvt/q4IgZrB7ex+fezVl591mAWjxAUZm1IPw6TN1wng5UnC8kZOV/POUUM+opsw+68XALjV2x7Av4ZJfpu/9Ln33gp8Js7CegYW1eLnZK3VPE6aoZzDlaLCACtnHi/WryjLONe8KaxK8yi8XbAgqb8TSn3F3/xSJw/dlvvRaYEMjuM0HOZKk+FV40Fh1YhhsuNyyBR84ZGOly8aGlR6hRNi6qaXoVyYvyRhZuTs8alksMR8IEHggXXnDuVHelUvIRwriPJMJgN8il5yE++asKBYSrgkhmyJm043TL3zZGCVR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Noqp/vgcBzHkULYJeVo7FX9MCvzWSvLFTZx/RK0nZE=;
 b=JnWHZfM8qQU1M3lCRaCCqbFEtzmib/0nlQJXcqxDkysAkZXpduUqZatrP/SEItcQaxZAaeYoBxax+/C8tKEBlaCCGYofGKbMNIxTzV2WyVgQME+v3cH8HFvTNo87/44aofEsTRtsK4xTiOGNe889brd7OD23YsEVjlzWuv78YAk2TcE8YKJKiFCd7cmpV52cEVaclRtAfN+sdOpGDOSY1agmn4MxQCduWSuy2y8K5O+GdcC/eoyNXUIaTirBpi6i7QUE/GCuOo3TCMJbMsTj/my310DFsjJBeaoLLG3oZdYZyoTen15kP2UdmOurlzZ7vD+gBDZIQJzvouRIScWNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Noqp/vgcBzHkULYJeVo7FX9MCvzWSvLFTZx/RK0nZE=;
 b=L6c8dSrOjfEXTDU1ApjqzLssNgfpbuOyoYEkqwjvg7OpTeKbpq4FOfZO5l45VnBfeujJYQLtNPes1r+UCkf1d5LSXyURyTIPE+hrHl11OLiO+3LmgVKF63RkbkMtB0gry/ErkRU5gqKhQQxhchLKAW1nfaj7T/Fhp7nne54Q7/Ov9e5ATql15pZUP5dl28L74o3jH97C+CoB+FrWZA0syoRWWE+MvqVALBVwLtMz2RiJvURZQltS1byU9lNDYAJBaQPG9Frwh4ezUN8I32XtgwJawnOgvdWHf9I7XZZSg6qR3zDrMA/JN4FN/niF1x7yv7gYdxf74q6S6M8YXO74Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DUZPR04MB9981.eurprd04.prod.outlook.com (2603:10a6:10:4d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 11:51:15 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 11:51:15 +0000
Message-ID: <f24e58ee-c027-49b7-bdd6-99e374177be1@nxp.com>
Date: Wed, 23 Jul 2025 14:51:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 21/64] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
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
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0056.eurprd02.prod.outlook.com
 (2603:10a6:802:14::27) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DUZPR04MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: 28de96b2-8041-4314-93be-08ddc9df3a6e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QUsxQW90aTg4OEk5dmtJY1lLTEdjSFhKTStTMUo2VlF3azZ0cHJyOFQ3QXdJ?=
 =?utf-8?B?YjFoTVkxVFNUY0hRU1FnYTVDbC9rZUFLQmxBOWxvcjZXNmFtZ2hmalFNODRm?=
 =?utf-8?B?QUVzZy9DNHNpQTNKSVFDZTFlWWtIY3lndG5PV09LeHhZdDZGYlMrOFdTL084?=
 =?utf-8?B?UzRkRllEakt1dzdxT2paQzdXdTFhMjRWZ1lNUlpSREZqV09PQzl4ZTVoVVdQ?=
 =?utf-8?B?NnBjVm5GRzluOGtkd2picmhIWEx6SGhtV09ScFVhZG5ybTNuaDJ0SWZNU2Jz?=
 =?utf-8?B?c2hhOWRzRkViTUp4VmtSQktZd0NHZnZRbmFQTFFUUGNHZFVTOG5jRmsxWUdU?=
 =?utf-8?B?eDdESzlWWGlJc1NqT1lHVUxnK3VyWWFFdzgzQXdyd3NQYUorVDlOYVkrbURT?=
 =?utf-8?B?dDBvbmduOEczaHpBRkpCSmdSSFJwTk8xc0JVZ1BiNzBCQm9VcXByNVRPQjBi?=
 =?utf-8?B?UldJaWtkeEtoTkN1QVlWcmdKUEgzM1FsSUFKRWNDS0o5TGdicmc0aTJIWEZ6?=
 =?utf-8?B?Z1ZGWHpYL3Z6Y3ZNaDNZbjM1dFdhKytnQUNWclNFRjFaM3VibXA2dUNTNEZv?=
 =?utf-8?B?TjBZdlpFYUNhaW9XM1NyV0M3YzFaeXkvWUFZbmlXdTk4dGt4RHdrOEEzNzhu?=
 =?utf-8?B?VDRVVWV1K1RLUE55NzNxY0F1OFNaQVdpWFUwbUdBdUxlTzNMeGhYWTRLaml5?=
 =?utf-8?B?Z1ZkVkVnYlhUYlFxZ3RybTJnQUFZK2FNZ0pHWUZCNmNhclozalVOWFVSQUd6?=
 =?utf-8?B?NGx1UERWbVIvbENEWWZPUkwwR2JLcHhaQ01FWFpGRExEbnRhWjQ3OGc0OHBw?=
 =?utf-8?B?TWpyc2FuTm5RcE5VOG5jbFI4ZEV1MnFXalBVczlPazlqNlBCVTZvb3RtZHpF?=
 =?utf-8?B?R0YvWVExQitMbzJXVXpRNTZ3WWVtanJIcTcreTJ2N2o2S2svNVRxaVZDRTBC?=
 =?utf-8?B?V0FpZWZuZ3RSOURZWG56Qk9FR3J5T2EyYy9KMmg4ZXM1L0xZTXFhVzcyMjRk?=
 =?utf-8?B?YTRwQ3NIdnlPQU8xcmE3QXZka004SWNpNXVPMm5VRjN0NXJoenBMV0krZmVL?=
 =?utf-8?B?NTV3NUREMlNkK215QzBPQzVUS0VDMnUwcDhFUEEyRytBY3J0ekk0Vm9oc0Fq?=
 =?utf-8?B?TjYwcDlCVlUzb092VU1hTnZpdTgxaFowTVZmc1Y4cjRXeGZ1K21UdkgwUkxj?=
 =?utf-8?B?a1dNWWpXNEdKQ1ZqaEc4RHdzd1BEVGtheVZ1dHNEc3d1U0tZa2oranJZY2hH?=
 =?utf-8?B?ak1Lc2FDNC93SWk5eGE5RnN2aXcrZ0FvUGFYeGF5L2h4NnEyUkQxKzRJcFpr?=
 =?utf-8?B?bjdTQWRZVnFYL2Q0UU1kN2R5NXRpWTRwbTF4MFpOQWs3cW9lNldpWWVWT2dC?=
 =?utf-8?B?amIxT1RjbzRjNHhOV2puS1BDNUZGRlhEbFhnY0VNNjlhd0ZuT25OOHl4OHR0?=
 =?utf-8?B?L0JLVGNhOVg2bXRua1NqTktaUDJndEtna2hXY2VEU3NDMDF0Smc2QzhjTGI3?=
 =?utf-8?B?Q0pmVlkyNjE0bUloRFJyb2FpbjJmbk8vREFjenNRY29GaHdCaCtFbndpNzFz?=
 =?utf-8?B?eU0vS0NuZ25sYTExUk10TVdKb2RUODBTTFcyblZ6enBVZndCRWZGcFRwNy9H?=
 =?utf-8?B?S0hzc2MrcGF0WThYdWtBSEpRc3dVUzJ1ZkRXVFlHcERFQWRXOWdKRHc3LzFj?=
 =?utf-8?B?aXFLb3JySXN3TmFLbkN4bmZ2VDIxTlFGZTYyNmNTTDIyTTlISUY2QTJDeVF0?=
 =?utf-8?B?SU5Pc2s1ZG9aM3B2cFROSlh3bWs3akF5Z2xTOG5QWlZxVloweE43d3phTis0?=
 =?utf-8?B?WTV6enVZdTRFY3NGV3JTZ2xTbUpLZUhiemRra2xzY2J2ZURYVGRBbkt4Wkg4?=
 =?utf-8?B?RDdaMGdPMFlUZ1gyQjJsOUsxNnBic0NOeWVYZVNjYXE5bXBLSHorY1U5NWxP?=
 =?utf-8?B?SHpYakZLaExvbDI4eHZqM3gwRkN3bmIrNXFQOUt2MnZ6MWNXZ2xucjE2K0ls?=
 =?utf-8?B?NG5SS0JRTG1BPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUlnaklnbXFWenhRZVFMSmozOU96UWdnK3pkZ3FSekhNcmxsaVN5Z2dNekp3?=
 =?utf-8?B?NGwra3dpRGUySythV0VHbG9nQlViTll6Z2VOU0NwN1I2MWpHM1pGbTFKa0tp?=
 =?utf-8?B?emlrc2l5bERMdnJKalo3SndRVlZWSWV6SEdQdkhsTWI2aG5hWHM4K1R3cjZp?=
 =?utf-8?B?WlU4aEluR1lram9SWEhwa3VxdUhaMHYrd0d6Q2RhQ2tPYjlhSGxhR29SSmFJ?=
 =?utf-8?B?NTR1UWk1dTNFUUVxWXc2S3pCQWQzN25YQy9iNTR0VUV5MVlvYUFtQkt4aEJ5?=
 =?utf-8?B?am9PUjhSbytQbzdIV1lOYjJZdjFGZDNPN1BhV2ZUekQyTHlQRTk2bk41cDcx?=
 =?utf-8?B?bDlhUUZUTGR2eGJpamR3UkFiRjhxaDBTMEtFTWMvWHFJZXpwTGZ0czRveDVT?=
 =?utf-8?B?OU0rVUZyYVZtYmtETkNPTTdLbmxOeXYrMmZhWGI4aGRQeHR1K3pEUCtLamZR?=
 =?utf-8?B?TnVSbnZyM2tweWdNN1pmZy81U05wL2w0bWM5eDMzZnhTbENJSThKSENDSCtq?=
 =?utf-8?B?OUxOUDVWcWN6cHlYSlZ1Z1F1cElrSSsvdkN1LzRoSFVNV3dwVlJraEQ5d0dQ?=
 =?utf-8?B?NUpUWWlXamlDOXZQUTY1VitybEwrRVpJbEtCSzVXbWgvdFJ0Q0x2M292eCtl?=
 =?utf-8?B?U3c1UUlia0xHWkFBU3g3dGlpbTBZWWlTMmhCa2o4N3lCeGErZUlmZElTbTBY?=
 =?utf-8?B?RmE3dUw2VFM4eTYxRmx3RGQzbm4ySlZ6V2xtS2dLMEtEakVLWHpKZGlQV2Va?=
 =?utf-8?B?Yk81VXhuWlV2aVpzSjd0Sm9vK3F0dmpwejc4ZWMwc1J5YTQzL3E5MVFreWt5?=
 =?utf-8?B?RDVuR2ppZ0VhczFPamN2NXM0SWlJb0wwOEUzMm42Y0Y4Wnk4RURML0U0Q2Ix?=
 =?utf-8?B?bnhBalR5YzBiYmVOR1l0aklQcjhJT0JoNWFyWUJCYk1iUDFFR2NBbnlNSk5M?=
 =?utf-8?B?clJCRGlsSi9IRmRrbkJycEhZbW9uWGpqN3ZBQXczQTdUZ0tRUkNVYVJZNy9K?=
 =?utf-8?B?RHRITXcxTVN2blp6VEJBSXV0a1JvU1RNV2ZXNnd4aU5BdmN3b2Y1QW1uSWcx?=
 =?utf-8?B?VWdKcGltZzN1K0Y5Y0JBSkVJR0c4Q1gzQzBtVmRtbTlZMXdxcEp2c29aZVdP?=
 =?utf-8?B?M21Vd1BUK2lWV2h5S3dwTjZYTTQ4aXE3Rnp0TWlpVTE2QUhaVGdwUzNILzlw?=
 =?utf-8?B?Z0RyeHRrVEtQeTVrVEtLT1NyY3M1NUYrSHRvR05peTl6RVY5QTJqTjJYWkRR?=
 =?utf-8?B?QmtGZ2REWFhuWHo3MUdKcm9Ud1B6aWs4cG1oOEQ3TkdnbnYwVXpxYXpwckRS?=
 =?utf-8?B?VXQyMWYxVlF3cmhuZi9XcllUamM1RElVUkZ1cGlwdUJtUGd1QUF3S2NwV3B4?=
 =?utf-8?B?eTZPZWREbC95b1hkcTcyMG0xNUtXSkxYUVRWR0N6Sjd2ZUlKNEJhc1IvZUVj?=
 =?utf-8?B?MTBkM2ZxTEtEVndQcmFEOWRqOTlGTmt1Y0trTFg4K1g4TFgyNjRQcGlhTVFE?=
 =?utf-8?B?NWpITGwxWnNGZ29HRWduOTNSeEFWYjZ6TTVweGYyT1dzUmVEM1V2dWNMTGo2?=
 =?utf-8?B?REkzTU95QVhnUmRtTzJ0MlZSYnBKdHROaGxKTC8wUEpoWUZURE1COXNSQXIz?=
 =?utf-8?B?MDJIR0E2YWFxa0NVMnlFUVMzVmpLbGRta1REYnNuQnlydXpFVlp1ajllNk5z?=
 =?utf-8?B?QUZvQjVhdmIxVkx5Qk40dHA4QzVXdXQ1MXd4L2Q1Q1R3ZGk2allsUC9VaTRi?=
 =?utf-8?B?TnhXcVJBZGtuUTZndlhTRk5qSzJnenBVb09LM3JRcHhPSkplelVXNUhTOVg4?=
 =?utf-8?B?UGFHMDhaZXgvRzlaOWZmTk9sTEFXYzdtYnBtY3VNZkNTSGYvSmlKNnh3YmJN?=
 =?utf-8?B?VFBiU2s2RFpvODhKVE1nUlZGUmROc0JTcmp2R0V1RXdlVEp1bS9hVWd2aEhG?=
 =?utf-8?B?TVlDVlMvV1ZML2R3enQ2Q1JFWXgxY1RtNXpNZkpTZFF1RnRBUy9FOUV3eTRr?=
 =?utf-8?B?cEREeW9YZlpZQXNUS2k4Z0JHUnV2S2lhM29yUkgwTUNmamdzMzR1NU5GZDlE?=
 =?utf-8?B?ejBsRGlyU3M4a1lNQytuWjhDNWg0OWRjelZWUnh4anU1VlJmWmlvZWovNWN5?=
 =?utf-8?Q?zHv4hf/QhIgZ0iopoKLcs116a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28de96b2-8041-4314-93be-08ddc9df3a6e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:51:15.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGWTyKfMXhhoNpSQgHXVPEcEtbeU3eIFQgeEDNYJzQu3qihsYdrp5PXtBx5PFSgcvW+7z9lAVd5k679nm5DNMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9981

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> The metadata layout control defines the layout of the metadata on the bus.
> It is used on sub-devices that use generic metadata mbus codes on at least
> on one of the pads.

Please replace "on at least on one of the pads" with "on at least one of 
the pads".

Is this meant to be a read-only control?

Regards,
Mirela

"
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
>   include/uapi/linux/v4l2-controls.h                          | 2 ++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -145,3 +145,9 @@ Image Source Control IDs
>       of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
>       ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
>       ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> +
> +``V4L2_CID_METADATA_LAYOUT (integer)``
> +    The metadata layout control defines the on-bus metadata layout for metadata
> +    streams. The control is used in conjunction with :ref:`generic metadata
> +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> +    data.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 9ec65998a8f7..a7ea380de5ee 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
>          case V4L2_CID_COLOR_PATTERN:            return "Color Pattern";
>          case V4L2_CID_COLOR_PATTERN_FLIP:       return "Color Pattern Flip";
> +       case V4L2_CID_METADATA_LAYOUT:          return "Metadata Layout";
> 
>          /* Image processing controls */
>          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 740bf8544446..bb8b0b174a43 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1233,6 +1233,8 @@ enum v4l2_jpeg_chroma_subsampling {
>   #define V4L2_COLOR_PATTERN_FLIP_BOTH \
>          (V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> 
> +#define V4L2_CID_METADATA_LAYOUT               (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> +
>   /* Image processing controls */
> 
>   #define V4L2_CID_IMAGE_PROC_CLASS_BASE         (V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> --
> 2.39.5
> 


