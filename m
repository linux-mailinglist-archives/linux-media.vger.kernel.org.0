Return-Path: <linux-media+bounces-36934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66EAFAA23
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 837CC3B84D7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 03:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AB7254B1F;
	Mon,  7 Jul 2025 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BV0xZYmY"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A5253340;
	Mon,  7 Jul 2025 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751858176; cv=fail; b=iul01AMaU1uCAdta9AC5xUZYJ9gNSDMTLA1DPvf8zyl5+8ad3vVgA9NzRIMFbyuxtMrmv0KQwkC6U0ECF8inCMUaGuXdlz8xbMAaoXAOHyRuElPYs/O/E8r61G2LSio+wjRjJajw63HjaYSeHph0Oi87E8x07l6E4Bf4A2413Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751858176; c=relaxed/simple;
	bh=GbtwU5ZrkUFuWtnTlsUsOdPpelx3qJKSs1LCcMireTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fueRptahH4rFTJKYcLtjyASbLLTRJLjjvnkUW4rK9ar1FVb0zTpruyhZj7YQitZMw7XwqNJLM+c597EXiSm356vI67oXCEfQfhHVHa30RKY2OuPKjvwGJ7iOL+uMIFZsZ3M3/+6+lZr5DJGTk9aDciefSiuhKZQTZAQtZjwGjIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BV0xZYmY; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvjA77FjtykXDV/d+1SUFl9CVtb1N2rmHDqRPDDUGmBt8ux8IloFPNOKlKbHviRJp0ADobXi5doA1yX0admiOG/hqmfx6nODPV9WPQ01fSj03xaflkbp5NdhWZMZznhjKviWen9ayF8+ghZTyaL2t556cQJEGhTPIn9sHaO/wAx5cVRJxmgsGfaz8b8H14z7Qh5r48MVLU/dhJ10gqdvpueiX23j14tNPU2jtzyeye6JMVLZ3tTrBCXCGViWulMarQUC5hLxtM2g2gxaFGyjn0Z7cnNTKh9AqGYJB7mwfbvS+0Uc7Ys7Msq3gDbYYG1chJcI5PCLIsupklkonS0VZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u09jcQqGOYfy2odXX0dVg3l60YaklBUIXB2H3Ffwm8=;
 b=vAkoKbSHrpUbsNru9T++VmzpkFeGRoU9hHyjBP82Hq/VGruu1jV95Xe33hHhB43jebNj7wZQJUVyI/C2gxZQexrT81Jf1u5AspkFtdfy6AxPRxi6LNC2aCEdEf/Y+bQDbc/Hj0Aw339pW8WZ5rf2G5S1qMP7V5kx321KQfOBl5fVPLfNikSntAiHF4ZFXTefp3OC//jPHH5vwF1wFBztqlnvE3ok1l4fnOEOSQeqrJC//GTdN5gB/zsBpTjvK6K3fDxgTftLmOpfdOiEZfxgSlHTumj5gniiW97bmJdsZT5GQSceqZbf3yv+bnE2+bpls5CA9lPGYcMFmB5SqYq6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u09jcQqGOYfy2odXX0dVg3l60YaklBUIXB2H3Ffwm8=;
 b=BV0xZYmY9+HazPERWBSsTHf1X5Cyri11p3QTkdtYJQjDrEO6QEm33hVhPn70vLziOtkyE+qRPxkb4seV5SXq/YVBbaPADMXSlDURa9eu5IvzXibnln7cyXp6/J2UP93z246BbCa9/yNA9h1DPcemrSeM/pNuqe2VSgUC48PHxmH6lQ4oKGlCmImd3YK9FEPBiqj8e9yB1lztnBArsHIjJ3PQ+0oC0wmli7NBRQwrPbsJMbhnluLiVZTF+uRBO6qM+m9zPelcLzrrsn7USQ2enQkHMn1MpB/GN8hXg56fS8A7bQIjmxHRzp7akTJb3yjh1T45xQWr9UHbkQPkcWUFww==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB10773.eurprd04.prod.outlook.com (2603:10a6:150:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 03:16:11 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 03:16:10 +0000
From: Ming Qian <ming.qian@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
	<quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: RE: [EXT] [PATCH] media: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Thread-Topic: [EXT] [PATCH] media: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Thread-Index: AQHb7EkvGzk9b6YC+Eu0QqAZ0zFup7QmAbBQ
Date: Mon, 7 Jul 2025 03:16:10 +0000
Message-ID:
 <PAXPR04MB8254061B8DD71DF865B200D3E74FA@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250703183451.2074066-1-robh@kernel.org>
In-Reply-To: <20250703183451.2074066-1-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|GV1PR04MB10773:EE_
x-ms-office365-filtering-correlation-id: af159b29-d8e6-4665-4793-08ddbd049f71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zvH2E00/0lGlkDGL72dHpyMkLsn8ygKjtNaXlz/Ve3Pad3WN0y2Xv4p6PUlN?=
 =?us-ascii?Q?WPVUWCH39e1zw8ygWIbVW55xaoMOXV/EcKLOnJdwWsBQ2gdIFuSCgaRpqdRr?=
 =?us-ascii?Q?Lz6tGCpwuBZ0EWsyE0VEdP/29aLC7w9yw1dCQrtVWhvVvXok7/QdCEJPwv+R?=
 =?us-ascii?Q?psyMLmRdYaLHnqtwbLSFP7tLmeygYxpJ/atPpR8OUuGWTFtU+xY1dViyJ/H9?=
 =?us-ascii?Q?yU3xlRHXdJ9I1sVVUXE3DxKVvRcelzDC6CXWzA9Ng4YVfW1pVTtul7tNgDwd?=
 =?us-ascii?Q?PGJF03OMiOKknXUkB600LWVBlJblpKddEtJVqa48wZpShL2XY6IRR77OUEIV?=
 =?us-ascii?Q?owxjJLjEXCm+pueE7TkLPEjuw+2eUntATcRJTBaodmneWYimI41pEpTC9ln9?=
 =?us-ascii?Q?hrIVWwVRqQ87LwzfYGU2CF17MmxqicVHQe91pV0zn92G8F+NtOIFsoyUWS64?=
 =?us-ascii?Q?Wmk0P/eKjrfDb3L85jZbSR5j0YjVHXtMRPzYQJNEJmBEggN3lyQ2NeW1j3Ly?=
 =?us-ascii?Q?Ps/n9EA6MYuOZf3QYJtbdLP7Q1qzmM6lMZiXJWQLE2rBhsrVUOM1LymILWpL?=
 =?us-ascii?Q?hpalpxFGeb2peuCfvU75KK+8hxkNgUGaHTPstxX1/iUhB/PjSIzg7ASGPUxA?=
 =?us-ascii?Q?2Xh89RLMBoBxYu+ALbW0GISSKsplvaTFQOnqeOBOe6umCcFfKyq/jCrd9i0S?=
 =?us-ascii?Q?wznYImNA69Ei13PeunM0TsoLaAMUUrZuAWW02bNZJOzEn/YATwgUYQ6FCjMn?=
 =?us-ascii?Q?c0MUgCRM+rb23bJULGmn+xAVd68oMXhfuzIX9Ve5QNz4EaY5TmYw3kF5Q0uG?=
 =?us-ascii?Q?vMe6bSXkHgbu0pgPevcsmwoFg/N82ViAoBFK2MBCQvMjUokTZNs8tuyGFdEH?=
 =?us-ascii?Q?Oe/2GEQy62L+x1JEhsGTRtZHX/NX+hqy/AoUTPnYvsKaz1YuYIrd21KVeWAi?=
 =?us-ascii?Q?VrHPhuQJEEx2FRdAvcXc30khKUkp1oosJpJX5AyW1KSJzR3Ite0TtHlMJyMz?=
 =?us-ascii?Q?cTDT0gE3+hlrUZq2FrB4c1/F9vPoY0WllR7mPrcIeqQEvBAU/YW3Q3AIMi7/?=
 =?us-ascii?Q?zFNhjlJRwMhgpjmFjFl45pk8tvStW/mUeIbp1qDW8jX+77sE20Ihf622Zdu0?=
 =?us-ascii?Q?zrX0ecpY3sLiF77vRHFdSa4Oy+7afRVUfUX/wjmCJzbwkVlXEY24sK57Z7TL?=
 =?us-ascii?Q?jsT5ERux4xKp9a369e0nw4fdlUvjcbRFI2iQ4ZlsrOYfFOjo1iPpnNb/nmyT?=
 =?us-ascii?Q?o8jPWWSmlUWl9tooGobJUVSXYgpxlgjEi0Z3n+appg74WNcI5/ltFqIQ4xf6?=
 =?us-ascii?Q?4VjAiF4WR2AIO7XYCre/d1GVyPUDegGwUx47Ojbq9REd8b+EgNt9bReEanQ/?=
 =?us-ascii?Q?mpK7JaffcuJizb/2qInIIBtq2jtHFnu9Jy6iLwjCbxG0md25LeJigWCyEIBB?=
 =?us-ascii?Q?FYjqhypRexek8n/ylXZC5nhfz9aOdMF7yVfAEMpeKMWZbT+opcDC2w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6AteqDs2V4AL4nzRwzOzW2GuX7R/fwx/0fNjekj5T+H6WlV5jODyEpuii2JE?=
 =?us-ascii?Q?zkTth5eMHOcdlybWPN22b0TDWOqIsWbh4gp4AT1WWFSUiuBLZ9JGV2nReird?=
 =?us-ascii?Q?cMKj7+vcn20wqPaIfDmAG4Yi/j4jiDCfiVyQsYufJzxSn3xF5F+OUl1UBpFi?=
 =?us-ascii?Q?y2dcQeY/9I6p6Tq5t+rf7VZbj4z31Ops+r33Ftgh2ziCYwTMZEo2GKcFdEQ7?=
 =?us-ascii?Q?MKdySZSG1xvOOKYp0GI6hdbB2ZT+OHxyERb8ocNwwQCub0T0w85zFXh/vta/?=
 =?us-ascii?Q?5qSij6UD5sijWTW9aYsdFQon9mrwVX7YvUNQd3kwYUGNhFKa+peN5CcPk6N6?=
 =?us-ascii?Q?9i4BDclUYFQMhb1lC2or4aAOtWnZ9Jymk3JdIPEjGGjUQJ8oDr0cgvKlmVZc?=
 =?us-ascii?Q?JvuysPZ5ftHWnh1OZ0L59WOQlaO8djAR2onEQPGSGFJ+S0OHVjxpEUV4soYI?=
 =?us-ascii?Q?WZOBrw+oo5Kpgep+Bh8uQoQ0qs8DHuJvnYGftNiZZlfd8MbI2XXSMl+fgENq?=
 =?us-ascii?Q?MTueSOz6RMCRMc8Foaj8ZRbTFYPO90fK+dTWYT+h21M0vCCKjCPWeVN6Ky8v?=
 =?us-ascii?Q?DLxSyGAZh2TBRSO8LI99uyultCVO3U2mRWUn81ro4SHv1cMlAM7U72XyzY7L?=
 =?us-ascii?Q?Sx80WNz1bnB6833/yLaZo+0q3YjQ9bgTsZgIHbbxSlQmDdusYyiqFwcxIV5L?=
 =?us-ascii?Q?o6e+5DRl1fgI/1+IOQY6Vzos2b3hyqAzuF+2++A2rTR459CROOJGYTwRqiew?=
 =?us-ascii?Q?DMYuV4x2PR018OO6j/AMmedEsa26j4RP+SCBq6V64e0RcXodH6Mj/35KNdfm?=
 =?us-ascii?Q?dqnvgRH0AE/lsJvlyClDt+80RCAfEeVwB4Yr+BMWOCpzt5TrzKwT8naQ4yFR?=
 =?us-ascii?Q?ZD+SODmRY7HrSI595sJvyKkw1kU9u6sVjotEObM/OnQOfTDpWp9T6bPB9DRv?=
 =?us-ascii?Q?Fpi9E8Uy4E6qXOfP++Sxbo565jrrmtafP77ES7kOr679ZSe1TzMSgK3a7LkG?=
 =?us-ascii?Q?CgNn5qBVIByMYoQbAi+PZrfjMFnlG2jfhNEJ0PFo+CXVIqFT3aUYZJDBdRDz?=
 =?us-ascii?Q?dfto8k23bSXOuf1h8F7lYqfMQmxWC6ERMqsSvGbnRbCFzrXZIZsozPocNx9m?=
 =?us-ascii?Q?Vr5oDP69UgreBxUnnplNeXsCQCv2OwxPITGvsjTteLeMss1aPo4MMCwR7gD0?=
 =?us-ascii?Q?6yt3nSlJhTPC9RbPkxaXX99r4hPuiwKhhJhrvrLlyAcYeozb8HvW/w6bYOK3?=
 =?us-ascii?Q?zokHMVoWxagWHPPgSy3JYGaUq/s2pIzI9wadltrZqmMU542o4G2k1c0xSC5V?=
 =?us-ascii?Q?5C7TIQOumxZv0awqnGNWC5fnj6JjnVXNAjWmEp3R6MgC4MnLgAdZcjwVOfNr?=
 =?us-ascii?Q?rE7B5Fibjn1WX4CxT9fVVX9WPrEOCpXJCYgOh25Gxna2Hhag278R8ud2mkaL?=
 =?us-ascii?Q?2vkvlKqXKFh7eX8ZRa9EbzQJ/y3SIXFw0VVy5nTp5I/9WGbbZuI8TD2PRflN?=
 =?us-ascii?Q?Ivcr03oVmqGCize8ky8V8FzXV+fWEzgGu3I2cwISUMzBxgSIimGdR3YMXM9p?=
 =?us-ascii?Q?Co3X5rvDlmf+xe8kPJ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af159b29-d8e6-4665-4793-08ddbd049f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 03:16:10.8401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1Zr9Ql0n7r/zOrzc7WHvF+CoUpAO1xKK3Bojn0VIsMhR/wM80rdaHGl9EhEa54ECsGHRZhtvP1q+afYCFzrjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10773

>-----Original Message-----
>From: Rob Herring (Arm) <robh@kernel.org>
>Sent: Friday, July 4, 2025 2:35 AM
>To: Ming Qian <ming.qian@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>;
>Mauro Carvalho Chehab <mchehab@kernel.org>; Vikash Garodia
><quic_vgarodia@quicinc.com>; Dikshita Agarwal
><quic_dikshita@quicinc.com>; Abhinav Kumar <abhinav.kumar@linux.dev>;
>Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>msm@vger.kernel.org
>Subject: [EXT] [PATCH] media: Use of_reserved_mem_region_to_resource() for
>"memory-region"
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>Use the newly added of_reserved_mem_region_to_resource() function to
>handle "memory-region" properties.
>
>Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>---
> drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
> .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
> 3 files changed, 21 insertions(+), 56 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_core.c
>b/drivers/media/platform/amphion/vpu_core.c
>index da00f5fc0e5d..168f0514851e 100644
>--- a/drivers/media/platform/amphion/vpu_core.c
>+++ b/drivers/media/platform/amphion/vpu_core.c
>@@ -10,7 +10,7 @@
> #include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/of.h>
>-#include <linux/of_address.h>
>+#include <linux/of_reserved_mem.h>
> #include <linux/platform_device.h>
> #include <linux/slab.h>
> #include <linux/types.h>
>@@ -542,47 +542,30 @@ const struct vpu_core_resources
>*vpu_get_resource(struct vpu_inst *inst)
>
> static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *n=
p)  {
>-       struct device_node *node;
>        struct resource res;
>        int ret;
>
>-       if (of_count_phandle_with_args(np, "memory-region", NULL) < 2) {
>-               dev_err(core->dev, "need 2 memory-region for boot and rpc\=
n");
>-               return -ENODEV;
>+       ret =3D of_reserved_mem_region_to_resource(np, 0, &res);
>+       if (ret) {
>+               dev_err(core->dev, "Cannot get boot-region\n");
>+               return ret;
>        }
>
>-       node =3D of_parse_phandle(np, "memory-region", 0);
>-       if (!node) {
>-               dev_err(core->dev, "boot-region of_parse_phandle error\n")=
;
>-               return -ENODEV;
>-       }
>-       if (of_address_to_resource(node, 0, &res)) {
>-               dev_err(core->dev, "boot-region of_address_to_resource err=
or\n");
>-               of_node_put(node);
>-               return -EINVAL;
>-       }
>        core->fw.phys =3D res.start;
>        core->fw.length =3D resource_size(&res);
>
>-       of_node_put(node);
>-
>-       node =3D of_parse_phandle(np, "memory-region", 1);
>-       if (!node) {
>-               dev_err(core->dev, "rpc-region of_parse_phandle error\n");
>-               return -ENODEV;
>-       }
>-       if (of_address_to_resource(node, 0, &res)) {
>-               dev_err(core->dev, "rpc-region of_address_to_resource erro=
r\n");
>-               of_node_put(node);
>-               return -EINVAL;
>+       ret =3D of_reserved_mem_region_to_resource(np, 1, &res);
>+       if (ret) {
>+               dev_err(core->dev, "Cannot get rpc-region\n");
>+               return ret;
>        }
>+
>        core->rpc.phys =3D res.start;
>        core->rpc.length =3D resource_size(&res);
>
>        if (core->rpc.length < core->res->rpc_size + core->res->fwlog_size=
) {
>                dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not eno=
ugh\n",
>                        &core->rpc.phys, core->rpc.length);
>-               of_node_put(node);
>                return -EINVAL;
>        }
>
>@@ -594,7 +577,6 @@ static int vpu_core_parse_dt(struct vpu_core *core,
>struct device_node *np)
>        if (ret !=3D VPU_CORE_MEMORY_UNCACHED) {
>                dev_err(core->dev, "rpc region<%pad, 0x%x> isn't uncached\=
n",
>                        &core->rpc.phys, core->rpc.length);
>-               of_node_put(node);
>                return -EINVAL;
>        }
>
>@@ -606,8 +588,6 @@ static int vpu_core_parse_dt(struct vpu_core *core,
>struct device_node *np)
>        core->act.length =3D core->rpc.length - core->res->rpc_size - core=
-
>>log.length;
>        core->rpc.length =3D core->res->rpc_size;
>
>-       of_node_put(node);
>-
>        return 0;
> }

Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>

Regards,
Ming

[snip]

