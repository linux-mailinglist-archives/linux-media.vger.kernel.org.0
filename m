Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE47441C548
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 15:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344074AbhI2NOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 09:14:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40134 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242801AbhI2NOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 09:14:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TCUINV017401;
        Wed, 29 Sep 2021 13:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Lr+0rXU0KKO/D3xpaJU5OOUmoDV6OtOP4UioJpDSvyo=;
 b=ZSK66PaH2o5sRpV3ynHn7Ht37O55D8g/OP3qMPEksHc+cs2TnDvXczzv3qAAcbUE7vpm
 4Sji0d7mBKGdl+/SMPgdAEXa7TuIcOHjXvAk2VnBuT0kRYgBC+mSQKX9xBDln/NilGJ8
 cgbogzHALMqWr/0uepAry+n2kBA8IMzm9dyr8Gj7PXKcBooH0su0d2OUHQHNn47Y98lp
 M7fTJCPD3kBiZMw9LiJCticK+DlH7TVQJsCQhPse/S2Qu3rZy2NtbbiFqKfJi69CD5vO
 crkZXqOx1b7zHxG25tpNFxB3dPFywegv3khtFsdrDioZXHlQ1SQ/c1QsGAv0oWd+zNyU Mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bcg3hk1e6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Sep 2021 13:12:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18TDB8bK190823;
        Wed, 29 Sep 2021 13:12:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
        by aserp3030.oracle.com with ESMTP id 3bc4k985td-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Sep 2021 13:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwfCT8RAxKesF+QQLhCltEmvXrKAzA3UckEquSCPCKhl/JQwAuBGcmU1PFx/87hod189aNGo84S1EUDBrQxEwLB8OluCK99ZLH4V/64Oj9S5k4qtTP97ovmyfa1FqQFAgoRGE9c4GWMV4b+Tm02NR9O4yyfVY9gaVuyteSAP0HWThp5N2mFz2t4Bu0V27Vk+L7Wfvnw9SCVWvHdaofVg9xMAAXJixGJEsvnmMU5rQ+SN8/S9tqlIB2F/HshJgU0XbOdgnTuyTBujU+F+J9yO93wEVsYZydn2fykts4MWRg3v8R4SdQYvBbyr8WsnzTPtGIiqm3WyEx/5Z9bgd5SbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Lr+0rXU0KKO/D3xpaJU5OOUmoDV6OtOP4UioJpDSvyo=;
 b=nyyEPIwfnu2LEvuU4SSeG+KleLtNIQwjbc16fflVxiiVzarjIPlCLilp5bIWQW2WSMgEOM4exRxtLxTK860NHAK8mTTD1FM+VWRv1Fn8k9HnT0iNeNP2uuQralW0cRMetUUooo9rCM/zxFa4a3RGvKyGFNsHpO6bkbVspY0WMnsirFsYn36LSf9wtxC0DWTlpbKuYP0gW2HQxELi5pd9yRt7JhOWqucwHv3trMyMYy8b0pouRDEMWPwfa2jBN9WR8Bp2aKUyKl2xCLU5A7UCeYyDH5ytiv1KzvNCwPk3hbc7D7ICQv2vy6VCTGoqAwj5Sx0rtqrDXXVKmhbI3+7oSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr+0rXU0KKO/D3xpaJU5OOUmoDV6OtOP4UioJpDSvyo=;
 b=XF4RaeoR/juNh3zsFQ6exHlx8qimktngn/02Z5Wygz14TqsyrRsuyE6wefU9pcZ4Ys0gVmaIIjaXLlJV1eQC3ZZiQrIehcLuuWGns3wOGF/rCvzPQJpj3NM/O34qCugwtPbxvLuriM/L0GQojNPAO6TtgWERUkxpvf5gXcIEXpQ=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1422.namprd10.prod.outlook.com
 (2603:10b6:300:22::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 29 Sep
 2021 13:12:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 13:12:00 +0000
Date:   Wed, 29 Sep 2021 16:11:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Paolo Pisati <paolo.pisati@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: add missing return type (fix
 -Werror=return-type)
Message-ID: <20210929131136.GL2048@kadam>
References: <20210929122638.58623-1-paolo.pisati@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929122638.58623-1-paolo.pisati@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 13:11:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f58e2a35-ccc4-4ac3-6779-08d9834ab8e8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB14223F4403FAACF41CB881688EA99@MWHPR10MB1422.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3mPigLJgZ4SqDL+oxDOMAWUtNTgtk5rQZt8E6QTB7KfZw74IGFQ0HBHRr24Z+WaOKoYMDA73Dd+XOmnc1M4X8WP94jSHKix+K9uJ8jx3F2BZGwifu8jnySDKXBNnSTmUnMcU4qD3TmJPYOdjq4ugxzBRtNRQObw/ZSS204Ks+QIppvyTMwcZdfD0N4ndSOnJWdupLqOOHwUmcLAoruAu8cqR/UzRUCneFsIU+vNp773uXyqTkAUn1hY1kH0eQYOQu96QGFRsmQyBXvlFCMSP6shBb2NeD2gZldiP5q0jxMxPVyZopyXMZUcmaj26SK29keFvL/6mSYH0PpCO/F8HDiYkPUl2NeDOm4IS0Lf8nDNtN/PM42gLie3HyfcJS57qCGbzvRcgyY2ZwfsnPxmbf7QZ666HeM6DErSYBdpWOxuOSuv7ptbDPxFXFYhWQ0XW8AZGaHsIMvDZeq8jtIBmh7hBbC1WRJ6GudrFJO2+jDQhPnhtYtQEJvocObUxyUTvJttdMIGVi9E+AStSSAf6UquK4q/ELAe/DCbrxza8KCeT7J55FzQjqrmCMsx9hM7HRx2+OFzMLwIlOkTNSPVCrm+oRpbXTv03m7UbTWMIRQRwvwdOyRrzX3VE4+JyuUBmACXa4q1CM0mmLkZM/Zk19rWbLYAY4sx7dlyHMiMdJoB/GzB0M/ZQebgXSwljnxnQKZMSf8uflA07ZSssCN57Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016002)(54906003)(9686003)(316002)(33716001)(2906002)(6916009)(508600001)(44832011)(4326008)(33656002)(38350700002)(38100700002)(5660300002)(86362001)(26005)(6666004)(1076003)(186003)(8936002)(6496006)(8676002)(4744005)(66476007)(66556008)(52116002)(83380400001)(66946007)(956004)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fKNHBwl+l3/40MyQX37DtEygOCby8g86z1XjYFSHaknc3liVNyYzKsS1Z7Bs?=
 =?us-ascii?Q?8QpZlQ/cc+T9WyibdJbVCFm1mdKA8za1cCrIApj79NqNO0icUF1weulLAX60?=
 =?us-ascii?Q?ZtD1gUUId7p0hQl4BRchiOA6Ur6EkRAyinvO4cPfNevsIvEQ1BNZqz6PKvmJ?=
 =?us-ascii?Q?C1iq3WRVKbjDyrYEQ7LS+jPvAMfAiOEuWAQtRzmuGxji5Wmekcc1ft/yMkfT?=
 =?us-ascii?Q?Vfk2r+9VEvBW5M7VvBgXwXGLBb8lo0eCZjT7IVeSO8UckWQVPifKBVuTDydQ?=
 =?us-ascii?Q?HNtvr74uIhoqjR/BEJ+KLI6/5nE8SUK9iy+9VyHU6j7MUqcttReIXHvaq7j/?=
 =?us-ascii?Q?OV04tG+FQ2+Y6leLrit8fybAzUGRiE5+JqYwp+5JxU9WcGhjaK/awesyukuz?=
 =?us-ascii?Q?3rQEfkYpRNvuyKAeyj1j8RxDelR2MuVfjDY6xXFc2SWMWg8h8dkzb2JONG1Y?=
 =?us-ascii?Q?MfDDBfUXCjTOD8n2AR5AOTVWFQXrXMaQyx2AIajf2gLIFFpP51PKXBzFXQ0s?=
 =?us-ascii?Q?anOstM7PC6cnwy9BU5HkowyY/0YY0XQ40lcCQwBbTY38w3jjBR3Cbnn0A21N?=
 =?us-ascii?Q?KDW7ePsLQv2As7CACVmiUCJC0rC1gypFuH7meyrGvy3STaMHpOE/UHlLFKuy?=
 =?us-ascii?Q?EWY5Ywatm5RxtzwR/TQLcQSULa7gGV9HuWsTQBbdOAYb8xfPrNI1cmIRRz7H?=
 =?us-ascii?Q?lxR83hUQOcddRFUNM0pRzbZz34fRTTkts7Y/9SKbu+j1erokXmDRw+ygw+6g?=
 =?us-ascii?Q?mnqYqOSDJfy1tWaEyeWeGVwl+l9QZcTY3/bC/StLhn5Ay2C+Inf8/yaAna4A?=
 =?us-ascii?Q?TnpFgeQ9iBgzmRux6l7+wdWzj55zEDTf+OZ34T6DQjJ4pf8zm3cEaHoNRBYk?=
 =?us-ascii?Q?ES/2zzda/vSFhdvrkPRs46oyEBxfZ2BAVXGiSruYQ3WjX2IlcJI3VscpcUBC?=
 =?us-ascii?Q?46bjuEp6gACfPV5zC3oeo+jNpW2MgnpdmTW8aVHr64Db/HZO1OmcEDynWerO?=
 =?us-ascii?Q?+1CksqDaR2StcD3+C2PzaHR0Oocagihd1qPNdwmTOR//tU94NEKIhgkzJwnh?=
 =?us-ascii?Q?TYH6gpVaxCJyZ1lNUuddloSDSFnewwKnkJGthxQOw9tQEhyaFC7edDwPM3Mj?=
 =?us-ascii?Q?hhEF8xTq3JCR/WFOWyy0Qw2o54A4GbqRAhvVS8BmxLOB1CnNyPulGYql+x/i?=
 =?us-ascii?Q?fmkuKaUKXa0tqWnXYZ3tViig1JKK2lsY7/66wGrKkSLkf3GyiGdP6qZR7chb?=
 =?us-ascii?Q?lcJieRAbQeZ9h3sz8ISPLBROHTTcBM/F1iKur/ElV4tvzZXVA/hR9ijZVFsP?=
 =?us-ascii?Q?Q3YHr8pGxK6LyKbdwoN39MsP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58e2a35-ccc4-4ac3-6779-08d9834ab8e8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:12:00.6220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXZq5vGs6bzEGMV6IN3RauJbGmyOu8skssnMva1gDOY9Uj3H9g/+imI7HYQpeMvdN2/z+0FMPPmzryyLNnHPu+OFOvw7LUZhhXbxXEYPQs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1422
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10122 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290081
X-Proofpoint-GUID: pgmqmkX_20BvdlWAn532GCWZ4_qXnsqq
X-Proofpoint-ORIG-GUID: pgmqmkX_20BvdlWAn532GCWZ4_qXnsqq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 29, 2021 at 02:26:38PM +0200, Paolo Pisati wrote:
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>  1649 | }
>       | ^
> cc1: some warnings being treated as errors
> 
> Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>

This was fixed a long time ago.  Please work against an up-to-date tree.

regards,
dan carpenter

