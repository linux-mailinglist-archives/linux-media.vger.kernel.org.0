Return-Path: <linux-media+bounces-52569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK55EAU3jGlwjQAAu9opvQ
	(envelope-from <linux-media+bounces-52569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:00:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2ED121FDB
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A0CC303011B
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 07:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8C634F46B;
	Wed, 11 Feb 2026 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="aWtzVTR/"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020139.outbound.protection.outlook.com [52.101.156.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882B21771B;
	Wed, 11 Feb 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770796793; cv=fail; b=PS0GDvWJlJb+WqXq48r26M/5Y7Tg5+fIUr7FhLEoSx4E8ahQsHipdAD6LH1rD8H5P9OYZqP+viyPxeft0BceJdjtaI17ygM5aHADiq9zvoafBYSY6FKC/hFa4QUba8tyGDMBY3Ei5KYOTn18O7ONo4qz5omWniBCTQO2/jDwKxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770796793; c=relaxed/simple;
	bh=T68hDLBbJ72owBhMk9lXai8a9d0L8sOsVUd6XEJJTw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qo7DouUq99RskgmOIBQXJ9ksJYqUYTYBoRwQxodfdM+0XNPHDbV+TR5xAIIeHw3qmIgQPLrgdDhoBb+M0PEYCH1xu7jb43QnzrBntcgJdJt0kO0G3lsDOZJGeMmfEWWROEZR1Q70mNNZrtg8k+pzjWESpbrXnKvqKcQYrXyC/Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aWtzVTR/; arc=fail smtp.client-ip=52.101.156.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwItDoLscod1cApUeDUMT6u8OVhldD9kq7KDClrdudl3Bqk+NDIo4h3t8lzlZqj/r8WkSfDDTDvOg+WOtX08SFe3UdZX9g5Jz8aDMoh71/l5JwoBXHQKxz10CnhDPmXYRGutl0NHX1BreiMR+HAnZlrtRbm3wNi5EGionHFDMfIMEtCHGmnwgBx5VgmPPgCgoBamwKtkgPdvKgnwxhb2Zk+0esLyLtZhaEshsf29AZxAtiC8r0kQxK5qOrL4IKgEN+BxlmJPv4alGSz36rYKRgKieb2Wtlq8nHa4qjToF772srdiF15nWg38+HlzNzL3cfkoL4JbrX5G2dN/N4IK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WZ3n1gz4CA+8tiu9j5S/j/5e3mKA0iHTC5CNT2Vc3w=;
 b=O+3A8DYUPpGCr5gcPqH6geZxefVPU3qcHfwO80ZhFKQ4UusTTHQt4Qcbwa1LOVqHrjvLOXvVBVKuWhef6kdwoNen/NdEgZ01/2Fad0jc/8aH27LaGocvhvDYnlu1as7Q2SCZqWrV5kQrtaPgXxPGNSa9hvoZ5Cuds90R0i/COtrZETGFieXdbBGybBTvz2QBU9PzqdYqxmYpPQxYO5WJLcgX2LeUnxvaHZ9p4d5l/uIBMYoqupwHLFzIMqXAqAshAFQOsvfpdbJ1w4o25F5QamcGERBrIu3+DrOFrIp673285D7VUhAvc7LTqsUOA+iuTpPI+0bK9bHKw7q098nvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WZ3n1gz4CA+8tiu9j5S/j/5e3mKA0iHTC5CNT2Vc3w=;
 b=aWtzVTR/wn0sfNY7cfqjDp39M4h/2IO459FkCgYcCh61tPFI+1Jt5lhvVMSDTek7Vc8Fi5TjmmW/HJ7w/u/ubnpOegL+Xevps56r/x+OtAkGWnQAdudjU4Y2uv0OD99L34Lq8UF66Xo2hqSCYYFkLNTy87RI5NJlOV2Xq8/dq+Q=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB1537.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 07:59:47 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 07:59:47 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, jackson.lee <jackson.lee@chipsnmedia.com>
Subject: RE: [bug report] media: chips-media: wave5: Fix Null reference while
 testing fluster
Thread-Topic: [bug report] media: chips-media: wave5: Fix Null reference while
 testing fluster
Thread-Index: AQHcl29WJrnjK/2u2kOoFnoIl1+h6rV9FsJw
Date: Wed, 11 Feb 2026 07:59:47 +0000
Message-ID:
 <SL2P216MB24410F7F4D9313D4EB805285FB63A@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXvWnQTmC-Boos9@stanley.mountain>
In-Reply-To: <aYXvWnQTmC-Boos9@stanley.mountain>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE2P216MB1537:EE_
x-ms-office365-filtering-correlation-id: 49cfd082-ab21-48a7-5620-08de694386b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tmYTr9LkrRR7CZl6Kg4aLu/x3LcmUf002VyEIJOHj0igWyP/uaOvbftpp1vk?=
 =?us-ascii?Q?AlKAcyx4BqQHgiL9ZcQj6RkddiZZE+FpVZi5puAWvZH+0Zc23i81xXCcJsKR?=
 =?us-ascii?Q?MPMqxLq3SrSjfUbhrCRqjClOupwwxZ0++RLZgf7lq96KdhLrYKH/al9bI+MX?=
 =?us-ascii?Q?kl0Hdju5Acjl3zOON22FJQ4VNUT+nagcR0n55AuyCm0HugA4HeqeJGPVwMef?=
 =?us-ascii?Q?+za1rl1eFddkdh7cfcHyEcgTC0MrrzciSCuzGUvGeWu6i7YVn5pY69yaHSKQ?=
 =?us-ascii?Q?wvo1okk9J0Pb+Scy0Ns+TrGvlWMwiuUxIKhpPPQZFQrZ321G0KwGLj1ICM2G?=
 =?us-ascii?Q?Y/VT/9wCbrf+JWaf/omL1w98dLUd9El6nyj3ZdErZ9sTPhseNVU0RrI6WTrV?=
 =?us-ascii?Q?nq9j+5jobwg0tu/vOvK/IFMWufAgB7LUO7ZJNc4t979SzPB70MksWebHVuCn?=
 =?us-ascii?Q?yiCYtsZYTROvY0jnZ/luxx+nJT5FbTA0wpNDft3bmWA/ZQHImT6yrHBBHFYz?=
 =?us-ascii?Q?1rhJLPfPPop6DFLmjV/YmKoNHr1H37nER6pBTpDlV7gGUnaJDr8LJ8fYqZ3d?=
 =?us-ascii?Q?pa3rscWjfBoKY1VVIExEB2Jr1SdFHQPGLosaY0jcd51EDidkxVvW8VDJyauS?=
 =?us-ascii?Q?EZRNonWZ0Pvqspd16JJTQnKEPxFIhxPXfWo07baHo/fH+UBbRwuWp9d1Ru6H?=
 =?us-ascii?Q?HtQxc94pzCLBQDsF8bcj6HZKk5v+mDhIxoOQQpJC91httUBGba9Y5meA96TD?=
 =?us-ascii?Q?Es7m75ScEYv5xYFWA1uW94doa4WsuEBpADtRKS50mTZCAgEet1/3hTtsRsfk?=
 =?us-ascii?Q?DodR8ZBjUBZ61KSijSInSVkm4wSrV2pm50/jtdAMYEkCUnEgnv9SoQztREG+?=
 =?us-ascii?Q?Odc8D44TPZAQeXeYecewVk/V5hKeNhctXWwLsbKCEguE5flhAA/8e13IVRwl?=
 =?us-ascii?Q?1UIvqCbX+iDXctGHTQaeHAhm8fDcJVcV/VeKPXgYjq4fEnXI5BbVDye9oAZB?=
 =?us-ascii?Q?zTEigcMBXMbtMwbsPpm8Idnsr4Ze6R/Al4joiziTZ0GEhLpYxkeeqKp7JIWk?=
 =?us-ascii?Q?xzQ8KL6VGGSdXXNLculOOeo9gr6EDNsNqUOUjKJl3gv/Di53qppErADiKmso?=
 =?us-ascii?Q?rJV2JO8cab4gBe/11ljRFy/df0ITgWEEmYdF0giUtF7WxIccXLm2IbWyM70n?=
 =?us-ascii?Q?3e2OaIgBsJvenlxJLTqWZxExEO/N5Iwz2nRQI418xi2zqXYSaM9blSAdnO8n?=
 =?us-ascii?Q?5oKkx5sy0MJQrlesEAKXgytr8/wfJTbb0ONCeci/o/UNXJTAMx8FnnSQq16p?=
 =?us-ascii?Q?3TJzmc6VO4fKnU4DhDLBWWqOXt8jUp97wl/5VlDesBSJf0ruVnmcAPFsBKjE?=
 =?us-ascii?Q?fifUa6tLtcvBPHZf1Js9FT0MQmXglpeoquuzrepjRQbwZ/TPedsWMg6NJfiT?=
 =?us-ascii?Q?ZzCivLig3fkW/XuiXXcmtVpzdCCP2Abb6l5l2aJlzRzH75NvIFezUIrQFCoh?=
 =?us-ascii?Q?EWyzKlSdynrZOzRxUGTXLPpREbla09hJwLL0pSSTXs1kUKlAulHvi5aIzh9h?=
 =?us-ascii?Q?k0WDmY2QvgkYCq0hD82CIqVL/HtJCE4S+3RCMDpFefbARkyX1sF5JfL4/ZoW?=
 =?us-ascii?Q?MiR5EonpZIJEBvDIlsPQvxg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z33YPl73K71mY/blbu5oLQG2y0pedvpHEjWKYu24cQ1t9HUzLFwZiS1Qtibk?=
 =?us-ascii?Q?3q65p8buS6BWkdz3WBj4qizeEyo5x2j9ZEU+Dzaa0Jg/WdDdx6cric28SDKU?=
 =?us-ascii?Q?Ur5uhRfPadRkY59RDwgh9rUNB1aKVVzxTa1grR7QJRcKas4wE22n9p4pFrcu?=
 =?us-ascii?Q?Df/PgB6/2PsTMdHLWb2Rg1qNyd2op2efk47h45h8VQYyWhUUGHvMRrK/pmuW?=
 =?us-ascii?Q?k0S4YBKzYUv9d9m4UqfsqxrgIklnotJS3K+DIFGfJQMBrzUcT3DbinZGTuDB?=
 =?us-ascii?Q?qw0euQ/0kbJyoPi0FvKb8217Dt9fn8RyAUMKL+dW5GdUQuc3fzXzgawz4yG5?=
 =?us-ascii?Q?S8RYEdKAtxVVIp7T8Xtfs8nUhIL0ZT4DZzkNASM8i7ihVftwYoACZf33qvy7?=
 =?us-ascii?Q?EEI+UsLl12aDeZppm5OeKagSMSapWzKQifwrT+vdyTYmmhtWrC3iaqBsULqi?=
 =?us-ascii?Q?3fyHdY7vF+o8jB+QifrOv3aeWm+aIbDcge13FZNGMivOgbOZqtuoHdoyL8y0?=
 =?us-ascii?Q?HHaZDyoYxLQ6SeeuO0d0oTPF7As4oQ9NhP8avcBByCps1TdPuPI8he+3Xq9S?=
 =?us-ascii?Q?qJDah8Fxn3oDxDYyya2DGQ91yuW6VwuchyNWGe1bBkol5Y5OQFI13H/8kxag?=
 =?us-ascii?Q?v5NFikAd6PMFLmqP+lyb4p7K4RVtPrpRj5XkMpL9URhzSk8hx8bLtJsnCZ1K?=
 =?us-ascii?Q?KYH8DGv/zofW/J6Bk5mH3mB2SzuAUwW0jm3/UvFQeI6KEa/4qlMF4shMN2bH?=
 =?us-ascii?Q?/bgf4++iRmz+8T2hjdS1gL+Qoo86xxkJF/mj6GShcj58JzMQLjDw0aANcW8l?=
 =?us-ascii?Q?KIF3P/ROGPEtC2iK4sA93GKhZDio5AYPelM5juXbtBzOcxh8p3q8KRChtN7f?=
 =?us-ascii?Q?IfzL9vWtiZ5H/rBy/4ljniygHOU1PAhEANVKx3h2NZiAlSFy5RlpkB/zbUMY?=
 =?us-ascii?Q?wS0gdKQfJztvykWB8b24kBsxhTJbePYqCYJ81C/bk5iYBWEbDVHx4AMXSqdK?=
 =?us-ascii?Q?G4OVaHT0+FqJUHchDk1fWM0uyePe4nrugV5jvD5Z3eUAyxu4KZ+OH+MxnHW9?=
 =?us-ascii?Q?ebsBfveASYBJlwKDsZu61FdBlNk6Fknzeh5eTTdtFRaYbnPvPtDTAMTmE+p4?=
 =?us-ascii?Q?c6//bOSQlteWYlw9h2020TQynKDLu1GsEXKy87qzyua4SiMZRCvEXzDBtfQU?=
 =?us-ascii?Q?Xc3LboapapUkjPebpRQhpCQcdOd7a83IbycQGQOyPrCbNIlo4spK+JBnD+rF?=
 =?us-ascii?Q?4edscDVXyk39CtOvPbIpm4Q2hz0iam5VuePjQwH+2m3hVRTs2zmGMzRmDuoz?=
 =?us-ascii?Q?kLzatWHtTb07pQ0f73685N6h0pLYM36ZoD0EmtVwZL1a6bUZqUYm1Ro0fDHj?=
 =?us-ascii?Q?p+QXeWdmO4xrfRDQ6EejrA22/KQfhjmSoNcTpOuB/WPHg2NCp2Z8lpexhAUX?=
 =?us-ascii?Q?RFuCfx1bEuR11FCdRbeNG2KLousN4xloG2slCYDHPGYTxL+2z7kYH2DB8+9y?=
 =?us-ascii?Q?p4o0yM361lZ+wyWkfY4c/gUx+dia68fH5FTVo3xpJFiSWdy0qvfRnDBm4a7B?=
 =?us-ascii?Q?Ghnsr5zXsFJdqcDUGJy0JB1/ZxTYf4LX+kNSNOdlqccz0qh860U3yfOGorvG?=
 =?us-ascii?Q?nsVzDC60dNlI5R0db6tNeXrDvlAJx2rt1DfXM7TOF4ARbQESNUYSZN+EYpqr?=
 =?us-ascii?Q?DRaIehVOLtok8iuQO+NCFmmDkBDQB/rpQs8gWFDGxNzLieG308oZJ4b/vZAp?=
 =?us-ascii?Q?BpNdL4Jzpg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cfd082-ab21-48a7-5620-08de694386b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 07:59:47.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 836Nv/2ScRoGpFYfJdm8Z+7QaReP6PO5g2N0v1+zFbr5z48Lgb/UHtZLjfm9SwlGjgJRnJyf4VIWRLpPT2ihXWUrPnR92D2kGij9T2s0A8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52569-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chipsnmedia.com:email,chipsnmedia.com:dkim,SL2P216MB2441.KORP216.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 7D2ED121FDB
X-Rspamd-Action: no action

Hi, Dan.

>-----Original Message-----
>From: Dan Carpenter <dan.carpenter@linaro.org>
>Sent: Friday, February 6, 2026 10:41 PM
>To: jackson.lee <jackson.lee@chipsnmedia.com>
>Cc: linux-media@vger.kernel.org; linux-kernel <linux-
>kernel@vger.kernel.org>
>Subject: [bug report] media: chips-media: wave5: Fix Null reference while
>testing fluster
>
>[ Smatch checking is paused while we raise funding.  #SadFace
>  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
>
>Hello Jackson Lee,
>
>Commit e66ff2b08e4e ("media: chips-media: wave5: Fix Null reference
>while testing fluster") from Nov 19, 2025 (linux-next), leads to the
>following Smatch static checker warning:
>
>	drivers/media/platform/chips-media/wave5/wave5-vpu.c:415
>wave5_vpu_probe()
>	error: 'dev->irq_thread' dereferencing possible ERR_PTR()
>
>drivers/media/platform/chips-media/wave5/wave5-vpu.c
>    327
>    328         dev->product_code =3D wave5_vdi_read_register(dev,
>VPU_PRODUCT_CODE_REGISTER);
>    329         ret =3D wave5_vdi_init(&pdev->dev);
>    330         if (ret < 0) {
>    331                 dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", =
ret);
>    332                 goto err_clk_dis;
>    333         }
>    334         dev->product =3D wave5_vpu_get_product_id(dev);
>    335
>    336         INIT_LIST_HEAD(&dev->instances);
>    337
>    338         dev->irq =3D platform_get_irq(pdev, 0);
>    339         if (dev->irq < 0) {
>    340                 dev_err(&pdev->dev, "failed to get irq resource, f=
alling
>back to polling\n");
>    341                 sema_init(&dev->irq_sem, 1);
>    342                 dev->irq_thread =3D kthread_run(irq_thread, dev, "=
irq
>thread");
>
>Add error checking for if kthread_run() fails?

Thanks for the report.

A fix has been proposed by Alper Ak in a separate thread:
https://lore.kernel.org/all/20260207103224.609938-1-alperyasinak1@gmail.com=
/
I'm going to check it and run tests on my side.

Thanks.
Nas.

>
>    343                 hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_call=
back,
>CLOCK_MONOTONIC,
>    344                               HRTIMER_MODE_REL_PINNED);
>
>regards,
>dan carpenter


