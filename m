Return-Path: <linux-media+bounces-51201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KS4L4uZcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:16:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8254322
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53FFC4CB154
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8543D3491;
	Wed, 21 Jan 2026 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZptIrSde"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013021.outbound.protection.outlook.com [40.93.196.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0285310635;
	Wed, 21 Jan 2026 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986621; cv=fail; b=btdnq86zER+X5VhWz8L0xUpSOAXY8A+Y3LG1GI9RdvacuFawnBFHxNMq9aPqbvb0Mr7jpOMn9pqBjFioLB/q/lm09dzxfysH2sKLeGwXn0BICqvqdN6BzxxeaxbBQJ3n3eOGUlQ8bECMvrcza/l6mZK0E+Fq3U1TvY/+zlMrUVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986621; c=relaxed/simple;
	bh=vNrhlLP1nWVVSMs3hmJ6d446JHuZWAMDhy3kvzjxy04=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XJ5y9LdBZD3xTBm/ahboL+Tq/dI5tiQu9dTn2fuofrg8syFaCjAklDwrgUvZn9gHzwgrShfOJwxqPX5bF7pecaFk06/DmimqrEFR3ZS0vAkVdwxArUA+m9DC9/4n2rZFF49iEl0HrNeygtHXR9BR19JO4IzLXYllnCohztFWwxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZptIrSde; arc=fail smtp.client-ip=40.93.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZQ+Qo4+YixcpvOjQwwCfyOfmuPVHA7ENLpiS23rVdGxoboiQ1T7UUaEd2kDF0sS0kXffiKuHAu0vBzwfAA2n09sm0POaDqwTqN3j/4SGcbYNIh+7QKnJR8Am7CZoffe+VtD4bv9TUNDXmv9j9WzgLNWr5B+iYElwlwBaobxAS/sfz8L3WgUx0gto9d3TJOL6HR+s6FYjsHyYkEzL03sOF+VhRo7VdhQZt7xCLQVXEKfOC0R/YewMeh8gfxjseabJmbzztwc5MFzJY6qtaHB7rdkKN2M/5mAdxnLZBDuaI9N9r7Mxx89AgZjBm9N+2wVx4qhBECT6Df2AQcpp5cdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciTCqbQfUDHPQ21tdwgGTXQYboR0FFnfgOwEYhrHIJs=;
 b=V3Ndr+Kv5zCwXxYBcW/qlzXC6J4B65/PMFiOuTEzGWRjNAUpyla5QoMV9YJBaLFrqHx1tylZBZK6YHcxI5+5eIqV8SnTP8bAsZ/8iig2jeHNw7I0rLdvhIXOQNMl37GrE6wEc7lfX2V8gJDrhEtn5cXxCMhTf/PsCJHZTY2WGTKlT9UPF6Y2sh+XI4KQ7oXN4lYVz26fzJ9/wYmsRCJyEzGw3tpngoNBk88cJ+P2N+7kJfZ8W2ze8a55pvnL+iskHVJdo8JB9xEGKGiVeSqaQXMgPHtQk9OIxxb+mwmsZUcEvEnOG5KqJLCMnQdz41Nhtu0WLCQXER5rlg05uIGxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciTCqbQfUDHPQ21tdwgGTXQYboR0FFnfgOwEYhrHIJs=;
 b=ZptIrSdeedbOfSYFIj2euGzXBq3V487Xtl3J2e/KGn4BGMQhWJxNRllmGlnj0aNR7CiATdx7Ig6OycgG4BcP3H3Psmu+aZpnBMgvZBKfPWXyiUa66qBFy4Oohk9u7nfz7WSY2/s6sjyYsvfCsf/b+9/BttjjD4zgYCuWw0NyifA=
Received: from IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::10)
 by CY8PR10MB6906.namprd10.prod.outlook.com (2603:10b6:930:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:10:13 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::70) by IA4P221CA0005.outlook.office365.com
 (2603:10b6:208:559::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 09:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 09:10:11 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 03:10:09 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 03:10:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 03:10:09 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60L9A2fM2609756;
	Wed, 21 Jan 2026 03:10:02 -0600
Message-ID: <0380bf01-a4c8-4a98-b2e0-4fe5bace45ae@ti.com>
Date: Wed, 21 Jan 2026 14:40:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the
 core device
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-7-r-donadkar@ti.com>
 <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|CY8PR10MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: a19b2e3d-8868-451f-be31-08de58cce193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDlKekRmUlBjTFlIcW1ESWtHN1Z6Smd0bnFnZk1vc29qcGlSREpLMlB5NGNm?=
 =?utf-8?B?RmttRnJKT3JNK0NhZTZGdUhqRVJvRTM5YmN4Zys5S0pLYVZYS2Mxb29wdVhu?=
 =?utf-8?B?TUxncXpFb3p5T0JjdVE4cjRpWC9rL09ZNjc2bDZzNGlQcDZFalN1SEIwS2V5?=
 =?utf-8?B?SVpvdExMY2VlOHk1ditqMS9iZTBzL1RXSmNzTy9OWTlpMlppQ21QYkRhVWRB?=
 =?utf-8?B?NzhmUzRCRG5iRjgzZ3IvSjdNeWkwZTlkSmE1SEk4NzZ1L2FjZk9SbG53VnJF?=
 =?utf-8?B?R2R2VUNBUG9oL2RLOHZ3Nyt0bm01SFk5QnFtYUhJUGQ2NE5Ga2w5RFE2dzJG?=
 =?utf-8?B?VGU4c1dZYXYyWnRQSEhMTWkrU2JVYVNoRTlMZlJRNnp5cTAxUW5GcG9BbVJx?=
 =?utf-8?B?WjQ1RXFYNVcyVEZpTWh5bzhJYmlwL1RSV1VwMkdFS0RtcDEvWjVBUmtpdXBW?=
 =?utf-8?B?VVZ4aFpRK0lGdWRxdkZadkNpNWtZUjFuMzBrMVZrRE1KeUZzOU1keFlTTTRh?=
 =?utf-8?B?d05JYnVwT0NOeXJDUWM4enBsbTVTK1creEFKWkd6YnhJZ1p3b0hNbkRwbWlK?=
 =?utf-8?B?UEE2SiszcjNBVENhYyt5OXpCU2s4ZzhVZmVRVG4vZ0FtVzFvZ084YW9wVmtE?=
 =?utf-8?B?eXZ3bzFxMVhlRHhBc0theUVSU3FRd1FxUCtBUW9LdjBEcTdaODN2QUhnSm1G?=
 =?utf-8?B?NnZyZkU0aDdXWlcreldlTExBMmxXQis5a0FIYjI1QmM4RjBnUXoxdXZLeEs4?=
 =?utf-8?B?dEZFTzJiTVRTK1pTVUxBcWVBaFhKVFBNeERBT3daRjhMRXllc0NkdW1vOGg2?=
 =?utf-8?B?czZRNkMrN3E4RXFkREJWK2EwMEljNzA4VlRBUC84azBBb05aMkx6amFOQklk?=
 =?utf-8?B?OVExVG1iVlYxUE9qeG8xaWxQbXBMa3VIeCtWTjdjMVg0dU51VGc2bFZZWlAy?=
 =?utf-8?B?NXNyVHY5VEhMbnJqZ0xSaWloZVBydndjQ2ZPeTZibC9aRG12bi9UTzN2SmV6?=
 =?utf-8?B?Z2k1MnVtb1JqTW40a054eDNGUXcwaXNFZFNvd3RFcStKM0t6cjNrYjJIZ1Ny?=
 =?utf-8?B?Q3lMU0I4bUVUcEIwNnlZcGY5bURXdzN2dndkY2NmNS82ckIwcCtxMEwwV0Nw?=
 =?utf-8?B?N0t5SFVERVAwY3JLbU1aeWErbnVoVWJ6QjdHMnpaRnk2c01JUWh3VlFjTm9D?=
 =?utf-8?B?MlRGSitnNURacnQyTm80SVI3ZGdFL2g1T1hLdHZJdlNMNTgrR3gxcHh4RWNY?=
 =?utf-8?B?RHJzeGtsTGRtTjdzaUlYM21kd2VzZTRadGJtRENyODE1NmJTd0hMSjJweFpG?=
 =?utf-8?B?OXBYRUtSOEJwWDhJeHJrbWJldVZFcUlnYWZRSXNJOXE3ZUcyS1JUOUV0SjhI?=
 =?utf-8?B?Z2QvMmFHQTN3YS9LRnM3eWJTUm5peXF5OXNpYUNXTGR1c1JQeUU5WnNaamNP?=
 =?utf-8?B?WDU4ZGZScE9RRlFDcEwvVGpON3dUT1luc2EycFo1c2dCelV4aUNYMW9SVnE5?=
 =?utf-8?B?Y0ZWWmpkRHhVTStMOTNrVTcyK2xJQndWbWZHUDJ1QzZBTmpBTFlFRDVXYzZm?=
 =?utf-8?B?TnBQdGMyT29UeFM1NWhZeHh6ejM0aEtiNENxR2ZIZE5IMXZPNGp0dzVPM282?=
 =?utf-8?B?WFczVXROUmxMTTRuL242b1N4LytqT3N3Z3crd3pKdUw0ZG9uaiszaWpoN2g0?=
 =?utf-8?B?b25aMWtsWmgrdGZ5ZGtOYndoeEpUTCszOXB1YlJ1bFRZVytkYmVhcDJKaEJ4?=
 =?utf-8?B?T3VubUNmTk5GeVdlczJrN3Z2cUR2TDdMQ2l6TnBpc0ZDTVhNMm9RRjVvMzFo?=
 =?utf-8?B?d0hJVTdNVm8vNjhzc0ZqQ3ZIcFJKc25QOVl5dWZ5WmJ5RXhpYmpHTnBaUE15?=
 =?utf-8?B?ZHY3Zk8rbjhxV1FXc0l6eWpPMk5TQkZWRjFxZTNYMG5uV2taVWE4U1gzejI1?=
 =?utf-8?B?VzRqcGZGZDB6cDd5MzdyM0UxMVp2dG5ZbGxQVktIUFh3U015OVczTUs3eXp5?=
 =?utf-8?B?TVN6RWpycldacXpjNC84VndwYVZ1VmxLaGVLZERCQ3p1cC84cDE0djgxRjNt?=
 =?utf-8?B?VDJtMTlrTkJxdTh0Q2ZFeE83RHhQbjcxTlNlMklDWEJ3eFk2THNheFovUFMz?=
 =?utf-8?B?MWZSNXZSVWtHekFIdGc5MHFkOUd5ZzQyQ1FpWG1OMVNIQy8ybWtYVGhraklw?=
 =?utf-8?B?SlhwcFVEOW5Uajd2LzFLRFlRMzBNcGRNaVhST2hyWDBFU0hlb3grOGpkakFF?=
 =?utf-8?B?ZDlxZVUyVC9oNkp4VUx3L0YzbmNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:10:11.3080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19b2e3d-8868-451f-be31-08de58cce193
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6906
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51201-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BD8254322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 14/01/26 20:51, Tomi Valkeinen wrote:
> Hi,

Hi Tomi,

Thank you for the review !

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> With single stream capture, it was simpler to use the video device as
>> the media entity representing the main TI CSI2RX device. Now with multi
>> stream capture coming into the picture, the model has shifted to each
>> video device having a link to the main device's subdev. The routing
>> would then be set on this subdev.
>>
>> Add this subdev, link each context to this subdev's entity and link the
>> subdev's entity to the source. Also add an array of media pads. It will
>> have one sink pad and source pads equal to the number of contexts.
>>
>> Support the new enable_stream()/disable_stream() APIs in the subdev
>> instead of s_stream() hook.
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 292 +++++++++++++++---
>>   1 file changed, 248 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index f66d68edcd57a..8f49ea2638585 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -54,6 +54,11 @@
>>   #define MAX_WIDTH_BYTES			SZ_16K
>>   #define MAX_HEIGHT_LINES		SZ_16K
>>   
>> +#define TI_CSI2RX_PAD_SINK		0
>> +#define TI_CSI2RX_PAD_FIRST_SOURCE	1
>> +#define TI_CSI2RX_NUM_SOURCE_PADS	1
>> +#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
>> +
>>   #define DRAIN_TIMEOUT_MS		50
>>   #define DRAIN_BUFFER_SIZE		SZ_32K
>>   
>> @@ -102,6 +107,7 @@ struct ti_csi2rx_ctx {
>>   	struct mutex			mutex; /* To serialize ioctls. */
>>   	struct v4l2_format		v_fmt;
>>   	struct ti_csi2rx_dma		dma;
>> +	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>>   };
>> @@ -109,12 +115,15 @@ struct ti_csi2rx_ctx {
>>   struct ti_csi2rx_dev {
>>   	struct device			*dev;
>>   	void __iomem			*shim;
>> +	struct mutex			mutex; /* To serialize ioctls. */
> The mutex is not used (in this patch at least).


Yes, now since in the later patches that add multi stream support, we 
access all the shared variables in the enable/disable_streams call which 
are serialized by the framework, I think this mutex is note required. I 
will remove it entirely.

Rishikesh

>
>> +	unsigned int			enable_count;
>>   	struct v4l2_device		v4l2_dev;
>>   	struct media_device		mdev;
>>   	struct media_pipeline		pipe;
>> -	struct media_pad		pad;
>> +	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
>>   	struct v4l2_async_notifier	notifier;
>>   	struct v4l2_subdev		*source;
>> +	struct v4l2_subdev		subdev;
>>   	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
>>   	u8				pix_per_clk;
>>   	/* Buffer to drain stale data from PSI-L endpoint */
>> @@ -125,6 +134,22 @@ struct ti_csi2rx_dev {
>>   	} drain;
>>   };
>>   
>> +static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct ti_csi2rx_dev, subdev);
>> +}
>> +
>> +static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
>> +	.width = 640,
>> +	.height = 480,
>> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +	.field = V4L2_FIELD_NONE,
>> +	.colorspace = V4L2_COLORSPACE_SRGB,
>> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +	.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +};
>> +
>>   static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_YUYV,
>> @@ -422,6 +447,18 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>   	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
>>   	int ret, i;
>>   
>> +	/* Create link from source to subdev */
>> +	ret = media_create_pad_link(&csi->source->entity,
>> +				    CSI2RX_BRIDGE_SOURCE_PAD,
>> +				    &csi->subdev.entity,
>> +				    TI_CSI2RX_PAD_SINK,
>> +				    MEDIA_LNK_FL_IMMUTABLE |
>> +				    MEDIA_LNK_FL_ENABLED);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Create and link video nodes for all DMA contexts */
>>   	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
>>   		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>>   		struct video_device *vdev = &ctx->vdev;
>> @@ -429,15 +466,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>   		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>   		if (ret)
>>   			goto unregister_dev;
>> -	}
>>   
>> -	ret = media_create_pad_link(&csi->source->entity,
>> -				    CSI2RX_BRIDGE_SOURCE_PAD,
>> -				    &csi->ctx[0].vdev.entity, csi->pad.index,
>> -				    MEDIA_LNK_FL_IMMUTABLE |
>> -				    MEDIA_LNK_FL_ENABLED);
>> -	if (ret)
>> -		goto unregister_dev;
>> +		ret = media_create_pad_link(&csi->subdev.entity,
>> +					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>> +					    &vdev->entity, 0,
>> +					    MEDIA_LNK_FL_IMMUTABLE |
>> +					    MEDIA_LNK_FL_ENABLED);
>> +		if (ret) {
>> +			video_unregister_device(vdev);
>> +			goto unregister_dev;
>> +		}
>> +	}
>>   
>>   	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>>   	if (ret)
>> @@ -447,8 +486,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>   
>>   unregister_dev:
>>   	i--;
>> -	for (; i >= 0; i--)
>> +	for (; i >= 0; i--) {
>> +		media_entity_remove_links(&csi->ctx[i].vdev.entity);
>>   		video_unregister_device(&csi->ctx[i].vdev);
>> +	}
>>   	return ret;
>>   }
>>   
>> @@ -493,14 +534,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>>   }
>>   
>>   /* Request maximum possible pixels per clock from the bridge */
>> -static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
>> +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
>>   {
>> -	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
>>   	struct media_pad *pad;
>>   	int ret;
>>   
>> -	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
>> +	pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (IS_ERR(pad))
>>   		return;
>>   
>> @@ -526,7 +566,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	writel(reg, csi->shim + SHIM_CNTL);
>>   
>>   	/* Negotiate pixel count from the source */
>> -	ti_csi2rx_request_max_ppc(ctx);
>> +	ti_csi2rx_request_max_ppc(csi);
>>   
>>   	reg = SHIM_DMACNTX_EN;
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>> @@ -881,7 +921,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	dma->state = TI_CSI2RX_DMA_ACTIVE;
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   
>> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
>> +	ret = v4l2_subdev_enable_streams(&csi->subdev,
>> +					 TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					 BIT_U64(0));
>>   	if (ret)
>>   		goto err_dma;
>>   
>> @@ -909,7 +951,9 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>   	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
>> +	ret = v4l2_subdev_disable_streams(&csi->subdev,
>> +					  TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					  BIT_U64(0));
>>   	if (ret)
>>   		dev_err(csi->dev, "Failed to stop subdev stream\n");
>>   
>> @@ -925,8 +969,121 @@ static const struct vb2_ops csi_vb2_qops = {
>>   	.stop_streaming = ti_csi2rx_stop_streaming,
>>   };
>>   
>> +static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>> +				    struct v4l2_subdev_state *state,
>> +				    struct v4l2_subdev_mbus_code_enum *code_enum)
>> +{
>> +	if (code_enum->index >= ARRAY_SIZE(ti_csi2rx_formats))
>> +		return -EINVAL;
>> +
>> +	code_enum->code = ti_csi2rx_formats[code_enum->index].code;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state,
>> +				struct v4l2_subdev_format *format)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	/* No transcoding, don't allow setting source fmt */
>> +	if (format->pad > TI_CSI2RX_PAD_SINK)
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +	if (!find_format_by_code(format->format.code))
>> +		format->format.code = ti_csi2rx_formats[0].code;
>> +
>> +	format->format.field = V4L2_FIELD_NONE;
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>> +	*fmt = format->format;
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					   format->stream);
>> +	*fmt = format->format;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
>> +	*fmt = ti_csi2rx_default_fmt;
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
>> +	*fmt = ti_csi2rx_default_fmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>> +				       struct v4l2_subdev_state *state,
>> +				       u32 pad, u64 streams_mask)
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	struct media_pad *remote_pad;
>> +	int ret = 0;
>> +
>> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>> +	if (!remote_pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
>> +					 BIT_U64(0));
>> +	if (ret)
>> +		return ret;
>> +
>> +	csi->enable_count++;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					u32 pad, u64 streams_mask)
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	struct media_pad *remote_pad;
>> +	int ret = 0;
>> +
>> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>> +	if (!remote_pad)
>> +		return -ENODEV;
>> +
>> +	if (csi->enable_count == 0)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
>> +					  BIT_U64(0));
>> +	if (!ret)
>> +		--csi->enable_count;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>> +	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = ti_csi2rx_sd_set_fmt,
>> +	.enable_streams = ti_csi2rx_sd_enable_streams,
>> +	.disable_streams = ti_csi2rx_sd_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
>> +	.pad = &ti_csi2rx_subdev_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
>> +	.init_state = ti_csi2rx_sd_init_state,
>> +};
>> +
>>   static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>>   {
>> +	v4l2_subdev_cleanup(&csi->subdev);
>>   	media_device_unregister(&csi->mdev);
>>   	v4l2_device_unregister(&csi->v4l2_dev);
>>   	media_device_cleanup(&csi->mdev);
>> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>>   	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
>> -	struct v4l2_subdev_format source_fmt = {
>> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>> -		.pad	= link->source->index,
>> -	};
>> +	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_subdev_state *state;
>>   	const struct ti_csi2rx_fmt *ti_fmt;
>> -	int ret;
>>   
>> -	ret = v4l2_subdev_call_state_active(csi->source, pad,
>> -					    get_fmt, &source_fmt);
>> -	if (ret)
>> -		return ret;
>> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
>> +	format = v4l2_subdev_state_get_format(state, link->source->index, 0);
>> +	v4l2_subdev_unlock_state(state);
>>   
>> -	if (source_fmt.format.width != csi_fmt->width) {
>> +	if (!format) {
>> +		dev_dbg(csi->dev,
>> +			"Skipping validation as no format present on \"%s\":%u:0\n",
>> +			link->source->entity->name, link->source->index);
>> +		return 0;
> Isn't this an error?
>
>   Tomi
>
>
>> +	}
>> +
>> +	if (format->width != csi_fmt->width) {
>>   		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
>> -			source_fmt.format.width, csi_fmt->width);
>> +			format->width, csi_fmt->width);
>>   		return -EPIPE;
>>   	}
>>   
>> -	if (source_fmt.format.height != csi_fmt->height) {
>> +	if (format->height != csi_fmt->height) {
>>   		dev_dbg(csi->dev, "Height does not match (source %u, sink %u)\n",
>> -			source_fmt.format.height, csi_fmt->height);
>> +			format->height, csi_fmt->height);
>>   		return -EPIPE;
>>   	}
>>   
>> -	if (source_fmt.format.field != csi_fmt->field &&
>> +	if (format->field != csi_fmt->field &&
>>   	    csi_fmt->field != V4L2_FIELD_NONE) {
>>   		dev_dbg(csi->dev, "Field does not match (source %u, sink %u)\n",
>> -			source_fmt.format.field, csi_fmt->field);
>> +			format->field, csi_fmt->field);
>>   		return -EPIPE;
>>   	}
>>   
>> -	ti_fmt = find_format_by_code(source_fmt.format.code);
>> +	ti_fmt = find_format_by_code(format->code);
>>   	if (!ti_fmt) {
>>   		dev_dbg(csi->dev, "Media bus format 0x%x not supported\n",
>> -			source_fmt.format.code);
>> +			format->code);
>>   		return -EPIPE;
>>   	}
>>   
>>   	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
>>   		dev_dbg(csi->dev,
>> -			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
>> -			ti_fmt->fourcc, csi_fmt->pixelformat);
>> +			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
>> +			link->source->entity->name, link->source->index,
>> +			&ti_fmt->fourcc, &csi_fmt->pixelformat);
>>   		return -EPIPE;
>>   	}
>>   
>> @@ -1033,6 +1194,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
>>   	.link_validate = ti_csi2rx_link_validate,
>>   };
>>   
>> +static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
>> +	.link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>>   static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct dma_slave_config cfg = {
>> @@ -1058,6 +1223,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>>   static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   {
>>   	struct media_device *mdev = &csi->mdev;
>> +	struct v4l2_subdev *sd = &csi->subdev;
>>   	int ret;
>>   
>>   	mdev->dev = csi->dev;
>> @@ -1070,16 +1236,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   
>>   	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
>>   	if (ret)
>> -		return ret;
>> +		goto cleanup_media;
>>   
>>   	ret = media_device_register(mdev);
>> -	if (ret) {
>> -		v4l2_device_unregister(&csi->v4l2_dev);
>> -		media_device_cleanup(mdev);
>> -		return ret;
>> -	}
>> +	if (ret)
>> +		goto unregister_v4l2;
>> +
>> +	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>> +	sd->internal_ops = &ti_csi2rx_internal_ops;
>> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>> +	sd->dev = csi->dev;
>> +	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
>> +
>> +	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +
>> +	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
>> +	     i < TI_CSI2RX_NUM_PADS; i++)
>> +		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
>> +				     csi->pads);
>> +	if (ret)
>> +		goto unregister_media;
>> +
>> +	ret = v4l2_subdev_init_finalize(sd);
>> +	if (ret)
>> +		goto unregister_media;
>> +
>> +	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
>> +	if (ret)
>> +		goto cleanup_subdev;
>>   
>>   	return 0;
>> +
>> +cleanup_subdev:
>> +	v4l2_subdev_cleanup(sd);
>> +unregister_media:
>> +	media_device_unregister(mdev);
>> +unregister_v4l2:
>> +	v4l2_device_unregister(&csi->v4l2_dev);
>> +cleanup_media:
>> +	media_device_cleanup(mdev);
>> +
>> +	return ret;
>>   }
>>   
>>   static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>> @@ -1106,9 +1307,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>>   
>>   	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>>   
>> -	csi->pad.flags = MEDIA_PAD_FL_SINK;
>> +	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>>   	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
>> -	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
>> +	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1169,6 +1370,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>   	if (!csi->drain.vaddr)
>>   		return -ENOMEM;
>>   
>> +	mutex_init(&csi->mutex);
>> +
>>   	ret = ti_csi2rx_v4l2_init(csi);
>>   	if (ret)
>>   		goto err_v4l2;
>> @@ -1201,6 +1404,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>>   	ti_csi2rx_cleanup_v4l2(csi);
>>   err_v4l2:
>> +	mutex_destroy(&csi->mutex);
>>   	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>>   			  csi->drain.paddr);
>>   	return ret;
>> @@ -1216,7 +1420,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>   
>>   	ti_csi2rx_cleanup_notifier(csi);
>>   	ti_csi2rx_cleanup_v4l2(csi);
>> -
>> +	mutex_destroy(&csi->mutex);
>>   	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>>   			  csi->drain.paddr);
>>   }
>

