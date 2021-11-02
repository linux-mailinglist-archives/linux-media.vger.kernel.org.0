Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E607D442C7F
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhKBL3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:29:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31454 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229810AbhKBL3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 07:29:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BEYld028997;
        Tue, 2 Nov 2021 11:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=2piEqlnHI15WL5RWfTrSyzlD4zMlNuvDtXq+m/Kja3g=;
 b=GHkyLdU0bvb22afZaUl1L1J3v0wjEGh699HrgeCGBheehZcMnvsz3xaHE0u+F6FGPQKp
 DlhAjSkfZVH3mUDo9yLIiaT2uV7wsqX9nRC0iQ3NtKOzF0GJ3FmH++HaLVXVUw+pdwKB
 YImlTVOmK3UlnL1u/fW8iBEnCmVfureWhH6rRISSe6JrlQ8Y/zlypbNX3DtPUrrNZ5l2
 Ksq+d+pl0x+0/L2OusQVnJPgAGtOE/odmonZyPliukNRisuUxkHMLlQzks9J9P7VX1ZY
 Z5WtJj3jUPZyruY2lx6MmcpRnEIDFNesEPVGMzDTeqPH00Ml3umI6LuOWdS1uO/20LSW bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c290gxq11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:27:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BGJ4E078947;
        Tue, 2 Nov 2021 11:26:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by userp3020.oracle.com with ESMTP id 3c1khtb21v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0prNxzo5ae3Uu3atqAI8iRikUXQns1W/VbgpGOVINZEwaVmBPpX+RCI8b9pB7daH1cR+6nOxiL0uSkMUUFr6Luuv804KZo/068dMAXGMCvlO97zwZRMn6i9NOSVZjT6yClmnYmGQJhMJyzM+Lnti6lfiAfUQ6KPb7NOLOhg+RrdsUjWNwmc2uHOU/xCWncWtak5QCm9PwSdG1s5FlNOkvqgXBhPQAPkFgrPRaKvXmvuCONJKNAbh+TTKQ9yGIgGYTk92azxx0ghTEO+EwozLceSQN2DHMqWtcvpNh98Ef93JBCqgbQhqXsazMvT2DGx0WMt8OsmRgfBWoAKWOay/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2piEqlnHI15WL5RWfTrSyzlD4zMlNuvDtXq+m/Kja3g=;
 b=Y2mRbJXSL/ghdTTn7mEwO+xwJZx2Pu22zMqLfw8RYhl1SEDczPWNHXwR326+8kBRB2TdWepshhnwEnNfblYop/VvcjfMTnwsbzAKvgz81cOTl2m9M1UBy/mLxByRXpLojdvycPDfAu3sEE3d3s1j4eONnW4Cixu+M+rFnE05ii9Hcn3mgfWwOWRmNITuAghhwGMTuZPgaCS/bjE49mCzyYnHeo6HVieLv8gIVYMl5pDNnnkc41eHPa8oYTioH4+V5yE/dL2a3dsprrobe7zqEFINM4d54Wgw768cFRTtTcTQJ50LCTfo8Jgv3k4EvlxQLBcM1FJlkqyAM1V2YGZTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2piEqlnHI15WL5RWfTrSyzlD4zMlNuvDtXq+m/Kja3g=;
 b=JjqbZ8TrH2aS/PIBMb21rMTxQmp6jVWN6+3Sx0LrY/laqU15atI724v7No+PaUlESi6K+RwY5FxWZJ/rWQvLLPaDrJ08MdVpVgnFmDZAeQ3cMLvob+4FhWT2oo0euyV1Gv927Fw7ZVlxPMULWRloFsM2o35KxGcZvXkkJVXPBdg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5667.namprd10.prod.outlook.com
 (2603:10b6:303:19c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 11:26:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:26:55 +0000
Date:   Tue, 2 Nov 2021 14:26:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
Message-ID: <20211102112634.GB2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-3-kitakar@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-3-kitakar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::29)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 11:26:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20f3ca8c-d1a8-4f1a-ed97-08d99df3ac9d
X-MS-TrafficTypeDiagnostic: MW5PR10MB5667:
X-Microsoft-Antispam-PRVS: <MW5PR10MB5667B435559E2AE14AD1A76B8E8B9@MW5PR10MB5667.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugABN88KlCYiwxznHlsdur3IuWoLN+iUYUvqMNZIGlq9n+S75wBRZ+gPrIF6C7hp9BApGQdTCYkFFSz+9paSyFJ6Go75kactA9JpQFRdyy7QIeRcZdKXOzcj8LBUgb3JAgHBrR7SU5rbmhx02lrvKwgUedszOngBHj1tAo2fWF2mGB/Jn5aJi64eQVtjZijrQ/q3OdQ6yRxq2nB93D6uOduACJ9LM9N5qWT/2Ssx8LTluoeZFybecGqMjGwIxH16J1e0WLJbCbR/DpLhPsoJ1beFIAPaYIBhdu/4PvUurRyGJju0a0W8Hd+4m5h6ZelgLfvCC4Z7/BOtJzdfjic/iKOD+zVBdbup9rIir0mYZv+kbLtvBiVq79HqniHgPcY2rvY65LmH9SAdq47IGrvLpFzvFzMvB0fKTLouQ5fai72ZPhQWaTVt3wv4w9NOP8FeQDdvgbzQ2BjrEUs9QbDn4EMEOd5NI3JxUux2twKZ3l4QpiqquVg5wgozADMJmai2I/7UiQZWtY8LCUWUXoR7M6FN8C7Z6KK8rYnTdDaR5sVC2h+zzQk7QRlrk7t9pRgC7LGVAab2C6xUDvLTUQrb1A2vv6trRLrXworx5t7o5oD0I5yNTXu+pVTJICCIiIcn2rzOuSZvbxRkkrEOo3SVFfOTIjgieBWbzwZByQM+fB3zpuqjuvaB60N3jusrWTXbf++Jt8G8AI0kvW85RLSyrsAEiU2CPqYpZm+d0EF1DPQ44yu7dp11lblv4nLCRq39o6clMX1Ct9J3ffusBuIlGR6JptIrScu2av2ndKE/6/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6496006)(6916009)(52116002)(956004)(5660300002)(9576002)(186003)(26005)(33716001)(7416002)(86362001)(33656002)(316002)(2906002)(54906003)(38350700002)(38100700002)(4326008)(55016002)(66556008)(9686003)(66946007)(83380400001)(508600001)(966005)(8936002)(66476007)(1076003)(6666004)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZSNX74WL87lQzObcWW6WzWkZC2sqWsLXePXq22rjD6aSiWdj8eiSTwFfr0C?=
 =?us-ascii?Q?LzohsrjI1v6VdR8FB+9cAHoS0c7yAFGFY5tOjjZ4+1sA1yZ6BgTrXHMi2aG4?=
 =?us-ascii?Q?DpcZS9/Ik988nuo+eEW5ZV8lT8cIy9mniVuF/vaO5GPc6pm1T3iQorVXvTzb?=
 =?us-ascii?Q?loiQF9g2ItTahqcW/zRCnd8zoVRxYdDAARJ8rcJmqsY0qvrbN1PExmKduTWL?=
 =?us-ascii?Q?TgM4URJIsd6NDUD9485JXDk8facuKT5OHJY26E4HlVNMJcA2IrprpUWYmeJX?=
 =?us-ascii?Q?RIl84QUMkqDahexoSfSQmX6e+Ur/rBqwBG2KEBOPbewcfQ3iPknh5skgS2H/?=
 =?us-ascii?Q?+j/wMhWzn99mQQXOD1EvQAtvNX9HJfR+6sDQBBZojZ+XLkVzEJuu94txAH8b?=
 =?us-ascii?Q?cKanw9CQQcjseS1hpDY2ja5RA/S6F84zkiTS9O5vGh9DGPA6aVSyunHNylXD?=
 =?us-ascii?Q?IxFVJu9HV++Uvt1oN1AXwf43ZX7RgCj/87YS2lWIinp5oeHDwI9h9PiWcKep?=
 =?us-ascii?Q?4ltupm5VAHSld8fZpVLL+T9n8tyqsI4/4ys534ZVGNJYpJaBmOSGu1Esa9r0?=
 =?us-ascii?Q?6uSHGGNM5hOyHbRh7leP/x86jxfmoDaoG3wRughkqIx6VNvcyPYAbLB5a43X?=
 =?us-ascii?Q?GPEg0O57LozNlGMNCdQkQZZJubhXJLxiIOlGbVI9kwTRutf1Trnu6ZrIfZzE?=
 =?us-ascii?Q?H7Q6aC/EHhTqb9RkXrQFybypDNqUV57UL53/xiE5nNVGULphAtlTYD12nmbZ?=
 =?us-ascii?Q?H0HOm3KeKK0FyoJYra3pTOtnKLvkzoFmr4/uWHHybsVqop60ENAPzQlVcXhu?=
 =?us-ascii?Q?U98n7TrVEy49BwCWHhuBiJz+QC8fRDSorx2sV46BZgfaENhiw1xnoPpZ7k2K?=
 =?us-ascii?Q?odlqd0Sh7+tSb5iKYpLHzEU/kGX7cIwT6113cfwYy8HG2uMCWA0cvGdC+aEH?=
 =?us-ascii?Q?9jtrSw6n42Cv0r1EECdkpNZVizgBXeQdUAxoY7GP9R630lHUtZbhMYjDxWWH?=
 =?us-ascii?Q?3vdqjOaHS2TUX7Cm7VyYbHri5fJYIo8C/IYGUPZ5fx0wUjPdpX2I3EHG4fxm?=
 =?us-ascii?Q?9mIVIx2VVKV/5yjf9B0In6F7jYaMFZCDWvw5WuBnJzdpMkAad4hMYIi8zjin?=
 =?us-ascii?Q?irDISce5T8bsQG/imjWYaeIwvd8YIn01pDJGPRhcywe5kAzDwco5DvT/SqCU?=
 =?us-ascii?Q?Gtmcv4vrd0V98c8pxHFSTAkIwx3kqmRD31rlGM3mf8+CYyqtTkARrPYA6Aeo?=
 =?us-ascii?Q?hJgPjpqpZk2abPGS/oUt1Wy+PdFuD/Q8nJrRr/5fhbLxdq4VXCB7Bv8qKnvC?=
 =?us-ascii?Q?X7j3hBB7c67VuzstX+H61AtHJnLw5B/MvLSCsC4cALgwjlf+x9y1qC/F+tVR?=
 =?us-ascii?Q?+tiH4ags8zi74vw4/gbpnbHhRMkSkYXObNoOFbI2H6rWSXsBA/vGVqACUHrL?=
 =?us-ascii?Q?gfz6FZLc4wsYnLrQ6iiR8J6jzoWs1zXnEM410Y3nDceXRBU4772Fjcgz9Gic?=
 =?us-ascii?Q?2ugni7vIl9K2Ee9e42V+cZywXqHVapH3yOPzNe6DUEAGE6GAZiYgpB5fpu0b?=
 =?us-ascii?Q?cn7//eqiSTnMBbR7LCeVHeJWBpl4xEOw+8PFXNtb8pffmyMtJ9MU2F0QeV2Z?=
 =?us-ascii?Q?7Cjl/ZxENAUJXomQtbkaRuYqDqZsLg7zNVQXwUv78vgSqwHf8YCjslL1NYzC?=
 =?us-ascii?Q?u68xlw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f3ca8c-d1a8-4f1a-ed97-08d99df3ac9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:26:55.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB6pH7xne2uMesKUpOPvT2qa5nrPDHfkA0RHiAYHtlJZFUVotzWKn5AI+vHyPVOMlpTDLnoHr4pyY/54Vw1PZFYdLujVnWv77LHj1cdmRnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5667
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020067
X-Proofpoint-GUID: NER8lUhBCZKIVN8J0IDC1UQVAxSpItYd
X-Proofpoint-ORIG-GUID: NER8lUhBCZKIVN8J0IDC1UQVAxSpItYd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:19:42AM +0900, Tsuchiya Yuto wrote:
> When comparing with intel-aero atomisp [1], it looks like
> punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
> up case.
> 
> Code from the intel-aero kernel [1]:
> 
>         int atomisp_mrfld_power_down(struct atomisp_device *isp)
>         {
>         [...]
>         	/*WA:Enable DVFS*/
>         	if (IS_CHT)
>         		punit_ddr_dvfs_enable(true);
> 
>         int atomisp_mrfld_power_up(struct atomisp_device *isp)
>         {
>         [...]
>         	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
>         	if (IS_CHT)
>         		punit_ddr_dvfs_enable(false);
> 
> This patch fixes the inverted argument as per the intel-aero code, as
> well as its comment. While here, fix space issues for comments in
> atomisp_mrfld_power().
> 
> Note that it does not seem to be possible to unify the up/down cases for
> punit_ddr_dvfs_enable(), i.e., we can't do something like the following:
> 
>         if (IS_CHT)
>         	punit_ddr_dvfs_enable(!enable);
> 
> because according to the intel-aero code [1], the DVFS is disabled
> before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
> "writing 0x3 to ISPSSPM0 bit[1:0]".
> 
> [1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514
> 
> Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 0511c454e769..f5362554638e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  
>  	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
>  
> -	/*WA:Enable DVFS*/
> +	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
>  	if (IS_CHT && enable)
> -		punit_ddr_dvfs_enable(true);
> +		punit_ddr_dvfs_enable(false);
>  
>  	/*
>  	 * FIXME:WA for ECS28A, with this sleep, CTS
>  	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
>  	 * PASS, no impact on other platforms
> -	*/
> +	 */
        ^^^

>  	if (IS_BYT && enable)
>  		msleep(10);
>  
> @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
>  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
>  
> -	/*WA:Enable DVFS*/
> +	/* WA:Enable DVFS */
        ^^^^^^^^^^^^^^^^^^^
These two white space changes are unrelated.  Please do them in a
separate patch.

regards,
dan carpenter


