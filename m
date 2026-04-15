Return-Path: <linux-media+bounces-58802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIdKFq1Z32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:26:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB74028AA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23D353030194
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B518D33689D;
	Wed, 15 Apr 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="W3C57tCX"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC0D329C6B;
	Wed, 15 Apr 2026 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245151; cv=fail; b=QokYlzi5nRFxtoW/y6h9ZkSj7bMJCMHqMgBjvvQ4YDtFXfSgrVPd0O0FvEntzgtuiftMZDO45dbp0vhT/pTLQ6DKK5JEHWZ8g914dJp1XTbKgHOi+KNaxxhE3EYnCAsM0rdlnFt7YjPf0SyqCbVV7PWuUWDr+W1O2K71p2Zl/lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245151; c=relaxed/simple;
	bh=pJow1WopSOZWgBuUr9Lcu1Y+ZAYa/T1CzvOu9ehn4XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CSHFoejx+oyklHuSkiV0IlwrBq8oss9Alv+yca3GXiIuk0iIQ3oITUiFOLLL6Qjo9OEgw0HZ8CK+nxaQ3mrO7RYpRGCjlmko619KV+vp+pWobN77QHuhbCokzAIY2CY9EODLi0qcAWnIo4UJXs9upKwJrLifeKJeAyORjas5VbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=W3C57tCX; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO2KPzKx/EKtSpNnpNxoc5ik/SOQJbP4pdHDs6CmOEZyvArjSC/Z2XgozM4C+uFUPF1POOnUjS9DdD1shLIA8ihq/Z7L0lggTpsiY6di5kU349vlPHXBIltT+9XoWPIIzdVjwZfI6dK22MP+/Trcmftbiyi9d4Su2cej0YO2hG2JfSmSexfg5Dvntj1dRCOeG6/jCZRpOB+UX6dCLgrZdeBUoty5T/ixhosWXKwZj0kCGpigxM6l6f36qwyDthVXBNMFbyR9o8HhmDXz/oVsYx/7mcl0aiw5AqO11hdsIhs7A0gVUojeA+HsDvlT/b90EjV8Ljspk/cWBVE1bX5NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ukFn/BJte2xzE/8lNRU0e3WmDjRum3zxDZ25rLEBmE=;
 b=Hz2h2qJHwgAQ1MJZUGPgYZO6qCJGOg/ULlMJAve66TG0QMg66Zvhzay40loE+2WynxPHU61KaT8xtE3q6AoxaC84B/h+a+f75Zn6c1/O5yxZ/E5IzyQAgCL7H9GanipCaIfsXsOpXksaxEiugb/hYx8hVOG4OwHTJmKovFrcKtSOFqzyB79kpcVoK/zSEPq3WDrO0/WD5BFUKZ4lH3xBz2vpJwZGlXkRtzhQR5vwr3aa8QtU0x3NH73xvxARn0Wq5M4xdNeY/kHxs6jdn9CH+r5TvMOKBv+H852y2GxDQH30iQKR6JFYnxDn/DIyBAOYDogz2/TXXlP2AivW9sEawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ukFn/BJte2xzE/8lNRU0e3WmDjRum3zxDZ25rLEBmE=;
 b=W3C57tCX/XxgIbqsdRob7kaC7J0tB8x1Bw1ufD1IbaPLlX5DdCDhE+EDbP0RMG/3wNxDkzF3Y3ToCw9jf88FhhvcY94haVDuRdm6E71awLkeNO81TM0QXyEHawFYHKctGSiCvEmAHgnGX8NAlfe2CAj3iPuW2DwWyX0cU+1C7Bs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:43 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:43 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 0/9] Add support for Wave6 video codec driver
Date: Wed, 15 Apr 2026 18:25:20 +0900
Message-Id: <20260415092529.577-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e412a3-bd5f-4094-1533-08de9ad0f78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+mvMwhoEMxXPOdUljRIyc/oYNLtV9t5kCHFea9YhOtx1Df1/jlbvJ7B2ydLrRqViZVyVltBRvgcOYVrhQjeD6VXMyc70RGVGvgL7WA/mqXU9Yuz1jsWFCzE8digU6uc7q8LOdDp4fBNuLNvlm+xu2oVLm3TrhUtGI9YZAJk2hLplngMRFfWy6K+YC93j6KceKE0+ROe5WH6Dvr9A/+sJZq0Sbfq9t0tFSYGkTRhk7tC2osuZVfePR+tsnVkn+CWfNA7bB3NaY8wUdEVRBVkHwM4pLAdcYQgc+klIadDJ2POgt+YVKUnmTgovBYp0RHJVrxLTiMbwoy6TeYynnY4pZiSNkdyszSu4r5+EB8zrhLFX2/xNpz5VS1eQzrn2c7Bugxhv6gELLQMbDiHl/EE/GwA+z2iQelOmqC7E2X+zCxXWkCPrnM8lOvMQbeEnd+mQdK5SzXOienfhEe6bZk/Q7SpNL/ySYyerkEBfs7rZl5XtZImvIH94ZKgz7zH1j0QSnkZyJKZoDenNyYFXIZ1uuwCT4GXB0N4dFjke22NmLra6YDrES6Ieu8GGhLpe+yGu+HbEpiFi53FWP2Xm/DKYx5xA8bqwKAY/Xk2OBmGSPQTruuLCQHnyW4VgUdrxD4pNgXXHdqCfCiHHyNd9kRdki+y9Mwl3KATuVxZR8yccFYcaj8Qid5r87bokbl/Ce8SvNk0om+ahSEHBDFRwGus+K6z/V0TOpbyd08qdaySzjUAuJandP2cUyjVFx6OgZGy7r1dZflnThPTYhS9CRru1d7mo75BykvqFv5rGnoGixtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Goar8O4sHv3MLdD2/i5yOghFBzIr0D6UzGvv5uAn2FtzMkeUELS41EgwVhzK?=
 =?us-ascii?Q?+wWD2SKWq8Fa9kogq27jzh8rDjhd7QYVwm3TYnpzk4/hKmZ2iMLJyDAR1w4B?=
 =?us-ascii?Q?8AVVIgWFCHVzJts1IX2IKnkK5K9sbvdydOPyJImu2Vvh9dFyV8sYwq4lEcR4?=
 =?us-ascii?Q?qDVahDe7LokzyrRWPpbdcNoaR58iRtiN8Wt0EDUeL3CsiWdvVwE49vheja8Y?=
 =?us-ascii?Q?pWKthBKO3Pwbc/JD7xjeLl/25RUgKurZkbGJkuNkpCPk/fTbThwAEs9ctbPv?=
 =?us-ascii?Q?FWZPAK/Yy21sfAGTJgBWUnzatWFlTkNrLm4rY68IxpwDAwMpRL8yVDeQ7N+R?=
 =?us-ascii?Q?9jw938qRIdER1dMxF+2yzMBgcdFYObvorRy+spSJBjsUSDKF0Wqi+xE+CVA5?=
 =?us-ascii?Q?BFTXvtgyjc8kSaB1cV+Zo9/P9RMgSVuBp0LtnfOdTL739dzZW6y1LOGO6BD8?=
 =?us-ascii?Q?K0y/1YDRAJEjjgvOUxmR/Bd514G9vEVVBKOb/uv+BOepnknENuXKTbT9GzyO?=
 =?us-ascii?Q?t4kFNCYH26U7XCaxTzCQuXuQgE7l0+tPxdtL7W+nSO2n2dgeGf6tQibmaGEX?=
 =?us-ascii?Q?Fy9CS+SYjFXBCmIwI868ENUFdyA4TnFOTQ9lJP2LQVAZbAxhH/WEoP4CuYJF?=
 =?us-ascii?Q?ZQa8DRr8dnJKXXqn0Mmk/rK/PCwQtEzPsIUIVyxXdrKkMP8FR/ihuBYJGJde?=
 =?us-ascii?Q?Hr4GmzQVKqa4hYUbwinhEbVwEalv5ljRsC1J7InszoRk9OmPveLxjYPBaE5V?=
 =?us-ascii?Q?DuZfPNHnNXg6yKOaXlkBiuKk/TBP1vCYVaOKoUDdVqF/x693KcWclqBVfyn+?=
 =?us-ascii?Q?3zjPqnXAgBUjVhyP026ZbrvHM19IL4ZxpGdb1M3qEqzpYShfu9hBLy8o98BL?=
 =?us-ascii?Q?AZ7n9pR84+0J/Z/Wwz1PpycAdia18BHLsEkghHe3xuED3qQx4OF+E8M+5HJQ?=
 =?us-ascii?Q?dmLON+EmYB/FYxEn2KB7e070IfEKeEXP+LMV3rgTfotIA2zihWNKxYhs649O?=
 =?us-ascii?Q?V0tfkU/i8b3k2ra8T5RBClNpUshTbH7cVokQMfzRaRZzD7n4psuISBoN39nL?=
 =?us-ascii?Q?6FDgRdpcYonOImd7stBnP9M4EPxJqjsQchmr/Rj1NLBQbGk5k0ro6LAYFKCR?=
 =?us-ascii?Q?SttgZcEpaPAqkStNIS7880blymeVvmXU2scY2dAzBuMwnOzq69sO+kZ6g66c?=
 =?us-ascii?Q?9HtUwjm1ZbSq6RcZ0mWSsFPz36lEZZMhs4fC5vLggvwelYbo3vmyFRJhUv2A?=
 =?us-ascii?Q?FsWs6oQlGWFjAf/SdCLlD6WrPxlzT+QTBSV76gde7YwCc6Z9TXiQLS60K9Ya?=
 =?us-ascii?Q?pzmWvLREb+xnWYbjcQhAj6QEteCUdCkSAG5rsTeFjxA/oYdqqpiGlDkIxRf2?=
 =?us-ascii?Q?RG6Z1RLwcv1raBFHghNImTpulzTy4C8+fy5f7LFbP06l/uvrr0NHaA+ZRynr?=
 =?us-ascii?Q?E2KMLV4qfvJw2sSYaluWRyWTQhDt729pC4ZlJtnuDVr1m0zMOnUTNKcO3Bvt?=
 =?us-ascii?Q?9gzo3mzZpJNXlqUKOSx6jwE6KN67ABZBxUSJW1pa3wtbfwNl86YCDZg1j/uQ?=
 =?us-ascii?Q?NWeTuX98PCKvGI2LUYZCvfaM5DdArcZiDYJmvuox+sIvazTR+0QbUEFCh+85?=
 =?us-ascii?Q?hYgCkN5Bf3svqMkvLbN5BeNU7wfptyg29Zm5ezh6EE/2/PcszfSH8q9KSl/g?=
 =?us-ascii?Q?hZHH7VWGEtW79DKI3wDe6DBwJe6wOaQN+0hVrS+aZLo57cNMMPqK4bIxgoPZ?=
 =?us-ascii?Q?7EJVMKXml5YTgmTn0bUzGS0DUxgyK/c=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e412a3-bd5f-4094-1533-08de9ad0f78a
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:43.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUm38M6Mwyl6dFmMRCYUsAu/A0qPb0vpXx/1KeRCQ145OK6Os++/nlQdoqNVoh7cDWr6wVd8LHu9b4YxXtCYpMC+tTYMNMxeXbtT82ECoEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58802-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chipsnmedia.com:dkim,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 09BB74028AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This RFC primarily asks for feedback on the devicetree representation
for the Chips&Media Wave6 codec block on NXP i.MX95. It only includes
DT-driven changes. Non-DT driver feedback and cleanups will be
addressed once the DT structure is agreed.

On i.MX95 the Wave6 hardware exposes one control register region and
four interface register regions for one shared video processing engine.
In this RFC, the control region is described by the parent node and the
interface regions by child nodes. The control and interface regions are
distinct DMA requesters and can be associated with separate IOMMU stream
IDs, allowing DMA isolation between them. The control region has its own
MMIO range, and each interface region has its own MMIO range and
interrupt.

I also evaluated folding all resources into a single parent node, but in
that model all stream IDs end up attached to the same IOMMU domain and
we observed loss of DMA isolation. Alternatives such as iommu-map or a
vendor-specific stream ID property were considered, but they do not seem
to fit this use case.

Thanks for your time and feedback.

RFC v5:
- Move all shared resources to the parent node
- Drop child compatible and use data-only interface child nodes
- Update the VPU driver to create child devices and load the core driver

v4:
- Fixed build issues reported by CI tools
- Updated commit messages to use imperative mood
- Avoided using the same name for both nodes and labels in devicetree
- Removed unused labels from YAML examples
- Added description for child(vpu-core) node
- Added iommus property to both parent(vpu) and child(vpu-core) nodes
- Updated probe() functions to use dev_err_probe() when returning -EPROBE_DEFER
- Added wave6_vpu prefix to trace functions
- Updated HEVC decoder profile control to report MAIN_STILL profile
- Fixed bug in multiple instance creation by pre-allocating work buffer
- Fixed interrupt handling by checking INSTANCE_INFO register and instance list

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (9):
  media: v4l2-common: Add YUV24 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add Wave6 thermal cooling device
  media: chips-media: wave6: Add Wave6 control driver
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  163 +
 MAINTAINERS                                   |    8 +
 .../boot/dts/freescale/imx95-15x15-evk.dts    |    7 +-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   |    5 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
 .../dts/freescale/imx95-19x19-verdin-evk.dts  |   10 +
 .../dts/freescale/imx95-phycore-fpsc.dtsi     |   10 +
 .../dts/freescale/imx95-toradex-smarc-dev.dts |    5 +
 .../dts/freescale/imx95-toradex-smarc.dtsi    |    5 +
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |    7 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   35 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   17 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2929 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   73 +
 .../chips-media/wave6/wave6-regdefine.h       |  641 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  289 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../chips-media/wave6/wave6-vpu-core.c        |  397 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  123 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  225 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1867 +++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2691 +++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  141 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   26 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  507 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  816 +++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  143 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  725 ++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1026 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    1 +
 36 files changed, 13359 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


