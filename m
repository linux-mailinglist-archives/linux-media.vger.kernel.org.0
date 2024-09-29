Return-Path: <linux-media+bounces-18739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BA9894BF
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 12:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB961C220FA
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343D01509B6;
	Sun, 29 Sep 2024 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bb1AF49E"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88042AB1;
	Sun, 29 Sep 2024 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604999; cv=fail; b=djCGvhldnYzOJoDpaRusV+xJ5miBz4mZ7JlkVoEmQbGibfCBFw7y7rvpS/CjZX2CqWL+Pt/cA1fvDkT6arMFOgz3hpiOIHCSt1EEC2rDbz8T8tKFmyNpEvukn7HhFRzVx4xsIDU+pe3BI35Nml9QUu9kmfiy8iOhQODfaxeIhvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604999; c=relaxed/simple;
	bh=oUy+31n7CBKUGGQmzAOyf9xQBztVpGCE27ZHj/LMnJE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qR0FkrEnc4x8sXDWwdRXLa4FOJGdEnhTuv4OJrboa/Zv437CBmgGXVTv5eBXzXhmcxyDh0tYDwtuVLkpND2r4e/TXyW8iaHrChPbQICch1LerX2W0/VCJAcAhOThzCeYb41UDD7uRuYrd41kBgcU+qlp0x4DVFSz9pl0uP7F5ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bb1AF49E; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KV5NxwhCqz6bTkmQ2gDf89hPWpP0nqPvaIUZfhFmNEP2I3POBIlT1GKSzszYJX753Ho4n6Uz0bZoaY2rCrfmDfyWYF2RktmBC4p1niZcc7tSVaNEx+ePztXRIC2IKicbq2X3Vs2BNbeZKnhfQFfLZVi6yU5wCsTECWxIIQH1CytFCbTUSW2lP6pJ09FxeesK+tO/yeT33TcqJ2akObQbbRJOgYVc0GedyYtVwDxn34+z1isZBVy68V+7MQJzwsrojfkGaxeYlus3X1hay5yxEDIXRyXKVdjdD7tdkPU7i0OIMH6AW3kqblGv2NxhHr3a/NUf8gMgVZq+2FMrp0LoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/CYtVWryVyvSuY5gMTCtbmW5F2rQN3HY7g/bDIRbDU=;
 b=woRIIu9OI3rNlTHlR+ltuevaG6MQxaQSb0Hh6+ASQ14FL/uWtbhwlPrZAzXoxb8mUvbwUzN9mecmATdNTJkMgmptkoOWuyBJYWC2/OCj0Bymrs/6GFyYJ+i8V0o/PKIvZirFrdWVv3CKf48ExKrOyMT2MkS305Z8Tf64L6dy/AQyDUdrC2cQPMwE+RuQ3Skce+BDEjxwaZKT/Bzmc4k6Ea5o2imTdumBCLLMVAJ8Be1O3jNiEfUKEtrR+NlQD1REh+wjWkW9Q1HemItwUwmgucsXgxgl0jL1z8tBSicL4gBGfdHKyfKYUsqW6ShHiyE934jvKy9AJiQ9hGxgGrLNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/CYtVWryVyvSuY5gMTCtbmW5F2rQN3HY7g/bDIRbDU=;
 b=bb1AF49Ei7Sg1xrLKfqRK/2kcKlynnaeITZ3HvKvPHvFhIPBW3MvCT6G5IvH0zJWgIlbR6jXB3haXluEiWOJOZC1k6G+JNxgr8G+7vPu9FnguJYlIZ9PWguoPDilc5BIO7bj/h4fcf02VEyoiSH9okLzqopENtjrwKgH43818qcjXtwc+kn+ZHmJJMw4F/8lgtYDDwBsUxn5QFf/i32EpXcqG4xoeTxqm+Dnxehn4/WpgC0NeNMy+X9AELOxmEuPHhveG9p8MPzEV9ujAhKewEeLoRIb/BmlbbtabMNrHf35IJnJ216gYUYMbmcRJGcMQqdCbS7AY680nCdcH5MZZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sun, 29 Sep
 2024 10:16:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 10:16:31 +0000
From: guoniu.zhou@oss.nxp.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8mq-mipi-csi2: Fix CSI clocks always enabled issue
Date: Sun, 29 Sep 2024 18:16:35 +0800
Message-Id: <20240929101635.1648234-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f5403a-36bc-416e-31cb-08dce06fc998
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eDk4SUxRZ3lkeXJSTXd1TzRMZTdBV1dIdVNtVGI0c1MzYi92TUlhbGZ2Ly9z?=
 =?utf-8?B?c09CRjI5NzF1ZkNaeGFhUUNLK2RoQlIyeUhvbVg0V0R5aW1XNUxtZmhOMzVO?=
 =?utf-8?B?ZFYwZ2Jyc3VoVUMxNWJSMHNKRExVYksvdnhGWDk3eVZFcTNEZXdOaXBiUlBv?=
 =?utf-8?B?djk0bVpnZEtpWVZxTEFPRmp3QUcrYmkzcEMyTWQ1VjVKR01iSDNKZGFtdnVl?=
 =?utf-8?B?bmJIWHN0bXdDNDhTa1l2TzJZa2JKL213V0hyU2xGU0FoOUtHdk94RUR0cWlz?=
 =?utf-8?B?cy9PS3JtcUFNRE8vS0JrOTUwSG9qVGxkNFlseWdNenhzKy8vRlpBeWMxcUlx?=
 =?utf-8?B?TWhXdlhTL2xtZXpIbTVYUEd3cWZYM01SZnhUVWo2N2tvZ1k0NFNjYVdRWkM2?=
 =?utf-8?B?ejlZN0JNTWdjMnlpaFQ0WlM1RHlLZGRlQ2cxZW5LN0F1UGhrUFpkMGt4QVJz?=
 =?utf-8?B?bXFQRlZyeVlrMDdOdk9aWDNvMzZRMHRoajJza0RJS2VZNCs1TnU5NkdOaFow?=
 =?utf-8?B?S2tYQTliaHZWZzhqOEZZWTdveTZ1Um8xT2N1YWEvQkgyRnRJMXZMWDdkanNJ?=
 =?utf-8?B?Z1U4Uk0zY0NIb2VBbnd5L1BBUUtOMWFTaDBiTnc2b1pMdFFnOU1wc2hwUjBn?=
 =?utf-8?B?dWIvaXc0QzRIMThHaGRyczVCSGIwMzgvaFoyVTk2RnJDREEvdnNwNTNxZ2xn?=
 =?utf-8?B?RjVRRWt2eUE5Q3ZTTVcydm1odW8vZ2ZxNlozM3UxMXc2TktRcWpTOFE2NUdR?=
 =?utf-8?B?YWVsNXlLRkcxQVBNTnBxbTdFNVUyYm5XYUdPSGxrb2duSnpWU085Tmc1Qlho?=
 =?utf-8?B?UlhQTktSR0xDUDRuWXUvR1I0N2RMRjZscVdwQXd5NjU5ZmtLanNwRzgydkFU?=
 =?utf-8?B?RUsyNGxCTkFrc2dTS1BEdDV4aFhNZU0yWmxLSVFYTDRlQ0h3RmdtbE9pUW9L?=
 =?utf-8?B?V1BROVgwZXd4WFFWMGxsU2k0WmhoZk5kSk9yT29ObzNudHpuazZrQlIyTXhX?=
 =?utf-8?B?T2wrNldOaTM4RmVLM0JqNGJFUXk0L1B3QWwxTXJVdW9zTE1VdTRFRVZ5MTQz?=
 =?utf-8?B?c3pYQTBQMm5IbUx6bExMUUlnZDZhQjBHM3JDWlVWVExDUDZaVG1tRU9CWFhn?=
 =?utf-8?B?TUY4SGFxNVp3UlBQQy9za2svcEtKMTVNL0tyUFVTSVQrUWNRT2M5am1OZlpv?=
 =?utf-8?B?aTdqQWdaVXFFc2t0SHZBZUp0NytpL0N5RHFNdXpnenU4ZzFGZk1jQmZqQWNL?=
 =?utf-8?B?QkI4Z0Z5U0JMSk1wd0d1VENPajBmYlR2Z3BVWWxUMjE5ZmhUdW1sYWxTNVpo?=
 =?utf-8?B?eUlZZGNWU3BjVjRudldtWWozdDVza2h0RWt4QWh2UUptM3VacEdpYno5T1pM?=
 =?utf-8?B?dTNkZS9iVjFiSStqZ0x5S05IMzB3MG8reVpXYkN4SDBDTE5SVkJiV3hOcFFR?=
 =?utf-8?B?UTRSTWZEcHdLamFoTXpsVHVLRVRoVW9UajRiZGlKVzlJd3pzTytuUHEzOU9i?=
 =?utf-8?B?SEVDKzM2bzFsTEdrbkwrWlAza2VQK0t6RkNid0tRVmd5WFNjWE9tY2dmWWdB?=
 =?utf-8?B?bDRFRG9EV2VvcFlmN2gzT3lNUXhHV3c2UVJVcjhDbm14TUw0OThDSjNrcW5a?=
 =?utf-8?B?VlhZYzMzZCtpQWZ5b2VzbzhKc3k4dXZjSXh1WitxdHM1OW1NdTRSMXVTbUg2?=
 =?utf-8?B?aWdEdkFwR1RIeVpMVU8zWTNROExDQUtMdWN0Qi8yQkU1V200d09abGlNTG5O?=
 =?utf-8?B?Z2h6VzRpZ3h1ZWxjWXBkWlJBekM0YjUzblFnZ2VwaXF2Y1Q5RFkrSXUvUGQ5?=
 =?utf-8?B?ZUNIRkdNYWVlaFVOdWRLditNbG1vUHdmdWZhYnJMTlc1OHdGZUpaNGhPNHVy?=
 =?utf-8?B?STBabGxCaUIvRWVNRHdUVWFRT3FCVHZiVUlaMjZnZjY3NGc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SWhBOHhyZE1HTGQrS1RKRHF4U3J4cCt1TmgxQ1lyenkvN1MxMFo1VUhneE94?=
 =?utf-8?B?YnBjWkJST2N4TXJUQVkxODJSUXloYmhCSS9mbkN6Tlk2YzlyL2VKMkExdDJh?=
 =?utf-8?B?L05vQ2tiU2xMMnVDMkFwcEs0WldIMVVndFR2bitZakF4TndqM05YMnlNQlM5?=
 =?utf-8?B?Zk5Va3ZSZ3Y0eHRZL3ovd0E0WnorYnRDSWpQYTQwQW0xcnJzbFZjREVWUU1T?=
 =?utf-8?B?Q2NOZWV2ZW5INFkwNGd2a3o3emhkL3NsVTJRZ0JFWnJYM1RBdm8vQ3RPNy83?=
 =?utf-8?B?ZS93NlVlVmc0VytnaWE4cHZwcmR1ZTJBdmo0a09jaFRMRGtaMzlKS0RKYTBi?=
 =?utf-8?B?TE9ISmJrMHlWdytpRlh6cDRSWWtRVjJ2WWlNWjEvTjd5RzF1RkNMYXpCVlNM?=
 =?utf-8?B?TWp1U25jYU14enU2NG05UXI4WlpVYUdSaW13bWhmMFg4Slp3dUdENldVcVlF?=
 =?utf-8?B?angxZ0VEcmR6bmJjSklGRlBKeFdxcXR4bVRVMlZ1R2F6bzgyYlBtaGsycXMy?=
 =?utf-8?B?cDhSY2NnU3p2TGdnMmd4dG52a2dLSno2cFJZaWYrVlVMVDVPTlBkL0V4YXdi?=
 =?utf-8?B?OG56YUQxU1dGSUU2bUxIMkVVeXZNZUtMVUVQRmJrTTl0UEt1WlQ5M1VqTXhl?=
 =?utf-8?B?R3o1TS9hV0dORUlkZmtuVHo5dS92dFc1OUErR2tqME0rMGswdklHZU1icnVL?=
 =?utf-8?B?amI4TksvK21CU2FOaG5pZFJ6RXdnZ1NuV1ZiZlFJK2NXQTUxbWhTeWY1R1pY?=
 =?utf-8?B?L25HdjFrbUppODJMYVhYcnNrVVVOeVl4RDVCQjRiM1BRV1VzaDh6Z1hucllH?=
 =?utf-8?B?anJXekowRGtGUks1MHVqa2FJNDlXZm9yNkJXY3BCTWdabTQ0aHUxS3B0V1R3?=
 =?utf-8?B?MDQ1eldwTmV3ZnlodFBLS3VMcjcrKzIybEYxT3Nva3BUOXBhYlZzZGI3YXRK?=
 =?utf-8?B?RWhxSzVsL01sK1l3N1FycTMxQkZmVHVNbTBhaDlWNVVGOWNleU5NdEQxN002?=
 =?utf-8?B?OVB4RDlydmtlaElWUmc4dGxxY0YvV0lPK0lVN00wTlNwSk1FWks1QnRHSHly?=
 =?utf-8?B?NnZ4YStzN0pEdzB5MUpDK3ZmNnZjc2M3MkVjamtpS2VjdFJYTWUzQmw2ZXp3?=
 =?utf-8?B?TVE1U1YyaElXQ1M0R0Mwc1JkZHpVZGRXL0VpQjhDcG5TSWVYeHBQZTdnNnJu?=
 =?utf-8?B?L3FQVGdjUjJMdUpqcVd5NDdhdktZQmJtZnR6bVFZUllZanlZTkxld05VUXNF?=
 =?utf-8?B?RTNRdngvK25ONlQzc0RJOVk3MjFkMVhtMmRkMHkzMEpBMHlhejVCbG5zZzV6?=
 =?utf-8?B?QThsdXRpUmUxVnZseTBIbktPWXJTVTRpVHQwbUNndEdaVHBwOXQyeGZ5OVhU?=
 =?utf-8?B?WU9FY2pVVVc0ZzRPTHpPRmQ4ZlVDTVFkdVNqV0p2cTd0dlBZWndOU1NxRjVO?=
 =?utf-8?B?enR5d1pyWU5ZYmVGcEk4aUFIVUhJNE93ZFBNTlRMTjhKd2hKcTNhb0xXSVdG?=
 =?utf-8?B?RUhibkZFME4xeUgwQkNpSnJlRFUvVUtmeTYxYUxXUE5vM2I5QnloVzJXTGZQ?=
 =?utf-8?B?ZjhzVS9TTmc2NFBwL1VMNUhicm1kaXRkb1hadEZmTW4xVC9JQWt6MEw5VDdH?=
 =?utf-8?B?NVQ1d3U0ZlFxcWszTXZEckg4UTVLK2d0d2ErS3BXNGhHTUdCSjV6dEZrQm1O?=
 =?utf-8?B?VFRUTkZRVlduZkVCUjYzQ1k1My9XSXR6K2FQSlNJa1FQSytlYnlzbm1SNVFK?=
 =?utf-8?B?U0RXTVl3bFNCaDFyYVM2QnVwdHQ2YXRDUWJyUEdOUzh3U0FxeEsxRE1mYzVH?=
 =?utf-8?B?U2MydUhlSTNMTkFEaWRaYnVMdjhDTXcxSU5UczJZK1dKUW00K3hHbVFySzRU?=
 =?utf-8?B?KytYaWdIdzhvZHo3cHljZUZKdmdSUkNVZDZJQ3lSMkFyQUR0bXBpZzYweGQv?=
 =?utf-8?B?ZW9sc0RKWjNyd3czdEFQMi9DZm1aTjI1QnFOM0pzWGxjanBySHRwTkNRalA4?=
 =?utf-8?B?ZEVYemU3Z2VtS2dvTmZ1WHJPUGp4VytYS2FqQm9BWk1xVkdXUHdDOGVBcUcw?=
 =?utf-8?B?eUdiNk4reHVNckZCanRKb3NtNGhZR3NmQVUxODE1dFFsckQzRjlocE1sdjFF?=
 =?utf-8?Q?/8O8WhhwtIcd4NQ75D0Yj7t5E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f5403a-36bc-416e-31cb-08dce06fc998
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 10:16:31.0982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwpP/AALwygF0NfVagEJ3ai7C/VmHxRwLn0E+dji/4m5ECFkf1JfmaOBk2Um4KLmgsroqJvfgpdpu+87SZ3Gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Fix CSI clocks always enabled issue after run system suspend/resume.

The clocks for CSI will be enabled in imx8mq_mipi_csi_pm_resume()
when system resume and the state of CSI will be set to ST_POWERED.
It not only cause clock always enabled issue but also system hang
issue on iMX8ULP platform since imx8mq_mipi_csi_pm_suspend() will
access CSI registers if run system suspend/resume again, but the
CSI power domain is not active.

In order to fix this issue, using pm_runtime_force_suspend/resume
instead of calling imx8mq_mipi_csi_pm_suspend/resume directly.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index d4a6c5532969..15029bb81b35 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -697,8 +697,11 @@ static int imx8mq_mipi_csi_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
+	int ret;
 
-	imx8mq_mipi_csi_pm_suspend(dev);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret < 0)
+		return ret;
 
 	state->state |= ST_SUSPENDED;
 
@@ -713,7 +716,7 @@ static int imx8mq_mipi_csi_resume(struct device *dev)
 	if (!(state->state & ST_SUSPENDED))
 		return 0;
 
-	return imx8mq_mipi_csi_pm_resume(dev);
+	return pm_runtime_force_resume(dev);
 }
 
 static int imx8mq_mipi_csi_runtime_suspend(struct device *dev)
-- 
2.34.1


