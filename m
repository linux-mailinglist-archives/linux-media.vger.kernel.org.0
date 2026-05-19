Return-Path: <linux-media+bounces-62188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMM0CpDXDGp8oAUAu9opvQ
	(envelope-from <linux-media+bounces-62188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:35:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182A5853DC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1374E30805B2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 21:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C43E92AE;
	Tue, 19 May 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Msuio9me"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFF41C62
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226488; cv=fail; b=XsWGs6oi6ri8FShL4fcDjceCODT6nGgkF6+FVZs46ztd+rcN5o9IG8dkqAtGQGSCcZwmo/NREOS4m2WtwMNNXpyYh/FaDyKfbG/PchQLspOAQtHRqzbdARwpUHNRjFl+ooKE5vKKus/59PpiRs+l3S9UU3qpQihfYqa5HnYlLZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226488; c=relaxed/simple;
	bh=HNQdkxkcQ+LNrzDVqpuLeNmad+/iZdVya/6xaVjFxuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iWHXrLnaf3shP7yJA1OZGh2JGt4735/5qkUY+DZXBOcvVXf49RUEdJ3KVGnwYO2CjUm1HrvoedZJY4KE0BeTJdHS32Na9YsDjCzroDFsVZhHYrR+90OjqBLAWQUX2yD5QZLIaY6mRybfaNggzgXkWWbprcw3HRmYL3yViYIr08c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Msuio9me; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwmfdaov2COCaxXGSvkpZrx+ukgFJrhfg01WcxE8dz55fR2DtB5oipCOmVrrGunGuybk2okPTQDRDL/CqQz0gWSAnp/5wzJ8WvVw0GaHrKA9IPDPe/72ldl38mXcWsdYxqZ8BdNFWFQMU+WnEtyJWLm/kt3YvFcD7hNpFEzMdpYQ1A7YUHnqBR9JxFXdDBxa2KcNpVnfvwtxG39jiNQh4gdvpSUKn2ivm7hGlSl41LbtBNvUaMzbQ92q8/JqB4+QLUmnoaD6M48czfym0etTO8Ov6mlZ22QGlGkC2r6XUlqtAZ/0fXeDEHsyNYhLg6TKCAQmhX59FWa0/JdtjyPS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqmGzZcYQvZNtp4Ar68Piqcia+zIGS/o/EYb2lh4xPQ=;
 b=K4zUL4wP4tnZ5xMW+Cd40Ie53wauZhRKZATYSfTd6klCx4nUbaWbYglIufzn/bRg/Vnm1XZww6nDAC3aVAIT7wSYwibP/Av2bqDfLKrIGwp/4Ap2rCwguwyD33hVDuOl0qjrYNCk2H7jvtd5/0NeH5RxLrrVqbLcJN0J59R+NXkAG4zbC6h+WvZVaVUS1ejZf7u5jXr8C2OAm8TaTysDkMy/juHzPf2WSacshmtZCNhKRPCh4IF+eYgG8o1xYXnSUIBRZquyCjikSz3dOTEXDSDZv/a175uF8idW99gxpEp+7IEJTGyi7HlthV9bPZamEu0iWPqLU2RmVydtH3so5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqmGzZcYQvZNtp4Ar68Piqcia+zIGS/o/EYb2lh4xPQ=;
 b=Msuio9me2trtjtedQSY30p+laG6CPCjVRG33ggK3In2NuDuSAu7aWghGqbZpTX5TZIao10EmVrQltAwswIGVCWh9YDwzuZqkTTCSIUgp0tAgVd/1+zs2YwfnRYuxUDgcIeNR68yx1uG0chirvlIRVEddw+yFTWKcbQ3qkF5GW6a1hNuVv/NNLOcLVo1yVukMCFIkMCvZE3BanAnbG1TGstYe2Z6vdgfyZ+t7Oxgew7UI0kHTGyaWBWUOuYLK86W+QWwDAFsHn5EHe2DqlOtBkfRc1+BAbYPrmC+0vH9bzBVrbxA7Muu84e1lSWYJiBppYW5jadHrRfZyjXn189YNgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 21:34:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 21:34:43 +0000
Date: Tue, 19 May 2026 17:34:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 04/17] media: v4l2-subdev: Allow releasing frame
 descriptors on return
Message-ID: <agzXbQpxTuXx3Tqe@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-5-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 16824060-07d3-43a9-8e35-08deb5ee70e2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|38350700014|4143699003|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 S+p4K1aNqvMYcJr/0l+677i0LDBBjOwnvHRsMOFxLxSQgeKN1s2pZ3k444IlJIVnQ1Wsh/sLqKTXBpgeedUOk6GWpBuMblYptY2tU6X66iHqmgFYd+ODGy1cHyeS1BBZ7ZDY+Yb3vMyHgL0AXV8n352FJnBNdu73wVV2ekxPV2psPTb2GA3BVM19qu/zUo5cNex0VGyOGWZKp4J9pFJFrCYOiid8BYqF9qzHFlxPWcsv9JzbWGQ560NlWojWOcrYIqiC5EoCgGNbob2+yZQs9q8evXF0MUY81cpQS15Y7s/3Zb7otBeH2oraQC2S5qGFxplGTyAUd3ePGns0FlNCoPhvZK64vVnoRqt32LF+tF988IzLHPnkVbvoUTzbTeB2nj08XjqtljPgEwPOp7r0EeltoEdQelfKte+hGWmoJ8kAT8sRjh2UZKoeLOTFoooOjAo1cftRtJD3x7v9GYzM4IeJhiItAmrC0g7nM9a0kgg0ZA+RKAmJI+hSzcvs/J+FvrLUTQux5/3YBcz8EVTYcho+4vusQLsEsa5WHcduw1NnnBx7/9qdOoNDdMDHnj2o08RgRz79YYHNx8ixvSO6DWl6uHmBd1uSHDaH/dSRmZCsPgFpwUocsw77DqnUn7Ux3feDbXf94DbEjXgpIM6d2a+6DJPIzPNRX0k6sAhoHDbbrJCNSQTf/4JmTgtyi3USu4ygyWA7Ifeojeu7P/hGrsYxP4GWv0HBjzydtsstCQFAE1lMCfQATLfNC9yvInjY
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Tdq4EbUq7jB8bAj2FxQQWnVNHVJWEYpkjzY5t44mqEnmesMfXRYw8rghTVsb?=
 =?us-ascii?Q?nEKIrHOp8Vw5zMWXVesSYpnRzXkhEwVLeJ9lqd6C5GFkCFVG2CewWzsDBeTi?=
 =?us-ascii?Q?2ke/AAPist1K3oEEQ/3J1FnXB6iEcUEQIFpl36Jf5LOXJ7aE+xn84NMUtfBC?=
 =?us-ascii?Q?RYcQ/2VJurRh2DN11MT8LqfXbv9I8SDUlNeOvJokyo3FLqDMyYeoeYoOo4aK?=
 =?us-ascii?Q?akIj7bowLfG2STAFSCv1JHhfD6VYGw/IUvhSoxoIwqLX7ztqBhGghGzFCHlg?=
 =?us-ascii?Q?0wKYWlaBUR0UxKdrvWzwjdA12aHaiJCSUfd8vrKTlVgQeOK2E5TcwQaK4fBc?=
 =?us-ascii?Q?jE11cU7o6E1H6yDcDF3w1CN0uMgHWzXcj9qIWNIAKNmYujHFkTaZ1ntBrEKV?=
 =?us-ascii?Q?jnfT1UybWTxF33bvOBeV7wJFqQQXQ/i/9NtSaa5YkRUOO83CXScbBxDXh6Ih?=
 =?us-ascii?Q?krhZsd0V//pa38pGw0WiAmezIQBt7jclqfJeV67K89cgIigaaCegySZd8OX3?=
 =?us-ascii?Q?n/6CcXb4HljHctcY0+5AtnOPFqnE7TDFMLHUQK6DQZarJ4CwmnABEKUBlWy3?=
 =?us-ascii?Q?/k3AFKvG/EBeAPlzG0qWDLZY10/7auirZUdwX+GpMpfHREgRGX68JxhVLEw7?=
 =?us-ascii?Q?qY6y7bQGHlpGTakVrf3T3gXT/ymNryvZ0NaFka64bEHUhzcbyWOEWfU1bUjz?=
 =?us-ascii?Q?b87ObekKyYoOrAa8FogEpozGTEXIHIggetCnzo+a4ClvGpLLkiEwtQnOxmwL?=
 =?us-ascii?Q?jcGjgYCt5qQRcd1KorzoWu2Aoax7V79aehPJyQSesLe1hUApARv6GIDSPC8v?=
 =?us-ascii?Q?4vcieirBKAnTSo+iSqQezv2rYchKquCNlf9sOvHPlYg1PXkNXvH7j18IbxS0?=
 =?us-ascii?Q?+lqAr0nOmf5BUCNWbBNfWigH8Z5RU5M0b6iSJW5Hx1fu0lH2RbNx6YaIQM/w?=
 =?us-ascii?Q?RxHC6jyKem/Gm/UH8uaSfR6adEp6jZQwTWaaS1OQz/5IMiy/3KmUIS/HrZex?=
 =?us-ascii?Q?CxFBl913V7fPngIo/ej75sg1yY+psgWC72AFcL28BcQTW4KHMNVNPN601mWv?=
 =?us-ascii?Q?97AclNyb9Y8dIdEftEeoBpkWU2SPuur1rvUfYDKVaaEGx/sr6qFOVLX71lH3?=
 =?us-ascii?Q?jhwvWnoZ3H6qDEGXDAyX2VOezXOmr+dIlH56ubIJ+I1NOWx+fF5E/raWDfgs?=
 =?us-ascii?Q?RmwFMKNzSDyy75KOejGiApxtLDWMBzqxwMhq7k6PznaFWXF7Yvs0IIYVSZ59?=
 =?us-ascii?Q?kmTTssWnTfpQuMleywo97jO6qB1dPqOicIJQMfvCA7lHgqIWEMIfqxmNTPLL?=
 =?us-ascii?Q?ziYTn7aNtOnFZy0wNXU9ClCmspBNAbImH7qdoIUXIOjXdNbxB+1KEUX352UF?=
 =?us-ascii?Q?BE90bKSDPCwez5x/D+IQf5JfQYAAUWSGK1rcwQs1UA9X0GPvpYgL8PhGDqIh?=
 =?us-ascii?Q?ndTOyjNhDTxp20GASGcQ+2r0PL7HwrQVCBEwRFQaTUR0dmViDsuHVF5azG8Y?=
 =?us-ascii?Q?z3ZORmV7LfeJYOU5foQnYZlS8ttTN/lTR3eJsv+5Tod7eo7WZceS5ENpJfAr?=
 =?us-ascii?Q?I/UQmNMMowWTVRHddLFI5llKcCAwqTrdrMin34Wcb8eBsJa5A3nrQprKamTU?=
 =?us-ascii?Q?u1tLfFafrrYPVhRHNoMrjuOiO5qfqQY/bdPhovq1nZq3T0cErMlvFT58aQP4?=
 =?us-ascii?Q?gQAamGom2nA03/kErv1gWLTh7IFNmnBG+RidZynefgN7FeiK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16824060-07d3-43a9-8e35-08deb5ee70e2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:34:43.5260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2skPU8ABrN3elWyBULj/0LR0Xkt+gbDlw0YhOXPvDos5ASNweYMVEmMv5lUq9kQFvmqumkt4mPvd0N2L7sP8eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62188-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9182A5853DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:04PM +0300, Sakari Ailus wrote:
> Use DEFINE_FREE() to allow using __free() to release frame descriptors
> using v4l2_subdev_free_frame_desc().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e7127953ac22..c10ca3f5d979 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>   * for each frame descriptor obtained by calling this function using
>   * v4l2_subdev_free_frame_desc().
>   *
> + * Use __free() to release the frame descriptor automatically::
> + *
> + *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> + *            v4l2_subdev_get_frame_desc(sd, pad, desc);
> + *

Generally, _get*()/_put*() is well known resource manage pair function
           _alloc()/_free() is pair.
           _request/_free()

Is it a little better v4l2_subdev_request_frame_desc() since get()/put() means
have ref number?

Frank


>   * Return: The frame descriptor on success or a negative error code on failure.
>   */
>  struct v4l2_mbus_frame_desc *
> @@ -1812,6 +1817,10 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   */
>  void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
>
> +DEFINE_FREE(v4l2_subdev_free_frame_desc, struct v4l2_mbus_frame_desc *, \
> +	    if (!IS_ERR_OR_NULL(_T))					\
> +		    v4l2_subdev_free_frame_desc(_T))
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.47.3
>

