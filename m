Return-Path: <linux-media+bounces-29878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E91A83C38
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA0217B95A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415431E9B03;
	Thu, 10 Apr 2025 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fzkXIqmy"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0B13C695;
	Thu, 10 Apr 2025 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272822; cv=fail; b=LIdKbAKpD9JTJ8x0LnpRbfk2IrnExdtwoCo2dMnu6ZJcfc9f3z/knWkpyjrZG+nlQMJZLs5u/t2Xbs/jW9Ur4isidP57YLEqGf7CkP4vAE7Ss7IaMA/WPFJIswwwE8nZRddT8qUa0j+JIRW2on4iEzfYtGjqPE78fOQrBmiWd1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272822; c=relaxed/simple;
	bh=nyk7IqksPTgLOYfrySoJEcGoXEcNSaySnE9AdH/d9To=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X35Lo8AMGqhRdI3wNhIz4IB4M1AKR5yQ6WtZB+B9WDxN58+Gi9ZEWSKp9/BXiNqCCd6G2FxRi3Hj6rRjGhbDeNBvUntRJEEUO3QodwIJeaBYFUDpX74Ex1uX8BUXvGZIykbx+gzUca0I1Fr+AaUOVDUXDaJuiC+gz3t+92qKtQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fzkXIqmy; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7SoanE0BR0N6xTwinRdqgKVHS21j0GWY/d61qZvfARcxDw07MHn76n1w849tuoJ3nba4Zzt0B8+uP+OnmsGFgOkpw5oYStIhleOLr6em0yoiydjX8/WlpNPKtH0E6T4BeioechZNKzrHkwSSU8k1aDXIUyK1Qy470N2H3cO8A6U7fS1YixjwROb1q2BmyjcVBwVSVhH4t2jvOkhur4PWN3aFWgzqjJWh6cpejcV75VlGjRVzgyo1FROT07A8Xw1mdjTQ8FJdCbwf7dJKJMJeEuMQfrIvx5gJBhUY1YXNzqpBawbA1VPON0pHJyF6CHHb7kD7zNNOk0vS+OMypc1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fms1+4lM4sxnjonel7ziIMODD0mdWgTnC0TLgWtqkWo=;
 b=j/zgOVXImg1dV0+udJYF6P65bZqKNLbpQNY/uZ+nCqoPp0yqfOVLw21CVUSUuZXZOtrseIW7Ypom6kHNaMU5xEQaozz4DEmTOL6fVgZrKIKAYH/+ogWtNAlj3p8LMCSzAVDQfkyZnhgSn7H9dYEzBltk8rRioYOQuU+oRJsQVET9ajtv65ceMAmm/MamCHqP/9l8kr0Wlp/yU83jyjMio+D8Iirh5XXNtjHJmI2d30OPgPOSzeN5CKlcHbJEt0n2amd7J3v517WLR5oCRW0vzQYQzaqCL9UUO5YEZcbp3anh+KhU8iOP/KapQunyW3udyDPPwhE/zT50xVOGHSqUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fms1+4lM4sxnjonel7ziIMODD0mdWgTnC0TLgWtqkWo=;
 b=fzkXIqmyY2jKbrpzfCMa+7DL6B4OhQ772Ml9NzoX3a+ec+tYlWjL8K+cc4wZK3ttpErJliMhkalTwxiH/RjAXhFGZgFd9P+gRLtI5hnUyf8nPvEoCQYdBiyFbTK3NbyXXpSlAzUlSHov+fCDNuIwJ4YCYmra1Cv/vQ9T3qW9G/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:13:29 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:13:29 +0000
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
Subject: [PATCH v6 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Thu, 10 Apr 2025 10:12:04 +0200
Message-ID: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: ea89a1df-6987-40c5-a3ec-08dd780793af
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qeHfqvhqmjqyuNHmut7GrKDGh05l2fn/04+HtJi87M900xLLFMlh07dJcA5h?=
 =?us-ascii?Q?9i1EC74EnDaoyqE3eh/O9f538t5oei8GX/zSnbHiZgoEhSTGIdgcYLYSNb1p?=
 =?us-ascii?Q?RnR4CPDubnCmrDKwxXjIsA0nE21maGnpGejanKrvlA6BWhQlO4pajb0GcWdO?=
 =?us-ascii?Q?zVuJYsis47hRYZ/2LzsHn1WoAjBuq6PgNuPxh36zsJNfDLUu01Wq28ke/SvN?=
 =?us-ascii?Q?vv8OIiuXTOfu0Cx0EqAsWzn27MWxdBxB/hsAeG7qijU22rvoYGgDdIezGpyQ?=
 =?us-ascii?Q?jeQIoTtDqKljsaFwlnFqISqI5FVrfRgYNtFOaQ/xWUPLoe3WxysDunJqXCvs?=
 =?us-ascii?Q?698i2ozYNKzKgMDzXG5Yg5AHw9K3xNU0cYdY0fEpGN8h8wc9cwkZSgm1puo5?=
 =?us-ascii?Q?6jNiMPuWgTdd9xT7oaHk7W7DQsZBW0tAIyPRUUrnr9YDbssE7YgtASo9sjYs?=
 =?us-ascii?Q?H+s1CDvZru0I50c5j+PIXM+fZ9JO2b5JJyEH3wMednEMEyvr8MUlFsHMVouX?=
 =?us-ascii?Q?VrY0j6LZllYiBMNBQ/iyRLUrGnAlgfQppa0eyo+7dNUAxe356sVs70PB0a9q?=
 =?us-ascii?Q?rML129ufb31wmYOR/Yim0kcgBUvq2rRHIxtJx8xQagw+Fk2IA99JFjuDpHMM?=
 =?us-ascii?Q?VKjwxx2JKGmDQSRjNBOVwVYydh33K1kHW3WsLplOsXD5tSflo/cFSVtvxEZ8?=
 =?us-ascii?Q?37b9KARTBWWyxrJfLDCycslREJaYrYeRZtjCrBbj0WSsYpUKE6lVYbUNWhdd?=
 =?us-ascii?Q?rt2AiZu+w4k/qZHRkc0RMZeu0qgJT/pgZx+XkUCknZx7tSQGtjMgQvPGlrAI?=
 =?us-ascii?Q?4wpmCyR5uYCxDS6L4jXMSPiaVAu0axtAW6rsUpgC7mKxsWBW64oEMk6uedKA?=
 =?us-ascii?Q?J4B1FcqhilnC4oS+HhcAuUIOblGAncOxLQQJd7zyZWwXo9ZHPecAuaFsXqOG?=
 =?us-ascii?Q?5r/VDkIhd2Y5QoFQjD9lGjUMgVyaT6fSO2mMFsRxt0JHDVRdZH0laAAXzZ0U?=
 =?us-ascii?Q?4k6mJkzAZFRXGLWc3H3O38EsbwNDtn9mfSM6xIFtBjRNhGFBUzt+HtxrmkzT?=
 =?us-ascii?Q?ilUVxDEKS9NxMU4GILOCtSah+wGfqfMuOncs2s4JYhPjfIBVcaQm7HqUAZUH?=
 =?us-ascii?Q?cEEsoTuCykF22Uku3jJgG6bjUdFOn+ih2lfFrmH7+EHSuAeA/V9PoAK2FCD+?=
 =?us-ascii?Q?gaH8Wm7dYW5lLv42cKA//y0k7v/CLCD2en1GkJPGzDYy467y+jM8d15aJNIF?=
 =?us-ascii?Q?MVcVYgPTd3zqkz3OpADzCWy/8ZTNevdnBPZANFdy08l+Th5VGXdLe4tBpktI?=
 =?us-ascii?Q?yDJn3TxFpK12RlqDtoya+RmIT1rQqveGtWSPmYNO+rn32USAQMQMP3Kr5CVT?=
 =?us-ascii?Q?MGFRaackTlwwugxr7Ch2aMiLHhZaa6XJ9QF55MSsjwl/lleKzFDqNVePuRpQ?=
 =?us-ascii?Q?6GTuL5Thsq7uKwU+SJxQ6gxYo/+S+QKaCO7RxGaQrfw/zcSMD0cmuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?At9VVrQSeA7AqEFpNj3YgZq4QJid5FFA9o63lZiAnJLeME/t/sENE1amZ6NH?=
 =?us-ascii?Q?ucw8adZNkE58fmTOrE3Q4f8RJ/0G+e+nG1xEpF9McbCcHJ6tqE1P7auX9cpI?=
 =?us-ascii?Q?bc9AqxvgqaGlghklwyuWuE68IHOKW6RkSTzwxHNxzSnJec5ZmGXqSFN298Mv?=
 =?us-ascii?Q?30t3UZ/7ycz0ZenuCRtQr45SAUmgK5u/15NOwhc37JyfiLqHGvs0JsjpPN3M?=
 =?us-ascii?Q?DgGP05UMeHn2isX5z69TjcaDK7Rm8qjl5Uz+1RIO1Bo+sToz7PfcNODgXYYB?=
 =?us-ascii?Q?KQJ2rFqQ/Iq9rxzY9wqnTCGoA/SpFilZxlWXKcrNlx4jrbfYrRUQyNMolG4r?=
 =?us-ascii?Q?Bj7NX/5sEm03fI46lN/LVxCYfjVZaU1vX70X/UABW6ob/zcEBl9i/r1wB9mM?=
 =?us-ascii?Q?QgJOcU3ft0ySVi3aUJDhp8HRDxnlvGeRCa7bZ5uUhoxBs89g2POwNP23t107?=
 =?us-ascii?Q?CDZFr2uHqyhcRnrel8YrDInePRJa1QWsuUnlqXjd/vpLOGlJpHIiM/VZylEO?=
 =?us-ascii?Q?GrFDsoO580ov2BdB1kcipDhNIrC5LcGFCajU8ZB6nfoL07Qx6T0lio11qH9V?=
 =?us-ascii?Q?Ecb5FmbpR/o1MSE3EjIgf0gQxKWviLhIaW8aBzxRytE6FVcIIstT+VnSBCea?=
 =?us-ascii?Q?rxQLIW+AcYNnGqMb2ylSuEHltZXbLfsEbkJZN74ptXvb66uSGKVEL0WLph6A?=
 =?us-ascii?Q?UQZ8Y+QEGdMO+c1XooWeEaepHgMjeAtFaViIxChnqRbrqSJdC7uOo+yXveFD?=
 =?us-ascii?Q?0ztExqbJ+qHqdCw+q0aLh8oF9Qpmygo9xar5TfacE1aLqEUufvhH6Orb4N09?=
 =?us-ascii?Q?sQipvNESbBfm2wQ/CyIGXa0XSGdPfWQ4nb32OCQ+cPN5weXJZQEwh3drOvP2?=
 =?us-ascii?Q?qMY/l8jygSu+WokFL/mqk3tY+pWIw99ZZTtd9Sk+21fT4tBuZRKE2ckAq2JW?=
 =?us-ascii?Q?MRMHr3Y/hee2n5oMpqhHCnF1Um5rFvdeKel1UNhLlmnE6FQ5WI+DxZrDYK/t?=
 =?us-ascii?Q?oxmVSb0HQR9YnknGpFwmu5J4v+nCj4ndrA0WHCY7PVSEL+2LrFrYvpT/3iqu?=
 =?us-ascii?Q?EhQw10Zw+ER7VBBG6IjSc+1uBnu9Qtdw/U2rK8LERxIjLi2jwcMU2ct8UbZT?=
 =?us-ascii?Q?/aBFrmDvx2Q3W9F5qmWKwpYxMrizuBtwILZBHjRAMPcnWUllw0iCbEFovLER?=
 =?us-ascii?Q?mbo6Z1d1l1CyQLDa7tjKVNAEP7UWLecmUTuxnGELZZctMXp+giGHa8bheJ44?=
 =?us-ascii?Q?iENncKPqtvc5rhWOqTTOj2wRtcC0YisiCe6P0o6YEB/imEtZGKVxTndy6wYH?=
 =?us-ascii?Q?iXV0T7h+prjx6HUBZI7V9vncnYV2+p4MGHhQW9epAWxICdgEQvPtU9gUn8Hs?=
 =?us-ascii?Q?aq5hYIdIYPY/xifJWXdy3saa3zNzDBEcX+P6LJFhh+7eaG4u8RsQUNxhDLPv?=
 =?us-ascii?Q?Mrcsmm6iXpIR2ymkV5j4GWDUFB4kD1sHUmWz3WmbQZvc68OIXQtd414aIp4v?=
 =?us-ascii?Q?tcpmdjTTbB06KTyUpvmaYeZdySpu9H1dXDBYxX7ja9mhWWYuwy4JVMDal5gH?=
 =?us-ascii?Q?Za/UDbiNEu5T+iXGPtslSPWoOFQEFRSvSbr0UQm9+5NhbdUZKNoTCC8Ifr5p?=
 =?us-ascii?Q?xACnE71PxIKIFmrIZaDZHkI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea89a1df-6987-40c5-a3ec-08dd780793af
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:13:29.6124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d3+qskJzGrGIHA88vs1+tPWzpVoGYHNblh/N/I3F3aYbR7uJfijEo510wjdtl07WokRMMmZcp62SsLKJIoKYUzy0Aqxwuw3u404+6ik94b1RgzBWm4M385vTY7jKC/G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: 7702d0130dc00 (tag: next-20250408)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.15.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.15.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 7: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev2
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb
                 crop:(0,0)/1280x960]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

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
        Driver version   : 6.15.0
        Capabilities     : 0x00[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
000000

Requir[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
ed ioctls:
        tes[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
t VIDIOC_SUDBEV_[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
QUERYCAP: OK
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
v4l2-compliance 1.26.1-5142, 64 [  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
e_t
v4l2-compli[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
ance SHA: 4aee01[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.15.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.15.0
Interface Info:
        ID               : 0x0300000d
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000004 (4)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000005   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x01000006   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
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

Total for rzg2l_cru device /dev/v4l-subdev1: 59, Succeeded: 59, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  602.158977] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  602.158977] ov5645 0-003c: =================  START STATUS  =================
e_t
v4l2-compli[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
ance SHA: 4aee01[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00000000

Required ioctls:
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

Total for device /dev/v4l-subdev2: 44, Succeeded: 44, Failed: 0, Warnings: 0

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
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 142 ++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 295 ++++++++++++++++--
 8 files changed, 740 insertions(+), 132 deletions(-)

-- 
2.43.0


