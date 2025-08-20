Return-Path: <linux-media+bounces-40387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBADEB2DA86
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276DD5C70F7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6732E36EA;
	Wed, 20 Aug 2025 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FQXRfaOU"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC882E4271;
	Wed, 20 Aug 2025 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687931; cv=fail; b=N0GhxydRUGotVSXKpP8NBW0oxdIHd1W/pGzo7y7iz+gSwCbJCUzGXL9upQoMf2ZvNNLl9ILdZoRBtZtbNkvea5Vo/jcuyc1rr6Ca82dlYg80s+snVIOoCjyaUKRANJNdGXEN+IGnHmpERKg1ZO+UbfAzPewSNNUAf05uFHMC7NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687931; c=relaxed/simple;
	bh=kFcDmDTMRPCGGO54pIN/anqLoIdM8z8EX/op6AM1lHY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J0ctaFVT7k6PnpaIA/Uguw586fj3ER+rcVLdu7zcW5hJclMnMt6CdIpo4m5u07PUUyit+yZRjjDtvk5h8By49OKVndek+6u0hHM6XVvxCavFjIB6gzXHE34bwx18HrKwCLgvsTr7yHfZa1BYiVuKDtgD0uavKOCtsORClBP9gZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FQXRfaOU; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpaHE8dN7oeEQqxFWDRdHgI9J7iJqC69le+xVJmFhEYMQKlj3TVxhptqtyt/o7V95CR/rtaeNqIGiKEcDU35KXcegMH8t5dxB7HW9AXHXDpaDHDb9z5t6S1wrFb0OZ87pdvvdKWoaah4tl8KkQcNOhTxRm03UO5Bj5lHTXhR5xjffr7HNz3tQW/i+LgR5H+wOTFiUAEKH61k5HYhSe4jU3Tm+ri7U/HX0DqVcDr5u7cNxVZaVBs+Wvt7CpSq+6QfNERqj13Th6FCX6tvkdgydwzdzE5WIBXZxU+k82w6iajUVE0CYs18L621651ZmjcG1WsVyAW9aPr+p1zZLfsB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Wj4GufVd/XT4Z468gws8KxACBoydlcrc6EGd2BvnA=;
 b=MwSXPUzFBRZtpPo/l9va5cXp8gaVFmuWNOEb/kW/zDZSl5rTIQmsaJCwAC4M7L0jMsAZcz/2ldWyv3/NIYttnCfrqhennUXoU1ZezTgPkyfzrligZ4lB+Zg0z+0Oeh4JM0Jyvm4K4coJk4wTBO+9t4Z35sydlMMqBi1NWu2Z0owOD2+Z3IzLrPU1+I+DdwTtCwjd+7mpNNFaBa9ChUiUzg91WhtG2jxV2k17ktXZlkfqorplr1fryBlLmUy9lKXSZPWie4SdIKxRJpmn8GgYoZfVpuMAClCJWiODBzkkUq63ONFvaL5omrl/SP3lIELWgJkXyGS5O0i/Gx7USaQFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Wj4GufVd/XT4Z468gws8KxACBoydlcrc6EGd2BvnA=;
 b=FQXRfaOUR0Q9xk3l4yP9Du5GLz4wxGNlDTRlY03Vz7aPl9/2T6T87D2SRghWZ7NZC6QZO/NrHF2J8u6I5QymaZujDYfrnnzCEOI2I1OpQKEeMKTPsZxe+VIK6hMUnH1x0lgTMdqMqOwD91+ON4sK6rDo2Ze0YgjSRmNAdjl7q0nzsjNVvRjX2CV+KONwlTC7kO2jZsLCXIffpAAtMc9ubVLzlApZSwuph54OoFq2Bhjoe8YYVj7Jwmb6a/j7FVjfK8yujSSMhozXOVFY07eEQyQleyZiSjFpbcNJ6uMLfhPbLyyZ2hngdnOo+l8bl6nNjmeTATAYTk82qUJFc6Lodg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 11:05:26 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:26 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 20 Aug 2025 19:04:56 +0800
Subject: [PATCH v5 1/4] media: imx8mq-mipi-csi2: Remove width field in
 csi2_pix_format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-csi2_imx8mq-v5-1-e04a6fc593bd@nxp.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
In-Reply-To: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=3480;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kFcDmDTMRPCGGO54pIN/anqLoIdM8z8EX/op6AM1lHY=;
 b=2W4OnP3VVHAFFnvK0ddmYmi0ZuWm0pP4SqTKw4cGEUutNkbFS6mJcT9inZkBwYGC9JGCwNpuu
 Ko+knTWCjEbCy9kXwtAafwZKM+YduztR8fPLiTE0H5DHRXHomDp7rfA
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: b596a385-b8e2-45ed-0a64-08dddfd97740
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dDBzWnZSbUYvY0gwRGV4bS9VREpGMG91NHp1eGZPUG1kaVZxMUxVY3pkdHVW?=
 =?utf-8?B?a1FuVk16dlR0MXd4Nm5KaXF3MmlUYnN0Wkd1UHFNT24wdXBCUzhxcHlYWmtj?=
 =?utf-8?B?dldzVXhRdHorWE5TQTF6WnNETlpCUllLczBuZURIUTRjcWFHOXZBY2tjRUhj?=
 =?utf-8?B?K3FDaUcreW9qbFhxVFZ6V2xEVzZhQUdUcHVVUktDait0M1ozRi96cjZ2M0oy?=
 =?utf-8?B?N3dFUVNKRitWSk54djNQWG9VV0lnU3RuMmxkTXdFcElBTHRIa1dDb3MrV3o1?=
 =?utf-8?B?MS9ON01MR0dQMWJzRUk2TWVwWnFqak1XWkZPdXdzdy9hTHAra3pCdDErNDl3?=
 =?utf-8?B?cFl5V0dqb0dhbFRBd0QyWGhwam5EeG9LVTZERXFxd2pEdnl1WlljZG9qQ3RI?=
 =?utf-8?B?VjIvMGRiYm1JcVMvUHVOWElJVnRvU2ZqZ1QzTzdqemhKMGhvdVJUbEtFSE54?=
 =?utf-8?B?SjFHa2ZoTG1wYjZZbDRjTVNGejlzaE5wbEIxYzZpZ3IzZ25oWDZqRHgwMHRF?=
 =?utf-8?B?SmRXU0RPMzBTbXNic0hwQjE5U1ZnQWdsUklPTEdNcWVCbm5wclB4eXkwV3J5?=
 =?utf-8?B?UldSM1QzU0tmU2FWWExzVEg4MFl1eHE0VzNyUFlpSEs3dkNEajNRdzlCbFlW?=
 =?utf-8?B?VCt5cXUxeThHS1VYRHhJOFlVc2N4T1JQb2t3dHEzY0d5YkNOM0RFbStlVkNY?=
 =?utf-8?B?Smt4RWg0ZDZDRlhGaVVqZlpUZVRqU2FPM2dmTWZhZGtPU3lSRGNqeUFjcFQ5?=
 =?utf-8?B?L1pjSCtlMDhLczNmV091RFRYYXBXbzRmM3VSRUFITWovaVlIbUp6SEVtVkI5?=
 =?utf-8?B?eFhGL1VXV2RGbEpyOUVxUFJhQ2VDTVVwSEpjQ1E1NDR5TzlGMmdJRk5rN2RE?=
 =?utf-8?B?em1GVnZjM1lOY2dLNUEwdHlnZWYxb1FQWlYzaXJ3aGhxbVZJcHl3dGF1d200?=
 =?utf-8?B?ZXUzRThWT1VHT1lPb0l5VUtLbWNQTkEwNGtxNU8zRDJBQllSdkxzdHFLOUts?=
 =?utf-8?B?Mis1d0lRaHE3N0NHZ0M0RytVbEt3K0VVRXRTT3cvNDlicnhxbEQwNEFHT1NU?=
 =?utf-8?B?SzMwbWZsckdBWVJTOXZ0dFNmajZVemxIU3FXRm9Pc09KeVBiN29VLzNkS0x5?=
 =?utf-8?B?aEs1bElrQXFjeUN1TDhhTEliMlhNc1NWY05OSyttb21hOU9YNThrUWFYSzNy?=
 =?utf-8?B?UzYyajVEbmd4UFdvWkpUc0l4U3E5Si9TTlcyTTU0OS8rMGtIUDkxYnBzaXJZ?=
 =?utf-8?B?Z2QzUklmMzhuUWNwU1VwekVOY3RKM1E1NVBKbDJwTXhpaWxCOHhCUUtnYlNa?=
 =?utf-8?B?VGlxRUNnOWJNMitGNUFxVkc2dDFnNTVnTm5iSHJiVkVKRUhMWStEZWc2bDUy?=
 =?utf-8?B?d0JIdFV1TnREOExRdGg4MmNvalAxYXByUUl4MDkwMjkyNkRvUC9qelNlRyt1?=
 =?utf-8?B?emgzRU81SENHRkRaNXYzZ2JQSEZVMVRvK3BvTUd6VjNTYUdkVXRJL2xxODFG?=
 =?utf-8?B?MWVjQmwxZEJncDFJOEFYUUNSK1dxQ2dWdmFyOW5KWm9xQUJHeGJSRzIycmNp?=
 =?utf-8?B?R3pQSDRYalpkOTE2MmtwZFBoNWdiazlSL2xSZ21ST2VLTVNmRFcwaUxDbzVP?=
 =?utf-8?B?ZkpsSjV1VEpQNzgxNENnSzYyVEEvMU1icWdvV3BNVFg3NVBhYS8vNnQzZWJM?=
 =?utf-8?B?ZWtuUEl4cE9HZnNVRWcxS1ZBRzFJT2EvRXFFTUFGbXdrR0hBV3pMdTVCeERy?=
 =?utf-8?B?M2lTVVJGQkJxbFVPVE5rVVRoYStKUGlCMngxWDl6OUVPQ1EwOE1PMlFKUk9M?=
 =?utf-8?B?b3RBNm1QTXZZWFE0OEhMN1VQRFN4SjFwOUFwTkpDbUhYMk9DRTNqMnk5RmEv?=
 =?utf-8?B?UE1BOExjZVVzSlQ2S0JxaVNXSTM2ZnRXZjJYVHF5TVlLRFNTNU81amZOVWt1?=
 =?utf-8?B?dzg5Zm5HbmF4TFR0cGJWTk5MZ094Z1dheHJ0WFNZYlNkSUloTitxNUNKMlJB?=
 =?utf-8?Q?6SVmT4XyWrDxTK7TG76jxiVgioaaKI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MDhzSFQ2VWNDaXBFVDBYWUxPMmMwTEU4aEF4Qk5KZmlxV3lWN2dzMGlYYlVU?=
 =?utf-8?B?ZnhjU0Vqd1VXaUllSDBjc1BXZHRNQVlWeFpCZ2xXMEZRanRiQ24xK202YjlS?=
 =?utf-8?B?OXRVT2EyZWd2WStDZXlPdW0rN2RNVGtkcEVRY0Y1WElYMUlzM2VHdFZYQ2tP?=
 =?utf-8?B?bEN6Si9rbXl4ZHdOd3BOM3JmZ0oxMjhaNTVNdm1hWEdlYWIybGVQdDNqYllt?=
 =?utf-8?B?MU1yWUV6V1kvaHpuVTI1bnowQ2t5a1FHMXBmWmppQXdoeXhrenlOejZvTnZk?=
 =?utf-8?B?blIrcTJlUFBzZUI2d3VDWVl0NEJlZlZLdzVPcXNueDltMlRRSVUvay93S3Nl?=
 =?utf-8?B?eTBXdGx4elhZWE9YUTJwNmdDMDh3QXRQZC96djlTWk9xVXQ0c0xvSmM5RXE4?=
 =?utf-8?B?eWdxZWM2RktPY09XbWVuM1lMYkJIWjRXZzNSdnloTzJtYkZUbTIrZUZXUWQ0?=
 =?utf-8?B?WTZHY0IzMXRBL3ltOElXZ3c5ZEY1d2hQWU13V3o0UHVFTnp2VUpMN2FrNEdx?=
 =?utf-8?B?eGhqdXYwUFkyeGp2N0JVZEx4Z0x3ZDA2U3kxUG1LSHE3ZlZqdVcxc3lqZ3ps?=
 =?utf-8?B?S1I3YlRmWWpYcjB6WitEd3puYnVxa3FGbTlxYys4cWw1MmlKZFRsbW4yQmNB?=
 =?utf-8?B?aWFJQXhoQmQxR3pWWWlzQnBDYlphY2hMWU9Vd0d6cVJqRkJFZnBCUUxBN2ho?=
 =?utf-8?B?eXE2ZExrbDU3N1FDYVE0eXlIWnBKcENvTysxdkRibFBTL0lqbTcyQjlUcWNK?=
 =?utf-8?B?MGRJVnZKN2R0eWF0VlV6YnRFdzNoMXg3NmxnQThEQnFsQVVuUDBscG1JWUxr?=
 =?utf-8?B?NmhsQVhtekNaWnpSZisrQzNQajNOTm9pQzQ4YURWNlNjU3Z3NSs5MUdNTjd4?=
 =?utf-8?B?V3VDZkFEdCtPQ1BFbzBVYVVwb0VoMFRUcmJPL1FndElyNEx0S082Y3hOaUNw?=
 =?utf-8?B?SHBXTlRySm5wRm4xaXlXbml6c2F4Q21zeGVpRGVkSFFJclBLcnNySGl5aERF?=
 =?utf-8?B?YXhUNFVCV3ZhdGdmRDQ2dmZ4clJhYzlCd0ZDMm1VcU0yT1M1ZThlZThsTFpF?=
 =?utf-8?B?dXovc0dKdDI4Z3l2alNKKzE0b1VKSGMxWDVibjJKM2tZQlBsMFMxTnZCSmR5?=
 =?utf-8?B?SWplQVBRWE0wT1NpWHpSSmNOT0NmV2Qya3U1ei9hTmNhMk56RGtNdXpvS3pm?=
 =?utf-8?B?ZUJtK3hrMlhlZ1RqSEhWNzkrUVQ1UXVUcE5qSW8xcTdRUFVsdWVLZFptdFZI?=
 =?utf-8?B?QUNnaDZEV1VhZUVZSmdidXZlS3IvenBkSFN2S3pFQitMbWdSWEY5eUR5Q1hx?=
 =?utf-8?B?NzU3Z1RUaVhwS3paOHh1NmlURmd6UXBQZ0hzRm5JVVZIak5NbXpEOGlRMUJO?=
 =?utf-8?B?ZmdoK3ZqcTE2ZFNzUExtZjlKUU4wSWV3TFlLM2YrODBCV3l2eFY0TUVQMzZY?=
 =?utf-8?B?dmdwTG9GcnJqSHRtdkZqbzFIWU11amVnelNrK2JzWGcwekNMc3NUc2pwcTZ0?=
 =?utf-8?B?cWt6bXZDemo4QVQ4ZkN6eFlhQmhCVzVWR25TMW1xdEZHVDRsVnptK3pHaDdE?=
 =?utf-8?B?dzRxanhjL3ZsNnJhSDZCdjhqcnZiaEJTei9zOHpjblNkbHBGcGt3VHZXRFEy?=
 =?utf-8?B?QktFMmNudk91ZHdRV0cxWnpLUHBCN3hMNDFIcDJ4VHMyRWtVK2hGMW5Nek9O?=
 =?utf-8?B?RFZXb2g2WjJHNWJtcXdYVDNWWkV3RzBTYkNuNXFmQzN2MnM2dlBYUDA5WFZW?=
 =?utf-8?B?NTF6NHVUS1hEY1dUd3E1d0ZFQkRFVC9XaFpHMnVvb3VlUlBMRjRkeFlqWXoy?=
 =?utf-8?B?akErTEt3bWN4dWcwOFVoblhKSnNocHZqTlY5bG0yWmFpNnFvNWptY2hIZTR0?=
 =?utf-8?B?MXdFby9vYnkrVnQwZ3pCWVdrbDEzTEZxVkZCRUNKZTRsZEFNMkxLcTRaM0hp?=
 =?utf-8?B?eFloamxFTXFuUkhRYUVsNlVlYml6NktFM05XMlBkSVdvMkorL3hpc0o0WDBw?=
 =?utf-8?B?WFgwazh2R1lONUJUTEZuL1hab3ZQYTJabGJlMFY4MWo3QTgyNElpd2NnTE02?=
 =?utf-8?B?YkFZajFFSTFlb0hNZDM2Q3RtVUtBMUk0Yi95bTVXeENaWmNRcVc0WXd6RmMr?=
 =?utf-8?Q?x45m5nlD1TyXBgUJb6f0L4Ard?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b596a385-b8e2-45ed-0a64-08dddfd97740
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:26.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfvQKYKwZKli7wRpBCuRxeBtyTQaDN9pJF/geaZKxI2MuC21dvyJuYkk7LYdActEUXgS7qtoV3CgFiYlXKmyqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

Simplify the code by using helper function media_bus_fmt_to_csi2_bpp()
to get width for supported format.

No functions changed.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 29 +++++----------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..85700655ecad334c61e9b5f9f073e10b6db2618f 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -25,6 +25,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -138,7 +139,6 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
-	u8 width;
 };
 
 /* -----------------------------------------------------------------------------
@@ -262,70 +262,49 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
-		.width = 14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
-		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
-		.width = 16,
-	}
+	},
 };
 
 static const struct csi2_pix_format *find_csi2_format(u32 code)
@@ -415,6 +394,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	u32 min_ths_settle, max_ths_settle, ths_settle_ns, esc_clk_period_ns;
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct csi2_pix_format *csi2_fmt;
+	u32 bpp;
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
@@ -427,8 +407,9 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
 	csi2_fmt = find_csi2_format(fmt->code);
+	bpp = media_bus_fmt_to_csi2_bpp(csi2_fmt->code);
 
-	link_freq = v4l2_get_link_freq(src_pad, csi2_fmt->width,
+	link_freq = v4l2_get_link_freq(src_pad, bpp,
 				       state->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(state->dev, "Unable to obtain link frequency: %d\n",

-- 
2.34.1


