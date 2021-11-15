Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8A745017B
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 10:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbhKOJfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 04:35:19 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6034 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237430AbhKOJdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 04:33:09 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AF9TODn027610;
        Mon, 15 Nov 2021 09:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+P560sR1HoZmhx8bTP930AlwTc5nElCNP7bbzOGoUjs=;
 b=L3jYrzAlyVBe5xj4jPVxgBYvVYqaPdTIcdDGpu80c1vOewmhIuycN6XWvPCdP/gT/fo5
 WBOutVnxiKyb4JZ7RIeVT8rbszs+j952F05D4J/qlpC1i3oWeEFCh1dmZCSvt78cdvYU
 9wPlW6s4ooN8kq3K/iNfE7IgK10pIxrBSQL4qsToEGvx+MEJEvYi1/XJPTmsLhqlpE70
 pHuCIfLXSeC3ameAxMJuiA6V+ohJ22JI+0xm9wlDrhZRGSSPH+Mw62Ow1FxSY5nodBbH
 foOED8Nq7QHBaNBHAfTJOXxdAf7JevAQgW4i0P/58KMGD9e8TvgnIHXfYNWiUg5nfLj2 9A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhtvgvwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 09:29:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AF9GMD2022976;
        Mon, 15 Nov 2021 09:29:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by aserp3030.oracle.com with ESMTP id 3ca3de49p1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Nov 2021 09:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw0G0rSOZoLtqdiU2uNESPnYVrw/QCViP/mCcfEUZwsJkfSyBgd8tr0geK0rkybZIZrQGGanjPy/B5fB4OzcqizFvgyO5i8wkwUrVNp/CKIC9e32EUuoqKRsi6ox6jcWqyOmIpBb0jN0WeJg4C+m/hefAAUp9klEBvE9fpGzSJITppMXpoyRllYF0IxbZh5uwC+AGLBuUGCFi/K6YCwAbgCy6dSN2V/IgBBKSVjzIuY7Le+LRv5D0rd+seLFLYpt9D4o6dDIBCuvAXe+LHDddda6bOt4aiIL3YoDfDYa4kQpwIaM5VByRl4vmNh8S5VO/UPlF70gEoHhZv6yVMl0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P560sR1HoZmhx8bTP930AlwTc5nElCNP7bbzOGoUjs=;
 b=DH5PfCRbOQ35tFQsCEqCPRAls/aEGqh3AAtSRDf0bmMCMryIp9BKCYgmY1NG5mLnb8XWjquSTfeBZuLZ+ovq6VHAnj1AiHtwJnTylCUfUTLkJSp0QPTCS+onQUWRg9vlCWgt+0iKTYfl6qtowUF6OF4b0ZNaKBetR0EAih3EahU6mRlAAt7nQHee2cG0ebEbdrvNfrm25u6NvSshti0X2a767vBObAUxF47fXFOyM1ADJ+At0WKUulgpFt99gjw9RaRM4ZOVr4ovN66bAuGsYm/dIx6Co+4WKLa6KLurOjCs3X5PU0LNQZddF3kBIBLAb6KpyEXNujkpyZKGKI4PMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P560sR1HoZmhx8bTP930AlwTc5nElCNP7bbzOGoUjs=;
 b=x0YN04v8HKIJIlMGFZLQdtChwnDRl6o8kp54rb33/YBmtbMTcYCqaiwVkEsSy4iq/NCIDiT/5T4GXDawdkPbQDpwC29LZzxOYpspSalTP812O+ooIypYG58zoYB9hvfzUDvOfwgRQWhenkeY/Y9gspxx5FvLsPmtOgx7VZ7srKg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1951.namprd10.prod.outlook.com
 (2603:10b6:300:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 09:29:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Mon, 15 Nov 2021
 09:29:25 +0000
Date:   Mon, 15 Nov 2021 12:28:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Beatriz Martins de Carvalho 
        <martinsdecarvalhobeatriz@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tom Rix <trix@redhat.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] media: atomisp-gc2235: drop an unused var
Message-ID: <20211115092840.GA26989@kadam>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <81245e1273f2e0e96a520b9d00cd415f65d37b48.1636672052.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81245e1273f2e0e96a520b9d00cd415f65d37b48.1636672052.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0071.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0071.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 09:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48bdd10c-e80c-4b08-9ddc-08d9a81a6985
X-MS-TrafficTypeDiagnostic: MWHPR10MB1951:
X-Microsoft-Antispam-PRVS: <MWHPR10MB195186D8819F1F8A05D53A2E8E989@MWHPR10MB1951.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cOj6Kk0u82llUW4qoFzvFMoUs1QAxtMhHDDytkZk78SlRBaWEYnbyvp19dv4wcjK+FPOM0YvOVOrcvFEQUOM0nwKKy7h9gllkvJJOgCpoy6HalGg5uijzzavIdKPzAQam9+Dpjhol8JhzlzB4pUj6fo+y4zLN6vAJI5vGkVEM3Tfso1/fjmYQhiDXUuxjHJyO7DJ7KPpEGHp4m/x5YcJ0UnCbwNmpv1kWCXyBkXEEtxIvNvfGpnfxJEXoVp671O5xJLlgMFa+lLA6S9kji/0TuBaE4TD0FNI1F/Sj6zTou1AuBJmSWxXQTMq+KJiJDdkTi4iOLo15hANMahFK6ZpGWuGfLIGyWSgvf45itnDqUoj98pvrnNTha6Dd/UxQJ2a6IPAzZmL5cAU66EfjSsEeL761BuyXrvNipJv5BV1O5e93B8wJyycEetOT0DhYrzCJu8fV2Pi5sUaizp60WkeQ6PpTToPuMnEHbGo862d34qJ30BqJ3qEgmqNjmW3PduaLfux5ajWynbuBfCePPRqIV/PLloaYFVRRvhnGCo6ZcqXRYCNcnMVNrIP21h2R2CKVB1Pm/DaSFR49aek7Ih2QwNKql1pnf6ZhgNr0mi9bPaA5kiavOgF859H/WNGn53DHUBXZ7KowDVr/EegSA2qewyPj+B3xi9I4IoeJKzqkL/4rUN/iGuS8/Cpbp4Bf8mC6OITC+CrIk1u36ezu2ATA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(9576002)(44832011)(8936002)(8676002)(956004)(4326008)(6496006)(83380400001)(33716001)(55016002)(2906002)(508600001)(52116002)(1076003)(66476007)(5660300002)(316002)(38350700002)(38100700002)(66556008)(66946007)(9686003)(7416002)(86362001)(26005)(54906003)(6666004)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z1GedebfnhvQrQrdfqvxkdcpb+e5jX2lf4DGQqu/q3EAKj2KQKTHwrKgr1Tg?=
 =?us-ascii?Q?TEumqVexmti+TtkjtjoBjzBG3BRLuymUiIHjPi0A7lWGAH+kOuWwCOyWcTmt?=
 =?us-ascii?Q?Lhv308xUE25TaLi/2qVSfhiIZRMb5DOgq+2y8SgVLcoDeLoRuNRs9pJYPslQ?=
 =?us-ascii?Q?nvY/997kXZ7n3h4G5JVecBMUuMJZe3oZSlIJ1oUxgM/mdKXpijlCO63KUOSx?=
 =?us-ascii?Q?czobEu9CI6dhAqr2WJfK8p7WAXwkmweIyXYQh4+mY/nS8q+Gc2Jpdlyy0wMJ?=
 =?us-ascii?Q?IgLzsvNpSe93EehQHIeaZRmTk1bt3IRD+FxEehkLc0JZCcw+2/NPf0ox5/q8?=
 =?us-ascii?Q?2Kd9z30CWVRhTtxzIklV071iMg/406aMp+G5umbeJeHmeIVjyEJlF8HmLQo1?=
 =?us-ascii?Q?kZu3cq6vm2T+exYTdyTLwdPrEYXo/oSwvs3GeUXdSdpx/B7MoAaUzl7TG+ue?=
 =?us-ascii?Q?oDZetSgICyv9q8uN8p3fWx3YjcmP2CTN6gZ5B2el3y3d1HiRFAymjqlh/hED?=
 =?us-ascii?Q?ii0g2PM73RxoWrj1hTUG9HByL+CgMgiBc8xnfqSvtA6fhW+FFLBbCml8pd4m?=
 =?us-ascii?Q?dnHvtCHh5ZsOVLa8s3gOrs8FjqubODnW98LJUaWOzVz3K5WXLwC3BxP9DWf4?=
 =?us-ascii?Q?cPGBE6xQoyfq/6XTnuNrst/ZFZJldtHOwguHYONGJOBCf+GuIQikBoWFD1sV?=
 =?us-ascii?Q?64cLMxqfKPVHrnajPkmf1RPxPBjUgqTdWTyKCHqnkgn1MYTCajBZTNn5fPl7?=
 =?us-ascii?Q?iwANKe+GsJ1qQY8Lo7gzvO4cS5Z0IDgpLbewkGvdVlMRbUNJ+zVQzrges4wA?=
 =?us-ascii?Q?/scKSko1dOEw+rOXLgMlNAhxtZg84tVXXNKIt67B3C9I5gsIfGJMmZXao5eL?=
 =?us-ascii?Q?4NrP/oObIXW0e0V/kEN4gnSoBFjUuIoUV3ZCLhJdso3DozRTam94qgA3ueOg?=
 =?us-ascii?Q?jOTHH9K1kV/4EUb8ncXE09IwE/XOxPHIb3s1vhBheHl2uEHYxu0ifrqgQZnc?=
 =?us-ascii?Q?B17SeqT/EW8dX+Z8bujiBvocbsrIhFd1hsdsPP+k94oIboTJTt6tN6amsQwn?=
 =?us-ascii?Q?L74feEZKgTXkccha9svzuXA5YeFO6pZ2YaJ84jAi46clb7G/Fgux16sRu/4a?=
 =?us-ascii?Q?axMgHMiy7p6LwGMDcXf5jtLr0u9iJOL3rk2wcyi3Nv7EmtDafC4Eww4UjMEM?=
 =?us-ascii?Q?halVTJghEWrpf2U5K/W+AFRQjbjgcOvg78wFGpFpZ5ySrsogUS07EmbNcHmG?=
 =?us-ascii?Q?e3LILctnamPpznNGA4N8qiOVGlwk2hPYzlGl0TJTelKRYndGfyn3+uOAMNFi?=
 =?us-ascii?Q?RdVWPG03axiqNSkXeWVOCbMgt9FzOYiAMg0U1PDgi+uHdxOvYb0zRGqEJx+Y?=
 =?us-ascii?Q?nHP/ksiamAjuldnvq0p+z+GGVsvxj0XNWlV3d36qyG2fVF6WanCS4uR4Vosk?=
 =?us-ascii?Q?nTiov8n9ynRF8W3lTW68pPp3tImAiilAcx8aBRf5cWamouHyTXKcSBv72q7X?=
 =?us-ascii?Q?XkKGvI6ggRA5JMK997i1u+LGe82oYOK/jnir1yfN3bU6s08K1CXssqPhViz+?=
 =?us-ascii?Q?s+UeIUPyL+Jn+fiHckEWFJUJTinHcMIPPeKTn2mZ/LpENFpSE9zv4JHSrDo/?=
 =?us-ascii?Q?8oqUpHqHacjtbelCv/wbHJfD8GXokgl04jRAHpdnd71FpkFo/bnzc6ouniat?=
 =?us-ascii?Q?0BVA+1W8KZ01CDmYBbY2Ph4kFHA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bdd10c-e80c-4b08-9ddc-08d9a81a6985
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:29:25.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3z8CinB8VMuzg6EnKfTGV4lZbFQqpiVzk7aYu0vZ81ZVj0q8GhhpxxjpSHiFCitvD9x3ZEYpRbYQqqT7C0dT6JhaYqPpYDmrTeCeXCVMIbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1951
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10168 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111150054
X-Proofpoint-GUID: lbxeHk2CcAb98cNrE78tZwJYn9OMPOiz
X-Proofpoint-ORIG-GUID: lbxeHk2CcAb98cNrE78tZwJYn9OMPOiz
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:08:52PM +0000, Mauro Carvalho Chehab wrote:
> Fix this clang Werror with W=1:
> 
> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:573:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret = -1;
>             ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 

Looks good.

There should be warning for "int x = -1;" followed by |= because that's
a no-op OR assignment.

I'm surprised that clang doesn't print errors about the other
implementations of power_ctrl().

drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
   448  static int power_ctrl(struct v4l2_subdev *sd, bool flag)
   449  {
   450          int ret;
   451          struct mt9m114_device *dev = to_mt9m114_sensor(sd);
   452  
   453          if (!dev || !dev->platform_data)
   454                  return -ENODEV;
   455  
   456          if (flag) {
   457                  ret = dev->platform_data->v2p8_ctrl(sd, 1);
   458                  if (ret == 0) {
   459                          ret = dev->platform_data->v1p8_ctrl(sd, 1);
   460                          if (ret)
   461                                  ret = dev->platform_data->v2p8_ctrl(sd, 0);
   462                  }
   463          } else {
   464                  ret = dev->platform_data->v2p8_ctrl(sd, 0);
   465                  ret = dev->platform_data->v1p8_ctrl(sd, 0);
                        ^^^^^^

   466          }
   467          return ret;
   468  }
   469  
   470  static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
   471  {
   472          int ret;
   473          struct mt9m114_device *dev = to_mt9m114_sensor(sd);
   474  
   475          if (!dev || !dev->platform_data)
   476                  return -ENODEV;
   477  
   478          /*
   479           * Note: current modules wire only one GPIO signal (RESET#),
   480           * but the schematic wires up two to the connector.  BIOS
   481           * versions have been unfortunately inconsistent with which
   482           * ACPI index RESET# is on, so hit both
   483           */
   484  
   485          if (flag) {
   486                  ret = dev->platform_data->gpio0_ctrl(sd, 0);
   487                  ret = dev->platform_data->gpio1_ctrl(sd, 0);
                        ^^^^^^^

   488                  msleep(60);
   489                  ret |= dev->platform_data->gpio0_ctrl(sd, 1);
   490                  ret |= dev->platform_data->gpio1_ctrl(sd, 1);
   491          } else {

regards,
dan carpenter

