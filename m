Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFCE422241
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 11:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhJEJ12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:27:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1748 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232773AbhJEJ10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 05:27:26 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1959OIWp029416
        for <linux-media@vger.kernel.org>; Tue, 5 Oct 2021 09:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=hqawtwuuhpHcbxwv9nKg8v2OIg2KRG5q913LPI6n3HY=;
 b=JqdJfzt6bmPGQuzQPpj5yMqPYO4qbkNKYeWtyyowSLEXLmxlUFVHpWdzzDEvFPe9oyaw
 p0Ia4op7hmHTFba04gUArBPHE7tQ7qMn13t2wHvGWExKAZGmVZ8y58ir0fzfBBDe1ZYR
 8NDfV2nisPnpAP1e3CDbYOfEsEN71BUbr3pLLyiJwQ2YHNTNrO67AT2o6UX01aqqs550
 7+3vUbvJ0R1Ce1N78ijgbPyQhhD8ViuOc71MTTv/RVKKuAEfMTtkN378auc03jC6SnRA
 nvvJzNj/dHGeVa9wX/aH/xeLCxSZMZ0TAhA3gKFYphKDM6hYe0dzLP3iGaJPcWAIh/tr ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bg42kp231-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 09:25:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1959Jvg9105385
        for <linux-media@vger.kernel.org>; Tue, 5 Oct 2021 09:25:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        by userp3030.oracle.com with ESMTP id 3bf0s6656e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 09:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPlrUSmQkp28aYL5sjY1/dBQoa9OQsLScuijX0B12p7E5FphDOHfmPUSZZmU/oYJrR008njer6DGWGAOFauUSPRgC2d5iIPMpdmNYuQy0uzg5I1Lc6qbUzEhKhTK1/Q7zNrrK5VkJu55nxt1Za25ZZBGCgnhaot1GWRXCteaU3L+3zm9J6i6+UYdDNJZJyzczbqjcWI2FrQ4uaSakQYG+KuMoOoj7czAniiODlhjSvO4RMqWaf5oRi+LaMra1e9YreJu3he5yXA7S9OcRlEDjRb1wq/O6n5seMkDM8csbbYQ/uoF1bkB64MKxQYpCP+++lU3ltl69K95vpzwh18c+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqawtwuuhpHcbxwv9nKg8v2OIg2KRG5q913LPI6n3HY=;
 b=chUlsq+WwT5EqofxO3CwzG5nOofPsExqkSBl/hlnwV8BYj7cgdbt/P5aG5I2CjYcymm4C+HrKAlo6M9iyvBTYj7ua5TE0Bx5g82ZtnBAcXkVTV0NY+1p3vtXX6G2HpUCFChVVcp8x/xzAl2StfWdRKExOACu3B8/mYO6v8gMtW61Wf5YJ9oo4/2T2R9s1zOzcum0xeFalB3WlkuaMu82dSpTYZ95y9Xpl/+05qb5h6s/SzDLQ9YYVPi5Dd26FdCTmArxZKgkN+Qu1BGfq0lo8W/LK8bHvSTEPEUtaKAt4aF/ojtbaRQ0UTpF7pcDufP+ZlV41i06wUbz9M/9GWOLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqawtwuuhpHcbxwv9nKg8v2OIg2KRG5q913LPI6n3HY=;
 b=ZdqMldlI4dZpV9VCYnPQTOxw2KTX/Q0M/0Ms+e0AXVm19s0FK5tu7UHhdndIBRJIoFEA/inVE4Vd0lCRXwaxDibOPubnFFo5Rk57ylvCCN5YLJf/oqrPtEw4F2xz65ogRJTYlcNg3ZACLG5x4dYx0aIE1tg4qRolsZhTvHsgIrM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 09:25:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 09:25:30 +0000
Date:   Tue, 5 Oct 2021 12:25:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-media@vger.kernel.org
Subject: [bug report] media: i2c: Copy mt9t112 soc_camera sensor driver
Message-ID: <20211005092521.GA19607@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MR1P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by MR1P264CA0132.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:51::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 09:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0749b5da-04d1-427e-7883-08d987e21349
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB18220793C7837AEED567BEF38EAF9@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJ+HCTxEd9pir/3/Wx9HLUKRrPBt3vUgTAeD+G1ikm0bGrLt8h6QsoLs2YFm/qiwI5/XFsJIKtfcOPd9PHR9YTJoy7hH3YMGrp6hXnDwtoHPNNL/Oa1upCRG3ouvfkoI+7Wb6hASpPLToUzb+/Ep+54nIqqrvpR2BYE70nfaRgugmoLth69zWeI7o8sSrxopf2xFan6anaCGgZ58pjM4ZQ7O9/Q0UD1ZN1+Z9gAOLPqAdMj52jZ4gVmjqmQOc4GDYE9HnMKURGhc2qKjzl60arWWBTbE3Xyq9urdGvH9sL30FSDP9PmzO3tg2S5H60dLybQrYgrIT4xQSBKDJI8MRJEMkj5QDuGolLmrYSLs4oSMhzZZzH6JB1UgLuuVsDOykFbHuRjvOyBpHIEDL5uF/peqO8iK3dH9qJLq4jEbacCYjq4mXHO9sEQusRukSW7gmGZGAyDFuKiBsJaFXYUGcFQVrz+RMKVoQDnnBmhd+smTG8xNdzL0f49UezvXBI9xrnVBIAFHC3h7uVtltblcvVzEveeEqDF13b4Ib/GWYuCa6iICb5xUJonlKkzjUnxYIl1tRPnXRUKIwrZMbuy5TOyRAcQCg78XjkdRXpIXHC/oREZ5kEkki/hcTMMpb0cYW1yZiX/qOdAjt1f9Lao0uirip7Z0Qtmbqb2TYSJ2EKFO2M++fYzLeVui+32fCWwiAgkb0Vxw/UNwuJ7Z0e5l6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(38350700002)(6496006)(1076003)(186003)(86362001)(83380400001)(33656002)(2906002)(66946007)(44832011)(55016002)(38100700002)(956004)(6916009)(66476007)(26005)(52116002)(6666004)(66556008)(508600001)(9576002)(9686003)(33716001)(8936002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lPkpBjGiyxarPCrAg0/DDn01fyh2Gt3g2PtlgVoGjtstGgkPlpoUaMy4yw0X?=
 =?us-ascii?Q?gK8hyxCMvsphAQoU3esk+BKsPhnvOcAeMCg31b+bUSPXiIAHAsEHlzfefdo9?=
 =?us-ascii?Q?gJdnYyTwQyW2TknTXbcinrOzM9IHkcQyGF0F0eErclrsiq6ZxWTtd2I/7n/M?=
 =?us-ascii?Q?82gE94XJiVQ8oaH5tp92EIm4m7Dg6rNfQQ9S+rdWMaeyGci+gOYDGnn5KPl6?=
 =?us-ascii?Q?fENS6NShG69QzU8UlNxL2XW29jz5y/xirDYtA11kut6cS11KSkRZVxr6W4mj?=
 =?us-ascii?Q?3SoHm8Ju39eZJs8EZxlnWnkfi3kryQJpjOEdN1PwPE0Uw7B9hCDrQMkK70D4?=
 =?us-ascii?Q?B7GaDFbKX9NE9PRxrXpzKuKMTTLQpMJNLHa8tsQxrub6RZuGOZShXWyKfHRA?=
 =?us-ascii?Q?Yj9PIL8g5iij1iMOU/n3raRhY7jHu1kQBiy0DsVDw2sQk7mDnfjZE0/dYm2M?=
 =?us-ascii?Q?71iYS7wFhJ6QeM9of16anK6qhAF8Rw7tuLa1a5rEa40kH8o94SEmZ7dL4ez+?=
 =?us-ascii?Q?Q4dTTEtWZZF3DuT60whkxpqD6cOttL6EZe3b+seDrsf+lWkwncEINYFg8OJ2?=
 =?us-ascii?Q?S0Y/np5awEu5PMk1HZB+8Qes19Z7IPHK8WDCy34L48sLjR+AAfbRZHMAvjiX?=
 =?us-ascii?Q?T/EF/f+6m6VmNB7ad4fr5BWCzA6kBcZQKZ6lNI1fmXwB/NgBgn4AiYDo73mJ?=
 =?us-ascii?Q?O9BZ5c+ZANi9zgk8fcRUVWVRiMXH39khva0rGbXpye11Vl0OhGa5Mn10qqFT?=
 =?us-ascii?Q?JNl+VXravNLAtV9/WCjVB/U7IKxwoAYYLqB9Wsx3SgtH50/cZ1d+pRmOD3Mo?=
 =?us-ascii?Q?gfNVKIWEx/2KKx3FWWJhx5rMNBm9ajug3tjnUmSuRWiTKnXvJMrFW5TB99in?=
 =?us-ascii?Q?1C/UaO4Lk2REEyOH9I+lQzNMLyPOh/ZbPHNB+WMv9D8gxppeld8ke972YONO?=
 =?us-ascii?Q?emtRPiIZRb1wpmVPwL/0KyD5m02/SaM583iDcaLtRSkMCtyUlSiyn5135ZuB?=
 =?us-ascii?Q?ncHaJ1M4zdY5vhzQBgGtZg4oZZqUwXkwyvbYRn6oy+U49o9BUNjf6HYw1dzI?=
 =?us-ascii?Q?LFwKBZT2USsbG3KYgyJ8fav3qnZeYbk2S2wUAk81bzJzwWIREX+hZevKuAI+?=
 =?us-ascii?Q?ZbuMEWt2I5FzzuujwbC5o/hLqtAUCp5U7qxVef8u0BJ6KiyERAb2+7LavQDC?=
 =?us-ascii?Q?eNqk+au5KkKWgjxZrdstMQv4QDOzQ3hyXSnEXy21VtiMaCyp3R4RkqvDhaTJ?=
 =?us-ascii?Q?Hx9nMrvhMyohwy+R4dVJUPtFh0MsjugrXfD1wBwmw42izr83jqaLCth95uZS?=
 =?us-ascii?Q?F8VKSZ8FmTcH0ED49mJGdiAC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0749b5da-04d1-427e-7883-08d987e21349
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 09:25:30.8624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7UC7O0hJvpBIaIgM3Ks0/D9R470bBuz/g8F0SFjkdGmtv6qxBT82sJAW5QmcAcAVEja2OwuUjjbjN33LD1Y6NO2ZRWQkKO1qljt3E31WAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=783 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050053
X-Proofpoint-GUID: Ub9SZY2EK8EIjXBPMcO3ln99cYVdeEFl
X-Proofpoint-ORIG-GUID: Ub9SZY2EK8EIjXBPMcO3ln99cYVdeEFl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Media devs,

The patch 7641b0442195: "media: i2c: Copy mt9t112 soc_camera sensor
driver" from Mar 12, 2018, leads to the following Smatch static
checker warning:

	drivers/media/i2c/mt9t112.c:176 __mt9t112_reg_read()
	warn: not copying enough bytes for '&ret' (4 vs 2 bytes)

drivers/media/i2c/mt9t112.c
    150 static int __mt9t112_reg_read(const struct i2c_client *client, u16 command)
    151 {
    152         struct i2c_msg msg[2];
    153         u8 buf[2];
    154         int ret;
    155 
    156         command = swab16(command);
                          ^^^^^^^^^^^^^^^
This driver won't work on big endian systems

    157 
    158         msg[0].addr  = client->addr;
    159         msg[0].flags = 0;
    160         msg[0].len   = 2;
    161         msg[0].buf   = (u8 *)&command;
    162 
    163         msg[1].addr  = client->addr;
    164         msg[1].flags = I2C_M_RD;
    165         msg[1].len   = 2;
    166         msg[1].buf   = buf;
    167 
    168         /*
    169          * If return value of this function is < 0, it means error, else,
    170          * below 16bit is valid data.
    171          */
    172         ret = i2c_transfer(client->adapter, msg, 2);
    173         if (ret < 0)
    174                 return ret;
    175 
--> 176         memcpy(&ret, buf, 2);
                       ^^^^
And this is ugly as all heck.  I would have fixed it but there were
so many other endian bugs and I can't test it.

    177 
    178         return swab16(ret);
    179 }

regards,
dan carpenter
