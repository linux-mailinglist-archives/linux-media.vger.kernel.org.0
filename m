Return-Path: <linux-media+bounces-27381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D6A4C684
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDAE61889E9A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE2B230BEB;
	Mon,  3 Mar 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J8H5cZbF"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA221B9C3;
	Mon,  3 Mar 2025 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018159; cv=fail; b=FxGyY98PKKkwR4wuKrdbP1fAk3zq/g8HTrC+7AchIV/a/4VRm73o8HHh7BT+ETn4M0TBzr2MSQ2FgKleOMNg8hPZcjxq6PVA9B3oi4EMFeFMXy/A3s68pxHWHe1AkBHTP7XpTc0v7sSCZw9gEskzy7qEu2DzNdHiDh6o2LdBS4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018159; c=relaxed/simple;
	bh=dv1MQquh3h7vOmZQ8Vy+CwQv9OvBYcFj4j8HkmC11Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VLxeSA1xTRriYn1LLFXtZF7+Doluaxlv/XXZhrlDAhM98Kab1iZnmVJzjZNuJNTbxVVIWTAAWvFwcczKI+BPkyBB9IjU9AcY6XTROf0ZBWG+vUYFXiA0UyN8+2WGa7uDSbodz1T4cX7cUQARUz4mu7yGwkSdL+JlvgO3vtwjWbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=J8H5cZbF; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zT17NDlomD078jOjZDcg8155nuRMAsxsNf8OC4Mz3IJ80aheyC24ckBi/3Ns4NzXOCzfzQ1Frbq9xHNwvyPIZHvdu0OyYYyWlgd+lthqAIvZti2sA2d2sBvUqMJCRehZv4H3ZkgCVE7G6cQl9jBg8wzXfGk3he7XOrgBE2Irxha1wFnsBj/GlRyk8yAU6XUy3+ZnOvZpzkYdi3A57bBjKH7JMqurq4dXpaiUwHnQnUtPEXqHuT0wa6fusI7GqTpuAGVs1ekWDbnFR/GB8spU74F7aYguD8yG5mouVF97ULufJOnEADwCapASJlUZr7VjvmAvntMW4PeqqusLjNckNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pXvlxIAop87uwPYDu1BaYZTR+MhD0FS255fuWo2KyU=;
 b=vMAb6zRIxgsZOSyyMrk8V+3lSNVYy6BSgQ86ozXHhfb8oDCWR/L4Q2IvW3SUTCfo0gjMk7DGovyK8j0/Fb4Z6sFV7d/5Kh76t+MxmX1avq8fPMWLa+J+xt3OpeTTKf2MUkrbZIrClnTC+VNKPmzyYHt+UAVp3vNHzDFzvSzCI7w0n9BA7ln6tXpS++6UbVbk7NUGMdrKoNQ901BAByPuRocuOFAYyzayYLGMTt0FpBGDrHasMRS/r/xZ/8KUEG2Mo/QtLOQITUAEs3l5eg8hMGclG9GeEkOSnwMtb6w78PAZgsRfZ83ajb4X8r4NvWqCQu/s0tB67QGcqJq6bI77iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pXvlxIAop87uwPYDu1BaYZTR+MhD0FS255fuWo2KyU=;
 b=J8H5cZbFpiNOfMjZbVzGKpRqNogt3AEaowUTatHlglHo3NpLQHiL05xerQAMs51iVwBRaJ0kr2OlrZ7UtJU3DpV0BXNodczWfy9ja60o+5mQDA3sC8SMRetcL+rdf7mal5hDeOkwOauiYmAQMlZPCkXa9s6QadMU1jA2MP9IXJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Mon,  3 Mar 2025 17:07:40 +0100
Message-ID: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 85645eb4-3260-4834-da61-08dd5a6dbc85
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T6qsktriIOsPWbkAr/1vz2rrInddgOGmZVd1ejw675Q94UUgQ6tKlKVqL/1m?=
 =?us-ascii?Q?Y0xx5voY8uOGKxwZzlaeLtr61UypAeYb8tpXJu3G9qd95u/T7eOR38u82Kgy?=
 =?us-ascii?Q?/6ArVZynWo92EkydoGSM7Gsg4ghZNxnpU/Mh2RCadY9UKcdq+YbfLoAxhuw4?=
 =?us-ascii?Q?VdxVyJhBZTOLrGTovFji9rSefw0cwiVB6O0yhmNNeESnH/XMtwdpmu8ZKt0J?=
 =?us-ascii?Q?4ooASg3yK1YJcU13UepQbA5mPrFT7qSyuxdMr4MDQIMVH+/qWw4ZuHLLC5XT?=
 =?us-ascii?Q?uZTHxJnHGQUzK+Hk0zdgyFd18wrZ0Sp4TwjRohikR6k5bRhPRjXqgwXmoz5/?=
 =?us-ascii?Q?5o0ivbTU7RtDKlr4VXaFGtV/TWMTRgdoOskgLOZuhR+GXTbMTtcrA9cktlfC?=
 =?us-ascii?Q?JCwM/wFcrgE+ByhKd1sMb3ABgoNWOkAm3oyNbTRYS8sglPX8zUz7hLqLxsfX?=
 =?us-ascii?Q?3n4Ii66Uf69N+PyXhwm6ZZETBYQpksPUMGtlB0SMC/5l99pRSisM3xY5pSR0?=
 =?us-ascii?Q?/0HF9A5T3WheZ1ou5XA6X/HWRFPNhqnlPzjgsRTm+fVSHqmCn8DUM/utVGLx?=
 =?us-ascii?Q?CjNC5wKCwcnyTJ1aFgEpYoBs3LMfRKBW7mXHynarvZZ+YFxZsGygySBj36/f?=
 =?us-ascii?Q?rdgHROG7DsS2a5E8vGL+m4CgO0zPqmG+KyYnxDq8YlHcAR3PAZI9Plhinoh/?=
 =?us-ascii?Q?fxFG3kgD/3ECZcuP0JwuAxQm6TW/pYzbH0/FjeACpCThSGSV2NEHTAmnBiof?=
 =?us-ascii?Q?H6gQz3K1Zda8iLgtVnux9qQA2SkB9bsDCwmz5ljXoWD6gkgi/h18CFYq0NnA?=
 =?us-ascii?Q?/dupFXPsUnitvE958DgMJFQwMa3A/dhve0/eIGQXMqmyndiL1LVUjLjEFyPO?=
 =?us-ascii?Q?xIBaWfwgYK356IuQIXeBHSMXrC3ot5yM+TAStcBtmDXL0Flm70PRihJ8pbB9?=
 =?us-ascii?Q?E81fkNHuyLuDJVHxSy3ja2ar3s5TJN/xB/RQqeF6A1XPECvJHhtrSHfmg0+F?=
 =?us-ascii?Q?pnJoxRcO7WZ3yP8jS5Dgblqc/lEiu7FpiWe+nYMr+O0+VTCYUNiOf0pLA8US?=
 =?us-ascii?Q?mVIJJU/STGAgbSX4fA7BVN8lpzpoZwStI1g2iz8ZCrSRl6KXqos+qkY9Ehyh?=
 =?us-ascii?Q?t7UlCDwztl0fbzVUTAGEtvhL4qLFGgucXwtiKkYZh2w+K2/fz3EL8a1Phd+O?=
 =?us-ascii?Q?B/3WdD3EoGJxJOWuLNnrvy30qywFhcAMlVllG/eptHUoQ9mkYJljz+2mQ1iI?=
 =?us-ascii?Q?CQCsDUXaEtJng1Q6Go+CPL9wlxEcsKAxk1CPRSNHkJSKVryUTlKcIgM2d5DE?=
 =?us-ascii?Q?BtXhwfmMfXOOigeupIWoA+UEHdxgLuebqNm2Aw+KZPxbrejpMGHr9aN16KA9?=
 =?us-ascii?Q?yYMXlv1qr6SLE8aFmm3jJWDJ6ZHhA1iw7FQe69sGtTgCFOGN7PONXtWtCyaN?=
 =?us-ascii?Q?IKAGHSSzjHe/xKu8QsNB7tzIVXIe0bKR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNYClKKMNmEE5CckOTQDFYN3XZCZ8Bvcw5LE2ACGe2aWja/A0CChYtG7Nypw?=
 =?us-ascii?Q?bf7xY7yGwCHtDCHmKBcuvFYuQbqlAOqC7fN9RpkiXOXggMfQan2SrJJnqcH4?=
 =?us-ascii?Q?UFvno7BN48l58n7IpmSaqGt+vG2wks4jmNvhYg7bGKWle6W+hokdJMVFuvp7?=
 =?us-ascii?Q?c6bxcBVo22f/mFce6Ei2n4pOroJlklbqE0mhamimE53IWjTZUolxooF9anVm?=
 =?us-ascii?Q?g0pogSrMghZtgRv81yOdi+ysqxz46DblVZ7bOj57VihYks18ZY8ayt3IsLpL?=
 =?us-ascii?Q?pvCn5CwlfYErzUpO93UUpK2g5s1wV13DMLnSlklWkYp9MYhqRVbve9QBJuCr?=
 =?us-ascii?Q?AuXAz6VOPMpORKTvVwGAuyZPYlgfGAAmHQ0vOp7ihv0fP264HXzRr10zreGi?=
 =?us-ascii?Q?PagOF71IqG4jGZeV/kfWUsrPnS9W4DRh5+nWSdA15ypqTNUdZCzrD6vDcfOH?=
 =?us-ascii?Q?gV1jRgEdo/Yz9R7B/psRrVhCPN7k3iJlh/OJeLGY3/mHvl7A5DCSWMPbaeqd?=
 =?us-ascii?Q?SSypgFYuIX96D3j7SqSnK6JI3E+NWkx4b7/KH2zvsSwhCFvYfeJb/RXG2Y9n?=
 =?us-ascii?Q?VUFMJ4eCFpioLRK1aAV9tG4BKw4we7RnPGXhydlst46hFy1sDlNowJxYvVAq?=
 =?us-ascii?Q?sxpTuowXD7ZKMD3N4zzO7kZl/oEQ6Fi7Dh2KoqEY1+xUMVC63HIO0D809DxQ?=
 =?us-ascii?Q?MNsi+w0oTxjr28aBiP/42r7w8xGSGx2JKSzP3sLtwuKhhHtliNk3B7JUeXC8?=
 =?us-ascii?Q?U2ZQ7a0qpWO4pgko4R2zxEMSOnkZ78h+QlN6OY6QE3ho9ARJ67Xg1xkiVaRG?=
 =?us-ascii?Q?eLak41+1tVmWe6pEpYHPkkWNqKIcdh/YN3J8YizqCHi0N7JWSPt4Q1xsmz/P?=
 =?us-ascii?Q?bzoZpojT5+gzybeNXt7YBtu5xrVpy3in0rtAjhyWqAbWHdAtgZxJ16N5UHAV?=
 =?us-ascii?Q?ZPDjW/d/m0Gh1MM1/8vqmSfz/Vl4vuNJ8kbLttEcjbEhrMv2pjUSbs7SRs2v?=
 =?us-ascii?Q?xGzt8GbNc/Wuk3SG8B01eFWBl3B5UZJrhHEKNTW/HFmVWWNq0hokrsnur0o8?=
 =?us-ascii?Q?QMGwhuPJqjkhGhwQhSZPP7g0vkSGMcpLFgxA4eW0cDFUcow5Gp+GXHTZv7gX?=
 =?us-ascii?Q?GUJrWiFyHPRrENe8v2FvXPEwW/EQGrjc3wAgf7xFlWiG25uhMmAAI5/TT494?=
 =?us-ascii?Q?u5NV4e0Nof/jgLff1YiI1jFFUXgsxeiHP9K9MXJFcKbwKPEol0bNlCNG5x2R?=
 =?us-ascii?Q?5Skf5mHlu+gCdMDoNliMkujeCXsz0BZVpPgvcGnleb9UgK8eqov4041j7eZo?=
 =?us-ascii?Q?g+RYS1VHYngU/j9acTNGkHpHw33kP1gv7lqJXMnLY64XVbSR8ZuZY992UPtp?=
 =?us-ascii?Q?jp3krRPXNJ4PA/jadwHex4KN9aa9E7fDaXTlRf9lmzXrnuMx+EdmtZ8l/sFh?=
 =?us-ascii?Q?T5j5LxAj+RroRB7BL8Nf5//YpU4IObZsa1zS1vxLxew3j9tr1sLie21JoZ0H?=
 =?us-ascii?Q?JI7gj29w0ng0mNroT/fhT/mxxdo2wYI+OG0WIT14Ufz6LwzD1jrEsyYd9K+G?=
 =?us-ascii?Q?dYYXDuQ38iGC4VeHpVUCLxucBlkFxGhzkl+11pyxylmdRpL1jxN4WzcTFFES?=
 =?us-ascii?Q?VYY2NstwDtSUQu+hI9jkuiY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85645eb4-3260-4834-da61-08dd5a6dbc85
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:11.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OZHE9OFX/ADW0f+GEZrNlkFlNCnfNlXUnF6DKrW6r48N9LbHAPNIACg9W4tA5jbguqFypOTrR4jKv796Y5meWI/NRMYHx+hyc+r85koEdX9QDX0rtVmbUIVxdD4Fio+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: c0eb65494e59 (tag: next-20250228, linux-next/master)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.14.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.14.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 8: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 6.14.0
        Capabil[  101.574758] csi-16000400.csi2: =================  START STATUS  =================
ities     : 0x00[  101.583166] csi-16000400.csi2: ==================  END STATUS  ==================
000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
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
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

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

Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
v4l2-compliance 1.26.1-5142, 64 [  125.542264] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  125.550585] ov5645 0-003c: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev1 open: OK
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
        Standard Controls: 12 Private Controls: 0

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

Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  139.054132] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  139.062922] cru-ip-16000000.video: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.14.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.14.0
Interface Info:
        ID               : 0x0300000f
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000008 (8)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000009   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x0100000a   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
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

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

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

Total for rzg2l_cru device /dev/v4l-subdev2: 59, Succeeded: 59, Failed: 0, Warnings: 0

Thanks & Regards,
Tommaso

Lad Prabhakar (12):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Use local variable for struct device in
    rzg2l_csi2_probe()
  media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
    rzg2l_cru_probe()
  media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
  media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
  media: rzg2l-cru: Add register mapping support
  media: rzg2l-cru: Pass resolution limits via OF data
  media: rzg2l-cru: Add image_conv offset to OF data
  media: rzg2l-cru: Add IRQ handler to OF data
  media: rzg2l-cru: Add function pointer to check if FIFO is empty
  media: rzg2l-cru: Add function pointer to configure CSI
  media: rzg2l-cru: Add support for RZ/G3E SoC

Tommaso Merciai (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
  media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
  media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
  media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

 .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 148 ++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 298 ++++++++++++++++--
 8 files changed, 749 insertions(+), 132 deletions(-)

-- 
2.43.0


