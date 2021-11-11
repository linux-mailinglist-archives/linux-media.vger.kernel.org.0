Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B0344D588
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 12:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbhKKLLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 06:11:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39414 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232964AbhKKLLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 06:11:34 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9aDOU010759;
        Thu, 11 Nov 2021 11:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Y/gzQQT2fguPa+Z+9AOUkiLI+e2xCrBG+ef47GBRyGE=;
 b=DK3zXVJB0AaRXFBBmHTpzNvTwa7c+XhLZDogSAeYCwJXvll7y4/T0euNwdUtznghpl9P
 osEXRn8PoY0RPtmRqqGXWvTHV2cPy37ZbFjftz9/7zWXB/Sfg7cxAG6Kt5CNVoTCEG/8
 JFiYSVkzxLzNk4JUOS2mDyOS65+y8LMRqMavJFQE3UBr8bxSqEMTC6tKF99l1ymUa9vn
 kmj6RM/wXrPrWKoj8b3p5lGbHPVjgXbLEbKYALJm8kU5O6hnYKvapOy9IVC89+0pIZda
 ByvuFVL2kMDJ0QC/D/gbzgWK4rIxZ+4+WJKkjN5Nlajd5kRQKjkWISMXsB3roc5dVptI VA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c7yq7jyvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 11:08:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABB1fvk088795;
        Thu, 11 Nov 2021 11:08:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by userp3030.oracle.com with ESMTP id 3c842dq7ff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 11:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N36VO1XwH8s2FG/BIKtj8MfUNumx2Y4Z30PJaM2tFScajwggm7eA2fu3acZvVIQ1PmTOYhvQzVT3HNp2wq7gIJ+qS4DBnMGByhou3N6QU9VgnZIH0ZJzM5AvJxgKUSTVzFe54OERXLkzlz4YHhiRvzMJFAtNz1YqB08bUaT6s4zgydlXaXt6YK5PK03Srv47QYJVPzGyUcL+xr82LNEZT6p25/848CbVnxGiVW/nT0m1sRVTSSHEe6n8x/K1mGc8Dry2QVV7M9gmkuPTGBFdo21hN78T9MWW3XLHSIou2ORLKdqyYpafNyWVJpEOAV9iWe8HzVCxd75bTMqHJ9ihwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/gzQQT2fguPa+Z+9AOUkiLI+e2xCrBG+ef47GBRyGE=;
 b=OTKKEbxJFVIQiUqIP2rs6XKQPht8U7DCp1EU7RXZkeQ2Yg4ecy7uYcuNwP0kMu0pNLEb23GbfsP8lBL/JRN97hF6c0ycPG+a8SyobiO8O5uocbwShDarIHpC7zt4lRzH3d+0jT/LlnlifDnzjNNaTleAKgfoh5XXCA03lktaE+EDiJVWREubDOllVApy5IGd8KzThfvYRFQMzCFQpxLGogwaQWrmcmnyzG0xfLDYRlnl4ej1zur0mWGlKrKQdbNrIi3FXO5DxzriPpyaVbJthELtITNrRsVA79OEpH1ukb5PItWSDMi3nxKn6TpNE77P5sMentfwLpP7wrc5jcZoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/gzQQT2fguPa+Z+9AOUkiLI+e2xCrBG+ef47GBRyGE=;
 b=upOgJJm1gkuVY7ODMbLrwJOZv0Zqi1FCoowvNtpbcDUWK3ANxl/IhLqDJ3WsHKvhm2lraOAXJMNc2a4EuVn/zRnEjwPOixi+nm4+c95/XqH4wk/pFjkvkARiz/uGDTDv+6I6P1/bGzbZ7wxG/pCrDCbh7NmawAtXgoO4Xeyfk7c=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1613.namprd10.prod.outlook.com
 (2603:10b6:301:a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 11:08:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 11 Nov 2021
 11:08:37 +0000
Date:   Thu, 11 Nov 2021 14:08:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
Message-ID: <20211111110818.GR2001@kadam>
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
 <20211111103303.GQ2001@kadam>
 <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Thu, 11 Nov 2021 11:08:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7437487-77af-4870-b3ce-08d9a5039c45
X-MS-TrafficTypeDiagnostic: MWHPR10MB1613:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1613FCCF8470BD8AEE5E85BF8E949@MWHPR10MB1613.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsPQyUBh6ztq2tq7+fSbxdubHoE/15HSfZ399S1cfbbhupgcPcgkp8JZUfYiuCdZ7OYDoXLFIwm/psYNuAmDlISBrufJuOLmyto/eDArsBnPibRddL/gvYPqn6H2FpDrLQPQHYf9UFQkqs624O7rP663TE84U/UOGlaULxCdVkadGbhYvXXTkd7F/m1q8c/Uibbv+w2pazf0AVEoE5IEF4QW2cmymtX2ka//rSAo1SiEd5kXtRRUe0CN+9r1u+BTWv4yEO1IPtfkT/SSUTxIV1GYadxRaAw6dWvZ++BLCxG6l/cRuvXpg07WjDQ/FX77BF3am+6D5UxaWUjLF3KIff1Kz/4NvgWCYXxBupnOJX17gzh2gOC4fJPPHzay+br66jF9B71yjc2QpXagBbzB1oNNTBAThrXBeHYa849kZufOXa41QkvLd/VS8yrr/ZuqRMXs+fp3f2PBQ3HUiH8zAdpZDl4q1JPAdWP1rSCgB1QCgwIi8m3MHVOYVgZ7dGt7MZOu8UXpistXFgS3+es9G7Qj8VPOwQb2S+oMT9fM/L4ABGwZwcStab3CF04e1QITFpQiTH+O6+a9Jx0kMlMlDgcVvzLmTMNnkVdw0sLKNxac+svl8ME7/5AjniPy/AfOSoxGjWuteVq9D0h4+KcTTl3c4C9K7yEi0+QCa71PBuCaYceWHHc3V+TXUKpGhA8rJi/Xcr5+yAZHYJ/+i13RkyXMimEzWiuLytYsDd5m9bwMuUYkB/LRPLlskgFjGPnX4NH1jJDtGv4+/+3q/IwQKZ8QpchmQ06jocYpaSHphRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(38350700002)(186003)(52116002)(9686003)(6496006)(86362001)(55016002)(33716001)(8936002)(66946007)(26005)(8676002)(4326008)(6666004)(1076003)(956004)(316002)(33656002)(66476007)(6916009)(2906002)(508600001)(9576002)(66556008)(44832011)(966005)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wri7YqtD9Fw5dhqPNTQj+c+EclMQlqnDC2KExTeWB1MyYLx5vSpH3uTgDO52?=
 =?us-ascii?Q?Fkv9fNgw2QUpPTL4AiDKfXTnfwE2YYGzzREIL3hXwt1Y3bwBFShzZp1gfVP9?=
 =?us-ascii?Q?7+bZ46cmQxibAUeQFK23WGZp5Be0CpaSqPYhEXIA7T7fPOiiOMR5COwUuhxd?=
 =?us-ascii?Q?q1Ezdqid4a4yLS/1SkEFb3VdTvLkgDPRgJ1UP29/Dvph7G5YuUB4lkpcMZoa?=
 =?us-ascii?Q?sfGqrXbcBPkrqhXHGQ8fGg9eq33sDY+wCClYbetfhlFD48WqG84nFoIHkQsn?=
 =?us-ascii?Q?+sKi91n12SPgESBU1vteQL/lKX+VGVTxlOXQjtDukrlO2PUYaoBrbzPDnFal?=
 =?us-ascii?Q?9vJy2HF+44v9TIM8yP3swf+qar1FXC8FP1k1idHswyiyOn+7VD+Tmwl1C5XZ?=
 =?us-ascii?Q?GiLZCpWMvYHK/BBL/ZNE6D3q9etAvyj0IQkfTQl+w0kaciLsazr3msxO6akB?=
 =?us-ascii?Q?XGQn3SwEVQDCkPQAaNYbzwbzDEzJpcTFwuDcojjk+nlbjtI5mbAPXqStBxSn?=
 =?us-ascii?Q?Q5oQXIV/ASm5wX6kmL3RbHJluJDFZX0ab9egsyB7WRvt1zVDrEFAetnmCx80?=
 =?us-ascii?Q?Nk9pUW4jXxasBmFg+qq73Pod4m5wq2fG3yBqPz+OGu2qTiJ4pzorsa717Sn2?=
 =?us-ascii?Q?eq9x6lZ7XAwgRRDaMkWYl4jN3TTFvZnHNGHnuTASdi7HYNgGwg2wqbXSsOJy?=
 =?us-ascii?Q?Wu/Pu9qs8PngeWSsmQ+aXaYfE7pGPuiExVl+3mRHJv4UROVGqyLgfwl3KVWx?=
 =?us-ascii?Q?uyU9lPvVTtiUfMNAUmScnBj4E2cFC7Lcx7tiwN2WbF53KvzGjn2bt775q29d?=
 =?us-ascii?Q?w+wEc6MC1HWkPSpAEtj29rqdVTIpWAlOg88uS5iojnxEcQUNxA+ez4N909C7?=
 =?us-ascii?Q?vlMzersPNPQ5++gf/6a1b9m4OWi/tUMMa7ZDXXJdUpctYKDkzVT5VucGQg2L?=
 =?us-ascii?Q?lAwGCfgd4I9OGzdRSgQS3c1WWPxXLV19nF7Y4f9zk4aoEOZzQtX/2SvTwKrs?=
 =?us-ascii?Q?9GQKQ/7wIBBU7izOSjUzK9X/zep9MM3t9UnT9etiBasDkMo2z85RtP3ruarU?=
 =?us-ascii?Q?JIgOLEEWfDs1Hx0YjHzZFArG8dETC5EEyEv3PEQ8PLAaEYlc2p4lHuCYOC8E?=
 =?us-ascii?Q?SOJQUEgnp+IRTQ1RVXCawJqaNXtpNf79DhXHvYBLG/gmo1xSj2fT0dv3A3/4?=
 =?us-ascii?Q?HpFud/2q9yMNw34IXozPckZwMflZjJ+dOFczOGnlrZnpei4hpWiaCOcEG6Lx?=
 =?us-ascii?Q?9fpU+Fbr13d8qH/XiZS6TQfWDsipRW/bC9p+VjeX7JewyzPMnXEvKF4tUaj0?=
 =?us-ascii?Q?QtUXXMMs7NLMXGl9On7yp9Aq8hFtGOtMBgqT/wNObevcUx28PWSCthfp7PjZ?=
 =?us-ascii?Q?5IerdJzGVTe8wvsnD++LuEgVQAChlxhklK/EVIHxSSXR5YsgJYrj25WQZNAO?=
 =?us-ascii?Q?D7Cu8w+qW0gFOZCRTfxci+V1JC1X1wiHwgUq4KYHgdWCy79fT7tOt91UlDTH?=
 =?us-ascii?Q?tDF5ZJqlBCjPF+Ey/okPRPZEhO8YpwWwsW2WZDX0K2hKt6T1SLxe7tRLthlV?=
 =?us-ascii?Q?Nws/xA4sMTc/W2H9VRxk8o0m2zUyuHv35h2vmYvzvSt7LBxew8mWJE/njSsy?=
 =?us-ascii?Q?xtRAFW8BmSkvOxaNS7auJZGeW7zsaHOdBl6t0GKiHKzWcLZRW1mmyegibIgE?=
 =?us-ascii?Q?jueYEI+xgVpvMrqXes3CUR6/Tzo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7437487-77af-4870-b3ce-08d9a5039c45
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 11:08:37.6553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJBiAQEGb25yr1QyQlw7NcUkQZuyZhjJLzIQLoKJHFsNgZBX6kakS7qkipgRCQwK/ITuSun1dVYlpSWhhhBDz99WLI1UHiYqVNDmYiJ5daE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1613
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=936 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110066
X-Proofpoint-GUID: RI7whW8iwgH0G1-vOTzvv097QqUWtshp
X-Proofpoint-ORIG-GUID: RI7whW8iwgH0G1-vOTzvv097QqUWtshp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:40:32AM +0100, Ricardo Ribalda wrote:
> I belive this is also addressed by this patch that is under review:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20211008120914.69175-1-ribalda@chromium.org/
> 

Ah perfect.  My approach was quite lazy and that's a better way.  Thanks!

regards,
dan carpenter

