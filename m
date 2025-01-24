Return-Path: <linux-media+bounces-25235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646BA1ADDA
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161543A2ECB
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 00:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCC72AD0C;
	Fri, 24 Jan 2025 00:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Th86hTtz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BEC18651;
	Fri, 24 Jan 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677617; cv=fail; b=KFEmlP43iK4H9zrb128287HSvrjtA1gXqU9RQrUpW/7RXcI1dhB/XI7KvN+MYqEh8RXITjFG9gV7F0Nwq1e2pynvot83PD13yT62EBYL0lRRvkXXVTbiEAmbOtqmU3HUTXL9iL44F7z5gn7/dadyPCHen+rHTz6RDmjlP2WOObM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677617; c=relaxed/simple;
	bh=ixkt+8sXxE3w9xsRCgrPBeZkHB8W3DzJUh3crXIA8to=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O43G7G93H4ff4gaBab/dZPaxasspf5rQmUG110JXn7qvK5xI205s3sZ2GyHluP8e+TzglsmHp54fQnbEXMg9gSa/dCxgOQLSGrLMjyTZ+MK970IfH41Evw4zQlAgzPtp4rp+LCt6QNlWcX2SJ1HA/4kpXkz/QwRwKo7i+agH40Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Th86hTtz; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVdHkKoTVXQ4HsqGKzFQeJc5wOs9R9lD9TtuYya055AQGic1z4fzibf1+8SQ+srikQf0Uw4+prEzv76omBOtdsEC7Jk7g2YHkwf/C+xpVBWbTPCnwuFGkvXQFO3w0SAtxOirDWkG2htQqmfk0Fjfn1cjsbXnnpFGheI6o+qdUAakQIybx+L++4lg2tvw4yY99W44x/lvZtPbC69AhLt4GRGyyvarHFWH+NLW+ICYbHfKgcRb95uaP7l/QYIOK6aTO6b2EyA/llKJs7SZhEp6aOHN/UXP52inkuF3m84rVAlMw8HSRKlehopwdQkwUOhD5kc4ZuY7KVARU7G988p4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+niRkNmkffIPERobfLG9P08PEMAUZdx53ZDP0Z3vug=;
 b=c+ZCsKs5l6apsDUz8d6gRJqX5MAbkkrkaQ7+BBfxp6MDxtNdNtgDE4TbseYzjZTE83fOowy2GD9S8cXB0ZOY3U0wtdHpFGlo5gBoJyyQ4BMOGPihN4sHuRnWr95cInCAZw85vpSClVChZyFxIrvKVdYLIEZ/DLrrD1yHkPal3UdYF/kXUa2/TQ8PZUc/mdOyzLpRkaTY17tasxHQ5kqPCHx+KNhFSU/NDqFTu6vPORDFXm+oeNM4ZpgC6GTm5Y+nXxbVE0osr/RVyWzCU/qzfzCyF65elfmwfK/Tj9a3VWXCtn4Fv3idydHUTu8uZnNIaoJJyCTZ7oO7fV35EhG2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+niRkNmkffIPERobfLG9P08PEMAUZdx53ZDP0Z3vug=;
 b=Th86hTtzILUs6fT6u2ywD85KCcKlZo+pxQlx6t7d4/Aa1V2n7mA7yZO75jr31JQeO7tNpQXLnpUHSLVInWCF6sJyIKNWfXpAU5lP1s8ypZ/Km9G6KnpEaTa1COvP89TT1y3n9aFNjkLyDbe14/SBxGbyPyAjVFrMr3HjWD5WZFmipyDuX0q0L4CvA54oAA9rMbKfCfvvUFe6PZJwdnszQWM1HgK2XrtTxty3IiGCQa6PfBE916zjPCQQE+quhySt7qItiyYZ/eb3mS+Yf5I5WjOoDGa09w7vNJtdWddisB7Yc6ftmNOjRxl9k1dBB6otyM2UDaD/o4SWgiXa6E83wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 00:13:27 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 00:13:27 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH v3 4/4] media: ox05b1s: Add support for Omnivision OS08A20 raw sensor
Date: Fri, 24 Jan 2025 02:12:43 +0200
Message-Id: <20250124001243.446511-5-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124001243.446511-1-mirela.rabulea@nxp.com>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To PAXPR04MB9231.eurprd04.prod.outlook.com
 (2603:10a6:102:2bb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9231:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 61709228-886e-424d-2591-08dd3c0bed0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jswp8meDrFln5mfkHQCRrehAcUyOladREdnkuV42npSvXhioLxfdEXEgjPw6?=
 =?us-ascii?Q?vzIsLIgG4id8XEOtjmDck+vfJmvQelQ8VoAmaMiaXLsbtd/n0z2IjFRLCbr9?=
 =?us-ascii?Q?awSrJtr6TNr8SODmENXghVhtXLUjGy7DSh6RcyxkrkzHS4hpcA/aDyFKjLYL?=
 =?us-ascii?Q?h/diJLFzMxrR2bNB+6vTk2HQoiR7zbOAvgiInENgQLOzVts9fTfmS0D22FwL?=
 =?us-ascii?Q?5RtaJAr8aly77N/E3SPfoX0AtpF3MRQ5blPYcmLg8GakfvDibTzgDGlLubtK?=
 =?us-ascii?Q?4n5cg3Rhu2ghftPfONQLUxrN4OhoulFaxXJq5jmsVQjLvDNq8EmMcx0OJKRH?=
 =?us-ascii?Q?bYjvEfJRNf4AzVehYsi9PmQpHmfuG+MtkgNI+nls0GAra62Zp9MZUJYMPMi/?=
 =?us-ascii?Q?K6nXb7M22J+FlO1TXoHe7TOkaXcCf26/AvRmIRhlQUA/cg1wnhUcsi4tcpqC?=
 =?us-ascii?Q?g2z3vpS+7h9XO6CeLrNerIDUX9ErmwVEeqUSbDhgV0HE+dPNVDQYyjIlufYw?=
 =?us-ascii?Q?8uca8+ZUymg5hgtv13iGghNGX86dXP3IQiX60oHzG0eUJ/r7zYwSdcnY49Sg?=
 =?us-ascii?Q?qXLeNcR1Lcl8l+2AjwkOFxDCTh8fG0gEH+pHMuh2UaBYgUlGaxy7rDm/3Ndm?=
 =?us-ascii?Q?bo6FC90MKgUBGtInFQ6wtT4wbNROMEgo8Lo+dqa0oXLdB1sEmSR36dplGiSb?=
 =?us-ascii?Q?xAvnsco6MwWMYi8KH6ilpIn/6MTDi+1xyn9B61ktDSP08eGP3X+A6okwEWn8?=
 =?us-ascii?Q?7H7AxPap0VmV/xdgPJY004ZaybW+lOBvvQu9gVfFQxbEZSpSJxBswaCa43HW?=
 =?us-ascii?Q?m/Fh9JEw+mS//t/o8kqaRVhWiPmx8VGROanEXihQeqaHn2SzZ0r1/O/iMjAj?=
 =?us-ascii?Q?dF2Mh5sLqhFkgKEOgLn+VgX554EShUUoGrqHNNDoQqAGU5kMba57Qyn2Ph+t?=
 =?us-ascii?Q?WA4+ruXCFF8nfasKOXVjpKz+YAxv+fqv7rWoTZitse8rUXPtBrpmpGO4dcBV?=
 =?us-ascii?Q?8NOp23881Cj3P8HTK8J3aGeNe1hTY82PZhUjMLkQNr5j0J/NeUadT2Xtpz0Z?=
 =?us-ascii?Q?tO7Co1yaT3mMtnfQyj2I8vUZWrDjibx/itr4FYzJF3cnz8UyRMGWKw11QFX+?=
 =?us-ascii?Q?OUxfQ3CJOaTV/asRnq5uUDxaPXt2z8R0hprEFG5gznQCp3eCCBgvFJwM5KwF?=
 =?us-ascii?Q?xmSpU7wDkSVuP/1NuPoQZwPtwd9TAZDH5zLruQqTXLmcBExuRXSZ2OnMSUfq?=
 =?us-ascii?Q?cZXH/aZpEKASRAAlkZMXxqQgsERrDOlTAP5h3QEXzTiDWEC6Q5T1Honcf9zl?=
 =?us-ascii?Q?yCP/FnlPsFUEBeoFrnOrg/qwbKXmpDlVJvlZrGaIHx5hWj8aVz30leteifXf?=
 =?us-ascii?Q?5iW2HxC69hpDr0rrkXW0tg4e7f4o7xYkVWBNJRayXbmh833n5TopGwBbIpMV?=
 =?us-ascii?Q?6DTg74WT88y4vjLuRMh084d5GOoPdfty?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/q+Pbzj9lonSZ+pMqfdI9HXhZPxQ8szisklHs6IMaBbAlyqEWFPENNfLUh46?=
 =?us-ascii?Q?Fn2QO7MmYbml46/sTQOhnvzp3afXxsZgjGHZUZxvU1dajHPetAS4NPrONwo5?=
 =?us-ascii?Q?nL+877l492LDCB6cpmQgOW/i2QPU1LkTnePyL78lDQvAxBHhka+NQYOrmOv8?=
 =?us-ascii?Q?NnOrTbnKBAERsR98zCQGemAvbfuB1vbdu2QqAu+RjPzW7yJ+v7BIg+6B/2tP?=
 =?us-ascii?Q?iV6ctEAWYXEEHxEBovgXK1jmp+YjMepp0EGur+qp8sEqc64YsLWylsGMGdAh?=
 =?us-ascii?Q?hQr9kcm8zCCTYyWnt5xTFAmx1i/VK/Nw7eQx1/3Wf8Jmig/MPAMpZKG3PpLk?=
 =?us-ascii?Q?N5YltBdyZDqWE1h/4zLEb5fPzJxziChhxfbjBldXjREVz3b32WbF1mkF/Keu?=
 =?us-ascii?Q?CnRl9j4qr+X46z1Hfps/hG4CZzTM2GonpvIpT1EAjYyM2NaYXndcSzPe8EF+?=
 =?us-ascii?Q?42Bs+dZ+6qYxfHeij2FSKuHtbzmlnVq6HQWF+6wCOlA9M4VGPlqBoV5eE8sJ?=
 =?us-ascii?Q?K3sCN1DueNif9ZvhfBuQ9lxoZKmPmEqYCpHFnB1AQRbY3hHBx+xe6ZO2Hfp4?=
 =?us-ascii?Q?aoCtecPTE7hBXg50EdIHtuUpcZjWNNLxjs2cp8ShsEszb4v89PGJLibzyedl?=
 =?us-ascii?Q?yTsYmq/hHHtwl7o8f7WLzGtYF2YcyPipz2RQ+5OQ6zuz6i3Xo/kLmHF1HMyf?=
 =?us-ascii?Q?785nJBpwi5TQSE76VBSYxbsEw2iumkQA60AoqiQ0b5+fJZYqhbkOFJ6WNlL5?=
 =?us-ascii?Q?BrYx140UB6fvK39DIM6OWf2+cB9IRfVlAB6ABK5W+YWFHHD5NBPvlVqMU4Uc?=
 =?us-ascii?Q?ksvaA6GMp6ezQ0eRcrXshq1733elCVFxoR2sbAHuULTBEHqhPfwh4sAhQ0dB?=
 =?us-ascii?Q?BGerV+j/ws8c4MeyOMEy/tldmaer6Jx5ExV1gpMfq+xxOpfMAhWhLdylGZiv?=
 =?us-ascii?Q?NCXV7aLzZM7M27lz8JSc+nSJCld83nytfWpHwdrbR94ag6p5XvjMTDZTDGCM?=
 =?us-ascii?Q?oDjb9vRx6xFUAKomJ5BI4Cmff7jXPMkEUAMGhn6Q/PjwycOThNRgVtLxG8Pc?=
 =?us-ascii?Q?83fZ2DknTHKj5TmbfJDGl/PazipZclq6mN+XNmkWqV4izbO7U7W1C1jEbTpi?=
 =?us-ascii?Q?remj3/QTY+O/iCuG+F2wapV8mi6ltfkZtm+sNgwji41iWryvxM7pCQPSjRwm?=
 =?us-ascii?Q?3GbZl/pdN4aeiUjAcpq+eeiUccxJcMxS1waGlI/ab78qy6TdtYdo4KKTjPHd?=
 =?us-ascii?Q?xC0UAgps/SgC+HIQlv81cWbvtCLDngs2CZxp3mnlDSrcW6WLbHINUDQMCeaW?=
 =?us-ascii?Q?CG7dfgBz6M4AKEzqTDzgeGYw7V92hF9HFp0+fAfHCgQoX6zHoSTeKwW0OsbX?=
 =?us-ascii?Q?ITcYmt05ouSnM27bUcJc7UbwpvpoC5Db78/9T/eGQHbY4Fv7ZUCY9S93D68r?=
 =?us-ascii?Q?XkO41DYZspBCu1uTpKkni04CCHN5hRNHB2AJaHcVpEU0GmvfU1H2OTkXeBW+?=
 =?us-ascii?Q?FQ9/Fdd20J+Z6mtJKDjYQSqhXmL0ixUs9HY2Zo46ZJMLt5sN6aI6He16WGV9?=
 =?us-ascii?Q?F18ATz5GFDagiI8ZemNa1Q9/wks3+pyrwQaInE/YTVDyvf+RqxcjJvaE0LSe?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61709228-886e-424d-2591-08dd3c0bed0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 00:13:27.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ6ZFLVEf3zAAOrhc4D7TY7Gobilf4Z60qWNhDbK6bnDdiFLQfpy8VtWj8VbjkghYUmoPxmvi8Tbp1yWm5v6uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
HDR mode control is supported, with one HDR mode: staggered HDR
with 2 exposures on separate virtual channels. However, for now,
only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v3:
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	Use const for os08a20_supported_modes	
	os08a20 register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Let the 4k 10bit mode by default without hdr, all 3 modes are now by default without hdr, staggered hdr may be enabled via v4l2-ctl for any of them.
	Separate the 10/12 bit register settings into separate lists: os08a20_init_setting_10bit, os08a20_init_setting_12bit
	Update commit description: rearrange supported resolutions and remove 1 duplicate line, state HDR limitation
	Increase a bit the default vts for 1080p, to get exactly 60fps, it was 62.61
	Use regmap_update_bits() directly and remove ox05b1s_regmap_update_bits()

Changes in v2:
	Add spaces inside brackets, wrap lines to 80
	Remove some redundant initialization
	Use a loop in os08a20_enable_staggered_hdr/os08a20_disable_staggered_hdr, for that, add a register settings array for HDR enabling/disabling
	Make "sizes" a pointer
	Remove mode headers, add supported modes in the dedicated c file, ox05b1s_modes.c 
	Refactor register lists, for os08a20 use a common list for all modes, and also specific lists per mode

 drivers/media/i2c/ox05b1s/ox05b1s.h       |   4 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 184 ++++++++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  96 +++++++++++
 3 files changed, 284 insertions(+)

diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
index a893c65894f3..5115060e23cb 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s.h
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -17,6 +17,10 @@ struct ox05b1s_reglist {
 	struct ox05b1s_reg *regs;
 };
 
+extern struct ox05b1s_reglist os08a20_reglist_4k_10b[];
+extern struct ox05b1s_reglist os08a20_reglist_4k_12b[];
+extern struct ox05b1s_reglist os08a20_reglist_1080p_10b[];
+
 extern struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
 
 #endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
index aeea7caa6a15..7dcba5235926 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -40,6 +40,7 @@ struct ox05b1s_sizes {
 	const struct v4l2_area *sizes;
 };
 
+struct ox05b1s;
 struct ox05b1s_plat_data {
 	char				name[20];
 	u32				chip_id;
@@ -52,6 +53,9 @@ struct ox05b1s_plat_data {
 	const struct ox05b1s_mode	*supported_modes;
 	u32				default_mode_index;
 	const struct ox05b1s_sizes	*supported_codes;
+	const char * const		*hdr_modes;
+	u32				hdr_modes_count;
+	int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
 };
 
 struct ox05b1s_ctrls {
@@ -62,6 +66,7 @@ struct ox05b1s_ctrls {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hdr_mode;
 };
 
 struct ox05b1s_mode {
@@ -102,6 +107,85 @@ struct ox05b1s {
 	struct ox05b1s_ctrls ctrls;
 };
 
+static const struct ox05b1s_mode os08a20_supported_modes[] = {
+	{
+		/* 1080p BGGR10, no hdr, 60fps */
+		.index		= 0,
+		.width		= 1920,
+		.height		= 1080,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x4d3,
+		.hts		= 0x790,
+		.exp		= 0x4d3 - 8,
+		.h_bin		= true,
+		.fps		= 60,
+		.reg_data	= os08a20_reglist_1080p_10b,
+	}, {
+		/* 4k BGGR10, no hdr, 30fps */
+		.index		= 1,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x90a,
+		.hts		= 0x818,
+		.exp		= 0x90a - 8,
+		.h_bin		= false,
+		.fps		= 30,
+		.reg_data	= os08a20_reglist_4k_10b,
+	}, {
+		/* 4k BGGR12, no hdr, 30fps */
+		.index		= 2,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp		= 12,
+		.vts		= 0x8f0,
+		.hts		= 0x814,
+		.exp		= 0x8f0 - 8,
+		.h_bin		= false,
+		.fps		= 30,
+		.reg_data	= os08a20_reglist_4k_12b,
+	}, {
+		/* sentinel */
+	}
+};
+
+/* keep in sync with os08a20_supported_modes */
+static const struct v4l2_area os08a20_sbggr10_sizes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+	}, {
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct v4l2_area os08a20_sbggr12_sizes[] = {
+	{
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes os08a20_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.sizes = os08a20_sbggr10_sizes,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.sizes = os08a20_sbggr12_sizes,
+	}, {
+		/* sentinel */
+	}
+};
+
 static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
 	{
 		.index		= 0,
@@ -228,6 +312,62 @@ static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
 	return 0;
 }
 
+static const char * const os08a20_hdr_modes[] = {
+	"NO HDR",		/* No HDR, single exposure */
+	"HDR Staggered",	/* Staggered HDR mode, 2 exposures on separate virtual channels */
+};
+
+static struct ox05b1s_reg os08a20_init_setting_hdr_en[] = {
+	{ 0x3661, BIT(0) }, /* CORE1[0] STG_HDR_ALIGN_EN */
+	{ 0x3821, BIT(5) }, /* FORMAT2[5] STG_HDR_EN */
+	{ 0x4813, BIT(3) }, /* MIPI_CTRL_13[3] */
+	{ 0x486e, BIT(2) }, /* MIPI_CTRL_6E[2] MIPI_VC_ENABLE */
+};
+
+static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = regmap_update_bits(sensor->regmap,
+					 os08a20_init_setting_hdr_en[i].addr,
+					 os08a20_init_setting_hdr_en[i].data,
+					 os08a20_init_setting_hdr_en[i].data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = regmap_update_bits(sensor->regmap,
+					 os08a20_init_setting_hdr_en[i].addr,
+					 os08a20_init_setting_hdr_en[i].data,
+					 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
+{
+	switch (hdr_mode) {
+	case 0:
+		return os08a20_disable_staggered_hdr(sensor);
+	case 1:
+		return os08a20_enable_staggered_hdr(sensor);
+	default:
+		return -EINVAL;
+	}
+}
+
 static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 {
 	return &container_of(ctrl->handler, struct ox05b1s,
@@ -270,6 +410,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		if (sensor->model->set_hdr_mode)
+			ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
+		else
+			ret = -EINVAL;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -332,6 +478,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
 					0, 0xFFFF, 1, 0x80);
 
+	if (sensor->model->hdr_modes)
+		ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
+							       sensor->model->hdr_modes_count - 1,
+								0, 0, sensor->model->hdr_modes);
+	else
+		ctrls->hdr_mode = NULL;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
@@ -648,7 +801,10 @@ static u8 ox05b1s_code2dt(const u32 code)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		return MIPI_CSI2_DT_RAW12;
 	default:
 		return MIPI_CSI2_DT_RAW10;
 	}
@@ -758,6 +914,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
 	}
 
 	switch (chip_id) {
+	case 0x530841:
+		camera_name = "os08a20";
+		break;
 	case 0x580542:
 		camera_name = "ox05b1s";
 		break;
@@ -900,6 +1059,24 @@ static void ox05b1s_remove(struct i2c_client *client)
 static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
 				 ox05b1s_runtime_resume, NULL);
 
+static const struct ox05b1s_plat_data os08a20_data = {
+	.name			= "os08a20",
+	.chip_id		= 0x530841,
+	.native_width		= 3872, /* 16 dummy + 3840 active pixels + 16 dummy */
+	.native_height		= 2192, /* 16 dummy + 2160 active lines + 16 dummy */
+	.active_top		= 16,
+	.active_left		= 16,
+	.active_width		= 3840,
+	.active_height		= 2160,
+	.supported_modes	= os08a20_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= os08a20_supported_codes,
+	.hdr_modes		= os08a20_hdr_modes,
+	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
+	.set_hdr_mode		= os08a20_set_hdr_mode,
+
+};
+
 static const struct ox05b1s_plat_data ox05b1s_data = {
 	.name			= "ox05b1s",
 	.chip_id		= 0x580542,
@@ -912,9 +1089,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
 	.supported_modes	= ox05b1s_supported_modes,
 	.default_mode_index	= 0,
 	.supported_codes	= ox05b1s_supported_codes,
+	.hdr_modes		= NULL,
+	.hdr_modes_count	= 0,
+	.set_hdr_mode		= NULL,
 };
 
 static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,os08a20",
+		.data = &os08a20_data,
+	},
 	{
 		.compatible = "ovti,ox05b1s",
 		.data = &ox05b1s_data,
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
index 1f3b822d4482..9cfc55f04a70 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -9,6 +9,102 @@
 
 #include "ox05b1s.h"
 
+/* Common register configuration for Omnivision OS08A20 raw camera */
+struct ox05b1s_reg os08a20_init_setting_common[] = {
+	{ 0x3605, 0x50 },
+	{ 0x3610, 0x39 },
+	{ 0x375e, 0x0b },
+	{ 0x5001, 0x42 },
+	{ 0x5005, 0x00 },
+	{ /* sentinel*/ },
+};
+
+/* Common register configuration for Omnivision OS08A20 10 bit */
+struct ox05b1s_reg os08a20_init_setting_10bit[] = {
+	{ 0x031e, 0x09 },
+	{ 0x3609, 0xb5 },
+	{ 0x3660, 0x43 },
+	{ 0x3706, 0x35 },
+	{ 0x370a, 0x00 },
+	{ 0x370b, 0x98 },
+	{ 0x3709, 0x49 },
+	{ /* sentinel*/ },
+};
+
+/* Common register configuration for Omnivision OS08A20 12 bit */
+struct ox05b1s_reg os08a20_init_setting_12bit[] = {
+	{ 0x031e, 0x0a },
+	{ 0x3609, 0xdb },
+	{ 0x3660, 0xd3 },
+	{ 0x3706, 0x6a },
+	{ 0x370a, 0x01 },
+	{ 0x370b, 0x30 },
+	{ 0x3709, 0x48 },
+	{ /* sentinel*/ },
+};
+
+/* Mode specific register configurations for Omnivision OS08A20 raw camera */
+
+/* OS08A20 3840 x 2160 @30fps BGGR10 no more HDR */
+struct ox05b1s_reg os08a20_init_setting_4k_10b[] = {
+	{ 0x3821, 0x04 }, /* mirror */
+	{ 0x4837, 0x10 }, /* PCLK PERIOD */
+	{ /* sentinel*/ },
+};
+
+/* OS08A20 3840 x 2160 @30fps BGGR12 */
+struct ox05b1s_reg os08a20_init_setting_4k_12b[] = {
+	{ 0x3821, 0x04 }, /* mirror */
+	{ 0x4837, 0x10 }, /* PCLK PERIOD */
+	{ /* sentinel*/ },
+};
+
+/* OS08A20 1920 x 1080 @60fps BGGR10 */
+struct ox05b1s_reg os08a20_init_setting_1080p_10b[] = {
+	{ 0x3814, 0x03 }, /* X INC ODD */
+	{ 0x3816, 0x03 }, /* Y INC ODD */
+	{ 0x3820, 0x01 }, /* vertical bining */
+	{ 0x3821, 0x05 }, /* mirror, horizontal bining */
+	{ 0x4837, 0x16 }, /* PCLK PERIOD */
+	{ /* sentinel*/ },
+};
+
+struct ox05b1s_reglist os08a20_reglist_4k_10b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_10bit
+	}, {
+		.regs = os08a20_init_setting_4k_10b
+	}, {
+		/* sentinel */
+	}
+};
+
+struct ox05b1s_reglist os08a20_reglist_4k_12b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_12bit
+	}, {
+		.regs = os08a20_init_setting_4k_12b
+	}, {
+		/* sentinel */
+	}
+};
+
+struct ox05b1s_reglist os08a20_reglist_1080p_10b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_10bit
+	}, {
+		.regs = os08a20_init_setting_1080p_10b
+	}, {
+		/* sentinel */
+	}
+};
+
 /*
  * Register configuration for Omnivision OX05B1S raw camera
  * 2592X1944_30FPS_FULL_RGBIr 2592 1944
-- 
2.25.1


