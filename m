Return-Path: <linux-media+bounces-54313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEn/Oia9pmlDTQAAu9opvQ
	(envelope-from <linux-media+bounces-54313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6A1ECF7B
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 452083023479
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4FC3B4E84;
	Tue,  3 Mar 2026 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ddc/+3/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13C3B3C1B;
	Tue,  3 Mar 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535056; cv=fail; b=VKhRaUOGF7ynqN8V2k/xaSUWyZibxG8TfNNYFK7IexePxPaM55591xpWrsta7U0WrwxbTZhlni6b0Ny0Y4cyQPpUMVNMT4AdG+wDekFP7oDBJ7azFl10mZfsijVnSj+QCFEqWiIOk/EHM9fbiUf55c8BlBbB8X+VSx/Ceh2y/u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535056; c=relaxed/simple;
	bh=t5oGcYQtPUADfyssGGG2f4y4pqQ0aW4RETJt1fRMTmU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WN31F064bNLDAD0u/+wjUvdY5EGGNIyn53n7VwPRgFYUUB2IDl6YvFissoXvjoNgknDLoPlPSAU3reab/rOY8C5ifxc445Wx3vQDHrZfFWRzP03cCP4ddOVITW7iKDZifIsJEZ1QrVRctpuYjqZPhS1+NnpcFhSMViNvYwQ3i+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ddc/+3/0; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235IaBL3905950;
	Tue, 3 Mar 2026 02:50:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IzW82n7Me
	AJ9SNlqr9vxqicnnwttjzAIBVfTzvhMb8U=; b=ddc/+3/0WMTSNwnvSGExopwQE
	prry3taSRNWBc3tVe6SQv2tI9GrXmPWJ5lP7++gMdZ/vqPsjSV2ZJoaaJ2YtjMiJ
	JpaM96t3Mvi3kN8SJTlNwNzFi32oSub+dULTTFVoqeIswNUhvqrhMa3LehnKYpd7
	TWnJztKQeRZxR72CxWLPr3uPJLQE1dzoXAS88TUaaXftePITLTqf/oSVsF4yf4uy
	dztUbDneeyxd9zmp8BJBc6mlDJUZaHnS34erRcA4m3gquF0J8pqkSyWZsoI58K/z
	bY/sVkrc5YNOPOZIe3ke934UGcpOQ24SVyxzZ1MjSwkF/FW3k0kVJytHBomdw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh438dd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 02:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgOXwTQZoPSzhqbJcLLSjjbYVnMbD0nlFK36Z+trvP/Vlvoj9K1xvXvRG5AgDxGjo4NkmahcuOkKw/ovNB2LB4fgCYiK2VuJNOh1d/K7cbyhu4QKtOFfzbn2s39/5Zgh/PZkRUQs91EUuoRIKdgs/YacTGOcbbGXckEABBAwth9+ZF3Hz09l5P+HKT/ukqeaKL0MQjrgIsKZf86++yxkPS8wV4jQrjFt1qKKTBB00n/fhG2VYQ4C3khMJWR0FrfVR1ahhu+8LeCkvj7RVpEFkAr5slLcKRSldAkrtDOz6AD7NzrlebffDwtcR2Q/X0W+VihWyBFFyHAtYyjzEZu16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzW82n7MeAJ9SNlqr9vxqicnnwttjzAIBVfTzvhMb8U=;
 b=oTdRNdiMNFyEUFt8xUqYjamB5guBoXGfCLxJqEJRYbaCbpXeiHH1BinSojuYLEhEASOVbKCOLgQ+/dap9MIxVPW9OGVOe75eSZ8odnothWpaEYwiW9oGcbIQxrSrNcQc15L5zY9aCEVm6QQwnHwDaa+lRxyTO/iERFRzcGfVXLVjnGY1Fbj7zlCwTc/2PtFRvbeCzPWfV9gQkkPGffhKFEzHRwoLNZB49sfLM7p3Hn1fP3i/WZhcMjDEFM7ROfjD+q71efMyi7Xt4S8tCDcWzXHMzFdm0wms4j6wsuSnNANLvTb+HrPtonJuuVKsx28IUxSblI+Y0GilWFXpedoCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB6837.namprd11.prod.outlook.com
 (2603:10b6:303:221::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:50:17 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:50:16 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: ov9282: Modernize driver with CCI and streams API
Date: Tue,  3 Mar 2026 18:49:39 +0800
Message-ID: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: c216d24a-a1a5-4878-ea3a-08de7912a7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	YD56jZEVs1ZiUmgUQbIWlwobHh8gbS92WIYI2vaazfHxliCuONkl3nre5E/h/nEioQUMgL2dXeAMoswj7b919Y6YfjywnSEMEzjyhmJ2UCST9nWctpRcwQyIsN4IdDcaU9oNe1cJwCrtSnlu073aV5tdT1AKeEcKH4Os8qu3UAjIGOOkfROqEIQCjLVe03V6daRjakF1ePfFTbR7l62v+4/JOtReVHvTeETMuVPHPRxui3fnVVeqYDn5o7VUkJ7u6YBM6JEnQpP34LAz8L9YvG2AD2hvjbBACCX83U5Yy0Q1TGo/tpdVWCG+oUfaooiIhIIuGF+mDnHUDPcF0yxu0oAlWg8JRXuf9boC0zXKR58PCeVpHsObA979+esbT5xCzubr+nyWS1I1xoPJem0I5DfMHV5BWi2ib9/tFbsBOuzgPTLc2rlGeJgx+NeINhm03+zvMUFxMj84zLCLBIc75CFXW5odC9f+ewVS6IUOhbrUDw0fxttoDFS7kRQeZcASW80zS2YNO43gMsyexNOQ0uP946R2hyTslUbvJaMkLXXYpmdsVPI6RwIFvlVUEmoILT2NglthyphH7no/Umhql6z5/ZtlAKxbejXOGjYcMyUPD7eOtCJknrxJdwBY22REQFvi4HuNchHRJEKHrqHxfOK9cy1aut+7Xr+02B5yk9HxX+8S0Mxd2M16zJX3MmDYUu4wYgRdrT5rD1A1+HlBctnSmQPW4pWBH/FjlZy///oXF5O/av4895ufpbnU+wOh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?snfrJ7svJBTwdskPuiiffbsE+4a8PaiXhaaTfdCSPkhMnMuoSJ9JTbD4jwCd?=
 =?us-ascii?Q?n9wRMNtQ/Ujnmx35bNJHXKEG+hLdK3Losk6MJtq5WYfWqkkiRqg11zTdmwCh?=
 =?us-ascii?Q?eZG59fweE2Oq65ec4ySZWymGhKK8SnBB0AQDpIjmnV8T89L1tphvOJKFs33d?=
 =?us-ascii?Q?d8191qpSo+LDDnodCv0Ls0SYjAggnu6qdFwAc7IPsDVCaJkgLC3cApSi1KDk?=
 =?us-ascii?Q?5rrg6zcPAHawkJkTggLLeG8TnMGwS0EmJLAedJaSRh8D1Y1JhWwcEXdTnv8M?=
 =?us-ascii?Q?n8mwHWPGMkeHAP2iUCUEK4/TxbOVThQWZCzX3zONAp2ag1N5T6BweAIQIb6U?=
 =?us-ascii?Q?yuA1G3ZUXnstzFxiSm8+ULn1pOoMlf4CgDRTWRMxGyqjqYgmU8UfQ0eBu/6z?=
 =?us-ascii?Q?+wPdtQe03YV4Ma/AKgy1nKqA+M6ArKE5PNQyJz5M+5IeJ8I/T6ol0I68awOE?=
 =?us-ascii?Q?/qVjHUw+SWsWTOrBX2syFz7LUAyFwBmd+al03WYnPfcFmn2kj1xnwVECxNuN?=
 =?us-ascii?Q?b7SJDJJ+iq55AG5H04v+YR8M+Pr58ZbUXsJwebgJl2dmkprywvcT4xYEVzZB?=
 =?us-ascii?Q?1Ea++JKKmBwGTeuCNnmZvo4MYa9g9H/0LYyty7lziKfmmd9gHApYmtJ5nmN+?=
 =?us-ascii?Q?0GsMPxtTerXLSWH2lnHbkCLuV+qmMtc6xqRl1dLP3Wx1fa//FqMaWCkBMC0T?=
 =?us-ascii?Q?tKAM0p+bQr7jRssukY4XFqdlES1lfKSsiK8NCLEbWgA47oYRpLb8hOQ94ZqY?=
 =?us-ascii?Q?OtZToTSIWJV+xOOJiOrO2bV4SszJrtTrpZ7fN3+pD7IF5IebHdY1F8JUSL7i?=
 =?us-ascii?Q?xi9NL7pRQX6/A9unGWqmqO/vU6pK7tVDuGyPNRvp1kseoyZARgw3eZIV0Vgq?=
 =?us-ascii?Q?PeTMW+xV0QXCVj/NuCsI1bYRgXNpwxayhqFVC1wuJA4tInj9qL+bPGFWYaAp?=
 =?us-ascii?Q?DWVCf9XI/gTNghxBisjP5lB4xEOAHoNLVyRE6CxLQlO+O8a6CHM93d/gmlEY?=
 =?us-ascii?Q?i9wBEwv8NtUMvehFansJwZ2EDgL04mDdCT76jzIVhuqXoplPAEw8gSJalf7A?=
 =?us-ascii?Q?dHjISWk6k9ck/c2kZfSc+hMa9NPnKPvWxlkPAfO2fJmNUiPyIjDilUbgRask?=
 =?us-ascii?Q?DP3HaljxpHykr+PNs7ppazNS7ewm52f3BfCuqK9GUNPRDISDlInZMtcpz4YO?=
 =?us-ascii?Q?OBqagbuMGLVO3NHasrHuaF1FKaE/r9MsTGKQNT5YK4MKA5Nk2t0dOLtEGkg7?=
 =?us-ascii?Q?soR8Z8g4Km+RfkS0XptS4G6XgioMkQkpP9pSm7qrxeUqBvRa4MSSWT8dqHE0?=
 =?us-ascii?Q?W0f3NLTVQvdmVbV7lYJy/QrHQwU+4Js7E01B3u+kmI60xRmO35LAoXm+IKNt?=
 =?us-ascii?Q?Ne0erIg0XV1SFK0Q5T3cLnkNz0YnCe+aAOBE5XjtYhJ0EMikyOIrXA9aZnaC?=
 =?us-ascii?Q?cqGCmlpOZfNlQ3x5qVxN1nHX2alGJr7MAOcBfCldP8Icjs90M1Y3BSm4TQsb?=
 =?us-ascii?Q?27MYWDlef85dCpjfbdBbl6z2CA07s4sSSWjWPPSe4/eVKhILG3yA15iGFTZX?=
 =?us-ascii?Q?+QajAgdF+H3uRl9HCS++C5+7yPdBITuU0EZRxdfBYNv4X6gkfevOkqv8M34Z?=
 =?us-ascii?Q?LTqkwDwgdzEjT2/s4R8rE+f1HxP1d0jAIWI4D86i7LWhUlepMenqr65/47KQ?=
 =?us-ascii?Q?gHe2b56ZWAvGrw+Vv+fVS3sjWDZGXJZ80Nw6PL+p1/SZwlrKOebSeVVEXXjD?=
 =?us-ascii?Q?/QXwV4a4oUg8r4kxu9gar2URUfJNQsQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c216d24a-a1a5-4878-ea3a-08de7912a7e4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:50:16.8820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zD4XHpQ+j353Gh7QrY/HIfAWtKk8xP2qB+mqaWQzlJ0Tcv2fX3g3zoulLEKooXp7KH7MqUtWpleKK6JL5Lq46bgvehgMjTPWzHADkE9g0zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-Proofpoint-ORIG-GUID: 5HI9JluFnklVVfWOjCO2o-6gar0fLevw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX/fQj7dliN8jv
 Y8LeMF4of8U0VSQkXcr0MF1VoGhkEXmyz/fPRZBJ/S48ICOWhCCH7aAR6TG4s+bKlBYHndL7nPu
 zsmGBqibEZlPlCVu8NE6yzcobT+PW97HmWbWSTVX8BMdDAxf0rNSkxGDW4Whzam0n4fWrXEbgTR
 uV8cvukV+4HMEZ8qq46nC5iEuafAPJQMc9hzhZx5ukQV8cXqQxp3ddWas2KyCcL5mBu8HqwnRaE
 dfU4xlyRkAovEuLJACCiOpl34TO7Tbnnvma583K+CjmPEvxJvk/X7lhaAQBMAIa3eHtTdgw84Qa
 FTiyPIo1zu+9ZkfXmh2cMLqfSFhgt8NudNkpU9wOjNwOfwG0RX3AOLbZz5TdHcGnS+W9qBTYX53
 RjwtFrSfGJC5Dme6XX7fJ4/HeJYBM22aQiHInBTyRAucyGqJ/pbo5uUbRy8oVf6tzK5Jabx55mC
 ok/WSRDff2rOj7uBLog==
X-Proofpoint-GUID: 5HI9JluFnklVVfWOjCO2o-6gar0fLevw
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a6bcec cx=c_pps
 a=8uZh/oWqEamKeU/uFK3X6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=ekXEql0GMc9u5THJ3pMA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030082
X-Rspamd-Queue-Id: EFC6A1ECF7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54313-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series modernizes the ov9282 driver by:

1. Converting to the common CCI (Camera Control Interface) register
   access helpers, which simplifies the code by removing custom I2C
   register access functions.

2. Switching to use the V4L2 sub-device state lock instead of a
   private mutex, improving integration with the V4L2 framework.

3. Migrating from the legacy s_stream callback to the modern
   enable_streams/disable_streams callbacks, providing better support
   for multiplexed streams.

These changes reduce code complexity, improve maintainability, and
align the driver with current V4L2 best practices.

I verified each patch on the Raspberry Pi 5 platform.

Changes in V3:
  - Patch 2:
    * Remove unnecessary ret assignment in v4l2_subdev_init_finalize() error path
    * Move pm_runtime_idle() call after v4l2_async_register_subdev_sensor() to avoid
      potential double power-off in error handling path
  - Link to v2: https://patchwork.linuxtv.org/project/linux-media/cover/20260301104809.3505257-1-xiaolei.wang@windriver.com/

Changes in V2:
  - Patch 1: Fixed group hold release error handling in
    ov9282_update_exp_gain()
  - Patch 2: Fixed runtime PM cleanup in probe error path
  - Patch 3: Improved error handling with clearer err_pm_put: label
  - Link to V1: https://patchwork.linuxtv.org/project/linux-media/cover/20260228083401.1007434-1-xiaolei.wang@windriver.com/


Xiaolei Wang (3):
  media: i2c: ov9282: Convert to CCI register access helpers
  media: i2c: ov9282: Switch to using the sub-device state lock
  media: i2c: ov9282: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 409 +++++++++----------------------------
 2 files changed, 102 insertions(+), 308 deletions(-)

-- 
2.43.0


