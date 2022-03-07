Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28234CF821
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 10:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbiCGJvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 04:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbiCGJvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 04:51:05 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9192975636
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 01:44:47 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22790PY5009205;
        Mon, 7 Mar 2022 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=zje11pEvmBlPCUU5tdKt5CZ5jF5CR7xUznr7VaxfzBk=;
 b=DdRvxFk9EjK0g/VjhlL8qpOuiJeYocRLlzPqbDEDX7fPFvNlGtMmyLLmYzkUVpK/QprJ
 r7nRCrdtJ6P0RxkEJrvuc2wGtje2XjaFOz3GGEDmDsswDSGPHJl3t30dZa6pZZYkAjff
 saIA8Z3yIGjLGzSk2eSNBIocBYXASBqlieM3ck+mwjv7gHmg62kV9EkpsMmloXiq0yO0
 bKVCQeheeFdyLsrsnXFx2bRWi6nKUG0lBQ/On5NDul8tUT7eJKgsy7K3ELnfocVlLVBF
 DeNnRY/UD1nZfehTVPgI7nbXDdDlY4pMvEgEhu3GQ8oHROooZpTQa7o5/md7YE58TmTD Fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0k91u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 09:44:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2279fW9j115751;
        Mon, 7 Mar 2022 09:44:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by aserp3030.oracle.com with ESMTP id 3ekwwar0h4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 09:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRtFCxsYBSnJX+MorIDrN+5jpPag3rwdJYdt5ILUTS+y+H8HMimatjGkhohGV0zR1XNGtyG8VUk3pl8CM4GebxlyZzfqxVEKvFL4C1KmQZ4Oo7iyTnmzvFj4Rgrm0nJd++bctO88A2dMxldgmf/N/81Pq8i91QjPpHlmBrtx7ioaDIEwwjmtlPHILK3+AwuN+/QumvfFA6yv4CxJXWmSbtOskICQ2zAS/ZO99FjsSJ+JjpLDCrM2XbDzNwZ3truKmfFHInDJ8rrrBTXoItdeyMpYRXao9GDlqpUNnpTuuDKzcoAFWXFyVFBlnFE56aE+aff17n/jwMAHRbEqTPY42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zje11pEvmBlPCUU5tdKt5CZ5jF5CR7xUznr7VaxfzBk=;
 b=PPJRfypHYJyqqWk5/wIRVfqiDCMiXebCB7T4yr2/oYLn0qNVsXGe95UFdsIYgOIse5oUrXlGr9WZXdVNkBJws/WdlghgfWGP8czA3RWALOO/VxuYcGZorStU6KJY4fgkbUKHdFwyTdbT2bLRgasFxIrRpirWKG5fuPbCILAfqK2uaPxFxM0TFW6vGe0ZuiwRG5IyFNQbennQOxUTkNWLNzisx7lCPh3CL03ZCv01sWohWL90B4D6pjr2cyy017fQo7f55Xmo52FIfxfVA9utWbQRJtuw8FwSNINRCoxDgbDG4YidTZ7xtB/K/4TOm1FpzuZ/WGvnMO35hnCQ705DbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zje11pEvmBlPCUU5tdKt5CZ5jF5CR7xUznr7VaxfzBk=;
 b=qocOSmqF+Rdp2ISwhZ8dI7oZqQkZJx7r+dKycS+3AIQjGE1sYOEkD64NsbmPwj9jwtzZFVdpcL+Eq0gMPyL8Tex1bfcwqbUk+mMcABsJUj/yHXhjwWLj+LR7LyEB5xBFpQRtjWWdx+vrHDU1pkEZ2PbFAnHVYRwfj+gdSu/ReSE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4997.namprd10.prod.outlook.com
 (2603:10b6:408:12b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 09:44:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 09:44:37 +0000
Date:   Mon, 7 Mar 2022 12:44:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [bug report] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Message-ID: <20220307094419.GA3315@kadam>
References: <20220301124208.GA27743@kili>
 <922460bc6047e1c033ccff1af77cc07c49af2585.camel@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <922460bc6047e1c033ccff1af77cc07c49af2585.camel@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CTXP275CA0026.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:1::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995ffc86-6b8f-47a6-7724-08da001f17a1
X-MS-TrafficTypeDiagnostic: BN0PR10MB4997:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB4997620C9BB594C6AF782F118E089@BN0PR10MB4997.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKTc0iLVXJr3JTR5PsAuyQMIO+GrHr5SM5g/rjA6SpOVudYhOWYXNKASbleY9xCESjaz99rJLOtVD+HPCP7rZc9dDURZyPIFFufQU7S1WVOMFF9oUGbofVi8tZC4kf6PkfjcUY2luKwxa+ihTGGPAqXpGd1iDb1O640ImM+Lx1pBITXRZ0tyuMLukgnSCKdN4WeTXwDOSKwOetakKJt3i/vN6DNGNV/GWCU1B/PMyEQogqwaVaLwl4VzgocGjZtUAAugzWhgIZxuWyQ2fHw01fCUNgbIfNrtHOrt5d8iI18Xcg7ydvWrFBPIydevAYuFwzlB8eqwN8ROW6y91L56tnTtYRiZZ/q9axOE7ImlPdPRZSdnGsfW4cQ/3exlidOuxt6Ch1snE1Qud5TOj1xudPtYzyk0sTcLQYSJ9s5ULzqZz5MI6TBIsyN0NpXb5ulkJlhInccDdLkMWUQEj8mDLVa7G5y+wOkSR3N1JGL+IcO1wlKRD1K3ju4xdrud1jTk0PAeucH7bA3yHP4D3Ymo3MceKGkin4V6qrsF2nx59MrcrRnSrSvIQBZS5MKbciNo4ZqW39gfEWpUaKpMBAxPPNCo26sQRu4tDz1YZyTYE/S/XuBGJ81Zofo8nRDogF223dfFA0it38vxvjg89X3W5ifE5L0IXNXUr4FQMTyL+U0OUs2Uv6nbCPMV0VhGaqKuqUxYEOJMEUNcgmbUZ/XDcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(26005)(8676002)(4326008)(83380400001)(33656002)(316002)(86362001)(33716001)(5660300002)(6666004)(38350700002)(38100700002)(66556008)(66476007)(66946007)(44832011)(186003)(508600001)(1076003)(2906002)(6916009)(8936002)(6506007)(9686003)(6512007)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPENe/kaytxT5gqM8nkg8BX9dHNjlyCkQniNsLFA7ce4ksp2rv6a3uOczAt1?=
 =?us-ascii?Q?6ZyedQhhup0tYysw3F/5zzva4Ds2C0oAkDBz7tkwmJRbIKL0q0OohPJ4XPg+?=
 =?us-ascii?Q?/ZqB53ZcmGRlIFBtkFWOH2tz3pk5y2ndMQFNz2JJD4xib/M4PgSRtlxfPNbJ?=
 =?us-ascii?Q?3e1qizXQQqa9UmHD1UumMxZ/ZzGZqtYUxVp3uxYSYa0PnzxFszmGspfeqBnN?=
 =?us-ascii?Q?HJ/CLGvNRGuHxOF0cMLUp8qaeM689WW5qCPoDwii13JRcLDpFfgOnNlpa8zO?=
 =?us-ascii?Q?ddvEONYoNAZi3ktUk7Lfj0OImG1yI2bLJJaIm3Fcl06NvYBAuCbnTgvTTCOF?=
 =?us-ascii?Q?VoJI+jzbgTtCn//YiXMOyIS/CIR7f+jfLZHZIpOnbq2AHE/dpzfbClwsKmbG?=
 =?us-ascii?Q?2nrXn3wFj0101N2gEX0+JUnmPigvNiByn2v+R+bR23S9FKTIK+emNDoKZA9C?=
 =?us-ascii?Q?JEElWOMEEDHiTVkHpBuvovXU+46O8J3GEB/QlOU8gUIy+DimgUsf+C+pMRCw?=
 =?us-ascii?Q?GwCab6FYSfD5dm+EHlHp1oHylpyxrinvNWsDdjMYBjG1U3GSpuwMQFfASzr/?=
 =?us-ascii?Q?6zWlgObHQAjp9RPWMODRp2OMNW5aDxhljCuEGgJjhRx26TJbq7qIE7+on2C4?=
 =?us-ascii?Q?upRomSCO5NkZJFOIHUsTTsnP2ERkoPepkey7zbWFZEcpapFGmjaOjTu+QxWq?=
 =?us-ascii?Q?I/QjQpRg1R7ayn7Y+x9kj7FhA/8JuptrFHeRje30ja7SA2oVqxHyuc0diTpj?=
 =?us-ascii?Q?j2xgkSgMP7HbIQb7wcZmekUCI5SRLKzGs7QKR56kZHv8lKW+UDaNNCD0kekj?=
 =?us-ascii?Q?JQV9oKARga/9q5tAQ3yICrcUcZGxeHasaqftX55Asm2X/5W9gHqknWnhv+xe?=
 =?us-ascii?Q?ySqTnrZSRAJQnKymkO1cCXZYbjLchdEXpPkKwsuwS2x2K41a96lxByvDB6O9?=
 =?us-ascii?Q?ZVbnAu4OMKjqXuSUSiUKF/6hTscGBNzstZTVZt4LqKpQZEOFCFOE06NOxUBW?=
 =?us-ascii?Q?u8cvNG2oRoRzRMuBbTt0vedUR7Cvmhiiz7uc9DRlsRD+cPGFRhzqVFM/1HIM?=
 =?us-ascii?Q?y0ZNTHB3AED0DHtetpaglWDxM3HriKY4PGaewAi3B0heDckfd4Woi0HxAMr4?=
 =?us-ascii?Q?ccV1Ep7bmx+diAc3x388XdlZPVMct2N5AWPZESYENQzla83xDoVhYbYl/nth?=
 =?us-ascii?Q?IlfLT0TDH4G1fNax2DdEVqZQOERgEQE9L1TSp5y2ZUqDtduo/3wRXklBQYLG?=
 =?us-ascii?Q?eFPekkXSka8ZES2+CWvlKhQcULrg9NyDH/pFot5Hj6xP2UlX2iMHsYC9Szaf?=
 =?us-ascii?Q?d3T4AjlsHujbmSLVahyUdBugxpfqnHesAQKFJeDkGDVgRc2ALoOfMTkzlsIx?=
 =?us-ascii?Q?jKXza3zvY87ycobHcBLiwFcb8IiDe0wLfNPe7KQPnuYLq/zoT1b7JQzCfceA?=
 =?us-ascii?Q?ihMGaH+Tsjl4oghQxv37UzsD6Mhmj34f8bg/lTI6nr3vUUPV+M5s9Wt9El2x?=
 =?us-ascii?Q?TYjX0H0LcerX9It9lEhx+Pw9Bhbnh9r8o5saLWvMz7Hm3sReCCnS9NS1S7y9?=
 =?us-ascii?Q?PHmq4SUXp3ZyFFcdkUdZyeZpZ+r7Pzei/JLjM0IEA50iZKYQrVzQfR98SqzI?=
 =?us-ascii?Q?Fb0kAWuRx8qyftwS/LRpwg9SJpje1ybO1a+6UML7a5DHsY2zLbiCZtnaF4uz?=
 =?us-ascii?Q?SmIokQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995ffc86-6b8f-47a6-7724-08da001f17a1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 09:44:37.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/9I9SZQInbQgq0Z7tOlTwtlvgxIPhsb4LuNXCM+G/oTocby/YLsiQPtR+U1n+pYlz6SW+yhezap+xrm+C1M0n2oVnVkRgzNOBB2R2vydj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4997
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070057
X-Proofpoint-ORIG-GUID: zFJ4bkdeFJ5znPF9J8qUBQYi_YK9LaF6
X-Proofpoint-GUID: zFJ4bkdeFJ5znPF9J8qUBQYi_YK9LaF6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 04, 2022 at 03:51:16PM +0000, Mirela Rabulea wrote:
> Hi,
> 
> On Tue, 2022-03-01 at 15:42 +0300, Dan Carpenter wrote:
> > 
> > Hello Mirela Rabulea,
> > 
> > The patch 2db16c6ed72c: "media: imx-jpeg: Add V4L2 driver for i.MX8
> > JPEG Encoder/Decoder" from Mar 11, 2021, leads to the following
> > Smatch static checker warning:
> > 
> >         drivers/media/platform/imx-jpeg/mxc-jpeg.c:1070
> > mxc_jpeg_queue_setup()
> >         warn: potential user controlled iterator 'i' (array size 2 vs
> > 7)
> > 
> > drivers/media/platform/imx-jpeg/mxc-jpeg.c
> >     1053 static int mxc_jpeg_queue_setup(struct vb2_queue *q,
> >     1054                                 unsigned int *nbuffers,
> >     1055                                 unsigned int *nplanes,
> >     1056                                 unsigned int sizes[],
> >     1057                                 struct device *alloc_ctxs[])
> >     1058 {
> >     1059         struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> >     1060         struct mxc_jpeg_q_data *q_data = NULL;
> >     1061         int i;
> >     1062
> >     1063         q_data = mxc_jpeg_get_q_data(ctx, q->type);
> >     1064         if (!q_data)
> >     1065                 return -EINVAL;
> >     1066
> >     1067         /* Handle CREATE_BUFS situation - *nplanes != 0 */
> >     1068         if (*nplanes) {
> >     1069                 for (i = 0; i < *nplanes; i++) {
> > --> 1070                         if (sizes[i] < q_data->sizeimage[i])
> > 
> > Smatch thinks "*nplanes" is controlled by the user in
> > vb2_create_bufs()
> > and it can be up to VIDEO_MAX_PLANES(8).  Meanwhile the q_data-
> > >sizeimage[]
> > array only has MXC_JPEG_MAX_PLANES(2) elements so this looks to be an
> > out of bounds access.
> 
> Thanks for pointing this out. I tried to run smatch (for the first
> time), and I do not get this warning reported. I'm wondering what am I
> missing?
> 
> mirela@fsr-ub1664-134:/workssd/linux-next$
> /workssd/smatch/smatch_scripts/kchecker drivers/media/platform/imx-
> jpeg/
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CHECK   arch/arm64/kernel/vdso/vgettimeofday.c
>   CHECK   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>   CC [M]  drivers/media/platform/imx-jpeg/mxc-jpeg.o
>   CHECK   drivers/media/platform/imx-jpeg/mxc-jpeg.c
>   LD [M]  drivers/media/platform/imx-jpeg/mxc-jpeg-encdec.o
> mirela@fsr-ub1664-134:/workssd/linux-next$ 
> 
> I can induce some errors in the source code, and then I also see CHECK
> errors.
> 
> I have built the kernel database with
> smatch/smatch_scripts/build_kernel_data.sh before runing kchecker.
> 

Oh, sorry.  This check hasn't been published yet it's something I've
just started working on.  If the checker is wrong just ignore it, but
could you give me a hint so I can improve the check?

regards,
dan carpenter

