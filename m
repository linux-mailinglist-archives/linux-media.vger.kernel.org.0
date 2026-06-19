Return-Path: <linux-media+bounces-65285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6xU3C7I9NWrnpgYAu9opvQ
	(envelope-from <linux-media+bounces-65285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5E6A5E88
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=guCYS8vb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65285-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65285-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5192300ACB6
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4747438A725;
	Fri, 19 Jun 2026 12:55:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021103.outbound.protection.outlook.com [40.107.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2537B019;
	Fri, 19 Jun 2026 12:55:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873719; cv=fail; b=msh6IQSSf3EazK3r/ixYo7PU29phW3H8yp7TbofcuOKHeuLxnlaufSauGfHaJg/VKkEOoQYOksdf3hhWc7TDPbEU5JKyNDm/j196CLAQkZ43Du1BAuDC6tGd7ieRuVCLBOpq7b3q5vPTAasuwGXx3rdZwt3iMyRF1JXmke8/23U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873719; c=relaxed/simple;
	bh=XAoeebgTtfzCHg3dVud4gKYit40j+jVcZB2Rcmh84bE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ze3b5X+RFSppH/VQvns6WbZyCC79Gte+ytR6u7TCXTlNdx/X9aFxvdzr90UMATPA/+bkNN5WxOBiYei2dayCDvv29D1R1tE7+tW00Ds4sSHbfjPNIdQ7HjezH1+6WMmy2IfIXObS7MMhtMqQJHcYYxWBLPSKklaTHeEYH8sfzcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=guCYS8vb reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReiCZ38JRyVsqPUhCowzrb0FwZvQC94Nbvfi8DahQleJ8hn3a8vbUZtW0N5TUCMR/45oUWarasmJhJP3VCzdIzKvuLmmmylFM3d29rrs1c5Ui2X0MSG2eeN9XnJnM+JrQ1CIDMD7+O3883bQ5loto5QeChVKwzy+HCtoUNg8qj/9iLG2A3Mp56oWX5iyN1MdTaHh+1Fxtzwcejm+JYfHo7glQvHjKaS6Yi66Rjw7JgIdr2UdHVUJuP6SXDvxjnMp7Z/mLUBfI4kRx64/bb5UzjCrdamXbwumjpesCoEEdL685H5LSHB/O52e6m53lCYijXn7f8EXcjvMLy1DoD9kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukAx+p6nrefQ9yriTzvrwTJA2lnC7O42N/cK/FgRnSM=;
 b=hRGelL23BEOZd4vNuRfQO8xFxa48hADSvNnOUqnN2opne2xl9J1Cs2CnytWO7v+eTZRSKL2W2vtQ2znezR9h8k9LoDlp8RMhRB2KNUnDITB0cVNFYH9OKpHfZXHnomnq6GvQQVSzGLhDS0MWAaTUwjpsxlB+aSnwt+8oYbL7hPBgZNF7VGLewkz5gb4Z+JEueeDTCLa9nFbRrE/ItsM9TJZksCC0UzRITaqq7hhL41Ed5wiKL1Di9/HaMFYSm2Os0B2EJxGXxlyDok72vRLbDRRVllBlpaJp/SBw+FutvAZjgPw6lAldNWpumLpK0/hlTuN7exN0DPKK7Ro0x8HQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukAx+p6nrefQ9yriTzvrwTJA2lnC7O42N/cK/FgRnSM=;
 b=guCYS8vbpXSZTxdkZpfcwOT3Li5U1oMxhOchoelKYSDZHI9teG0b5l7xaJkkDiOPkPvVQDhLs1iFWspmiwBbKkV1E/ZGus3mxF0lOcpANlegGK2xlahPSKvc8kjHQSJvymLGlNO1/+kYOVpeR+QCOB03kz5Yg9joTn/gTEzCUNkwMhdgrwJzXPTOsVjC/DXZjJUrSg4dt3uUkF3Ce2jra3OjW/X/nXYiLcfgADFHjvZWB3zTn89AbxajOd8lq62gOnGb0smv4DMDfpXwVmEZA958R6tMHo+N7AWk8p9c/55/frZoEgZwPcOUNd4Hv3PebZVltlwwfjAC2wtVL5xLsA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA5P287MB4612.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 12:55:13 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 12:55:13 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	luca.weiss@fairphone.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx576 sensor
Date: Fri, 19 Jun 2026 18:24:31 +0530
Message-Id: <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA5P287MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: af0b7579-c696-4af7-a7f2-08dece0200d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|23010399003|18002099003|22082099003|3023799007|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	LMKCYIfJL4mhL1LIykr2CaL2s9F+nELiVvFNL5othgXsbEJ1aXexsURzc9Mp9VVQYlJp9EN4YihQNUx5wYmHzLL4ID+ch3T+w0tpGDxCFZwsRohw4uivObxwrRb3sxvXEiNlldog6ua09zloz/JF8mtMyyUei4fuc/HDVH6ugVebd9zoh1MqEWnh2yIPzkGmGtrVkaewNfLJRCYQgZmXIOKiAy458BsB7WlxqiJF1Vk/kl9Rrnzpo7RfLrRKdymRr9KjeKCX38aEl2H6fs9K3sbRkB6q6ThMLPnhExD65bo+ZEGT8Dyt8+fl4jVdHLosMkdZQwBkwsbjF4oq/Y+UmljLx5z8QEdBbXsn/RreTW3BRnXPpuVG1hFxjrNIrK7HWP3AxhVPe+vhTdhClXlIt/ulwt1uW+BmXdnExRDAtMjv10XbIjxPFiYADr8xrW+5Ayh8dFYFeaURB6GVWfFbUaqGSYB0hgHOHgVumeRQRc4dUwFIUIEB4EMqbTHnYoCn2rwSS3MLgHQOOXZ4fTK/LA1Azh5Lw8RT6xQvvt1Tlkh0wnUXzNdkSwmeWbU7e3QCThIiQp4hVNxykMOzn9+w6xk8ba3W5dj44kwHhA8hlLFYA1fNqypqIqhn2GSefBh0PYDF9aYntUIEsVfsrL87yag4JGSAy/XDxzc7zEW+s00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7cR7lKjg4PSdgA9fRgci2SHzdL3A/j9JX/AB6Jc0/al+jCgxbKWftPSFK14h?=
 =?us-ascii?Q?MSTL6EG9xnmGJojSCnnvAybTfU9a7P9X9FP0R5Aj08em42VmgiL5dnBG3IbK?=
 =?us-ascii?Q?7w+93RAUfihYWS/kfLtcKHgiYP+oq+GaKara5LbE2FZhSMgC9Ce1mS6psd0/?=
 =?us-ascii?Q?oE9UPLlqEw/b/pXUPExGA6P6CBZONqyK/AFghOQoPdHigk1O74K6J4noq4sG?=
 =?us-ascii?Q?Vb7tyrZvGWg8jtMOmJtac2vNYRlvs/6LqX/zCFYrA+IX8TnYlTmRvls+c9pM?=
 =?us-ascii?Q?ytFCzUaQryaSQhXlzE7/QfcY1ZUX2YfcmhdoASV8G6p4TlFGGLDICoZiSFxf?=
 =?us-ascii?Q?YzciMATERCUawjY3F6Qdi7+PQE84jR0HWoC7TG5H8A9Pd343w3GyUl2k/51D?=
 =?us-ascii?Q?UfUQ+aFbrsL9QfEbmB5ReY9wDYUPcdc6odpGHvy1hpga0vMAz7+HeP/H7Q+H?=
 =?us-ascii?Q?FQit1g0R9cAmk7iVHQTDo9HKArY7m7luFhiNl0O7+8aN0nWq1J3+vhrWxJ/P?=
 =?us-ascii?Q?PGH/6YgdLAR/4qT6+pXmUd4BAdG1RuIZ/q3sKyOxrYmNHL2vIt7oB3Fp4HSc?=
 =?us-ascii?Q?1KbAvuGW0kE2R0IT5tsuQYpi1RATaux9cZKtgHgdUrX9KLsYgUumDVvH+7f0?=
 =?us-ascii?Q?m5gImmHyS3nHrfYLAdDogqjcirsGpdx2XddwZejQ72N3M91lxuYQkWdSrA1R?=
 =?us-ascii?Q?xieTxWArrJ742cJc5KyEP0FciQREKiutJISsapT1Bd0JsoPcaHkXFXS+ez1P?=
 =?us-ascii?Q?UA7ib+7W99S+x+aKg4KDI21KIrElygz2Dt57Lr4YWm1JGef+Y8XmErlH03yw?=
 =?us-ascii?Q?4hPt0cTVJYHDfHKU0GCbBPIhjpZmQrJtsw15TqjrPlco1Ofkc5aaQLOY1EBw?=
 =?us-ascii?Q?A+Er3SsaT8Qj8S7+aKdsYDxr5ZAcotQiVYB6NJzEpdwdv/iOE64RWNh50WEd?=
 =?us-ascii?Q?Gk17d+F26CJ3YGvZFTBFL6MoAMNmm3ysFVldJ4hW/bEc1/OuTcMtUUCHI8uX?=
 =?us-ascii?Q?0IpO1qmJd/3p0BvUe1nZrjDgVCWZMs6u12WZu6Kkx9RGsTUnJ6kwtC+LQoqV?=
 =?us-ascii?Q?nYqyMRKW0Ruisb3OasihfnnCb43D8+oj9t2ujCgmIe8hZbkKSfGM4qnsTU+g?=
 =?us-ascii?Q?02oNQeKHRLCrsy57SQ7SRIXrpcIeOWu+TN4c6vDmYJ9H6WlFGgyyKtu736bl?=
 =?us-ascii?Q?iCMFBORKlPTOyf+MBV/6ucfXR5kJS37/CjeUzytc2umRsaRvF564C0olDLVc?=
 =?us-ascii?Q?r3IZgpRQkr8+SkMWxeA7Lxtn8p4UfmJvpby8LYVWRZIFiXsYnsbhQP4U4e9s?=
 =?us-ascii?Q?/Y9XA8XVFGU7xT3t7R/1oSN+DeJHEOotDHL8IYcMJ7l2tUg7rN86zPq0NLZv?=
 =?us-ascii?Q?XFZTgeqBCQEW3hQJQWBJzzUBelEiuo9Zml/HWgNP/uY93GY+F3T7tlAmYFMn?=
 =?us-ascii?Q?ozI5LXz5hZkr7AMCm0yaKI1oEzYO117Ct6bTdsCOKnFPIh9A//GlZBGz1sHj?=
 =?us-ascii?Q?aOBNROCwMZKlIm4e5unQ/jjb/Xa85Xsr7n5fqB3qvrhNDIJsnnZ4HYrUiTDz?=
 =?us-ascii?Q?kAX0SNMP0r+qfNwqWSgW9RiL64RuMOXHkF2CDxxh26brNNV8A+7hOsceZu4a?=
 =?us-ascii?Q?EZenUJ9gr7B8TatftQWoX+LjF69nfciYp3lR+vqcqXjQBjn283AkQlj/azqp?=
 =?us-ascii?Q?zZgf5dkHvsGz4/4cLpN6pQzJrILH6g8d3WaROFu+4C9iqJyqXfnSbOLdC3CC?=
 =?us-ascii?Q?MVus0tm4REqw8Bnc8+EovGTc6VCXMgHFeG8D7mvUxkbT5/b5F81Z?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: af0b7579-c696-4af7-a7f2-08dece0200d4
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 12:55:13.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYDM+lXo9xgFwudenQ1PiCg7ZtxlweRTFMVCH/dNbASae3WkFM4muFsTHrABzjYhRUKuovJ7rW4BccEEUzIeMXFUfZn7yu120v9WAK9f0TBRB+8+8DblK6u0IydCfdtL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4612
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65285-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:himanshu.bhavani@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:xiaolei.wang@windriver.com,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80B5E6A5E88

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add bindings for Sony IMX576 sensor

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
new file mode 100644
index 000000000000..52575ea2cbe1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX576 Image Sensor
+
+maintainers:
+  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+
+description:
+  IMX576 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 5760(H) × 4312(V). It is programmable through an I2C interface.
+  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8, COMP8
+  output formats.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx576
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: INCLK clock
+
+  vana-supply:
+    description: Analog Supply Voltage (2.8v)
+
+  vdig-supply:
+    description: Digital Supply Voltage (1.05v)
+
+  vif-supply:
+    description: Interface Supply Voltage (1.8v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vif-supply
+  - vdig-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@10 {
+            compatible = "sony,imx576";
+            reg = <0x10>;
+            clocks = <&imx576_clk>;
+            reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
+            vana-supply = <&vreg_l3p>;
+            vif-supply = <&vreg_l6p>;
+            vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+            orientation = <0>;
+            rotation = <90>;
+
+            port {
+                cam_out: endpoint {
+                   remote-endpoint = <&csiphy3_ep>;
+                   data-lanes = <1 2 3 4>;
+                   link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c21..1b15fa355e8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24856,6 +24856,13 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX576 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.34.1


