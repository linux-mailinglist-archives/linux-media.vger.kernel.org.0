Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5C73CD1DA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 12:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhGSJpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 05:45:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43652 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235172AbhGSJpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 05:45:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16JAKUif004938;
        Mon, 19 Jul 2021 10:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=LG04xjoFVUyRtMYG8MeLeTmjaabmR/8hlS5yMCqeNiQ=;
 b=J6PIw2iKUCa/3xWxOfh/3PwEGAtZy40yD7g3Bul27fWqtzj6vrs4edlZiUejxbhHtab0
 MgOTJwDlp070Gbo3nClMkJsKWNGtHEKnbdNFwSG+tJtc8slCWRaw+p1cYEX+w/pvrwcZ
 mQBBC+lN9Rgi0YqWUPCwe3alnr7wkLB1puOrstZpFp26akcnVcMw9Uii9bpBDA0fechy
 MzDbarCDyy2GeohSMUzUtTp2PihBpXCQV/p4nMEnYf1XaM+NZmBdPGuqUepT1IWiL04D
 lARATqPBZZJvIl3KULTdcV4jl9u/lFKl0qGEnpU7wdlS99AmhKHmYIcBKAVgVcc0wkvj DQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=LG04xjoFVUyRtMYG8MeLeTmjaabmR/8hlS5yMCqeNiQ=;
 b=NoHSnXiFGu7CFvtiXVK7ZwP8MmZdgkCzu4IPRVFgFJNpNpQzenI0kfUh4e9zILkqe9Rr
 aMJrbUYRH1NJaFKR8/BCV/QdfCC0g3k/Jsv/Oegt8xozdnujoEvc1LbhsPeh0jKbrzG4
 LS7NlR+ouHzmQagFU8oQLQpBoRsY/nR4VJ7qKJlac6PaTm44QoYVXBHfb1O/oEq3uzLj
 HrDiVWoCdJmpLCMNAtPPsGqqdVcijfqpID0kAwyXTLkxMxsa4RqgeeyGAXriKbjxa2cd
 XfbcetTzaFfvwzCHXfO3qKoSY0ZqeKmtsK1UZ1LdylGmwVJGSbrmlRcYS/sQt1CPbQRI +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39up032qx4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 10:25:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JAFBIU179651;
        Mon, 19 Jul 2021 10:25:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        by aserp3030.oracle.com with ESMTP id 39upe81jn1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 10:25:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D39DIHf9bFCYAUbSKoKooRDearRJo0F/WOq8rNcl6URv/ldfQP1GHRfHzYZn+Jhd8PVk6IYMH/CY84fCZ8LWLTh7LDrfMt1P6pqilR02+by+DgV+wEH/PQd2F1/egoupLXTRE+HaUqyNCTkLtPclX72BL36u4S6v8LVEU4+vIx/0U3WdXNpZWLs63a08zbBEas31rbOyjYWo6dkSeK5e2d2OPlUSy3SF1eVeJ6xgiHd3l+lm7fGZ2EkwHtKFxIWPd9fna49FgIulR+LfVy4DstxxqwLrHOLPkD0N1RQcFLyHg0j63Rso5GS9ap41YgH9P0yJPk2XZzcEX2oNr7+Cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG04xjoFVUyRtMYG8MeLeTmjaabmR/8hlS5yMCqeNiQ=;
 b=m8aqXXvd4yKnZiKi9TNdYy5UwWtc3arhwbvXSTvY8ihR3U009bSpSJskMONRufQE4lSYt6xTO0cs3WqZYdCMkF6WXBkHnmEfhKOPCvm1CpSXsRHDwZDh+yRl74tAYKHb+JMOF6ji24PkFCgJr2t7uXarFob+7xoSSjge6XVTmmzILHD1aKiQ4RsMdmUpgL8Oy70sclPWZrTvHZa3pbOlPdswolQ5+7lU7uDIgfsc7kvZ1SB+z20d4i2SwQEOGz3BCNKeuPYvPYEAfMpcS3llEYUUxAOcKmC7tzdPNWLtfo4rMtYmzYA/m8xcqU3R/j1V5BMpxLtXmIXXLHijbG/abA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG04xjoFVUyRtMYG8MeLeTmjaabmR/8hlS5yMCqeNiQ=;
 b=KRG4SlDpxga+2ehhMQ+GeSG+dxzzIuqrEfmSHnJXGZfXc3jj4oM3uUfkcTZgF7TVJItsIKfbtJ3GbKPh9QJyItbaPtccRIlHqEi7Hz1ZTyiik1GKvVr10uC1o6sHuG9IA2w0whgemrAIChykAIHSYmEdcLQTaH7beyOO5qGbiSU=
Authentication-Results: s5r6.in-berlin.de; dkim=none (message not signed)
 header.d=none;s5r6.in-berlin.de; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 10:25:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:25:56 +0000
Date:   Mon, 19 Jul 2021 13:25:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] media: firewire: firedtv-avc: fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <20210719102539.GY25548@kadam>
References: <000001d73031$d5304480$7f90cd80$@nsfocus.com>
 <YHaulytonFcW+lyZ@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHaulytonFcW+lyZ@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:25:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04a7254d-2590-40b0-3f0d-08d94a9f97bb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16160E035F2DDC6BDE8CCB378EE19@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ADLspcFVNkXJ152htZB9AlFJCEBjew25Ss+J8HtHLwTFNwNzOrUyIvcPjeH28SZhpLK7+wJr8IY7QjZzpecUUj+FMK0tU/m/tKxTzFx9NNG5hwuyz9lOo+PVa2o9T51Fv856mNvUZQbcSYw2N7SoF4XgObMV3EhXj8SWUesaMh307jiqp3nHhAh07qJwPNrgEAwsgYQvWSHE/cp+9PSHo0EpfMww9nqE+6wpYJuzEXnwNm7AincJzdJoeR2B/t/MhgzNzRq7OjX7ksdkmXouItC10rmGKtI8F1z0HyTBLSXbvcbzDKV59LbC5hxJwaVai8lTZiFsEeK+YrwbLYdGRCTbpP0y4nMeSOEZS3xdBGvUWytWp/Jc2MOvdE2bo58GnrQpz4ldAkTE37NhVE1CpJBtlxVtKiuDeU47IeRbdfumOU94uPouKyYp6NtAuoDpxZxeQCQ9hngJ5+q8fpfNFJI6hpeNOFz7qIyg4Kloa3xyrZ1My2fPkxifjMTkHrZe1NCCKgwgRB2DpFyxEC+YiJMmXS3K1ed86AgHgEcZ4ERalR1nM4ESvtb7IxUiU/o3rQLcJc6sLBV9wQiGQ0bUzeujEGhDBQpVwjMpShHuxc3+AJKV4uhEpjP0ZO1dcY2SlH1AbcuVrPW5OgmZAJJiVX7TQJ6Ow8eMXHKCY4uOYKG3SYplFW4NrM7ElouuFW4bSovW56qmZS9GcCHX6SLX0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(478600001)(55016002)(1076003)(9686003)(5660300002)(956004)(316002)(4326008)(38100700002)(38350700002)(2906002)(44832011)(66946007)(33716001)(8676002)(83380400001)(33656002)(26005)(186003)(6666004)(8936002)(110136005)(6496006)(66476007)(52116002)(86362001)(9576002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ssd8B1aU01Oo4eCxyo9ZCXoKcTPGZsCnST+bQb4ltkvs14X6b7acNyS8uk6k?=
 =?us-ascii?Q?mt3B+XObhUnSHM/FS084O54lVrjDZ59aupxeK2bl5X8+7mP9EOC1VXMNAns9?=
 =?us-ascii?Q?O00M4C/cIyG2H8Pnp9eXJ/XM2fKXFeoozeQFEnX9uq7xzXmxG7kHAVI8sEEl?=
 =?us-ascii?Q?VJXPaooL58zB0jSM4EDQtlopJ1R45JylJZwDz0H939qZYJvhwxiNmEUCT4/P?=
 =?us-ascii?Q?EUHikduxfEQNz6urFAUGZca2R1cCOWpUpsIC/qBtIjbfm4UkubXDjFJbw83g?=
 =?us-ascii?Q?TOaQZwvcUMQVyzhg2rwn/TgHNr+3zlbZhQvKDfrESW1pC02BbTvdH1T8u5SX?=
 =?us-ascii?Q?73LkmwSgiyZxdwgW7HLUmyasHgDSr1SBbR983mtes4/UZpiE9CdBwX1Wxm1o?=
 =?us-ascii?Q?jdNNA1fxvZnEaix7ITyIlPwSKRg1tf42uq2rZCqz/c8F/8kniRG8op6GWXVB?=
 =?us-ascii?Q?giIFCJ1AcvCMolNOV4q1hV3GavbtLEbVunMVTEPcZGiDPTxgy49kBemNjooa?=
 =?us-ascii?Q?IHwUpMy0FwYYlrLc97nttZcryUdFAUEuK8+CZdOLw/DGiibKuuHHCWDihZAt?=
 =?us-ascii?Q?wMVsDO44ynVcRG7DorDwVKru9KEbJNSpI3ABNKY41mBi8i7jchgkGSjOAIcn?=
 =?us-ascii?Q?69EaG7t2PzkagS62pd3bte2TrL6DAkLQlLrKEvJWOAFLQXGYAa8KA4ag/IWr?=
 =?us-ascii?Q?Fc5bfwxdbIVRhwLZrln3YOxs3nLpSS8wfMnTxgln5AFuxVQxf2FEwm3OnRSS?=
 =?us-ascii?Q?bSWg3iIderpNUGIUpmqtoZuL+6bcMoDtIuE1zkJQJ+NDBs2CqGuZa8aq1t2z?=
 =?us-ascii?Q?sRVyZblT8readsof5mHR4DjeIC673blSh1NRbmK2fBtzYvUqiWkZ7ziUsCQD?=
 =?us-ascii?Q?dItKtC7LoDLBhiMMO5Xr2jd3qxNjee57B/BQcd6g0EZfXKz60NltVPUdXHHl?=
 =?us-ascii?Q?WflFS142aIZ8zmfXloMdjD1L489z1wirrbTBmTJrn0c9YOMM9jGsVTLuvqfX?=
 =?us-ascii?Q?69OQNWrRDcyeWX8cwR6eFHq1mNssKVWU1GQfbcAHmdiCDslo25k5CWQqF17C?=
 =?us-ascii?Q?sWkxKL15N3hSsrjkIdh/vsEj1FqngU1W86KelTmSWW4pRWB3noHsaYOOGidc?=
 =?us-ascii?Q?jqbBtNgfYLY1lD8vv6MhkXW1q/Uh+ofmyeOrJ4xS6Bm2lCCbu7/X5/qD0SzX?=
 =?us-ascii?Q?Qnd5SP/grMMw50Dv8QvNd8N1brluu/mlga6yKwbFqiJoaoBT0kQf9PyFyn72?=
 =?us-ascii?Q?7Rwa2iNrCr9tIgnHD4F3Yse07dH/ZrfPNXAcNs7XgpiFkP5ruhKyTiC6p2ha?=
 =?us-ascii?Q?ypkAEanZKpjPmLaO01sNZZOT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a7254d-2590-40b0-3f0d-08d94a9f97bb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:25:55.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amDvARHw2Av5VUStvrlR6wysDyD+7MGHwsRLTBFbrA8u8pkSPzdtiSM+hfoCqW4vBIDYdRuIBIFw9ZLah6W+xivtOlJUKwsRUcL27xGzPxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190058
X-Proofpoint-GUID: pPX36ddarSulOIJN6XwUobjq8CZSYvr8
X-Proofpoint-ORIG-GUID: pPX36ddarSulOIJN6XwUobjq8CZSYvr8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This was marked as superseded in patchwork.  What are we going to apply
instead?

regards,
dan carpenter

On Wed, Apr 14, 2021 at 11:57:59AM +0300, Dan Carpenter wrote:
> The bounds checking in avc_ca_pmt() is not strict enough.  It should
> be checking "read_pos + 4" because it's reading 5 bytes.  If the
> "es_info_length" is non-zero then it reads a 6th byte so there needs to
> be an additional check for that.
> 
> I also added checks for the "write_pos".  I don't think these are
> required because "read_pos" and "write_pos" are tied together so
> checking one ought to be enough.  But they make the code easier to
> understand for me.
> 
> The other problem is that "length" can be invalid.  It comes from
> "data_length" in fdtv_ca_pmt().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Luo Likang <luolikang@nsfocus.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This hardware isn't super common so there is no embargo.  Resending
> through normal lists.
> 
> Oh, another thing is the data_length calculation in fdtv_ca_pmt() seems
> very suspicous.  Reading more than 4 bytes in the loop will lead to
> shift wrapping.
> 
>  drivers/media/firewire/firedtv-avc.c | 14 +++++++++++---
>  drivers/media/firewire/firedtv-ci.c  |  2 ++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
> index 2bf9467b917d..71991f8638e6 100644
> --- a/drivers/media/firewire/firedtv-avc.c
> +++ b/drivers/media/firewire/firedtv-avc.c
> @@ -1165,7 +1165,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  		read_pos += program_info_length;
>  		write_pos += program_info_length;
>  	}
> -	while (read_pos < length) {
> +	while (read_pos + 4 < length) {
> +		if (write_pos + 4 >= sizeof(c->operand) - 4) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  		c->operand[write_pos++] = msg[read_pos++];
>  		c->operand[write_pos++] = msg[read_pos++];
>  		c->operand[write_pos++] = msg[read_pos++];
> @@ -1177,13 +1181,17 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  		c->operand[write_pos++] = es_info_length >> 8;
>  		c->operand[write_pos++] = es_info_length & 0xff;
>  		if (es_info_length > 0) {
> +			if (read_pos >= length) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
>  			pmt_cmd_id = msg[read_pos++];
>  			if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
>  				dev_err(fdtv->device, "invalid pmt_cmd_id %d at stream level\n",
>  					pmt_cmd_id);
>  
> -			if (es_info_length > sizeof(c->operand) - 4 -
> -					     write_pos) {
> +			if (es_info_length > sizeof(c->operand) - 4 - write_pos ||
> +			    es_info_length > length - read_pos) {
>  				ret = -EINVAL;
>  				goto out;
>  			}
> diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
> index 9363d005e2b6..2d6992ac5dd6 100644
> --- a/drivers/media/firewire/firedtv-ci.c
> +++ b/drivers/media/firewire/firedtv-ci.c
> @@ -134,6 +134,8 @@ static int fdtv_ca_pmt(struct firedtv *fdtv, void *arg)
>  	} else {
>  		data_length = msg->msg[3];
>  	}
> +	if (data_length > sizeof(msg->msg) - 4)
> +		return -EINVAL;
>  
>  	return avc_ca_pmt(fdtv, &msg->msg[data_pos], data_length);
>  }
> -- 
> 2.30.2
