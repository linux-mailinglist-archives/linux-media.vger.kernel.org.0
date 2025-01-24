Return-Path: <linux-media+bounces-25231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C65A1ADC7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4E83A2DEC
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 00:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953EC23A0;
	Fri, 24 Jan 2025 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z3+nIdVP"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D45223;
	Fri, 24 Jan 2025 00:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677606; cv=fail; b=i8mQ9AzAXb3XB1QPZt1yTYjAozhjuw6C8IwMVudXIvb37v5J9+rogFGnyCfNQOX1U/o469ypZ3EUXEQlD2SrdBxIooGNqq0HE7jcMiGM29vKJjFKOCipr5V/+MdmDqBofPdRJPoQFgHGyb/F906jgagE8Igea/rDkzr7kaxronw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677606; c=relaxed/simple;
	bh=on/2mCqC8oKnr+p3TGP94C4T3niy4geB2ADLp1N09AA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F+uIw0VsHyc6KSjAz8MZ7gy5djqqSX4HIV4aPgTcPGxMbDKGGA431V4v7RFQAloidoGrQa8sYyKrbsTQ4Sfi1Ngf/tIXisSb1a7SCDG1rP2wZpo4OyHmx4XsyrjRypA6Tt8GtvxzIlFFiOMTBpe+hUm+QHLPB1ukSiNwX0s4nXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z3+nIdVP; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tq5kzSDImH+WLeiXGJFBnDicYa1FJ5aaMPsm2VqNrZqyrD0Ds++oKJxpIzqAxc5toJZ00bG0K6oZ1F5LX7FvYpjCj977ZTKuICIgRChU/6bn8XMRSeBMzkM5a4L+K5DyFCdOywtE0ouXzMOkXboIF5L4SWAd6adZeMosfCbZoVrRmS0P3Nse7oIYrGl59XS/4njx0MjeYy50IEPg+Ke7yY3qIhCSs+bIjmDWDLFiDD6/BEQmDx2K4rOW6J4iSDyLSm8/26rX9pD2X5i+0QF68y6TUKYaJs3Patih12N+WjgC5lEieTuf7jYvSZPPHcFgVEkEYF5AncsTUv1cSFkRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjxhC3kbvkPK7Lm9tYSsoAUwMVp7Xg20WtqgB4P0DVo=;
 b=gUc16Y8b3H4f8oOaLy9wssgOkr7AxBh4W2M1ZaqvPUBIMaCFMDvMdQ5+nhkRge7Kdz4rpIyDKtTfilDSHX0IN44pnMNp7O9NIZ77KuJceA6Om0hg90c3ja7JVjjallqtvc0Jw1wYdylsml0P/qFOB52e5RQOBdKzTClPwWVRPPwdmQD2FkkdVzPETbP7j8F1PL/zTCDcMmXUf3w0W4IUmovoZmQyri/cWES1sVfyIW3ruXJqiNB1RZ9XvxLQgnpZoR+5ylR3u6skhQLNAITS5/SeCw/shBP3DwC/XRz+YjpvXmeVQBJ/C/kmsGChXuq45K6AnQ2i+zUoq0M4Tkefiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjxhC3kbvkPK7Lm9tYSsoAUwMVp7Xg20WtqgB4P0DVo=;
 b=Z3+nIdVPw+FJcnKg16tLl8LmfGT8GeAxY64LrFXDDsu7c/NiapWJpoX7l1cDXiKX4hrKvzsE0dzBivRWMyYykJX6Bxxi7UdX3FmSIpqysULXZ1vLdjJGqJ5G2jZxgCb3bq+b3y/MYJnI5g1/Ae/GrdABEcH4fOdmTr3F1K/GkImFuv6QSezWK6Ir161a8er8vVcc59Z9gOzvhQv5PsleuYRh83sJIJsEQR/c2kpSum7e6kJ4c4x8UYctSt9JuGT7o6MIEO1hWLUv74bAIVlw9EmSJNVxhuZ/8BPZ7kX5EcI0uRB02IqkdNZXK0pKbrW5a5vz2YFQzBqA04LCWp+3Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 00:13:21 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 00:13:21 +0000
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
Subject: [PATCH v3 0/4]  media: i2c: Add OX05B1S camera sensor driver
Date: Fri, 24 Jan 2025 02:12:39 +0200
Message-Id: <20250124001243.446511-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 91bd49fb-d1ee-43d4-aef0-08dd3c0be93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dg8A87B4RpliE6ZYETW4XKG4+NUxyZTrBameWQDyULmj+ESYJ8W7YAY3Ec5J?=
 =?us-ascii?Q?k3ZMHhOK8y9ma9PJG0cot8JfHqVmltrdk00l9TbZB+I2Cpg5kgovXNNDA/nZ?=
 =?us-ascii?Q?537nIW9gnb6ju+MJNhhjsTU87Ifi5Yxy/AJymL8VQqUSZW/SUYajA0UcdE2I?=
 =?us-ascii?Q?5AcCT7+3nH7WFGcVdOCenODSIYEcJOqJIPId0f6qujahj6ugpouU2bPXFDt8?=
 =?us-ascii?Q?j5j7oMWhImzR5Kb4LvQx6sVoeBFSB6iYE/fsisDFH/QY/c8DY8UQqzycWmc3?=
 =?us-ascii?Q?JTrY2oufHVhlox14L3Gn97PGQV2IhnhzrVHFUmO0fgnWZ2WOMV2MXqiKL4at?=
 =?us-ascii?Q?w/6wGd2MsHazGfGV3DyMLMZ/v663i7kv/OvbeQdE01uHxhwOKpAfHarGxWcZ?=
 =?us-ascii?Q?6gfrIQN1HimycwpBa9Rjv+CcviRRhrMWOASa5MA/m38/xAFIyLgMjCPbVNC6?=
 =?us-ascii?Q?YLpYKAJrSE+9Pvm2zucRZ2vXqEvW4BINHwtLQ0jX7e9CMbElR/amkpjOXoUy?=
 =?us-ascii?Q?rhUPVLFnHl3wacQgh1Fbq9LKUWafd0YcSUlQozrGpjROq3gCqijcVcO4cwRp?=
 =?us-ascii?Q?3kjuO4zDx1U1cJSMamV1G6cMGK7PMfIQRcsK2MIPYP+qQsskPy/7FyxVN+2I?=
 =?us-ascii?Q?yz6gbytMSLr6TnbvNhEVfg4QGPpXwQE3aXs3En4cuwFUkyAvysl5TZkVivME?=
 =?us-ascii?Q?IvlCZmsMh2toHWovagLYJzHxyZyhZAnvj8200UwYj6++ZlsswJ4XQ9EN8LNc?=
 =?us-ascii?Q?VnGxnYpzsgt9ge+yf9CWp0PkE17bvcCRCUwZY1DNuZgdGN8UrQHOSSlOh3Vm?=
 =?us-ascii?Q?rsNWbaWiIMxucpDaG8KLPygUmvHf0qjaQkGJyXpPkBQDZICcxhSJjvaL/w59?=
 =?us-ascii?Q?yeeUVOQfPRk5lqHXUfVLzXQIa1Qa8k/D6QZFfJnTLUbG0efNObIosMfJzstp?=
 =?us-ascii?Q?l4KWLVcCuWOtkH0p7gWFLFZYrg6CpxuI/2zVdy6FHT50ckN9R5I33stdx+T/?=
 =?us-ascii?Q?JV52e5RzGmWukB56luePzgjF+NgVZJEdAvBcWDYhIZakqfJDNokiOfY9Wyok?=
 =?us-ascii?Q?10ITALUXyAV1wDzN3IxEWrWwLlopiUah2t12MXVtmaxb+xykmT2hikW35pyq?=
 =?us-ascii?Q?DLXCFStAf51zIvEIYLv3ESB/NkLH26v5o0isy3NWZaZX0KScx5aJELzMxlLE?=
 =?us-ascii?Q?1X6YQ4zKhLUAwyf4ch73Fhsvga+zr0/fFkh2AeZISXsbVhm4qvr5UcBg/VBp?=
 =?us-ascii?Q?gIIAzrnukDphM+QgdiWhOBUbPiE10Il4SEhEu/ocBjyXVsZ4iUEwtKfALjLv?=
 =?us-ascii?Q?YJgqs3VPThbAcwt7u6m9YBQEi6nTg7E1GamVESU3Zqrx+qggATDW0gXxlUvU?=
 =?us-ascii?Q?b4Ff+yNLp3m8GmI/zJJgKYHXVxDh0Oh0xL887yB8mSE18/NCRSNo7F7ToWeG?=
 =?us-ascii?Q?2fD7S4jZJ1Y/u1PHtL0K5aE/MPaqc72e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LKmrl8shT7DIGXXdix/pV13Z6LcbZPRt+HszUeAJi6x/0tWO5QmLzdmqqpFF?=
 =?us-ascii?Q?Pf0yKRoO8eIuRltWs1CJHlrkEDiNNPOrFQJ/zuHRo+RyZEF+dIMBbc9r0juj?=
 =?us-ascii?Q?1HU4qi5jTOMZodBFEUy3f6iGNZD/zLTBA3qRSLZiFwUFRZFyXulCeaYfKO7p?=
 =?us-ascii?Q?pw8i+SAP29wIDDQbzGVcioHqyHj/xevlse6oZiaftF2OVWN3Ctg21Xy0UTin?=
 =?us-ascii?Q?J0Nn0SKg4d/pAsOjWRBMPMs8C7pF6xaSJVEIjo/GXPoLbnqp8LQvIJA1tLRD?=
 =?us-ascii?Q?jKjj1Tbb/gQk6bFbd+PelR3DUo6Z1XV4PMvKDjzldbH7pQJ/xxxdBaZvRxIF?=
 =?us-ascii?Q?mcdJq9Sbdbwy4KT2mx+iLWQa9msZWHsrWve7/wECf7C4C2fee2KYj2k+bzF6?=
 =?us-ascii?Q?X6CXkX8o7roBJDQFV3vU+UZnFZVBRIWNMNRUEV+M+l0nbRg9rvkRvjuZ+ovk?=
 =?us-ascii?Q?aFd7+aKkhDkGbtEmh5SVppiAc+uwe0GPkB8EYWmO2O/T5t8v1s0YQgTfykxX?=
 =?us-ascii?Q?XeY3Cn7ZZ78cDwxZkvf1G0LviQcsvpHt6+UVlbrMTN4ToplsKM17C+FWoa01?=
 =?us-ascii?Q?Z3+cV4/Pcb6ld4MH/3lbPdKxf0Y9do2907kAOHJnNisXaWIMWA+wwmvq9yml?=
 =?us-ascii?Q?Tvfd9ouwUk5UPLUqOyx0kvoGI6PWNeJ6TyFPKyfL6BpjckZoI61Zfz44JI4n?=
 =?us-ascii?Q?UrkoMVdwP1BhyazXhzgTU//0NA33VTV4ZspW9gcqodPD3+v5gEj/kiDSShun?=
 =?us-ascii?Q?v3abQzzqa5cs18VTSaZat8tOWMJMDuhXXeZDvB8tezTjrBwl7q1rWaRSphCz?=
 =?us-ascii?Q?ROU8bvdYx2t9OzkqHeMNA+LYMfE/DS4cTxKxAYrKWHb+hXIVAAsjepScbKHt?=
 =?us-ascii?Q?mw6+3/3zH+0/AwBIbLlgmETmTtWXR5tlKhcLK2bwV95uKcQpW8VqWjvI7uXU?=
 =?us-ascii?Q?P8tEuyb57xngRgeHmJn719+ByaHwiWnG1a7qDNXKOLrO1rDLMuEme1PUf51n?=
 =?us-ascii?Q?A/YzU6kent1Bi4nVgEQmqi5qP98RddHOjVRPXa3zxD/BBkP/OPV9dkk9sGMN?=
 =?us-ascii?Q?rTEbNmUbIbYW0IJOJlzbx4t27sUSnr/uK+ee+thz1WdZR7TKyEuT5YCpb1Xm?=
 =?us-ascii?Q?3bqH5G9KhALW55Rff/klALGN6rzJcXNhLLIJ7zOK/ovBD3mNiSp1H+L7QN8b?=
 =?us-ascii?Q?QCI4ubjfazzA4CCn36pDNbKze37mPRdEKaiL2EDMebkVsahHkhCu4GEyxxZ1?=
 =?us-ascii?Q?8AL4aR0VkUPvUHT/QFghYWaO5oqvw5hncihlHgYL9ykrPuoAxVOGPYjTnd+S?=
 =?us-ascii?Q?3Du4DkrNSjcoq2OnlfoP4JPPjVFhku/ShFmwB3RW1A31QexTAgK9ALWPYJ3i?=
 =?us-ascii?Q?feyPUbBXH2bhW1++7zpGz7tmha7LMOa1dW6oo+M/KZbSRrqIRyU/qAml/tR0?=
 =?us-ascii?Q?k92lpbXVer+5VRi2un+PFv+yaPLuNyLQWRvkfToHyFi8rzGeLUWGzAEeOdgP?=
 =?us-ascii?Q?WpqnXHNWl7RSKCvos3ycWL2LLBgZEd9K1yUallWcgflHqa38aAxgcFrLT1VT?=
 =?us-ascii?Q?gY7HFJjUElxQFhwesQiR3XscQtCmwb1YobpO806kb77CDjZXLQ0C3lVw/2G9?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bd49fb-d1ee-43d4-aef0-08dd3c0be93e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 00:13:21.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKdoRmvHup9EOa3AOQlpNV8ksIciFYbHmxiW3ruG3mFDfhU8bfa+T1NAsudE0JKIuvLIztDBMByy51K29zLMOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
of 2592 x 1944.
    
The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution:
   - 2592 x 1944 @ 30fps (SGRBG10)

Support for another sensor, OS08A20, is added as a separate patch, using another compatible.
For OS08a20, HDR mode control is supported, with one HDR mode: staggered HDR with 2 exposures on separate virtual channels. However, for now, only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)

The driver was tested on upstream 6.13-rc7 on imx8mp-evk, but also on nxp tree based on 6.12 on imx95-19x19-evk.

The results of v4l2-compliance test:

root@imx8mpevk:/unit_tests# ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5304, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8fb667bc4ec2 2025-01-22 12:37:43

Compliance test for mxc-isi device /dev/video0:

Driver Info:
	Driver name      : mxc-isi
	Card type        : mxc-isi-cap
	Bus info         : platform:32e00000.isi
	Driver version   : 6.13.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mxc-isi
	Model            : FSL Capture Media Device
	Serial           : 
	Bus info         : platform:32e00000.isi
	Media version    : 6.13.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.13.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mxc_isi.0.capture
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Sink
	  Link 0x0200000e: from remote pad 0x1000009 of entity 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mxc-isi device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0


Mirela Rabulea (4):
  dt-bindings: media: i2c: Add OX05B1S sensor
  media: ox05b1s: Add omnivision OX05B1S raw sensor driver
  MAINTAINERS: Add entry for OX05B1S sensor driver
  media: ox05b1s: Add support for Omnivision OS08A20 raw sensor

 .../bindings/media/i2c/ovti,ox05b1s.yaml      |  119 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ox05b1s/Kconfig             |   10 +
 drivers/media/i2c/ox05b1s/Makefile            |    2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h           |   26 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 1123 +++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c     |  159 +++
 9 files changed, 1451 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

-- 
2.25.1


