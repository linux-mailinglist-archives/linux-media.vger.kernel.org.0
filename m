Return-Path: <linux-media+bounces-14030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CB91469C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 250E8B23806
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A08136649;
	Mon, 24 Jun 2024 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ZTUz0eUc"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2134.outbound.protection.outlook.com [40.107.129.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521C12F592;
	Mon, 24 Jun 2024 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.129.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222334; cv=fail; b=qk3LbRjUnFdn3hjdTZ0DZS/d8L0m3qdJXssyS4XgmMjIpAM00IYVylv9ovvQtkcrsCaKuVMx6VCm10YfcpIcVOdxsvATbPfxfzMh0H6k3fm4ZgUlGHeFJgx3fQfaZa4tVg+SuHxDmBbGg/VnqI8WezLDEhcOUVfb112V6UtIUtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222334; c=relaxed/simple;
	bh=ZgotzJO92Z22mdbKmj4F9RRDf9BoGK2aS2Ucf8+CPCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1jWpK4Qc5CA0pEZG52/mu2lOObKp5x0SviuTixqFIgEu5FfrIruPZtr6foC8EI9xlKJRVYcv4qkTshqHFAkW8LRIDdylSmCxxE3QIIxw6VXINkK4fA4sglQjBMNQaP/Z+O0EhcccfB6I7Xjr11Y92Yu1b9gKqRVrkUNvKmK4jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ZTUz0eUc; arc=fail smtp.client-ip=40.107.129.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8jRhwoqvaMIOElm94D+RjU/MkcttFsx9ACU2UOOBzsiO6yqhNOrMLgVV59ohx8M0SOSLysIOvQrDXnfjqGlgUb9itSiVfQR2FDM+8lPH5w6fsueDNaHhObnPFB4NfulHtKWWQtjk0R+lEfB0yFGmpkLxRLDOtt2+UwuW7g9afpMat6Lbb2pKsqri3udwZLt2B7SOiFm1BcRue9QV1IuGOmoYPt/wxSt7mTe5CDTx634PIAHZcz2z9ia9AuASveuhK0pRKGwby+ReUdPe35AQ2b7fpZ81O6/S/sw5YvRiAfY5wRLqUFAOY+x5FNgI3ENVvnG6nHJM/PDDEo+XfFvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfuKPZcv8Es39N9dVwZoeSvF9UKTj+ARW4vMHuWkoWQ=;
 b=HQ872p4vdC6+dVY0Haw/Kblb/53HcL9rb5fDNL7aDoi9eYqR3EkR6Ylt8dyvy+kMc7Nqd5Kzs4EbHYO5u5yoRCrTklw6No0nOE/7C7qT48n4m7I3OPU/lNOKKYoEfFq8JmSRzxEsM5IIiYBVo8RTZ83C3+r7a//fwrGKtjmSxgbVYrNl0WUagB3zNs0l5gDW2JY2wFQ+kcfAIXaD3j5ZzfH+z9GhW4ztW5G+MszBlbPkfX1gSp4yG7PnCBYvgbJdCxv3i+7Ud+NiTjYjcyVa07MYmoR+XIPTuAUAi0/zB5yRoOryUcTMjt4mvLWwC2mHtq6+4DG1VnCY90tcOmCK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfuKPZcv8Es39N9dVwZoeSvF9UKTj+ARW4vMHuWkoWQ=;
 b=ZTUz0eUcQKVkeENBrMvTkeI6BtfjfVYOnEbmbdPknaTT524Vqs2paTiPGyMIFW+oUi0rJecVdwcGMlD+5ulCeiygMU4dAguzmbmCiU85AE2bOWAQTLSqDM4dxhyjLbY400qoY3GaX8AG7GZ+WZfJBrMKUkvpINl6y7IlsusED7o=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB1347.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.28; Mon, 24 Jun 2024 09:45:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 09:45:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Topic: [PATCH v3 1/3] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Thread-Index: AQHatj2seCPelzsMQkiZPcoLgTurKbHWfqVQ
Date: Mon, 24 Jun 2024 09:45:27 +0000
Message-ID:
 <SL2P216MB1246EAAFD8C5B220CDBD385BFBD42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
In-Reply-To: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PS2P216MB1347:EE_
x-ms-office365-filtering-correlation-id: 056cd345-3513-4040-a653-08dc943260fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yX1/EPsLQdVZwmkdDTBtH827q0fVJkxVgHh5Vc99kXth5+MgEwFuu/iIsllP?=
 =?us-ascii?Q?vmFs3KfBPCikpVoNhXRLjAqvVipAqoMQsvgj6czH8m2/lXcl1U+czd+uqITo?=
 =?us-ascii?Q?bREbC0gkdXnZ/wvElHXXU1h8fU8lH178tBLN2AwLBj6dwVwN59qt5j1uSa3J?=
 =?us-ascii?Q?AejerI5EmCOcXCx7CfuPbJaMI3NBgrZpcRwwiqCat8IAXzCaUmMu15FeKsjE?=
 =?us-ascii?Q?wncrN1y/Wq+CGKsoazHTINQwPfjPPsCS6JDhE7bjkK2hBFGm3VAIp8ys1fPy?=
 =?us-ascii?Q?6g3iAcQmZZGcdYVaJ/2N4xYDoc5kfPWHMYlwSqGDs3nE9Pu6Fb9FvsGG/c5n?=
 =?us-ascii?Q?IkCkMADRwhN7yRSyIR+oxteGP+Dw0bthSAt2cSJ2ZJDhyDX5RFgfYsMYQjnV?=
 =?us-ascii?Q?W7LMDXR6xs2Z4x/CjrtKIpRPz4ih5VCJHPL0bgcu5fyVpEVEQ6VqKuuh7Bin?=
 =?us-ascii?Q?MqmV8RRAFEAQPNYFLu2/82//ZKtTayaml8BJGI4LPT9N6u+TyeNYOanxVYl8?=
 =?us-ascii?Q?QqTIy9hbgy7AnrEIkHZD9HiNF9E8G5FbeE46YPr9RgEQK1Ks3Z8HzD8R3D4c?=
 =?us-ascii?Q?un3PAwMXoQ4gv6Bs5ex+ciZ92/z2HyxoY/ZG2KNSmqeGj7VOxd73/CZA3f4U?=
 =?us-ascii?Q?3dzw34DjbKOybjjD1BgQCMZumYV0E4lLbHji57hx4puPnupxJCyisalaW/ps?=
 =?us-ascii?Q?d7x67wmvvH0t6/2UKfvgPtBUGz+LwMwg4imLMe6TUV8NCQEOoLDt7F7s0+nu?=
 =?us-ascii?Q?VkWokOP1M3DCI/2qUb8/svExurG6+bQ9JkGGX/iyKXSXsrQ6jHzgOD8IycKM?=
 =?us-ascii?Q?VUJgsoCUp4VwDDdA81TZeTdEmuR0RkQKcfULOduYQqYcYPiw313K3pSGK9rP?=
 =?us-ascii?Q?8zXp3EC1GVrURaw+S09vLXCEajT/VnvxF7oM0Ol4OvYLNosmdC2Lu9Qdey8T?=
 =?us-ascii?Q?cyTpOdFB5DWG2yw6ts7ctxR9E2CukwFr2Mp8W7Hp2Tvw+Bj/LMHzbjsuj0gT?=
 =?us-ascii?Q?bPA4lXOP262DjTU1tYfPs2eH1YafIqd3kbTXfjffXPe/JUNhhP3P/ZwCfl2O?=
 =?us-ascii?Q?0NezlMVj4BsOedWaYOEmFQzqe+v6o+nuyahsJsG3XJlWqn9ZezOxcECHbnm3?=
 =?us-ascii?Q?r0guY82JDka5Isq+0gb6dCaQUGPUnx+KrX/pS0WX6rjUmhzHZBHl63K49JYc?=
 =?us-ascii?Q?ZeKbP7zN1tnuzgOJG4R14DMhGKhEslR/I63dBgsVRzUnQUypgWJfRl8Sj+J0?=
 =?us-ascii?Q?6fpH2hjiMYoL3IjRkWbWRG12agKvLlE2sVAtS2mt7uYtvvIUragCVW+ZNIqf?=
 =?us-ascii?Q?l5YZWV011WU5WwjLwWB6EeGcR4eKQfLMbWi3qmrzuGjcH7R8YLx9BHCsDmf0?=
 =?us-ascii?Q?In3nk7I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NSjAr+zYfzN6CGMnQEStkYBIskuNE+Qf3Zd7/M60D0hfcQ2RSbMHXUSm0OPs?=
 =?us-ascii?Q?yLC7eyjBgpHord8o+rR1fOo0epm2JvDFvhiQV7CI4iVKUieSCiESMcoA3D1m?=
 =?us-ascii?Q?VKN6jmWU/Qd4ez+Yg4+yX3jxr9CaHOC/sH6ycV/NsT6lud6xuPvEh03Z90Yk?=
 =?us-ascii?Q?d20fkAxomdrCdba+j9MfeDfZZQDj8znmxGQImhI+UOCBf5vbOq7inBXIfz/E?=
 =?us-ascii?Q?SfNwIaRGBQ9qDMr9lOd47JCmQ7HuAmbEWDHN6u7s+W8rg+CK7nYzTfCY1PJD?=
 =?us-ascii?Q?dFGEhY/W6yN0X86vxkMQi2pybswoDqq35hHLzG6C8iMF+a5OtZXwECrSmzjw?=
 =?us-ascii?Q?/OdU2X6Ry+GPc03VTCQUVN1eZeysIbkcl6PoTqiY69ql2h8jQpxkgpYavnya?=
 =?us-ascii?Q?QK/zUGXqWf5FDmPi3VaovWBTHLd8oYfHe6yABX0QfZmSv5N60bTFL2DQpodQ?=
 =?us-ascii?Q?isPO/WflLviMZ3eguvPqBRyk+vLQ0Q3ipMGIMqULX05xqEbeF4GPLa4gNmI/?=
 =?us-ascii?Q?4XZRvmdV+uvLo5kwE19Mq8MvL9hgm5gm2hnuvbcgNp/1tZ1RIynyA4wvnfBI?=
 =?us-ascii?Q?yQAeIPjR/tWJb3t1hG+DvyLGcgUW9Mt51ETN3IPhDE1Vww25161JUCoPJvHI?=
 =?us-ascii?Q?m/hp/hdRKd/pqCti+BOF7RRVmFZbzfI1QYZ+X/U32MBs0tkSxVr1WIOaW3Bu?=
 =?us-ascii?Q?uHH9LBo1TuNCTlFT0lEBnqXsUDBh47BFU8a/QIdCPszXi4O0EdZOcM0vGbt3?=
 =?us-ascii?Q?dByHJTAxqfl0b7roWpqU0qmG5nUTERPT7EO+PaPXwJzeDnWPfJlAqMQYDf1v?=
 =?us-ascii?Q?S+WEjAt/4gSRSlvMRs/IKUTN5kX1LF0IFEqzwOxLEwrfTP7rx/XMaCtg1G2a?=
 =?us-ascii?Q?hCWuwDPnH4sScw8zrQlLjH7uFk69XeAGJLGOFsobnOcZaryVOpC9Q+pAD567?=
 =?us-ascii?Q?mtCNFFJ7S6xN7k3+IZ7v7gfHarGJQLJ/QXfgTPxgyWrmCpSH5PpTS63hdabv?=
 =?us-ascii?Q?Vgm9F+8j+qzlyWT5GNezVcJ6jfBt0v22cKj4Vs+u00Sv39qR6Qe8NHU56G88?=
 =?us-ascii?Q?znQzEWjpwsOaf0DsvUHuaezypp/uGsJ/VB8ZALi1m2JFoQDbcMgZLmD7WWrC?=
 =?us-ascii?Q?pSFxRae8Cm7FG5Uso5lB8C+fGS9E2FpxLLgYZp33+qxbZzBDDhqyEGZPDBzP?=
 =?us-ascii?Q?U4daEszyu6UNevSe7+Zk5xF3iv9vw+MFcBUnUIMbM2Gppv8BrEUbBvivzSt9?=
 =?us-ascii?Q?Hq7bnF4g+yJsIos2gjv0wgXoLWA1b/+lR8nRGQcivZn/jO36zac8oTQQE3Nj?=
 =?us-ascii?Q?akNQQ2WtdiEEk0XJmJeuLSmBEtzVUiA4v0k+JIAuXHtefLSr0IbSR8BKOX17?=
 =?us-ascii?Q?/fbBub7m0UehnfoOoTlD3gbLxvs1ZRAbeJYQMfgkUEbVaQ9LwywhlfGJ3is0?=
 =?us-ascii?Q?ONe+v9YexsHNIl+cTlFRWmNQWLz2a5o3nSbu8nJaUwgHc3511/ppKbYW/Z11?=
 =?us-ascii?Q?yw8mQ/EDHXmcWzU2ZBrFIZ2hG90IeSqsG69KXAsdBI0LOuoaM3nvr36TlFg2?=
 =?us-ascii?Q?uBSUhtVtGQSU3Z40QiTIZ+cWRS1UqzR3A2lgtbiw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 056cd345-3513-4040-a653-08dc943260fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 09:45:27.5847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGR0Le5BCZeMzK6z4FWIBNseAyrrNvSgZbRFClKgMveipXuo+mJqW5y1+snhClzF6t3U3BXFGb1SvvwMCDsKWPsC1sK4RXKGGPem2R0WL3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1347

Hi, Hans.

Gentle ping on this patch series.

To recap, the previous feedback included
- Adding a comment after "V4L2_BUF_TYPE_META_OUTPUT	   =3D 14,"
- Fixing a build warning in the venus/vdec.c code
- Removing V4L2_BUF_TYPE_VIDEO_OVERLAY in V4L2_TYPE_IS_OUTPUT()

I have addressed these points in the latest version of the patch series.

Thanks.
Nas.

>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Tuesday, June 4, 2024 2:11 PM
>To: mchehab@kernel.org; hverkuil@xs4all.nl; bryan.odonoghue@linaro.org;
>linux-media@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org; Nas Chung <nas.chung@chipsnmedia.com>;
>Michael Tretter <m.tretter@pengutronix.de>
>Subject: [PATCH v3 1/3] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
>condition
>
>Explicitly compare a buffer type only with valid buffer types,
>to avoid matching a buffer type outside of the valid buffer type set.
>
>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
>---
>v3
>- Address Han's feedback
>
>v2
>- Improve commit message
>- Add V4L2_TYPE_IS_VALID(type) macro
>
> include/uapi/linux/videodev2.h | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/linux/videodev2.h
>b/include/uapi/linux/videodev2.h
>index fe6b67e83751..51da63173a98 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -153,10 +153,17 @@ enum v4l2_buf_type {
> 	V4L2_BUF_TYPE_SDR_OUTPUT           =3D 12,
> 	V4L2_BUF_TYPE_META_CAPTURE         =3D 13,
> 	V4L2_BUF_TYPE_META_OUTPUT	   =3D 14,
>+	/*  V4L2_TYPE_IS_VALID and V4L2_TYPE_IS_OUTPUT must
>+	 *  be updated if a new type is added.
>+	 */
> 	/* Deprecated, do not use */
> 	V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
> };
>
>+#define V4L2_TYPE_IS_VALID(type)		\
>+	((type) >=3D V4L2_BUF_TYPE_VIDEO_CAPTURE	\
>+	 && (type) <=3D V4L2_BUF_TYPE_META_OUTPUT)
>+
> #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
> 	((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
> 	 || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>@@ -171,7 +178,8 @@ enum v4l2_buf_type {
> 	 || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT			\
> 	 || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
>
>-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>+#define V4L2_TYPE_IS_CAPTURE(type)	\
>+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>
> enum v4l2_tuner_type {
> 	V4L2_TUNER_RADIO	     =3D 1,
>--
>2.25.1


