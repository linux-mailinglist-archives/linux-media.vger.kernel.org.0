Return-Path: <linux-media+bounces-57004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKK3C2TSw2lLuQQAu9opvQ
	(envelope-from <linux-media+bounces-57004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:17:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51136324B66
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B08C311AE32
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E533D1CD0;
	Wed, 25 Mar 2026 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="BFDFWDjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021085.outbound.protection.outlook.com [40.107.51.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E513CFF4A;
	Wed, 25 Mar 2026 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439240; cv=fail; b=iXDnnqbRxX627QKYQ+XW2XRErfnDUQlUf5kYLfKUGlf/UVVtSyBKSxmuINgMb832Tv1Lz6m7jCY9BGWjLBLiEjcNIYZ3TAXZ3vEgQs//8tfY+bCQtTT8kwWYPacO5R8Cj94JBeQuuSJiaEhsROTi2GOcINtkahVoKSsLzUgYilA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439240; c=relaxed/simple;
	bh=LFvc99wkiB3yqGzhJ4lVf7Q7DTWBZwRhSj+P3sOkaS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FnpxoH631g7ERNLAF2IKxVXPzQ20sl0uEOdVJZteKgFtjUFmz/jWk8Tx3hfOAQaswZZPBNE4Sv7uFejwzRu69dPFTYEUE22jtDx6B85rIlwiVL5HWLg0DgjDGn6ipQ7QjUahlfyn77OIG4YBoUADQ7H7YqPKl35SWAl3TM5OPBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=BFDFWDjQ; arc=fail smtp.client-ip=40.107.51.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=va7g/p9zLvPKs/ju+CPiE0h1iFnHSRtF0H8agsNKJBz7mLI6dvrDiFF5EHc20gHBP6aelUb7iksJfH4R8EJcKmiGHtI1+qZlZc9uf2BJIfy85rMWdZEe7ZlXsrLJ0BquED2gU7BKMMMRL9PKZVQ46fc77ULVI0wkndaOJmeOgkAPV6nL20lbmSqY+C0ddzn2JoJGzKPn6cN48uLCmwBaeqB2wvgQgo7QuSAXRZLITAtn0BEVWPxgnDP1rVml683UsPFKXvgku3KqBLsTFTnBPtgJWjIin0K/aKzpumq4dgr/0wXXS6wliSCg3LMDSgD0T6CZQAOXwIDtend1fnjgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ViS/ZoM2dPcxlBSeNXmRtcAJ3IyiuUZYKFarxVYUrc=;
 b=YZBB3lN3kmWZl3AWsf0QmG4lM0GUIwy1jgMh1DMYYEq58IUsEY82LFZgTSik/4ZHteikc5Qwnfe35bUegE5T4N4Q0bMDM2FtI6x08EaN7TjdmzmaE8B17sR67M2WmajOdnn9W/TftUMxPfGW5CIXB3WiggXs/y6Hw6Tb8Wx5vDnTtdlt0TMCWLSgDA9owjZhrV0OmkkL38EtW2nMGkT5MsJJ3JgcRyb6CFM3qz+GvUbytPt3LotbIhALeqwO0fCCcSI3cO633AvvRq0ZE8xRmWszE11PiEM8+1VO9RKhmPlTtKjjvsMHgt9GjJAikABRYaI73QmB+iADvlWcmIAlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ViS/ZoM2dPcxlBSeNXmRtcAJ3IyiuUZYKFarxVYUrc=;
 b=BFDFWDjQ/mNGxxH/0J/uyufJaORl7Dx6rhMnmf4oz8TXtR2aSHqG0TfsCJx/hQqjhUmEr2ciT+ff8PmxDmhYa9sWznk9r+QWQakLnUhFNc5UJga8WFWosqpQeXZFakd3v9Gpm55dyAJpZtbG0yrxGYxJ+3rP4HnM7MAvmyoSHXX7BCnE/H5guKcywPUc+7+mHXji9Wnm9BX2uCFoPG7fv1WeLEO81fuRd8l7DKKqtGP3NfIiBFNMkzw50i/CR5AZPDQoqFtkVgLwI2U8FD/Bl89Dy7lnn0prjaMdgED2sA+Hcmnv2wGtpEL8KJst6kmIuDYwEwvwGaNvo8FYfnVshA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:47:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/15] media: i2c: os05b10: add register definitions and use them in init table
Date: Wed, 25 Mar 2026 17:13:49 +0530
Message-Id: <20260325114404.95188-4-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ab3e8c-6abe-4136-e679-08de8a6442a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LlszBnMgap3aitgPUuPQ8bNhkL1uZwP0d9zLYFOLOi3UHsvhTG5AEBJP3Ds6SB4CxQFFFSY78FkX35E4FvwNBGg67fawjMmBIZuw1wE3BZT5QIS4CVpZITsJLJiFz+VIduwdOKd8Q8vj35FcVVzetHbGWJrF9R59rNnITyk2FJlgE5rAD6wW8joe5yxtier8OShOxlrgr0q8EvQMIUalzBSQDMKBBgWI/EZDHV7rK3n3f28wQxuQGVURQOa6at3wzkZl1PXTyBL8lpm7ZyfbNWDQpqOn56j2n5OH2dPerJDmxFdJwE9SH29I1Z6VH1mBAHM8eM1qcVyC8Brvcds8kDiTHivOivaHpWnNn3/ISmMyfUlkMaxp0ywRX97aRDKzb0+dVeacJAUIK8X0a0htBRQm2lFAVQUxOxsznjqypmf/ZMLlr03Z3ZjjEs0AbCleG6VM0ekPT2ztYl4+e48iUUiJTveD56NCa9L5HEsLzb0voKbJYKfMj9Jo486MgToa5OpPPKPGdmrVq7NMfUmRl/oeeT1ZbFJiWSGy5cwVYOGMJkO96ccfFlUJwzKAtmyJ2ifCSmetAIihG+eVriaXJWNly9pExIDbXwc58JwKVEPOu4/3Mqd1ZhG+Iokkp8BQ70zEGxOdfZ24erxwic2+BUi3ZjL4taiSp+nkVfkiaPNpFD2za0ZuGhmVyIXyr29Y5VZ4BNVvWeFhKcqNUOXNuRSClbEpBCsfOZztXjeO6WCZZ8sttEHaYHxzYkNGy14SnUpUb7CaCIRDsfg8U+gbvdCOvCSVA0Eru7omD2jFvzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fgv0IrC4vRf06u8oFA+taq1Qc0Onv4ToJO/hKL+T0rRYtopiFS23SjFZNvPK?=
 =?us-ascii?Q?d5tGEmKBldUoBArfN/QV5n2Y6A66EiQmGP9YZ1DySHfmzwX3RhK2nC3Uup1S?=
 =?us-ascii?Q?98HV6skNO1DRolFzz9MDSW6A+wcJnh68JA+/b1XZuBxr9d8FKlu+mJz39fU+?=
 =?us-ascii?Q?4PbYVFBBhovGDgk1APHRPzjXLw5mprHqeeRO6IbljAo3NGshe+QAiOY8DB13?=
 =?us-ascii?Q?d+7LihZXVmdI9ODqabkfN+TdigxbxPkfsOfSHIkShqXtPx2Iyb+Rh3yd9bzs?=
 =?us-ascii?Q?yQvgo5hk3ExsECeQty0IOGrZEe2ZqCizSKfgu9n/2Ea+f1M6pl8CMRLWeGXu?=
 =?us-ascii?Q?JlrXPghqPOEkogz0TYeqXXT2kTH4wS/0/EgXBtC3EmXvxUSXVfGTzvDzsHND?=
 =?us-ascii?Q?QBeMmCA945MYmMkO17a8LSK+4UYXizgbaYv8ovNPxD/OpDA1hjNetfAO48lW?=
 =?us-ascii?Q?sRcSx9TJAsapp10ZqI2IhHYRQ+VZKh+kUf/cybWFsUofMZOxlYysByyjSckm?=
 =?us-ascii?Q?bPB6gis7ldCnh4XuLjxjFz4qY9RLGhrO/eIlCzMdLrEbwqKR8lPtWGnVAizw?=
 =?us-ascii?Q?/i2YhOTQ6PWEFMNPzL6zEOq++ww9c/pSQCQroRQwT5t6DiFaLwRDHUZWlpZg?=
 =?us-ascii?Q?WHsqCzp1B5gRrYK3FhSFrDBVfi4XRJOlQ6VLQrVTCsGRczkqZU6L4/RXDE0G?=
 =?us-ascii?Q?dFuLQzDtHIuafxwueUEGVQ8xuiXBRS41nU/+Jom7drpNg2xeBG4VKYPXLOeR?=
 =?us-ascii?Q?ba9hgCS06Zd5CrUwL5TZAfFzPGM/KxTJI3iom2xrvwemydnWb8AbCQN+kYEs?=
 =?us-ascii?Q?4oXXZDosSClBcJWvQ+HnZ/0g7POh5YMY7lNgOJuOgSje2hxe9gDVou4PMCCP?=
 =?us-ascii?Q?3y+khc11CTfpxjg1le9SSIjLBXPwHoWWme06Tr9q21UlHOuFtreYuL5mtpbV?=
 =?us-ascii?Q?3of/i3EZE09+YEchWIXfpHdiNlMRgsj9dfikEN6NCo1wunRyzdeFrFbTxnzJ?=
 =?us-ascii?Q?DMyeZ7A3mJ9wo8YtYKT/uedLgQz5td70H2YBGuk4Vrl5DU8DkxJ1+VlyxmLp?=
 =?us-ascii?Q?uXQEAzJedb28LIDexjtP2G0zi+o1QRrYzYoMRyEwnlhxk9CbW9QY0hrzAfxp?=
 =?us-ascii?Q?CQuX4eyE+OUA40A9XC6AAX5Mmk1f5AsFDI7xkJTTDpZ6+73/3YXf2SzbBFY8?=
 =?us-ascii?Q?PtNGjqSkPFJkh7cTbj+8DZJAHm6PmImIaB8/kKibyv59f17ZKZJbqi9WLKGi?=
 =?us-ascii?Q?4SlOiIP0YRUHPyJE1TPOdQJCl8se6oW5Dx2+was8hzDxjOD/SA2NDCwkvWKZ?=
 =?us-ascii?Q?htRjDB/wrYEnVnVqwmaBtrniK0TgDQFwYqAwNqLc4qd0fBQMD2aihzbySgcU?=
 =?us-ascii?Q?DIGZWIpb3+2bVNS1Jx+NIdv6X3btGUMk5fl/GjdAZLiXt0OS239+06itu6yA?=
 =?us-ascii?Q?HX/ziMd4n6BLdSs9ISiD8iGTSoFEGlBZy6VuMwRn0fTDi0hCf4wOts53apQY?=
 =?us-ascii?Q?b/chC6DbmLlsUToTLOo7aB4G+lumD1IHpxJ35KBDDQIaROGThambFwONzZDj?=
 =?us-ascii?Q?mwVV6vLKF3rmETcK9h/kNq4U+PSsLkK64J7NHD1kKjHJo/79NZ8p2VSyC6OT?=
 =?us-ascii?Q?qTPTfotNnabMO3xdaBVLojHdmKIrc7j1vqf4VnR3PdBXf6w/hw4gwrpAi/FK?=
 =?us-ascii?Q?wa3dcWlp6PB3OexMRbOC+z3HDtftiMISAF84DvMzBcBIZiSvcfhBRKLV1pki?=
 =?us-ascii?Q?BW4c90x/sWAh6bOUyD3zivuQqrmNh/4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ab3e8c-6abe-4136-e679-08de8a6442a0
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:15.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNXS/ZFPyaB2Ok0RJCdg4AaGmD0vVJeCSLKVlrK/ctdqfaPvQZ9QoKTKxdSTn40aeuqIed+0mIL5csiqgjDZTUsaQcKk+yNo+EM6bymDgi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57004-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51136324B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 111 +++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 62fb856cbdea..751494fdba6d 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,20 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL_01		CCI_REG8(0x0301)
+#define OS05B10_REG_PLL_CTRL_03		CCI_REG8(0x0303)
+#define OS05B10_REG_PLL_CTRL_05		CCI_REG8(0x0305)
+#define OS05B10_REG_PLL_CTRL_06		CCI_REG8(0x0306)
+#define OS05B10_REG_PLL_CTRL_25		CCI_REG8(0x0325)
+
+#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
+#define OS05B10_4_LANE_MODE		0x72
+#define OS05B10_2_LANE_MODE		0x32
+
+#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
+#define OS05B10_10BIT_MODE		0x01
+#define OS05B10_12BIT_MODE		0x61
+
 #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OS05B10_EXPOSURE_MIN		2
 #define OS05B10_EXPOSURE_STEP		1
@@ -49,11 +63,42 @@
 #define OS05B10_ANALOG_GAIN_STEP	1
 #define OS05B10_ANALOG_GAIN_DEFAULT	0x80
 
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	16
+#define OS05B10_DIGITAL_GAIN_DEFAULT	0x400
+
+#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
+#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
+#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
+
+#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
 #define OS05B10_REG_HTS			CCI_REG16(0x380c)
 
 #define OS05B10_REG_VTS			CCI_REG16(0x380e)
 #define OS05B10_VTS_MAX			0x7fff
 
+#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
+#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
+#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
+#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
+#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
+#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
+
+#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS05B10_MIRROR			BIT(3)
+#define OS05B10_FLIP			GENMASK(5, 4)
+
+#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
+#define OS05B10_HDR_ENABLE		0x04
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -77,30 +122,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
+	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ CCI_REG8(0x350a), 0x04 },
-	{ CCI_REG8(0x350b), 0x00 },
-	{ CCI_REG8(0x350c), 0x00 },
-	{ CCI_REG8(0x350d), 0x80 },
-	{ CCI_REG8(0x350e), 0x04 },
-	{ CCI_REG8(0x350f), 0x00 },
-	{ CCI_REG8(0x3510), 0x00 },
-	{ CCI_REG8(0x3511), 0x00 },
-	{ CCI_REG8(0x3512), 0x20 },
+	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +314,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ CCI_REG8(0x3800), 0x01 },
-	{ CCI_REG8(0x3801), 0x30 },
-	{ CCI_REG8(0x3802), 0x00 },
-	{ CCI_REG8(0x3803), 0x00 },
-	{ CCI_REG8(0x3804), 0x0b },
-	{ CCI_REG8(0x3805), 0x5f },
-	{ CCI_REG8(0x3806), 0x07 },
-	{ CCI_REG8(0x3807), 0xa7 },
-	{ CCI_REG8(0x3808), 0x0a },
-	{ CCI_REG8(0x3809), 0x20 },
-	{ CCI_REG8(0x380a), 0x07 },
-	{ CCI_REG8(0x380b), 0x98 },
-	{ CCI_REG8(0x380c), 0x06 },
-	{ CCI_REG8(0x380d), 0xd0 },
-	{ CCI_REG8(0x3810), 0x00 },
-	{ CCI_REG8(0x3811), 0x08 },
-	{ CCI_REG8(0x3812), 0x00 },
-	{ CCI_REG8(0x3813), 0x08 },
-	{ CCI_REG8(0x3814), 0x01 },
-	{ CCI_REG8(0x3815), 0x01 },
-	{ CCI_REG8(0x3816), 0x01 },
-	{ CCI_REG8(0x3817), 0x01 },
+	{ OS05B10_REG_X_ADDR_START, 0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ OS05B10_REG_HTS, 0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ CCI_REG8(0x3820), 0x88 },
-	{ CCI_REG8(0x3821), 0x00 },
+	{ OS05B10_REG_FORMAT1, 0x88 },
+	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
-- 
2.34.1


