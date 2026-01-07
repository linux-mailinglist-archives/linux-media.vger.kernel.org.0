Return-Path: <linux-media+bounces-50158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A448CFE6D6
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 936C630FB12F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BBF349AED;
	Wed,  7 Jan 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WqPm+06B"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A115347FCD;
	Wed,  7 Jan 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797244; cv=fail; b=Q0fvazI1JNcxSF5NQ8vW7yMLgB6DAKiWfgp4lfu/XqOas+BMJ3p7+mm73wQqxsW3+B+/QJXpYPoWeKOdHkn9Dat7KE+XVEBXet9Ftn97DqJ4kvOfpmGanC3zbLcHFdEhNFo1F4eu3rkkottgDSrnGfWR9RZBxb7R4KlXGKb3bu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797244; c=relaxed/simple;
	bh=FXqnPrmLX0zBrCuNKqnD6fXpmR4ap3fzfNDBNMs/WtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AqexvHGXm5gUyhy58taCoT36fcFS471tdAXyDfV+Jm0FGllA+zp7OmBCPtv1ErlTy8k2PHcBq7ed0zC5iVyULnpo4cz3QiTncuof9Zar5NknKd/n0vnsz01n0Tw0E/ZpW4YTbDIRMLQ/wq16Eb//fR1ulRtlq0lzOfWD4ulUf9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WqPm+06B; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5vA4dOZ9nxJaNGUdDsbZnFzuWGuWjEFiaNhuA1gOwHWo9vViVi/Dac1FPBJR5ihVi30G3vsxz/1qPKU2xYjjbB5Pso9SmnLaD2YCi4lZH9Se3LfAL0uAEwWmIQZw2lQvwi3F7WlJgRp84x8mFCo5kFiIvYP5OVx58fMcPH3HslYZkmdkAOJ954XQZ79LBhq6ZGEPzAVZcb6cBS6Rw4ETEBsmVOWj+VBh6ijSzbZN2CHTJ1vO2Kw9utxgrjjVjUdWOaoKFk4LItgFSO/YT6LlZsZ6YqjCgpCdKaFQVzb9l6cjHllE7Gz+uGVtHaSGKf4SAacOW3WgU1mL8833r4XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MmHdWJjfrne7/47z7TarM9h80Whr2+7TcNo2ZZGiXA=;
 b=Y+lxGUhsu7DQzrDHWwlwDlFeUvYMgOrXF0pR2n/EPB0EnMDH1yFHNd2B4u5sTDJJtYOa9IXdAcUrKj6bPDjD5+jS7bWCkuY8UA3Qx9LowHYjltMPuzpqnUKVLjRA3MFoDf28OyPOb5ypRwE64JpH9cVHxftSmICmaegMhm9dNe0T+fUKf1lsqr5URlzTX24Xs4F0Sgcs2f2X55DD0xAAgg5SensEw0ZUdNUSAp0iy2pof3S6liL4v62crYhA6BMe6PYSzG4jmQH2DghtKVJV2myOGZ0Gi5OdztmpmaBcZW4pxfDRbyouTTr9ns8zCOQVfcZ/wfEEnWoUMcmxxEgv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MmHdWJjfrne7/47z7TarM9h80Whr2+7TcNo2ZZGiXA=;
 b=WqPm+06BgBUuTPQe9W5pI2OanL0CAIPHHrdYsHcOtxFI04ghwZ8/hhxqrFl9sCPPCt/s2dnDybDL2r9WiLWOfqcZfRkCZj0snjcfBbYX98porzG5yHBX7irKuoLkfFuyBVkojWCkloNTtqkpJ5P9xDxSP1cs9KL+0OfqFGqoh+F0vhVM9Jp792caOuGWh6ke20DN3dsas3Ha1Wh+iOm82rEWeuMeq4hol8J2Gr1eaDyL7d7eirAqa+YRe/Dig2fw5F0JwnjoyPx8yNOcGdbLJht2RN2mR06v1OPOrt+weKOpLDy5t8eIztdfe38bjl3zMzYrnoYdir/OHix92TzXww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 14:47:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 14:47:18 +0000
Date: Wed, 7 Jan 2026 09:47:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: amphion: Drop min_queued_buffers assignment
Message-ID: <aV5x7+QjNm+SPdTa@lizhi-Precision-Tower-5810>
References: <20251223062754.836-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223062754.836-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH2PEPF0000385F.namprd17.prod.outlook.com
 (2603:10b6:518:1::6d) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd9e6c6-acdf-4d33-ab37-08de4dfba83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b04VWRp/soa5lgK3/TcKXC5aXyRG6AfXfeWlym66MsZVOUvhuvSwVr9N0xNR?=
 =?us-ascii?Q?FWDWl0GPNle98fQ0t9GfLPoy4EXNCBr6A+fVOpeNCYzoEPGFMUBBKHylGOz7?=
 =?us-ascii?Q?/oZFyZkYoe5cYuVlolbsEp7Bt9eaYRta7MsuKQOCcj9XXrvdxAGjI7QrkuII?=
 =?us-ascii?Q?LxHlnyy1zRGDvWjNHsPnBRfbcIvkeYjhQKoDnoP4LLVDijmmKK1cLZQ8qcMZ?=
 =?us-ascii?Q?LvQKKvATq1FzJyrSGEEv/qTG3M3fmaZoVrcqp6oI/4xlUolw0I9hHGEWFsTv?=
 =?us-ascii?Q?D0AQbwQ5t9JGic+o94qaqN/Nf+WwGfCgSv9PXpyWqWW/FvVtTxMzKIdbeF5N?=
 =?us-ascii?Q?9+KLGq7GH3ZCKHMeggANbi5Czv0bX+NFBOAb3mqHVDXPf8aM/o0/XJYhbTZa?=
 =?us-ascii?Q?PEpyjvjO0+4X6jX6FrdTj1emMAy0etDu+xaRBvC2/VGFsw/LN5K9Tpjdil/x?=
 =?us-ascii?Q?07Oluajr+HPQAxgrDrQqFDzpCbl0IugqvmittYUWYPNxoYAGlQPRQeifZXUN?=
 =?us-ascii?Q?/An8KK2FFOkpXzOoBV3Ik4F2+SGjLKlE3gHrS7lL5oIkooAZ+IWpwDcYY/mM?=
 =?us-ascii?Q?/UfQ2a2ThqTfJgwdStEtjlzQdnbrYy5ovNMhGq2bEM4BxkosdR3X1VdhYxVC?=
 =?us-ascii?Q?f4pKyMzo3Fg4QsXYgTSD8JuvYIO9zAKa7XkHI4gpGJL5Z9uMZk3+Vy1NeO21?=
 =?us-ascii?Q?+yOugY/MZXk/uLT4iUXPx6lJZF6kitPAlTwIsyLP68gWd0OAXbgsWR6L//pg?=
 =?us-ascii?Q?wc8VwrEp9u68M33MiJk6Ny3s2Fcf2uHhAsDL+AjDd6dG+irFhAjJub1PoAdT?=
 =?us-ascii?Q?dq/plyPtY3R2V2Ru4DgE+Oqyb55ta3uklH1bmEVLJ448vleqQV/gG7CkajEe?=
 =?us-ascii?Q?wW7s+ZcWSOeIOKK3bo/yxRzluZTy1ER9CiQRDIvhULBttmt9z/iugui1uEXb?=
 =?us-ascii?Q?X7H1dkequnxQSQ/tfosXtUjqulZuh7g6yQDRKz0QqB1nuMgp6t9Ay74+8rs8?=
 =?us-ascii?Q?pAt1QhZ+aMlIKrwOFiAhlZrSvj6WUcg/n8EwAt1IW3ILDzLHAK8nWzrpc8ei?=
 =?us-ascii?Q?Y2rcDh81d8WrR7exOz1pVespywDF1KUT3wrgzHoxo7HbaX/Qj4/z0GsJP450?=
 =?us-ascii?Q?orUTN6XPJaMYAbY7TG62p52VCeOh9fREBi4kr9A/AA2ZmVkngaszRrKNycl6?=
 =?us-ascii?Q?1pAhEa5WsrkTxvmvAF5Pcr4eGodliEsqdqvJ3vNHoef9TQPp0wC4B9U4Y44U?=
 =?us-ascii?Q?FJlULgyKP6mQ+aTS2h+WOPa9J1E3Nh8INI+nEqpwnyIhwLw4wLbkB9qmUQmO?=
 =?us-ascii?Q?kLOJ5uYab6ngyjddcvvGnyG6BPaZaSe4eo6NsbXgYeKf08UyavEDhpAJIhU5?=
 =?us-ascii?Q?lgc+Z8M2N8un0Rlb7MIYf0/IdcGm8oTx1I8ka7p6j8ozBUGD4WpHq9oKJ4th?=
 =?us-ascii?Q?N47GF3a/eUvn0sDDfXUZ73jEd860wUxT5L4oL/B+mVFxg8bu1e4HidOJIU0e?=
 =?us-ascii?Q?22F6uEI2yg8ph5Qv9mAsQNsR9yZ0Qk7H2NzT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ug8ftEBIUAEHAET8kBPO4BqDPG/f6hqp4L5TG45WeJnxhy2ViPp6gKLcpDCk?=
 =?us-ascii?Q?mggmS1NwZcsn2b0S1EPF5kHx2ghfF16H2vdC7nbIEYGDHeaUaJlY2Y6EAPtW?=
 =?us-ascii?Q?p92kggO5AKcXVVugkFoAyXiZ2DcNyABwrxWbt7mqw+Q5NC7G+RtDyeRB7p5S?=
 =?us-ascii?Q?Tfifa3LD2nOAcFYDKZ91BQDtQI4i8ItzvDt8DDYXNFsf79nUZDUOlFMVuhh2?=
 =?us-ascii?Q?jFwiiQPoLHPjEo6CA8PucNMvlCw7vbt1ki8Y0y8knvjk9oSxwCRH6Oj4hUSC?=
 =?us-ascii?Q?gv73xgmO+sLjWrgJTM/o+ge4zJ6svfC6DQkB6casAyBmJaL2w15GTmPpilv2?=
 =?us-ascii?Q?kT8yasTPQcCcQp9IVig775IZvKgVLKk0edq6CCedzeD5DwDJh0zNeCx5Vh38?=
 =?us-ascii?Q?wU2uIL35/5qCt0lNpnA7B1F/pharaznpdCDQcQ8Qr/TsuhM5oZMS3dhupQyF?=
 =?us-ascii?Q?qTCoH+++gU3kSSSd2yK73xBmdwfEAUYlnoxUefWJJ8FX/VyPokJitgN/ArEb?=
 =?us-ascii?Q?ropXkFfx4JVVEG9iie/i8Ig/G3r23uaFEcaIE1fFEnjhIUNnlsZdYu2Epbex?=
 =?us-ascii?Q?BXjK2Q86mDHpmKFDKs5LUjuYvfx5ov2159CZHoiDuY/vvDCQbOFqGub7FhJL?=
 =?us-ascii?Q?Hr90uKKHiriC6g0HNWsSHxyZ3KKauO2Evl5SjLEkBIpygIzWNdLfi2Vl+Mh4?=
 =?us-ascii?Q?hTYiVFY414soUG+HaZ6aAow0zOdQgnofnQX2K7Z2lC5EKGgyzzUw/oX/nObu?=
 =?us-ascii?Q?c6xGi3AGqXpqCAExrbBx+zpeVfOpC+3+uEGGG6Gvq89jxHoNzZk6T6TizHsE?=
 =?us-ascii?Q?j36MU9kRZDJrGHMBkQNFxYPbJyCIYLDQRHbLraPXXq2R1reab9rIhDgTk5zu?=
 =?us-ascii?Q?E11hPFOJQtmNrknYF3PytAkQs5QmQT8v7qkFSDhv7pgL6wRgTNdo+b0eOwSO?=
 =?us-ascii?Q?605aPKQK6tUKl5SoqWKrWNx1L75ei+6+GLAPxwYnnfBd3pQB0GvP8mQAnyg8?=
 =?us-ascii?Q?XkqDb1Bg8yEWmY9r2MhPOW1wMn8RA/zLTf9KyJNLksYzVuR66QMd3ouLfNGx?=
 =?us-ascii?Q?s0xwU1fZS/TUlaDJbT9NYdzNFgbohfuhZ706dn4Z3Iers4lHtkSh8CcjaC2b?=
 =?us-ascii?Q?mj2qygFJwY10VZ7UAKNbzOKSwhDvNVr2LDzduHhF+bSV1dZCTFid5bvs697Z?=
 =?us-ascii?Q?TftkBpdKpWgouG8kJPMvmsDpyqXabe5TrD9aE6j1a1oA+RF/LpdqjM1cOene?=
 =?us-ascii?Q?fIRVAMG3yzeLnwTeq4HW22B3XWN7zY70Z/Pt1WQPyz5HmzkfYDi6i6KdGQby?=
 =?us-ascii?Q?GlZgJxQZGkMwFVoT5kP79RRjXDMl+zDUgAk5PE1YEWZR2FNsKPXboQGVHLve?=
 =?us-ascii?Q?cLtKwEgU760iMsdtAWnFSk8kZ7S/5Ot5cNPjhlAbJMddOWk44v/VuSJxkfWV?=
 =?us-ascii?Q?67PhfbqIffFNS02r+jYXQHSLG8Gcs8avf3s8ldofyNrYpmLtVRNH4oMw+2zL?=
 =?us-ascii?Q?7GXsIHXnxQuCacsbII1bqRwaZq+AsFakt7rtIJV9lk2BdcZX9SWLyJb/bnqU?=
 =?us-ascii?Q?kbm0LVhUx47H79Rzi+8xkRbL4zG+gWqxEPiGcwl9FC9azF3sV/eHSeaPZ1lU?=
 =?us-ascii?Q?/M/8+jhmG3R6/e+Ef2p/oe1QsWdHR2kdhavSZ5hPU89slHYas67+PlFtV7Yq?=
 =?us-ascii?Q?DW7D7BU01b4I2hMF4zAjtKh4aD0t6+2OHAgyWapfUJ7KWdPw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd9e6c6-acdf-4d33-ab37-08de4dfba83b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:47:18.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujcKGhsoEJ/iugZ/OXLnSOUwwr2AE3QH0eWxzkCro6PmPtNnBrThnzdNEPil3WbCKeU1wvcBIw+Qdso/VxEqHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

On Tue, Dec 23, 2025 at 02:27:52PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> The min_queued_buffers field controls when start_streaming() is called
> by the vb2 core (it delays the callback until at least N buffers are
> queued). Setting it to 1 affects the timing of start_streaming(), which
> breaks the seek flow in decoder scenarios and causes test failures.
>
> The current driver implementation does not rely on this minimum buffer
> requirement and handles streaming start correctly with the default
> value of 0, so remove these assignments.
>
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/amphion/vpu_v4l2.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..1fb887b9098c 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -670,7 +670,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
>  		src_vq->mem_ops = &vb2_vmalloc_memops;
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> -	src_vq->min_queued_buffers = 1;
>  	src_vq->dev = inst->vpu->dev;
>  	src_vq->lock = &inst->lock;
>  	ret = vb2_queue_init(src_vq);
> @@ -687,7 +686,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
>  		dst_vq->mem_ops = &vb2_vmalloc_memops;
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> -	dst_vq->min_queued_buffers = 1;
>  	dst_vq->dev = inst->vpu->dev;
>  	dst_vq->lock = &inst->lock;
>  	ret = vb2_queue_init(dst_vq);
> --
> 2.52.0
>

