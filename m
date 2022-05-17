Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C848C52A317
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347476AbiEQNUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347473AbiEQNUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:20:00 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C013F42EDB
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:19:59 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAtAon020460;
        Tue, 17 May 2022 13:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=xf/bvtAtHbxKrMaVhfwOOkbNFzaixoJT8t7e+5obo88=;
 b=H/+rTOvigjFGoE9zuUqK1bSR0GNd8PlAucrOGcCXqds45k1FmoEwpjncji0K5+y6rGO8
 AxZRrijzHwCy2geoR8QhhdCwEUNjGVfdey/950yn1AGagIt02vN0b08LAG/DvfRp6z/B
 tZf3NUaT3mi77UnCWXoCoLxYBjvyIUmLfnMQ/Erks8V9IvLIjzAHgRDxYBh8LA+p59jD
 8GCwYLypSpgg5Zr2qS0XIiXwuXIs5rEw6toHG7amhTbYd9msONCYgB/2UNmPDRfSEc14
 YxkYf90hzVXsuuR7PDsjAApC9mQd1it1ZMZTkQX/sSsRqmGM3bhSTWGm7QrTVkJrQ60a CQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22uc6341-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:19:53 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24HDHOjO018721;
        Tue, 17 May 2022 13:19:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v33qc7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:19:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGhCTTn7+LsH32+xIfmKZqTY9yBT+atIip281rqbP4A42QHs68JPQYnA3dD+YLo94bUkOSk+YAjKRAuY+2V6gWGc7bB25wuc9Vulwh0wbK4augZLzodr8u5fK2imIZiP6IWdQVrY4FqxVHlD/RAN517bohJvbUrB1YuhTLsJSc3WTKr2+tUokvycr0Gu3i9hZQzVqDCWfeOVFOpkHZgeLYaLEgrE77JuMT0VJbtoSRLNgU8svsyjzTyEURK+Y/rNTbF+MckmTBvKkg0rwbSbOni3xe7MEmZ8gDQ9vAVOh1ydgdpGhrIWLt224B9BBK2nO3if5ARK7zBmDtwpAPdTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xf/bvtAtHbxKrMaVhfwOOkbNFzaixoJT8t7e+5obo88=;
 b=ik2czKQvrV+tK2I4nt+rN/oLXFJkEBuJV0oyWGhQkU33L404TcW2EU7/JlehtPN1UKIbiFrhoSJ1HfKM2yvM/MW1MHvRCSA2+0QVxDqntTDeE5A5YXxKzo7/9ZyiDY+vRenqGVx1tKjHILIgJ0p4rYMBX4vA9gtROI1aWX1zbAqn7E9EZYTjAWo4b1rXdLWV7SLa6tIr47vJ3dD3PXYvkXhxo5LVJi7QGuBK4L3aZXHnzk9Gcfs1DM2gRbOaRD7Ue4m35+NVSB7nG2iFRJ5+A3Ok1/L0TsccUpla+xhjtHIAw5GL7cBvtEX0aY1E1WuDAAl4FTT516R9G1Lv9gT6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xf/bvtAtHbxKrMaVhfwOOkbNFzaixoJT8t7e+5obo88=;
 b=cVXq4SfezqDu/DBOt6Kf0TX/sookjLZE9WXPxB9OtIXOHiwIpHEb7UzR8wbVQ3PMrJVzjUwAwd02ltwHJmTB9B0C90dBjUHnLhk3HxohGRLIJ5PRsMRdPUnaG5M8/r7sjoFgGeJA1tjp2iBPP/qYX2ittZA47qyZdageGexx65Y=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4556.namprd10.prod.outlook.com
 (2603:10b6:806:119::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:19:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:19:49 +0000
Date:   Tue, 17 May 2022 16:19:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org
Subject: Re: [PATCH] au0828: allow higher speeds
Message-ID: <20220517131939.GL29930@kadam>
References: <20220517125447.19535-1-oneukum@suse.com>
 <20220517130315.GK29930@kadam>
 <7f809320-4dd5-c8e3-1a77-e9d8627d292d@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f809320-4dd5-c8e3-1a77-e9d8627d292d@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b00afe04-6039-4e49-1148-08da3807ebb7
X-MS-TrafficTypeDiagnostic: SA2PR10MB4556:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4556F8890962B61FB116FB158ECE9@SA2PR10MB4556.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfVBaMpO72X7vHXQirFrGkGCdu203FK184hPSsMVf4vaYD86hzqfmWL6345EMW6qpsdw7ddjAndbMZIICsXQd7BR/3uPVKNwLX0U5DVI0DdZdfDlm5x8c2a2myEh1F8qnbq2/AG4Dxmjt4ZQZiubzl+kkfG1D+/8lkFv8I5622Gh//H43GM12XObmRooHvOOdiFDGOKWYR9Ny80GrFPufa50fNYKZ9bqdZoWC3xX9LMahzLWTqr2Q7W6d/7bZwCwM6OYV69jClHSHtUP7vzKIt82Tk/ZqvfzozzKbbC9DtGa+OVQj22VDchpxnkCDiRg1HFSteX6/qggk9JO4cxsGDlg9lYiKeV8mIE1I6WOmgqTe+u2WWhPVkeN5Guwy/L9Vr15cgvYjUr046n55IJp6zguoKIvfp81A4fveLH0WdSmQP10c3qdf2TtAo/MXjT4rbagU8EoQ0AEWS6qp0HLJa39Ejvmf7u+HKxpe1jkiimsL0ZeMJsoTlptA18JTy3kSPxXqVJRe3qnG4lok0SI5GdQaGV/bLUkAklT8MSrqJF356KPGYycx1/RLht8eBueAt3sjDix3M8ZYKU9Ks1P2zujTVsutnrVmS3Fl37IvuDDfkzDM6caMosR6eFhu5T0EFGWhwvMCJ2JnSN8oAjKA0WXpZ/60LQznT53UAtKhG2yLahAsre0gg/GfiUvJthpEHCd6JoNwQCV4s4D4HfIKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(44832011)(5660300002)(4744005)(2906002)(38100700002)(8936002)(8676002)(38350700002)(66476007)(66556008)(66946007)(4326008)(33716001)(52116002)(316002)(186003)(33656002)(1076003)(83380400001)(53546011)(6506007)(6916009)(26005)(9686003)(6512007)(6486002)(6666004)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gvgWWpkle58IHuaTyw8xBiCcJW+hTeSBhJ+OrZojL+fiuW1+BqL7TjHW/L/3?=
 =?us-ascii?Q?7042zQ3zbeqW6OeC+eHdQ98/BpxRCXwuK1hpfcWINcQLOla3oCwpAagJ+eNK?=
 =?us-ascii?Q?iwo+NNIYMQHdutGXLSUZUta+/dZXvLLCSuvt0SggkmCCeadZeMqpa3Rqy+vN?=
 =?us-ascii?Q?0qF+RloEJSWPoYtyxQVd1Qbz2VzqJNazb9skdbl3uU2qJZkIM7dwZMhmB5X3?=
 =?us-ascii?Q?F8pthSTKK2/uRqGl42RiZC6EqOdh+MGzxxO0gd0F/cLpuD/AhZvfCkp/Gjkm?=
 =?us-ascii?Q?svWll0CleOxrxUcZEESEC0z83WKPUzjOQywE9HV/ZmVZCKAPRuvDnRsKpqVN?=
 =?us-ascii?Q?PbYwa+IetwkLhFhBfp21rnjPFH+SBnWveHHPE6u2xC2wF6rNG45BnIBfl0q+?=
 =?us-ascii?Q?7QqhSf9NluZTn79ssfEroaw78i8cWZv2qoI5P6sp+3KU6M+8B1CeQBOwC+3+?=
 =?us-ascii?Q?D+YKm3Ar1c54qgXVCszB5EdHNDUqrv43naFqAcyUYTDSUSEPqqmKzAsZHSbA?=
 =?us-ascii?Q?vB0Vmkt5FBgiXEF8RpvoeQoryHQ/mCvT2ysIRLzArFnDw5s6fxv1soUCcpFF?=
 =?us-ascii?Q?gatZIMtAAJgwJPZZzXDZbM1NEi74ZCqSqc0vIeGFM1byHBfuWggw5j7mn9Ep?=
 =?us-ascii?Q?WJFp0OoGRofRHzq6W9zq9z02BF+8eWvKgN+wg6jLaJttYdChlqSBX+anemdo?=
 =?us-ascii?Q?Aze27zniP//SGQrcEgCkO7Zjb4p52/khufYRTmHo5Xrgc3XeHu+Zn+NGyOJf?=
 =?us-ascii?Q?lQrvaEzFUiEBXNbM3bJy21/ZNSsPjeRzljo7jEIQztUQZfanIUz7k44PEmN1?=
 =?us-ascii?Q?8slWtCfoJx9zjovePzKPRobZIrmKNSW3o/h+N31T66EJTlDNHNXZBGr+4npc?=
 =?us-ascii?Q?3n4L6j4iasci4YzTGcEwbHbn6SpKaVjP+f9jhyC6VlaEgQQN0qVkx5j4lmY3?=
 =?us-ascii?Q?jSNOSVldb2LYnzQQdCLlXR+yMLe5DCEd4O8cLfF2944YHMt1sxHmRLnmZ/aP?=
 =?us-ascii?Q?thKBpOh9OQmWY3+HCABN7XRsuFisdgp5Q+qXsLnhtdD+mHPS6oU3JLSr6waH?=
 =?us-ascii?Q?x8alaiw+kPIVFJ9lMZkSy1jNFVd+xSHQ4UcoFssYp6mfw9CohKFwyPWrhUrX?=
 =?us-ascii?Q?zhCAnoA+DJJkuIs8df4a9yTMItOkxKCXDfTlEEbKiThFwOEihZkwe6XRpeTW?=
 =?us-ascii?Q?m8kbbajTMW3iGkJRQwxC3nviKsb0gom2nTF3uLo5dv4rLwuesGfLWwEL622k?=
 =?us-ascii?Q?NSVUgSusJlNcgBWCHPsvLsVOtjoCMQT9kg4pZvOU2Nk6BqpyDe1APWbC/52i?=
 =?us-ascii?Q?uCyk0VnrFjadeYrN1dpol4tK0n21KEwHrNXuJ/kcXGHxQbI7i8/GTnIZO3aH?=
 =?us-ascii?Q?r2qqOfvYBEX2ZZCrihP9f7MXcdI9ZWm3XaBZ4OZxy7noiZ0asuyJZ1U0dlPt?=
 =?us-ascii?Q?xEmLra2zJnTSEy67K34zO2MIemzCtCP7jSk1kvEU2s6UlLCUVmJsllDw9Bdv?=
 =?us-ascii?Q?cmDBjODFowHtjMrlrDREzShOz6wOJl+SfULCVnE7hEuEOvSZfeTWMwgrrtVV?=
 =?us-ascii?Q?ZtcV3Xm94iSWqhz7Lr6gIKqPQqnWxGDcifTjnPc0FstMAs9gun4mk/N9L184?=
 =?us-ascii?Q?NMAJ2OSIpY0Ow6cDjLAsReS7oYV5RXJ9QUkt7I5kH7gpgsnJdkNUWyoI8GIe?=
 =?us-ascii?Q?5iTG0gc3QikXfe1IdK5rfS672y6OHFiNEam3u2CIV/HA7abrlacGFJ/UUYXw?=
 =?us-ascii?Q?Gp+n8RXourYte8HhztGmbnYN5eU8c2g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00afe04-6039-4e49-1148-08da3807ebb7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:19:49.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8HAz16NMBJaHCECGcwBSMDfZR8k9O8320MlvPHOPly9Q/B9w3WSQRODlmrG7i2G6WZI6Hjzch8f5PNG+mVbJoPYrNbjczLvDGlTEd/rUCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4556
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-17_03:2022-05-17,2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=759 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170081
X-Proofpoint-GUID: 7Lu-QwpdajgErvaa3rgudcEk-x1j3XNq
X-Proofpoint-ORIG-GUID: 7Lu-QwpdajgErvaa3rgudcEk-x1j3XNq
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 17, 2022 at 03:15:08PM +0200, Oliver Neukum wrote:
> 
> 
> On 17.05.22 15:03, Dan Carpenter wrote:
> > On Tue, May 17, 2022 at 02:54:47PM +0200, Oliver Neukum wrote:
> >> This should be taken as a minimum speed.
> >>
> > Did you find this by testing or by reviewing the code?  What does this
> Review.
> > bug look like to the user?
> The device will refuse to work if you connect it via a USB 3.0 hub
> to XHCI

Please add that to the commit message.  It really does help.

regards,
dan carpenter

