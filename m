Return-Path: <linux-media+bounces-48113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CBC9DB8C
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273E13A7BCD
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8A273D66;
	Wed,  3 Dec 2025 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="GAWP5UmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCEE1F91D6;
	Wed,  3 Dec 2025 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735013; cv=fail; b=VmkdgPBlDONF9jQSNEAPJqufXKYbtAELGasm6oNP9/Ed9ZLLXcH57j0VmQTnAV/57RKtk3DMRriliGbLUmFUDRf9+Mg6N/Eyh4egNsCGxkcqGKSlvcDj2F2477ie/JTM+17ZxiQ6dGRmIcOMBOUKWwoRKDNbhm6NF4aTWTtaBOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735013; c=relaxed/simple;
	bh=ou0NtfYP2ReJ/eAjSkKIKQJsUvD1IvXWVc9jSL7cU0o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZCrJPabBIwaHdEc3gwmTMRIJG/BsM0Q126WMtaLJPH18oTON0t9vLeddgUJebPkNGgjNlmbf5HYGt72i7M/nGehkNuNrGdqyRW58RR8HiW+sTJqEVk7yJXxb37ijV+H9Y6a87/CNaqqmPkiaotU5Iba7KYSEGSXo/26IIoCyjDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=GAWP5UmI; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B32opGc2307635;
	Wed, 3 Dec 2025 04:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CerEHIgTj
	S0UV1KIqoScdl43NO+Sp8ELCmj98BMCj3I=; b=GAWP5UmIOcIh/ZabRTnxUNvIW
	J4pJAkLaJSNPKCPU/CxEwpDRpD5UjrRPzD+qbvmhYoSr8Jv6yVuti6eCqaIDfYGe
	ZI8fd+kZKeNmR/K25ax46cTuQOINQLUVCOEAkxZEwUXYh2nG6dJvzH8RJX7ipMCY
	ekF18NwOIgFnpGbXlyb8k5Rm8YYjWY9Rl/lguvbPN3M9FMMjgwM6jhztESWWh09Z
	XFWrPTphVgB9WBjVMF7j1e/bVnlo7sNQ57/BCxuW+5DX77v8viuZaGYTxbNubE+Z
	OVEYWTtCnIbkgk3rtxGZ2AI+FQhpeHq+4fhPCQBLJnv9XGve9vJqPPc/qmDjw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6c95g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 04:09:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6eWCRSa284Cco46zdBB6o7faK2lVtapxLDnMExX3MulCdqG5n8eFCd6WKS8pX7O/hqVIVBFrtjZHJ2KBg6iIFaqjBY36rydHxlyynpMudZD2AgorBNAaF2up2w8WxTMDlShwPNoXVDq1PpWAQ9u4TkLs5/pm99qL7FCOk5IT6sQ5QSb4JX7t67zFS7B4WbfnEis6vXTKxsEq3Y70adKnGbqtUs9xrwTwojB+WNU4I1uG+sWAvs8AHrbaKJ9eCyokc1TBGRrNMC5ElOA9GRUCXKUsG/Kthpo7cpxCLf53LnladfwvdetI6hoSDdc7M0yvp07YeandcV8wHlTQv7g1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CerEHIgTjS0UV1KIqoScdl43NO+Sp8ELCmj98BMCj3I=;
 b=Ozm/KGpKTzVCGsKUXWBbAAC31Mnp/sjmwB3h5CFMC9yzGchwnWDGqqMTseZ21iHtAsEGNi9R4qlieeoqD3rojZdBPuJLILB1fpg0nVsUpjah54dkWXRENHEHI4HjyvAS64952a0uK2sBhTPsAM2A/hDmy7MHhll//i9De9TdvzxtFdEAXDE6K0k6ahFxQ6pkQv22veG5+ThHICI3IEnT5FNKbm5U17eG4V/i1Y2EHBiI1/V28KKE8OgWqzmtgVLdQjf/Q+Djfs7WKnRPV3Gxist2ue0H1/Q0X/JbMw6pwq9XUFVbyqeZ6re0Zl6x3bVmjuXWgw3ut2XY69Q/9q3TRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 04:09:47 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:09:46 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        xulin.sun@windriver.com
Subject: [PATCH 0/3] media: wave5: Fix critical issues in driver remove path
Date: Wed,  3 Dec 2025 12:09:32 +0800
Message-ID: <20251203040935.2685490-1-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ea8ed9-6e6a-4b6e-9e8b-08de3221cbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HCHOoqDQwV6IUzdgJKI2qoN8Mq9ejYPwwGAPmvsBHGnqvFDIxQ7znhfDHuVe?=
 =?us-ascii?Q?cvdxAY1e/rR/XLcgWiqG5MHkU2VxrE7+2fGgERWv+1RIS1N9SfPpZJntGCR3?=
 =?us-ascii?Q?tbwgfL96M7ZwUWF7JRSiPPIKAvXwOOaHmCH1yEKpav8FT4aEKpJq1mcSG8QN?=
 =?us-ascii?Q?k3ymIoqSjsoUFhj0YKkrnWelWY6z3ZQZZrwaRtDwyd0x+feShYh4DwZkoO6f?=
 =?us-ascii?Q?ankWvaWW0uNS5SM3tRH3hoU+WM9FEf8SP0NdumzIGLZHD8gWm616zbKHOgDV?=
 =?us-ascii?Q?yDoqogCyHsHnwZDO6QC9hKYWzRsmPBMeuQqgHFf+7aJ2ROVAu0re6vnnJeyo?=
 =?us-ascii?Q?UreRyCz9p8eUmuxK4PNbv8rD/GIq2Mxo1Xj9IPFuqyYB+dpoIpbEOH+v2k2Z?=
 =?us-ascii?Q?N3oYq210+xwd0SHF9CnY8oS9+eeazs8rvYP6ZEuJPWfIZFSyULASMMty0WfM?=
 =?us-ascii?Q?L8hVr+jG3ga+r/oojXAIPalUGROW0R27HQTi24o8KDS2UEte6B1icfmM7ffy?=
 =?us-ascii?Q?EJ89budkrRCYIwlwqJ2uNJ1sgdm49vEq3WshltTs0087vqNc3x1KumM2LdG1?=
 =?us-ascii?Q?1tEYk5Vh0ug+Awy1ZSriYiiE0P4oxSvuAdC4MDxByu24vipiJ0/+rXIOorGM?=
 =?us-ascii?Q?tWdHvua9W6NdzsMfenfF5C0D8Veb+uuCqLcqCCfri6hqmHIkUO+ou4LCwAEM?=
 =?us-ascii?Q?HelGVvrSJZ6GQHQ2WX7I47sgnNd6vW0AlqZvIJp5mluyv5cG9xAYKdDpYyz5?=
 =?us-ascii?Q?Nx3P+8h7STwtij0df/f7jWKtrJcQ8Dk7u0mO9HBw8+cvIp+tvccwBdvzwapo?=
 =?us-ascii?Q?HMvnhr9+4nObEtNmH7qX5MhY/7vmf24V4jFgqsrBggXHjhiu8WQUBoUUx56M?=
 =?us-ascii?Q?vgwe4LWU/RkDaVjCQQ8qRugCby63ZgS3KFU2d5cd8hk3O2Ur1tJZaaysbJTv?=
 =?us-ascii?Q?UHYivtTyn7SnhQRYPcz5F8SbSv753U+isZzl7Jh2PdSY06WEjqwZuUo2Wxqf?=
 =?us-ascii?Q?pRFEWClZ+L+TJpGFeTRnZQgplXXfWBuMkwzbYfWTrOy/AqOunptztCrvNMHs?=
 =?us-ascii?Q?1d16RF/I0//HwDCdsfo+yruhBmwHrRLF2wknLLc2AENEPULoYhHpUDdCFb0V?=
 =?us-ascii?Q?nlsZSCQoADq//re+ZnZ9RxYSLeE01Yps1Sko8nMUYfeMlog7B+Jp/Jct9Mar?=
 =?us-ascii?Q?pS/abargpA4M+A8+ws69qnjJtm2L79b1iG+fPXtG8Ek1EEP7ViKNWihmuNJ9?=
 =?us-ascii?Q?dKoOERoyz+bZ7Ebs2a2LdEOobYhgDTqR0lNGdsBpn/jYDI+e8jP7BX4wh8j3?=
 =?us-ascii?Q?hzD+D1xeeAkkFYelB38kIhZEoBWQUT8mQEAING8ZZvve8Znk0EYxsDTMLqwf?=
 =?us-ascii?Q?CvDcuqoHdVKfDiyIpL118EW9o+rM+VPDsPgxxihm3Qs1aSpdqmER4uO1eKLr?=
 =?us-ascii?Q?xQYjdVUcNKpbdY5MI1TfvF50L1qrwHRTgocM5AXhBwN9oZ6bLQRSjl3T/7PM?=
 =?us-ascii?Q?EtPRlJhRfRKpzYWzXuWs2DOrpSEB40A96k0G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?88RLaELa0VgLGCd11NjS8ufZ+FGj4jd1YjH+tHDXwqrNrxpVWVs+VWK/rbCq?=
 =?us-ascii?Q?L8jxGLXTSSvUm4Bm70GNSae5EEDx62yWTLxmK0x1+uGmbVgbJiAx5e4+mAeU?=
 =?us-ascii?Q?SlYwZ+t22hrfHdxmMZJsOj42JwDvpkVxlIJy0cxkqxWTi5evlQC+xwp8a4WJ?=
 =?us-ascii?Q?EHEJkW4Zm3MR23d1DuH8Di5jnOgdL/TX/8DQZ+ZOTr7s9Dd7K3hh7O4oAxfo?=
 =?us-ascii?Q?ng/5XM3kJb7DcNf8yZZJfH9W6qog9U0WelzfNEzAMTRLrIXOMOf1N0vgYVE0?=
 =?us-ascii?Q?CYlreP96kT1QABE3U5D7SD6YNVpOjqOYvWjNyF8a2UOsAB74XPnNQ+Gp3Kju?=
 =?us-ascii?Q?qr64B5IYjompBKhIMtyjCx3hc9Cga6Ey6SEs4mQ9UNa5OoB07iSx47cnkOl1?=
 =?us-ascii?Q?03g7Eih4jgyhPmvbzD/uhTVyM/PPr6cO7xr6whDewkOmJ68LLSpYBYEnlpeH?=
 =?us-ascii?Q?VvpzSOmejCnrqTR4c/cibF8R7DzAMSS0yaRB4Efmz+WZzMdfqGBPzUgAvr0T?=
 =?us-ascii?Q?gXKjRRDqwKDl7CZeBekclfjzM0RI1+Wn+pWI1bSCBeKMW+Prp+syaA+YWZXe?=
 =?us-ascii?Q?PIC4qX9SQyxSI4z+2OQzqdcaWMalJel9dqs5GTE89jN59h8QD6GlPo8FQT5m?=
 =?us-ascii?Q?Ym/v5mhZyV6z7fmOhbfC88DttYLiOAmAPYCXxQXMMJfPY/tHb+RjgHassTee?=
 =?us-ascii?Q?M0R5hHbTrForHsi+IW5Rm59OePW19jP/XIj/XDNJ21ebzL7IBS2pL7xwRU/h?=
 =?us-ascii?Q?m1E1rWjtWgXtbkbjp4527XQwBcacsmokeoqtQ1c4kYhOf+P/xmWEijgP65Al?=
 =?us-ascii?Q?5nIuT3W7RXuC4a9+lrSEiolSJ8Y6rb7Q6i7iuk2B10NWWnBuSXcpVrKuWY0u?=
 =?us-ascii?Q?gqeWRuAQLZFs9aFg5xKPtp3+lG51EnMOnVL7wslD43ZolpkP4qKJo+db+6DE?=
 =?us-ascii?Q?/A0n1OnvdC7FxziRwFE9HtsqYH5r82CqkZhyFA5T6l7kfKk+vQFqJEn31iP8?=
 =?us-ascii?Q?RKCpFfyZfyh0a2fzLpdlnKKl6ti9JMqlRZ413Yj7hhfCmbo5bkvj0u/D2TrB?=
 =?us-ascii?Q?U+Ys74WpvLCT/ZiCrVunkn91NJesmegQApBdCrdl3hJxOrrZcI2I3qx79vQh?=
 =?us-ascii?Q?TVLzmanmHrtYkc8fqgynCa7ZcAScP2jOvnzgc2Qf1OIxUluknEhXLRlDMMzU?=
 =?us-ascii?Q?87/dDenAWWou/lEkpQWROPDd+1GR/WR2TsxV3WIhlb8ereakMKNKu2hWdvTj?=
 =?us-ascii?Q?kvNyaN6B7F/A8ukfrlQLgMrHQBntAsRHlpkj3FlEgq3iNg9m3gx3f6sWJ6b8?=
 =?us-ascii?Q?oyAJjx70PnnpPrJHe96ckbMju3pD7KV2JJ8QHHGLXm8Z0Q/BQCnIZwVYCY5k?=
 =?us-ascii?Q?JUiCTEggHRDEwLQT8/ZK1ES587DLpUjx0QepsVnvsHlevZq88eTEItRUIGfz?=
 =?us-ascii?Q?zuliSnbtw0gCpZX2ZkAC1tb+UDlVL1ylBUOxxkeeO4AO+1YuqKXe/xcAjhqr?=
 =?us-ascii?Q?BuiO5v0AJCIwmaqYTFgdXhouvQPmzUPWhINxD1tLusKwLF+jBK09arNoL4kD?=
 =?us-ascii?Q?PRh3oSGMr0xWwJzeGfi+j1RrmlLAuaLrZrnU27EI6v4PvTQIr/ShNgpmsS85?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ea8ed9-6e6a-4b6e-9e8b-08de3221cbbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:09:46.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZzUFz6e0aiA/tGojCJ8/LzR1MTuA23e7hI7dOJlZhis503+KS7fkkGDqQ3DPrFd5AwJlD41i2emsm9+UFSzLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMCBTYWx0ZWRfX1Avx9IRYqziY
 cGcJx3D0pPZ6k9qI9duY89ht6LQr5N7DBxDqJER1DcgKTBYbed4BkW2DfAukjmIyNwk80GoSSC+
 fwEppH3QflDFpjp45C0nXd11kEKORXtyAFn6+1TxbmaQqWRYV8u/6tXN0qjEonmRaCf44hAKsSc
 b/8FbcH8PVUejyLvwoFmitaUebWJnJVTz7psbT/jvsBgViz8WBieRoQqVkiprsx+hkUYhRP5Uou
 3Y2DJxhEah7vuNjdMw0oGXL26FXttRydCt+ro65FMvZ4aZlVtHNnr4dlRPaJYD6NT3ge+dk4Map
 U7syyclMfalXr3cCk97+AhjFhttCADbju0yAN4z+glSR7giXf5yn/YvyqwrYgHDFiGUyAh0cwOf
 pQQPixYT+e4KltWcVj0elG350xfIPg==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692fb80e cx=c_pps
 a=/jEiNo7mPoItVXs2NspnyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KqZzv8Zscl-aSvcBOYQA:9
X-Proofpoint-ORIG-GUID: vJFSZr2NYCO8Gv_mw0Q7b380oKrcZztk
X-Proofpoint-GUID: vJFSZr2NYCO8Gv_mw0Q7b380oKrcZztk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030030

This patch series fixes three critical issues in the wave5 VPU driver's
remove path that cause kernel warnings and system crashes.

The issues were discovered and consistently reproduced on kernel 6.12.58-rt6
with the TI AM62A platform. While testing on kernel 6.18 shows the issues
are harder to trigger, the underlying logic problems still exist in the code.

Patch 1: Fixes PM runtime reference count underflow
Patch 2: Fixes kthread worker destruction warning  
Patch 3: Fixes kernel panic due to incorrect cleanup order

All patches have been tested with 50+ consecutive encoding operations and
multiple modprobe/rmmod cycles without any warnings or crashes on 6.12.58-rt6.

Xulin Sun (3):
  media: wave5: Fix PM runtime usage count underflow
  media: wave5: Fix kthread worker destruction in polling mode
  media: wave5: Fix device cleanup order to prevent kernel panic

 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.49.1


