Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE9B408737
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238055AbhIMImv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:42:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36782 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238026AbhIMImu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:42:50 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D6hvRe028508;
        Mon, 13 Sep 2021 08:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=xWkzeFSvG/daFjc4vDYeGOftdOuuc9DPDfYbysCCRRs=;
 b=TbQiJW/CPz3JA8Xv2aPk4ryzhZwgosB9EaJhVb6l54zutZZoe+heT+7d4gR+Cj5dWvcZ
 ABLzaZQbOLb0mASOX1k9M5KFfMKMN10jScL/8FO1c74eIe7WtP10KlYGgQGT6jZ42405
 3LDSvS9B3oL9UZfg+P4FlRXeICpXX/rmvoZiW88FQS5ziFXZmOssIg83tO06n5xZGswa
 SdbeDrKPsRR7Dl311JRrumaqJA+Nm1ocRKo7SsCBOKTvH8w3nCNoPi4eZOpM/faBRV3m
 x1Re0Hrui6ObCCQ2a/Ltw1JXmnMaIUi+GMDWYY57mbW5KcHuz852Pgb069vJdiapHWzn Ng== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2020-01-29;
 bh=xWkzeFSvG/daFjc4vDYeGOftdOuuc9DPDfYbysCCRRs=;
 b=EIJ/QVuob4I3Xe7RaUX5rr0Q3pQuyEJ5yR6XHlkJHM473YKLNeaDKjlpzDQcQErAmjhf
 nGr0UiJ8nOZVg9jwbPCjuUHAsoOvvYAddsyr6VtiJW95XivOSQlPRYUAeju1cD2CHTw7
 DMOjWk1jN0eeyNe4WAE8R2qaUjk3ng1uWiFL2xlxdlfmseMg80c55c0qtPRfVWHvmaj8
 Qa6642kZ085aht7Zw1cw4AGXPrnDZ6eUqVB49apXUdEeWXLWotHPYkRZpgYy/5xzAkpl
 tqbjyQPo/f3jE+f+M0/BhGMLBSD+hx2bkQUxgnf3QDAIpyfmi7MJ1v1b9MVguDIVGVN5 wA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b1ka91qcm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Sep 2021 08:41:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18D8fJYI072656;
        Mon, 13 Sep 2021 08:41:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by userp3020.oracle.com with ESMTP id 3b167q4xqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Sep 2021 08:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDe8vq6X0B/VrDyNFLo03fROkgmdqz7b5uVtLBPgT0wxmEpO+9KvjSnXU08JB6z37rwK7Fb4xhzloHcqVgpZsKkPeT51/8uEa1cboqMCHxu3xpFFYA3eDDd1w3QdK2WFDV0NyjjVT4kykdbwf9Qm1xwY6mDqF2YOA/pg2qRAQM8c2MhLpL8lLhhJzxYiHW3GZ8G00JLC8UP6fQH1ZCKUaUNmCgUGSpZyKXTo7+VM/YGbpeC6CBgwdPDgHgmHjjmrgTA8Prh+BktxjMeFEaSXMlYucbLqOoxVV9GwaDzK5RZujnBecqikNHiagiCYjPH7n0CygE5qVlIInkkGjs3yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xWkzeFSvG/daFjc4vDYeGOftdOuuc9DPDfYbysCCRRs=;
 b=WNjLBZCkq35tiM6q+VLgknGKc7zmdFbD4C+MvhgI/hkVI239CppdFnA6m+K2is84qbXxfcqsbE+256ZmKFqItpA6X6z0W8Zm3Orkj9qTwQUjMaZcUkmJSnwzv94KVgtcGoC75YR6XMCTY29F2EstpohQ4b1sA/pJB93T3m2ihF5Y9Jnva6zo4omUrmfQKUbIQvbZQmMVFiefvL/Wq8yu7y0LJA/1kn1sKYl1AKj5k44YqUZXEQDiobxahQ1oTgdh46JiBWT02SKDrDBmNnHLVLMgkW0ugHujJGbs7vfhyQClit2KoLfYIB7QQ7XzzPvRypiFZXSQoauMgn6BAUnE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWkzeFSvG/daFjc4vDYeGOftdOuuc9DPDfYbysCCRRs=;
 b=El4vxRFmrmNGYSUdVIvfhPPI+vDNaLo01NDJAmMxvL8Nva65mE49+UcWUMbIP+iKnl3p11kwmtBWlT9oSCNyRkqGrr1r2QmcPWCTN/wP5n8Kyrb/+Jp+YrBIvcEm+OhXpaEvIbqwCPJ7Hd6w+pZDy8tE3E3mboZX79HrKYD6hfs=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1951.namprd10.prod.outlook.com
 (2603:10b6:300:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 08:41:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 08:41:21 +0000
Date:   Mon, 13 Sep 2021 11:41:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, paskripkin@gmail.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] media: atomisp: fix control reaches end of non-void
 function error
Message-ID: <20210913084102.GF7203@kadam>
References: <20210910223700.32494-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910223700.32494-1-skhan@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17 via Frontend Transport; Mon, 13 Sep 2021 08:41:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 183d2c44-d231-4fe4-cd37-08d976924299
X-MS-TrafficTypeDiagnostic: MWHPR10MB1951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB195158D45B40B83915E7EA1A8ED99@MWHPR10MB1951.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u04Te9t8mcfKYThnaPDtGOfKZfT2O733nK4ahIgVozl4bbYytZfV589W9ZyiczVxXXb1kUiRI5WE53wjBQQUeAEZORLeVJnxGgIDqjunWFF2lBLWQwkuXfYmaPIialbAaJaeCy0a98SQ0sNMFMro56d5Rz56wHb3PO6kloHiVxAzsE0OP8ec3iSfpDCyDo3WBzPKDAwhf8CHgubfx5ctGmXPBFj7h5kIPAW19NGAQVVH+ZTDEXji1OpZ7i2NBfDXj3/kZGAiKdM3xCDcIJLpuh5qAOe1fAmlhBiwdhoi3u7lu+5w5/1NHqn508/1EnCdLvGu+YD4Jc8EUD4Kt82RnnF/+OsUFC8/SzfDqmIUAxgyaq7VHUm6UVMeYac0xSe4pMcvs99nraimt2AVvpJzdqEpgIFteu/DijC/7uvZ1THwVMiAfScPP+9bilHeEa26mAwVAJNPhd0kvMHJGLd2Ng1zzOySmKrrnwQ2pl8u4F4Mwt7GsEGcTmyFJgvukmPTZBecX4TK196Q3QIsV97oYwPQBE69WvLzlY8Sj/WbAsKqGTQEoINsXwS+2iitpj4D/DOkSO1Lrz4ozBBWrXYX/dHomLGeQEbEi6EAtrNqs39nhv3Z/RkxWeblGUACthTYxQYjAVV1Q4ovUov/48qIugw3f6wL/xMscsJKdYHqjPTWLv1/Z/icizjZxL+TZcnSX5K0Tpxd2Zv95GUZyImg6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(83380400001)(186003)(6666004)(1076003)(33716001)(2906002)(52116002)(6496006)(9576002)(33656002)(55016002)(44832011)(4326008)(86362001)(5660300002)(38100700002)(38350700002)(66556008)(956004)(66476007)(26005)(508600001)(66946007)(9686003)(8676002)(6916009)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R045U0FRd2g4dkR5MlFOZnIxbDRCR1ZjVExVWCttZWVGWEFBdysyYlRjQys4?=
 =?utf-8?B?ZUUzREE0L2I3QUdnVWpScVBSeGYxTURtRnFUQ0FYMG5Xd2tPOVBpTGlVellK?=
 =?utf-8?B?WHZoaGJzR3g3T1A0NlJVdUJTUTFXc2FGS3hzdmJOblh3cDNXR0NhMk9UUzRj?=
 =?utf-8?B?amRzVStJSEtnT3QydWJkSTVROU14NTJhaVVPRkxBcC9qYVVvKzZYQXczQWx5?=
 =?utf-8?B?TGowQTAzak83L3dHRm9hQmdKQXpic2NnYTVxcXVRZVZyU0RkU3NYZGQ3WkN6?=
 =?utf-8?B?MXM4L2hzVHpjVlF0a1RiYS83NWhPUGxzdTdUUFdvS2VYTnJ1b28yRW1Vdk5k?=
 =?utf-8?B?b0pReDVJQ3h6a1JmaGpmR0Y3SUYwQzd4SGc1c3h1NE1wcE8rVXdPQ0sySkJ6?=
 =?utf-8?B?L3dWbWdJUTk0T1h0b3dNaW5SS25lVzVHZTUwaHR3TFNkRXVTOENsTTgwNW54?=
 =?utf-8?B?M0d3R2gydHJHaXJlN1hLYkF1cDd3c292ampGOGxTSGU5ell4Z0pZRDdCTit1?=
 =?utf-8?B?ZzFRa3Jaa05qTGliMWR1dnFaWTVaZDVxc2txckw5T1k3bi9tR3RnaVowZkdk?=
 =?utf-8?B?YTVBUUcza0dQY2VxemF0ZmNucHY0a1JoS1VGVjZWclMyQk51ZmlpNzR1Nmh1?=
 =?utf-8?B?UVVJQ1Z4TW8wWTdHYURIcmRWNnNyN0t4MnNRN0JUSDRYVGpLSFFnenR2bkc5?=
 =?utf-8?B?eHRpSjFIbGhueUFDazhlMkxTamxlMk50cTQ5UERNTTlESko5KzhjUkhqM1NR?=
 =?utf-8?B?eGVia0dBZHgyQlNMbzk3dU1aUHp5Q29YMWZ0bnRIbUMzQnJHUlhsV2JDN0o1?=
 =?utf-8?B?c2Exd1lDRnlJYUxmZXdNQTN3d240MkdlNTkrZXlaakFlTUk1UWFyRDRCYTh5?=
 =?utf-8?B?SWJ0OFZaOE9ETzByNzNCRklqbTlQKzNZMklqVFZUOUZzVnhhc3lEUFdSTytS?=
 =?utf-8?B?Q0IwM3c0eVJwbmNmelkwemtKb1poOERpYmR6SFNwblJlenIxdWY0VE4venp1?=
 =?utf-8?B?Y09XOUdKMTdkbEZyczNySlNxc3ZGVittaDZWRGdZMmdDN0Y2WjJrWGp1b3ht?=
 =?utf-8?B?ck5hRXFOMmJGMWVncnplUWVyS2NLMHhpamQ0Y3lCNGxPcExOZ053aS9oQlhy?=
 =?utf-8?B?aVUyL2kxVjhyaG8rVE03a0lsTjc0R3dWSW9XWkFPVmtGU29XVmROdU5ZTzhq?=
 =?utf-8?B?T2tDNkF0UjFFOGR5WlgrelVZYTVHNmdTYUo4bVA4WTJnYnZlL2tXdGYvaEs1?=
 =?utf-8?B?SGRQcG1xd1hSUVNNTnRKdFY2aDZ1NXFicytmZG9QVVNJLytlRk12MWxHeWl4?=
 =?utf-8?B?a1dmMWxsay9sSFl4MjlDcmNvVzJSL2paK0c1ajZNMElDQ3EvRFc0cWxVU0hq?=
 =?utf-8?B?c1JyaFNRK3Q1TVEwSkVEckRTTG4wZXNPZE1CbkdUWFpCTjlvblJvQk9JTHl4?=
 =?utf-8?B?ekJKa0paSHNCbVVINEUrbkx5UGhTemVDZ0h5NnRFWkE5RXcxUEtjWm5kM0pK?=
 =?utf-8?B?OVBWM2FwSy9pMEUwZkZ2Q2ZGbjQvajVvTHliampnZHdZc2wyNkJkK05CM21Z?=
 =?utf-8?B?L0U2U2RHdklNMHpzUDgvNjYxR1NkSDJ3UGVoUzM4b1BiVGlzNk05SzliOW5I?=
 =?utf-8?B?bDBXVldtNUUxck9WSTl2b3ZTdDc3TG1adjZGdk56amtmYmFKREhwcUVyMkFZ?=
 =?utf-8?B?OFh1aEo0Z1ptN3hKUUUwRkthS0oraUQ4M05aemptL2JEWEttSlJDZmN3anht?=
 =?utf-8?Q?AMW/PkxrAtwnorxQAMx3+lyUZAA0TzaunM6mzrf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d2c44-d231-4fe4-cd37-08d976924299
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:41:21.4338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0XcftChJCZMM9c8t6HCtMdBJR1puLabYKE8jri4HUOLUw3ZL2iaeXFWCuKsJzkFaidbLG/4nEVo0GY2h/apkVWrZxguz5kWId0rYDML4Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1951
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10105 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130057
X-Proofpoint-GUID: xaQRA66o_bhY6MTWwsuwbXy4TlaJnfao
X-Proofpoint-ORIG-GUID: xaQRA66o_bhY6MTWwsuwbXy4TlaJnfao
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 10, 2021 at 04:37:00PM -0600, Shuah Khan wrote:
> Fix the following build error with -Werror=return-type enabled. Fix
> input_system_configure_channel_sensor() to return status when control
> reaches the end.
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>  1649 | }
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Hi Shuah,

You're the third person to send this patch recently but it was fixed on
Aug 2 in staging-next in commit 05344a1d2ea7 ("media: atomisp: restore
missing 'return' statement").  What tree are you working against?  It
seems like it needs to be backported somewhere.

regards,
dan carpenter

