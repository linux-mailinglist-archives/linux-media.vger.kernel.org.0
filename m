Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F111219B86A
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 00:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733133AbgDAWas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 18:30:48 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:26592
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732385AbgDAWas (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 18:30:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agZC0p78UIw/l+3SCYiiVB11A4FSHOf5t/86Caqwz+wf0cnVSBV8KD00pw2Hxow/tp9k1bmFzxKP3nQPeDlntl6aDnv4dduNBhfhwxE9rWlgc2WeTimkRQgijzYG11QL6R13H/hxcegY2TOVCvxUiHdQglrf/9ziLNTc3M976GGKrCdtKoLY6bjwX71xV0KTKwMsigY2/UQws91Gxv0X1cwSTJ4ZQZKfmLNcAtV6maxYQ2dIO+EnRU1H6F9TduRyt2Gj38PjMaiyRQprYnPDgc/DbgS5ero0Wn0WivIoeCcCVc8tCAeYyoPZliuu5pSPFrtLR4KY3PSk5ivXgGEQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9tkz2lD+kE1GqvzOEi50K99bEYufOjpTKWekUyeic0=;
 b=c/H1XF5W6HdwhPR4VdBcbSkoWqOAvDV/YejdWCsS4IcboEZ+wOC1glEq8nuWkPn0wXl5flnHTtAsAW9U8JT1VrQy1ZgLEI/jbtmWiwIVKXpHKIeqoi8M7APkPIt5QXP5z5BxT9J9tqmQYb1gY8xBPinLeaAw6BHr8ZzIuw0eYSDf1HOzBBHdVibnAw5NlNgDA3RFeevhddg4Ho+soI5pfYOepaiKOoOQiNJIro78jf15M31m5Ar3AMu8mUdNM0HlPn6tkwUU5u/Gb1QnNvNtcfQDTORhpd1+76kTojO6H/1ZcNAlLU3I6L80Q6H8vmkppsYwRsG0BJcxzVfyO7PJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9tkz2lD+kE1GqvzOEi50K99bEYufOjpTKWekUyeic0=;
 b=o0y7H4ykOcUas7UbbrRGI4EelAyqQKlpokxfMj/nsVzRipFvURCVUaj+EL44KUVZmvdkJ+K4tQxrMcFOowO2fOpZdoBp7OqRVwk+kF0xra8JUmuCecX7bnq0XLUWwpi2sxHcfE8JZ9d3eKuQUH9Ck5atYnl4cHGD5oZwiNdGq/Y=
Received: from SN6PR04CA0081.namprd04.prod.outlook.com (2603:10b6:805:f2::22)
 by MN2PR02MB6927.namprd02.prod.outlook.com (2603:10b6:208:203::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 22:30:44 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::c2) by SN6PR04CA0081.outlook.office365.com
 (2603:10b6:805:f2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Wed, 1 Apr 2020 22:30:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 22:30:44
 +0000
Received: from [149.199.38.66] (port=50194 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlse-0003Ei-77; Wed, 01 Apr 2020 15:30:40 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlsh-0001n3-UZ; Wed, 01 Apr 2020 15:30:43 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 031MUcvX028125;
        Wed, 1 Apr 2020 15:30:39 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlsc-0001iw-QQ; Wed, 01 Apr 2020 15:30:38 -0700
Date:   Wed, 1 Apr 2020 15:30:38 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200401223037.GB583@smtp.xilinx.com>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313144035.401430-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(356004)(82740400003)(26005)(336012)(5660300002)(2906002)(8676002)(9786002)(44832011)(7416002)(186003)(54906003)(47076004)(426003)(81156014)(81166006)(4326008)(1076003)(33656002)(316002)(8936002)(70206006)(478600001)(70586007)(42866002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33bb1406-ef1f-43b3-87c6-08d7d68c5139
X-MS-TrafficTypeDiagnostic: MN2PR02MB6927:
X-Microsoft-Antispam-PRVS: <MN2PR02MB69273B5237E021DCE4260E51D6C90@MN2PR02MB6927.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03607C04F0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/q6MTErMwMipjK+zlW5OdenuIRa1jEIYF8S3rpL5iuuDqwjc8edT2YL+Bw0zicHxXrkuKj1T/QZ7ObrbXwwT/HTRIc1vKimsTDMGdonH3if2KryzJZr9VUjw8A7B+bBwjiVO/SNYa9RNl+HSZculuZc+v+sI7ad3eQcOvT9RC7kIRsLNMkvUTlDIQfkxowJus0pUMOKpg/8UJ4W5w9PF5j2sf9ehB4Z/ta1e5yrzyWyOpoEsy0cgsg3JV6ea1ibo2rAVau+c5jzsyIoE6X0VezF3XKLnJI7I4MSFhZP11v/O/6t1M2yopD/ODUy9B8p8Wy+l931/CWkd3x05cCrVMxAqduBfOymT+i0wARywArDrTHcg2g80F8xevxEEP7Ww57MFLpiIbHcr3JpYEiwYuX63yf9ee07TPN8Hx8X2hSHrxX4gYZ1hLpcBrXqYVG4O60qMmQ0tt0WyqfpHgdyGB44y/bpcFOzZp5nJ0zMxm+UF5uOwJg80fn2uXBOIxqq9qxm7Oz6qb/ck4zMAuPqiWeWcix6alWM+OUBx7cWiLw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 22:30:44.2564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bb1406-ef1f-43b3-87c6-08d7d68c5139
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6927
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patch.

On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> Introduce a new pad operation to allow retrieving the media bus
> configuration on a subdevice pad.
> 
> The newly introduced operation reassembles the s/g_mbus_config video
> operation, which have been on their way to be deprecated since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 761aa83a3f3c..3a1afc00e094 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
>  	unsigned short num_entries;
>  };
>  
> +/**
> + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> + * @hsync_active: hsync active state: true for high, false for low
> + * @vsync_active: vsync active state: true for high, false for low
> + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> + * @data_active: data lines active state: true for high, false for low
> + */
> +struct v4l2_mbus_parallel_config {
> +	bool hsync_active : 1;
> +	bool vsync_active : 1;
> +	bool pclk_rising : 1;
> +	bool data_active : 1;
> +};
> +
> +/**
> + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> + * @data_lanes: number of data lanes in use
> + * @clock_noncontinuous: non continuous clock enable flag
> + */
> +struct v4l2_mbus_csi2_dphy_config {
> +	unsigned int data_lanes : 3;
> +	bool clock_noncontinuous : 1;
> +};
> +
> +/**
> + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> + *
> + * TODO
> + */
> +struct v4l2_mbus_csi2_cphy_config {
> +	/* TODO */
> +};
> +
> +/**
> + * struct v4l2_mbus_pad_config - media bus configuration
> + *
> + * Report the subdevice media bus information to inform the caller of the
> + * current bus configuration. The structure describes bus configuration
> + * parameters that might change in-between streaming sessions, in order to allow
> + * the caller to adjust its media bus configuration to match what is reported
> + * here.
> + *
> + * TODO: add '_pad_' to the name to distinguish this from the structure
> + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> + * the bus type.
> + *
> + * @type: mbus type. See &enum v4l2_mbus_type
> + * @parallel: parallel bus configuration parameters.
> + *	      See &struct v4l2_mbus_parallel_config
> + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> + *	       See &struct v4l2_mbus_csi2_dphy_config
> + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> + *	       See &struct v4l2_mbus_csi2_cphy_config
> + */
> +struct v4l2_mbus_pad_config {
> +	enum v4l2_mbus_type type;
> +	union {
> +		struct v4l2_mbus_parallel_config parallel;
> +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> +	};
> +};
> +
>  /**
>   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
>   *				  in video mode.
> @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + * @get_mbus_config: get the current mbus configuration
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_pad_config *config);

Because this can be used in many different ways, there's more chance it can
be misused. That means, drivers call this in different locations, ex probe,
get format, start stream,,,, and on differnt pads, src or sink. So imagine
one set of drivers call on sink pad, and the other set call on source pad.
It works well only until those are mixed together.

So wouldn't it be better to put some restrictions? One is to document
recommendations. I think this better be called in stream on because
some bus config may change at runtime depending on other configuration.
So any bus config prior to stream-on may be outdated. The other is to
enforce in the code. Some, but maybe not all, can be handled in
v4l2_subdev_call_pad_wrappers, for example allowing this call only on
source pad.

Thanks,
-hyun

>  };
>  
>  /**
> -- 
> 2.25.1
> 
