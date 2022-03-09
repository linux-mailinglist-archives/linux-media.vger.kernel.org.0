Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614874D2F82
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 13:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbiCIMzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 07:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiCIMzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 07:55:41 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025D816040E;
        Wed,  9 Mar 2022 04:54:42 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229BLST6016927;
        Wed, 9 Mar 2022 12:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8qN9mAMc+cTTMaaYveBrkS8gvcoJRIsNCUrA+w0pJiI=;
 b=diJGmp4Rry95yEu6i/ABW/SN/iZA3CKMgcnsiXLI+8aRh3uDUnF4dutZXbLrzJJmUwqc
 IpAuAd5Wd2cnHEkgJGDMJPV6cFcFwwC9d2FN/L8pYunUbOJ1OyTx5JAru/tTv5ODZ5z/
 5ZwFlc2DWHGD84rJ/lI/V2s/Gwvkdln8fN8uJHX1p9RftXaNgEzEY2tsm5IazxhKJa+D
 EB+8iiO3pSl7DKh/Ch1CVp9Po/fUza4Ct+vgj9JpEXD4cOgyY5S4OKdzkwYifpfoANhV
 ccShHaJJwHWUA3cz1PZA6YNuMBA78hljy3cdpaPJ8XBnw5KGnc7SHIQjFRYfu1wnUxC1 NQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9chu3t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 12:54:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229CkhmC191844;
        Wed, 9 Mar 2022 12:54:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by userp3030.oracle.com with ESMTP id 3ekvyvtgte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 12:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv9LA1heIJX31fwpmlPhTavkNwg95HdzYcNNohOY/qjRoHacqsPPayPFQe1X27e/GjH06Ib31DB/X0s/Tn/9TZU8uavRRAdagOxz5SWoKbLG418WRTxDXcoKx4ZUeMXI/XPIhRhlZ1Ctl6PHsAtY/Oyfy7JvuoCcFtUuFm/Nb4GBsnpMRTSZv7TJE93aNZWUQGdFPiX08KB2BVWOURbMkGctFm/cDA3ETVd/mNk8MoR11f304gyb3xFXzitwuTX2hQ3hSZ7xPMR/Dy8ZSllFfQWTClkJNgLRJdR2DW/Xm6z6DFxf0ciAXz/OKbNPDZ3cA10qVN6z5005/+rdFL6OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qN9mAMc+cTTMaaYveBrkS8gvcoJRIsNCUrA+w0pJiI=;
 b=ZW95XbUHkfdp6GBprWkvpZ+EP2KI0qIiJME9uF7lMXxKkqXIMSd4DL5A+Us+yexOqLcARtP2xlqTdlbnqsL/5dBJQ0cbcJGUZ6UhPP2fr2FW6NiqArkW2zEQIaPvbsiipHnf4QHDHjVgGOIzI28LBsyWN4+XLOMGvOqeSJj6Sv+dNDJA/shXHvp4VBQJTmYgIfBKIoR5uyCVcE7QvZqxkkGyJE+t4/OXk5jDqf0g8I2aUrdCuSenORQFbiLgpGWuIf/lWLEzS1GvV4G8BibCDeU444uupXWAsrVjRZMfiM5sJ60NY2if9u8G0WmNZX0p15W1/TeJ5iMcEFjnDwgVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qN9mAMc+cTTMaaYveBrkS8gvcoJRIsNCUrA+w0pJiI=;
 b=eoTdqspfxui7XHOPHU1aQCCT/hFs2XJdfNlfZDmllsujJgNyTfM9JfNi2AG/6tsAa+r/h1iqp6kl5tBrsz2b2hsB06jcVyke+0eEaqdZvGdaZqfffl+cjgDyWlCUSJ0/vp024OIKzGqXoFJQBRYZpLLsVzFZJCzoyNtD+tiluTY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2155.namprd10.prod.outlook.com
 (2603:10b6:4:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Wed, 9 Mar
 2022 12:54:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Wed, 9 Mar 2022
 12:54:32 +0000
Date:   Wed, 9 Mar 2022 15:54:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     Shijie Qin <shijie.qin@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: amphion: malone: prevent divide by zero in
 vpu_malone_check_ready()
Message-ID: <20220309125418.GB11530@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0138.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8196a983-0413-443d-af42-08da01cbf482
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2155:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB215512864A9F25ED3115A1948E0A9@DM5PR1001MB2155.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLuSG3RGdGBCH3W+J+wlZT56r198Q88UolAtgYCwVOAuEUNHrOoJE2cmMB15+WeEwXNyRNWJT1urYi7p+ukdaEXzY07Xh9F/VXtE4nYTgyDDthivaICcxUhX7VTVNu9mDx6K0tR6DgAVRYZIgFUH5cRqdYHBrXNUYX9MHdgZJe3kyOTLKHclSNkihjNZL1QpSOndjq/E1EA/om1ioGvuuwgN4fV/LpBJgTUuFwtBz5UcVe+QRLSjdQihr8EGuruE5tWZaeHFZj4hj2lmJCKcNKlow7rnUZnhLNzAbD+5/cxUM7DfKgxDChjjo0ZAt8pwtWZXrlW+tO47b9pzymJS0XLe26USO6yG7QE91ZvYaPl096QhYDWPFnPna+6+alOrKaW9FWGUby/4Zna0MAFBGv1jCPeEwDDZRIOIH3PMd/UsekVCcAL1cBpRrGXauxf0IGmVL09jaOVbXUnX8a/BjT4y0TRhin11T4yk7OL48JYxe9qenbITeimy8iSyeZFF0Lny4uj1kUTmhS7Pzf55CZBPN2UpuCTENr1YsoItTRHzRF0GHih9u5y2rddKaa31tuJ1HEg3fGWU8PabgK67JKwKBb1j9pRFCDAsP9H3WxDFwGi1mcTpqCASkyDoMypE3+uC38r/WqfszyZzkOXx1f2PpXXfzHnoiw91nCkO/5fT6Bkw4D59i6W6/HFiXm87eNHI9dIsxYGa9D8yyQdXbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(86362001)(6916009)(8676002)(54906003)(33656002)(8936002)(316002)(2906002)(33716001)(4326008)(44832011)(38100700002)(66476007)(38350700002)(6512007)(6506007)(9686003)(5660300002)(6666004)(6486002)(83380400001)(1076003)(66946007)(26005)(186003)(508600001)(66556008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09VeItRBMAkJRmVz5zn3C7DwV0c3ltjCBJfFTx0YlocaOLfoS+tidZYzZNy1?=
 =?us-ascii?Q?ozQWIw5hAbnD6g7cqXK54KSsBQy0l8MN5KDUsj1tTfr6+Ol1gDZtFehKisDx?=
 =?us-ascii?Q?urd8+na1y+yhjUkshjuTg8kUNh0ScyXqKKlI8bCaUSjPNcUXloKbMqoGKL0v?=
 =?us-ascii?Q?oW5elGt05+kxLxY2Ukut3Lwc2ew9xb4BJxh4bUZPk0lJOKOeXR3TQVndtlMH?=
 =?us-ascii?Q?qXxjeSJP2Jor+7Nk2ed9DkhIW6+DglIMXuNXNPcXlixLCMwyb3BaQy5NUCuX?=
 =?us-ascii?Q?nhGN6JGiPnscHe2k5LgTkp+tgDyCYBWLK+r38qo0YV61S9cOooScUmqTVG+f?=
 =?us-ascii?Q?zB7Lec8HCuNZdBgoKinfSH8jMf5ttG+PrLh1CpH7dvFWBffRKQlKMdqNvAZg?=
 =?us-ascii?Q?Xcy7+H3AS1zHh1ER9jFi2PLTeUldayAeoQstO9v+oZX+0ULJbEHHTOMoRQw6?=
 =?us-ascii?Q?H2J0KGZCsMQ6Z41xblJo9g0fzd3LGCdcpenYGwlxltaEBlEIIc9a/8bPjRP4?=
 =?us-ascii?Q?JNfzzdHaIIRe4JTJzupSzMn5CjXl7oih0/3fJb5RRm8zQ/M/kK7c7Ku5xVSY?=
 =?us-ascii?Q?izcyTXMWDw53Qb7nX2mgVIbQpmvfGFVpVe7XlfjyiUeG7nZliMu1br8ts7Jc?=
 =?us-ascii?Q?rHRheK0K3WTaSTXdX0snxBALrDwQsuREJVlK0Y8H0mOVn7cG+VXwBmFTC5Gd?=
 =?us-ascii?Q?lv1qiFbYRKkPqqQaki09ue+CEEGg0fvMUU0IJWCoUWiYC/39lu/ItTb9Gbh9?=
 =?us-ascii?Q?fIA4agA5ySQeZHL646xgEFRUl4AkVpMozTI/1hy681NNN/2d2X05IKjdzGgh?=
 =?us-ascii?Q?egq4bUPU91+3o7Qx+S4SmsW/WIwd1timW+vgbcx+BK+RvOKes63/o7RVbPHX?=
 =?us-ascii?Q?iL4FM2oDc3j+8bZ2092RE94TKmGVsMyQLwBO5rfV9yLW7zRbiAeNoNr+ZBDe?=
 =?us-ascii?Q?VCtpQ4RtVwPLAuzs1OCBctxXky4S0Nf80tuAOpfuK4BoWioE/XXrJStu7ejT?=
 =?us-ascii?Q?zNQ051D8R+AjZYqA/KGG1uvHLKEHoL0l2/mFLNlkE0RgLy4pstzUgt7otMEd?=
 =?us-ascii?Q?xIe9VNdCqwMwJ5jftjB33ytmuZLUNZu12W+blEP99goL2PCJwQiE9iKgzbrE?=
 =?us-ascii?Q?h5nkCeXTnRRTTiYUR+iu5sgkbAct8/NGwCaYkDzQF04eUBOCxqaYxkmUKmfh?=
 =?us-ascii?Q?xh2yrXADwiFTbrLi4oh6yVnBlsJgEY/2AxQ53iplEowJ2kplcjKwKp3n5wuh?=
 =?us-ascii?Q?akTXfzAxbMo6przGSXUQUlzCO1W0pBVkezvFc++lzhyPBRn7CNKFLTZF3g9O?=
 =?us-ascii?Q?9cKx90hU+irSZIXsSeDlC4LnPy2NNZ+03V2R86ejE7RqdL2rtJOfzXjv+dBx?=
 =?us-ascii?Q?BFOVsdjqmc2hIJ6wS4jEYogN+2EA8btF75YpvOI5GL+45D8t1XzmakBtw7Ee?=
 =?us-ascii?Q?lhlXr7xBg4kvU/ksxJvrfQ1hi6n6Xa+kD5yXRpKs/i5k3ZlG3LUruobUW8AN?=
 =?us-ascii?Q?6uOF8lxbTOtziMnTodIhriemPiWDYSp6SAA3YMeQME5M+HBmrztZGo/xxHZ5?=
 =?us-ascii?Q?ojS4PPh/uUm0j8otgOXm4MJSQ3agsywIG7b6WuUaAeblSwCkQLmJGjWOP+YY?=
 =?us-ascii?Q?yJuwKCciZnUA1JekOJFoz97oKnDLtsStLYjfyblzR3HMmVHRDn4cgKx/c3jc?=
 =?us-ascii?Q?jr2rMw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8196a983-0413-443d-af42-08da01cbf482
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:54:32.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFJRsoFkeP0FPQDeeZeRV+wXLxtqvDtmP/hQExQb3ELUCGXDyyTFrBzbNH8LZP3zi7QuVHVJzsGkdOAZwrPmPZzOWZncZu/9joZc4yAGpt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2155
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10280 signatures=690848
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203090070
X-Proofpoint-ORIG-GUID: GbVCn3TGBe7JCq6c7MFmYMUF3W6yFDMR
X-Proofpoint-GUID: GbVCn3TGBe7JCq6c7MFmYMUF3W6yFDMR
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code checks if "size" is zero, but it had already used "size" in a
MOD operation on the line before so it would already have crashed.
Do the check first and then the MOD operation to prevent a divide by
zero bug.

Fixes: 145e936380ed ("media: amphion: implement malone decoder rpc interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index c2b424fb6453..b99a04426816 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -1564,9 +1564,13 @@ static bool vpu_malone_check_ready(struct vpu_shared_addr *shared, u32 instance)
 	u32 size = desc->end - desc->start;
 	u32 rptr = desc->rptr;
 	u32 wptr = desc->wptr;
-	u32 used = (wptr + size - rptr) % size;
+	u32 used;
 
-	if (!size || used < size / 2)
+	if (!size)
+		return true;
+
+	used = (wptr + size - rptr) % size;
+	if (used < size / 2)
 		return true;
 
 	return false;
-- 
2.20.1

