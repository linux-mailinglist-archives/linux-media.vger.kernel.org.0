Return-Path: <linux-media+bounces-51398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LvyGMMsc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:09:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F097E723B1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DF6F30517D1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E183587A4;
	Fri, 23 Jan 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KJgvMn04"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7A33EAE0;
	Fri, 23 Jan 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155603; cv=fail; b=GA0LANq3WIFu7BW/pzD4rwlQ24Cgftoo/QjSyRnZn8dy6MyvfPzUeIP3XKoaYMzn9Et2r9UKt+zaohuRm4v/1Ydkk3ZWRQrs2gdRVPFNVjHKuKQHpjqMF8FM2rddea4Re/I8C5BLyeIpn/c1O2zpK5iYZDh4LC9nEu70E1ym9oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155603; c=relaxed/simple;
	bh=ISyhDkDup93TvG+tu/tkao0yiIvTCfA0oR6n7rTRjY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NmAArAjvCMUznjfARVorMd8HiEvwCfjmd+Mkibyr0DBMP51a1fFrlSf/JRc2KI01YVabsxUC4nuEV6UeO/smerRtXGBRWLqJVWI7dKUXSZpaZs5oBgnE7rm/BubnZIinZwzx05p1iOdzHxudIUYCmkBPsVPUoZIYn02lDLCd8IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KJgvMn04; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwPIlXuWxsnOe+LRG0ML3Vr21BhBL3feenBHDWq7wbNKVbosS69BooeiC6k0H69gq7r63pWSD0uT2Z84pJ9KSFmwJx0hqJACvBdCkZepSitHQT6SC9aqQZZBjcjZrGMdNtzaQtDZSPmfsSIrp54GuCySRHMouVaz/02xEjz85ScjaOzgKiIVmloHsUEHxW/UQ6BoLt1mOtKYgx2vfkrgPVw8H1EJXGvUbA2TsL5wLs6Ofxx/Ggyfx5y4Y83Wa/ESldpzJsu+e9gxYen56s0WyymH8zSkyEtJuKYYo3BwZPvE0utmqXQyA+IwIOFaihn90eEaxvB9bw8l9/5P1n08FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FROKsA3yvhUyBmpeJ2BIDuRWG2TwaPrnPwJg0LIVHqI=;
 b=DnF0dugEyBs+88qe+fPE7UVkBs+800lrRstf8wqCmueO0YbM1DIniBzxoFGqDafyD60ZxY8ABDgKGxBu8Nn5ijTlR1yCnGOxaL9IcsoId9P1YVyV7ToZTjZD754riiqjVGg7jfr0J+eCyufYrqLt7PPXu9QDs1n1EIgR1KCRtHm3tUY5ReoPBtQRt3dP4kSi+N0pnxIxShwQkjMz+G9uXVnYyezW2bJrF2uIE7lZlYU1jMoSCr4u2bBF1VmXNVEdj161cgeuac/odMcsyqp4xVwd3hBPwMcmRTo11Yogu2t81VWUCQLbPXVyfMkhT0yQCJiOaZJVWQOyPaI9/dnz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FROKsA3yvhUyBmpeJ2BIDuRWG2TwaPrnPwJg0LIVHqI=;
 b=KJgvMn048qGGM+Dj4YeUJW+k6sbWN5Uh3har/FABxZx4r7pP4JUehkj12oXcSt9yKEulZMSlNSjtzqzqxKjx081pDIrbx/ROBSim8a2kmOJSuaAueJdpt4MT0o3AvPJbTAoAO6p9hAtwIACHhlTSnEskBxUr7ceUgKZIfRjgXEstbPq6sD5zgqBBQWLORFoP51WB+xfMbNK2SvYmS0Dg7BiVxR3d+2W/jpeyYpIIL40x3uHBLg0N1pejiRHSJksXT52NLeyoLSfV8DFCzL6/sYSUWCArBmG8fFlBLodDEKbgydnS65amk+Y8K7lLZZml8PpIup8BHoPsrDdwDDEGDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:31 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:31 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 10/11] media: platform: neoisp: Add debugfs support
Date: Fri, 23 Jan 2026 09:09:37 +0100
Message-ID: <20260123080938.3367348-11-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9547cb-b5cc-4cdc-ad20-08de5a565172
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|18082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?JCpf0t7hjyCBsQe/2XTkZxm6mjHeWnHaCb+VgF7eC7zlf9ucrTQOeM4jRLDE?=
 =?us-ascii?Q?eZ8Uxlpq+X0RfZuGZajHQZU8xbqkB8oP9VobhO8Ibf+QUQ5Gmel9x3Ho4AAv?=
 =?us-ascii?Q?smYLBvySG3U8p4ZT7ogLwWNUc5QJtoK4zeRnh1GEXX1HiCzKEmnVSDtbkVdh?=
 =?us-ascii?Q?TGuvu2AxjVawdDHv79iETb/S6BS/cm+mlnH/pS/fp1EtffKxS6YsKy5YB0LM?=
 =?us-ascii?Q?h4/mNqfKg2FyLG6Nj9XKa1aX5sdhaUu0w34hyJjhgjNW81Np/XfwsFTRh9bq?=
 =?us-ascii?Q?+xyD5pn7icaYKrZkqvS6WXfYjrr8ek2uWoRNRHQLhjrK/pTJa3qZqM2c4IpP?=
 =?us-ascii?Q?NreyptaIP4G7iCbTQII8r9ajRThrju9KsEYFm7jDZLKYMCTK9Cgim9ze9f8n?=
 =?us-ascii?Q?MHZ/ekaCSWtSSfV2J9Mqq3P0swiRVhSA0+lQqIO5+P2HkTOdDWiWkFZbyjn0?=
 =?us-ascii?Q?eAUR8tRlmXp580shqkF9w1rc8tNl09FtMMkDzQzDKWhO1WIOq2SyFLa9buVP?=
 =?us-ascii?Q?dsOqPE9EsDMXUFXe8XUQt/0Miqc4YtlrhkG0Pqja4ri9HVIYxjDb/Z6KimPK?=
 =?us-ascii?Q?DatobZmN7Aj+dwbQKQoah+/i+reM8CD8LClNEWNTyt9deagLY1QAbndbMCFp?=
 =?us-ascii?Q?5Tn8hQEyL7hv9AcQqF1PjCZr326pO8CbKYhA+JjxkwaiL5R0V+R7dk2f7W5h?=
 =?us-ascii?Q?3/mqfKcTJZYGDvDIOYe+t7f529RNTzj3hPxP6ZNkcQ4RuHMa1HyRJigHQ43c?=
 =?us-ascii?Q?Ukxc+oEh75GY2pOFdiLvRDqqnP6QagHy+Gp/zi2u8d9VWcscZ99U2P/5d46P?=
 =?us-ascii?Q?HQer6K063mlDvGnG7z5wU75GAhIKTt4aqhtD8UOIMo8TrMFG6fnv6LkR8fS7?=
 =?us-ascii?Q?h9Xv32ERnn3tOrG64Ei6ABvEKos8qVx6Lbmu82dTVyUulrWLHcb6sFoDjo94?=
 =?us-ascii?Q?bsRhlpO7YIk4YsqOmBvHct4swbbqHHgvfLf1F5TGpy51Rg8yjKmQJVVz+qBH?=
 =?us-ascii?Q?DC5oiBkvVLpkboN2GnGCPX2OyA0w51CGD/0oIdFSa5HImut5GZ5sBE3+dO8m?=
 =?us-ascii?Q?XjduTbL5KRjDkgYMm0Iiq5GfjY7r8qI4hpZV8FFlPZEfqeBbvH0tYqu5xu3/?=
 =?us-ascii?Q?6NK1M4Xl95Lade5ZHYd8FlWupS3sy2VqvUYSFokSQXXpbyhXm9d/gt0u3d1a?=
 =?us-ascii?Q?C7bD8vh1wXlWsUwJbMFfVwX+HVrmg5dHW6ZSlKhKotBmWfJoNoOSFET5vA46?=
 =?us-ascii?Q?srvb0V1xpFWCJfxaDkxWHdCFD3aZwYtfiKcCZbOpR65HxKEi8Vw9MKQG7oNw?=
 =?us-ascii?Q?KLSTVs8goo3OvEid+4j28+l7/6M6UTHhcMG1s2/t9kMSU+1KKY2N+Ct2r1NW?=
 =?us-ascii?Q?XSzbDX62IQC4xFqLknb/3rpEh+n8aXaNFFrSNsLq3ogFSxwsLH6KWNl6Z5z0?=
 =?us-ascii?Q?tFY2SN01itefGG+vb/ZgfUXE90dBUom55BpvJTYP94kfk/bXKdKvC25nHUcP?=
 =?us-ascii?Q?D4m8x0svRsI2R5R6IdDnZJvnaBgOpBfdTSe1hyez2ZFK4l/mSVNsbmkBFw/y?=
 =?us-ascii?Q?niTDej0cYyMNsHLzd3hicOYTqqVRQWuchFmvv9kJeMLvg0SEm+VOPoUw8bCd?=
 =?us-ascii?Q?MAhsWklgbFwP0bozQkQrzlJAmSl4vnR+XpZ5UA1HqTnj?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(18082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VdEvULrJjceT/NPACIg0xG6qZaoM0SgLA/q5LSew2ta46US86J4ii0jmkjeP?=
 =?us-ascii?Q?2Zc4oBdN5S7PIP5UWBnmvycVeAnZsQTvYy7LelA7QwcDkXPw9IT5+ExXB+t6?=
 =?us-ascii?Q?8qDkgxuwxKDky7ZvMWjWV3eON8eGBugQ++dspJBPlv2WRkKpjHhUrUlMhoYd?=
 =?us-ascii?Q?dfrWA2kWlPK6V7SLjDkyRUcPhpFM0EWFTS8X6aMz2SicC56BgqEQXmYFgZmg?=
 =?us-ascii?Q?9ynyw+cfTaXbddOl4if/VOE23XiZbS3S08R2QhVBi9QnCHthQdCPiJa/O4MK?=
 =?us-ascii?Q?8V4DPIpUgMGbwqnPd4LH5EWJi/34xe/lugecQjU7HXLI2wMkFLc3YLoBiG4k?=
 =?us-ascii?Q?06Lz5WX/0L35pcBKlk9PIyL0BvA3psMrkpXewBggCAPFVWjSLYC9854qpv1J?=
 =?us-ascii?Q?5dtP6ZeVQ+VwWSsxRXzdOmAInA9RnPAKa6pVuTrwpqm2xwFNgTHQDiKBvv6F?=
 =?us-ascii?Q?22m5VwVKKBY7sWwyo+Zq+5ZSVNv1sLhUq0xUcKa8uOw5NrKeTtNV9gM9740y?=
 =?us-ascii?Q?kBoxf0quneyb13iWqFcoUw8S4iOy58Wo8UdZvmd7iN4ZUk5yk4ti98Aaq9D5?=
 =?us-ascii?Q?np41zdCLv/GNFpVQOkJ3Qz42+vGg9qbVy/Vsu9jTe7T1mx00JzZZzWhdXNUZ?=
 =?us-ascii?Q?zlLsVob6w2q7KS+4drWuLyS6BHFUyxkPSDUQdj09AiYd4HeE4hndWTtJbo15?=
 =?us-ascii?Q?UhwFRu0WqSdvOeeF5mf0JrISIj/3TTN+qPc/vDsi1i8RMMi4//1Rs8FdErVx?=
 =?us-ascii?Q?BVkBfMAnpqoKmDi+ZUzAkp82Nbdkiw5bgAqM83cIELWBgXyiQYje8/mBQVnZ?=
 =?us-ascii?Q?OzqU7rp2h5EIxzERqzmZc6TNa1TWcKbQ75GtyVpbIJucJGrgb1apZCXFl8KE?=
 =?us-ascii?Q?MNfm4yYyIMs2PiZHiM5K1JXUzZMcLCt0Jzhgz6jHBGxbBQ8wbTwuzdVsCHFV?=
 =?us-ascii?Q?rTJtM8iHrXDIgAAwk30muWsR/7vy/17KP2l/3Nr0lReL2Hrv1gMa9x2GJ+ra?=
 =?us-ascii?Q?TcG71WbdZyYEJYTHVN0jORUE+JRK9FfcN7+vFUukNaxwyALIxCTf4xhpz3Th?=
 =?us-ascii?Q?SHD9xEUPY6faB3T+xLuQV+1NWleGA6H/u4gTpl7puQnFP0a5XvhVql60as1y?=
 =?us-ascii?Q?J751JcMj5/CtUX5sbwyznwvlWJZDAnsZUb4Ls/uaMDqWEBsi2tu6VIpec/4X?=
 =?us-ascii?Q?9661Ro7qyv7BWXjx1OaSXmwFYuUQ6pEpjYgufoCtCyproQkyimeC//DzEvae?=
 =?us-ascii?Q?dupp3F6se5OwwBawB0DnCN/aj8qTQzlbFXDMY1e0ab6fwxNmEaLlvmKUGWmK?=
 =?us-ascii?Q?JOSBmmelVYkuvjUG4FyiD2VEjPWtp4lCwrA5jOf5NkMrriWAHq3tgwC95eph?=
 =?us-ascii?Q?cUy050ygcIxphYZiVaQpUoUuHYeVens55yxvCLZS5uyo2ndGt0zGW3/0BSUT?=
 =?us-ascii?Q?usS4ICMehu2Pv8iWibE+iV7K3MQTqFqVS2Hmyobs6tvlahe/TizLC5Jb4gI9?=
 =?us-ascii?Q?TwFX2vaEueZjOK8rDYwfV5fl66eJ80GxTj4w2MP7soycKty6BpZjAi/m5nHx?=
 =?us-ascii?Q?54DmuXNAbk9GpRwWcPUgR0A1XTEIzvsfn/XrYGFqvcPxF4jCLDFiH7vVEfxN?=
 =?us-ascii?Q?4qJsjkmlr27pVTRuU+TB236OX17XrQeyyca0dOkbh80MtsXJ2/kBU7qYTOGx?=
 =?us-ascii?Q?kUmHMJ2mpf1Q7fxWAOPkBQhEYlXFM2oreSua7R8kU5RG4gsrrCNBMnncWO3V?=
 =?us-ascii?Q?iPx0SZkfax/S3q8+DrPhv2RlYxpnzso=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9547cb-b5cc-4cdc-ad20-08de5a565172
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:31.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTp+5+M9RQA6qqnFYz7RKgr/rKa1Ead59+WhjXUOj8+j+GaoVKDXnJbZeoxQnVikxLvHGzn6DrOUlx6jJgqPIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51398-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: F097E723B1
X-Rspamd-Action: no action

Add debugfs entries to dump ISP registers, and some internal memory
regions used to store Vignetting, DRC global and DRC local coefficients.

Debug mode is activated with the `enable_debugfs` module's parameter, to
avoid runtime suspend which blocks register access when IP is not active,
so we can capture an ISP snapshot after a frame is decoded.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/platform/nxp/neoisp/Makefile    |   2 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  16 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      | 503 ++++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_main.c   |  14 +
 4 files changed, 535 insertions(+)
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

diff --git a/drivers/media/platform/nxp/neoisp/Makefile b/drivers/media/platform/nxp/neoisp/Makefile
index 7652df785e98..c68e216980dc 100644
--- a/drivers/media/platform/nxp/neoisp/Makefile
+++ b/drivers/media/platform/nxp/neoisp/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_VIDEO_NXP_NEOISP) += neoisp.o
 
 neoisp-objs := neoisp_ctx.o \
 	neoisp_main.o
+
+neoisp-$(CONFIG_DEBUG_FS) += neoisp_debugfs.o
diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/platform/nxp/neoisp/neoisp.h
index 381e11454d37..3402efdbc923 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp.h
+++ b/drivers/media/platform/nxp/neoisp/neoisp.h
@@ -9,6 +9,7 @@
 #define __NXP_NEOISP_H
 
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/media/nxp/nxp_neoisp.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -232,8 +233,23 @@ struct neoisp_dev_s {
 	struct neoisp_job_s queued_job;
 	bool hw_busy; /* Non-zero if a job is queued or is being started */
 	spinlock_t hw_lock; /* Protects "hw_busy" flag and streaming_map */
+	struct dentry *debugfs_entry;
+	struct debugfs_regset32 *regset;
 };
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd);
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd);
+#else
+static inline void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+}
+
+static inline void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+}
+#endif
+
 static inline int neoisp_node_link_is_enabled(struct neoisp_node_s *node)
 {
 	return (node->intf_link->flags & MEDIA_LNK_FL_ENABLED);
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
new file mode 100644
index 000000000000..a4b9af1e9e86
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP debugfs definition
+ *
+ * Copyright 2024-2026 NXP
+ */
+
+#include <linux/debugfs.h>
+
+#include "neoisp.h"
+#include "neoisp_ctx.h"
+#include "neoisp_regs.h"
+
+#define NEOISP_DFS_REG(reg) {.name = #reg, .offset = reg}
+
+static const struct debugfs_reg32 neoisp_dfs_regs[] = {
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SOFT_RESET),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_BUS_TXPARAM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_XFR_DIS),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_FRAME_NUM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CMD),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_TRIG_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_EN0_V2),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_STAT0_V2),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_STAT_V2),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SKIP_CTRL0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_EN0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_STAT0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_STAT),
+	NEOISP_DFS_REG(NEO_HC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LINE_NUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_REDGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_BLUEGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_HOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_VOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CNT_WHITE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_BLK_SIZE0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_CURR_BLK_Y0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_GB_CNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GRGB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGE_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGES_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_LINE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_ROW_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_FRACY_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG1_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_IMA),
+	NEOISP_DFS_REG(NEO_IDBG1_IMD),
+	NEOISP_DFS_REG(NEO_IDBG1_DONE_STAT),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT5_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GBL_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ALPHA_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI0_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI1_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_STAT_BLK_Y_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_CURR_YFRACT_CAM0),
+	NEOISP_DFS_REG(NEO_NR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_NR_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DF_TH_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_DF_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CORING_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CLIP_CAM0),
+	NEOISP_DFS_REG(NEO_EE_MASKGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_EE_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_CCONVMED_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_CORR_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH12_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_PACK_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL01_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_MAT_CONFG_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG2_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_IMA),
+	NEOISP_DFS_REG(NEO_IDBG2_IMD),
+	NEOISP_DFS_REG(NEO_IDBG2_DONE_STAT),
+};
+
+/* Structure to store word when reading memory */
+union udata_t {
+	u8 byte[4];
+	u16 half[2];
+	u32 word;
+};
+
+static inline int neoisp_dump_memory(struct seq_file *m, enum isp_block_map_e map, int wsize)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+	union udata_t data;
+	u32 addr;
+	u32 *src = (u32 *)(uintptr_t)neoispd->mmio_tcm;
+	u32 offset = ISP_GET_OFF(map) / sizeof(u32);
+	u32 size = ISP_GET_SZ(map) / sizeof(u32);
+	int i, j;
+
+	for (i = 0; i < size; i++) {
+		addr = (offset + i) * sizeof(u32);
+		data.word = src[offset + i];
+
+		if (wsize == sizeof(u8)) {
+			for (j = 0; j < ARRAY_SIZE(data.byte); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.byte[j]);
+		}
+
+		if (wsize == sizeof(u16)) {
+			for (j = 0; j < ARRAY_SIZE(data.half); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.half[j]);
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_dump_vignetting_show(struct seq_file *m, void *private)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+
+	return neoisp_dump_memory(m, neoispd->info->mems->vignetting_table, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_vignetting);
+
+static int neoisp_dump_drc_global_show(struct seq_file *m, void *private)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+
+	return neoisp_dump_memory(m, neoispd->info->mems->drc_global_tonemap, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_global);
+
+static int neoisp_dump_drc_local_show(struct seq_file *m, void *private)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+
+	return neoisp_dump_memory(m, neoispd->info->mems->drc_local_tonemap, sizeof(u8));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_local);
+
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+	neoispd->regset = devm_kzalloc(&neoispd->pdev->dev, sizeof(*neoispd->regset), GFP_KERNEL);
+	if (!neoispd->regset)
+		return;
+
+	neoispd->regset->regs = neoisp_dfs_regs;
+	neoispd->regset->nregs = ARRAY_SIZE(neoisp_dfs_regs);
+	neoispd->regset->base = neoispd->mmio;
+
+	neoispd->debugfs_entry = debugfs_create_dir(dev_name(&neoispd->pdev->dev), NULL);
+
+	debugfs_create_regset32("registers", 0400, neoispd->debugfs_entry, neoispd->regset);
+
+	debugfs_create_file("vignetting", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_vignetting_fops);
+	debugfs_create_file("drc_global", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_global_fops);
+	debugfs_create_file("drc_local", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_local_fops);
+}
+
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+	debugfs_remove_recursive(neoispd->debugfs_entry);
+}
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/media/platform/nxp/neoisp/neoisp_main.c
index f053a2136dad..a6d4dc40f9ea 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
+++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -35,6 +36,9 @@
 #define NODE_NAME(node) \
 	(node_desc[(node)->id].ent_name + sizeof(NEOISP_NAME))
 
+static int enable_debugfs;
+module_param_named(enable_debugfs, enable_debugfs, uint, 0600);
+
 static inline bool node_desc_is_output(const struct neoisp_node_desc_s *desc)
 {
 	return desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
@@ -1765,9 +1769,16 @@ static int neoisp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_nodes_err;
 
+	if (enable_debugfs) {
+		neoisp_debugfs_init(neoispd);
+		/* Increase pm_runtime counter to prevent suspend */
+		pm_runtime_resume_and_get(&pdev->dev);
+	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
+	dev_info(&pdev->dev, "probe: done (%d) debugfs (%x)\n", ret, enable_debugfs);
 	return ret;
 
 disable_nodes_err:
@@ -1786,6 +1797,9 @@ static void neoisp_remove(struct platform_device *pdev)
 	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
 	int i;
 
+	if (enable_debugfs)
+		neoisp_debugfs_exit(neoispd);
+
 	for (i = NEOISP_NODE_GROUPS_COUNT - 1; i >= 0; i--)
 		neoisp_destroy_node_group(&neoispd->node_group[i]);
 
-- 
2.52.0


