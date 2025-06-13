Return-Path: <linux-media+bounces-34709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D917AD855D
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834B218966AE
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617AA26B76B;
	Fri, 13 Jun 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="FvIvxZpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013034.outbound.protection.outlook.com [52.101.127.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E82DA758;
	Fri, 13 Jun 2025 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802932; cv=fail; b=VeIAQr1D1eAEO8We2zI61yvpF/96KLKFO9/w4T1RBwTUoxA5t2P1IYsotvkP8NSuNPXG2/OeYb4Qe3KPeXLz7AkxTLg7iAOLXlPW4Qmpf4/gjUT3iglGeIQHixKZ+rXJEU6qXBViEbQJWwE7wsDj7qm3aIjDp71TANFuj9XZPeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802932; c=relaxed/simple;
	bh=AGsBymSlCOW8zosaHN0IgGC/xdjHJTBXfJGgP81g5jM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WOtijOpdA9KK9ZcGNhkvEuNCmpkEtrVxZ3/4EvyhyGH1rW+kCmpSVwUDD4TCkRQbCfn+nr2HB27jLnPr+hbAAZqN7oYCokYC8LWx5NZFUn3nyBbGyC4PaFqX5NdQrxdllmbp3Z7bKc2x4+ViC1McOdli9eHcFYDHoQSdxRJU/Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=FvIvxZpQ; arc=fail smtp.client-ip=52.101.127.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVbJKHKhJzkSyekOmIV+hwsO4ER3PHVncLEXIkqZ3Nb5NUoeu2e82Q3NjMw/U1VTJREXyp/OpdsUEyolfr1mTRzdMqir+tOXrDeOdmV8W2GqCNcnvqSFfHhHicBvLwIoGn+aYyEqZYXEOE5lXYcMwyOxJ9xlMf6JTxYjbCZ+ofoOIUQ1Zbo4d8pbAB2ohFv2LWL4ll2DebksslIt6RIl+4eV1MuEVz1cK8A5o2dE0k+1lsa/i32de8uepJSTHIESrxKyfgYY4WR43VgSwE3upXfhuE/nGrCLYkdn7Xn3B2hV4sbtvB2z/dZtSzanIe4iC809qQMmkEZVh2SeDP83dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gxYsPrYRYdCEcee5jq/x0SXNW1YhGxj0+BDmU+zuHg=;
 b=TrVZBTQ3lRKG+42uT1v1tM6gk7tX/xlQFQsLo1JDfSCeoo7lkE6ycXVLrTaMVwFQez0EF5wv5gmEjtaqGb4sumhpJdu7B7wzhfpWt2FokgnZ8RV7dNWn52yw14EPYY9a1NSL//23nGdhUCXdz4UPGqy7Hls+NlPO6pFwR5zgIIfBVewXg5Eaihn1wsV2aXdJ7L4S/pI27cwDiIPfhEGgCnnHsQS1VE2tZvnn1j1WpcZxkJ+NOAgsFGRibVoGmP8AdSi8mbDTXc1V+X1tH+RyZ6wFICgrLkwOT6bbM2TmPP11BtMWwLQc5wo4aMaDCgeIdEEF8NvWhhASYzS9J9K6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gxYsPrYRYdCEcee5jq/x0SXNW1YhGxj0+BDmU+zuHg=;
 b=FvIvxZpQzyCMansWUzLw3QTjE0CeOJpDLcnoF+pIPsRXaFJ5emHvk2GM0PvFYqd2phCIk7rLsqjSlROKlcjuam0GWW3/9XHcfs+jliWfkRlzNqshAogxP57z2rnPyb8X6h12KEe8dKdBudxhdIRNcDG/mTl+xVMusy7eKA3KzwXRklqgJwBUP+Z5pQLc7kQ9aja0PgbdpuIMwkX3qN6Wmr55QifVr1xz66Rji7bmUnYNRKrMZl6eEVS7doxsfZ+IvsW86UBn+UjlNEAH9XCm3Qhd3U9nrFUlPs6wZ+pE6R4Ty+dZain3LAVZMUYAOfIx3mTd8Ymwa7/60J7SXPz7Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by KL1PR0601MB5535.apcprd06.prod.outlook.com (2603:1096:820:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 08:22:08 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 08:22:08 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/3] pci: cx23885: Convert to use string choices helper
Date: Fri, 13 Jun 2025 16:21:54 +0800
Message-Id: <20250613082157.50040-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|KL1PR0601MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 248217cb-a152-480b-685f-08ddaa536340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PyWCclHnkwUTZg3IDIz6vurS02aLWbtnQx6EJNRBH8XOjw3vU5k1kxEu+ZoQ?=
 =?us-ascii?Q?dTu4PAc0qfW11q7ES4jm1YSF+8zl0AH0W2Dveda/HlfGfdb18xZ8uH4enzPd?=
 =?us-ascii?Q?lADK1nc0V3cW075W52bh8pL/SeCAVjqd+9qbX5bJMehA6KrZsdEmTBXicYUJ?=
 =?us-ascii?Q?wMONM4XOJBa64hPEnbK5bH4g8hRC2D/CNgPtI6pfiwN0oV2x/2KTvC4uTFBL?=
 =?us-ascii?Q?GPMNmEoqsao9cfFH/PKT8+WLQw//pOEs2Ey15t0z9IC3w0mV5KsoBF1H9R2O?=
 =?us-ascii?Q?G9KPXMOVLbQUX+P/XMlC1eGFJRi43Bvfk4Lr/PtiZlrf98RvipNrrH3qTaZE?=
 =?us-ascii?Q?8IbFJ3nyR8VTp9KHlfE0tUd5DX1iS/zjuEJpaGctUoL9GeNcxXRdFf55NfNn?=
 =?us-ascii?Q?+5Q7CfE0lo6NZhy+e0Ci7HnsmPLtxE+EqvHM0TgKQzd4nZ++I4SY1fv/Oe0R?=
 =?us-ascii?Q?vDqhWew6V/zkm3TOv2U4IRrvxbGXgUCCeEpZY/A3BCW/LUxHS47N9VzSQafM?=
 =?us-ascii?Q?Vxp1H5TPmDXC86oBEKWLuRfpRjf+OX1gOsy+cacrkRrpBaGEY9OvIeasUetU?=
 =?us-ascii?Q?SWhyPrHy+Q7B1Dq+MD8vN2gFAY0Bs/I8cyCH29vttHWozXUxTAVKNOiVoSW5?=
 =?us-ascii?Q?ssdWdtc/zSZL5H0GHK9Z9Z1ye5XTD3m/S81DroCHtcAKOoCzPSIBcFtxV6/S?=
 =?us-ascii?Q?wmAsG8781ed38UD9XKuei4HmL9vsmrRooUJ8VGwvxTs8ZyP2hQcFPD8wZcrq?=
 =?us-ascii?Q?tpdsCh/a9uGu0Aj32jVjOywiSIq/XKISM+UwAxHpEamSjKEw7MboTPuoSeEY?=
 =?us-ascii?Q?w6yxH/SbImgysg3hTe+tERBjUD1KHXVcsC75AkM/WNg9TZq8Fe6/c5ZYr1gE?=
 =?us-ascii?Q?jazXOat7CouCHlbybna8gNGxib/0BgvtqzWauc09Ph9DO6Y8HqVrDgy0VQra?=
 =?us-ascii?Q?3FWXUeFPy4Nl+M1hqJNJ6cv9kOJi2eU5Pf/sYh7fPemHIMS76vEvBPEoML+w?=
 =?us-ascii?Q?V4y9CDokYRfOFfmeHiJHQc9x/khD5+qzDbEP7k6WdKtEdHRvntpuQs2Vnxyl?=
 =?us-ascii?Q?9vFhkg+wMN9im6uzHxyt0/i9vZCNhwTDnx/lmfQQPaBMpkYBUfwkd7SIrQEH?=
 =?us-ascii?Q?zsbIQDhGVWqwJovvyGJVNVIMRl1MemYLV2uE0ynFVzQCMyo+yxejU/QlWLWD?=
 =?us-ascii?Q?/4GQn2H2OGZfvWZxhj4o+kU62W/zrgrvYdOuBW6KR45fHirw9WuwGrvPkm1O?=
 =?us-ascii?Q?8p5hk9KPLoYL/xnBEqewl55BbRtgwqWLyjltQ0Yl1j7NaBFrAHlDpln8HDV6?=
 =?us-ascii?Q?cq5pGC6ckG9E8PeYnSGQ6C+sEiV8KMkAb/qUbPYqidM077671SQYhE4d2HxM?=
 =?us-ascii?Q?QQuGAAX4jdCv+p85i7kvY90Br+lQKmmz3V63HWlmGDy8JmiAGMVL7mvApw5N?=
 =?us-ascii?Q?Lg5YKsvqdZPNXtFe/l9NUdXnlHvzhbGcN5mZISv+VSpVTnV+/HeAgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aYIlMCatovkkYFsUmkdNbxkcJVj5Em/kCxpQNqCxo2Q9UMx0WJnRCNb7ASb7?=
 =?us-ascii?Q?xNa/ldWwmPeKryqpZWIFjZJPYiDCb8C6YnOo0DLfDLRJIyoN3dvEWRj6fLgD?=
 =?us-ascii?Q?WVefMsC0a58mwZPGhMKviD1NTMqA+1105dSGJcjkb3r7foKEgjfv8kmErx2b?=
 =?us-ascii?Q?eCC5myjqXfAFhxORmk6bnZjwfJI1BrncgXTBIjd0VvRimmFS9zMqKS7Y8q2C?=
 =?us-ascii?Q?fQucQ7T+49vL32WJ8vJbZLah/FlziGZ3SxPfgPydMFANKj8xyKgJcc2D8obA?=
 =?us-ascii?Q?LSeZbmh1O1NdXI6M/7XmeiXIwHevMBsBfAz4NHD+OYHI/peozLBaH4hclR4A?=
 =?us-ascii?Q?0uVJ4+ZV4LP7fw22o7Jo98P9PwjeJzMWTDHS4Ga3xYYqIimR76HxSdDn8O/q?=
 =?us-ascii?Q?NZiwzOVM+paDJ34QSKCRYzVLUCjlzVbAYF8j6R9DHRVxG8eyHZhDb0T/+Su6?=
 =?us-ascii?Q?o4Vg4/BHRa0EMRuZ0d1fk9BnxNNLPp/BVcksrcOLyQPZckNjXoZTtC+fH54w?=
 =?us-ascii?Q?WvhOvZDTdLCRowg+TEESY6GqnwBbAj3VuFJ0xperQH+Xj8KtYfyDljhKQJNe?=
 =?us-ascii?Q?7O5DCktf3ulzg2TrQ12QSyd0FQK6mst2c98x/W3tpMRzkPy7we6rpNjgLc/v?=
 =?us-ascii?Q?r10dTtRKRB8+oTDHt2ulS3piVKeBD/n7kPiUQ5nmDroT0WRllIGVLMPrQD6J?=
 =?us-ascii?Q?SRIzarh7QqTOeTRfu4eesMEL14ZUPhyEoyWyEZA5Y3xB/yqecD5gMx3liph/?=
 =?us-ascii?Q?A9tcYQ5Vi9lI75JCtjOXtJrjt5w3Y2KXrf+MrE8Te/S9U4Et3z9wFgW7609r?=
 =?us-ascii?Q?lC+C0VsXIan0c9fV3/eXzFYSvNMSf71VeM0VBSic5Ved62t5BabbdB4cwGuu?=
 =?us-ascii?Q?ReY3BhKQKUFn0G6mY6WsVB49aohVOTQ9a2wGjKOGuSml/o6OYEc4/sbdQge4?=
 =?us-ascii?Q?tktooO1yADHASJjQTUqAt1Fa/YdzZUZyTWZKDqxh1yx/JuBR79R9enUiN8DK?=
 =?us-ascii?Q?Tfx8DKo5LHA0D4pmPmV3/yCOZxI/EQG6cSCzwTdapY9f9WKBxumrw9x371m/?=
 =?us-ascii?Q?2ObxQf3WDWKxFUOpMJiDihAZbPIK6MPg16w6izVgi6e8BD+QDPxeHMVtyT2Q?=
 =?us-ascii?Q?EWqa7HHpad0uPKAqLYaqUGM+FJNN51CQMzwpdGDjl6UVf7BqDdpkBqIg/+cF?=
 =?us-ascii?Q?Pga6XaaA7XqMIPZtIK33FEuC+szq0J4tXxR1zYBwOnlthgy3e16HfNWFw87x?=
 =?us-ascii?Q?Xtx9+UDRXXyrbiIf6wQE9CP5Ua0iEo1xRE9QLtbU05v9mbxQPyFMWFIqxVo7?=
 =?us-ascii?Q?Wwp5tNVowEo3U+6nlLXkWykY+01RZobo8iQ3qTSmZ6AFdZ7cvs8hIPHacJyn?=
 =?us-ascii?Q?JkDqqZ4QPPBqjkEjvFhuUIcXkE+FAkpSC9L1Q8ttG3XgKSMonnIHgtKXf6vk?=
 =?us-ascii?Q?9NWogCBxaIn4HdAvSnFpDz8PZWrPtFG27ixKSUA1flFggi2wzaTK3dzSvXWG?=
 =?us-ascii?Q?+FvIhzGDfOErrhssyronk2CJdg78w6gODV45+26+KkxYN7oAxRw+XxJ5bMx6?=
 =?us-ascii?Q?HIT/S1hS4Tj2UfDUe6GL3n8XXCG3FPGRIUL1ls63?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248217cb-a152-480b-685f-08ddaa536340
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:22:08.3076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0itkjS+Q9SqbqZlIDtnC8ZC04MYXpEWdY1CPO3B6e07S8mvd/76KDDzuehBFodEqbi1VnGZG9n+1P7/OHOqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5535

Remove hard-coded strings by using the str_read_write(),
str_yes_no() and str_enabled_disabled() helper.

Pan Chuang (3):
  pci: cx23885: altera-ci: Use str_read_write() helper
  pci: cx23885: cimax2: Use str_read_write() helper
  pci: cx23885: cx23888-ir: Use str_yes_no() and str_enabled_disabled()
    helper

 drivers/media/pci/cx23885/altera-ci.c  |  2 +-
 drivers/media/pci/cx23885/cimax2.c     |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c | 36 +++++++++++++-------------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.0


