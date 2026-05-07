Return-Path: <linux-media+bounces-60709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGQ3MlcS/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:17:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC44E2D69
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E873051C43
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ED7322527;
	Thu,  7 May 2026 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="m+kUcWJq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA91F3BA2;
	Thu,  7 May 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127274; cv=fail; b=druRFIEN1jXuO4S/b3NIqHQHawwp/X99h7mjZ8FBGbZmIQOHZ6wede5GVJZfhafb7RTHxczGyixULJuMyuwb7PsqH3lwydgSgz62dZ7ZwpUJ4HG7p3OQ+VFHHoksKaleNJvzbgVWNuqN7FYYNysV4liFRVREtA3rYpLFW3s9ORo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127274; c=relaxed/simple;
	bh=PE2wtAwaP/8clvpMGz2a3MHZPyRngZdpx68+RV8Ijmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oku3icxcD5Oj/urvR8NzFaX6qOXEokT13axq8N4rHXDr60ER5VtxWE9K1poLVb/x61gIbIL3FMmBBUkyK4FhRk2prZEkOsd+dkkDJgk4H/dT5VcwkCmZIWx+lzXoCxPR21JRM2DiPXp3299QGDwnckadRTqKQA64CrDj3Y1Jbog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=m+kUcWJq; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473uExE3673670;
	Wed, 6 May 2026 21:14:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nFJdsw7t+OMjxc6O4iWZ5SWmGyIf4lxm+oHnSYx0uKk=; b=
	m+kUcWJqvencUhi7AwTGbCNWNC1r2rEAm88aTEOqbkqToC7/21xFSgt3p5FzMCf/
	c0XQI7ue6WEdCIGW2Ob7PKvfFg4wZa+YNwPO6TjGWaE5yUb8RooghhF4PbSwrI9t
	bzF0ZLL2MJ7y8F3/rmjfgO+0YwmtstLH8i/4cqc+i78LaRCNZhyaEd6dZB/SfhGk
	K8rWDlNaxcljb7d8Vam1yZXYLo1N/C0m87T5We3gqW71bBVrX8PSadG9YASygvFJ
	MOkcGyFPn9KFzxGPccZwsYBO7CTTSBuShScCWC5MfZN69hWkPFPTUKysf7Poc/WC
	RLscOVdx5QNBrhFq+/DLZQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddpt3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 21:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfJuiuW/RrLqNanrBHEdKtffoF32Iypxn3CHAoNUq6H9L6ajQY6xMSCj5xj3tcXnucT0nfl7R3VIbS7Nx6zh5JD091qeh2zc/mGJguY94DOtTY0/RNEhvOG/TKeWN7L59Y5g3R6VTro2DaVZceQ2tvBZTyT7IZHGYSKsnYBcfSgIIMrz77Q1suMOJIJ29cJP3ZCwVEbp/ksDB3RedHXHiRnZLqqyqJttfNYa31zpDyv8ruAg81QDQvenM6JTyNRK5I+2CM6ajkCdP8sQlfmHXD85dkAQ5+yJML1355oxibffcMNIQNFDQ83fxN3sS5qqAB5iZI5G2KBeRvyDHzENjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFJdsw7t+OMjxc6O4iWZ5SWmGyIf4lxm+oHnSYx0uKk=;
 b=FR1XCZDWyJKaBJJIolhMjhXaWuxTfJOAkECr9mCcSNBloFkFur0eHXUQ10zcw6/3/mMC/W/81m9ZXy7rfgm1nKCFHvV4jmARdcRaqulmUFRa2PcEpVvCrnsJzwLOSc7XjWPZh0LGiGKu5m8BOwFH9RnNiDI4xPJP1rtMqlO1dWjxoJHriIGOR8qu3REbOl1lXpLBadheXZXQfqdFrjS4DI7M6FtJ9I5nQHcpCFPQ2XpiysQFiLBpOU6K4LKgOlSc7YiWMUq4CBQA6cZItpl7QhhTt9oJ2xk7APzoqv5R8n5as1RqgsU2+fZc7kEoaPVVZ+w2ZhyV/f1ue4lUgFh7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:14:02 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 04:14:02 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v3 4/4] media: imx8-isi: clean up already-initialized pipes on probe failure
Date: Thu,  7 May 2026 12:13:18 +0800
Message-ID: <20260507041318.491594-5-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507041318.491594-1-xiaolei.wang@windriver.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e7f1d5-06af-46a9-2f12-08deabef11f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|56012099003|38350700014|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gjWTy4gjm5lnXg8AGqLw44zhw18TxmOayQbb2ErKeBHvdHA9Wu1d8mwh2lgPUg3zwFmayfhS9WpHZc6q6K5Mnq+VPQkF6J6W0+cb0313SGgDq4Ok6m7rJG+j/3KXeGlICOO5DwSNnsU81p2ZSduSaSfRGvHfnf6WsdfvLaflvmS0TqBBG8Q45csc9f315ofIviQ0WElNHHn2Qf7BficFttonYR6+nyxuoxF2xToj0hpbHupjMm2/It3zw1zC2IvU/QrbiP5nQP9tYzTke6DMz1ZqIZMwcGpa79GwUmAYGB1/PcQGPdnKE4K9jC0eDpJCmMOpz28PfyEWDa8oMdWtXZBy2bQ6o+Oz2PRQnwVHUnusY7zP0dGp6mL6rpAIXXKXPFc557RJs1P57JAV6j3O5M7kpQB6Qj+v7YKliWMVcP5/jIDuqK1JKnXM1UEH34Jf7qXCvRqiOpRlrUBvOhA8jcHAVeA3of5OyHaG0wWG0pJa6qd7w8Oia6A0u+HVbcUfW/yaxAlQZpybYhZKtuXCrfmOxwj5WtOKXNfGOL08fy9UPCYyfFjjKyWWZGkaQ4A8MD2TBuT7+/sRJGfSizRmL3wGXm5lfiyRhbBkB16ePllvWViYhrjOHuGm2hOThP6IKBUyZNJBXBuJScAYqHdJsW0PB07/LZyVjJgpKsAim4bFagnv20TxjG2gWA5eZRtmN6kx1aJVaFnrnvAeWDoJLmQZI/tMSPlnmH+TrepU2nxiG4qCkcelJJlpn7ku9XTiuvp47FAsxLM7BodFIP5b0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(56012099003)(38350700014)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZbLjRviCbtRpkUXZ97uNFV5BJ/OS22d2C+ZgoZLXtReyonbDHUaFeE6olwJt?=
 =?us-ascii?Q?TjflCOhG4st2bldFXc94Hwzfn6h1kuXvdI9CqZ5WErsXx7U9WJJZQcEviJQ3?=
 =?us-ascii?Q?iDMS0mXn7jTnBECVZLTJC00JnSS36zB7y8GlKms9UCTSpKOK3Qj1GKPHDtzd?=
 =?us-ascii?Q?oae5Sr1yiUCKrb5u1FGofJ9t+DNLKjImsRNx+rrGCEBSeoQnolF2mf+YmEGE?=
 =?us-ascii?Q?SZBS4yOfhPbFw19s4sd7OvxpwEHUFnhMkPw+FeCpr18GTIC5r7RsHbG6xmFl?=
 =?us-ascii?Q?F7X0bVePtNYs9TmCY3+qDLx0P8kqN6xDJq/XAxva7U3ewNNhmMcovJpUujuz?=
 =?us-ascii?Q?xigPxSJrd3c7afIZXx9nRKzzlqqae6fok8We4IAQUs343hlgl1q7z4UV2bhc?=
 =?us-ascii?Q?i5hvHNfTUXWVzzKGbZYuA+SK7uMxkgRoV2Ne+Vm8fqHOw4XHkmt5Gi2eoiHx?=
 =?us-ascii?Q?5EELWgN9r0sOFFF6t5V/n2kftdaYLWoJXKR3TwhqTMO64UVxxNs7Fb4M3JmZ?=
 =?us-ascii?Q?BP2Xg1e61wdxuZ9dUsnC32W0/ioOuketTjWO7gPzE8XOkJXFM2rZygaVROAK?=
 =?us-ascii?Q?+TBwBmCAbe69C3xDn6JLtIYnEhXKt1F1APce/1mmFBmx9BEJAH5PspvRld/J?=
 =?us-ascii?Q?7iW2dt1KBpYsY+XkxGvsO3WPKyN7iPbxloahv+ic5WHd2CAYqWlUSJB+DtCQ?=
 =?us-ascii?Q?L5PNi9u1zC2MRSqQ0E7xhKAV7PlpMwlDs6/QBhrJiBDoDmCK6GN/y5cmoUT9?=
 =?us-ascii?Q?71LMuxQ75ZhZdfdOg/ipv3vstkKkK1D6GQSEE+s9gzZd5EXZDffRUNKpxfKx?=
 =?us-ascii?Q?Vkv5E8BJs/S741nk3qz5KWgtaSHjYtuWytwL/3I12c7FiaUbXDZH78tYdjW8?=
 =?us-ascii?Q?ig3NL3ZaFd+y1TtmR7abyJ4SsyvGx+y7HZxSAKH4mQMFMJxjZ1HZVDFxuk4e?=
 =?us-ascii?Q?qmvpD1Pak3fAZb9KjpiinY/Fjn5i0/UcCkpxEnEdl0dwtoKEN+leESVsJGTj?=
 =?us-ascii?Q?g+ACLA28gqPzGq04sQesvqhz74DsPcB2T5uoK27LumSX4FaBBVl3eLjLKnqG?=
 =?us-ascii?Q?aUQJMGKMfsrvF84OpVH38zzGkBD1pMfEATik9p7DdFugXWW4dRsorvVhvD8X?=
 =?us-ascii?Q?9nGo6KGkiGghCs+nhxOONhB+tKx0HAIW1pNVRUc3gtTfnfBEc005vnRbP6xy?=
 =?us-ascii?Q?25BW3ZKiNtEX7G60nr/5YltVW6pyRSwirbAdxl+9mVVsRF5EMV73L6ABCJGx?=
 =?us-ascii?Q?npS8iGzILOGe8GTMlbnUtRFtzWe7VN8fBaTnmx1iPyhuCsf3jEALLf2fqcyY?=
 =?us-ascii?Q?jS4p+2X1YMGt+aq9YqnI0wQmGJKo4AYhOwCf/Egk6/NpQC8x5g4ueLK+mjE9?=
 =?us-ascii?Q?Obse0lCCrQwXIf0wS2jILlE3NUqDhQ2f8j8h0twqTVmo7H+/HCKtLShfnVpK?=
 =?us-ascii?Q?L2yAOzkzoVdFMqK3RiJx/uBHV8K7hKubU5O+Tust8pGOSaNyPMN/Cj94SO2T?=
 =?us-ascii?Q?DO3oOZm1ieSTq4Z7LKEAOGdU5yRHhHqvmcOWFrg8URyxL0ghiLcwwE9AbtKG?=
 =?us-ascii?Q?lK61nMXIg+XSV3Qrtma/UzDKp78aLJ8ywoMVIcPVohB7AzDmHxwc42jfOOb5?=
 =?us-ascii?Q?XxWKb5m6JNZ8YIkySG1nDWBJb1iWpLPpgg+w3nFYLHTwTuQfudwFHbK84QO6?=
 =?us-ascii?Q?7bDQU9xCWKTBqj9BEvIoD8R0V0AhE8lkncjAXc3yIxvM5fW5zFBrN+KYGIvQ?=
 =?us-ascii?Q?TzesSVXj8fVUexzZfcoKEG/zkH4LpcU=3D?=
X-Exchange-RoutingPolicyChecked:
	OphKTThutQ7RT34gD5n73Juog4zSiefukQed72yvzvdfVRYeKD5McIXhFTRQ6q3NVrt+vhDK/Jekg99HnN4NW76YqmUhBJ4s3MuiwfpgR1OwB8P7SffxydlUX6DBMg4O6paW3f/1xmD363VbO31N2Zmblu9VqOgZcFjY82yDkqekslgyCegbiMmerbtxNN8Fgk2xT1JnYFdUvcLf/B3vyWYWVQXbFghzwy7nGa0XCBc9gKS56MJHFKFxDTa7O1/YGCeclH22wdEv+JBs0TX6IbnPZDGsjYNAdQnlUXgmie01Vm6rA5JIF7oklAO6QxFtTVkqSXR2rRSGxDfEkz8kPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e7f1d5-06af-46a9-2f12-08deabef11f2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:14:02.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mA4uE+rffbP18m1eUbeO8qbAQcKOUr327WOf6grzfk0ILc+cYPZY8IjLexGzaq0gPt+qWxVKFjh2ee/CWB9KcG2fPa62S19KOAR7PnxFp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-GUID: 4LPWQsQ2TSkX3818o229osFDEPTVBghY
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc118c cx=c_pps
 a=Q0mMAVO0nY0JadJ+SMvTrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=P1BnusSwAAAA:8 a=8AirrxEcAAAA:8 a=ipK78nv7T2BkFH_b0c8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 4LPWQsQ2TSkX3818o229osFDEPTVBghY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzOCBTYWx0ZWRfXwvIIG5JAhzxr
 HDxIKGFwW9v7XT0HyHmPikeC6c35i93LvVfW4xUQJDoEdFtZu9MN0ZVZkyz8DPcDyk5i+5QO+2s
 AsCCrNEs0BqeaUl3oswJz3yF2DsOmhEsD+TDQMRK6v1DHUIMpNN3W7By60YwG4FcNzdDNwP6/lL
 eSNdRaUglnEcmScyXM2kL2REPfQXNzAiRw9zCxbRoizYeaaq7j2bvsc6oX1r8xj/Qf0jccVqQqN
 kMVPurRuIJT8QgZ5CDKbCcfmxMxy35gV1iCXiYR4u5+UPQSPVz1bnCm24CQpEIWJOaZGtL+9ah5
 a++RZzg5jCztfBlrXZV9f3ckZcC2bd9sFC7xUmdO9/KA0DYpS2VW25WwwvJwqipSSOUNcREzs8W
 KP+EUTwVkXQ3cRTbV9sGQC3txch4Z+/4u/C1tIdmmJecxsVkWNPJ/K2xuh2jFv1wbrh6+90TSmR
 ayq9eI7vCQYvy2SHdyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070038
X-Rspamd-Queue-Id: 5CEC44E2D69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60709-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,ideasonboard.com:email,windriver.com:email,windriver.com:mid,windriver.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When mxc_isi_pipe_init() fails partway through the channel loop or
when mxc_isi_v4l2_init() fails, the already initialized pipes are
not cleaned up.

Fix this by calling mxc_isi_pipe_cleanup() for each already-initialized
pipe in the err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2d639b789910..e8545761b5ff 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -538,6 +538,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 
 	return ret;
-- 
2.43.0


