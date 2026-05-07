Return-Path: <linux-media+bounces-60706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD4HAckR/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:15:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEC4E2D2F
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E44603022A9D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FD732470E;
	Thu,  7 May 2026 04:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="dm/HLCdC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B9031AAB8;
	Thu,  7 May 2026 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127259; cv=fail; b=OUI82npjhNfqfwzEikXGjGAGa32YCpc6S6K8kCXile3+kFlPD+TRtpoxcawsb3LmQkdU4lVqCh1KfhF8UGhfLbPOCPvCcmE3WMpV+wMHiDGVLKWrCRnWxvNr14OHHhnGV4313TpfxAgFxLPuXpwiLcnmtDN2KfDaPpjqBeXCXZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127259; c=relaxed/simple;
	bh=NReLV5uJgk/1oaG9/cbGuT89xqoj5CNaK+Yc+V63xQw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t+bZYBDSP9bHRcAgiF9NgMIgkDbwyYokumVxehhtsSaKT6grpFTR61mjxBYozTnn3aAnb9a2jqXgmiK+vwH6zZB2USnN13Qpj7zE2tozufL95SNNZmEuBA6KI3u/0eLac4iFzfpFaFfwayDm+nz8K23zL/OtVZcTXF9vlvVk2hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dm/HLCdC; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474DjSL3703407;
	Wed, 6 May 2026 21:13:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=k9QCG9B8D
	rCCI3F0XX6XzP7AvSh81+2kVnzhDqLjcJ8=; b=dm/HLCdC+h19Ic+xIsHpG8aD4
	SvMIvTWMT3nZIthhYn9IwRhwDYyP73cj0zfgqdDnvujVpC8y4Yynn0CT1FEt4daA
	qVBTHAFmwbOSURPuLw6/ONCPyfeT9aOgwhrik6Drgt8KpOBOhdkH0tPq7pXvv8fc
	OMpknwvsZTcD/6g6nIj4dgXk74r119G9AwATZ80XbbwBFeZeZAYMQ8izsjbTeMSS
	hODef8dZXjbueL89aHhGUXPqJW6bw4xn8GC9ufonjW9izspPMH5gtOWpmq5rldTM
	7a6NpjXkjenIFyjHhodcra5U6dcXewih4YCGv924lO63zSaqllRy4RruMoU3w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddpsr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 21:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYfIVfGzGLDLSeHtfQpTuzTHnthfZfZQPF5abQeWxeI5OlngGlDv3oXnzTYTgtzG9i4hKWMPkIr5LkQLi753LgvB2kg+Y0Gzc/M80mtDgBH6zreLy/6BgUbdSsjdkUx6GudlC+W+LGPNTWeoPawsYPYnWCHqyg/0gAkuF0Rwc+609BTWdtEkv7/bcjfzBTommRHjEhOAOn9wSFuNHR2GMIZSzvhtEWrmxj6BX9/ToRmrCI7f3sW/mCju5eyIAwsL58+AgSondGOR8gjvhdC8x57S5sRLdev00jBDd4aCVwIhN7ZMKqgnEWeophBTRsTl/rWuFRIR7idQhtZoyPfkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9QCG9B8DrCCI3F0XX6XzP7AvSh81+2kVnzhDqLjcJ8=;
 b=OA5ydSaIlnxzoYtjzCHIgib4nrQtpIXM0sxAQlCPaNGye0XxzZ9zsWRI+LCEpjiKuzLaobfubg6Ri9OiQcXCIg9nfvJWCOMZKqt5EJdxECnXfRsp4EKywcE+97GE02PCutaIWE5rLW9uAErl93JXjPWvHgrvSbAGffFhw6Ja8ck4wSIcDKWNJEyq0UYm4ZqBZjCPRBy587G3YEo9rMBaZAPcLcvvgBR/JZ2mZqrJh39brGGxDCqLRA4Dwvr3eYaZA+q1pGUzIuxjW3nL7XhXB4fARMAFn3DL/q0vpLLg3RGNgqZ4kiRoejp9R/7EOUl9SCbDezFUnuXn73+QHd1BqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:13:41 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 04:13:41 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v3 0/4] media: imx8-isi: fix resource cleanup issues
Date: Thu,  7 May 2026 12:13:14 +0800
Message-ID: <20260507041318.491594-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: d83907f9-eb5f-4ee1-7516-08deabef0551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|56012099003|38350700014|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	tN6bIFPiQfk6aAjHU/zpHYmw93VzRD2vXIY+c9IZru/XKab6vRc9l7bvB6e2Xjs0rwr0KRytfc4fc2pqOt9adVPQH2jLemJ4pq7RA18GtNhqZIVzwXk3EsYyM75tqZvjOFo6YPxp0fnnBW7uBvHnYc+V/Qlx5ANeyJwRsMUdEUpAq6JesfktI741t3JCL46LugATxwvM0JVtRzLp5bgayZ+76YHuNw/GH66TWF3E3bxBsbceO8FAW8XmXj1DMs2Eg0w/FUdutaBxkDeXd96sapjt3Tsr6bHAAX4fhlf0A9PCBgsHwMjF6QrgezsvHtA2CVqMeevItMoNHcw6ooDr7y98JEGZ35tSZ7yBVLtTblZ7ep2zFDGuLBSYMt9xvhJeqb0Xfa7WcF4VWBk6K2jIX1o/Z8Xqvfu1gQ6KnHEv7N6IukgGo+ebEhUl3daEdOY0jep2dboTgBNB0hl8CJuh2ERQJdZO//csGUtJs4RpYyD8UE0yq6Yks+Tv0bvnZnqrTHfzdB0kf+Cb4G934N16zFK7yiqHbXrOeWfgIF1euD4q1fbUBu9FPwj7UCj5t1p0UWxu/ZS1UCIrWiTxX9UtRfE/65h8CVXlrPwUchpGrgiQvjwmse9yOw0zpOU0eBjkMe3vl5hmCyEa+uBrzBIlyESDNa8AmlxY28YKGP5A/K2TdVIO13hfYo5iGtKP01gq5/Em3rtOD0ZrXul8nY1ok7GqfgnSVdqU7OnPXzTHtmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(56012099003)(38350700014)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pxVdlSlg7LBrOO6rOk29g1eiBs+2+Z6H/RRDP7pG+RmgMTenZrxz0lDtlvFl?=
 =?us-ascii?Q?gq8BhfLJ9msb3PaWHIdc5dh6RplJdzMKKtUDGvca9tNkjegpzbfNM8EUNK6b?=
 =?us-ascii?Q?7RWBLKJp6bZ17Z+VfI/SrCXuEm/SNr1YaPx/c7PE/JOfbTNOmh4O6DOuUF+E?=
 =?us-ascii?Q?86RlzH06cSpqNHZ9OnfKWwWBKu+1KFQY4NWSubkGODM8Z9++ZkkGjVy4UlZ5?=
 =?us-ascii?Q?V+K2DypyIWBmHEQNkcVeiKiDPeCFQT92T9aIoVJ/H09Sb0KGt+sTqhpx9GDm?=
 =?us-ascii?Q?+lAcTQl5mKfJUobztg0kNknW3Z/+aRim6CUefHw8zFmyRt2ZCQ2S3/DOVFPH?=
 =?us-ascii?Q?rtZUYAvVbRzqEMxAp2rQFgYo6JkpVrS+NyyhfL12MXUhnbtrOKbiaaOC0zBI?=
 =?us-ascii?Q?aactwBHwtAHZjNyNz0HOM8fbyCD55WI1hP+vDNtStfkUxkoJlu4D8N+Ivmv2?=
 =?us-ascii?Q?nipJCrFJhuNaip9n46MeBzgCyqgEVXcBEevgkzBwd/8SiJvHHzXaClxGW+UK?=
 =?us-ascii?Q?vsApnrc0VOkwsG4b5tCCOFCtJ+/C/YuxaTfK383nDkp0usp1MP/Xc8P052Ac?=
 =?us-ascii?Q?CKfl8MOAjJSo3ityG4OdVCfpb6+ptVjk3mxJJmumEBfT1IkZyix3aQIQ0dCn?=
 =?us-ascii?Q?IQ98fNCmJemhoo1dAKG27JUzrXimIak0Zx5FlICbNYNXQwNEeeFGNr+6BymQ?=
 =?us-ascii?Q?xrQIJN60pwQpt93UeBR/CxDy/q0uAotCIYWfk3qgaTTiAqcTFOj01drdKBn3?=
 =?us-ascii?Q?CudkjRyaevfYjXnFI1G00DtgBwbu80iwXgvEVe4baz/rqdHnvePOzAN7J7GN?=
 =?us-ascii?Q?mtsn0PJPBizte+yHaMz/sbKlE6WKmRUWopIPIMue22l6NEJvCGFTNJsR4Y+o?=
 =?us-ascii?Q?nrZRTmetSuWg4BdVL3NmDyB0FW13MSNTxsxDW/TNad17kGHjrd+I28Dfx5+D?=
 =?us-ascii?Q?yRQydF1j6Zc7+weSRZIEFhL9LYQhV1q2KAba5LPpDLb86RAY5W142JIGMF3E?=
 =?us-ascii?Q?9Db8MW9OSRSHJWqCL7hpxh9NPRrfOD6R+CmUdI4kPbNdWsdJ/EC3AAc1Plzo?=
 =?us-ascii?Q?Xk5slre96KOEHB6B4evWg8lZo9VTzWO7ttk5xNXXxS7ReCqnjjWnp++Aex+h?=
 =?us-ascii?Q?vdM+tlafmrVDrvOukNiDbfwsZyyvriV6pChhZPdZ6pMCCEn8hUZhIPfbYTfb?=
 =?us-ascii?Q?alUfj6ClePGa7VoSOlV8b8DAIkO++/cSI/1xZRmrLiyFKGMKKU3HGU8zmA4l?=
 =?us-ascii?Q?eMzSsZEsq50qP7JOycDIMp4mO26wwBv7ObsHZNtNtQmgb98zWzoE0iKnQfTC?=
 =?us-ascii?Q?lp7J/uPRct+N8WS+pyb2fuWK1WcuH3UhYjGGp5mc3/Lnh4wCYfuzBWtZc3tN?=
 =?us-ascii?Q?R6zqS/rM7BjQ91TRiPNaKxAjVravB86DevbXsZ8ebAkt35DsEz+jkb5dR/qA?=
 =?us-ascii?Q?0m0CQiIKR5gJgTCAXrCdgjVCBrZCDwHHGXEEp1ayRo2ImRvLB4sW/Pky3WTv?=
 =?us-ascii?Q?biRPAci8hWTwa7MXW7WGWahwNfqm/pGfPLKk+n5TBY29wsFhBTi3elF+otdA?=
 =?us-ascii?Q?1uQctfCKIBGC+AqY2BReGQrcVQMuhnNC++nn84D/CmvksxSmIy3nyAYmEAou?=
 =?us-ascii?Q?/i3x2q5vJjUkTqbH2/R+vglcgcANB6EV7aFOIZmbURcaacfFow/dKKB2nG9a?=
 =?us-ascii?Q?V4GTEYpv1oG3ygHlZJrKwEJCCsxXg9PizJi6bfSDOdsy7iVQjlA5Idm1iI5B?=
 =?us-ascii?Q?mr5btLe3X/glz28eAIZxudHTaJbYQGg=3D?=
X-Exchange-RoutingPolicyChecked:
	mbdk9Od9t830rB98BeVMtq9Q64mBfbVVsLcMeQG6RuU84A8fW+6SgEPwl3zrNYjsj2yBco4lH4VitB9VcvSpf0LhBi7djSo3yeCCCLLuneMEtjsYbDXZ/7Ns67UQ1bJPoseFo9N++fktM/Hl36HwOsT23HIGEtM3HgZjr5ZPV31J45iRKFX/pjk2Jvp1ky2JG7RNG2HeZ2X7R5tyinDQPRsnXNs9fN6MSNM89Hg23YnQKgOLKhvl/JXfmHT9hESeAG+GQnZ6ylDsCLYsqlHRt8SKhLEsHA7j91V8zHe9yXtHW/wsjcQpk1XTP5XqSZCyXKPCkU4VlhRm2Worva5ZPw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83907f9-eb5f-4ee1-7516-08deabef0551
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:13:41.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGAe7x4U/W+KPJpAKB25IRK6xlWm8OeBbsW4s5XPBPyhXoeMRtfgMZG1my75xagANblsWYAkYxkkDwKLzwIAuyjD8m4W8w9ipKFmSDM07ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-GUID: faTGYQE7hjDIjgQ17z0F63voGnQVBREH
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc1178 cx=c_pps
 a=62XUoh1M8q72LGroxeb6lQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=qQznHyr8lgLhnR85-fIA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: faTGYQE7hjDIjgQ17z0F63voGnQVBREH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzOCBTYWx0ZWRfXwNgltL9wGn1K
 CrXvxt9sp812OBdWbYEXePd5sv/XDyXnx3LKol4oFedd4ANABxf5O6/M9LCxrpD8PJdnjUyCbf5
 uZJ2SxJRqwYaajcIn/JKIc5mh1r08oCcoY3FEHihCBftp5kDcXE0AAiQLPow1P5WBNRkW/ma7Zv
 v/osWuQaX66eIqZOXxQRhDQo9FdPAW/QvtUUBfQ6YcFGChKnGJrWuLp9cWSOnxTCCv2t9+GUh6D
 Pe9jIrwayJKWLxkDDV9f7pC96dopqArvu0QsWLaSbCe4Ybm4mIYRqg9fIUAOkB24YtFH3peYXwQ
 XE1DDpPfLjkNO8GBnq/tLKi5//AQn9Efgfxq3GvpFQzDOGIGb5ubOJeYJVqG1Dk3MQU+g0FmmiH
 rrsL91TD+SXSJPp0BJdBWO6b36WwL4OAV00DwkIPGzWKDfx9059zvzqU6zPrzPvb8N5XN6rV/zo
 gW73NpzZ+J6fkqXzcHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070038
X-Rspamd-Queue-Id: 84DEC4E2D2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60706-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series fixes several resource management bugs in the imx8-isi driver:

- A use-after-free triggered during rmmod because crossbar pads were
  freed before media links referencing them were removed.
- A memory leak of subdev active state due to missing
  v4l2_subdev_cleanup() calls in crossbar and pipe cleanup paths.
- A memory leak of isi->pipes on probe failure and normal unbind.
- Missing cleanup of already-initialized pipes when probe fails
  partway through the channel loop or during v4l2 init.

All four issues trace back to the original driver introduction in
cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver").

Changes in V3:
  - Dropped the kzalloc_objs() to devm_kcalloc() conversion patch, as there is
    ongoing work to add devm_kzalloc_objs(). Will resend once it's available.
  - Added patch 3/4 to fix missing v4l2_subdev_cleanup() in pipe init error path.
  - Link to V2: https://patchwork.linuxtv.org/project/linux-media/cover/20260506031210.2769998-1-xiaolei.wang@windriver.com/

Changes in V2:
  - Split the previous patch 3 ("media: imx8-isi: fix isi->pipes memory leak
    in probe and remove") into two separate patches:
  - Patch 3/4: fix isi->pipes memory leak by switching to devm_kcalloc()
  - Patch 4/4: clean up already-initialized pipes on probe failure
  - Link to V1: https://patchwork.linuxtv.org/project/linux-media/cover/20260424231926.406079-1-xiaolei.wang@windriver.com/

Xiaolei Wang (4):
  media: imx8-isi: fix use-after-free on remove
  media: imx8-isi: add missing v4l2_subdev_cleanup() in crossbar and
    pipe
  media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup() in pipe init
    error path
  media: imx8-isi: clean up already-initialized pipes on probe failure

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c     | 4 +++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 7 +++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0


