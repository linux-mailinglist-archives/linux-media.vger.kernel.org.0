Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A894ABF41
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 14:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346031AbiBGMsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 07:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443095AbiBGMWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 07:22:06 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C4EC00572B
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 04:15:38 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217AxC4R024048;
        Mon, 7 Feb 2022 12:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=z3doitYvTelGFaGNNZ/5pUyTFuaFjDlMvfgHqf071zU=;
 b=uHDqPCgIxA/+jtPhi15VkTK+PKzjgGAMMspQ0YbOntxgIAkYao6Bb4MBNfSlD9W/8zaW
 6rgkhG1BSplNviwFH3bEunLfbzTj98bT6KaHuHJLwAWqkVPMJg0Aeq11cfClx0OkWbsO
 gluIs4f/PqlxG42XSSofBdZL+J5rIb9FBlT5d5I8uH1nmVFLewkSyWjiY+kY3vDQYk9B
 2KrrJvbOqsIrJvqYFn3aoROvFL//izxraUap+Qi4S1ZNSCB+JTLH5PFfwkt42oYrJn9a
 tppKDB4LvbTUEJzxr7d7l3lfs6aue79p4crKpzE2QaII30yG2pIbsMjCNZ7yuHGEoH6G cA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e1hsu5xng-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 12:15:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217CANh5016737;
        Mon, 7 Feb 2022 12:15:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        by userp3020.oracle.com with ESMTP id 3e1jpnd5nt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 12:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo7WDETl7X8HI6PgIlDBRaTTwvFrXp3RbRJv2fdK3Mu25vtCZWLmRboNAj618/gJhEoOPkv25sIk/rPrV3gchHm0W7t5/IaVWD5YgJqlaAxDNKT7lwB2TqR/qZqBkQsK05utLVbaUhyEFhz0kDq+pRcEAk5dw8rMOhhJ9fkZ7lS/VFNq5GD+aWif952tZXykGPyiZ3+71Z/tGVyES2LPYB+gN59aXWJ7OyLaLDrH+Yu06hAw+1Exy+lMPfQ/6Y4Z45go7BOxNr/ad49kEWLyv6H7UpBFFj3iCHuyydgoTnQfIF4/0YZDSghPy6nPukOo5BHZBXM+d7Cj5FsJ1OpKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3doitYvTelGFaGNNZ/5pUyTFuaFjDlMvfgHqf071zU=;
 b=A+zPveatbentbyHcCbrUiJ0szm4wDez2Xts66cNq1lB8H/6C9SndJB+NGgL8tBXoOVI+ezj8r/AK2x9wrKXYg4OQJh92efxbKUj0tjF6D086Wk6uRCYmu4Hxn7bOyV6lNPQp+Ys4e1bSp1aID/z09jKtU8gwVncZ48ZW8DRmBucBvJjDYY7d0PPHTAzOe+H9ki54mcxD1emgmpD4muWJsTuXAiiG9rpDpuqtYqnmId2BvG8V5z1UX+Hj9t0A8KsUnqSET7TDZq1Wb6fDMKjAnaLy/IAJRV0mQxK0xF3QSHyEfZPpBpdpc2KDNMVXu+HNeaSPLgEzpBfVKJzHbe3UGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3doitYvTelGFaGNNZ/5pUyTFuaFjDlMvfgHqf071zU=;
 b=A2BNFQFFJi07fNFZyJiVge0oja82nImbiiqKh86sdFWocHgH+TdohHncU6dRC4/931L5oniaGnu5W29eooiIFf972F2A3sXGWwegBiLLkt+Xih/Vh0hI7lsFgqq9gJK8wy2KpmYChWljeMY/269JV7aQ27Pjn2+7a3HtuGeLH4E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB4845.namprd10.prod.outlook.com
 (2603:10b6:5:38e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 12:15:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:15:35 +0000
Date:   Mon, 7 Feb 2022 15:15:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: v4l2-ctrls: split up into four source files
Message-ID: <20220207121518.GO1978@kadam>
References: <20220207113424.GA28058@kili>
 <57dde179-ae21-70f0-a3fd-56ca0c880a50@xs4all.nl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57dde179-ae21-70f0-a3fd-56ca0c880a50@xs4all.nl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd394054-0c4c-48ef-a741-08d9ea338b2a
X-MS-TrafficTypeDiagnostic: DS7PR10MB4845:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB4845BA8529849639CAAFF5698E2C9@DS7PR10MB4845.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGxrFehqzArB+S/YfR/dzewX9lAhrQv3LLr4uyGR3MLgYIbN0bjYf1p4f5+0aRdWVsMv3YSakyxwSLgAa165G+9RFsdLTjTlyYrfPkBuv01UbLRHrt3OmHjGzive/9iHSsAuR+jEwNYyr17dMMRiVKQblP3TFRbJs4Jq8oWA5F8jSumwi1/w00pLvMVPF1vit0BZNr9QuCUYjX2CPUu7LNU1Eg8EBv24ed5UflG5TfTUof1gbfD7ea266QpmL50XUR2o2htzOD3oE5ClhzELUlgfYexnJ5UWsBggS3+H8+Z9vCT4dq7jhA/rNVRen2NBtYQrdBlCoOHIhiPcJvDpyIBKhk0z0yxzkSJzCUFuv/Ryw+3wKZs8LR4/0E/RCZJZTbX++YiriHoyBVlwvtSfR2L3IB+RPz58SaHLw9J9lgUzdbf9QxS0juPLlh3AXefn2I1f6Ncz7/iWf9XtQ7BUh2WXU9eILo1MB7zFRO3NeVtzltnB9zQS8DUSfSz6mtiR6dXbV4SuMFiLhSLMw4SsDv+6V8wSGVEZ1lgbt2mBPus2alGJawmVI60P9La/eeoP9NPmhDyjVTxlcCYEPyo4xceNyv63wyLGqHgQmRRjZYdrnOEHq/5WBX8jVoG9asC+MP4rMuZO8De/qcfhVwZOmkVygX4H3lIm22WoBFyHNyg3V5PjfPZJwyCX7YjmidtolBfpCaeUHfl/evKn9wM4yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(8936002)(8676002)(38350700002)(66556008)(6666004)(44832011)(52116002)(26005)(66476007)(1076003)(4326008)(316002)(186003)(38100700002)(5660300002)(9686003)(6486002)(6512007)(33656002)(86362001)(33716001)(53546011)(6506007)(6916009)(83380400001)(2906002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hP9W7tJkggU3mubxyMoLLi+3xVy2V/K1j7JDHneqRRxzZvLoDnpgjQ1PRCky?=
 =?us-ascii?Q?kBG1xyZze7YbEZNOaps3roQlzovf2Et/jS92keClgWI3gVBxpmKCj9r7pqwH?=
 =?us-ascii?Q?j7dL7bQSiyzCSmk/ulz3Cj41wNh1vCAxIPJG8fixTKShJTWJC3dqW4Zn6RBk?=
 =?us-ascii?Q?iyosRed6qG/5HDRLZrGcmvV3CXmPTV2FCIMTbmn4GMgvip2dlW1h8MkNVmED?=
 =?us-ascii?Q?86fLTRGs8VJjH2wIdgVjFIaLAYCnLqjlEy+qEKzUdnw5eyd+STb3/NhEgVJY?=
 =?us-ascii?Q?hq4jI1mvM4rQ6X2cbXTRHabZ2hCoGSEILhriFgjrDoIStktP+D5+637Fko9J?=
 =?us-ascii?Q?WGBJVe8Q6lnRdEOmDVgdCgPlQJEaH7h+S3A2QMfRzlHBlS4m7v404OwMiMwp?=
 =?us-ascii?Q?XZwdc/sMywqN9J2Ac9YiXl7NAKTO0itJjlrdgmv3Cm+KAX5mfkAtaAD3iRzd?=
 =?us-ascii?Q?27Gs2J9RbzG4xTN/nYDWBS4NPqZQqFO0IePP9WZ0KNd2KDWQcaJOLeFB1uAd?=
 =?us-ascii?Q?Ca1QNGKLIBG8EfVJOFuAH0NEPc0oTPAwH28ETXnenGX69Csh3H9eiFtWy+5n?=
 =?us-ascii?Q?oXY3Zh4iEa2OVSTzGMj2S2J/ac1FeBGhf4MfEDpN7o8+89QaSyn025JECGSt?=
 =?us-ascii?Q?TaJYu9lP2sdYSODKmItBXi3ejic1yJu8OpYe8wkmcA1jx8xdJxI9EBsSbQLO?=
 =?us-ascii?Q?ZTQpUx3BB3IpJQAblTYdzwQCtG+FBf8gQWUY2sZF1tHTK2lkH5Worsjrm5fg?=
 =?us-ascii?Q?Xx927EeI+lV78kYDULZy0JUgWAdIYaHtHXlObhYZIqVFRxSrtTBqZrGGN67S?=
 =?us-ascii?Q?2FYsYMW8mP7qqd2i/gt6sPiKUsJ8txtsyGcaSGRYQ2YQXR0hkvNoUHutdEFZ?=
 =?us-ascii?Q?M2tMJyEeZaA0rhEL8vzuR6ErELItQwOAQjM5/RVSLu3f1BuWUH1/eSq37F2v?=
 =?us-ascii?Q?ilooUW11LmthXZK/OqlKditGGwzolgMzH0xcPl295DU+pNaVELBck37lbjqX?=
 =?us-ascii?Q?1Ni1nwmH0AoYfMyG8DGdl2f0Yp2m1kzRJsPLmvB4soXfsxC0KrY2r6eYTL5J?=
 =?us-ascii?Q?CEFSnYrxetGZSh2qQZkOvTc3mP2LCh7BBQsFumAU9IHBuZVaDgTuHU0AnybJ?=
 =?us-ascii?Q?UN7wMqik6OGwsK1E93I0x0trjGpc+aGAEy/tEd2VRl3PU5C69vpnlV5sT6aV?=
 =?us-ascii?Q?aCT0MenO5ESiHMcKJDCvRumudaGAKGxyK6hFamV8pNnUFVOz+Mxq53CGcOU3?=
 =?us-ascii?Q?EuRsPnnJvxbmcxs1jFstFlw56vOqxYVF52hlJeQFgRS59+fVSU/aIMERSNkB?=
 =?us-ascii?Q?pIxkbtBQ2qJ8WQsgHRj7wJjDGdXosqvUWNOmqpxFzTMB4ark7/i5tMMQ8vm6?=
 =?us-ascii?Q?mw6tLlTXL2XBIRviYgwJxXZ8ZQD0P1LOq/scTe0D8pv/eZHL7hLlDrclEgJz?=
 =?us-ascii?Q?8djFZKRkBVN3iWX4puwiGBISdywYDE4WnEmy6ZR5gP8VVvpE8dpABidE2jye?=
 =?us-ascii?Q?3WhTECFU4iVnIaVNCqHJaYFwQZf8HpvtIuOQ9cDznBzNBPnsIUTyDfi/c2ol?=
 =?us-ascii?Q?GiQ80a0oUgetVv2h3QbPvx9lzHFIVDSd0Yyiw4CN7UXW3z9A1DQmLPDTLeoF?=
 =?us-ascii?Q?WrySiNmvPYUHkbzfHZS3YC3Ctkn1StuPngxlqRZU0fsjpTWqDC/Zf7mKYI1k?=
 =?us-ascii?Q?6i65gg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd394054-0c4c-48ef-a741-08d9ea338b2a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:15:35.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoFWZKPHMtRDs9vmFVKpTHyT25NPSbWXO5rxN+np1aD3bGzg/49qJWpb4d6Le2PmwgNARKH+dkgBSxAGGQFKPYolEx3ssqyffnWPF6jm8Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4845
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070079
X-Proofpoint-ORIG-GUID: DLRpN02mK8jun1loLAtreLj_rP8eth5_
X-Proofpoint-GUID: DLRpN02mK8jun1loLAtreLj_rP8eth5_
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 07, 2022 at 12:50:41PM +0100, Hans Verkuil wrote:
> Hi Dan,
> 
> On 2/7/22 12:34, Dan Carpenter wrote:
> > [ This code is older, but it showed up as a new warning because of
> >   moving the files around - dan ]
> > 
> > Hello Hans Verkuil,
> > 
> > The patch 71c689dc2e73: "media: v4l2-ctrls: split up into four source
> > files" from Apr 27, 2021, leads to the following Smatch static
> > checker warning:
> > 
> > drivers/media/v4l2-core/v4l2-ctrls-api.c:374 v4l2_g_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN
> > drivers/media/v4l2-core/v4l2-ctrls-api.c:545 try_set_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN
> > 
> > drivers/media/v4l2-core/v4l2-ctrls-api.c
> >     351 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >     352                             struct v4l2_ext_controls *cs,
> >     353                             struct video_device *vdev)
> >     354 {
> >     355         struct v4l2_ctrl_helper helper[4];
> >     356         struct v4l2_ctrl_helper *helpers = helper;
> >     357         int ret;
> >     358         int i, j;
> >     359         bool is_default, is_request;
> >     360 
> >     361         is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
> >     362         is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
> >     363 
> >     364         cs->error_idx = cs->count;
> >     365         cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> >     366 
> >     367         if (!hdl)
> >     368                 return -EINVAL;
> >     369 
> >     370         if (cs->count == 0)
> >     371                 return class_check(hdl, cs->which);
> >     372 
> >     373         if (cs->count > ARRAY_SIZE(helper)) {
> > --> 374                 helpers = kvmalloc_array(cs->count, sizeof(helper[0]),
> > 
> > These days if "cs->count" is larger than INT_MAX it will trigger a
> > WARN() because basically "people shouldn't be so trusting of user
> > space".  kvmalloc() used to be able to allocate more than INT_MAX but
> > that led to integer overflow problmes and security bugs.
> > 
> > This "cs->count" value comes from the user via the ioctl.  I don't know
> > what a sensible upper bound is though.
> 
> cs->count is capped to 1024 in drivers/media/v4l2-core/v4l2-ioctl.c.
> Search for V4L2_CID_MAX_CTRLS.
> 
> There is no way for smatch to know this of course.

Yeah.  It's tricky.  The switch statement in check_array_args() is too
much data for Smatch and the void *arg confuses Smatch as well.  :/

Thanks for looking at this.

regards,
dan carpenter

