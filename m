Return-Path: <linux-media+bounces-62251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI6rJUKjDWqu0gUAu9opvQ
	(envelope-from <linux-media+bounces-62251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:04:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE8958D37D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C2963100429
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AEA3DB322;
	Wed, 20 May 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="QL/A6syN"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020135.outbound.protection.outlook.com [52.101.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4F3DA7D3;
	Wed, 20 May 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278253; cv=fail; b=gI76niXO0JgyCPjiCGPprZjhzSy69hKIjaEf0mJnudH1kMgteUW+FpQJRTU3YJvevA0LidHMRT0Sb4bwsbepEwzjhpzB/NeggN7/Af6J4njnPmCcQRnlkvn0fvIwHxZEzsHGp349zhGKst27E/lwfmJ1Vep/pq0L3H2+QxeY6+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278253; c=relaxed/simple;
	bh=cSqCMwqNV2PRsAVjYJqoTXK5IcP3OcRhaLhVQFMP7Fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T9UsVhCT1k/JvLF6AUa2rujC47OFX85jAUO3KF5vVpkZ+keh533cmQA6BNx/qFnCB8gGXzaIcCoSkax75xgc5XqaB6NbEk6AQ/KxuJWkwBwA2BAYaxhJwTrVxf1LwJAYvcppD5y5EayMkUfQJkHyZ4deShv74XBdtS1qNDjIWbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QL/A6syN; arc=fail smtp.client-ip=52.101.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkUmMNHcTnW3SPEzb+rUMDMsHylG0O0K3JpnPdGonM+Ir4OgbEfBvB0MIev1N2ghlNN62i8BdvZa71Sb/UZBRZ66qMTuOyJJMkryj/AauelRRxxBowiSSVxhOjBDzmAIXxbWiVqtMaT9YiQkbFgRcDrhOX9PxGs0N3cg+vaHWkCahnVqvdQJtsC2jP+5ZxQnyQLwqLeARrGMvJcj4j108pGDn+UtX4NRxy1YIzZZlQzbQCHXx61b7yGSjqO1+LcWZ782GJDsU4KzAsnxAZSalvPB+D9t1MuozUvuAv+9aQibf83Iv5vqY+rJm9RoGPvx1XZL0nOZrSwvXfKiTAGYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GH79O5Rsb/KP0DHRRROTVQx0/ccWGT5MO09XY1z1SE=;
 b=nKIRzNStJ0rK4b7AUTNf6p01oi1KZkTQU1OASZxDM97ZHkjyO2xqEGyrCs/lGtVZgM2cpIXOju+o/uSa48U73GbgxDB0nHlG+YepoOJnuIzFFVoOWj6ScNRTb5VsYfHETZO8rghkuuRJjn3p+i0cTNV3E9LTZg+e09R0VHDAzWvp7g5PUQ0OJ59sfelYev8ysZRvsFLDQHrntceykGV6VjfqFMs6+9GO7STJ8zSiJpVwJ4W3YVIcqiczYSj/mj/HslLlIqEvo/HtfDWcfRGSXFCeiqkqZhJv89XiXWbp2i58wda9baHilXCBMXW5Oed/TabFGCxnbhBbo8DshmIO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GH79O5Rsb/KP0DHRRROTVQx0/ccWGT5MO09XY1z1SE=;
 b=QL/A6syNanv3VP1XTqZFYBvtcyiNdiBvvs5/BT2OhYbw/rN38H1sjy5HfRycbiIpnFBi6oRc6mXvTT6949F4lXzzdyCKuI4wPjla70glaHYAdmUXnN+mx0K420eQ1uIiS9oRx/U6Queo+LLaThvxejNxxgYyyJ/eKHd/C+WuKK6s31fekMt4Bp3xnR7+zTUWIgpRMF9dhgb7ChV0mjAVgxRj80m+7YrD+BJIIxGCHf9luNwyrzezR1NRCv7wRX6MV0auCor18GAE78eCrbQsWr1d+9Fc3X1GyHM5MFxndWZoCcwtcWU0Akop5QG4FUNhqBgCO/beX+ptENcyv0sxmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5499.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:57:28 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:57:28 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
Date: Wed, 20 May 2026 17:26:35 +0530
Message-Id: <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAUP287MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: efb8d593-5a21-48a3-e993-08deb666f72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EVGbCiax6I0MxFxCzxgmiRU5Ha8oHfwbbJbQ3/y5ktxK8wsqCLk+k5/EG3mOt6otlEGudppR59Kn5Lx50RVG7Wz5Z2k3eBta1x1p8Xj04Jl9KLhFdWrYuPk8K7HJ3/oYZH1pn4sYr79HxxMNUR86+NYfwlnIwn2rWVT65KTO/wjyze7h/LqJ1xDjOY7GbHxradwrIPkvleu96K66udK4atyKMJ30qCZea/psGu7tUSYrzlSVy0pEpFE8hhM2KJxeSiol4brxWl1GCQKz0Ox8WkfY7d7CIrg7k3Gv/nC15a+hYr+1+5AOwT2GjmRil1QIxY0WhOJPcKGfDH0Q3yr5gLRpZzRkFjkuCgg6EXXHket20hq/gO7HqvohAtnkZB3bx/+D4FWSKBS3Wy/JlKc7/SUNcUN3AUv/z0QTqC/f+QAzfgNOtSMfVPK4BjCtZliOtKjo+E0oQLFFMTSa9mVnWlOZBIG5g0b3byaDXGeJ7qtlwTt8tE/jomU8DHCfCVmw6NLPAAkxtjqt38Cn3dE96C8Su1lK05AMIv51230ctk/QyHQVhZsZclHZGuNCREp5tPSzvyEDUFU+201Nn0Ydfu6WqZ6B3oMYG8DTf/ugQnUkm+7lmlxNx6FfCOvQ6FXfXZN0P3MBGXa1IRKoJrXF6hZR00KxnFQvPZPh9i3AS8/wdsnh+B/Ont+vS+C+nHT81WPA/qfyfMGBVyfpsAZA0yBMYH5UVkSEm1yl/86Um0+rIdYrGF70ZgIfJWQrT2iT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dx7AZRlM3B4OtWw0ou+ndf5AdKeMKVmdToGa876XtfwdJKGWnuGkIMfo9/iu?=
 =?us-ascii?Q?QrReCHdMtYaTUsg9ljyZlrCDWX5R8F8vYt1F8FbdEhFlSC+fQG1Ftraw5VW6?=
 =?us-ascii?Q?uUMwaRUFnA+xVPbS+jN7cAcIpI1rfcVKCtQ8yhLC+aQCtXpfZGfjCqHvlFjL?=
 =?us-ascii?Q?XxdtkN8s7pTe4/pNnJoubGdU/fDchGcejKP7OK79kDJDxRKjT3KMcyA6Eu+7?=
 =?us-ascii?Q?gzD10Z8cvJ6DfXp1PF24OQ5E57cjXXy5w1IlfJ6V28Ka8ioufAOrxHASljhv?=
 =?us-ascii?Q?0LdNnFD20fbkkqwhG63+Rj7Kd7L/bTgxaq9/7kmTUZheAxnTutJnNVwKfoWr?=
 =?us-ascii?Q?SFzKz5OaIPrBETHtN7hdYwGPRRsc8nPRSm2d7KFCLD6xZggY/7HzF7yS61ko?=
 =?us-ascii?Q?fRuxJaFVNKGj9Q46QlHqFqTy+ml9a1TgeTLQBHj2lUrfMcRRlb7AaB6F5iaJ?=
 =?us-ascii?Q?kUu3bOs9jACctxVnJUw/nckTW20SZ4147Q/cq9UqBrT2GIyZ75MmgUMPrbNj?=
 =?us-ascii?Q?y3a+LNmz+761+nfz7MgfgY507mrOWxMTtTmbD/cpJ1J6fDYg7EaIBtpueaPZ?=
 =?us-ascii?Q?iBeq2hvmt1Z9MkotbSkke4cr53K3JR6BcvMGmDJccwNESFNPvoviUDteQnkl?=
 =?us-ascii?Q?J5gnmgYi8zvYW1keHpcGhTnPua1PcdafD0CJOwcQYnRjWbrbbr7w9vAEwNBU?=
 =?us-ascii?Q?t6SGXSDtMO2RouziqcJTMZSPvxD0bK0/bxjGmuhBnxqcHwds3IiFIo9q2Jgo?=
 =?us-ascii?Q?yKwVT+a4y53Wr0A/IiTI3hJvvcZX7ASVexIRlK1MZRRnD9UGk4aq4ty4X8Dz?=
 =?us-ascii?Q?U3dTK9XB8RvVjFtgtJQfGRuiJYHPbB/I8uVjKjfg2xyoT34p49xhwyefO6Zy?=
 =?us-ascii?Q?ua8su0VcOhKoIvPsGEcRIPuGSH3f/Ai058Hd2ecMPf9z4N5DGX21pZpRG4x1?=
 =?us-ascii?Q?O5wjieS2yFb/YIF4IDXyaF2M+CKZGKd8XExm+PKoG2KJJAQRKwGWDK9s4aVe?=
 =?us-ascii?Q?5Pi3FDnqHqgAAADqHA/ndvGUJn8HaIo4PdT1CfgBTtL99cTlNWiWCmTnkJIs?=
 =?us-ascii?Q?VCoi8z3NWvzHEFz9GM9xFscpAjeYDu+4qrqwPm6vkiJJrYZPkZDLbAhH8cG0?=
 =?us-ascii?Q?PshXpwdwDA5pA6E8PD1Nkwk9cPPbozUkzHl+dlqB6050/Nnzqqlt834xEraG?=
 =?us-ascii?Q?ZTZqGcVWY6QYOJ0SSGweN09k0Kxft2kIP9Aqx4hNKQnnS6MsYvToYbg435th?=
 =?us-ascii?Q?PElctpkguNxFg7VDTsLiYmMGdFwNP1N93shLrm3cdhUeagvfWeoHiGqx06l6?=
 =?us-ascii?Q?0aujpU0I6XloQQjObfWQwKOem4uJBocuwn3JAnfClr/aOM2UkylvgPE1GLfQ?=
 =?us-ascii?Q?7efQ0isB7/IYfOOrVrrlAL5+5+/C1AF/My1V64Bz2NWZM23AkZxpcXyPKW4q?=
 =?us-ascii?Q?stUmobEqQrKpJxmOZImWlNxEAhI9H+Fxksnk2IiGs/1J90vA7io/nU9EtVS9?=
 =?us-ascii?Q?VYVCVYxwB7xz4MgcBE59WvZa8Lubf4cyobsduw/iSu08NVRL9tXapByQxQAN?=
 =?us-ascii?Q?761GPXsqKWWXnhL0Llr+2UXG1Zoq2Zzn3YbDhwApGb00T/5TFFlsGM77vEtD?=
 =?us-ascii?Q?rCFV4My0exjYGoZqPTqiq6VPWdxHtf70zXnMINkqWZ1MdRwTxtXyw3qxj7zr?=
 =?us-ascii?Q?ySJNWHtWSHQATq+33vYkGle5G/kplmfNm5ghwJifbhUeEgG7F+IeckiNHyhK?=
 =?us-ascii?Q?jtI+CkgylN31fDh9vVMIhI6onGmUAHFpCTAke2XkRyzEn0k/I+2v?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: efb8d593-5a21-48a3-e993-08deb666f72f
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:57:28.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO6Y1evuP6RHiodt0FB1T/joBTcg3gLJ/D40Xy48MjGHQGKzU7jCstHODDXyYz6b4rM96DZCGcOcUGXCQ+6zBcAFPJG6+s/6v6GQ7Y34HagfL5NZk880vdQxGa9WfSqx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5499
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62251-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.50:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.10:email]
X-Rspamd-Queue-Id: 0EE8958D37D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add device tree support for the Sony IMX576 front camera
sensor and connect it to CAMSS via CSIPHY3.

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..5fb0f3eddf66 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -17,6 +17,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -547,6 +548,24 @@ vreg_bob: bob {
 	};
 };

+&camss {
+
+	vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_imx576_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -582,6 +601,34 @@ &cci1 {

 &cci1_i2c0 {
 	/* Front cam (Sony IMX576) @ 0x10 */
+	camera@10 {
+		compatible = "sony,imx576";
+		reg = <0x10>;
+
+		avdd-supply = <&vreg_l3p>;
+		dovdd-supply = <&vreg_32m_cam_dvdd_1p05>;
+		dvdd-supply = <&vreg_l6p>;
+
+		clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>;
+		rotation = <90>;
+
+		port {
+			camera_imx576_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				link-frequencies = /bits/ 64 <600000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};

 	eeprom@50 {
 		compatible = "giantec,gt24p64a", "atmel,24c64";
@@ -1115,6 +1162,13 @@ platform {
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;

+	cam_mclk1_default: cam-mclk1-default-state {
+		pins = "gpio30";
+		function = "cam_mclk1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
 		pins = "gpio61";
 		function = "gpio";
--
2.34.1


