Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B77561906
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 13:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbiF3LXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 07:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiF3LX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 07:23:29 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFAF20F4F
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 04:23:28 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U83iEg013924;
        Thu, 30 Jun 2022 11:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Ja20zJdWJdcnRy/G6h/KR+/CbUW0b8091YAjyyrnKl0=;
 b=UOLhlqWLg5uXtJof23l/CEJDjVZJyOunq1N8CSFNtCni+y4d3UXLWF3EE/bgjemeZgIi
 gi3HQ2WzJy7uyVAuaOkyGC6/kG8vrCLlhWNx0d/J6sN1N8M9qW5ixnPF7YZUOXeUNiDs
 TAIOKyOtNVgJfcqjkXMDap7JCsZ/Ty3WoeSdD/AVNiH5+3ApYtVTswQVKrcBCzo9SevA
 RK7GOsXc5KpQomnp9Myj0JhV+ttFYI9o/DKCsei6/L6ZOQdnFRoe1GhAY/LWor7hxa8t
 WPZf937mqDRJUZNxs0e1jA93Rge+GEMvMvGhCB7vHDJBIXkYTHrKF+XA0z2T1/mNjO8W AA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52kv14-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Jun 2022 11:23:17 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25UBARmv021767;
        Thu, 30 Jun 2022 11:23:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt3xaga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Jun 2022 11:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuBKJV9mXCMyz9KCTLtoAJYebGZQkIqy2jM4QLfWaaJzpDnjJr2B+FC+FEKLTv/Otq4B/hYU3+OjBhZ4Q5pNBx/1PE1e4v9EIcZSNFcANXaEtjtLqNc/B58zsJVikLEiUFDTx9FqZEpJwX7qUGdkaVvT7jpt16qHpSqPkrOqchtMcAo3Yd3h2jBjZyDGc7JnjSIJqupCDYj2BtF817uwXicpwk/V5w8zLdo1f3oY/in01O2jtDCEyca9x1NoZGPswW0xKGeBlJsl7UO2Rxbehw2aGyImnD3APtS1wMDOuzZiKkSsgN1yVLtdrp2qt51AGq2yorI/oOPKdbv0987rQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja20zJdWJdcnRy/G6h/KR+/CbUW0b8091YAjyyrnKl0=;
 b=i/A8MgUH8n76ewtrvHUijmPfZzZuACoz2vZdsao208TP938nKGn46mchVLZ2c0utO/CBql8b7Uknok4BgFkgQmYo5GprIS12qFG2xJpN+TGCOasOmNtfDFdDd0oUKCfV+36kuPhG9ohzRfihLjBpIl1UJaYU9ztdMofES40ZOvWpWqqZ0HB448Bi655zE1ru7x5KZ1FcAYsVPPGk20iChT+hstTTuvwm3TgVc87Guj3lc96dJDhIzNSvpdtL07sy5ysmXiHFgEZaaZfE857tso8tDRXbWTWX9Cxfwbchi7SQiHDjJnsbiSnbPM57AjdkSvuGKcpbI8CmQndNpgr6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja20zJdWJdcnRy/G6h/KR+/CbUW0b8091YAjyyrnKl0=;
 b=Skbyj/finyyQ2kVYPleI+tOMVuw8HjEv/0sol2ePiCch/rSbNujL46QsTQeFkHyFKaA+XmZ6Kk+TecnjF+SjZfoauiFRMjBy47GKnH88SdoZPe2kBXxTTioJxtzLtl0Mkh4Dhv/MHddIRc0gM+3sYWOR5CiKJh6rfCm/w9FTd4o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5086.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 11:23:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 11:23:15 +0000
Date:   Thu, 30 Jun 2022 14:22:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org
Subject: Re: [PATCH v9 0/6] staging: media: wave5: add wave5 codec driver
Message-ID: <20220630112257.GY16517@kadam>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
 <ff27a9a8-47b6-9a09-4409-8fcc9cd2a314@xs4all.nl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff27a9a8-47b6-9a09-4409-8fcc9cd2a314@xs4all.nl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0054.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f4c9bd-406d-4208-c37c-08da5a8aecd6
X-MS-TrafficTypeDiagnostic: DS7PR10MB5086:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4pjHazE59EunWZ40pMV6mZx7j5p4wBXTmBikZMHUTcgllgE0DB4496mm2/+q8oeOAyZwxWyTaxnS5f/14/ukfakF6/q27jIa2DHoBAAJ4mLgJGHjxa0bA6hgQm6fBvEsfkc0eyF/23gx9IssEq/U5s6omt5zadDeXg1g49iOwCSEbFStCRWF+jFVfZc0lMutOFVH5CaWdDfQ/mVUH0PFID/Fymvp0VXOWRDunRzaAINyn7giYReErga9Dn/43ZWhDdPb+E368Phn0W0BQPcrvmAS5UzZHPzqmbxyKSBh3ip5JEtAxm9/b6qd25DDnJd/APj23yMg+YRFev+GM4zIigzGpbVAxb+ThZBnHP0MMaA97Atc6EyONBAlql/V7iBzIZwPPIixID9FNWgA+K7PF0jTYq1slOElTXEHny84rh7Vamf2iOHAU9wRFvPVt9Lg4BhB68LxJuFAaOnq5WUsGWeXa5Mh5GvMI52h061jYBMiTK3omhVtl/qCY7SXLB82rcjEJZzK5eDctG9pojW4Qhz5RiMFMgghVU8X6SZu3SQ0pHIQNa7wDV3SDTGfSQfTKpOgFWuGYqvnKVGxp4g8s36Qgz9hbLiHwbebaE5pmRAtFVEARjBfXqBVZUfltcADX4pXfB+eGihCPpZWLb5bWeA8XL2cTcQj71ePAW9FM3OnDlCJJwcpUi3lgQCBy9WMEenwtlU2G+2H570DhgdRVIr6I2ERyQK+n9idPDYJUJYwil/73hqh7v2+BRALKVRomV+uNadRAoupPv/l0Kccmg5GTyt4sfehxXPrV+wKcB6cjQGZ+Ctedtj7IhDhg1C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(366004)(136003)(346002)(39860400002)(396003)(33656002)(33716001)(86362001)(38100700002)(38350700002)(2906002)(8936002)(5660300002)(41300700001)(44832011)(316002)(6506007)(52116002)(66556008)(4744005)(478600001)(6486002)(4326008)(66476007)(6916009)(1076003)(186003)(6666004)(83380400001)(66946007)(9686003)(6512007)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJxv3L6m4x7qgR6JyqNxKQnINGtLVK6dXzhNbs7+Gjp64hp5lRUCRSS0pcS0?=
 =?us-ascii?Q?2Wo65CZeBKz9WlZg6UnHMF/I17/aJioMq6KVwWipIaJVIahj9UaSvm0QK4qb?=
 =?us-ascii?Q?zlAANzXF1Ef4ERMyn0p6BaZnhRFlomLpnO3aCEbFr+2StCwOwNd5PQb9s+T3?=
 =?us-ascii?Q?m1AoXSMn8Nn/jjAz7Ink+fZrCJU9MsO/1HaD7Vp1otu6gjTLfxXVU+4TxzUc?=
 =?us-ascii?Q?Uf+g0tbVHjGcAdmk+yVoDVaMkmNuCYOH5TZWyxLVdrnsvSjWFmOeg2f6yQvO?=
 =?us-ascii?Q?Vhm1fx1iFQTYr3YhR5zOWyVuhC1h4q5k2I3L5Rp9DKN9tdZt2en5Vrx33K/b?=
 =?us-ascii?Q?EJ5cEibfvfq7drI5TZccJ6qDcK/ZPfQlljoyptVttoJxdz04k6qrfsEKsE5Z?=
 =?us-ascii?Q?Vk61mHUI9kuO5MmypIRQZdam/NZIcEfRFHpzxnYp5nWgW9mcHiXcR/z5Qlwv?=
 =?us-ascii?Q?YtbN4/il8l02UGQkBMdWZGJnW/ge4ICeiXJc8saSFzBcMClST8oapwlPAvpL?=
 =?us-ascii?Q?DL3fEEhVIfM3uln3D4e055WRNnUiMoyzrJwh0misnIt+qJH5M71RRxx/hxck?=
 =?us-ascii?Q?y3tLPr+VIurFdkQX0vUN9pl7NNyf3ydtysSdrlFrZd/ezWQNRSOyT1BO+lAD?=
 =?us-ascii?Q?qv/RIN6/l23BSakSFajDXocuCDZq9izsqsRR2AAvRzhvUGaKHnHucoXvjXAw?=
 =?us-ascii?Q?ZHEvReRFAE475uIFV3mpraav/sRju8kFBPaS0UgVRk3Lb2p+STlGYx+xCF/J?=
 =?us-ascii?Q?todnV1hS9lJHySv8mg4npBejhnnkwg1Dm5wApcrJjdTmFmFgovM69HsNVEvU?=
 =?us-ascii?Q?jRcvdvEARaQL/lStHTDz1e5Vvo3wycC3kRyRYhAGNhulBFBTrNQzEkc3swaF?=
 =?us-ascii?Q?n02WP7BMLfRkhZYL4ROulweY4/EdJ7MqTl/UONmxqjMgvqytPjg8krwNKWwf?=
 =?us-ascii?Q?nWNzLzCiEotlSoXtrwn0JQZY26K7R8kxf78xiIP7045PfnRkGoU9pKiJwuE+?=
 =?us-ascii?Q?z0xoyuZw6SV8UrpuPAkxtIP7U/VrboLLCoVExgJgqLFUvDnCvzs+gdnVfiH0?=
 =?us-ascii?Q?OtvWj4Nwc8j/IZNbU7mC7TAezylQ3rHgARMAEwqzmAw1kZxXD71UZOQ0TqGg?=
 =?us-ascii?Q?DMzkh3aujhvEayrNM2l2/J8FMtS/wohZVnHdISUYeTo898x9pnH91Ldk/67X?=
 =?us-ascii?Q?iTu7ZYCp9rroVG8jcnWNQf8UTWjgGJGGmPJ8zLT6Tp8nm/TMMV8+ZEwxHxuC?=
 =?us-ascii?Q?Om4qZBIdkYjetTn9HQuv65Ar0BD7KBL8NRVN9JZCcpDwF1lAz8RW56KCm7AK?=
 =?us-ascii?Q?QqFs6HIOimNEhlsRcYJTModbBmYgTpNVCS+RJd2LGfyJVT6/Hn/LaWAj62Ku?=
 =?us-ascii?Q?r9vkD+Ri/S5U3dWm9Q+oYQwAil4YlCOC8GDZXSZMjfCx8ucoGVmehjmOdpaB?=
 =?us-ascii?Q?vUXHSuFruUFVLb0irht4OPaRU1zRmM28kW2ZIDk4PWr2Ql9Tl+sPROMUUArj?=
 =?us-ascii?Q?2UgQA3890v572NcVF45prAMGSymJHiAbg4QVMbEsyhDdzQ2Ulx5E2IHG8Q5s?=
 =?us-ascii?Q?JCtXVi5DuX5ebvcc8k9fK8Qu1Vgku0WzOy5AJ4H4xOTV9O/+QPRAfJ/TVApw?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f4c9bd-406d-4208-c37c-08da5a8aecd6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 11:23:15.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wg1kS8EqqY1CP/RllvRbycSSFiJb/jF8r+zqXz+1q1y87UnZxPqa8vNfWRNDfJCcQrWuQXTbqhcZDhHNLJDzSiIda4nGXOcwclYCtaBQlN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5086
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-30_07:2022-06-28,2022-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=503 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206300044
X-Proofpoint-ORIG-GUID: Txv094Lqh2sOnYEL2ppiTzGTnc0LmdJI
X-Proofpoint-GUID: Txv094Lqh2sOnYEL2ppiTzGTnc0LmdJI
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 29, 2022 at 05:36:31PM +0200, Hans Verkuil wrote:
> drivers/staging/media/wave5/wave5-vpuapi.c:93 wave5_check_dec_open_param() warn: maybe use
> && instead of &

The warning is not clear but the bug looks real.

	if (!(BIT(param->bitstream_mode) & p_attr->support_bitstream_mode))
		return -EINVAL;

If this is really what you intended to write then it would be more
readable as:

	if (!p_attr->support_bitstream_mode ||
	    param->bitstream_mode != BS_MODE_INTERRUPT)
		return -EINVAL;

> drivers/staging/media/wave5/wave5-vpuapi.c:505 wave5_vpu_dec_get_output_info() warn:
> inconsistent indenting

Self explanatory.

> drivers/staging/media/wave5/wave5-vpu-dec.c:1357 wave5_vpu_open_dec() warn: '&inst->list'
> not removed from list

Use after free.  Probably the fix is to not call
list_add_tail(&inst->list, &dev->instances) until everything succeeds.

The others are hopefully self explanatory.

regards,
dan carpenter

