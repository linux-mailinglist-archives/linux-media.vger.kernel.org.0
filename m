Return-Path: <linux-media+bounces-64597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/d3JrzLKmqBxAMAu9opvQ
	(envelope-from <linux-media+bounces-64597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:52:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E790B672D8F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=SOGs4Jhh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64597-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64597-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA497334D0D7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE29F3B774B;
	Thu, 11 Jun 2026 14:52:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCEE363082;
	Thu, 11 Jun 2026 14:52:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189557; cv=fail; b=jqkc6ceIWGn74tq4RDp6CbubocPKCn/FopjjRedGS/t1/nnjJf86NUUpOpnzywOJBxn0IX6mbKsJX1oCJ4bO/pkMXoUETdr+ct4PbPPxHr2VIff8CLzxr4g5UeLadqOwGu6BFXFk+iDgPmrm/bIVmwuezExUvRzRtSlsMr+RstE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189557; c=relaxed/simple;
	bh=Pm9C195SqQzzlHIDpvdLpK/Dc4XxZsKOv7wnEnebiCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J1ZSiQmIbsjCDoZ6dEVXfjujWtTLKUDBjA/FYPpddEKJYwmrUOlGmzledrChFP3aYnykF6u0UIfik28iWA0Fa46fAjgD6+CQ3MOGPgZUZm2KddGjkeJ1Jy7av2KNtrmi2DUEw0s9mc/nwSnb7dl30LIKTBx3QPbMxeLL6vdqoso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SOGs4Jhh; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFV5Kez+zlsJ5lqPVjB1wTyNGiWlW9TGP0EnQGdXGwHMHMEv0yfaphVhHqazOfDSquL/MFBUb/2gIk8s0iC/ReFrp4KtEi4DqXDQ7WNmjm0Hdc0KoHoxnk4seRCssKxH5nC3ccJHEXMQKr6Xpn7fnL5OU/Kz/GxcLkk2CU2q6lFR35url5biYoTpcwx5q4NTAO+L+zbaIke+hHKA4W2VoKw4m0hi0ymclLvq2dt46UYUnaTQL6+vSBFHWK/MxUguPg0DkCWbktZCHZYaGSpQ9Bt6hohtpsJdxaF9L2iACpSTTM0CmQoFC+dt6itxy7q8/0uzzzlotXCpVHWqDZEiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gShfZuNxH3cqPiubT/RW/8HvXF8mLBDiSD+U3w3aq0=;
 b=bEVFCbAlONI6H156dH5MCbYqoI5/BVIr7cW2dixhHKfQu2UQUeXIWDSshBMtWAkhwumMLw1Ku6yFfrdjh9ZGv5mNjX5M7ColhEsT20s8ke9Be+cjIKlQiQG9u4ACa8xZQgIR9Lv5yff9AlLROsEO7fRfLxYDCL6g/dkRoRBHc+QcrXYVP3sxs0G18MU+OjZ1bflotwpVOjShFskDbDEQNVlMWvL8fXp8XlLWbXP2kYJkEm+uXcgzgdOLaVnik1EGXqeSViW2evvmVvRMsJV9k5BI2QKm0pzZz+isRjnUGtqQ7jGwMg8OONuEV1R/B+Gy92KMNy9dmYc4VzWR8plnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gShfZuNxH3cqPiubT/RW/8HvXF8mLBDiSD+U3w3aq0=;
 b=SOGs4JhhWP9tsmsrGj56FilqRNmi/W45XHResXi4rMxzI4O//oFoB3XC/6fq9Msg4Aa1ZBqIin+/Cj60gqjav1yxbPgxW/96SJjYzsAhrOv6hq4OsgJOpa+p6pBq3ogaSXQU8FxL1/u7sNfXptsX0Lj103+0hQ7KxmsZ/8u6C6uZ3qEVhPH/s4TLu5Wm+WnYcPgcQwEFak/kO+/ADPEQKNXDOQsNyOupwZVsWoCCmHYLN+XVJ+4P9VhkjoPcszZWQZngK2Du8V9ql+yuXKHnMz2N3REgWo//fXJ+Qxc+ieQ+qVhpmNoODkWsvK2pz0/WMxMDqxrZYScifITt4nMqKw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU7PR04MB11212.eurprd04.prod.outlook.com (2603:10a6:10:5b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:52:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:52:20 +0000
Date: Thu, 11 Jun 2026 10:52:12 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Remove obsolete frame_count check in
 venc_start_session
Message-ID: <airLnF4Y9X5EPEDE@lizhi-Precision-Tower-5810>
References: <20260611-amphion-enc-log-v1-1-5c0b503dd8ad@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-amphion-enc-log-v1-1-5c0b503dd8ad@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU7PR04MB11212:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c591cc-45d8-4ea8-286b-08dec7c909c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|19092799006|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ui2USSsUWv8M6Xc6FU2diTuRiY8T70lpiNN2xxSjyGFSb9rvp1eHHTaZvFWJFn0zfmQmHSoS+dOTMZhiNW/eEGBMQWl4bu+2eTpwI1HObO7X8bVgz68/XKappRrG65IPbfaXCmG0MHWLAh/SnZ7cFZzNJ9NNsJs1L5ttAoYJrpPNcds/XqG66JeCzJ3R+fqCO6UKRF/N93Fro1TN4wBVGyUi+G4U6S1/f0k7vlYJbLx3uvMgbk5+hromHj1/gQVQuWsRSDwmxutzVUJEzzj/FcmwMRUUeqGVHXTN38GIFUFBq43wyD6nC+Tnvrm7iRvEsfA0OGUUI8IneNicoCrkPBzzrZayMYxx4ObkV/vwxE21Dh61tImbLhAEDqdPDt4iVPE8ov7gq7/BdzxU6QrR1Gy4pZ47x8Cz7T92DhVHJzobvR4Q9D725ARKYJFhOBij1a9o2HnSaJm9ecAWyh0nr6i/z6n63YwCGI6NfydPqG8jFf9YzBJVi5tEqSU0xoEN1wqcaP94FypwWROioz2NLb19vLQa4i+cY/8DJvCrRylUPBpT5LOF71g34fZkdwx5EGo7m7T/m3Z1Xs67RfdZI5BtUOZzjMfFrKB4FJkZhNDMKbo449KMm+J5UtIJx8Kvr/c0aACWcx/rln0r8LJcnPgyL2qP6UEf7vKdGje/OGQBrx9Zc+rO3W+0ed2L2wYP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(19092799006)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7CNHF3ZqGZD7dZR5DZe0aevXWU5/xvu4bUSOqSk3bDsB1WXid2cFKJ6d7YaB?=
 =?us-ascii?Q?LISa7axS5tSpviXXx3O/5i/K2fW85U7MimN0USLTNUSDzsywV7ZuIcMXOJsZ?=
 =?us-ascii?Q?P7xGd3/sXuR6vTD7hkto+RdlCvun7Ul67hzejayy48P52nSeE28OqaY9ZVJD?=
 =?us-ascii?Q?EAcaRjFyCPlSADRubSw/AaiTITk+U3FCOeQHTvRpZr9Ikj9dpqrIfpfJ7ysg?=
 =?us-ascii?Q?PuhVTGRafarXtPM0Txi+DESPAimPaKuNqnxegk6XNKKNx6fA8ILRxBeb+hlo?=
 =?us-ascii?Q?0Vor7ZjKJw7yMwBKM0DO5LXKuMEAoy74GiMovqDv3GEiIwsQJME2fBO+kW9K?=
 =?us-ascii?Q?S4IdAoKVz+cF3SjUq6XiSDxb7nOOM5Nx/m9buQk8jzIBFAguN+GVz+koSVSL?=
 =?us-ascii?Q?kYDNBH2xZu+Qp52ZDF528PQ3RatKX34ijMMqzWCRe2X6cK+3xHFy8yuxfttd?=
 =?us-ascii?Q?WzjVdW0WjW74XntcOHOftKRhOZTDSaEBqFH4o7WbMIR4xQO4nfRIjDYFwoUp?=
 =?us-ascii?Q?w44PX5PmsJubbweGqjMkJu0uk+FC/VS8EFnWtpHkwHmk09z1mgVSyWHBIPSN?=
 =?us-ascii?Q?xNzoEw60bVB6T4WIqDkWClQQCGY99RYs5jrUuIb357HvxZU9bTLnbX1n95Bg?=
 =?us-ascii?Q?OEuL51BIgri1qHQ0EotRD1NevboFekCMjdJQHRn3F/bjxR5ynYy1CocUNZPT?=
 =?us-ascii?Q?KR6eLthREI+KvBoI/U2jcO6X+EYERDsojmA0NPgWQB3fLZmJ5sNW+BD9Zqdz?=
 =?us-ascii?Q?y2ijK6E0fCdVgF+ZbnD0ri0A82xOmgTmznvee0TXIjYRE1ERofdXkqB4msP0?=
 =?us-ascii?Q?8tLwLtdJw4R0uCwWr2d5E69PAj8hx7utCMlw7Ub6Z2oBr9yuhBR7vBVnPhOO?=
 =?us-ascii?Q?iDV8z7ZwdIawWLeZX1Pc1D4JqOHBnMvKjGTAyWpkYF74yl+jFKMFWO6MaSiU?=
 =?us-ascii?Q?RkNk9PwbEgTXhuGLqiLRkxjoCDGSdM56z7x45W7AWAK9Z1S1vrAG8kxIaEb2?=
 =?us-ascii?Q?GEEsD4g3aCYJ5WMxa8aBFVjdocQnPLjmp34NNI6wL8quJn9qnMnX5NKiwhaq?=
 =?us-ascii?Q?Ml04RV9BKXRG5Uc61pIuKfG9TutvVq1O/Knr3yjyQo4wAdfb+SAgtwgZFQxI?=
 =?us-ascii?Q?C6xPlmJ0+i9vDMrweqtLge85q/6J0SCysTL3KXgmYSK79l1PUcUJMD61i/7f?=
 =?us-ascii?Q?uoPnE0NJX7qwsuUUc96TWAUJT72YzCA5tuQu6nUay5H3Qg8C/PRXrp2nl3ZS?=
 =?us-ascii?Q?hO+F8HdbhlHUsCg1TcEaVAAzVmT52mrPvyn1Ln0J1MAMYOoCukZ8ZAxdiqwh?=
 =?us-ascii?Q?NHA45Hq9ucTrrpQCLkoFopEcCrDt1ArWAZ2/sUT6KlyWUzMHELGFrxWpTMi1?=
 =?us-ascii?Q?DINjBm3ozqHOkOkAWWR39BWK84qdo+8cXOVfya8e8apuvicYJq0sRyxVfZ2+?=
 =?us-ascii?Q?RJ+VF+mzWIgxnz7QfdFdrHutev8cyGRYThfi1Lq7lYyqtyN+bCnGOdWfUdHU?=
 =?us-ascii?Q?OJIucNbkfJOz3xhT/yznXOk7rtM3V2HxHF9HIKG4fqJLeItxJ2whRmIZJp4S?=
 =?us-ascii?Q?FHT0jVQEjw1SH65X+2RjcE6vkox6Q96bwKGPAqwi5zp3fLbMdZwjZPXDpWnR?=
 =?us-ascii?Q?DGVAhXtdhZN5iXMpMa+iJn2fX+JnmnzZYfXLk6eFOgiD4+WeP9GcJuYC0UTk?=
 =?us-ascii?Q?0be9cq2sCzXbC0gnA8LtFQ1ki+z3oneLzArcwNnulrtxa84mgV5dym70fm6S?=
 =?us-ascii?Q?0myxCIk5S0OWFauwNcS0Rk/btBfGNaSjZr0aeu9x1trul/nxDWRo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c591cc-45d8-4ea8-286b-08dec7c909c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:52:20.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVlIJLg9OsYPMhACF1Dy7tRZasaHq1yzQQB0eSn+bXoTVTI9Yh6X4Frz758FWpVTtd+AjW1m79lXSx55jzWvMvUQ/NyXx+PK1YvQ8010IpDzInnBU4yc6q+3+ELeUi7J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64597-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ming.qian@oss.nxp.com,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:eagle.zhou@nxp.com,m:linux-imx@nxp.com,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:email,lizhi-Precision-Tower-5810:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E790B672D8F

On Thu, Jun 11, 2026 at 05:17:00PM +0900, Ming Qian wrote:
> The dev_err log warning about no input when starting was originally

nit: dev_err()

> meaningful when min_queued_buffers was set, as it indicated an abnormal
> condition. However, since commit 5633ec763a2a ("media: amphion: Drop
> min_queued_buffers assignment") removed the min_queued_buffers
> assignment, having frame_count == 0 at start is a normal condition.
>
> Remove this misleading log that no longer serves any purpose.
>
> Fixes: 5633ec763a2a ("media: amphion: Drop min_queued_buffers assignment")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Remove a misleading dev_err log in the encoder start session path that
> became obsolete after the min_queued_buffers removal.
> ---
>  drivers/media/platform/amphion/venc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
> index 0b3d58b9f2f7..2ba4ae20f829 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -973,8 +973,6 @@ static int venc_start_session(struct vpu_inst *inst, u32 type)
>  	venc->ready_count = 0;
>  	venc->stopped = false;
>  	vpu_process_output_buffer(inst);
> -	if (venc->frame_count == 0)
> -		dev_err(inst->dev, "[%d] there is no input when starting\n", inst->id);
>
>  	return 0;
>  error:
>
> ---
> base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> change-id: 20260611-amphion-enc-log-fdf1d7613b5c
>
>

