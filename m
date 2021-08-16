Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0DA3ECF58
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 09:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhHPH3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 03:29:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53764 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233540AbhHPH27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 03:28:59 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17G7C6Y1031191;
        Mon, 16 Aug 2021 07:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=pI2NBjDZymVQ08Q6XBhkbcjEHFjSutICoQgWSzfZdDA=;
 b=NNpbku7J1cKeD0wT2f7z+QkxY1o+68vbD3KmluN75X0SE4aym34WO9zGMNjutgqdegxJ
 pc0zDFFCFCcWvzDfZk2RI3l9idYoNbWB9VC3n7SvPm5MBTq7Q/ODD8c5mpFIMegh8yo7
 TI7aJvsVidcXAtEqPdwl/+vhb18h7w5n/G4Mal6DmpuTIpny/+7qxvoqzvWnjAqGGoJz
 KD4QF+qJGbzF/NSpWb6iNXUtm5hMbk1YTs0HBtXGV7tbVpUJJV1XSfmoFD7pCz4iyDos
 6nOexNL6XM81FNFX7hidzaavq2MDd5NNjYLOpZMmuBwLt6nDkskz0NphINysC25bp+wZ Cg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=pI2NBjDZymVQ08Q6XBhkbcjEHFjSutICoQgWSzfZdDA=;
 b=eKuP6/DX4S66SahQQNd113UiGETITWesg6l2iK6hQuEwSitIELMDTwZfVPOgJZCWyjk2
 qnHExmwSRiEt7b5K31tV7KM37CsbUmaKW/O3l6AEm7mUWmFZl2HoofU98xbcc6jgnCHV
 NgVDBXbahawT8Yz3YuFERn6J8c9bJdq04XWyocFLrN0ONOqbUWARObmiW8ZDCm58Ou4P
 KvV4lRm8yHX70H49CqIFNaj7ijRanGnwipwC+JwEydidBTXcp7tKcl3EZofW1QwT/wvu
 kUQMc0wgyxb/nfPyM6GdQlUhPSJq44SNpTMFPQokdV0tvf7OekWOlEtuOudE/6y4A1Qm uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3af1q99equ-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Aug 2021 07:27:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17G7AnqX037222;
        Mon, 16 Aug 2021 07:27:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        by aserp3030.oracle.com with ESMTP id 3ae3vdbmc1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Aug 2021 07:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3ISKM6LlzakuYViFgHd5zU0TgJex3PVplMMCiWYVZlqTRuXewTn8ug6EU2w2UTcdu+I0mtOz6AS/H7ETNGJkGdicuaUgY/w8XfpJi2Pbetn3hzzR5XUbwlMNP/LVbIM4CtvTux4xKHKlmLX4Uk2tRrxCn+l/RggwiYE+0aM9Lbt1iz6itiraZgrTmKSenhr7d2uPyHUZXJck/XGQF3MeKO5J0lZcKMotoxPxDTUaP9/LxMrIz5ZrGzrjqsEVxDaT3KyrVmYVTL/DN3SIWs5yxA5CqAQzNk3gtDkqlUdjTkgogMScXJ5VfGM3q1yXl2Zxm1SHN4+pBQC94jarGORSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI2NBjDZymVQ08Q6XBhkbcjEHFjSutICoQgWSzfZdDA=;
 b=EOmx2VgECVfQ7UKlnXRkTBTr0Na5oMRl3LcwTuapvBvpmfvU85sezGdtlJKliNzQIT9U0rOE8V1tDuUI/6WBgjD5oGgEKkixIJSAxQi0rkiTHP0Aick7pivL8xw9Zm3IHRoU3oGe1J9LKWvMpNlcO+uzgssKU3UuvdTNqDQD0p+mRY0ifJKpoL1nsu1ZhcqBieOvNavriuobUxafq7h2mNiqYnXZ7eSd3Rw+n07FXJlvqniJ+afjpdOG7c9xKoAdrmVmb8n+1h/VRQqnKWpRTM3CjLRQDxYCBo1VKX4Zei4QzIVFeuf4fFqST81XAJj8LsvfhzQhI5j4oQuvFmMs0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI2NBjDZymVQ08Q6XBhkbcjEHFjSutICoQgWSzfZdDA=;
 b=H42ddCKPjAeHH0h1k41cB7aehdfiL8ic9nYisZOTwjSoagQTI9ykRtSuxjIbvp9CbLZGd4QLRtSV5YENaDU1SlMTsvpW8pw9ACF35zmEIFmfdgrtcn3//zzwJtMlOd83kkkGskmQINatq+sF0nJK9cqw7Tp26jQVVkALwpeur3w=
Authentication-Results: s5r6.in-berlin.de; dkim=none (message not signed)
 header.d=none;s5r6.in-berlin.de; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5571.namprd10.prod.outlook.com
 (2603:10b6:303:146::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Mon, 16 Aug
 2021 07:27:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:27:34 +0000
Date:   Mon, 16 Aug 2021 10:27:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Salvatore Bonaccorso <carnil@debian.org>, security@kernel.org,
        linux-distros@vs.openwall.org
Subject: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <20210816072721.GA10534@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRoNTX3Krtw9NdkI@eldamar.lan>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 07:27:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0a4a6e-2c8c-4ded-6516-08d9608750d8
X-MS-TrafficTypeDiagnostic: CO6PR10MB5571:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5571108DAB5EB88AB2BC26DE8EFD9@CO6PR10MB5571.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1pK3tSGbbAl07JD+0S1qBQGbd5HPuLi/QAFmS+OBW/3bAkb0yM520Ov2TOqQe2wj/MGP6nJZj18d9Pc9bqp7rTlsMDclyXctUR7hapPJ9kMKgJJ5Myzi3K/A9HB+k6W3bA5Wee8bIXH0wR76asCwX64U/ACo6Rdl9lELtDb0oS90nBiJ9lOdKEIFRuZHndt8AzQwZEuG/KDfn7B0xfU+V+/+LJs80qVQV7uFqSWYl9Uxvqmjx3ddmowWzqsrWCHg5uxainVoabvejvPtcgJQKwZYXYSmg09Z+17XkwJ4tce7IDsyEnteLx4vaA8wvdkVfWLNdDKZocV7mri/XA0bUn3ibAA3JucCggiZuAMC25uDIt4sFpOC31r0F2dMVRQhFzPM2vI6xnYu2RDOjkPATwhTpk+coMAa6UJhBJnBwkApFBldKxpqPTw2FvN/A1j6YXYIG2uzSKqC2GCIY9hKC5Rcv/W+2mJQsgXwi3g0sHP2jp/MC9NE9su963hwHI3NXA384VcobaES0mqA/BMyIca0IDIO4l2TDc9YzckvrjQLqT2HUi1VpGYJyLBgvKsRCHW2rSDQzxmeQm4ydWseeUXwnyl2y44ceD4IZQwYuUD7XV88wXlUV5FYjlJu1B4hvkMxwWGXTACRrq5jGQTiAsFvt5z8ZOiYuraFnpRBJ7NXdlMWAn+lLlgaMkHwUTPx7w0umpZ7s8ZBv+LRKIX9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39860400002)(376002)(346002)(136003)(5660300002)(4326008)(478600001)(316002)(38350700002)(38100700002)(26005)(6666004)(1076003)(186003)(8676002)(52116002)(6496006)(2906002)(8936002)(54906003)(110136005)(44832011)(66946007)(55016002)(86362001)(9576002)(66556008)(83380400001)(956004)(66476007)(9686003)(33656002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPBKxgGgTzxyW7jf4GDXH3aHyEBfzK9dvyGscbGHXycTc4buMcdRi3r58VYx?=
 =?us-ascii?Q?WLGoFMmXXTOS9KFAhJfVRFetfU9qOFJ6A2Ltaik+wkqR+OajjNJO9dkPyS+k?=
 =?us-ascii?Q?qYsmoff6z5CDBosabuSBepsFplFN7fhQ+UsZ/dXBioksxWl07GrpoPKrtC20?=
 =?us-ascii?Q?zQm2rQHrhtXq0KhAYcs0oqlueBKKlW6o1ntKauf18N+lfX9VL+PfKQimf4Sg?=
 =?us-ascii?Q?QoEnTxkBOd/aqytt74fec09T+c5M9Vaq83e5bqDSAFwyonQHq/+fISQAp3Gt?=
 =?us-ascii?Q?MR9NZs1aGkvraMe5fXQa/Mq70d/gqw2fK1H6/WSjbr99NNElNk9N77/wo9d6?=
 =?us-ascii?Q?ECDdBDJaTwFMufyPIwmvdiCXpQ6fCMnVPup97QYVjQmfDtuTuU8qGyY3UQza?=
 =?us-ascii?Q?c1tKdZp3VZavCIvVlmmGrJ2Wrj/TjuLri8RjlYBG/7pMp68CB/OmLV+8kFTt?=
 =?us-ascii?Q?fcdo3Wb5Ci7mbVrkRvEhxwgMSd628gapEuZNMmpX7p35qLPiboa4uAEqushQ?=
 =?us-ascii?Q?o+b4LYr7KWtohkxOA8c7zOntpj08Z/iTJJzo6dKUzMYbFJuZQ5B1lg0H/0jb?=
 =?us-ascii?Q?7HXodajh5M6C6FhXgCveKrvqjE3owkNJ9egaS2uWT24BTDJnicYi2GrpfwWE?=
 =?us-ascii?Q?P1QZXqB7wC03i4mezJI4/iQdWnz8iokk1/3TUYV+7+ZpC25XEPtCvUc8o+LG?=
 =?us-ascii?Q?gukUbtx7l5XrHYn2llEqRn/9iHPy/Ltcimclrwbc8NabPJbq2GQn7Z5kOOmB?=
 =?us-ascii?Q?b0IJkSlDENap/FG/CbrW6qRmgegMyoE3dALfze9ifXHvhGolNvM6R6sS+SAv?=
 =?us-ascii?Q?/tYNxUckFx6z0N9/eUVcBCzd9CMF0GFFi/IsmPgR9YgmVzaCKVm6kOgG28KR?=
 =?us-ascii?Q?cW5l/+Lt4CcWZK4ow5+NNZ+2rpAEtybL7oIpSqVIDM8gfgWsdWXpGtHdWVP3?=
 =?us-ascii?Q?CKMIgGfsNRJ4J5zlI0ruZGv/OXrroJPtRzTzrtzemnBPlyCnP53pS0GMZODR?=
 =?us-ascii?Q?WgZ1O4ivDiUvOZd5aM7oh2gtQjZDmrAdK3G8gx7onSEUJIqzldZbR0GkKvr8?=
 =?us-ascii?Q?Whz2yVT9CxYg90Oap8l1Lt0Z25hc84MEgVkkpjUCpVgKMLj6Igr6VFoh9ofV?=
 =?us-ascii?Q?uBhtWpuQG3cKbr2sCopCduwlRjHTy4s4q/ICdwApQ5AJ9qaU9xv3JNr+Wcth?=
 =?us-ascii?Q?XTwE2okEVV4PLtOC+6GL5H6WJCi5uefFBp5XZtbucbzcj+Gbt7rlW/NonTPI?=
 =?us-ascii?Q?XjM/A6UeR3O4qQbmX5GYzzgm6AtSP4lk5+HUVqyULGYVXDKKGE/G/R0sYRlr?=
 =?us-ascii?Q?T9gWg4fAfjQUxqVB9AuDGGFH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0a4a6e-2c8c-4ded-6516-08d9608750d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:27:34.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCtdTC2RWqbfNQQEHaVeK0IVJ03TTdSgSMTY1AWmJi2KBmnspRfKHJ2lGeLDigAzPQhMhAEzyf0T9yPMySSZwwGIRvTuMdAO+0Yz5gr350U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5571
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10077 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160046
X-Proofpoint-GUID: sfZYyaOmnaLHoFTKuDSnKnu3t8-AKPVv
X-Proofpoint-ORIG-GUID: sfZYyaOmnaLHoFTKuDSnKnu3t8-AKPVv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bounds checking in avc_ca_pmt() is not strict enough.  It should
be checking "read_pos + 4" because it's reading 5 bytes.  If the
"es_info_length" is non-zero then it reads a 6th byte so there needs to
be an additional check for that.

I also added checks for the "write_pos".  I don't think these are
required because "read_pos" and "write_pos" are tied together so
checking one ought to be enough.  But they make the code easier to
understand for me.  The check on write_pos is:

	if (write_pos + 4 >= sizeof(c->operand) - 4) {

The first "+ 4" is because we're writing 5 bytes and the last " - 4"
is to leave space for the CRC.

The other problem is that "length" can be invalid.  It comes from
"data_length" in fdtv_ca_pmt().  Added a check in fdtv_ca_pmt() to
prevent that.

Cc: stable@vger.kernel.org
Reported-by: Luo Likang <luolikang@nsfocus.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
RESEND: this patch got lost somehow.

v2: Change the limit in fdtv_ca_pmt() from "sizeof(msg->msg) - 4" to
"sizeof(msg->msg) - data_pos".

Oh, another thing is the data_length calculation in fdtv_ca_pmt() seems
very suspicous.  Reading more than 4 bytes in the loop will lead to
shift wrapping.

 drivers/media/firewire/firedtv-avc.c | 14 +++++++++++---
 drivers/media/firewire/firedtv-ci.c  |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
index 2bf9467b917d..71991f8638e6 100644
--- a/drivers/media/firewire/firedtv-avc.c
+++ b/drivers/media/firewire/firedtv-avc.c
@@ -1165,7 +1165,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
 		read_pos += program_info_length;
 		write_pos += program_info_length;
 	}
-	while (read_pos < length) {
+	while (read_pos + 4 < length) {
+		if (write_pos + 4 >= sizeof(c->operand) - 4) {
+			ret = -EINVAL;
+			goto out;
+		}
 		c->operand[write_pos++] = msg[read_pos++];
 		c->operand[write_pos++] = msg[read_pos++];
 		c->operand[write_pos++] = msg[read_pos++];
@@ -1177,13 +1181,17 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
 		c->operand[write_pos++] = es_info_length >> 8;
 		c->operand[write_pos++] = es_info_length & 0xff;
 		if (es_info_length > 0) {
+			if (read_pos >= length) {
+				ret = -EINVAL;
+				goto out;
+			}
 			pmt_cmd_id = msg[read_pos++];
 			if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
 				dev_err(fdtv->device, "invalid pmt_cmd_id %d at stream level\n",
 					pmt_cmd_id);
 
-			if (es_info_length > sizeof(c->operand) - 4 -
-					     write_pos) {
+			if (es_info_length > sizeof(c->operand) - 4 - write_pos ||
+			    es_info_length > length - read_pos) {
 				ret = -EINVAL;
 				goto out;
 			}
diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
index 9363d005e2b6..2d6992ac5dd6 100644
--- a/drivers/media/firewire/firedtv-ci.c
+++ b/drivers/media/firewire/firedtv-ci.c
@@ -134,6 +134,8 @@ static int fdtv_ca_pmt(struct firedtv *fdtv, void *arg)
 	} else {
 		data_length = msg->msg[3];
 	}
+	if (data_length > sizeof(msg->msg) - data_pos)
+		return -EINVAL;
 
 	return avc_ca_pmt(fdtv, &msg->msg[data_pos], data_length);
 }
-- 
2.30.2

