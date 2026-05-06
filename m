Return-Path: <linux-media+bounces-60503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPZEOhuy+mltRwMAu9opvQ
	(envelope-from <linux-media+bounces-60503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 538CC4D5D3A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6421730416F0
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 03:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20FB2DB78B;
	Wed,  6 May 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="lx2AWj2e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C602D8DC3;
	Wed,  6 May 2026 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037225; cv=fail; b=SXdIGJGf1mtpBGQdsFz2xQmJefBT8xHggcocutCcFCtHdMRbL/K2XeLLhSqM9Fw6uQrB9GIHJly/dk6vsp7PsR1z/okv9LZz9qHO5JC9pYhhLj8YO61EVIdj2bVGgdMMZ7sKD8QVsQNWD6cbj7OzCrXW+zwjwxY2yYWOgOc49rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037225; c=relaxed/simple;
	bh=0yLoljZTOM3VIdIOszic9BgNjpJXFP00utUw/pjWQYo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e7U04xCbwpRzfYyHY5hbBR861B8OA5cwRDVgtI/8B4brAJISE0pg1jL1g6thzLP8MA/l//hAumAkHbmxd4dt9rSSc21nuTPzhrgyIvlCvaq1ZVTSpwzn7Vl0g8aNtWPLyrB2dDeMxZ3IQCqRAWuohIQl4QwKJhMAtfIgudgT3RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=lx2AWj2e; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6461DQBX080652;
	Wed, 6 May 2026 03:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=iWAwsRoNc
	SftNcpztMwkA1hxFKhiH412sdzvnEPFH/g=; b=lx2AWj2euFBiEFXf2Azr5/dk0
	kW7YM/YKlBcz5ja7SyhyObTHKkCvkUAJt9XIXHWMH9MadYStg80sa3Ce5dGF2TCw
	kGrVHCyq5SgpRSdYgbd9LnxNsJuLTudV9mcpgu6hCbUVZLTkEAFmhlI3lRVYiA5A
	3hXTzJmpCIH42jMc6hs+3WrxQpYokdlwJwEou/GVLYIOjTbbVn4ydvj44cibAAgJ
	tXZqWTQTV5UGd+RyEuNes6fcHSdKq6zs6Umt7zJI1zB2LR7NudPFL4KS+n2Ow5qX
	1KAGqKmCRVgiNyTUYFELFBZgc9b+79V1CKBPkZiUi+SOOy3T6yAnoYtG5SLUQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu4dbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 03:12:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSUhC955ifRqiP6wwKPemwehxxgqokBfyzor1hlBBQOiejKi/XPBecAaHq8FuB7QWqRW4VsKMRtkO7aZ9udmxWr4qcXpW3LTCqpPHa56DUYci4gSaqtTmjaFMm3dLlyiCwi1s+LLL8iIjRdjNd+4fNKulv++aBaJS8M5QYReKeOBdwCjBOneLkZc/7vk/MXxEHt85kJGokApa137lR6vXI6bjRs+y7f0LiCsP3ekDRoHqDYFpMlbyz7HI+/QXMgkpqgeLQxZyoDK906qZzpA/Ni+IiqANMGvSA1QalIjTIWYqFp/onE8KHeOv6hj96yU8CKO9qDZmn2qT6hks4q4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWAwsRoNcSftNcpztMwkA1hxFKhiH412sdzvnEPFH/g=;
 b=bWP/LChyzDszvZoywDQFW+h8F0xdnL8jXM8a/VyX0w6oIlvY70ycQqLkq8KUw8tNVBbt1nAbmxrpTIVdLZg+sswDUjCGGDjoAV+O9YpO70sxR0wBmE6cB9n4rq1syDDHrwfO+HEl1G4JeMrdHX//hMQpuBppICrvHPUcVD+On+HyU/4K5klGf6GrDhP/9TH+OJY/MtPc9jLKriNWLbbH6BAlSJfJ3ab3wG8ktPpG+ANS1S4ugcS84dY5LYnNNHCjXb/ld8B9sJG2QTm0O5wIH1XHH9pv2uJbckpeX2M2917Zvz/fLXe4115OP3adJOLja7FJaSsVU9hVhgoAESGm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:12:48 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 03:12:48 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 0/4] media: imx8-isi: fix resource cleanup issues
Date: Wed,  6 May 2026 11:12:06 +0800
Message-ID: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: c950e2d7-50fa-41c5-4912-08deab1d59d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nRHcNol1KFnFNlHjZv6yJqvhozJZAcmU5fmCXtvb3hup77EIM++0E9CKtjafhNHQv//Fk5G2X4W+ZHcahy2IV5TtXA73DxxD/yWP3wKsHNrpFLxhcR6UE5fF6QxLbbQRQyvwTjePAPZBtxS6w/VCV/1Vt7ZWDitlt/3zjDCo0orom2S9arJYvYWjiAwwSwi7vsnMvKU+C5985IQWmXlLo3w8KePC+7+/jxcAHu9vET9aiNAHQ5vVnvsN+ruQ4AYaVF8uoRzFMrpFJob2IFND+cZgaHUYYtkLFzvXUxlGK6gB24c22sDYq+Jp1Ip0+zIlr+oT+BtbUJPWQHePCu+aDtZ8Wqkel9pd2jG7g8BTijFEQ7FjRsBWoMWnHrI6n0uq19L3GZUPurCaEyupl1D24fYm5/+1QupSOWlFffofmRXJHzvyqXuJeZTTRB/mqBRhTc2Z2wBaFHc6rS/rplNTDXA9CFwxEXtT2GAqLDgyG+e4YHCethn+I37SH2XRvg30PnVeTGv7P2+UF2tsqk1fuWdy6qpFi1pdlFhAO38anuU9mF40HxgNT8Y5MPmWUeGlzKKBCKOasOQWbmfn+zHB/vCsKxkVwcc3ZUr44ajLivqxrJqOCVxp4/XvlpYktUPSr8R4XQYvbDhTHGxsnkdRf1Z0hm6Auo9BhkbAkjQEylkl1iN21nlJOi/857KMJysRGj3WFHu8KlyzeV6ySB1wHVE4ynk8m91XSKiFcdeO8HZm07b2fC2POhnIz/X4HHyhwq4AznUUTwVg9y8abO6gXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FYPDwXw7NHba40SZMUUWmpW9LZAb1x5s7V1FtfRtsw1D/tDV6Zoo0GSNRkqf?=
 =?us-ascii?Q?9yKzZRmmU9YrR/NUHq4t/EtxVHG21nGlNkf3n74BABsl1B1prQPjhjO+TJzW?=
 =?us-ascii?Q?81KIWj00RV3YvfJwx5hI5ST6dJhG8vcsuRtTchQ0pOUaZnZaqlHYRd7TNPfN?=
 =?us-ascii?Q?Qhg+YV5w4uvo08B9XM2ZmkkaDv61PqwtvuE2Dt990D7iejLLPnZfJ+nb7UUv?=
 =?us-ascii?Q?wLPxyfJZxxbxjnxK7iza4sGPGYegkcsHIW6X/jwwUK+q+pQKXRrEftee4iUo?=
 =?us-ascii?Q?hlQNMtGAOEXMkLs8Mb2f61cq6SjTlkoyTFw3EU+7i9fE8YHaJ76jczCEBJqy?=
 =?us-ascii?Q?yNYyochw8m9Mkozg8V85IAVpDCu2RZYuIpZLA7zQWbnTss3Q90Ut24ft6/tn?=
 =?us-ascii?Q?VKuyuEeXHlcrMKTrrucoKyT2B1Ift70kK727qO+TNxbQHNoKMIuh5beEcMMY?=
 =?us-ascii?Q?uriiWVwgd0JBmeN2BtkNJ9JXD/YYVUpD934wHcPMhhdCsxdJA+a+q8J1S4MX?=
 =?us-ascii?Q?gVh4brtwxac5SHXmYKsXbVQGOzJJJ0FRHb9z/hMI4KyFeixfnFbUx4wH5IKh?=
 =?us-ascii?Q?U4Bv48ptCssDYJlN6Jt0ZNb3yI4rjRwrsy09+/KvNOnYF1jdERECkA6mUsEb?=
 =?us-ascii?Q?z6xLj6CEy5p8u1pmIzuqBXamF9G14C+XOUe1AuKT5pNBFwaw3Od2Ca8i7Fi0?=
 =?us-ascii?Q?A4q++xm0OjDYo/2XRgQuQr5Ag5ixEx/h09aHc+3BkPwHoMZXL5mamdJGkQgA?=
 =?us-ascii?Q?CnP4rtPlvJihL9xglbO3zlTkNYrwrCfxxu7UcJ/uX970MlZIUnUUhz9+Rhc4?=
 =?us-ascii?Q?aPNNwy7MMpuubhnHJEUUMx2OsQ8hLEAcevPCgP6JjETub/qwXx5paCPVQFLp?=
 =?us-ascii?Q?AJBHCREUCSKufpCAosZD1pnXFxITlcgqd0hWli0zZwTDIsbBWvrAjmfWBi1V?=
 =?us-ascii?Q?5LtkwV3ZlVx15h/9mnhrmRQmBXKd7LG/5W4Uk8h/phCEzZ4A7g44i+AFTVHS?=
 =?us-ascii?Q?gRUG6pZ8AI7N17XRtrGHhqc1H5/tLiVMtWzEXlG4RahKkzbMeyo0Q8rzSovE?=
 =?us-ascii?Q?sTHp67HpKAHfZ5QYUjc5dq9JVFCWRdInv600mXIWqtZo4ttLMYKiCYSkjWZR?=
 =?us-ascii?Q?J+BdvDu8b2I1/l49fk5WTGCpi4BLWrRQMLl+IDo0fc7qtqaOCIscDMi5qCeY?=
 =?us-ascii?Q?8pe12CqIu5EGGD3CVVdJpJ56qHcKCl5fYEdv3CYZ184mxi3yNEW7l2w9Ry7J?=
 =?us-ascii?Q?YsPf6PUaUoIJA6fB4R+2NQIp84xXbiUXGTbWDsrUWBiGliv0+xABR0L4JvZk?=
 =?us-ascii?Q?xmc2bTkMhm3M/eU+HW4s2t+EXRxhNCmHh4iEtugZ7VBlqhWzFigQSQW4/7gI?=
 =?us-ascii?Q?8nkUI/YtzizzRAF6e0wHmqfya/k1S/tPa0lgfW1buuBFTc70zLvOJhmFVtc+?=
 =?us-ascii?Q?ZvBJqURmMrgjevauL17F3hy/Yf4b4tTr1S2VP3AlF2643Lh7yN3U4yhowtvt?=
 =?us-ascii?Q?dAqgpxGXTwOIk5sEy7gp2s+iScQpy65h58xewgnbEPFiqMzW7CIHgRoFrbOd?=
 =?us-ascii?Q?N36pt033/iRkZt0XG5JUUDcUO7+rgwA44JN7OdUNDcOFMjUBRtnOpACCMbwE?=
 =?us-ascii?Q?g8f6OCkJBJAHOpr+FYUrxcdhTeYRdaxW0YtUAeEpWi6XoxZDIHYYs6+ReS+2?=
 =?us-ascii?Q?qWLZ74pp+EkWMSdHdGWowOOqFV9RfKy2HDgWspp8skZV9XLIMLrdlWtLq1g2?=
 =?us-ascii?Q?Ehc8qCTKlRhN+FZOQqrLWWhu/mYnLMM=3D?=
X-Exchange-RoutingPolicyChecked:
	Jn1NhoD0lk49XiRKqoMm7CeZY3znUAWlR1euF/SNmDmJCp0fZh6jbEFbXcOIw834/8HffDzDSejQ/V2yKnWZhoLpPCCyHRPaGzzxJu22RrJqF3r384821A3YIGx3PO3cx/DB+BoUWXJpNb0UqIPFDiU+4fkC2+eAXfwmS8HYXeqhcfAyukbwBhoK79NCem4pJrVVxg9HKiSiUqxJ6EoJ4zClteEzZoK3wkA1cIngNyl+MIS43f8oJTKDLBFW9fn/44KMpay/hg4rs/FfmW1EVsy3jTYzrXoJwOaxr1n6brnA6p06ur3N/vFfYXZxeBC31TwZgQv1u0D91qIBHmK/jQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c950e2d7-50fa-41c5-4912-08deab1d59d2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:12:48.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAL7qU5oJ/P7Id6UeAkbo8tY53b8tG6rhrd9ccKKdHCu346CkeCk4Ho2EEHJl9MjlHOu8XfraaC6BCoFq9ee++JIcHW9Xjz3s+c5ZDfGvDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fab1b4 cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=qQznHyr8lgLhnR85-fIA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyOSBTYWx0ZWRfX54TR37HRsKTO
 6UKiE4yzNcvBoleCBNUaJjM9WEYBQl+Xy3DnYM/8THRbPccZVpC4ZJ9MXE4wdyrGPkIDsJzE2EE
 IWYfRQMVfCbN6N/Jd6TDRRT+eoR7kvUE1uCXzRRUZ4gb045QKkYDAwfgD+Ph2NqvACd9COoBt9/
 CrLtNuXslV8BTEPa+1aOAOibo9kclLHYavEIHqhHS7MTq8LxcHVewipUpXws9qFqAfQ/eRBzKPZ
 HUIzMFAL/fYtUBOqTEj2ZFpqWjDzUdAoWU00NJg9JTXN4zEKQJgTU4gW0wXT4Im2V9GrF2IwYRQ
 dw0emQiI9OcS+tjlJUYZzT5kzkWGiSxB4DYuPBNIpfmm5riDicmpLR/lYpf91H4ysrGcepsixl3
 4U0uWzGXOsStYbh2w7Bn6dPd0BEfbly1coDDsm0/vGEqAOGy5yVGQj+Wz8XaojTjwxc2zq2g5cT
 nBeCsTPLw877fudf28Q==
X-Proofpoint-ORIG-GUID: h2JOeUtCtqvzs5tg4qPM_T06_6u_lo-T
X-Proofpoint-GUID: h2JOeUtCtqvzs5tg4qPM_T06_6u_lo-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060029
X-Rspamd-Queue-Id: 538CC4D5D3A
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-60503-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,windriver.com:dkim,windriver.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

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
  media: imx8-isi: fix isi->pipes memory leak in probe and remove
  media: imx8-isi: clean up already-initialized pipes on probe failure

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c     | 7 +++++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0


