Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F4458A00
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 08:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbhKVHox (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 02:44:53 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41784 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238827AbhKVHow (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 02:44:52 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AM6E9u0006223;
        Mon, 22 Nov 2021 07:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=RgD3wECXw9UsY3k6yYRwkl9248qgQynaf+1pKTkCDNI=;
 b=sfoV2pZBZjmeeIQsJjW6Nr7OHoL6qdz1KXiT5uCqmfmw65JMOTDuQBcwzSJRKj6zRNG1
 oCN4sA996e152G6WjX+jO8WpDnYdt4WmV447vQXTFCaKV3nlyaR8CH/Chfu3epgz+fd/
 Y5uMKWew7YgO9eh+05qKygQsF0znwgb3xo2oLTH9z2rzZQBJxrKVQ0lLAcd+Zz1DjGsH
 gZo0HLLHO8SLBx4gPc1Y1UdpYhc4A9vruqlo/aaoKNYfwg85Xfvi3rirBWjKQ66vexxl
 qZAAHSyAKaFEi96NbTQUD486d2dRq76BrnVuQt8dHjFbkNxY5RM3hHo55g2Y/0+3YMeZ pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cg3050qvw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 07:41:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AM7ehEv072300;
        Mon, 22 Nov 2021 07:41:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by aserp3030.oracle.com with ESMTP id 3ceq2c6py1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 07:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLzdYQ4ekirey7Dmlsd/cLoaGXp7Djj1VasPio7p5G0Rs/6UPKLw3SXIhhNdTPdzyEEZ1+StTEVkRd0dXkK7SmKrEst+Wh2/XJNkszVS+E7cJjDjJnYK3VmuJvZ4hqM5SLe83dqdGgdJV0pYlM0wLZEnQAGQEu0bZ34ldRNGN6UN7Yo2jAXnAC1ng7nGyditWaVlwDadCP3gBvOuD6blHh84vm1QZnM8w9Fsgz39MR/7DGkk3VtboSK/8V7jVS3aCPvlxx9YXO4jvioj7iR4qkJAni4JIjcPKO07f9K5ITv1zGyKRw033f1WDo2cLeBkc+ghvpxrpYh8sEyRE6qsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgD3wECXw9UsY3k6yYRwkl9248qgQynaf+1pKTkCDNI=;
 b=oKM1mAIcgvZ/jpmhkX0Nd4DQsChr5kuQTeL+yRJLAzFYgvvhlk11VeABOuEmCsUT1h626L42dj94O2gzDdkpDgF4lGzKutRG42LoJ2SG4x0KjdBWLPYbUbqCGZ69WVRFqlyDWVczmV2Eqd6w+IL3CDbkfEbyTNm8ErPUH08SfRgmXgc6y9YgeYZVY5og2SQWpF1MF6DbPw6fudzS7gBvqj/+4In/2JCRkJI1GMytpowPw8wxSsNYvxiixdI7t1GEb8M4FCeY4z7Dn89jZUH/JMcaFuC3yVLWndxO/ybS0nk9Sp6grSVpWJzr9BoGuuyYfluMZ7hZrF2gRq0Xlol+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgD3wECXw9UsY3k6yYRwkl9248qgQynaf+1pKTkCDNI=;
 b=FvWml30iVfrN9ntzwKVbPg3MKtOrt+axZjYxfOcPfm+HOHFE1TAA2CRdtRhKC+GQ8UhZYqLfgv0643tyxSYWPK6gGRXL2OuD83CsjPTnoUtYdRAa7b+iGP8QjSbWBcrxANAFy1bwA8zpkzWcfZf6B3mLGVVX5UJ8cr2wLXTjO1Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1566.namprd10.prod.outlook.com
 (2603:10b6:300:27::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 07:41:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 07:41:33 +0000
Date:   Mon, 22 Nov 2021 10:41:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kitakar@gmail.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: atomisp: add NULL check for asd obtained from
 atomisp_video_pipe
Message-ID: <20211122074122.GA6581@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0115.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0115.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 07:41:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd44e46e-a17f-4085-c09b-08d9ad8b8196
X-MS-TrafficTypeDiagnostic: MWHPR10MB1566:
X-Microsoft-Antispam-PRVS: <MWHPR10MB15662C76C47BD3DB722EA7B28E9F9@MWHPR10MB1566.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRq+U1dBjxjmiX4EaGyIQuEh5weG7ARzrMl8xpKIfPR4v0df0krwDiX2pgc4E4mZHV8BX7WYgmQlL98xEivJWDQlqdQqL6wZ6njyLY75vd4kWeRclKlz+8WKl0Y3S7pkhVZqcP6QAH1Xl8SdSLwHM/dxxbaZy+d3eBW1cN3Ofrkolm7wLSqUFyARwMFgDF7uXpqBZdN0uLbBGFCerINpv9D7pvI5qoYfKkRN2YFrxRrVzsSMdeCa2qn/v+iCn+2Ocue6iLYjdE6OznBYXMvJ6o4/XsCQZRVKmMOVhZT7VIYHc06yEpZQAwDjscwgEpUqlmbW3oT6Xv23GjL4dSRgOW8TvK6q/f4OXAku1kjTozpRJWtvCyZTHWHxfdXanaQZ9wmQS2zPqTDfJrKH0YGqE9ba/ahicKO4cNTmx7bsDIBHd1zW3FDTQoRpkpyRwo+ArM3bQanyIWBHRTggJ5g++JZa0k5a+ItWfgOQlmJ0J5/5nB/nvIYTy6V5HFlwqWQ29SajaH2zMJcmhb7O+Td4Y6VhTF/IxVpSeDTTJrfTtDsvjNqWJf6Y/PxUvUOJeGyyR8WNmReAIvgnI/fAwMglZHGRib/sgQsxal03kq58YRWdItNtS0LHOXWBGofnMfq6TtygmJJYNDDzpPs9pb5uYmTiY94SzCjwaI1ShUHUvodqiCPnD8vHsrETfHiw63RwHGYn1wr5uutQYb9V/EJZ3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(33716001)(508600001)(2906002)(316002)(1076003)(33656002)(6916009)(26005)(186003)(86362001)(55016002)(8936002)(38100700002)(38350700002)(83380400001)(6666004)(9686003)(5660300002)(44832011)(66556008)(66476007)(66946007)(9576002)(4326008)(52116002)(956004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S8DDOYggOT0ycOt2V8eI6aBMFY4RQ8+oq5lw0eH7B8MGhDFfaj0SeF13OhOU?=
 =?us-ascii?Q?7MegGr3Y/Nl+6rUP0XDDD4YTmTgekXbvE+saFuUu6R3+wsndWnPWrcSDBD0p?=
 =?us-ascii?Q?cgLgY3DzXVrKBGw5fvdFCsVlYceMUpvHeOXm0m4kCwY1gZyYoIaHGk1897UV?=
 =?us-ascii?Q?q6PsdwhFc7iFR5j5uO4et0adV6Xt0wTB8jVELmlkC2lpIaNwGRhEjY8S43Wj?=
 =?us-ascii?Q?Gnlt+dYfvtNkoy2CAKlzp4S3dVRxKp++VJsYF8ByCriJg+DIg8B4UQaoVmOp?=
 =?us-ascii?Q?B97qFZJk7NCvAuvq/gmluEsVbtXC+dDtclfqKdhF5k3BI0cNR64PQDqU3iFO?=
 =?us-ascii?Q?H+F7VhQ/uF7XGYVUlEhLRUyBV0FmZtJpHHaJqsHImazEQ9UVWyMDtuw9hO5h?=
 =?us-ascii?Q?8gCj2kMfkt2rklda2L+TjkFnprWhowjLsacQcnZLZAVQGcP+eNIGlIPmfaEk?=
 =?us-ascii?Q?tbW0hTZA7+uP1uBgkuHeet6sF5D9hRQsrhLbA8J9msyrAnTcIs5AC6B69vcH?=
 =?us-ascii?Q?jLyNMNowuE6doEUJlwD2IgTjRh9OGfI++vifT4JQYQzII/cweyehJfhyE7W/?=
 =?us-ascii?Q?ATkDxXaGWSYxOlM1WYfcx3hdDgfguRYyBwQnYrLOdpS+z2AZDkx//7iD8X7s?=
 =?us-ascii?Q?MvHy/nVzitw6SOkQLPASovvFQa6shRsrJHciFx69s8/5lVqufe6n7D1/PHWC?=
 =?us-ascii?Q?8hJ9OBAbSQmF5OnexNlFbzaujm4og6bu0jO5z1jxddnS61Rn3DnhR5TC4tMv?=
 =?us-ascii?Q?VxAIQ9J+xwj+7YUPZ3pof4OOBnaR65EovUC+h04R/bkk3A+hrM/pbfB+43as?=
 =?us-ascii?Q?D0h6JO0qjB+j1ums/4Yh3Tm3iHWJvfrjEMDb0ZnjsY21EgDkwveqKWCY6Zuk?=
 =?us-ascii?Q?J+4GZQ+MD7nHeRYXyURb4nxJUvzVjg8cWYxxCdh+09DekJRzMdjddzuILMcL?=
 =?us-ascii?Q?Fox5qD/rjjFyjWOueYbjgdZ3LnfB0s35JXpDUJpwHzpg97m1X98QwOkufX1H?=
 =?us-ascii?Q?Zjj6XVJELuVJa9C3RdWe1OPDzQtrG3E5d2PJSxprRwyjCyapj0iq4YoHgJqE?=
 =?us-ascii?Q?IIVI1ooueLfpdoCxMmIbYJ6EojRrGzUp0EbLhAHyKvnNENPIqJVwFUGWz6H7?=
 =?us-ascii?Q?hLuJ+GtnuGRjtJlzjYBu5QFPnluiy424e9vAFTsSWdGU/nYvu5StWNhgnGu7?=
 =?us-ascii?Q?uTA+eaqniPGsZ6YDFEA5MzFNQABjODlwE1d8s/CFzqQAXoUiV46JyyRNctPJ?=
 =?us-ascii?Q?iJ73LFtN8NaP5MNOa4hhfiDTCUuN153fwD/vMTmyKVXUNK2iNSplv6lOO1ZI?=
 =?us-ascii?Q?EzYevFSLfXbnaZ4+CVWWaXJqPN//bs37I0pBKRGa3KgN5OXQaWXg6GxklOa/?=
 =?us-ascii?Q?M0XUVY8O+5UxyNuCwdPzyvbxgCYWMENd7vOSNU4B+Axmpe9h1tPjv0WkYlhz?=
 =?us-ascii?Q?6+n1lAVp4bEPhE1s5rIUfWlQFrvMaPQeFfnyDMGv+smzmy7HoK5b3H0JGvAR?=
 =?us-ascii?Q?xCHMaDf7tii6IJBlVH+aKGMC7ELoVm5cD1Jo2FtZS9+2XQeGYFuajhWWAvJ4?=
 =?us-ascii?Q?fDx9aHRL2oJHJAyD+mj0U01OeZ9CLIP4y6aGfUHtz5Js0XUq0WTwVCnURcNC?=
 =?us-ascii?Q?N0e6Wia9LRDfvrBtMR4ayimKDhwRo7L5goOlDxw+6TECIctTw0u7B2yUuOAh?=
 =?us-ascii?Q?bPkdDrJkv4/ZRQPzIIyHhNlmu9I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd44e46e-a17f-4085-c09b-08d9ad8b8196
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:41:33.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1taWykFWYf3tc9S6vWt+c1Xf/0OGkDkeXPd4+IF4ye8U//NUx6AiJcWcwaKtCBo/r+VAkZnuGCxZjFPzZyI99QMPaQ8TbEFE0q5Bc/Mbafc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1566
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=897 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220038
X-Proofpoint-GUID: kB_r8Bbj5TkBeipIzJz6y7VA-mkcb4Rk
X-Proofpoint-ORIG-GUID: kB_r8Bbj5TkBeipIzJz6y7VA-mkcb4Rk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Tsuchiya Yuto,

This is a semi-automatic email about new static checker warnings.

The patch c10bcb13462e: "media: atomisp: add NULL check for asd 
obtained from atomisp_video_pipe" from Oct 18, 2021, leads to the 
following Smatch complaint:

drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1188 __atomisp_reqbufs()
warn: variable dereferenced before check 'asd' (see line 1185)
drivers/staging/media/atomisp/pci/atomisp_cmd.c:5192 atomisp_set_fmt_to_isp()
warn: variable dereferenced before check 'asd' (see line 5188)

drivers/staging/media/atomisp/pci/atomisp_ioctl.c
  1175  int __atomisp_reqbufs(struct file *file, void *fh,
  1176                        struct v4l2_requestbuffers *req)
  1177  {
  1178          struct video_device *vdev = video_devdata(file);
  1179          struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
  1180          struct atomisp_sub_device *asd = pipe->asd;
  1181          struct ia_css_frame_info frame_info;
  1182          struct ia_css_frame *frame;
  1183          struct videobuf_vmalloc_memory *vm_mem;
  1184		u16 source_pad = atomisp_subdev_source_pad(vdev);
  1185		u16 stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
                                                                ^^^
There is an unchecked dereference inside this function.

  1186		int ret = 0, i = 0;
  1187	
  1188		if (!asd) {
                    ^^^^
This new check is too late.

  1189			dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
  1190				__func__, vdev->name);

atomisp_set_fmt_to_isp() has the same thing.

regards,
dan carpenter
