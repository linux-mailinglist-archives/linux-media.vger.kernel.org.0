Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93744247A59
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgHQWUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:20:30 -0400
Received: from mail-dm6nam10on2074.outbound.protection.outlook.com ([40.107.93.74]:5441
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728512AbgHQWU3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:20:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YY4HUTzxK7qtfVHkFvR8w5CeZvIteWNq+0ueU0fosb6irCurq3KVRWkzMXWXDvBAGIcLBBgV+dcTfmuCB/YjhK66HqryB7Z/0vP2pEgKzID8Z4MOTld+ods8TuTqZAYYnUtEKKLuLSPKS/ikEj6iEt/lbPSJsET5eSlpthmiPfQfZ2Q8L9YzFi1CxWqaPwsj131EiKjpne4Iogeeds8YJzVFpibu+lvmzgtlBWdqNKbvUC8BUdVLzNEagii+M3H16o4mwT8KwGIAge9RaBAaddr7VzIqfQez6mqN4tS96VIWcG4yR6f94D5Ca9DBp8AZq1XDedT+UQizkXRVqeMmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hioMwHOE4j9zeZjYslsqsV6u5rLTPuq6KncbYIgQZuQ=;
 b=cX6HhVUvcEvhxtAuTOoS8/fvhwRivu1kEET6BW2TIbtbuDYxsEwZhN7sETJqrJTWUcmorKodKtkfyP0oFjd7cinyBIPE+awrZHH5bxO9uKmYJ6QvPT7Gd1ikEwvm+dkWxKK3U2mEA7XTFW+wL5mB84N0f92k4uy8DzXGOy6ZwK0ccrCsR1WSQjwmFwsjrXXPYePJvJaqYX+3jGI1VdmeW4MODkmnTk3P3bjZuy9YUtA6fzFbVfYgswIpMpLJT9zcVBEiCenUa5nFiyv0dqdqf9aVLmHYSZQiX7z0zVNFMfN/zaUKgeiWS9++UyVJ9UAxrChi4nDBYMgiCy8TyZ19Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hioMwHOE4j9zeZjYslsqsV6u5rLTPuq6KncbYIgQZuQ=;
 b=jU6cu30mbO72S4YEJVKU5AhwRK7HuT5JOU8Olq0qIj0afk2qGc6nkFg53W5ry7bwICchxFhQ8Uor9Tk4R9Iqr5CFQUws/XKpMCkjqQUz1r88id5egsr7xTaARyqGltzuSoEHGfIG0QlVe2tJgpapjAYHPb965OZQ0iEW23EgZA8=
Received: from SN6PR16CA0043.namprd16.prod.outlook.com (2603:10b6:805:ca::20)
 by BN7PR02MB5155.namprd02.prod.outlook.com (2603:10b6:408:22::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Mon, 17 Aug
 2020 22:20:25 +0000
Received: from SN1NAM02FT0023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::d2) by SN6PR16CA0043.outlook.office365.com
 (2603:10b6:805:ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Mon, 17 Aug 2020 22:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT0023.mail.protection.outlook.com (10.97.4.236) with Microsoft SMTP
 Server id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 22:20:25
 +0000
Received: from [149.199.38.66] (port=40145 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1k7nU8-0007E5-29; Mon, 17 Aug 2020 15:20:08 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1k7nUO-0001Pj-PA; Mon, 17 Aug 2020 15:20:24 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1k7nUI-0001FI-Ak; Mon, 17 Aug 2020 15:20:18 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
        id F172B2C69AC; Mon, 17 Aug 2020 15:15:05 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:15:05 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 4/4] media: i2c: max9286: Remove cached formats
Message-ID: <20200817221505.GA21736@xilinx.com>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817143540.247340-5-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 774806e7-6474-40a3-f53a-08d842fbbd28
X-MS-TrafficTypeDiagnostic: BN7PR02MB5155:
X-Microsoft-Antispam-PRVS: <BN7PR02MB51558AB704B85E21D740CD32D65F0@BN7PR02MB5155.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PY9hvcwxxhkjW1RrvCRxZWtsGHi4NBdg2Gdso2N8kBqWx9O7cRQWs3JqxD4bJeVgrmh1V7mmXRG5+R0l+f64+HHRfZdw2YA626qpFfiSS14aRM3qw5m44ei/Qk/qarZ9PCcc4RSTd78C7YnWS/7FzVIo7rnfS7L6368Elnlp7666ttfnWy2ejSGwQktvJYx8ERvdpG4Wj8ajfJ6FOWgUltlRhEYldlCffKM/br8Bn2LDManPbyOJyDBidHDVH/rx9H7hmYzv5LuDPP+hQTtkuz6NLS4jXcQylGRvCqEkljjIak+w/OPlAm6+3C7jh65H6wdPkTMBm4GE1nLoJL9De+HlDCFSo7v7cXZ5chF64ijJl/V8cjcpPELHrpe1YFTwJ2G5srp0zetaRmsOu+NanA==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(346002)(396003)(376002)(39860400002)(46966005)(4326008)(8936002)(2906002)(26005)(70206006)(1076003)(36756003)(426003)(54906003)(478600001)(2616005)(44832011)(186003)(82740400003)(81166007)(8676002)(316002)(42186006)(6266002)(336012)(7416002)(70586007)(33656002)(5660300002)(82310400002)(356005)(83380400001)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 22:20:25.0657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774806e7-6474-40a3-f53a-08d842fbbd28
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5155
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for sharing!

On Mon, Aug 17, 2020 at 07:35:40AM -0700, Jacopo Mondi wrote:
> Now that the image stream formats are retrieved from the remote
> sources there's no need to cache them in the driver structure.
> 
> Remove the cached mbus frame formats and their initialization.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index a4e23396c4b6..97dfee767bbf 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -160,8 +160,6 @@ struct max9286_priv {
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *pixelrate;
>  
> -	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> -
>  	/* Protects controls and fmt structures */
>  	struct mutex mutex;
>  
> @@ -758,18 +756,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
>  	.pad		= &max9286_pad_ops,
>  };
>  
> -static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> -{
> -	fmt->width		= 1280;
> -	fmt->height		= 800;
> -	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;

There's one more hardcoded place left. This had some implication on output
format, MAX9286_DATATYPE_YUV422_8BIT, which is programmed at 0x12.
Now, this patch set can potentially result in a mismatch between bus format
and acutal programmed format.

Thanks,
-hyun

> -	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> -	fmt->field		= V4L2_FIELD_NONE;
> -	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> -	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> -	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> -}
> -
>  static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>  {
>  	struct max9286_priv *priv = sd_to_max9286(subdev);
> @@ -834,9 +820,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  
>  	/* Configure V4L2 for the MAX9286 itself */
>  
> -	for (i = 0; i < MAX9286_N_SINKS; i++)
> -		max9286_init_format(&priv->fmt[i]);
> -
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
>  	priv->sd.internal_ops = &max9286_subdev_internal_ops;
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -- 
> 2.27.0
> 
