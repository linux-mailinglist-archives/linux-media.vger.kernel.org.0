Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DBF442ED8
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 14:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhKBNLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 09:11:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8138 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229530AbhKBNLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 09:11:46 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BePNG026628;
        Tue, 2 Nov 2021 13:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=SD8N3/BiRliqAnQfPqjQYRn1tt1eZYau8CfGSSnBMkc=;
 b=FSUs/McEVkVjmk+mpr64yT/W9XVMVEQzt5XY+eUtgx5UdkLZxUOhRH7+gsujPnz42mpc
 X/vOHlte4zkIuC2Rwo0fGHH2BhV1HroWwv23o9ygRUaRLGaKnfK5WjWn+4/QIRQveWTH
 ghI6c/eyQtpcAkiSjEwG51AOQNc9gWrwtTF0l329Dbt2+N+faM+BLGWPuajqbNnLyQoi
 rqP97xhvJSyWHFcpYHKwG882ryxq+obWv1nJMwH1h9U1gqnu0Os9I9jqDWnf8SlZqqhU
 JbvfIn6v4ivWfvspuGzj44XeR7x7RRjZUAlj7+zgJG8YG9aDyCV6O0yFI3Lgc2rEtWrM Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c26e8ffq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 13:03:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2D1rTG101688;
        Tue, 2 Nov 2021 13:03:16 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
        by aserp3020.oracle.com with ESMTP id 3c0wv49c31-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 13:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IraaqJ+8+MooKZa14QxMs5k6cf5fT/kXWl0naXSrwkNpc3R6x06Z5xexVcJtkhiQ0fRg2I1jWVQtVSw/YicmzLvwupgYHSrFvDU2kp5ds1aBWSEG7WF83Q1MypFAcbN+j+QZeTpheo1m9tsb0F0VSlCvegSF1gNZ9e5nq7xlnkkfkL+wJLXeXIKTpNub71gnzYjcCio9E5S9ysqe3f6uKrIHz1Mcce724y46UTbuotZJYKbG7o2ZnU1FwRQSHGg/iJ8BrdJUZ9zWpK/EtFJ2XuuBBe4ne9JjBg3kB5BmK1HF9jscNrzkUEKINq4SZKxyImW69Lo9TjWEGBnBV7D+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD8N3/BiRliqAnQfPqjQYRn1tt1eZYau8CfGSSnBMkc=;
 b=TVhOPE/wqjrPV3nBfsB7DoXEQwKKX441R3eP/5BpPi4+LNG+PbkDQDCnV/qwcOGj6WhB4QosS8tx8NN48y41De859rh2UxufBZXqspIZpmpni0gCnz9lD7YzLk/Anl/G2PJQ7c1xv9VZUFWGaNzC7sSk34ruMcx2EHG+lQiH9XA2fVrpDm0wG2RyoEvuhCfAgu6EnQKbSTBcdtHxHnFb/+7SztkEZPT3ED/TjnAkeogRWKkI6f7b6IwVSXnkUntoJEfifiicw29zu66iYgnGqBJnyjSfpr4NRSo5RxSCbVG4fs0E8gO0H6dB3yJj5iBTSDamU92PF5H3St3ZS4KRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD8N3/BiRliqAnQfPqjQYRn1tt1eZYau8CfGSSnBMkc=;
 b=DzJbFrUPBmE9w7oXNr1EXTHXNm+d9r6v/CVzRWPHbTjD1/JOsXu67u89ufUKKiQFwwop6ACWSFT3BfNXy5DGSWIfdU+LwZA1rX37jwyc5kt105GY9JfVbmmgt1TVGFOccOGwjfemOzAcIQAwRX+wSN+qkorvIfM3Fy/njGBHTD0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4483.namprd10.prod.outlook.com
 (2603:10b6:303:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 13:03:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 13:03:14 +0000
Date:   Tue, 2 Nov 2021 16:02:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
Message-ID: <20211102130245.GE2794@kadam>
References: <20211017162337.44860-1-kitakar@gmail.com>
 <20211017162337.44860-4-kitakar@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017162337.44860-4-kitakar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 13:02:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d2db972-7f0b-4cba-866f-08d99e012103
X-MS-TrafficTypeDiagnostic: CO1PR10MB4483:
X-Microsoft-Antispam-PRVS: <CO1PR10MB448324EAFF4C1F170974981F8E8B9@CO1PR10MB4483.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EliQmXo5hq3yylb3Ra2mzzd/eFkvduPc8DHgx2+2QL5+//ckXvHjeLzstygA+hAo+hfwhtwZc6PDFlrCbAoF9dntVAFUXCYljPPb6Rb2bPVNeqKGSwWx/5S8G0+Neyr1uisKKzx/D676tGhuXvWJvxQ24+mB3wMPD4uR1RyRHoiMQS0GZ1neX2rqU3BJdykidyowlElFi5J2PyvzyG2gq9h/HLDYpwrYl9+0MSup0nWuWPvcmTSZ6xqjslS93BaFxND39w2fv2wimDuyTC6a7nQcUvh8CiCyo3amUezaBJ8rs9wWmvg6iVG7PNHuWZOhWFlEsyZcV+hkaejK5Pz3sDT9RJ27FrErF5CLFRK1z7MoucFWAWptDiZO3Utra1E6D5juVqbN5yGZ9AczmBFFCKrthtNiyADdzt9Z67epaEAYXtCN5t0N9gpxAa3qIqa3tHwFUa0yiKi1b8iNCmo2h/feZkEfsn8In6lChoejkbdZkG3JTAPozNaWw0596Y3q4QM95zx/WR9lpPerIWPmXHKe+7rcPi1F29s34rUuRKeDNSfaR492kFUqEDhuiQBUCyiptnxA1ZXYZN0hfXm0e1EySrJcuMg4Nz3gxQyCL3VZs1WAr42NIwk7wDF+aIpF9Gwr+JxUQtS1UT4eDXc2vq/wzyG20disQ/X90PQX5POuyX0NHpC2wFfjRGGb3RlP68EKt7bw8V9PHUGIq0zxOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(508600001)(26005)(4744005)(5660300002)(54906003)(186003)(38350700002)(8676002)(86362001)(6666004)(316002)(9686003)(1076003)(55016002)(52116002)(6496006)(38100700002)(7416002)(33656002)(33716001)(6916009)(4326008)(2906002)(8936002)(44832011)(66476007)(66946007)(9576002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSL1ijuBBpb49wcLS/tVKJx39T1lH0GcsM+J6KEEuEcEqhez1Sb8CsUXJ/+a?=
 =?us-ascii?Q?TdohClmrGceEXVMuI+PVJOeENCv3YBxepTCXNXxdJ6ZF8N6m09DWGy2+Ja8g?=
 =?us-ascii?Q?CX+NMg2uw19nnYANoUcBAY4XZvB1jF2aUT65bae1SxTmVduLqopvODIcAJnV?=
 =?us-ascii?Q?WR//U3oVv/1Oa4Wd3qCKSn+2/MuQ1r7jT7nYQ2rF9g/+j8OV0BLxijsDqW3L?=
 =?us-ascii?Q?w+VR5FQvFaTAkYl4WsOQQQxrxgFv894CO3cz8tUtLdVWBIfErBpedku4lbX0?=
 =?us-ascii?Q?eXhwM9+uUlFzAnNBOMPETqnf+Mru0gxRj1ywISMnxKIQ+Zqcd9KmABDOk44x?=
 =?us-ascii?Q?naK5GRUB2uXYMzq1T0Zu/0eKXi+8u42mOFFX1ehLdmMelfWfp+Eyb8thsHGc?=
 =?us-ascii?Q?ff72KRtCmk/eEIPv0MfiHHTbVcIvEN1gklPmTrd/USCvqauyETIboDFqy/lQ?=
 =?us-ascii?Q?y6tS2cnSNur28cOBdmt97N35f+XiqV59tSEaH9+okotTh1wfSq7uYQ6mHt7a?=
 =?us-ascii?Q?DuwMyXV/nI1R+aZtxBc6wLwrbPN2DNWsYUEaVm1/TAbWwOMeE+FPUk9q41Oa?=
 =?us-ascii?Q?zqRxUPHkasp3hY/YnkbfFziFhRQ8kps44HSrBcSuuRCq951g0Nnvj7yiv2d0?=
 =?us-ascii?Q?AMczPL/BGLG8gP4mkZGptxj3v611H6tLNuYZBtngbulkEU2X2Yjn7DBOQSEt?=
 =?us-ascii?Q?W1AUx1XRGYrC5NFZk/bUYe2iqmd2bP/kgexd0xKfcEPL/qxrw8cV3G9UZNac?=
 =?us-ascii?Q?9l+DaMjppDsMQfel2RbRfdj9PNHEXAKkxxOvJmGANFSKPjjAWPd/U+ziNr8i?=
 =?us-ascii?Q?a1fAjCxpqRpKpUJPWjRFRWvKBxNm7FSIlE3RPk/UUq1+TGeV3spiLIHawDNg?=
 =?us-ascii?Q?nNzkDiolJZa2VK11SL6wQk6wygGxhLVLq0prANU987tmb+Vx55EOvcbUQFr2?=
 =?us-ascii?Q?nb5H7NFqjsaEvu//8ts5koIcyz4q1aNcFqclz+E5DHJb9XLS2kAbPJ3k14LR?=
 =?us-ascii?Q?XIGxx/baOaGvtGuIPX1nO6UznQNtra14ITrymRefYQ+iUIdD9pP69reTaaoQ?=
 =?us-ascii?Q?8pVUhv/8/Y6rF6q4iuojSdwDN23kGZ/rjr5q0nfny8uVg9cvN5UZpLHq4naC?=
 =?us-ascii?Q?iL51aLZPgu2HIKV9EYciiZDCCtrQrIe1YlRcf5+CWnGIt3elgzKh1FSu48z8?=
 =?us-ascii?Q?3PQvq4eMxRwlu45xtg1uirL721AGcBpZccCN2qDVU/LgUZ8KICDUvUjC60Ww?=
 =?us-ascii?Q?ihFaf30xLJcmsith3MC3ZQtilgkSxuQ8a2es1LazHTwavns6IHtMBB53L/md?=
 =?us-ascii?Q?loT6NGpKpDcF34xHf7D1+2bR61ylrw6n41he1D1kCOKpUvcCY16Cd5pUnI5T?=
 =?us-ascii?Q?4QY98EvuBpTcWfuigsOUK5BohDUHKVMQYwjTSB5ZF1dAayppu1Rn0D/UJF0G?=
 =?us-ascii?Q?MQSXXtPRsf+Gf1ymKgfolnpPiiucRUNJeEDlowz/OjavmBGeGsR2HWiU/u5r?=
 =?us-ascii?Q?TsmwoEsEd3141KTlrSCAnnXiWRJwvile0jGu1dQpySQViEKk+iR2bRBsdxKW?=
 =?us-ascii?Q?/6WrtwcgMqreiD9NIBS2XWYDVc+wcqoNDbNA3pUBHQBS9X187aPuiXhlCfy7?=
 =?us-ascii?Q?xe0xf17c3NmHxp1gNQI0iq+WtlqKxeWHR5vIAsvajUzGDeAioKIqM9AN6Qwa?=
 =?us-ascii?Q?0JWPVA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2db972-7f0b-4cba-866f-08d99e012103
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 13:03:13.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBVP/VAEYQRNTGeulykJQa/62sqq3Px3C2/Dk7w8nCpC16rUQsS5Ar3rXg/+AVFf8Z5oRuk2LTuqyZyNfFEeHWHJLqd6Cc6wiKtq4tPX24k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020077
X-Proofpoint-GUID: U_xmSRo0ksHAjpTok80QPhLRrKpyHLU_
X-Proofpoint-ORIG-GUID: U_xmSRo0ksHAjpTok80QPhLRrKpyHLU_
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 366161cff560..7206d29ba263 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1715,6 +1715,12 @@ void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
>  {
>  	unsigned long next;
>  
> +	if(!pipe->asd) {

Run your patches through scripts/checkpatch.pl.

> +		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
> +			__func__, pipe->vdev.name);
> +		return;
> +	}

regards,
dan carpenter

