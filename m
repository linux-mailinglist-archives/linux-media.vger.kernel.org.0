Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECF34554A6
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242934AbhKRGSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:18:51 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27776 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242905AbhKRGSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:18:48 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI40j0Q025611;
        Thu, 18 Nov 2021 06:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=C6eUtW67XJaq3cTKvM/D1bRVGsfwxhICRTQfXJSWYaM=;
 b=XjjDdLnCkMLd+QJZWD8rakzSKArF+U2nfcor+NcwCTZYDodeXS91ofxeAKaNseFZXQaj
 qCWRXzHpa8VX5AxeTGsNv6QLxcStFdjKKkWXdLMyzfRw11Le5Gy/rOCSLUhIc3VOYCiH
 Ih78+yPiENgNyZk1u1BMsZaUCy3Kh+KDspam63zK4FkBSp8LFxggnDk35K4iG3l/6Wm3
 s+aoHQ6SDzlBfvMRoDPsiKsQozBPHHFeYeh3wOZ9iiz9IIbYaD7iZMWebzaJboqwbQK/
 c1D/fALEJaTPL18Vw2ZQGhsfeZ0E/QGlmmFPfGMRU0kWb9A/OYFD7gjcTnfAnHl73w7Q 2g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd1w859eg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:15:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI6Akkb006651;
        Thu, 18 Nov 2021 06:15:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by aserp3020.oracle.com with ESMTP id 3ca5682vfy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkhtll1rju3hPIEC972TFHu8BVuk6Duz18EqveK+Z62mlVFLlIyzU63GFwnU0N/qAFdWyLFw3VuyDNM5DGSBm59iWBgXeOqc10xYKr4NYvihuyQ9r5mwD8UNi+VEES46gWUFgji73GksXkfxK/wHbJk+uCCxSQSNVv/UjlnCEt+5w9QsAXhTdiRdPjZpHZXO9a75i4YM2Ylx01ll66MMSgNeF+B0LUc6b31gO/nI4hfa6wT+lx+TH6JoxWX+ZfRWzG1GIQx9An0sJ3w7MJPPdOqGUzJv8MdnN6KNWSNsHQNAOktZPoOG7E9Qu37BC/WFP9/c9vhvtHzClufDQT++vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6eUtW67XJaq3cTKvM/D1bRVGsfwxhICRTQfXJSWYaM=;
 b=ehysD9Yy3GcTckwkZsk/Hk4/gEr/wYrZPkiIdNzeJY9iL1eHs9Tu8t76SSdfwx10uzX6WXg7EkNjSWXVniNIIPb0LQv92HETCYPcWfvLGHNOnE9ysbE3rDyKVTjsZgw9DKVzcyrPd4jM4Mg432tdcYFzrJgXkJlNEiRGI5T10syzGr5nKfdX9GIz7r4R7XJaonS1hJT5FDkG6/4EmYM9wBqwfDVUNzCDEncoN94tBJwNQmpNHsCDAyCaSdVHOq6Y7kiKf3MmdA00hlUdXqIOeVZ5V+sSiQ+2FiLfESKaBUozYlajUbMKbt0B3Cno94NrNe06nXTSYjnUPjF4MYmw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6eUtW67XJaq3cTKvM/D1bRVGsfwxhICRTQfXJSWYaM=;
 b=uhe4hxsfYnOGRpulC25Vv2NRun3HqUqmhB48ZrcRUTgUIHnNIpUN35zq857z/39XFGxpoPAdpHpjU9yTN/RNsa/LPQEvr717k36gjIxPsSfN8CuF9hSjd0okBzEMg74nMul7a7vQtFpI2ChT1vsuRsb85bwqYQG/pZ6e5H9XLWA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1727.namprd10.prod.outlook.com
 (2603:10b6:301:8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 06:15:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 06:15:02 +0000
Date:   Thu, 18 Nov 2021 09:14:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
Message-ID: <20211118061418.GO26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 06:14:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ec1e0eb-dbbd-4be8-5e68-08d9aa5ac1c5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1727:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1727E17245D50D2A6BDF5CF18E9B9@MWHPR10MB1727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zdIfDKzwYv1ZPZBuCpMJ/J0/luKcL1RZ/SBERkNcrNRHEhrkxfHaDqpM7zwqslRyHdwYbWeE+NzMcArA7ncj7jAWFFWlHueIuwoaO3dErt45S6L/yHKPOw2zc0pHXQVqEmeYhPUXV0MlQRmAH1OOFUsXBCuKYSex1DX9P8F35lyfcDdWvmxBtN3VpRYKnI0e+CHwYQplB3Y2mDB2mr+M3belzqF24wyOauYpoYbhMUcy97umMr7/M5cndQmnlHuY5x7840WMzDHrO4jnV0rwAzd59QwbDmq98DasFYqHzLpP3OMjVTnQKwpaoum18i8KGKf82+bxAEMUESP38NaAOnoaeaZNdI4N5oUmZ01zX7SWaIqgGY0Q3Ts42EkSQjr8L13i/Lv0Oq1/CxnLYnWsVBANlFIdBDtUA//LSKOw0YzSZ4VzygTeMI7YbOh6jd2+8LJgwVAzbauPqA8KciUniTea3H0RqbSKvibXr8AalFrG6HAFDyxsomRGJpa2zamtFEUb9oc5jS/I6xqbPPkB0klvPuJeMGMVcNP6F8TzjV0UB93dHlsDLfObXiZXf4OzgKbF9PCCn6M/+47gjGMbuUs37OYX0MF/e6HMOYPATZ2ZqKVmCRgMCROsuelhn+xFmmN5BtQEx8WDFNKMDzb4cNBVuxgxEh6xsKwf6uhMlgGbSdkUFj7LaRdC2KX2PtQQmtVaQbJSLG84a0fMZEjGgdPTRm0RXLZ7swTJpm+RotjmvlUjScV3SLIXSUsAMpdRZVJT53e/hImCJbIcB1PLk9j6dAKzm/jBY+0vyyLquoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(55016002)(66556008)(26005)(9576002)(316002)(9686003)(33656002)(66476007)(6916009)(186003)(6666004)(4744005)(1076003)(33716001)(52116002)(7416002)(4326008)(38350700002)(6496006)(8676002)(966005)(956004)(86362001)(508600001)(5660300002)(54906003)(2906002)(8936002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2URfPmz3ai7/vSRiqo95Mzh2s1bzqNqNtSYm5QmDWu6mS9IYOHKF7H2VrNmL?=
 =?us-ascii?Q?xSYOfuNUbS5vO7+W96O0xkpilGm+qRRvNY8NkAz8R6mlLZFCj8KLJcHcrh4B?=
 =?us-ascii?Q?Wd96VurSQKz5dWtvz0pJ1u4z72PGXmO3KuC5SJ0xmT9in3H7Jw5tWt1xcFCS?=
 =?us-ascii?Q?Qa7bzjR8eX7lH4HhigIQv8/MLpLzuTTxHzlHgwMQklIn+aenwTFy0OSq+PlK?=
 =?us-ascii?Q?kERzppXP+ThMDbEe89VwBtrHvAxQLJhJhEe5bxB1Z2lC5wNlceiXNjwWKmTX?=
 =?us-ascii?Q?tm83iwI94QSXB2VAwlSxe0nS61lkg69EF89D3Qu3b4tnmODg9UZR+FnD7KW2?=
 =?us-ascii?Q?wOCOiuLxCRTXOjHZe6ohXOKj4GF0uP81JLcDYegcCLm9waPLcnfy26OgUA5J?=
 =?us-ascii?Q?QSs+5dzJFAEywXByLsFpgNqInKeknYxdmgW7WvnvfeGCxMLbNEap6aVQOqSP?=
 =?us-ascii?Q?a7XjOI87yX+vGt94eBm2QPXSpHOQ6ceJeFp91Jg/6b1sY+S20KYt2btSoLCU?=
 =?us-ascii?Q?GNbmjHPSfowIW+AFFNufb8NlgcTf/vfJtH5qyeVe7iknX9xrP1XIoZ/Wi6We?=
 =?us-ascii?Q?aVQrbDBNnsBgf0MrWz4ugujSSxsD7H4iW4SQxvFGxbGBjZInYL0m96RCupET?=
 =?us-ascii?Q?EwSv9ycv2J6nGsEvVBjpOYKQM02sb+HYfA9hvb9BDKSbGEacoKdxKiV3F/xX?=
 =?us-ascii?Q?nFRezh8HKccn/JhEfK0A71J8Nz9Z3zPmQOqiOKuBUJGesdWYQ0U6N+5M77VD?=
 =?us-ascii?Q?itcaM+i0q0ecgCzRkxHtM7AFOkQ5NbDRwn3Fz2/syeI58cJDh6jXR4M8imJG?=
 =?us-ascii?Q?DFmVtPdeQOiIHwS47k4BRzvR1+JAHOtWNRh/TZddyDQlcxMWrjs4sW+H7Iqk?=
 =?us-ascii?Q?NnsDDPrNZSSGQvy+ouEVZRRB/m/47NS4VrNOt6yB2VhfhpkDT2VkkzaTLkFY?=
 =?us-ascii?Q?wPCCqsqPDSh6OhyQS/CBT3jcA7xFo7ATCN5cGmCEKWjNz2Dl77lHglVID34r?=
 =?us-ascii?Q?5CQhRRtzaqE5FUFIl4bFrRbpQQNM5eOMRgfCphJBpuOkxksFU7cSIDHMNvSY?=
 =?us-ascii?Q?JsZ+1MLd0oU/w/54kFceIEELjvUO+MIO1BKVHFFtqJeNAe761ziSqagk5+Cd?=
 =?us-ascii?Q?s/Bn5sNOJ34rnSlSntiDPzDVxLMAKwPE7ERZ8wMrHRlqlJ/SQ5P4cc2wPo73?=
 =?us-ascii?Q?SXyEYe3lLtaici+oGl2bktzivRn1pZBXUMLNHjBBQoW4I1Hzng/N0TOq1cDc?=
 =?us-ascii?Q?f6A/VlVHDbeuglPCNgcoZcHXLVw4yjWEXSnbVdd01t4a0FJRvTCjLaDxHpjx?=
 =?us-ascii?Q?md21/JVd25//MEaQqnbqFVNzOHf21tf2TZbXXqu4w0WzQQFDfR5Ybv1hqZlx?=
 =?us-ascii?Q?floKVb50oAND6zGIcvTIuCqlnfVVnPBRPOVWroZRNmPhx059brqL9TPzWMQo?=
 =?us-ascii?Q?+6WipBDZcfsN1/KHMWkXBBp8e2t3to/4Dg8QiXALr55efAfFM2UU6nPEN3Xg?=
 =?us-ascii?Q?AOqxP+nEhO0GTpwvBOg3CYqZV1ablZD4e1SPrmsad+5YmcnNHb/NVi/8IUMi?=
 =?us-ascii?Q?ykX4QVh0aOyzYk1f4Ym04m7dvfm/MW630hnaIQ+ZsJgYxiyVxHQzcHJwxQK0?=
 =?us-ascii?Q?tgRg2Ej/tGIiBx3QDtXX68bcM1jgE2TBEZW8BAD5rbiG3pweliK0LxiSXQx0?=
 =?us-ascii?Q?+Uogs5X83tqSs2I8KcVOSGCJXPo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec1e0eb-dbbd-4be8-5e68-08d9aa5ac1c5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:15:02.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wutwE7FDY99kPxJ/65nNs2Tas2/dzCJeDC0Nbab0hbk6LZT5c6wMfdAeuPUp5LbHXhABXG5TMvMvXhtFnVTB/UD1ewApehRtxcK6DO6vBiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180035
X-Proofpoint-GUID: 3IzFW-tfUG4ISwci01iFK609CWHakc5X
X-Proofpoint-ORIG-GUID: 3IzFW-tfUG4ISwci01iFK609CWHakc5X
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not hard to run Smatch yourself...

Depending on if you're on a apt distro or yum distro then fetch the
dependencies with one of the follow commands:
apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny

git clone https://github.com/error27/smatch
cd smatch
make
cd ~/kernel_source/
~/smatch/smatch_scripts/kchecker drivers/subsystem/

regards,
dan carpenter
