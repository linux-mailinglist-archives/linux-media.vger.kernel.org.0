Return-Path: <linux-media+bounces-23877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670F9F924F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1E6160119
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5811215771;
	Fri, 20 Dec 2024 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i1SdScFi"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09F215700;
	Fri, 20 Dec 2024 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698174; cv=fail; b=MSeoXdJm3qO8wUeo4RzjHc6sXyRHdZZcFYfC0hUFLY9+XWOALHaDfRbEzn8gM3GIrdaPY6PfXqoyjTCOMyCMoO9ekw15o1fkAi61z84p1OxLxO6qPc6b5JRmKWzpRm24/pH2hO9HxPE7KlgZN0Kc8VEG1tdsyABdGv96gjTYnr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698174; c=relaxed/simple;
	bh=d7rx16iuunYyzwYqV5f76SdIYc6rma3RKAlhk1WP09Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mREozNCkSNNOZZztiAyfwUH+qQP+nv7lBYPa/LTENa/yj+En6oQziM75je63iWUAjHdXDjnHDPrm6yrXfYTYYyF2AtBl0IpUws8tklNaz7A5cbVREe3Sr8dmEIxjw9MXAyRXqIbqdt5PhIFtY+EnqW2pJSf9wOst8yOl1CePQG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i1SdScFi; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqQQ68d7eYqtRJQZvyEh63W2yVWx1N/8YHrJHCBNAjTm9Bkppy8KSMbn9Am+c+9iasW+wgChtTk2XBXGebEBQrXcRW+JQwDcU08uXZNA00bO7hLo6St3FMzVnQwRBMJ4bh+/7CXa2st2EwNicSiS7KZ8H6xMswNK6HFSIr50vRqqldUzzjb0MrLebDB3Fp9MKcZwkIgfWIbrAGEAPnoa38R9xbPpecGAN87F4WGE67VJUJrhocKgkwZ/SJ8me3aufc6tw9gA8Rouc7sp6GHmbykDLe+w1jtV8s2sAZH4nwKFMQ3gOFaXZKI9SgfKUGEm36ZDhXrnUS7iAux/92xIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mepgUvYk1Ss+E7HkK/KQ1om12+km3pIIRhGaSIFfhY=;
 b=SF/OpHsNthOi1eKOFy2AbEcl8/XWDHAV7wzv0C+5u2azJ1wX++F68v7EGJ0cjwQmFma2OeNWc8O0Er4HhM1DTXhCTmedoheajNBz/bRNBN0v8+5xJq+Zucy9Tn3qI57tznqfRsVM7grkUpk1o80kiuMEauf3ao0RE9yRG+CGHtPno2mvMipmuGX6wKVPhtkDnVF4PAWmunWwGs5P4em8gKXJvYb0ti27N5LtahNDRRttCPHxuB1jiMu83dJ+M11Pu109mn5ik5V3ce8q+SECyfCNWcWY+8i/BulCHELcEO4velKDnzsZYmBF7F23gRBT8FUZW2vJPvijsLw5pVXAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mepgUvYk1Ss+E7HkK/KQ1om12+km3pIIRhGaSIFfhY=;
 b=i1SdScFinchwyzY/fAqdhJe7gx5XJNCegn/+2s2NkViyaVffhtc2OwwHLWWfbkprdIU29D7pEnzrECk+E2C+E++pIMca4rlEzRXkZZ9/sHn264e6pTuR2fnfFAOYOEUBgVQISiSsf0A0fkT8d8nsPNfsfVf9u2ov0vFjzkOcYxNo1SBE9IOf9DpKPorrMbOhYKrN6ozwPMpU5yDvd+BlUTsh1PyJNcjHOBF/+FKIXc+RkqRUbGVSNwmffOf6dUm9pxGWlcj37XDjpnUiZIGXhMDxhJR1P41Mj6ovKY+eFwYjPszytX6wWYSgdn7nK42JEoWOx7kF+9o6ti719CslTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 12:36:08 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 12:36:08 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 3/3] staging: media: max96712: add some register and field definitions
Date: Fri, 20 Dec 2024 14:35:50 +0200
Message-Id: <20241220123551.696330-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
References: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::47) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: 5255676f-3e32-44e2-eb22-08dd20f2e0a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTVHdGJ5RUttK1UrMklkT3IzWjd5MmFaL0lNWkxpcjl6U2l2NmcwSDVmTm9t?=
 =?utf-8?B?Q3NKOWo0T2hXaFJPcWlHSk9jYU5Mb29qOXZCKzd1Wk5hMSs2eU5ScXJuYlZj?=
 =?utf-8?B?cUdyQWM5ZDNwanQzNFBNTXJhM2xUV2J0dG40Qi9pcUJQU1BmN0lDZ2FTM2pj?=
 =?utf-8?B?cGttUDBPdmNhOVlBK3J1Mkt5SnpENFJhZ0FWcUt6QUxMeTc0dFFucXRLbjJW?=
 =?utf-8?B?MHM0YVc2NEJKQ2VFMmE0Z2V1UzFFdVY3clhISkcwRmVSZzlLNFhwVldvU21T?=
 =?utf-8?B?U294Z01TYjUxejlmV0NVcmpWRFUwYytwUHNYMWpZNjhwemYxOStIVUcwczVZ?=
 =?utf-8?B?UFZDbWdFTlZ4cHExaDE2eVkzTkoxRzlSRENwbHRGOE8zS2FUMTFVZDNYTHVq?=
 =?utf-8?B?OFVBcndObTBnVk4ySHBqMkt4WG9Sb1pSU1ROZG5OdGRLbFJHRDlTYWYwellV?=
 =?utf-8?B?cVFiQzlmeEZBYWVJTGU4ZDJKZDVaa0FJbFdmSnVKR080YXVSdjhBRWt1RnZa?=
 =?utf-8?B?VHhlK3FYWDU3Nm44MWIyUDVSdW16T2xZbHFIRlYzQXBKV0tXODVxWkZsdTQ0?=
 =?utf-8?B?YnJTVWx3K1o0WkJ1bjZIYjBRSlhLMjhKdUtFdWdtK3hlN0k0QzZCRzBBNXVn?=
 =?utf-8?B?d2lHS1Bvakxhdm84WU1TZk1qZm54cnJ5akdjR09VYlU2b1NITlJVbVA4a2Ey?=
 =?utf-8?B?aHI0cHV0aHo5YUpXR3htTkxSV1FjVk1udExKemFoYjltRlNxMUc0a25jN1Rv?=
 =?utf-8?B?OUg3NktMV1NobWdXdlE4aHh4cnc2cUtGWVdSbGMwWDF4cXkwcEt0ZkhPQm9Z?=
 =?utf-8?B?NEtRQmlKSll4SnBQZDl6M0Q3NU5jMzlJaUNFNXhmK1ZjL2hZa2VPamFDRk81?=
 =?utf-8?B?WC81REhnVDFCakJQaHJUczlSeTltS1dOMnpIZVVtYWpPb2cySUlTWUx3aUxV?=
 =?utf-8?B?ZTRLNzgrTzh4bTJDSzNHcGZlNEZQRzFWQkppOEgzNWt1all4MzFwRVE3YzA0?=
 =?utf-8?B?dzlBaDlHTUpOYW5wUmRqOW5EMnk3TTV2d255TUNRa3p6Q0hLWkpzVU4zYktL?=
 =?utf-8?B?NVFIbk5PMVFLWlVVdXhldkZSU252MDlsUmJmY2FoUk1RTk9SR0ZDTUJhRjFh?=
 =?utf-8?B?WTU0cWZzSC9OR0VOMUp2Y1dhNzVHUTgzSFBPOGNmMXUraUNaT2w0U1g5NGV2?=
 =?utf-8?B?OWlkV21pcmZ1OG8rL0ZCY21VeXNXRWpudEpLN0RIWUczMDU3SFF3Y2o1dFZY?=
 =?utf-8?B?ajNqSWh6YTgyc1h5UXpEK05VNGlMejJDUGJjSTNjMVZmSklIV1hGc0ZVQVhO?=
 =?utf-8?B?YkQ3Z0NjMUNCakl1ZmtmS3I2dkw5Nmk3RG5Yc0F3SUltWE1NbGp4clRHK2dZ?=
 =?utf-8?B?QmZaVDBENkZwQ24zR2lwNFQ1SThUS2ZUV2VoOSsra1d5UlRoKzBHQkhUOWZK?=
 =?utf-8?B?TVNud3RReFJwVWNmYmJGNzVlbDJuaGZaWDJNQTdyTElaNlo0cmlhcEFHTnFo?=
 =?utf-8?B?WDU2Y1UvS1pwdFQxeWptbmloTk1Xa0tJSXlmcEJPMVNYc04wZnNueEtVUE9W?=
 =?utf-8?B?bzVYTG1sanpzdWNaNjUxL1ZsNGorYkJpY0hnbXd3amFmM1ZXTVR6RDMrRWJ0?=
 =?utf-8?B?S3hHSm9LUlE5Y0xoMElVQTU4c1plS29uNUY3L0VaWldFNVpkZnlpZ0lrektz?=
 =?utf-8?B?aFZGY2NDdVBsUkNUdjRrc1VIOUhkek5vME95STgwWmJPTldGU0FiRVhhK2No?=
 =?utf-8?B?QmxFVXN0clRweWZrVEVZWHFOTU9DeGdBY1RqeUFqSFI2UDhRTUFkVjBJanVs?=
 =?utf-8?B?WUhEWVQwZGVUeTA2K2paeWMvdE5PTHdBaW9VWGpabGFPQUs2M0xqeGtlL0VY?=
 =?utf-8?Q?ILcZmnqyoSIJk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjhnOGEwUjNPb1kyRVFxZWRCWW1nS3FFT0JGU3lka1p5SFNkY3RRRGVCbEV1?=
 =?utf-8?B?bHBLamE2dTBRMGVPbmFlbFY0L1Y3c0dWeVBGV25iREo3N05RdHUybkhpdUZl?=
 =?utf-8?B?RE1Qa0x3N2RMRDFlOWJOMWw0MnJLTXgzMk92a1Y3T2hBc0ltNXBUWENDNkcv?=
 =?utf-8?B?VWJtMnorMW9IM0NUbHV5aHpJQ1BYd29wSWNMaCtxeC8zbWNtajFsRjcwYzBp?=
 =?utf-8?B?aGRaZlVsa3Vnb3ZmNTl1RXdVZDhOZzhSVzZaRVRNNTNWeEZNaHBRczBxYXZB?=
 =?utf-8?B?NW4wdjdKY3FqaDJZQWVJUVk1OEtiUUl3VTMxc3cxcHQ5L2xoNlJKT09YS0FZ?=
 =?utf-8?B?dFRxR0xqS1VTVjhBYXZoWlk5ZDQxL3Jpay9KenZqREsxa3lEekVraVMyYVhl?=
 =?utf-8?B?bWJoak5MYTd1R09SQzUvYWlQZHNjcFplS0VOa3pLUXdFakI3UGpFN0RuU084?=
 =?utf-8?B?anA2ejl2aERJdGxpMU5TbXNGUU5kRlo2dEY1WUZtb0IrNTZKY0pYQ1pvRVpV?=
 =?utf-8?B?V3pTcVNUdU91dXJxOGl4OGJ0ZkpnVU9NNXhkMmZ2SnRTZDByNDB1ZG4vclU0?=
 =?utf-8?B?eFJHZVhVV0RRZDNBZll1ZDVsSU1BZ3oxYXBHRmszUm1XYmlQdkJaMytIS1Jw?=
 =?utf-8?B?UjF0NHpIclZnLzRLMXQvTWxvSnhWS1owOFF2a3lPOE5sNy9ueEhwaGo1Z2VB?=
 =?utf-8?B?cG5EWitTZlA0aTlXMTgrczdBWW52WmJMOGVKYWYyeldwUGFucFZnenliZFRi?=
 =?utf-8?B?VUFCL2xZVS9INTBNV1NFNEFmVk1YQlFHNElMeHN2SEZFaHh0MDFONko1Zytj?=
 =?utf-8?B?SkZmNVJxMWR5MXZPUnhMZ1dqUzh1VUxzZ2VZWHRVWWRkTXJ0UXF3NDhiNzBt?=
 =?utf-8?B?UGRFSHFRc2xMS2JuTGlqdWMxVXVtVjZMQi84Qm0vNDlYQ0svbU1VY0lBMjR2?=
 =?utf-8?B?OVhRenozdlYxMkZROWZVLytOZkZFSTY1QllNTVVHMU94TkdOaEFGOFNWVEt2?=
 =?utf-8?B?aTlaTG91aFpqTWVTYUx1TGxEYm5CV1V3K3ZIR3NBY0xudVdmYldMOXdJNUpQ?=
 =?utf-8?B?ZTNKNHk1QS9hcHh1U204cmZ4QzdWWHA1ZE5YTnZoTUY4T0tadkl2QmZLdmc1?=
 =?utf-8?B?dDZVTjJFcHJuTk1pYU1STXNVdEp3YTBsRldqZHVZSWd2WnVRWloxOU9HTFVo?=
 =?utf-8?B?dWF4VnVpM0dnOC91UVZrSnY3Z3hsYlFRT2JtN3RneGEyQXk3QVdDVmVNOG0z?=
 =?utf-8?B?MDhTcXR3VDRpTXpSVnVOdnJ2YUxsTC91NEE2ekN3akhkNEN6Y1ozRk9HMVF3?=
 =?utf-8?B?eXBycVFCTzF1RHZVcEd4VXdEdm1kZjhNZU5BS2RVQUtBN0pyT05pYlpURUhD?=
 =?utf-8?B?bS93NnYrN1IrSENETlphS2lTNlNJQWhsMmptanFhOW9YSmVXSE1zTzBFYk13?=
 =?utf-8?B?MWxRT2ZnY1czN2xQbVpoQmlQVW9PNVZZU0JLU1JBVTFNMVF4SjVvOVNuMktU?=
 =?utf-8?B?cTdPK2N0ampUMmJtb3NOUWs1Q2tWeGZyZUtIOFdyNU5NWExWMHpCekJISU9j?=
 =?utf-8?B?UlZDdDJKUlpQUTVIUzAwa1VCRUdMV01ZL1ZMYkVTT3ZIVE1vZnF4MktrNmsz?=
 =?utf-8?B?MXF2SVBISEVxSkdiY041anhzTTdYWGFzSDVvL3FUcGpTWHBIYzFkUzk3VnA5?=
 =?utf-8?B?WjlhMjFwdEZFSGZqT1FsMFVFYktHeWFJd3dHVCtyQkNvcG1GNGE3RE0wc0xB?=
 =?utf-8?B?Y3crWjdZOU5yR0NqcXNCZEd3SG9TK3VXQWIyOU9nZVA1KzBNOVZ4MENXQXAw?=
 =?utf-8?B?UXJmVDNEazhDSU16MUZYTE5uVkYwWjc3a24xSmpKR1UzekttaUJvUEJiVXpP?=
 =?utf-8?B?QkhSbkhFSExjTFBtVUV4dnVQZ3pzZ2o4cWN3YUlTQStDRzR3RUlxQXoyVHVK?=
 =?utf-8?B?MkZjL1M3Zklhb25FQ2sxaTZqSWU2MzN5R3o3YTdYWTZzTEJFVEhPajJDTjND?=
 =?utf-8?B?aUxMdjVvMjFyN1o1Z2IrenlEdURaNlZ6bW9pa1M2bDVOY0U0b3pPckxWc1FR?=
 =?utf-8?B?cSt6OEtMSU5tOHF4YnFDSWNQcG5WYVhGbFVtSUtRZzl3NEJSQ1BBd253bnVn?=
 =?utf-8?B?QTkvTGZNMnYwQ29pRUV5RmlndVBpRThLOTBWV1F0eFN3UVFCOW8vTkl3clUv?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5255676f-3e32-44e2-eb22-08dd20f2e0a7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:36:08.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye5iJTi/nGHVV3Z186I0aaAhEA6Fz7ZS/dTJttrFUnzWaYp5NnBp5wAxl6iyFfuDxBD0bHt80L4UxJ2AlS4lqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

Most of the registers in the driver, and their values, are hard-coded
which makes the code rather difficult to read and maintain. Add register
and field definitions and use them to replace the hard-coded values
where possible.

This patch does not change the driver functionality or its structure.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 207 +++++++++++++++++-----
 1 file changed, 163 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ed4d5db1ff8d1..47842facec125 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,9 +16,118 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define DEBUG_EXTRA_REG			0x09
-#define DEBUG_EXTRA_PCLK_25MHZ		0x00
-#define DEBUG_EXTRA_PCLK_75MHZ		0x01
+/* TOP_CTRL */
+#define MAX96712_DEBUG_EXTRA_REG			0x0009
+#define   DEBUG_EXTRA_PCLK_25MHZ			0x00
+#define   DEBUG_EXTRA_PCLK_75MHZ			0x01
+#define MAX96724_TOP_CTRL_PWR1				0x0013
+#define   RESET_ALL					BIT(6)
+
+/* BACKTOP0 */
+#define MAX96712_BACKTOP0_12				0x040b
+#define   CSI_OUT_EN					BIT(1)
+#define   SOFT_BPP_0_MASK				GENMASK(7, 3)
+#define   SOFT_BPP_0_SHIFT				3
+#define MAX96712_BACKTOP0_22				0x0415
+#define MAX96712_BACKTOP0_25				0x0418
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK		GENMASK(4, 0)
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_SHIFT		0
+#define   PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN		BIT(5)
+#define   OVERRIDE_BPP_VC_DT_0_2			BIT(6)
+#define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
+
+/* MIPI_PHY */
+#define MAX96712_MIPI_PHY_0				0x08a0
+#define   PHY_4X2					BIT(0)
+#define   PHY_2X4					BIT(2)
+#define   PHY_1X4A_22					BIT(3)
+#define   PHY_1X4B_22					BIT(4)
+#define   FORCE_CLK0_EN					BIT(5)
+#define   FORCE_CLK3_EN					BIT(6)
+#define   FORCE_CSI_OUT_EN				BIT(7)
+#define MAX96712_MIPI_PHY_2				0x08a2
+#define   T_HS_TRAIL_MASK				GENMASK(1, 0)
+#define   T_HS_TRAIL_SHIFT				0
+#define   T_LPX_MASK					GENMASK(3, 2)
+#define   T_LPX_SHIFT					2
+#define   PHY_STDBY_N_MASK				GENMASK(7, 4)
+#define   PHY_STDBY_N_SHIFT				4
+#define   PHY0_EN					BIT(4)
+#define   PHY1_EN					BIT(5)
+#define   PHY2_EN					BIT(6)
+#define   PHY3_EN					BIT(7)
+#define MAX96712_MIPI_PHY_3				0x08a3
+#define   PHY0_LANE_MAP_MASK				GENMASK(3, 0)
+#define   PHY0_LANE_MAP_SHIFT				0
+#define   PHY1_LANE_MAP_MASK				GENMASK(7, 4)
+#define   PHY1_LANE_MAP_SHIFT				4
+#define MAX96712_MIPI_PHY_5				0x08a5
+#define   PHY0_POL_MAP_MASK				GENMASK(2, 0)
+#define   PHY0_POL_MAP_SHIFT				0
+#define   PHY1_POL_MAP_MASK				GENMASK(5, 3)
+#define   PHY1_POL_MAP_SHIFT				3
+#define   T_CLK_PREP_MASK				GENMASK(7, 6)
+#define   T_CLK_PREP_SHIFT				6
+#define MAX96712_MIPI_PHY_13				0x08ad
+#define   T_T3_PREBEGIN_MASK				GENMASK(5, 0)
+#define   T_T3_PREBEGIN_SHIFT				0
+#define MAX96712_MIPI_PHY_14				0x08ae
+#define   T_T3_PREP_MASK				GENMASK(1, 0)
+#define   T_T3_PREP_SHIFT				0
+#define   T_T3_PREP_40NS				0
+#define   T_T3_PREP_55NS				1
+#define   T_T3_PREP_66_7NS				2
+#define   T_T3_PREP_86_7NS				3
+#define   T_T3_POST_MASK				GENMASK(6, 2)
+#define   T_T3_POST_SHIFT				2
+
+/* MIPI_TX: 0 <= phy < 4 */
+#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
+#define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
+#define   CSI2_TWAKEUP_H_SHIFT				0
+#define   CSI2_VCX_EN					BIT(4)
+#define   CSI2_CPHY_EN					BIT(5)
+#define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
+#define   CSI2_LANE_CNT_SHIFT				6
+
+/* VRX_PATGEN */
+#define MAX96712_VRX_PATGEN_0				0x1050
+#define   VTG_MODE_MASK					GENMASK(1, 0)
+#define   VTG_MODE_SHIFT				0
+#define   VTG_MODE_VS_TRACKING				0
+#define   VTG_MODE_VS_TRIGGER				1
+#define   VTG_MODE_AUTO_REPEAT				2
+#define   VTG_MODE_FREE_RUNNING				3
+#define   DE_INV					BIT(2)
+#define   HS_INV					BIT(3)
+#define   VS_INV					BIT(4)
+#define   GEN_DE					BIT(5)
+#define   GEN_HS					BIT(6)
+#define   GEN_VS					BIT(7)
+#define MAX96712_VRX_PATGEN_1				0x1051
+#define   VS_TRIG					BIT(0)
+#define   PATGEN_MODE_MASK				GENMASK(5, 4)
+#define   PATGEN_MODE_SHIFT				4
+#define   PATGEN_MODE_CHECKERBOARD			(1 << PATGEN_MODE_SHIFT)
+#define   PATGEN_MODE_GRADIENT				(2 << PATGEN_MODE_SHIFT)
+#define   GRAD_MODE					BIT(7)
+#define MAX96712_VRX_PATGEN_VS_DLY			0x1052
+#define MAX96712_VRX_PATGEN_VS_HIGH			0x1055
+#define MAX96712_VRX_PATGEN_VS_LOW			0x1058
+#define MAX96712_VRX_PATGEN_V2H				0x105b
+#define MAX96712_VRX_PATGEN_HS_HIGH			0x105e
+#define MAX96712_VRX_PATGEN_HS_LOW			0x1060
+#define MAX96712_VRX_PATGEN_HS_CNT			0x1062
+#define MAX96712_VRX_PATGEN_V2D				0x1064
+#define MAX96712_VRX_PATGEN_DE_HIGH			0x1067
+#define MAX96712_VRX_PATGEN_DE_LOW			0x1069
+#define MAX96712_VRX_PATGEN_DE_CNT			0x106b
+#define MAX96712_VRX_PATGEN_GRAD_INCR			0x106d
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		0x106e
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		0x1071
+#define MAX96712_VRX_PATGEN_CHKR_RPT_A			0x1074
+#define MAX96712_VRX_PATGEN_CHKR_RPT_B			0x1075
+#define MAX96712_VRX_PATGEN_CHKR_ALT			0x1076
 
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
@@ -96,18 +205,18 @@ static int max96712_write_bulk_value(struct max96712_priv *priv,
 
 static void max96712_reset(struct max96712_priv *priv)
 {
-	max96712_update_bits(priv, 0x13, 0x40, 0x40);
+	max96712_update_bits(priv, MAX96724_TOP_CTRL_PWR1, RESET_ALL, RESET_ALL);
 	msleep(20);
 }
 
 static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
 {
 	if (enable) {
-		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, CSI_OUT_EN);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, FORCE_CSI_OUT_EN);
 	} else {
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
-		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, 0x00);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, 0x00);
 	}
 }
 
@@ -119,39 +228,47 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	max96712_mipi_enable(priv, false);
 
 	/* Select 2x4 mode. */
-	max96712_write(priv, 0x8a0, 0x04);
+	max96712_write(priv, MAX96712_MIPI_PHY_0, PHY_2X4);
 
 	/* TODO: Add support for 2-lane and 1-lane configurations. */
 	if (priv->cphy) {
-		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xa0);
+		/* Configure a 3-lane C-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1),
+			       (2 << CSI2_LANE_CNT_SHIFT) | CSI2_CPHY_EN);
 
 		/* Configure C-PHY timings. */
-		max96712_write(priv, 0x8ad, 0x3f);
-		max96712_write(priv, 0x8ae, 0x7d);
+		max96712_write(priv, MAX96712_MIPI_PHY_13, 0x3f);
+		max96712_write(priv, MAX96712_MIPI_PHY_14,
+			       (0x1f << T_T3_POST_SHIFT) | T_T3_PREP_55NS);
 	} else {
-		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xc0);
+		/* Configure a 4-lane D-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1), 3 << CSI2_LANE_CNT_SHIFT);
 	}
 
 	/* Configure lane mapping for PHY0 and PHY1. */
 	/* TODO: Add support for lane swapping. */
-	max96712_write(priv, 0x8a3, 0xe4);
+	max96712_write(priv, MAX96712_MIPI_PHY_3, 0xe4);
 
 	/* Configure lane polarity for PHY0 and PHY1. */
 	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
 		if (priv->mipi.lane_polarities[i])
 			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
-	max96712_write(priv, 0x8a5, phy5);
+	max96712_write(priv, MAX96712_MIPI_PHY_5, phy5);
 
 	/* Set link frequency for PHY0 and PHY1. */
-	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_22,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_25,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
 
 	/* Enable PHY0 and PHY1 */
-	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
+	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
 }
 
 static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
@@ -169,49 +286,51 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
 
 	if (!enable) {
-		max96712_write(priv, 0x1051, 0x00);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, 0x00);
 		return;
 	}
 
-	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+	max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x1058,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_DLY, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_LOW,
 				  (v_active + v_fp + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x105b, 0, 3);
-	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
-	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
-	max96712_write_bulk_value(priv, 0x1064,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2H, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2D,
 				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
-	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active, 2);
 
 	/* Generate VS, HS and DE in free-running mode. */
-	max96712_write(priv, 0x1050, 0xfb);
+	max96712_write(priv, MAX96712_VRX_PATGEN_0,
+		       GEN_VS | GEN_HS | GEN_DE | VS_INV | HS_INV |
+		       (VTG_MODE_FREE_RUNNING << VTG_MODE_SHIFT));
 
 	/* Configure Video Pattern Generator. */
 	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
 		/* Set checkerboard pattern size. */
-		max96712_write(priv, 0x1074, 0x3c);
-		max96712_write(priv, 0x1075, 0x3c);
-		max96712_write(priv, 0x1076, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_A, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_B, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_ALT, 0x3c);
 
 		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7, 3);
 
 		/* Generate checkerboard pattern. */
-		max96712_write(priv, 0x1051, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_CHECKERBOARD);
 	} else {
 		/* Set gradient increment. */
-		max96712_write(priv, 0x106d, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_GRAD_INCR, 0x10);
 
 		/* Generate gradient pattern. */
-		max96712_write(priv, 0x1051, 0x20);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_GRADIENT);
 	}
 }
 
-- 
2.34.1


