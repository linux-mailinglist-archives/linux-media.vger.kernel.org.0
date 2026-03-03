Return-Path: <linux-media+bounces-54316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIl+FEu9pmlDTQAAu9opvQ
	(envelope-from <linux-media+bounces-54316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F91ECFB0
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A862D3039346
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A859C3B4EAE;
	Tue,  3 Mar 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="J/UMUBf+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7353B4E96;
	Tue,  3 Mar 2026 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535065; cv=fail; b=AtITKnD1K0QlpKCBAIc2xwRVgbs6V5KafhutEg0dFVHte/4KIGEy6etQMFLImTSQ4bpbaPS1e+22k8tNYz9ZgTGInoMJwqfyXoFGeaNLz1YZT9lcJ6LHCn7+XsGvDii4b8aWYo+h7J6tmJrxVPzy+yV77x+AI58B8xkIiltP0as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535065; c=relaxed/simple;
	bh=V5PqaMi/A/zkReEZYmsiui5xTmvOlENN2Uohhsw//U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVlvYC2nCYrkXfloAldA/CKGS+N8mey5uanu0dhr2R/4AJNhbqeDpWdBjsNnXSfTrzm5PbaMfocoxSv+M+OHR9n38zQbP06YiCk9IZmSyIyZ+EBljeGSXQQE4Qhz38o05aRXMkugT0/pbUwsS2o+zfQOsIZk5W0iDEJBu/LpfU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=J/UMUBf+; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234Uaob1496548;
	Tue, 3 Mar 2026 10:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2JHu37lJsE9EfEYYHfia9R7J3IwNIwitwNHyS3zu1iA=; b=
	J/UMUBf+UyFA99Z1qDML7mjWRmdH8RtONXS9WJyJ/1vp3uis7KS2NeUQfVWYF7fj
	qabVauiI1MgtefZYaq3xQXJmPC6jK07pjgXzirITJ64HRqXnqOdMLLhWbrn/oYRP
	/VkUFFnb2DcRsKwR8gltm3MuqB2SVxmgaVXbhwzzW7I0cDrjBI6sbpkYtrd7jk27
	jZAHiCl0OttXw/akw4Ne+7lPeItGqM9CKagwL3Kw4zbvhk5jZouT2ioT/u/eeEiY
	rVMQMpEcA86lms7OtW9vbCv4sn9iTM+YV9oMSZPFhx7UdX9krT4quLGOx7PhUDGl
	TChrl38AW+ZegPifsnmO2g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kjrb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 10:50:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ3a2/fanGjYZVzqSOlIv0FMgPGVFL+jG1Advj/vTW12oXZPtldpoLSpvvFP7kmOwvELaKks9qn0oaCCQ8kAombodAoPTYW3tP6bRK9pz64Mdd4pKt95k52AsdPL9ScOCNgqqWO7KBvTJ47D+Gu41lT454ghk4QAEbmF1W28P7+407f4TVk+DIzpNByFL6Fcn1s792h0XfwdBm9qA/ClvmNlueXkV6ScM6L7l6sOF8QkwqrDy/xtVjHHLeZ6nVG+og8ef6KxPH/quloaf8kwqblQ35O9fK7OCpzoPuCo4R/MblTpc+s10HmPCMTy/XmgjXv2j4tviGu/XvFlWQM74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JHu37lJsE9EfEYYHfia9R7J3IwNIwitwNHyS3zu1iA=;
 b=H2+GgcLl8DM633U0QmIi3Rb6toSAhcAkDZKC6DY/k5VqjJa05K73h/DQfC0yFBDSSaO02sG15VPuzEfY40xnuzRNSfyj7k/8kmsC3hubF8/JsUgPSDunh7bomTIjd4D27Kc/u8Rcd6x+k+iP9VsarV76McQGVbGpeeQQnfc3heTXbF6j9ID34orCQCyLHRXbnYz2fukmLLIdGgyJQ1MJvD4h660zPeTMfCU+QTIZoM4x7yqhiNoWCr0KfM0dRbsfYwo5Tb+amzBuCqdritzOZUK5vP363V8wTU0pbjmIX9gQpcfjC8mcSJfb46lTKv0XFHiY4SR7jKSp2sGt7RLWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB6837.namprd11.prod.outlook.com
 (2603:10b6:303:221::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:50:21 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:50:21 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] media: i2c: ov9282: Convert to CCI register access helpers
Date: Tue,  3 Mar 2026 18:49:40 +0800
Message-ID: <20260303104942.3111366-2-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 50645f60-ce5b-4a4d-0ef2-08de7912aa5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	jlKxTrWe0cdnDpo82ATglLcZjyx6xWoRD5dnWfu/ouJ3y6+IMdo9R+6cJeN9QkYAFLI9vECwh2IIiPyr8eWxN1Tk1Gsa1rrEsXS6i9vsLx76X2+EE/J21tfjHLHkWZBCX4E4gTU9OW+FB7/eChYQnqiSKx2q4coO6JfhlZVko+UJSutdKQQwLcN7sucjjuLVAtzPcwqlhHd3w5Si2IrsuA8k6d4L3G31LX7sJs3o02HpsF0k8wXCiL89y8lgArLGNMej/2rZ8/x9eR5HKPmwUxpWDQkjECFNo3tRbMOEpqrM2A7xjYOp5Fakgyc9sy/Dx7VSxeqC+jIE1OVcStpV2GK8PqzwEH9qgBl988+RO06+d67q3dOasSgsyP8oSUsClt/G+7CvZgSGtCZSP3EVdAoe2iCqyCtABe2GxkIT1jHgCqomnaBsdcfa+wmYcAHRKjfSA5LD3AO98ADsTqtSyMmId2+xVQCyjR51K7EC64/0e4tSfiybTknTmjfJudMEQmQrfXkdjaPQK3booYbqmD0PeCPgeru/BoXjYi+swmPnfSmKU0wM6cgGgJS6D0NOHus8D613kBaGFkM6av4jrvxjU64u/lb4ni3FtswrWZzjHA8ORbZsyOFCx8ECI6HZSuB9utFEQvUzfR0zo4RCeNJEAl+3Ex10lBKi+JjZRQuKiixT07Qmpzg5FDt5Q5RCOe9rU44qcg9LdiXNl/pzZz+1DhtIOuDSP6c/BvPHT6PUx/qfyjiRNHNGov9mWYDjC3OfGmcA/8yGKlEFuxCqA9WflgZf33qGVLRla+W0apOJSh1Ltfu0r0HA0Db3OKL9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TO7Wb15A4t+GAy25BCbB1+g+s79aSmxaInqHaRPObrBHElgQ1JJGORjIJsEV?=
 =?us-ascii?Q?8cjjg7xWMPVBYIrw3Rn8xSf7jyVzhxhDzTvyH27bw3gtxKygUh7JATx0An4v?=
 =?us-ascii?Q?Hmojs+55oC+wuo4nQpPw41kOTC5u+20AGP9t7oLSAMv8NDhKzyWskrS5dATJ?=
 =?us-ascii?Q?v0fXUwFwUIUjHtSTjrgcNeIP64i0PtT+YM2hPto2FnGVirNmUhM+CTs4nc1c?=
 =?us-ascii?Q?u5Q91e0MAZMM1j8dkmQoLcfs0v7WuwinDxP3MRy+3f9GviNbsVKhOsOrD0Xq?=
 =?us-ascii?Q?6RfPs+Yukppc8+NQIRpNN2K63eXV/05anrOxTzKn0MB5bsCvbDmpf0htPW1X?=
 =?us-ascii?Q?+5Ehhi06dL043N0MmAJ+d+gn1V739UcShOs/OqpZgBTiT1/kmwWhBH9lX/U6?=
 =?us-ascii?Q?BdQPSYsDgtry4oggY6wDrZwG/iqSWayN+cr6NaMR7P2LekVQzwxvkxuhu3le?=
 =?us-ascii?Q?RqQMYXeimsBcL/MX1vvIvtRC1o76RF8DJo84fqqQDUAy/2ByMEdjj4bumMj8?=
 =?us-ascii?Q?JDgfGoGs/4nx6nGAwoA+8SGLqFOKnFEXhVLdSrVGiVSUMp/Joi9SjFcOpExU?=
 =?us-ascii?Q?3rwHKSjeMISrE4m7FUcfRSn+pFSnTdZyAGz+zEieISpe7WNU+qIoxiyKqivQ?=
 =?us-ascii?Q?E4l9bfnIFFB2jt/kwQMbbUCpN2wby3Pr/sNfjT13ZwO8zvQ1GaC3zf3j24+s?=
 =?us-ascii?Q?PAdqkJR7TebRqYWtTyPhN2Cz6BbxVsAUTSohloq5N0nSI2mcKoHWuL5BhWMI?=
 =?us-ascii?Q?S+WHhlyMPr05iy60JmFeHMHQTZChPlmRROIdj/rbXx54eoP8eXkLTLJZE46L?=
 =?us-ascii?Q?hemQAl8/FaKrhlehiGtW0AzNl5G5IeGqvPkz1x4zcl82Y+exQskfZJL+UQm0?=
 =?us-ascii?Q?PJ0EgDTqiTaxKWqam5dmH5Vrsa+7F4rnKTR8Ae/b3V2yhuIub185Jv5pObUc?=
 =?us-ascii?Q?q+xDkHEo23QN2uO8gDrrdlbuNIp8m3yavLXl1+zA8v86jK3KApM2xbt0C97n?=
 =?us-ascii?Q?lgsAIBEDRSAgLw9Q79L2ydZWt7le0lPvksgg5gZnyeLHNM5jAfF7LM0oZitc?=
 =?us-ascii?Q?8/gf64XTAvgy+q1d245fblNTQ87lceANSN8ALQSk2QusBNZ8adj/4Ey8B+I/?=
 =?us-ascii?Q?FhjDr5MYzS3YSoUae0SmlT/mW5Rz4oPzEHDQduam4X4D++Dt1MVDPY71WMu9?=
 =?us-ascii?Q?5RP8ACd+E1U7UfKAfkkRnVQE3C2sf+HO/68AhmZKwMFBD3IyV973MSYqrE7n?=
 =?us-ascii?Q?JK8Y1x1nqPMgV0/LsM1fsXYTnwpGj0GRaXWj2ekfYgm3LE+Czd90hQSglnUN?=
 =?us-ascii?Q?ZTPhmJhHY044ZDGsJJ3vc+UwN+I/Fb0ccyKUSKgggF5i3PUL6dsg5HRnX3tD?=
 =?us-ascii?Q?GZOAg5hnq79CZJTp4L1wtejQY0yQi2J1lTE+rh8GC7SEZEprz/XvEQuOR+Ya?=
 =?us-ascii?Q?3bjKOIq1jyvoZjQj+iP8svXLywG41jjcpwG4st79fJNdB1s+r1C5DzjJcm7w?=
 =?us-ascii?Q?iJ3Y5N1E+R1OKhZ01zeCaeB8+gYT8ShjWVt1BLKaYVTdWneGu/arJFHFCYyo?=
 =?us-ascii?Q?Lm8j/MZoBinkdriDwOuLBstasWesmA6Gso25SYFNXiMJ1PisRBVlcmisOygQ?=
 =?us-ascii?Q?Efz1lzjoGXnSfNbwAIOnzFKUX7GZH6Xr73HZdqoYROYrveYg4svmAZ+EDKKY?=
 =?us-ascii?Q?enTz/tsrS2K5t5zPJd5xHU34OwezaH+fL7kJOjHQ9Vn2rAapokntDgQHe/7K?=
 =?us-ascii?Q?wfRTNa/4afW5bSuBMRBJWWMw28gUKvs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50645f60-ce5b-4a4d-0ef2-08de7912aa5b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:50:21.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/j8DsrcHRts19TrDoHjCgGtm70pJQkM0/bUg1i4ImPCD+AlPYRnoZGJxSgP9yWe7oKmgL8oa3eEbjACBFdCMtu3nVd7vKtu1Q3e9+Bixrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6bcef cx=c_pps
 a=yaJUXpcFNTkE3gTvo4ZtIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=F-GWxTvL4KY9s68XaQkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AwNvFbxWLV1NbH11-WeJ3VczO_2IZTxP
X-Proofpoint-ORIG-GUID: AwNvFbxWLV1NbH11-WeJ3VczO_2IZTxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX1SIo8LyQkSlA
 /oib9SSBaKHr7DDQFNxc3TLgbP2dlFGrIMYKw0THGmANy6tYNvvOOVGuyL9siK/bVncRAKz0lHr
 84dn7Bdj6WiHNG0k7PG+le9uhH3sqjybVJllLprZJbLZsV3NNi5JoPzkQthulmypg0zAjADsIVM
 pORvmGsbou1e2bzV+pgRFcrRg7XCMKjql1/Kc3lxIsof9ryC8EjiyLKA9IGHQJPR8nJgdPHeSBS
 4o5YYncSbVy1jFkUuhH0lxeR1ePO3AGd7H3iuipTEffEOX+L6XQY9YR8hpejZosDLahfedZWT1H
 ZHR8wjUQQeHS8yjGsEwPXLEgqx4WnUPgMbXl0iYPoxTZizekBmArPb24PQSB0zmP0YPUnDtPBwS
 LyDZxT6CkzdlIynA/2ZQ4DAedWLCLlYD4thw3TSIJxbmOU92UTppeIMClzq4yx76jiAS5vkih5I
 2WccxYtnUdF9cTztY2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030082
X-Rspamd-Queue-Id: E82F91ECFB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54316-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,windriver.com:dkim,windriver.com:email,windriver.com:mid,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use the new common CCI register access helpers to replace the private
register access helpers in the ov9282 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 293 ++++++++-----------------------------
 2 files changed, 64 insertions(+), 230 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87a..3027e71fd8fb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -690,6 +690,7 @@ config VIDEO_OV8865
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index ded9b2044ff8..8bfaa3ae4be5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -12,38 +12,40 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /* Streaming Mode */
-#define OV9282_REG_MODE_SELECT	0x0100
+#define OV9282_REG_MODE_SELECT	CCI_REG8(0x0100)
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
-#define OV9282_REG_PLL_CTRL_0D	0x030d
+#define OV9282_REG_PLL_CTRL_0D	CCI_REG8(0x030d)
 #define OV9282_PLL_CTRL_0D_RAW8		0x60
 #define OV9282_PLL_CTRL_0D_RAW10	0x50
 
-#define OV9282_REG_TIMING_HTS	0x380c
+#define OV9282_REG_TIMING_HTS	CCI_REG16(0x380c)
 #define OV9282_TIMING_HTS_MAX	0x7fff
 
 /* Lines per frame */
-#define OV9282_REG_LPFR		0x380e
+#define OV9282_REG_LPFR		CCI_REG16(0x380e)
 
 /* Chip ID */
-#define OV9282_REG_ID		0x300a
+#define OV9282_REG_ID		CCI_REG16(0x300a)
 #define OV9282_ID		0x9281
 
 /* Output enable registers */
-#define OV9282_REG_OUTPUT_ENABLE4	0x3004
+#define OV9282_REG_OUTPUT_ENABLE4	CCI_REG8(0x3004)
 #define OV9282_OUTPUT_ENABLE4_GPIO2	BIT(1)
 #define OV9282_OUTPUT_ENABLE4_D9	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE5	0x3005
+#define OV9282_REG_OUTPUT_ENABLE5	CCI_REG8(0x3005)
 #define OV9282_OUTPUT_ENABLE5_D8	BIT(7)
 #define OV9282_OUTPUT_ENABLE5_D7	BIT(6)
 #define OV9282_OUTPUT_ENABLE5_D6	BIT(5)
@@ -53,7 +55,7 @@
 #define OV9282_OUTPUT_ENABLE5_D2	BIT(1)
 #define OV9282_OUTPUT_ENABLE5_D1	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE6	0x3006
+#define OV9282_REG_OUTPUT_ENABLE6	CCI_REG8(0x3006)
 #define OV9282_OUTPUT_ENABLE6_D0	BIT(7)
 #define OV9282_OUTPUT_ENABLE6_PCLK	BIT(6)
 #define OV9282_OUTPUT_ENABLE6_HREF	BIT(5)
@@ -62,14 +64,14 @@
 #define OV9282_OUTPUT_ENABLE6_VSYNC	BIT(1)
 
 /* Exposure control */
-#define OV9282_REG_EXPOSURE	0x3500
+#define OV9282_REG_EXPOSURE	CCI_REG24(0x3500)
 #define OV9282_EXPOSURE_MIN	1
 #define OV9282_EXPOSURE_OFFSET	25
 #define OV9282_EXPOSURE_STEP	1
 #define OV9282_EXPOSURE_DEFAULT	0x0282
 
 /* AEC/AGC manual */
-#define OV9282_REG_AEC_MANUAL		0x3503
+#define OV9282_REG_AEC_MANUAL		CCI_REG8(0x3503)
 #define OV9282_DIGFRAC_GAIN_DELAY	BIT(6)
 #define OV9282_GAIN_CHANGE_DELAY	BIT(5)
 #define OV9282_GAIN_DELAY		BIT(4)
@@ -78,28 +80,28 @@
 #define OV9282_AEC_MANUAL_DEFAULT	0x00
 
 /* Analog gain control */
-#define OV9282_REG_AGAIN	0x3509
+#define OV9282_REG_AGAIN	CCI_REG8(0x3509)
 #define OV9282_AGAIN_MIN	0x10
 #define OV9282_AGAIN_MAX	0xff
 #define OV9282_AGAIN_STEP	1
 #define OV9282_AGAIN_DEFAULT	0x10
 
 /* Group hold register */
-#define OV9282_REG_HOLD		0x3308
+#define OV9282_REG_HOLD		CCI_REG8(0x3308)
 
-#define OV9282_REG_ANA_CORE_2	0x3662
+#define OV9282_REG_ANA_CORE_2	CCI_REG8(0x3662)
 #define OV9282_ANA_CORE2_RAW8	0x07
 #define OV9282_ANA_CORE2_RAW10	0x05
 
-#define OV9282_REG_TIMING_FORMAT_1	0x3820
-#define OV9282_REG_TIMING_FORMAT_2	0x3821
+#define OV9282_REG_TIMING_FORMAT_1	CCI_REG8(0x3820)
+#define OV9282_REG_TIMING_FORMAT_2	CCI_REG8(0x3821)
 #define OV9282_FLIP_BIT			BIT(2)
 
-#define OV9282_REG_MIPI_CTRL00	0x4800
+#define OV9282_REG_MIPI_CTRL00	CCI_REG8(0x4800)
 #define OV9282_GATED_CLOCK	BIT(5)
 
 /* Flash/Strobe control registers */
-#define OV9282_REG_STROBE_FRAME_SPAN		0x3925
+#define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
 /* Input clock rate */
@@ -139,16 +141,6 @@ static const char * const ov9282_supply_names[] = {
 
 #define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
 
-/**
- * struct ov9282_reg - ov9282 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct ov9282_reg {
-	u16 address;
-	u8 val;
-};
-
 /**
  * struct ov9282_reg_list - ov9282 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -156,7 +148,7 @@ struct ov9282_reg {
  */
 struct ov9282_reg_list {
 	u32 num_of_regs;
-	const struct ov9282_reg *regs;
+	const struct reg_sequence *regs;
 };
 
 /**
@@ -188,6 +180,7 @@ struct ov9282_mode {
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
  * @sd: V4L2 sub-device
+ * @regmap: Regmap for sensor register access
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
  * @inclk: Sensor input clock
@@ -209,6 +202,7 @@ struct ov9282_mode {
 struct ov9282 {
 	struct device *dev;
 	struct v4l2_subdev sd;
+	struct regmap *regmap;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
@@ -241,7 +235,7 @@ static const s64 link_freq[] = {
  * register arrays as some settings are written as part of ov9282_power_on,
  * and the reset will clear them.
  */
-static const struct ov9282_reg common_regs[] = {
+static const struct reg_sequence common_regs[] = {
 	{0x0302, 0x32},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
@@ -305,11 +299,6 @@ static const struct ov9282_reg common_regs[] = {
 	{0x5a08, 0x84},
 };
 
-static struct ov9282_reg_list common_regs_list = {
-	.num_of_regs = ARRAY_SIZE(common_regs),
-	.regs = common_regs,
-};
-
 #define MODE_1280_800		0
 #define MODE_1280_720		1
 #define MODE_640_400		2
@@ -317,7 +306,7 @@ static struct ov9282_reg_list common_regs_list = {
 #define DEFAULT_MODE		MODE_1280_720
 
 /* Sensor mode registers */
-static const struct ov9282_reg mode_1280x800_regs[] = {
+static const struct reg_sequence mode_1280x800_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -348,7 +337,7 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
 	{0x4509, 0x00},
 };
 
-static const struct ov9282_reg mode_1280x720_regs[] = {
+static const struct reg_sequence mode_1280x720_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -379,7 +368,7 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x4509, 0x80},
 };
 
-static const struct ov9282_reg mode_640x400_regs[] = {
+static const struct reg_sequence mode_640x400_regs[] = {
 	{0x3778, 0x10},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -485,97 +474,6 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov9282, sd);
 }
 
-/**
- * ov9282_read_reg() - Read registers.
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/**
- * ov9282_write_reg() - Write register
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * ov9282_write_regs() - Write a list of registers
- * @ov9282: pointer to ov9282 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_regs(struct ov9282 *ov9282,
-			     const struct ov9282_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
@@ -639,15 +537,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
 		exposure, exposure_us, gain);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
+	ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
 	if (ret)
 		return ret;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
+	ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
@@ -656,60 +554,9 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
 error_release_group_hold:
-	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
-
-	return ret;
-}
-
-static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				  &current_val);
-	if (ret)
-		return ret;
+	int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
 
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				  &current_val);
-	if (ret)
-		return ret;
-
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
-{
-	u32 current_val;
-	int ret;
-
-	ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
-	if (ret)
-		return ret;
-
-	if (enable)
-		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
-	else
-		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
+	return ret ? ret : ret_hold;
 }
 
 static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
@@ -740,30 +587,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
-{
-	u32 val = ov9282_us_to_flash_duration(ov9282, value);
-	int ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
-			       (val >> 24) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
-			       (val >> 16) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
-			       (val >> 8) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
-				val & 0xff);
-}
-
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -818,23 +641,27 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		lpfr = ov9282->vblank + ov9282->cur_mode->height;
-		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
+		ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
 		break;
 	case V4L2_CID_HFLIP:
-		ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_2,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_VFLIP:
-		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_1,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_HBLANK:
-		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
-				       (ctrl->val + ov9282->cur_mode->width) >> 1);
+		ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
+				(ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
 		break;
 	case V4L2_CID_FLASH_STROBE_OE:
-		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
+				      OV9282_OUTPUT_ENABLE6_STROBE,
+				      ctrl->val ? OV9282_OUTPUT_ENABLE6_STROBE : 0, NULL);
 		break;
 	case V4L2_CID_FLASH_DURATION:
-		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
+		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
@@ -1114,7 +941,7 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
  */
 static int ov9282_start_streaming(struct ov9282 *ov9282)
 {
-	const struct ov9282_reg bitdepth_regs[2][2] = {
+	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
 			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
@@ -1128,15 +955,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	int ret;
 
 	/* Write common registers */
-	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
-				common_regs_list.num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
+				     ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
 		return ret;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
-	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
+	ret = regmap_multi_reg_write(ov9282->regmap,
+				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
 		return ret;
@@ -1144,7 +972,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
-	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, reg_list->regs,
+				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
 		return ret;
@@ -1158,8 +987,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	}
 
 	/* Start streaming */
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-			       1, OV9282_MODE_STREAMING);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
 		return ret;
@@ -1176,8 +1005,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
  */
 static int ov9282_stop_streaming(struct ov9282 *ov9282)
 {
-	return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-				1, OV9282_MODE_STANDBY);
+	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			 OV9282_MODE_STANDBY, NULL);
 }
 
 /**
@@ -1228,14 +1057,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
+	ret = cci_read(ov9282->regmap, OV9282_REG_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != OV9282_ID) {
-		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov9282->dev, "chip id mismatch: %x!=%llx",
 			OV9282_ID, val);
 		return -ENXIO;
 	}
@@ -1397,9 +1226,8 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
-			       ov9282->noncontinuous_clock ?
-					OV9282_GATED_CLOCK : 0);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MIPI_CTRL00,
+			ov9282->noncontinuous_clock ? OV9282_GATED_CLOCK : 0, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
 		goto error_clk;
@@ -1576,6 +1404,11 @@ static int ov9282_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov9282->regmap))
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
+				     "Failed to init CCI\n");
+
 	mutex_init(&ov9282->mutex);
 
 	ret = ov9282_power_on(ov9282->dev);
-- 
2.43.0


