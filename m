Return-Path: <linux-media+bounces-51396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BC1EYwsc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A577235A
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B66753043459
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADD4366559;
	Fri, 23 Jan 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F78Q8KnY"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08435FF62;
	Fri, 23 Jan 2026 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155595; cv=fail; b=QKm89/W8pp3XYaoN4V1dDoIVDZWgY8Yy7UG3UUMGm+uzBPqctLgV0XWSqbRfGyLDuD9KON08lHqEpaAp2t2zS0P0zw7uuvkUheLDLCTj66pT2/raQmktp9qoBpe6R7ZVj0RvAk6OMwZgdPr9YPhK2enx6Q9KE8Kr9de7AOWotcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155595; c=relaxed/simple;
	bh=8qcmiAXAfFhRzOcdzw6VYCAVs1GvnuvxRgWznf38Vog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yw8ns7AIQJ9HnpD7Rci5GzL6WSDboRVgLIi2KSbkvBD0F+FEeSI7cS9Xb/OHFlOalop5LDYvN4NGgQlnvXvms+6qYWdr2S4M823ooFrrT60a4kT38PCH+k09hGLVx8AwKUgzA+n7TSyTCdib8j+hPV4Sxb71G1dM5KWdnh3wZYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F78Q8KnY; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwygi4KSoExah3NQ5UDAXJOc0D98pjx1Zozsdji2dsUglj099kjb5GD8fCJxg5CqwSWRe1nRbICLECPhk8LS3aEJahTS+dk/ZOIP3Th4ZhINN7jx2YsZ8KSZ3+KVSSyIqWB5Yd/90FSFn5+dYrwAB0Zdx4DVfo7QJfGB5Xp+u1uCUs6ZNAeBWLyEPTM1Tic71gLgjCSut0su3FmkpOwtFeUOczHmBZx3/uducgjo3tIfdkBAYDS7JOK1C/pvIIDvUSLKlVJEgLRLwP8utR+d2sC3PJk9J+PhDJNmYU5nBm60OUGIcVFVjDGN08ThnostQ6iBiVdX3252shiHYafh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5qLtTr1raItO4ahuJoWddqFLI+ABdy8cAhkgnBCyg8=;
 b=Hk9KR6ehETM/fs9ukXktsq8gEgpySwNhQvBgY6iivBKIamE9OfpwnoO4PVMHpD8wM91/jr+7niNqkPLKy+OCdyZRBPh/RwHvd2I+G+QohRDjOwJmZTTOAJG7ohfBqY/x9qHyGluX01EmVGBXdUR2TT4d5kEUI0vxU9vquwJfc24TVbMzpHGK6gqD9XXdExJ2xF7MZau8i/ex5X8jtxThQ13TpVijfzikdE/7lvPV3jxVWUxgk/rJfYysHIzjcRPERyVZLdZCWr9n07tYj2Rz3ss2r9ZBcAMbo9uzcj5iAwT6FrmIsmNLEGwyrQlEE5nBMsEIGw9UTeYbd3e/178zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5qLtTr1raItO4ahuJoWddqFLI+ABdy8cAhkgnBCyg8=;
 b=F78Q8KnYOm5Z2doxJ8jelY/VCE6pZsTN9lkqz8TixXf3FI/YNi4dIq49AsWriW+r31Q/6C6/pWSnYABxYW3D7hgCLGsbdoQQx2xM78xKhz/5uuXe7+foH5SBcAJ9LRUJEI6MmwJMFjIT1GhCJffyfmL8WFeaQKycgR8L+tS8KbZmjHmVrahNPWy5Cp/0IDXQrDhbHR9IqMKrcmU9trzigLI1a0NpdG+dCU28bU8HiJBiC1ZECSeS40aBDt9Q05pWie30OI4yLtJNyU8Kl1S3zfoYGyPMtvC2D+3OCK9y8dEDs2O68N7s7ugSiByeof5+AKd4osZP4BBwzbZgcEmtgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:26 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:26 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 07/11] media: Add meta formats supported by NXP neoisp driver
Date: Fri, 23 Jan 2026 09:09:34 +0100
Message-ID: <20260123080938.3367348-8-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: a535eeb8-8426-4c0b-e17c-08de5a564e4c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?3uySMottksfffAKaWd50TYl5oD6FFTV83EnQJa/yvSEgL4QzAXLucspvtMkZ?=
 =?us-ascii?Q?oaDgG0QEhsK9DSdKx/eWT05183mOG9ynhRYh86M/rUMyENxXz/GPrRHRF24n?=
 =?us-ascii?Q?j8GRbkvqErH4RXg3rDooV05y3QjPwQd0lMEbVLgoOD6cS3ndp9QrGTvijKM5?=
 =?us-ascii?Q?LdQtLey4gyWSbQ1JGn3UxikOuIr5/1sMHDS3XbM+KZg6UClOnTP7T2gCXYHy?=
 =?us-ascii?Q?jr7rMcfcYayaC/F+SKe+qJ0B1fg8FY+S6qd3Q9gtgnB4MXr7KQsY5Yp2pcDb?=
 =?us-ascii?Q?o63LthcIqzf0/WrT7tAsHxWUEmrb2obdMVncnm+BYtYnuIeh8nkg+YoljSzc?=
 =?us-ascii?Q?nZbGKufW1bv7gvIP05CQV3Q7i8/OlKyTZG8WhjmjdEObHbZm8vhykbABx5If?=
 =?us-ascii?Q?PkjBEcsGtwtSP2yVw6L1u92zVz+CzsJJHKUURZGJgz6OPJg9IMVLyojTyb4M?=
 =?us-ascii?Q?HriTI7Lr0z+a06bKpGih+JDielKinM31XqJIfs/ZLPBXtDS6nZAipF4sNtCz?=
 =?us-ascii?Q?gnA17cW+ukSkLdTANb4lFWiTa2lZMLKoiFDlh5h31us+68uYJIdhFGxAmj0A?=
 =?us-ascii?Q?uXUDv4oG80K7Z6VpJrj8CPds3p7v/gH5SqW5FIi/fFHaK94f93bFsvn18DCl?=
 =?us-ascii?Q?jh7Mvmi9D1Wdng8tXvTEqUkaOy31Dmll+JQeWn4rcf8s0PQRhDXzBPxQt/qP?=
 =?us-ascii?Q?4h3+mgzUhPhF4sFF+z9Y2TKfWRouSBnGHgo/Ljua/yIEfhFUsjzWzrtoHUpd?=
 =?us-ascii?Q?sHr/1TLFG05D63J1uD0lR2K1JbKjrXMg6ETBeIwNpuGxnZEk1UgkJKD6fFnE?=
 =?us-ascii?Q?Nikd9kSAsAZpx7YyWG4QB89P2RWAxSfl7avucYFoUkz5W+x/Tw3VEXBebUMR?=
 =?us-ascii?Q?XwDqgqsOW1ZfKrOwfLj0xM9NdysM35sTFlUMlxRUMsv3X1BNZ2/YpD1U08iZ?=
 =?us-ascii?Q?Aa5Q9edD31gqRHUaO4oYrwHPy+wS2yk9hBv6EZbRVE6Pb0wTxNkT9LU1+YBb?=
 =?us-ascii?Q?laFmfH+vg+TdIK1ZeNQgC07SY1MpLBWCS9tRYeeQeq6kJxj+AF5nsvYLzWti?=
 =?us-ascii?Q?DEKPwMB2g1sgzq1QMw/BibK9zZ/4mPLTyKM/kyPKvUG6MqQ6HDogn1oeQOH+?=
 =?us-ascii?Q?4pKzn5Drah+Ie/wc1QIsKCPF7xx+nt+fgjMMW358rjHczbdAGIVVRNnfFKV5?=
 =?us-ascii?Q?f1eys9h67MVdynk8+G7CFhx540Kq0JmCFKWCZSnkRq1nssObJVC4Mpv5UpqA?=
 =?us-ascii?Q?3q+GWz2jXbIu5uRNr9jRffp0JlQXBl0jat7WwL86jIXgV90c/ZDC37vfzg5U?=
 =?us-ascii?Q?xFco3gFyuF4dnE6Le1BiRYRfErHiwl8xP5OY3qyjGO5SAPBq6ftOxq2TYTjC?=
 =?us-ascii?Q?q0xYKr2ikaVopwMRsY5Eofi8DuzKO1CMaYc6CwvfyRLRgrMlUleJgLZIeZi3?=
 =?us-ascii?Q?xiW9b1fthJ/cVLuiTvQ/lhBA6Z24O1WGjLWV/oj+geXVApCmj3+0rnrmUBii?=
 =?us-ascii?Q?h7hy9M08F6SATIh7f3RNXTYOWgJZnrc/vmHyMC8xaiblS8ShQodrdpRv/MqO?=
 =?us-ascii?Q?uAC8wP/sAufQcu/Q6sxXksYoziEyZKMkcI7te9zXK7dpmYoxkS9PhqzLlX0a?=
 =?us-ascii?Q?Kq7t6CP0mjhgH6LygjoZqh2eTW/giX6q/cQQqEqxAeks?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?twEhgGEp7f9YlkZ5oJYexSapuamMVnvpxX/9I+milwZzrFE2PtVrK9tc8D/d?=
 =?us-ascii?Q?jTo8B6tx+Y1kMzY1OKXq9jitDbgNdJl92pXZZMQWKWnV4Bjas7HXLJTCrOOu?=
 =?us-ascii?Q?MiMOZ8VAwd5OBWz7bt+UJtzVXXwGcvtm8H13NFYHNlikY6XACmRqFZqZP7ie?=
 =?us-ascii?Q?7YrMXngKyTHVyy+XXm+IkSleV4Vdo5o6ydNu0mAXG+T/XNi0nrzM6ZXllnt+?=
 =?us-ascii?Q?0X62xC0jI1YX86gW2WgW+bnP8abHu4vH41PDAIZgsLVamu4vU3YbpEByBQxr?=
 =?us-ascii?Q?xXJoc27Gpb96NLBscrxKSxeiYsCroLXKOaKD25I2LmV60V4EHh6CkQGaHPxv?=
 =?us-ascii?Q?NiaJ3lRyLRbjMx1TPKcBrhR9noAEcE6rBaayvCcbagmPjSI1fT5EYVa4hSos?=
 =?us-ascii?Q?kFeVbB/CIGaBB7E/w+nOx1K4lAwIm20n6fBeBlGmFuavoU2fqLny1/IiegK/?=
 =?us-ascii?Q?zLzeT7atqw3ixggHlMifDLhpp46PfMxS+oQY5d+fsiuYzqHbRxsBsBb0DEaW?=
 =?us-ascii?Q?Xc1bMD557nJlcTW2mUtIFlvu13E923jMirHC/HScUAUm4nlPQYiRTNupsV5e?=
 =?us-ascii?Q?gr0uOUOnzbb5dKZ5qZh0yJmUfeqRoDQ/9COBT782flMa9OzGPzdsHndkysLN?=
 =?us-ascii?Q?4InQGlrayd11twazVPrDih8RkslL0CWkwcP4vS8QPT50MDcA/QSCL9Q2V4uI?=
 =?us-ascii?Q?5tKIsAyWW1YUxz3eSJ4VZbllcR5WvII+hRysDxYC6JxXXEAUAj2srLXkgRu1?=
 =?us-ascii?Q?lKm2dfEYkbqKkPLw3KCijHbsa4XynyQoDOAUCfYnY2TF1D6pZdTfbOhTGjEP?=
 =?us-ascii?Q?SP3FRdC2xDT2Ib74l/p0khOrnU+I19gf6xTCtVWJhUddLb8D6G0TgXloQ8Db?=
 =?us-ascii?Q?F5Re1mdWZhr8vmDcWzrAZleujnwDs1UzLr01gQHrrTqsa2RrW40LQp3Wtryg?=
 =?us-ascii?Q?cWzDCY/RNvrQJfcBVwRKGXzeRssSXSTP6JQGz2d3u9ElkSVzjfaLHoZiii48?=
 =?us-ascii?Q?wsBOUDCnKrnBArlhO/wqaRT3T0VR6rY5IzZcSUjIn+9iY4BLJpHhyUzB1vk/?=
 =?us-ascii?Q?l8U1frcmmCBI8HF8Fxj+mBHfIOUZPXWldJ8mQP9F5rn9hf954rZUF0JdJacF?=
 =?us-ascii?Q?A/RGn7p4M4cvNAoU9ZGzs7jZbLg3SvTnmZ16FdctnKI38Nr6Szip1SHR7lTp?=
 =?us-ascii?Q?gDrsjwOu9eSlz7PNN25IVNDhTfdJITN2S8Pn2Zoc4z7xbEr25SKDg7r5bj2/?=
 =?us-ascii?Q?qzYHTMamndQlZceA+z7dNIUWR0I3QfwSUfoWhjPSuBlIMFp41WRrTTSjS6+L?=
 =?us-ascii?Q?m1oSjTWFjfInIyKOm+GIzd46GuLT3/ZS6d+o5SOQ5K268qkwRoX0IeupBbpa?=
 =?us-ascii?Q?j0IbWxH8zGL07t8nq7/UvccqVO7gSzq1oSNh26F0ON7KkANXSBVcONPdzdJl?=
 =?us-ascii?Q?F4A0NtAIueuPkC9MJ1drwStV1EAeBkg6lsqa0Hb6HnkvaJkmQ4X5LSgXLl8b?=
 =?us-ascii?Q?hCFca2hwfh+8hG9W0j6+zqAxo4Bt+y15pprlnX+QIw0TzXqIVQ9Gwmd8kvSt?=
 =?us-ascii?Q?mz9QHMSpex2o3qN+GlcZL/y1HLKA13YP0je0YZZElOQKSJv4mMb6OixFpB5H?=
 =?us-ascii?Q?bp+xfhEIbYfacaXqwr/RYTcTBt132dkQoJR9fWWawHvGM2pV5CRl9BQvs1dC?=
 =?us-ascii?Q?zW60zXggT1rGpYwF/r+lfW+uag/zMfuSDlpqX4EgNtqNH2EW2D8YKzBbmxmX?=
 =?us-ascii?Q?5eoJqBBBsw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a535eeb8-8426-4c0b-e17c-08de5a564e4c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:26.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxjdSR8P/ozXJXcc5p769GbzPPoU0PvXFAGIdsX27a/7Yr2o0klBZIr2Q2pAVML6iX8PGguv0cogi2q71NWiaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51396-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: B9A577235A
X-Rspamd-Action: no action

This patch adds new v4l2 meta formats definitions and descriptions used by
neoisp driver for the parameters and statistics buffers:
 - `V4L2_META_FMT_NEO_ISP_PARAMS` used for the legacy fixed-size
parameters buffer structure.
 - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
extensible parameters structure, supporting a non-fixed-size buffer and
changeable ISP configuration blocks.
 - `V4L2_META_FMT_NEO_ISP_STATS` used for the legacy fixed-size statistics
buffer structure.
 - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
extensible statistics structure, supporting a non-fixed-size buffer
and changeable ISP statistics blocks.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++++
 include/uapi/linux/videodev2.h       | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 37d33d4a363d..c797cf11be38 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_NEO_ISP_PARAMS:	descr = "NXP Neo ISP 3A Parameters"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:	descr = "NXP Neo ISP ext 3A Parameters"; break;
+	case V4L2_META_FMT_NEO_ISP_STATS:	descr = "NXP Neo ISP 3A Statistics"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_STATS:	descr = "NXP Neo ISP ext 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 848e86617d5c..5f4992452c66 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,12 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for NXP NEOISP sub-system */
+#define V4L2_META_FMT_NEO_ISP_PARAMS		v4l2_fourcc('N', 'N', 'I', 'P') /* NXP NEOISP Parameters */
+#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS	v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Ext Params */
+#define V4L2_META_FMT_NEO_ISP_STATS		v4l2_fourcc('N', 'N', 'I', 'S') /* NXP NEOISP Statistics */
+#define V4L2_META_FMT_NEO_ISP_EXT_STATS		v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Ext Stats */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.52.0


