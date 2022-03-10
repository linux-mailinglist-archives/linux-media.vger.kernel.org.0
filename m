Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B644D4631
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 12:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbiCJLqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 06:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiCJLqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 06:46:53 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5074A24F2D
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 03:45:51 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AA9vx8002638;
        Thu, 10 Mar 2022 11:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=LEVgSubkDw+ehnKYHUPYVEYCWgGuzHB19jYSoeqQa6w=;
 b=HdhQOh21clwXCDOkYArHV3G/7CB5/WVmXgAapWXpbX0/rktAJMTY0hYFa1kc0SvgKv4r
 mp6WWYP/ygXfI//H/xNVSF4mBiKHwN0EPq4sYTeVPjRClhxNXgKSV9sE8VMdMqiWmADZ
 8ucLStw37obvmGYZKuW04NU4hXfqO9RUrNnYT0rUCgyuG2qqsU9+xci7fhXCnHhFZMOq
 OsjRaPz2x5eRHQrK2aYraUs/yjsS1pHZzGMGV1fRysYhpE0Tcg86nSPZJ7vwBx8MHzT+
 IS6Arm6KZJJ6RLCXYgdlEJdB/IAzus/FfCwysytRb94T0pq7keq2M/qxahhpwRJYGQhg Hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cmst6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 11:45:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22ABeONn142596;
        Thu, 10 Mar 2022 11:45:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by userp3020.oracle.com with ESMTP id 3envvn76ua-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 11:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPjOjfxGgVtzXNiYTYFvVTVRo1jAlbLoNLqFRUsCc1KMwcZ+6EQLquaPbQSJZNg6NNaYFodagbQ/sNen3LWrVFpCiypIKrGTCPUddzSo0qA1SdBxY9GupW0AC36+91UyE2PbY2MlgGmmbGBCMUFKNmLXqy18I1LnelflUWT45jjIfdH60ZrTjlCwKLTPCpz6V8N53u4zx+d+5x1jMb4yVF2x4PnMURqigJnmhpGDuNWTNBJDIRQGx7eunji/ELC/e0I17tD56gTK+QU+Ouxr6jrOh6ikwbLONKw9p6agNEiFHmvKhW+5eOBUF56eIhmxJ/ZdvclnleXWBFGR2JuW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEVgSubkDw+ehnKYHUPYVEYCWgGuzHB19jYSoeqQa6w=;
 b=XcF7Wp1ti4XInfbG7LPjFx6q4YouPRazXbNhy7nbMFOjVpaYAaLqKDW6x4LZiJF9EryWz6ChuW8oRPRVXIZls67e+rCwIWXi1+rTX67OudfiDlT710p0Mz+tgDO2Pmy6X/gxXc3INRZhAOqv7/ZxKqPg2qjMB5rOT3tZ89OWviIJ/OfJSot8ef2n4vQ7Qm0cjr/QXNTepjIIEqqNytZczkgwmIjBggyIe9s+XWsIez7W/XsD/WyHNqGh1dZ9qX87Bp4qFaJAg2PzKRDgNoe6Q/ho47ROx1wnHDG9GNzTC4uKE3EWqslw5s3P+3ST2pf9fehg28Go7X44iIDFy05kzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEVgSubkDw+ehnKYHUPYVEYCWgGuzHB19jYSoeqQa6w=;
 b=Pau3Eg2Qmc9n1bm1PeqhRznyUrmC3wa7/y6DDpnjcvIo78mq21Ypqlf0gjiIw3I7IJY7Y/KUYuqxVwVqEQlVagCaSXzBhxzw5QsoX4U17R2aI9b/3uzEeIwbWtfm+Br28yL9VNKL0Jgl3MpB+eLNR8M6CDHZ/Yz50zoja5OmEkQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3406.namprd10.prod.outlook.com
 (2603:10b6:208:128::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 11:45:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 11:45:44 +0000
Date:   Thu, 10 Mar 2022 14:45:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [EXT] [bug report] media: amphion: implement windsor encoder rpc
 interface
Message-ID: <20220310114533.GE3315@kadam>
References: <20220310065654.GA3476@kili>
 <AM6PR04MB6341ACEC2D4188333B4A88F5E70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB6341ACEC2D4188333B4A88F5E70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52396421-e6a6-4c2e-f308-08da028b82c0
X-MS-TrafficTypeDiagnostic: MN2PR10MB3406:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB34068B735ED1681744D2D8448E0B9@MN2PR10MB3406.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YtGmE6yl6c72Zf4ogp9yf85MxADySJcBifMlV7CLVQTrT6bw8mc1SqU+ljLTrDciVZIJTBETlHgqoA5tdYyf026AK5wYJrPhGwaV7mJypFWC6DADyjgay6j4nZBFXM/9HmgnFb+b+6TmmsOpjWvsN0adWljD8OOPL+2ZnfVAWCCicnuGG2TYj3+8qG2+9dr+ngM3Chbo+Ul3ByrKev6QaSe4wHBZeuZ2lth/70UFpDJzrwaxMUiiI8JUFeJR4yl0021f62XL2gneC8xabhHWZxlND4Ou9nWN8FblB8B+GX8NWKAg9U7S0OyGb7rLoyHvfyqiGmBmTYJhq3giqpjLP/p7Cdu8kMTvL/yHakAQ1y5zJXnCNHL/+nO2xmWnClil29xCkisP1OfpBStWs5LtZ9D09WIZOUy0lR8DJ85/oDcJro68OqQKY8HkX3NDJ0+6yCJ8b+a09PUCOX1MKmGhwLPipuJFMstqX0bHF/MKXjxH3eBBV2DkHtSmAS0S7hHVp5yx76MfTgxTGDBnxeT3tPrkD/YgU+PXsCy6SJ7So47wqpW+vvoLVidb9aGrIURmPRDcx6QX1/Ql0uXup5Aru0ZPLDeJY8EwD2MScLL9njO6DAD1J6H/CcWOD+TU/q7xrem8IAtUjhfrEXoFxjJC//WYi+/nIbdBC6130WOlo1jnosiivUjDRW5sIB5Yk5ekLaCtZaHhpn7dviOraDzIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8936002)(8676002)(4326008)(66476007)(66556008)(66946007)(316002)(1076003)(186003)(26005)(38350700002)(38100700002)(6916009)(508600001)(6486002)(5660300002)(44832011)(6666004)(6506007)(52116002)(33716001)(6512007)(9686003)(2906002)(83380400001)(33656002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KZZEnF/eirqrgqk7r3fcYA1Jv8Iaglk1Tl7cXoJOpgIry6wYK84h18E7GuXx?=
 =?us-ascii?Q?Y2Tk6m3jsmouhO4mHlR0fnX+4Y9uMNwExDFSqjCW49cDLTwClNQ9oTuLIz6g?=
 =?us-ascii?Q?JJggMPphk1WggMBfPx/JClGYddMLU+svOemhiT7XCJ66aD2uEvVD6FkyfMFv?=
 =?us-ascii?Q?nJHb2RnjwJNDuZ5+EZ2fM/B/ArDpJ+HrUAaDDN84vIY2qh6EbYpznVCxwWvp?=
 =?us-ascii?Q?xBzjGX0YY0tIfNkxupZq0OizAwrEPOMwcxf41rJ43PAIz64VROFRZfgFqkXs?=
 =?us-ascii?Q?M33ZtdfbHXkUIh0fTnuiDF5+Mvlbxr8sAB4gTo2WNmgt0J4TAWdRZfO7gwCr?=
 =?us-ascii?Q?QmcyXSrEAnkYPdP204uOZEqJqSXFiPWJq/FI48yV3iyvwOfGFEed1RmnG7SK?=
 =?us-ascii?Q?33QfZnpGxYd1PnDr0zWYyLabGsLp2joiNX+DdZZqwDA6WLCXb9Mt5Ygxfv94?=
 =?us-ascii?Q?5pY2DGOetvR57HCKaJuCuSqUg2Ip4xk/cuNmGu42ekUueD+AvFty4dELHnle?=
 =?us-ascii?Q?YV3WVDn8ROUejhoNNAK2ObPr4/Qr12/i0VxCCjoioh+AxVg9H7MEzEQkQPsz?=
 =?us-ascii?Q?BTwl/JcqhOKMnrFLaU//iVnfkiPghugf7fJMZ6KKB6rIPOnBld0BwcBChdi9?=
 =?us-ascii?Q?jEAxQUPeX4YsxO+RfAcTLlsOiH0AYwN+whbaK4HtqNoihPOl2RJX8vTmrCoR?=
 =?us-ascii?Q?4s4YsWeNvlBSLCB61tjVbHoDkr5IGNoQcyBrRc1xTIAsEU82ce5r+8wOvVbv?=
 =?us-ascii?Q?Q+rYRzPpteDBSWv17PAMcxcj3Ksc4YNsakbmxctch9frzcQ3T1BNJ0kecnu8?=
 =?us-ascii?Q?pb9lO1iuoYQlHRFBGOzhFqTkR1+K5/BmeeeB5w1qWysxPFxUqwUNi4TK0+XC?=
 =?us-ascii?Q?2mJOJ8y9W7U9teqtWvXqXH1jkRZV/deZMucduJPxktaQHUJ83RnL0x0Vbn9C?=
 =?us-ascii?Q?zUfRYtj8hNs2mIQ2Y5xOXAuJNjjbBNic1zG4RYGFVRTEX8g4k276k+vVrpB7?=
 =?us-ascii?Q?w99W1L8ieMfv1WxfTisApjmwY0CIlRfSFFIoXgC4AC5GRc9p3ve8pn65fdo4?=
 =?us-ascii?Q?2+nR+4DWdX4LqydD5QUStYKdrfoGiPtYk+5wx8eTk14YqY9j48PD+nQ+vjnU?=
 =?us-ascii?Q?N2smnm10cQTfNy9/D3mheBurqorN1oNY7RCW0kl3Gj6E+fml/LUngKFVJXJ6?=
 =?us-ascii?Q?sLt06gESIV/qZAHZ8wweM1AB5fogf78edwQAVHcWhkbPtUXXErNV9xP5rn6o?=
 =?us-ascii?Q?0uo8rEF7mWvMsaHlCRVN/A8DkFo0MtW3cz8ByE6LKJpqm7hqJRshmxsqQiLU?=
 =?us-ascii?Q?MZ16WiYKdAyAY18D78mg+g2/HdRae3HqlGFAN3g22vVR2E3qQPr3L+ebEjbr?=
 =?us-ascii?Q?mFiWkAsB0kCxcwzcKgOTMm0C+WQLwRYKWsGcaxEk0/FfTgbCNwS9hpGsbcjq?=
 =?us-ascii?Q?kovz3o9sKYJh9iOavyEVYQ7nYHhN8HSlEEAQJg6jE3yx27I3l1hD8w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52396421-e6a6-4c2e-f308-08da028b82c0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:45:44.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTyB1zC68ULwEJJq9dlMl7/c9kIntLKxnYcFue+PvsIxj05Xjh/8+DoI33QdEtwI8kcq8ZwHch3IiWscgkb3uGTznQtLknRkJYjiJtVwXwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3406
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100062
X-Proofpoint-ORIG-GUID: aa69afCm2Q6MvC3lOMonQVPLEO223jxj
X-Proofpoint-GUID: aa69afCm2Q6MvC3lOMonQVPLEO223jxj
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 10, 2022 at 07:34:56AM +0000, Ming Qian wrote:
> > drivers/media/platform/amphion/vpu_windsor.c
> >     807 int vpu_windsor_config_memory_resource(struct vpu_shared_addr
> > *shared,
> >     808                                        u32 instance,
> >     809                                        u32 type,
> >     810                                        u32 index,
> >     811                                        struct vpu_buffer *buf)
> >     812 {
> >     813         struct vpu_enc_mem_pool *pool;
> >     814         struct vpu_enc_memory_resource *res;
> >     815
> >     816         if (instance >= VID_API_NUM_STREAMS)
> >                                 ^^^^^^^^^^^^^^^^^^^ This is 8.
> > 
> >     817                 return -EINVAL;
> >     818
> >     819         pool = get_mem_pool(shared, instance);
> >     820
> >     821         switch (type) {
> >     822         case MEM_RES_ENC:
> > --> 823                 res = &pool->enc_frames[index];
> > 
> > This only has WINDSOR_MAX_SRC_FRAMES elements.
> 
> Hi Dan,
>     I don't get the point, the instance and index is different, and
> one vpu core can support 8 instances (VID_API_NUM_STREAMS),
> The enc_frame count of one instance won't exceed 6 (WINDSOR_MAX_SRC_FRAMES).

Hi Ming,

I appologize.  I mis-understood what Smatch was saying and mis-read the
code as well.  I got "instance" and "index" mixed up as you say.

However, when I re-reviewed the code now it looks like Smatch is correct
and there is a potential buffer overflow.  The "index" variable comes
from vpu_iface_unpack_msg_data() so I do not think it can be trusted.
We need to have an upper bounds.

There are 3 upper bounds checks in venc_request_mem_resource() but they
only check that "index" is in the 0-7 range.

	if (enc_frame_num > ARRAY_SIZE(venc->enc)) {
	if (ref_frame_num > ARRAY_SIZE(venc->ref)) {
	if (act_frame_num > ARRAY_SIZE(venc->act)) {

These ->enc, ->ref and ->act arrays all have 8 elements.

However, as noted by Smatch the pool->enc_frames[] array only has 6
elements and the pool->ref_frames[] array only has 3 elements.  So we
need to add bounds checking before both accesses.

>     Maybe I should add a check for the index like:
> 
> 	If (index >= ARRAY_SIZE(pool->enc_frames))
> 		return -EINVAL;
> 

Yes, please.  Or maybe we need to make the arrays larger to match the
arrays in venc_request_mem_resource()?

> > 
> >     824                 break;
> >     825         case MEM_RES_REF:
> >     826                 res = &pool->ref_frames[index];

And here as well.

regards,
dan carpenter



