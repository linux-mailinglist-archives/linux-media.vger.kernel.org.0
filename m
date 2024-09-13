Return-Path: <linux-media+bounces-18243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F99778C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 08:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED3B286DEA
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 06:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842161BA872;
	Fri, 13 Sep 2024 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i80neMvm"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915A154BFC;
	Fri, 13 Sep 2024 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208608; cv=fail; b=XLGNgWq6yvQqSuvMUBnMlSZhgeN0BITQMz71q22eK8GvGlCQSBqt1OPK5eb+oux987/khqwjg0EplOaf0d3db8I45LwwVGAR29uZFqQsnOc9YpL+rYMaZ1thXp3ioUngDehWTk/q0zzAHsIixQSwfODa677gsy2l5vq+kAuORS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208608; c=relaxed/simple;
	bh=cmVOrOaH7m5KrPgDaQFEBH3VGdyapZhflsLBP7uKJio=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NjVSnNBlxY0ye4noO8RUkfKu5mqq2fGPz4yiBxa2HeNnyWNISHG4ePrWg06816AZlqZO+p7MkwyMo07SoBi6whlc8UOUcvBxFX+CmFoGsv5lQkFUYssJxw2nMOcvGXhJ2P2TySjIG9q6RdZQLvkq3CPxbbpj0EkgxJ96Xran3qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i80neMvm; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrjbvA7jzfheHADSs02460LfqdTyx7WoP/7kJNSLUUyTu7aZ2S4JXKILo1BB7L0vSouNRaZp3lvf/YQvwq4ceAqDEKmEgw3zVuzTsB5oGFZCA91l2Eb0CZFIOMJMOtR5EAKvs3538nDrnT7QvXGXXVnplUJyI4HOOHNDE0rUtb95NZtb2fuBUIye1EhrjqkDJkd3qNaW6ab8i7Emody5jGU8p+0NA6IrAFfEdElxmI3oAKisB8ZdwwST6UOtar40jJ5rCkiZY8TnOA3ROYVojdM2nrbI7NMB/HpbFsu27yiHc4+2ZvVMJk13clUoQJv1MQ4Ay3ICe3S7mgg0QsNc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxXHXRF3GEQ+J4Ru/FpcKVYu2K5fm8t+NaQn9uhGukQ=;
 b=ZwsmcnAfEfehL39NbIFSaGvuibe/XPsntnjrnsg7ePD4v0WoewkaZcsHvsqFVClsl1YJ9/hvF+/VQrcJ0bNWn2wLgvfr9iZW6Map/KS4+NmQwKjY6btTolB0rvchaahIRfuxvh04d9KFXME9swBZY0pBtXXcRAVH+fqeESlpvNEo5+eyzUqoTvpYbH0aIXcQjJ2747ZDprmVl4yskP0ghMXvoKzZbs1U99C5D4gsuNTlHQrTiv4XXAHzYzUprJ8+xMNO3vZtt10EklDgbwevoVP6r8bZd5F2CBbYfnt9gjTNRxculQKz+3fipirKFQ86oy7sqXTYBT7ugKcYzs/PqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxXHXRF3GEQ+J4Ru/FpcKVYu2K5fm8t+NaQn9uhGukQ=;
 b=i80neMvmeGonBG5QSj/yAghbmJnDNwnkjfk4C1h93UVA/G0zPrIjjUIPhCzvkrfTPuafEA8IuBx9my51i0Gt575fxMyD/5q/jjTwDI0sD7GNBtvn8ovEMk9dyS1Z8yK2SRKDB6bBASXDUroqA0WfrspV7mTDfdc4lFjGq04wVvRkyF1IsdBiFImIkQzlQm9loz9EJPmgx062GDNdT3b0PkOgD21X6zghmZPJdOHUampeTFFPyHyOo+7+2BjLbq9c+2Gv0VJ5lNohIOCh+a2oz5W24sRN3VfoR21A746vV/V64EQSjHr1KDWykF5yBKkKQLlN3gdhB4yE9Qw0RPTDyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10856.eurprd04.prod.outlook.com (2603:10a6:800:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 06:23:23 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:23:23 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Ensure power suppliers be suspended before detach them
Date: Fri, 13 Sep 2024 15:22:54 +0900
Message-ID: <20240913062254.1886532-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10856:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ada7828-22ec-4b9b-1513-08dcd3bc91da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOba2f/+3v94XWKuzRxKR4Ob/ZAtQSuo2GjZ8K5KJmvDMb3CICBXuNZgFpKd?=
 =?us-ascii?Q?iypj9k137hN38zlv3ZgQHWTptjgGBMrn9BtGL9G2gsJyAKxYPFGcJzYdkphK?=
 =?us-ascii?Q?RiJx6lJdRjMqZAP0xcW72KmqP4+shXVRMjEpv0hdasxvK2+gA26XcaxlgO5e?=
 =?us-ascii?Q?R5bM5VHJR2w1wCBIfWZt7wj+Ooo0WncETsXKQ88xBzvXTyzIXdpEUNkYjM6l?=
 =?us-ascii?Q?nH0bK7IX8uQcIRJzPxa1OfDAKEqYAPlqIGC9a2txDVb29mxfHVGNsuHvL3Sj?=
 =?us-ascii?Q?G41R5gj2PUpl0ioKqy26tHnAvJwzMLYFr2o9RRudwcWlduJxDvs9tbi6AScs?=
 =?us-ascii?Q?vyGIHuweB8rGLq4KQHP5M0Yj8Bfo8OFBZ8rEeAkxOIKNS98RByYTAyDuMo00?=
 =?us-ascii?Q?sa3gIu2X/5/wYGvNUXdlgypMcI5Tn41MvJOCy9zb+zSCOi8Q25ZLhCiEcRbG?=
 =?us-ascii?Q?IqdyTdM1E7yJl4rsLg+mzqbVpv+FgnEuQIebvICSeZHOFFf1x/2S8z4CQWkT?=
 =?us-ascii?Q?l83rIpIxBBWI0N8+fd9VzOeFIldhWdNtDn7+lf1oFbfNNvDuvY4y7WZ2z4ru?=
 =?us-ascii?Q?1th8VCJ55rsGRJ+/Wk5uNBghaAXk1WO/7D4h2T1sT7Ru2Q+Cyy3gwZoqP/E/?=
 =?us-ascii?Q?f71DJ5MgBSGHLaKgqeIxajTdmG9R6pcoVQKxaHEF+3sDf1B8F3aZS+IavJW5?=
 =?us-ascii?Q?YWcBwrNKOY9amzMkybveB8ufzc/qXRzARUTANsmBUqfCaJUHT7VHKLTI1Pu5?=
 =?us-ascii?Q?BbDbfNX7xRCj8kUxnpmGY3h61SNqCwRVlOB3f82knyfIAKVNj0eo+1sCX5SS?=
 =?us-ascii?Q?72+jGEr6BWgnKPxn8m4ZpZbfbcdaFUGoYDxyDOzVOxbmXOcUUogwIsqRtuF6?=
 =?us-ascii?Q?2YHh+zkM2UmTfcugg+cyX0q1gq4MyeU1ufhpFnaQBROJVo0JvVcS4WvKEZTf?=
 =?us-ascii?Q?Dg8s85+K3UCzuf//wjbbOb1x8PIRAV+cikhMzboph5jgNyVQh2IvzJ3vkFVu?=
 =?us-ascii?Q?GZjZb5UGpo6kjlajbpND2LlhH+KhB0rEq0CimwA8rZVzF2gJANOgom/EvgZb?=
 =?us-ascii?Q?B8sVb0M90K7VkOjEEY96ZSE7Zo4WQOHZPoY1d1/NcGzPeQ/4gH4KnhaG76KC?=
 =?us-ascii?Q?FKLZh4YuJr+e8xYamLpQs6jeNNSMlZGU/pORTRuyJsYiiPAA0fhD4AxSuqka?=
 =?us-ascii?Q?6K/CUzRlfG4hAgZoLTHzqFaA9a7rC57kJ91e0DSQrndOrPqSV/LknG6Zl8BN?=
 =?us-ascii?Q?g2VnnQizUQzR8Fjm/VZ9SZ6n1k8gnfEJFedqE9bO4mEQHi8A8Ql48q/ZoovD?=
 =?us-ascii?Q?svp3Ytf5t8jJO50zBoRe2LuxuVJCkVBdJdjGwQ607GpQAkZDvAnypLZthM5l?=
 =?us-ascii?Q?hqpro9S3qYMRf6+YJTbkm2wqVw6HxD6FkEScX58EZKA0QlJsDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?quIWXIP4jEgf5R6PY2eryZiuOszjGYUbAJVylvZD71ko92kmtgUKtscPvb07?=
 =?us-ascii?Q?1kGG3BSFGQTv3gtCWmYgm3SwF8Cq6GHDobL43ElhXeAwTkHZtvzWJUVEC8pO?=
 =?us-ascii?Q?9zrNwDE1sQ5ihADf/ogyh6h6HW+Xh5By0e/jTjdNFZzEiPNJrK9Ux72Xt6RW?=
 =?us-ascii?Q?hpVWwOOQP1xb4xlWvO2XuhUiPvqpKKfYKQodIsU0rhgZ4zzFM1lEUKdD1DRi?=
 =?us-ascii?Q?DkkpJGDaPlXapTH7+36goTd+E+QzBq/hRE28k4S7izW7trTBF6e7ykGa9NdR?=
 =?us-ascii?Q?nsf7NwQtYCseCEABaPuCVo9Z3NIqxWQu9W4hkuir6Ez5A2ESLNkrb6mDbhr+?=
 =?us-ascii?Q?OG9Sc4GW2VMT6ywSf4vOF0PW0TmFgpehL4DFxXBZzSgjwVFf9Gz00Vi3DNd1?=
 =?us-ascii?Q?5NY/Ii/0sMmeXYNPjCH4c+2j8faAoVfrhkdQ1oSrxIa/HF9BgDMGI7KpRBCs?=
 =?us-ascii?Q?QHcg+yt8rY1z1UvdjfqcM19vmG1/Ab5R4g821qP8xIgo9YjfQU5a2BH1YWrF?=
 =?us-ascii?Q?e4/pRdCehWlomZkqM1S+hAaefezGBsRT2/QZU0oRwYzDd+wAdLCHl+S9ppMt?=
 =?us-ascii?Q?iB5kNWLKTcSS7QEWzCw1k46UeZ+aQ9WO6NQPsJlskZHvXzQYRLwPYtKNiVWa?=
 =?us-ascii?Q?NxlFt4vcQFAou9SkmNVlCagxcaVB8zYkdi6O1gbhsOLiRne09s1/U1/b6d+U?=
 =?us-ascii?Q?41DbaxkbeS5z5BUGwJSeFDMEzxLBkLYu8BSed1UMpAd2bdd50TgEJ9Vht/5F?=
 =?us-ascii?Q?oyyQyfideabxSksQ8NUJtio2MpPWMojkT1eJIaKBazM2pTZ2LgT8ZSeI/Mke?=
 =?us-ascii?Q?wsCB8j4p2ro5uNNLuF6ATtma6AKk9ABfl97Vzr28cs651r/LXPB0X0atzmGh?=
 =?us-ascii?Q?iPnVBlS4s60uNC84QvBAU97Ucpk+CWvHpFsrH7Xdmzamaljdx5Aa4iOS0fc2?=
 =?us-ascii?Q?OJjGfZfiYInfmVJwG8MWQl+ee4Juo7gUonpb1K/LbVdKv7+7barc2BYXk4mr?=
 =?us-ascii?Q?XHBHW1I0eFlzXgx8oomo5pFeavb/1cgYlIi5rN8RP5mnL1ND8bYE6CHgvjMn?=
 =?us-ascii?Q?oX5iu2GmPvBdWTX/TxrDyjeYNSULwsVfgd0Ogtr0U4S4QZM8LpE3Jxfug15r?=
 =?us-ascii?Q?ruSNgJ/GvjBKljE3UW5LtLRO9zVp+26Pa1R109CliVLVvAw5iGPIalUQNeM9?=
 =?us-ascii?Q?8r2sC18fmB2v7HXcpCqtz9Kg9VbB2W04AFw1Io3G3bw4gxKIdzeDOtldTpHf?=
 =?us-ascii?Q?XlYHoiMXoIfbjkaIyJ2U9LM9WCbH1zgGeEAcwFWYOmVv3efZ6Zkw8urxn6Ep?=
 =?us-ascii?Q?lTPdxS+Fgjw8WCoPJP9K1Q2+MNl3cLU8xdEsFPDfGNxufjVp7dKsz4l5hxvq?=
 =?us-ascii?Q?HUx29b1ZogssaMDfXrfnYQuehW8HusAX629aiKHbcWLwfnD/1NHdEIJwhwZI?=
 =?us-ascii?Q?i+DJ2xoLuaFACEGTPP+ikn0uXYl6Mi0yDmxKtvQ5UnZDYgkLt1N+1+zwloNt?=
 =?us-ascii?Q?c+FhuhRM0mlw2M47WMk56UawKlz7Aclj9DJOh3vQRTT5XHkCNLsH8Zi9moNe?=
 =?us-ascii?Q?u95fBpi5PkEVB/f0Tx/DJ0SLVSJSaO1dlVFW7GON?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ada7828-22ec-4b9b-1513-08dcd3bc91da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:23:23.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpCwINUc+G3NPjarmaigioX6r89LqTQKBUVv0vgjTaj/oWA8ZKCkj7KJ2fEI48R0ENBJjT9mC3QCkbxKx+qjrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10856

The power suppliers are always requested to suspend asynchronously,
dev_pm_domain_detach() requires the caller to ensure proper
synchronization of this function with power management callbacks.
otherwise the detach may led to kernel panic, like below:

[ 1457.107934] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000040
[ 1457.116777] Mem abort info:
[ 1457.119589]   ESR = 0x0000000096000004
[ 1457.123358]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 1457.128692]   SET = 0, FnV = 0
[ 1457.131764]   EA = 0, S1PTW = 0
[ 1457.134920]   FSC = 0x04: level 0 translation fault
[ 1457.139812] Data abort info:
[ 1457.142707]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[ 1457.148196]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[ 1457.153256]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ 1457.158563] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001138b6000
[ 1457.165000] [0000000000000040] pgd=0000000000000000, p4d=0000000000000000
[ 1457.171792] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[ 1457.178045] Modules linked in: v4l2_jpeg wave6_vpu_ctrl(-) [last unloaded: mxc_jpeg_encdec]
[ 1457.186383] CPU: 0 PID: 51938 Comm: kworker/0:3 Not tainted 6.6.36-gd23d64eea511 #66
[ 1457.194112] Hardware name: NXP i.MX95 19X19 board (DT)
[ 1457.199236] Workqueue: pm pm_runtime_work
[ 1457.203247] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 1457.210188] pc : genpd_runtime_suspend+0x20/0x290
[ 1457.214886] lr : __rpm_callback+0x48/0x1d8
[ 1457.218968] sp : ffff80008250bc50
[ 1457.222270] x29: ffff80008250bc50 x28: 0000000000000000 x27: 0000000000000000
[ 1457.229394] x26: 0000000000000000 x25: 0000000000000008 x24: 00000000000f4240
[ 1457.236518] x23: 0000000000000000 x22: ffff00008590f0e4 x21: 0000000000000008
[ 1457.243642] x20: ffff80008099c434 x19: ffff00008590f000 x18: ffffffffffffffff
[ 1457.250766] x17: 5300326563697665 x16: 645f676e696c6f6f x15: 63343a6d726f6674
[ 1457.257890] x14: 0000000000000004 x13: 00000000000003a4 x12: 0000000000000002
[ 1457.265014] x11: 0000000000000000 x10: 0000000000000a60 x9 : ffff80008250bbb0
[ 1457.272138] x8 : ffff000092937200 x7 : ffff0003fdf6af80 x6 : 0000000000000000
[ 1457.279262] x5 : 00000000410fd050 x4 : 0000000000200000 x3 : 0000000000000000
[ 1457.286386] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008590f000
[ 1457.293510] Call trace:
[ 1457.295946]  genpd_runtime_suspend+0x20/0x290
[ 1457.300296]  __rpm_callback+0x48/0x1d8
[ 1457.304038]  rpm_callback+0x6c/0x78
[ 1457.307515]  rpm_suspend+0x10c/0x570
[ 1457.311077]  pm_runtime_work+0xc4/0xc8
[ 1457.314813]  process_one_work+0x138/0x248
[ 1457.318816]  worker_thread+0x320/0x438
[ 1457.322552]  kthread+0x110/0x114
[ 1457.325767]  ret_from_fork+0x10/0x20

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@nxp.com>
Reviewed-by: TaoJiang <tao.jiang_2@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 979b03b112f8..1bf85c1cf964 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2679,6 +2679,8 @@ static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	int i;
 
 	for (i = 0; i < jpeg->num_domains; i++) {
+		if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
+			pm_runtime_force_suspend(jpeg->pd_dev[i]);
 		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
 			device_link_del(jpeg->pd_link[i]);
 		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
-- 
2.43.0-rc1


