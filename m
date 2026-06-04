Return-Path: <linux-media+bounces-63718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id USanK+bdIGqP8gAAu9opvQ
	(envelope-from <linux-media+bounces-63718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:07:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC563C5CA
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:07:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=EH3fcFjM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63718-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63718-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14CDD30A8FB6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695652BDC2F;
	Thu,  4 Jun 2026 02:02:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B905B21A;
	Thu,  4 Jun 2026 02:02:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538531; cv=fail; b=k9Kg3jocjiYf/wao/qMdBA/C48RtTzxDm2EWlJVVrJglPQBky2n4YdNGbrzR3qtntvLN+tSmmvEp4d3sdKjogZOW+4oA0ytAWOGCmlmtIWFPogZhHpuTWKFuSlVVGEFmmvTdQ68MNK7g4+3ePvvA274Y1iVxXlJSFTCQ5zGynTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538531; c=relaxed/simple;
	bh=rdC+QJNYM8WCFc7Ig3TubGReSJbxbOpuMNEYMo20OxE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=K7HV3SNFCNNTmj0pCI2/pxAbQHK/WW6oEnPY5X45mAM6adRC7v0RWMrvD3F9hSDBBHaCRbW3XyQgnfjpx5K0/UHvpXQC8C0GMkh/8QTNriqm8oNsYiZcnQBTwwhGsTjUt1oFpijysrfIm4RyGVfv2+HtgpE3OOvse6Vsl0VZgr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=EH3fcFjM; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo6bebj5rOBTds9Qf2N/gRH3Npyk3JGQqI0Kmsg8Gba2INiLTkH79DNyoAqDnyeeT+CqtgJRUW7Ja7KouSwU1N9ECxX+YO87uez38OQ4WEaDqhqmshzqyC9wyIqIYLq4vB7D6OJzXJmrJoVgSrC6z1vQASN04eFJlyQ5u/F8zmVxcZ5cVPHVvWBYzbyimss5w8VhfSKbMopzZKXsBVRAZQn2SipjrqO/Vg0S+4kezeRYIEBIbQaOElZhyEv6cxEyEhwZiEl/l/oD3kXTWBOPnQd06q9+C2LmldE1g/i4AaSObcvrwPooj7J6UsoYHGMpXVhsSPd/ftA8yKth2Nnlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+/vH+K/b+S+f5QNgGLPp7MNAhsjW8jLEGTitrfzsXM=;
 b=Iqzxx0GPr6HhzGgsLyKUCd3QSlQ9GOVdMH1rPsdRQutr8uGkpI43brGZAONrUUbADYl1dIagyd4VDvFB8xX6idjYoP0VWpMpFOE9yet2djLnfYfrJafREBzEA4+tqcAUOzfPmS6l/jtEjR/Ps/wDqBApPJK9xBDfDi8tjq3x9JpU1ZIxKvCy9xcNJ1uvCoLD+ch+dlDqxzecRNWR7uceWNVN5aheABCZGvU4TK86IS6DfgDCaou0nVk5XBZa1S1gf20nzr13/uWfi+Qj5HoV88imMjF3MzQ2ZwL3Ef28lzk63dh+gKORKrfhQyeCrikz0y9gZGQB81C5Lqa07GxR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+/vH+K/b+S+f5QNgGLPp7MNAhsjW8jLEGTitrfzsXM=;
 b=EH3fcFjMDRwE7c7Me3tMi8mdm85H8HUO97ijpF9UauIt9QERABu8cAb2gfJeGzSZ5fGs7u8xNCZqEUfFh75Do6JwHC2IY6MZjFYnyonkbqmjdZ2V2Qo95IN0lwIg97pGTqoedIYPu8LNm+6VzB11juFXpownC55SsgXqJ0c4r6I=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3229.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 02:02:06 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:02:06 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 0/4] bug fixes
Date: Thu,  4 Jun 2026 11:01:51 +0900
Message-Id: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3229:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3803fe-d49f-43b3-177a-08dec1dd472a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	y52CDQCkZZhr5iiJYr/wibpArpBbBPV3usLkciufR9inAhwv8Ea4xSHalkeowPWlzz2mWrg8WowwdQ3Q4o52qgREDcY66ZJjE7p3pM5L2DZNIMABo3UESIgcZXf6mcSz7O4flhEzbzNM1ga6MZlbwow+jVmSnm9ravOJGGhn5WEU/Ltgzv4Bgml4KEc07GwLk63agwGj1Rgp04VtC3OEB8ZZAh2dMzh7D2CewNeaKuDkLrW9NmHrTBA/2hUbyDJlaYVajyEKQiPAIt53jBhoh0T2gqNxQVY0uCr+cPF7p0UkIMP/zymol1d7+yFjI++8nZJ3mWOm9G4kOSmamHlA45nX/87og1NnqUey+Od5G/L+3q0kaVvW3jUvYUnbHEtMCIuMXC82iq9BLuwCbNX2m7mIUxLKbPCYWMQD6iQPE+CI00svAt0e1op4j2j1+8XplPbF6netDd2MZnNzUD4zXFErglce2bX7wGJK8EkHgxX2x9B9HI4W9qEiH0ruh2lcwQZA691Vhy1hSn6DnGi+iaH75f9grvuBJDrNQGKoCdLtLjR8TNMwj4JZA1Z18SLd/JJznTEmefz2A9IFltKARAcVGeuAFrnVXu2FevZsgqaqeD0ltotian9dLPh0v7fuK+ehtnvtCg3OETTzBZ7lJB3YUqYwMyIig/KgXoZnej5+uQIWFNmh7KV/9pon7jAzalx6zSLoBCMyfOQT4PNJHLKe5E/wquJ0lDVz+AvFRc6Xatc5Cb7TFHcCA38nr2Ym
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L74yJeRQZmvMw8T08Yr9ggYhU/+J0JII8EFQmCBB4oKoXyJqDNopVLCWZFd/?=
 =?us-ascii?Q?JUWiNQc++YfUtu8Pmt6HgPtyPsVrQAxQXrQUwlPsJMmSs/+99rAbsaNuwl6o?=
 =?us-ascii?Q?Ro3QqQUe4cUMrHnXCREcVK0gvioFIwn+GvRsJn8vR6xvAtl2gANLWZepLxef?=
 =?us-ascii?Q?VtnlBz/w484dnbBCyWtmdhSMxYliGLW/S0Dh1fLItSVQMfpp98YwhJLXtOTP?=
 =?us-ascii?Q?oVW65dvtMDcVfAOUmFy+NlnmoEriBa3sSpiPIdOfEJHMRt4s8wGWQRApH2CU?=
 =?us-ascii?Q?cDuo9dX6uo16Eky9BD91YSBaEsyTdzki6MaNZhBOQi53wRQJjzuwF4cvR1UT?=
 =?us-ascii?Q?zyhNKMRJDK34C0DAt63RoOddUkECR4QB8eTRwOvi88bGUeKmINCyD/TNvDcG?=
 =?us-ascii?Q?bsXsKrpSZP29uB+UN/sBfI6H6y4QzsLhEtdMzHVY/UP5M9sBSZzdrpzozgSf?=
 =?us-ascii?Q?Q7CnAKfLTv729+4Az2duXIPv8KMeIFMrAYPaqYmvx+3yNz6Ba+p81GYGjcSu?=
 =?us-ascii?Q?Bj1nzytp1XJN1BFHEpD/pTiBNnF5FEid83EabXwTCS0l4AAF3Fyt++YsT44F?=
 =?us-ascii?Q?VI62Xo17HT0qMy7PUJ3DraqzLqjJpnFWth05vD4RVKBwY+F6r+PSvmKpKEV5?=
 =?us-ascii?Q?l23h8ceVIR3fFjcdh2QhXkjMUITcXZrt1rJUjrjZ02ViBJZrLLmLexx4ELbT?=
 =?us-ascii?Q?mkVKZn23nt4lM1abcvOQjTEu4D66WshmEs9DaxnH08+QdgHz/CrFaNFXbbWc?=
 =?us-ascii?Q?30QoAwM4Wgej/3VKHnjGHtPmJVbywCS8QRbApKH5uBAiB+2n9fAXJ2kzAMDt?=
 =?us-ascii?Q?LhRJ/5OrLvTDYDVBN2fzQ4grmvwRoa4mwUNmkUjH1sttzcICPxu3cQlU6GM6?=
 =?us-ascii?Q?Y8YqcMHHNwKNRds+IwCUXrO6nFB8HU6w5tn7Xz9EWB1xQeyhT58Japbhx6C/?=
 =?us-ascii?Q?Ii4ZXUm7NqweXbxiucMrts6ccr+2HZcFroe8VQWNusvaI50wDW7CQUZFFeNr?=
 =?us-ascii?Q?00XgMfAWT1503PaSebrFYGizJNPsgA34+QjF49p2Uhdfth0FYr5sex8n7+at?=
 =?us-ascii?Q?giYcyEmVlWklE28AvlnD7/cbNmKs13RhvYfUWo+XAvV+c6QLVto6ciCUYqw3?=
 =?us-ascii?Q?7m2MEkyt0Bz/B1A8wwrWdISHRs/1VMV1purE/f2FHubm2N2xZ5Dd74HzHyuE?=
 =?us-ascii?Q?ApzpH+9CWO9TBKX2w1VM5cZRZb8JbCi+Rxiw0lqguvmympc7YXPrVi3L/wuO?=
 =?us-ascii?Q?6vQRAisP0QghNzg5i8nzZSZLslM29JzsBwSCKF8VSgUio+Hl+0iY3tTAPtJc?=
 =?us-ascii?Q?eMFkIKqBW1d2ufNdfLBm7vAIbE0kZM+T3xpwLPfFoo9z3EYDy+yNQt8BjACY?=
 =?us-ascii?Q?hJy1eQedZbAPsBjS4VOaHdyrwfz6gyLW8ch6rM5r9OqfelydtARjUJ4+c3kl?=
 =?us-ascii?Q?d2scE78WTT3szmJM+MnqyX8e2DzZPWfhPOKyoFVToG2rx5Ju5LNmnzBmxJql?=
 =?us-ascii?Q?d9Do1NpOLMaHOn0b5h6QR7r+KWrNfmkV9wGWdgMofSTza7eHShUgnDRksvUh?=
 =?us-ascii?Q?csI5iXfFoattEEofEkrAkX7NfKnplNOuf1O6a5GDKss8KrrwrAOr3J5w8A+6?=
 =?us-ascii?Q?0PrlFq6Bzyc6nk/BGMyg3GV2husFxkwRvpHaRVOu6gqES4KhnGNJgk2roXRB?=
 =?us-ascii?Q?vXIWKyWskFpaygHy792k+3HVBxN/N+vYGBFb1oSQ4tpP4899yfM1Z0OspV0I?=
 =?us-ascii?Q?hCfVWJCbzheSL7Begj4aluZ0XVJc+gE=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3803fe-d49f-43b3-177a-08dec1dd472a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:02:06.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Oc6j2+ptHzqHPpT0mn4wmMOQnTmQku78rsDcv/hn89F+FOtu7C/jGYaHfZbQLsFx392T71QTbWHnlcPe6Ld3XqTilogkbG5Rug56MEfmsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63718-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chipsnmedia.com:mid,chipsnmedia.com:dkim,chipsnmedia.com:from_mime,chipsnmedia.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26AC563C5CA

From: Jackson Lee <jackson.lee@chipsnmedia.com>

A few independent fixes for the Wave5 VPU driver, covering decode
setup, m2m scheduling and stop_streaming robustness.

Jackson Lee (4):
  media: chips-media: wave5: Guard bit depth check with
    initial_info_obtained
  media: chips-media: wave5: Set inst->std during default format
    initialization
  media: chips-media: wave5: avoid skipping device_run while VPU has
    work
  media: chips-media: wave5: Add interrupt timeout while stop_streaming

 .../chips-media/wave5/wave5-vpu-dec.c         | 20 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  6 ++++--
 .../chips-media/wave5/wave5-vpuconfig.h       |  2 +-
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.43.0


