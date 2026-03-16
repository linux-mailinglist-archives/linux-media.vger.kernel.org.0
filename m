Return-Path: <linux-media+bounces-55871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKhGIl/It2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:07:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E002C296B52
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B52A300DED0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12EA3845B7;
	Mon, 16 Mar 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NeyxGyuC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4F38425B;
	Mon, 16 Mar 2026 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652031; cv=fail; b=tTDiGmlLjChZGt0XRSPINuJnQ/Rss+HUqxCT00iaa5qYkqchDZuXumOe7wFZdRndi4GE1m2MoX1osIVy7D5Ew1qjrxdbCQ92WXgXLHcufKIj4N27XMySAK6N7JhaheCSp4/b/OMEM9YGahwTkdiVE3+69il9YpmY5OvBiFC6Z1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652031; c=relaxed/simple;
	bh=7kvX8qGd1wjKCVGTTLXyKg++fDAvi2he/GBPFHuzkqY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aYJoZD8mHB012C+DlfB1XbrI22Htr2svyDOrGq9n1fJA8ddAhtwc2XojeN8PnB29plxl07dXDxFw7z5Dx8zntxs/xa4TwqjI1vhaAS102/OhwAU0QLfCU8Ia6yXaHzRO1eOONl2NyYmTtxbEcDeNPCgf3d/3CfG0tn6O0mndbNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NeyxGyuC; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5ZsU92316938;
	Mon, 16 Mar 2026 09:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4PU1CbnhN
	LVwQNXppgwcPY2zdmINiYYLgDr1q9gQygs=; b=NeyxGyuC8UNtyn8DYR4uivL9K
	Ds7CbWa3AAKozvI+Q0BBctodEQuVa13lZITvTmZCknia41b+dwlO17qxLcJVerDe
	SYXNIsJRIZv6jqhKuyRuleh5+NoYEXC0KV0TFauoKCvnZpCzMxkBx78y78Xk0c9F
	j0l+YR82HYb6NjH6YFwk/QRWUh26R424xbaCqgZoKiwo1GWkHeBm38663zNiJHJs
	o3z/9K+DREesDlH/3kSoMQsHTzXXqdNKthuyZPSMJhloqHQDjapIhQVv5i01Vit5
	gYVsOheiBNHAk+SfEW0oAQIBaKlxhR9PCTpe1v+Pwesc3VoLG2yZ6+nLPGn9g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhuag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 09:06:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/ah5RErruGXUv3LMSk5bCJ4mZYq/C/p2rj3QGenhzHZMy94B7451vnXzr7muODd7Zm8GdCY0flMAwWklaTk/IH2sgWihVp+kZbhabBpqqkhjr7EgZF+Fya4u7SLKSGb61sIi4lAIgrNk81otYcVw9xylMlggsabR4DNXh9xzdQyRKUB8xmF8CdX+XuEmsNWosGZVIQzOMoi0MV2Oj1v4Vga1/BEQF1+t6bBvLeON8HLtI5zHdHSPvPsZiH7z5ZYBJsYfS7W0uZ5sDGR+KuMBadUQWNOkfP7/QqsiKdj8POWrltp0YmJpbDVaYrdLdDODX/vwmCnwIUxhAk7y0MEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PU1CbnhNLVwQNXppgwcPY2zdmINiYYLgDr1q9gQygs=;
 b=L+VN0l8SLKtyz4vCJiC4f/HiecQZvGZL55klV3Q/qeG3ycKya4FlBR7+yz5gEB+xUxU3iEyb++6ESI6092qFIVwJ2ThvkePpG61gMXabpCyt6gFhuISrKw+fj25c1GDcdAr9PjJOyTq8UToHRrLFCzdUHsiMdu5uZJXHqo8UgxiX7Zk/niXLPPeOt52K23JRhm5GOO70zcrWzDYJbmrXWDet+RUnqqLQ1j2ynNWlu0o+osTV5hYeULBVj/HN8aaPQx1fYh1rNrYOYeNaNJyUgQTCSIgqP3GGCLtRliicnfPXWmocNzI/VDAA2SpzabOaNud74L3sPCm9IiNHQ2a7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB7372.namprd11.prod.outlook.com
 (2603:10b6:610:145::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 09:06:24 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9723.008; Mon, 16 Mar 2026
 09:06:24 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov9282: Add test pattern control
Date: Mon, 16 Mar 2026 17:05:58 +0800
Message-ID: <20260316090558.1537823-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::8) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb90601-601a-4509-5c04-08de833b4c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7tlSdm496WlNqxhkN+PjQVTLLDc4qDVqvvP8Sgu/C0KrsYQvZBZTJJlLd1hAvjCTnvLQifkPeOCsWaxpfvGJHVQB+JdxT9rBBj3AW+ABmlP2mNfRbumZbDY/sIvv9SqG3qmWt04Wd0H0pfFEhqTKPGRoEYHPf/qeTeYc7poNcrdIcgYSdP6R61PtTRHPcVfmVmJizAOOvBHDMGcGrFtO/vFiLttt2kWNHBGZRMXfUAUblcmJ60N8kcRaCvON4k4CdQE8Xn8fih4kpWiYQsGqQrRITWyl8KD11cz9U1iAS9FkVujvg+e5sXzQ7KqZ0EAhLCgyvlMfCd5PYq389W2kDNfa2jtvmdtgfs6VoKy59NQIQcRKcWMrQDPc2zGVsFtwiY0SuZPcwF+10eVt0AWjXgTKCOTwO1Y3DFBYKnkqqSFEEEpzMUBvXSLLqn7ciOgFVSK2Hill4aEnMYjJtKtKuRPdA/INCpjQqEochKyGAORI1K4uL/WcSwNXBm2nF8kxasM6W1qqEZRkyhQ7PisDwTM+73EpyYOO86+Ro+6S56i/KeTHD2hjlHH0xzyXYDWO85xRdXxbqgmL1T8bLj0voCt5TPUw8q+J3Z3/7WTXo8yEH4tFKHMQsXIPgta2KVq1KZIX6HR6xnHVXk/WtcPLk4pt1zZGpg4yTBPmwBJg9M2aIKD/NMYwIvtp48k3LVYZKs2WlUDU77X8Kn6a99rXpweGthMX9cY1q7fd/1fxqS3F7vFwpsh7xPfrUAxRSvL7u1XSs7SQW7EZ4UqXmx55czTfR+xbqxQeyFR9NQY7HTbvMe9A6zcbDiM6yIMnOWd9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LczjqNloeiKVAPSzebpvyuJ81oKe/UCUG1vej+3aw/3uah5ztA21o5W+4HW/?=
 =?us-ascii?Q?ZjJJENRXVP2aClLOqnPzpXOQsKWppvDtYLexQQBo6zfdE06pHAdsyaFGXDpX?=
 =?us-ascii?Q?VvFqwKpbRxUQmDGAhlE3SBGFzGDyhyLDgm/0MMjfn52jV7iv/jf/ki5APmxs?=
 =?us-ascii?Q?DRdPrXwF/9q8SsXOCWrePsAWEyv/X8Hr2a/gvnKf8iPWV4yatqhsC+5V1LaI?=
 =?us-ascii?Q?DlpGLu8qetSmgIGwXMBhn58Yl042ha9f1+Kc8B4qJTgqaztn5eer+scCmQex?=
 =?us-ascii?Q?c4zEN1Q8j+eLUzZvP5rpVEbmdEpOuQIH+hjlCuKFtdkctNiaZh58eZncQk70?=
 =?us-ascii?Q?qGX1yp+ixHzywfvD/o3C93cwLbGKAwb9vfQfMPQ4wmOm5pSqeEcyVvH73kMi?=
 =?us-ascii?Q?P+OfKnNNGiWhhDzM7P7vlGZiyyALKf+2DxL4+VrozZEWXXfmP8ZXMWfw0da+?=
 =?us-ascii?Q?4ZYBgIum+tgfblgMI/7hFQNzu8RBmRNQBl3HUyjyUT1vrWqYWHW3iUiDsxDT?=
 =?us-ascii?Q?MwUpaUoqw4fGitwSF94HbYLRVD6ndfiIRmK630laEOp3yCjAmf6eLqpq7Jsa?=
 =?us-ascii?Q?iLZk0QzjrI/aPH/NXwePj3e161EwDb2/M+CNW6g2V31OBFtmoSn9+BpPJ4Fk?=
 =?us-ascii?Q?yUe70jadss3V7jevfZn8uzvU6ULdXPGNO6Xc/FbyR5xJCfpvPkuoOusYdqRc?=
 =?us-ascii?Q?QVkFz5UQ736B7iIC1PRzwCNpakit5M0G7lZ0NSqbCNGon7WMu+Jij93ugd4s?=
 =?us-ascii?Q?d/dh7AcMiKRZhxWTWs3CQPG4XI1I8Tx8jkWhVJC+NpEE12ME9lAm0gv88JnN?=
 =?us-ascii?Q?QhJ6NZ+kYHkvF69GSoDmahCHKX7T+8HrIgjMW9QFmPe3tD6M84HXVZ8dS7xb?=
 =?us-ascii?Q?QfpwzW9GmizhhbJjZ0B+xRQxbUqGuOjMLGu5NcJFMKRCyfN6o+ElfmtAKo+7?=
 =?us-ascii?Q?RyqHQISntW/pkmSgLglA+F83Ad4ZyJSdG4Rdv8xxz0X99VA0rkx8GOzHv1bL?=
 =?us-ascii?Q?ekmEbC81+KagXdKX1oU9t8cDRRlY8ZxE188kjLL0tGbsI+kJRHaDbfKtQ96A?=
 =?us-ascii?Q?WjSB7PPAf1F55I3ZL0ynPcpAja38jqj2RCTD4Vs1jKHq479A4F1+lYTbrutV?=
 =?us-ascii?Q?CbrJtoOPv+Rl2ezxlXPMk+JDzYfDwQwqcH6aArCvFNqVMT3gTNOjWoWr1J60?=
 =?us-ascii?Q?JY0+YGUBXI9qkaLWf+RlS2MZdQ1MPdVzMix+Cbhq3PlktoKzPxHZRpcZY0/n?=
 =?us-ascii?Q?/8pMcNx6JSwZ+6CFJ2zMEc0sfSw+VUbV62pYyMb3znDDPUuNQNL51eoLjtBG?=
 =?us-ascii?Q?61dwT2N9cDfS/91w1iTOQpmszp+CFst4ujocU4CglNiRgerm5Zf7cAzTmw+m?=
 =?us-ascii?Q?G9/GLdtHJdoDZpIFpa1tbnx3oDLoP1oryWrYQPiNJMSs33RNFCQB9rXIh3Y1?=
 =?us-ascii?Q?rlA/nm06XLRjXTRVVwNUvsEFP68OSKJNEwN2DISOuxu14Jh11ewafX0y9oHm?=
 =?us-ascii?Q?kPg7OYcNNFb20/K117dWqJLCB6wKo8SFJtANcQDx8adCGugzVfkgeaRywTKi?=
 =?us-ascii?Q?o1EuVa2GcKnOij5WvDZvLtqM1X0pDMCfw0Yz1JL6VkurwZdbaky3XIQdjpRA?=
 =?us-ascii?Q?ZPzmwoFNa7AsSNPcUZp9OMlZJWPdLBEjwyM424tc7ORpIsskEGqQSCOHrYM8?=
 =?us-ascii?Q?Ej+kbDeBGIsHlk3O0UAKN+qKDlLgvyLJyPXeyQjOadwIwIQQLBtLO6B8YkEV?=
 =?us-ascii?Q?h8TnKU3uHML/2BbyQRD4wm8iMw5FxwA=3D?=
X-Exchange-RoutingPolicyChecked:
	grJQiIUdiz/6drgauecE+3pImzuydef3EY/FM61W6wluv3wWyoep7ohJes2nsBi9nuLb7U71S41+9f9pJi5sJxOnhhPOuUGTjXgb+RtIM2n7IqfStjFryap+jsX0dudbhGTtU82+DulYh9f1E8f3mpBT6po0b7K9wG5URIrMSKP3uBcSH0MPDvZcv81sCV9LvBTAlXhGC+nFhWVmUdMf7o7yfFLJGRuZXn8QSiA6Qj1SsTIWijbo42cZwzvaPcCxfvaZPQ8paN/5EnmYZ5OzVydlrYJPxLA4xD/Ozoc/PwW2amqlyNQrwDquCUtJeJgCQJBkO0LJVsJnNA03Z6jkiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb90601-601a-4509-5c04-08de833b4c8e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:06:24.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcSXMcGkLKxl/OTldNJwbkneJHS5ihftb0L10ZvOVbhi991FO7JFimUr9OdaUkd3LIklcsgsMfbak7Ob7bxuYXAdtydGjnMeuRzo9LXdjKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7372
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b7c812 cx=c_pps
 a=auv0RDqIM0MEGdyBMEg3Kw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=m9OHFtxmuSz2NW9r4GMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OSBTYWx0ZWRfX3ZsDdrgXjUW7
 bqecpDXrhaLpGrzI8qUYzgO/W8r8AazwSz5CP1ZbambSMNCl+3GiAhJjd6zPIBkYCM5eSQ/wUMF
 hAT5/RQE7g6Oe3lzfDJ+AGJDTYbDsCzDcYk1zhnbumndVjBBxqOvoUmX5w8wrc8WjUkvBq9g2AN
 18KHZcYLaCMhK/eMwhf90JSYCcEarJJxQluIVupE655iPbu90dYIo9mYcelMEWFHlS0zBW4tnce
 hduZ8stpFqchW+S69OqslANKKOB5NHOKJpWBUCZZHX7oeaYNnpFlM7U4825o9p83r3eAH0IgMHk
 6BgOH7qeOoYODKx1DihVlwCkKrjJqKGFyDZpFQ0wVJjvNqSW2iUFamyIZqvZSGuGtComcyC4MTo
 NosWH9SoDlI1L6bgaJ9YKaJfQWd2ARW2Gqj4W656YRu6XqHLTNrSgWb6yVGf63kqPl0Lpn6wMcY
 WaCz8ra0A7lB43u/uOg==
X-Proofpoint-GUID: EfEtlDUVJV6USS7sWIIKs1KM-3w7DyFj
X-Proofpoint-ORIG-GUID: EfEtlDUVJV6USS7sWIIKs1KM-3w7DyFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160069
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55871-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E002C296B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds V4L2_CID_TEST_PATTERN control support.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2167fb73ea41..f64b2084b8e7 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -104,6 +104,12 @@
 #define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
+/* Test Pattern registers */
+#define OV9282_REG_TEST_PATTERN_BAR	CCI_REG8(0x5e00)
+#define OV9282_TEST_PATTERN_BAR_EN	BIT(7)
+#define OV9282_REG_TEST_PATTERN_SOLID	CCI_REG8(0x4320)
+#define OV9282_TEST_PATTERN_SOLID_EN	BIT(1)
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -462,6 +468,18 @@ static const struct ov9282_mode supported_modes[] = {
 	},
 };
 
+enum {
+	OV9282_TEST_PATTERN_DISABLED,
+	OV9282_TEST_PATTERN_COLOR_BAR,
+	OV9282_TEST_PATTERN_SOLID_COLOR,
+};
+
+static const char * const ov9282_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bar",
+	"Solid Color",
+};
+
 /**
  * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
  * @subdev: pointer to ov9282 V4L2 sub-device
@@ -586,6 +604,23 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
+static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
+{
+	int ret;
+
+	ret = cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
+			      OV9282_TEST_PATTERN_BAR_EN,
+			      pattern == OV9282_TEST_PATTERN_COLOR_BAR ?
+			      OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
+	if (ret)
+		return ret;
+
+	return cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
+			       OV9282_TEST_PATTERN_SOLID_EN,
+			       pattern == OV9282_TEST_PATTERN_SOLID_COLOR ?
+			       OV9282_TEST_PATTERN_SOLID_EN : 0, NULL);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -662,6 +697,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_DURATION:
 		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
+		break;
+
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1242,7 +1282,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -1314,6 +1354,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
 				  OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
+				     0, 0, ov9282_test_pattern_menu);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
-- 
2.43.0


