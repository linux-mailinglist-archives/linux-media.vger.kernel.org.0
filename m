Return-Path: <linux-media+bounces-48817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FBCBEBBF
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 16:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BE75303B2E7
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE25335563;
	Mon, 15 Dec 2025 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="DTT0T+2e"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021139.outbound.protection.outlook.com [40.107.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB586331A7F;
	Mon, 15 Dec 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813193; cv=fail; b=UvTj3Ks7qD8swg6f79HBAwpHkmUvD4k6U9H/IUH2N/Wj+ihM4ULAqjYOaXF1pxgdm7qdPQuUDI3re6XSXLCHeXr55op2uP1c7bcsKbOZllReZ7q9e9YA7y9Q+tMwRrTlmHpHoFW1gnc2S+NczLdSmjuod+deRzwqPupciba/AIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813193; c=relaxed/simple;
	bh=gb0wcC2WyaF8MYqHTBHm+Os2Cmf0tv918Od+/7wcxYw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L3zy7ug8/mBH8YWzqfCW2UhRrFMweJoeclF1/dePoizO3XD4eQI3qrCVpLphNCb1V2HFcNrXPLPLjhAFJ54cH+m2oEW2SiOajsbLnfx5vOzulVR9wcnwMcK1TqmdBTsLDzXY53USsiWxhIateVsN4A/7KmtUIn2cJ+i5QBne7oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=DTT0T+2e; arc=fail smtp.client-ip=40.107.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+RVLE1wLVjPKFZhsdhbIh4Y4V3CFP40Plv9aLxqCjqlr8NfXXHbvppn5Q27J2gEXoLrDjao9M9hV2YmLYvYP3UggdoRtGAPgRPjMeWJ3PKCpzjSXJKDlBwmtJTSC5joqzT3bP3WVxQ7aJXf1MaJhJNWzkSURgMyJJHLW3TDohPgfqJtnqsnT9x/e2sm/bwCjCf4mEjsMvxtAmYIFu32VPKI+5++R9ce6lEZFr1Aqg3sz82TJyMpVLQt3PiFV+NoMkJHuDm1eo51XgtHpjFWV2SES1xAIpeLD73nHJKuBRLRxmOZsnLC9y3KkuFAAlT0zsU16zoAstEu+DKQfLS0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvK4JtJP3tmG66MyCgpM+6FlZvHtWHZ+jxLgnsrXQg0=;
 b=S8lHRwnELkS8onTvpFSEwN6GfLImO8teQqSlqvZB8JIGXHP9eERqi8aZqjDpKNJAoemJP1FjA/ROkIui13q/oWd843VbyTm6a96gha3MqHAD+IY+7UNVfaByu1NcXLcfLPfAFiZ+fuBFeFELxoAsDe+aSo8PZdP8QGwYgykw26M+GLS4Efo4CBIKouZqjJket+SNDqJh0oNSvvjya/HXj7Y8VDBNfthC6fueZCttwP69vzZsgE+/RpfUCg7vUhcWwfU72UTu1uJ0rFkPnpiVWVoxUk6GxAvEkjQ9dtYPpTqdOfa2O+KkkDBKGqglMhAtRf8bj32fXgDmY+BibpOsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvK4JtJP3tmG66MyCgpM+6FlZvHtWHZ+jxLgnsrXQg0=;
 b=DTT0T+2evHRC5XC/+kXfy49hsTFSlJMlZSMm+RHqd4AZKsoCLW65MgDEaMn5bHpsHEIadWYKAmJj6sbv5uuHlNzevbfJB0Aty6GB2YLGL9toaA/U6lp7aRO3zgQm6uKvhi7ql6J08zAUVeuTe5/zA6nL+rXCefs6v9Va1g7IfaRYCvteynb0rLSCJwMjLCracoHiDRkRJ6gh79Crys3TYoO//9RCzON5bNliH93yt3YURhSL7967/Ce0Y2wMiuuRinrrAunSoOaI6fqVORPPDH+H1LSbA4wuhrCB5DUomO+5wdL3QS4Pu6h2zVejq7ZS70U/gGdsd3/e79e+1pbt4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1192.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:39:47 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:39:47 +0000
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
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Mon, 15 Dec 2025 21:09:23 +0530
Message-Id: <20251215153932.46276-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::18) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1192:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b760ba-483f-4a5e-d4f1-08de3bf02d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SYpGDBfBbmhODli7o2h7vF77M31L6iX2M0/tfZ26dVguIDi+y/v3weFicj3o?=
 =?us-ascii?Q?C79h/m2FeNk4Oz7S7wjG3sGRMMfTMuIej1KmEkTOHxbK7Pm2ddHPq1L3NDXd?=
 =?us-ascii?Q?J9jLS1T3YIm+KKBptigi9uABJHrGDq0Ec6r7l1T1Av4f6JmptzynPYvB+mf2?=
 =?us-ascii?Q?50Fc4Oh3+mHBSE/29VrPcOEY1HLHrrq+34iIyxSRG6N4pPIZ8F8JHVO1yfri?=
 =?us-ascii?Q?dYYALnEUTekrxtAD0OfV+uwgL/zKIHnPi07k5blasAVjP+m0B2NtzfJUMdQp?=
 =?us-ascii?Q?lxNZSV5moaZDcFUPqJKAjCX6q0cnRlAJZJ3PGPVTvTJgRKW3aA2/IgSZaxA5?=
 =?us-ascii?Q?lPKtgEHSknj9C4sdHHWGSeQCk5LdibeMVa0cHqdEQTbdIfdU3U8ucULkpH3e?=
 =?us-ascii?Q?FZPoeKPvpCqrKiluj1tlrdX/4PE5lhBq6P+WuRPBbj2b7TrtRu/LJL4cUyUC?=
 =?us-ascii?Q?+Uib1wKcAluPXZACy/s0muFimma/dqV6Kr3SjfCsVJVsBaeJjF9nnTtAcS7C?=
 =?us-ascii?Q?vcco4zw59OVltxM+LyKqRc2JHiPoanFj5zwABdJO9FvrXuEUTCPIibR/VMoF?=
 =?us-ascii?Q?GtPGg8kr4Br+tLU4RUtuEc4bFE2NgAUJqDl6CaIOUi+ng8U1XAJipwlawhE6?=
 =?us-ascii?Q?IQBMN9pmQBXnBVK0bYU6Vqrl+MhMPO5XkNL4PyESlRoFhuIWA3y1hv+M+DZt?=
 =?us-ascii?Q?8Vyia981kcKPKDBtsBNumI9gHsogX3AsOPt4eb4imP23IvJGtwYFlXFruf7t?=
 =?us-ascii?Q?L1DpnJ2hzCoTF72iDhUlGuY6YuScLmlNDScGTh9cCuMKDD+NJwY+A5ZhcnwU?=
 =?us-ascii?Q?ty2VmRiRaDKtA4jnTdh+GQRv1bbK760jrY8KpRcFjIR6CI8+4UrHcLTLr74/?=
 =?us-ascii?Q?JUfg4Dyo1tuRE6G5HaSU1rTYhpX7SR2Y+KDnc/RtrMny5UbD/wqndYg1230i?=
 =?us-ascii?Q?w+kV0W81TCSWo0MxqpZLbGi5B1O2Gs13Tz6TyfbsN9tYwwqwzuANYzCdBIb4?=
 =?us-ascii?Q?H/nYmdC/jABLg6SOtOgTa5uZcMtnXD8PX3UGKpqP9swTsri01GMqA+xOiaPP?=
 =?us-ascii?Q?/+sbHQfkleNPSZdRaV2pvZi8aVKkNWCXTJWmizlpoXXiMhsBqvMiDGfMEvAx?=
 =?us-ascii?Q?2zNqVY62UTGWmwrxeEakH1DvlrZ0xM12ZHeYDkaqRygfaCzKufMgBjCXsma/?=
 =?us-ascii?Q?m24fb+P+F5lIJOLiZLmmn/EOHjYkPqxrmK6Rl5abb5NB6FBn+0vUn9rZ1y/e?=
 =?us-ascii?Q?yRfvryu7wVU/qiQRlHUliydCu04TIKno+4uVHY55a8rknUImdtBvuWmeOXmo?=
 =?us-ascii?Q?QEClkb+Jbdgq+UVUSrrf9F4juobRebEI1bNaE6wODvMkijhqfpe7vVO/Ms90?=
 =?us-ascii?Q?M/5E/BAQFPtRxejmjwoeiprdK9Q/WeOdg9CijtTfP/R8Wm8nghcPkAFrhpvG?=
 =?us-ascii?Q?8JWB3UcrvF6b1k+u9Rneqbx42i1RnKvnpLcMaZVYhNnOMVZb7o+NpY4IrKJI?=
 =?us-ascii?Q?H1nXpDyZ6N0t0AFcUP+5rwEZIvRaGAhiCYKf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bpxrp4xTzBSRQ0BxrTnLxe1Zn7POu+2iGvBI4vcH4niHlVO4oJeBlwvyMQ/5?=
 =?us-ascii?Q?0PgVKBzn175ZNCuKG5viiKZErcUX82lJr330Von5nLGNbgKP8fueUa3ztEX5?=
 =?us-ascii?Q?53pM6yFsQ19xIzfoI0qG41q+sZ7/z8PlZyM+V/9Kc6vamDZJx0NYKhQQh63M?=
 =?us-ascii?Q?or0GT5guLaphzlD9hd1Ppu+IrKH+iamGgXAbsWZmowGwopgF/0CCIjEYt0Qp?=
 =?us-ascii?Q?6L0cpKr8b/Of1CObcC9vOe6sbJS/CdBH4RVp9UJrOMy/4Z54sdQKe0RNfFgU?=
 =?us-ascii?Q?ZGWWplWHUmuXpmGf8lrx0rrvy8Ia5Yn8EN/UXMewH2j5Ufl90nqPJxCKAQc2?=
 =?us-ascii?Q?eh1/RnGGGrtLqy54CQkaci3Jg/JFF+WZP6gGc0B/caqs26Ah4+ebIV6VrZBT?=
 =?us-ascii?Q?1ffR75Bb+/azmUBMZyYELdbW7f8jF419/X+DT1dfbnpXputRo5Aj9PrH9WnP?=
 =?us-ascii?Q?Jjjfj/KXWJdrY9PbUjLQOpKYwQg7lr+hf0f7Chrrn94MsxJlybiSgJxGZEp7?=
 =?us-ascii?Q?2A2c0GqgyZLE9nd/c3TQYqe4M5yuTjsLSaBkwl/LFi83f8DAjsiMBseWWjmw?=
 =?us-ascii?Q?Dgz3x59uhuTUnO6FtqKwtk9XZR9fbQb9Kw4vLO5Deo5ZnE9rtCyvpibK1MGT?=
 =?us-ascii?Q?b8ODVuaYovn+T6YEBr5a8kEh3HCLknaUCBs7tL/gVKOPt+NH3ul4jcHsD1fC?=
 =?us-ascii?Q?cLC9CPKDz3gKulNcDLtcIeERet0/kVnSvjHLwk+W5J24MlT7AsMbsT7k4Fg4?=
 =?us-ascii?Q?/RTQjy3saOf/hgiwcykz1/XnFnaH4bBtwXA59toVNk0DN1A49adaHxrWpyuN?=
 =?us-ascii?Q?FZbOne9CdoMDKjtUuXREhNL0ENrqho+QdSsrPRUnvZbOy1nAkfjEGXIthIDX?=
 =?us-ascii?Q?Hll3HMrxtcEYssG2IPRlE00G63Y0d/dgsSVgrYwudS4+V7Lsh9HHRblxLXkq?=
 =?us-ascii?Q?pwT/Y2hvERAhA0h+G7WuQ1muSWpFEXKWaZI7RIH3nUtIxKGzI9YRog0kn/U1?=
 =?us-ascii?Q?pihGPScEAJmyUy6OUXlDxn/Q/0EjT94opxsJ28qZsMoPzrlj+1x8KvPVqwQL?=
 =?us-ascii?Q?SvnSvfAU6z+D+zU6lXnLXZ2JLf5WgzWVgMtrXkm+eduNkp03KBsWj/z/QcbU?=
 =?us-ascii?Q?phcHaGWw7pzSItxzUJSt6OgjAFNobTEqFup/tLB07x9YF7gnSk8ShTBd+b9P?=
 =?us-ascii?Q?cg9AA8ujh6PcHcBpYhT3Fk5aXBK2iumcROSV960w6zEzHDeoBoX5m4WoFFHJ?=
 =?us-ascii?Q?keevymBU88bwE6iQHWGDAoMzCtpbi/K61pwmJNOMgygIY7/E42hhJJdx6LNb?=
 =?us-ascii?Q?0k6dq55hEBniCpNnirjvlPUip4+UDqdqHc5cefjkOXQdVGvT13hN2WD/UqUe?=
 =?us-ascii?Q?CXSrZ8VirE0Mz5Ntb6hulQKJSagb0yCZZIDkH2of/plqbLQ63ouAE52um/IE?=
 =?us-ascii?Q?WL5eK55NNpA5zJmU7a4j8QKmEKzgAWe+nWiBuIaZl3mcG4BumUai2hVGkeGI?=
 =?us-ascii?Q?KD6XPQniQVE1yIKQz5q5+JJkcbTIxYACcLgDOWq2KFkbQcAWNtZMD4fROJTA?=
 =?us-ascii?Q?CCvLlRO6tuVwPIAj0pmDwvz6xMPf940uqoJA6MRwsJxTTGWG7w6TsEobgpGi?=
 =?us-ascii?Q?ftNi4xM2XslO+FvlhnrOT8o=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b760ba-483f-4a5e-d4f1-08de3bf02d82
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:39:47.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTtc2WzMHIGnxml6EyoUHTDTcUHTdWUZjihe+SZNCcxTNjJ+F4YoKisne76dGRlCsDOcgVPkz6YwtBwWNwEu49uoZl80mFf7ptfIh+Ve/aBSB7W7hElMJleC2Bhe/8l0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1192

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
 drivers/media/i2c/os05b10.c                   | 1111 +++++++++++++++++
 5 files changed, 1233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


