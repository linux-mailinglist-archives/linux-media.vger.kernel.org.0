Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6604E444017
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 11:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhKCKod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 06:44:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41242 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231338AbhKCKod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Nov 2021 06:44:33 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A39uJ81023448;
        Wed, 3 Nov 2021 10:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=OpRICYRSB8MIdWS1ied6MzWDVJStu5i45o5InoKfojc=;
 b=xAADBKLXiCr8OAZebYIMJn4AZtuwpqt31Wsvzc5mOQUYH6wuJeDScklD2FYR1JQc7OB7
 Pw+IwTaiIDyO95hmbkI015ksdMAAbrevEKR0oNyMFnph4fLCwC37ofzbM6Ff1vd4aQR/
 Cz3GF2AOabB4dH6AkoaKk5voFYpFTWLpcJJe6I/iLJRlb41n86E7ELpteUajEWf10rvy
 K9N3qaMbyy6OXe7u3znpUB1w8EiH+R4e7SJQsL2exzrpBC0faMDPPpjkMd3PuxpvB7MI
 AGDcycfmFkg/TyOHfGmUa2nxYCdohDM+p3Do4V9UmKgk88n6m8BDVtWQnH1dYJcJsuU6 xQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c3mxh15b9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Nov 2021 10:41:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3Af1X9016269;
        Wed, 3 Nov 2021 10:41:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        by userp3030.oracle.com with ESMTP id 3c27k6trqd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Nov 2021 10:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q12ffhWDXsvFtLmJqghLX8EO6AOmYrX8bpdZqbALgMorz8tsiNczudZvYAjFMl29sfPqf6q0d5WaguEVVTy096BRkK8kusnl8D9Q70bcHWuNi9W9FPCHnADwkEZLcSQzRCGR+DcRl01eZ4/YRp6+kgOaAD5ed81vIXTzXRf7smFbYuH2am+uKgjH+8z3hMdD7EF9FX5tE5yNp7dATVNcuZAoWOerNZqfPV0h1nbIe3+fL+bBvQ9OeTm1zC6ec7AK3Y2J345uicg9UXrT+3OuDUr6/z3/jgQqbgEoEsyMCLEgEIRH0GyDfndTR9CcQXXRsDvfQRTbJbXT48598FGi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpRICYRSB8MIdWS1ied6MzWDVJStu5i45o5InoKfojc=;
 b=aKpHaoOw8O0r3seBWiKwsXaLBxn7KrhqC6Z0GWYCK12QuOY0IpxgiW0zrmUhOdHiGiO1JOBZyD0PxSUPx5Z1aY8rGeUI3Hdv4DNMwugTmzqpryXvNAkk4nizLkqQMn8NUfBLbyyZDyJZiEWQ/H46rdW8rDWgHULV4gchv3yXBoFkVWCLcyQf0Y/NcLFcLtaMmltCJmpMWs0RNAKw6IKg8cWuFinUVk1uX3N3+VNHuNpTwvYEayyqbePbs1nX2Z2GYbZRXPMstyy0OfCzvTdD5L3dr6+cSxQB4WgfHQdztsCKza/B+9Qx+/X9h+tv4JCdzwL4tshmGxdxKUy1s9UGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpRICYRSB8MIdWS1ied6MzWDVJStu5i45o5InoKfojc=;
 b=DAgGSxsQZWhSkvL4oixcFMIVTEv98MeoOV+NLnSaouKEjygpyy+H7KXXOST6k3jg20Le1RyrX5giYleCyYN/7bJkHDcte9+HUnZtX5ZdeQtW15EPvTmAz64iqc/OeV8EXlWrKfECkBRGPnfxhtoViY/onWre2zJM0jLqQXEFyiM=
Authentication-Results: puri.sm; dkim=none (message not signed)
 header.d=none;puri.sm; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2206.namprd10.prod.outlook.com
 (2603:10b6:301:32::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 10:41:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 10:41:36 +0000
Date:   Wed, 3 Nov 2021 13:41:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Subject: Re: [PATCHv2 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
Message-ID: <20211103104100.GM2794@kadam>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
 <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 10:41:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c195f73-e345-4ac8-fb12-08d99eb682d9
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2206:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2206E458C6CD56F68A29826D8E8C9@MWHPR1001MB2206.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UR9eNlKQJUvAHiDJG1jbzF3efeaDhd7wISNPxvrUdiGUcwApTInA3l8SteGixqJoWnlwfgcEa3ZqP80xtPOJcfFucaYeW3OhU0iJ/dxqlqPdh92bgy6iPLNeimAwSHv/biUmyKELTSOZjxs9+BJfFcMIrQpeAbuZUPLO57BgUspnYMcjssD6W7LHh3yXmgCIlsqc1ohCCb8ZHpRJ0Usq4H96zstgKl8JPa9S1Fi1AdJwPmW28v9mBKVkTd30uXAI0K+jv7lSGVCZC7Ut0w3YAOiHn48n7pPN+kYXwUsCL84MADQ2hrpqiCOuJ+8q5GPm9CHNKZI7+GszfEF0K8onvHt2oWT9JFAUWVZ1WsKGcCA21m8rWzfDeRLT0ximLGAAft25vB8Hp8XdKP+7WGPoldafvSEnhA7pXxZYDY35Adb6wg60cEIYTIQvWcGiWP/UnK2MMjjt7TEjLe8ar9j9xQ8vwyVWC9tDsa/XYOFtaTLA0gxec9zvamO6fQ/utfdesdqLxbxH/0cl5iNnkbXEWuXveaCzs8n67yYhKqM7OyTGyD3oH3WU52ue7AChOAOh9HdPOupsrJ5maBWUltAYg6ZIjMc6XxHoromrYIDX1ae2fRuAr4eXbGwc2kWapTtuCvIns8e6hr0r2C3WhPXEga5Xncx++OSRSnKWwsos+sGlIAhIKVDppMKKioJIaW/Gn1YTlKuFanoMnkn1GACeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33656002)(55016002)(5660300002)(66556008)(9576002)(4326008)(8936002)(38350700002)(66946007)(66476007)(38100700002)(33716001)(6916009)(44832011)(8676002)(6666004)(956004)(186003)(6496006)(52116002)(26005)(508600001)(316002)(7416002)(2906002)(9686003)(1076003)(86362001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M91di6wQOrpWF9TTztYEzebxzQxpiCPIif0ybTnnSqrquElRCQTgVIPo8V6C?=
 =?us-ascii?Q?peMD21fu3lYYJY6rAU/V2RtJaIGbz06G7AoMLy7oNIMNxxpDw2Fqvhn5rESC?=
 =?us-ascii?Q?uGZAR7ta6DmOU1qD35uS7cdTMbmG9RTcvO+7H7w0aAd40TJwx22jWyl6hQVo?=
 =?us-ascii?Q?1IBu0lrd4cARbqWa1lrjp2Nr5BqEWQwNByz16RvzBM9ZA3W1SC8RSXkQ88l7?=
 =?us-ascii?Q?iKOL62mBTEXMnyXjrN+2GqdGAYEajfB9jHNnwy8wUR/33yETMSyPKt9VKKri?=
 =?us-ascii?Q?KPQF2mUGgw1NvrT9gbd8clhhNUTAwxLJXfikM2KEPSEGcOIyyxhPgE3Z5p9j?=
 =?us-ascii?Q?YUuqbDIZQl4tav4dflrAgEAQ+aM2tKQ+l7p+7OPpQxBN6ItHumpQe8CyJoy6?=
 =?us-ascii?Q?FjjDuMZLCRjF11dyAx5vWQdAjWidZu+76G2f1SHEytSO320w+GihEd8H8IHh?=
 =?us-ascii?Q?99oQPvTeLlf/MEsh8K5rOGiwc289txkBGEcylxb6sr0AG4uJOk6mI4LoATim?=
 =?us-ascii?Q?TL+LAmFq+IzT+tO9jByZ+TuBQQ3d/pbeY1YbdW5Vo2HPhJ2w/tLYvElQw2b+?=
 =?us-ascii?Q?C5G2pKv/nPJaLM0gwg0zAAnPHDAJrgGsoj9MUyyBlU4WiJ3930DfJDowE9Z2?=
 =?us-ascii?Q?l5pKkkX4Tbf8xh+SM6ZEORBGdfcAwifbtBi8GcBv3LzMAlZb8hrzvVlLNC+M?=
 =?us-ascii?Q?arLdVGZH7Kl2uOr4Y0WCXc3QRHNxePyu6lSUGDdTl6L5vyxGdJyaGpzIIjc8?=
 =?us-ascii?Q?g97szMTY+TgHRQaaSUFQudc11nignogooZRLpY4wdzyjhXXzMJIPTAcsjSXS?=
 =?us-ascii?Q?QxDI91TfawWzLldsB2yQNJinlOsXnwZWk4+xb4VwKa31xvhRgBglBXoueA65?=
 =?us-ascii?Q?V9w0Fx7fVMN/y6zXwWgjNEvlawXFyMVEqcuPzPH6QXZRmR4tqEDKQeSIsIJc?=
 =?us-ascii?Q?TGud7205i6cnW6pbn55xkagQvg2FzywQZkmr3hx93DyGYn1mYwACJghV/djH?=
 =?us-ascii?Q?hb8kV0dNifnj1iWggJMs2jDgwzkV6Jst1uOdj79ljEpzePNjZsr23NdU/O2/?=
 =?us-ascii?Q?3qw8MUkRPVCWWWLiX4EGc+OW2daWaG1upiQKNnM1Ddc8RxmsoWcYtf3po/nO?=
 =?us-ascii?Q?m9sepm1Bk3ymR6fJM9adqW4sFT3kDM1JmowxlrbFv5XrFVlm7yPLp2bMPJ6w?=
 =?us-ascii?Q?qJywi5BfltcCCCAst22QbINT1ykFV0fsccD4iBZWXM+jFZJq3Cwki7f2XMlB?=
 =?us-ascii?Q?fk2nq4DW6WdfsJ5SQbQro1Zjx+2nkCulCi5fxY1ldbSaDtKI5fQ2qukvdAI7?=
 =?us-ascii?Q?h13ZBOXKtbm4eIZOMnytpZDM/ZMWQ0ItkXNWrz+wdFwKONGfs4rzNIxK0NyK?=
 =?us-ascii?Q?4uNKra4/bGgAosQwwHypR3TjxU3yYXLJGbR7mbMeYc67UMtLoDaGqe70/LvZ?=
 =?us-ascii?Q?Bx6HctwAfFsac2vn3nEfEi/bi5KA9Vdf7T4SRzLTfAiMjqF/nVxRprmkbdKM?=
 =?us-ascii?Q?plbFRXDZzbIaB5VgrqTji60wG7v9qskx+FnXe/SCoxoNSuYD5ZjULhx/dCFF?=
 =?us-ascii?Q?bhYUdNQTwnymL7tGutP27Gw/IEUkAwhaSwrjXNj8vywyqFIDJVaMmi2Zs8uz?=
 =?us-ascii?Q?n4is/7uyGewh/2uqLwNHaHNYwGcAbjvqmdb1ZlvdwvOmxmN5BKP8fWZwyCI7?=
 =?us-ascii?Q?BQTmxg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c195f73-e345-4ac8-fb12-08d99eb682d9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:41:36.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIa4eb9i/ihVWCMw4pUOpwhP+ZPdIcCfDc3N62aEneXrvOo68tqmzvv+S0pGmiLHsQfLnrPpisQyvEGKB/HYfzdqY72K+Nmbhbc9yaeDRSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030060
X-Proofpoint-ORIG-GUID: rWm-eneWnIr6RARq78zYPLJXkkRBKjJ1
X-Proofpoint-GUID: rWm-eneWnIr6RARq78zYPLJXkkRBKjJ1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 17, 2021 at 01:08:37PM +0200, Dorota Czaplejewicz wrote:
> +static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
> +{
> +	u32 width;
> +	u32 stride;
> +	u8 divisor;
> +
> +	if (!cc) {
> +		cc = imx_media_find_ipu_format(mbus->code,
> +					       PIXFMT_SEL_YUV_RGB);
> +		if (!cc)
> +			cc = imx_media_find_mbus_format(mbus->code,
> +							PIXFMT_SEL_ANY);
> +		if (!cc)
> +			return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: the IPU currently does not support the AYUV32 format,
> +	 * so until it does convert to a supported YUV format.
> +	 */
> +	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
> +		u32 code;
> +
> +		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
> +		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);

Do we need a if (!cc) NULL check after this assignment?

> +	}
> +
> +	/*
> +	 * The hardware can handle line lengths divisible by 4 bytes,
> +	 * as long as the number of lines is even.
> +	 * Otherwise, use the value of 8 bytes recommended in the datasheet.
> +	 */
> +	divisor = 4 << (mbus->height % 2);
> +
> +	width = round_up(mbus->width, divisor);
> +
> +	if (cc->planar)
> +		stride = round_up(width, 16);
> +	else
> +		stride = round_up((width * cc->bpp) >> 3, divisor);
> +
> +	pix->width = width;
> +	pix->height = mbus->height;
> +	pix->pixelformat = cc->fourcc;
> +	pix->colorspace = mbus->colorspace;
> +	pix->xfer_func = mbus->xfer_func;
> +	pix->ycbcr_enc = mbus->ycbcr_enc;
> +	pix->quantization = mbus->quantization;
> +	pix->field = mbus->field;
> +	pix->bytesperline = stride;
> +	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
> +			 stride * pix->height;
> +
> +	return 0;
> +}

regards,
dan carpenter
