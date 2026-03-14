Return-Path: <linux-media+bounces-55798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A+7H65TtWlGzQAAu9opvQ
	(envelope-from <linux-media+bounces-55798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D528D1DB
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB2333028358
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A21248F47;
	Sat, 14 Mar 2026 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Qutm62rx"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020114.outbound.protection.outlook.com [52.101.227.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA34F881;
	Sat, 14 Mar 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773491115; cv=fail; b=q5a6IvXSek+4FbZjipsquo72Qxs8HsTg9hE2lgIR0j/c2sNzUcOLA3tpwLSMICyXavEfo8DB5p3Fsg0r8cSpRCUfl0GeYlL8mmPqXTj5DcrQeFrzrA0BDBKHf5NzNQhc5k6vLW54dkO9ee2WOZUgMuy4ngFOM3IMbhffLbXTMHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773491115; c=relaxed/simple;
	bh=MDHHmnwm3LOWrI56lK/jYlEvvDxH4Da1m8DnD8Gpgn0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Eltt9F+fTC7nkeZfg4tmqtBp6ZJifvnWKE1VOqTcqhfU4m4LC01HytlyAIvzOtEuX6WCW6SABLA+XUB+1fMCbT0yb5jQqTzKMkmw8Ht02J1Q5vMub/DnstTRs5Ixfw03qpHDAmQnxKoxe1JMLFjTsRlt0d8DNMyrEDe8RtvRd1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Qutm62rx; arc=fail smtp.client-ip=52.101.227.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcm5BhoAUGP/bft0QbecGsxZGyPFmdU/n2vz2+J9mESNjvDpR05VT6lJ64hNmrT8AhdEpF333ldIYEpJjWxoSw7B/v9x7jBhTw8TD5NZnPVgsSAjil6rXhCIYTJ/OmZI1xh52071fuwjgZMGEvqOsGlBRtzsEuwxApGLT/Sn5H8r9xD66qANJYZPTHxqR3gN5UIvBghSiU5R1W3s8hq9q+4dxebYQ8ARwQahPTTM64ADt85KSRO2H1EY3sNED1J7gojUfNjtCArIfwNmxX53VB5ai1Z3iEVdum+AXDmvr5pDRFZpHQZT7ELpdv4OWJA+HMFUHBRGIN5wm3/wJgitsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvU+v7r6bpFhesdf1osIbe1qiIWMcDfNDvwwDCFw85k=;
 b=QZuJ8j6gWRqHeponjs8UFZYar+nwdTObLNs+UApTDT5nuIXUQPO8UAFjVX3cqntl1G+u5FKXA9jy0zvfHIi2Qc8s9JSnnhb59PvFisJQb9Y4hWsuYWGpwpZO4J/p1CTWvFGc6x9ptOdVm9cwiapnYN50jyjdRPm6J3+u2CD3hH14zOTEQ5jYlYaU31TCnFdzRmnj1Z+Pe0W1wy3Nw/WIS3dMRxySsfTebfcXp7ou1vbo0Omw8aQbB4d9e1ISkVaulIS9J6dBnrINoIkUPWcgMxfT19cfRq4H2D4p8jTf1kOeZh5TSx0Emmtz1cI7tYvd9m+H001VleVwqmi6fdcIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvU+v7r6bpFhesdf1osIbe1qiIWMcDfNDvwwDCFw85k=;
 b=Qutm62rx8N6R1tg7381DqgyrqFrdQsKJyW0tivJzPhsl4l6+q3pg/t9IVEUGtQ6diAzyemexshU27qrnQCEwW0hTfGdyUYlIt/7APHm0jCwA9/nnhsX24SXoM7DhzASy8N4QIZgjVzt7slP+Tzy2e3IPMQVwFxhEbZnFo6WKwJAuMr55LpnkFfSiU9JaM84ovb0W6u2T11mPivUntbpTzIxQwtc6xIThF58rykB7vLSCVoM+T4IsRMi40KlqGN58y8MHfzMG2ttDW9rHgomW6Lu/16wfpGysJKDVX6y9kN3QL9Hthg/+MPbHGGma/0t7CdkWWWNOQxPM+RkwGrfo+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by MA0P287MB0466.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:25:10 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 12:25:09 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: imx412: Modernize driver with CCI and streams API
Date: Sat, 14 Mar 2026 17:54:36 +0530
Message-Id: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1d3::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB2188:EE_|MA0P287MB0466:EE_
X-MS-Office365-Filtering-Correlation-Id: 901b4a18-b544-423e-8193-08de81c4bbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	j9ghTg1lZrQJx/P576PUNcMGQ7QUJ3TjHlN/kEYmhzOdpz9WTErkyI4sJ6VYNmn578HdLOj9RjxQxGPNRtxmeg8ReBvMXouftAC5+K3JcOzQhUrTa5V8kiivKrMv0ZTik8q+IOIoqQWuAzkdGxTvFPpD0lLqV6c5mfsCo+sbAOROodEjIRhvtTy3+kb75vQDrg0mLy6iy4lWro3ud+sLkEv5YHo3fVuRHSs/qLeh4u7Z7/E9pNiCLW0mevM8nJjCTaHx/g7Lt8Pkzi3iKhg91tdmMMAusR+lwYZrt/xfZwxYdIMuB9DF0KQbbOlNFrpXbRVnWjDenVL5xqH2oc0zyqkhaLVJm0dbnZHc96qlQcoRf4OUgxwERB37T+onh/KvuRqOqc3KVi/RHx5PSQchUPzVjiwhMqh0A/bNhHEJwU6QmyKdr5efzXcuf3DZzQu6FeA/XSoSQfnm6KHNojzLrqn8fvbdN+v7S5ox4CmNmP/d1KSsEWfouzvKelOh55lUdTnI8qFjbuZqJJcnE02XIsjOcdDR8tF6ABtelXD8VhgqrWznKh7qNtSB6N/7NFCOhXHpgI46wiBtkcEFKUbuMMzhyzVyVEcDM0noNAcCdLkRis8WxamT070gr5TxgBNHe1+LlEEZOpzVTuO6HLLEto0UskRHwibDPbxZcjX/2IqeC+zIMYXbCUf1SEhAyK3CrlUjUVLj5x3oKyHKRtAWNp4GSb0P7w84QmMYPqkf2GVi9AxLJK2YNTojXQqa5bPHn+hRfMFEeQS2QkkyaiIAeZ5QeVK8xkM6Tn1BXmtN9zs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8vYN0AC9FoI1YYPIcypKTIrYBXI0ZpqQZFzwiSwlUa4STP3bxJ8Khe7lSCNV?=
 =?us-ascii?Q?gvn1RRr7NumsIWnSWZgRcofJO5ev8o886SJ2fYIQX2lSDT6opligP9jbSykb?=
 =?us-ascii?Q?u8MhT3/KJgbOV8aPi5LpttE1aOenuMI9++1r3bRhYt8is5ZgMroDySPH04/c?=
 =?us-ascii?Q?c4ELj26UgYOkeTRQcbxCTOyZqT9cX8hxG12ENWDm77zZikNAP12nB0jjVz93?=
 =?us-ascii?Q?olHBEI1SeW9eQ2WHJBA0612tH8yQFIngVGf85+aBoUBB50A3irfeDDb2rQWd?=
 =?us-ascii?Q?Pv0RABx1YO/TxZVbW1bwhOCg2ePpqa4tG2HhdZAQl8CzsOOVzCsc9f27ynVr?=
 =?us-ascii?Q?9H8yljB8nPnCkc+iTte4oKjNfvSjkYWlEdHaSMmgGc1b11nwyVTqDGHz6xZG?=
 =?us-ascii?Q?bbMMD1vxrJ3qCsIJCI4m6eAnDF5jms+PtZgN7Apejhv+ayulB8ucD7MxO9IO?=
 =?us-ascii?Q?KPs40Ns7Adj6Pup6QJuhBOCs4yNOCGUV8ICIkC+I5ZZ9VhZJvoeGdTOvh+65?=
 =?us-ascii?Q?YIzHee1jte0QizLaqYOLSm69ed5dPkTrENTNfLo8f/l0zYbyskifteqZpGvM?=
 =?us-ascii?Q?5/z2JncTzquo2RiYGL7Jo00dfgRSTVXq9rdt1idTbNUCKNJnT+B9/CElNmj1?=
 =?us-ascii?Q?tgqXo+zTClRrH+MofD76sFa8lr8FWTdABS6QaOlUugN5HPNV4lLV6EZpBWYK?=
 =?us-ascii?Q?71b74202Up3hmC4jWGXacgBQXfcN04Zqb5BIrYXFp2VCfehStCt5EU+Te3cD?=
 =?us-ascii?Q?NBJOifiV4LAeGdK5MITE7gCZOQL2Z4zlwdcOw3N2fpCSNLAgA0ehoY2HKCDD?=
 =?us-ascii?Q?pdJ+ggvI65m35wWgCqGpic4jFGzAk+SB0HSzWvG3/UvLL26wOd39qUZC0nmY?=
 =?us-ascii?Q?OBbJOBagqEVSZlIuEjM3aVZNSQkqC91lmp6e0rOydxLrdnyh8hYoKjXSPu9D?=
 =?us-ascii?Q?cVd9aQ15attNxhH1Z3rRcd4pCUnhxUgyW06NMbMr03k26IWWNJuLTTfiJfLO?=
 =?us-ascii?Q?JwS68YCKyc8M2F3fAohJzQqN6+6LYC12nzen6lFSXPbaai654/h6LQX++qsC?=
 =?us-ascii?Q?sMa8hfO7UE+Fr+i8+C/bYXHiofIIkVWkaVppeyUeE004uaHT+RXLoZkVNNng?=
 =?us-ascii?Q?CHqhbY6QW7ASiJptgVjCWgGeWtcGLD+E93NEKzFI8/OkzQTyvHAp27fKqaqC?=
 =?us-ascii?Q?mIjJ2eg2Y2cgiO9RaM5+PQ8DI3YVAf60ovWlY/IisCNE06g/Rnfw3DS9hptQ?=
 =?us-ascii?Q?Tsqsj5Ve+7fHZOY4+SV63NYTp3O8RQeYMIuVrDbhWRdeMef1qboGteck9FI/?=
 =?us-ascii?Q?etd3ElBcqxwogBGLoQHiW6s/nZ6RDLeMm/n9yAIcpyTa/0Qmd7eMdcgOdguh?=
 =?us-ascii?Q?5qEZ4JTr4a+vHu8ZICAazajDtyF+4CjjdSqXujz5mrgpnH9RUIFXaGV3Xs6y?=
 =?us-ascii?Q?iwY8M5bgE/5rI9WJuCCvXITI5GFwHXT955NPV5I/vyX9xfsSyODQcpQW4y6x?=
 =?us-ascii?Q?K7wjSEZoyNqMISxL19oiZu2uKfs4mHaQQqJf1RuYQndbssvnvTnZnW0LRXYc?=
 =?us-ascii?Q?l3d1uosX7WAzUQH2ZV/ZkvSC1XRXak+by/+/1RfMXDVUeXI+vTL56msU1aXQ?=
 =?us-ascii?Q?fSmRJCbzEzBry/b2PdBhMEKwz40K8wLtAS6GCPK+bN8YzAYhwd6Zfv4Fb7uA?=
 =?us-ascii?Q?DGz15SKQRpE/PyH/rxoq7ac8m+Du8DeHO5cCu5LIxiripbbz34HXGqksEESE?=
 =?us-ascii?Q?okLmV82ZZYw9Hfe64Mm9cr8oQaDNfY4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 901b4a18-b544-423e-8193-08de81c4bbd3
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:25:09.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz4BhJDeKd/aZTb98JhTKUrRhUFE/8vM91Y+bNvKPBdHumQ3VZNYitEd9iYeFXp6tSASP3KPzfggv39rzeCJw2An4W3C3AKZer+woavSbjoeTbC606O4dE+fl/RXpNp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0466
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55798-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:mid]
X-Rspamd-Queue-Id: EF8D528D1DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series modernizes the imx412 driver by:

1. Converting to the common CCI (Camera Control Interface) register
   access helpers, which simplifies the code by removing custom I2C
   register access functions.

2. Switching to use the V4L2 sub-device state lock instead of a
   private mutex, improving integration with the V4L2 framework.

3. Migrating from the legacy s_stream callback to the modern
   enable_streams/disable_streams callbacks, providing better support
   for multiplexed streams.

These changes reduce code complexity, improve maintainability, and
align the driver with current V4L2 best practices.

Elgin Perumbilly (3):
  media: i2c: imx412: Convert to CCI register access helpers
  media: i2c: imx412: Switch to using the sub-device state lock
  media: i2c: imx412: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx412.c | 756 ++++++++++++++++---------------------
 2 files changed, 324 insertions(+), 433 deletions(-)

--
2.34.1


