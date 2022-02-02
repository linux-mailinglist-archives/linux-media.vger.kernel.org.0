Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4434A771E
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 18:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346371AbiBBRwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 12:52:20 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8488 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346365AbiBBRwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 12:52:18 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212HY10r010114;
        Wed, 2 Feb 2022 17:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=94Pg8w79zlVcfE1j+Pyst98RTyKw11j/6AlvNoDRoeM=;
 b=r7R2qfkNSE6uf+48287M1P5QjBtO66y7dmu3Jc8vUODFwYDiZ+Kh94754lIISi2Fae5s
 4b2iiC9hkGzGJPXaO0jlsEcUEPmF5qBQhfkn8X29j83kTTmKn5Zc9ZSmD5wxpCBMD6eK
 9vk+Ry55rUQ0Ru8MTR9HYNj3N57BHnfcpqOQIJ++YKLiRG9vDNHnzkJalWh4Elk9WlYA
 qzZChjI4WrQ8Yg/PC1f5oL+w4wCFVl40sCon4cmm/FfkgdFLPq6hIGhBSLba8vjF7eiJ
 wQ5k54CilTqaFbmk5WKzlXlk7hJqtzhBooCgpdxCpURww16eIsFflAaVE5+9iRGvjQBQ oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9wepav-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Feb 2022 17:52:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 212HjkQu113073;
        Wed, 2 Feb 2022 17:52:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by aserp3030.oracle.com with ESMTP id 3dvumhwu5e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Feb 2022 17:52:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWbeaIQMgPnZ+lvG1n8YZY9H2sWACsyxOutnIjOd6ExJzncpeOnaL/2hqBtXG38+RyFO8W/q1gFNBLBazRU7QTmCXA9nKtZAdqMw9x8tpylKoVfbm2C6R2k/Oi76odAJywY7w9SFZ1SV+2bEooJHMqHy0z1sULcRsTQvjWtCS8XYHYsxWo2a+3mrEMuqU7WxIflQVfaHoq80PNhKTCBSIHrr7DbPlwfJqhkuH/pxaWGGzMGDCUSHQ307EU5em4ZgKqujfpKcCKLJ1qznMVbIkmENP9anN0mIKHULJDbIifMenJcLcHOl4Yj50B8xRqxcVGr7i/cEmXlmpAAc+iVAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Pg8w79zlVcfE1j+Pyst98RTyKw11j/6AlvNoDRoeM=;
 b=T2Y/1zXcgrqKDgrUNk4KLz7S0jydk3rEwg/kZi5m/PbTr6h20i7nIw3VcRmtm0BShJIAu12HZ224iel1MWYzF2HUtMgv3RGcE7RJCBI1gEGFGRXEphXT3C0jHoGCTPvc/qBuV1vsonf6ChYk7IHCh87dMZViOIXzpVTpwm5fcUDth43GdqcxEGatupdMpwwJ7pxr/vsj2J9sqH2ufg4RTs770IPNfJZfQZOa7UEzuSsI92CshGfDZvd/AirzGvdI4ruFzB2dgO2yju+0Z+dCMkuZJd8z5gCHOnGfiGODnDh7i1+qf9p7WcswFQhSuW6E3kceTQ25eryE8rAKjHrbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Pg8w79zlVcfE1j+Pyst98RTyKw11j/6AlvNoDRoeM=;
 b=DQnZzEIcmM5zaFmzLFmSfZQIobYxyXDUPx3VJHlIjjXmt2lb/oCTpChdZphTCGl5zdx0MfXmWSJHP42rD2kFvPc8g8WQwy4vJpq+xGr38fEKfBqbGQLCr+9i6SgXBJsxPagZdA59mFyVCXdeNZAXjk0ZMYSMEvCQ+sjBKB/VPhU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1656.namprd10.prod.outlook.com
 (2603:10b6:910:8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 17:52:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Wed, 2 Feb 2022
 17:52:13 +0000
Date:   Wed, 2 Feb 2022 20:52:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: usb: go7007: s2250-board: fix leak in probe()
Message-ID: <20220202175201.GA5772@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7faed43e-5303-4e8c-9585-08d9e674be2d
X-MS-TrafficTypeDiagnostic: CY4PR10MB1656:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB16560CE0DF311F8CD89529E58E279@CY4PR10MB1656.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ve9uM+gtWyn9SjZkRjGp9b0sQ1njQfOBCU48/bm6InS34CREc/bBM2DCAL5XY2QL1uHhEl+f11ZGJvVIe+0goP5AYdFeWtgqVuC4AbDHEoFvj8KGZatA2aTFACC19m1R9y3Fkp+7MMkeFqCDSkdlecUNu3+EGK3MzRCFtzIoXIxSwYMP3A3tagD66QOv8UAUcLPDWd9B0B4AHlTjUK66Ozc67M8XK503Huhy9cpLgzcsaN86tGCFBD8K9Kq5l+zSANnLh93NxuG6ycn7Tdnhx2S9H9auMoeChKi725hmqdf2FCfuAl4yzJmj3Ut/WJRJT9HS2GwyHiv5xRLOJ+Ujr8VWbMwbPejYf93yK46q91wHXhmOaJCgCvpWjEYRFjR4zbVys9Ez5/cVwkW9XPMcfGw2fXX2/8KVOTUK5tiigPfIMRaNol5iPsxnb9j4TeW1MlnZfNs7tEsMEN3dDQQjUYkOuBSQPRK1L4MdL03g00Ig8Dxy4NJerCV0jPtk1fkPOtKZWd15KVInjEkRIUEK4iM6/pwiLh73bcvr/dewPQM8fIHpVF9FzrHaUx9QNg9QPZ6YQSOxIlP46JG54vpU4qi7iVgaiGTBTr1imirUApXKtjS8rIQZOsqXNWLEvcpadOjLQzILNPHiPvQMLXRAV3q6jm/tQWRYKlq5WomA0HRXBJGT4NV+QZzdVJ6J5V2jOfIw95Qcfdx/Nv3T3ZHwKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4326008)(6486002)(86362001)(44832011)(6666004)(38350700002)(508600001)(316002)(66476007)(38100700002)(52116002)(5660300002)(6506007)(66946007)(6916009)(8676002)(8936002)(9686003)(6512007)(66556008)(33716001)(2906002)(1076003)(186003)(83380400001)(33656002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D0wk2NOertBJI9OjFjP+b36yoNi3MOBKzoBrSUfQo+oJ4GW6B81fue8BkcOU?=
 =?us-ascii?Q?6JSDAM3xGh7cIJ79qu6K2cddx9bzFf0vlisK2ueH9z473rszUxf/DzqMvLjg?=
 =?us-ascii?Q?2ElyPFNV/7wwSSL5cXPfTc8OHuIa5pb0QwVJugkzXzMqV9t/dZeWfV93ABrY?=
 =?us-ascii?Q?XdMFKJdj9NYxkTLuKJhWUumsv4lQir4abNOIrf0BOANXEqF5+1jL44rhWcG9?=
 =?us-ascii?Q?BUMQWb8IcljeakA/qn3KBbOGfBcwxdkVx65MTRv5QNflBPo5SrfvG2Qh6ZwB?=
 =?us-ascii?Q?jd+qsuhE5Rts9znk3uMBfDUIRwI8yrxY0FUNMj+BksGrbkTG/bXhdanuDA+J?=
 =?us-ascii?Q?hMpmPWXzZSrzUQUpB+aCYi8+K8T+b3R0I9iKQiVDY8Vant7k3RTafnNYG0gY?=
 =?us-ascii?Q?eW5axxJuwNXDAQh8BSOfPKTM9ODEyQSWjQ8kDywdo61qkpp9Djti9KkFkQZo?=
 =?us-ascii?Q?aV8+gweWMBBZ5nffMzMBDUiHIc3J1BMGq3ijbGLiFZahfgA6KNHcNUowfV5g?=
 =?us-ascii?Q?dtKmRehzXTQIjYEPK43v/owZeOyQ2XElCr5mhVxNspsx/8X10wknCzRBom7T?=
 =?us-ascii?Q?q1MlkBztNZopayiMlnicyt51Fk9fxsxyY/PZNRh7iE62WWqEWpGQNVH6NWTm?=
 =?us-ascii?Q?8hbblZGAkNc74kku8X05wn4gocINQ1D0lVat/6R1b5V4iAHsNhd8GIUPOwG1?=
 =?us-ascii?Q?RT3Kh6UXnOOmui0a5cx+2G74v1jM/ugrY05UvKzXLH6gY76LOZubh0kxF8B3?=
 =?us-ascii?Q?S+WapPpGU78HvvoSbLGzInN1la1h5H4mt/7H8zlppxXR3ccmJXfvPOxN9B6g?=
 =?us-ascii?Q?B9pkPQjecj0gDOTD01j1N40ciQDUhOZYCp0+em0OsWMz3sV6wMyCKedAcpE0?=
 =?us-ascii?Q?I80+ssuzc1HK6w5uh9P7XHT8rcC+UqYrt8A6W54v/f+HQHYUpRupGtTAu1Ry?=
 =?us-ascii?Q?BLo8zuokkK+yFSCEwEUwRMzkR1sC+TIF6TrftYXOU8ufNT4ZWtxatO0/55gD?=
 =?us-ascii?Q?vCcxVk2IHW5vBdZnPrDoxWjmbUKkBg4r+4JYo0x3jGfstw65keJCkzBdJ74q?=
 =?us-ascii?Q?L5OZvFrRfkzZO/mtIL2sFzfBEryvkHnj+jh4qeyyxLgOpGlOJoLpduvV0zEX?=
 =?us-ascii?Q?+FDnUo/VU7mIXlTgdFmShQDR4iodqicDGLK5LFdes+gadPtYgCNtmulPai+X?=
 =?us-ascii?Q?lzcwCAti0KKHwA3blBLbhP4yf/Yaupgd8ArAt34QJUaqQnGZuAvTHbkUXWDB?=
 =?us-ascii?Q?v8K1nxCc1g6nRczmp8haZNAbhfr7EJIwMF5zYnj+QUZa7ayGGdubBTY0WKnU?=
 =?us-ascii?Q?QDDYMPrpQeokSQvinAtnxf9ykMhv3Ob3A3Dhmb2x97F5Fs2jZVFzT8liwpRt?=
 =?us-ascii?Q?hYUnvCP5OkoQV5UYvg6sh7+V/BehZx0BsTVydxvMlNEoo29TvzXE3VYPmHrc?=
 =?us-ascii?Q?mdfViOX3o6St6k5IJcLIewc+vF72Z778zb2GoVJaGBMjL+mOhkQxItBx9xAQ?=
 =?us-ascii?Q?1iaKk+Mr4aKTJ0CuL5t+SKBy61cPnLrNU5mIURrE7Tg6tfKidKpobO/IdKB+?=
 =?us-ascii?Q?pBp+XiZc217tenp2W9YaObBz/n89dXs9MzB81Yil3P+8nlLoRidcPKOCk+gr?=
 =?us-ascii?Q?xJ7p8gQ0fJB15sG2ooCxVVgO0YlbymnSnwnZMe3Laf05NUab761q/F4+nrTK?=
 =?us-ascii?Q?lw8qT6cXXZKojUUkYJD9Qk1dR5g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faed43e-5303-4e8c-9585-08d9e674be2d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:52:13.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mX7fqvPWlwC+SSMVcoSGfCykin5cuEZo6VZe18pfKhuftZ3eNEq1yI5Soq+/2QQVI/kvbafR1yuvQNuzdQj67uSsOA0lesqjnOzaog/V+9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1656
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10246 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020099
X-Proofpoint-ORIG-GUID: WJxenAr9wp9B0wFCQr-dz_b8WfANHrxh
X-Proofpoint-GUID: WJxenAr9wp9B0wFCQr-dz_b8WfANHrxh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call i2c_unregister_device(audio) on this error path.

Fixes: d3b2ccd9e307 ("[media] s2250: convert to the control framework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This seems like the correct fix bug the commit from the Fixes tag seems
very deliberate.  Were we waiting on another thread or something?  That's
a common reason to prefer a leak over a use after free.

Please review this one extra carefully, I guess.

 drivers/media/usb/go7007/s2250-board.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index c742cc88fac5..1fa6f10ee157 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -504,6 +504,7 @@ static int s2250_probe(struct i2c_client *client,
 	u8 *data;
 	struct go7007 *go = i2c_get_adapdata(adapter);
 	struct go7007_usb *usb = go->hpi_context;
+	int err = -EIO;
 
 	audio = i2c_new_dummy_device(adapter, TLV320_ADDRESS >> 1);
 	if (IS_ERR(audio))
@@ -532,11 +533,8 @@ static int s2250_probe(struct i2c_client *client,
 		V4L2_CID_HUE, -512, 511, 1, 0);
 	sd->ctrl_handler = &state->hdl;
 	if (state->hdl.error) {
-		int err = state->hdl.error;
-
-		v4l2_ctrl_handler_free(&state->hdl);
-		kfree(state);
-		return err;
+		err = state->hdl.error;
+		goto fail;
 	}
 
 	state->std = V4L2_STD_NTSC;
@@ -600,7 +598,7 @@ static int s2250_probe(struct i2c_client *client,
 	i2c_unregister_device(audio);
 	v4l2_ctrl_handler_free(&state->hdl);
 	kfree(state);
-	return -EIO;
+	return err;
 }
 
 static int s2250_remove(struct i2c_client *client)
-- 
2.20.1

