Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67D74289EF
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 11:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbhJKJpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 05:45:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14656 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235587AbhJKJpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 05:45:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B8pe2k010263;
        Mon, 11 Oct 2021 09:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=x95UD3qWjHETh2VTqtmzPBThpoEDQ/3d+Hg38L1sNrU=;
 b=KIeegkgA+x+WugXnR3mN1AlIEEJAs0c4xLcW58Du1FS9PVkrxAh37dae3Hc0EX2eUkic
 277iPYppSnrhoVp1qzRw0gJpKR7xge6zmOQWhqPwiAuhJQuxYpjn0gwEwQ6tYtgPODmF
 SrZVr4AwX8NTZWWnPuzFvgtCDYIcaSz230FTOx99x07KF0oaUilQb2V9JyeoiJk1J5AO
 iJPe7JAxRRunupF0WP10FDEaqhYAzfg4l7yDojgDQ5rAi5yXbjcQs2Bh7WTe0U96l+qV
 CD7qE/UhvwrU0DrIzXzpCK9yj8VeupnXdzbqX3V6R8b9qXAjG4wBPMSIu5d2NTcGHlVU 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bkw3j33me-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 09:43:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B9ehlA016333;
        Mon, 11 Oct 2021 09:43:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by aserp3020.oracle.com with ESMTP id 3bmadw0p6x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 09:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm9WgNf/Se/mvYevsazGM1UsCwQ/3wa4x7uSFJocA2ET4G+Fl2pVfV34F6MeoybeNOOhfcQ4czf499rjXM4+wsqWMLTN1wEVyOJ0glxYjjLBg63tD8Me7zN0klLQp937KgptA2CzMTYp5MtESyEity+KHEvv3A9knqi+xAuCQ5RuSGZdgpbKB8KLBcrKbcAz7MSl95nD/gflM433HOALZCYxb2q/hhSVokHvevWtmwySiVKJBDnxZ5xIUyLJeUSvxT+BYu75eUquPdYCPT/55tFDa+8hGdJ9+0PLWFQgqxW4MDHm5kXtn59F8h5D8Rb8MriiBmfxgoW1wKtQHw6GzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x95UD3qWjHETh2VTqtmzPBThpoEDQ/3d+Hg38L1sNrU=;
 b=XAszLsPaRyaTNdaSAtmJ0k9vyk1FFaFJGVEOP/dfloOXQEUoexiTl3ogv/hxK7GgNhiVZ9VGznsRkx5Jr1grMQQfRG/mbhDBhUbGENF129r+6NQOJK9AyJQ2U7Pia6XZDUsdnvgdZ900SYz2cceld2EhHWHNfugoPQnT5LxP2M+yBfiDSAyY8m5uvQ9LluUpsZzbjEkCLr13DpvCXIPjyzk1sEl66ezxQKY3ks4jsGK4aXwe1u85pWGN93aScqBsMrsF3nVhMUTfR2/uO6o4zqrGZgKtxX6Mcfgv/Smx777Qeey5TbYyK/YDtWKFkBf6WBkpvZZITKCZrWnHbKwEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x95UD3qWjHETh2VTqtmzPBThpoEDQ/3d+Hg38L1sNrU=;
 b=cxsBnS1H5fXLPcKgd7rJuo4rB5yaWCwyCsfAzOqAqcbL87kb1447TDhPO5nx2aUKIdzwPQVjuNFbzXxUwBxBwMJNXd+KwS/oudGME/nDDA64aH9WPo1pYWN0uDE75Zj9Z2PcAAcW1Nsi4MyE94W5/lfG6vyoQvXC1PjkxfP80vU=
Authentication-Results: debian.org; dkim=none (message not signed)
 header.d=none;debian.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4546.namprd10.prod.outlook.com
 (2603:10b6:303:6e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 09:43:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 09:43:07 +0000
Date:   Mon, 11 Oct 2021 12:42:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Security Officers <security@kernel.org>
Subject: [PATCH] media: firewire: firedtv-avc: fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <20211011094248.GO2083@kadam>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
 <20210816072721.GA10534@kili>
 <20210901104026.GB2129@kadam>
 <YT39LBTgGL/b/V5N@eldamar.lan>
 <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
 <20210913152302.76d57784@coco.lan>
 <YUeFVpGsWFpSPUsM@eldamar.lan>
 <YWPh9zin9JuQinwd@eldamar.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWPh9zin9JuQinwd@eldamar.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 09:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5877641c-eb9b-4746-a206-08d98c9b8774
X-MS-TrafficTypeDiagnostic: CO1PR10MB4546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB454640A0AF26D8E22DF8E3608EB59@CO1PR10MB4546.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7r5r5EY+EsuHs7mhlAarITL+x3m8BKosQ8JkWWFZ3yh43Ue18ilbRx2u7tURKWQWFUarTlnmqy9zVzBsUVQsHEbrGnzaXQSJq+8cOLKObOMAeDgJ7GtoPaNhuzD2kpGbuZDTuNyrxeNcshlGdkwD4Nmz2IdMMw2pAbRdVJw0RnHPCE+Fp/muszMl3VQcytfJ72Nw6YhsSrmorsUWDdUZ6jZ3NP0hg8muy9708tSQd5OESZ4rRe64bZYhlq/TmyLqY5ictnI51y/iI7hHxFo0+qDBC4xQxa+34MNXsITHzLEskP6QkDQ/EcfpVmHRvRnk4f4dRKWwf7AHzju+2MJDmzmppX2hnkNQVOfm39OxyCFhRsy1Q5FevHrje3fmrHwp2FuaLr7J9OxZtOON/rEyg8PGBRwoOqYdFqXiDqvrp1Ha2DMMpAoMcSC4ZVHntHstbVzuwyI52lKtoAyFJDdaApUE6/4lhuH0/ONWeQIUL0K5AtUyOKxlPwPGF9X87aOCTgobX6rl0a1qc37aD5kDeCIE6XeawBpofbp9hAYlo7jiEyOwEX2w0lXD9rtQvT6o8Ntlp8aFbsrAY6Ygj1czVPd98EudKg3iiTcq+9kkwUuaulDmk1AD6LvdCiGBAe24K8+JtqVhdYkaXl5SJdN+IaRtAeE/aWp2IFcF1cIN6hsON/b5tpDWhOCurz/DzmBv/hlG0HY26mNh2bxAKAZKQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(33656002)(186003)(6496006)(8676002)(83380400001)(2906002)(1076003)(52116002)(4326008)(8936002)(66556008)(44832011)(26005)(66946007)(9576002)(66476007)(9686003)(316002)(6666004)(956004)(7416002)(55016002)(38100700002)(54906003)(33716001)(508600001)(5660300002)(38350700002)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSKygLVm/U3TqBcebaf8YBn32ay4ykYO5JkM9hSZF5dXs/7oQbuzUpAOpdp1?=
 =?us-ascii?Q?sofDbYEzEC4XzmO1wQCzx549WHEIDrKKhZKxLisBpQhRtClU1jeKdQpTzKAN?=
 =?us-ascii?Q?3W0kllbF/pmE6+nIm+A9vnROrvpWIl9iCFV+Ao1UoGILMx2i9P0/p5G7dxji?=
 =?us-ascii?Q?UB9eisp7zzmvWyFx6k654cUpnFyYlrd4viYD4y6Jct252DQ6N1PisnTwLnGX?=
 =?us-ascii?Q?2vf7w3lTKWN9mi9hxcxXLhKtVZzYG9lAN2tKhuIFAf+rwYXHqNmCM4GjoGzR?=
 =?us-ascii?Q?dHvPMSwFNDCJts8cr8WE3swRwXpS9opKegrrtJVxF42raDLoqpPt4zO6oP98?=
 =?us-ascii?Q?dZkmrkHtN9OzDSlFFKZdgO1w458Z07H4CvzxFPQg+NjxICTDY4dRG4MXVPk+?=
 =?us-ascii?Q?A/TUJidqAH+jUBWy/2K2ahuSZz3q3izM7r0p3n3CrAEaeJW5INmvbBFyL/Fd?=
 =?us-ascii?Q?6yGftqEEBBg+xuBe5YV7WkBJc7j+QhRiJpUqXOhO43HgzWUJSNXg7SY3qeZE?=
 =?us-ascii?Q?W+uL3coAJl2pbiu9s2g5Nsw7mwL56uOg9ETPAb4SfjVHd5RUwtWAamhLixpD?=
 =?us-ascii?Q?vlKYVteolcY2ivogkmE+WQGibd1/QSuR45fzPuWqNcbtNrAlsk/cClEcvy/g?=
 =?us-ascii?Q?2kyucqR70d2oHsQuCddaKZSe/DcCNdymBFdH99GApNHXsjBVrt0801K+lVxX?=
 =?us-ascii?Q?yLVL/+kmAHkdQ46Ef9YX4AI0UiNTFbamRfhzz3K9FQuPIgY6DlkkmuFTfE83?=
 =?us-ascii?Q?IciWqFoNsIQPOoYn+cDloCqEr8yUvEXxZr8kBwqMvTn9tLnaOVFtP9PLl3LN?=
 =?us-ascii?Q?uImoOG6HYbyjyBjhyoyCwBs1oNGszoP2MekkYiSF3Rd0YQgfzfaPg8mOjafT?=
 =?us-ascii?Q?1fvQhmz4aorfNYN8MVpJLQe3AA3QJ2DaKwkhl0Fzqb/lXJKUjjDVnAbmQ0W/?=
 =?us-ascii?Q?hJJPrHoUYMDCmI3q6CGY3M2rFCEpMgBF2fijdBipKk4FS+9xlf1x1D049pW4?=
 =?us-ascii?Q?/Q+OC3r2IU4/cklanIFhx8wpPEpsKjUj9QM8N+yWRA72f6zjA0jiTW2ou8BV?=
 =?us-ascii?Q?ok9zd7+lQ7EgJscJWIbUOiDGAAhfGyWlDlUHldkOeoV0777cc/COFLDiKPIp?=
 =?us-ascii?Q?KbGCLNBy0VkCzKDM3Mav31hC633G7epws3QUVENw6T8KN6HyeYNpCHwZDtRp?=
 =?us-ascii?Q?WMNHTA/g329fD4tLvflUZy0/biu0Isb2Tc0ER9enMdMUtuPAOO5g9KZWcIQQ?=
 =?us-ascii?Q?55NDUt5ol0iKeV7y3E3Aazuvs3yOaM9DyCe3q4AlhRN03vAsD9G+tsBphU65?=
 =?us-ascii?Q?k2AnFBxKDGg1t+ftvG1tDy+y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5877641c-eb9b-4746-a206-08d98c9b8774
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:43:07.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Et+UZBpBNYY1yO5c6V0VsI+EhOQvhZclmRe+0d2EcduakVIyRPlGiGX48J07XHBaUA5zKVFcpfqTvzTVYFgjfICYVFy7Hs7QVjJ+dUzykGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4546
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110054
X-Proofpoint-GUID: CQLZ_TShvT4qqCmC3lLU-1FTc5E4tCnG
X-Proofpoint-ORIG-GUID: CQLZ_TShvT4qqCmC3lLU-1FTc5E4tCnG
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
"data_length" in fdtv_ca_pmt().

Cc: stable@vger.kernel.org
Reported-by: Luo Likang <luolikang@nsfocus.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Cherry picked from linux-next.

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
index 9363d005e2b6..e0d57e09dab0 100644
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
2.20.1

