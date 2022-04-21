Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A67C50A21B
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389161AbiDUOZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352115AbiDUOZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:25:33 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009233CA61
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:22:43 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LBwbRn019753;
        Thu, 21 Apr 2022 14:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nt1Kb0Tlh7IntxaL+Aht4MVHaOGIT09PdVyd60eqOiI=;
 b=Zbo0eQolonIqKTLeSLgohNgGcuWxFLx8EuLrUnrSMEUu2q7zSqG+bhqIKgB+9D+963N2
 0jnt4EVZW5AYLChw5Fi80Rnx1HE0R5QUt/epbJsVadjkfyK9uZOIV9dkuje71TW7zETB
 kSXsFanIgn/L4r/jioU6Adb4s17FyZO+p9H/okb7QlsZKSM6+iIa2S+NGLFIN1EQJwia
 xvH36gvOmrIgQ6gLCebybiGddc2j0pY1TDCEvuYacqGmi6YqOnmBh2HQTlK4bl+NQ3RV
 OEgmIpSfW7o6a+lMmQvwj/YJ14Ukgaj0ig8gjC/8Ei86jDHRpugfs62koLEXXlV8USWL NA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1c7qg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 14:22:19 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23LEFq8H011302;
        Thu, 21 Apr 2022 14:22:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3ffm8bcvmk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 14:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRxKvGN8LoK2TMTrEhXayM1x6lwOxMXOZTgg/ytRbivM7ObQsV2t54LemBeXrm//L/9XQUTxfB6p6FyOe7hSt7IEHHZQn2d4ujDpl+Ee6Rl1hX1uxOyU+zal9V8jmAfA0pR0TiMDzqeNuSKKjQyU+KDKxT31oflYpWspP9PGUon4Rl5puG4GgAucydE2sI+xpEIBDKQiFIQyRecb1ZeCjTt0JMU3TufIMX3nroyl9YFYaHyft7kfuJBK3XqkTjhK/VY3bIuycZoW/krSQp6Ef0aZRPhrYFR1Lr7jDvBU/YSDP3Q0vJl81JxFK3lh7itZg5YUq/JqW2NhbnG1D7WTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt1Kb0Tlh7IntxaL+Aht4MVHaOGIT09PdVyd60eqOiI=;
 b=jZ/+TCkkrVziJszhz6OpHzMWgJ1icLlg8jrPlspIJ7ru1dE8qKat3pgng9oeAfxIWXBaccZQiaf8vhHcuMJn78+xTDljFCXISb6G36ErfenNqfNR5cEs+2pCHISfToeQwQTjdkMJYWZZ6V42ocrYsHa6Z1OXFGR26iy5mnIhbDuri80hYs57Gygk/o4PQpZwl4zwWU8P+UPJ2tHExmT9bEEnGlRBVUyEf+uTIFrjqKs68giILoymO31BOKJo41HA7WxjgZh6QBBX9BC2iVa3pb5JxMVuKnkw+5fBbDBrA9Png5yugExJNNlUlqkUqk9P6UoCDBpZLXPFMZ3KKZCVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt1Kb0Tlh7IntxaL+Aht4MVHaOGIT09PdVyd60eqOiI=;
 b=M1VNrXYeObniiMatbzdeF6h46hIFdJwIoSyWY7KPAe0zKwF3McSG/W/YjYJbCygBLVXiSXM6tT4Qq5+Sy8Y40eOYJVRUOsFuuG+6WSahWXbH91yshdwQfkGsEjZISHORkCgWl3wCTWVKSNbmr2C2MOaNdjfXCcHM5rZau81DKVI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3223.namprd10.prod.outlook.com
 (2603:10b6:a03:157::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 14:22:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 14:22:16 +0000
Date:   Thu, 21 Apr 2022 17:21:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <20220421142153.GA2462@kadam>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421002316.873109-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faf55bd4-099d-476e-2a09-08da23a254f4
X-MS-TrafficTypeDiagnostic: BYAPR10MB3223:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3223D0BDD8BDE07A40602B568EF49@BYAPR10MB3223.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gY2Wzi8Pei/Ydxlyo7XdvR7HMWVcZ0fXGVcnSBrxk4Qr6fyI7T7/1PSRLnWRpulQxlHK7rLBHrgbLl13cSGQvGRlhngIY4Y98lIrKau++T2ccjvw2a+Z51fEGz+v0hvII3ROrkXyLJ22h+5EKuhfETyb+2dD7NIXAM6Yp+WH9nwHB/Mbu00TwRSOhQNAeR4McsYO16PmiveGZdos9HfrZhXknMTsToAHlQa0v9wUhB6AY+7MG84fv3lleF+vFZ2E7hD9JFdA68d13mlYLsAixvyANSie5/VFCEijubh92h5PBDGXH8mUZxPc3ZV+Y3LyMGaWmA5wtWMhle9K62XByI/acdMcRUJqTQj0aiYxpn2uZrD98s2o+SeWwLxToQHS3gKOqCrZgayGHbn0RgLevwcNX7h6+k8O1Ni/FqxK013px/feXA9b7DLlUF2Uvgg0lcjp2+8sAzjkJ5PX424arTXqVnhgdVAMva7bo/Eemy4iOMaiaQSm6ZJyTQ8EAPPHG5YTnHxLjZHI3ME1+sYpvhhxY9qg8W0spGGFxF+9j68KT1pHy6se/TgGTl3hcfc9rJnqAcYpAGApPJykAlsKvqDwVvUcxozSCghhzrYrsZuMMe6MdwNltG+whC5ZiAkWjxXFNCUZIfut49FINmAA26ZctShV2goKy6I4icq9a6IZYPtZxN+vIx9Qw3Az3v9mCkM5qZneOrrdP2ABEn7wEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(2906002)(33716001)(316002)(6916009)(8936002)(44832011)(33656002)(6666004)(6506007)(83380400001)(9686003)(6512007)(38350700002)(52116002)(38100700002)(26005)(6486002)(66476007)(86362001)(508600001)(186003)(66556008)(1076003)(66946007)(4326008)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HnLpgxaj5Yc7iPsQj87quGuZ4SHFJaSE/a4yDFBmNR02FcpotnxCDXPETcgG?=
 =?us-ascii?Q?I1OTwxcPsgOU9Zrb+vw6UxndneY7X803VI+ieQJ5hf9EFvn3DIhsLY7ImYdi?=
 =?us-ascii?Q?3mkyd0q51C2cGs6W7QzemsvUiB5eVem4hbxZNQ9xcfS6vtvtLHmH3ZLsXKYY?=
 =?us-ascii?Q?kfqbEVztBmhJc1PDdeeX1AzVWQZnHRJJgnuCZqPUelXsxQVGlp19tAYFBO8g?=
 =?us-ascii?Q?acRgmR2e3qnq9fECZ0HkAXI/3mk3I84UczAF6w2xj9dVX+cMgpGaqvPPEHrr?=
 =?us-ascii?Q?OGD/6fMzIHrzaSUCtv0C5LGKK3nd10roRurC7Pq1LhUozgr5+N/8Li5scc7k?=
 =?us-ascii?Q?aIB/xn1Pgh6FW7Kd1ayUAsNI5EAzf/ej4svo176oZ7GPykkdGaqO9xSKWaKU?=
 =?us-ascii?Q?PsrJjJE+cuCViGrbSlAXroOZxsp8PxepKLcgrspzW/nQpZWpoIZxD8Hj0pJ7?=
 =?us-ascii?Q?RaxuIPJBG1VYlLyC7Mp8Uq1IlrINC8+ztsPGkROAlwuEThJCVtKQtq+a/6wW?=
 =?us-ascii?Q?zFPxYEE0wJVY0iJVpPDrp2efLeJYL5DMg5cJM9bzBmDZRXIYOuJpLmqkFsYr?=
 =?us-ascii?Q?WSxFZsuou/rY+8spNH7tZfHAMpxPINLo80QaieNGUg9PcjP62Y8/y7y5aHpL?=
 =?us-ascii?Q?UlYPxmpOdFgnQRK4a6rI3T6cwcITFbxusr39rCUQ/U5tyvSuwOQf4YDaGmBX?=
 =?us-ascii?Q?I30uHUTQw/bUQdd6XMVWoGiPOVaPsQUPcPjkHZ2gWvIGUxSSADC4MEPpcQzH?=
 =?us-ascii?Q?2IPM2giVfrE2neCLFLzzNgoerwub4wGHwQ2m+oz6X+sM/jay9J7Zsii5fj7J?=
 =?us-ascii?Q?c50FHIxc4xP9Q9UA/U7cIc7t0RdAL+nu8ANmIlh7BW8Ox5iic5LLKcmSTSi7?=
 =?us-ascii?Q?0Y3DK326p/oH2sMxg7ha1rmFQQFsKB3ToPRSsGNve0Gmg6fkwpdhz1t47h+0?=
 =?us-ascii?Q?HC2GyXANYDHL9ZAbayDxVP9eDwT1w1AfwwQHspxWgml84vAtj0reZZNdvrFc?=
 =?us-ascii?Q?fXHWPSbJU0Zs19fktKFiCqXVkyjn0z66Ndsq2Ty/Zu1e37KoMrl9zGHA3pYH?=
 =?us-ascii?Q?FKd8cMumCyycq3P2QCY3sO9vNCRGj7X31lR8PJl3cxiP0VYM347lEGtuYuCj?=
 =?us-ascii?Q?8LxqSPJhx/1GcuaaAqkOK711fErbRXwPbqAnxNE7LEYFFhawPDLBEcWko7iX?=
 =?us-ascii?Q?Oq0zNtW5JCHrOgUBq76wth3dAMEGW9A0jX8ILKKoBZ7fgIVvpp43tW9ToppZ?=
 =?us-ascii?Q?VuWSgKevM8PNO/iLIYf5RFmUlmxOQb4s0zih52oFWBWNOhocP6ho304QvkBw?=
 =?us-ascii?Q?yufS3h64ZmiopsE5OrRNzfT7F5k2M86UG9DXCCWs2OyillHtEKsF3xASWdOT?=
 =?us-ascii?Q?mVdtJXq4fgBnJ3tXJHvGkXbG20TNKP5nW8pgv8voSkCMRnX2bMxkucRLlEcl?=
 =?us-ascii?Q?3jbgi1Zk+AgsyBC9aBQ5138hgH/KIMhQZpjRiEXaNnToq1OV6S9A/0KE7Dmv?=
 =?us-ascii?Q?eLnssddzNrMBIzFnEO9Qzbj9m5TZ8K7mP4rha+qn5les8DX96l1LQMzS48pC?=
 =?us-ascii?Q?FOnuZO3TO9F29JGdQbmubzHgPOyaZTpZh1Jn4Wi/QEripcFzmIia1MXtl2bY?=
 =?us-ascii?Q?BRgBDqNDvGljd1Hg2vFGl4H2HMOHHcA6OTalAfKZc5K1otZCOKe59w2VRc77?=
 =?us-ascii?Q?wdBMabh9xSpnz4jj9PNMVZJC9unVdRT7b2rkc8J3Xj4wiIvifmJ2N9fRANAI?=
 =?us-ascii?Q?msc0FaqfFQz+57LudUkCRS1eePn7yzs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf55bd4-099d-476e-2a09-08da23a254f4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:22:16.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjxBzmNNo0MNviwp6DNQSPJthTKX7t2I6hVOnLkUTNoYFajQnX7l/aO3suCLGtymU0zEFt16yURs0JeS8dL2Xbzb2xZntfpRKs7VsOQJIcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3223
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-21_01:2022-04-21,2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204210078
X-Proofpoint-ORIG-GUID: pi9MFdoyKS0NQkO0t5lCvVjfP8aXO3zf
X-Proofpoint-GUID: pi9MFdoyKS0NQkO0t5lCvVjfP8aXO3zf
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 20, 2022 at 08:23:16PM -0400, Ian Cowan wrote:
> This is a patch to refactor the zoran debugging function. This function
> existed in all of the changed files and they also all import the
> videocodec header file. This patch moves the dprintk function into the
> videocodec header file and out of each of the individual files.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> ---
>  drivers/staging/media/zoran/videocodec.c | 67 +++++++++++++--------
>  drivers/staging/media/zoran/videocodec.h |  7 +++
>  drivers/staging/media/zoran/zr36016.c    | 48 ++++++++-------
>  drivers/staging/media/zoran/zr36050.c    | 77 ++++++++++++------------
>  drivers/staging/media/zoran/zr36060.c    | 54 ++++++++---------
>  5 files changed, 141 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
> index 3af7d02bd910..e35d1f54d9b8 100644
> --- a/drivers/staging/media/zoran/videocodec.c
> +++ b/drivers/staging/media/zoran/videocodec.c
> @@ -20,12 +20,6 @@ static int videocodec_debug;
>  module_param(videocodec_debug, int, 0);
>  MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
>  
> -#define dprintk(num, format, args...) \
> -	do { \
> -		if (videocodec_debug >= num) \
> -			printk(format, ##args); \
> -	} while (0)
> -
>  struct attached_list {
>  	struct videocodec *codec;
>  	struct attached_list *next;
> @@ -56,8 +50,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
>  		return NULL;
>  	}
>  
> -	dprintk(2, "%s: '%s', flags %lx, magic %lx\n", __func__,
> -		master->name, master->flags, master->magic);
> +	dprintk(videocodec_debug, 2, "%s: '%s', flags %lx, magic %lx\n",
> +		__func__, master->name, master->flags, master->magic);

[ snip ]

> +/* Print debug information based on the specified level of debugging */
> +#define dprintk(debug, num, format, args...) \
> +do { \
> +	if (debug > num) \
> +		printk(format, ##args); \
> +} while (0)
> +

I don't like the new format.  It needs to have a KERN_DEBUG at the
start.  Passing the param_module is awkward.  No one knows what the
magic "num" things are.

Using a module parameter is old school badness.  The standard dev_dbg()
macros are better and more flexible.  Just use them instead.

regards,
dan carpenter

