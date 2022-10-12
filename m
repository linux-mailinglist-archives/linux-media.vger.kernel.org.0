Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAD65FC49F
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 14:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJLMB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 08:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiJLMBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 08:01:24 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C8F13D53
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 05:01:22 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAU2e6010351;
        Wed, 12 Oct 2022 12:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=EBQiQuQ1ps68gRoBTa2XKB/oRCg6wCxz83yvGdNFRT0=;
 b=ap3UyalF7YaBOOd6XSoWluACRj8vLfAOUglhPbVmC2u6Yk5ZPpb9vBLpNyTkNeDdwVi+
 VQEncGufT7AyFWGdA9lmzTptnNmpsaxpFQnZrTGipuECoTDJvuDVcFXOLKqJPFV/1Wve
 RUzsL/ubzFcQ39hU2vrmIkcRy+cYGsjbBh2Xmld6s8RYTapq2R2cNRx8MWwA5y91TV3l
 4MGEKsjvMapguT8cFIRCyIR93glj2QNYw/5gPL0MD/WciJGqMmBXpFS7ViClUHKg5VWt
 vUx4rgPcoNyMXixWgX9kkh4ZZMmkCjdD8mCgw7QYImZItVhTRMWaiLrRdL9bgZhkbd6Y fw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k30031nqu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 12:01:17 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29C9Gfpp035625;
        Wed, 12 Oct 2022 12:01:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2ynb4efw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Oct 2022 12:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFKLLB8fZ+JueqLvxToUaUWzq+TpbtVzVvVHSBD+4kmYtcJblXIK1DpSJAlZfjl3UYc2iZOUFK0bAG75cPm8mZivIs4fxah3jwuZ/CU1jAEs2zULGHDoyTg9fviRI8wngOCja2SHRVA2AUVU/r57QhdDpLyjlFYOimAenpJf0/koNex7P+uE2QfUk+S8KDWiwlakN5baYDEpYVuxyd6tgosOgfry5sPfh0QQcbjttdHLhP2QG17DkSiY+poBJTxutOr3uC2T2VsqGBAVNd8hPuND+ZtdsqA/T192ozDSZaI2v4qywVsxFsTiBoQe84c4IQ5Ufkc36c9qcvjNUxGVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBQiQuQ1ps68gRoBTa2XKB/oRCg6wCxz83yvGdNFRT0=;
 b=mRiN+T3tuAmbKmLFZzHfzBNLnVllr1wDf9slpkokEGInpcZSJu5KICGRQV9HBsbDpUz/u2Y4sMzG3kbwFul+AwjfE9exBAZzaVuRjGgcR7/Ln+/CGjhiM7ygJJzjdoFs/SxUSEDT6yWPVtbSrmp+G7WX4NO4JIUL2HIccxf14uzhbfLUt4u+cDsZjPrNUIyI/SKeHn4vAG34xAm/eh5EGQgN+hON+4Rc7NPW5kcgv2yEQ5ZsnomsWqeMVgioSg71Hyk8rs4zO9HjF49T68hC6ek20ZP3Ea8paKXPxwbCZl1oRYInSh7MxxjDu0MPYZyzHEXWnO5aMP/Sb5bOa25PPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBQiQuQ1ps68gRoBTa2XKB/oRCg6wCxz83yvGdNFRT0=;
 b=YQOvjUkRlkiWKzLsRgQ09Nn8NzlXNpx7q9lgi5WB+V1WXIK77eisZaLcFVIrDjNSENIeuMdCAWGCyoBTLGk8iOzyywm0A08sNCwg3PxqhsGOb5/tLuq5ni4Zrs+wVpoSntImdxlDhuyTgwZ0S+Yh8FVURu18a3dLbDcW4YoCHGM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4629.namprd10.prod.outlook.com
 (2603:10b6:510:31::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 12:00:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 12 Oct 2022
 12:00:09 +0000
Date:   Wed, 12 Oct 2022 15:00:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     m.felsch@pengutronix.de
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: tvp5150: add FORMAT_TRY support for get/set
 selection handlers
Message-ID: <Y0asQSuTaFU45YFy@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR2P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH0PR10MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac05962-ae6c-4bfd-bd16-08daac494f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dickza8ZW9mfey6jOmfd+3zgnkSBfFos/wSG/FcNRRlPT1Y+j5usAC/45e2Ssq9a/kI9+jQFTmCCi9QDMaWVVWQQxLMsEVKd9fvK2wAtEQaFT6224/fkNg1nVUSr8YAE3IW+NhazRZmZLNfaeBbJ3tIEZFT59Zn2EzaRkCouA3P+zFUHyMc+9QNahpqk7VerrpANZ8lPuqggfDnPG+J/0tA+bSTNngstdN248O+7o37z6w43t3mLeRQMVY0ShpE1eOG9+pVZl5CJzo0vQkyVRkb7uGoNHLiDkvIJq5hphpPm2/P0YDhS2gcsmTrAdTVtFuGTaSnyFjA2TtjRCVLeBKfPr+rNJ46idQ6vHXFTYXRPxaRhTrczKSRmWHoqgviujAM14B5UC+vI93p0W9Vn/xWqkqdPFRysnV1UusS4YHPTV2l+McP6u82d+obPlAQvtDmlC6O9a+IsPimKRW+Dxu+8eUbxLEdytzYjA/XXUJuhJ6qhguLVPA9gF613LQ4zSciCP5z5Hgq1dlebuvR3p36uBK7YjVcGycDMei/4zfs+EkypSv7wybxZ/4tkBIl+rkgtoeXAJAr43C2WcrtpfxoeJjmIbWwR99lR0J1fZSfurPlPt7orShM/3mPqJ/pmjclFi3K4B3YM9ApvwQcsUvVlYt4v+3bg4Hx9eQ0DGIqeMrPavz5+L+xJwopNa8EP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(83380400001)(38100700002)(33716001)(6916009)(66476007)(66556008)(66946007)(8936002)(5660300002)(44832011)(316002)(86362001)(41300700001)(4326008)(26005)(2906002)(9686003)(6512007)(8676002)(478600001)(6486002)(6506007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XchDsTbhI7C2T/WQpGl/51dFriwX0RSE2cHdgJ9wBVaVprJ4dlqEDh5UK8WM?=
 =?us-ascii?Q?6x2qM1yiu1V8jqDTE4ZpekbHGUwohJO2NT9p+0hQYxs1Mj0f9ScA5QIB5DnI?=
 =?us-ascii?Q?9lHnyGrdp14NVbcTtNH8vO8EDrEWU444qfA7T1gbiIdaEMUSuj4Euw4wh1d+?=
 =?us-ascii?Q?wY18AZYwE8NO79EAlx8QTEiYG+avIe+Q4kXypgNDE8XOQhIgvjH8V3wikVGx?=
 =?us-ascii?Q?UejrdSjuO2LFI2SzTiuaPKRzGBTuNGNR6eH901Bku0YPeAH7xUcHIfdSE+It?=
 =?us-ascii?Q?ASRT97YFs2nrSkOWKaYPUBLUxW0JtfK3y30HajiQO/Ve1iSxK7xlKB3bIku8?=
 =?us-ascii?Q?LO5ay3FCUzdn4E5mOoNSQSFWNAOp6SOtPgttovAI0Vb7vieP45BYznZqVYi2?=
 =?us-ascii?Q?gZrRoBJZIlDmh9797/liRte4BGZzsS3SrYt12/SargKXxfFMbtxxSv0NPIVJ?=
 =?us-ascii?Q?imgW1cvCLDQ7/JFONVC58nX11iSQ7tXxm/5g7Yig4VhqOtIYVSY8yECVpjha?=
 =?us-ascii?Q?aZW4peoynZky+jdAJd0dJqHTgPdnF91iOfsBt8Pl59a7UHsIO3fTbVSvnhst?=
 =?us-ascii?Q?rTZJ8br1Tb2P5VYTrgq5vwkraRoXAK7CZCbo/6xKMcVHwIRCh1hR+4GEoBGO?=
 =?us-ascii?Q?fVV6o1B368Ggs4OsGIRI4At9HXJiwzpuyQrocwGfQwhyg8YvInV8NRyOue7l?=
 =?us-ascii?Q?b5hCpHORJ9ipYy7LagZRcNET5Jjj0BM95GE0lvjv8WSgkEbLJQ+R4QY2Oxvc?=
 =?us-ascii?Q?rt4MnkSOgn5VJdHi0qa9zxQKeuOecTDI+5BYk02GMagpeoVJ6IIJnLVWJNpK?=
 =?us-ascii?Q?EqBAnJIgIYY9NPBFv10Sgj98/lMiRwl+mXV0SVfmwda4J0hrDNWvPYyzvXy+?=
 =?us-ascii?Q?XuJNtj1vXtifUwlJvVVEsgAuRmk6xrmn1mbPBUgJ1TbH0sbf6vhW9iBPWdga?=
 =?us-ascii?Q?tCE6IDeVjsxHi0AOu0O1fi6iOeedGIzXWfxdfinyE/vSYPmfDjzzjC/pL5Cg?=
 =?us-ascii?Q?Jzc0506PQAce7wjFpKt7CiIXmB0jjZ7JsG4ynNhgwBhylkF6JaXCBoSriZCu?=
 =?us-ascii?Q?Tiiqkw1whlAK2IyKShyoOn+NWc+pBw10XCuuO+vllycurEmL/0lekT6SADJr?=
 =?us-ascii?Q?v1SRQALvQTTcNmXEogG3XDLdhKlVJTiRPfy6oAOL6vtdUUsimc4vAXE6sboC?=
 =?us-ascii?Q?XJhprkWHxYArMqDLB7jY7OZ4O8dhtC3w2Vu0M+yVjMcAlsVFlL4HP+5W1pBS?=
 =?us-ascii?Q?jLM6SEcKGceumT1wJRfn7FwAdihoC0EtMvOhZ5xDzc0WEp7+JD8691sPdvZF?=
 =?us-ascii?Q?LtPJnuh4wJe4Qw5SZ/qAz1Ss22wIS9B4Nf5anKJNmAgTWCiIuST7+a1O9DjL?=
 =?us-ascii?Q?l8mbrvDH8qgfREYM8twjd4yXfARgaotDCz0J7KxTYy1jM1o92GL/iLkifdYc?=
 =?us-ascii?Q?I4iULJ/9sOW4iCGe9G0w1idBz0F635B00otUDtIndicUIgBIP3BbTLn8B3pM?=
 =?us-ascii?Q?xJOr4ZWrhrTAU0koHCrfMr29hb7Lnaa4y62nVUYJ62C9X+GRoAxtqlFOHuQC?=
 =?us-ascii?Q?tUF8NZEgfZ+FVQxXjAjXvMp8BtMP86PdCFvUuaO5aA4oqOU8QTB8/8+buUQJ?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac05962-ae6c-4bfd-bd16-08daac494f8d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 12:00:09.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mUUE6aHZSMVVAyOzXa3R2Jy5z567nN4MDGQLfhcXB5JiKR15DmL3HgAP36778PUSIoLxKbp5D1ktyR91TmL/UbrwffW/58be7NPvAiqcz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4629
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=858 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120079
X-Proofpoint-ORIG-GUID: uFl0KJilXP6ZR4jrINfcWjLBcN-Owlkg
X-Proofpoint-GUID: uFl0KJilXP6ZR4jrINfcWjLBcN-Owlkg
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Marco Felsch,

The patch 46fe6e7dcede: "media: tvp5150: add FORMAT_TRY support for
get/set selection handlers" from Mar 12, 2020, leads to the following
Smatch static checker warning:

	drivers/media/i2c/tvp5150.c:1153 tvp5150_set_selection()
	error: potential NULL/IS_ERR bug 'crop'

drivers/media/i2c/tvp5150.c
    1106 static int tvp5150_set_selection(struct v4l2_subdev *sd,
    1107                                  struct v4l2_subdev_state *sd_state,
    1108                                  struct v4l2_subdev_selection *sel)
    1109 {
    1110         struct tvp5150 *decoder = to_tvp5150(sd);
    1111         struct v4l2_rect *rect = &sel->r;
    1112         struct v4l2_rect *crop;
    1113         unsigned int hmax;
    1114 
    1115         if (sel->target != V4L2_SEL_TGT_CROP)
    1116                 return -EINVAL;
    1117 
    1118         dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
    1119                 __func__, rect->left, rect->top, rect->width, rect->height);
    1120 
    1121         /* tvp5150 has some special limits */
    1122         rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
    1123         rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
    1124         hmax = tvp5150_get_hmax(sd);
    1125 
    1126         /*
    1127          * alignments:
    1128          *  - width = 2 due to UYVY colorspace
    1129          *  - height, image = no special alignment
    1130          */
    1131         v4l_bound_align_image(&rect->width,
    1132                               TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,
    1133                               TVP5150_H_MAX - rect->left, 1, &rect->height,
    1134                               hmax - TVP5150_MAX_CROP_TOP - rect->top,
    1135                               hmax - rect->top, 0, 0);
    1136 
    1137         if (!IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API) &&
    1138             sel->which == V4L2_SUBDEV_FORMAT_TRY)
    1139                 return 0;
    1140 
    1141         crop = tvp5150_get_pad_crop(decoder, sd_state, sel->pad, sel->which);

If "sd_state" is NULL then v4l2_subdev_get_try_crop() can return NULL.
It's probably best to convert tvp5150_get_pad_crop() to only return
error pointers or only return NULL on error.

    1142         if (IS_ERR(crop))
    1143                 return PTR_ERR(crop);
    1144 
    1145         /*
    1146          * Update output image size if the selection (crop) rectangle size or
    1147          * position has been modified.
    1148          */
    1149         if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
    1150             !v4l2_rect_equal(rect, crop))
    1151                 tvp5150_set_hw_selection(sd, rect);
    1152 
--> 1153         *crop = *rect;
    1154 
    1155         return 0;
    1156 }

regards,
dan carpenter
