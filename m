Return-Path: <linux-media+bounces-49885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F8CF2A0C
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 397ED302F16C
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDFB333452;
	Mon,  5 Jan 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="bCjZFT7W"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021097.outbound.protection.outlook.com [40.107.51.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCCA33290C;
	Mon,  5 Jan 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603878; cv=fail; b=NMjer8FtqdGWzXLgdr+Cu8AJgiplXwD+N6TEZebxhfCEvdMS2bl0Xq8SO/R2RX14yTE3xEfU4ltgnz7wJVgeJsz3Uth2jBpOYa9SeJ8z8bu7TRVcsMKnGQCPCNpf4JisB1MxgoYfUujugWj+CECPLXOlTVC9aPchpSt0pNgERJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603878; c=relaxed/simple;
	bh=7pEnfuHFhYOGQOUuFf3qmylx0L8FU3T/KEem0Zy3GpA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ut+AGE/XrMj1lNwDOcwuT39HJFaf9IMJdSAJKuFnTTR9WgNN3oqMf0wtdMY10vcSXiSToNEI0q5C/ICXxKl3riz1ysDjTO8IhdL9oKaSojBZMQOO50nQ8lEXMoZYkEIKJY+Ae0NoaXLQ/dm3RfweMlJyWhfHGwuu40JyA0j3OPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=bCjZFT7W; arc=fail smtp.client-ip=40.107.51.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK06kojcEaMGrRZLczTTVhM1k+JG1Egl9A5Yv+UmBWdJmz5MRcuLbI07YF5Tc/Rv/wGkzq/OKmnaa3lYeLhudaVoYInwj+ZlwpzuctA/sa5YQAkxEQsieWIPuJDRNqy165c9C4FqRfTsV5xzCE0InhUY1i8rHNNJbqe7cNl8kcIncR+zcoLpQKHlKX3qKa5FFQZ/wfCQzSdrzvu0weq5IpTvhWkj+uaNKJUUXDH9+T0yugnWbXMyV03iJxdEldqQuQTHydim2AmiOTm9LDFgPYQ6CMdvLmYZw1tFof1LQK/zsrHRbPXZ4q/hHtzATl2D3h+STV8XoQKqiOtl+q56RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0tA8WdOHf4xSBjyRebLhM2is8UgUoiZRBwNB3OtW2k=;
 b=VJFTpUfqHzkMVYr00BCWu29DLD9v4zcjY5ht7N2gPbDfToN3qw55tOKcJ5HR1HiBRY4yZmDjlgZ+ao4RG//9kUJNNvnH5ETGx/rSHtTsHneLxD1GgSO+4C4K8IEocyetduSNstRgezsfP04cCl97m5faGG2WizXp1aTnYhDSfBV5ulgc2CDpvu+amtDaekh6Xs8mGv77icEl7dO3wTMGOb6kKX1+b44s017nSQpuQRqCzVrQiUjMhmv1DUZbPXtL7rdJ37+hhz1Hwi9OEPkH+OPm7E+oNd8fEos7GE/09Ap0MfSSkZIHUHEdrf2+SuNnwpTzIYOXTUcqHBJm1WfcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0tA8WdOHf4xSBjyRebLhM2is8UgUoiZRBwNB3OtW2k=;
 b=bCjZFT7WIGlxhMmPIgsQ6o6QzYBQn/zWhKESl9k0JhH1XD1s/K57dxkfYyTbiOiyjQbN4uIt5q9JnqcTSAAlw9OQavfTc1zSqrbtEmMeiZg3GY/lbnJg7Zd/NCTlfEHGQFwNfGouPsGHY3L1raJcWMrGrjLRKUDmN2qKCBHqo0apQquwtMLX/C3esKCa7GHP4W4NNSUp5FWcLNeaQgwbth0iWJd9Vy8jYh70v0Ddck9Vj622tjPHERqs5BjjlMPiE0mBt4fKOuOk8u8HaGQebEVEFpeNTdJPZhdlBN9U8FJhZqoLcp4Ksh05TJB/6WwaLW5ZSBPTKi3UzLEWJ0EqJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB2001.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:04:30 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:04:30 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Mon,  5 Jan 2026 14:34:01 +0530
Message-Id: <20260105090410.108479-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN0P287MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: 44598bdb-d1ac-4b66-1215-08de4c396f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KNkk2A5xEPRMfgmxGT/vF3Sgzj0ifAoGTPM48NP+K1VEZvSlAu496B4Il0AH?=
 =?us-ascii?Q?WGXChUtTcLku3KcyT1e1NvTlAQYgWSJd4GwpvIsfqS/0W8RGa6QJb2s8Tytt?=
 =?us-ascii?Q?8PYikX2WJrvyi8mIr8QiuvZsXMTodNHVgHdH3NyuMGJ77bpH4whAgHdU1C8G?=
 =?us-ascii?Q?tBgw8uVhlK4cbQwyb5XiL4+KK/qMFHL530/yNR8mEXdc2rijWrVc6zEd5dhk?=
 =?us-ascii?Q?l6HoBocn/KGwo+keF3lhx6thrc1BzHxs4vROOAF/d7qyn3xWoLM9mh1JYTXr?=
 =?us-ascii?Q?8I+Q1WhP99lByBrD/HgvZUuzJNRNfaSkwvEWIdS1TpmqTXTC7RVFGbkXbglx?=
 =?us-ascii?Q?pMo2LOe5nubVA4a/YIvICfgmD+aZ4OKICV4A2tYtERQMXb00vF8QciBvpUjP?=
 =?us-ascii?Q?jDf/IB1HOTxBZ/KyDp69L6tjmGin5PUELgIOuX3NCgOtYE3UKYlLTG+EPu5f?=
 =?us-ascii?Q?mS6+NerLC1+d/T3sUgwlGaVbPgJ9QvidP/1hFbbHavfUsuJmUPQEyZe48rEd?=
 =?us-ascii?Q?AD07U0X2/UTvWm4GboPoV95dXaW653geHNeDfPjVur5odMCbvCVtlmBqWsQQ?=
 =?us-ascii?Q?uX67B84715JOJf+0UFmhvdHI5/6zT3UsFyrjhPDXnQOf1MN25L52yiyWGj7q?=
 =?us-ascii?Q?8NTpASik9kNx04OypkYyW+nejoyhobAzM+wc9s9oI1RqENsxbUYAHPyhXFnk?=
 =?us-ascii?Q?6MKN4YudojQGlOxAbNx5t3vaGLzv0Tiu5UaZ7RZXUz72pl/q7gn1QWmWUlb9?=
 =?us-ascii?Q?x8GIyQ02GLE1LrPhrKKtDUejEA5mlamy57XhVD38I3bH08DUnja43I7p0LHe?=
 =?us-ascii?Q?UmubWH5kDlsKiVu2ZS0aUpP8UWY78RYpP0d1MXkIrJOI4NIFHo1YtMC2Id4s?=
 =?us-ascii?Q?FDtQUWpRpl3Tm/Cu/dyaU3JbQzm+VItkNJQ5BwW62LpSCdHOTcxkEJox77ju?=
 =?us-ascii?Q?eh8/FfiTdyhy/XcwYpPmp+k3GERhkvsMJGNUv1tARUWSW2Joq9fYfNF3tRU6?=
 =?us-ascii?Q?PZarSS6216lS9SiNtSFLXpdOuIftolbEZTpKxDU9F8V1tF/APUBJqh/xPICh?=
 =?us-ascii?Q?zqzmatnvBcwhQzftqb109HE7iER3rIGvCFLnPvLKcrNHkQvOOBHnboDXIIYm?=
 =?us-ascii?Q?73NwZGHViXXBn5qpceT0xr+BBdPNaCPnTShrVV1nygv6ErlqkQAwdZHCAt86?=
 =?us-ascii?Q?dOWXvi71086VRvqXpU3GoSOKf5CFzBYOl3B9yMOcKzQS0b7QSiGCeJBLC3xs?=
 =?us-ascii?Q?I9RsDfL0ecARUsipm3Wv3zWy7p3YHVU6g78UU8L7YTdaNI+26K5RvpPJFN2H?=
 =?us-ascii?Q?66fyIExx3rU5ySpmRIsOOCdIgp6uUHbjNzFimmMCvuFU8FK6wMYDHLzwSVjm?=
 =?us-ascii?Q?opl/CTbWNO0mTQKjFiMZaVHuLow3zApvXB1qTUaS22ZDWWq0UaJtLtxLHkpj?=
 =?us-ascii?Q?rOoe/tkmFNrQe4liip7JFTu4sLTPfOm3RFVemOaxx1bXpPcDel4deiHEB5yr?=
 =?us-ascii?Q?4me9IYnG6ptvQpuaIWVKUz4FFA46VM/tSJYJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J3tXwz6H1CgJU6CC+i3+Q8dw4gVs8UE7dgSrxpuELcPLk9w2Rz2fK3MMvTxc?=
 =?us-ascii?Q?JUssdpH+xkTzmFTX032wxPml4cjWUS9paa4uCkpEZsrQ5FJOesRYzDfMP46g?=
 =?us-ascii?Q?oQZOS5KJ+2rzZZRlLHSFwaRexNkok6vA00+AopAwlGo06unoiYZqyixhgkuD?=
 =?us-ascii?Q?6Q10UcwqUQWrg7girZB0cX9truNIClHGnivBC1dG16czvejOdGB5hifKSuKS?=
 =?us-ascii?Q?CBoPQr7XTh6npB/sg0jkuap6FQ2MdzXVTO42/CojvahsTU4ubGyKXL6mLiBa?=
 =?us-ascii?Q?Mk3NG7uCykaZDmfQfwfC2cr8L99BGhxe40j6HXh1DE80ecqq7vsuis5HJOGP?=
 =?us-ascii?Q?gco1N/VUBjRw8HegILwAqJ5ZpAYRRg1hc9Y+3L8wIyueyTf3n+HtyZzP4RNn?=
 =?us-ascii?Q?BseXjcqJQbkvsfT6YCHp+M0/YxCux0oiidl2VdnGDSMn/uXyjmY4ZYQU9Uli?=
 =?us-ascii?Q?EJYHlazwSecFVX3+L0z9D3VA7CcmgbNdIbuLoDIjUEwzEGUD+3QNaf65CjJy?=
 =?us-ascii?Q?f0FxQYhVTx9d9x/aIKYhEGeV3QEEmWyA8viPVoPE5ClVSREapYWI7MkfjHU0?=
 =?us-ascii?Q?Os2u641wllF5nKbLmbsPQYqcTgD94hKPyREKPUZvUaVbmtk5lprpfzP1zujP?=
 =?us-ascii?Q?LwdG3anVqQDZ8d4dejdZhJxYM3rzQ1Ml0Q9kqT16CL+bFDFbkt4yhja0tk/q?=
 =?us-ascii?Q?KCBY9EY6YkQWiM0kaAcZujS05TMvHrnUZlWr8+47u55pnGIubAPweaVqCGH7?=
 =?us-ascii?Q?FNub1v4RoDabg3GRpatpgyausmE7uHoo4RfqVm0BbQD3dogEdmTESc1MC3C6?=
 =?us-ascii?Q?f7o4fqIEi9xK5YavzaYCc2yrDnWBwvM9gJlfuLoXcWIzq3pQubz3GqmEXtm9?=
 =?us-ascii?Q?C81jRVWrFq2p4P5JP5DAzXFwBPkK+e/ab1tPwf1tZZRtqSD2htd91Oy9SI33?=
 =?us-ascii?Q?/VZebjSRm5BkGgNZ5mgUaZuHapD//9E5guIHkkUcKnJ4WaWY1yeEghZE20la?=
 =?us-ascii?Q?CrfkQL3AOv8jkobXWjJormHq74ZgayCr+PHXimJ7gDn1rSmpGnvZt7KoztOY?=
 =?us-ascii?Q?oSFZrHo5VTSTPyxEXRO8ocVmPU4nba/xCaUkPoV9HCo5WMwPuk0WBHR0x4HL?=
 =?us-ascii?Q?nr1Pb0DYGkFM2hHX1/N8rqlP6ga5UHk4I8ennty8bfwufBD/nGt9kHg17Zry?=
 =?us-ascii?Q?6o7avtD8i9Y1He3Yp9LZPndJ/g9+VfJ57PxF0e2EIDtKaUVz4m7hzBHVu8de?=
 =?us-ascii?Q?0IREyQrCtceffN4g/R0asL4+csldmEdp99pti1kXKDJggorAafWTCePKu+4H?=
 =?us-ascii?Q?5Nqz1xy4zsIjIjfTfilZ7udyyhBDNSV6AlsNFCieQbUlwXwMSpvLDeYjFp4Q?=
 =?us-ascii?Q?juMEdIFWjXFwMyTWBiKzmYTgUPP0OPMAIkipwy6KBD5CFNpH8GtoE8smtlNE?=
 =?us-ascii?Q?vJ/SP6Bbvu6RkuUHITiRG62NPJKQG7X/iz7tkfGjPlgpgK53kiNq6LhQjfw/?=
 =?us-ascii?Q?063qAKrxeaedXgvFzViH6TxtLUbQMcBaHqS78pkhw73TMgzO4lFMDU9TI96j?=
 =?us-ascii?Q?RMyjtr6fgM3M0/XrMzkmKf8A6yfFEvkgeLBppi7W4JORVBSsG7uFNuySmsOl?=
 =?us-ascii?Q?JtPK+uD6syoooLVtiwkZzcp3rFL2sGeRWENaF+VF4eqAOgHRY1svt3rJ9Qdw?=
 =?us-ascii?Q?xCljg891aLR2JLxKhpfkYCpPt1ZNeZ28ZjG5QR1hj4kGr/vxDiFNQz1N6zbM?=
 =?us-ascii?Q?Z3mrwBtcXX5yqG9aJmBtkvCJRGzb0Ko=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 44598bdb-d1ac-4b66-1215-08de4c396f73
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:04:30.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJqeaa+rfZV4Wq0qhHRre9nxA/abMGvQSubKzBjS37vDcJtxRFtZCDDvaIflKtgdwQ2p/zFNUenz4N6+V5iHnUYrIy5nKKwCrcFnG3ZXmpBcJTEDokHA0+Ttf6GWjuUV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2001

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

v8 -> v9

In Patch 2/2:
- Fixed pixel rate computed in runtime
- Fixed indentation issues

v7 -> v8

In Patch 2/2:
- Reordered registers by address
- Removed redundant control registers
- Fix HTS mismatch with CCI setting
- Set reset GPIO to HIGH to keep sensor in standby at probe.

v6 -> v7

In Patch 2/2:
- dropped __func__ from print statements
- Switch to fwnode_graph_get_endpoint_by_id().

v5 -> v6

In Patch 2/2:
- removed the unnecessary header includes
- Misc cleanups as per review feedback
- fixed reset gpios to devm_gpiod_get_optional()

v4 -> v5

In Patch 2/2:
- removed the unused link_freq_index

v3 -> v4

In Patch 1/2:
- Move supply voltage information from driver comments to DT binding descriptions.

In Patch 2/2:
- removed pixel_rate pointer as control is fixed.
- fixed default statement in os05b10_set_ctrl() to "ret = -EINVAL"
- sort the list in "reverse Chrismas tree"
- remove redundant check from os05b10_enum_frame_size()
- add a check for number of data-lanes

v2 -> v3

In Patch 1/2:
- Fixed space symbol is missing before 'optical'
- Changed the reset pin control to "active low"

In Patch 2/2:
- Correct the module name in Kconfig
- Fixed use of dev_err_probe() on endpoint parse failure
- used devm_v4l2_sensor_clk_get() instead of devm_clk_get()

v1 -> v2

In Patch 1/2:
- Fixed indentation.

In Patch 2/2:
- Fixed bug in probe() removed unused variable "ret"

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1139 +++++++++++++++++
 5 files changed, 1261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


