Return-Path: <linux-media+bounces-55210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCSeCSZHsGnFhgIAu9opvQ
	(envelope-from <linux-media+bounces-55210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:30:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63130254CE3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F79E305F789
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC63331715F;
	Tue, 10 Mar 2026 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fMUpp49C"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CB2BE644;
	Tue, 10 Mar 2026 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156307; cv=fail; b=d06F2wB2FtQuwHbVqWsKxn6QkEUHeObGiw6SoNMS8PMkYScBzhLqluE2Pal/m7non1wJcQ2Mr9utV26xaVdFZoere0hasP+klTLCh/LuSIdaOrvFn4I0c9+acpoWcTw9vzgDzCCvRcToM2LUHJmGeZPc/BSlkpp5ivYM2xxDips=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156307; c=relaxed/simple;
	bh=Vsr+pTBpVX2FqiEhO6Z6j5N5h1BPKdxv0OF3LVgkp0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PwVijbz2LknDt4E4v32rTPExA98NzIcdzLscP5sPWyj37hyK8qSRckaatbRldG8ONoHVM/kQuY9VlUB2J7Q7A65bBmi6csDcIEma+3eQZ4WOOf1zYMX1FqW4zsuI+9L3foYlJS9QwGBskomf5XMGRgnl3ZMQ9CHjkKMsIzHbW4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fMUpp49C; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrftsH6gt7wbdIESYbbgc2pPfDpza7WdrUpSFlJEihXgRsGHxhC9IkRiQc+xhztznXtvNdVHRgo9MeYAQKlPpTGAJL7iz41pavsogkOEw6HwUSDVO0aUnp1kp4pJUeHNXeNatNfi82W8JRtlJPbHTTHDGhM856ITiamoixumrMIcqYCw4pCEwUkoSkNxIQBE/6tHKdO+HnCdLDyiqJ5MUpJor9eZnfN1CNCNk9JQiQeKAkfNA8PssmR36dDgnunr9/PLAsNXoPlH3aSBaAzS34f/GqOaXQayyZQumjaC2hrcHIOclnaio08bwWvk1vlqKk5Oae1mQJcdbWDTIkGT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFvBBF09HzpavrT0idzpXaQYjC5P30xPQnKF7hvT6nc=;
 b=Epjsf7QQ8QlQSAW2AUamQyCdts2CasrRDESyD70/Mk/Prkax20gNSrFCLTbqdgTQoZqC4HCrlfkzVfIpf5lsFgJehVHcrcJY6oPdV61bH/LqXPRKKz3GZTJCSxp2FAgferx6m9C63pgDGeP3xE2LA+XBKCdKLNVGvJUlzNkEfMYKqTc5aE3wKWgEMnKv/g3Yk1dVSKIKNY0nCf1mM6m4Dqg/iAUa+4Ft1IVdZgxMjU+1thx2mOOOMU43I+hM3Ycr4l1wgfftY3TfHv5i8CwFDCrICjrY2zQyI8C0f5qd19ABOdJNoPnAgHzZ3SGgr59nqxGEKxJwu0fj6SIRJnbW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFvBBF09HzpavrT0idzpXaQYjC5P30xPQnKF7hvT6nc=;
 b=fMUpp49CnDGqF8JALpUB6bmqwJAXgihKN6YsCbL67z7twOc91EZYHL3uiP7RUn3Hjj9DAg2Zf3IV20AOVW4hXAUlyzY5l6UsWpTHec0UA8qf/pPPWHEYugICc6LvT/IYUvbG6YD5VLTHQ555gDmsDZBYbCIFDu8f1+u5rq5uM27QqGrovpdvVxP+92HIaLAUiWG2nb+CMluoQO0CqDah4oQ5z2dfp/UJFvENWRAFG5AeMWr7WZvn5DixD8j4WwoiAi0z6uJQfbr9QVF17IjoDtyirpNqenqQZnRMl7qSlp5Gp+nsSfEMOoAbLsUMeC4xn0SVee+GU6vcPpfxoLxoHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6777.eurprd04.prod.outlook.com (2603:10a6:10:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Tue, 10 Mar
 2026 15:25:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 15:25:03 +0000
Date: Tue, 10 Mar 2026 11:24:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: imx: fix parenthesis ending checks
Message-ID: <abA3u_krm5ujJ8iG@lizhi-Precision-Tower-5810>
References: <20260310002643.27465-1-marusik.adamenko@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310002643.27465-1-marusik.adamenko@gmail.com>
X-ClientProxiedBy: PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc3bf69-f8a8-4f69-24ff-08de7eb93299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|52116014|366016|38350700014|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GYDNNvqpezQGewUqb8U8UYxLCsP97QmJBy43tzHjlVsmWiBJdcL49rTFWQzvnWEY+iXU4MQ9gAFhF27CkAbvASDn0eorjfT0sV80M6xK9Vb+B4seR/aWustiMgmaG0bIlLUuUIUuUOw8/rA+5XzD7Pq3HegnUQIx+Nuc3xMDsKPdIqtb1CuFQQTfTyWU7tqN3SY1/4qizkz1CtRmT2rilsoS73q4te8lKpW1DhSjp/YMN414pcLTfecRNUPMbqqGXHdIdzsUXLS+x0WcI3wKAhFSJQPpMHt+/XEq29YIk/k3kMrtIX60D7N91PTwBv39N2nklYTCGnJX6vsaj6Jg4YKJHaH3ebWbIXjonZoBNMx5/5BSiDvk8JaULsyErNj6ZspMPvEmEBwQe/+2NVhonX5AGRMxM7Xi+KyBsTHopAMUqc92MOpVOIqDPzeRLMkQiGoZcwppCe9kG2ZRiseKh32gOA0K4hKjrz/Z3wrupIxbJ42AKx2Ep1by30i2WHmwp4RW36Pn3PjfgrILPeJvfv6zqwJKEficg+cAxu0Vu0haEL0ljvRNMdyB7eNG3aAMlmA7WjhVIOs4siOVlDp0SRT6tC2tfH2VlOznNcjSZwPI+bUUWCal128eLakePS0I607xY8ERyp/czPYTpoFTYz00eleTGZiXpb1RpAwi4i6RPZGVs/YjtY7YFFg8sJteQ4TjykReA3Ku3bMNPjD5bMG6bUMicPK+9IfM5RVrI6XmVCCHmFE/4fYPyvk2glIDbBWn3/ITMZVy56ortEdampohTSK/5oH3Ekh+hen9hlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(52116014)(366016)(38350700014)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XqTew4i6vsIJJjYpSSmcSMVe9PyyBivom/8KW2i41r3JHYJtLnZRafzB25vu?=
 =?us-ascii?Q?BqNnIXU5pm7Op3gdoV3leMuNqxqIuCtTPtYexO2KiVQbvkK4k/j5tfjHbH39?=
 =?us-ascii?Q?slj2+1novPrFFlelV0HVg1TY3LOao682D3D0wJPwvXJ/LU9fRUFaFinPbOR8?=
 =?us-ascii?Q?T1I7SAvVQyOxnHrEKXccjC6lsKN6ZBBy3F9lhqi30VHEunhaB5tO8jtylodV?=
 =?us-ascii?Q?mJXFegdNtg4McAL5pIRh89l0GYgQt5CCRsOOjPXp84Si/MrERNryBOAJAMf+?=
 =?us-ascii?Q?HdGL3+P2OSBc+Fpgu/r1oL26NXN0gJR3DgfhXxpXrol9hZdYjXTr8opLhyuY?=
 =?us-ascii?Q?IjU/51BR77Dw66AOKrATyr1i9b+093MYM2WGqMQYLkc96sU05Db79VdX3gI5?=
 =?us-ascii?Q?fTZuKo6Y25uqS9PGXdOFB/a7wGMhuZ0KXQXaqWBAdZrm1BzI2QlwSzs1DFHp?=
 =?us-ascii?Q?VQN90Vz9jy9LM3D+4oAel4naPnjZmbIRu2433FerUrzKodk1K9F4mJpjuhxE?=
 =?us-ascii?Q?keG35mmArN/KC0rzrLGygCmRH2txG8hhSGrhroz7UCQN5+6zzlcTZjzB3uP3?=
 =?us-ascii?Q?RNUvecUJ548vxaSi5cUyCDzXj2bhLFWn1JI8nj131guVkaSo8p6I9zd1ACE6?=
 =?us-ascii?Q?SPCZ/OvC1TkZQ0KGVr5CSb7o38+gi4y15ZGs1u0h/V6hgnKRQlNhaSPUo0AF?=
 =?us-ascii?Q?95g+KvAPfxFz3sLSpEs2ldcTTL5xXy79KLT4xTaq645RqQmQj12B3VBr6ZHS?=
 =?us-ascii?Q?5/pRppQEeQG2Fr9j+kQDWDPjbjC4P9IAUhMMmty1jZFfvIHDSIdouZ26dKdB?=
 =?us-ascii?Q?OvXbOEcggFHHVpeG5DuWvYdko92zd8hrkZNuGDBl8BxPjfD135kvTrjvh8T5?=
 =?us-ascii?Q?HIa388A42lkZF+6kSy8w3EwNyuqQ1M4OesfZgWlwlmY5fsqKKspI9j8erzFE?=
 =?us-ascii?Q?jOQlKFNRJVPu7EuIot4eKiphrCRTO9fMFxIe5FmJxGEcOKghCaBzHvwB7Zpd?=
 =?us-ascii?Q?sKGw7FqxJHEGRzYQpzgQJ5KsEvNqksrcyIDt0h03v7YRKJ7Osxey9iYNtSCK?=
 =?us-ascii?Q?jjkU150UYjQShylamx//zGLpS7xSKFhjeJK9XyommJdOvlXK3Pmms7nWBRdf?=
 =?us-ascii?Q?5Nq7jxY/+PsDtKg/5D3Ij1LFwgm0C51WynDhlpOJ+/ePKJauO+efpfsQVKZ/?=
 =?us-ascii?Q?L/IX+TOvtI3vJCyv9JtvwUIlN1njuUlf1OMu+LWAevmG6F6DEYHOIAnKEHhE?=
 =?us-ascii?Q?I9htOMPlyDcVFtu3WjTJjr0lJSmICawluOK7yVQd4+PUKHRtgHxwDadilYBh?=
 =?us-ascii?Q?zGYXemsha0DWHKJe975cLtB7i3ZjrEHYpp4Z8kx6qRY+PgIfoaKa4lISke8w?=
 =?us-ascii?Q?+4zlx+yIqtzGtuiS33uv2ji3xLeLYfFmzNAexCpi6yuRT/4ybRyDbTJzMnQN?=
 =?us-ascii?Q?V28oCR8LuqZwVs55d91h0CUTw54hNfQR644bt2T8wGS9RqCZm6TRjKvQtZp2?=
 =?us-ascii?Q?7hIhO/Oja+aHPMHpMfCSvDKieDxbLfDYh7VQzF5OIpigiPiF2RN57m/UJT7W?=
 =?us-ascii?Q?yL+h4B5Dm0cWaPkMkr6b3kMSNWDusbuU1HeL0isVxiWBrchEkUQd+E+Ubnxy?=
 =?us-ascii?Q?DAQz2NypH157UaLmrhhtZWgMYUhYDgOeFo0MMvTN7SB0PuPYGO6U1WdEp9lj?=
 =?us-ascii?Q?o836n+8Yze7PuqdyKu+/h3O9q2o1okQtCM5nFvqJiOeIFZuQIsA3G5Y54rRJ?=
 =?us-ascii?Q?h+cir0L9NQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc3bf69-f8a8-4f69-24ff-08de7eb93299
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:25:02.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugzwRIQrVEDkUiJECj4UT2mZkN+dvw96VLksudbcKInqnoWvCFb/Pj0XE+70Vmc4E8zMrC+Rz4W8vrW9DXPzHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6777
X-Rspamd-Queue-Id: 63130254CE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55210-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,pengutronix.de,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:26:43PM -0700, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing unnecessary
> line breaks, and forward declare a variable for a function call that
> would otherwise remain over 80 columns.
>
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> v3: fix commit message
> ---
> ---
>  drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 77360bfe081a..2339b59af7b0 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
>  		buf = imx_media_capture_device_next_buf(vdev);
>  		if (buf) {
>  			priv->active_vb2_buf[i] = buf;
> -			phys[i] = vb2_dma_contig_plane_dma_addr(
> -				&buf->vbuf.vb2_buf, 0);
> +			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
>  		} else {
>  			priv->active_vb2_buf[i] = NULL;
>  			phys[i] = priv->underrun_buf.phys;
> @@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
>  	}
>
>  	if (ipu_rot_mode_is_irt(priv->rot_mode))
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
>  	else
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
>
>  	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
>  			       prp_eof_interrupt, 0,
> @@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
>  static void prp_stop(struct prp_priv *priv)
>  {
>  	struct imx_ic_priv *ic_priv = priv->ic_priv;
> -	unsigned long flags;
> +	unsigned long flags, timeout_in_jiffies;
>  	int ret;
>
>  	/* mark next EOF interrupt as the last before stream off */
> @@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
>  	/*
>  	 * and then wait for interrupt handler to mark completion.
>  	 */
> -	ret = wait_for_completion_timeout(
> -		&priv->last_eof_comp,
> -		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
> +	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
> +	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
>  	if (ret == 0)
>  		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
>
> --
> 2.53.0
>

