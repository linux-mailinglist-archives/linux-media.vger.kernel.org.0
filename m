Return-Path: <linux-media+bounces-30553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18999A93914
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 17:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6D8467BCF
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397D820299B;
	Fri, 18 Apr 2025 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CgMibfXT"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A8D17CA1B;
	Fri, 18 Apr 2025 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988554; cv=fail; b=HJKbqaLKB6ULe26RFuIMqLxJnvMzBonS6PcO2zgpEmlO/owI5fLYyGDfFoMSV9QjTqFANyDpRVPhrMwwm/LPse+nJwJNt9160Agaf/PRWZOQgJRarDXsDflChJ/GVzk3uJ/wqHCloG1EA8i2KelojmJV9xWl62u6fQLAc4XSSfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988554; c=relaxed/simple;
	bh=OEcoysmY3xqJMKQABVQLsEffFtTtcR23Z+zh08RBnn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IPE22svTMhLAgK/XGka1vjbCtZRpPoDE3YkVFY0LMLsam7EAOCg8HJb79Z0B/UC23/lP/Ef1yPXdh2GD+RvlPEI/GcXpLpg3Y8bJPdidXYGnOxnZzVEo7TNHKeDrw+3XVTeuk+ZQD6cKLKiAwMIr1c0tcV+ahCCF+608Sj+h0xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CgMibfXT; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXDH41ZfJ44xjp1uqHjLwHbyOsyVkLk5cNCV39zzs1rJlAzSk3TgrBU2dtY35BTzU+19BDKhKbEoFnlbHxFBi4CGDo+MhVIeJKr6Roq7/3BXXgQltB/uQqV3wwx2xH0eDTO3g79F7XydvOoxNBpFek35PPAxqxHjCqbj9GG0xQJURuAYEjgDGRQw7icPYMe/O8IhaDnQ9OSwqjHzI/PmN48u96t+ExC8j8+tDFMeKLY7Ed23rf/MIVMEKhgzamXAM6dyVOjx/gG3f0ixUUgoJdW+GLxCY32pw5Wz5CE9y6RtnMOqPyoJuiGUZgAREJTyWeKN2snrsSyw0XCi+HH4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3A1dG9qq+brRv/Mfs8F9fDJbPtEDFYCq4GHdkSQ6VI=;
 b=iuBJW8P5un60+TReRbpJf06XU8bHeCoIJPl1AdkuCCGJl9p67RDp5yxnKB5HMFz+HZB3RiH6b8KzQKLwv8YmcdIzUPk63BuWs15hEVsmYprK/atvKTWylP5wgZsukdP0Kq/jizqVnIWYp+t/AiI6U8jPMUtCO6PORTxmQvjdG467UvDQ2KKtFkihZiIdPeHD838g+GggpCzRM78ZR64Y7nv3hrHj27WRRhBy2nFm9qv10yhB+EcP+szOPeKlvHNdQile4rL1x7mZN8de6MvMIaa3iOefMM6v61P3QSbwcBO+aM4e/yQLf6pd7miDGVe8Tt6ncvWwhKo/IntavSQdeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3A1dG9qq+brRv/Mfs8F9fDJbPtEDFYCq4GHdkSQ6VI=;
 b=CgMibfXTwUU6/r12D1dKSi6UWAm37Wl9d6DwsPT2e4VuM98z+0OBQdlmoso+4hOEdBnGCVAhDvVBSkBCqMieXf8D2yvE6FhzxEp73NmIPjuqwZmteQ5row+T6wEXFb86P+vIpnSPw3mGVkJvIAe7iyIQn3HZYqr34p5W7PCZH+iczvoeg5SPedZlYUB0vXKCp0J1ga9t1//gtdT9j89ZDW0OF1tqrVbbqvoMvHTnJaY8ohfeQYzU2ZzOyrQ1d4KWbjtmMs+fC9gZFDAGoyt7MbbbGDL853GECBe60zWR7STXKbGD0rscU8Ozj5UfL9CgvvqAaiOW+S0mqRp66fkB/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9226.eurprd04.prod.outlook.com (2603:10a6:10:351::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 15:02:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.043; Fri, 18 Apr 2025
 15:02:28 +0000
Date: Fri, 18 Apr 2025 11:02:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
Message-ID: <aAJpeu0fMrpGS7Wq@lizhi-Precision-Tower-5810>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
 <20250418070826.141-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 67aa68b7-2be2-4591-ef53-08dd7e8a092d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hiA6LQqvjM29NV7RP5+vTUfDAvDCC4aV6DP+mfgW0hkhpOSype8omKPYyqQS?=
 =?us-ascii?Q?kXHF6T+rSmB7egGem7cqRywAYOc7EKJ974Adaxye44SPc0V8xTW61Rn62j0t?=
 =?us-ascii?Q?hOL4CWYRTI7LTNP1K2mPxST7dArOkQhTY+Qq/xkL1UEX2dOdq1yDxHjnkQI+?=
 =?us-ascii?Q?A1vH0tS8WwGnVl5TFdzQRB25tGEouslZJch0zI80Z5djpX1kZx0lm70pAiA3?=
 =?us-ascii?Q?4nek58bpXZhFnOzaYTUSrUHWWRXbsHXX3VvBvIidGltTwp5XvXE48gECkTYe?=
 =?us-ascii?Q?anPu9ejW3aUuy4QR2p0C0jEg3CuRnTajv78msHa4N8iOQH+mnteO0jT8Rs3F?=
 =?us-ascii?Q?lIzXYD8m6h658LhqqKPPI5c3BkKQo8XQty97EgKS1IsXgW+hN+IXcKgyetxm?=
 =?us-ascii?Q?sltAGFUk/HjUXO2Lv9OhLO6KzyrlJGHmsnvVAqe+JHFKIAgPNBU6emd3rFHr?=
 =?us-ascii?Q?4SIc2z7CBuGF3DkJzvUaKl08Hp1+pVwOFXpliFo6qN+BN3tTSytdkJCVSqnF?=
 =?us-ascii?Q?mVjLV/xyCMK+hsl51RUGvTJ2d2Hzfdj0uwnkR/KporGsOLJRx/tJyqPg/+rZ?=
 =?us-ascii?Q?wa8NspjpfTlIZOmnTyFB0TFJNWWP1QeLY4+def1Xz1/TiwDosAEGNdE+07kp?=
 =?us-ascii?Q?/cPp2lfLMiG1Z9g7hXBPNFKrn83QuMTcmvHF5xqv50X8F8PPC8F+4Kioi08g?=
 =?us-ascii?Q?8oiXtoVEwttxs+q897Eg59SBB0eKLhf//xXl0xwMeI2EGkiXJZgQy3Cdnep6?=
 =?us-ascii?Q?fcecD24vx1bupoDmt55dsqoX8jP4KPgurg9iBXp0KrnQaNAAicfKYUn8BRD8?=
 =?us-ascii?Q?yiShnpldvPvS/+WTXznvVtpmo2CK0JmIPsV7wzUMeTv+tgJ9DgsG+WE7ipKL?=
 =?us-ascii?Q?pGC2it5de583ij0WkVcAXziaJHKL1MupBEPYdNU6BPdmAlr7i0WZMrY1uTkL?=
 =?us-ascii?Q?5/F/U4A5dXeQs8DtUwlJSLJlSjLtTZBYmkFAEtmJO2KwH0ziW2gdfZjXTIiK?=
 =?us-ascii?Q?425IMC/o8TYcL8GM42mUBepLGTrLwta5vbQrhofxL1V8euo0jFAeAijgTqu6?=
 =?us-ascii?Q?pOJ32EwabIlR8GGumjvoWdNCnfx+HKfyAyn3WfBpye1wt47qKgaqdiigfPd5?=
 =?us-ascii?Q?Ryyk3KtHg+EXtVTZsqdkYc4osMEAPU0evx/ak2n+lyWACdFSOck+D/IItapD?=
 =?us-ascii?Q?ObNf9Wmg3yv3Gk4Xu8LlxjU5WnR68rYtSXw1hgUo4LbKxh9UYwojKoy670v1?=
 =?us-ascii?Q?7fD5Lz7g8c7PVt6AbZXwl74o4aJcNbBwuoyjCSOVKZQ9ZPi9PkguyoDKDkuO?=
 =?us-ascii?Q?hNa+yatjQJboHyLKWJlkmb4esWph5ODPAK4JZKiVknPJwOhmTjD/tCNPMR1z?=
 =?us-ascii?Q?A6nA4Iem6lwGAyK7EeAnK7HrTvUXqMRT96wtnnPWuMgACSSjC5yGFQRC+wVu?=
 =?us-ascii?Q?+tAhrKWL95StsXm/ooAeCKc4O88un/ogP6pbxrqHY7yKd0f8uV22/SO/iW8O?=
 =?us-ascii?Q?0guZmx7k4E8OLOw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fKWY/2Y9ixwTchODkZbDW8oBiMOFr5PVGpKGJ5uin9HWcja3/HplUhBf9pyG?=
 =?us-ascii?Q?O/qBwGdcVYaQUsfvSPodwDjO5ZmEv9LueFc87kPTW8FFWlXdNEtEEFEhHKgx?=
 =?us-ascii?Q?JbRhlGd+bjYy/+Puge8AumIBonO2Dxci8CEAiT7k9Mo/601IhglYyMuvy441?=
 =?us-ascii?Q?TVWIJnziiqRGbrk7xybcRzfLspNisRZfeNYhvOLTEbn0Nt5lJyupIiirvorE?=
 =?us-ascii?Q?UvTtlCcU+BsbTVNS60bb6HtWYJ5xI1UqkYEDQdQv4rTmmUOYyc03jBFOZEbh?=
 =?us-ascii?Q?BQDa/K9qAKdtB+naCp4K3Hhs/moaRrVHLSsa/11HxU08wlVMWYv0HMh+6oXs?=
 =?us-ascii?Q?/14rHKw1eNo1NyhQK0PnOLypGp3uLKWcJoibj+YuKmn3xSImEIWBeEaoBxI4?=
 =?us-ascii?Q?Yg1pwDF+CXX/Con6ytW80PmOowkZ2ABB9xdHUZjmLxiQ0HjJaSZ+rphZoxf8?=
 =?us-ascii?Q?RQj8nwE1pFk5lCDmOXeo+pqvUY9sKKJ+8Qy+1NQ8uuzb/54CWaryf9DU9hLa?=
 =?us-ascii?Q?7zpNrl4Bom37zvDVag9LKV5kOh+KWBTqBstyjWT03OvFAydP4vuL3OsiV2Ug?=
 =?us-ascii?Q?VmUnkbgEN5jNYgO/z4wpDuZrXV1Jo3x9Il62j5i7OqThYjuDk0Lxo7ld6QAw?=
 =?us-ascii?Q?HBkXrp22P4qzh4FeLJybisM8p5L0mQnEdW77y2FYZ3aRIsCz6Pns1E5LFoSm?=
 =?us-ascii?Q?EiAE0VVtprO8UtTKzTTuTYwMXRYLEgo1uddHWIJYeW2B/94heLcH+Zvfc0a8?=
 =?us-ascii?Q?o9NaJOr+LPfjq8dLCIpRmf6awaIWlIyHtofx1hLGpKAOG7aeis51lPNlXuoe?=
 =?us-ascii?Q?FjPrti6Kr9WWmDyp9h/AFzbAenRYYKyZ7Z7CiQA2YG7a5m4qLDoAVwl9NBnH?=
 =?us-ascii?Q?rdDl3MIRQtrv7+Dqp7++/trDgCbSfMhnH4yLxm+9sIxR4/p6S4d3oOfHc6p5?=
 =?us-ascii?Q?onYPfFl5kX/0ECGOYa4Nn30ycKCVI7AuRl6eYrUqmrq8chxjryNDBR5f6XRj?=
 =?us-ascii?Q?N6mveqy16gYxvV6u2VMys04fVTtMIwYRSxBxDd9OLM3jIFMBWSLoPcbFy2QM?=
 =?us-ascii?Q?CE+foutDwy26kH4vw50wP63S4aI3cb+JvhjartrHghdte2XsqXCvAVfZ26n2?=
 =?us-ascii?Q?mXiPkNdARYKSYim/KtPmWBVX0N31r5D/6XeD6Vbhx/59Y4ghE2EZiVw7VWWZ?=
 =?us-ascii?Q?xhzCWY4v4U8Lg00VjBc6v1RQq4FM+2Rlgr3ZEfP2fGlCil9nUr7ZvEzAaCXh?=
 =?us-ascii?Q?tP+vGmeJIFF4qS+8ILq9wtxuTBh5MmrqmFl5JFVrSkibAxF/eg/pV2m84f5N?=
 =?us-ascii?Q?v7RZZjl4ukS8W+FwHs0kKH8gQAj+T710kh0M4wzaOfn7LoYXaajrJmx9WIUv?=
 =?us-ascii?Q?aNQHDY6o6gUfOgh8ysQZPmW2ttLRhr7/WTvdwavJiTagHuzDsUZ2VhZMW8Nj?=
 =?us-ascii?Q?RkQxEmS6uJB2Lni9a/27nr31/V4bF0t4+xWgG18Ne4IgXl2mHhEw1frXp5Bk?=
 =?us-ascii?Q?sw0ScmzciMv7KUJKzU/ggRzFZIy09P3xGUTOghImEnzAhpC/+nf8C63eWyx/?=
 =?us-ascii?Q?ebx2IO+ZBExoOyfB/P5WPacTQczyRqK/lzdwfDvw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aa68b7-2be2-4591-ef53-08dd7e8a092d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:02:28.5306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VyhfY8+NS/y+XMdZewuLH4tMl1nnnbXSR5ENPIxuLByL1Bhg1Ouh6uYxgJ+xOqHVis9wUx4CmxQ+1+Y0ZwCCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9226

On Fri, Apr 18, 2025 at 03:08:17PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return false;
>  }
>
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>  					       struct vb2_v4l2_buffer *src_buf,
>  					       struct vb2_v4l2_buffer *dst_buf)
> --
> 2.43.0-rc1
>

