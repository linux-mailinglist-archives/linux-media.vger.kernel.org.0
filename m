Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4F9447D4D
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 11:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbhKHKMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 05:12:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37908 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235856AbhKHKMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 05:12:44 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8A2ugf000984;
        Mon, 8 Nov 2021 10:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=JxfC0SD83sRxjhMLdgxPNIyzFXqIhOrjOSsGDxHfeQA=;
 b=0tjKkybZIDSvz5+zFrbd/Vej+sTOMaZc6dwyyupfopL+P1eQiaYkrtOlHM/ZMb0hadS1
 un3wxNy0hMDmyG1MEtLDxqojo6oVfKeK4l5k0ZltNvFcounxw1nzl/j2RijpsfwXJNJx
 lgI2ff+Sch3dOa/RdIVeJwy5fZBSY9PaXe6+Mb2KMm1ZNsu9lK5zFIe04cBohWv6Gtcx
 Fv3uTaJFMx6kA8YzWGhGciPxXH4QHdg9tcUDgQU9qNmWRthixC03aMcuD/TYQWfnn6hM
 Id8sPDuR08s/YXrkRkUSPJs3uKeXonSBHXId6sGQhb9OJhCj8YfVbB01Aw5rgD9v6XDF 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c6t701vgp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 10:09:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8A8Dn3149487;
        Mon, 8 Nov 2021 10:09:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by aserp3020.oracle.com with ESMTP id 3c5hh1rsgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 10:09:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyUyWd0crAQF/UrPyrVcdtaQaj7niQF9j80TpAm2xnonMao1QXuBuhOzppm2nqL8hbl+STiOPBic00ym/Q81v5E8v65YGtpZ/Qr5B8CkcIsqtWQuyXoDJKRZTll704BLWBgIdm7i7U86tcwc2/DqzdfifSdEfnamLUaNcb3txbilOt/5wUtDchGgTS+trvuxzPQsyN9GOQUdOJuFKQABz+fSGXuk/Y4GKUr+EsTPED2Y3ac4W0fPVbRD9zlLZel2PXFFpRQYTYY3H8JtGQCEXZisWcmc8d7LffkguYh+gyfSU3hspn01ew07jiV1ImgzVcsocfulzHZbGAUtSW+y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxfC0SD83sRxjhMLdgxPNIyzFXqIhOrjOSsGDxHfeQA=;
 b=Fk0QDJ8oIBob7BPVgwfswJUBdHdOewsqNl57IURJabYfT7nb+5G9qq9BErTVasNdONf/Z24UmI+K3uSnu0wSa+4b+pCS7T9Wlat97EeUASPV5j3jM0g8FLmtsS8kLGuBdiKDXUznKozThrQqCO0T7UhMGa1rUq+vE7AC+vyepNZMNvewOUjaTdRNXtVw7q33f+GOakla2s0hNIUcAJJCiHP5Fc1rxFru1Nq2EfKaqQh4hJU+OhGYnmb5pBrdIqhxXvwTNnwTYKBVJG4sgdxHxDQHzFghTGVrARNQmIUvUstsHBy0MHIgCf+l1hpUQznPaVUda7iMHGdBnFYkE+GU9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxfC0SD83sRxjhMLdgxPNIyzFXqIhOrjOSsGDxHfeQA=;
 b=ymWBakEYZITKJFBe6khq8p46zIDa0S5LanWivmxja/ivf+0t+BOLVvmHqhz9cPt6ZE9ohuezY6VW3c/PJlKwy0ET+W+sLf8iwCbAeMdvA2LA2nUn5mIOrU1G8ZoOwRimIifVxJlHduva/eSfMU9mz+YXUODyqLUZdzpR15ydzCQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2318.namprd10.prod.outlook.com
 (2603:10b6:301:2f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 8 Nov
 2021 10:09:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 10:09:36 +0000
Date:   Mon, 8 Nov 2021 13:09:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Alan <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: allocate a v4l2_fh at open time
Message-ID: <20211108100902.GE2001@kadam>
References: <7a59d8613331d242624e887d9089ded399015a97.1636105894.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a59d8613331d242624e887d9089ded399015a97.1636105894.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 10:09:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 018a7cfe-ec92-437a-5fa2-08d9a29fdd99
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2318:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2318789BB03D07B6EB6A1EC78E919@MWHPR1001MB2318.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2V++6mBAgmIxH8kHR+gZx5Tl8UM1t4+HYaN3sMluTF1eIjAojh0TmWoIAP+RDsMzw5V0b2ozCvcX0z9/lTnz0Y8HU77JqUYLw75STM/VCZYwi9to2p4bDxVDGOX88bfEo8LOLE7wTxHTLAWhFo9uNaYQqCelB8Oko7HjAXFpq/kYIU5s+UV2k7gYVafQGdpRrM7S9bf5bbgOduI5hdK4W/B9+ChpBPJ6qcXxx9btN5tHjqsQY0miV+uBL5oGrWjaNusE5TKPpp8nKg6JjcxS+qfpynC+iZp8EoFlRpKPxDlflq/NdBPHtPKKPlDHUiej/qVQ6iPWjPL4UEpfp+G4Ch38If+IhI17Cmd0FE6RPKCOjxLnOw/uG2cI3ebY4szvgSkZcL/J2D4g0yrhbKCgNkjQiVlNw/lmqAGErDfcahZTUGKzZw2KtyJUuCea9O53vWsK4b0oCh0zCi5SOn9EJe3AFcuQ6r3QQpHQMgjH9R7WBLiI/hVLkPfi+kDuz6QZKtO8nHH4kRKwePcJXabLLuelde7xUD3a1K3JBR+UuTDiuD50xT4BGkjlzubcbxw5n6KTkZO0ojmuQogS9jhYHGsYG63Vx/zJR2Vh7xj6gu1ylFYKMJeQGYce5vDNK79PxzlDlx6Ngt9pURGtctw6o3JzqijUxhjkywWC+kk07G1afwB/PWei/WZ65b1jShp5OZ7Lju0FYXwT9d6yloYZng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(44832011)(66476007)(6496006)(6666004)(7416002)(52116002)(4326008)(508600001)(66556008)(55016002)(33656002)(66946007)(83380400001)(956004)(2906002)(33716001)(38350700002)(86362001)(8676002)(316002)(8936002)(38100700002)(5660300002)(186003)(54906003)(9576002)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JQKaZOUZMjMcEUf921sEoihkfmIKkCdsDyvS0Fvbw0XQuZ8/rhWm+u7GTnNj?=
 =?us-ascii?Q?RLeIW9m5IUhRWnzXL6L2QqrLqArZHNN7mnYTEcW0PRQbp6o0pli0ZGf0d0HU?=
 =?us-ascii?Q?1wnd2aSxc00gntNf2iLH+9uvJsiLwlJthgpnjpdBvxhm7Pgn6Cbight4z71G?=
 =?us-ascii?Q?K5C+SiLup+FCud1NooPFxJh1cnmL7peaXibPqI68Us/iZIpou83ktTr472rt?=
 =?us-ascii?Q?E8GsbO0FLEvaSiUVTFRSi5Sc90l511Wkh0Mi/64oGDMbrvEIp7XvcoA4BBHA?=
 =?us-ascii?Q?Ei5neQD/8Qo6Mx6FAWuW7mMNgTq6qbxsTsenqEB0lOBUmRNK1lwq2WBsbSbY?=
 =?us-ascii?Q?Auxtde9LSLm2nM/Xo3ewU68anVpdXfIkSvjxZY17QSs1tk/HqtT3VofhBTG+?=
 =?us-ascii?Q?pmbhuFJWONQdlG/dyOFJS65gYbm1YEKohKEROJUonUU06ILNzylGMKUBJF0R?=
 =?us-ascii?Q?wijxO7dL19q9OdjuZnIcOzjovzslakYJMThWl8+yUYAO1KRfvkKgJywyul2A?=
 =?us-ascii?Q?fXqiz2TvnwiktP0ITo6wA4Aer5YaDu1j/IUuBhtI7S2JH+JLSpK0HA80G8CB?=
 =?us-ascii?Q?moDDP2PFgiwumnD2X2GlhkLJmIPsN/yWgG/RVDZA0Ql3uuzfqsWmC8zCDK0/?=
 =?us-ascii?Q?OlROGYImJpzu04bvAzJP5LLrZw872ZOrD5VxiolzGquuULB2mGzmDfDArgNc?=
 =?us-ascii?Q?EyUmmnBUxC6nwj4nDvqqu/tyEAsszS2kuvkDxQ30I+tVWTZ8rde15/8sYawz?=
 =?us-ascii?Q?DvOGpN37BdxQR5/axZMuQ8TH9x1szF0y+k9jJiPEn9EpVeUeUPPCOEKvnPkV?=
 =?us-ascii?Q?MVuxE7urRXcb0+N+nMriPxmrmMtLmtluQjEOHq16WiyY/297uVVjGqf7JR/a?=
 =?us-ascii?Q?L1i9KblBusZAo3/lRiVZdmdc/YN35zrlIC/r6EiesQ1UDIJgIATjONH1bB1x?=
 =?us-ascii?Q?sjJQQoD04rUF/t6MCS3HcWZPOXEMixj4PsOfQZP1wnvhCMHtoouTZslPK1x1?=
 =?us-ascii?Q?nG5hluh6wAH4a7P50FjmY7I3SB9LvGEivj904StgJU22RH77W4+ecc/X4FdK?=
 =?us-ascii?Q?L4mzal8K08N/z+XHBcjX1KJoihMSuuaaonKNuVuS2cgW2qsQOrkoxqscBzyE?=
 =?us-ascii?Q?1sqMuq37hlgRlJVBCfwtrF0gy/Aipca88hwIA9bZWEgR0lZhti+Tlv/KQyCC?=
 =?us-ascii?Q?gCcjTZN5US/467692+DLI0rBpZgN0aSSA/2Vxx4WVOk6pQye2abatGL6758W?=
 =?us-ascii?Q?DCzfS4btqayXNJRByoHDuLoUw7IUlUUO5CRPe4I8tHHzM1rxAqhfqjlPf1w3?=
 =?us-ascii?Q?KROiBQlsJ9zrPJ5fEjMyUqFtvWbVmpk45Nq62KHzl1xbpRHPTdkkvTUm784C?=
 =?us-ascii?Q?tzjMws2w9rSvl+N6Zsx3mgCaGuFycF2TsdCT8HqdBc5at5wWRYvV/Io/hbWR?=
 =?us-ascii?Q?odEcZxbbmH2VTIc0AR8S3n61u10zG1GZAgHczGz+FgEBN3tJT+3fidlUI1Vt?=
 =?us-ascii?Q?7i+krvbWTczR3NDL/laM7KujRSR0PBX4Q3GfxSuZAVCbRAPyzUMSnREjPjyI?=
 =?us-ascii?Q?yrMf77y2RC9cOSSzX09SqpEbqY1SwfPDHqGN96/FyI7wlhGPMVD+eltum8e5?=
 =?us-ascii?Q?PVqr3J5NZmdDVSMwFWGarXK27V+mpMVT7l24RNXVoGEJgC9/xsnoa/U+94Mc?=
 =?us-ascii?Q?sueWuQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018a7cfe-ec92-437a-5fa2-08d9a29fdd99
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 10:09:35.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGVEYgjJ2CNexk9hYwXU3ybFQhNR6pPBCjPPWHCvNuvMZpsShxFB1dIf6oHBkvr5JKZwmSYgYjneTeDiXkY5CUVwfrqa6BCW31mb5+GWFFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2318
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10161 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080065
X-Proofpoint-GUID: mjjtUuoPI2DQOpri9oLMcMSf92La7a3s
X-Proofpoint-ORIG-GUID: mjjtUuoPI2DQOpri9oLMcMSf92La7a3s
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 05, 2021 at 09:51:38AM +0000, Mauro Carvalho Chehab wrote:
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 7df982c80b1a..41fa0ca2d8d4 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -782,6 +782,15 @@ static int atomisp_open(struct file *file)
>  	 * FIXME: revisit this with a better check once the code structure
>  	 * is cleaned up a bit more
>  	 */
> +dev_info(isp->dev, "opening v4l2 fh\n");

This line looks like debugging code that was committed accidentally?
Not indented.

Doesn't apply for on latest linux-next.  Not sure why.

regards,
dan carpenter

> +	ret = v4l2_fh_open(file);
> +	if (ret) {
> +		dev_err(isp->dev,
> +			"%s: v4l2_fh_open() returned error %d\n",
> +		       __func__, ret);
> +		rt_mutex_unlock(&isp->loading);
> +		return ret;
> +	}

