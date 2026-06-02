Return-Path: <linux-media+bounces-63344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAgSNKpNHmrmiQkAu9opvQ
	(envelope-from <linux-media+bounces-63344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:27:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C242627BF8
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4D87300B1EE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 03:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB6C368263;
	Tue,  2 Jun 2026 03:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Skn52Crd"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8F8362142;
	Tue,  2 Jun 2026 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370851; cv=fail; b=qQNw7YAsWPE399h3Xu/IPMm5nizf14mxG8nLHX/GGG5FmX0E9R4ICNmWIhmnbqy59WnHyqmFXwA/KsFZumGhLpj9lF0iA2eIxOzHVSdxHA6EoAgiuuj6uL5Nk/yxnaENAjPkga/Mm6g4R1xPZX8uzn4db1UoOQfg3NKrz1n5jOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370851; c=relaxed/simple;
	bh=52AoBgQ0h0FdiDH2Jnxj9CUKZmBw8PomgoYkd3y5KFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCmMU8PtQqD57QgBOpK83yhkwBMbcQLix/1xqNqK9yE7ET7uBdOF36STyyjj5JA1t1yFsWQlB9XnovZ/ws0VkiR8UDQ63ieOdod8U24X3JfD6v2GbdD9mEf3VT/GataISnSeYECkrW5OerlDdtdnd+ANiHKqAsl0aLCje1nN35s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Skn52Crd; arc=fail smtp.client-ip=52.101.53.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXu+6oERtaIxmci6GZN0om5X2m4tMUfwMwNNGqRHQriYeOQ5e/xH51t0ites+15xgEVTaaNNr84BJp9JrjW/MIBDBaqvy7dOVIyhF/uCRUxLUePd6Uoc/VXWjCp8EK+hCyOuPOeVJhYNpiqiAKaE+Y55btSJBEMrwxNAZoL52Bp5QzAyALGSX+/1RNMdz+2ugujitukKNcC4U9XMdk+f8sYrfmaQtes3qJ/GGHwsjDiJYwOCQ4oYWYVQgKxShvkI+Le2hieCcI38g2RpoeFd2Z53pF1d6guX1uEfEkaysciYbL9lq2HBv3h6SyJI7m/8MbZSLzhusdfqUyoh7gGMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlJct6KDKBym8hIyMValt8mSQvomCmqKfzkWYt8wJ9I=;
 b=s3BtEylvVEGmApzGKUa8JqPsSvpjUes2MGyelZ+/e9wzgzQ256YqPrK/FSA8sV3fbuDs0BZkFBkwUTjNzvf4mmydzVV1WPdYMvwG1Ji24pkDy38oTod2BENWtbZA9NwDEcVifrtSGrCcOTX6GuQNgdlyi0R+Xp2mOt8F8w+ASFWpUhOFTqMWkJv4TYac/PNBmDngQyroevyztQBR9WHu9KD5SPZQ5bh1ffMUOEEcvFXSf4BdDFgKaC5TCs9Ms+txryaYsluWxgPlEz3M5Xyv586yVBixW5L4D6OQQNvTpX6S9cbQkb5RH+2Mc3v5JLz+idJIQyrzXioqhnLWuP2Trw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlJct6KDKBym8hIyMValt8mSQvomCmqKfzkWYt8wJ9I=;
 b=Skn52CrdL0q1SFKizmhDL39VFfaCrdwL/K9W/yHZqbdTIr9orBeG0UK3lyUXyDjufGc44GAWpj7g9WV3WHyuv58EKUaG3wYcqG4yLYcJdk1+yBhvormgDzx4QPxz2RXHHVPpibkNayb4hpKAN0vtYuBMgdYN+2r5WKZMIWnYXCY=
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 03:27:27 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::a4) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 03:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 03:27:26 +0000
Received: from BJGBICAO01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 22:27:24 -0500
From: Bingbu Cao <bingbu.cao@amd.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: [PATCH 2/3] docs: media: drop Bingbu Cao's e-mail from ipu6 documentation
Date: Tue, 2 Jun 2026 11:26:52 +0800
Message-ID: <20260602032658.5462-2-bingbu.cao@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602032658.5462-1-bingbu.cao@amd.com>
References: <20260602032658.5462-1-bingbu.cao@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: bedb78d6-57a9-40f2-c825-08dec056dea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8i+qXFFx/xbOI1/b2kGnmC82nzTza17OQmB2UApD6iMd4i408iZXzHuc17vhdS2VzVagXVGAsIhcqGtcHRG+WfMTsFeyqZ6rurjBG7mPgfm2csEG13lXkHfIDt3P5P1mxavdjzIREKfI/ICaB2amK2lG4RYu9lqCxbVFGqed/BFPpU2V8QxuLUPFoEk6D5UwCVX121/INa6lBqaBVI16WYu25gdjX7VvjLp46Ytx7A0uKuM824pa3KrMuG9a1vOBnmNiqjVQibmqqxxmBdgOLPgM6hpye/WJXd0fzG9TdO/xdH1+IwXvOoSG2Z+XjKKNzeaIzEj+PExAtiF5X+PVF9R318EKXHT6jcG3l1cM8DMHPJ1hfUnnahkadQhilflNHD1+NDnmEbiWndamxFANArkji90kqtc7pyEUsc+s7xoB2AVfxMc6dj2wU83TecX/gBmmNEoKF5FoulJLh5R0bpqxCc9AS5CZWSh2MomN4DnoURnREq1+cLFeh6j1APRnA25ec6kQWz4eQG+3AVg5QnfYqu/C8uyv6OMtiP4U4miKp6L4S6JPCE4/135aTbjSU//aBnGacfuPbeT2BMU97TjjSbYUahhXuBDuLGb/vKoNa8mrDc66qBoX662UVOVFi1YaEBleui6mBE8X4baX8sZefAmnoMJDwjcggII1dKwM6xYcE/XPJB/Js8uNoBKVmszMQl91iUeT3C2wp0XbY8y/Mx1I53HGQ7aHrFfCqBE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IGeeINZw8vUlcyi1WRo+YGdLOFdp9EtJONk68looHhALGICnvq84lvXDnJCRxp8ie+PhbkSTnZiq5MVAcIJmRbd1jC61hAncxEpjq6GnAWHjxT2BVH+Bik8sldpbmGFHI6Rme+RaQ/0qtsKofRYCo9Syg4Ko5ITSsHaElfNtIlSIMPPOww92fCdtana/g1LLx3NTn44J9GxY3zNiCh4LvTiJoTA8xfmwY3eAVJnCMnov6axam83V9DEDH5m518YacnR+iM/QwvwJVc+r3WG8v8HBH3Uof2fs723I0NoAi2VI9j4dnDaRsArhRvzW206IcwPNViD7qxMpdns5wq3f3Mdf2IxY/CxnKpLV1EwvwYfuydjLoZe5D7cRhfhMiCLyCNMXEntoKblotiUYNvdcR21SupKiDOLzVMbdnFEQS559Np5zaLP9WtX/k+4FYo8F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:27:26.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedb78d6-57a9-40f2-c825-08dec056dea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63344-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bingbu.cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C242627BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

My Intel e-mail in the documentation of ipu6 is not valid now, so drop
the e-mail address.

Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
---
 Documentation/driver-api/media/drivers/ipu6.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
index 88f6498e74db..7845998a3971 100644
--- a/Documentation/driver-api/media/drivers/ipu6.rst
+++ b/Documentation/driver-api/media/drivers/ipu6.rst
@@ -4,7 +4,7 @@
 Intel IPU6 Driver
 ==================
 
-Author: Bingbu Cao <bingbu.cao@intel.com>
+Author: Bingbu Cao
 
 Overview
 =========
-- 
2.53.0


