Return-Path: <linux-media+bounces-60505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD2dKgOy+mltRwMAu9opvQ
	(envelope-from <linux-media+bounces-60505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC624D5D24
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 556623041854
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 03:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8460F2DFF3F;
	Wed,  6 May 2026 03:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="D5/E9ey5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218726E6E2;
	Wed,  6 May 2026 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037227; cv=fail; b=LOYxIx/1tslOnqm00Qld6NPRHHFa0f1NwMo3qsSKc2shGqlk6HkD2Y+7S4mxn6mkH0ZpsvomsMHKgELOFIABrAqBC4cvki5/bb1EuQhPA+nOSp6d+v3hdFxIXaTn/BqNWRQ83fcpVkUI2qTIvFA8/TrZuuTnwLg8pYxvAhZlKi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037227; c=relaxed/simple;
	bh=GT8Z0vh3ehEh55FCPkCOy/GN9oFMdMG89iLdazjsXfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AgpwIAblcEGfDAKDC9VKVSmG4OIwW9F+ONQhg1YaILEz1TbsRWkoWBMisKiSvxDAyxGWda0EwjbNKoDcMeHG3+lQuNdbJeYusLxuFs45gvaiZLSuCyWaWA/A8r/1uuo4cYRLT2lLsmOpjvGd49cMLyz1zosmlD2ULlzmGwC/bfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=D5/E9ey5; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6461vfe0156619;
	Wed, 6 May 2026 03:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=b+P0R+lNeCLtPvP/gNR0AzcgJzn0eMWTvyxUTnIxxqM=; b=
	D5/E9ey5hHT97NcrqFZc7uFpLGTfIxthGY2kKGn6EZjnJbwRlAe8i5FMrvq4pjFy
	VGCEU9f/nzek5KPlxV5/3t87KW1G0NM31bJ20OsH1BHBPNZ/5eGZOrWgCafIYQyF
	5S12SjXd+qLeWprimtAQSgXigY97YNuaNWeILaV4+6feJgXXptBUFhfisd3kKFnE
	YvxpqGQYXqNhv6/abyMZ/mAi59+IxmEQnpM1BewB5mrj72OjvkjNwqusxhjutnBE
	0uMG5W+AwDTDApCKLdfyg6BzDWLHLBklwqCDmtbvVWACbpstw2xUJJizw7JyrchK
	DPmyxBEpsdm0vB2Wf2uUjQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010061.outbound.protection.outlook.com [52.101.193.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu4dc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 03:13:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K06paJFc30d+7v3Q2wjg6mTEPZk1AurtaRRXgjSr3BMqCCUhf1XvDiJt4fqfQtF1GZQAF7qj3B9RK8IWdt2MlMO9x3Zyb/ioRqEJt7Q6tqUgIi5g3qbkFtR8KGvMDaPChEPXwl4m8J+jD4iqcQ9Y1YRW2t5+r6VYd6OLB8T1ozUXrmGLObWwoQECBLpYZnmH5JhoBU0zGG9q4VFd1lCrynp+gMIaJLB8RHttc1yZPn87N5fd15uMCdl4aMQSpK3rid7RoenrZDANkQiCQwuPUXiX5eCZ1KuaakY5KuqzdvYbDn0AgAfVSStzKA+GlzLF3yK07VAvIkfS6l8Qsk4T/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+P0R+lNeCLtPvP/gNR0AzcgJzn0eMWTvyxUTnIxxqM=;
 b=NPLujXoPyWmje2Q0GOoN9fv9XcQRrmD35y+4qlet5iIUdfYZmOZoCfLEuGElsMaWMHO9obrlJCwn0bNWFhvIrHsUiUi9+J863RxR3zpP3j6r6DlXxgqjeqi8z9siymRcD4hu0NfxoNPSAR8x4N0+Mu5PseG2lkTVYi/W1/J/EhfLHVzFhBUyKWT+On7Wh0I64awvmx355/xfP7JLofEmF4gmZRpsys+TD6nCIFls2J+Go0zYe5f0Aga4SbHQc/stspii/o26B8Bchvu4gfmc8o7ese79ER8TA5RBKjDioKI2mjhRJ4PTA6MkdywblXNe2upcQBPBvg6K1jv40EjT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:13:05 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 03:13:05 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 3/4] media: imx8-isi: fix isi->pipes memory leak in probe and remove
Date: Wed,  6 May 2026 11:12:09 +0800
Message-ID: <20260506031210.2769998-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0050.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::19)
 To SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 9052126d-15eb-41e5-198f-08deab1d6411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/bFDL00m9Vhi8/OQu8gLGxQTtdVzkT1+6EFL2diBZCwoAMatboYaM9FaQIVW7jdLTKd2m2wBOO05eS5lpRUOAKdqR3BK51fg4Ksv2UXxKzxMX0OpYCs2V79LcX5KroohN1DHRk+6kxHm6cFXRkINg80OIdFZDb2kie5VktgFBgZQzhMluNrJp752g3/vRwvYy+y2Z5HSqB7W2zt/aMBYRKe/eTd4fCaRAyhAvPohqBo6O7wz6y7kpZHbEEj/RZ4W/Uc+dXmi8bTarZ6AX5LBLrU3MlQqdzG6H6QtkWy4drY8+3H+/8m2iiIewEeqI20MB47R9+HcY4GlzJkemjRY92ZNzL8x6D8Gt9kpAD6GnY2wo3xIrs0KAfLv6ra+n5kUETs2qXlC4zD9nPeYrapx4z6ZAH+Li3bWac4TxaSf+mFls5siL/wK32HMNfrwmWhVvTr5gyDyD0UHHaxPdChKNycjkjyHK7Zk+hd5u7SGG/g1gPyARNJXqPGJCwRwLluFkBNnWQ+y1u2qDlpzMMOQy2apP00g/AgJaSa2rmjBuBx/0QzD2h9Dh2QA6wRxJLKcpD9CY2Gi08BXWFsVa4NXpGG/KaVWW94ZmUs4nNM5Ziig8HX0POfbvQvE3e4xeaR476H0qDWUtXEucnEr90Blv+CyWt9vrB9VWLZA9EGd5yFXnirSAldlbF+gKiFw2CF/6hKW/1Hc5et+dHDI9mmJCsqBpV7Nu2bozydnbbj6tzxbBEmo5TbDMs4kQe0+aekQUklS3HexLrKwQP4qKVZdVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?suRsmuslOXPxtWRup1XPvOoM2N2Dza4IrR5sFNHD2dXsOIg+UTpQy7KeHdS6?=
 =?us-ascii?Q?n2hJUEumlIrW4h6XeBSuJEuNNgSWoy/iGBjuJiol1zvpqv4gWHdgDB83IldQ?=
 =?us-ascii?Q?CKcTyOrYQFzsmCJSH8cfeRR41UoD2/AjZt7cIYFvAre+p+j84QlHRcFOwpsQ?=
 =?us-ascii?Q?AZF1BdmWh0MLeeFA1Jmt7PgrCPhFVo4cXfrk+EuhtlGiq2ya3xciatAS6Z0K?=
 =?us-ascii?Q?7oV9I9m4PHloKr+c07qbM983kr9RDtAQlEGkjMeyFZBzeMDDz/H/g+WyxAVL?=
 =?us-ascii?Q?kLSgYDi2KFi2NSCS2vGgua6rXcbGYtwmRr97QtUcDBgBlfejlWLty3snZMIg?=
 =?us-ascii?Q?hHPRdwnMCB2WZo6vrsTpxoGVpKhIdIKQr0YnNCKNkvUDEi5ZpNJPy6HSVsk/?=
 =?us-ascii?Q?vbiIWLR3rbCBfjqpXrPnl/9q4PY91lBQcM4e3L0lRpCbllkVMivaaaumYXso?=
 =?us-ascii?Q?4hPaqtU2RJKsa7QAkGNujQ8FkOFd8UXMYQMCS8PNJxJ3PnhvT/X8IUzHmJse?=
 =?us-ascii?Q?4079azSxtwn0DXqtepzkCwalxrm7v3O7NAJKtViWGQJQvkNpT6tDmUGqXLC6?=
 =?us-ascii?Q?n27Bw0AAzxYhn9EkKZ+KglkzMknH6jTxfq7Z8PGW/MGSdaLmDM2S3w3OBKfo?=
 =?us-ascii?Q?c+BjwH647RsYYjwKoMYPJ9VmrMpzxGLu9+m2Uwm0eB6AESN8mJN9wwQUB7qw?=
 =?us-ascii?Q?0foRKmBuV4Zf7gcnEV5a6ScUTUZaFLOwGEQD6DWiKqJwoU0WfRAhfT4TpMmR?=
 =?us-ascii?Q?Pl6Sz574BeImBdRNlTTBuq7FvB+xtnM8UI/l19x1TfqF2JuFkbD83zvMaf+z?=
 =?us-ascii?Q?p3j5rStCcBM9pSA10pMgMbqlJG1IHBWxA+IMmvmMrTrVhFtWpQI2NRwghHTS?=
 =?us-ascii?Q?kA6jmPixoYlCWvqa1YytQaUo6tzNOTzwAUxsmeqKF9fIJ52ahiU04JbFW50e?=
 =?us-ascii?Q?BFw53VlHrTPKulk0ftJAr+hwkoul/KQnVuNikNtYkENX5drTt8rmRYWmuWRD?=
 =?us-ascii?Q?onctYf283RHz+ONecvQuSj2b4djfJHlmKTEc5Abubr0AQw7WilAn1vz7s2Xk?=
 =?us-ascii?Q?XD9h7+WFp6dD9MsKaALihIOaKHq3D5SHTBDigtqA9rE3gJAQAO+q8LRSQIG3?=
 =?us-ascii?Q?cUQhx7yEdU5i+b9UBoBhw5GtEAxqBHqN2C3BUrtUog3sLL1U/9MxExRi7Ut1?=
 =?us-ascii?Q?Vl5fwOwboEhsrdJKXlW3Qh5q7q+USp8GweoiUozMxR79Qgl4K9+ngHv1q2+K?=
 =?us-ascii?Q?L2agL07b2FCb2nstG/AkjXWGHRHBbvCufWKNkD/n4VmYl2zYnbEU10lexCwN?=
 =?us-ascii?Q?R6aqR2S08HjafiGcPHpEfiZZY3/biC/tb2W9zokGUFFgfvJf0uCsa4iexNNy?=
 =?us-ascii?Q?xZQBg5yE37mX/UBqjGSh7KvIDOei6xedtgMh1KoUccl8OKRRIh+TjQKyUHyy?=
 =?us-ascii?Q?ZsJNplVC3DX57Y4k+H3o//ZKdge8d4BJequOcjDv6kAuDuTS9qDB7piDzC6O?=
 =?us-ascii?Q?PXsFXP5E5GF1cW48+uqSzYuCibwvaoK0IoEwkChoZfaDRgek0+ERnKu27NoL?=
 =?us-ascii?Q?drx4b40OXu5q4f3Ajv/ApGwuXC4reeT344YdXKOoqrIVZhU+42SUsJuIjMot?=
 =?us-ascii?Q?H59BYUVKRcFeQj3wkxAbFc7Ipr3ngBmRkKKq84RrVerJZI0ldJlMjvFY/Jhd?=
 =?us-ascii?Q?DnTlzRaw9GnvQ6w47kfZfRkID5yImuufPjQMJ0QujxdnebQUyRD3JePS2bQ+?=
 =?us-ascii?Q?VDmGqaGuacydml2hjYZ7kl+YqiUcH44=3D?=
X-Exchange-RoutingPolicyChecked:
	aTkZxR6ljE1PQea0HxnzBDzP3ookq/WAhu516A6rA7VI9sGIBCc2d/E6EMOfdSdb8ROsEYdsIZ5xcDcbL3mswJniEG/Umc8tT2UUtJ6zi/oIn+jalBDzI16kOUbdUyvn1CBpnPzIseLVqpjb6QkPFagLZB1jkioWS1GM9aTeU566W+PGjBUBd1TxRFDKPs2BU6WIszjIvy6O5iec8Pdx8I5u8Q2jlaKnimmXA/8cNYlk6IQtewZl3X0po0Kj4ef+fJp5eqhwTufk+zMaVJue1SV6UgHK/TqCROz4brMFPewxaQ7GNPztYePXjqnquBliAS2Yl1g3R7H3xVY2hBa1Gg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9052126d-15eb-41e5-198f-08deab1d6411
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:13:05.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFWYccT7rVrNAtt3hx1fospGjjiwoYk0JhUqRfCJuZqwNTp3iHm08AdF5rsFc9eCWyMveNFlkiENuwRwE9v/lCh/Q7p7iXbuMjZlQaFxnH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fab1c3 cx=c_pps
 a=2eujPE0xRaAfCuSU6K/fwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=78pQybC1poxpKYY0_T8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyOSBTYWx0ZWRfX+xecvVjRqSav
 DkzWgUabbmkBm/jC8L0goDMK2bJoslgJnlRs3Ie2M2EuNDjuOiTJR8cG2EA/UwqIVD6KX4nAYIg
 l4vAloLKvu8YnWPanxz2bNaW+gKlwjbqLFNiLH5PltahboQt5Een9/2KNteH0HfLqwCoSpLbH5f
 aTlNudL1cVT5W17PyY25hX8n1l7OTe8n4b9zgmuCRrFM8IUEd6KTo33xIvQCjjt8zq+9ErqQOJL
 a3MFsAxTmffYkl0zgAul/VzT8pJ4rvt8jqnvS2ngefo40jd8Q+ZCKVwZ3YRStIR3R1LGlVgS7iQ
 ierVP6GychEDHMyMoRO3u8h9QAkfo9u1FrK/iZ9lbO35SRQIfqZmKAB5QI8/+VzBdd1Yl9tTecP
 bGiH7O2QnDFaOsUrEAxfp+NAK/YIY07y5WzpAa8iLeenoMBiTvITip7KlfWKPCTUsF5XD5YCHTS
 KyaQMzbRvC/RXBKJImg==
X-Proofpoint-ORIG-GUID: t_wtsMBRs9DJ942NPEEIunRcPNKB8wLu
X-Proofpoint-GUID: t_wtsMBRs9DJ942NPEEIunRcPNKB8wLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060029
X-Rspamd-Queue-Id: 6BC624D5D24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60505-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking
the allocation on every failed probe and every normal unbind.

Fix this by switching from kzalloc_objs() to devm_kcalloc(), which
ties the allocation lifetime to the device and eliminates the need
for explicit kfree() in all error paths and in mxc_isi_remove().

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2d639b789910..2b76fb9c18f6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 	isi->pdata = of_device_get_match_data(dev);
 
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
+	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
+				  sizeof(*isi->pipes), GFP_KERNEL);
 	if (!isi->pipes)
 		return -ENOMEM;
 
-- 
2.43.0


