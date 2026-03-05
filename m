Return-Path: <linux-media+bounces-54563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJvxHFoIqWlW0QAAu9opvQ
	(envelope-from <linux-media+bounces-54563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:36:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C847B20AD95
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CACA308181F
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 04:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E942874FA;
	Thu,  5 Mar 2026 04:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ZVR3zgJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AD286A4;
	Thu,  5 Mar 2026 04:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685325; cv=fail; b=uyUohyAXls4mPV9mRVrEKmlo5y73gUYCFKQ+QOwZzWNBuC3kusA8tqWeTpwLK2Da8IwNQhC30EtI7h7q+F5iN/huD28wfxcM2ocIKKsvdauP/izGCxUVKe/ml2leluprFTtaAk/KTgPCrG7Xz9HZMZfMnxOai9Ydt2l6WXdB2pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685325; c=relaxed/simple;
	bh=FysxBulDvJWctJ4gnCRYJDJey7KW/Q+lag66+yNqODc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZfcgcpQ0RIDXsFCEjVxdptT0kIegtiXHV6LJbJi8tlAA490Tr7aMMx5DQbeA+yWMirm55ohlw3E5Spqp5O+i4dqfdTYWFIlI03EO3IcGViBCqw7QlAh2V1YWoLWE0LuktW6Y5ZvoYS6dkARbJD4KOJs3Jy2MH0EpXlQroVhoKs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ZVR3zgJ4; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251G5kB018028;
	Wed, 4 Mar 2026 20:34:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JS0l2cL9t0DJO6wXgLz73do8DMNeF55S3oCw+fnrXPw=; b=
	ZVR3zgJ4HYAsYTfoax7luZH1vK+no7ma9VKq8jPwEpbr7rfh0gd54wL6Ifoq0L3f
	YPljexK0XZ13RQjyagQfVljq7pim5krEb9KHvIyDVVOGY+TIoXv7q8CFYXZOVF9z
	JzE5x2gTQv2GHc9iasRu6VyaOqwKNi8671anUYKZ5eJIPSeGwU03QRJuqm9FhDya
	rimpdII4Wfn+nHgty+tkNebii8032s1oPhiKDDFSsdeuXb4skfPOd/7eCdJ+EiG5
	0qemLy97zITZ1VYtJh6RP+ixelxqxcRtgH9Ai7aPhp7QUhOzNgUvQG5t6/f35vbR
	nW3fuugg6Hykwb6V0sk6RQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh45nf6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 20:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syRz4PQPyvw088nFe+JeiCh1M5OtYVwg0ga2uJ4rLQZZxaNyHb8DOLZ14Spv/1cIfjy/NEujlgROVUM8gVX4wGPQ+Nv3hEXFfuJr9DHmvTg9aalalGzDzrEcqxpSRBN0p2kdDUfnQw+LAXjOpRaHijVhKxLE9azayVwoOeLrm4HcqSwKdgd3/LWgmiktdn8qKNp+SO0vF8UlzNpN6MjT+4/zjtUTZOeB4ZA7wFvYon0g0mpN97yuCVbNhcBxclcqoqAqh0kui4y6sLzgGjQhFmM5+nwHU4jjfKrxU2CmLkuS08irSSkXJIEuFbDWLefVSHAPqUmBADolscsOCezKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS0l2cL9t0DJO6wXgLz73do8DMNeF55S3oCw+fnrXPw=;
 b=XK9eqXFfjfB96wi4YOkol/XRpzbez7kcJ1uy6K1dW4l1aWW0wNZ0dQDkjhM779rB9Lun+X8qjGHcV7OLFNF0O+S2pE10t/vF525dAx6sv5nc4sWFUvteHivbOvT0DRAjT9xI7Tig4uBAd8AlG/OtdGzY9yUZFCPaZ19+7BQtizWx4NtDJvyB5RJ0FRlamGxqZed3aLCJjIx0OUFEIYAnSjakidtEqE7ssBKRQS1URFSxQpyEuFL7KAGBH4wwc/fN0ckJFrvm7kc/eP1g/+nGJZF6Q8aolcpEu63MZdMV1GbNWcjcXVTExbjklFi0l2NDc4e/C7D5DlwI4XHwuuVoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 04:34:17 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 04:34:17 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] media: i2c: ov9282: Convert to CCI register access helpers
Date: Thu,  5 Mar 2026 12:33:48 +0800
Message-ID: <20260305043350.2151936-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9daa62-7629-492e-5f32-08de7a707637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	0lRRJJKRxryfunWYSsF71JFULb/NoeRoKZaFbHBHS+YowopkmWbKomUG2PS1Q34rzVeunoSrlHXG/LYrZKJF1O6FEbmQ3W/0W4rCXq0zakRr0EvoScah/VJCkNmzZGe7gH58WdSBKWJmd8AcI7x0jdAYxsSGQcOOAlvAE48bPxjmU5dcWUQIUiYE/wxhEJ2IBn8MtG14fge2kMjtenWOtnlDYus/fG8em2RCEkW5gdCDF9u47Ctvd/j8FO1ofgKuHxKt8oy8TFDq0uxGHFiaBOuQlq1ETYxxPX72D4nW/xg96AxtENpIQuN3jvhv0fThLiCA+f2LpDKMFQv+gruJ3ZCDuG0kFKQ/RFleAWjl00mHJXaozqkE5Yl+3G9qTcUBDephYta2YKpLIZGmzur7JEgr2uZyBzSDjEteki72NzSs1ScedYuvmTwQ1VuMyrIyS1dtaSFcnBjopomht/MNu89+LRt8mIo3MHnN7t777KRioHUb48H+RDJwsrwGTXCVjdF4TwFSql8qEIClG5yzd8zonCVrKQmGcqQ4CuWe6TZm5vseNwLpxL2oqRYFwyMwhi3/q2XAYP/cakthmaounXS/5iwZWL2uqvmmrToUczXCFrufEcWDe5XS2lxKjUbadqp5e4aZKyhLHW2nziDm3R15uNnb6Ny9rgCjurXeDMET54CJ7eGvsTvOIHQGKdEw+XaI6K85dzzvcFW/J8X6JDO3yaERyjLlJtwlpKglxw24BrY5kXdyI4n159sDHGwV7NesA9zA7pgXUymglheY+slVrPC3kjCHevk81V38jjRE0WgkHsd8tGxTFUUsv5zS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K//1INKVYMFmKSV6dkwZ8Ox4Hnc0Y5jV7jCm9FmXmAD2Jh6NeQ89dIZZc0sM?=
 =?us-ascii?Q?69ChxmHQXHmL4vhAKEby45k492CzFt8hZSN5R7sAiQxKDb9MaVZSlPr/oS2v?=
 =?us-ascii?Q?YJYxUc5zXshiUrncKSIB71AdajTNDLXB4j5Um1355ByGbDLJPh5lDX/ajHzh?=
 =?us-ascii?Q?T+i9UDX+QRa0DN80miGQh4MQBg8/F5MfJfRwwwQz7Ys2M/pN/KcabRbsuIYT?=
 =?us-ascii?Q?7cH2pcY7CKFsWJ0nyGcgAVdWKrSXzT+CVhbkYlXda2adr04FzrjsA/Jwg26s?=
 =?us-ascii?Q?LXOGlXDf/sdwc0d03G7Mu61nhTrYQZQ//g9R5DTI1AibQJUejChiNs85l1G3?=
 =?us-ascii?Q?sLpgQvTCYKjVEs7/G7TsIoNWDNo85oNvrLXoY7PdieeyhPGtCIz9fI7sgg8f?=
 =?us-ascii?Q?diO7ZlVzIVISK8FwE3TIfBy1g5IkuWpPUolDzEBeLH87X8CV4vAPRFveOgU5?=
 =?us-ascii?Q?KPv05xasemKwy1sOQZ1/57TkK9R32OvIfIUFOpta8exY+N3JPl2v50ghzWPd?=
 =?us-ascii?Q?cu9wZHVHdjTr4YHbDhMh3HeewLOoQkSgibEW5kC5tsfCj2owLsxhcirN4qxJ?=
 =?us-ascii?Q?PxlgNedK92MPtKxUhSmLh8c6sDC/lbT4o7w6+a2EmntIXytXpvyWXXhm8Pwd?=
 =?us-ascii?Q?vkxlSSnHUmJPpsOgBSoYHQk2fFCYHdsmSf7ktZ9emDqVZodbXgOHeB7eHJMq?=
 =?us-ascii?Q?+uGD5PzdZK6rU65+wLGvMMSk5/AzgPlsUHACgcdwVcjyr2UoGuQ64a7Z2BwZ?=
 =?us-ascii?Q?H4mGSjCH1p+SE5t+ht0ZbFDPuyLkt9comrHpa0D7DfJlWQoeVZkOu5Atz1QC?=
 =?us-ascii?Q?7TMf7sqDllITYDHXMWbX8rEKM8QlnxXIlkzVm+JzVYaOKfysFvitM6VVQ3s3?=
 =?us-ascii?Q?3eyRcpVCU1Sz07bRC9FyefZxAncxH5uPndo2/0OoDYdpbyx5OVbnpJoY5Myh?=
 =?us-ascii?Q?cZ2ejmIafOYlU1/aBZ9QS6xbqJI0WQEiDwSkKM5D3jQyKWV9bUILKlO3fGw0?=
 =?us-ascii?Q?9I9sga3jg1gOvoa2iQUk6W0bRqkEmXakdKYU/LPz+z0VVYTct590twRIi4xX?=
 =?us-ascii?Q?vf1rxKcvwmVtEgi0DuddLD6A1O3mS6keJQ1PqmCRkoo2yoSw8UZuWVm9HJwD?=
 =?us-ascii?Q?53o71kz/kMaCqGfBxostIfZeTTu4+ksQ/T5rL2tgMbG2LOw9mtMfiKR6K7BJ?=
 =?us-ascii?Q?JCfhAxQkCdL4NVmm9GNdOc67Fte+9BtiUkba4sjRlLFhnX8Sqhazvy3GSScF?=
 =?us-ascii?Q?zvFz7VJsNd7lQDNX+NlhuXcpnTrgJ/a/vrMYENN/dIgnXb4cdkbhB+WXHAmI?=
 =?us-ascii?Q?YKWGxAwq02PrwpCXgu46g04ja1Jvl7PJ1iAXpDVDVfvn4oVB4OKymucr90pr?=
 =?us-ascii?Q?1QlQrqBB4nNsSbk5FKoXWSbXJnVZ47EOBJDc/oVc5MTrPccsRohPJDYxDXyG?=
 =?us-ascii?Q?5dHGpLSLWJOlOAmMuUeS/V2/sheFBsdrpUm1+0N/DEGwlB2xHlFB2ulnM4VF?=
 =?us-ascii?Q?8qVrs4BUfvEol1pUkGPWvjKhLQZB1xRqLxJhXLRzyxb1ptIzLJGSp4b+2K43?=
 =?us-ascii?Q?FfklvjKphH7yWXM5LCC9A6sWRAvvahCaEPbHzRBofdiErbk0XUOuvLbosX5w?=
 =?us-ascii?Q?YVMslUEZ1NcDVhCkipdSjohgxdcu8KTICj5X417ipwILYTD77FedCPJocsi7?=
 =?us-ascii?Q?/LorlPQLiCB2P7fcy9VSc61heLlxd7gcn9er4sQgVPWdxRzNi3ZZ05rmA6EV?=
 =?us-ascii?Q?G76CZwWMIcksvOObp5nVU4uW4vvQYLQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9daa62-7629-492e-5f32-08de7a707637
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 04:34:17.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0GbIcFj4DPNeOi0NEvtrgmk6e/h4+0K7cp8gVv4h/XMw+jWgcvfeM47e/ElyUJRZ5yWT/cMA6GXzX+EVNEub+zi53JN1xThk4yGePfG6jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
X-Proofpoint-ORIG-GUID: J5z65ouTF17J4c5IUJK-TT7H2643dsfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMiBTYWx0ZWRfX2sA67X7bTUn7
 OBZ6fJENT2ORJNJiMTk1TINjTutUMPygTJAetfoXqATdZodnS/TuBQepGCpvyyH1mYdNZOHR69H
 OLKVFKDQ6xdKX3v3VEbb6snF8CkknK1WYXi1k+9Rs8lhh0yW1Mf0iIRYpHmOObcUm8bADDPSOln
 WCOsKDQ7Q+UikTjMNAhjxCCw69SFxWZx+tKLnjd0fkc+plDCA8rrJkrqx0FBDNyTy8Ve40cYqC5
 YgyLZnTLM87Ny8BW0zjuSpNstRIkZYmWLJg/+7LQ1RAPWCCQx+T3eLmVLNudcI6KsTpyZlnZn7w
 tqUXiFUOLCbEDyI9YuHOxDeI9LQDxgfZ3RpirNqP+jnBHYXe5QBs2SFiicaji3pzIsIcTngRtku
 sEcdfdNIi+Lm2LdBAEm6pI2FMCwKqeOhydW0yvPttv9m7QmA9rJYFW+xYgVFlRWrpQni+ddFg9e
 6vqPNRKWG5TeaaCS5KQ==
X-Proofpoint-GUID: J5z65ouTF17J4c5IUJK-TT7H2643dsfV
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a907cb cx=c_pps
 a=zsOV+8tnETx+K6VwtxJO8A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=5nzG_WlsDGRH9K1yH5EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050032
X-Rspamd-Queue-Id: C847B20AD95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54563-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:dkim,windriver.com:email,windriver.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
 drivers/media/i2c/ov9282.c | 561 +++++++++++++------------------------
 2 files changed, 198 insertions(+), 364 deletions(-)

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
index ded9b2044ff8..56f854a4d04f 100644
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
+	const struct cci_reg_sequence *regs;
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
@@ -241,73 +235,68 @@ static const s64 link_freq[] = {
  * register arrays as some settings are written as part of ov9282_power_on,
  * and the reset will clear them.
  */
-static const struct ov9282_reg common_regs[] = {
-	{0x0302, 0x32},
-	{0x030e, 0x02},
-	{0x3001, 0x00},
+static const struct cci_reg_sequence common_regs[] = {
+	{CCI_REG8(0x0302), 0x32},
+	{CCI_REG8(0x030e), 0x02},
+	{CCI_REG8(0x3001), 0x00},
 	{OV9282_REG_OUTPUT_ENABLE4, 0x00},
 	{OV9282_REG_OUTPUT_ENABLE5, 0x00},
 	{OV9282_REG_OUTPUT_ENABLE6, OV9282_OUTPUT_ENABLE6_ILPWM},
-	{0x3011, 0x0a},
-	{0x3013, 0x18},
-	{0x301c, 0xf0},
-	{0x3022, 0x01},
-	{0x3030, 0x10},
-	{0x3039, 0x32},
-	{0x303a, 0x00},
+	{CCI_REG8(0x3011), 0x0a},
+	{CCI_REG8(0x3013), 0x18},
+	{CCI_REG8(0x301c), 0xf0},
+	{CCI_REG8(0x3022), 0x01},
+	{CCI_REG8(0x3030), 0x10},
+	{CCI_REG8(0x3039), 0x32},
+	{CCI_REG8(0x303a), 0x00},
 	{OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
-	{0x3505, 0x8c},
-	{0x3507, 0x03},
-	{0x3508, 0x00},
-	{0x3610, 0x80},
-	{0x3611, 0xa0},
-	{0x3620, 0x6e},
-	{0x3632, 0x56},
-	{0x3633, 0x78},
-	{0x3666, 0x00},
-	{0x366f, 0x5a},
-	{0x3680, 0x84},
-	{0x3712, 0x80},
-	{0x372d, 0x22},
-	{0x3731, 0x80},
-	{0x3732, 0x30},
-	{0x377d, 0x22},
-	{0x3788, 0x02},
-	{0x3789, 0xa4},
-	{0x378a, 0x00},
-	{0x378b, 0x4a},
-	{0x3799, 0x20},
-	{0x3881, 0x42},
-	{0x38a8, 0x02},
-	{0x38a9, 0x80},
-	{0x38b1, 0x00},
-	{0x38c4, 0x00},
-	{0x38c5, 0xc0},
-	{0x38c6, 0x04},
-	{0x38c7, 0x80},
-	{0x3920, 0xff},
-	{0x4010, 0x40},
-	{0x4043, 0x40},
-	{0x4307, 0x30},
-	{0x4317, 0x00},
-	{0x4501, 0x00},
-	{0x450a, 0x08},
-	{0x4601, 0x04},
-	{0x470f, 0x00},
-	{0x4f07, 0x00},
-	{0x5000, 0x9f},
-	{0x5001, 0x00},
-	{0x5e00, 0x00},
-	{0x5d00, 0x07},
-	{0x5d01, 0x00},
-	{0x0101, 0x01},
-	{0x1000, 0x03},
-	{0x5a08, 0x84},
-};
-
-static struct ov9282_reg_list common_regs_list = {
-	.num_of_regs = ARRAY_SIZE(common_regs),
-	.regs = common_regs,
+	{CCI_REG8(0x3505), 0x8c},
+	{CCI_REG8(0x3507), 0x03},
+	{CCI_REG8(0x3508), 0x00},
+	{CCI_REG8(0x3610), 0x80},
+	{CCI_REG8(0x3611), 0xa0},
+	{CCI_REG8(0x3620), 0x6e},
+	{CCI_REG8(0x3632), 0x56},
+	{CCI_REG8(0x3633), 0x78},
+	{CCI_REG8(0x3666), 0x00},
+	{CCI_REG8(0x366f), 0x5a},
+	{CCI_REG8(0x3680), 0x84},
+	{CCI_REG8(0x3712), 0x80},
+	{CCI_REG8(0x372d), 0x22},
+	{CCI_REG8(0x3731), 0x80},
+	{CCI_REG8(0x3732), 0x30},
+	{CCI_REG8(0x377d), 0x22},
+	{CCI_REG8(0x3788), 0x02},
+	{CCI_REG8(0x3789), 0xa4},
+	{CCI_REG8(0x378a), 0x00},
+	{CCI_REG8(0x378b), 0x4a},
+	{CCI_REG8(0x3799), 0x20},
+	{CCI_REG8(0x3881), 0x42},
+	{CCI_REG8(0x38a8), 0x02},
+	{CCI_REG8(0x38a9), 0x80},
+	{CCI_REG8(0x38b1), 0x00},
+	{CCI_REG8(0x38c4), 0x00},
+	{CCI_REG8(0x38c5), 0xc0},
+	{CCI_REG8(0x38c6), 0x04},
+	{CCI_REG8(0x38c7), 0x80},
+	{CCI_REG8(0x3920), 0xff},
+	{CCI_REG8(0x4010), 0x40},
+	{CCI_REG8(0x4043), 0x40},
+	{CCI_REG8(0x4307), 0x30},
+	{CCI_REG8(0x4317), 0x00},
+	{CCI_REG8(0x4501), 0x00},
+	{CCI_REG8(0x450a), 0x08},
+	{CCI_REG8(0x4601), 0x04},
+	{CCI_REG8(0x470f), 0x00},
+	{CCI_REG8(0x4f07), 0x00},
+	{CCI_REG8(0x5000), 0x9f},
+	{CCI_REG8(0x5001), 0x00},
+	{CCI_REG8(0x5e00), 0x00},
+	{CCI_REG8(0x5d00), 0x07},
+	{CCI_REG8(0x5d01), 0x00},
+	{CCI_REG8(0x0101), 0x01},
+	{CCI_REG8(0x1000), 0x03},
+	{CCI_REG8(0x5a08), 0x84},
 };
 
 #define MODE_1280_800		0
@@ -317,96 +306,96 @@ static struct ov9282_reg_list common_regs_list = {
 #define DEFAULT_MODE		MODE_1280_720
 
 /* Sensor mode registers */
-static const struct ov9282_reg mode_1280x800_regs[] = {
-	{0x3778, 0x00},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x05},
-	{0x3805, 0x0f},
-	{0x3806, 0x03},
-	{0x3807, 0x2f},
-	{0x3808, 0x05},
-	{0x3809, 0x00},
-	{0x380a, 0x03},
-	{0x380b, 0x20},
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
+static const struct cci_reg_sequence mode_1280x800_regs[] = {
+	{CCI_REG8(0x3778), 0x00},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x00},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x05},
+	{CCI_REG8(0x3805), 0x0f},
+	{CCI_REG8(0x3806), 0x03},
+	{CCI_REG8(0x3807), 0x2f},
+	{CCI_REG8(0x3808), 0x05},
+	{CCI_REG8(0x3809), 0x00},
+	{CCI_REG8(0x380a), 0x03},
+	{CCI_REG8(0x380b), 0x20},
+	{CCI_REG8(0x3810), 0x00},
+	{CCI_REG8(0x3811), 0x08},
+	{CCI_REG8(0x3812), 0x00},
+	{CCI_REG8(0x3813), 0x08},
+	{CCI_REG8(0x3814), 0x11},
+	{CCI_REG8(0x3815), 0x11},
 	{OV9282_REG_TIMING_FORMAT_1, 0x40},
 	{OV9282_REG_TIMING_FORMAT_2, 0x00},
-	{0x4003, 0x40},
-	{0x4008, 0x04},
-	{0x4009, 0x0b},
-	{0x400c, 0x00},
-	{0x400d, 0x07},
-	{0x4507, 0x00},
-	{0x4509, 0x00},
+	{CCI_REG8(0x4003), 0x40},
+	{CCI_REG8(0x4008), 0x04},
+	{CCI_REG8(0x4009), 0x0b},
+	{CCI_REG8(0x400c), 0x00},
+	{CCI_REG8(0x400d), 0x07},
+	{CCI_REG8(0x4507), 0x00},
+	{CCI_REG8(0x4509), 0x00},
 };
 
-static const struct ov9282_reg mode_1280x720_regs[] = {
-	{0x3778, 0x00},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x05},
-	{0x3805, 0x0f},
-	{0x3806, 0x02},
-	{0x3807, 0xdf},
-	{0x3808, 0x05},
-	{0x3809, 0x00},
-	{0x380a, 0x02},
-	{0x380b, 0xd0},
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
+static const struct cci_reg_sequence mode_1280x720_regs[] = {
+	{CCI_REG8(0x3778), 0x00},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x00},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x05},
+	{CCI_REG8(0x3805), 0x0f},
+	{CCI_REG8(0x3806), 0x02},
+	{CCI_REG8(0x3807), 0xdf},
+	{CCI_REG8(0x3808), 0x05},
+	{CCI_REG8(0x3809), 0x00},
+	{CCI_REG8(0x380a), 0x02},
+	{CCI_REG8(0x380b), 0xd0},
+	{CCI_REG8(0x3810), 0x00},
+	{CCI_REG8(0x3811), 0x08},
+	{CCI_REG8(0x3812), 0x00},
+	{CCI_REG8(0x3813), 0x08},
+	{CCI_REG8(0x3814), 0x11},
+	{CCI_REG8(0x3815), 0x11},
 	{OV9282_REG_TIMING_FORMAT_1, 0x3c},
 	{OV9282_REG_TIMING_FORMAT_2, 0x84},
-	{0x4003, 0x40},
-	{0x4008, 0x02},
-	{0x4009, 0x05},
-	{0x400c, 0x00},
-	{0x400d, 0x03},
-	{0x4507, 0x00},
-	{0x4509, 0x80},
+	{CCI_REG8(0x4003), 0x40},
+	{CCI_REG8(0x4008), 0x02},
+	{CCI_REG8(0x4009), 0x05},
+	{CCI_REG8(0x400c), 0x00},
+	{CCI_REG8(0x400d), 0x03},
+	{CCI_REG8(0x4507), 0x00},
+	{CCI_REG8(0x4509), 0x80},
 };
 
-static const struct ov9282_reg mode_640x400_regs[] = {
-	{0x3778, 0x10},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x05},
-	{0x3805, 0x0f},
-	{0x3806, 0x03},
-	{0x3807, 0x2f},
-	{0x3808, 0x02},
-	{0x3809, 0x80},
-	{0x380a, 0x01},
-	{0x380b, 0x90},
-	{0x3810, 0x00},
-	{0x3811, 0x04},
-	{0x3812, 0x00},
-	{0x3813, 0x04},
-	{0x3814, 0x31},
-	{0x3815, 0x22},
+static const struct cci_reg_sequence mode_640x400_regs[] = {
+	{CCI_REG8(0x3778), 0x10},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x00},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x05},
+	{CCI_REG8(0x3805), 0x0f},
+	{CCI_REG8(0x3806), 0x03},
+	{CCI_REG8(0x3807), 0x2f},
+	{CCI_REG8(0x3808), 0x02},
+	{CCI_REG8(0x3809), 0x80},
+	{CCI_REG8(0x380a), 0x01},
+	{CCI_REG8(0x380b), 0x90},
+	{CCI_REG8(0x3810), 0x00},
+	{CCI_REG8(0x3811), 0x04},
+	{CCI_REG8(0x3812), 0x00},
+	{CCI_REG8(0x3813), 0x04},
+	{CCI_REG8(0x3814), 0x31},
+	{CCI_REG8(0x3815), 0x22},
 	{OV9282_REG_TIMING_FORMAT_1, 0x60},
 	{OV9282_REG_TIMING_FORMAT_2, 0x01},
-	{0x4008, 0x02},
-	{0x4009, 0x05},
-	{0x400c, 0x00},
-	{0x400d, 0x03},
-	{0x4507, 0x03},
-	{0x4509, 0x80},
+	{CCI_REG8(0x4008), 0x02},
+	{CCI_REG8(0x4009), 0x05},
+	{CCI_REG8(0x400c), 0x00},
+	{CCI_REG8(0x400d), 0x03},
+	{CCI_REG8(0x4507), 0x03},
+	{CCI_REG8(0x4509), 0x80},
 };
 
 /* Supported sensor mode configurations */
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
+	const struct cci_reg_sequence bitdepth_regs[2][2] = {
 		{
 			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
@@ -1128,15 +955,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	int ret;
 
 	/* Write common registers */
-	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
-				common_regs_list.num_of_regs);
+	ret = cci_multi_reg_write(ov9282->regmap, common_regs,
+				  ARRAY_SIZE(common_regs), NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
 		return ret;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
-	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
+	ret = cci_multi_reg_write(ov9282->regmap,
+				  bitdepth_regs[bitdepth_index], 2, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
 		return ret;
@@ -1144,7 +972,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
-	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
+	ret = cci_multi_reg_write(ov9282->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
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


