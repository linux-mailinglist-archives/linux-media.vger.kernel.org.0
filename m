Return-Path: <linux-media+bounces-39181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB5B1F111
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DEBFAA07CD
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDCE28B4E3;
	Fri,  8 Aug 2025 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kSn17k7h"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DA2BD02A;
	Fri,  8 Aug 2025 22:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692972; cv=fail; b=BTNrXfx0ROWpakxIL2Smv3oCaznFbTDWKIJvzMw2GT8v37r+dg2E1QdRsnJUdTzNpuwfL/9qG+L8gVADXXj+tCNwp2HND1isoYOAuDgBx/VV9K8xjbUIFuOgZfEPrEoohGcf/x7p0nurGXEmxygVZGSWI/yQ0jVYBiN9BTtvCi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692972; c=relaxed/simple;
	bh=H2fzMUwVftuvc9kXbyZmiyW44E9tjUoIJlNIL7dUMyw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a/oQDYfJ1W/y2mdi9XeJJ9SuQ73gpCSgmYBb5nrGjtQw8/bS2FRGEW2oFDpaaqdZ5E5+E9sw3e94aJUbQg3C0yWutM7vJmAjE1XWutdNjMYlQN+Lg1gEUbcWtEG/H8j11FE7WOo1XETfKG1gggI6oKMnT1fj7mgk+pqOS/q2Hn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kSn17k7h; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVnDs/7mgDRbjH7b0Z/naQKzNAyS54ApTJKY5U/RldIiRj0p4kQu+KrOUB62tjIzMEH9/dDA0cwZtyHFa8BkdfwepCaokI5BywOZA0xBv5F/MhV+SPCsLJbSTTRXMKwiNNDtD4OkEKwX3DN/zLVoOCgljHDKkdWS/v8z7qn7FusLr3QDu/zQdOLB4Fd1aMQdWYl1dUu3LwViRbYhQyo6fd7zCUDvqImzWn9HXZHhSXQB0umzCZ3xdtKrhG/lQcYm9aAdteKbLgoRqFXmROJArqYFwoER70nz4e6uxwB5x9Ahg6elWUisYd331OiSVrMX4T1ld0LWX/S35NiTvtlk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrewm16Tuc7fRqW89eUN0v5R2FaDyavmVWudz8clORY=;
 b=OKfb66t++3JOkH2XJtdQMsBgwIKJizix9nI1Q56WVBZyWp3BOiT2g6b8wRqn5PDb0JSNJwGDYW8gsMX1xD+oS7MyAy+USgfmraXVERQdGD/4yy8YOxgG4S3/nf5svh8kPNZbTt8AzFALGrfF6nKxBGPFxpJHeBxa6ktlffcVfmPuOVYnkomBCa0QCgmdj8ddXIar7cW7+GbuSBpwksqPMaXALPDaRymxpLmlv/qttQ13RufxnKM5yjzI/AkQRPNHwIXRoQ6qQN+dzJNzOeETMkiqYcSuFcd1Pubr5H3yOj2tcgTAfQG52Hb25oUD2fK0dBqFKFkUID/yKHH1pWTVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrewm16Tuc7fRqW89eUN0v5R2FaDyavmVWudz8clORY=;
 b=kSn17k7hlNnqfY3QmObbTFpGDguqIHC5YSMJta3CfjTt5vIQ4m9WdUblotWgPGGDg6lUoAunMzPDK3WG3GNZkJM9743DXRG7PvvClbGk0gWx6HVGCnc3ZWcm3dXtP86zHW9SJPKjINMGuofh+oFphkNZszbAxpYdjwWgjZTi2nHo2lCtMApbynCThQMBCoNsb6taq8/WsJADcWKAX44Q56W+BtGcb25PxsuM8g5kXtaHBB29+nrpR5L3qXj2PlvIVwmpNjAZXRMhQznx/ReQOt5B9C3iY7dXRip9E7Jc3hKN0/bcnw4/d0F4uNuCxamSs8X8BJahL7iQXcwjXiDcJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:32 -0400
Subject: [PATCH v2 29/32] media: synopsys: csi2: Add customize
 get_frame_desc() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-29-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3176;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=H2fzMUwVftuvc9kXbyZmiyW44E9tjUoIJlNIL7dUMyw=;
 b=VPRi1dq6/Ex7O9xsA2YTVcPp8hLpzq8Y6vO0VgUHSFwAaWpYFsz6RTmVF/x8r5vjWYTcCLpEr
 Zjtcp/Fge+6BPOPscfJYiOuwwYGT9WBKe+Io2m6UC3chZL4SBtJRcwx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f95ac63-ec56-48ab-8af6-08ddd6cce601
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dlZLMHBMVFUzczZ5Y05rVUdkSnBKcU1ESlFrL2dpV01TWmVkMjIvUnliektO?=
 =?utf-8?B?VWc3ZjBsMnZNS3FDbzZwUzd1Zm9JUS9ldzlVRDZSdFBrd2xqdmpQanBZOUor?=
 =?utf-8?B?OHRoRFZnL2VZMzFiTFZiU1g0SGpHYUF6UkVzalZhVFpGd1p6Ujd2SElIMnB5?=
 =?utf-8?B?b1ZmY2hYQSs3c3BVY2dSYkE2QTFNV0V1emtsemNNQXdQUzQybHNXaC9OSXpn?=
 =?utf-8?B?VjFnbmtnY3RRd3l5RkpDNy8ra1k5MldEVFJXOS9mM2J6SHNXbEhVS0ZFay9U?=
 =?utf-8?B?bGNPZkplalVVaTRMVTVtOUFrUlNLUUlIYlNWb2FGU3RQSytDWUkwajJKTkpz?=
 =?utf-8?B?L3orODVmMktza0g3WTNzYWJReTdNMGs0L0t4RE1BSDNjcnRtWkw1ZUJUU3ps?=
 =?utf-8?B?WDlETGdvSlRFMXRoVkRQSFhoaDNYcTg4Z1JZZWVuMTNuejBqNktEZWh5WlVt?=
 =?utf-8?B?UDI0QVFqWWZmK3llWloxOTQ0TG9uRlluTGM3VE4zdnZCeUVsSU5VY3FFeXhp?=
 =?utf-8?B?RlVhQ3JMUmcwYk50dnk4cnFQYlhHS0dpTU13d3JvZWI3bVpIcUxJdHJSd3ZL?=
 =?utf-8?B?ZXZJUkdhbUcrY05Ya1NmeTVlQ3IzcVBHVXBmVFlZYXpXdWlaMW56UFRCTi91?=
 =?utf-8?B?K1QyK3VsNXUySGtDek5IM0JqVUFJV1VZbjM2b3UwT0ZzbE5nSUJuMks2NVVi?=
 =?utf-8?B?N29GS3lTN0RZcDBHbjMzTDYzanhBZFh5M3NHUmd2WFpLTzJyMEE4QkJENFpV?=
 =?utf-8?B?NTZOdXFzUW9qZFRDM2dEaXlSVjh5UVdhL3orcXpTOFp0K2ZjY3Frd0VlK1Jw?=
 =?utf-8?B?QlREUmdqcGxCNVVxbThzWkpKbllGQmlHSE43Um1BdFRyZUJQRWZGY3gvbCs0?=
 =?utf-8?B?NFdIbDFwQ1JOalJXZmxPbmZ6Q01hdjcxcGZEaDB5aFZtdFJGb0p0aXlBNDdP?=
 =?utf-8?B?czdyN3pLM2plMjByNThVRS9MYURDVlVBMG9GRDVPWWc0ZTBUZVVvalNOR2VO?=
 =?utf-8?B?WXA2UWUvbXVxTHpWWlVvTHFkdU56S3VudW02MFBSTGxONDhOZTg3T1NLSlBu?=
 =?utf-8?B?MVdTbXFMa0VYZkp0Q1lmbmpaa3JjMENtRHlRWjZ3WjFZeTFZNjdZbmdpdmtp?=
 =?utf-8?B?aEVwWXNyVVdmQ1lOc3daMi9Na2JubURPb3Z4SjByRHdVYVhZVnBzWmE4ZXA0?=
 =?utf-8?B?OSt3Mzlwa0tsbFlRZnlxT1VHTWdhbWIzUVVHYkUwclZ2dnNQd3hUQnIwZkd3?=
 =?utf-8?B?WXBQRkhnQk9JTitSSzFWLy9xeXc2UEcxbzR6a0piN0pHUE1wWTFkZUtZVFJO?=
 =?utf-8?B?cHhQdU1OQUdKOW1uejc2VzRFVnpleXNmLysxcFdVa0Q0dlYwUzlNOTBsazZW?=
 =?utf-8?B?eWxmWDJmQVlMVTc4L2h2YThkUStBS2ZGTEhtUXRkQW1BVEpKQWtNSkJjZkIx?=
 =?utf-8?B?TTNJaUhHMit0aWJsbVh1TWhNb1lndDBnc2lSTUJuTWw4aEJPakxvYm84ZlBu?=
 =?utf-8?B?QW9YVERZUnpwMk9ZenJJRnlLTDZycnlkSFFLa3QzVzJpVVFoQk45WEVWZGlw?=
 =?utf-8?B?TEEyeUxYUFBwYmR5N3dHYkNYeG1NRzgvTTZXUTlpVnVSZjVqZGNydGRIb0N5?=
 =?utf-8?B?L2NJOHp5OXZrZjdtcVllWmNpdjU3N21kblF6QWxIbmZWRlJ0VUJMQUtqWENs?=
 =?utf-8?B?NEVaRm9Ldit6R2NVeHE1WHlkUytDVjloUDRsS1JHTEVJMjJFYUN0VEJnZ1RT?=
 =?utf-8?B?Tmw4UllWYllxcktoWTVLK1huQTRlYmtBZElqYUtibTY4ZlpDemd5RmwvM1NR?=
 =?utf-8?B?RkUyMFpha3hRRXRoc3hRWktFQmJGb2t0M3Zzb0pXSSswRXg1dUdCcDRrWU1F?=
 =?utf-8?B?Rm9lREk0RGV5RHpBZ0NGcUkwZ1NuVTVUWHN0OE5WcWZlNHl5bUZEVk5qOVRI?=
 =?utf-8?B?cVNhZUJKVFFiQ1YvSkhXSDdKZlE0UStFZjREQ3NEdEYyNm9BdXMrMXRRYXcw?=
 =?utf-8?Q?lC7XPSZ6CaWron4L08QybF5ZKyuimE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UTUwdmhPVVBvMjRVOHNFT25pVjFhWTFBSGNPcGxSU1NGYTA3ZFJzLzlNbmdl?=
 =?utf-8?B?TWt4eEc2K2hmK1NNenZkV0hqanFyUkdyNVFGSjNFbURiM3A1a2FUSUhCZ2Zi?=
 =?utf-8?B?K3dnTnpMUURaNmp2SFNNaGdnTW4zYk91a2c0MmhSSU1mZTRIU2xMYkFDTXlu?=
 =?utf-8?B?amsvb2JxeGE0c29LWjlWT2xtN25vclJMZldmS3dVYTc4QkhhRURxWWo3aUhy?=
 =?utf-8?B?dzdqUnhwQjdSbmRadlo5NUwwVlRGTE44ZWF0T1ZkQlJHNXJVYjZ2WkRJbTdz?=
 =?utf-8?B?OGhwMHR4bzNEemxBQkdEOXR1d2JNSFREYnV0bjM2MkpRTlFFM0NQNnBPRUd0?=
 =?utf-8?B?NktiWkZ1aGxiR3hQRmw2bmw4a2pEVFg4RmkxWVVuVTBHU0YzSG9vUUxTK3RV?=
 =?utf-8?B?UFVGNE9hU3hUajM0ckF3RWttWGlHNXJRN0kvVDlPNnFQRUorZmhaS0ZUQ1Jn?=
 =?utf-8?B?cWpXWDd1bEJTYTRHWUk2bmxpUjJuYmxibG1aZjlwYnB4Wlo0S3pIYTgrZDVU?=
 =?utf-8?B?czRtZUJCalVpMHRVOXVQSy9yUE9RYmhmUzhFb3ZXbXZ6M0NWMkdwMFlSZ3Vi?=
 =?utf-8?B?bytNQ0pqTHNHclhoSzg4dWgzQXhubWZpTjZ3RUphN2k3Skk5eWlNb2lwaE9X?=
 =?utf-8?B?cURwU0wzSWp0bXhqVFlsdUVzWXZIQ0d5OHhNR1VGMGRwUU9DcFptTWVWdUdI?=
 =?utf-8?B?YmdOczhyeXBvZ3I4dnExZmpJcDRDZlNYbWxJcVkzeWpkRFdJS2ZHNjVaL20w?=
 =?utf-8?B?ZnV6czN6VlVGK0UvR0dQYXpxaDgrdVBiNURGVnVlZ0psWkpSZnU5eGpQODNX?=
 =?utf-8?B?RFFGRGVJM2NXZjBDaDNuMGxkNW1xbU5ZdGxNSEJ6U1ZaNUJZdE9pRCtoSSs1?=
 =?utf-8?B?MDJkajRkbHJrU1NtcS93RHN3MzdPT0NrcGw0UzVjVHMrQ01UTklWNUhUUjhE?=
 =?utf-8?B?S1Z4aXBhNDIvVFZxMllHSTBFbUVJWVlMclR6VTBiS3E0Qmgrc0RPNnpIT2M5?=
 =?utf-8?B?RkxPeWhzUnFiUFh5alZrNmJFaDIyNHROSDVBdHY1anUwQ1RsT1ZtNXNYQmJ4?=
 =?utf-8?B?dmdCUXVxUlpMZVFOZE96SHM1WjNFM1Azc0lsdXQ1bXpqM0lONWFjVkNaQ3cx?=
 =?utf-8?B?U1o0aVFGUk5hcldqZTVrUVoyN0xWbzRZSHloY2pXVWtTZEw0Q213RW9DOHFV?=
 =?utf-8?B?dGxoT2VPUHZBeHp5Q0JLS3JpNFM4QnpzbVdIaFhjalJXRlBVSXIybDErREhh?=
 =?utf-8?B?SlpxS3MvYzlTbmYzaEppckF3UG1rWXVWU2pMbVluYjdaOEZ5amdOMnNEUnBq?=
 =?utf-8?B?V3dtN2NSVzMwMUFXRW0vRkg5aHcwZVpuMUNYZEdEZ2xRTEdacGFFQ2RPVXMv?=
 =?utf-8?B?eEZJTDRFejUwdWJSM2lqNGhXM1BRTDJadHM2RnM0Qm0xVGNvdjJNUldsWDY3?=
 =?utf-8?B?WlhnR3FOc0Q3QVJlRFY4czNLY1ZYTVZJZkhZZm9WNmlnek84dkZTL3pWUGVv?=
 =?utf-8?B?WjBJTVhOdUZqWVhkR2RJSXJqOFFSaU9tVnMwTEdQeGZDb2IyRHVBbTRta21B?=
 =?utf-8?B?V1Z0bFF1Uk5yekhrQVFVemhRY0pIUk91VjNPNCswcjJOY1BnS1NjL3F2bUww?=
 =?utf-8?B?S0VyUjJ5QVF6cE1UVVFGMW9LL1o5aXFuTG1nRDBtVkkrM0RPYzBrdjQyektu?=
 =?utf-8?B?dnFXS1R4Y1Eza3UwU0g0VTlQQzM4eUxkR3A2RE1razU4UCtwb1NYaUxuNzJr?=
 =?utf-8?B?VFQ2Q1FEWERJczVxYW15NFdRRU9mWTZtcGQwSDdhVnRIazE3RHREQUVPazlS?=
 =?utf-8?B?ZGxrUk00VzNvMHIrWFYvODZiSkkxb21XekNFWmZ1WVpIQytmdVlFb3RRUnM4?=
 =?utf-8?B?MDdUM0pBeXBPVTlnckhZUlVHb2F5REFyS1FXSmc2R0JGZ1Q5ZzkvRkdSaVdI?=
 =?utf-8?B?MmNvaUVZQ1lzS3UrNHdrbjZxakZ3OXVzRWR2WmIxNW5HV1BxZVNHdGRVNEtF?=
 =?utf-8?B?bDNIVE52VDhFMjdrRlJsODFucHNQcU5vdDQ2c2tjR0FXWXhSUzNqeVUrYUk2?=
 =?utf-8?B?dzBVN1p6SE0zSXh5dTk1WU9zQU5rdVppTS8xbEV1cU9vR0tDeC9rYTRmeTcw?=
 =?utf-8?Q?o4iOABol8zQuesEEc4u6EypfT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f95ac63-ec56-48ab-8af6-08ddd6cce601
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:47.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2FzaFtBO/vV7Cd7meSikwhw25SOgeLfOeoCokEyzD75KHCXWhXPJ7Mbtjq0/HgbQ8ktCRyBUqzZNYqLqxvZuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add customize get_frame_desc() callback to work with existed isi drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index f174dfded167fbd52a72894c3f63871812ca799b..8051cfcd8ee158c5efccae9aff124c01a878e916 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -761,6 +761,78 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int dw_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int data_type;
+	int ret;
+
+	if (!(csi2->pad[pad].flags & MEDIA_PAD_FL_SOURCE))
+		return -EINVAL;
+
+	memset(fd, 0, sizeof(*fd));
+
+	data_type = media_bus_fmt_to_csi2_dt(csi2->format_mbus.code);
+
+	ret = v4l2_subdev_call(csi2->src_sd, pad, get_frame_desc,
+			       csi2->remote_pad, &source_fd);
+	if (ret < 0) {
+		dev_info(csi2->dev,
+			 "Remote sub-device on pad %d should implement .get_frame_desc! Forcing VC = 0 and DT = %x\n",
+			 pad, data_type);
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->num_entries = 1;
+		fd->entry[0].pixelcode = csi2->format_mbus.code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = data_type;
+
+		return 0;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < source_fd.num_entries; ++i) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(csi2->dev,
+				"Failed to find stream from source frames desc\n");
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = entry->flags;
+		fd->entry[fd->num_entries].length = entry->length;
+		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
 /* --------------- CORE OPS --------------- */
 
 static int csi2_log_status(struct v4l2_subdev *sd)
@@ -799,6 +871,7 @@ static const struct media_entity_operations csi2_entity_ops = {
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = csi2_set_fmt,
+	.get_frame_desc = dw_csi2_get_frame_desc,
 	.enable_streams = dw_csi2_enable_streams,
 	.disable_streams = dw_csi2_disable_streams,
 };

-- 
2.34.1


