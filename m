Return-Path: <linux-media+bounces-54315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHPsDlu9pmlDTQAAu9opvQ
	(envelope-from <linux-media+bounces-54315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:52:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A978F1ECFC5
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0145307A574
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE3A3B4E87;
	Tue,  3 Mar 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="gmoEwWS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4463A8746;
	Tue,  3 Mar 2026 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535061; cv=fail; b=T6CzRcZbP1UQJrGVdhufHFkTnfzJVaLzcDNNW7LQLwUBkGTHbFTyP3sxVLUzzimenp7o/OUMoBb4LnFL8YSiP3xgq4KsGfZzn0h98QIre+5nL1vlIB31dXdTANSlCLx+GDhAiGc1unQm0CorHJM43XNRLsh9hcoie8OtzDXpBUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535061; c=relaxed/simple;
	bh=c0cXsDWr8Z/zXPcTJ69+JiGMbGXXqFdKfV5MhW/PH8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZ8yCyiSKxj1d2Gi8PJQ7gaAfx8WviK4KgkNSivgSyvWC/83QAXyAk40MNr2+NFre/qBS6XGPJ1EN1/5PwyKH87+Kd+KfshSKSoUhldrLwY0pr7Y7lQ49qcajEY/QmBoQveyT+Jo2ZknQlZIh81zVwhNg40BUMbiKYSTa4+o+DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=gmoEwWS2; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236Pv7v4019490;
	Tue, 3 Mar 2026 02:50:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QtmrsxBeXTC27EmuGbB2GTPdKXYA7v0Pll+DKAK4A44=; b=
	gmoEwWS26awegHl25sagCQyMGhdsdC/O74362kHnmLCfiygJH9UMMe+i9rS0gCMm
	Rd9LwPZSUsgPB79TU117aaq5Vno1uK/H/peYxtIJH8mnpxrjNbRgAW3w8hovc4Cz
	iDe+zzp35qSHIJQ+JBQffbRrIOPKyKYljMFcb7+W0jhvrk9GJmXtzFzPunsH5YwL
	+4bpolw0JipgytsA80c/Rb2Kn+39sgqbIX/pwokEeM252ylBjguFbr2/mkDB/w7C
	i7t6lQY57XRuhw1iBHRBp83/sfGhrhUxP67sOcis92An4yWPx6SYgwkvEpfotn4o
	SF1f8ORxG5LePjAvd7zR0g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh438de-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 02:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHSqUoMa4dStEO4FlJNqsexduHnVpLnR75Ii1O79PwnG3IFY4jFnCnGPxUODghmZ/zRlIaAWpbJp6jtDjvE/7bmZZpIw4b5Su9m2jeIyWkthUcPVIxdTLHIqKWlL6Jqjv80bTyPyeRHbBcHPDHaUW/oeGteX1OkAfIVn9FKVx9qmxy0txjU1DyyyTZK8WOr2rwTGw2RA2eMyQPpklI0iLW401JPnR+/YjUl1OVT1ZR5VCoe9tytY56vGejUuDS+X2rSw27OXNdKHNYZ9jp6kB7jFaUIupua0D2AL/ydO2VGW6HCQIJP3BxiXXTZtTGam0+cYMzRcnZKw7UA/jgPJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtmrsxBeXTC27EmuGbB2GTPdKXYA7v0Pll+DKAK4A44=;
 b=Lb3lCSDBhaemPbKElu1NLl1bE80KxS/CR5bkq7wJw/rPvn8P1UuuFVe2mmTL87epaOvF1wXUAdmxQJ1QaU2TQq+t04g65CQIG0sKYmkIXnkhv5y/EJokJq2VBicWdPvp60hQYcSzY341vU2pEscDsdKIKCGZ4RcXVP3C7fjVcu0HKV22foDzzztQBaW9qmzICEkKT2EN0V+GYKQL6BFWQKQvqParc4Qk3oPfOPrPV6SawidSqjR90AITnOWlpDURQEnnp3oiQBoeHUIkphIX6099o3y3Qs/ItcM6+h+lvLcIbMY8Z7hHFqmORG/JV8PHE4NVl8uPI8AZK3YixUm27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB6837.namprd11.prod.outlook.com
 (2603:10b6:303:221::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:50:25 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:50:25 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] media: i2c: ov9282: Switch to using the sub-device state lock
Date: Tue,  3 Mar 2026 18:49:41 +0800
Message-ID: <20260303104942.3111366-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
References: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: de25c670-330d-4efd-60db-08de7912acdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	YD5cJxgvLw5FzpchrNSGxtC6v8axX828nmk77cMhe+shScMWkVJhnpTkyWydRbcyhxZOX3K/qSgF+M9L1YT5Ntpk8M2Zgyo/iLwgfRo6huaPD5hM5agoNUgsQE4DcRsTT3xXo1/shln+drp4e3YbaQWZtr1P+I8UJBx+9hm0x8Vzx+pKb2iP3B9uGvFPCD9XyPyKmTcpa+zPt7Q8JoqK8LfbNpKGpp9JInqqe56SIOd4Z72c7MrZcDOMbFoS6fFVf1CtEZlsLpTctQpxW3FGFeKFiODlBpOI46HR6Aap0oPqKeRRxVwBKhzw2JMt3XE8+y6tHwNIw/D/OKOBUGLn/mB+IJSle5mxWgSdlqS8KVgmv1gjUN3ALe6u67QpwMFnSGaKkTsNy2FAvuj5iRONk9acaNyFD74phbHvzHPyzLtC9KsyZgwiA+SCQzwpm9Q1MBzzGgAyLgGk+xXiHEAU2cfkCGk6vmQpaNjMJWxncP4u2vf1HIfY2DkiMaWzWYiUZa87KSuG6iLh0Dbt/h8OMog+sFXwwFncKxUYdKK4IBKUINSK7fEMbjU3oZFbMF6RO4vBnV04O7SR5Sc3y5IP03cHZgf1h+NK78+f+s0ed2JlQOoqq64dnBolAj/BhAk8IyifCgb1X48e9ku4E9zeY5gApfomKXDUuHvDhzTwH9W1H31uYSCL+ECWcCotci44mp90N+pas+kb/K5An6VuBNcXgoW4uErzOiihlAMo4CAZUOSQrkU/HVE3j5J+XORCGxuMdwVoNxUi1b91kjgkPyKHwJesRZkYmCF2NzlHZv8v70MF0G1TaDqhEzKgyp3N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?067oo9Ni+PfGfB1Kh7GNko1TvgrBzsKdmm6Y+fYfBt6+QyGN6Z2VAdv5d+vx?=
 =?us-ascii?Q?N+IXW5HIlvbvv5RJ1dDatpgRR3+1CcceWMutBl5wC3l4DTTrkF9G1lF+3wF/?=
 =?us-ascii?Q?bM0dTaVmm2LzV4LUk8qHLDMR4+cXdN9F3CH/nXrD7byWQJn5Qq0QUKL9hc5n?=
 =?us-ascii?Q?uvNK5cOOeOqsx4zXV/ayvY4QpHG2rGDMr/KZHHcH7xAUDqd9zm9XlqE/RG4B?=
 =?us-ascii?Q?4Se7sHEh9FyDJafO0zx1EKAkRNdIwNeFJpwdm/3/jmvpA3HwyTVv/d26NneB?=
 =?us-ascii?Q?jc7W5Su2jFW+WlgMzgW43leB3+FXHNwe50iUeNtyQQ1PhNuoWnenIM79lM7b?=
 =?us-ascii?Q?AGZiduzS+f296akeI8jM9FgKwDlB0SjwPmY8Tbks4fLxzEiukB6sIR4YeXrr?=
 =?us-ascii?Q?kMVvHmSCnLp3FLEOpkObsWZdSUlstbbqoW6G9gO59BG4Oyi/sSILBAxRvEMC?=
 =?us-ascii?Q?Qu4s+LhVLHNXXyon4mhGWaMpPj6XhRLX6V52/vRQDq5i7oFzLSW21Yu6ZrUW?=
 =?us-ascii?Q?nii+QquWdLXpmtIEMya84zFoh12M24OH2sBrpeUrfoR7Bfujx11Auqzqv9xW?=
 =?us-ascii?Q?Jc82dqnCIIYUcczPq7higo6+4D4/hDt8GD0z/JNVX2t8FdPNxhPQp7fsRuxs?=
 =?us-ascii?Q?E9ojKYItsY8KgfPxHWP6n1mpUSAbO7QmfrgYCgG95tu0iMTDDOMimeRtPG9Q?=
 =?us-ascii?Q?DtDaKh3fC1Gx9Ya8dFeso9sZqxfP84UIwEnk9FTtI/0OGwE+kehQMX6MTdvX?=
 =?us-ascii?Q?Bli9vqsUqxxmQ0SGnfr9aB56U3wjLl2GhFsBOlmIPJL1Q8Zz/3ySFtcrRpZz?=
 =?us-ascii?Q?vM4Ln2smWdLAnlQxCUzGgJPQ5jQ69R2RXh6wO2Lqpbc5hFJclOC+k26YscG7?=
 =?us-ascii?Q?5AgOfjXNVd7G0FZQUlGmtPJ3hfu4FX6CPvZfEksbQNZ0kFVieKGAbM4C4lUm?=
 =?us-ascii?Q?ShH/OU+CHvo0dvI5hXDlW0IvmenMQ3cQCYodmtT1gQcKk/eM0QqiYktRE0wZ?=
 =?us-ascii?Q?FRLmaqT7FdizFVjdYONB92CT1d7NscuwHZjQgs6DzObBZzMc7iJfVcMbbiBK?=
 =?us-ascii?Q?nJzfmXuY/7bGqWj0u5GHlyc4ADb2Xp3xp9Md0ht7JkThnk0j8UUs7wYVrNjU?=
 =?us-ascii?Q?SEmUGbeFzT2KXzGFKzMc2p0kUrVpT69tXc8zrrlOLN/mMAVPMkzR7LqjHbdi?=
 =?us-ascii?Q?vefVxmfdtFMwkpP/l5rQdC4v1JEakEba5BY0m3+isKyIcY8Cvjnqd28/dya6?=
 =?us-ascii?Q?Qa9iKy9/bwaM9PHcUBlv+UoxfNhHHkWC7IeTMI1NtSscS9YAcQRKxzS/jOWz?=
 =?us-ascii?Q?+bHf76Ktw3n3ffKDmikF+sXliAWYtWjRqoFMhaFtkgVU3BKjLrnWPKlH/vE+?=
 =?us-ascii?Q?vpNUJq9Asouz0xnpe2KwWssA7uQdhEPCwNdTnmcbR3hWDQO+j9EULsI/q67Z?=
 =?us-ascii?Q?kdRS3tAPf/hX+IiKekCAcjW/lAtvSENaAKvAGY1RxHXoZTj+V9goIA6/gG/d?=
 =?us-ascii?Q?t2w9d7so/iG+xEQy8JdSsP0VYlYNtF2bmTqIvX/Pvb+asJ6ZcDl9l+Ey0Ker?=
 =?us-ascii?Q?zMfyuFTkCzgq3c/UYcm00xYe7vhO6ixbYgOkg1FsJ9B+PAfEXx0EJhrce4Zq?=
 =?us-ascii?Q?W4Gkpms2MejEvkwnII32wTl5Z5cMI11X4v6ZJRvw02hRfwGYIbqoAUT+Ivj1?=
 =?us-ascii?Q?DLIAnkcrys605Tx/9x8VJV/Y86yYODNko5WAgAHWWs4a1yQpft32g2ADDbKV?=
 =?us-ascii?Q?jKudOGNjnF1GLAk7+0Bx6H42gxXcqOw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de25c670-330d-4efd-60db-08de7912acdc
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:50:25.1814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGrSLIt9SKubFsw/xVLxL7czg/NekZptn3VV+VsymiGTcGJJfTH4KSju4XX9UJQiyaBSZd0F6w1zGumhItooQx/3Z+sgU2IVGnBXeT58TOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-Proofpoint-ORIG-GUID: ZKW7LzjayNIu-ZAZFlIhhxESCsAaujyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX2R4PjhwaqGXB
 2VpQN5MmKZ2oCw50RFp3HjIx3dgmA3QJhefruxoLl+5/jYscWPdcGITZ/2ArtKpc8U10BTDfJvQ
 ldowUbMi1bHIeJIy770rw09fQoCedDVgzE99+aQLfu58xlykZ8ZCB5fJDFl7Ilpsa25RVGl1tdg
 9nh+Gb6QK/KjYRBkc/xCseTur7Pvvx+PIJ/fTh6xIPTzFkM28zMGfQ3kgNS8KdsmM7hHDBZVwdL
 Gf0IIvA2hGFfO/RZKJUrHfFMfiSXBF15gSCppM35Xjzi1kjpBmGyqMCw9ewTuGJDGb5LZ+9F9zw
 OTUbo2lUstYowiy+/d+HCtfYcsDQrtbaUhbePET1D78tZSS9jI43Wu+tnr6udkScojnMvxpCtRQ
 Gzh8XtrcjloYut6wVSEmLa+BvynRC4e5QPJFVQGskKqPQhmZ/TKM6R+S6sbHO7tixaYjfQL02N0
 t2ktfJ8o+UOEyN1ObkA==
X-Proofpoint-GUID: ZKW7LzjayNIu-ZAZFlIhhxESCsAaujyU
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a6bcf3 cx=c_pps
 a=BYzTVJwijQ+wlo0xVi9Hgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=b-pzV9cxAM0HHkGdTPcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030082
X-Rspamd-Queue-Id: A978F1ECFC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54315-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:dkim,windriver.com:email,windriver.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 51 +++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8bfaa3ae4be5..6556cbce8dc1 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -221,7 +221,6 @@ struct ov9282 {
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	u32 code;
-	struct mutex mutex;
 };
 
 static const s64 link_freq[] = {
@@ -795,8 +794,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	mutex_lock(&ov9282->mutex);
-
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
@@ -807,8 +804,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 				       fmt);
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return 0;
 }
 
@@ -829,8 +824,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 	u32 code;
 	int ret = 0;
 
-	mutex_lock(&ov9282->mutex);
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
@@ -856,8 +849,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 		}
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return ret;
 }
 
@@ -904,10 +895,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov9282 *ov9282 = to_ov9282(sd);
 
-		mutex_lock(&ov9282->mutex);
 		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&ov9282->mutex);
 
 		return 0;
 	}
@@ -1019,9 +1008,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
 static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&ov9282->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov9282->dev);
@@ -1036,14 +1026,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(ov9282->dev);
 	}
 
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_power_off:
 	pm_runtime_put(ov9282->dev);
 error_unlock:
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1285,9 +1275,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &ov9282->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1409,13 +1396,10 @@ static int ov9282_probe(struct i2c_client *client)
 		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
 				     "Failed to init CCI\n");
 
-	mutex_init(&ov9282->mutex);
-
 	ret = ov9282_power_on(ov9282->dev);
-	if (ret) {
-		dev_err(ov9282->dev, "failed to power-on the sensor");
-		goto error_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(ov9282->dev, ret,
+				     "failed to power-on the sensor");
 
 	/* Check module identity */
 	ret = ov9282_detect(ov9282);
@@ -1448,27 +1432,34 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov9282->sd);
 	if (ret < 0) {
-		dev_err(ov9282->dev,
-			"failed to register async subdev: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
 		goto error_media_entity;
 	}
 
 	pm_runtime_set_active(ov9282->dev);
 	pm_runtime_enable(ov9282->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	if (ret < 0)
+		goto v4l2_subdev_cleanup;
+
 	pm_runtime_idle(ov9282->dev);
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov9282->sd);
+	pm_runtime_disable(ov9282->dev);
+	pm_runtime_set_suspended(ov9282->dev);
 error_media_entity:
 	media_entity_cleanup(&ov9282->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
 error_power_off:
 	ov9282_power_off(ov9282->dev);
-error_mutex_destroy:
-	mutex_destroy(&ov9282->mutex);
 
 	return ret;
 }
@@ -1482,9 +1473,9 @@ static int ov9282_probe(struct i2c_client *client)
 static void ov9282_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9282 *ov9282 = to_ov9282(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1492,8 +1483,6 @@ static void ov9282_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		ov9282_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&ov9282->mutex);
 }
 
 static const struct dev_pm_ops ov9282_pm_ops = {
-- 
2.43.0


