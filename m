Return-Path: <linux-media+bounces-50189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF4D0116B
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BBEB3005F3A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC0430170F;
	Thu,  8 Jan 2026 05:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="P8rDWofl"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020132.outbound.protection.outlook.com [52.101.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3E302151;
	Thu,  8 Jan 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767850211; cv=fail; b=tpUwcuHMSQrUmR8hiV5DTbO+1cKP2aKtdOeJJ7wDSvht4OEDMPeehSZRyNSoa2Z+l4v55jsBt+Pb8vHbYJb2TyOHG8+QnCBxdo/auPWFaeHSJ3u4P/xvzswX+yeilpiE0ONMSMp33xFOnN0E+X+p1LZfIWn+J952B+acOmr6rb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767850211; c=relaxed/simple;
	bh=3sO2Ced9HXUEenSak/vESSMf3lOU4j4f/qDklxecse0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KLCezItQngSZS14pqObKKPTk6GsMUDFzYd0hBRcU5zwXcI5XvNy83GvEWgX6TIyqZH9Q8ocHNqTMHoRhRwyg2Qfa6GC2QMiaXkTuXDw7aR5apVolaQzjB6/hFDQvC3W14xC8PCAQ9fx4/el/wIVj9JE0TMhF4gTkq6oj4fuZ26E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=P8rDWofl; arc=fail smtp.client-ip=52.101.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKm82JQPtfhuDNygO8bfM7haKrTBInxYHTxMYNc5LxDZNRlCf/S1D1lUBhmaocsJGGGuXPj4CnvsZJtbSlRzYd5N1b+Nk50VSVtSoUv7bkZvtnq6JYqiUl/43Q+VPNPMKKA4w/GxgH8TRPQMxeGD6PPk6ZbaGmo7JdFZNgQne5Nilc7A6noNNU4kZWLTh+V0zQ+gFug5oxu8LIwwUUZtcNu0pB4x43Vv1/SUCZ/JMxCk07lo79or+CVQX63wqt37yHG7ngat+T4CrK0zoMimQoiaMdzS6Lp5hgNwIFRcVxoeOhIrFujU8U8EElNIi7L7NihQFi1iVM1IZCxq39xSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sO2Ced9HXUEenSak/vESSMf3lOU4j4f/qDklxecse0=;
 b=lYnoOIg3ZbxJc8aDNsxcDmSdeDc+VnXWhyJgxokr/s9oyQTDRzaIuBan8vTF3WACEiclXeXH7ogs/cO51vPh83zH2QiKNQDVLTLvfevV6u6kr1C6nryFtT5N0ZtAuMuRTeF0w2SGnqsDbXpdp84t9BM4IixRXUHpViIM7DxRlFJnnlqgCNBJZGZ5+t3i9NYbcX+/BqqV2z2jnh1UHeehUqmOEIvkAA1v1PdtEyk+66Rf5MLq00EE4fKLNFZNyiX4FoA/Xq5MtFoGfkuzzpNKQ7SJ79nSwy6EXI4Tc82Ax32XctRPLJbrAIbZLB4wZJhaJkMs+91HDKY+0JqGlsz+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sO2Ced9HXUEenSak/vESSMf3lOU4j4f/qDklxecse0=;
 b=P8rDWoflXGYb5yYeDFP1XnLK7qIDzZq/Knb+2jlkc11z4+8S4oJNJtjXYZSm0tNXYmB8zgbmnVRjxx/7rHtnWfQ8Ub5ZtfOWsFT3IxDMmpmDpFMahLR5lub+PH4mwsbc5FeU01q4THlzBhWdWjFrVgweC3kxQNq2oOP8SEnYUlmMTmeoJt08asb4MydJ28gMPmBBchQnuQ0tLIoO8ZcmzBUYU+Z4RCSs6Z+tVHdcPVMKZy/U0y24REMntUREonrpo0c7+Kd7s6J789PDKnxW0oYzA5BE89pXuI2w7lHbsxdxxZk2XogPCmQX32ecdg7UaHVF4z5jqj4/Z0ERUmUdDw==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB0301.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:30:04 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:30:04 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Dongcheng
 Yan <dongcheng.yan@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v9 2/2] media: i2c: add os05b10 image sensor driver
Thread-Topic: [PATCH RESEND v9 2/2] media: i2c: add os05b10 image sensor
 driver
Thread-Index: AQHcfiaOXAHJCB39mk+CUceEtzU5bLVHR5qAgAB5+bY=
Date: Thu, 8 Jan 2026 05:30:04 +0000
Message-ID:
 <PN0P287MB20198835408FA94EDE9660139A85A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260105093420.110973-1-himanshu.bhavani@siliconsignals.io>
 <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
 <aV7ZB40s7L2PdW21@kekkonen.localdomain>
In-Reply-To: <aV7ZB40s7L2PdW21@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN2P287MB0301:EE_
x-ms-office365-filtering-correlation-id: 5f22b88b-b1e7-47d0-981e-08de4e76fa23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uhggwkJcZSDic5d/Uq7RFnVc6CtO3gSOnpm2MXy31ofWTah0E1J06DBMrr?=
 =?iso-8859-1?Q?MBEb4RYopzGI5fYCPth4THfESsCBG1xstqa8ySStNtJorMBG0Vxb8nEBSD?=
 =?iso-8859-1?Q?xdxV2ATbPKi0vEC3/KH8j48DKltnGNW4wp3JCReofwFw5NcJECGud+cnd7?=
 =?iso-8859-1?Q?441Yfr56pxqD3wy7z2Ospz+Pf6inKAb7LNTHUxa1tINdFcYM5yxsZMUsAw?=
 =?iso-8859-1?Q?BE7QqePJ7upCNjERCVmq91Z7IrDcDm6pGJI+NuEj1/k98wtC7MhFen1Kbl?=
 =?iso-8859-1?Q?3GR8RJYcOAR77tlspW1+9+Af1AKla3hq93rvN2yvnga37bhrV6RZz/2ZCy?=
 =?iso-8859-1?Q?MooeFwdQNCvifQFJjW0sPWE4d6mjCcBBbkMITCxBim6VaYoN+gmEdMiCRH?=
 =?iso-8859-1?Q?8YzIIK+XCajf7yK7PU/p/0MN075tgF/Q7jiILCiHwgMC1JAsvmcSrIsFP7?=
 =?iso-8859-1?Q?z6AHtWed1YzERJBMaPHfmV+moEGGlfpA+Rgx13A6jjzf0JCf5tds9+FMpo?=
 =?iso-8859-1?Q?GMrojBelSKkpPHVGGbEW3B6tQaKncQFrFrPYECuFup24z4xu8JLNgGpBs6?=
 =?iso-8859-1?Q?XcMSmhAoCom6sxa7CXFINIkAtO3lU31jejDkm9CqrymUK9aUD0yk0fNbOu?=
 =?iso-8859-1?Q?zDGJeE6/4+JYJn3Vg85cNfAD8hEfpprOWolLmX9eltqE+ifVWXNyTVI45t?=
 =?iso-8859-1?Q?+6e4k3TM+tWpYNAnOhPEGvbGivGon1NEhpO000RlgYZgqeTSLRyOzq/QvY?=
 =?iso-8859-1?Q?EVAV/3hBqXF583HGc0+ReyOqx0O9fy2t95G0r3IH1TBLs73J+AnFTm91vv?=
 =?iso-8859-1?Q?mabSfr8d0oJQfraAveIrXUQLBrcAA1LO4U7rP11lUFvIj48lHxW9LryyBD?=
 =?iso-8859-1?Q?5Gh/vTwze+Rok8HJnfz0Mr7tlY6RgvOaD87xq4phnloThMAiX7MaCf8Qux?=
 =?iso-8859-1?Q?v+PtXdVOH44vcT8SFyqhrxZhzRdERGK1ncYd9CqVJjoMiji6929K2P4NU/?=
 =?iso-8859-1?Q?r91iVrHhZ35tbZWhBv8cURnuFYCzgoQiNHpwJj/nR6BxracHQRZ+DB+1sn?=
 =?iso-8859-1?Q?6o4ia3aMcu2lxyJwFzcF12LxyYBOenoQXTMH3elj7gcBaryznNcvdoKmLE?=
 =?iso-8859-1?Q?JDz9222+x3j+pUtqttkv/Igt0N/bOwVGTV8p7eSF/WWbs0NRf2nsLvduvM?=
 =?iso-8859-1?Q?c5uzMcmOdFpaQksUUvJGryaQjzxqQ1rj7bjLajYmyw+GaKdoNM7fk8TI8t?=
 =?iso-8859-1?Q?4216rgAr7ucmg3WOQHxLtNn40SuhRfzszpgWw9Na77ELGh1CsVzDrpedgE?=
 =?iso-8859-1?Q?QyNjyExssQkYQRPaPfrPMji+OIvvBgk9dvtDfonG7WsJI3expeptdmoK8q?=
 =?iso-8859-1?Q?Wt6INoANKYnE+ZxRocTctyGDMQ9iuu6sFBP6yDMqww1108RY/6GbLKSQrS?=
 =?iso-8859-1?Q?ReMzHyVA3jVL6BhGLeQBUzdM5uetaDxr/hjfcVdDdPfcOuMREEzy2Wmdmr?=
 =?iso-8859-1?Q?l8rehiDvgSz0ItCQe3my3p9MIpixBXvoISqaYwRyM3OY1UXdWlbcvIU73Y?=
 =?iso-8859-1?Q?6c6wKF5ysDPip14D+NPyr9utkegF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xIwZUd2QnebmHGfDFMt86nIuW2WsTL4yH13niqJEsnHtuHuQXxKisy1hqO?=
 =?iso-8859-1?Q?ZRcfzDP8d1hoqS9jFFpSIPSldS4vfgha4DK2U3Scae6Ubmcd7YAv3FaITm?=
 =?iso-8859-1?Q?Ieux8zMOcfpZ1oTCj8fyZIO5A8C7W/ffl0gZM/ed/qSHYuuzq6X9ACdYy7?=
 =?iso-8859-1?Q?qLhLnMr867DrQlS7Hrc+RTOW2kEX7W2mmKlWZJUYR6bUQ0ME82qkhbc6qg?=
 =?iso-8859-1?Q?U3JSYZ8QbjG7+gnzAdWIPyzlaqXTk0tDUukItpp/iIzuJro/hP8z2zs6Fu?=
 =?iso-8859-1?Q?CsXBlczUu7FIG3Hw9TocWSQD/Aahs6x6QPwsuPRLem56fbwSFFJIdduXo+?=
 =?iso-8859-1?Q?eRr3T7Dhl7uQkBiBS0EQUn5sXuMwq9gqEEtzAAhzs3kKT3KCU6DA9VFtQF?=
 =?iso-8859-1?Q?HtT/ycitqCu5nG8VtNCJRtsUPvDq7grKVKh2xgE+IuqViBX1WgPwrGwdeX?=
 =?iso-8859-1?Q?SmgUiVkezCuon28NlnoJ5Zr6R8NMblAC4ydnNp2J1ckpY+UcbDM4evN4Mj?=
 =?iso-8859-1?Q?zgSJ0p7iMQ02sharscFThN3BkeIgNuu1CyAmlk1cEJVnW6rp/yqRQXny2h?=
 =?iso-8859-1?Q?6x2jOpzJeN50yhlGB/KJ7WM8TGGsWLEZkToFnxNG1GjzdAvTC1vTHuhcMm?=
 =?iso-8859-1?Q?tG1YYhHzHcKOgn9ocCOqOOL8ijm0BcLzFLUJror7Rcysjj7Af7zwK5ZwGC?=
 =?iso-8859-1?Q?fNJwddpg62Sh+JXEWma92LsQLn3e0ofOelxQxTlABTou2aTWOmy57LqgDv?=
 =?iso-8859-1?Q?fStbvRaz1SDyCv5FgnXZhyp2iQikP72qp5dMUPb5ti2U57LlwisVBmO0xH?=
 =?iso-8859-1?Q?ec2qpU1BU6Y1b6tApar667qcXpEJxbbL7qaRLTALkN8EToL0ILOvCjgTY7?=
 =?iso-8859-1?Q?WCt+7CMAS/Urnno0ccL91SG0N32ODAm5Ph6jNqfo9T9Hq1mFVYto7ubhH1?=
 =?iso-8859-1?Q?f2brq4jhJzTXCCKnzmaYcHtQZ0q5DrKjRUKNg3CSap5W8+XjqYrJgQd94F?=
 =?iso-8859-1?Q?GGUVlLeSRedmv756n+ZxeMcHC8uXXWBPNdNpDpL1DNcI/h7zRIWTwgoWnD?=
 =?iso-8859-1?Q?n9Ucx03Tyf3BcFdG3uB3XYkyO+WkYLLp2DIOl/yO4i6iGBT+Mb6sAcaYkR?=
 =?iso-8859-1?Q?qpzefyOYWjg/1wdQBIYS4W8Jus0ZRH6a2d0MFOpnZ3XQRv1i4k33xj96YB?=
 =?iso-8859-1?Q?XGIQJfkpkZE/r4tsW6+iWXG7VuglbmoUfD0nz+2TCNwL4hmF+iGvtZcljM?=
 =?iso-8859-1?Q?ad2i9l0PzSiUVYw31sLrpr63utLe6vALQS5lmDmXspRj3zQ9bR81cCqwqd?=
 =?iso-8859-1?Q?88feKyCyfJu93odMwcHNff0GzP/4WslRwiaYukR6nH8jxsq98FAPcwxzku?=
 =?iso-8859-1?Q?UiQ169bCM2UtxbcGxPvDzV4zITUUdhjU2bmZGmq5FTsLjNa+7IMEl6MQtH?=
 =?iso-8859-1?Q?6tNVTdnImHvNR7ygwSCl+Gck845o+4azoW7NPIyhtr06nsemNcO9r2SF3u?=
 =?iso-8859-1?Q?r7GKzxQTp0w3uUfkdqrHJAMHpozej1XhF0l95IpyopjrQZcdByj2/n0ATl?=
 =?iso-8859-1?Q?4Zl1Z3J/aAr7tmydOwlICxDpmO0cRcmrxWyyQTkSzE7kYB5YrJVjxmoRkl?=
 =?iso-8859-1?Q?4rAtsE/plFBTbs3R/Fqp7zwKzNi24Oim/U1oN7KmUMHKByrzapsoyXZXQb?=
 =?iso-8859-1?Q?6PDjSSqA0AvhiuzgGSMqrXcPuc3ggtueFGpp7Mve9XUCxTvPT393Tzjeo6?=
 =?iso-8859-1?Q?AFWiv6G7Ys8LBHES2Pe6ySdCVakM3uKXLOaz+tBJcZEp4kI+tLYLpIAiy+?=
 =?iso-8859-1?Q?UX7qMksDhCVCczmNFvZxmq2vrg2cYjg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22b88b-b1e7-47d0-981e-08de4e76fa23
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:30:04.2862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQKi1ZTSYDqfwKrWXnMxSmoy/xZAECNGdTJl4+rTy8fuhVMRZbM6CbXlLx3B/Xvv6+MRsVRj0ij2NtGeQRmSQfRW//NSpG7dILXBLVEFPkskrKSt49lowhnLAPW3K0rH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0301

Hi Sakari,=0A=
=0A=
>A few comments below... please post a patch on top.=0A=
=0A=
Will resolve your comment and will send patch on top this=0A=
driver=0A=
=0A=
>On Mon, Jan 05, 2026 at 03:04:14PM +0530, Himanshu Bhavani wrote:=0A=
>=0A=
>...=0A=
>=0A=
>> +static int os05b10_disable_streams(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u32 pad, u64 streams_mask)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_MO=
DE_STANDBY, NULL);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "failed to s=
et stream off\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_put(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>=0A=
>I'd return 0 here: there's nothing the caller can really do about this.=0A=
>=0A=
>=0A=
>...=0A=
>=0A=
>> +static u64 os05b10_pixel_rate(struct os05b10 *os05b10,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 const struct os05b10_mode *mode)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 u64 link_freq =3D link_frequencies[os05b10->link_freq_inde=
x];=0A=
>> +=A0=A0=A0=A0 const unsigned int lanes =3D os05b10->data_lanes;=0A=
>> +=A0=A0=A0=A0 u64 numerator =3D link_freq * 2 * lanes;=0A=
>> +=A0=A0=A0=A0 unsigned int bpp =3D mode->bpp;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 do_div(numerator, bpp);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 dev_info(os05b10->dev,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "link_freq=3D%llu bpp=3D%u lane=
s=3D%u pixel_rate=3D%llu\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 link_freq, bpp, lanes, numerato=
r);=0A=
>=0A=
>Use dev_dbg() if you print this at all. I wouldn't: it looks like a=0A=
>development time leftover.=0A=
>=0A=
>You can also make this more simple by using div_u64(). Also, there's no=0A=
>really point for have a local variable for everything.=0A=
>=0A=
>...=0A=
>=0A=
>> +static int os05b10_probe(struct i2c_client *client)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10;=0A=
>> +=A0=A0=A0=A0 unsigned int xclk_freq;=0A=
>> +=A0=A0=A0=A0 unsigned int i;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10 =3D devm_kzalloc(&client->dev, sizeof(*os05b10), G=
FP_KERNEL);=0A=
>> +=A0=A0=A0=A0 if (!os05b10)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->client =3D client;=0A=
>> +=A0=A0=A0=A0 os05b10->dev =3D &client->dev;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev=
_ops);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>> +=A0=A0=A0=A0 if (IS_ERR(os05b10->cci))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 PTR_ERR(os05b10->cci),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to initialize CCI\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->xclk =3D devm_v4l2_sensor_clk_get(os05b10->dev, N=
ULL);=0A=
>> +=A0=A0=A0=A0 if (IS_ERR(os05b10->xclk))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 PTR_ERR(os05b10->xclk),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get xclk\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 xclk_freq =3D clk_get_rate(os05b10->xclk);=0A=
>> +=A0=A0=A0=A0 if (xclk_freq !=3D OS05B10_XCLK_FREQ)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 -EINVAL,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "xclk frequency not supported: %d Hz\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xclk_freq);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(os05b10_supply_name); i++)=0A=
>=0A=
>You could declare i here -- as unsigned int.=0A=
>=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->supplies[i].supply =3D os=
05b10_supply_name[i];=0A=
>> +=0A=
=0A=
Best Regards,=0A=
Himanshu Bhavani=

