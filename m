Return-Path: <linux-media+bounces-20554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3B9B5A11
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964401C20CC5
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735841946A0;
	Wed, 30 Oct 2024 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CAfrZPjh"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC4194141
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256270; cv=fail; b=jdt7u3D4zOGsZQ42fOWDV19vflASq63kMQhyq9GhOTDqfJTJluNTqyWikQ4ULeauSGAa4pQZY9TsVwn+Z0kr6N0uWb9jwgy1FzsnLfbbO7fI2NJqXJZ/YSsmsl+xhhxo6DrZj+/MYBKXv49SirNiK7befxEOnzRGQF8whtz21P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256270; c=relaxed/simple;
	bh=jYBR6IaAOzHthSKsJcNUfjwN48HyC6xx7AHbrV37V0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HbjJY0ypdtCh+V1SEziYtfCwksMfu8OAxobPQw06dF3cl3bwaYLSmkPPjlwy1EHT6KyO0h+F+dYjI957m7IxMGIT8bVmyndoBoAX2fMA2EfUrQkYidQA0aRoHCkK1ypOAkB/51eIeXijsXUnV7E2TxDE6lHTco/09orblW6tD1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CAfrZPjh; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPqYizZDa+lIQZXYaqxTNtQ0MrV+5BzlmI1Mg/ushhLc0931ipGHd6iRmWHvvsmwqoR1oCxKwfvro9qlgW4PPKAmbWha5bsN+g3M55FCSnU5VnU6N4gusWKOAf6jXHp7LkT2eEvY2cfXnF44F0BWEA9iNlC4rOuZuyQWmdlzKbmaAfofKhYB5RzRC4ivEkChJ6OhWu+Z7pqpfOL53U4mQHSP+fgApJlfkGrehYegF9B6jyNPpldnkGW70zd6po4hBKwBgUTEeFQnKu8MRE2eQEZoUSUsIUSLqT9Rp4/i8EXXCEyFhSCEEJWwJ9ybIt8IDNwx89vG11H27ER3ajeypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/79BIbJRU2NDpCO1VkTQ7IokCz3eFLotW0JxGCDsU5U=;
 b=XEsjjLiji64KS+Yl3Udypff+7hVAgfUQ1o4vwrj1SYB0QFV0wivKKfhP2RHyQ9UlwCqZOpiA/ZCxbEJ4oNwp13SaAPNB/NNAmyzvr+wPK5oSBlsREWtogQmDHA5/96HXNawdU3eJ+3lYGknJ6+3gV4jxdGMar8NX5A4lt2VqEwq10qSYApKH935sxiVvQ45FBEtySwdqb3a5jmmaGgUW04C1TdmiHPhvrIdXlcQdtZvCp3V3YJ54FK9IkGRIX+Zz5PRsykrld30psMVqSYZPfD4pLVQVVQDkKauVK+4VU0sfFQ9N02tJtQpWUQoPLvcL+exSobMXrNcLofbgT8Ht+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/79BIbJRU2NDpCO1VkTQ7IokCz3eFLotW0JxGCDsU5U=;
 b=CAfrZPjhMNsus9PeHn0QgE2Ndh6iCdDSq4Cu2NdhDQEtPDQBjT0sSRqA3LR43sDRHxqxTsZ0p/2sDzGUDeWYpXlorKhp7z98qimuGbDxbsuhYq+d32cOPLZSOU4/w4YElSjavDfEQGGuZBxjKFswrtLYtmbVe+qsNiQL5aWQl/qz2hml1zliNrTN/wyOLQeebYSHbYh1Ryj/cjIVItylb/0oHmwbdv5cFl+/Z+BFdcn67leF+e1CKBuk3hkgt59JCPI+xJ25HsH9IBTvF5MvmWCMdTCgF2sAzVbne0/lpMXxP1k5qpi39uqzZlcSznXtj/xYzJuwlRStED4d7AJtlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:44:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:44:25 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v2 3/3] v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Wed, 30 Oct 2024 11:43:07 +0900
Message-ID: <20241030024307.1114787-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c88eb6f-caa7-47db-287c-08dcf88cc45a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?38jDDb5TyMB2RCGTzMlScfZcwA+z2Zpnc/ien8rMMo2jA4daBI7/fgoHnpPN?=
 =?us-ascii?Q?oNEYeNajtcrQJwtfXdy3d7KGtG2kBogKdfCgjrELJojbKKprM37eYiBREcl+?=
 =?us-ascii?Q?7mAnf3NYIhlopmpdXKZyO5QAVh7SrGIjYZuCW5ytaqVIcOaisSgypfhdXqzK?=
 =?us-ascii?Q?NxOB1OzbwEwofzY0NCyUXs34Gl5LEgPBwLan4tTaXIk7uP7RcLtjTQezQhhO?=
 =?us-ascii?Q?fsgXsKHPJ00Czpd5F6ICE+bMouloGVZ9V9f8GxJUpBVpYviB7/NBZkPRYuzo?=
 =?us-ascii?Q?akx8Do88ma7ru4m4UxcOwLwlNkmAHP2Lgeg07ub4LesvKrgkuDMQuGqBZAkd?=
 =?us-ascii?Q?BVp4q4IOdJhvQh/3SRRi6PKcVQLJ6+T+dVmjkJv9TD7FiGexJeknZpDrxI/8?=
 =?us-ascii?Q?1dsDXi0FgGCYhZROEdSkLKOFIlmc9EL9Co5iGZ++v1MRemmuXOLV5eqCDtTl?=
 =?us-ascii?Q?BfInwc5X9ZQMxXoLtRBEq9KLGGwXxUZ3En40huJSoHWCe+9Vjee+TKv5YhbA?=
 =?us-ascii?Q?Z0No+G1J4kb++0IxeXgOt2iwF8dkY3obeTttwSzrpAoS07rnISSxJUDZTssc?=
 =?us-ascii?Q?zjzjEt7vdVlWIPIemN1fb/YDzRGFDvyMdKAXDA82Nd56YPSbIXvENjaSZW1M?=
 =?us-ascii?Q?5lOKxa/JHoYtvkF3eNomdgtV21/5Zu/MMY1VYWRIVB9uIzprO8YoS5DFjz1p?=
 =?us-ascii?Q?jQBhiq2YnH7foBb4qehSILgWkp6oLr4PuozyL5hqkm73adVdodo2G9wXjSKu?=
 =?us-ascii?Q?yFH6Essmv3hX/v6MDgQ/x00VMUBpy8cLh1vVHto9VCGAjOn+VHQ3bn/rYkp3?=
 =?us-ascii?Q?Esse7DbZ3iqfT0AbeL53ePUEqzRDWV2ugVjyQWjUl+4kKQprLWVmL4ntmhu+?=
 =?us-ascii?Q?34ftrhmmht4gW/m2ttwl7uIJ7X8gRKn6AjY6HoJfaXPj+9ZDMeA2PATsuyRW?=
 =?us-ascii?Q?Lkec55qr3gCnCFbxzMIekfVybccg9wxyx20R/KyAk1c1tvF9+A9HWubnyDof?=
 =?us-ascii?Q?3RWHXs93mtcThXDNiouTP6M5WwCbGjhPW5fhbb4+KJ0zxB1sJZy2GGsErTzE?=
 =?us-ascii?Q?6keDWC4dWbEYgTCY1svlwnjbimlZ77GpTR0NwoyZUW7phai/ESapI1OZszGF?=
 =?us-ascii?Q?cbt78IFz4fCBIVZpf1Wh+iKC88kaFjuMguBaWCmpoB2J9cKDFVia/3Vlg5az?=
 =?us-ascii?Q?j1/hTzI4sHWLh/7M4/Z64NqD7O4Wp95XLL072AclW14pfHAmsHobe1fgGMmg?=
 =?us-ascii?Q?Ghx9tJ9vPwcmgun63w6LpIkf1Y/FK+jf01f8xYloFxGk/eVW+yxRmiBKu4ge?=
 =?us-ascii?Q?XOn9PNwfMlh+33TmpepSsMy4nb0oc0xwD09mJDBW1BRDjxM41uNRTrEKFZX9?=
 =?us-ascii?Q?QZwPS0I=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?i0EfqvKtLozdW26zdPo5dNv+perVapXbUeGFMdDXqZLVY4A/aMiw9qVYfV8O?=
 =?us-ascii?Q?azWD5zLkFfMy4JLjBaWSp0gQsmO/WPXmtZvspOWECo8/YE29YAmY7RaTLRUy?=
 =?us-ascii?Q?sGJGEhSTnhQMTMAT4ryhekYMKbcwCKCvQW6XlGqtjDoK0qLDU9dIkFcasCTD?=
 =?us-ascii?Q?eh4ds4/kYGHT1jmxUmD2SJSBHJFCKbIs7DfYJE3nP4fNdjaNzsacbOnUjFBf?=
 =?us-ascii?Q?sfJ8gTKn/+BxfO0WMRA93HKjtxZllz7rpKG5uRduXOLjbqZ+19hJZbj0SS70?=
 =?us-ascii?Q?Lczl4+wesKs5xXJzg/vx7YigSULL5x+SNisRBdpu3m85wyaVNZXMndRSWvUu?=
 =?us-ascii?Q?z1Aw2SQ0bp/NphDMwg5AAW7SfZ80nbnwV3RFzpWC33kTZHB9bRW0/DKhFqpf?=
 =?us-ascii?Q?mO8NGjwmkh7wF16P0aUtM6zxkG+Rom7BUUKHAHHUpTiJFMesRdE/0veg3bt7?=
 =?us-ascii?Q?EELxlytpW+XK5mx6xJeOz6i64gmlgzyQAcVpy4szWJzCsXtEy8VL9qBgVw2l?=
 =?us-ascii?Q?kd5bEuIqdhw20YskG72IUnBI7DguReuRaXb8srfpuUMk2xFSy1mHiktzxZ7p?=
 =?us-ascii?Q?FZRgXiHXew/1A8jWeVitVpJX+BWT8SQ9HodhJafWxZQVC/ucj2hI8KXIdnOX?=
 =?us-ascii?Q?t5Bddv+f6/3TUCakmSlAO5leqrQzDCOZjwza51/UQZn+b0k+imttqjhcWyoZ?=
 =?us-ascii?Q?XrAvxi/pDZWaXyo7oHRzSUZbZtF/kNNJHstwoY4kK+Mm7UUxnpElpCoJO8/3?=
 =?us-ascii?Q?KdbbeBGMpuqx3BPABr5kCMMREv1Iq6l/3ANCmEzXU/KjI+1XicRzfNXteAHr?=
 =?us-ascii?Q?grRjY3NbfPk6zTby+fSFbnWjSxCaQ4Wy7vDW+Icx/npNmS9fGKDFji5YtNSD?=
 =?us-ascii?Q?vtkXuH0xJbSSWKDBXzi+KhmU+2uwofmMgeAjqf6i8DkVmD6pYOiGPS4o5dIN?=
 =?us-ascii?Q?b/OvR8DTI96Vj8YRnf1E575qN7rRR3rMeuAZBRf+h5KFlpHiP4fsprF14Sv5?=
 =?us-ascii?Q?EIl91rvs6+ww5kwEAnl71SXbi2okdVJGkNJ359iMeQPFKYwP786vsLVToBhs?=
 =?us-ascii?Q?n5zFeLGreChjMyJlmrEHQqauhanwtbmjgMoniMz9oCVeSxQ5OZmmrXF0WNXY?=
 =?us-ascii?Q?8s1gUNsApaCuI5uBDYpf9YRkj/RiJPBOyZSKh7N0FZD+TZRG9zdMBZiYyWmO?=
 =?us-ascii?Q?+YL5uqp2sgquDkyw1zb/rze3GGjIDE1RWI+vT8vLDRay9f/ZfJ6So/Gn6joT?=
 =?us-ascii?Q?xNgJ66byJpFk0R7rhfZXy+kNxt9WpdxpFp5izJGYxYD3IYqee2e2SnkH2db8?=
 =?us-ascii?Q?n6FhK1Q3rY0Hu55g8gUrNjQu/u5yv4T+Arlk0r94R0ts7RAmoaW1ho+3ILEP?=
 =?us-ascii?Q?lzz1XKU4HSvaNC1uuKRMgX+fTxiUFM2gJ9aYWgbCqe5tf10RuPbMgL4vBaz7?=
 =?us-ascii?Q?zcRopQr8CGpd4ROE9e2x7gWfl0rLrGO9H6kKospUo8vOlZqyBXKCBbj4zy42?=
 =?us-ascii?Q?MBzOR6nxpUbt/N8eC9qVeZ/7KJyC4cLT7X/GmDJJp/mJT9Oge0n50dmsP+0H?=
 =?us-ascii?Q?hveDnCl0ANWn7126oGDrKT1WkhwShT7XlJMQrTvz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c88eb6f-caa7-47db-287c-08dcf88cc45a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:44:25.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pffIdlyypaUai8KEu2mP2nOga31p7LFGEJWsDvQuV1yWYgR+7VKkVtS3OdJ956cJ3Aarw6+bOuW+yXPT9Mz5SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

From: Yunke Cao <yunkec@google.com>

Add string name for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX.

Test that V4L2_CTRL_WHICH_MIN/MAX_VAL behaves as expected.
1. Calling G_EXT_CTRLS successes when V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX is set
   and returns -ENVALID if the flag is not set.
2. S_EXT_CTRLS and TRY_EXT_CTRLS always return fail.

Tested with VIVID:

./v4l2-ctl -l -d 0
...
		     area 0x0098f90b (area)   : value=1000x2000 flags=has-payload
read_only_integer_32_bits 0x0098f90c (int)    : min=0 max=255 step=1 default=0 value=0 flags=read-only, has-min-max
        u32_dynamic_array 0x0098f90d (u32)    : min=10 max=90 step=1 default=50 elems=1 dims=[100] flags=has-payload, dynamic-array
	   u8_pixel_array 0x0098f90e (u8)     : min=0 max=255 step=1 default=128 dims=[640][368] flags=has-payload
      s32_2_element_array 0x0098f90f (int)    : min=-10 max=10 step=1 default=2 dims=[2] flags=has-payload, has-min-max
      s64_5_element_array 0x0098f910 (int64)  : min=-10 max=10 step=1 default=4 dims=[5] flags=has-payload, has-min-max
		     rect 0x0098f911 (rect)   : value=300x400@200x100 flags=has-payload, has-min-max
...
./v4l2-compliance -d 0
...
Total for vivid device /dev/video0: 125, Succeeded: 125, Failed: 0, Warnings: 0

Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 24 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 7dd7e708eb5e..02dfd6da0248 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -538,6 +538,7 @@ std::string ctrlflags2s(__u32 flags)
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
 		{ V4L2_CTRL_FLAG_DYNAMIC_ARRAY, "dynamic-array" },
+		{ V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX, "has-min-max" },
 		{ 0, nullptr }
 	};
 	return flags2s(flags, def);
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e87a1af96406..a0e8bc19aafd 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -971,6 +971,21 @@ int testExtendedControls(struct node *node)
 		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
 		    checkVividDynArray(node, ctrl, qctrl))
 			return fail("dynamic array tests failed\n");
+
+		ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX)
+			fail_on_test_val(ret, ret);
+		else
+			fail_on_test_val(ret != EINVAL, ret);
+
+		ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX)
+			fail_on_test_val(ret, ret);
+		else
+			fail_on_test_val(ret != EINVAL, ret);
+
 		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
 			delete [] ctrl.string;
 		ctrl.string = nullptr;
@@ -1082,6 +1097,15 @@ int testExtendedControls(struct node *node)
 	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
 	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
 	return 0;
 }
 
-- 
2.43.0-rc1


