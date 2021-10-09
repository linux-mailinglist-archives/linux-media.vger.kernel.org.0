Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB92A427820
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 10:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhJIIbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 04:31:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17788 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229578AbhJIIbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 04:31:05 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 199490wj030056;
        Sat, 9 Oct 2021 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=gm5oYtTjN3zFQ4O17LLu1xBdSWZdUCCvcWbdJEBjA1o=;
 b=J+9zX2VTY9SbxtL0etOVXEh9TirMXPJ49U+o4fn/6fy1AsofzW4ixRFfcZQzu50kGWKH
 EDLx5Ciciwpbi0iT1kv7e0ii3y8P3DdYeYxGkToMyXAoZu0NzrDMgR9S+46m+ItHClw8
 eYAN/nnO0S/AmHEG4hk8V/e4+wKMgQSQKA6ZaRfyPi9aSwcfKd+np4Lv/g0hE6fBv24n
 FbqeTHK/E4MpTe9Zlzz5I/Kv6D/imXmcQY8xXVWGLPm68IqsA51YVYJsDAgpJhowQBqi
 ZwXWX7W03XVJFbF4KujaU/mhd8lUpNmKkQPE+FmNtlCHPqSPIP2qC5NKA3zBXgTD4eNR fQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bk1gbrqym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 09 Oct 2021 08:29:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1998OtuZ061122;
        Sat, 9 Oct 2021 08:29:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by userp3030.oracle.com with ESMTP id 3bk06t4q5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 09 Oct 2021 08:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhqQoQidoyeLqI0kpnWdMObR2gYMPESeZ9ZuaDvAJUwW45jLeXcBNOo4PUwa5ozI7PoRnLbbnxnvFz4NkET76OSXd6SirUw30n83qNBNb8Rm5ePWuCpxOO+trprt4QUWORHRMeTQS+3yLGAEnF7ZFpuNjsBeWv2Ef1ve9bhce4qm9duO1KVA5UEqXf+27e4LPEiW6xYYJ1i8hgDUaBuXYJMc1ntiJagNUlH5TLniZeUwwaI0niLFrCAMQknItrUZ0oBcBvcTVvHk3iK8T31V6kmQazxwWUXydNawYDeW59F84tlgtRKGZoXrdgAtHbsNrDOG2Abic90RjK2iA/rLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm5oYtTjN3zFQ4O17LLu1xBdSWZdUCCvcWbdJEBjA1o=;
 b=FrEBvm9XJPL/fUKHzr4Cibwbkj3+GbGPA9wSMBCAX0Z5dxnwk7y2V5n4ptt5kdj2aS3340RcnWRENsqqhKvPRozvb5SPc8fmN7ne0z2VsfET6kSUtINp1DM8d/15ZM+0IAxSMnYg9GddG5fUVv74DK54eXP5aCnV/Ath9ID4keeeOkT1q4rYMb/pJnlLPvFtEzD1ado9eb/Wjx1cy9Y3/sRkgQRrqdJjd3/C1i6Arip3XelZUQb2D+wKOiF/mijGZGlZvzJFs+iD5bF21SW+GWYorfs717GGlFaHmePcd1Cq1U/WjvLzfMguZoaFJ3QSsLwNwbV2okwyJiPT59Z72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm5oYtTjN3zFQ4O17LLu1xBdSWZdUCCvcWbdJEBjA1o=;
 b=oMWvwdwWCugjox5S53Rt+5yJzlbbbf3GaI1s+JU9g62sIICU0VnRAaGYUibpCPmZIr+XzEHs08K0W7G2aldMkRyZh7xiN3TRKLxgxhWxH5k2XhqzK0zRzjCJ/Vavn464idMUUsaUTrQikAYQeZ9JsZlvspuYx/lKS5d4R3rCtDk=
Authentication-Results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 9 Oct
 2021 08:29:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 08:29:03 +0000
Date:   Sat, 9 Oct 2021 11:28:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: Copy mt9t112 soc_camera sensor driver
Message-ID: <20211009082848.GL2083@kadam>
References: <20211005092521.GA19607@kili>
 <20211008154924.nwxf5t2qikcj7ecc@uno.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008154924.nwxf5t2qikcj7ecc@uno.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend Transport; Sat, 9 Oct 2021 08:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7291d5a-ab03-48aa-799e-08d98afed9ec
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16168FDDEB57E9CA1998EA118EB39@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scoZv5FlUJZCi5hxL8J98WOVBdyH/kjcbD1XcV8cxqNSgR3FiJDAyFoTTZ9kXjs6AjeXRHRhPR5SYPoWxXnzgMCdLYd6/+j/visM2GxzUAYumiguUfn65gk1IOsZ36RmDpsBAFOnms/Q1EFRTFbZD6STmlgc4Y0COh2jaMOZh/W2aFp3q59BwQlsTVF0smNmiUiU0oo8xoOv/ICfEaBKhkHE/YPVI+PUGF7CjhIieXg5xLOuFNAvyOkMpyka+2+vggYo9BgcmdxGDG2xz7fQXdMp8VmKMNznB7qG4ybAKbJq2d8qjGMst7IJQ8TuSWd3NV1m6B21aB/D+saFt73tZQ+5mnEW9SxJmQWqOHJcrxWqb8nyo/1US1Hl8dkSX9uZRUOcRq4quAaS38AURErAifXdYqoWWyFPybtfekIe/IcNahfAskgf0gNu6S5cut+eb1KADTcR9zTufe927uYGvYJV0NCa4hep8OgHphPVJTWjNII2P9clG/YN4HcSp01vGmTq7YX4F9/Lp0j4CQWYJMG2vEn1H7dA/5EBAXkG2hmR09CeL5LJUjCIiCEnxuKCkz5vLkSyDaQzT20sSLjaeSXYqnrppCXvlO1Bkbo8e+YV/SiapNyyDJAoOgpPzD4pPwUOf07NnCCpJlrLAxxgg+iwndBmVESPi5LpyNikOLv94SPFzeRLF2z8QpZlMq7XuvO6z1eGO/DvmEFs3OmYEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(5660300002)(1076003)(6666004)(38100700002)(44832011)(38350700002)(9576002)(2906002)(6496006)(186003)(26005)(6916009)(508600001)(4744005)(86362001)(66556008)(8936002)(956004)(66476007)(33716001)(9686003)(66946007)(316002)(8676002)(52116002)(55016002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ljHGquHNqV+AtbBP4lu34AM6PTNpQ2O/xjluiEUjLVy9RpP+s6J9Q0K5cPz2?=
 =?us-ascii?Q?+BMFOkjnht/ZLmwJCr+MErGwbQ3/iHDljS9CYssGdasetEDIDmS324WjUtcv?=
 =?us-ascii?Q?ljvj7KfUDTAZpTXM1F31PkKcXFSNy+i/ymucHRI/w1lQGJaNOUfYMcPkRL4P?=
 =?us-ascii?Q?TkL5Orczzn0hcWWq/s6VSlYP6idd/hi9+R5FpmmcNS5L8piqWmEJeArwzEfM?=
 =?us-ascii?Q?KFPMGraM6cvHTke6lB7U2gLZffcGWZynwAdse5npg0UKVrjbic+AptCgfnmr?=
 =?us-ascii?Q?pRD0BewsgsXniTXoFeZNKlowpc373Tn4ii/rZxqszbnWOfkSjiL/b9TE7CUk?=
 =?us-ascii?Q?lkPdF0oGF1JyCdp5iRmNrbUcQbDuuSxxBhaz2YQad1Rfxg85sQ691NrtV3r2?=
 =?us-ascii?Q?oN2uFV4BHgjX6BlnH20o5olYIxl8P6GNGT7p9DayfzR3bpHU08qlxEppt+gZ?=
 =?us-ascii?Q?Y1/74uG3zlWqCNCwlQaVBRNMZ9DQw/5lMW+MLzn+sLorcx+EqADwChKhpu1v?=
 =?us-ascii?Q?ytMBEZCJWH5myymbNGazhAMicMVZz0gBsK7f9TMSDLTrkw9EyYAf8WZhxl9N?=
 =?us-ascii?Q?84xT3a11QsD2RGeKfBlzZYvonPo3bn1O4moCiP8ozQyosgL9eF17aT5O5UrF?=
 =?us-ascii?Q?AOsRFvwKga+oVoZ2ShiOQvwNxDC8UCo5qernumdTtUR7BKc63ab08ijy9Rz6?=
 =?us-ascii?Q?gKFE3Gc3foeJu9ZIv4//G+2iizV2hF10XNm4H4CpxucFf1eiQOnkSUs+apQN?=
 =?us-ascii?Q?mTKBf9TDFThxj7v0aODCCdNX3hH2FrnsosUxEzH3W82EU4Vdv6W0qtufBSpw?=
 =?us-ascii?Q?fBqAKgQzRtXiTSK1JvKnIvd6V05U9XXWJZmGA8CS+wkOkIMh9sOcHbptUJp1?=
 =?us-ascii?Q?9Vij8jajwv5gMbyZRBNYptH+qrYc68I4Q53MV1IbLnBjdsB4eYEABhrCSEnP?=
 =?us-ascii?Q?11aQV5ImEAku4LuWiR6tGJvuGw/+PsAcKNc2MEkvnXGYPNJOi9SH8JAGqwLs?=
 =?us-ascii?Q?mCo0QgXEEuQ+EFeBLtgE/DIeqV8xy5ulOBe//mYrC3be45wzhkIdOwA93O4h?=
 =?us-ascii?Q?b0DbbCTk7ZDHSOwtixKc84I63yRPpbG0hqLG/OU0rfkSOIpTOFns/59zolwk?=
 =?us-ascii?Q?EeQRXLPHDZcnODXTCVfJA7Yx3jzxGMJJBU+mqdOP24YsW+lyrWhl2Lr+hWs0?=
 =?us-ascii?Q?0IdJaLXd49dGV65ekc3Ce6orbQ6mLHANoaPaTLV1ywGRtR4QAt304SSD9xO/?=
 =?us-ascii?Q?AtmdZDSzxOhdIx6dFlyWToNn1YL71n2eVORiFodkeXsN3ynnSlqX0AnBujWL?=
 =?us-ascii?Q?5JlciRXA6WDIp1Nkr1dKdRSc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7291d5a-ab03-48aa-799e-08d98afed9ec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 08:29:03.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AluqwQnKPdNCEsoebdjn9Eq+iOkRZwZN1zMVEkBSU6omlQ0/Q/rpM5qHfc61gB1zp8Fcbbfnz+SJkYdHF0qzNoUmBRbS6CldR//KaV1PxUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10131 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110090059
X-Proofpoint-ORIG-GUID: gIotCPRAd-OqmxCnj8I5DHHGi60TKgM5
X-Proofpoint-GUID: gIotCPRAd-OqmxCnj8I5DHHGi60TKgM5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 08, 2021 at 05:49:24PM +0200, Jacopo Mondi wrote:
> >     166         msg[1].buf   = buf;
> >     167
> >     168         /*
> >     169          * If return value of this function is < 0, it means error, else,
> >     170          * below 16bit is valid data.
> >     171          */
> >     172         ret = i2c_transfer(client->adapter, msg, 2);
> >     173         if (ret < 0)
> >     174                 return ret;
> >     175
> > --> 176         memcpy(&ret, buf, 2);
> >                        ^^^^
> > And this is ugly as all heck.  I would have fixed it but there were
> > so many other endian bugs and I can't test it.
> 
> Is this an endianess issue or just a complaint about the difference in
> size between the number of copied bytes and the destination ?

On big endian systems this would translate the value from buf into a
very large value but on little endian systems it should work okay.
(I think).  But all the swap16 stuff are endian bugs as well.

regards,
dan carpenter

> 
> Thanks
>    j
> 
> >
> >     177
> >     178         return swab16(ret);
> >     179 }
> >
> > regards,
> > dan carpenter
