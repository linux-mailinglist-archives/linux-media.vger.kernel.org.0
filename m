Return-Path: <linux-media+bounces-67038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5d8TNLZyTmrlMwIAu9opvQ
	(envelope-from <linux-media+bounces-67038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:54:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5A9728526
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:54:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=f6ApEFxc;
	dkim=pass header.d=ti.com header.s=selector1 header.b=qG4cHgJB;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67038-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67038-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE73331D7928
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DED93F12C8;
	Wed,  8 Jul 2026 15:24:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7133E360;
	Wed,  8 Jul 2026 15:24:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524243; cv=fail; b=hWqsxb+VQrKlJ3mRfE21lX5xfPlmazK6N025jEx8cWwBnDqsUcNUEgZbl8dhCxzdk1h1b9FDaDC2nZqUxoWuwj+ORjF2vAUsvDSABV67RT31m0F62pEu0UtLYlP/CEvXF/LXFmDurpDiXTKJ5zuEm1yd5fD32ddarCcoCVY/554=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524243; c=relaxed/simple;
	bh=ojQbpOga+KCDkiJ7zPFnBWUnBTMmXDdqFD32WrpRDng=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPf4hi0DQsFfmfJwH3cHwfOit/4HbzVlOgiMrgTq12IuUvtoCYNZiS1xDBsm6Mo7WHTr9uM82ZVfh0xuza5aH7Sq1Xqsh3LVQZEPJL+WkiFBwpv5RbvMJhef/w+7ITyfyg+Xr3/+r4RPkqR7dMFQMRHmhVcC2ZJHIdrcsyaYUOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=f6ApEFxc; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qG4cHgJB; arc=fail smtp.client-ip=148.163.150.75
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668EMHHx1592681;
	Wed, 8 Jul 2026 10:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=uFee7eK7JRuINoM
	XT5FEEu4xj/IyJu7z4qW70WyGEOo=; b=f6ApEFxc8OPs/gNwQhM3yvh5MRS+s/+
	0rshr2p184qkfqvoCwJCUobzyYXVoGshhHHTs7aKb/+gdixW08GqR/2sweUlGmtH
	73Ya3pt+gTfgEzdtisCk0Xa7OkfgIyT7mQH+spCz6ElMsm3WGnaTfkFqGhxk6XrH
	RJAWhKF5vJrrUHhx+4Q+ir7MwOsgHf2bdJTvoXDKXHBr/a03HM4UFRErWYlHSLTf
	yUDbRRYNTZSFvcjfUHzImt4fCFK1ZpIecYIOExMfVWxUvz7rTmaylScWngsuRXDa
	bZjdSOLicC7yd2uW57nz0w6dwFlNC2Qot/cjV1eFeo61o40d6kp7pIg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9nft1euu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 10:23:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay6hvu9ntEMxG14OO8pOr5p8aExSiKQs3l1G3rJXjEv4effjCL9avG+dNmQlemC27VmZLbbG3/85nYUin7dDQRIOZjt7OkV5MFGPgSaotLKjN/zyPAq7Q4jA1H6me8kOb1DZOKzCi50Yd+8o/c2XVSkt+nGvuD86E36WHVuNXjA43UwxHuAbBIr3O+V0VHJ63ySu3Lf42t5QAE4sKl93fefE5e43kOvPMWBX5RO+HpiwZxFCVRYkCQg29WLoYyfFM9oNlesYq4uJtemLYbKM51K8H8M28jQSmgH15QnnIuUpsW2JF9fgcRulVJsDkF2gWiryJRZ/alcC+VILbznHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFee7eK7JRuINoMXT5FEEu4xj/IyJu7z4qW70WyGEOo=;
 b=qQ4qTJJ5SPTtsdOJ/rDQFklgXc/tb999tU0IEN0HwcyoegBRYoRQfFas8Cj0tgkBNscOUlY5PUG9HUmCU35DY3bv4dQyHzBNYQElS0kCct6rhjtrDzFxutaGtwUjoBZQEPDDrjIG0B38C78PYj/8I/HFZA64RhoPf/kAVAEo82jp0pmuTWaG5XMNTNdoLXkXWrj/uqv8DXyOJtlCV/BqeM6eMQMao3iyqA50Gf9HG+ilpTyjHqkXoP7NUINf9Xv+WmtVkgRlsyPZNHEe24EYmSGgt/lhUR2AnK1vJ+d4TCdGrebm8k9DMDt/cseuw6bu3JUQIhehxqjT9ZFGErGUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFee7eK7JRuINoMXT5FEEu4xj/IyJu7z4qW70WyGEOo=;
 b=qG4cHgJBztqmcRNoq8TLU6zszEI0NaEo0kYxvizHPPXJBIwHEAXcBGUCka7lQiqtzBbtTSkz0XVPRu4ubVHtmTbYk4dxuqaRs4J9q9u0/6Qy8wZAiZ3gf+sE+xiyV8zCOMgTRLrUQec+9x9n6Ymfn0LebS3YIwGgXaCA6Es8BKU=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by IA3PR10MB8348.namprd10.prod.outlook.com (2603:10b6:208:581::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 15:23:50 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::e) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 15:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 15:23:48 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 10:23:43 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 10:23:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 10:23:43 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668FNhAa2508109;
	Wed, 8 Jul 2026 10:23:43 -0500
Date: Wed, 8 Jul 2026 10:23:43 -0500
From: Kendall Willis <k-willis@ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <linux-media@vger.kernel.org>, <b-brnich@ti.com>, <detheridge@ti.com>,
        "Nas Chung" <nas.chung@chipsnmedia.com>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Message-ID: <20260708152343.qu2yqxzafrcsx4pk@uda0506412>
References: <20260707201655.781174-1-t-lannynd@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260707201655.781174-1-t-lannynd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|IA3PR10MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afa3d33-3cc5-4ea9-4791-08dedd04e89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vchapv2gIum2JSWf1HH8G6ZCnAz4EerwCV+mfXIDJQPPO5OxAX17CE+56/mae0qRgxiWMDLCOepsdUwYwmA3whpWGyY4adxgaW8/46/XNsSz2o93xg4FFWL2n/ymI5rinKjsYE+WK6yKBmnG6zwGBxHUeEuEi0BXUOTZ3LeO5B4CvmvPQg+KbcYsOaT/1Sa5uDgyQ3c/SHrwjpabv48sUyAVEV21glR+DG2u4C/C3zma5XnvHWTyEd6kPaElOZGmfkQh6vry+SttHoLgplKsMBvuwdXVHdXR/jTCUvqLC2Q0eHWUYCLdBMtSRAO+AhK+bZ7pEF9hMUEcUd1B9hOdPMe/UTpdF23SUzdBEhE4nHXXHfyRWE5zqJF8354ltrEVHWoMawmvUp3iXqJyMFpkjLFKhw2HOvHYhpM32KLYpy12tShTPmHAJhVn4qy05j6wpdP4vkYBZQ5XjFJRgouV98jUUQxnd93iZqNmhpz9s+6Rae8XQIXYM9c97Bl2J8tSA5+z7agz3GV6DsBd9Age/tcmvzyqnuDP5bF1/lU2YOxkVQyFvF+TyXEv4RZhHr/rdQJW/7SKsnwOFEAdJOJe6IPD8fZ0R9AZ1fVByRvdQI2barTdU0I3kbQVyj42fG9tQdfkEtKqJgNuzlsZSvOd/02jHTV7lWtMEjIkME3p9lxu3k2iRgQtv2SnBWSc/ZRnvwCIrIP/sPrjd+LnIxtizg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RMqdL/Rls6xjE/8Gk9WV8G1k1+m9RM49kjWKagTJQLtBzdv063lwc12fN+Um/wh1Fl6AaXUFy4+qjhxq1p8iub9wFIEmDCqMJLnUKAFeoqqRKqJGQS/qalcVmH72+gFwKyRSW7Ryy/MWwGkBxQgJ/kHjt3FRdecY6hcqJOUBIM1U6PclKCo2vLWqbjCSSUywCS+KIWuJdGx8tbmg/0pKlfEtMX3UKPHiHwSlWHo5YJAaU9seW6q2qtx8wUHIhComxWla6r0z1euAmMYiyVmIcHfPZzxsZosiKC++5LqfuY2yk2ffKMRHlsvEhAB/f1JWnDPRiAxUuxEDyvV5X5QAjWAelZZ9aT0xyxZHXpPtdU58oUupKx+mbMYIRyr8yDvUIIVnhTLB2NVpYXivqCzW4bALFKrVqKf/TvZLmR/S7itJn37lerMS5BR0LwkFGbF2
X-Exchange-RoutingPolicyChecked:
	MxdxMBoxqd7jp40/p3fPm0BaCL7qO0stNO1nom086pOSeVkz+DNDLzN3ymlp3KOEk+ecVmtBANwccN5YbyBhZLX/6AlSPgSzs8TUuY9ZzeJuikOqa/dZy40tjIR0nn0GOcCfkqvF1zz3LS2c18vflDrPRtEnRB6jSJlmP97IEZR1/edlO1QJFSTRfdx1HQedHBTH/UouuoBOmUgeP5yTyREUAhWGP+iDcFhZmNJZ3MDnlI4ajKG5DkBf6Lsa6WFW+1RYKqa0qHKWBqGIZy224DsCAasJbUfCEa8KZPX8lYzXOh973fxWMO1La9YvSAxiKlYz3Dis47c0tCgF9NSV0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:23:48.4009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa3d33-3cc5-4ea9-4791-08dedd04e89c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8348
X-Authority-Analysis: v=2.4 cv=AaOB2XXG c=1 sm=1 tr=0 ts=6a4e6b8a cx=c_pps
 a=QA4htdGqYz999Ta5EyqdmA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=dOW8-wjJzYuBz4CyKeEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 1OifxMaBJaCaumX-zvK-AEeFWdRF7Ycu
X-Proofpoint-ORIG-GUID: 1OifxMaBJaCaumX-zvK-AEeFWdRF7Ycu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX2CBYOvrTjgMx
 a5ZrDmCCGkWpc6tuS2QkrDpRXtuaVc9DZQpqgKZlREMxhEAxIiFoU7LoVPS3xl3nG9aIq7R4X44
 WvNObKLWqEwG0TZ2KmhKRbatKAu3xHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX3MYQIWV5T3+e
 EL2jfyT0mOtvGLxUEeFwaTTodvT7O7PN2hHfTpUvt1tLd8m6J3h2ZZjDNMG5JD/ghMwfXvOnWvQ
 45T7RDjnsBWqlS95H6huqHg0vOItwIDUr87zTiyYDTtrTtt+wzLQuVcKgHVhsSCvhj1wKlHv8F+
 5qOoCY3vMGNiDzFmzjUOXNOpL/XHUQASYYNFzJk8+vfiLEYeANhclvkApKZTsSFyBF0fncp0l2x
 dkfa0x2DB+QOeNCU8CIRegTL+Mc0K2N3hyjMQctj93X0/EHdUWrlxck29/vDh3JLhceYgkLJmM/
 /SMeqkN/IxzGOwUffHRPhL9nGh0ulYWvfAxFJ51rDMbZM41MLz5kMWKJkNtlYM4QYtH69DmWgBZ
 +OWJ3t0el+isI1OO6F7IUoJSXjUyLyLzN8VobUGV1l6GB85SFMM9AIW9f+GRZg3foVIHS4ITQ5r
 NdlZrPIMEGw/jqavROg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67038-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[k-willis@ti.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:t-lannynd@ti.com,m:linux-media@vger.kernel.org,m:b-brnich@ti.com,m:detheridge@ti.com,m:nas.chung@chipsnmedia.com,m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[k-willis@ti.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ti.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uda0506412:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F5A9728526

Hi Thorsten,
On 15:16-20260707, Thorsten Lannynd wrote:
> Add SET_SYSTEM_SLEEP_PM_OPS with wave5_system_suspend() and
> wave5_system_resume() so the driver handles system suspend to RAM. When
> suspended, Wave5 should gracefully finish the job and shutdown. When
> resumed, Wave5 should resume the context and finish executing the suspended
> stream.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  .../platform/chips-media/wave5/wave5-vpu.c    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index 76d57c6b6..a83640751 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -254,7 +254,37 @@ static __maybe_unused int wave5_pm_resume(struct device *dev)
>  	return ret;
>  }
>  
> +static __maybe_unused int wave5_system_suspend(struct device *dev)
> +{
> +	struct vpu_device *vpu = dev_get_drvdata(dev);
> +
> +	if (vpu->v4l2_m2m_dec_dev)
> +		v4l2_m2m_suspend(vpu->v4l2_m2m_dec_dev);
> +	if (vpu->v4l2_m2m_enc_dev)
> +		v4l2_m2m_suspend(vpu->v4l2_m2m_enc_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static __maybe_unused int wave5_system_resume(struct device *dev)
> +{
> +	struct vpu_device *vpu = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (vpu->v4l2_m2m_dec_dev)
> +		v4l2_m2m_resume(vpu->v4l2_m2m_dec_dev);
> +	if (vpu->v4l2_m2m_enc_dev)
> +		v4l2_m2m_resume(vpu->v4l2_m2m_enc_dev);

Can you confirm that v4l2_m2m_dec_dev can be resumed before
v4l2_m2m_enc_dev? Usually you would suspend devices and resume them in
the opposite order so that you can preserve dependencies.

Best,
Kendall

> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops wave5_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(wave5_system_suspend, wave5_system_resume)
>  	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
>  };
>  
> -- 
> 2.34.1
> 

