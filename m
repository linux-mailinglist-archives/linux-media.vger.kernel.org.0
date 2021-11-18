Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC0A4554F9
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243494AbhKRG7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:59:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50526 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242647AbhKRG7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:59:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI6HOHi020976;
        Thu, 18 Nov 2021 06:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=YUfCCq4tp58Kal72SWlFyEy0TlwURKvnZuFxL9IsEFw=;
 b=e7Y+7fqJCQkIUXxnMTdfuQmT8FN/udZpr0VEEm6mkjSTN/nqAklGR4s7rLZPntAM4Out
 i+JugoeI8mEl/HTtE1h8Hmn4hoA5I8zLnw/XoxMu2Anrdj0O3rbjXCLwH3YGT8EI5Aqy
 leugH6fsZFR50c//4KXxevf6TWUfR3kkVIpbrZd8zzVpA2gzmct1O/DIRFak3fqyBNcW
 jZuJGxtMJ1JtiAX8aRONvh8E6BUSGn16zD4lXvkpehE8ytKxN85FR8w09bcddubxaF1T
 r+OTprRYQWnVz1B9GbS0JuQ1O7buKdBs+UtSLOp7xNoiPTpIVuRBLglMn2BWTsJz01bc 3Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qym6py-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:56:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI6p8H3091647;
        Thu, 18 Nov 2021 06:56:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        by userp3020.oracle.com with ESMTP id 3caq4vh3xd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/DtXizDiZ+TklB6HJwhvA1pPVLv6v744ogKGpbGX84rm9AsT/DfjrBmTe0ISOh0/n5SCmP1nuV+77/mTc1LbU1RB8b+jAs+3qnSgTO+2zhQowGWuJtFZnANsk/29jZpNAAussh4RJIimUvRbeMdzk2HfUAxDaH1hRAM0757aG+RGXvlvRpi5Fc14v2uJ7uUCXlDIZZy3YO3WpS5LWzhJ4jfZWIzVzzkn3ohYp41A9bF6dc+6vImgOTnAfymZ69JlB1LjYqjJTm5GnBoQCxMuMqE1JFtCz1FWInRq8OrSRDnAtUlssi/C+G9iDDseBh4jLd5OpL13SSQOy2wLzur3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUfCCq4tp58Kal72SWlFyEy0TlwURKvnZuFxL9IsEFw=;
 b=Pl2gWbGbG4Ufxwcv0rgeKNctGMh47bBjX+j7u1kPm5gSMksYR7ycn53YE7Xf27Nc3qWmquFpZhhXPs2mKrMC5c+Ob0BQSMxAwuuVQy8pElWokkVF4gPFYVdRbGA2BzuU+vmvfjCS/MfgzIC1GjrTbyrCePaIwwgF0wyA68RIN6KvLStRXCbD7x2IYApEv8RZb8pPcmYrY/+HneKdvhNEDIT2Wye44xIJImFaHjbrqFfeXd7qbuIV/5ALsWI7mFLSGLfEfBzhU0ogC72j3PNVavJGMs3LX46MrHK9WA4TJBKCn+WO3xyv+40zMorzqmZBEa64RNRjqcDDTt7F8uiW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUfCCq4tp58Kal72SWlFyEy0TlwURKvnZuFxL9IsEFw=;
 b=duzWo2/rAZCLO7pZDc02+hI0TQAoFvl1MOrAZnfp7e4CUoQMD32z+xcB4vnUFYh/g9+EPj0cMX/MaIxU3Va7UvSkQw6Ix+IAiKYhzoHr2peL8Rcp4ptmYamvzkiJ8ST5kCuRXJZXxj9fh8wK6mbHxorahBjOT+L3pAHr/xyJeE8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5666.namprd10.prod.outlook.com
 (2603:10b6:303:19b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 06:56:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 06:56:18 +0000
Date:   Thu, 18 Nov 2021 09:55:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
Message-ID: <20211118065541.GQ26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
 <20211118061418.GO26989@kadam>
 <cec5c6cf048eacec2c8204b99c5708996fa9f178.camel@perches.com>
 <20211118065315.GP26989@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118065315.GP26989@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 06:56:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdc81a81-158a-4355-389c-08d9aa6085a5
X-MS-TrafficTypeDiagnostic: MW5PR10MB5666:
X-Microsoft-Antispam-PRVS: <MW5PR10MB566624CF9546D01CB4C0D5418E9B9@MW5PR10MB5666.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MkbgWaN43LwwFWxNgnwSOwvUaeWYy9xHb7mK6P0sWWOp8gDHkeEldaoMaGM+i24Jb9IX1ezOMWNm+EfN55bhEw/yZA+zZNhcNar2fGy6rnjiZWHYK4ykJVSa46GTFEIEIwNNNc0CAyeva5pRW0P2FLFCcc3lKWYoCWisB9ULZbo2GqsED+UVahGo97B9RPIyIQ1UnmY8uDjqVYrECfyzMSiAZQ9JMN9vwShXOLR69raphphrjrn4zeXRn2ZeRMTaRjuObpNAWrf23dX4U+206gNnPDA8UwSbb9zT4HpyMrtnLIqkHYZqjJ4Qb/1HDjSUVlLTuttoZmRcIR+3ssEq1ph/XskHOHNM9oPgYiqjMdzmYT3bPdbDcSZA7sILYHOMiJvf0tV0mtoqO1o8BLS/m1fYVnxAe2cAghKEKTafuZFZJI5Fkq2g5iwA4ow5bBm0c6hY0UND1DCOB6tXUZXlVfZVkJlrhoy4mqOU/DlTCM0guEAeV3JNRUtOeDl3zKf2v+aXFy/tFa2EIxicvA1P93F66EaKZ8aufprLepl09ZMar8s6X+7CN8EG81HzkxgMwew8muCwT7wJgnpIh/rU0G/FqlpJD1p5OIOoEFqby5MLRWaDNV0rbjLnV4LHCFk3Ja8sL933b0dSyKFm1sqxEH4+EU9p2boUkEUyz/OSzROJvZc75y9E+nZBIxegKMqTkj7RR9yXLBUDvnjlmrK9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(6666004)(33716001)(4326008)(4270600006)(66476007)(66946007)(9576002)(316002)(55016002)(2906002)(66556008)(7416002)(44832011)(9686003)(54906003)(33656002)(5660300002)(8936002)(956004)(26005)(52116002)(508600001)(6916009)(6496006)(8676002)(1076003)(558084003)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZQyishEZqQ7pDjgG/gZqGo8n6MOUoRUH257WvxZoK9IgOH0vXQzL4BlFH+W?=
 =?us-ascii?Q?9G5l5+/3atYJOYMFYCR0zOfZ2MD3hFG3h/xiwvUomyuML2wxAisu/od9iNZ4?=
 =?us-ascii?Q?vKh0EGhR+28VX3lqvb2ilw861VndW3mcjQewxCIjY4k709nI15E4VBmpCrmT?=
 =?us-ascii?Q?pgt9cq5rA+nNNbz3pAQt8AozNKSUuPe6Y9D9/JNiomKqdDh5iwcuv/E1QbVQ?=
 =?us-ascii?Q?Kw4VQh65k2POHQbsYfMqcj3Cc6RIhdvf/Xd9MI+m4c1LU6t2Tzq/3nQp469K?=
 =?us-ascii?Q?ly1mGK5ORrnT5rA2FlDSGn9vB2edz5n1k73ig4MI23n+aIAz9vjVMagS507M?=
 =?us-ascii?Q?VH030sqiJu+gJNRQ9LlpRZuxsHBuTtVyhLrl0L8B9Tapsmq4M/B+fJA81dM0?=
 =?us-ascii?Q?xuu+B0T//63+q7KbmViyHEda5wZoswzph5XML8NmBf/hwaF6eiQiXNgChIPN?=
 =?us-ascii?Q?Exxt9v4QTxT8oZ4Pr8xUOAlAnbbVuniowvG8rWbg8an4BvOncdjAlYu2yG0L?=
 =?us-ascii?Q?dkPMdm8n/HuAaNWtFc6lau5b0eUbPAePZcPcbAhVuo6uKUeXul/2ktV091Xa?=
 =?us-ascii?Q?v1fjCr5hI0dEd/0Veyvs8giS4O2N27wH4ZgsO/C3g0BxT7G0doB6vEYf4Fvq?=
 =?us-ascii?Q?49t2qxXlA2ynvgtILWQZxVAZzYKyYHTYzGH1G9nmd7oL4/2QNpkygc1ffYbU?=
 =?us-ascii?Q?Ii+7xsnbn8ChcTFpzktNw9viaNCZSEn/pWeClL5AzZedB4haEkHh31lYhgWM?=
 =?us-ascii?Q?Hn2ovQQR2DkEtLT57G8NqVmlKpCS1Mm1wHTNWGThv1A623E9vziIc7SJb2GX?=
 =?us-ascii?Q?oN8WlvIjqha/zW6cwDXcfvb/iNDAPcL4xOu12kfpQPiJxKoWcKmUi+Ma5TCO?=
 =?us-ascii?Q?hAd6ACHBybu40UE0k8GwvQqZNYQLMNs4osOv3GjFKMHxNXH5h0KerZpUeLl3?=
 =?us-ascii?Q?tIO/O9tEQq1z+Vss7Nqr4uVIQ4CyGLanSIKziAHn8z1eJTb/vVzxrnNXEeoQ?=
 =?us-ascii?Q?UmRhqFyMEwDwHDUT2iK+6Nzn+ss5PNxS6vKnuwtjB3MAnNcJIlLnNE7Gk3P4?=
 =?us-ascii?Q?sH42HOCY7/g/XGt2Lg4VW+B/XJSBLs4DgFoTPWIusITAZ4yObT0xCU+LoCqo?=
 =?us-ascii?Q?wu+jNzXUKcrr8MKtNChRzB5C7GoAat4Mvuzmjkvo7Q66cy4loYCuCuCQMnUx?=
 =?us-ascii?Q?161upgVNgFt+9kRPKMOp9nVMXKikq34z5lDlvFi+rl+7ZT+3OBjMas1cUy4a?=
 =?us-ascii?Q?oHxT7mGCWUGhAVR6x5P3WGfkY5b2nxpAFAxa5LuA+cplC/c8Gxt8ytAwBHKZ?=
 =?us-ascii?Q?B0EoUBFs85Hyruw9zWJHiAl5oCM07Yn3kzM2u2o8Ee4XVJdQ+SAO5CbkZnaw?=
 =?us-ascii?Q?ZFwLmbxvi6dln0IexKmiDPqZgOOUW617X80Glvl2nmXUtmGH3NBMygU6YKMQ?=
 =?us-ascii?Q?3pnNsAoZ2msSum450CGqf37uAwS+P5kcI69fUzZ1zZu/jWYPrSxOOgxWAGUh?=
 =?us-ascii?Q?NSgNQ3ia8/cnNgfGmMhnWdrkaaPhc61Jof6C8LKgu21c6njBMU4wkrCEk6EL?=
 =?us-ascii?Q?ITSaJShTI7e4AgVBoP9myf2B0St+XDmcDrpSHCmU/lMzDhgc//wI5qISd+8v?=
 =?us-ascii?Q?zcHaU9fc0pYe58+fQB9c4Rsr5VZUUzjuB0BAIgtXeFA86YGiSQt7YuBrw0rt?=
 =?us-ascii?Q?m4mHlzE7j0qqgD6EYUNCCsqeU2Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc81a81-158a-4355-389c-08d9aa6085a5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:56:18.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlShUxM4KQViGxQDPXIEUXdJHiN6tck5akU1kJRM58bkfk7vhrvMMmYc66Ln5hYSOu+4P46N2n3DKPELweUJTzGLV7ItmByDlKko8MCh3Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5666
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180039
X-Proofpoint-ORIG-GUID: B8nq0_8J3B2RwXQ4vaWazEFa0ghEOy9c
X-Proofpoint-GUID: B8nq0_8J3B2RwXQ4vaWazEFa0ghEOy9c
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, Joe.

I'll create a Documentation/dev-tools/smatch.rst file.

regards,
dan carpenter

