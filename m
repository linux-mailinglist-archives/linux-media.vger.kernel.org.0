Return-Path: <linux-media+bounces-48305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E2CA6F36
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 737E930385D3
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7492631B110;
	Fri,  5 Dec 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xvKhWF9/"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613831ED81;
	Fri,  5 Dec 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925684; cv=fail; b=eXFTSVWRIdtL3im8jvzEAEQF66qIOt51QxWvMUXxS/AQ53nM/j89oARAnKeWpr02Ab0qzHaBX8LVWo0xzJV1K7PviwoUq36yBS7dsaDiu3/dmGYLJNhs5z8UuaWUppqVyAwZePVyb4YlkcBdyqDt/KOMbkIGG2XkGRijFfAIOLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925684; c=relaxed/simple;
	bh=xEUciYOvjxPFLSqrhfO8PREpxBeLfsCX7FhUC18Crfs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XW81uFADjHXH6ZPR5Jl3Ng2nMUIg3V7ZkvYDVQI8B1zHg8vEfNneHAHEashfYz1zuKG878T44XH7bt5fyNA2/XsSlMEg6llSTrCUIj3P4+Ida0dyGOOQLVsOw4sb0zDJPmiB6fiEt5wyTHP+Ixx1V1/FQQkN+hlvRC2EhuQX+cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xvKhWF9/; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcIfJDy5XxTRXOPm92koNI05ej7KfVfYqH5HyGbODmvC4OUzfMFmDJPAkSBVNSTteX3v1EBfVe4qJ8JoRgVElNon6QBdN4qxNUXuDyQSKIEKhZJytMlQROW0g0XYK09PQF+kW0tuZzd/vI4pAmu8vfMSe22o141WdMs44JFLGgxawCSi/0+fwRPQJIxYbm9F6hnUAGqpNQ6L2t1ebARvsEO6Y1vASYfWCWI6au69+oykfCIEV1Zi4POEt8NUiUk2Z+sbW52c4zUQh1Ni5TrDDWwoHhp2TBhI347wxqBsx0+pMh8CFxC3MhBOvxoGU2KL7eybPTSUNtqHGmyc2soVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZpqWEVB71WnvtRtJlMWCmJYMrod3hXFjEr+iTM3o+U=;
 b=gCIQQjdabCpCymWa/rOvbibgglzUJuNDcBNa4RQtSaEGNlkE/6nGMh5YJ+halSZ6Jc9arR0COd+PGOhwI2gDaP1UW2dQGbyGUOP5QoFtJOTfTijiBeRq9kb300L8mOlevPqKJw+UrYp9qIoW0/sy+99RwyEOmFcizMi0sXhq4v3rv0WHLH68gIhNdhv6A6boEvz2f+tW7NLXaZjEyE4VA+y2Pc13pF8fOVypZoarTHCSBOg1e8gTUkIyF8Yi1UBZUIY1hBGNdj7GI4T3B+tZsj/amSj1YgA7U9Xe8NDTUE3H1kTrtM2FTHnQDe7JpDCIStJbVihNO19I1lzGqtFIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZpqWEVB71WnvtRtJlMWCmJYMrod3hXFjEr+iTM3o+U=;
 b=xvKhWF9/JSDR6BsF8R1JqBoMOdVrPB5fLrkpxZM/mQRhfFdwBtKWQzdplyhr4+yiiuylD9U9VZKUMOd7qFhINgfNVOHJg6XCYHNaiClqZiPAstOUzdBNhxaV65zDun33OVWXEYpU4NQQf+FZl7Xevrd3x3Iizj75bSoL3H+vQyx7MPptgWr+h81FmsZLe7A1HXwi0sRhDCwoswaCB9AGzbn9YI7MmDKkMh2g0waS3KtCKHfM1hGfzQCSlZusFpe7Fdd7StB2KCppCsXbPJQBqpUObVIM+7jk+I6SuANhTPWC8j7lKvo+C+LV+jLru7gsViAf9FXVdZh3kMQMGBI/EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:18 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 05 Dec 2025 17:07:44 +0800
Subject: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-csi2_imx8ulp-v10-2-190cdadb20a3@nxp.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
In-Reply-To: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925695; l=4083;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=5wcKtcMH3+q9ayHu0VmhmjzBtHuM1z3IqkOUJPSKHzc=;
 b=KqMkdXlI7v2lAPWan0lLlT4ij7ka/NbxMKwXLeZssLYA4GcOcQXVav60yVrDTdinmfcZxgKBG
 grWjaTZFBEkB16SrZ6ZcwqhHyxS0cEk15LfXGbtdwNktxpsSv0yYuAE
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: 813fa392-605e-44f9-69f6-08de33ddb085
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?emg3WlppdmMwWWtaNEhXR2tJVFJ1MUh4M0Fxd1VBRXc2aTM3Y0grOVNsUUFo?=
 =?utf-8?B?aE9QZGIwNmM1eC9tS09GOGlRUTVWQ0lkN0c2ZXYxcEM1WDlMcFlYcEp0em4r?=
 =?utf-8?B?bG9DTjNPQ0U3dC9BV3FtMWc3UmdpWVJpenZMd2FTU0RvWk1iaVByRG9DcmJX?=
 =?utf-8?B?cWlnSk1RSFBRZk45U1diL1JkVml2VjNGa0RwN0c0aTlENDVReGwzdlpFQ2Zp?=
 =?utf-8?B?YjJBOXJWTU11UTBOa040VklEcTRDbWdoNTFUcVhJTEo5bSsvOTBLMEFEd2t5?=
 =?utf-8?B?MzNYVFd4NmF2ZktmclpiWU51c05NWlJvNUhPNi9tKzlFbGFFQU1hdzNhUzFL?=
 =?utf-8?B?YXZSdktsVk5TMHgzcU0zZU1mcmg1VG1CdHpLL0VLWGMrRVg4SUxEeDdGbkF5?=
 =?utf-8?B?RjQvSWw2QUo4SVRHUnpZYmdTS2tybGlVQW4zcytzbWVPd0luTFY5N1k2SjB4?=
 =?utf-8?B?YjRSazM0bXdtUEVuQktYL2crdmJCVDhLTEJOcXQ2VnhPdlpmdWY4UlR3LzE1?=
 =?utf-8?B?Mm9Vdk1KdHNjL3FYSUM2MFdXZ0dudzMxSk1mcmVIT2F5NUl5aWU5T0oxRDR0?=
 =?utf-8?B?Q1MrdU1nQlFLTi9WRWtaRE01OTBsTnhpUGkyd29WOUNDUG8vc2FyL1V1TWtC?=
 =?utf-8?B?RXd1bWcxUEwyQ1Ntb3hUQ3lIczhOdFl5ZmRIQlpkQ2trdjQ2SmtJTGxqQmhC?=
 =?utf-8?B?aW1GU1dIekU2SUVmY2dUUTJ3RUxPbEpnVkxuRkhUN1R6ZHV1elpabHU1UWFD?=
 =?utf-8?B?eElPRDlNMnhSSW83eWE4U0NQa21SQWZ2cFRpV0EzeUlDTmlma2lXNUhYcCtw?=
 =?utf-8?B?RWhoTWE0VW1aTDRnTFlpbmNkQ2Z1dzFFczloWUdncnVKcDlBdjd1VEN2d0Vv?=
 =?utf-8?B?Uld3aHJaZ2RUTEtiK3JmdGl2N3NZTFh3VnUvZHlnd3VseDdKK1lQSFdmYisv?=
 =?utf-8?B?aTFjY3NYUndxekF4MHY4N0RNVDJ3eWxXZW8rTzRxaHlDTFAyRlg0S2o1QnhC?=
 =?utf-8?B?OWd6TldaOU9DRFBnSGlDQ3lnY0s2UDQwM25Ca0J2WVM0cWcvRzF4MEtUenNQ?=
 =?utf-8?B?K3JYRURGUXZzTXJSbGhHZm1McE5JRzF4cUlPQTNVNUZ4K2kwUDgyeWZ6SU84?=
 =?utf-8?B?MTk3VTFocmE5RDVMc2MvdFJjeTJZWnpCSVJDcDNGekV4dUc3S3YxSFFNK3RB?=
 =?utf-8?B?a09IT1B6SUdTMGZvbTRQWTcvQ3pQREZ5eHNUQ0xtckZ4VDdWZVlaM3lLdVhK?=
 =?utf-8?B?NG9pRHM5b1d5VjMzRlhGMnFnbzhOeFhGUkp2bU12b2FESDRPaFA2ODZmemhN?=
 =?utf-8?B?ejFvVGt3bzZubGNLemxMQUVUSDhQdzArUXNwU3lNWVhjQkxGSk5OUWpkVEZJ?=
 =?utf-8?B?cWZXZ2R0SHIvdlJ1TzhZUiswK3V2b3Eyck1ONkhSQXg2OU9iVGpPQTlVT0hI?=
 =?utf-8?B?SThXMzBuYXMrMG5BSzN5QkNpTWd0RVg2MnlBOVdvM0ErOFBqdEc1NjBmWjVW?=
 =?utf-8?B?dTVZTmNyd3lJL2Q1ZnFkZnVKZktzUWlRSXRwNnljN3VqZ1NEV0VQNG91a24z?=
 =?utf-8?B?MElRNVBIODNHd1NKNEROQVpqWElaYko4UWt3ZnAzOU9yM2RGSVdNd1I0bkhD?=
 =?utf-8?B?dmY1TVd6TTRUTjhydTVicVNEcVdibzNxNDU1MnptcDY5a1dIZXp1T2N2ZXU3?=
 =?utf-8?B?RUNkQ29mR21wa2xVYnFKQitjLys3Q2dET29EMTFaKytXKy9va0hxMjR5eEg3?=
 =?utf-8?B?dmR4eU1adkxqK0VqR3lzdzF3VEFXMGdScWdlazlnVC8zNXBKcWZHVVNod2Jo?=
 =?utf-8?B?dWR6SEFnbThvbGdXVFJoTVc3QjNZU1l1bWN3UkVGZjMwdTh2SG1MM2I4c0xD?=
 =?utf-8?B?L3VJeWMzTWg0RGxWRmt3ZTU0Vzh3RU9ONm5zQWhJZFZybzdkc1RMNU5KaSs0?=
 =?utf-8?B?YmVLWU54RklsdFdTSS8wc2l4emRMZTRwcS9YRnVpODlLbis2R1VnRjZKVmRX?=
 =?utf-8?B?M1Zabk84Qk4weDZoSDhmeG8rcnQ2QjF3ZFRGUldxL3dWQzlXdndSSWRBM3VU?=
 =?utf-8?B?eDZHSHNQMFRXRUMzdDBjZDFpZkxuQTRWWG4zZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?R0ZRMGt4YkRUZDc5WWhpWWcrSjBidnJMdnl4bnV4N29FMkgxdGl6YWc5UlFK?=
 =?utf-8?B?NHFnWGlTL3Y3U2FCS2dsUHRHRmc2Q3VSWEFKYTVlbmxsRnArejZLWE1SM2pM?=
 =?utf-8?B?ZWdjbkxpUk80SVRtbmtIUnQyZDdmN0JscDB6eWZuTVJiSmd3ck9WTHdZMHFF?=
 =?utf-8?B?UFFHSFphOWZwU1locFJkVE83dGhaSW42OENVc09yL0hVQ1RQd1BHcDk1L3Vv?=
 =?utf-8?B?RElMQkFIM3RYY2YxWStnUTRZdHVTbHUwOW1HeVVpOVQzbjdWSUYwZ3hoQjYx?=
 =?utf-8?B?bzNNOXVpM215RlkwRDcrcnVaVlFjVnV5NGdOVDMybjJacXcxQjdoYXdJU1dS?=
 =?utf-8?B?V25ac21kM0ExNjkrU1BoL2FERXpTK2MyM3VwM1FZa3NMVE9PWGJYeWg0V3Za?=
 =?utf-8?B?c3B3VkZRVktvYWZ0dzBERDhTWGU4aGp6ZnBMdGxsSWRCNmUxTnVEeW05RVJW?=
 =?utf-8?B?T0RHdXh2WW9TMXh5UCtlTGROUEdpUG14MXhEb2I5aEcyZk5tWTBWVTNBQW9q?=
 =?utf-8?B?ODlmSUZwc0ljdmxiREZ0cjBuTnZ6elY4bmxkK0szQ2ZEVGppSXREV0JqQlQr?=
 =?utf-8?B?MDBtdHpIZ3d1dEVwUG00L20yKzlaUi9odEZ3VFJ6OUdMUlFDV1RNYXJ3Qk8x?=
 =?utf-8?B?akJYQ1RtN3hxNVl4eGlKNXFuTHRjTFhmMExZRHRIejcxRzhGcmg4aFFBeUVU?=
 =?utf-8?B?MXB4Nnd5RnVXWmFIWEljQzlCQld1QUh6a1Njc2RsQUxBQllkTlJtc2FZRDJ5?=
 =?utf-8?B?Z0pIcUdWZzJkN2FXNzA3N0RFRW1ZM3d4WWl3aURFQzF6R3VleXhxQUlLSG5P?=
 =?utf-8?B?WjFHM01rODJiWC95SmFkQU13MXF1MEVESkxQbGpkcmVZRHlackxzdk1CU3VX?=
 =?utf-8?B?MjRTbnpLWDlxZEgyYkJ5OUI3dzA1RVBDMkE3bGZtK2xPRFF2VzAyZWRpbUcy?=
 =?utf-8?B?MmJPTlpaamsvR3ZZVVllamxjREczRzdIYXFxYWhvd05IUHNFd0piY1Uwa3pU?=
 =?utf-8?B?T1l2RmNicDZvZ2RUMzdrUlIxWVQ3d2RSUnphSXE0RG9wbUVMOWt3Sy84Q1JN?=
 =?utf-8?B?TXBYMEZYSmN2cVRHK2x4M1NjQzZHVzRBWWloMzFjdXlDeEE4L29PSFBuVXRC?=
 =?utf-8?B?dDNPcWtkUEZiVTl1Qnd4MnFkYnlpK2ZWV1RiOEhXZU5tWjkyckdSa1BydVds?=
 =?utf-8?B?VU8wZzJSeGpINHRwa2g4OTVoS2xHSDZpaVBoMFREUGxkbTF5b3IvVWtWTHlP?=
 =?utf-8?B?TW1XYWVQQ3FrOFVpbVlhdGZWdmJTcTgrRXZmdFhLeldWUGFxMEFvUmoxQVJW?=
 =?utf-8?B?TDRoL0xieS9LUkNVWFh6KzIxTUtOa0d2VWgya2I5NTUrSCtubUowbUhTL2RE?=
 =?utf-8?B?VEdxUDJTT3JMa3JmZXpVaHU0eXkvS2ZUajQwakVwM2J1Z2cwVmtTbWk5RGRI?=
 =?utf-8?B?dWZhb3VDOWpPb2FzWncrbzhDYTN4KzhYUTkyY1QreHRhN1JtbGcwOUlZN2hL?=
 =?utf-8?B?aVp3ODNPa25XaWxLanhYbHIxdngrRlA5bDFYR2Z1TXdqbEhELzlGL05pc1dK?=
 =?utf-8?B?R1pkQ3BNQVNiQVpUWjdMSTdUWXJHL29DT3dRSkxaT3FkNE1lc1cwdkdaTSsr?=
 =?utf-8?B?VEQ4RmpZa3FUamN6b2UvU1p2TjhxeUwwNGRrUDNGT2MxVXhrNzZrVVIrTCtJ?=
 =?utf-8?B?L2tCdGc4amc4Y1FzWXhSWEhQYjBuc1NpZ0srb2JyWG42V3hITmlZTENuejFN?=
 =?utf-8?B?d0xTRHIzUGRoQ1N3SXdGemNmdUlCYlpRNzF4cGhUaEpMUVNpWVZnOVJhMkhz?=
 =?utf-8?B?S2VHZHI5RDM5U1VweDF5UldibUtVZGNBS0FBV2FCMGVGQThqMGZzMndJbk8r?=
 =?utf-8?B?dlhLNFFNZGUxNFJuZlp4dVM3TGphb3BLUXg3WWExbFBWdE9PUXFtV0Fpcnpt?=
 =?utf-8?B?WU1lcmhpSjVKeklvenhpSjRtOXBVbkRIbWdOa3M1M1RJK29vWjh1SVlrc3Y1?=
 =?utf-8?B?cXdudFdhalZGME9WQWN5L0tONzdUdTZkWEdabGFMS2Z0akxiUmpsbVFoRVlY?=
 =?utf-8?B?VFlsV0t0S3M3SDhsYUhxMExJeStpdnJpLzFmYlpZVktMckZMRnkwTFRmNE1t?=
 =?utf-8?Q?3isrOmPWrG+Me59xiKMdHWbo5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813fa392-605e-44f9-69f6-08de33ddb085
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:17.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NHOVeaB0QNPNJSEK7Li/SZS0K+zp1aIZmvPcysiaA4GGazDvlu0T7sd81sUMJIeaP0DCgrfwQpldYOGiLLNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 55 ++++++++++-----------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 371b4e81328c107269f89da23818ab0abd0179da..0e3a41cd35edfefc51b5631e2c36fd76e3e14d83 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,9 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	struct clk *esc_clk;
+	u32 num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +371,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
-{
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
 	unsigned int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return ERR_PTR(-ENODEV);
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +435,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(state->esc_clk);
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +762,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +780,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1006,15 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
+	ret = devm_clk_bulk_get_all(dev, &state->clks);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	state->num_clks = ret;
+
+	state->esc_clk = find_esc_clk(state);
+	if (IS_ERR(state->esc_clk))
+		return dev_err_probe(dev, PTR_ERR(state->esc_clk), "Couldn't find esc clock\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


