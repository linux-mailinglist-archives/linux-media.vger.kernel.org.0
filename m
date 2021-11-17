Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADE4454494
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 11:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhKQKG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:06:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30824 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233163AbhKQKGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 05:06:25 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH9FVHu012698;
        Wed, 17 Nov 2021 10:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Kz4Q/8chjawWVyfiFbCWwPgThXhWzwqj/tTtY6PkI3w=;
 b=EBPgZ/tkSsAK0qw/HRk9S5m+06jWSMZ0m9f8cEB2tuZxOHz5nW5BNCQx3rSVfRF8xxKT
 N73a9xb1WJmEqlBBSb56bXKuFs9r5z27uePDeBQYTco0XgP/zJpmGwvvRS1oMWd8qOya
 LxVvkMQO+Q+owFRYb2DJVS/qtv5BzEjm81uImaaN1UG0AtmPtEQtGwsXdDXB+33rQ7R/
 hAbiqM35KpIzhEHRnLhQf4BjoYep83R9qITs5TjbhLNnGDuFZTiyvdjlgWpFwAZ09JQw
 fUdq+aLEwZKDnLku2b398MUsmme7IR40xFAENzF8xiCVq3HfGvbBftQn511UudvKXBq0 vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhtvx613-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 10:02:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH9uTJ5130562;
        Wed, 17 Nov 2021 10:02:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        by aserp3030.oracle.com with ESMTP id 3ccccpw1gs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 10:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZAGS1M7l6z8MPuX9bWDYb0nm+RR618RKsK+znGUxMQkBFIo8f0rQ23aARjLs4/dLWM8FQS8vh6z4kCMcoYGIablKcIFta9EPY8a8Qt1/3NVp+JIccmxMJ94gprlXnV7i4je5uHxplvrH5Jpq0db/D2Sr8CL5Z/ZLWvW01S7+rMCzhNcjr0jptWTcSk+cBakWBLgVKBjcw/zG7KNF4RyIN73eFq+TMlDaTaX4QjHf+s323Sym3GJdRFuoRZWbDMugMkb5UD4hf2KySCtOD/q+R+VyQNReAcBAA3xHPu5y0IIg7DFVD79ZUjTETy6FClmpSj8vKuGOIbVSohabObeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz4Q/8chjawWVyfiFbCWwPgThXhWzwqj/tTtY6PkI3w=;
 b=IYn7CiB0U3GYAl51sRuLAZzaXmkQEFjXk8WcATQ5Mvyv6vR/WHUrAoMG4uqRTcxuakM5x7Riy249YRl1B6NrVFHXMkHuSLJqdeJLD6oLFD4E+EZT3athbiUXf7IoUoWVPKGU5zQdwcD5r1JTbt4RNtFX7h2QF8uTIVLhkbOs31RqjalwdFfP0Rz8kiir0ER9OTiG5AO+20gBOMYIp0pIGkB+v4+6ktOsd0bqh2Rc60Y/O8l9TNNvzmiSNPUsei+VZxy1HSkNmBbiqnr7ld1cyULYtrtGlxcoaVuJkuK/0X85HsTr9/2wv+VSySzhCt5rCoqt8owdImB9a1UQKvBO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz4Q/8chjawWVyfiFbCWwPgThXhWzwqj/tTtY6PkI3w=;
 b=OfVSsPQbDPUuq3a/3NNLVwLEKkqevv8we8y6rfN/nRXoQZA14a0V5K6zzuRslkYSdvqt/ipWIOXR01SXwemllTUhUT3HvD/U857qIUzX7pvLQ415a6rKy2dogJUNd+oz/x/9dJYItWkBnekCmMm58M+wnsbt5dlb/ySU/CbrZnY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1246.namprd10.prod.outlook.com
 (2603:10b6:301:5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 10:02:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 10:02:52 +0000
Date:   Wed, 17 Nov 2021 13:02:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/13] media: atomisp: sh_css_sp: better support the
 current firmware
Message-ID: <20211117100238.GL26989@kadam>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
 <f0c9b8ec25fedbfccac6d14ff1add2d40beaa088.1637140900.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c9b8ec25fedbfccac6d14ff1add2d40beaa088.1637140900.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by MR1P264CA0097.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:50::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 10:02:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77ff1894-996e-4047-e9c2-08d9a9b16b22
X-MS-TrafficTypeDiagnostic: MWHPR10MB1246:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1246598F520824D39434E7868E9A9@MWHPR10MB1246.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag3qWhr+fYCD38SggZwEC99ypx3QWv33LaBtjwaKAiCQrWluK3RSG6NBmotswj1TtC/PF/bEGjsFl1nbxbbdRa0OBSdIVnVaCkyx3SWqBSUXfrujosm42W/n4tfZZbjVww47xEsGhdpYxi0cJqKl7/d4eAEQT2uvTiR4cHIYaOmmlS6JNzWO6tD9YljOKalRqsFRYybm2a0Fad6O0rYM+2tVKivmArYOivwpLACDQNlP5fBBZsy1YEkl3Jer46cWf3ptHiujQAU3ManUfxdF5tUSrCdixtHwxa+vBxpuD7pK3c4OW9VcbC1ReLwiQW2xvmUKClel3MuS8w/aaqvVvA5a7RIXUCz1Ge/f08JnPl4teymu6hFx4+/13OEtuRQoHFlo9G0hBG1ubDLCu/ygBrmZCRHamRcvwwSwOp37OWjIgmlZlzjaTGIrAF5FHCdI/+526RZ5iwTqOc/yvtGJ4f0FgfTZVUCpKZpmfk2f5MMf2gzicAj59sXWN9r63ND1HYDoFTTHsFOod7wxif4cD6PjnvS8SNs6wtOWQLOCkA7GlW/H/t9EnlOJCIzSUFbnyt7rT7eA8Lse9U0fShsHvJofW8TFyXHS+6VcbOyI4xocAORTvazp3ag0jvQStwOkA0+w9YggkGx1/gIE+dIAXLfd4szneYDdulIr1sYChB8WHM4oN9q8V/UMDxqs8C30aCDDfuQmiciJw2SbFmu/zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(66946007)(44832011)(66556008)(26005)(66476007)(38350700002)(508600001)(956004)(33716001)(2906002)(33656002)(38100700002)(316002)(83380400001)(9576002)(54906003)(55016002)(6666004)(1076003)(186003)(8676002)(9686003)(52116002)(8936002)(4326008)(86362001)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WTMyzG8bBNeuJTHhTkxULEYdJWNk4HsHdVHLAbkpvxVOTs7GC3za1Tq2Gwsj?=
 =?us-ascii?Q?nN23A/zoiLLKC8jRlccCkOMoc1w27ROSdOZE+DFcjN7l4pQUep8TFcI/ikoh?=
 =?us-ascii?Q?b9PUBEunOKurpXR9QkjGbVbW5R6uy6Qx6+pwK0H4X4lAc5ReS/EE/Qoertwl?=
 =?us-ascii?Q?fH++YqfY/Op4laqPlNmVla2EUULeanwljnMMpgDnw/W3DALRQVpianXmx6FI?=
 =?us-ascii?Q?XG0e2y65zbAxXQt0xWSjU9J8Yy5E95CQ2hafhtuvK2BEP25cKkPKOt+Xn5Ul?=
 =?us-ascii?Q?dgTE4YU/mqYPlh6VYQktTYdiJ9S6vhJrw+bp5zpPRBixAx8txkgQDtQoqBgH?=
 =?us-ascii?Q?Xyz2dJ1kL+xbyKmyAzg+6yfsaC9HiemwnyWkc+ovycrOmx0gmmFXqscdMPGi?=
 =?us-ascii?Q?zq9EEW59G2P11d3rM2Td+qqq6OMnEJNwsSrEO0O4MehqyfhZTe0KPonn8Ys9?=
 =?us-ascii?Q?BAxTqoycmKwn21MQjYJk+48FCtekM06FawKMBLhn1jzJPNwbo2zFF59lUAq4?=
 =?us-ascii?Q?EPOJ6NZgNqTc0QO75jdiULIZIKtB9H6turvMhZHm3Nd2YJCvJn5j2r5RrHfh?=
 =?us-ascii?Q?+JK5FDTQ3ujEXflaNBb/CVhH+DwD94qzfzPeVwIPlD+GsfKfIqUGxud5TqPB?=
 =?us-ascii?Q?adWCuAVrrTBh9A3H9gryKqBuD7jiGFm9NAvbZ9PYNrYJr2dxtVq1XL65F0y8?=
 =?us-ascii?Q?1Q0CcFtWKLNvp7lCQ+wXE/a4IQbOzquIF2tuek7aZYlKZovJsCX/xGQGhWpH?=
 =?us-ascii?Q?uC541f9UwpzTnZehtiQZ0YmFzZBKWjjwJzjdDhb2fM4+OaJSlWY2AUk7I1Gz?=
 =?us-ascii?Q?K8EyD+bnMzR+YQhgbN8Muh+4dWHwwOIFKZ429dBijH6c9zhhrqD5+B9mDKMQ?=
 =?us-ascii?Q?UYcOc81egtKRrhMXXPrEUYx9ryq0bSamJgGgBvzYLzR7P8AE3ShYPJ2JQFR/?=
 =?us-ascii?Q?dAN1cbTJ+HKfS9COfHUAYzKXzX5iU4nEdMUTXHFOEj+8Xn+KWdzFLL8hjxup?=
 =?us-ascii?Q?TUDJdMotj33GPWKlykmCW+tva8k0zWd/6IBFcA7QLeLLv54CTVEmDMlPwOp1?=
 =?us-ascii?Q?Zi6rsCIN2wmjkOc4LSGeZs4cAGCAfpWzDH9SCWZdn5TCH926KFs/KQ2GonxY?=
 =?us-ascii?Q?07fK7uxjNB2KtF56fBviVl6eDYcNvHyuzEr/1TR0tF+A3Ku+/o0dvYflQymp?=
 =?us-ascii?Q?IC8aqVpdqWFSKeu3yxm1KBBC6ux+z0iS1Lhxh6qPNQfRWlSZvCKKOMg3I3jN?=
 =?us-ascii?Q?gifNNbbSLCDwTB2+RtFBg7yiWeNBOojQN8aL8Sq7IRPyq5Xrkt9XJfoSmvIq?=
 =?us-ascii?Q?9NDAcYN5FHP2j0a2Kq5cd4HNPNW8bNqgvv6KKGvydJDjwTlJNi3TEd3Y9pxN?=
 =?us-ascii?Q?GCXnvl6sWQoriEIX/mynY5TYkjCN/11as8N2/Iw02gDd6RC+BZParGlXtb5Y?=
 =?us-ascii?Q?RixmL6+unGJEbQ/IVbndi6rQOt5Y2HmV7ZFf4DNxw2j08CptSp2lGKj04IrY?=
 =?us-ascii?Q?WKClptxnJNv1EZ4Q3N7op6vTcZibhBmYJj93zKWTO96pPUwoANIlk5YqOIfz?=
 =?us-ascii?Q?f7I88xzgtbgknvHo5sp+W9eBr4mad3rTMVou/ebgS0M59MzotGMvDmMwrz6O?=
 =?us-ascii?Q?lb6KntbpUzb7EW6G1ABRuW2kNujXxPr1x7yZcy1qARWYgKmrPkc93w7R7ueJ?=
 =?us-ascii?Q?hXbSpb9G6+d6mZLmY7GyYT5FUVc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ff1894-996e-4047-e9c2-08d9a9b16b22
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 10:02:52.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcNOTjRIga4RtZ0Il1SJukrmw7IG35LmFPeK+FvyBKzVltRWpOJ3B/WaaiKvrJkp+XD+GiwJLiYqcPk+t/Fw1h23AChxY/1exqGLVST63dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1246
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170050
X-Proofpoint-GUID: Mv1XKbsi2YQoEtAu8Vn-s5xgUvUZikM8
X-Proofpoint-ORIG-GUID: Mv1XKbsi2YQoEtAu8Vn-s5xgUvUZikM8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 09:25:38AM +0000, Mauro Carvalho Chehab wrote:
> As we're using Intel Aero firmware, make the code closer to the
> driver for such device.

I don't really understand this commit message.  Is there a out of tree
Intel driver?

> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index f6db1f4a0e1d..a11078acb072 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -982,6 +982,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>  	/* Make sure binary name is smaller than allowed string size */
>  	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
>  	strscpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME);
> +	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;

No, need for this.  strscpy() already guarantees that the result is NULL
terminated.  That's one of the main reasons Linus invented it instead of
using strncpy().

>  #ifdef ISP2401
> -	if (stage == 0) {
> -		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
> -		if (!pipe)
> -			return -EINVAL;
> +	pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
> +	if (!pipe)
> +		return -EINVAL;
>  
> -		if (args->in_frame)
> -			ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> -		else
> -			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
> -	}
> +	if (args->in_frame)
> +		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> +	else if (&binary->in_frame_info)
                  ^^^^^^^^^^^^^^^^^^^^^

This condition is wrong.  This is the address of something in the middle
of "binary" so it can't be NULL.

> +		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
>  #else
>  	(void)pipe; /*avoid build warning*/
>  #endif

regards,
dan carpenter
