Return-Path: <linux-media+bounces-48699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637DCB85F5
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 10:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0966B3096CD5
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969643115B8;
	Fri, 12 Dec 2025 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="gMbJW8zP"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020142.outbound.protection.outlook.com [52.101.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6D311963;
	Fri, 12 Dec 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530280; cv=fail; b=kyX+YNUtUDy6JQKceo+Hhx6yu7R3fQyXbQZTZbaCFDU79WTMYt1Mj406bG6wdGNfyWBkBmYgWIhhbSzq11kX28PERlWOeWQjIEK3R5Hq/Ixl84EjcJcDdB0lhxvlQeBB5nU0bnZVT7MlRNT8G/xf7AiSdRAhHXO8/AGVhTJgu+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530280; c=relaxed/simple;
	bh=R5zFy8mmSs6Ftzt8q5cpuRpfy1ZTvNC6ARpcLt9Dv2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WOB9OXiBugw0dNXJK1NjECmcHGCbBD0u9d/fkfkxm/CgtpBjpErQ7U6tvnA5H4rs9nOQgUErHG2IHPubLDinjXk72gGQUwR3BNMEDKS3sueFHz7Ogh2wCAXWUeojxFhsObWLNbXbO5DxqP9axVF5wRrqjiMM/7R8ovWO8Z9eCis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=gMbJW8zP; arc=fail smtp.client-ip=52.101.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8r+U+xTrPDsEVZWjAxdMA/k/xoPGfMK9ogcikrFPdI9zzaNOwYJp0XvlyroBDJE/eCtlEvUbKa/swX3VRUGSGHP3giS8us3qLyq9xhwiCyf1CBym9HJKtHUsUnK7EMXOksFfKXQW52MGemfoxbE7aatuQFmmEvvA+yvuk9a18r5K1B6IZkTJhSuMfqXL4Tge+7TCjzBqhNJGNDC0CQxP8WaI4aj7B1ZZhAIRS0M56sBHmUpM5TbNf767izgKpj6sImHOd7X8cYIa6/LWUS7hm5kNnmoV1x4D99Bzp0NR9Bq0ZzHykxi+0gvy39qyRnM6wFyPn5eyEdTJ56YiwgWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSEtDK+9hXVo2anyyT/tiqBHmGqmbhh1rVG4ia/8o+I=;
 b=Bd3XGE5eUNjpbKGp91+Y1XPx2LGprIB+7r6THE5zeEFA6ZbruMhYMGPWYl4KrCoU+NwZ6RxH10uH/x58sMrTZWdTmqzLNS2GhKtq66GhSnv4r7EnJkfGuCe1u7NnOjcZW+GAPvEMuS5hBeiFLGxJGD8ujHwT6NI6qmkBj2JF6akAfgyukNewjqXESOTnkXqHzMXSUEzgTBz7qi8CE4rZnTMSTM1H4HL788qXGFcJ307C/iB9POi7UIjajwGn4eGrkQHf8POIlcTahHY/nj0VCWGGQDrU5UiZSvdrhsy13pNYoz1aAthZJJ7e3C7MHhyA1a47RIPws4BoVofo+HcGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSEtDK+9hXVo2anyyT/tiqBHmGqmbhh1rVG4ia/8o+I=;
 b=gMbJW8zPUQD7GRLQQIrY/XyBjkqFOJbloOL1gOAOXVyZFPjNRIWfZE0guXJlsiDopewY7eJFdpcl4quP6wvv1UvIDMjcfRqWYTg5lSWYxA32nSivoFrCKPBbfQA/4Q4L1hu+W/VuIAEmg2KOZ38aJ4bx5YqcTKrwSCTipHan+ZSjpmKoNc8qfHvArbpkAxFQ/AhguAs7io6v16QaPcv9IuTEwocRT4IpbxFSqAyrDwNDhaNEISngLvzwC8D+8t6fd4Y9/paLt8q1b197v1mV6mB+LDs5+QL3DAlU03AyHYPgoF32tE3DCV8H/i5UUbaXwDfDBqzoofWVKmbZhc8pWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB1963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:04:33 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:04:33 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: add os05b10 image sensor driver
Date: Fri, 12 Dec 2025 14:33:51 +0530
Message-Id: <20251212090358.44989-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
References: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::6) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: 77046b44-7490-4927-a3d1-08de395d7770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jhf5YUZrWqv1ZJJMDDghB7D66GzWZjXBl+qY6uq2C1fBdQEtfLcs10ZpyiFh?=
 =?us-ascii?Q?jbP5LToPViH/ylvDNZ6DBe0LTMRXEG0IC4kR+11kzTkgNz25Mf1KvRYDvxqx?=
 =?us-ascii?Q?T8PHE5/zhwOjsDC+eyoeCGnDQIkDqVwcD1ydabBA+Q9zeCSB3Km1VlK1r12T?=
 =?us-ascii?Q?9h2XLTVHAXfDgiH8/EYeKT7BZeaAYPvMSigl29HrtZdQtJ/D+iNV0wXWIX9F?=
 =?us-ascii?Q?LA2oL/KHZNrdku3/4A2HmRk4blQHsRbOlCUkHv/DUWBl3c110GmCWYFPOkYv?=
 =?us-ascii?Q?uHtMY3GXgKqhL4pMr33v+n2ud55RXJM6Mp+DvYnTMrKvS919Yh46hKim1Jb+?=
 =?us-ascii?Q?27mHzxyEpy7dOHbolKSIzipN1ps1Z0dn6KJrvvIxzGS+O/pOFLxgzkhCxYeo?=
 =?us-ascii?Q?mklgzrUjFNeJ1Gu7m1jD0jBEiwSZL1cFzAeL0aiGfWVE/FueD5MGh2bb/LLt?=
 =?us-ascii?Q?oNAMxAAUyeiIRhlSgW13YmXCP9W2+5WjSW0WdQnNaYPQpeQhaFG9podNn/vo?=
 =?us-ascii?Q?wfTVJZunsYZ+TtocenNxk2FtzXs2HmnW7gmzpPDccq2Zv8BZGh21G59KIHEK?=
 =?us-ascii?Q?VxKpu5qwui55AzjDw1PdAYNPspXOigQ+vyEytih46h1M0c1SDMCHTyXa7F6u?=
 =?us-ascii?Q?pEsFcUh/keBrYlppQBspyf1FxuyfCoNn3lqOBxWHr3eWS3MsPVoqkI7yVVwg?=
 =?us-ascii?Q?wNWgP9wYS1xVBDyYMJdRz+16ccQ9/P7L7/MB4Jmn3GM79M7LJNTkmlvTii6m?=
 =?us-ascii?Q?cqgtm4aOxhftkIYmAYHyg2DgShNHSjWjxEUzNb8QqhXIetUA2Ee1zpf6OClD?=
 =?us-ascii?Q?BgDcSle/9+Jbj8Pyig8m3XfmKW/gDFehKPBmbAHtcpXNxN361acqZSzbdJkV?=
 =?us-ascii?Q?fpasX7YFtqYTxePb/wxgiZU37GcB2Hehw3DO/nmHsTEU7f3nmtamq3yA1zzs?=
 =?us-ascii?Q?PxbDatAJXl/OYqIwbQcSXPZQ9cRNuH4+73pIC0fDSvTT0yZD+e/GZfHyktLY?=
 =?us-ascii?Q?388XV+9AqiuNBDXVrdUiHfx8eC3aLzHaCS9uE+sP3hpA2nF+PX6/Kv2Yso2S?=
 =?us-ascii?Q?/LYOG+QKRBLzEPZRXVJEXygWihYMnQpf22LYSxIisXi6z83X8MEZmZlQM1ve?=
 =?us-ascii?Q?fDVQPTg2AFjqkm+1rD02rkK5cJkJ11qlWoYXSc1rJ9iZtfeHt7n6kx6F8ILL?=
 =?us-ascii?Q?KiP2wX42d5R5AcFMDHAVqxdMjd+O5zT3mCmUtmSH985U1gcKJF6Hqw67c6qG?=
 =?us-ascii?Q?OpVwUqCEKHhEOZGsCB4+ZSEZ5oLCjeS6Hhh0G4oxGfB/UxzgaEt3tRohf2zG?=
 =?us-ascii?Q?lm1eHSX9yeD0nBhAxJwzlw3zve0icNwM82ewTneMq22Jd4WT4FN4qVuSVFqk?=
 =?us-ascii?Q?SAX9pXgBVUM7BBNT72VsHk8X3jbumhOs3UhN01rXHC4pSO5Zbd0tG4naeXAY?=
 =?us-ascii?Q?vV58RCmbIjhPCavkf+nQZAC2hkkTDvUCs6PKxnwwu9uOfCeF1qdV2xNd0aCO?=
 =?us-ascii?Q?WwzrbRr7wuaeHmL3g/DPTR/9ibafpxEzfVG6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLk8VQZ8JpmhVcnwUu2Rj8uA+P8TK39H52aLEuGdsmy9FctjNTHpeanvz0Fu?=
 =?us-ascii?Q?Ezvw15p7FkKWuGZrHxolQ6izQfXgEpLeeSqeaQlikvlhJler80/wgP2UzWEl?=
 =?us-ascii?Q?ba1MpNXU67FUEwmcdUn/ihhaFZBS0HTpxH2JtfrfeWeukOIuXpIF+ULK5jgP?=
 =?us-ascii?Q?6rjxeOY8Ccqg+kglYgdRWC1p5FUwl7qX6gD0Ys14JZOPqYbWYk3nYIDgC/91?=
 =?us-ascii?Q?V9SBwO1agHBDz0bbnB9l40f9TOgnr4u3el3baCthabR2yuFpzNNLzkBxdIK6?=
 =?us-ascii?Q?U6fMwO6aa6g59240q7p+58t+LjISBtSuBDb4vkYTLmgKvnQBBCfUAgdQqNRV?=
 =?us-ascii?Q?koZG2nnRH3TRUTS9YoERsG67LIUd8gQYrHvyk9Q3+T6LfMEh3UL1P7ux+b6U?=
 =?us-ascii?Q?7KI/1E0su/ujL5bbxemOuTQmbuATX2f/ah7b+y0uNjrwvH5L2dhZ/eNlNBI5?=
 =?us-ascii?Q?rKl4M1IhZGCJvggoaSjiw68XCEIsIDRSZJAxqLIrQu8GPU4aZPPtZ5JhQ9jG?=
 =?us-ascii?Q?/lHaJUW4VgTMhtSGk7eKTgRnPA74p/QLqcK5k57bosjsP5HSxg8dMq0CgERl?=
 =?us-ascii?Q?m6jxHs32h8DXEGGKLz+tXLoecCI7xytGHyvBOH7f057xjS2jalSVuSpm/abh?=
 =?us-ascii?Q?EwgPxoVE8f1Qzx14UqVZg4OB9JT6adsJeZ44wGeOyXNMhsbsTsq5zIJwt1BN?=
 =?us-ascii?Q?okisncv9PkLhvcprvKC+fs44GTG0zWYybgSISjE+IwpgwNh6e0u1Kj/Spdis?=
 =?us-ascii?Q?NVB5Yeo2sHOZhHx8KUk15jQSK6K23Too8LO4eoFMGVMzAil8PX6M1CXgr8iV?=
 =?us-ascii?Q?bPTvNwthp3g69xUx8QalMczQFoQ1D6TrFSvvL9L9aoTchx3ophdHMAkbiVgE?=
 =?us-ascii?Q?m07pSNRK2tjavaA6I8jBJ2DDUg+0Kn6S29MAgeSjXZxxla7MzhayRH41wtxv?=
 =?us-ascii?Q?eut/6E2F2XCfM4G81P8jLrr4YuB8FDo1acI/g7HJ+7BOk+IEEw1EEpJHNfxA?=
 =?us-ascii?Q?yO+VaUowbpvtX9TfbDwPkf3hvUnlZCLrH+DyDX4kLi2MzirPKCi1TuPnh1SK?=
 =?us-ascii?Q?RLUSvBIdsdU/giXpEsO6w2GRQqrw8KmLk10aptd/rpYWm3uWadMWc5NHqE56?=
 =?us-ascii?Q?QdKTrI2YaO5d8vKwvZ7Y6+yY+SlikBo+znEBZwwECRALkyjHkjluF6yBMIb7?=
 =?us-ascii?Q?sjrIxQCLfpqDiSt0rbzvI5JLz7aNQBsHZN5jPATtpRJ6Y6echPQB2xpVDRy3?=
 =?us-ascii?Q?f/h4k9bncjpGvFmoW9es8t6L1KBzc989JGHPus+z5SJDU/2w8LWEgJeAVHkr?=
 =?us-ascii?Q?DS0rgUgT0ThbibRK5i+8hE7cHRtE0A5rd6D9j3zM0kM3TiHsTW8yOn6Z4LeB?=
 =?us-ascii?Q?h4pe54Ks2+5BFKgOZO+ZMlDO/Cp88YL9C0sZCqQrpJNB7qpE8XhLABN6me/4?=
 =?us-ascii?Q?DKcY7kQQB/mfo2qJ6H08aoOIJUxYguqYTBBN5aACva+pkL4ixoKPLBqH7qOR?=
 =?us-ascii?Q?iOEbQU7DMLtu10/AFWZL3QaLqs8lIO8gmu40rkCJ9HmZ0shyIsknGjxTYvyI?=
 =?us-ascii?Q?YCmZW335gDJ+bcqQ71V0Kne8Ya6syyD5FlWav+AW35oRgJVnbSCot1cwru7S?=
 =?us-ascii?Q?7UEry79tfTz+C2DspYzHUEI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 77046b44-7490-4927-a3d1-08de395d7770
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:04:33.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc8oSEu568krJyPGNbvm9zQ9Va/Suaaof9ncvRquI6DkdH52W0VoKBqORP6Fmku1c+qSpl1jm7yD8VVzBA6YTC0z600ZtbrJAkVcSfWhyuCH9X+I7tw3K8JFflfhUEnt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1963

Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.

The Omnivision OS05B10 image sensor with an active
array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)

Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 MAINTAINERS                 |    1 +
 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/os05b10.c | 1115 +++++++++++++++++++++++++++++++++++
 4 files changed, 1127 insertions(+)
 create mode 100644 drivers/media/i2c/os05b10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c85915d5d20e..c48d04ca38d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19240,6 +19240,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+F:	drivers/media/i2c/os05b10.c

 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..9800ba50b9a6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -371,6 +371,16 @@ config VIDEO_OG0VE1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og0ve1b.

+config VIDEO_OS05B10
+        tristate "OmniVision OS05B10 sensor support"
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for Omnivision
+          OS05B10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+          module will be called os05b10.
+
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c5f17602454f..561d37939875 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
+obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
new file mode 100644
index 000000000000..319428f48f72
--- /dev/null
+++ b/drivers/media/i2c/os05b10.c
@@ -0,0 +1,1115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the os05b10
+ *
+ * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
+ *
+ * Inspired from imx219, ov2735 camera drivers.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <linux/types.h>
+#include <linux/time.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OS05B10_XCLK_FREQ		(24 * HZ_PER_MHZ)
+
+#define OS05B10_REG_CHIP_ID		CCI_REG24(0x300A)
+#define OS05B10_CHIP_ID			0x530641
+
+#define OS05B10_REG_CTRL_MODE		CCI_REG8(0x0100)
+#define OS05B10_MODE_STANDBY		0x00
+#define OS05B10_MODE_STREAMING		0x01
+
+#define OS05B10_REG_VTS			CCI_REG16(0x380E)
+#define OS05B10_VTS_MAX			0xFFFF
+
+#define OS05B10_REG_HTS			CCI_REG16(0x380C)
+
+#define OS05B10_ANALOG_GAIN		CCI_REG16(0x3508)
+#define OS05B10_ANALOG_GAIN_MIN		0x80
+#define OS05B10_ANALOG_GAIN_MAX		0x7C0
+#define OS05B10_ANALOG_GAIN_STEP	1
+#define OS05B10_ANALOG_GAIN_DEFAULT     0x80
+
+#define OS05B10_EXPOSURE_GAIN		CCI_REG24(0x3500)
+#define OS05B10_EXPOSURE_MIN		2
+#define OS05B10_EXPOSURE_STEP		1
+#define OS05B10_EXPOSURE_MARGIN         8
+
+#define OS05B10_PIXEL_RATE		(480 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+
+static const struct v4l2_rect os05b10_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 2608,
+	.height = 1960,
+};
+
+static const struct v4l2_rect os05b10_active_area = {
+	.top = 8,
+	.left = 8,
+	.width = 2592,
+	.height = 1944,
+};
+
+static const char * const os05b10_supply_name[] = {
+	"avdd", /*Analog supply 2.8v */
+	"dvdd", /*Digital core 1.2v */
+	"dovdd", /*Digital IO 1.8v */
+};
+
+static const struct cci_reg_sequence os05b10_common_regs[] = {
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x0301), 0x44 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x32 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0325), 0x3b },
+	{ CCI_REG8(0x3002), 0x21 },
+	{ CCI_REG8(0x3016), 0x72 },
+	{ CCI_REG8(0x301e), 0xb4 },
+	{ CCI_REG8(0x301f), 0xd0 },
+	{ CCI_REG8(0x3021), 0x03 },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0xa1 },
+	{ CCI_REG8(0x3108), 0x7d },
+	{ CCI_REG8(0x3109), 0xfc },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x07 },
+	{ CCI_REG8(0x3502), 0xb6 },
+	{ CCI_REG8(0x3503), 0x88 },
+	{ CCI_REG8(0x3508), 0x00 },
+	{ CCI_REG8(0x3509), 0x80 },
+	{ CCI_REG8(0x350a), 0x04 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x350d), 0x80 },
+	{ CCI_REG8(0x350e), 0x04 },
+	{ CCI_REG8(0x350f), 0x00 },
+	{ CCI_REG8(0x3510), 0x00 },
+	{ CCI_REG8(0x3511), 0x00 },
+	{ CCI_REG8(0x3512), 0x20 },
+	{ CCI_REG8(0x3600), 0x4d },
+	{ CCI_REG8(0x3601), 0x08 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3611), 0x24 },
+	{ CCI_REG8(0x3614), 0x4c },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3632), 0x80 },
+	{ CCI_REG8(0x3633), 0x00 },
+	{ CCI_REG8(0x3636), 0xcc },
+	{ CCI_REG8(0x3637), 0x27 },
+	{ CCI_REG8(0x3660), 0x00 },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3665), 0x00 },
+	{ CCI_REG8(0x3666), 0x00 },
+	{ CCI_REG8(0x366a), 0x14 },
+	{ CCI_REG8(0x3670), 0x0b },
+	{ CCI_REG8(0x3671), 0x0b },
+	{ CCI_REG8(0x3672), 0x0b },
+	{ CCI_REG8(0x3673), 0x0b },
+	{ CCI_REG8(0x3678), 0x2b },
+	{ CCI_REG8(0x367a), 0x11 },
+	{ CCI_REG8(0x367b), 0x11 },
+	{ CCI_REG8(0x367c), 0x11 },
+	{ CCI_REG8(0x367d), 0x11 },
+	{ CCI_REG8(0x3681), 0xff },
+	{ CCI_REG8(0x3682), 0x86 },
+	{ CCI_REG8(0x3683), 0x44 },
+	{ CCI_REG8(0x3684), 0x24 },
+	{ CCI_REG8(0x3685), 0x00 },
+	{ CCI_REG8(0x368a), 0x00 },
+	{ CCI_REG8(0x368d), 0x2b },
+	{ CCI_REG8(0x368e), 0x2b },
+	{ CCI_REG8(0x3690), 0x00 },
+	{ CCI_REG8(0x3691), 0x0b },
+	{ CCI_REG8(0x3692), 0x0b },
+	{ CCI_REG8(0x3693), 0x0b },
+	{ CCI_REG8(0x3694), 0x0b },
+	{ CCI_REG8(0x369d), 0x68 },
+	{ CCI_REG8(0x369e), 0x34 },
+	{ CCI_REG8(0x369f), 0x1b },
+	{ CCI_REG8(0x36a0), 0x0f },
+	{ CCI_REG8(0x36a1), 0x77 },
+	{ CCI_REG8(0x36b0), 0x30 },
+	{ CCI_REG8(0x36b2), 0x00 },
+	{ CCI_REG8(0x36b3), 0x00 },
+	{ CCI_REG8(0x36b4), 0x00 },
+	{ CCI_REG8(0x36b5), 0x00 },
+	{ CCI_REG8(0x36b6), 0x00 },
+	{ CCI_REG8(0x36b7), 0x00 },
+	{ CCI_REG8(0x36b8), 0x00 },
+	{ CCI_REG8(0x36b9), 0x00 },
+	{ CCI_REG8(0x36ba), 0x00 },
+	{ CCI_REG8(0x36bb), 0x00 },
+	{ CCI_REG8(0x36bc), 0x00 },
+	{ CCI_REG8(0x36bd), 0x00 },
+	{ CCI_REG8(0x36be), 0x00 },
+	{ CCI_REG8(0x36bf), 0x00 },
+	{ CCI_REG8(0x36c0), 0x01 },
+	{ CCI_REG8(0x36c1), 0x00 },
+	{ CCI_REG8(0x36c2), 0x00 },
+	{ CCI_REG8(0x36c3), 0x00 },
+	{ CCI_REG8(0x36c4), 0x00 },
+	{ CCI_REG8(0x36c5), 0x00 },
+	{ CCI_REG8(0x36c6), 0x00 },
+	{ CCI_REG8(0x36c7), 0x00 },
+	{ CCI_REG8(0x36c8), 0x00 },
+	{ CCI_REG8(0x36c9), 0x00 },
+	{ CCI_REG8(0x36ca), 0x0e },
+	{ CCI_REG8(0x36cb), 0x0e },
+	{ CCI_REG8(0x36cc), 0x0e },
+	{ CCI_REG8(0x36cd), 0x0e },
+	{ CCI_REG8(0x36ce), 0x0c },
+	{ CCI_REG8(0x36cf), 0x0c },
+	{ CCI_REG8(0x36d0), 0x0c },
+	{ CCI_REG8(0x36d1), 0x0c },
+	{ CCI_REG8(0x36d2), 0x00 },
+	{ CCI_REG8(0x36d3), 0x08 },
+	{ CCI_REG8(0x36d4), 0x10 },
+	{ CCI_REG8(0x36d5), 0x10 },
+	{ CCI_REG8(0x36d6), 0x00 },
+	{ CCI_REG8(0x36d7), 0x08 },
+	{ CCI_REG8(0x36d8), 0x10 },
+	{ CCI_REG8(0x36d9), 0x10 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x3703), 0x2a },
+	{ CCI_REG8(0x3704), 0x05 },
+	{ CCI_REG8(0x3709), 0x57 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x3706), 0x28 },
+	{ CCI_REG8(0x370a), 0x00 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x370e), 0x0c },
+	{ CCI_REG8(0x370f), 0x1c },
+	{ CCI_REG8(0x3710), 0x00 },
+	{ CCI_REG8(0x3713), 0x00 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x3716), 0x24 },
+	{ CCI_REG8(0x371a), 0x1e },
+	{ CCI_REG8(0x3724), 0x09 },
+	{ CCI_REG8(0x3725), 0xb2 },
+	{ CCI_REG8(0x372b), 0x54 },
+	{ CCI_REG8(0x3730), 0xe1 },
+	{ CCI_REG8(0x3735), 0x80 },
+	{ CCI_REG8(0x3739), 0x10 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x3740), 0x28 },
+	{ CCI_REG8(0x3741), 0x21 },
+	{ CCI_REG8(0x3742), 0x21 },
+	{ CCI_REG8(0x3743), 0x21 },
+	{ CCI_REG8(0x3744), 0x63 },
+	{ CCI_REG8(0x3745), 0x5a },
+	{ CCI_REG8(0x3746), 0x5a },
+	{ CCI_REG8(0x3747), 0x5a },
+	{ CCI_REG8(0x3748), 0x00 },
+	{ CCI_REG8(0x3749), 0x00 },
+	{ CCI_REG8(0x374a), 0x00 },
+	{ CCI_REG8(0x374b), 0x00 },
+	{ CCI_REG8(0x3756), 0x00 },
+	{ CCI_REG8(0x3757), 0x0e },
+	{ CCI_REG8(0x375d), 0x84 },
+	{ CCI_REG8(0x3760), 0x11 },
+	{ CCI_REG8(0x3767), 0x08 },
+	{ CCI_REG8(0x376f), 0x42 },
+	{ CCI_REG8(0x3771), 0x00 },
+	{ CCI_REG8(0x3773), 0x01 },
+	{ CCI_REG8(0x3774), 0x02 },
+	{ CCI_REG8(0x3775), 0x12 },
+	{ CCI_REG8(0x3776), 0x02 },
+	{ CCI_REG8(0x377b), 0x40 },
+	{ CCI_REG8(0x377c), 0x00 },
+	{ CCI_REG8(0x377d), 0x0c },
+	{ CCI_REG8(0x3782), 0x02 },
+	{ CCI_REG8(0x3787), 0x24 },
+	{ CCI_REG8(0x378a), 0x01 },
+	{ CCI_REG8(0x378d), 0x00 },
+	{ CCI_REG8(0x3790), 0x1f },
+	{ CCI_REG8(0x3791), 0x58 },
+	{ CCI_REG8(0x3795), 0x24 },
+	{ CCI_REG8(0x3796), 0x01 },
+	{ CCI_REG8(0x3798), 0x40 },
+	{ CCI_REG8(0x379c), 0x00 },
+	{ CCI_REG8(0x379d), 0x00 },
+	{ CCI_REG8(0x379e), 0x00 },
+	{ CCI_REG8(0x379f), 0x01 },
+	{ CCI_REG8(0x37a1), 0x10 },
+	{ CCI_REG8(0x37a6), 0x00 },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x37ac), 0xa0 },
+	{ CCI_REG8(0x37be), 0x0a },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37bb), 0x02 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37c4), 0x11 },
+	{ CCI_REG8(0x37c5), 0x80 },
+	{ CCI_REG8(0x37c6), 0x14 },
+	{ CCI_REG8(0x37c7), 0x08 },
+	{ CCI_REG8(0x37c8), 0x42 },
+	{ CCI_REG8(0x37cd), 0x17 },
+	{ CCI_REG8(0x37ce), 0x01 },
+	{ CCI_REG8(0x37d8), 0x02 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x37dc), 0x01 },
+	{ CCI_REG8(0x37e0), 0x0c },
+	{ CCI_REG8(0x37e1), 0x20 },
+	{ CCI_REG8(0x37e2), 0x10 },
+	{ CCI_REG8(0x37e3), 0x04 },
+	{ CCI_REG8(0x37e4), 0x28 },
+	{ CCI_REG8(0x37e5), 0x02 },
+	{ CCI_REG8(0x37ef), 0x00 },
+	{ CCI_REG8(0x37f4), 0x00 },
+	{ CCI_REG8(0x37f5), 0x00 },
+	{ CCI_REG8(0x37f6), 0x00 },
+	{ CCI_REG8(0x37f7), 0x00 },
+	{ CCI_REG8(0x3800), 0x01 },
+	{ CCI_REG8(0x3801), 0x30 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0b },
+	{ CCI_REG8(0x3805), 0x5f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0xa7 },
+	{ CCI_REG8(0x3808), 0x0a },
+	{ CCI_REG8(0x3809), 0x20 },
+	{ CCI_REG8(0x380a), 0x07 },
+	{ CCI_REG8(0x380b), 0x98 },
+	{ CCI_REG8(0x380c), 0x06 },
+	{ CCI_REG8(0x380d), 0xd0 },
+	{ CCI_REG8(0x380e), 0x07 },
+	{ CCI_REG8(0x380f), 0xd6 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x01 },
+	{ CCI_REG8(0x3815), 0x01 },
+	{ CCI_REG8(0x3816), 0x01 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x00 },
+	{ CCI_REG8(0x381a), 0x00 },
+	{ CCI_REG8(0x381b), 0x01 },
+	{ CCI_REG8(0x3820), 0x88 },
+	{ CCI_REG8(0x3821), 0x00 },
+	{ CCI_REG8(0x3822), 0x12 },
+	{ CCI_REG8(0x3823), 0x08 },
+	{ CCI_REG8(0x3824), 0x00 },
+	{ CCI_REG8(0x3825), 0x20 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x08 },
+	{ CCI_REG8(0x3829), 0x03 },
+	{ CCI_REG8(0x382a), 0x00 },
+	{ CCI_REG8(0x382b), 0x00 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3838), 0x00 },
+	{ CCI_REG8(0x3839), 0x00 },
+	{ CCI_REG8(0x383a), 0x00 },
+	{ CCI_REG8(0x383b), 0x00 },
+	{ CCI_REG8(0x383d), 0x01 },
+	{ CCI_REG8(0x383e), 0x00 },
+	{ CCI_REG8(0x383f), 0x00 },
+	{ CCI_REG8(0x3843), 0x00 },
+	{ CCI_REG8(0x3880), 0x16 },
+	{ CCI_REG8(0x3881), 0x00 },
+	{ CCI_REG8(0x3882), 0x08 },
+	{ CCI_REG8(0x389a), 0x00 },
+	{ CCI_REG8(0x389b), 0x00 },
+	{ CCI_REG8(0x38a2), 0x02 },
+	{ CCI_REG8(0x38a3), 0x02 },
+	{ CCI_REG8(0x38a4), 0x02 },
+	{ CCI_REG8(0x38a5), 0x02 },
+	{ CCI_REG8(0x38a7), 0x04 },
+	{ CCI_REG8(0x38b8), 0x02 },
+	{ CCI_REG8(0x3c80), 0x3e },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3c87), 0x02 },
+	{ CCI_REG8(0x389c), 0x00 },
+	{ CCI_REG8(0x3ca2), 0x0c },
+	{ CCI_REG8(0x3d85), 0x1b },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3d8d), 0xe2 },
+	{ CCI_REG8(0x3f00), 0xcb },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x3f9e), 0x07 },
+	{ CCI_REG8(0x3f9f), 0x04 },
+	{ CCI_REG8(0x4000), 0xf3 },
+	{ CCI_REG8(0x4002), 0x00 },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x400b), 0x00 },
+	{ CCI_REG8(0x4040), 0x00 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4090), 0x14 },
+	{ CCI_REG8(0x40b0), 0x01 },
+	{ CCI_REG8(0x40b1), 0x01 },
+	{ CCI_REG8(0x40b2), 0x30 },
+	{ CCI_REG8(0x40b3), 0x04 },
+	{ CCI_REG8(0x40b4), 0xe8 },
+	{ CCI_REG8(0x40b5), 0x01 },
+	{ CCI_REG8(0x40b7), 0x07 },
+	{ CCI_REG8(0x40b8), 0xff },
+	{ CCI_REG8(0x40b9), 0x00 },
+	{ CCI_REG8(0x40ba), 0x00 },
+	{ CCI_REG8(0x4300), 0xff },
+	{ CCI_REG8(0x4301), 0x00 },
+	{ CCI_REG8(0x4302), 0x0f },
+	{ CCI_REG8(0x4303), 0x20 },
+	{ CCI_REG8(0x4304), 0x20 },
+	{ CCI_REG8(0x4305), 0x83 },
+	{ CCI_REG8(0x4306), 0x21 },
+	{ CCI_REG8(0x430d), 0x00 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4506), 0x00 },
+	{ CCI_REG8(0x4507), 0x60 },
+	{ CCI_REG8(0x4803), 0x00 },
+	{ CCI_REG8(0x4809), 0x8e },
+	{ CCI_REG8(0x480e), 0x00 },
+	{ CCI_REG8(0x4813), 0x00 },
+	{ CCI_REG8(0x4814), 0x2a },
+	{ CCI_REG8(0x481b), 0x40 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4825), 0x34 },
+	{ CCI_REG8(0x4829), 0x64 },
+	{ CCI_REG8(0x4837), 0x12 },
+	{ CCI_REG8(0x484b), 0x07 },
+	{ CCI_REG8(0x4883), 0x36 },
+	{ CCI_REG8(0x4885), 0x03 },
+	{ CCI_REG8(0x488b), 0x00 },
+	{ CCI_REG8(0x4d06), 0x01 },
+	{ CCI_REG8(0x4e00), 0x2a },
+	{ CCI_REG8(0x4e0d), 0x00 },
+	{ CCI_REG8(0x5000), 0xf9 },
+	{ CCI_REG8(0x5001), 0x09 },
+	{ CCI_REG8(0x5004), 0x00 },
+	{ CCI_REG8(0x5005), 0x0e },
+	{ CCI_REG8(0x5036), 0x00 },
+	{ CCI_REG8(0x5080), 0x04 },
+	{ CCI_REG8(0x5082), 0x00 },
+	{ CCI_REG8(0x5180), 0x00 },
+	{ CCI_REG8(0x5181), 0x10 },
+	{ CCI_REG8(0x5182), 0x01 },
+	{ CCI_REG8(0x5183), 0xdf },
+	{ CCI_REG8(0x5184), 0x02 },
+	{ CCI_REG8(0x5185), 0x6c },
+	{ CCI_REG8(0x5189), 0x48 },
+	{ CCI_REG8(0x520a), 0x03 },
+	{ CCI_REG8(0x520b), 0x0f },
+	{ CCI_REG8(0x520c), 0x3f },
+	{ CCI_REG8(0x580b), 0x03 },
+	{ CCI_REG8(0x580d), 0x00 },
+	{ CCI_REG8(0x580f), 0x00 },
+	{ CCI_REG8(0x5820), 0x00 },
+	{ CCI_REG8(0x5821), 0x00 },
+	{ CCI_REG8(0x3222), 0x03 },
+	{ CCI_REG8(0x3208), 0x06 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x01 },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x1c },
+	{ CCI_REG8(0x3610), 0x37 },
+	{ CCI_REG8(0x3208), 0x16 },
+	{ CCI_REG8(0x3208), 0x07 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x17 },
+	{ CCI_REG8(0x3208), 0x08 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x18 },
+	{ CCI_REG8(0x3208), 0x09 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x28 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x63 },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x19 },
+};
+
+struct os05b10 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xclk;
+	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(os05b10_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+
+	unsigned long link_freq_index;
+};
+
+struct os05b10_mode {
+	u32 width;
+	u32 height;
+	u32 vts; /* default VTS */
+	u32 hts; /* default HTS */
+	u32 exp; /* default exposure */
+};
+
+static const struct os05b10_mode supported_modes_10bit[] = {
+	{
+		/* 2592x1944 */
+		.width = 2592,
+		.height = 1944,
+		.vts = 2006,
+		.hts = 2616,
+		.exp = 1944,
+	},
+};
+
+static const s64 link_frequencies[] = {
+	OS05B10_LINK_FREQ_600MHZ,
+};
+
+static const u32 os05b10_mbus_codes[] = {
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct os05b10, sd);
+};
+
+static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
+						     struct os05b10, handler);
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int vmax, ret;
+
+	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure. */
+		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+					       os05b10->exposure->minimum, max,
+					       os05b10->exposure->step,
+					       os05b10->exposure->default_value);
+
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		vmax = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_ANALOG_GAIN, ctrl->val,
+				NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(os05b10->cci, OS05B10_EXPOSURE_GAIN, ctrl->val,
+				NULL);
+		break;
+	default:
+		dev_err(os05b10->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		break;
+	}
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_get_regulators(struct os05b10 *os05b10)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
+		os05b10->supplies[i].supply = os05b10_supply_name[i];
+
+	return devm_regulator_bulk_get(os05b10->dev,
+				       ARRAY_SIZE(os05b10_supply_name),
+				       os05b10->supplies);
+}
+
+static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
+		return -EINVAL;
+
+	code->code = os05b10_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int os05b10_set_framing_limits(struct os05b10 *os05b10,
+				      const struct os05b10_mode *mode)
+{
+	u32 hblank, vblank, vblank_max, max_exp;
+	int ret;
+
+	hblank = mode->hts - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1, hblank);
+	if (ret)
+		return ret;
+
+	vblank = mode->vts - mode->height;
+	vblank_max = OS05B10_VTS_MAX - mode->height;
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1, vblank);
+	if (ret)
+		return ret;
+
+	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	return __v4l2_ctrl_modify_range(os05b10->exposure,
+					OS05B10_EXPOSURE_MIN, max_exp,
+					OS05B10_EXPOSURE_STEP, mode->exp);
+}
+
+static int os05b10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = os05b10_set_framing_limits(os05b10, mode);
+		if (ret)
+			return ret;
+	}
+
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int os05b10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = os05b10_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = os05b10_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+		return -EINVAL;
+
+	if (fse->index >= 1)
+		return -EINVAL;
+
+	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int os05b10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(os05b10->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Write common registers */
+	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
+				  ARRAY_SIZE(os05b10_common_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "%s failed to write common registers\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized user controls */
+	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Stream ON */
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STREAMING, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(os05b10->dev);
+	return ret;
+}
+
+static int os05b10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(os05b10->dev, "%s failed to set stream off\n", __func__);
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+
+	/* Initialize try_fmt */
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	mode = &supported_modes_10bit[0];
+	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	/* Update image pad formate */
+	format->width = mode->width;
+	format->height = mode->height;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_RAW;
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops os05b10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops os05b10_pad_ops = {
+	.enum_mbus_code = os05b10_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = os05b10_set_pad_format,
+	.get_selection = os05b10_get_selection,
+	.enum_frame_size = os05b10_enum_frame_size,
+	.enable_streams = os05b10_enable_streams,
+	.disable_streams = os05b10_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops os05b10_internal_ops = {
+	.init_state = os05b10_init_state,
+};
+
+static const struct v4l2_subdev_ops os05b10_subdev_ops = {
+	.video = &os05b10_video_ops,
+	.pad = &os05b10_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops os05b10_ctrl_ops = {
+	.s_ctrl = os05b10_set_ctrl,
+};
+
+static int os05b10_identify_module(struct os05b10 *os05b10)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret,
+				     "failed to read chip id %x\n",
+				     OS05B10_CHIP_ID);
+
+	if (val != OS05B10_CHIP_ID)
+		return dev_err_probe(os05b10->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     OS05B10_CHIP_ID, val);
+	return 0;
+}
+
+static int os05b10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	unsigned long delay_us;
+	int ret;
+
+	/* Enable power rails */
+	ret = regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_name),
+				    os05b10->supplies);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	/* Enable xclk */
+	ret = clk_prepare_enable(os05b10->xclk);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable clock\n");
+		goto err_regulator_off;
+	}
+
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 0);
+
+	/* Delay T1 */
+	fsleep(5 * USEC_PER_MSEC);
+
+	/* Delay T2 (8192 cycles before SCCB/I2C access) */
+	delay_us = DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 / 1000);
+	usleep_range(delay_us, delay_us * 2);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),
+			       os05b10->supplies);
+	return ret;
+}
+
+static int os05b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os05b10->supplies);
+	clk_disable_unprepare(os05b10->xclk);
+	return 0;
+}
+
+static int os05b10_parse_endpoint(struct os05b10 *os05b10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->dev), NULL);
+	if (!ep) {
+		dev_err(os05b10->dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_frequencies,
+				       ARRAY_SIZE(link_frequencies),
+				       &os05b10->link_freq_index);
+
+	if (ret)
+		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int os05b10_init_controls(struct os05b10 *os05b10)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_fwnode_device_properties props;
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	u64 hblank_def, vblank_def, exp_max;
+	int ret;
+
+	ctrl_hdlr = &os05b10->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE,
+						OS05B10_PIXEL_RATE,
+						OS05B10_PIXEL_RATE, 1,
+						OS05B10_PIXEL_RATE);
+
+	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+						    V4L2_CID_LINK_FREQ,
+						    os05b10->link_freq_index,
+						    0, link_frequencies);
+	if (os05b10->link_freq)
+		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hblank_def = mode->hts - mode->width;
+	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					    hblank_def, hblank_def, 1, hblank_def);
+	if (os05b10->hblank)
+		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank_def = mode->vts - mode->height;
+	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_def,
+					    OS05B10_VTS_MAX - mode->height,
+					    1, vblank_def);
+
+	exp_max = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	os05b10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OS05B10_EXPOSURE_MIN,
+					      exp_max, OS05B10_EXPOSURE_STEP,
+					      mode->exp);
+
+	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					  V4L2_CID_ANALOGUE_GAIN,
+					  OS05B10_ANALOG_GAIN_MIN,
+					  OS05B10_ANALOG_GAIN_MAX,
+					  OS05B10_ANALOG_GAIN_STEP,
+					  OS05B10_ANALOG_GAIN_DEFAULT);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	os05b10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int os05b10_probe(struct i2c_client *client)
+{
+	struct os05b10 *os05b10;
+	unsigned int xclk_freq;
+	int ret;
+
+	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
+	if (!os05b10)
+		return -ENOMEM;
+
+	os05b10->client = client;
+	os05b10->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
+
+	os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(os05b10->cci))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
+				     "failed to initialize CCI\n");
+
+	os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
+	if (IS_ERR(os05b10->xclk))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(os05b10->xclk);
+	if (xclk_freq != OS05B10_XCLK_FREQ)
+		return dev_err_probe(os05b10->dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     xclk_freq);
+
+	ret = os05b10_get_regulators(os05b10);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
+
+	ret = os05b10_parse_endpoint(os05b10);
+	if (ret) {
+		return dev_err_probe(os05b10->dev, ret,
+				     "failed to parse endpoint configuration\n");
+	}
+
+	os05b10->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(os05b10->reset_gpio))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = os05b10_power_on(os05b10->dev);
+	if (ret)
+		return ret;
+
+	ret = os05b10_identify_module(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* This needs the pm runtime to be registered. */
+	ret = os05b10_init_controls(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	os05b10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	os05b10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	os05b10->sd.internal_ops = &os05b10_internal_ops;
+	os05b10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&os05b10->sd.entity, 1, &os05b10->pad);
+	if (ret) {
+		dev_err_probe(os05b10->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	os05b10->sd.state_lock = os05b10->handler.lock;
+	ret = v4l2_subdev_init_finalize(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(os05b10->dev);
+	pm_runtime_enable(os05b10->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret,
+			      "failed to register os05b10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(os05b10->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&os05b10->sd);
+	pm_runtime_disable(os05b10->dev);
+	pm_runtime_set_suspended(os05b10->dev);
+
+error_media_entity:
+	media_entity_cleanup(&os05b10->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+error_power_off:
+	os05b10_power_off(os05b10->dev);
+
+	return ret;
+}
+
+static void os05b10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&os05b10->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		os05b10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(os05b10_pm_ops, os05b10_power_off,
+				 os05b10_power_on, NULL);
+
+static const struct of_device_id os05b10_id[] = {
+	{ .compatible = "ovti,os05b10" },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, os05b10_id);
+
+static struct i2c_driver os05b10_driver = {
+	.driver = {
+		.name = "os05b10",
+		.pm = pm_ptr(&os05b10_pm_ops),
+		.of_match_table = os05b10_id,
+	},
+	.probe = os05b10_probe,
+	.remove = os05b10_remove,
+};
+
+module_i2c_driver(os05b10_driver);
+
+MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1


