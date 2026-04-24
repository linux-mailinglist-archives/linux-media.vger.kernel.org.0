Return-Path: <linux-media+bounces-59569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A1KMvD662k1TgAAu9opvQ
	(envelope-from <linux-media+bounces-59569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF55464048
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4071C30268AF
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A357B3815E6;
	Fri, 24 Apr 2026 23:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="aRpWfAPj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4043806C2;
	Fri, 24 Apr 2026 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072864; cv=fail; b=Det6VJVREX8JCM2YjqT4VipH5KsN7ebXJNLARnODcGuiKgiP2qsST0oBZSf+oqItg6j7l2cjlZFvhrZIHEh44WWQFSS7CBxHBkTHU2hCPpdrU7bzoUvWifj3kZr4JgOxmwAh79r49XJHHicQLnKndqlnklxL5T9i2F5JwPwy+Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072864; c=relaxed/simple;
	bh=YHB8VqWQX7ie4XbywRmPm8kFFvsX2RwS8/HoMmxjLxU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZXRy4yjoNlb4qht5ygu+vYSMwPsdu561Lp79KKoCJUWxVg2jCtUJfTU+i1mVm91K06mYsurp2w0N1cJZneUd/5gLa1aMXPy0U+5fvQhTWI2oyRFRB71YIT6JXIRlSFquFcM5a4iqKyXXyl2UYG8Ne6Cc3A58jEfN5i8x2qkRS0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=aRpWfAPj; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ON1H6r1572799;
	Fri, 24 Apr 2026 23:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YfXJmk1rK
	y91sVPCJcR2ZGRntnpylvMLW+ISRscuS2U=; b=aRpWfAPjbFyY9CPw9zPdfeeer
	Ch37/6zfTieo8txuBo9zmerFA7JTYscZ7smywSFQRjiYWufsYsmy1MUt49NOjrsZ
	SZZ75nnzcX6T6S3cCBvJ5/v5ofRTFOtMOInYdv/d+baiwkJM3weavzHsgZxtm3GX
	X++f8hXay4FbWxQKDm2Rhmd6P/11/jrMy1kGjgl9GqYe1fE1F7giWxgBsjMrvYP1
	fPJE0kw93xNPQC9wW+P3Y6glh2o457jcpBgbd0WHpXpgjyY3/4N1dUSeVkYX02bG
	3nYp/KKiPEx9PyitRVaZwQ7J4gis8D/DPP8HZ/N5LCPjr6lCclat/aqZw5QRg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc2nax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 23:19:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALGqVp7Kc3Mg5QH9Hp+1/JdVCHwuJnUYZwtDga4Rb4eiIxFpr3lShBPO9fqGdcdqvd6FeBzfZwzIOC7yjEljC6mXg46bC3PfIVk/XkeGZD6vzzIY9Pl/g2A8+aCJ3Nd/7IXVnWad8Anv1GzpI79YnotTX+SYibDyyy4dX5SgW7lA7gB0BQ479febrLn9mmZqlxHnb/lK/g1D4fnuvJPEiQKiCTt2YeUeynN3s1Tbzeugc7/ANJbPbL5OB26YaCAvlykiDLh7TPUnw9OIJY+lhAfDGW6QNZdPyVlsuEeVFf5JKDHLESWZDaYE/IpQsMCaAa6T6l4zrZ39A3H5Yt+9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfXJmk1rKy91sVPCJcR2ZGRntnpylvMLW+ISRscuS2U=;
 b=aLJqkkugPIEd2B6g3z3Ab0LexXNizRpj+ilJYIN6mpNvF3IX6l/qGwKrLWtVX3GY9xO76MdxUu5O409QC3Um+EC2iYHF7kYHI3wwlvbmoBtuNmCaCyBJ/nX77J9lokPP8sZDgr18dgxwXCsEeCdb1yNx6c2tv8np0e2lMOsp/MgMKaavNlHXeZa36Jr0noeSgbRGdC3hQE7iKE5N5LmmYDK0BJgOvo5iLCugspbMqU2/0ZMYyCivLezM3jqNmjNIGw70eTnK+KKbIvdhyKBG0f/RlYao77KDeXfdk3KBH7Vu/uPoAAd72lqEPSFe8t1JCIJG9CPhoE5meWirdy2+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB8061.namprd11.prod.outlook.com
 (2603:10b6:510:250::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 23:19:54 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 23:19:54 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 0/3] media: imx8-isi: fix resource lifecycle bugs
Date: Sat, 25 Apr 2026 07:19:23 +0800
Message-ID: <20260424231926.406079-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bcefe3e-3e43-4dd7-5b1f-08dea257fe3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|56012099003|38350700014|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	6ztHO5WtMifmUB5qeDTsZQq58W9Ub7BCRKKhlpvTRLJ5td37g3TQv/QODcSPcJwLAE+1cGTJe9dO7anzhOJ1X7Hc8yRVZU6FBreq2lrkzxmaygFxpIIjZLz+TzSUqd23S+driKfdMk+3uF631KE8p7ursVSSj+HEBFCup+1UsjeK5jxQx9yZ5DgSmRtkrNO+g4j63gV5ohMMy0rPXd3wrBCMjLZm5SmV7g4xh5RlhXBhcijxII9WvwA1FpnxKlmLcc5dtgtC/szAKtl5WTJIaHTgbeSOj77LUQLVOnzpOE6fBW+3YWkDgcnlpobij+fwGD/fI3H3pJ9kaX00AFWkx8KmImxn5utRgISSVlyKPDVH2L5GZVM6nAz0y9N1Yc5rHxClpTUWgFWBTOjBUoUkpAr4DNzv39wXOMYVGPToXPlRMzk2Hz2Ak9/GWrb4iqx+JnQMV1+rLG858eO2EgIC85OmvCXXjdN+zI9+EJBGt4vK5jOhNpwh4BTx0V8HBCNDtnKD7w3ppKiuPbfCNWrwf+sC4MCwDb8zarYUlPDKJBJbeISk0GbPF4B/lESltgQ3M+WA5voHfRrtIxj1y04Kbt6DxuX7wTkk3wRhMU6rlvZbbJdCNAXKIMHQd232YByX/Ry/UylA6YOfpRIkqUISkFOPJte85DeRmezRcMmgAdPldx4iifkbQ7xB3jXG80w6BsMZMtIfgKyyDyORbJWxD6u5AF1vYNUvyh1kdOQReTDeLUbP8A2JIrOIYsehCfSvFOc6lpKj5KtEQR3XJTdkX+cmnI/dWaTrMG6Kbg7T/BZtIdKdrIC5Np30PpM8t2Ny
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(56012099003)(38350700014)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UuuDH/zZCbCVvOfR0UZ/+klYkt1lIZho6pG6yLsCWXVdsbnJ0nnaP1/5aEVY?=
 =?us-ascii?Q?PwxFTbRPkINIAWgMEqZGBxvD9QHHzlHMMBD2C2AjhJwNpuTTSJAvGf5wedIP?=
 =?us-ascii?Q?7Z07vhBXDwEuxFRLs5ZQH6XdbIvdpAVy07X5HESqp5mYWhanx7QzIhW2ALCp?=
 =?us-ascii?Q?RvxzqO0kJj8kBw7WzBzUgGbrffNtxrQmDr6gl9sBepf58HCTo1Mah+a93ouW?=
 =?us-ascii?Q?P9Ed1W0kMnl681x2bq6AM9drDeFT4Hy8gTxLjZLmmqJrDQSk85hDERdA1om0?=
 =?us-ascii?Q?AK1I6mZT8SFztjrUoGpKKQknIZzvQI7S/Re/wHu6le+OtRud0/2yJKqcA326?=
 =?us-ascii?Q?1dxqVTAlWtw++6WiFmjkEUTSj4jMQtnvmrZdjQqqXyXumsbasVKyBxvKkUC2?=
 =?us-ascii?Q?wnXIZevdxgPNSCQZ8ZM7F2GmZ4/ooOE+LSEIJoqjDkTwBr1WEouIvmFZAUgQ?=
 =?us-ascii?Q?Bh/rfzcLwuFAdiiVM0ly4bD6JsMu5VrjwEDYv58EdDvC4gyiy/6BwY8eT8cE?=
 =?us-ascii?Q?L3DsgyLZlyYyhfBWRX6pLttOdNYgbNbOkXdaMwaXV+LEVocdTujwnOU65Gj5?=
 =?us-ascii?Q?OrDC4Ru1ymcVHMUnP8BLVRNg+ElnxU7N2wiSiyMp/ltSUd1d0Xrl2c8jOR7j?=
 =?us-ascii?Q?7TRKvBfjXvDVXHAKAiBqErgzNgQKQRe5EG9g4b5lFseoyAsM6PRI5sPmqmdJ?=
 =?us-ascii?Q?xzEzicRLdPK8YWUhYuiXXqnXLePCKtlRW88PxM97PkiBSuMPnpmUGxJCHj1L?=
 =?us-ascii?Q?/JKl0ysAlIgFvbrZRmZk6Ue97afAne9XYX62F2Wj+Zi/uEHBSgoAFS2Lt1zo?=
 =?us-ascii?Q?V/MVd0etckXfIObvaWIHZhYzyFWhQEhAYM0bd/euAr0+s4PX7T03SeSLyoZo?=
 =?us-ascii?Q?P4+jW755rlHgKC9Fa82juIA9tFBHmc0VlKRAAyBlz7ksjDLlqUbexkAIVbrL?=
 =?us-ascii?Q?51QQEkeQB2L44WFg/PQaYfP3l+6fA1JxpDSpSEH4oeypmAgTlFe6ZExmplwk?=
 =?us-ascii?Q?zA61l8Ll4RBhkytKmT/E+XlWzj+GWQd3s8zPxrsh1WR5+gwtdvD4aGwwzC1s?=
 =?us-ascii?Q?xr/hl/ZMU4BGnrRLFGsWvt2VCTUU3g7R4djXzLsoizjEKkcGyXuCdOTRZ9/X?=
 =?us-ascii?Q?V9Jmqn7Crw42e6lwx8MEtKtP+C8eNfXPEtYb4XPwbSPGOvg7MFXqFo9+9RUF?=
 =?us-ascii?Q?5aF9qDijbL2AzBIuAkaDsoKSzS/R1emMvla6NitSyvqjkQhFIoWhr2no6RMO?=
 =?us-ascii?Q?xZOKFC56zmxRPIoSZEacK+lAR5DK4z+KmzLP3vZt2lL1LssKVbyNtw4hW0YB?=
 =?us-ascii?Q?hOitewXsM0wCKjM0AG+HMhAOBydGG/YsiRcSHGewkoB77hgn4MjEhnAoCTZP?=
 =?us-ascii?Q?W71vfrKZPeVrRIjNXRAGUM207A1AV6SSyIsUyl6+pO1R5UQqhQPmsHkEd7bm?=
 =?us-ascii?Q?8VdDtb5heMm8VfQMG7+5a9H0O1XAUuWLtgo01VIDrIJd9SJETcT3HdewnHbn?=
 =?us-ascii?Q?seVfzX0hL4xO/ZhZX2h60clTB31A2HDLoknaHw3XbRamiR9QGDA8v1WSMwTC?=
 =?us-ascii?Q?Eh8U1VxtI0hmPZOA/wi67OmoEBymCHFgDx0h31UJCo7hnuHkmMYt1XdMDFzV?=
 =?us-ascii?Q?lcgCvUny+D3LCMcdqedpAIEEZSV6HgL0Rfk0fCE9OLHdv/eRyE6/G0u1cX+o?=
 =?us-ascii?Q?DBE5nmVnBDbvkomBXxrG0XYp4nLu7phBhlcaw7bUMWReWah7z/FD9mWcekS7?=
 =?us-ascii?Q?FyZtN0RaCjo0364g34aYCX5b5H0324Y=3D?=
X-Exchange-RoutingPolicyChecked:
	JKHXoBXVHvoELMEQ10kQNGSiORQ/jT/8IK4Zs1uRALtCZEC6t7UnqI1P5Ob6Layu/sCZ73ptFZXbjAJaP1kmao93xN1wd9UaNvz35EmSYOYk8y4c9h2Lv/Gho9ymoOSSyotPHmr+CSGzb7kN/wjItXf2a7ZitZ/qbbBUKKQ+A/v1nr7I/T1b37I88a/mBnUQI7UKMWNC85WezW3sb6ObLCoiKUTkQSF7U9wdd6s7a6GSXmt04LWtNYMsSUbjdlmR89RwY3maHAlBXSh0m+aNc1aJ9O6my8SJLNI5epV8N4xo0n0/azQihMnOKhB8Qi8rU9PSs/vZ4M0IIM5sisHmCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcefe3e-3e43-4dd7-5b1f-08dea257fe3a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 23:19:54.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TP9CwAuSL9640YkxXFfVlBF5M0AHJA42gLfZsbbW7kwCU4SReQiHZ+Ddo22c3u59Zjl1MelaL7DY3es+V9L8yjoaMbDZPVzXSl8/j58oWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-GUID: GcZUWhUPjkqhjTCSj_7CPUeqvV7DvQLu
X-Proofpoint-ORIG-GUID: GcZUWhUPjkqhjTCSj_7CPUeqvV7DvQLu
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69ebfa9f cx=c_pps
 a=utdtqqQbqC3rwi1NYZt6Rw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=IXbfCZE1DMr23do8zJ4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyNyBTYWx0ZWRfX5jCybBZ7ogcK
 go4D3WGV9Wz8waG7hTTINwJjK0LlFVt7NQvpHLG0xUO/UhmSpS95VNtZnTRBVnD/gOxa3tp4z7o
 rnlOHAEvLNdeFl+T/DT45hlmO2+UQEjjGzINFjCk//ZJOzUEMPBp1y6/QbikuNU4QxBQAIeMw+h
 c/mY6+nIktWfkM5wmuoAEJ2uTd0gDwDn/nPwyeXfm+NdZY4ZF8CdntsErk7upBmENm4VNhd4LuB
 lWvv7fBDP6pCJRZ/KRGZYizT9Gp2K0MEzfWh2JeDljC5mpq4fpMvQf70unvjbu0Q6zXIjcK1rcy
 iaJMHvIlbpd9odjLhEM8vbFtUYv3vor/BTdR/jqI0N9fbVtPUDsyScdL5OOxYpvi5oKYUTKgYxt
 CjGIQ92g12eKvpJQgK0SAnySyxyihLvoqmtUndqqVVEdbDmT/XuXmcd2GCRJufAGSRjDdNXmba4
 +WiYLBY5K4x2/AmhZ3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240227
X-Rspamd-Queue-Id: 5CF55464048
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
	TAGGED_FROM(0.00)[bounces-59569-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:dkim,windriver.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

This series fixes three resource lifecycle issues in the imx8-isi driver,
all introduced by commit cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver").

Patch 1 fixes a use-after-free on rmmod: mxc_isi_remove() called
crossbar cleanup before v4l2 cleanup, freeing the crossbar pads while
the media framework still needed them to remove links. Fix by swapping
the cleanup order.

Patch 2 fixes a memory leak on rmmod: both crossbar and pipe cleanup
paths were missing v4l2_subdev_cleanup() calls to free the subdev
active state allocated by v4l2_subdev_init_finalize().

Patch 3 fixes resource leaks in probe error paths: the pipes array
allocated with kzalloc_objs() was never freed on failure or remove,
and already-initialized pipes were not cleaned up when a later pipe
init or v4l2 init failed. Fix by switching to devm_kcalloc() and
adding pipe cleanup in the error path.

Xiaolei Wang (3):
  media: imx8-isi: fix use-after-free on remove
  media: imx8-isi: add missing v4l2_subdev_cleanup() in crossbar and
    pipe
  media: imx8-isi: fix resource leaks in probe error paths and remove

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c     | 7 +++++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0


