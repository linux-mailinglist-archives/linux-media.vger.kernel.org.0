Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB93E0146
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 14:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237522AbhHDMis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 08:38:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20444 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236625AbhHDMir (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 08:38:47 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 174Cc4Wl024808;
        Wed, 4 Aug 2021 12:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=IQ6L70hoxk8WgO2WoZLTAtdXHcNgtQN2AouEji/l9RA=;
 b=mhdgFl2hX9ATBfQdwBZ2MSebq1TRmRRjWhtqiX59xjAIJtOjFHHbW7EeNE6/VLO78tme
 DlQGFceoII0dqfRBNcWgLhRpjerXf7KpyX5bK5zxTWeOe+pMNmRUK0wnKDvlqAOesIYk
 zPENn/Tczl/lrXSsvSxwHPb+knd6ll9rQJYW9NkQZH7lrPUyHZ0F15PI2OuSpFDn93c4
 rI9ucolUcn/9p/GsDyBu4t0mYvcJ+sKvJfTLDjp5wfHHsU4AdTr1P1ALFOslGidrd1yN
 HH6p7uCrXZn98s6un6GO4H4Rk7NF8dp7ZbwqfJNkdJGbOR6eYnoNKlqufjDMRSY9RGH+ 7g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=IQ6L70hoxk8WgO2WoZLTAtdXHcNgtQN2AouEji/l9RA=;
 b=NCh4z4RxP2COzUEJixxuvRjDef6qcRJD36w/deuVamuNiILcjnEGd8m5e/JyGDfBCb1z
 7w7P4+zRMYcTfixrWtrzeHnyoPul2Fcy0UfeU1qzzgvl3ilRDi0gBHD8MqsEwlvNWjfi
 fdsBIQxUxLhTsHpOOr3HkrlBvtF5YcrbncJN7AzwFkZMEpfeiwMF8uJID1DJfGpDYOIW
 bMTH+n9C4CoYfiYfLr9UgjNaJf5YRv5KrpEGFHi1kufR/viU5TdFXarxn2tiX4vAWYP7
 f3TTQGzXp33JWS1e2RQYZWrYrsel1l0YWuUIVukstcfVvluYcJeo7GW5PhkdggaHRQRA JQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a70pjupvy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Aug 2021 12:38:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174CZW1p005443;
        Wed, 4 Aug 2021 12:38:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by userp3030.oracle.com with ESMTP id 3a4un1mvu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Aug 2021 12:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2rXKJqZ8AxhpdBqyok1Bndir+wNzME1zbsavbNmYSc9Yodt+7OAd+p1PnDeve9L83RckkKjFADt13GCAaJwqn5zrJax+nSeYch/83JKQlpvw5jJ5xGbPrMAsVANZ+CrfxoNF0/ku55BRd+VMV4lBGTIUx72KgZqWTZsV7f5q8VtTLlFyZBN/HMReM4kbziI5phfZkmhDy6oL5xMwIHn6Cy2fmtTly4qnuTM2FZhcCfxrKTUSLZtxKLA4zjwd8edBOGLLOgXgAQzRIUdx1t1j7r9Hrf721VX51ypj04LEx3NP+GRYmEWu0bI+2nbeMo4CwWrbED39L06yvivtTWKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ6L70hoxk8WgO2WoZLTAtdXHcNgtQN2AouEji/l9RA=;
 b=Lu9Pz8wt1pwDM9VjCzesj4deKZfJtLpYs5kDtv8kppvoamoiCJcW05gTBQD9NbR/KMFQJmd4UN5dk21ErRbvUieCOf1NXxgsI2OBJhnNJpf8UbEJ3Yar41FHS5vlfrJkc+opnLJJBZlvtOviXyZGbDqYz0aDtSyPRsIhYnCM/Q/PiWZzhUZ8EhKNqXCOHbbJqj0YTz7JmER2O3jRcUcE86ColQYCKubJ+95KUDWq3hj1F5LR2tSdzfhQG6z1RXfOHcQLEQ0AoK+TieKB52Mq8pigRo5skq8Pczef0p5CDWbMRfDwMEV6C0OLTcQJHUIVpqpLN5jpgwzbjpEfeKEtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ6L70hoxk8WgO2WoZLTAtdXHcNgtQN2AouEji/l9RA=;
 b=h/WsL+EE7gnMIS+yviPK668g0QLhbvjJ7BP5t84svh9aye7rmfy9Xy/qWuGJpgMiRcPa4vr81kraCBjjKdAB9v/3OFouh1iNGOFebN/rGwh7yKy6h69KvU9S4Dczc1SKs7pcugjKF3qBF8VHmkMs4jmNEI8Iar/ZFg1RQDnoNas=
Authentication-Results: embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1726.namprd10.prod.outlook.com
 (2603:10b6:301:a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 12:38:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 12:38:09 +0000
Date:   Wed, 4 Aug 2021 15:37:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
Message-ID: <20210804123742.GH1931@kadam>
References: <cover.1627646101.git.gustavoars@kernel.org>
 <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
 <20210802060546.GL3@paasikivi.fi.intel.com>
 <3c9ac43d-09ca-e5d5-83a8-7b6d23928763@embeddedor.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c9ac43d-09ca-e5d5-83a8-7b6d23928763@embeddedor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 4 Aug 2021 12:38:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00102095-5640-40ec-2acd-08d95744b74e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17265F220FDC10399726371C8EF19@MWHPR10MB1726.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+R3fVpwAAv7Y7NaQAQSYRLC+z1jnvdXbc7LzLzYg4tsLX8OdBf8Oa2wfSSWwN0OYWdivXi9B21kw3VAKItAjpEljRmkXJPteq6h8rp1hZCAkH5JmwNbEHJEwxSoTJOvVPrIv0RGVpCSpP9xFlESLFsGa2iv7L4gU7XPAwwJqZZHzMMFvM002X1LvM2U940EACz8qdA58C2gJGrUtNra4eUKDjBxjKftiTSo+TYL9vbgrrZCm1WXPfRzOmcukVtvqJQuL9JxU001KQs5SLMHD9yYbvAjlug7qJ5SZJ9GTnpzmVB3vKqQv96ODuTJm7Z2bgauGtlzATccx1JNpWpNxCmatgQqBJQac8OQrYRiVLCYdACLa1uDPBsdE4Pm+/kDD0BmidOGAyppoKSXhesn+/2JTK6oRpL0MRG8HQx7tr/GrXQUmhxdaNGcOcrCIiVUgU6a4/ND3n76WttCbjw1UFU+s3uDratksj0APplqpGXc2HbsQYM4Zb+cFhcn24U8u/B8Xfd4AsZ7+XqbkTrseW/oS6WbLM0EeJSWDDjJ6kwd87OdmNr6fi4PshznzfDx7d0G2ovYD9OE0bZgKodCsc5J4QsjHzhohq5+EncXT3He9rBhMGciMLTS3mdVgS+bPb8dwCQmCuyttI0nDaBffCvbZNfeIGSmAZ0Efj49vERg8rg0gCQPWMrIn21IjorEfI243GyReZGwJXDqd0ZIRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(396003)(39860400002)(38350700002)(38100700002)(5660300002)(33656002)(8676002)(6496006)(6666004)(9686003)(478600001)(186003)(2906002)(1076003)(956004)(55016002)(52116002)(8936002)(316002)(44832011)(7416002)(4326008)(86362001)(83380400001)(26005)(6916009)(66946007)(54906003)(66476007)(66556008)(33716001)(9576002)(558084003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dZbxp3Dy9FwHCJ1g0YpTszHAaHnfkXD2sbHEUxIVqyersVslLeSi0LOTtzrP?=
 =?us-ascii?Q?94knG+Yq10Y4cb8yNVDACb0nQgODCgjz35lBUVqIqy4nR++RLr2Vq3LF9+oK?=
 =?us-ascii?Q?l+j8ESE86Ilvz8eIEDlsMpOiucwhtVASrBcYPEIcumVjmWDs/RS+X31JusFy?=
 =?us-ascii?Q?Z8r9p1tqm7Jz9MjlVt1PsJM3yyAN5XhbyVr6gQ6q3Ci4VgcC6Jo2mJyYeNSx?=
 =?us-ascii?Q?qIMdUPyGOF362k5HAa+vlqgrwu0d+csDEbj1KjKMnQ3oBPvZBwMxvzGr3fGm?=
 =?us-ascii?Q?ESiUV6MGGhnwE5X9iRs4hyHUH8o2e/Ua1ymwsla1aZbR1sWi85smdHEt/Uw4?=
 =?us-ascii?Q?wXwD7UQ3v/ArvQW3FDLLMujWymYx2WcSuTY0sOd6wo9C4mkjHLsyg6MWWml0?=
 =?us-ascii?Q?CpdtQ8A7lEwfnE0ulWRNUEBvW4Xxc+81faGz7Z15s0ffsdWkaTuupZChoidj?=
 =?us-ascii?Q?8InkSulVxLux8E7AF0CHcAUQAw72eHXZ//Mn9GMUlphhyGbqrpzhWNaMVS4Y?=
 =?us-ascii?Q?sj0fogZlsB9PkYvGVw1t0WSsumZZdwjWjobP2nEl4zlM2Au56A0SWhAz+tsC?=
 =?us-ascii?Q?38GwJ08p/xtSBaH0Q5FZU1faSIaWbBPdni16YfR47zSn5ckMAbt0IuBTbN5i?=
 =?us-ascii?Q?GYuwR3cPJBGz8NIhoN6mRqLhMqkxaOQlcJLfQb4EGo8lh4cTNC+1jfob5yRk?=
 =?us-ascii?Q?neh8BQyTBRPG8sS5nAzFsmZlkssvieXtyuBX1h2yAmftGI5ujQ69taYmMoVN?=
 =?us-ascii?Q?P7lXXQYwsb1dysu+5oqxt8IkA5f8W6K8hsKk4p735Z/YWa2c9dUBTvcQqlPT?=
 =?us-ascii?Q?42dWbbSdeTJpYaNX5pLG1xRRoI1ZXCWEEIsifaYS0KxJoy8gwuli63RxFduV?=
 =?us-ascii?Q?70gnFAVqEAQu4Nq9xC83kX6pvL0G01LrZf89uRzwUbFKrWZWhCRxQeT9e6cm?=
 =?us-ascii?Q?LPbOlIedBfgfwQ2j3jRaNYWd1HJFoy/0K5NP1SquQc+cQ3bSuECEGZC9Tz6W?=
 =?us-ascii?Q?s/lDCGsplY2sq4xf8FziAzYKLTJGNURv5Xk9T60YO/uJ9MrQzMHluWRyVYz4?=
 =?us-ascii?Q?kjn/iN+6KW8mD6Q8B5NTCD1nD5oQTrb31Ij9YJVSz6kDuD+n8jCpO0OOgDzV?=
 =?us-ascii?Q?e7pNpLlVY6cK5QYANqHWempV2Z6jbatGlOFjihdqPj20nkPtTM5Ew6+GLvqo?=
 =?us-ascii?Q?ylZmvNgSbo5ZF4e/wYBF4vLKnqGMOrqMVDRKDKUeBsZcZLumxiZ8QjgQtTEb?=
 =?us-ascii?Q?yrKoEomC9ZIQHym965Xd4bEFxAkUA6Da5B1L+lhZ9zN7ht3huaT8U4X2Adhn?=
 =?us-ascii?Q?7djzoG2BRTF/onMq7nrbk+AA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00102095-5640-40ec-2acd-08d95744b74e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 12:38:09.6220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi+C7ZGzu8Juljg9BF6bBpcDdwilPmpYwnkx3zaVIGSwKOMI26cslSolZ+0t75CNm253hHjLgr9C6ZghnWgGTxOIveNQ6MeDBdUrEWxnGT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1726
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10065 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040066
X-Proofpoint-GUID: edBI30t-TfDPxAOpLj8NcA4t9z1TjtJ5
X-Proofpoint-ORIG-GUID: edBI30t-TfDPxAOpLj8NcA4t9z1TjtJ5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I missed that you change < sizeof() to <= sizeof()...  Sakari is right
that it should be < sizeof().  <= doesn't work at all ever.  If you
wanted a higher limit then the next limit woule be:

	if (css->fw->size < struct_size(css->fwp, binary_header, 1))

regards,
dan carpenter

