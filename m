Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19461454402
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhKQJpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:45:12 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43254 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235613AbhKQJm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:42:29 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH9FV1N012698;
        Wed, 17 Nov 2021 09:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=6Ypu4j2+l0HZxaxSHrIRLyIOgkGJOqU7sTR1RkesrxM=;
 b=FS7XRSWC+BhFEPL/HlZkyLzTvGinqOYcpUMoLfO5YLchUdrv5XGybZFTI+ZIKza/cXHT
 3qpqbLgq3o7MClq7XMaN7rt9kM5gDiSLc2065A3Pv+vuHS3h/drnGvDSVR460MAKT3mk
 Mgo9GKbehuBnNH+Sh1IY4KNGN6mMZSxm4mulPBkL9QDniguFG46//26g3uBgy/dnH1NT
 CX/MrJHajwmAKbJ2akQHZ4P/Ioe8U7gpqvTAxuiFlTQ55mmXTBVV3sc4WL+YDYCOVlyc
 eTvPb9i9j8cWKEQk14HXSLu+8jwqKyx3YT6OGXaK+TZqajgWep6tav9z1f/N/Iyfbemh ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhtvx25v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 09:39:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH9Uijf007761;
        Wed, 17 Nov 2021 09:39:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        by aserp3020.oracle.com with ESMTP id 3ca566q8va-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 09:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZVzcjnTFm3iJTUg5aAv+cpRRCXziR92QOBRDZ6R8qpA8OHn7aeReDo4sICH1sUuEwb2rBh4mT/efidIlrknlUT8YGmhOT+SDrNoumDb9rlOGanhU1YwrxBzbK4YvZQfuuqZoevoKsKml8sa3CxA3VUmjDqSG1RGLQNrSrEhx+r9zp7t7L7uV5JnaCIBxB5AsCIZipC7c9gDgveTWOE3hhPM9B5Y163Zt+QRzIQ+3eXOHG3/tk9wbz1RoXmjWXPXlFvM4Y4K0/e9J9nJYwF0EUXhgn0Muy/J/BKLcrW6JMQhoQe/dud5Lz2EpVKU3GlRGs4sygYkfMqB386xfmeLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ypu4j2+l0HZxaxSHrIRLyIOgkGJOqU7sTR1RkesrxM=;
 b=afPE+CkUt/N9NMBnPWZcStnfgGXjZqWjhlAORfokfP1zf8vNgQhybSuyid2p6jBYtarT5jp9Vw18An4kzy4XnwKTuJPnbZVcgzUg9Lx6nI0OM4fMXJkx+oZGrEUQLtitmtLMZJAzcDRhHLRO9hWk1dFDP6cb217bkLXIQbskgrwbhJxanthAmAOnLRpU49EypkvZnfhiWZXevd4PiOme4YveMVvC3FZUHf5um2k/2DNaqsdd+KmBXTo09edy8G6BM35HUZba4zk3/75dYanDrfXELHKe5GXseKdEAHuL77Vv6V0njUNdEIbsZ9/UVNREvQmbpFG3aXSHbwWmtq4ZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ypu4j2+l0HZxaxSHrIRLyIOgkGJOqU7sTR1RkesrxM=;
 b=GFLplrDdKV0CiRGD+eDct7bxea0zL2HS4le707UdO4VK7STRXLVLRvschj0HqvVHAkdLwfbGy/kypaPGdMTbhhwJrdGuhharpyoUJBys4hsG3SG/zWunTKMv+jtsppeLeOvVjVIorF3W+qr5mbhrDnilWKr6Ot65Pekprv1fPO4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5570.namprd10.prod.outlook.com
 (2603:10b6:303:145::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 09:39:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 09:39:14 +0000
Date:   Wed, 17 Nov 2021 12:39:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/13] media: atomisp: sh_css_metrics: drop some unused
 code
Message-ID: <20211117093900.GK26989@kadam>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
 <e7c6d5349f4cdc002d6327c557e8c65a90e3447a.1637140900.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7c6d5349f4cdc002d6327c557e8c65a90e3447a.1637140900.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 09:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7f56ac2-5800-4952-2c4a-08d9a9ae1db7
X-MS-TrafficTypeDiagnostic: CO6PR10MB5570:
X-Microsoft-Antispam-PRVS: <CO6PR10MB557062929865B53F6C52EDD88E9A9@CO6PR10MB5570.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHBIEmvCxKNvZqm2A141oCKh1yMPkYtYhpQqPdHvt0OFCzncpcdYvf/q3D/gXe8T1aGK7irTGvIV0+GFZ5VS0ZXxXZr/LGDQHFW+Cq8sI/yivzELZCTXaqS0zuMmagk9e1bZsbjUdbhLYvLNOmlEN4KKuOZg8NH/K2B/bf8MlEJMGu9dn4P225Ir9BeLeTToI5zWQGbcb6NQQjRvD3JAcrmkEuQLRcN/ADqDpcYI4wRAqDUWN+FMXv8swgw+bd3o4BOJuDU3LhVvj8SGQu6bJZDxxLrodoUvLLZXZBL2FHEdbifrHxb/1bsAwX4FOm/p6lX7m4vTrsorvNQtw8RXZ9TcGrBF5Z6Jsa42ZTi8on+07+F/DsYNhwMg5/WUYo7h1FDOyCcAKYgpBhsZkXf20KprNCv+7Q5tua5aRi7ZuJ1VRcEvVOzsBEQJRYrIo4SiD8W+X7oUEMO21qHkybje0BP2S37AElQBn7aEhL6VPBGntKkbQJx/X7MBxCynOkftWIHcmYhnAPttPlqZxxLaEPs92EUAmyMlLIN+bEv95cLuS69ShS7eINegEp8quNXomvY9dtYsvH6YHL5ggrg5VmSTodmtFdqC81vuF/YlNJO4UwIcXxYWVsWA89GPAHKBu/1jWo5Bf4glr90bemXVynyWxrpWS93px2ybQgfF7Pv50Kk2BoEbVPRPSq7jo35nE+MwuDvm85mu/C+Yh6Gx8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(83380400001)(86362001)(38350700002)(508600001)(8676002)(33656002)(55016002)(52116002)(38100700002)(5660300002)(6496006)(6666004)(26005)(4326008)(956004)(9686003)(9576002)(44832011)(66946007)(1076003)(316002)(2906002)(33716001)(66476007)(8936002)(66556008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVnbZPVRsTufzuUcwGvNTGXIwzpNyUo8yRNUVQAxBI/K3PEicHX+hUHisMWf?=
 =?us-ascii?Q?WsMUyb4iGoggLHhAxbWAya0A2wSiHTzoO3FrEYd/fnu+Mw3ORjh51JbgvvJL?=
 =?us-ascii?Q?vKJmlt5QEepU3XL2J+JPantZCs8v4SpATZl4zCljqjGQkA2dtUMaj29LDEDP?=
 =?us-ascii?Q?tjHI6TlsNSm6BTGbyq+Z0PoU2CQ8F8C9VFBdw56+QJwF/CLfS+NDUzkRhSZb?=
 =?us-ascii?Q?wIhdKuGm1jRqn0ioNc8FdZRrfBGfenNgz6K24PLowZL6W6+n+NTbXdvwh2c0?=
 =?us-ascii?Q?lQQov0teynL388imCrToMcYQ5Fn7PuxdvKlib5udyjoEUC7mMkOFNHu+Flsy?=
 =?us-ascii?Q?WlBvajJYLixJYw0nzSN+QJ1L+XpLHCaWA/mTsE//qoAt5AdrqvC94ckmvV5h?=
 =?us-ascii?Q?6GHNXcntFtCpU8/j8BQBt/vvUFxNueBQnJvbko4wGrK7kgCJKhFHjsaHYJbY?=
 =?us-ascii?Q?11weL1f8GAoEZYgubaWBZg28jw47OvTVZoiNCmH8ZtLNFnSIzioxt7PzGR5i?=
 =?us-ascii?Q?WJxsoFVxf+vmo10W2JP6XJ+RjTstIfsU4xe923R477VVKUb5QzpFPPP9Gqq2?=
 =?us-ascii?Q?HZE8JWwQp72FyyOohf1CyqT6atugJQW9QQWeLrSto7Bb8v6fO/JV60z+N3tO?=
 =?us-ascii?Q?FFwnfAqJsa7nlqE6WErTdsgIMMRjFzlA8IxPkX4QSJs7SwfiPvtESHkIwwYV?=
 =?us-ascii?Q?cDssB1RAjAGNvA7uyQyEHJhmhhh1k3mpPV4/+l/yOpxtsfuAEyzCJX1CdY1c?=
 =?us-ascii?Q?8WOoqelr+8mqie/Tl/tGM+uoaSLAiWZXDTTgS56vgHyJIaXN1LagMrN4inZr?=
 =?us-ascii?Q?Ma/B8E2YduFW+EZarjHMmYcUPjtlE1+i8hsV5dOnY9vJ4ATiZIfO2uUgo2Hy?=
 =?us-ascii?Q?EMLAFygDcYA+Ftl6tYfy4B705knrilwyQIQ4MSAMZwed3pOThbm9ARXD9Av+?=
 =?us-ascii?Q?9IbtsCw5o6vAagBfxQ9mTh1krWoqj2sg+bJW/qnUEgJ0ZbWMCYEkGJ4DVzBN?=
 =?us-ascii?Q?1URGp3OSprmQTkcUpHPpFHjVXbxN2itiFp3BiOK5mqzTj0E0n2kz97g7A5z0?=
 =?us-ascii?Q?e5WVP38ZOJ/OvUMgSrRm/b6Vw6djeLBKWmsmqvCaFFKoflGmfA0XKvbRedH+?=
 =?us-ascii?Q?7PB+j49vUvVtalz9Vh+WUrbu+DfcRUNkVPLaaEgvLwvndikiGgqthOjiJf3Q?=
 =?us-ascii?Q?HbpgSKgg84Lgc6jV47pxdnBnhMLyRTfOfwoHG0BnPJMaoJncTCyE5Hu52Yvs?=
 =?us-ascii?Q?REB4Ilc3Vdd2yfJxRK1GD6snSldEMET9oOZ1liffglmbadZ1j15mbXqsr03Q?=
 =?us-ascii?Q?55cm4KgUi5C5NC/SCIP5k+fRxqzXNel2So6WJgQkSNHO7rUchjh9HYVRAGy5?=
 =?us-ascii?Q?U9ugcCDkGsV3c8sUUMKwvB5S73W1rgUwgGig21u5OfS3/9wlB5WeTJ1DEhzS?=
 =?us-ascii?Q?4DNmXf6VVaNfECu/YrudIbHyeUQRq4DtickHsax/EmDQBxLJJJ266LIMPvLr?=
 =?us-ascii?Q?EL9oEYs94YN/wjWYYO2M4ScW9v4pYFSnVFjtolUVbQVoSpgJtHa46Qslu5nO?=
 =?us-ascii?Q?2OIsrNA+ABLnfTbMOuNxfA9DVW0kbz4td0A8oc5kklU2FIOawXZsMRCyZ0ZY?=
 =?us-ascii?Q?7MmKYZQ1FHxKYHBotQv3pe4ZhfJw5adnV39NDnip4PpozAjksxMOciLNj1fm?=
 =?us-ascii?Q?uG2CW5WcKpFDMJHs5YgK95x3n7U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f56ac2-5800-4952-2c4a-08d9a9ae1db7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:39:14.4199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loQSASrzH+toE1Hz6VMA1ozKO4F72aimN2JoexATMFlhj6IRSt50b/APQn9M1YPiIaRPZmLLaKLyHNDwl2DgLc8sEEzmwha1LGFheHmnGr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170047
X-Proofpoint-GUID: Ib67gz7_oVQjZp-8MET2CoCRuGY95RXb
X-Proofpoint-ORIG-GUID: Ib67gz7_oVQjZp-8MET2CoCRuGY95RXb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 09:25:28AM +0000, Mauro Carvalho Chehab wrote:
>  .../media/atomisp/pci/sh_css_metrics.c        | 25 -------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
> index 9744bbebe1bc..8ded6cdd1575 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
> @@ -123,40 +123,15 @@ sh_css_metrics_sample_pcs(void)
>  	unsigned int pc;
>  	unsigned int msink;
>  
> -#if SUSPEND
> -	unsigned int sc = 0;
> -	unsigned int stopped_sc = 0;
> -	unsigned int resume_sc = 0;
> -#endif
>  
> -#if MULTIPLE_PCS
> -	int i;
> -	unsigned int pc_tab[NOF_PCS];
> -
> -	for (i = 0; i < NOF_PCS; i++)
> -		pc_tab[i] = 0;
> -#endif
>  
>  	if (!pc_histogram_enabled)
>  		return;

There are three blank lines in a row now.  Checkpatch is not smart
enough to spot this until you re-run it with the -f file mode after
applying the patch.

This is an easy mistake to make and you did it a couple times in
yesterday's patchset as well.  No big deal.  Could you re-run
checkpatch.pl at the end and clean it up afterwards?

regards,
dan carpenter
