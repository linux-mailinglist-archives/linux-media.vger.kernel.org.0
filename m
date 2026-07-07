Return-Path: <linux-media+bounces-66818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fPgMLhi/TGpopAEAu9opvQ
	(envelope-from <linux-media+bounces-66818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:55:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 572FB7196A4
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=MKptIEML;
	dkim=pass header.d=ti.com header.s=selector1 header.b=pnhijZK+;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66818-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66818-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D503B3001877
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0489242D9D;
	Tue,  7 Jul 2026 08:55:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC8305676;
	Tue,  7 Jul 2026 08:55:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414544; cv=fail; b=OivIMKiUugaQUrBfCSZjXispRCfUuzneqFvtqHPI0RY4K57MaUe9K75minX407DUYxXAJwPOqxdGWjKlZmhpBcHkJmD5rc3y+39VP+ZkIQpAKl4JlPnCAPaiRey5VTIxo64qsTiWrOLZyFSyzuW2t2KBuS6is3nwampwrQ7fDz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414544; c=relaxed/simple;
	bh=xthwbgG5CLXvR6PtycJidnJVFLlonPamS70Cq57wYSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=apW4QIA8DCNIr3Cy0a1cRj7pD6zJaG4SgcfOuLFeQZYiRDNnLEk4Nkb7Cxl54BKJ6IG3dOPEvkra6DAmjiRcrHzom9j+kPeaTXe0pvwb3aNTtUsSQ8AeVgdm6Yyo30uiMFnK6NzyPJwy+oCcSvLC989O8hI7y3qRa69i5kCJW/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MKptIEML; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pnhijZK+; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678HsWX3098496;
	Tue, 7 Jul 2026 03:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ka9fEs+7avJY9XbSA5x0yN3hXDmLoLeWWJRZgMbjX
	jk=; b=MKptIEMLfofE7xhku60BaoAfu+sLzUguCektYz5XnyTwn3W5DeFlCEAiE
	3gcUxVtnoloDmLHR9cg56dKB8L/x1nNyBhdraWWWKOdPRTfkui3nNWjfEmBeMZlr
	2XBXjfroaILzTkbhmOjfYTNPRpN+K38S8pC6JWUpz9iuEU/vRfkpbPI1u0aBc9Oa
	+SsHuMZjHwI/re4c14+thfKRlyRhPCwAyXMTNrcee4OtvH2T8UzGPlSaVF80KBqK
	PW+dHHt8rjy8HxWXd+Y9acm9vLiqGRT5VAkyNyO2PbQV5Od06jFK0/c2DFlrUPja
	m6gze9FduYLOox80OAtfV6ujvPK1g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f8bafxtm4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 03:55:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msmwJf9PAWtXCzVUJVQ/UY1cm52vL9KOacdymGeFHynBTS3cbCVUGIL1yuZOv9zQg0Ysl2GD/GeUg5DaZksTOuAa8I+6PsTcbja2STFtKPzQ0mBTM0JnE1v9YSjbihzUM/+WBqSrUnd6wx7HzyXMqJmuU1RYV5tktw3s6uzzlWBjzMWG9r0jmiFGm0IM9cI5P2hPJYqhOcnDwqeB2xBBH5cvgPLsuKt/YIkDnaP/3gE7klQbtDWfBcsLClTQ3mpaSyZKC4Eu+XwyZ8qAcC0MddcYLcu3Dkm2pYogqigH+CuN4YL9k0zuZPkpXYIJXF6qoT8rC/B2uLTa0T+6SAwXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka9fEs+7avJY9XbSA5x0yN3hXDmLoLeWWJRZgMbjXjk=;
 b=tVhmPME9ReAxv6pZtwu0XWHsoKOHfuMV35oZJOznn7afId8nBifaA84uKs6D9oRbRa5ppsqQrIzKQocYLjAIkqDoNE0FHPsqy7hcH112fH7T4QQh1hvrL/U86eO6WD2JIs32Vmz4p9yvyAHdsMEXBjRLbUFfyDPYjE/nc9juQFCHy27JdKDPnzs9RpO8b6R4mB0epE5Gr1XmlMJcyeVpnfc5mQ09Dgg74VgVYvjf4j/nDaLjOkByb05f+/mwX1oZqXkAS3+bGAcEKeKO3J2bfHYvC6xuuAEWQzVMZvecmHZbNzvSNXw2XSiawR3SVQA/jZvj6LIsQeP1rNeO6JwsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka9fEs+7avJY9XbSA5x0yN3hXDmLoLeWWJRZgMbjXjk=;
 b=pnhijZK+J9aZzOXeq3CI+QqK2VEDPpi08d9eKAbL/fGVbzRdkhc+D2K0ddKtVwDOg376tMPCRYnegm6PxD6DkvlJG0mkhoXOH7bHrtirbqxoN19hC9wprqSQ/Q6gn8q9FVR/UMKtctA1IgVUq+3uxh5xm9nn2qXW8yECJTTCujo=
Received: from BY3PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:217::16)
 by IA6PR10MB997609.namprd10.prod.outlook.com (2603:10b6:208:5dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 08:55:32 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::36) by BY3PR04CA0011.outlook.office365.com
 (2603:10b6:a03:217::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.12 via Frontend Transport; Tue, 7
 Jul 2026 08:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 08:55:31 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 03:55:02 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 03:55:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 7 Jul 2026 03:55:02 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6678swad3450290;
	Tue, 7 Jul 2026 03:54:59 -0500
Message-ID: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
Date: Tue, 7 Jul 2026 14:24:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: vpe: quiesce overflow recovery before freeing
 streams
To: Fan Wu <fanwu01@zju.edu.cn>
CC: <mchehab@kernel.org>, <hverkuil+cisco@kernel.org>, <bparrot@ti.com>,
        <dale@farnsworth.org>, <dagriego@biglakesoftware.com>,
        <sbellary@baylibre.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260707015251.877945-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260707015251.877945-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA6PR10MB997609:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f042d2-b8d8-477a-4fc7-08dedc057ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	k8mwD/ghlNIBJiXXkDZ631UKxO4bI9EIzCT7tDFFnbjlwnayZNjugGi3Mu2CIcYDE4iEKzFspJDg///L/ZEgOcY3+cN4MmfRG7bkdJiQsTLAyfs+1YiHSxEIK3B/wGQzY1LOWhqQKWk6aTMgi0F0L+op1TYFPzaJA62LF2BvAx/Qnh6+Y++myP3n9EvGyhNr+sIQRNuyJf5RZZfzY6XUKgLT+HLHLkxbkRTmRo4QB8IRVJCvZ+fNiX3YI3ZzyF/tAJa4neeCd33vzuaUx7ZGYQk6T4jF+a3L4AKLOpBY7dUFMpZvJVlcCzj0PxlX4Gr3RV+1Dbpf3NS46MzYQlEDNCWnmuAupysCdVV0rwcCn8JF38uB60GQKI8WjmAqFIvTH0oV+kNYycLp4Rj/+MFOCGCBpKEaa0zO4r2rz6I0UF7o7XqnZOqwQaNGRgZ86bmVpCkiUeWsVujb0n8PctttAZFCKqbuMKp0KTWTK5aahIteKNi3EIYmA3/H4FAKhPWAYJaHXUTYDWyfkz8PqrHsQkbgYHi1K4GBHdjRV7M8S05HOelkf8kL0nQtwvzjYpaoO3lJ+oUEPxPQUEE/qjH+/9L5KydCVOZ5vMX+SBXWHmH2FuRUk7P5zAVRNHSaI9yM+CUrtwICLJe2e3MGA/2mZ9P3Q/TvafVducufL5rXtqUUxUrA7vO1L4Gh1TEy3GhNBWa6hBYaoDRm5o42OnAtjA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	llVtzDfETLRje6poHBsiVGKRK/d18S7E3bbgbBNc0KnGL+rZqIbouGOb4EnHYIW+Wve9vZ/NhilhAkGaHbvmf8jJ6+hmkBG5+neSIuCl1fkp6DNw2yEuoAW2f7lsAaIltHIUqP39pv83wATOBbwlpO19YpmUA8B8GwlS3Y4D9AnQpsjpnDSU5fw8w19HiO+tu3BAswer2vliiDTmHifBXvCDbJvT8YVbB2Ck2i5iytLy9GNFGh7fcR8xr06qWlvhK0trphRkx7L55tYELJzEK+XitHvjn3TAfh2JUYYS+tDkaT0Yjwc73GoSHWqwa20LCfTwvSadvbwwDCqrA8KEYi2Q73K1mEUrpv0NvXxoJeCQykRw9CRUSHSWkVy+DB3a9SGx7CAs7ZXU10LiB84TO+P2SIav3PQauyy5BKoRUvz/wNNpAruPlsJY4yl0GA0T
X-Exchange-RoutingPolicyChecked:
	kOpnpax5SIcHqAUKrHIeraV6nR0z0V2otuYPOpuJWVQTsLdV7/SUSPP2G9ak2baNDFot19zXPR7YS3fql4uJSj+3jxNodGTQ9aK8CG9BrbTwt1EAbOtQpvCKVbXgOoJH4oUdAU3AjjGdlOxO2xkJ8L0Ojh7sATv/hp6kCGExIcv67K5Sh6A7RPCBw1tT8Svhxn9Sj7AR5kstGKmLBz7FhlbxkYp75YGZOfhc+4V9mfwXOZFskTlG6SZ8dsf7qByLQOkV22c0bdZiq/iGBTxp1vedc3HuW3epQ5r5LaU2/tKgymepd9Q3qbuf0aMtAocVaVRZiIvOxa8822t4gSVpBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:55:31.1972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f042d2-b8d8-477a-4fc7-08dedc057ffb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997609
X-Authority-Analysis: v=2.4 cv=Edf4hvmC c=1 sm=1 tr=0 ts=6a4cbf07 cx=c_pps
 a=4NR8cDhszsP7ZiL8l4sOGg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=6sJWAFxeKeCVk-OiHowA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 6SmiOgq5WP30wPq3W0ZhzD_oLKRheAy9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX3iPbZ4hf/iil
 5+FGLRWf1nSby3Drakx6OG5WfjY2Ib1tqMot4c52Ed7c3Hlx1l7+sJFiwWQCqJWGHaytxZMkpIh
 XavC03McxILdzrbtcQlXBXspZIlo/krf7USy72Jkp2Pk4PoKs1rd7aqmfA6zhADWJqBKL8bapB2
 4g0GJAzges1H7Wqao0DEaoRlnmWZdQay96INQtaigEaKUHfIYHZ2Mdp8amwdTvQb8A+qM3UUx3D
 kC6sgCIwwta0W05YvPm1toGZHRBp3rC013rO7jC6R38uIuX3RH4+/VmUAZSEnRXE2ENkL/n35i/
 DlCa14xEsVhnBUjvsmEqkiISW7yQBhL3DCQm5pYZzGavqX/YXp/3e8ljfS0gHnNESNEYbFtdquI
 A6aquYEYahVcoJdwZqqH3E11tET9tx/WaYcKXq/6SJ9d9wCyykfyhZq+9Gem6GZezaVjHMio3Ab
 agqD5U4EOIUWehp7TFQ==
X-Proofpoint-ORIG-GUID: 6SmiOgq5WP30wPq3W0ZhzD_oLKRheAy9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX7qtzkkvXv5W8
 ygcVUJIrmpfv8y9P5JKEaNsHMefjZYmiDdUGVg7a1OoB2Xn6E+39UqRgnRH1pEqIqPQj+Gdw+5P
 pvhSG5PcPLm4hF7HS7QwKZP3y4a79vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66818-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zju.edu.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 572FB7196A4

Hi,
Thanks for the patch

On 07/07/26 07:22, Fan Wu wrote:
> The VIP overflow recovery work is armed from the hardirq handler when a
> FIFO overflow is detected, and the list-complete path looks the stream
> up through the VPDMA list private pointer. Both keep touching stream,
> port and device state; the recovery worker also resets the parser and
> VPDMA and can re-enable overflow interrupts.
> 
> vip_stop_streaming() masks and clears the per-list IRQs, but it neither
> synchronizes the hardirq handler nor cancels recovery_work. If an
> overflow IRQ has already queued recovery_work, or a list-complete IRQ is
> in flight when the stream is torn down, the handler or worker can still
> dereference the stream after its resources are released.
> 
> free_stream() owns the stream lifetime, so drain the IRQ handler and
> recovery work there before freeing stream-owned resources: drop the
> stream from cap_streams[], disable IRQs for its list (disable_irqs()
> masks both the parser-overflow and the list-complete IRQ), wait for any
> in-flight handler, cancel the worker, then disable and sync again
> because the worker may have re-enabled interrupts while it ran. Only
> then are the drop queue, video device and VPDMA list released and the
> stream freed.
> 
> Additionally clear the VPDMA list private pointer in vpdma_hwlist_release
> (and return the released slot's value instead of the array base), so
> later list-complete handling cannot recover a freed stream through a
> stale private pointer.
> 
> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>   drivers/media/platform/ti/vpe/vip.c   | 20 +++++++++++++++++++-
>   drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
> index cb0a5a07a3d4..9c5bf91ade1b 100644
> --- a/drivers/media/platform/ti/vpe/vip.c
> +++ b/drivers/media/platform/ti/vpe/vip.c
> @@ -3139,6 +3139,25 @@ static void free_stream(struct vip_stream *stream)
>   		return;
>   
>   	dev = stream->port->dev;
> +	/*
> +	 * Quiesce the overflow IRQ and recovery work for this stream
> +	 * before releasing its resources: the handler and the worker
> +	 * both keep touching stream, port and device state. disable_irqs()
> +	 * masks both the parser-overflow and the list-complete IRQ for
> +	 * this list. Drop the stream from cap_streams[] first so a racing
> +	 * overflow handler misses the lookup, wait for any in-flight
> +	 * handler, cancel the worker, then disable and sync again because
> +	 * the worker may have re-enabled interrupts while it ran.
> +	 */

Did you able to reproduce this?

I am not sure if it is reproducible in practice? I will try to reproduce
this with hardware, (again I am not really sure how to simulate the
overflow to trigger the overflow recovery) but in the meantime few
comments.

> +	stream->port->cap_streams[stream->stream_id] = NULL;
> +	disable_irqs(dev, dev->slice_id, stream->list_num);
> +	clear_irqs(dev, dev->slice_id, stream->list_num);
> +	synchronize_irq(dev->irq);
> +	cancel_work_sync(&stream->recovery_work);
> +	disable_irqs(dev, dev->slice_id, stream->list_num);
> +	clear_irqs(dev, dev->slice_id, stream->list_num);
> +	synchronize_irq(dev->irq);
> +

Having synchronize_irq and etc twice seems ugly, I understand the reason.

But in vip_overflow_recovery_work before actually enabling the irqs again,
Can you check if the queue is currently active? and If not we can choose
not enable the irqs again, thereby eliminating need for second
synchronize_irq, disable_irqs call?

and also are you using any LLM or other tool? if so, please document the
same in the commit message.

Thanks and Regards,
Yemike Abhilash Chandra

>   	/* Free up the Drop queue */
>   	list_for_each_safe(pos, q, &stream->dropq) {
>   		buf = list_entry(pos,
> @@ -3150,7 +3169,6 @@ static void free_stream(struct vip_stream *stream)
>   
>   	video_unregister_device(stream->vfd);
>   	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
> -	stream->port->cap_streams[stream->stream_id] = NULL;
>   	kfree(stream);
>   }
>   
> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
> index 573aa83f62eb..f9f5b2f1ee1a 100644
> --- a/drivers/media/platform/ti/vpe/vpdma.c
> +++ b/drivers/media/platform/ti/vpe/vpdma.c
> @@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data *vpdma, int list_num)
>   
>   	spin_lock_irqsave(&vpdma->lock, flags);
>   	vpdma->hwlist_used[list_num] = false;
> -	priv = vpdma->hwlist_priv;
> +	priv = vpdma->hwlist_priv[list_num];
> +	vpdma->hwlist_priv[list_num] = NULL;
>   	spin_unlock_irqrestore(&vpdma->lock, flags);
>   
>   	return priv;


