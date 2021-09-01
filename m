Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2626B3FD7D5
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 12:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235977AbhIAKmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 06:42:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28144 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231903AbhIAKmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 06:42:22 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1819iueF016120;
        Wed, 1 Sep 2021 10:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=wt3x3V11QLk5u7cff0td5KyZIFUxeXSmmPQZN9FlacI=;
 b=cuf2wYwHDc0OubfA6iXQNLLw8HJTrUmD4Rlvr2qggQWpGUSgK9qfKeyqF7DYTO93Kg9V
 o43CHsm84dTvD9QS45zYTv6Z7wdygDXCZEWmAZAFVQ7xfmF8oGALLbp2qeELkD0gT/oR
 TIWgL4XWgaBlN4O4kQGP1GN+0aT/q8/BKVHu2fFlPg0nBi5yTJN/jLO8ODwbGcB00UNf
 ZDPCOz8Zsli07PzaGz7z+bAdO7zUO9GYxHO2U0F5VYX1J8YFawRnfAd/HhPLrI8PUhUt
 We8G8t/2GMfFqGK6hojt/Q91QtxqCsWeGl4H4Dr6K7PIocYBOdptx/yETSbR61fIB173 ww== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=wt3x3V11QLk5u7cff0td5KyZIFUxeXSmmPQZN9FlacI=;
 b=UJm/bDloPRmR/qcP6xgvnsFZOq1kTbq8enf97sxr9AcQJD5c2Oi4qhsAAp9R+953iVau
 gkWeEujZylG37Tpu9GquAehBQ9AqRsdt6V4OoaXuDbPwVbKxG2rXUW6fp76s5XabQZuh
 w0egP7vJTGlaQHbXCrURH0BFyKtVVXOAPPwhOk5cSIj5Xa1nte1/WoV7L4XGcdG8jS8O
 Znd6nAA3/EkU0W+Z+Pk2XL+bFk0oU1r8V17VMUUBpOFGNRtAAyCaXyOp2hHCN1jez6vx
 oO+cTZSMqRvKfDjKlsI7a80R6g3Gce4WmoLXr1dJB/fjvRTbDyc5s1kICUSSfB8juuZZ Gg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3asdn1vbq9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Sep 2021 10:40:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 181AdfZH051655;
        Wed, 1 Sep 2021 10:40:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by aserp3020.oracle.com with ESMTP id 3aqcy6e2nk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Sep 2021 10:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT6107lmOlLQmdxpjjN4UyOQtPrsQFiYlNWqtGQHHV5DRMvS2pR+fbktuMdOlxcz1zMwExy92tnNBXlpcLFr2ZV+0gAYR4xCZm6xc/I47Sf3u6yfJZyEm1IDGPhHHVMrtdMY20oL5hndTKODusnp0tssj58uo3r7Bj70NGZH/F0DmYh62azxMSBWXIrcSTSWM/HMnaGV44XGB6sarlDdYFgSBGawqHTngHcHLsyt01KxvYPfee/ZgrGiAhHGVW+8MfWaDn4YSYvDd0AzShVb128X95Kkzf0k/kWPWt5qsYZgrv29waUUZyVtHceF02nfL2kRr7JsyzeLuCnn3b7Dqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt3x3V11QLk5u7cff0td5KyZIFUxeXSmmPQZN9FlacI=;
 b=Ye/4bL/dcupj4iEMLGrhBNeWAkVteGe3CK3JqOkkhepeQDc3kFLkt4pV777hkhOm4j4Q8ImcaFmcYjC8aRnuET+w0Ieq3S7hNvdcScshrCuWqx3paWmts49PKe4/shdqEFBH643Cr7CrJDHxC1B13ZpXZuZFXdndsx65eJWIdwWkThbWQDhmtdvKDgFLoZjVtYYMNkKFR9WEBIdVZJiYvYMBl09NabC0BBbvnqe1TLQdjWs+TImyID0auO0J9Iqt3dG7XbgVHZd4Za6yBsm50jIFGg8237NuO61oNrzdGmMaQHUrKqe91gXM/nO8rfgdgd7DMECWqYi1QM0h/NmB4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt3x3V11QLk5u7cff0td5KyZIFUxeXSmmPQZN9FlacI=;
 b=f1621xfI3Iil3l/3oGcbiBhqCPxCIfrOqOLHsNjKsARtvPC5+Padj9NGVNfSi+7Oz4n4t/HHJbu0VKRM9FGH/9TVTuAmWW+60elA/nPNTWLG5F3SQWzGpF4IL3yt9oStT+Xmb2dbLiD/xKirnbtRaKMu4ecx6KAdG/famua5CDs=
Authentication-Results: s5r6.in-berlin.de; dkim=none (message not signed)
 header.d=none;s5r6.in-berlin.de; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4500.namprd10.prod.outlook.com
 (2603:10b6:303:98::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 10:40:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 10:40:42 +0000
Date:   Wed, 1 Sep 2021 13:40:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Salvatore Bonaccorso <carnil@debian.org>, security@kernel.org,
        linux-distros@vs.openwall.org
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <20210901104026.GB2129@kadam>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
 <20210816072721.GA10534@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816072721.GA10534@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0016.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::28)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNXP275CA0016.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 10:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4642a45-1316-4cf6-f6bb-08d96d34f267
X-MS-TrafficTypeDiagnostic: CO1PR10MB4500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4500CBE483DCACC0052F50EC8ECD9@CO1PR10MB4500.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RD7AV9VOvI+sEuHz8ELL+8BM1fZDZQtmHo4vOQvtCrorp/J5i2YxseEzSA4+vKLCtdyxdU/bu6HMiJQ/PpxNALlI59a20xNUNajrZtH24JMjwh+/+xunLVV/UXSUSZe1X2Zu8ngZ3YIPcRhVrNq6aShvd8xBogZYLSapQkEJpKIFdR5KUJO8opFAqV4pN5SkO+D5C7oISLemvuEAM/DLlnYZaes13ypSMnOdUfOuo2+IM4efOyP/36xbUvmIOBGu94IJN/XoYyWtSWacItA+QdMVqOvmGFMADD1n1ewEukaAMCYezgrpHmlws66GNH5qUdM7D376/lB2U9UKMeSAvG5JkCJnZu0Bd0+zKHgWokTDKsx4U4WISDaOVQ8EN84yfvLUmNQvxs8wM+NejJg8IEZSy47vzR0Tz+kCqjm34hE0YntBx93TVJn9eIvmsWUg8Xy0k2LrXKXsU29Re3dsHRMdmEKGCjPWiFhjD9CRgYWf+5ZKf/+PH8cHQYexo1+tllNirWWa8zlJKhVkskuHDLZKkZ7pQrYlS9TMHCMrSXdjuwkvn6/54FDdTSdlxRvOQx7wXy+feCr/0A+fJpiQ21sd+ia4qg+JThn5klg7mA/ThGVZ5Hhn9r7r5xPEmfU9w4ih6X75r48Gg8hGBiaUqq0PNbZa+xwK+ovSa4Hfx1EPJeeGray4n93DaR/UX+qYtrQVlavHL1pFYrRRKKiomA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(366004)(136003)(396003)(44832011)(52116002)(66946007)(26005)(5660300002)(33656002)(55016002)(2906002)(66476007)(4326008)(38100700002)(6496006)(6666004)(66556008)(38350700002)(110136005)(9686003)(8676002)(186003)(478600001)(86362001)(956004)(316002)(8936002)(54906003)(1076003)(9576002)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NxzpRlgIWnPDXka7zsa8Brr7shQ2Ixl5Iwe7+hR0WAFXIroFCOZSPeLmOyBI?=
 =?us-ascii?Q?c7bUfABXi7uI6mPDHyESQi13pnkcLtpF/hXvw3idef0jtmmmXM8CqzE4DWdI?=
 =?us-ascii?Q?6SS35JoA+f2O51InFGginudPg+mv0ZeibYX1/svK8nTtR4gpP4q0FMVqzjd5?=
 =?us-ascii?Q?3HooRswFSjZiEqctkA8jpgXe2O8Qs+J+uT09cQUrZA0sAcMMHacakVNWtEJ+?=
 =?us-ascii?Q?8f7WkF+jMUh1leTaWfU2iIq784dNXFlEgWX4EgiyNY6I07YuJPbPnGjVT316?=
 =?us-ascii?Q?d2oHgJkBm8sGgHxzZAIxON4w9rnilM36fNcV098zBawfvonk3z5obrHojZGl?=
 =?us-ascii?Q?//19c6VWGOYDHs3Dx5pGO1fz7G/UtX+kDKGob02NuzXeViIggbDCzqidSHoT?=
 =?us-ascii?Q?kVJ1ieUcNlSRt2Nixw83K2vCor5UFr+2rUoRfqYBM0baLtRJLGLIPzjg9y8l?=
 =?us-ascii?Q?XZXrjCfkiUVEYbrFlyI162sgS4levBLf8SyjnoWhsbiQ5grN8KFsUrFDhbYx?=
 =?us-ascii?Q?/2fVzs2XldwzpThMvgpKGKAHVlyClARQ6J6ykYkmwPmcq1LmdKHuLOHPD9by?=
 =?us-ascii?Q?jFUF9hlak9DovrFfF1j5xCUfzVmIeQk+gqIzB+C40KG5C7oYoeUHufvBUT3d?=
 =?us-ascii?Q?OYjXMfgWSPb26pAAKVNN4ERVR8ip14Z/N6ancVpwq9cf/BK9NFBEbt611u7h?=
 =?us-ascii?Q?BvQ3Q3rzIn+sIo8RpwrxNbZPNpZ66l2wVuGJyenj6dMg/d3tBUSbbxx6oOfC?=
 =?us-ascii?Q?/F6ZKfMPSWat5SOiFpiQpAjAiEkDMlq31uPOOsvMncLRIzl/8bKK69A4+KLU?=
 =?us-ascii?Q?hwrBVCGqEQDgPVPICoSPXU2dYhIaQYvq2zs5bHwGYsmQF0ZPu2LoGJ8oj37k?=
 =?us-ascii?Q?lEA/y/kf3/VWuwAJWS3usD7mtyOI4g0Wcumm53KGNqxKRFEt5A8sj5bj9tpG?=
 =?us-ascii?Q?IMj91Q1KPWg2V0oNhkWogFBsTNLMQ2J0Xd6PpsHk5Xn4gERdxZlehaIplNPJ?=
 =?us-ascii?Q?YQygGH9R7tH0cI75VPteTIvSmp5pvWdyWJa7xzpwCkmv2EQmwnSe1LHz+6M+?=
 =?us-ascii?Q?KItMFkHmWo8MstegBCdzQdYBBovGkButR2vx8BQWmeeBRhLcsW/++W4WM5Ca?=
 =?us-ascii?Q?EiQEil8vpZY9AYgLtd2m3F4YNC9oNhBmOyBlDyjtvk46KjQsBZbAMRcGIKDb?=
 =?us-ascii?Q?BhAJj1ltDqyFaAhtr/wTETrlIbwOfc5G38Ahm2mjp2G+8sPf+ZB9F6h1x/aY?=
 =?us-ascii?Q?yqTxzGWSqveyOn6T31iQS+gwb9ausNOJ3Emp3Ia9b/tnm/C/kyVBx9uZH0th?=
 =?us-ascii?Q?Q+Z5hHQkotV0ERK+StIlfd6q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4642a45-1316-4cf6-f6bb-08d96d34f267
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:40:42.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5ds5NWbXLf3mbLNiCwXvL2V81D3RL3fKDmkynPC4tCgL+WhPpmVjXGskwnKd2jPkbDs49YTSEuib+VdW/xMqmlXC9oRKuDIJh9IMjOPmzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10093 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010062
X-Proofpoint-ORIG-GUID: QtbdajY3PfpbLfopBHJPd21p5siYB42s
X-Proofpoint-GUID: QtbdajY3PfpbLfopBHJPd21p5siYB42s
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:
> The bounds checking in avc_ca_pmt() is not strict enough.  It should
> be checking "read_pos + 4" because it's reading 5 bytes.  If the
> "es_info_length" is non-zero then it reads a 6th byte so there needs to
> be an additional check for that.
> 
> I also added checks for the "write_pos".  I don't think these are
> required because "read_pos" and "write_pos" are tied together so
> checking one ought to be enough.  But they make the code easier to
> understand for me.  The check on write_pos is:
> 
> 	if (write_pos + 4 >= sizeof(c->operand) - 4) {
> 
> The first "+ 4" is because we're writing 5 bytes and the last " - 4"
> is to leave space for the CRC.
> 
> The other problem is that "length" can be invalid.  It comes from
> "data_length" in fdtv_ca_pmt().  Added a check in fdtv_ca_pmt() to
> prevent that.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Luo Likang <luolikang@nsfocus.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> RESEND: this patch got lost somehow.
> 

What the heck?  Someone on patchwork just marked this patch as obsolete
again!!!

Mauro can you figure out who's doing that and what's going on?  The
first time it was marked as obsolete then I asked about it twice, Greg
asked about it, and Salvatore Bonaccorso asked about it.  But all we
get are anonymous notifications from patchwork.  It's a bit frustrating.

regards,
dan carpenter

