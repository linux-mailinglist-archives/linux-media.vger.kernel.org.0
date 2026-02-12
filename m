Return-Path: <linux-media+bounces-52636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI3jBd2VjWnd4wAAu9opvQ
	(envelope-from <linux-media+bounces-52636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:57:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511912B983
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A48C302DF45
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929E52DB7A6;
	Thu, 12 Feb 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="h/FPJjaA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3D1448E0;
	Thu, 12 Feb 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886609; cv=fail; b=LH4zNgh9IFZGrUOnE0038MBnlL5IUv8DVlw311T/xibowu/Ssn1JRutS53J5koAqXgQ0B3Ra5wkqFfRQxCSyF1kJmW/tNnm3itJB91K3dIsZ1ie0dXxWdSIOeKY1zu16pP7DoBUSe2g1/LVCmasp7bAqgLkMNYc3tFKKYc/fSok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886609; c=relaxed/simple;
	bh=h5Kdkei2rp4vauMSE9jfZvyDvXi26aXthBu8NA2p6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bh7SbQ4IJXCTLA5eVQtaSKK2fnmFzZI7SohYG5z3lda/NoQs5mE2qs3VFxmMYu3shKf71ntQtg/889IoWzoMU9029Z1ut/a9xR4xXZgLIRBXx7zc5ROddPWdhvEEeXmkixC+jtljReVAIG1XHCqxhpLznmPGgblc6+KpOL1TmL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=h/FPJjaA; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5YDRQ133070;
	Thu, 12 Feb 2026 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=zuDPQGnLO
	d+nUuD8yb1wAFxyvsK/OJKTEmEkGiejm70=; b=h/FPJjaAp3+/mWAA6H/4Rujf8
	42/8g9bqkmPGNux6px3uO3pS9JWBjRK3MqI2mm+TAxBHvYHYEEdglpZkVHL155nu
	M2mzjzQrzgJbZLpXYhpYH5HNQT7Y/QlouCctMfhcR372QOUWkAhEO3pslKHSdYXP
	ckHtmYu5ZNWKW222iEQ5lUNIOW1i0cJlDfpOCwjqH/gv87SJ+rZGgodGjvLV2Znl
	Ul9/i4C8Dy90Ry8BQ0JYK7IEWSAVaOvMO1ShpUF0GOz+TtQPyHAoKGW7786oQPpy
	rRIAdMJGUvDJN1hkFMAOiB5iJ8aD1l+MDlquCJOYjRCMTKZOeQoPXgSSDCimQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5dsmt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:56:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnNzw9cQvwe4e4XBt43nM8DwejA7Vm5gnfG538gbLczgTZ332tic2+QSH01QIjHHSX0TZNy0YM4Gdu52/Q5lsB6rz4kLOYTQrBEBz7iGuSt20gpIRopda+43Fa5R3mNhOhNgBb164Gk5jncP1n0YU2h9mDFxkZHB9Uz97uvsi+rf+OWUthugHjU4fZ5VuO3xeNARD34W8RCdir2qK59+razocAQk2sFmnwbhkUxGlTEwGPCMVxbY985thBAiujSFc2KFgebF57ps7DoVxMt/mqmwthVYgSNzKXPh5d+hcNx+KMG2W/9S/yim/qspqG/of89KZEDqsYSqNRZaiNecLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuDPQGnLOd+nUuD8yb1wAFxyvsK/OJKTEmEkGiejm70=;
 b=b5VQy/jfQ1E7WE5ZDIio6fT1BPY/xayWtdsrD3Glh0HGYv10NZLF8dVUoJZS22EeS+YBrJM3vmq3SLBwG6kLRYAV6aijaBGGcldvdd+x4trlyK8+Z26E1+XcQWzczF2od1IJqpyB8eyrVoPHbzp9I3ICKfjjl6A+j7H4/RICbbNu+XWsZDgw7XnUZcwy3U9d1rWuF7Afe2+6EVeltgW0Y1iWP178JbRNUg7ZLfzXC2/YXrCFJioTHTEiaOb3f8FogTDqiJumlGsluThjwSc72xVAfeLaN5IvELi8cDIea58Cr24eSwXr+9AtfFocCBCorPJB4x5Eanfv+94Q+HcLpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS7PR11MB6039.namprd11.prod.outlook.com
 (2603:10b6:8:76::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:56:24 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 08:56:24 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        kernel-list@raspberrypi.com, mchehab@kernel.org,
        florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rp1-cfe: Fix use-after-free and double initialization on sensor reload
Date: Thu, 12 Feb 2026 16:55:26 +0800
Message-ID: <20260212085526.1598770-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS7PR11MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c73b715-ca45-404f-af41-08de6a1498fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9IFJIrezfRdPdsK6P/A4mb1kqdqltct0z94EdeR3lgjFEh1tyuXPGDBX10WZ?=
 =?us-ascii?Q?+U3k+Hy1eQe7RWyQ/nd/An43kFhgsclDtFBKIH6pFSfrlpiEpcQZ5+/Zum+k?=
 =?us-ascii?Q?GbHjpxMoqdVCMUm6Ysjm9HcwhSMoAabgp2jl0C3/Irp+eX1B1rDlLTiVv7SM?=
 =?us-ascii?Q?ADBnR3uLdc8gJC7Vw8h7p5PLpVeWR3Jrl4dsPVaKo8RD5w+/j5at5zHVkfb3?=
 =?us-ascii?Q?H00fz/y++rxCqp+EOm2ec/v5ksfX0Sz+IlUuLt0ju1QcNEisaiu9NQKiRPk9?=
 =?us-ascii?Q?A5e1UyNeve46+jSgFLEoh3r6v7o/5jXVF0U4oRlx3SrQPHvz2amiscI/rSw7?=
 =?us-ascii?Q?DG514BNkj6q6cS6tWvhQ724YuAbbPRfMPAz9HaIw93ymNHWMsgfEMaAHr17P?=
 =?us-ascii?Q?QXiBvcRRk5DSzCqPT+6qSBklnOp/YTP2brHcrEzM3QytTiz3FpAQjiKTBZyk?=
 =?us-ascii?Q?92aCEJN3exrDpRcZqaIf98fwTuWm4hjAIFqWJSN3oJYE7QWVOzq4a+nyAeMQ?=
 =?us-ascii?Q?vOInmgH/JYgFGoqQVLccyPStG0XgMSmtbm9PEHBaOnKGb8eF5d2/bBMvyF1D?=
 =?us-ascii?Q?gcXtEL/Vazc/m2x7uBEH93wnOmH3EHc5tqF0FfibY7X373XVHz19mCOMcRQI?=
 =?us-ascii?Q?Q45vjwwAx2rfZ/Y/SPbXYwvsZRwH99MkWiQKUEJh6EOcXFmVeeFg2sOWspET?=
 =?us-ascii?Q?eDwwJBosO4yLciGqo0uchPgvJ3boDOIfNhzFt4soWHljyfsns4crKZ0uefHO?=
 =?us-ascii?Q?nOLvtZWpQgpb947NCRaYaUK2tTPUH+WZQFwBxdJsK1xml3TWc6RlDMUDmKk0?=
 =?us-ascii?Q?oBxWlan0ddqamZzQ2b2gZR5xYGPSVURAJSP/OFMCIUTzfnH/l2TILyyeYIo7?=
 =?us-ascii?Q?9ilojS/Uq9y3FauWfd7Fnx2ooi2s9Tak9Dczyn0JyCWI+hifAhORQ4Z/1N8p?=
 =?us-ascii?Q?tw6erHAzWAGk2hSwjhnsk6qA9IR98G5cjfOMmH9oyqYpfCgPt39A/kEslMdv?=
 =?us-ascii?Q?2+bVu21ylqjhFBzhyy9iXBan/boGrMxdMJ1mTJNtY+gsy2q4FydSNNWo330Q?=
 =?us-ascii?Q?EQ1fmPVMrJbIi7fVWuQXFQMpudbJH/s6m+ZQTdHYzTlv16XkAdBTVvfh2RNb?=
 =?us-ascii?Q?EqDQu57H1vl+0G0h4hD/uiQhYjzwnxOmwYFiXF+Jjdeyq/qsPuQW+fOqHxt6?=
 =?us-ascii?Q?wS6ch4XyWM2htNBesz4ZywtZ/BzOzIe/DMnl9Lbq+vauNgf0i8RpAuZUEQph?=
 =?us-ascii?Q?nDXQtXcS0tbatkRVR3O68li49abHnOPwABeHcknaJ5oe2hdpN3rJskxVE+dy?=
 =?us-ascii?Q?D0IJW7boxnUVelSDaBWAPmaeo3FBqDbgaIj3yqPI14+fYc5RXMOB3nbhjS+s?=
 =?us-ascii?Q?uMPqPS3W1Ecj94DgybRU2M7F3ZAfx/17BqZHOq4I1LthSRlKwZJ6F94VgEBJ?=
 =?us-ascii?Q?qqMJlWrcuQQMmp4DmM60aGOzS1CxhO0Z29z7gmwB7f445dmJcSa03LcwZpP4?=
 =?us-ascii?Q?hwDED9hPr64DM+9amlTDqZ67JLM8L9EFspCmfY3/YzuMk0dB6O6rb7fmSlo3?=
 =?us-ascii?Q?sD38JiGcLQ4uaIGAiYwXdFSmfoH73hh33AH5m2l3o95Hmud2VXjxE5jLDiAO?=
 =?us-ascii?Q?nOy1/uXNC5tZ/TNotHCxS2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8vumeUCUx91vvRL3t8CiwooXp99nII0z6uncC0Q4bYaZ1kDbMEYRmhlNK5A5?=
 =?us-ascii?Q?8t2jDUC4cYslDQCD4JHvK5ypmKLJL6C3mLHi0tsJePk9VS5zES/sb/zrM99z?=
 =?us-ascii?Q?Zcn7YyBtjthXB3rGeAwnk+sUWnNLPCdMuuFUyQ+osOJqGHqtBRNkBZP29lD+?=
 =?us-ascii?Q?sDl+DtZxmn2OMZs3wgprbIy8shiV/T6KvlELstmEWGDcEjssyseRRHP8fYLA?=
 =?us-ascii?Q?JOV6V9LRtJYF68L0qOYqELUoDTbc3NItRz/WcV9Fyu4gI8jCZesTn8WyZdCd?=
 =?us-ascii?Q?np4hq4vs0s8YxmhQ1Ligy4EubmuhEQKGRqXYQ54GiVSHulLDG5XFY6SI9W7q?=
 =?us-ascii?Q?7+f3FVvx2L4S8MTe1r+1s+Doy4bz+dKqgi/f3sRUxfY0K5jooJIoEviCJJnN?=
 =?us-ascii?Q?xzAKsDIsZHMvSIyse1fhz25I/jrC1yfa/ElXX+wEPXMs9QM5CrQNKerHjSgW?=
 =?us-ascii?Q?I898WPz5LOAe0lEDF6ibd1cyiZPQb/mluxdM2+PpHieLZR2C9DGckpLl6Oqv?=
 =?us-ascii?Q?2d9b72bJaJ7cD6mE3/Hzn1E28EJjsOLXb7KJQpMlR1bi+i58XzRXWwsQpIIW?=
 =?us-ascii?Q?KANHlxs4KKJRlpRvLdAecOoNGhO6IJs6puoDm1muTDuinpJcPnkn5k/5An5x?=
 =?us-ascii?Q?CIHdoLROyy9+EWTrki/wL/5ywEc/ix173h/pOg1ZkV68mJy3fftvI845Pvt1?=
 =?us-ascii?Q?QGOBwOR+HIP50vfliR6I8ai57bl5gQZkhaTxjsq2yvy2mXb0mVVXYktvEXL8?=
 =?us-ascii?Q?Skdc8KzW9tQRanGD87+0WqVZkOTK+vcSeuFHeWjARQjB7nG++hTOxSaEANgz?=
 =?us-ascii?Q?HTSYmOeSABhK28IIRVyjXrLukrcTV0FFx6zkKj279dWOhfMB2NZeLTvpFMmt?=
 =?us-ascii?Q?gqgF1pgHroCfOsdURCrCJbAznUOYxzk4fAoDwNg+aE/csjH7Qx8uFseE8qhD?=
 =?us-ascii?Q?WrVfSQoY0zjPaagims/FYSuFlmtAw4uqwDqYSdBs9Kh111hiuvfJrdjd+Krr?=
 =?us-ascii?Q?RzgpJW4bMwu5MjK/6B9nzobm1j5xxxb/9Vh5HFm+80ZafTIFtdguoW6HgRtt?=
 =?us-ascii?Q?DQpa0w9ejaEad+huR/kr/5iBc+FZV1nJdodvt+sjERSDBcS3uduxmcVF7k8Q?=
 =?us-ascii?Q?o0kPaLYwLtwmNO+X7T8lhnDh0r25LsQ0b3PHcSmnFEFSchsEMpadXc9fJYRt?=
 =?us-ascii?Q?+OLf0r3Rdod6G7IqNuIC42xe8tfYmSyXW5/+pi+vStHi7Yq7IIOdPPZHpwi+?=
 =?us-ascii?Q?KWgwTuLqNxq/w6TN5WUKKeul669TfVKQnrCsax4R9ghEJzRpi8vGi3fC81I/?=
 =?us-ascii?Q?6etj80CJaZbHcFcKo3lQFHtFXl43uUXC2nwSwdswXDcBMTy9pwxY1btW+IQe?=
 =?us-ascii?Q?tqwAfMP+gKFPFnPgjmRqOskFmr+EJf6DdQs2S0hnFQmmgBMlScsuiyVSST2m?=
 =?us-ascii?Q?tV90bPP9lIBQ+K12o3S+Fhx+Y/z6gmaQNTEWu83CgGFDVXSbhzLHJv9rKSFv?=
 =?us-ascii?Q?pykstMlADrEHZonHJ8pjLv4Bx4yAA2R882sHpe1jyxmKFns0EmNDAvlvDaJi?=
 =?us-ascii?Q?BnvkslQxaWjEUx4bW1mN8B14MOsb+8juDLfgDyKGfVNKp1Ww8kIlO0iUszSZ?=
 =?us-ascii?Q?NPKC6JyxGSDwLipuDC/t16LdlrkWav2g8aE/lZWfX8+F82dNb8ZNT7pORBme?=
 =?us-ascii?Q?1Rwn0lQoWfwjysh87RPuQN59KspvJYLpheIIMFegandQ6p/iphXZGGnYcEq6?=
 =?us-ascii?Q?cJwrL/21oAaN9IwRRktftN9dihr7gLU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c73b715-ca45-404f-af41-08de6a1498fb
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:56:24.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXhPY1PLbIHRJ2UFv4gl4F4P6tYem1u7kEy7F9E//mDHUJltYqiVYJMfatzanOtqxGHH3reMcaZEjQJYWJwyrYr67L5Hz0BqUeQI/FKPNVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698d95bb cx=c_pps
 a=Ik8WVU4vKgjy7N2tmpohTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=05Hob7ThuRihMCB_SpcA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NSBTYWx0ZWRfX5TnrwptG/G0V
 8Y/RiwDWLByjaf3Hj+7QyHx1M6e9xgQ1UPD7m12esHFnj9eEHs7RWQNgpmwTSRuHy42P/5ehGA9
 +2m7n91r72kA/7vaRSatuQuFBy2Ihz2CDnekbe4FfQXH1utXsKiL2S++B7ZPxPBrZc2Aa8d8OaF
 T/1eogLHcwGPRvNDVC/MUze3LhWMGzds/Jap5CgDGKIPAUBezfrqS31ey8s/+hoYVNVz7SIFf+o
 y04/DVfh1aoop0OT9o5XQWXI66ZPlZlTpxYZlkCJSU2DMCCLD5xwvuKemHgRtFTzQrly3HxDdw7
 YtZpXjsUr4cdTsEnNiHxCG9CH1tTHRdIcJw9e9j/jTLft+YEGFcwYuUPgiGuhIKRrEbI8Hwx25n
 twrtd1/R8p+9tOxrNRcMGDAEMT2/fOu2TmJDBSBUieUDjgDRekCqvd9RXlqMn7y7vh53bpzEsTp
 iHNqF6iRQ3G+sglvilQ==
X-Proofpoint-GUID: gCgadJqu7vWBPdnJJItFLzw4pVcrko-a
X-Proofpoint-ORIG-GUID: gCgadJqu7vWBPdnJJItFLzw4pVcrko-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52636-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,xs4all.nl,linux.intel.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6511912B983
X-Rspamd-Action: no action

When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod
ov5647), the cfe_async_complete callback is invoked again, causing
multiple issues:

1. KASAN use-after-free: The callback accesses the sensor subdevice
   that was freed during driver removal, triggering a use-after-free
   error
2. Double initialization: video_register_device() attempts to
   re-initialize the video_device kobject that is still registered,
   causing "tried to init an initialized object" warnings

Fix this by:
- Moving video node registration from cfe_async_complete() to
  cfe_probe(), ensuring video devices are registered only once
  during driver initialization
- Implementing cfe_async_unbind() callback to clear the sensor
  pointer when the subdevice is unbound, preventing access to
  freed memory

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

Changes in V2:
  Register video nodes at probe time. I've also updated the commit log; some
  descriptions in version V1 were inaccurate. This patch resolves the following issues.

  1. KASAN use-after-free: The callback accesses the sensor subdevice
     that was freed during driver removal, triggering a use-after-free
     error

     KASAN: slab-use-after-free in cfe_async_complete+0x3a8/0x470 [rp1_cfe]
     Read of size 2 at addr ffff0001182fa0b8 by task insmod/742

     Call trace:
      cfe_async_complete+0x3a8/0x470 [rp1_cfe]
      v4l2_async_nf_try_complete+0xec/0x140 [v4l2_async]
      __v4l2_async_register_subdev+0x13c/0x3d0 [v4l2_async]
      v4l2_async_register_subdev_sensor+0x144/0x278 [v4l2_fwnode]
      ov5647_probe+0xa28/0xd80 [ov5647]

      Allocated by task 220:
      ov5647_probe+0xc4/0xd80 [ov5647]

      Freed by task 737:
      i2c_device_remove+0x88/0x190
      ov5647_driver_exit+0x18/0x48 [ov5647]

  2. Double initialization: video_register_device() attempts to
     re-initialize the video_device kobject that is still registered,
     causing "tried to init an initialized object" warnings

Link to V1: https://patchwork.linuxtv.org/project/linux-media/patch/20260211034501.1815035-1-xiaolei.wang@windriver.com/

 .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 39 ++++++++++++-------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 62dca76b468d..c6ba71d1f0d7 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2151,31 +2151,19 @@ static int cfe_probe_complete(struct cfe_device *cfe)
 
 	cfe->v4l2_dev.notify = cfe_notify;
 
-	for (unsigned int i = 0; i < NUM_NODES; i++) {
-		ret = cfe_register_node(cfe, i);
-		if (ret) {
-			cfe_err(cfe, "Unable to register video node %u.\n", i);
-			goto unregister;
-		}
-	}
-
 	ret = cfe_link_node_pads(cfe);
 	if (ret) {
 		cfe_err(cfe, "Unable to link node pads.\n");
-		goto unregister;
+		return ret;
 	}
 
 	ret = v4l2_device_register_subdev_nodes(&cfe->v4l2_dev);
 	if (ret) {
 		cfe_err(cfe, "Unable to register subdev nodes.\n");
-		goto unregister;
+		return ret;
 	}
 
 	return 0;
-
-unregister:
-	cfe_unregister_nodes(cfe);
-	return ret;
 }
 
 static int cfe_async_bound(struct v4l2_async_notifier *notifier,
@@ -2204,8 +2192,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
 	return cfe_probe_complete(cfe);
 }
 
+static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *subdev,
+			     struct v4l2_async_connection *asd)
+{
+	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
+
+	cfe->source_sd = NULL;
+	cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
+}
+
 static const struct v4l2_async_notifier_operations cfe_async_ops = {
 	.bound = cfe_async_bound,
+	.unbind = cfe_async_unbind,
 	.complete = cfe_async_complete,
 };
 
@@ -2243,6 +2242,14 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
 	cfe->csi2.dphy.max_lanes = ep.bus.mipi_csi2.num_data_lanes;
 	cfe->csi2.bus_flags = ep.bus.mipi_csi2.flags;
 
+	for (unsigned int i = 0; i < NUM_NODES; i++) {
+		ret = cfe_register_node(cfe, i);
+		if (ret) {
+			cfe_err(cfe, "Unable to register video node %u.\n", i);
+			goto err_unregister;
+		}
+	}
+
 	/* Initialize and register the async notifier. */
 	v4l2_async_nf_init(&cfe->notifier, &cfe->v4l2_dev);
 	cfe->notifier.ops = &cfe_async_ops;
@@ -2252,7 +2259,7 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		cfe_err(cfe, "Error adding subdevice: %d\n", ret);
-		goto err_put_local_fwnode;
+		goto err_unregister;
 	}
 
 	ret = v4l2_async_nf_register(&cfe->notifier);
@@ -2267,6 +2274,8 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
 
 err_nf_cleanup:
 	v4l2_async_nf_cleanup(&cfe->notifier);
+err_unregister:
+	cfe_unregister_nodes(cfe);
 err_put_local_fwnode:
 	fwnode_handle_put(local_ep_fwnode);
 
-- 
2.43.0


