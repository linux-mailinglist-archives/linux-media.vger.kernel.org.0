Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFEC2A2FBF
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 17:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgKBQZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 11:25:19 -0500
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:61729
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726766AbgKBQZS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 11:25:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZYLCRggFVk1uLclsvso0jziAvud2Jcpx5Pv7agWE4vRBpq7rPjgwyypQmrs/o9bj/whAMlm+Ku552H3Vyx8Urgla5HlSAfiJibiCcpyTA5mLSvk6+sPMDVutoGhSaRbcr8Z91M6s6BQuPRI1FRoVHmqBXKKFK51S4Tmsiq4wLov1PerusFSK4qS5sdSRBbSRKkEJXInUsVt6ZwNZ+YQsndyQU3+3tgttsC6CsM0i1tCRPlKDky1oLadcyYrBpyN7tHt1CDHcA4eXZagBndFPDHPA/TKFN+CcqHw5fy2Kodqoz/V4zCpzzFWTesSU8ZL/wKEyNZUAZPw02rgmIbVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4JNzJ/DZRFZwPgNLMEobKd1WtIm3+9a+r+edERz3Es=;
 b=lYQrBJ0bX+7TC/7M+Um7wFursEkFBxcaVVoDsHp8CVE/tGolKSwJnTmf35VMaa+/aRs6IHmIh2IyzOj+5QAgVMAKY7wsT2uhNSR3Z5q9aA2+0ZlrKwPLO3BnbEFABlxU+drQX2ANuj5xzJwtBRLu/EfsFNgNhxafu9bCLSHeJoctLj6gDO/y6kZ9SO/fy0OEGBWhxJkbh9RVDNf7H/zo+fx+/o/Z3nXKqhA2Nzx+9968tGW2HhUCcp+HQL0yofqOPL0Gwnw/6o2r8LXNnKt6rbpRfLqwfL5H2lC7k9BVND+v7YHVXqMI2AA8PH+L0chkzCfdo+e+hNBy9PnKqyTe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4JNzJ/DZRFZwPgNLMEobKd1WtIm3+9a+r+edERz3Es=;
 b=re3FnrDdpouX3yDjT8qJmkve+UFU9d4hCDxZ4kKIOrxuxBrsI1k9bdAj3Cq0pDUcXnPvMib3URQiCHDXWXAhK0k7ESKufG4cwG9mnWWjLi6ksc+xIyQMo4NAPymuZRvGZJpS+RftRhHt3/UbVpbieDFno/ZfQN4u5aORVpwyK5E=
Authentication-Results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 16:25:13 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5%3]) with mapi id 15.20.3499.032; Mon, 2 Nov 2020
 16:25:13 +0000
Date:   Mon, 2 Nov 2020 18:25:08 +0200
From:   Laurentiu Palcu <laurentiu.palcu@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v4 06/11] Add maintainer for IMX jpeg v4l2 driver
Message-ID: <20201102162508.3sclvhyivr6op7rs@fsr-ub1864-141>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
 <20201102030821.3049-7-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102030821.3049-7-mirela.rabulea@oss.nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR05CA0107.eurprd05.prod.outlook.com
 (2603:10a6:207:1::33) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by AM3PR05CA0107.eurprd05.prod.outlook.com (2603:10a6:207:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 16:25:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e91464eb-e68d-482d-2722-08d87f4bdff9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25595BAB483513BD1F6EBA31FF100@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHXerEIPeeD4tDlAC9COZzhROvNs8Y7QP2yRuM7sc2SIFnWbtzFaxPX+ok+LgNmbFi/8vW/uHifag3dy2Apfav7F+qPz2fVfTRbnPPib+TdyjUaigi6qdvoGO1nZOdjcaidB/K1mtlc4MzL3rBR+SAUYBvxTmTuZGOnb5Ip15AjLYz71g9WPC3SyT4X/l28QRy7VwElFxw8NMmqsE51VOBXsuqZivSYvnkST6TMihYIWAavxCJq4ylPlo5GmNG34vNUnLTPsGd9nALGsqbDHlvl2wqDFZ147P23iGYPqX1Le0cZKbYGmNLha9H4+G173Uj+kEj4yC2XHReuqNAXnCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3902.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(6496006)(52116002)(8676002)(86362001)(8936002)(6862004)(2906002)(55016002)(1076003)(44832011)(6666004)(9686003)(7416002)(5660300002)(66476007)(66946007)(478600001)(66556008)(33716001)(186003)(956004)(316002)(26005)(4326008)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zACZVfN0v2PRyxvqq7T7tKMETu/GRq0o7LRgR1h4PnZSdpIShFXeu0ORDt3f4/bcxgYmMCjUbKL+WjqDlMC+yP0jAWY3md2S5a+qETjgJWOyfNWNlB1Bcr7WG0SYw7JO5YIbodphc7N1ZyNEOAhpcSsfEwNlw6wwewQfK1XnRE4nqSfJ7IyVA48XQuBmtKOjnW4BtvXvXtTz9ZaPJEbFSMs5eAR37MxrrUIz+vM7p/KeUeqI8GUtJKxGnJfze0baM9ckXlqoBCoviZ6fIo+nu3KqBUSYc6WiKvnUqUzFS4BJtV/aUIWFlQPR7/Oew6C0FJQXQ/8I9Nn+lfAeB5UnUlRGRyZHBzHUpP0BC49s95txDhRUgh4VfrhtTX1x96Z8rI67EzFPhHoB3RAjPWnTdq5xA0bylEmBhfB9g19rfEzWGQM8PrpNotwVu8f/OGjPFj+GeUbyDukaytpp/5P7x74clOcOHPGqZ7K/saaA0ZwK24DwovNVPSKQrjKqAVI5BNKJL54HXRkYjsvVNmUBgIpqKscQ7bEQm8bQncNNu9V5K6brUDtg9QDdYYCJcid8ZyCXwo7Nr6ypWNtYoSI7m6ZTPYwHSBnWvmqCudTQEfLKAlZoWKgma32zWXeKLUtOU4WbGhmP6tCRjl/k6PozNw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91464eb-e68d-482d-2722-08d87f4bdff9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 16:25:13.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTwRtlrrsAyfxs6Ovziml+moE6+UNhql4cj5mebHzhW+xKRzYXnACP/D9qszaqN7VWc5qvTSPynszNwlw+SziQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On Mon, Nov 02, 2020 at 05:08:16AM +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Added as:
> FREESCALE IMX / MXC JPEG V4L2 DRIVER
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aefbbecfb266..42a596ae346c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7040,6 +7040,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
>  F:	drivers/i2c/busses/i2c-imx-lpi2c.c
>  
> +FREESCALE IMX / MXC JPEG V4L2 DRIVER

s/FREESCALE/NXP/

Also, don't forget to move the section in the NXP area lower down the
file.

Thanks,
laurentiu

> +M:	Mirela Rabulea <mirela.rabulea@nxp.com>
> +R:	NXP Linux Team <linux-imx@nxp.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> +F:	drivers/media/platform/imx-jpeg
> +
>  FREESCALE QORIQ DPAA ETHERNET DRIVER
>  M:	Madalin Bucur <madalin.bucur@nxp.com>
>  L:	netdev@vger.kernel.org
> -- 
> 2.17.1
> 
