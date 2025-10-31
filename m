Return-Path: <linux-media+bounces-46037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A29C23084
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 03:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCF43B938F
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 02:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3F12ECEAC;
	Fri, 31 Oct 2025 02:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="C1nbT910"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023087.outbound.protection.outlook.com [52.101.127.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1A2E6CDC;
	Fri, 31 Oct 2025 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877964; cv=fail; b=fRdbxIGnKkVfcPyd0/0zUlmpul6HD3yd58kiaGZOjEHK6PZj2ZEsWmLOJCA2nJ+ngr+yEGVLKcI1GSw3pwQUZTbCG1+lwyJ/7Dt4R2a1Gg2uw+BcESrRw2P6RppMTCkcjhvTo5iaXjXiLvkWmETknM3isacEkF918nxd8HfOIrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877964; c=relaxed/simple;
	bh=qU1QOTx1Vt4h0MJOTJHQ4Sj1uS6s/+4lyskr+Km1frU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TTD6FhVnUlj+8uDkvYy1d3v290XFnkQisqAeyju4Bv1PmeOVGfJ25MvhQ3NAXIBPHWIoVqaRkTvsVsxS2C4m6o/c0bkGVuyDAfUSdopSXtI3TwcjPJzta4FyoO2t8nsue46qLIiSEn/2AV3il5VbRekfldZtSqhHIxYvO1XIp1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=C1nbT910; arc=fail smtp.client-ip=52.101.127.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHTc5HyDFYeyoZlGaMFW1+J/GeN8yjBMgadlINyrjh8ZPAHvkyjSasgceOfogsziKdMXCfEmvGOpljTqQClymoPmp3ijI4mbBtIgXtFWCOrpRozYbBQ/Rjg6P4uvOFtwREN1dtjmoCrk1s6k3wQHyf8jfVhqh2XMtKcnNl+pHB+/Sr7tKT49XSV4HUxOYgk2T6ny/Ao41YeiQOVkOC85I+IoG8HDXAo5+KUXnEzQ0H+O3iwiHIE9yhjcib9qDno7mhXceCk0JliHC62EWYlkr5wnk7Q1k2+/SUuGgig22ZliVNtKlVDFV9EaD/PSrjD9dq96H+LLg/pGH+4w8LYbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCv9aIRfsYqBIHlzbMW8hXmYnDDP/OviQnpDNfVXca8=;
 b=nbMGKx9/AlnskS1gPx7dgx94G+ZojTm7uiYzoCrPoByLEG/eQOrkXoQ1OYRwIao0QQuRPjY+sRYosKX8A7pD7PlxVGYr4I/Twc9ogGV+afpqXEhUPawiJbS3TZyrlD4TquVXQ8tfPlUEXyyjpAPRMw09ZBw84LqIC3pla4rYg3Qs/9JsJZD0Bxmm7XP1Ebm+dd1HnLp2JgfmWOlArcfbFVSR1M56VECDNdk9e+190pkUR0pl4dpH0wMWPgS0ph0+2N7h/xOVkBeR4Ecj6UwG6eWrjoDTcvXlmzf+NCpnvFejlj5t4wMuOZGOCc+pHg2S41CTH7bUXmcx6lIrkeir3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCv9aIRfsYqBIHlzbMW8hXmYnDDP/OviQnpDNfVXca8=;
 b=C1nbT910MecjwpHPU89Jlsqo8wp5aLyGmJXAMHqjmfWIs6TZmn+BGq32Y6pzoZL1FR4N+UvANJXRo85zS4W0HjRT/kgv97KFxAIUC8owNLuFtKT0+TzCbZCwdxsF4/e9KBUE8VuxQTH+p1h3KqihJ4rIflmyiQ3HUOGVeoLtEy2RpIDcPIjqMATjOwm/Ax8GX7l3AnKIdYpA3XPfP2y+hY4pl1jlG4Dm4GLqZkjJQwnmGaylQ/5Z2mwiwPuaxQ78GvYkce+O0n33cXfy5AQanFKp2Znitg9ajyBWSPUSgocwlT72V3ZkiPUgVNjQeGHpHXwCwU5wABNRCJQ7EJ5ngg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSQPR03MB8482.apcprd03.prod.outlook.com (2603:1096:604:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 02:32:36 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 02:32:36 +0000
Message-ID: <731eb8c3-00db-460b-9b28-11472e8b639f@amlogic.com>
Date: Fri, 31 Oct 2025 10:32:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com>
 <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
 <t4xy6q.vhi5j58gpfcw@postmarketos.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <t4xy6q.vhi5j58gpfcw@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSQPR03MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 442dd936-1e5a-405b-26da-08de1825c0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmhERmhvWnJaNlFhdlU0ZTFROTJNRjBmV3dIUm1jMmZISXFNZWR4elhZZEhw?=
 =?utf-8?B?ejU1bGM5ZjEvSUo3VDZJVFlpSG1jNzIrSzF0ZzRXTmwzQWx1cE9yNnNmd0VR?=
 =?utf-8?B?eW1ZWWNVb3Q1MVZPMFdYMzhqbU9BRUF2TVQ4VE1aVy96bFRZRUp3RVExa3pp?=
 =?utf-8?B?SzlhSk9MTHhpSGxZeXlRTnBESVdKWmgzaytRejcrNlBXUHlkdjVET1pPc2Zn?=
 =?utf-8?B?UW9zUW9DNTkvbzM4bC94dFBCRjl1OXpFeWRucmlWNnFFWHYxakNwanJlazlh?=
 =?utf-8?B?dEYrWk1KcjRYOTNmVDluSTI5QXdHbjdyTWZqRU9tYkNick1IV0xMODdKTjhR?=
 =?utf-8?B?QVFqNG5HZ1ZvNm1SSGVoWktwWllsbzVYbG9vOG00Mk1ITHMvRm9QSnNWYXZH?=
 =?utf-8?B?end2RzB3N0NXdHQ4Wm9uUUZuZW8wbHZPN21oSFFUczVDQlU1QW9sT2UxaUF2?=
 =?utf-8?B?S2FnWTgycktQRmJZTG5OdTFmZmp5aUlzd2U5QzdQZ1ZnZlpoTWc3R3pXNHFw?=
 =?utf-8?B?dExmSGhCaWVSSkU0YUFaMEp0c3luWmdxeGtZOU5XQ2F3N2ZkdExQRkVydWZU?=
 =?utf-8?B?dUVXb293aThFTGJjcUFXR1hBL05sRzh6M1lrWm5IS0d4RkJEMFg3SkxIbmF4?=
 =?utf-8?B?bHdJR0VqV3FHUzZmUmIwcDZMR2hxUWxzMXdMbGN3cWFON0ZwTzB0REFBL1Qv?=
 =?utf-8?B?ZGVQOVFSb2o0NWJzVlJ4dUhCdEJ0QzN6bnhaV0FvZHZKRWc4VXhNV25FaTNC?=
 =?utf-8?B?eDk4SGtMaHEyeFQxS1ZmaDE5bnl3NlUyT05mZS9xMnVpWjFnbHI1Q0UzYnpw?=
 =?utf-8?B?SS9UMmxJYWsvWktma0dzdDU0MUtZUWVIdnh2S2FHdUVnWkF0MXF6SXY5bGQr?=
 =?utf-8?B?aFQyYnVpdnBRY2VmdjVBOE5ENkluTnJLS3VNSmNCdGxFbVh0MmRzcEx5ZXp1?=
 =?utf-8?B?WllFVzAxK3d4bkN1enJlMWdHSGV1bzF3bmNoVTFDTklXRy9TQlVoTTBRNmhI?=
 =?utf-8?B?ZWt3a2FQZUlnMnRYQTJDMHh3REY2OHp1Y2JRS0JnNWR0UTJ1QnBXVXBMNHk3?=
 =?utf-8?B?eHpYK2VIcWhZdUdIRCtzS1NhQVgzVytYUERaVER1d2dWNWIrNWpHOE5VZU50?=
 =?utf-8?B?MjBhODB4b3E1Y1F3M05JUEhObkhqLy9mdWxFY29KNnpGVFJLMUVtQXRWdVJj?=
 =?utf-8?B?a1BMbTBOL0VodXRkRS9nRW0zWmJOcXhzUjk3bkF4Qi8xcUlpMVBKTHg0TWpX?=
 =?utf-8?B?UzhHcEQ3VHZuMlVsZXd5aHliSVZaM0xQSFlvZjk3L0Z2QUxNQk9SQnB6VGJm?=
 =?utf-8?B?a3BXVG5od0cycG5DZFREb3lIRGFYQjc1a3R3Ujl5dW5pZ3JqdEFzekdNaG54?=
 =?utf-8?B?MjlyL213SzRKSnJZVWVJaEFGc1hPWFIzbFhyWXJ4U0xjQWtWdG1MbmVJbXlC?=
 =?utf-8?B?RGNLb09xWnFoYTlBZXc3NHpnYlNlZlI5V0s5bHVVcWhNYm9YazRZeHNESTN1?=
 =?utf-8?B?Syt2eThMdjl4ckJKWjNWcGgwU0N0VHdhbXFOUTdsQzlWci9rNXNwWDYwK2oy?=
 =?utf-8?B?WHBVTnBBdnBYVFE3RDN6aVFWMGNjZEFqR3M3cHA0K1lNWm1pWVExbWsvaW1k?=
 =?utf-8?B?UVVwaXEzZWlQUnRteVhCUWxzcUxVTW1IWVhOQWtldzk3bUQ1NVQrMzJ3UmIr?=
 =?utf-8?B?c2puZUVvN1dGdjZKTVMrUlZtWWc5eCtlNTRMMFdpeU9tcGhvQ214UGtGa25q?=
 =?utf-8?B?Q1lyQ3hkU2xqMnlJVlBWMkhRRVdGZkg4SDllQUdseUZHK1RTSi9LZHRQNVNC?=
 =?utf-8?B?TGhyTmFFQnRhWUcwcnA4N3R1TlJxK01PYVBWRDNZSncxa3pyTXYydFJPMlJV?=
 =?utf-8?B?OUlkZDAvbWdJeUVEeVNEdkhpdkVjMmlaR3E3UjliNTZCdXFWS2xxditFMytE?=
 =?utf-8?Q?XKtf8W8qkIqQUui5lFalqVpuH5cZsS5Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THZZejRLTzhRV0dqTGlSSHM2Tnl1RFArNmEzZlNESFZKZEwvUHJ3THFMcHd4?=
 =?utf-8?B?aDVuQmNZai9yaTlSM0ljbmRXNVA2a2ZVenBYSDdNS2hISThzeVBPTWkxd0tG?=
 =?utf-8?B?VXNlOXZlMmpEbHZRZTB5cW1XczkwUGk1UGZFZnBvcHlqbmdVNEtaRlhueEVz?=
 =?utf-8?B?Q1RKVUJLWHNSRVpXYk84TlAybnJvOU1BRDY3YVdFaEVtenB5R3J6WkdOazVQ?=
 =?utf-8?B?blJGOCtTWER2Y0ZkWVAyWXBYbnU4L3NTS1lBelRySnN5cE0xa2xHUkNTOHVC?=
 =?utf-8?B?K0hhdHpBZWVmZng2WnV1RDZmb0RmNTVuSjVhTFBtV3d6NEVhdHk2d0kwSmR4?=
 =?utf-8?B?Z2d3OWxnYldFZW5JRHUra1UzSG16REcvQk1XbjM3RjZPTDlTRFplZVczNzIw?=
 =?utf-8?B?LzdKaDVTQ1pZZzlkWUU4ZmNrY0ZzZm9maFBWWE9qVjlsc1RVYzB4WFQ5M3VO?=
 =?utf-8?B?UXUxeVoxZU9DK2I1Rk1RK1JmUHFMR25jTjdlazdOMjNvT2lrSi9CV3B1UWJY?=
 =?utf-8?B?UmtLckVTU29DWlFrOUxORFVleTN4b2NadjloYXkwVmdtcHBLWVQ3S3N4bkxv?=
 =?utf-8?B?dzlZaGN6STFpWm90Z21xY2pDMlJ0OVRtMStkWU9SdENQNlhwZUllU2FrKytV?=
 =?utf-8?B?OEl6M0NITGNiTjdkMUswNmo4UVF4WE1tSlR3VWE0dUlBdjhTdk1HYWZ0bmR3?=
 =?utf-8?B?ZUhPaDlYK2VwSkdFelY3OVBRcWF0UlZ1VlNMVE5zSU9ZaG1CQ0oxcXV0a2FQ?=
 =?utf-8?B?RFZvREs5SHZ4Vm4rUjcrRWVoTVJFSm8ySVFVdkZlWXBoN3N1OFZpSDMvekN2?=
 =?utf-8?B?cytsY2tIMU5SSEhjeCt0RDZWcnFlVHd1VnZrY2F1OEVEenVwamErcGR0ZTdD?=
 =?utf-8?B?WlRFV0lyYmdOclErcmFtN2RrNGxaTFFidVRnY0ltZmdYVnhua0xjOU9kcFdr?=
 =?utf-8?B?YmRjdXR4ejhjNlkrZnR5Smx0aFJvakR2bERIWGt4MExCV3VwOXhtRnBuYXZ4?=
 =?utf-8?B?U3VvVWN5ZUpCU3pjeUlTM2lVRmtrOHJNanR6N0tmQjhtLzVOaGpNRjlNN1Y0?=
 =?utf-8?B?b3lYZjFCbFJaa3lsKzRsN1c4Y0NjK3BEQ2IrcmdidnZHbGlDUkVFTmR3WFJN?=
 =?utf-8?B?UEdVOWxqOHlrU1dnN3gzVHMzNmplSkl6SFFiNmpHYW1zOTFMSjNlSnNxNUtl?=
 =?utf-8?B?dmhqNHcyWGNhQ29RajQxc1lkaktMYU5OOGFUamdkRnZvb2xsTW95K0pQMG52?=
 =?utf-8?B?Q0tBbERRQVFvTk1nUnRBOExyNkt4RlEyS2pNWmt5bGViMU96cXdhTnA4YXJo?=
 =?utf-8?B?WWgvRkdaVk94NHR2ZzFtV000NElSWE9Pb1ltYkM4YXpIQnB5aDlma29UUlA3?=
 =?utf-8?B?WkpVU2ZlTU9JWkNpQjJhOHUwbkpRa0FNalNsbUdTMGg2bi9IVlVseXdPSE12?=
 =?utf-8?B?SWZZYjBqciswZWVkUkQ1SjhhcWxuWUN4cmwzb2F0Q3ZXbnZrcEJpOUI3Y1o2?=
 =?utf-8?B?RjRlRTNlMEJTaitIeDZYRWt5clkyaHpRVGhaMmlTVWI4U2hrc1poWWhCS2dF?=
 =?utf-8?B?T2VSV1NHdmtISW9nT0UxRE9BNGdGVHB0RGhBb0JnMEp0UllTVVozdWh4Q05j?=
 =?utf-8?B?d0FjMWZlYm9HZnUwS1ZzWWRaQkZnRlF1YXNxWmdJVlpqYkVlU2lrRkIzMTVz?=
 =?utf-8?B?QWRycE1oUXltM1JVL2xPQmJHZS9uM3lkcmhpNjFKQzk1UDAyWklYYVZVK3RT?=
 =?utf-8?B?dHJuUWhvRUk5ZXl5WU5pKzBNMmxjZ3h5ZkgxQy85SmYwRWdBWGxjRU1BdkxO?=
 =?utf-8?B?alRMSFNLR29Gd0ZlNElPY0R1UE9lcllGV1hoRUd3NEdvOWMvMUUrNTBoZkVR?=
 =?utf-8?B?QWlOcHN3aVJraVZKc2pZSTRtU1IrcnVac1BGMU5SWVBQTG9OVVJOVDlkbmRs?=
 =?utf-8?B?NlRYWjQ2WXZqNUJCeGZvUEtMcXVFVC9Vc2ZOYXpwWTBTS2w5Nnd6WjRGRzIw?=
 =?utf-8?B?VDVjeXg3TDJObXYzK1RyZjE0eXF5M3o3VUMvRnNKRTZsZGE5RW5NNDJ3MHMz?=
 =?utf-8?B?SExNQ2hEVlgrdnpDSm1wWGQ2WjNlOGs5c0RsMHdodWkxYktuSnI3bjBuVmZJ?=
 =?utf-8?B?UmdzYjRNQW11a2g3akZPUWx5UnBoT0E2WlgyV0NyVjBhNlUwbTB3dkIyM0dW?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442dd936-1e5a-405b-26da-08de1825c0e9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:32:36.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSJGO+aKMmW1sWgUgAfIBo0bVREc3RVx0bi6lE8sjcdArkhLp8RGg2ndSjDX+S0EFsWwoG+Nmkakv38rcqqB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8482

Hi,

在 2025/10/30 18:50, Ferass El Hafidi 写道:
> [You don't often get email from funderscore@postmarketos.org. Learn 
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On Tue, 28 Oct 2025 11:08, Zhentao Guo <zhentao.guo@amlogic.com> wrote:
>>
>> 在 2025/10/27 20:57, Christian Hewitt 写道:
>>> [christianshewitt@gmail.com appears similar to someone who 
>>> previously sent you email, but may not be that person. Learn why 
>>> this could be a risk at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> [ EXTERNAL EMAIL ]
>>>
>>>> On 27 Oct 2025, at 9:42 am, Zhentao Guo via B4 Relay 
>>>> <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>>>>
>>>> Introduce initial driver support for Amlogic's new video acceleration
>>>> hardware architecture, designed for video stream decoding.
>>>>
>>>> Compared to the current Amlogic video decoder hardware architecture,
>>>> this new implementation eliminates the Esparser hardware component,
>>>> enabling direct vb2 buffer input. The driver is designed to support
>>>> the V4L2 M2M stateless decoder API. The initial phase includes support
>>>> for H.264 decoding on Amlogic S805X2 platform.
>>> It would be nice if you can outline the additional hardware the driver
>>> plans to support so reviewers have perspective on where we are now, and
>>> what more be coming? - the community would also like to understand if
>>> this driver will supersede the stalled driver attempt in staging.
>> Yes, we will follow Amlogic's overall upstream progress to support more
>> hardware
>> platforms in the future. The next step will be adding support for
>> A311D2(T7) platform.
>> We also plan to replace the stalled driver with the new stateless
>> decoder driver.
>> The new stateless driver is fully compatible with the old G12/SM1
>> platforms, making
>> this transition feasible.
>
> That's awesome news! But how about the older platforms such as GXBB
> (S905), GXL (S905X) and AXG (A113D)? Will support for them also be added
> or not?
>
> I and probably many other people still have interest on these older
> SoCs.. they otherwise run Mainline linux mostly fine, so if a working
> vdec driver comes along for these, that would be great!

That's great to hear! Theoretically, the new driver should be compatible 
with these older SOCs.

We'll evaluate the feasibility of supporting the new stateless driver on 
these legacy platforms and will provide a follow-up plan for future support.

>
> Best regards,
> Ferass

Thank you

Zhentao


