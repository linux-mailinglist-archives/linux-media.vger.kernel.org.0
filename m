Return-Path: <linux-media+bounces-49817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5CBCECE09
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 09:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D34F8301DBA8
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 08:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CCA246770;
	Thu,  1 Jan 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="AkVJgQMv"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020112.outbound.protection.outlook.com [52.101.225.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5A239E8D;
	Thu,  1 Jan 2026 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767257003; cv=fail; b=VtnBstdzPpgef4F3M90TVZrbYK05PGCcKzq9FoAzqsxmEYfLayMZjumZIDKx5YQ27IQMm0fWP0RBmB5KGRedqlpNrC6dZ1QpDHuUB2U9oxB3hZt4bpBhapDl7+tuHU92EuZ4yDLfsx9gvjCvyZHeNoDicZyCbwfNKbx/jQJ9hyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767257003; c=relaxed/simple;
	bh=47SSyVudXDRrhJNX/vzDB1u23YTxGvliOMofzZQP9zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jdsOsFGZuSKRh3QsmMq0y1l+7MWQmoF+twUj975fqiQdLsVWkFzxdY/qgTluKfrwhIdjzRQ/MDwgVwj9cjRGe+ivx3Y8BsOzbGuQHJRI8WCKYqxd9ywhC2ll4xcR/gLmWEYLcNfO+Amq0GLGfH3jO8jkxKhUVkLI48o6aHwUvvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=AkVJgQMv; arc=fail smtp.client-ip=52.101.225.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8+NgOwRSF9pJogpzlFO1Z5KAHZ51gxHY/1ANalRJNId64pUl+fh/100/8sDufYGgW4NoQGb5JbGSqIMquhdPI4uC732EUMqpdFvVY+92O32/r0nAAkXplww3y4X8EFZ6Nsab0goHDUpzF/E++GL2sBUDSlpkSxf5Ppf/IO2cVhC1edHm2HikUtfaN7oF2dAa7oi3CFL0tbqGZixA/MIMCYVjPvS2P4NqiGM4Ld8OyFDsqINvG1GtZSk7hlxVJbfNhlTQpoSumZ5RVomzJ0GDMzooPEhJUTMmXZ1IYiB1xVlg/ReHdwgUZ1+zJ7DsqfEy1ii9kWaTh8JxS/u2Ohubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=IbWLcvF/AaS97QhJPzphoX//WXY8+vD9T5C8stZovPAcSEP8lL/0NMgA93IpvsTyHira/c9f0/O7VYDnk4of8Sn44YqkA5BLa7oY4bjONnADf8/jPC21OKG798rTj75xscWc9k8jE+bY2Bq15UV6yfE8B5/DDereJcBEHjOWJ3cQsudk2uHznIjB0HXpMFpo53SeRi7i52GSUlvVJTQZ5BDGZNdikuvjVP72SNVAzSlFjSSNoT1i4TUrNO4ENYF0CQc+xtKDIqyGWVtHh1NuNoGfSg0vwjxAGM+qLOEKjtoQiKi0Vxj521kqwbdglR4kZp4eb/QkgasMvmt0JM1kWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=AkVJgQMvbO1lxdiKP219kj+nrSJE8orSjTouW6gc23P6CPtUuHFeuwHljbVjqZRk2g/tZmVxYweJgUKrrXEZw3z0B91uJS1w3vPioeZbqjnOgKXnPi44Hn/XPsiFQW91n/YB96SO9fvGCohT2580iPHXKeZ2Pt8mPnyfLrNJBQ4ahTU4+9uNLfBh6L+24pAAq8mh7BF8oGwKTJ1oCuWvVAZ3WqHiG2HzuGuluGBn1KA8rRcjq+mPE5tD8m2ttF05uO0IxNoUFO1b9bioRXcE8bzR6vLLWOPVuC1WMbBr7+DGt5w9pozlGElfpYc1Vxlasg4oayuFtnzYkcY2BVxrOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA5P287MB4670.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:194::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 08:43:18 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 08:43:18 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Thu,  1 Jan 2026 14:12:46 +0530
Message-Id: <20260101084254.20014-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260101084254.20014-1-himanshu.bhavani@siliconsignals.io>
References: <20260101084254.20014-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA5P287MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b92ba6-94d3-44ed-4004-08de4911cf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+n5WNinC1qV2pHeyiyef2+m88pY9nOcKV3CtvGiBkrctz7xl45mp0L6z+3/x?=
 =?us-ascii?Q?+1p5MeoT1nlaXHcfadg0wr21G3SC4Elal337kGaYLfVPpgs1NB4SIrASWF3I?=
 =?us-ascii?Q?hDF3HjVYxMoUoCSabrhHn+MRVL9LL9/QBJM8TgA0skk1KxCeGyP3YpHcI6M/?=
 =?us-ascii?Q?24e5R5ZOEC11bNJCzDA48HyGnXaUSwWiREgBIijgtReSsmh/nm1f9tnatBx4?=
 =?us-ascii?Q?nLwnIDUZZ2Wf49KHz9Xb7qOVj3suw+BYInNOeBdT6nDje1CbigEr3GQ6Uh73?=
 =?us-ascii?Q?0CSB97WryHwWLs9/mSr+uIX5374A6DPRe564WuhMs2IctxhEPGhh791GHUbW?=
 =?us-ascii?Q?KJuDvLXdlJvAGso+M6kLsl8V6hSRtw6P2TyvJFNp9Tji+LOknclvndBEyV+9?=
 =?us-ascii?Q?DDBqB50sR7q7XTgiP811Ck0R+JVrRA/PCVzdowHDEV9qbIsFCBEnlRp43OIY?=
 =?us-ascii?Q?lzYJp5Otv7fHNaggRLuLw5q++XvMhAp2YdkmwgBXMhDAA5RAU7BKbAcpp4ht?=
 =?us-ascii?Q?aPT0GdvEjMCgc9ACINsKaFmwa4IEfHtC6T8vCyY9ARbk0P4Jc0vxU1HTgR3s?=
 =?us-ascii?Q?vC6KevEL/iq7qzhDzvN94cn+JF2dQ+oiy284uV5KmuavY9Xp4YOQEiToq1UB?=
 =?us-ascii?Q?IsGTsTCnrVT16kg8mKmeWYgCLz1mHUm9zVDoUlartFeo/rNw5d8a0mF6Xffs?=
 =?us-ascii?Q?gz5rbaKNv8jyS3fXGOkdjgHjCyyq4cbds7iPPDOvkzUrOmlAOl/DXjH7dL7E?=
 =?us-ascii?Q?k5e0O8aCjEIZdQFBAZs1FJD2iFTZHhAwiwjxMkRXIMuE4RYdLzKldTP93KQ3?=
 =?us-ascii?Q?v0Dma/wfwDva4kwAEZYpz3nJjAIH4H4KcHaGkpsNmvFPNXNEHtXouzfg+yUN?=
 =?us-ascii?Q?Lo8m+/e/euuZPSklSgaZohws7tmT1aDzVJRk8F1ypQ+ZRVPLd1hojDg2CZnt?=
 =?us-ascii?Q?XtNsxtqgjIP4P7qub74RFz+moqIPoPb/CTBFx/2V/uEOS43JpnUpw899b5PQ?=
 =?us-ascii?Q?d3peKJehh7lmv7LRRg/ed32b+lxDzworY+w5gxJifr8cJHF9SaUyHWxVtFxr?=
 =?us-ascii?Q?JJ/5+0RHFVmzW0fxkjj/YU7a/QEWCW7Et4pANhHpUf27yZQc4NCNeFNtNFz+?=
 =?us-ascii?Q?RFdiTaeDylgTrBsfevs7yqEjyXXCH4F6tVAenRp2oxsULNXgxMFNPX2Rl+po?=
 =?us-ascii?Q?J4OMivErSOyPS3V9K5xBnnLpSVtR0LVIR/JaGEzjetxxNas05q/U5TqAmiyB?=
 =?us-ascii?Q?2kWFmO8JBjXHmVnYJiMdgGI5RXJy4ILdASTO18JIeE4TUWxREAcRhrTLhI8A?=
 =?us-ascii?Q?nqvvVp6H5Mn/2/ejLlNGneX+E4Y7mzQ9NqfU2Vg3G5h5Gywqhyfyduf1rHEZ?=
 =?us-ascii?Q?1L7w+35sS5z+gXWHXej95mo9jFsKiB44190FIY8CqaayBgUWhI9XsHPdB0sg?=
 =?us-ascii?Q?GxQuzGVV6+2uyULJCHefAXJvBMj5T7S5MKJRXauwq00vKqfxjTOJyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y77e4hj1k55pyHGD4VCt3CM/jiSyDKDv3FKOXxQDknXqePhtLXWGtELfClwr?=
 =?us-ascii?Q?8pYZr/3TgeaeYMmg/NoFSHjT/bBo4PUFmCILD619RfNSsggA66KGOMyAOLy7?=
 =?us-ascii?Q?BVuKBdErCdpZSGcbQjHWbZYcouzyZCwfkX1Co0O/kE1kAVPM2DWiEpasqk+h?=
 =?us-ascii?Q?Eph4J/1xEEahG9+VW7PBf/fbDX3YANJMXgoV0cHFQ93upzcmSk41/2awXvGE?=
 =?us-ascii?Q?2iybDE56aPe98DIdGeBYHpTa5nf9jch0cPXEhjysiVh6T2TBlmecw+5rbsBM?=
 =?us-ascii?Q?rIZ5eQ1iktINLxV5Co4zp7PGMz4vifL1S263NWm3MCVEhNzzDWF0KYSPG05h?=
 =?us-ascii?Q?Cb5Hknp016G41xNS3ICNqgjRAbFkHFQA0iHgV+4mmq6ZKl06oYBsPdTn7yGs?=
 =?us-ascii?Q?VOn0BqrWFSqWYfZAuwXm/hLWHGTXgS4bXPm6VVTn9ZXPfU2v5QtIBdsx9Js9?=
 =?us-ascii?Q?qtBw+j535OjKaSUPfaAHncne3QF3SViUqrcu/ZNYUj5LCnkZAbFL0I6zvOb5?=
 =?us-ascii?Q?1uZ8jOfAb9H/uAAxbrBSHoy5jVvCkkyUOUNBrMBAtKEML+LlCXeE3ObWkgy0?=
 =?us-ascii?Q?qUhucwan8BCseewNrSuoSCyad3QeCrSzW33FRkisdlo4I6424tFIcsBGjCxJ?=
 =?us-ascii?Q?joB9coyk5qZV/6dCCfh9CRU47CpllKPdAfzroRvQllIBdZ+goEboLbwe0L4i?=
 =?us-ascii?Q?aDZYjktb4re1R/wp+yNqSjZOoBpsyU2eRmosbhrA0wdJADyq+S3Gdfr5ivLN?=
 =?us-ascii?Q?Vb/hK6KtUOU+rOosAeroLx3V7xoOHB+mcJTAxts3DPEJWjnzFKh2xRhwXxtS?=
 =?us-ascii?Q?t3O6JhSDy1OCYtBsXcZihzOVVBgiueR8I44LwJhxMxqqWJC8KWknvqR/YQTC?=
 =?us-ascii?Q?VOVV2PkvaeU0M0q31ELDsgOFebkXcB9xW83TnpldztROFxHVVDoUhHQi9YCl?=
 =?us-ascii?Q?2M7e8DmEt2MCtJYH2pG5A3QRrKMJrxSjPOkcgxiGwkHR/grGPNaTpW/rZi+2?=
 =?us-ascii?Q?3/fAWz98gW+mwpdTqoTxuKkM30pi4jaWkopv5HagGRdTXcKJxvkP5CKlWqAQ?=
 =?us-ascii?Q?2gCdkTT9d/QtHAivCQnDr9jeJAlXpDDm2t0QmA5mjQ1ftzG3tSRh3p8Zhksz?=
 =?us-ascii?Q?g043Um0Eh9yM5SJh5mfKEJLCPcNAh0eIlfaMEfwQk0Ry95zJCRe3jQVHALi+?=
 =?us-ascii?Q?QrsLWjg4IJTqvprZyWC2Q0SOwRwWRp7KsWFvzqrxKjWPKAQBYCzWdgQJ0/iv?=
 =?us-ascii?Q?zJCIhV7wOTWO6nX4Hl9sURTS9xBbe4WERG+J5iNePweWAziiAyn4ASwpWVnp?=
 =?us-ascii?Q?y9CAxZnQGUikPum0evZoEq0kccKlqxJpuVKzI99ZAL9s1nB5QVYemop6EVXT?=
 =?us-ascii?Q?Mgfdub12lsHGCAF3tUBl4aU3HMGkNmwRKV2UteU+35hQ8y4DdBmI2p8a84Cr?=
 =?us-ascii?Q?RU17bBW9AUsxIrOb3j8LUPPFQ7wLxDJUZxUachzhWS8gG1PeZZ4saoAxqWij?=
 =?us-ascii?Q?LBUZcMacwslgPRhhMcJ36GXbJWQncOJOgWD3h9ehFZSssih+DBrMUGC+2stW?=
 =?us-ascii?Q?gd/ZYo3Qhw271S9B4/mNHNvv7IDI1OdLebJBEhA+sR7HBxGsT4GnBUdPDMPt?=
 =?us-ascii?Q?H72RK9HWBx278+bUfUnjuRYjfv6MJUDBF2dUBzuKnUxmQA/vYh+Ol5vGq7Gb?=
 =?us-ascii?Q?IFXAt5f/k3cVychO2OGn4GFZT8yIH2VKYFZpCG8WZu1kzb8VKrDS6NiXDXFY?=
 =?us-ascii?Q?SqNquRroYYszPlPrqFe+6NBqcMMiF2sOT+4Yhh877rhXUqAnCUqd?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b92ba6-94d3-44ed-4004-08de4911cf99
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 08:43:18.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VTCG44JGeL5BpXe25TK/Z86vunRNpyjKqRUTryHHWhOD8DuAj8SMOUFzuJNOdjjX6y0QDMj4Q2ugHDVNydl1p3JhsaNuh1+6Qvexktx6eGlzIa/hWuMg6+8/oVdz3R3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4670

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
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
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


