Return-Path: <linux-media+bounces-56548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EAoF4B5vWkA+QIAu9opvQ
	(envelope-from <linux-media+bounces-56548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:44:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AF2DDE7E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DADF30BFD47
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC24E3D5669;
	Fri, 20 Mar 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PdzT5CTN"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1563D47A9;
	Fri, 20 Mar 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024198; cv=fail; b=cAPZYTB10AuyAoB1z1E5ICm0q9KchSLvG8UyBitZ6tPuhkoVJ42QZF46Rbam5lstD3dC5455u95inEmwiwTRSxsZ9/NJw6a1POGb791Nhp3UpvcM1RDH3lDW78pgBnTcygZ0xFwIDFax8sw7ytV14BeBefcs41yK68u3oJytBPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024198; c=relaxed/simple;
	bh=s8ULuzme1SVuQeJHKzcCLvoG2HniD6wx34y3i23/BW8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r3kKBaoU5a29ki9LECabQEUYIXCRKTQSbyTrvmw8YjAEitTdOdBAnB7/Xco2gDgtwA2jDAPEeaHiEQZrO34htjwhK2aY5Fcgy8r/o735QUgE/ZBLxKJlEg4rSKKOJhjV7ROTBctc5QzEZvaJaXeeWRo810cfBl6oBVd7XlkyLU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PdzT5CTN; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmtnrlqNUXcomwBW31Nd14IdLdCCM8Ojyr8hRtnBTbPTmMNDZGzs2WoelhdDDGeFL2a6R3xK3cgMFGtnktK2vb8qRA33B9FUuuZko89W8AU1CI9ox5EPxtKCMPmeYfOP4eJNCt3NpnUydFNXRjBOnCGXssSFtFCsSVMD/T2WrNDjTDS3b79aXaI5aV2iz7vE3C2qkfnswR0CWpsz6qPHlXJobPb9d+kRVGlzt85a+LaN5fxbZq9VjgBfxjN7lY7OHeoyCg28Bmehe3u5+ZcjZON2soVExs1qtgD37x3FnScAb00IAgDhUPY52AwghOGgIr5AjFOkhrKsFo+bViP9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZWrcVSQag86LxIt1brSu/HYSS+dzZ6IaBiyr9szbqg=;
 b=G+WvWcJdgHHVxCkP+Vcz2hCkEIF4QBxnZM1Kz2/YqQcdcH7B2omz6FGFoiVYx1UQWHb8AFCWv1uTDrICi4MbIUGI2WgtZKBzQlq0SOQ4VfQz92J5x55suOEtZ5PDtUKt6/kjHrcBg8Vupy7GbV+NDQc0Lw1tfn4zNguiT93RfUoHIR6yQkLysIWLAmBsNL1M0RQTFIh4PojfuLDi5f8hKdeaNeueLF1DiaX6bDJEE+Jrrn4HEjExHzYlmPo38eYM36R0r8rguMDRgUqOITXptlFMvXt5JzOXhN8U6HQ5e+irsAVCaDtGl5dXwdjbavjo/y5LE0hxdm727ONgi1oWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZWrcVSQag86LxIt1brSu/HYSS+dzZ6IaBiyr9szbqg=;
 b=PdzT5CTNg4YH3TudKuUhFndspgflrQdnq08VecLlEIfkwnLrSJYoHlnPKhKFaie4juJPPQaHhV83DFaVobeKsQGWvZqdBfAdonDNTamhgCaW7fNVI3V5MPUwRePisVYkJ278+geOZrzqcAX5m56mweHgiPrZJIEUdZWVNRx9ryywcTCT2lcc4nQFeOO/w4xOrRYRFjTzzntpxm1Ue9crgYtBlLiO6w0lp9ctEeVOj6qLalVH83zbpBiJu9Vu7dc3n18DEuGiEsNXE+pgC0BRT7XILJAE8PH7IFdFfYqzbnP9IfTRpiLr6tTUDQlcvGwYdq4Wh/Ym/HurPwPltUQvIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AMBPR04MB12282.eurprd04.prod.outlook.com
 (2603:10a6:20b:720::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Fri, 20 Mar
 2026 16:29:48 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 16:29:39 +0000
Message-ID: <1d1b20e9-48da-45c4-82b9-8671959522ab@nxp.com>
Date: Fri, 20 Mar 2026 17:29:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com,
 peng.fan@nxp.com, frank.li@nxp.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>,
 Anthony McGivern <Anthony.McGivern@arm.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed> <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYRSMXHjFC0M_DM_@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::7) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AMBPR04MB12282:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1deaeb-1d7c-40da-e62b-08de869de1cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 CcFr9CGhNJ9UJ0RAzFoS4JEukiGcz7yYiUNB1PbmMs/a/2ac0VPKcJIGnA6YhtO0Kd6KWAHf6z2rssmKLcHlYa6M4jCo9WYmtaWXNsP+chf5Yj8yD9P910Y/7/OPlmdU7bOrAlrSm6hWpOWLwzK0fx6d49iuprJ367snHJU/GwMREixjppyt8il3ddlBB/NBBoVHEUuOh1qiroXUaYn2r7+MEWM22109WudjtWj0HkjUPbNb7z0ugbbaR2NuXBNUImbGGA3V4JxzXfJorwm/Dz9wKFXxYoK4y3jmLBl8TF/il+Rb8fv2+/Ptc/3EvyyTAb8BPBzq74tM/mecyh/0JNZDJvW4klusJU1k9o0ypSgvJsSFGmNkliXu2yhcvzOWZK1Ga9HVJRhxQVhaQs0feONkdsuP6KGe982bUa+5nUPjIsUevP/EHtkbz+BN2rerBNyp5+soYejFpSCbiGojeBmcGsrUmcLHhm6NjlXG4+n6Kpn+aN6VLLwrfit5DBJRTPbbedmBMO7BOona5eAAvbaMmEfFDPwn76eI5V+i2boT/pBlO2YEYjS3Pm0ZPAOz5wFoWKOuUjobpc440WMsg0NEXMQCE7c0SU5KQ21z+mk+o7BBqVpLU6nLZ/O/V8UDlHOfPgVE5XFxdfP11/CX16gDGy0QCf566RkZ9tP1uJb8YpzI3Dnbl4OsfJJq5wEUbiUu+rIDPxz1pgKdTB1orcWPxIjT94CnaWKoHilfh7g=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S0l3Y0pPazE3LytyNklSditVT0JzdkRBQmIyK2hhbjF0a0FZSzUvTWFmYlA1?=
 =?utf-8?B?MEdlVGVOQkVkeWJoa3VRdWcvVDZGWXlCZlVMS252eEhpZU50Q3pNZS94OVFO?=
 =?utf-8?B?cHZITHRCZU14VWU0SzZ5aUxCbmUwZ3NzSkxxL0JtbnJNRG5DdHdNdzBJK1Zm?=
 =?utf-8?B?QTJiVnVUNlpMUk92QlVHbzV2YmpRV2ZneTBMT3piYXRaVFlYQWhIcmpINmls?=
 =?utf-8?B?MFVNV1krUDM5eU0rdzlCRVJIZk50Z0FHbk4rc2FsUlVJT0lieWkxVHJIRHE3?=
 =?utf-8?B?SzJLclI3NEFPUTc3Z0sxa3JkS0VyWWRDUGFOb0dCMlBzRUxoWC9MN0tiZDJT?=
 =?utf-8?B?ajB0UStLTEoyeUhnQXRKb3NaQ1NVTHhtaGJwOXR3Q000RDZRME90bVkzMDc5?=
 =?utf-8?B?SEVkLyszZW9FbUF2Nlp0WkpsWjRJNXg2ZENwUkp2VDljWWUzaTNLNkJiTlE4?=
 =?utf-8?B?OHVUM3N4RzZJOFdHSmszRlVLZ1pMZmxPV25TdU5lK09iVUlMTGVpSzdsSXlP?=
 =?utf-8?B?bGZFQlA5TlZkZGJ2cXdjVkNXd1p0NGZBYzh1WjVjWVJWVHNhZTJmTXg4SFpE?=
 =?utf-8?B?REJ5U01YM3FuN0gxeVhOaVhhRU9OWDIvU2Zjc21jRVIvVnc0Rld6SnBqbVRu?=
 =?utf-8?B?Q3BKNnVabHRPL1ZVY01jLzN5Rk1tT3dlMjd0ME5YNC9aQndxWFNMQlB1RnFs?=
 =?utf-8?B?SXdCZjhJQzB1RnZycytBSEI0THgyL2RJMy95UXFwNTUzcjdOR2cxcXg5Wksv?=
 =?utf-8?B?Ritwc2YvUFl4cmlHTE9haEw3V0t0T2xXZDAyZEpwT1NnQUtrT00raGRQL1Bh?=
 =?utf-8?B?RU1DSGxmVHhBUnVQNGpWekV0RTJ1d2REbk4yVXMrM290SzlIekJIQktuYUtT?=
 =?utf-8?B?aVRkTmo3R2g4Y3Z5YkJaNEdOdzFESDZQeHV2M3NoYWNBc3g1S0kxbkhuYWlm?=
 =?utf-8?B?QXRvamxUVzVkb1lOeDNjTWNzU3E0MUV6NXhLb0cvMTZ5QnNJZE9KK1lnOGhR?=
 =?utf-8?B?UnQvN05hR1FXMTlPM3YvT1VSR0RseDZRWFY4Q0F2ekNRNVZuKzVyZGhVem93?=
 =?utf-8?B?dmtCM0kzaHU0NlNNUU0rZzBGSmJPWFM3N0RhdU9iMzdhNWowKzdsV0FxVTgx?=
 =?utf-8?B?Q0JWbWpvRkszbVg0Tmw1K1RYeVZuMExYTU5xZSs0RFhkQXQyeEt4SXZFeGVX?=
 =?utf-8?B?WUt4ZURaQ0RaNGJSOTRlYTNaNGVwYUoydGNBaWhmVHJpK0ZKWHVXOFhjRUp1?=
 =?utf-8?B?ZWoxLzMxRXhmMVp6OUNObktSMEJjVm9vUVI3MWx1RWNYQVlueDVNdUVXbjJB?=
 =?utf-8?B?SGZkbi9kTmlnQnI3cy91NHEwSEs1dGR5K3A1UEo4MWpRUklKVE1RNVp4eTJa?=
 =?utf-8?B?RDU2cVBpNWM3OHk3emR6TDFBSmw2UFpJSG9qdU9tc0hOUGhwbENBMTNaeE1j?=
 =?utf-8?B?UFJ0YUZwbDlBYmk2aGJmUHFIQXhyWkpFR3MyVHBGTkxKejVuRVh4M09CWTVQ?=
 =?utf-8?B?cjNvZFlydWpTSy9lRHozb084aFRxZnBaZ1F0RUQyWW9vNlJRck9JRi9TbHJY?=
 =?utf-8?B?dEh6Vy8vNG9VbXBLVUFhbS9UMzlPV1dHelpSaDhzcVpNN1o0dUhkZjVaSm96?=
 =?utf-8?B?aWt3RFZvcDk4akozYzZrK2ZxdW5YNlZoUEljQXhWNnpVVWdEVEVoYVZDK2tL?=
 =?utf-8?B?K0w1Y0dVSFFoZkZPNjhZQ3ppK2hwcmdWYUhoZ2h0YW83SU4vQ2pNa0hISHQ4?=
 =?utf-8?B?N3ZDQ3pycXVVdUdUWHpYV3UzblFBZkwrcVlEeUQvNS9ranFld3V0ajdoN1hD?=
 =?utf-8?B?OXpSVFJkR2tvazc5WTFsU0lRYW55WldLZE9EZTQ2TkRmTGFYSTBIam5XNGxn?=
 =?utf-8?B?QnJ1WlFSQnBlYjVwKyt4dlB1U1N4dXdMcFAvRTJmUS9odnhMUXl5SktWWHJh?=
 =?utf-8?B?VXBxMnpVYzBZemp5aXZqTEp2YTZrOWtRTzkrekttYjZxdkduNWpZRzFkS2tS?=
 =?utf-8?B?cENEaGM3V0tVeUhVWUo1WnpDUEhvbmwrdDJMQnhrY2l1YnROV09qSkorVU42?=
 =?utf-8?B?cENXNE9HNExjS2F1R0ErUUNhR2pRVFFTdVRISk50Mm9ZYUdHMXU2YWllUkNR?=
 =?utf-8?B?SG9EV0dxOVY4WEQ3WTI3SEFzb3A1VXMzT1lZN1hpRjJYUlZDYnNaekcxU3BU?=
 =?utf-8?B?cWUrUEUvNndIZUp1UDk0ZE8zVDJFdGNxQkh3Zk02RlFxbGtoaWdKcFNmdUQ2?=
 =?utf-8?B?MExvcmVRV3I0ZVBDa3dmOUZKdGIwcVBLRzNuUm4xcVA3eVJ5d25ZaE9XSkoy?=
 =?utf-8?B?Z2xXWnVycFBRa0szKzhyV0FNVVdvZVdNYk9uS3FDSy9EcHNSSVZCQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1deaeb-1d7c-40da-e62b-08de869de1cc
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 16:29:39.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTiClCvHI88/38jJCIhfGKN87XBxaGY0/Uk/R7espil5jytjJJJRa4qbRQIBexae5Mf6bBVWC4Np5bB0kNUU6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12282
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56548-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,linuxtv.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,diagram.dot:url]
X-Rspamd-Queue-Id: AB3AF2DDE7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

Quite some updates regarding this RFC after further analysis.

Le 05/02/2026 à 10:40, Jacopo Mondi a écrit :
> 
> 
> Hi Antoine
> 
> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
>> Hi Jacopo
>>
>> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
>>>
>>> Hello,
>>>
>>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>>>> Hello
>>>>
>>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>>>> Hi Antoine,
>>>>>
>>>>> Thanks for your response.
>>>>>
>>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>>>> Hi Michael
>>>>>>
>>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi Antoine,
>>>>>>>
>>>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> This RFC patch series introduces the NXP Neo Image Signal Processor
>>>>>>>> (ISP)
>>>>>>>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9
>>>>>>>> family.
>>>>>>>> The series also includes updates to the generic v4l2-isp interface to
>>>>>>>> support extended statistics required by the Neo ISP.
>>>>>>>>
>>>>>>>> The Neo ISP processes one or more camera streams, converting RAW formats
>>>>>>>> into YUV or RGB outputs. Its architecture is largely influenced by the
>>>>>>>> PISP driver. The hardware supports up to eight contexts, with three sink
>>>>>>>> pads (main input, HDR input, and parameter buffers) and three source
>>>>>>>> pads
>>>>>>>> (RGB output, IR output, and statistics metadata).
>>>>>>>>
>>>>>>>> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
>>>>>>>> parameter/statistics buffers are supported through the generic v4l2-isp
>>>>>>>> framework, similar to rkisp1 and Mali-C55. The driver currently supports
>>>>>>>> M2M operation; direct CSI-to-ISP streaming is not yet implemented.
>>>>>>>
>>>>>>> How do you envisage the direct CSI-to-ISP streaming shall be supported?
>>>>>>
>>>>>> At this stage, this streaming mode still needs to be evaluated on
>>>>>> neoisp. We should follow the integration model used by existing ISP
>>>>>> drivers to avoid duplicating solutions.
>>>>>
>>>>> Fair point, but I have had the impression that there are not many
>>>>> examples (if any). The rkisp1 driver, for instance, only supports inline
>>>>> mode although the HW should be able to do both.
>>>>>
>>>>> But any pointers most welcome, I won't claim I have the full overview.
>>>>>
>>>>>>
>>>>>> Below are my initial thoughts on the specific points you raised:
>>>>>>
>>>>>>>     - How shall the final media graph(s) look like?
>>>>>>
>>>>>> The media entities would remain mostly identical, except for the absence
>>>>>> of ISI. The topology would be a direct linkg from sensor->csi-
>>>>>>> formatter->neoisp.
>>>>
>>>> If support for inline mode has to be added later, the ISP will need to
>>>> be registered in the same media graph of the CSI-2 receiver to be able
>>>> to link the two, right ?
>>
>> yes correct.
>>
>>>>
>>>> How do you envision to control the ISP operating mode, because I'm
>>>> afraid if you register the ISP in its own media graph, you're locking
>>>> yourself there as implementing inline mode would require a different
>>>> media topology with all the implications on the rest of the userspace
>>>> stack.
>>>>
>>>> This might not be a problem if you know that the inline vs m2m mode is
>>>> SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
>>>> other as m2m. In this case you'll likely need two pipeline handlers
>>>> in libcamera, but if that's per SoC-line maybe is acceptable. The fact
>>>> you suggests in inline mode there won't be an ISI makes me think this
>>>> actually depends on the SoC design ?
>>
>> Actually, this is not really at SoC synthesis time, neoisp HW does support
>> both modes, that is configurable. But ISP HW can run in a single mode only
> 
>> once it is configured. Streaming mode is tightly coupled with CSI HW, then
>> ISP cannot be used in M2M mode with another sensor simultaneously.
>>
> 
> Yes, my point is trying to understand "how it is configured" and what
> your expectations are.
> 
> Will the board .dts (or a camera .dtso) decide how the ISP is operated
> by defining its endpoint connections ? Assuming with the same SoC both
> inline and m2m modes are possible, without differences in the SoC
> design/integration, will users of the same board have to modify the
> .dts or load ad-hoc .dtso to decide what mode is in use ?
> 
> Then, the question of how the media topology will look and which
> components registers what has to be clarified.
> 
> Let's try to make a taxonomy of the cases we have in mainline (or on
> their way to mainline).
> 
> In the mali example I mentioned, the operating mode is selected by the
> .dtsi as Mali can be integrated either inline or in m2m mode in
> different SoCs. RZ/V2H in example, will always be m2m as it doesn't
> interface the CSI-2 receiver with the ISP but rather interfaces the
> ISP with a companion chip the performs memory access on its behalf
> (the IVC). A different design that incorporates Mali inline will
> instead have to interface the CSI-2 receiver with the ISP with
> internal busses/glue logic and will then have to described this in dts.
> 
> This is fine as the ISP integration is different and then having the
> description in dts is legit.
> 
> The ISP driver unconditionally registers an async notifier and the
> downstream component (csi-2 or IVC) will register its async subdev(s)
> which will all appear in the ISP media graph. This is possible because
> the assumption is that the CSI-2 receiver (or the companion chip)
> won't register their own media graph.
> 
> The Renesas V4H example I mentioned is instead different. The ISP can
> be operated in inline and m2m, on the same SoC without any
> modification to hardware and to the dts/dtsi. It's basically a user
> choice we defer to runtime.
> 
> The V4H already has a component that registers a media graph: the
> CSI-2/VIN block which is found in many SoCs of the same (and older)
> generations. The ISP is present only in some SoC, but the CSI-2/VIN is
> always there. In this case, to support both inline and m2m modes, the
> VIN registers the media device and, with the trick I pointed you to in
> Niklas' code, the ISP registers a subdev in the VIN media graph. Then
> the inline/m2m mode can be selected by media link enablement at
> run-time. Now, inline mode is not yet supported on V4H and there might
> be dragons there, but at least, both modes should be possible on the same
> SoC.
> 
> On the other extremes we have the RaspberryPi PiSP BE and RkISP1.
> 
> RPi knows the only SoC where the PiPS will be found is their one. The
> ISP cannot function inline and will always be m2m. In this case, a
> dedicated media graph for the ISP is the simplest and cleanest
> solution.
> 
> RkISP1 instead will always be inline only. It registers a media device
> and an async notifier, the connected CSI-2 receiver will register an
> async subdev and will be connected to the device tree endpoint of the
> ISP device node.
> 
> What model is the closest one to the neoisp integration that you
> envision on NXP SoCs ?

Then the closest model is the V4H one I believe: we both support m2m and 
streaming (inline) modes on the same SoC. I tested the trick you pointed 
out, and let the formatter sharing the media device (owned by ISI) to 
the neo ISP, like renesas csisp does. It registers as expected, thanks 
for the proposal !

I think formatter is a good candidate since it is physically connected 
to ISP through a pixel link for streaming mode. Moreover, I propose to 
create a dedicated pad b/w formatter and ISP and keep the one b/w 
formatter and ISI as it is, so that in future we can configure the 
stream format which is sent to ISP, and the one sent to ISI.

I also tested the streaming path can be added in device tree with 
endpoint connections between the nodes, so that ISP can create the media 
link when it registers itself to the media device.

Thus at runtime, if userspace enables this link, then neo runs in 
streaming mode, otherwise m2m is used.

If another SoC in future doesn't support streaming path, the endpoints 
can be removed from device tree, the ISP would stay in media graph 
anyway with m2m mode only.

Do you think this is good approach ?

> 
>>>
>>> One small correction after some more research:
>>>
>>> we actually already have a pipeline in libcamera that supports inline
>>> and (will soon) support m2m: the mali c55 one. My take on "probably
>>> need two pipeline handlers" was not correct then.
>>
>> Yes, I saw your patchwork on libcamera about this coming upgrade. Spent some
>> time analyzing it ':) Seems we are quite aligned as per my understanding:
>> inline mode (i.e. streaming mode with neoisp) _or_ M2M mode using IVC video
>> device from Mali. Is that right ?
>>
>>>
>>> As said, Mali-C55 can be integrated inline or in m2m mode and this is
>>> decided based on the device tree endpoint connections.
>>
>> Good. Do you have an example available ?
> 
> It's in mainline, but there's nothing exciting there as the assumption
> is that there will always be a connection on the first endpoint and
> the driver simply registers a notifier for the connected async subdev. If
> it's a CSI-2 receiver then we're inline. If it's a companion chip
> we're m2m.
> 
> The libcamera pipeline (not upstream yet) inspects the media entity
> function of the entity connected to the ISP sink pad#0. If it's a
> CSI-2 reciver we're inline. If it's not, we're m2m. Based on that it
> operated the pipeline differently.
> 
>>
>>>
>>> So, if you know neoisp will be integrated either inline or m2m in
>>> different SoC lines, maybe deferring it to device tree is good enough
>>> at the expense of a slightly more complicated pipeline ?
>>
>> As said, SoC/ISP HW does support both modes. But I think that the selection
>> can be done in device tree too. So that after bootup, a camera will be used
>> only in 1 mode.
>>
>>>
>>> I guess this has implications on the bindings definition as well..
>>
>> Most probably yes. Can this be done as second phase once evaluation is
>> completed ?
>>
> 
> I think you should asses from the very beginning what is the planned
> integration model of the ISP in order not to corner yourself in a
> place where it will be hard to support inline without re-writing
> the driver's media device registration logic.
> 
> Looking at the below media graph of CSI/ISI you should ask the question "how
> will I register the ISP subdev in the CSI-2 media graph when inline"
> and "how will I describe inline vs m2m mode if the underlying hardware
> design doesn't change?" as deferring it to the .dts might not be the
> most correct way to go in that case ?

So I think we are aligned now: one media graph from the beginning for 
supporting both modes, even if first mainline version only supports m2m. 
Would that be ok ?

> 
>>>
>>>>
>>>> However, if you plan to allow deferring inline/m2m mode selection to
>>>> the system integrators or even have it as a run-time parameter, then
>>>> you should really consider having the ISP in the same media graph as
>>>> the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
>>>> media graph, where you could select the operating mode through media link
>>>> enablement or dts endpoint connections
>>>>
>>>> Niklas (in cc) has addressed a similar situation, where inline and m2m
>>>> mode can be selected by link enablement at runtime here
>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
>>>> (see risp_cs_internal_ops)
>>>>
>>>>>
>>>>> OK, I thought that ISI was still around...
>>>>>
>>>>>>
>>>>>>>     - How many media devices are registered and which driver registers it
>>>>>>>       or them?
>>>>>>
>>>>>> That will be part of the evaluation. My initial assumption is that
>>>>>> neoisp would be the appropriate component to register the media device
>>>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>>>> registration in the M2M configuration.
>>>>
>>>> Isn't the ISP registering its own media graph ?
>>
>> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
>> devices of the ISI media graph.
>>
> 
> I suggest you do what RPi does. The mainline driver only registers one
> instance and they carry a little patch downstream that implements the
> for() loop where multiple instances are registered. Duplicating media graphs
> is not desirable (at least in mainline) as we can have ISPs with 256
> contexts, we don't want 256 media graphs.

Ok. Will do same approach then: 1 neoisp instance on mainline + 
downstream patch to create other instances (x8), all in same media graph.

> 
> A framework level solution with proper priority handling and job
> scheduling is what is required and that's what the context work should
> end up being.>
> 
>>>>
>>>> Can we get a copy of all media graphs on an i.MX95 system including
>>>> the ISI and the CSI-2 receiver ?
>>
>> Here is an example with multiple sensors. Or do you need it in another
>> format ?
> 
> No it's fine, thanks!
> 
>>
>>
>> digraph board {
>>          rankdir=TB
>>          n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 |
>> <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7
>> | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n00000001:port5 -> n0000000f:port0 [style=bold]
>>          n00000001:port6 -> n0000001a:port0 [style=bold]
>>          n00000001:port7 -> n00000025:port0 [style=bold]
>>          n00000001:port8 -> n00000030:port0 [style=bold]
>>          n00000001:port9 -> n0000003b:port0 [style=bold]
>>          n00000001:port10 -> n00000046:port0 [style=bold]
>>          n00000001:port11 -> n00000051:port0 [style=bold]
>>          n00000001:port12 -> n0000005c:port0 [style=bold]
>>          n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000000f:port1 -> n00000012 [style=bold]
>>          n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000001a:port1 -> n0000001d [style=bold]
>>          n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000025:port1 -> n00000028 [style=bold]
>>          n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000030:port1 -> n00000033 [style=bold]
>>          n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000003b:port1 -> n0000003e [style=bold]
>>          n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000046:port1 -> n00000049 [style=bold]
>>          n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000051:port1 -> n00000054 [style=bold]
>>          n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000005c:port1 -> n0000005f [style=bold]
>>          n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000067 [label="mxc_isi.output\n", shape=box, style=filled,
>> fillcolor=yellow]
>>          n00000067 -> n00000001:port4 [style=bold]
>>          n0000006e [label="{{<port0> 0} |
>> 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n0000006e:port1 -> n00000001:port2 [style=bold]
>>          n00000073 [label="{{<port0> 0} |
>> csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord,
>> style=filled, fillcolor=green]
>>          n00000073:port1 -> n0000006e:port0 [style=bold]
>>          n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} |
>> max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n00000078:port4 -> n00000073:port0 [style=dashed]
>>          n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000081:port0 -> n00000078:port0 [style=bold]
>>          n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000085:port0 -> n00000078:port1 [style=bold]
>>          n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000089:port0 -> n00000078:port2 [style=bold]
>>          n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000008d:port0 -> n00000078:port3 [style=bold]
>> }
>>
>>
>>>>
>>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>>>> that's exactly what we're working on with the context framework :)
>>>>
>>
>> Ok. Then I should have a look to context framework too ...
>>
> 
> Please, I hope to be able to resume working on it sooner or later
> given the right use case.

Ok. Will continue monitoring the multi context work. Seems to be a nice 
feature indeed. But as impact on userspace is more significant, that can 
be done as a second step I guess, and will keep the multi instance 
downstream patch meanwhile.

> 
>>>>
>>>>>
>>>>> ... since it is not, your assumption seems very reasonable.
>>>>>
>>>>>>
>>>>>>>     - How can the user decide whether direct (csi2isp) or indirect
>>>>>>>       (mem2mem) streaming shall be used?
>>>>>>
>>>>>> That will also be part of the evaluation. From dts would be my first
>>>>>> option, but may prevent using both modes on same platform then.
>>>>>
>>>>> Of course this depends what the hardware is able to do, but in case the
>>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>>>> to solve that.
>>>>>>
>>>>>>>
>>>>>>> While it is certainly OK to introduce this support only at a later
>>>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>>>
>>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>>>> thoughts about that.
>>>>>>
>>>>>> Is there an existing discussion thread available on this topic? I would
>>>>>> be very interested in following it.
>>>>>
>>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>>>
>>>> It's probably time to have one :)
>>
>> Good. Please loop me in ;)
> 
> You are in, this is the conversation ;)
> 
> It might be a good discussion point for the media summit in Nice
> co-located with Embedded Recipes if people with interest in the topic
> will going the be there.

Great ! Will try to join then.

BR
Antoine

> 
> I'm also adding Anthony from ARM as I know he's going through the same
> inline/m2m duality you're now facing.
> 
> Thanks
>    j
> 
>>
>> BR
>> Antoine
>>
>>>>
>>>>>
>>>>> Thanks and regards,
>>>>> Michael
>>>>>
>>>>>>
>>>>>> Thanks
>>>>>> Antoine
>>>>>>
>>>>>>>
>>>>>>> Thanks in advance and best regards,
>>>>>>> Michael
>>>>>>>
>>>>>>>>
>>>>>>>> This series is posted as RFC because extending the v4l2-isp interface
>>>>>>>> may
>>>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the
>>>>>>>> series
>>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>>>> driver introduction.
>>>>>>>>
>>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>>>> consistent with the existing style in that file.
>>>>>>>>
>>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>>>> yet upstreamed.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Antoine
>>>>>>>>
>>>>>>>> ---
>>>>>>>> Here are v4l2-compliance test results:
>>>>>>>>
>>>>>>>> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>>>>>>>> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
>>>>>>>>
>>>>>>>> Compliance test for neoisp device /dev/media0:
>>>>>>>>
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/media0 open: OK
>>>>>>>>          test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Media Controller ioctls:
>>>>>>>>          test MEDIA_IOC_G_TOPOLOGY: OK
>>>>>>>>          Entities: 7 Interfaces: 7 Pads: 12 Links: 13
>>>>>>>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>>>>>          test MEDIA_IOC_SETUP_LINK: OK
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video0:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04202000
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300000a
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000008 (8)
>>>>>>>>          Name             : neoisp-input0
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000009   : 0: Source
>>>>>>>>            Link 0x0200000c: to remote pad 0x1000002 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video0 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video1:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04202000
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000010
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x0000000e (14)
>>>>>>>>          Name             : neoisp-input1
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x0100000f   : 0: Source
>>>>>>>>            Link 0x02000012: to remote pad 0x1000003 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video1 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video2:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x0c200000
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000016
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000014 (20)
>>>>>>>>          Name             : neoisp-params
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000015   : 0: Source
>>>>>>>>            Link 0x02000018: to remote pad 0x1000004 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video2 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video3:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04201000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300001c
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x0000001a (26)
>>>>>>>>          Name             : neoisp-frame
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x0100001b   : 0: Sink
>>>>>>>>            Link 0x0200001e: from remote pad 0x1000005 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video3 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video4:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04201000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000022
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000020 (32)
>>>>>>>>          Name             : neoisp-ir
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000021   : 0: Sink
>>>>>>>>            Link 0x02000024: from remote pad 0x1000006 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video4 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video5:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04a00000
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000028
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000026 (38)
>>>>>>>>          Name             : neoisp-stats
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000027   : 0: Sink
>>>>>>>>            Link 0x0200002a: from remote pad 0x1000007 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video5 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/v4l-subdev0:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x00000000
>>>>>>>>          Client Capabilities: 0x0000000000000002
>>>>>>>> interval-uses-which Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300002c
>>>>>>>>          Type             : V4L Sub-Device
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000001 (1)
>>>>>>>>          Name             : neoisp
>>>>>>>>          Function         : Image Signal Processor
>>>>>>>>          Pad 0x01000002   : 0: Sink
>>>>>>>>            Link 0x0200000c: from remote pad 0x1000009 of entity
>>>>>>>> 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
>>>>>>>>          Pad 0x01000003   : 1: Sink
>>>>>>>>            Link 0x02000012: from remote pad 0x100000f of entity
>>>>>>>> 'neoisp-input1' (V4L2 I/O): Data
>>>>>>>>          Pad 0x01000004   : 2: Sink
>>>>>>>>            Link 0x02000018: from remote pad 0x1000015 of entity
>>>>>>>> 'neoisp-params' (V4L2 I/O): Data, Enabled
>>>>>>>>          Pad 0x01000005   : 3: Source
>>>>>>>>            Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
>>>>>>>> frame' (V4L2 I/O): Data, Enabled
>>>>>>>>          Pad 0x01000006   : 4: Source
>>>>>>>>            Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
>>>>>>>> ir' (V4L2 I/O): Data
>>>>>>>>          Pad 0x01000007   : 5: Source
>>>>>>>>            Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
>>>>>>>> stats' (V4L2 I/O): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/v4l-subdev0 open: OK
>>>>>>>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 0):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 1):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 2):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 3):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 4):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 5):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>>>>>          test VIDIOC_QUERYCTRL: OK
>>>>>>>>          test VIDIOC_G/S_CTRL: OK
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 1 Private Controls: 1
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
>>>>>>>> Supported)
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
>>>>>>>> 0, Warnings: 0
>>>>>>>>
>>>>>>>> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
>>>>>>>> Failed: 0, Warnings: 0
>>>>>>>>
>>>>>>>> ---
>>>>>>>> Antoine Bouyer (11):
>>>>>>>>      media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
>>>>>>>>      media: v4l2-isp: Add helper function to compute extended stats size
>>>>>>>>      media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>>>>>>      media: Documentation: Add NXP neoisp driver documentation
>>>>>>>>      dt-bindings: media: Add nxp neoisp support
>>>>>>>>      media: v4l2-ctrls: Add user control base for NXP neoisp controls
>>>>>>>>      media: Add meta formats supported by NXP neoisp driver
>>>>>>>>      media: uapi: Add NXP NEOISP user interface header file
>>>>>>>>      media: platform: Add NXP Neoisp Image Signal Processor
>>>>>>>>      media: platform: neoisp: Add debugfs support
>>>>>>>>      arm64: dts: freescale: imx95: Add NXP neoisp device tree node
>>>>>>>>
>>>>>>>>     .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
>>>>>>>>     .../admin-guide/media/nxp-neoisp.dot          |   16 +
>>>>>>>>     .../admin-guide/media/nxp-neoisp.rst          |  189 ++
>>>>>>>>     .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>>>>>     .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
>>>>>>>>     .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>>>>>>>>     .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
>>>>>>>>     .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
>>>>>>>>     MAINTAINERS                                   |    9 +
>>>>>>>>     .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
>>>>>>>>     arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
>>>>>>>>     drivers/media/platform/nxp/Kconfig            |    1 +
>>>>>>>>     drivers/media/platform/nxp/Makefile           |    1 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/Makefile    |    8 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
>>>>>>>>     .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
>>>>>>>>     drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
>>>>>>>>     drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
>>>>>>>>     include/media/v4l2-isp.h                      |   13 +
>>>>>>>>     include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
>>>>>>>>     include/uapi/linux/media/v4l2-isp.h           |   85 +
>>>>>>>>     include/uapi/linux/v4l2-controls.h            |    6 +
>>>>>>>>     include/uapi/linux/videodev2.h                |    6 +
>>>>>>>>     30 files changed, 11880 insertions(+), 3 deletions(-)
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
>>>>>>>> diagram.dot
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
>>>>>>>>     create mode 100644 Documentation/devicetree/bindings/media/
>>>>>>>> nxp,neoisp.yaml
>>>>>>>>     create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
>>>>>>>> nxp-neoisp.rst
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
>>>>>>>>     create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>


